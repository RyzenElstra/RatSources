Attribute VB_Name = "basCapture"
Private TotalBlockSize As Long, ReceivedBlockSize As Long, BlockReceived As Boolean
Private pZLib As New clsZLib
Private pDIB As New clsDIB

Sub DataArrival(Data As String)
    
    Dim Command As String, Arguments As String, Temp() As String
    
    If InStr(1, Data, ";") = 0 Then
        Command = Mid(Data, 1, 1)
        If Len(Data) > 1 Then Arguments = Mid(Data, 2)
    Else
        Temp() = Split(Data, ";", 2)
        Command = Temp(0)
        Arguments = Temp(1)
    End If
    
    Select Case Command
    Case Chr(1)
        'Next block position
        Send "rc;" & Chr(3) & Chr(4)
                
    Case Chr(2)
        'Resolution
        Temp() = Split(Arguments, ";")
        If UBound(Temp) < 1 Then Exit Sub
        
        With frmCapture
            Set .DIB = New clsDIB
            Set .ZLib = New clsZLib
            Set .BackBuffer = New clsDIB
            
            Status "Host resolution : " & Temp(0) & "x" & Temp(1)
            
            .Capture_Width = Val(Temp(0))
            .Capture_Height = Val(Temp(1))
            .BackBuffer.Create .Capture_Width, .Capture_Height
            .CheckScale
            .Show
        End With
        
        
        
        frmCaptureTools.Show , frmCapture
        BlockReceived = True
        
        Send "rc;" & Chr(3)
    Case Chr(4)
        'Capture terminated by server
        Unload frmCaptureTools
        Unload frmCapture
    Case Chr(5)
        'Block Data
        
        Temp() = Split(Arguments, ";", 8)
        
        'Prepare block space
        With frmCapture
            .Block_Left = Val(Temp(0))
            .Block_Width = Val(Temp(1))
            .Scaled_Width = Val(Temp(2))
            .Block_Top = Val(Temp(3))
            .Block_Height = Val(Temp(4))
            .Scaled_Height = Val(Temp(5))
            .ColorDepth = Val(Temp(6))
        End With
        
        'Draw the block on the form
        frmCapture.DrawBlock StrConv(BasMain.RetrieveReservedChars(Temp(7)), vbFromUnicode)
    Case "preview"
        basCapture.Preview Arguments
    End Select
    'Debug.Print Asc(Command)
End Sub

Sub Preview(Data As String)
    Dim Temp() As String
    Dim ColorDepth As Long, PreviewWidth As Long, PreviewHeight As Long, ByteArray() As Byte
    
    Temp() = Split(Data, ";", 4)
    
    PreviewWidth = Val(Temp(0))
    PreviewHeight = Val(Temp(1))
    ColorDepth = Val(Temp(2))
    ByteArray() = StrConv(BasMain.RetrieveReservedChars(Temp(3)), vbFromUnicode)
    
    Set pDIB = Nothing
    Set pZLib = Nothing
    
    Set pDIB = New clsDIB
    Set pZLib = New clsZLib
    
    pDIB.Colors = ColorDepth
    pDIB.Create PreviewWidth, PreviewHeight
        
    pZLib.DecompressByte ByteArray()
        
    pDIB.ParseByte ByteArray()
    
    pDIB.SavePicture App.Path & "\preview.bmp"
    
    Status "Preview picture saved (" & PreviewWidth & "x" & PreviewHeight & " " & ColorDepth & " colors)"
    Sleep 500
    
    frmSpyView.PrevWidth = PreviewWidth
    frmSpyView.PrevHeight = PreviewHeight
    
    frmMain.imgScreenShot.Picture = LoadPicture(App.Path & "\preview.bmp")
    
End Sub
