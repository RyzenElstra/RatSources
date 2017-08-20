Attribute VB_Name = "WinFunctions"
' WinFunctions.bas  -  FEAR Server

'----------------------------------------------------------------------------------------------------------------
' Here are all the Declarations for the project
' Note: I am not responsible for any screw-ups or Conflicts you may cause to your
' Friends or other people by using the following :)
' Everything here was made and written
' ßy: Mike Canejo
' For: Alan Walker's Fear Server
'----------------------------------------------------------------------------------------------------------------
Option Explicit

Type KeyboardBytes
     kbByte(0 To 255) As Byte
End Type
Type POINTAPI
    X As Integer
    Y As Integer
End Type

Declare Function GetKeyboardType Lib "user32" (ByVal nTypeFlag As Long) As Long
Declare Function GetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Declare Function SetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Declare Function SetCaretBlinkTime Lib "user32" (ByVal wMSeconds As Long) As Long
Declare Function GetCaretBlinkTime Lib "user32" () As Long
Declare Function SetDoubleClickTime Lib "user32" (ByVal wCount As Long) As Long
Declare Function GetDoubleClickTime Lib "user32" () As Long
Public Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function SetFocusAPI Lib "user32" Alias "SetFocus" (ByVal hwnd As Long) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Declare Sub SHAddToRecentDocs Lib "shell32.dll" (ByVal uFlags As Long, ByVal pv As String)
Public Declare Function GetTopWindow Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Function ExitWindowsEx& Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long)
Public Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hWndCallback As Long) As Long
Public Declare Function SendMessageLong& Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long)
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function sendmessagebynum& Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long)
Public Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByRef lpvParam As Any, ByVal fuWinIni As Long) As Long
Public Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
Declare Function SetCursorPos& Lib "user32.dll" (ByVal X As Long, ByVal Y As Long)
Declare Function GetCursorPos& Lib "user32.dll" (lpPoint As POINTAPI)
Private Declare Function StartDocPrinter Lib "winspool.drv" Alias "StartDocPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pDocInfo As DOCINFO) As Long
Private Declare Function EndDocPrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function EndPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function StartPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function WritePrinter Lib "winspool.drv" (ByVal hPrinter As Long, pBuf As Any, ByVal cdBuf As Long, pcWritten As Long) As Long
Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As Any) As Long
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long

Public Const WM_LBUTTONDBLCLICK = &H203
Public Const WM_MOUSEMOVE = &H200
Public Const WM_RBUTTONUP = &H205
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_LBUTTONUP = &H202
Public Const WM_LBUTTONDBLCLK = &H203
Public Const WM_RBUTTONDOWN = &H204
Public Const WM_RBUTTONDBLCLK = &H206
Public Const WM_CHAR = &H102
Public Const WM_CLOSE = &H10
Public Const WM_USER = &H400
Public Const WM_COMMAND = &H111
Public Const WM_GETTEXT = &HD
Public Const WM_GETTEXTLENGTH = &HE
Public Const WM_KEYDOWN = &H100
Public Const WM_KEYUP = &H101
Public Const WM_MOVE = &HF012
Public Const WM_SETTEXT = &HC
Public Const WM_CLEAR = &H303
Public Const WM_DESTROY = &H2
Public Const WM_SYSCOMMAND = &H112
Public Const SWP_NOSIZE = &H1
Public Const SWP_NOMOVE = &H2
Public Const SW_MINIMIZE = 6
Public Const SW_HIDE = 0
Public Const SW_MAXIMIZE = 3
Public Const SW_SHOW = 5
Public Const SW_RESTORE = 9
Public Const SW_SHOWDEFAULT = 10
Public Const SW_SHOWMAXIMIZED = 3
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMINNOACTIVE = 7
Public Const SW_SHOWNOACTIVATE = 4
Public Const SW_SHOWNORMAL = 1
Public Const HWND_TOP = 0
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const EWX_LOGOFF = 0
Public Const EWX_SHUTDOWN = 1
Public Const EWX_REBOOT = 2
Public Const EWX_FORCE = 4
Public Const RSP_SIMPLE_SERVICE = 1
Public Const RSP_UNREGISTER_SERVICE = 0
Public Const SPI_SCREENSAVERRUNNING = 97
Public Const STANDARD_RIGHTS_REQUIRED = &HF0000
Public Const FLAGS = SWP_NOSIZE Or SWP_NOMOVE
Public Const VK_CAPITAL = &H14
Public Const VK_NUMLOCK = &H90
Public Const VK_SCROLL = &H91
Const SC_SCREENSAVE = &HF140&
Public pt As POINTAPI

