Attribute VB_Name = "control"
'taskbar hide/show , time hide/show , stray hide/show , start disable/enable
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
'taskbar hide/show
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cX As Long, ByVal cY As Long, ByVal wFlags As Long) As Long
'desktop show/hide, time hide/show , stray hide/show , start disable/enable
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
'desktop show/hide, time hide/show , stray hide/show
Private Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long
'keyboard event
Public Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
'set computer name
Public Declare Function SetComputerName Lib "kernel32" Alias "SetComputerNameA" (ByVal lpComputerName As String) As Long
'Beep
Public Declare Function Beep Lib "kernel32" (ByVal dwFreq As Long, ByVal dwDuration As Long) As Long
'screen saver
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
'start button
Public Declare Function EnableWindow Lib "user32" (ByVal hWnd As Long, ByVal fEnable As Long) As Long
'enable/disable mouse and keyboard
Public Declare Function BlockInput Lib "user32" (ByVal fBlock As Long) As Long  'stop the action of keyboard & mouse

Public Sub TaskBarHide() 'hide taskbar
On Error Resume Next
    Dim rtn
    rtn = FindWindow("Shell_traywnd", "")
    Call SetWindowPos(rtn, 0, 0, 0, 0, 0, &H80)
End Sub

Public Sub TaskBarShow() 'show taskbar
On Error Resume Next
    Dim rtn As Long
    rtn = FindWindow("Shell_traywnd", "")
    Call SetWindowPos(rtn, 0, 0, 0, 0, 0, &H40)
End Sub

Function DesktopShow() 'hide desktop icons
On Error Resume Next
    Dim hWnd As Long
    hWnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
    ShowWindow hWnd, 5
End Function

Function DesktopHide() 'show desktop icons
On Error Resume Next
    Dim hWnd As Long
    hWnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
    ShowWindow hWnd, 0
End Function

Function HideTime() 'hide clock
On Error Resume Next
    Dim P As Long, c As Long, a As Long
    P = FindWindow("Shell_TrayWnd", vbNullString)
    c = FindWindowEx(P&, 0&, "TrayNotifyWnd", vbNullString)
    a = FindWindowEx(c&, 0&, "TrayClockWClass", vbNullString)
    Call ShowWindow(a&, 0)
End Function

Public Sub ShowTime() 'show clock
On Error Resume Next
    Dim P As Long, c As Long, a As Long
    P = FindWindow("Shell_TrayWnd", vbNullString)
    c = FindWindowEx(P, 0&, "TrayNotifyWnd", vbNullString)
    a = FindWindowEx(c, 0&, "TrayClockWClass", vbNullString)
    Call ShowWindow(a, 5)
End Sub

Public Function strayshow() 'system tray show
On Error Resume Next
    ProgramID = FindWindow("Shell_TrayWnd", "")
    ProgramID = FindWindowEx(ProgramID, 0, "TrayNotifyWnd", "")
    ReturnValue = ShowWindow(ProgramID, 5)
End Function

Function strayhide() 'hide system tray
On Error Resume Next
    ProgramID = FindWindow("Shell_TrayWnd", "")
    ProgramID = FindWindowEx(ProgramID, 0, "TrayNotifyWnd", "")
    ReturnValue = ShowWindow(ProgramID, 0)
End Function

Function MinimizeAll() 'minimize all
On Error Resume Next
    Call keybd_event(&H5B, 0, 0, 0)
    Call keybd_event(77, 0, 0, 0)
    Call keybd_event(&H5B, 0, &H2, 0)
End Function

Function runScreenSaver(mainForm As Form) 'screensaver on
On Error Resume Next
    SendMessage mainForm.hWnd, &H112&, &HF140&, 0&
End Function

Public Sub disStart() 'disable start button
On Error Resume Next
    Dim Taskbar As Long, StartButton As Long
    Taskbar& = FindWindow("Shell_TrayWnd", vbNullString)
    StartButton& = FindWindowEx(Taskbar&, 0&, "Button", vbNullString)
    EnableWindow StartButton&, 0
End Sub

Public Sub enStart() 'eneble start button
On Error Resume Next
    Dim Taskbar As Long, StartButton As Long
    Taskbar& = FindWindow("Shell_TrayWnd", vbNullString)
    StartButton& = FindWindowEx(Taskbar&, 0&, "Button", vbNullString)
    EnableWindow StartButton&, 1
End Sub



