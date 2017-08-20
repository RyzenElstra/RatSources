Attribute VB_Name = "ModFunction"
'All the following code is nothing to do with the Black dream Client. I just added this
'lot in because their are some interesting functions in here. In the next version of this
'program I hope to add more to the function list.

Public Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Public Type POINTAPI
    X As Long
    Y As Long
End Type

Public Type WINDOWPLACEMENT
    Length As Long
    flags As Long
    showCmd As Long
    ptMinPosition As POINTAPI
    ptMaxPosition As POINTAPI
    rcNormalPosition As RECT
End Type

Public Type IE_STATE_SAVE
    hWnd As Long
    wp As WINDOWPLACEMENT
End Type

Public Type SECURITY_ATTRIBUTES
        nLength As Long
        lpSecurityDescriptor As Long
        bInheritHandle As Long
End Type

Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer 'The key states
Public Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer 'the key states

Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szexeFile As String * 260
End Type

'Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Public Declare Function GetKeyboardState Lib "user32" (pbKeyState As Byte) As Long
Public Declare Function SetKeyboardState Lib "user32" (lppbKeyState As Byte) As Long

Declare Function TerminateProcess Lib "kernel32" (ByVal ApphProcess As Long, ByVal uExitCode As Long) As Long
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal blnheritHandle As Long, ByVal dwAppProcessId As Long) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Declare Function CreateToolhelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, lProcessID As Long) As Long

Public Const SPI_SETMOUSETRAILS = 93
Public Const SPIF_UPDATEINIFILE = &H1
Public Const SPIF_SENDWININICHANGE = &H2

Public Declare Function SystemParametersInfoA Lib "user32" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long

Public Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long

Public Declare Function InternetAutodial Lib "wininet.dll" (ByVal dwFlags As Long, ByVal dwReserved As Long) As Long
Public Declare Function InternetAutodialHangup Lib "wininet.dll" (ByVal dwReserved As Long) As Long

Public Const INTERNET_AUTODIAL_FORCE_ONLINE = 1
Public Const INTERNET_AUTODIAL_FORCE_UNATTENDED = 2

Public Const SC_MONITORPOWER = &HF170
Public Const WM_SYSCOMMAND = &H112&

'used for debugging
Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Public Declare Function GetClassNameA Lib "user32" (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Public Declare Function SetWindowPlacement Lib "user32" (ByVal hWnd As Long, lpwndpl As WINDOWPLACEMENT) As Long
Public Declare Function GetWindowPlacement Lib "user32" (ByVal hWnd As Long, lpwndpl As WINDOWPLACEMENT) As Long
Public Declare Function RegisterHotKey Lib "user32" (ByVal hWnd As Long, ByVal id As Long, ByVal fsModifiers As Long, ByVal vk As Long) As Long
Public Declare Function UnregisterHotKey Lib "user32" (ByVal hWnd As Long, ByVal id As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Sub CopyMemoryH Lib "kernel32" Alias "RtlMoveMemory" (ByRef Destination As Any, ByVal Source As Any, ByVal Length As Long)

Public Declare Function RemoveDirectory Lib "kernel32" Alias "RemoveDirectoryA" (ByVal lpPathName As String) As Long
Public Declare Function EmptyClipboard Lib "user32" () As Long

Public Declare Function CreateDirectory Lib "kernel32" Alias "CreateDirectoryA" (ByVal lpPathName As String, lpSecurityAttributes As SECURITY_ATTRIBUTES) As Long

Global Const GWL_WNDPROC = (-4)     'used as paramater of SetWindowLong, sets the window procedure
Global Const SW_HIDE = 0            'constant passed to showCmd member of WINDOWPLACEMENT structure to hide the window
Global Const WM_HOTKEY = &H312      'message sent when hotkey registered with RegisterHotKey is pressed
Public Const MOD_SHIFT = &H4        'check the WM_HOTKEY message to see if the shift key was held down
Global Const MOD_WIN = &H8          'check the WM_HOTKEY message to see if the windows key was held down
Global Const VK_Z = &H5A            'virtual key code for Z

Global Const MIN_HOTKEY = &H5F      'user defined, this is my unique (to this process) id for the minimize hotkey
Global Const RST_HOTKEY = &H6F      'user defined, this is my unique (to this process) id for the restore hotkey

Public lngOldWindowProc As Long     'this stores the address of the original window procedure
Public arrayIESS() As IE_STATE_SAVE 'array used to store the windows and their positions

Declare Function SHChangeIconDialog Lib "Shell32.DLL" Alias "#62" (ByVal hWndOwner As Long, ByVal szInitFilename As String, ByVal dwReserved As Long, lpIconIndex As Long) As Long
Declare Function SHFormatDrive Lib "Shell32.DLL" (ByVal hWndOwner As Long, ByVal iDrive As Long, ByVal iCapacity As Long, ByVal iFormatType As Long) As Long
Declare Function SHIsPathExecutable Lib "Shell32.DLL" Alias "#43" (ByVal szPath As String) As Long
Declare Function SHRestartSystemMessageBox Lib "Shell32.DLL" Alias "#59" (ByVal hWndOwner As Long, ByVal szExtraPrompt As String, ByVal uFlags As Long) As Long
Declare Function SHRunDialog Lib "Shell32.DLL" Alias "#61" (ByVal hWndOwner As Long, ByVal dwReserved1 As Long, ByVal dwReserved2 As Long, ByVal szTitle As String, ByVal szPrompt As String, ByVal uFlags As Long) As Long

' A few more:
Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
' Update in this one: The alias was incorrect. (The d in Associated was missing... Bad API viewer file!)
Declare Function ExtractAssociatedIcon Lib "Shell32.DLL" Alias "ExtractAssociatedIconA" (ByVal hInst As Long, ByVal lpIconPath As String, lpiIcon As Long) As Long
Declare Function DrawIconEx Lib "User32.DLL" (ByVal hDC As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Declare Function OleTranslateColor Lib "OlePro32.DLL" (ByVal oleColor As OLE_COLOR, ByVal hPalette As Long, pColorRef As Long) As Long
Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long

' OLE constant:
Public Const CLR_INVALID = &HFFFFFFFF

' Constants for SHRunDialog:
Public Const SHRD_NOBROWSE = 1 ' If specified, the "Browse" button won't appear
Public Const SHRD_NOSTRING = 2 ' If specified, there won't be an initial string in the dialog

' Constants for SHFormatDrive:
Public Const SHFDCapacityDefault = 0 ' 1.2MB or 1.44MB, depending on drive
Public Const SHFDCapacity360KB = 3 ' 360KB instead of 1.2MB
Public Const SHFDCapacity720KB = 5 ' 720KB instead of 1.44MB

' More constants for SHFormatDrive (these are self-explanatory):
Public Const SHFDTypeQuickFormat = 0
Public Const SHFDTypeFullFormat = 1
Public Const SHFDTypeCopySystemFilesOnly = 2

' Constants for ExitWindowsEx... I found them another use here!
Public Const EWX_LOGOFF = 0 ' Simply log off.
Public Const EWX_SHUTDOWN = 1 ' Shut down.
Public Const EWX_REBOOT = 2 ' Restart.
Public Const EWX_FORCE = 4 ' Do whatever of the others, but FORCE it!
Public Const EWX_POWEROFF = 8 ' (Cute hardware and Win98+) Turn the computer off.

' Update! Constants for DrawIconEx (the reason it didn't work):
Public Const DI_MASK = 1            ' Draw icon using mask
Public Const DI_IMAGE = 2           ' Draw icon using image
Public Const DI_NORMAL = DI_MASK Or DI_IMAGE ' Draw icon using "masked image"

'Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
'Public Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer

'CD ROM code
Public Declare Function mciGetErrorString Lib "winmm.dll" Alias "mciGetErrorStringA" (ByVal dwError As Long, ByVal lpstrBuffer As String, ByVal uLength As Long) As Long
Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long

'Packing code
Public OffSetTypes(0 To 999999) As Long
Public SizeTypes(0 To 999999) As Long
Public WavName As String
Public Buffload As String
Public FileAmmount As Long
Public WavCache(0 To 999999) As String
Public FileListStart As Long
Public FileList As String
Public Const MainHeader As String = "CYT1.0" 'File packing header
Public Header As String
Public Offset As Long
Public Size As Long
Public Name As String
Public DoCount As Long

'File packing stuff is only for sound precacher

'Key logging code
Public Const SHIFT_KEY As Integer = 16
Public sKeyPressed As String
Public KeyLoop As Integer
Public KeyResult As Long
Public bShift As Boolean

Declare Function ShellExecute Lib "Shell32.DLL" Alias _
    "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation _
    As String, ByVal lpFile As String, ByVal lpParameters _
    As String, ByVal lpDirectory As String, ByVal nShowCmd _
    As Long) As Long
   
'Public Const SW_SHOW = 5

Global lngIcon
Global strProgram
Global strProgramA
Global strSaveIconFile

Declare Function ExtractIcon Lib "Shell32.DLL" Alias "ExtractIconA" (ByVal hInst As Long, ByVal lpszExeFileName As String, ByVal nIconIndex As Long) As Long
Declare Function DrawIcon Lib "user32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal hIcon As Long) As Long
Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long

Public Declare Function GetWindow Lib "user32" (ByVal hWnd As Long, ByVal wCmd As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function SetFocusAPI Lib "user32" Alias "SetFocus" (ByVal hWnd As Long) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Declare Function GetTopWindow Lib "user32" (ByVal hWnd As Long) As Long
Public Declare Function ExitWindowsEx& Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long)
Public Declare Function GetCurrentProcess Lib "kernel32" () As Long
Public Declare Function SendMessageLong& Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long)
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function SendMessageByNum& Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long)
Public Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByRef lpvParam As Any, ByVal fuWinIni As Long) As Long
Public Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long