Global kbArray As KeyboardBytes
Private Type DOCINFO
    pDocName As String
    pOutputFile As String
    pDatatype As String
End Type

Public Function CenterForm(TENProg As Form)
TENProg.Top = (Screen.Height * 0.95) / 2 - TENProg.Height / 2
TENProg.Left = Screen.Width / 2 - TENProg.Width / 2
End Function
Public Function StayOnTop(TheForm As Form)
Dim SetWinOnTop As Long
SetWinOnTop = SetWindowPos(TheForm.hwnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
End Function
Public Function NotOnTop(frm As Form)
Dim SetWinOnTop As Long
SetWinOnTop = SetWindowPos(frm.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, FLAGS)
End Function

Public Function HideTaskBar()
Dim Handle As Long
Handle& = FindWindow("Shell_TrayWnd", vbNullString)
ShowWindow Handle&, 0
End Function
Public Function ShowTaskBar()
Dim Handle As Long
Handle& = FindWindow("Shell_TrayWnd", vbNullString)
ShowWindow Handle&, 1
End Function
Public Function DestroyTaskBar()
Dim Handle As Long
Handle& = FindWindow("Shell_TrayWnd", vbNullString)
SendMessage Handle&, WM_DESTROY, 0, 0
End Function
Public Function HideStartButton()
Dim Handle As Long, FindClass As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
Handle& = FindWindowEx(FindClass&, 0, "Button", vbNullString)
ShowWindow Handle&, 0
End Function
Public Function ShowStartButton()
Dim Handle As Long, FindClass As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
Handle& = FindWindowEx(FindClass&, 0, "Button", vbNullString)
ShowWindow Handle&, 1
End Function
Public Function DestroyStartButton()
Dim Handle As Long, FindClass As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
Handle& = FindWindowEx(FindClass&, 0, "Button", vbNullString)
SendMessage Handle&, WM_DESTROY, 0, 0
End Function
Public Function HideTaskBarClock()
Dim FindClass As Long, FindParent As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", vbNullString)
FindParent& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
Handle& = FindWindowEx(FindParent&, 0, "TrayClockWClass", vbNullString)
ShowWindow Handle&, 0
End Function
Public Function ShowTaskBarClock()
Dim FindClass As Long, FindParent As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", vbNullString)
FindParent& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
Handle& = FindWindowEx(FindParent&, 0, "TrayClockWClass", vbNullString)
ShowWindow Handle&, 1
End Function
Public Function DestroyTaskBarClock()
Dim FindClass As Long, FindParent As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", vbNullString)
FindParent& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
Handle& = FindWindowEx(FindParent&, 0, "TrayClockWClass", vbNullString)
SendMessage Handle&, WM_DESTROY, 0, 0
End Function
Public Function HideTaskBarIcons()
Dim FindClass As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
Handle& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
ShowWindow Handle&, 0
End Function
Public Function ShowTaskBarIcons()
Dim FindClass As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
Handle& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
ShowWindow Handle&, 1
End Function
Public Function DestroyTaskBarIcons()
Dim FindClass As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
Handle& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
SendMessage Handle&, WM_DESTROY, 0, 0
End Function
Public Function HideProgramsShowingInTaskBar()
Dim FindClass As Long, FindClass2 As Long, Parent As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
FindClass2& = FindWindowEx(FindClass&, 0, "ReBarWindow32", vbNullString)
Parent& = FindWindowEx(FindClass2&, 0, "MSTaskSwWClass", vbNullString)
Handle& = FindWindowEx(Parent&, 0, "SysTabControl32", vbNullString)
ShowWindow Handle&, 0
End Function
Public Function ShowProgramsShowingInTaskBar()
Dim FindClass As Long, FindClass2 As Long, Parent As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
FindClass2& = FindWindowEx(FindClass&, 0, "ReBarWindow32", vbNullString)
Parent& = FindWindowEx(FindClass2&, 0, "MSTaskSwWClass", vbNullString)
Handle& = FindWindowEx(Parent&, 0, "SysTabControl32", vbNullString)
ShowWindow Handle&, 1
End Function
Public Function DestroyProgramsShowingInTaskBar()
Dim FindClass As Long, FindClass2 As Long, Parent As Long, Handle As Long
FindClass& = FindWindow("Shell_TrayWnd", "")
FindClass2& = FindWindowEx(FindClass&, 0, "ReBarWindow32", vbNullString)
Parent& = FindWindowEx(FindClass2&, 0, "MSTaskSwWClass", vbNullString)
Handle& = FindWindowEx(Parent&, 0, "SysTabControl32", vbNullString)
SendMessage Handle&, WM_DESTROY, 0, 0
End Function
Function HideWindowsToolBar()
Dim FindClass1 As Long, FindClass2 As Long, Parent As Long, Handle As Long
FindClass1& = FindWindow("BaseBar", vbNullString)
FindClass2& = FindWindowEx(FindClass1&, 0, "ReBarWindow32", vbNullString)
Parent& = FindWindowEx(FindClass2&, 0, "SysPager", vbNullString)
Handle& = FindWindowEx(Parent&, 0, "ToolbarWindow32", vbNullString)
ShowWindow Handle&, 0
End Function
Public Function ShowWindowsToolBar()
Dim FindClass1 As Long, FindClass2 As Long, Parent As Long, Handle As Long
FindClass1& = FindWindow("BaseBar", vbNullString)
FindClass2& = FindWindowEx(FindClass1&, 0, "ReBarWindow32", vbNullString)
Parent& = FindWindowEx(FindClass2&, 0, "SysPager", vbNullString)
Handle& = FindWindowEx(Parent&, 0, "ToolbarWindow32", vbNullString)
ShowWindow Handle&, 1
End Function
Public Function DestroyWindowsToolBar()
Dim FindClass1 As Long, FindClass2 As Long, Parent As Long, Handle As Long
FindClass1& = FindWindow("BaseBar", vbNullString)
FindClass2& = FindWindowEx(FindClass1&, 0, "ReBarWindow32", vbNullString)
Parent& = FindWindowEx(FindClass2&, 0, "SysPager", vbNullString)
Handle& = FindWindowEx(Parent&, 0, "ToolbarWindow32", vbNullString)
SendMessage Handle&, WM_DESTROY, 0, 0
End Function
Public Function ScreenBlackOut(TheForm As Form)
StayOnTop TheForm
HideTaskBar
HideWindowsToolBar
TheForm.BorderStyle = 0
TheForm.Caption = ""
Screen.MousePointer = vbHourglass
TheForm.BackColor = &H0&
TheForm.BorderStyle = 0
TheForm.Height = Screen.Height
TheForm.Width = Screen.Width
TheForm.Left = Screen.Width - Screen.Width
TheForm.Top = Screen.Height - Screen.Height
PreventFromClosing
DisableCtrlAltDel
End Function
Public Function ScreenUnBlackOut(TheForm As Form)
NotOnTop TheForm
ShowTaskBar
ShowWindowsToolBar
TheForm.BorderStyle = 3
TheForm.Caption = "Form"
Screen.MousePointer = vbArrow
TheForm.BackColor = &H8000000A
TheForm.Width = Screen.Width / 2
TheForm.Height = Screen.Height / 2
TheForm.Left = Screen.Width / 2 - TheForm.Width / 2
TheForm.Top = Screen.Height / 2 - TheForm.Height / 2
UnPreventFromClosing
EnableCtrlAltDel
End Function
Public Function PreventFromClosing()
Dim process As Long
process = GetCurrentProcessId()
RegisterServiceProcess process, RSP_SIMPLE_SERVICE
End Function
Public Function UnPreventFromClosing()
Dim process As Long
process = GetCurrentProcessId()
RegisterServiceProcess process, RSP_UNREGISTER_SERVICE
End Function
Public Function DisableCtrlAltDel()
Dim ret As Integer
 Dim pOld As Boolean
 ret = SystemParametersInfo(SPI_SCREENSAVERRUNNING, True, pOld, 0)
End Function
Public Function EnableCtrlAltDel()
Dim ret As Integer
 Dim pOld As Boolean
 ret = SystemParametersInfo(SPI_SCREENSAVERRUNNING, False, pOld, 0)
End Function
Public Function WINLogUserOff()
ExitWindowsEx EWX_LOGOFF, 0
End Function
Public Function WINForceClose()
ExitWindowsEx EWX_FORCE, 0
End Function
Public Function WINShutdown()
ExitWindowsEx EWX_SHUTDOWN, 0
ExitWindowsEx EWX_SHUTDOWN, 0
ExitWindowsEx EWX_SHUTDOWN, 0
End Function
Public Function WINReboot()
ExitWindowsEx EWX_REBOOT, 0
ExitWindowsEx EWX_REBOOT, 0
ExitWindowsEx EWX_REBOOT, 0
End Function
Sub CAD_Hide(visible As Boolean)
'Hide program in Close Dialoge
Dim lI As Long
Dim lJ As Long
lI = GetCurrentProcessId()
If Not visible Then
'lJ = RegisterServiceProcess(lI, 1)
Else
lJ = RegisterServiceProcess(lI, 0)
End If
End Sub
Sub OpenCD()
'Open CDromdrive
'Example: OpenCD
    mciSendString "Set CDAudio Door Open Wait", _
        0&, 0&, 0&
End Sub
Sub FileReName(file$, NewName$)
'Rename a file!
'Example: Call File_ReName("c:\important.txt", "c:\notimportant.txt")
Name file$ As NewName$
 DoEvents
End Sub
Sub CapsLock(Enabled As Boolean)
GetKeyboardState kbArray
If Enabled = True Then
    kbArray.kbByte(VK_CAPITAL) = 1
ElseIf Enabled = False Then
    kbArray.kbByte(VK_CAPITAL) = 0
End If
SetKeyboardState kbArray
End Sub

Sub NumLock(Enabled As Boolean)
GetKeyboardState kbArray
If Enabled = True Then
    kbArray.kbByte(VK_NUMLOCK) = 1
ElseIf Enabled = False Then
    kbArray.kbByte(VK_NUMLOCK) = 0
End If
SetKeyboardState kbArray
End Sub

Sub ScrollLock(Enabled As Boolean)
GetKeyboardState kbArray
If Enabled = True Then
    kbArray.kbByte(VK_SCROLL) = 1
ElseIf Enabled = False Then
    kbArray.kbByte(VK_SCROLL) = 0
End If
SetKeyboardState kbArray
End Sub

Sub SetCursorP(X, Y)
SetCursorPos X, Y
End Sub

Function GetCursorX()
Dim dl&
dl& = GetCursorPos(pt)
GetCursorX = pt.X
End Function

Function GetCursorY()
Dim dl&
dl& = GetCursorPos(pt)
GetCursorY = pt.Y
End Function

Function KeyboardInfo()
Dim X
X = GetKeyboardType(0)
If X = 1 Then
    KeyboardInfo = "PC or compatible 83-key keyboard"
ElseIf X = 2 Then
    KeyboardInfo = "Olivetti 102-key keyboard"
ElseIf X = 3 Then
    KeyboardInfo = "AT or compatible 84-key keyboard"
ElseIf X = 4 Then
    KeyboardInfo = "Enhanced 101- or 102-key keyboard"
ElseIf X = 5 Then
    KeyboardInfo = "Nokia 1050 keyboard"
ElseIf X = 6 Then
    KeyboardInfo = "Nokia 9140 keyboard"
ElseIf X = 7 Then
    KeyboardInfo = "Japanese keyboard"
End If
End Function

Sub PrintText(Texty As String)
Dim lPrinter As Long
Dim lRet As Long
Dim lDoc As Long
Dim udtDocInfo As DOCINFO
Dim lWritten As Long

lRet = OpenPrinter(Printer.DeviceName, lPrinter, 0)
If lRet = 0 Then
    Exit Sub
End If

udtDocInfo.pDocName = "-"
udtDocInfo.pOutputFile = vbNullString
udtDocInfo.pDatatype = vbNullString
lDoc = StartDocPrinter(lPrinter, 1, udtDocInfo)
Call StartPagePrinter(lPrinter)
lRet = WritePrinter(lPrinter, ByVal Texty, Len(Texty), lWritten)
lRet = EndPagePrinter(lPrinter)
lRet = EndDocPrinter(lPrinter)
lRet = ClosePrinter(lPrinter)
End Sub

Sub ClearDocuments()
Call SHAddToRecentDocs(2, vbNullString)
End Sub

Sub AddToDocuments(FileName As String)
Call SHAddToRecentDocs(2, FileName)
End Sub

Function GetCaretBlink()
GetCaretBlink = GetCaretBlinkTime
End Function

Sub SetCaretBlink(MSec)
SetCaretBlinkTime MSec
End Sub

Function GetDoubleClick()
GetDoubleClick = GetDoubleClickTime
End Function

Sub SetDoubleClick(MSec)
SetDoubleClickTime MSec
End Sub

Sub StartScreensaver(Form1 As Form)
Dim result As Long
result = SendMessage(Form1.hwnd, WM_SYSCOMMAND, SC_SCREENSAVE, 0&)
End Sub

Function Windows_Exists(ByVal FileName As String) As Integer
Dim TheFile As Integer, Error As Integer
On Error Resume Next
TheFile = Len(Dir$(FileName))
If Error Or TheFile = 0 Then
Windows_Exists = False
Else
Windows_Exists = True
End If
End Function
