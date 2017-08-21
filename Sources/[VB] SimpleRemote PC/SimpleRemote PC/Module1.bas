Attribute VB_Name = "CommandesAPI"

'''The RegOpenKeyEx function opens the specified key.
Public Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long

'''The RegCloseKey function releases a handle to the specified key.
Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal _
  hKey As Long) As Long
  

''''The RegSetValueEx function sets the data and type of a specified value under a registry key.
Public Declare Function RegSetValueEx Lib "advapi32.dll" _
 Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName _
 As String, ByVal Reserved As Long, ByVal dwType As Long, _
 lpData As Any, ByVal cbData As Long) As Long

Public Const HKEY_CURRENT_USER = &H80000001
Public Const KEY_WRITE = &H20006
Public Const REG_SZ = 1

Declare Function ShowCursor Lib "user32" ( _
                 ByVal bShow As Long) As Long
''' hide/show taskbar
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Const SWP_HIDEWINDOW = &H80
Const SWP_SHOWWINDOW = &H40
''' Open cd door
Private Declare Function mcisendstring Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
''' desktop icon hide/show
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
''' hide/show start boutton
Public Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Public Const GW_CHILD  As Integer = 5
Public Const gcHide As Integer = 0
Public Const gcShow As Integer = 9
'''shutdown/restart/logoff
Private Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Private Const EWX_SHUTDOWN As Long = 1
Private Const EWX_REBOOT As Long = 2
Private Const EWX_LOGOFF As Long = 0
'''Open explorer
Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Const KEYEVENTF_KEYUP = &H2
Const VK_LWIN = &H5B
'''Mouse boutton
Private Declare Function SwapMouseButton Lib "user32.dll" (ByVal bSwap As Long) As Long
Dim retvaL
Function TaskBarHide()
Dim rtn
rtn = FindWindow("Shell_traywnd", "")
Call SetWindowPos(rtn, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
End Function
Function TaskBarShow()
Dim rtn As Long
rtn = FindWindow("Shell_traywnd", "")
Call SetWindowPos(rtn, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
End Function
Function OpenCDROM()
Dim lngReturn As Long
Dim strReturn As Long
lngReturn = mcisendstring("set CDAudio door open", strReturn, 127, 0)
End Function

Function CloseCDROM()
Dim lngReturn As Long
Dim strReturn As Long
lngReturn = mcisendstring("set CDAudio door closed", strReturn, 127, 0)
End Function
Function DesktopIconsShow()
Dim hwnd As Long
hwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
ShowWindow hwnd, 5
End Function
Function DesktopIconsHide()
Dim hwnd As Long
hwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
ShowWindow hwnd, 0
End Function
Public Sub StartButton(Action As Integer)
    Call ShowWindow(GetWindow(FindWindow("Shell_traywnd", ""), GW_CHILD), Action)
End Sub
Function ShutDown()
Dim lngresult
lngresult = ExitWindowsEx(EWX_SHUTDOWN, 0&)
End Function
Function Restart()
Dim lngresult
lngresult = ExitWindowsEx(EWX_REBOOT, 0&)
End Function
Function LogOff()
Dim lngresult
lngresult = ExitWindowsEx(EWX_LOGOFF, 0&)
End Function
Function Password_Settings()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL password.cpl", 5)
End Function
Function Modem_Settings()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL modem.cpl", 5)
End Function
Function System_Settings()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,0", 5)
End Function
Function Keyboard_Settings()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL main.cpl @1", 5)
End Function
Function Mouse_Settings()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL main.cpl @0", 5)
End Function
Function Add_Remove()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,1", 5)
End Function
Function Add_HardWare()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl @1", 5)
End Function
Function Display_Settings()
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0", 5)
End Function
Function OpenExplore()
Call keybd_event(VK_LWIN, 0, 0, 0)
    Call keybd_event(69, 0, 0, 0)
    Call keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0)
End Function
Function FlipMouseButtons()
retvaL = SwapMouseButton(1)
End Function
Function FlipMouseButtonsBack()
retvaL = SwapMouseButton(0)
End Function
Function MinimiseAll()
Call keybd_event(VK_LWIN, 0, 0, 0)
Call keybd_event(77, 0, 0, 0)
Call keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0)
End Function
Public Sub FreezeScreen(Condition As Boolean)
    If Condition Then
        keybd_event vbKeySnapshot, 1, 0&, 0&
        frmBlankScreen.Picture = Clipboard.GetData(vbCFBitmap)
        frmBlankScreen.Show
    Else
        frmBlankScreen.Picture = Nothing
        Unload frmBlankScreen
    End If
End Sub

Function Cacher()
    
    ShowCursor False
End Function

Function Montrer()
   
    ShowCursor True
End Function