'Public Declare Function SetWindowPos& Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
'Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
'Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
'Public Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
'Public Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long

'SetWindowPos FrmMain.hwnd, -1, 0, 0, 0, 0, 3    'if -1 then sets window always ontop, if -2 then set windows to normal
'RegisterServiceProcess GetCurrentProcessId, 1 'if 1 then removes from ctrl-alt-del menu, if False then it shows in...
'SystemParametersInfo 97, True, False, 0       'if True then disable ctrl-alt-del menu, if False then Enable...
'ExitWindowsEx 1, 0                            'Shuts down your computer (1 = Shutdown, 2 = Reboot

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
'Public Const WM_SYSCOMMAND = &H112
Public Const SWP_NOSIZE = &H1
Public Const SWP_NOMOVE = &H2
Public Const SW_MINIMIZE = 6
'Public Const SW_HIDE = 0
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
'Public Const EWX_LOGOFF = 0
'Public Const EWX_SHUTDOWN = 1
'Public Const EWX_REBOOT = 2
'Public Const EWX_FORCE = 4
Public Const RSP_SIMPLE_SERVICE = 1
Public Const RSP_UNREGISTER_SERVICE = 0
Public Const SPI_SCREENSAVERRUNNING = 97
'Public Const STANDARD_RIGHTS_REQUIRED = &HF0000
Public Const flags = SWP_NOSIZE Or SWP_NOMOVE

Global Info

Global G
Global allcharacters
Global molestate()
Type FILETIME
    lLowDateTime    As Long
    lHighDateTime   As Long
End Type
 
Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Declare Function RegQueryValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByRef lpData As Long, lpcbData As Long) As Long
Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByRef lpData As Long, ByVal cbData As Long) As Long
Declare Function RegSetValueExB Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByRef lpData As Byte, ByVal cbData As Long) As Long

Const ERROR_SUCCESS = 0&
Const ERROR_BADDB = 1009&
Const ERROR_BADKEY = 1010&
Const ERROR_CANTOPEN = 1011&
Const ERROR_CANTREAD = 1012&
Const ERROR_CANTWRITE = 1013&
Const ERROR_OUTOFMEMORY = 14&
Const ERROR_INVALID_PARAMETER = 87&
Const ERROR_ACCESS_DENIED = 5&
Const ERROR_NO_MORE_ITEMS = 259&
Const ERROR_MORE_DATA = 234&

Const REG_NONE = 0&
Const REG_SZ = 1&
Const REG_EXPAND_SZ = 2&
Const REG_BINARY = 3&
Const REG_DWORD = 4&
Const REG_DWORD_LITTLE_ENDIAN = 4&
Const REG_DWORD_BIG_ENDIAN = 5&
Const REG_LINK = 6&
Const REG_MULTI_SZ = 7&
Const REG_RESOURCE_LIST = 8&
Const REG_FULL_RESOURCE_DESCRIPTOR = 9&
Const REG_RESOURCE_REQUIREMENTS_LIST = 10&

Const KEY_QUERY_VALUE = &H1&
Const KEY_SET_VALUE = &H2&
Const KEY_CREATE_SUB_KEY = &H4&
Const KEY_ENUMERATE_SUB_KEYS = &H8&
Const KEY_NOTIFY = &H10&
Const KEY_CREATE_LINK = &H20&
Const READ_CONTROL = &H20000
Const WRITE_DAC = &H40000
Const WRITE_OWNER = &H80000
Const SYNCHRONIZE = &H100000
Const STANDARD_RIGHTS_REQUIRED = &HF0000
Const STANDARD_RIGHTS_READ = READ_CONTROL
Const STANDARD_RIGHTS_WRITE = READ_CONTROL
Const STANDARD_RIGHTS_EXECUTE = READ_CONTROL
Const KEY_READ = STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY
Const KEY_WRITE = STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY
Const KEY_EXECUTE = KEY_READ

Dim hKey As Long, MainKeyHandle As Long
Dim rtn As Long, lBuffer As Long, sBuffer As String
Dim lBufferSize As Long
Dim lDataSize As Long
Dim ByteArray() As Byte

Const DisplayErrorMsg = False

'Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpszOp As String, ByVal lpszFile As String, ByVal lpszParams As String, ByVal lpszDir As String, ByVal FsShowCmd As Long) As Long
Public Declare Function GetDesktopWindow Lib "user32" () As Long
'Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegSetValue Lib "advapi32.dll" Alias "RegSetValueA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
'Const SW_SHOWNORMAL = 1
Const SE_ERR_FNF = 2&
Const SE_ERR_PNF = 3&
Const SE_ERR_ACCESSDENIED = 5&
Const SE_ERR_OOM = 8&
Const SE_ERR_DLLNOTFOUND = 32&
Const SE_ERR_SHARE = 26&
Const SE_ERR_ASSOCINCOMPLETE = 27&
Const SE_ERR_DDETIMEOUT = 28&
Const SE_ERR_DDEFAIL = 29&
Const SE_ERR_DDEBUSY = 30&
Const SE_ERR_NOASSOC = 31&
Const ERROR_BAD_FORMAT = 11&

Public Declare Function sndPlaySound Lib "winmm" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Declare Function sndStopSound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszNull As Long, ByVal flags As Integer) As Integer

'Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
'Public Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
'Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long

Dim sString As String
Dim lLength As Long

Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Public Type OSVERSIONINFO
  dwOSVersionInfoSize As Long
  dwMajorVersion As Long
  dwMinorVersion As Long
  dwBuildNumber As Long
  dwPlatformId As Long
  szCSDVersion As String * 128
End Type

Public Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long

Public Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
'Public Declare Function GetKeyboardState Lib "user32" (pbKeyState As Byte) As Long
'Public Declare Function SetKeyboardState Lib "user32" (lppbKeyState As Byte) As Long

Public Const VK_NUMLOCK = &H90
Public Const VK_SCROLL = &H91
Public Const VK_CAPITAL = &H14
Public Const KEYEVENTF_EXTENDEDKEY = &H1
Public Const KEYEVENTF_KEYUP = &H2
Public Const VER_PLATFORM_WIN32_NT = 2
Public Const VER_PLATFORM_WIN32_WINDOWS = 1

Public Type SYSTEM_INFO
    dwOemID As Long
    dwPageSize As Long
    lpMinimumApplicationAddress As Long
    lpMaximumApplicationAddress As Long
    dwActiveProcessorMask As Long
    dwNumberOfProcessors As Long
    dwProcessorType As Long
    dwAllocationGranularity As Long
    wProcessorLevel As Integer
    wProcessorRevision As Integer
End Type
'Type POINTAPI
'    X As Integer
'    Y As Integer
'End Type
Type KeyboardBytes
     kbByte(0 To 255) As Byte
End Type
Type SHELLEXECUTEINFO
    cbSize As Long
    fMask As Long
    hWnd As Long
    lpVerb As String
    lpFile As String
    lpParameters As String
    lpDirectory As String
    nShow As Long
    hInstApp As Long
    lpIDList As Long
    lpClass As String
    hkeyClass As Long
    dwHotKey As Long
    hIcon As Long
    hProcess As Long
