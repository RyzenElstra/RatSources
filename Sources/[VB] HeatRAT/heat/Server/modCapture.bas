Attribute VB_Name = "modCapture"
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function GetDesktopWindow Lib "user32" () As Long
Public Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Public Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Public Declare Function GetTickCount Lib "kernel32" () As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetStretchBltMode Lib "gdi32" (ByVal hdc As Long, ByVal hStretchMode As Long) As Long
Private Const STRETCHMODE = vbPaletteModeNone   'You can find other modes in the "PaletteModeConstants" section of your Object Browser

Public Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

Public Cancel As Boolean, ReadyForPartition As Boolean, Busy As Boolean
Public PartitionsX As Long, PartitionsY As Long, ColorDepth As Long, CaptureScale As Long
Public Checksum() As Long

Public Sub Preview(PreviewScale As Long, Colors As Long)
    Dim DIB As New clsDIB, ZLib As New clsZLib, ByteArray() As Byte
    Dim Desk_hWnd As Long, Desk_hDc As Long, Desk_Rect As RECT
    Dim PreviewWidth As Long, PreviewHeight As Long
    
    If Busy = True Then
        SendError "modCapture.Preview", "modCapture is busy, cannot allow preview."
        GoTo ErrorHandler
    End If
    
    'Get desktop window hook
    Desk_hWnd = GetDesktopWindow
    'Get desktop DC hook
    Desk_hDc = GetDC(Desk_hWnd)
    'Get coordinates & dimensions of desktop window
    GetWindowRect Desk_hWnd, Desk_Rect

    PreviewWidth = Int((Desk_Rect.Right / 100) * PreviewScale)
    PreviewHeight = Int((Desk_Rect.Bottom / 100) * PreviewScale)

    'Set the color depth (Max. colors per image)
    DIB.Colors = Colors
    'Create a place to store partition
    DIB.Create PreviewWidth, PreviewHeight
    
    Busy = True
    
    SetStretchBltMode DIB.hdc, STRETCHMODE
    StretchBlt DIB.hdc, 0, 0, PreviewWidth, PreviewHeight, Desk_hDc, x, y, Desk_Rect.Right, Desk_Rect.Bottom, vbSrcCopy
    
    'Turn the image into compressible & sendible format (raw data)
    DIB.ToByte ByteArray()
    'Compress the raw data
    ZLib.CompressByte ByteArray()
    
    'Send the compressed data
    Send "rc;preview;" & PreviewWidth & ";" & PreviewHeight & ";" & Colors & ";" & modMain.CorrectReservedChars(StrConv(CStr(ByteArray), vbUnicode))
    
    Busy = False
    
    Exit Sub
ErrorHandler:
    
End Sub

