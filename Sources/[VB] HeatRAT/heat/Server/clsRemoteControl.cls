VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsRemoteControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False


Public Cancel As Boolean, ReadyForPartition As Boolean
Public PartitionsX As Long, PartitionsY As Long, ColorDepth As Long
Private Checksum() As Long

Public Sub Capture()
    On Error GoTo EndCapture
    
    Dim DIB As New clsDIB, ZLib As New clsZLib
    'Dim Desk_hWnd As Long, Desk_hDc As Long, Desk_Rect As RECT
    Dim ByteArray() As Byte
    Dim Partition_Width As Long, Partition_Height As Long
    Dim CurrentChecksum As Long, CurrentPartition As Long
    Dim X As Long, Y As Long
    Dim TickSent As Long
    
    ReDim Checksum(0 To ((PartitionsX + 1) * (PartitionsY + 1)))
    
    'Get desktop window hook
    Desk_hWnd = GetDesktopWindow
    'Get desktop DC hook
    Desk_hDc = GetDC(Desk_hWnd)
    'Get coordinates & dimensions of desktop window
    'GetWindowRect Desk_hWnd, Desk_Rect
    
    'Work out dimensions of partitions
    Partition_Width = Desk_Rect.Right / PartitionsX
    Partition_Height = Desk_Rect.Bottom / PartitionsY
    
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
        
        For Y = 0 To Desk_Rect.Bottom Step Partition_Height
            For X = 0 To Desk_Rect.Right Step Partition_Width
                On Error GoTo NextPartition 'If there is an error that isn't connection related then we can just go to the next partition
                
                'Transfer desktop (partition image) into partition space
                BitBlt DIB.hdc, 0, 0, Partition_Width, Partition_Height, Desk_hDc, X, Y, vbSrcCopy
                
                'ErrorHandling
                If frmMain.wskInfo.State <> sckConnected Then GoTo EndCapture
                
                'Turn the partition (image) into a byte array, ready to transfer via winsock.
                DIB.ToByte ByteArray()
                
                Debug.Print "Tile " & X / Partition_Width & "x" & Y / Partition_Height
                
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
                    If GetTickCount - TickSent >= 10000 And frmMain.wskInfo.Tag = "1" Then ReadyForPartition = True
                    DoEvents
                    If Cancel = True Or frmMain.wskInfo.State <> sckConnected Then GoTo EndCapture
                Loop
                
                Debug.Print "Sending tile (" & UBound(ByteArray) & " bytes)"
                              
                'If wskCapture's tag is "0" then it hasn't completed sending data, if its "1" then it has.
                frmMain.wskInfo.Tag = "0"
                
                'Send the dimensions, the color depth,
                frmMain.wskInfo.SendData X & ":" & Partition_Width & Chr(0) & Y & ":" & Partition_Height & Chr(0) & ColorDepth & Chr(0) & StrConv(CStr(ByteArray), vbUnicode) & "<DONE>"
                
                ReadyForPartition = False
                
NextPartition:
                DoEvents
                CurrentPartition = CurrentPartition + 1
            Next X
        Next Y
    Loop
    
EndCapture:
    Set DIB = Nothing
    Set ZLib = Nothing
    ReDim ByteArray(0 To 0)
    ReDim Checksum(0 To 0)
    DeleteDC Desk_hDc
End Sub