End Type
Declare Function ReleaseCapture Lib "user32" () As Long
Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Declare Function StretchBlt Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Declare Function GetLogicalDrives& Lib "kernel32" ()
Declare Function GetDriveType& Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String)
Declare Function GetDiskFreeSpace& Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectorsPerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long)
Declare Function auxGetNumDevs% Lib "winmm" ()
'Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Declare Function GetTickCount& Lib "kernel32" ()
'Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
'Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
'Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
'Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Long
'Declare Function GetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
'Declare Function SetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Declare Function tapiRequestMakeCall Lib "TAPI32.DLL" (ByVal dest As String, ByVal AppName As String, ByVal CalledParty As String, ByVal Comment As String) As Long
Declare Function ShellExecuteEX Lib "Shell32.DLL" Alias "ShellExecuteEx" (SEI As SHELLEXECUTEINFO) As Long
Declare Function SetCursorPos& Lib "User32.DLL" (ByVal X As Long, ByVal Y As Long)
Declare Function GetCursorPos& Lib "User32.DLL" (lpPoint As POINTAPI)
Declare Sub SHAddToRecentDocs Lib "Shell32.DLL" (ByVal uFlags As Long, ByVal pv As String)
Declare Sub GetSystemInfo Lib "kernel32" (lpSystemInfo As SYSTEM_INFO)
Declare Function SetCaretBlinkTime Lib "user32" (ByVal wMSeconds As Long) As Long
Declare Function GetCaretBlinkTime Lib "user32" () As Long
Declare Function SetDoubleClickTime Lib "user32" (ByVal wCount As Long) As Long
Declare Function GetDoubleClickTime Lib "user32" () As Long
Declare Function GetKeyboardType Lib "user32" (ByVal nTypeFlag As Long) As Long
'Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Declare Function StartDocPrinter Lib "winspool.drv" Alias "StartDocPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pDocInfo As DOCINFO) As Long
Private Declare Function EndDocPrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function EndPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function StartPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function WritePrinter Lib "winspool.drv" (ByVal hPrinter As Long, pBuf As Any, ByVal cdBuf As Long, pcWritten As Long) As Long
Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As Any) As Long
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Global vararyDriveInfo(26, 11)
Global System As SYSTEM_INFO
Global Const SRCCOPY = &HCC0020
Global Const SRCAND = &H8800C6
Global Const MERGEPAINT = &HBB0226
'Public Const HWND_TOP = 0
'Public Const HWND_TOPMOST = -1
'Public Const HWND_NOTOPMOST = -2
'Public Const SWP_NOMOVE = &H2
'Public Const SWP_NOSIZE = &H1
'Public Const FLAGS = SWP_NOMOVE Or SWP_NOSIZE
'Public Const EWX_LOGOFF = 0
'Public Const EWX_SHUTDOWN = 1
'Public Const EWX_REBOOT = 2
'Public Const EWX_FORCE = 4
'Public Const VK_CAPITAL = &H14
'Public Const VK_NUMLOCK = &H90
'Public Const VK_SCROLL = &H91
Public Const SPI_GETACCESSTIMEOUT& = 60
Public Const SPI_GETANIMATION& = 72
Public Const SPI_GETBEEP& = 1
Public Const SPI_GETBORDER& = 5
Public Const SPI_GETDEFAULTINPUTLANG& = 89
Public Const SPI_GETDRAGFULLWINDOWS& = 38
Public Const SPI_GETFASTTASKSWITCH& = 35
Public Const SPI_GETFILTERKEYS& = 50
Public Const SPI_GETFONTSMOOTHING& = 74
Public Const SPI_GETGRIDGRANULARITY& = 18
Public Const SPI_GETHIGHCONTRAST& = 66
Public Const SPI_GETICONMETRICS& = 45
Public Const SPI_GETICONTITLELOGFONT& = 31
Public Const SPI_GETICONTITLEWRAP& = 25
Public Const SPI_GETKEYBOARDDELAY& = 22
Public Const SPI_GETKEYBOARDPREF& = 68
Public Const SPI_GETKEYBOARDSPEED& = 10
Public Const SPI_GETLOWPOWERACTIVE& = 83
Public Const SPI_GETLOWPOWERTIMEOUT& = 79
Public Const SPI_GETMENUDROPALIGNMENT& = 27
Public Const SPI_GETMOUSE& = 3
Public Const SPI_GETMINIMIZEDMETRICS& = 43
Public Const SPI_GETMOUSEKEYS& = 54
Public Const SPI_GETMOUSETRAILS& = 94
Public Const SPI_GETNONCLIENTMETRICS& = 41
Public Const SPI_GETPOWEROFFACTIVE& = 84
Public Const SPI_GETPOWEROFFTIMEOUT& = 80
Public Const SPI_GETSCREENREADER& = 70
Public Const SPI_GETSCREENSAVEACTIVE& = 16
Public Const SPI_GETSCREENSAVETIMEOUT& = 14
Public Const SPI_GETSERIALKEYS& = 62
Public Const SPI_GETSHOWSOUNDS& = 56
Public Const SPI_GETSOUNDSENTRY& = 64
Public Const SPI_GETSTICKYKEYS& = 58
Public Const SPI_GETTOGGLEKEYS& = 52
Public Const SPI_GETWINDOWSEXTENSION& = 92
Public Const SPI_GETWORKAREA& = 48
Public Const SPI_ICONHORIZONTALSPACING& = 13
Public Const SPI_ICONVERTICALSPACING& = 24
Public Const SPI_LANGDRIVER& = 12
'Public Const SPI_SCREENSAVERRUNNING& = 97
Public Const SPI_SETACCESSTIMEOUT& = 61
Public Const SPI_SETANIMATION& = 73
Public Const SPI_SETBEEP& = 2
Public Const SPI_SETBORDER& = 6
Public Const SPI_SETCURSORS& = 87
Public Const SPI_SETDEFAULTINPUTLANG& = 90
Public Const SPI_SETDESKPATTERN& = 21
Public Const SPI_SETDESKWALLPAPER& = 20
Public Const SPI_SETDOUBLECLICKTIME& = 32
Public Const SPI_SETDOUBLECLKHEIGHT& = 30
Public Const SPI_SETDOUBLECLKWIDTH& = 29
Public Const SPI_SETDRAGFULLWINDOWS& = 37
Public Const SPI_SETDRAGHEIGHT& = 77
Public Const SPI_SETDRAGWIDTH& = 76
Public Const SPI_SETFASTTASKSWITCH& = 36
Public Const SPI_SETFILTERKEYS& = 51
Public Const SPI_SETFONTSMOOTHING& = 75
Public Const SPI_SETGRIDGRANULARITY& = 19
Public Const SPI_SETHANDHELD& = 78
Public Const SPI_SETHIGHCONTRAST& = 67
Public Const SPI_SETICONMETRICS& = 46
Public Const SPI_SETICONS& = 88
Public Const SPI_SETICONTITLELOGFONT& = 34
Public Const SPI_SETICONTITLEWRAP& = 26
Public Const SPI_SETKEYBOARDDELAY& = 23
Public Const SPI_SETKEYBOARDPREF& = 69
Public Const SPI_SETKEYBOARDSPEED& = 11
Public Const SPI_SETLANGTOGGLE& = 91
Public Const SPI_SETLOWPOWERACTIVE& = 85
Public Const SPI_SETLOWPOWERTIMEOUT& = 81
Public Const SPI_SETMENUDROPALIGNMENT& = 28
Public Const SPI_SETMINIMIZEDMETRICS& = 44
Public Const SPI_SETMOUSE& = 4
Public Const SPI_SETMOUSEBUTTONSWAP& = 33
Public Const SPI_SETMOUSEKEYS& = 55
'Public Const SPI_SETMOUSETRAILS& = 93
Public Const SPI_SETNONCLIENTMETRICS& = 42
Public Const SPI_SETPENWINDOWS& = 49
Public Const SPI_SETPOWEROFFACTIVE& = 86
Public Const SPI_SETPOWEROFFTIMEOUT& = 82
Public Const SPI_SETSCREENREADER& = 71
Public Const SPI_SETSCREENSAVEACTIVE& = 17
Public Const SPI_SETSCREENSAVETIMEOUT& = 15
Public Const SPI_SETSERIALKEYS& = 63
Public Const SPI_SETSHOWSOUNDS& = 57
Public Const SPI_SETSOUNDSENTRY& = 65
Public Const SPI_SETSTICKYKEYS& = 59
Public Const SPI_SETTOGGLEKEYS& = 53
Public Const SPI_SETWORKAREA& = 47
'Public Const SPIF_UPDATEINIFILE = 1
'Public Const SPIF_SENDWININICHANGE = 2
Public Const SEE_MASK_INVOKEIDLIST = &HC
Public Const SEE_MASK_NOCLOSEPROCESS = &H40
Public Const SEE_MASK_FLAG_NO_UI = &H400

'Const WM_SYSCOMMAND = &H112&
Const SC_SCREENSAVE = &HF140&
Const SWP_HIDEWINDOW = &H80
Const SWP_SHOWWINDOW = &H40
Global Const HTCAPTION = 2
Global Const WM_NCLBUTTONDOWN = &HA1
Global kbArray As KeyboardBytes
Public pt As POINTAPI

Private Type DOCINFO
    pDocName As String
    pOutputFile As String
    pDatatype As String
End Type

'Public Function GetCapsLock() As Boolean
'    GetCapsLock = CBool(GetKeyState(vbKeyCapital) And 1) 'Return or set the Capslock toggle.
'End Function

Public Function GetCtrl() As Boolean
    GetCtrl = CBool(GetAsyncKeyState(vbKeyControl))
End Function

Public Function GetShift() As Boolean
    GetShift = CBool(GetAsyncKeyState(vbKeyShift)) 'Return or set the Capslock toggle.
End Function

Function Ctrl(Control, Char1, Char2)
'This function is similar to below but it
'checks if control key is pressed
    If GetCtrl = True Then
        Control = 1
        Ctrl = Char1
    Else
        Control = 0
        Ctrl = Char2
    End If