Public Sub Capture()
    On Error GoTo EndCapture
    
    Dim DIB As New clsDIB, ZLib As New clsZLib
    Dim Desk_hWnd As Long, Desk_hDc As Long, Desk_Rect As RECT
    Dim ByteArray() As Byte
    Dim Partition_Width As Long, Partition_Height As Long, Scaled_Width As Long, Scaled_Height As Long
    Dim CurrentChecksum As Long, CurrentPartition As Long
    Dim x As Long, y As Long
    Dim TickSent As Long
    
    Busy = True
    Cancel = False
    
    'PartitionsX = 6
    'PartitionsY = 5
    'ColorDepth = 256
    
    ReDim Checksum(0 To ((PartitionsX + 1) * (PartitionsY + 1)))
    
    'Get desktop window hook
    Desk_hWnd = GetDesktopWindow
    'Get desktop DC hook
    Desk_hDc = GetDC(Desk_hWnd)
    'Get coordinates & dimensions of desktop window
    GetWindowRect Desk_hWnd, Desk_Rect
    
    'Work out dimensions of partitions
    
    Partition_Width = Desk_Rect.Right / PartitionsX
    
    Partition_Height = Desk_Rect.Bottom / PartitionsY
    
    Scaled_Width = ToScale(Partition_Width)
    
    Scaled_Height = ToScale(Partition_Height)
    
    'Set the color depth (Max. colors per image)
    DIB.Colors = ColorDepth
    'Create a place to store partition
    
    DIB.Create Desk_Rect.Right / PartitionsX, Desk_Rect.Bottom / PartitionsY
    
    
    'Prepare for Do Loop
    Cancel = False
    ReadyForPartition = True
    
    
    Do Until Cancel = True Or frmMain.wskInfo.State <> sckConnected
        'Reset CurrentPartition (Used for Checksum)
        CurrentPartition = 0
        
        For y = 0 To Desk_Rect.Bottom Step Partition_Height
            For x = 0 To Desk_Rect.Right Step Partition_Width
                On Error GoTo NextPartition 'If there is an error that isn't connection related then we can just go to the next partition
                
                'Transfer desktop (partition image) into partition space
                If CaptureScale <> 100 Then
                    SetStretchBltMode DIB.hdc, STRETCHMODE
                    StretchBlt DIB.hdc, 0, 0, Scaled_Width, Scaled_Height, Desk_hDc, x, y, Partition_Width, Partition_Height, vbSrcCopy
                Else
                    BitBlt DIB.hdc, 0, 0, Partition_Width, Partition_Height, Desk_hDc, x, y, vbSrcCopy
                End If
                
                'ErrorHandling
                If frmMain.wskInfo.State <> sckConnected Then GoTo EndCapture
                
                'Turn the partition (image) into a byte array, ready to transfer via winsock.
                DIB.ToByte ByteArray()
                
                Debug.Print "Tile " & x / Partition_Width & "x" & y / Partition_Height
                
                'Compress byte array (making the process slower but the transfer quicker)
                ZLib.CompressByte ByteArray()
                
                'Checksum - it basicly is like a signature for a partition. It isn't really unique, it's just
                'the size of the byte array after compression. The reason we get a checksum is so that we only
                'send a partition if it has changed since the last time the partition was sent. Rather than
                'wasting time and bandwidth
                CurrentChecksum = UBound(ByteArray)
                
                If CurrentChecksum = Checksum(CurrentPartition) Then Debug.Print "Tile hasn't changed.": GoTo NextPartition
                'The checksum has changed, it must be different.
                
                'Update the checksum for this partition.
                Checksum(CurrentPartition) = CurrentChecksum
                
                Debug.Print "Tile has changed, waiting to send..."
                
                'Get the system uptime in miliseconds
                TickSent = GetTickCount
                                
                Do Until ReadyForPartition = True
                    'If it has been 10 seconds or more since TickSent we continue
                    If GetTickCount - TickSent >= 10000 And modDeclare.FileTransfer.BlockSent = True Then ReadyForPartition = True
                    DoEvents
                    If Cancel = True Or frmMain.wskInfo.State <> sckConnected Then GoTo EndCapture
                Loop
                
                Debug.Print "Sending tile (" & UBound(ByteArray) & " bytes)"
                              
                'If modDeclare.FileTransfer.BlockSent = False then it hasn't completed sending data, if its "1" then it has.
                modDeclare.FileTransfer.BlockSent = False
                
                'Send the dimensions, the color depth,
                Send "rc;" & Chr(5) & ";" & x & ";" & Partition_Width & ";" & Scaled_Width & ";" & y & ";" & Partition_Height & ";" & Scaled_Height & ";" & ColorDepth & ";" & modMain.CorrectReservedChars(StrConv(CStr(ByteArray), vbUnicode))
                'rc;<block arrival event>;left;width;top;height;colordepth;blockdata
                ReadyForPartition = False
                
NextPartition:
                DoEvents
                CurrentPartition = CurrentPartition + 1
            Next x
        Next y
    Loop
    
EndCapture:
    Cancel = True
    Send "rc;" & Chr(4) 'Capture is OVER - Tell the client
    Busy = False
    Set DIB = Nothing
    Set ZLib = Nothing
    ReDim ByteArray(0 To 0)
    ReDim Checksum(0 To 0)
    DeleteDC Desk_hDc
End Sub

Function ToScale(Value) As Long
    ToScale = Int((Value / 100) * CaptureScale)
End Function