End Function
Function Shf(Shift, Char1, Char2)
'This function is exactly like the IIf function
'except without the Shift statement being present
'this relies on when you press the shift key and
'another key pressed at the same time
    If GetShift = True Then
        Shift = 1 'If shift is present
        Shf = Char1 'then the first character is displayed
    Else
        Shift = 0 'if shift isn't present
        Shf = Char2 'then the second character is displayed
    End If
End Function

Public Function GetSystemParameters(Info, Newsetting)
    Dim es
    es = SystemParametersInfo(Info, Newsetting, GetSystemParameters, 0)
End Function

Public Function KeyboardInfo()
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

Public Function GetCaretBlink()
    GetCaretBlink = GetCaretBlinkTime
End Function

Public Function SetCaretBlink(MSec)
    SetCaretBlinkTime MSec
End Function

Public Function GetDoubleClick()
    GetDoubleClick = GetDoubleClickTime
End Function

Public Function SetDoubleClick(MSec)
    SetDoubleClickTime MSec
End Function

Public Function GetSysInfo()
    GetSystemInfo System
End Function

Public Function ShowProperties(FileName As String, OwnerhWnd As Long)
    Dim SEI As SHELLEXECUTEINFO
    Dim r As Long
    With SEI
        .cbSize = Len(SEI)
        .fMask = SEE_MASK_NOCLOSEPROCESS Or SEE_MASK_INVOKEIDLIST Or SEE_MASK_FLAG_NO_UI
        .hWnd = OwnerhWnd
        .lpVerb = "properties"
        .lpFile = FileName
        .lpParameters = vbNullChar
        .lpDirectory = vbNullChar
        .nShow = 0
        .hInstApp = 0
        .lpIDList = 0
    End With
    r = ShellExecuteEX(SEI)
End Function

Public Function ClearDocuments()
    Call SHAddToRecentDocs(2, vbNullString)
End Function

Public Function AddToDocuments(FileName As String)
    Call SHAddToRecentDocs(2, FileName)
End Function

Public Function PhoneCall(Number As String, Name As String)
    Dim lRetVal As Long
    lRetVal = tapiRequestMakeCall(Trim$(Number), App.Title, Trim$(Name), "")
    If lRetVal <> 0 Then
    End If
End Function

'Public Function IsCapsLockOn()
'    GetKeyboardState kbArray
'    IsCapsLockOn = kbArray.kbByte(VK_CAPITAL)
'End Function

'Public Function IsNumLockOn()
'    GetKeyboardState kbArray
'    IsNumLockOn = kbArray.kbByte(VK_NUMLOCK)
'End Function

Public Function StayOnTop(TheForm As Form)
    SetWinOnTop = SetWindowPos(TheForm.hWnd, HWND_TOPMOST, 0, 0, 0, 0, flags)
End Function

'Public Function StartScreensaver(FormN As Form)
'    Dim result As Long
'    result = SendMessage(FormN.hwnd, WM_SYSCOMMAND, SC_SCREENSAVE, 0&)
'End Function

Public Function MilliToHMS(Milliseconds)
    Dim Sec, Min0, Min, Hr
    Hr = Fix(Milliseconds / 3600000)
    Min0 = Fix(Milliseconds Mod 3600000)
    Min = Fix(Min0 / 60000)
    Sec = Fix(Min0 Mod 60000)
    Sec = Fix(Sec / 1000)
    If Len(Sec) = 1 Then
        Sec = "0" & Sec
    End If
    If Len(Min) = 1 Then
        Min = "0" & Min
    End If
    If Len(Hr) = 1 Then
        Hr = "0" & Hr
    End If
    MilliToHMS = Hr & ":" & Min & ":" & Sec
End Function

Public Function GetTimeOnWindows()
    GetTimeOnWindows = MilliToHMS(GetTickCount&)
End Function

Public Function Cursor(Enabled As Boolean)
    Dim Retcode
    For i = 1 To 50000
        Retcode = ShowCursor(Enabled)
    Next i
End Function

Public Function IsThereASoundCard()
    Dim i As Integer
    i = auxGetNumDevs()
    If i > 0 Then
        IsThereASoundCard = 1
    Else
        IsThereASoundCard = 0
    End If
End Function

Public Function DriveBytesFree(DriveLetter As Integer)
    XDriveInfo
    DriveBytesFree = (vararyDriveInfo(DriveLetter, 9))
End Function

Public Function DriveTotalBytes(DriveLetter As Integer)
    XDriveInfo
    DriveTotalBytes = (vararyDriveInfo(DriveLetter, 8))
End Function

Public Function DrivePercentFree(DriveLetter As Integer)
    XDriveInfo
    On Error Resume Next
    DrivePercentFree = (DriveBytesFree(DriveLetter) / DriveTotalBytes(DriveLetter)) * 100
End Function

Public Function DriveOtherInfo(DriveLetter As Integer, InfoCode)
    XDriveInfo
    DriveOtherInfo = (vararyDriveInfo(DriveLetter, InfoCode))
End Function

Public Function XDriveInfo()
    '1  = Is there a drive for this letter
    '2  = Drive Letter
    '3  = Drive Type  2: Floppy, 3: Disk Fixed 4: Disk Remote
    '4  = Sectors
    '5  = Bytes / Sector
    '6  = Number of free sectors
    '7  = Total Clusters
    '8  = Total Bytes
    '9  = Free Bytes
    '10 = Percent of Free Bytes
    '11 = Vol Name
    Dim ournum As Long, rv As Long, DriveType As Long, c  As Long, d As Long
    Dim E As Long, F As Long, H As Long, Counter As Integer, CompareTo
    Dim tmpDrvLet As String
    Dim SectorsPerCluster&, BytesPerSector&, NumberOfFreeClustors&, TotalNumberOfClustors&
    Dim BytesFreeas, bytesTotal, FreeBytes, TotalBytes As Variant
    Dim dl&, lpVolumeSerialNumber&, lpMaximumComponentLength&, lpFileSystemFlags&
    Dim lpVolumeNameBuffer As String, rcDim As String, B As String
    Dim G As String, s$, sz&
    rv = GetLogicalDrives&()
    If rv = 0 Then
        Stop
        Exit Function
    End If
    B = String$(255, 0)
    c = 200
    G = String$(255, 0)
    H = 100
    For Counter = 1 To 26
        CompareTo = (2 ^ (Counter - 1))
        If (rv And CompareTo) <> 0 Then
            vararyDriveInfo(Counter, 1) = True
            tmpDrvLet = Chr(Counter + 64)
            vararyDriveInfo(Counter, 2) = tmpDrvLet
            tmpDrvLet = tmpDrvLet & ":\"
            DriveType = GetDriveType&(tmpDrvLet)
            vararyDriveInfo(Counter, 3) = DriveType
            If DriveType = 3 Or DriveType = 4 Then
                rc = GetVolumeInformation(A, B, c, d, E, F, G, H)
                vararyDriveInfo(Counter, 11) = B
                dl& = GetDiskFreeSpace(tmpDrvLet, SectorsPerCluster, BytesPerSector, NumberOfFreeClustors, TotalNumberOfClustors)
                vararyDriveInfo(Counter, 4) = Format(SectorsPerCluster, "#,0")
                vararyDriveInfo(Counter, 5) = Format(BytesPerSector, "#,0")
                vararyDriveInfo(Counter, 6) = Format(NumberOfFreeClustors, "#,0")
                vararyDriveInfo(Counter, 7) = Format(TotalNumberOfClustors, "#,0")
                TotalBytes = (TotalNumberOfClustors / 100) * (SectorsPerCluster / 100) * (BytesPerSector / 100)
                vararyDriveInfo(Counter, 8) = Format(TotalBytes, "#,0")
                FreeBytes = (NumberOfFreeClustors / 100) * (SectorsPerCluster / 100) * (BytesPerSector / 100)
                vararyDriveInfo(Counter, 9) = Format(FreeBytes, "#,0")
                vararyDriveInfo(Counter, 10) = Format(FreeBytes / TotalBytes, "Percent")
            End If
        Else      ' *** no drive? then set to false
            vararyDriveInfo(Counter, 1) = False
        End If
    Next Counter
End Function

Public Function PrintText(Texty As String)
    Dim lPrinter As Long
    Dim lRet As Long
    Dim lDoc As Long
    Dim udtDocInfo As DOCINFO
    Dim lWritten As Long
    
    lRet = OpenPrinter(Printer.DeviceName, lPrinter, 0)
    If lRet = 0 Then
        Exit Function
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
End Function

Public Function SetCursorP(X, Y)
    SetCursorPos X, Y
End Function

Public Function GetCursorX()
    Dim dl&
    dl& = GetCursorPos(pt)
    GetCursorX = pt.X
End Function

Public Function GetCursorY()
    Dim dl&
    dl& = GetCursorPos(pt)
    GetCursorY = pt.Y
End Function

Public Function OpenCDROM()
    SendMCIString "set cd door open", True
End Function

Public Function CloseCDROM()
    SendMCIString "set cd door closed", True
End Function

' Return True if the Ctrl key is pressed.
Function CtrlKey() As Boolean
    CtrlKey = (GetAsyncKeyState(vbKeyControl) And &H8000)
End Function
' Return True if the Shift key is pressed.

Function ShiftKey() As Boolean
    ShiftKey = (GetAsyncKeyState(vbKeyShift) And &H8000)
End Function
' Return True if the Alt key is pressed.

Function AltKey() As Boolean
    AltKey = (GetAsyncKeyState(vbKeyMenu) And &H8000)
End Function
' Return True if a given key is pressed.

Public Function KeysPressed(ByVal KeyCode1 As KeyCodeConstants, Optional ByVal KeyCode2 As KeyCodeConstants, Optional ByVal KeyCode3 As KeyCodeConstants) As Boolean
    If GetAsyncKeyState(KeyCode1) >= 0 Then Exit Function
    If KeyCode2 = 0 Then KeysPressed = True: Exit Function
    If GetAsyncKeyState(KeyCode2) >= 0 Then Exit Function
    If KeyCode3 = 0 Then KeysPressed = True: Exit Function
    If GetAsyncKeyState(KeyCode3) >= 0 Then Exit Function
    KeysPressed = True
End Function
' Read the state of CapsLock.

Public Function GetCapsLock() As Boolean
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' for toggle keys, bit 0 reflects the cu
    '     rrent state
    GetCapsLock = (keystat(vbKeyCapital) And 1)
End Function
' Modify the state of CapsLock.

Public Function SetCapsLock(ByVal newValue As Boolean)
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' modify bit 0 of the relevant item, and
    '     store back
    keystat(vbKeyCapital) = (keystat(vbKeyCapital) And &HFE) Or (newValue And 1)
    SetKeyboardState keystat(0)
End Function
' Read the state of ScrollLock.

Public Function GetScrollLock() As Boolean
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' for toggle keys, bit 0 reflects the cu
    '     rrent state
    GetScrollLock = (keystat(vbKeyScrollLock) And 1)
End Function
' Modify the state of ScrollLock.

Public Function SetScrollLock(ByVal newValue As Boolean)
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' modify bit 0 of the relevant item, and
    '     store back
    keystat(vbKeyScrollLock) = (keystat(vbKeyScrollLock) And &HFE) Or (newValue And 1)
    SetKeyboardState keystat(0)
End Function
' Read the state of NumLock.

Public Function GetNumLock() As Boolean
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' for toggle keys, bit 0 reflects the cu
    '     rrent state
    GetNumLock = (keystat(vbKeyNumlock) And 1)
End Function
' Modify the state of NumLock.

Public Function SetNumLock(ByVal newValue As Boolean)
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' modify bit 0 of the relevant item, and
    '     store back
    keystat(vbKeyNumlock) = (keystat(vbKeyNumlock) And &HFE) Or (newValue And 1)
    SetKeyboardState keystat(0)
End Function
' Read the state of Insert Key.

Public Function GetInsertKey() As Boolean
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' for toggle keys, bit 0 reflects the cu
    '     rrent state
    GetInsertKey = (keystat(vbKeyInsert) And 1)
End Function
' Modify the state of Insert key.

Public Function SetInsertKey(ByVal newValue As Boolean)
    ' get current state of all 256 virtual k
    '     eys
    Dim keystat(0 To 255) As Byte
    GetKeyboardState keystat(0)
    ' modify bit 0 of the relevant item, and
    '     store back
    keystat(vbKeyInsert) = (keystat(vbKeyInsert) And &HFE) Or (newValue And 1)
    SetKeyboardState keystat(0)
End Function

Public Function GetPrivateString(PathName As String, IDLocation As String, VariableName As String)
    sString = String(100, "*")
    lLength = Len(sString)
    GetPrivateProfileString IDLocation, VariableName, vbNullString, sString, lLength, PathName
    GetPrivateString = sString
End Function

Public Sub SetPrivateString(PathName As String, IDLocation As String, VariableName As String, VariableSet As String)
    WritePrivateProfileString IDLocation, VariableName, VariableSet, PathName
End Sub

Public Function CallCache(SaveToFlag As Integer, SpkfileName As String, FiletoCache As String)
    WavCache(SaveToFlag) = PrecacheSound(SpkfileName, FiletoCache)
End Function

Public Function PakValid(PakFileName As String) As Boolean
    Header = String$(Len(MainHeader), Chr$(0))
    FileNumber = FreeFile
    Open PakFileName For Binary As FileNumber
        Get FileNumber, 1, Header
        If Header = MainHeader Then PakValid = True Else PakValid = False
    Close FileNumber
End Function

Function PrecacheSound(PakFile As String, FileToPrecache As String) As String
    If PakValid(PakFile) = True Then
        FileNumber = FreeFile
        Open PakFile For Binary As FileNumber
            Get FileNumber, Len(MainHeader) + 1, FileListStart
            If FileListStart = 0 Then
                Close FileNumber
                Exit Function
            Else
                Do
                    Get FileNumber, FileListStart, Offset
                    FileListStart = FileListStart + 4: OffSetTypes(DoCount) = Offset
                    
                    Get FileNumber, FileListStart, Size
                    FileListStart = FileListStart + 4: SizeTypes(DoCount) = Size
                    
                    Name = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, Name
                    Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                    FileListStart = FileListStart + (Len(Name) + 1): DoCount = DoCount + 1
                    
                    If UCase(Name) = UCase(FileToPrecache) Then
                        Buffload = Space(SizeTypes(DoCount - 1))
                        Get FileNumber, OffSetTypes(DoCount - 1), Buffload
                        PrecacheSound = Buffload
                    End If
                    
                Loop Until FileListStart > LOF(FileNumber)
            End If
        Close FileNumber
    End If
End Function

Public Function SOUNDPRECACHEFileCount(PakFile As String) As Long
    DoCount = 0
    If PakValid(PakFile) = True Then
        FileNumber = FreeFile
        Open PakFile For Binary As FileNumber
            Get FileNumber, Len(MainHeader) + 1, FileListStart
            If FileListStart = 0 Then
                Close FileNumber
                Exit Function
            Else
                FileCountTemp = 1
                Do
                    Get FileNumber, FileListStart, Offset
                    FileListStart = FileListStart + 4
                    
                    If DoCount = 0 Then
                        OffSetTypes(DoCount) = Offset
                    ElseIf DoCount > 0 Then
                        If OffSetTypes(0) = Offset Then SOUNDPRECACHEFileCount = FileCountTemp - 1: Close FileNumber: Exit Function
                        OffSetTypes(DoCount) = Offset: FileCountTemp = FileCountTemp + 1
                    End If
                    
                    Get FileNumber, FileListStart, Size
                    FileListStart = FileListStart + 4: SizeTypes(DoCount) = Size
                    
                    Name = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, Name
                    
                    Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                    FileListStart = FileListStart + Len(Name) + 1: DoCount = DoCount + 1
                    
                Loop Until FileListStart > LOF(FileNumber)
                FileCount = FileCountTemp
            End If
        Close FileNumber
    End If
End Function

Public Function SOUNDPRECACHEListFiles(PakFile As String, ReturnList As ListBox)
    DoCount = 0
    If PakValid(PakFile) = True Then
        FileNumber = FreeFile
        Open PakFile For Binary As FileNumber
            Get FileNumber, Len(MainHeader) + 1, FileListStart
            If FileListStart = 0 Then
                Close FileNumber
                Exit Function
            Else
                Do
                    Get FileNumber, FileListStart, Offset
                    FileListStart = FileListStart + 4
                    Get FileNumber, FileListStart, Size
                    FileListStart = FileListStart + 4
                    
                    Name = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, Name
                    Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                    
                    If WavName = Name Then Close FileNumber: Exit Function
                    If DoCount = 0 Then WavName = Name
                    
                    FileListStart = FileListStart + (Len(Name) + 1)
                    DoCount = DoCount + 1
                    ReturnList.AddItem Name
                    
                Loop Until FileListStart > LOF(FileNumber)
            End If
        Close FileNumber
    End If
End Function

Public Function SOUNDPRECACHEGetName(PakFile As String, FileNumberReturn As Integer) As String
    DoCount = 0
    FileNumberReturn = FileNumberReturn + 1
    If PakValid(PakFile) = True Then
        FileNumber = FreeFile
        Open PakFile For Binary As FileNumber
            Get FileNumber, Len(MainHeader) + 1, FileListStart
            If FileListStart = 0 Then
                Close FileNumber
                Exit Function
            Else
                Do
                    Get FileNumber, FileListStart, Offset
                    FileListStart = FileListStart + 4
                    Get FileNumber, FileListStart, Size
                    FileListStart = FileListStart + 4
                    
                    Name = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, Name
                    Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                    
                    If DoCount = 0 Then WavName = Name
                    
                    FileListStart = FileListStart + (Len(Name) + 1)
                    
                    If DoCount = 0 Then
                        If FileNumberReturn = 0 Then
                            SOUNDPRECACHEGetName = Name
                            Close FileNumber
                            Exit Function
                        End If
                    End If
                    
                    DoCount = DoCount + 1
                    If DoCount = FileNumberReturn Then SOUNDPRECACHEGetName = Name: Close FileNumber: Exit Function
                    
                Loop Until FileListStart > LOF(FileNumber)
            End If
        Close FileNumber
    End If
End Function

Public Function SOUNDPRECACHEGetNameNumber(PakFile As String, FName As String) As Integer
    DoCount = 0
    If PakValid(PakFile) = True Then
        FileNumber = FreeFile
        Open PakFile For Binary As FileNumber
            Get FileNumber, Len(MainHeader) + 1, FileListStart
            If FileListStart = 0 Then
                Close FileNumber
                Exit Function
            Else
                Do
                    Get FileNumber, FileListStart, Offset
                    FileListStart = FileListStart + 4
                    Get FileNumber, FileListStart, Size
                    FileListStart = FileListStart + 4
                    
                    Name = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, Name
                    Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                    
                    If DoCount = 0 Then WavName = Name
                    FileListStart = FileListStart + (Len(Name) + 1)
                    
                    If DoCount = 0 And FName = Name Then
                        SOUNDPRECACHEGetNameNumber = DoCount
                        Close FileNumber
                        Exit Function
                    End If
                    
                    DoCount = DoCount + 1
                    
                    If FName = Name Then
                        SOUNDPRECACHEGetNameNumber = DoCount - 1
                        Close FileNumber
                        Exit Function
                    End If
                    
                Loop Until FileListStart > LOF(FileNumber)
                GetNameNumber = -1
            End If
        Close FileNumber
    End If
End Function

Public Function PasswordCalculateMaker(sString As String) As String
    Dim result As Long
    For calc = 1 To Len(sString)
        result = result + Asc(Mid(sString, calc, 1)) * 123456 + Len(sString)
    Next calc
    calculate = Hex(result) + Hex(Len(sString))
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

Public Function HideDesktop()
    ShowWindow FindWindowEx(FindWindowEx(FindWindow("Progman", vbNullString), 0&, "SHELLDLL_DefView", vbNullString), 0&, "SysListView32", vbNullString), 0
End Function

Public Function ShowDesktop()
    ShowWindow FindWindowEx(FindWindowEx(FindWindow("Progman", vbNullString), 0&, "SHELLDLL_DefView", vbNullString), 0&, "SysListView32", vbNullString), 5
End Function

Public Sub PlaySound(strFileName As String)
    sndPlaySound strFileName, 1
End Sub

Function StartDoc(DocName As String) As Long
    Dim Scr_hDC As Long
    Scr_hDC = GetDesktopWindow()
    StartDoc = ShellExecute(Scr_hDC, "Open", DocName, "", "", SW_SHOWNORMAL)
End Function

Public Function ExFile(Filen As String)
    Dim r As Long, msg As String
    r = StartDoc(Filen) ' ' Change this to a valid path
    If r <= 32 Then
        'There was an error
        Select Case r
            Case SE_ERR_FNF
                msg = "Cannot find or access the file/folder '" & Filen & "' (or one of its components). Make sure the path and filename are correct and that all required libraries are available - Error number (" & r & ")."
            Case SE_ERR_PNF
                msg = "Cannot find the path '" & Filen & "' (or one of its components). Make sure the path is correct - Error number (" & r & ")."
            Case SE_ERR_ACCESSDENIED
                msg = "Cannot access the file '" & Filen & "' (Access Denied) - Error number (" & r & ")."
            Case SE_ERR_OOM
                msg = "Cannot access the file '" & Filen & " (Out of memory) - Error number (" & r & ")."
            Case SE_ERR_DLLNOTFOUND
                msg = "Cannot access the file '" & Filen & " (One or more of it's components could not be found) - Error number (" & r & ")."
            Case SE_ERR_SHARE
                msg = "Cannot access the file '" & Filen & " (A sharing violation occurred) - Error number (" & r & ")."
            Case SE_ERR_ASSOCINCOMPLETE
                msg = "Cannot access the file '" & Filen & " (Incomplete or invalid file association) - Error number (" & r & ")."
            Case SE_ERR_DDETIMEOUT
                msg = "Cannot access the file '" & Filen & " (DDE Time out) - Error number (" & r & ")."
            Case SE_ERR_DDEFAIL
                msg = "Cannot access the file '" & Filen & " (DDE transaction failed) - Error number (" & r & ")."
            Case SE_ERR_DDEBUSY
                msg = "Cannot access the file '" & Filen & " (DDE busy) - Error number (" & r & ")."
            Case SE_ERR_NOASSOC
                msg = "Cannot access the file '" & Filen & " (No association for file extension) - Error number (" & r & ")."
            Case ERROR_BAD_FORMAT
                msg = "Cannot access the file '" & Filen & " (Invalid EXE file or error in EXE image) - Error number (" & r & ")."
            Case Else
                msg = "Cannot access the file '" & Filen & " (Unknown error) - Error number (" & r & ")."
        End Select
        MsgBox msg, vbCritical, Filen
    End If
End Function

Function SetDWORDValue(SubKey As String, Entry As String, Value As Long)

Call ParseKey(SubKey, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegOpenKeyEx(MainKeyHandle, SubKey, 0, KEY_WRITE, hKey) 'open the key
   If rtn = ERROR_SUCCESS Then
      rtn = RegSetValueExA(hKey, Entry, 0, REG_DWORD, Value, 4)
      If Not rtn = ERROR_SUCCESS Then
         If DisplayErrorMsg = True Then
            MsgBox ErrorMsg(rtn)
         End If
      End If
      rtn = RegCloseKey(hKey) 'close the key
   Else 'if there was an error opening the key
      If DisplayErrorMsg = True Then 'if the user want errors displayed
         MsgBox ErrorMsg(rtn) 'display the error
      End If
   End If
End If

End Function
Function GetDWORDValue(SubKey As String, Entry As String)

Call ParseKey(SubKey, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegOpenKeyEx(MainKeyHandle, SubKey, 0, KEY_READ, hKey) 'open the key
   If rtn = ERROR_SUCCESS Then 'if the key could be opened then
      rtn = RegQueryValueExA(hKey, Entry, 0, REG_DWORD, lBuffer, 4) 'get the value from the registry
      If rtn = ERROR_SUCCESS Then 'if the value could be retreived then
         rtn = RegCloseKey(hKey)  'close the key
         GetDWORDValue = lBuffer  'return the value
      Else                        'otherwise, if the value couldnt be retreived
         GetDWORDValue = ""  'return Error to the user
         If DisplayErrorMsg = True Then 'if the user wants errors displayed
            MsgBox ErrorMsg(rtn)        'tell the user what was wrong
         End If
      End If
   Else 'otherwise, if the key couldnt be opened
      GetDWORDValue = ""        'return Error to the user
      If DisplayErrorMsg = True Then 'if the user wants errors displayed
         MsgBox ErrorMsg(rtn)        'tell the user what was wrong
      End If
   End If
End If

End Function

Function SetBinaryValue(SubKey As String, Entry As String, Value As String)
Dim i
Call ParseKey(SubKey, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegOpenKeyEx(MainKeyHandle, SubKey, 0, KEY_WRITE, hKey) 'open the key
   If rtn = ERROR_SUCCESS Then 'if the key was open successfully then
      lDataSize = Len(Value)
      ReDim ByteArray(lDataSize)
      For i = 1 To lDataSize
      ByteArray(i) = Asc(Mid$(Value, i, 1))
      Next
      rtn = RegSetValueExB(hKey, Entry, 0, REG_BINARY, ByteArray(1), lDataSize) 'write the value
      If Not rtn = ERROR_SUCCESS Then   'if the was an error writting the value
         If DisplayErrorMsg = True Then 'if the user want errors displayed
            MsgBox ErrorMsg(rtn)        'display the error
         End If
      End If
      rtn = RegCloseKey(hKey) 'close the key
   Else 'if there was an error opening the key
      If DisplayErrorMsg = True Then 'if the user wants errors displayed
         MsgBox ErrorMsg(rtn) 'display the error
      End If
   End If
End If

End Function

Function GetBinaryValue(SubKey As String, Entry As String)

Call ParseKey(SubKey, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegOpenKeyEx(MainKeyHandle, SubKey, 0, KEY_READ, hKey) 'open the key
   If rtn = ERROR_SUCCESS Then 'if the key could be opened
      lBufferSize = 1
      rtn = RegQueryValueEx(hKey, Entry, 0, REG_BINARY, 0, lBufferSize) 'get the value from the registry
      sBuffer = Space(lBufferSize)
      rtn = RegQueryValueEx(hKey, Entry, 0, REG_BINARY, sBuffer, lBufferSize) 'get the value from the registry
      If rtn = ERROR_SUCCESS Then 'if the value could be retreived then
         rtn = RegCloseKey(hKey)  'close the key
         GetBinaryValue = sBuffer 'return the value to the user
      Else                        'otherwise, if the value couldnt be retreived
         GetBinaryValue = "" 'return Error to the user
         If DisplayErrorMsg = True Then 'if the user wants to errors displayed
            MsgBox ErrorMsg(rtn)  'display the error to the user
         End If
      End If
   Else 'otherwise, if the key couldnt be opened
      GetBinaryValue = "" 'return Error to the user
      If DisplayErrorMsg = True Then 'if the user wants to errors displayed
         MsgBox ErrorMsg(rtn)  'display the error to the user
      End If
   End If
End If

End Function

Function DeleteKey(KeyName As String)

Call ParseKey(KeyName, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegOpenKeyEx(MainKeyHandle, KeyName, 0, KEY_WRITE, hKey) 'open the key
   If rtn = ERROR_SUCCESS Then 'if the key could be opened then
      rtn = RegDeleteKey(hKey, KeyName) 'delete the key
      rtn = RegCloseKey(hKey)  'close the key
   End If
End If

End Function

Function GetMainKeyHandle(MainKeyName As String) As Long

Const HKEY_CLASSES_ROOT = &H80000000
Const HKEY_CURRENT_USER = &H80000001
Const HKEY_LOCAL_MACHINE = &H80000002
Const HKEY_USERS = &H80000003
Const HKEY_PERFORMANCE_DATA = &H80000004
Const HKEY_CURRENT_CONFIG = &H80000005
Const HKEY_DYN_DATA = &H80000006
   
Select Case MainKeyName
       Case "HKEY_CLASSES_ROOT"
            GetMainKeyHandle = HKEY_CLASSES_ROOT
       Case "HKEY_CURRENT_USER"
            GetMainKeyHandle = HKEY_CURRENT_USER
       Case "HKEY_LOCAL_MACHINE"
            GetMainKeyHandle = HKEY_LOCAL_MACHINE
       Case "HKEY_USERS"
            GetMainKeyHandle = HKEY_USERS
       Case "HKEY_PERFORMANCE_DATA"
            GetMainKeyHandle = HKEY_PERFORMANCE_DATA
       Case "HKEY_CURRENT_CONFIG"
            GetMainKeyHandle = HKEY_CURRENT_CONFIG
       Case "HKEY_DYN_DATA"
            GetMainKeyHandle = HKEY_DYN_DATA
End Select

End Function

Function ErrorMsg(lErrorCode As Long) As String
    Dim GetErrorMsg
'If an error does accurr, and the user wants error messages displayed, then
'display one of the following error messages

Select Case lErrorCode
       Case 1009, 1015
            GetErrorMsg = "The Registry Database is corrupt!"
       Case 2, 1010
            GetErrorMsg = "Bad Key Name"
       Case 1011
            GetErrorMsg = "Can't Open Key"
       Case 4, 1012
            GetErrorMsg = "Can't Read Key"
       Case 5
            GetErrorMsg = "Access to this key is denied"
       Case 1013
            GetErrorMsg = "Can't Write Key"
       Case 8, 14
            GetErrorMsg = "Out of memory"
       Case 87
            GetErrorMsg = "Invalid Parameter"
       Case 234
            GetErrorMsg = "There is more data than the buffer has been allocated to hold."
       Case Else
            GetErrorMsg = "Undefined Error Code:  " & Str$(lErrorCode)
End Select

End Function

Function GetStringValue(SubKey As String, Entry As String)

Call ParseKey(SubKey, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegOpenKeyEx(MainKeyHandle, SubKey, 0, KEY_READ, hKey) 'open the key
   If rtn = ERROR_SUCCESS Then 'if the key could be opened then
      sBuffer = Space(255)     'make a buffer
      lBufferSize = Len(sBuffer)
      rtn = RegQueryValueEx(hKey, Entry, 0, REG_SZ, sBuffer, lBufferSize) 'get the value from the registry
      If rtn = ERROR_SUCCESS Then 'if the value could be retreived then
         rtn = RegCloseKey(hKey)  'close the key
         sBuffer = Trim(sBuffer)
         GetStringValue = Left(sBuffer, Len(sBuffer) - 1) 'return the value to the user
      Else                        'otherwise, if the value couldnt be retreived
         GetStringValue = "" 'return Error to the user (Don't remove the "Error" and change it into "" because it's needed.)
         If DisplayErrorMsg = True Then 'if the user wants errors displayed then
            MsgBox ErrorMsg(rtn)  'tell the user what was wrong
         End If
      End If
   Else 'otherwise, if the key couldnt be opened
      GetStringValue = ""       'return Error to the user (Don't remove the "Error" and change it into "" because it's needed.)
      If DisplayErrorMsg = True Then 'if the user wants errors displayed then
         MsgBox ErrorMsg(rtn)        'tell the user what was wrong
      End If
   End If
End If

End Function

Private Sub ParseKey(KeyName As String, Keyhandle As Long)
    
rtn = InStr(KeyName, "\") 'return if "\" is contained in the Keyname

If Left(KeyName, 5) <> "HKEY_" Or Right(KeyName, 1) = "\" Then 'if the is a "\" at the end of the Keyname then
   MsgBox "Incorrect Format:" + Chr(10) + Chr(10) + KeyName 'display error to the user
   Exit Sub 'exit the procedure
ElseIf rtn = 0 Then 'if the Keyname contains no "\"
   Keyhandle = GetMainKeyHandle(KeyName)
   KeyName = "" 'leave Keyname blank
Else 'otherwise, Keyname contains "\"
   Keyhandle = GetMainKeyHandle(Left(KeyName, rtn - 1)) 'seperate the Keyname
   KeyName = Right(KeyName, Len(KeyName) - rtn)
End If

End Sub

Function CreateKey(SubKey As String)

Call ParseKey(SubKey, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegCreateKey(MainKeyHandle, SubKey, hKey) 'create the key
   If rtn = ERROR_SUCCESS Then 'if the key was created then
      rtn = RegCloseKey(hKey)  'close the key
   End If
End If

End Function

Function SetStringValue(SubKey As String, Entry As String, Value As String)

Call ParseKey(SubKey, MainKeyHandle)

If MainKeyHandle Then
   rtn = RegOpenKeyEx(MainKeyHandle, SubKey, 0, KEY_WRITE, hKey) 'open the key
   If rtn = ERROR_SUCCESS Then 'if the key was open successfully then
      rtn = RegSetValueEx(hKey, Entry, 0, REG_SZ, ByVal Value, Len(Value)) 'write the value
      If Not rtn = ERROR_SUCCESS Then   'if there was an error writting the value
         If DisplayErrorMsg = True Then 'if the user wants errors displayed
            MsgBox ErrorMsg(rtn)        'display the error
         End If
      End If
      rtn = RegCloseKey(hKey) 'close the key
   Else 'if there was an error opening the key
      If DisplayErrorMsg = True Then 'if the user wants errors displayed
         MsgBox ErrorMsg(rtn)        'display the error
      End If
   End If
End If

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

Public Function HideWindowsToolBar()
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

'CD ROM code
Public Function SendMCIString(cmd As String, fShowError As Boolean) As Boolean
    Static rc As Long
    Dim hWnd As Long
    Static errStr As String * 200
    rc = mciSendString(cmd, 0, 0, hWnd)
    If (fShowError And rc <> 0) Then
        mciGetErrorString rc, errStr, Len(errStr)
        'Hide the error dialogs. Don't want user to find this program
        'MsgBox errStr
    End If
    SendMCIString = (rc = 0)
End Function

Public Sub ShowFindDialog(Optional InitialDirectory As String)
    ShellExecute 0, "find", _
    IIf(InitialDirectory = "", "", InitialDirectory), vbNullString, vbNullString, SW_SHOW
End Sub

Public Function BestWayHideDesktopIcons()
    Dim lDesktopHwnd As Long
    Dim lFlags As Long
    On Error Resume Next
    lDesktopHwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
    ShowWindow lDesktopHwnd, 0
End Function

Public Function BestWayShowDesktopIcons()
    Dim lDesktopHwnd As Long
    Dim lFlags As Long
    On Error Resume Next
    lDesktopHwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
    ShowWindow lDesktopHwnd, 1
End Function

Public Function TranslateColor(ByVal oleColor As OLE_COLOR, Optional ByVal hPalette As Long = 0) As Long
    If Not OleTranslateColor(oleColor, hPalette, TranslateColor) = 0 Then TranslateColor = CLR_INVALID
End Function

Public Function StripNulls(StringWithNulls As String)
    Dim lPos As Long
    lPos = InStr(StringWithNulls, vbNullChar)
    If lPos > 0 Then StringWithNulls = Left(StringWithNulls, lPos - 1)
End Function

Public Function DisplayChangeIconDialog(FileName As String, Optional ByVal hWndOwner As Long = 0, Optional IconIndex = 0, Optional ByVal GetHandle As Boolean = True) As Long
    If SHChangeIconDialog(hWndOwner, FileName, 0, IconIndex) = 0 Then Exit Function ' Failure? Exit Function
    Call StripNulls(FileName) ' It will probably contain nulls!
    If GetHandle Then
        DisplayChangeIconDialog = ExtractAssociatedIcon(App.hInstance, FileName, IconIndex) ' Extract the icon
        ' Do NOT forget to DeleteObject it when you are done!!!
    Else
        DisplayChangeIconDialog = -1 ' Success but do nothing... FileName and IconIndex are returned ByRef anyway
    End If
End Function

Public Function DrawExtractedIcon(ByVal hDCOwner As Long, ByVal hIcon As Long, Optional ByVal X As Long = 0, Optional ByVal Y As Long = 0, Optional ByVal Width As Long = 0, Optional ByVal Height As Long = 0, Optional ByVal BackColor As Long = -1, Optional ByVal DeleteAfterDraw As Boolean = True) As Boolean
    Dim hBrush As Long
    BackColor = TranslateColor(BackColor) ' Translate the BackColor (might be a system color)
    If Not BackColor = CLR_INVALID Then hBrush = CreateSolidBrush(BackColor) ' If it's real, make it into a brush
    ' Here's where the update is: (The flag parameter was zero instead of DI_NORMAL)
    DrawExtractedIcon = DrawIconEx(hDCOwner, X, Y, hIcon, Width, Height, 0, hBrush, DI_NORMAL) ' Draw!
    Call DeleteObject(hBrush) ' Delete the brush
    If DeleteAfterDraw Then Call DeleteObject(hIcon) ' Delete the icon, if it is requested
End Function

Public Function DisplayFormatDriveDialog(ByVal DriveLetter As String, Optional ByVal hWndOwner As Long = 0, Optional ByVal FormatType As Long = SHFDTypeFullFormat, Optional ByVal FormatCapacity As Long = SHFDCapacityDefault) As Boolean
    Dim iDrive As Integer
    If Len(DriveLetter) = 0 Then Exit Function ' Must format SOMETHING
    iDrive = Asc(UCase(Left(DriveLetter, 1))) - 65 ' Convert first letter to ASCII and decrease by 65 to get A=0, B=1...
    If (iDrive < 0) Or (iDrive > 25) Then Exit Function ' Must be a letter!
    DisplayFormatDriveDialog = (SHFormatDrive(hWndOwner, iDrive, FormatCapacity, FormatType) > 0) ' Result must be > 0
End Function

Public Function IsPathExecutable(ByVal PathName As String) As Boolean
    IsPathExecutable = SHIsPathExecutable(PathName) ' As simple as that!
End Function

Public Function ExitWindowsMsgBox(Optional ByVal Operation As Long = EWX_SHUTDOWN, Optional ByVal hWndOwner As Long = 0, Optional ByVal ExtraText As String = vbNullString) As VbMsgBoxResult
    ExitWindowsMsgBox = SHRestartSystemMessageBox(hWndOwner, ExtraText, Operation) ' Another simple API call...
End Function

Public Function DisplayRunDialog(Optional ByVal hWndOwner As Long = 0, Optional ByVal Caption As String = vbNullString, Optional ByVal Prompt As String = vbNullString, Optional ByVal BrowseButton As Boolean = True, Optional ByVal InitialSelection As Boolean = True) As Boolean
    Dim uFlags As Long
    If Not BrowseButton Then uFlags = uFlags Or SHRD_NOBROWSE
    If Not InitialSelection Then uFlags = uFlags Or SHRD_NOSTRING
    DisplayRunDialog = Not CBool(SHRunDialog(hWndOwner, 0, 0, Caption, Prompt, uFlags)) ' No! two Reservedies! "RUN"!
End Function

Public Function EnumWindowsProc(ByVal hWnd As Long, ByVal lParam As Long) As Boolean
    Dim l As Long
    Dim sClsNm As String
    Dim ss As IE_STATE_SAVE
    Dim wp As WINDOWPLACEMENT

    wp.Length = Len(wp)

    sClsNm = GetClassName(hWnd)

    'Debug.Print hWnd, sClsNm, GetCaption(hWnd)
    'used for debugging to find the class names for the ie windows

    If sClsNm = "IEFrame" Or sClsNm = "CabinetWClass" Then 'If it is an IE window then...
        GetWindowPlacement hWnd, wp         'get the windowplacement
        ss.hWnd = hWnd                      'store the hwnd
        ss.wp = wp                          'store the windowplacement
        l = UBound(arrayIESS)               'we are going to place it at the ubound of the array
        arrayIESS(l) = ss                   'save our IE_STATE_SAVE to the array
        ReDim Preserve arrayIESS(l + 1)     'make room for the next one
        wp.showCmd = SW_HIDE                'modify the windowplacement to hide the window
        SetWindowPlacement hWnd, wp         'reapply it to the IE window
    End If

    EnumWindowsProc = True                  'this must return true to keep enumerating

End Function

Public Function SubProc(ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    If wMsg = WM_HOTKEY Then    'the hotkey message was fired
        If LoWord(lParam) = MOD_WIN And HiWord(lParam) = VK_Z And wParam = MIN_HOTKEY Then
            MinimizeIE
        End If
        If LoWord(lParam) = (MOD_WIN + MOD_SHIFT) And HiWord(lParam) = VK_Z And wParam = RST_HOTKEY Then
            RestoreIE
        End If
    End If
    SubProc = CallWindowProc(lngOldWindowProc, hWnd, wMsg, wParam, lParam)
End Function

Public Sub MinimizeIE()

    ReDim arrayIESS(0) 'clear out all the current IE_STATE_SAVEs

    EnumWindows AddressOf EnumWindowsProc, 0 'lParam is unused

End Sub

Public Sub RestoreIE()
'this just restores all the windows to the positions they had when MinimizeIE was called
On Error GoTo exit_RestoreIE

    Dim ieSS As IE_STATE_SAVE
    Dim l As Long

    For l = UBound(arrayIESS) To LBound(arrayIESS) Step -1
        ieSS = arrayIESS(l)
        With ieSS
            If .hWnd > 0 Then
                SetWindowPlacement .hWnd, .wp
            End If
        End With
    Next

exit_RestoreIE:
    Exit Sub

End Sub

Public Function GetClassName(ByVal hWnd As Long) As String
    Dim lngReturn As Long
    Dim strReturn As String
    
    strReturn = Space(255)

    lngReturn = GetClassNameA(hWnd, strReturn, Len(strReturn))

    GetClassName = Left(strReturn, lngReturn)

End Function

Public Function LoWord(ByVal dw As Long) As Integer
On Error GoTo Err_LoWord

    CopyMemoryH LoWord, ByVal VarPtr(dw), 2

Exit_LoWord:
    Exit Function

Err_LoWord:
    GoTo Exit_LoWord

End Function

Public Function HiWord(ByVal dw As Long) As Integer
On Error GoTo Err_HiWord

    CopyMemoryH HiWord, ByVal VarPtr(dw) + 2, 2

Exit_HiWord:
    Exit Function

Err_HiWord:
    GoTo Exit_HiWord

End Function

Public Function Mouse_SetTrails(T As Long)
    'Set your mouse trail-(can go from 0 to 10)
    SystemParametersInfoA SPI_SETMOUSETRAILS, T, ByVal 0&, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE
End Function

Public Function SetWallpaper(FileName As String)
    X = SystemParametersInfo(20, 0, FileName, 0)
    SetStringValue "HKEY_USERS\.DEFAULT\CONTROL PANEL\DESKTOP", "WallPaper", FileName
End Function

Public Function CheckExplorer() As Boolean
    
        Const PROCESS_ALL_ACCESS = 0
        Dim uProcess As PROCESSENTRY32
        Dim rProcessFound As Long
        Dim hSnapshot As Long
        Dim szExename As String
        Dim Found As Boolean
        Dim i As Integer
        On Local Error GoTo Finish
    
        Const TH32CS_SNAPPROCESS As Long = 2&
    
        uProcess.dwSize = Len(uProcess)
        hSnapshot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)
        rProcessFound = ProcessFirst(hSnapshot, uProcess)
    
        Do While rProcessFound
            i = InStr(1, uProcess.szexeFile, Chr(0))
            szExename = LCase$(Left$(uProcess.szexeFile, i - 1))
    
            If UCase$(Right$(szExename, 12)) = "EXPLORER.EXE" Then
                Found = True
                Call CloseHandle(hSnapshot)
                GoTo Finish
            End If
    
            rProcessFound = ProcessNext(hSnapshot, uProcess)
        Loop
    
    
        Call CloseHandle(hSnapshot)
Finish:
    
    If Found = False Then CheckExplorer = False
    If Found = True Then CheckExplorer = True
End Function

Public Function TrimNull(Item As String)
    Dim pos As Integer
    pos = InStr(Item, Chr$(0))
    If pos Then
        TrimNull = Left$(Item, pos - 1)
    Else: TrimNull = Item
    End If
End Function
