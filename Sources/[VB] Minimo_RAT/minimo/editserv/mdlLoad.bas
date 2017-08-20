'VA: 4230C9
Private Declare Sub WSARecvEx Lib "wsock32.dll"()
'VA: 423085
Private Declare Sub WSAAsyncSelect Lib "wsock32.dll"()
'VA: 42303D
Private Declare Sub WSACancelAsyncRequest Lib "wsock32.dll"()
'VA: 423009
Private Declare Sub WSAAsyncGetHostByAddr Lib "wsock32.dll"()
'VA: 422FB9
Private Declare Sub WSAAsyncGetHostByName Lib "wsock32.dll"()
'VA: 422F69
Private Declare Sub WSAAsyncGetProtoByNumber Lib "wsock32.dll"()
'VA: 422F15
Private Declare Sub WSAAsyncGetProtoByName Lib "wsock32.dll"()
'VA: 422EC5
Private Declare Sub WSAAsyncGetServByPort Lib "wsock32.dll"()
'VA: 422E75
Private Declare Sub WSAAsyncGetServByName Lib "wsock32.dll"()
'VA: 422E21
Private Declare Sub WSACancelBlockingCall Lib "wsock32.dll"()
'VA: 422DD1
Private Declare Sub WSASetBlockingHook Lib "wsock32.dll"()
'VA: 422D85
Private Declare Sub WSAUnhookBlockingHook Lib "wsock32.dll"()
'VA: 422D35
Private Declare Sub WSAIsBlocking Lib "wsock32.dll"()
'VA: 422CED
Private Declare Sub WSAGetLastError Lib "wsock32.dll"()
'VA: 422CA5
Private Declare Sub WSASetLastError Lib "wsock32.dll"()
'VA: 422C3D
Private Declare Sub WSACleanup Lib "wsock32.dll"()
'VA: 422BF9
Private Declare Sub WSAStartup Lib "wsock32.dll"()
'VA: 422BB5
Private Declare Sub getprotobyname Lib "wsock32.dll"()
'VA: 422B6D
Private Declare Sub getprotobynumber Lib "wsock32.dll"()
'VA: 422B21
Private Declare Sub getservbyname Lib "wsock32.dll"()
'VA: 422AD9
Private Declare Sub getservbyport Lib "wsock32.dll"()
'VA: 422A6D
Private Declare Sub gethostname Lib "wsock32.dll"()
'VA: 422A29
Private Declare Sub gethostbyname Lib "wsock32.dll"()
'VA: 4229E1
Private Declare Sub gethostbyaddr Lib "wsock32.dll"()
'VA: 422999
Private Declare Sub socket Lib "wsock32.dll"()
'VA: 422959
Private Declare Sub shutdown Lib "wsock32.dll"()
'VA: 422915
Private Declare Sub setsockopt Lib "wsock32.dll"()
'VA: 4228D1
Private Declare Sub sendto Lib "wsock32.dll"()
'VA: 422891
Private Declare Sub send Lib "wsock32.dll"()
'VA: 422851
Private Declare Sub select Lib "wsock32.dll"()
'VA: 422811
Private Declare Sub recvfrom Lib "wsock32.dll"()
'VA: 4227CD
Private Declare Sub recv Lib "wsock32.dll"()
'VA: 42278D
Private Declare Sub ntohs Lib "wsock32.dll"()
'VA: 42274D
Private Declare Sub ntohl Lib "wsock32.dll"()
'VA: 422719
Private Declare Sub listen Lib "wsock32.dll"()
'VA: 4226D9
Private Declare Sub inet_ntoa Lib "wsock32.dll"()
'VA: 422695
Private Declare Sub inet_addr Lib "wsock32.dll"()
'VA: 422651
Private Declare Sub htons Lib "wsock32.dll"()
'VA: 422611
Private Declare Sub htonl Lib "wsock32.dll"()
'VA: 4225D1
Private Declare Sub getsockopt Lib "wsock32.dll"()
'VA: 42258D
Private Declare Sub getsockname Lib "wsock32.dll"()
'VA: 42253D
Private Declare Sub getpeername Lib "wsock32.dll"()
'VA: 4224F9
Private Declare Sub ioctlsocket Lib "wsock32.dll"()
'VA: 4224B5
Private Declare Sub connect Lib "wsock32.dll"()
'VA: 422475
Private Declare Sub closesocket Lib "wsock32.dll"()
'VA: 422431
Private Declare Sub bind Lib "wsock32.dll"()
'VA: 4223F1
Private Declare Sub accept Lib "wsock32.dll"()
'VA: 422395
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
'VA: 422115
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long         ' Note that if you the lpData parameter as String, you must pass it By Value.
'VA: 4220CD
Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
'VA: 422085
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
'VA: 422041
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
'VA: 421FED
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
'VA: 421F99
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long         ' Note that if you the lpData parameter as String, you must pass it By Value.
'VA: 421F4D
Private Declare Function RegCloseKey Lib "advapi32.dll" Alias "RegCloseKey" (ByVal hKey As Long) As Long
'VA: 421F09
Private Declare Function RegEnumKey Lib "advapi32.dll" Alias "RegEnumKeyA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long
'VA: 421EC5
Private Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
'VA: 421E7D
Private Declare Function RegSetValue Lib "advapi32.dll" Alias "RegSetValueA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
'VA: 421E31
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
'VA: 4206C5
Private Declare Function DrawFocusRect Lib "user32" Alias "DrawFocusRect" (ByVal hdc As Long, lpRect As RECT) As Long
'VA: 42067D
Private Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hDC As Long, ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, lpDrawTextParams As DRAWTEXTPARAMS) As Long
'VA: 420639
Private Declare Function GetCursorPos Lib "user32" Alias "GetCursorPos" (lpPoint As POINTAPI) As Long
'VA: 4205DD
Private Declare Function WindowFromPoint Lib "user32" Alias "WindowFromPoint" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
'VA: 420595
Private Declare Function SetCapture Lib "user32" Alias "SetCapture" (ByVal hwnd As Long) As Long
'VA: 420551
Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
'VA: 4204FD
Private Declare Function DrawState Lib "user32" Alias "DrawStateA" (ByVal hDC As Long, ByVal hBrush As Long, ByVal lpDrawStateProc As Long, ByVal lParam As Long, ByVal wParam As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal n3 As Long, ByVal n4 As Long, ByVal un As Long) As Long
'VA: 4204B9
Private Declare Function RealizePalette Lib "gdi32" Alias "RealizePalette" (ByVal hdc As Long) As Long
'VA: 420471
Private Declare Function SelectPalette Lib "gdi32" Alias "SelectPalette" (ByVal hdc As Long, ByVal hPalette As Long, ByVal bForceBackground As Long) As Long
'VA: 420411
Private Declare Function GetTextColor Lib "gdi32" Alias "GetTextColor" (ByVal hdc As Long) As Long
'VA: 4203C9
Private Declare Function GetBkColor Lib "gdi32" Alias "GetBkColor" (ByVal hdc As Long) As Long
'VA: 420385
Private Declare Function CreateBitmap Lib "gdi32" Alias "CreateBitmap" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal nPlanes As Long, ByVal nBitCount As Long, lpBits As Any) As Long
'VA: 42033D
Private Declare Function SetTextColor Lib "gdi32" Alias "SetTextColor" (ByVal hdc As Long, ByVal crColor As Long) As Long
'VA: 4202F5
Private Declare Function CreateSolidBrush Lib "gdi32" Alias "CreateSolidBrush" (ByVal crColor As Long) As Long
'VA: 4202A9
Private Declare Function SetWindowRgn Lib "user32" Alias "SetWindowRgn" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
'VA: 42023D
Private Declare Function CombineRgn Lib "gdi32" Alias "CombineRgn" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
'VA: 4201F9
Private Declare Function CreateRectRgn Lib "gdi32" Alias "CreateRectRgn" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
'VA: 4201B1
Private Declare Function SetPixelV Lib "gdi32" Alias "SetPixelV" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
'VA: 42016D
Private Declare Function FrameRect Lib "user32" Alias "FrameRect" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
'VA: 420129
Private Declare Function FillRect Lib "user32" Alias "FillRect" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
'VA: 4200E5
Private Declare Function LineTo Lib "gdi32" Alias "LineTo" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
'VA: 420085
Private Declare Function MoveToEx Lib "gdi32" Alias "MoveToEx" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, lpPoint As POINTAPI) As Long
'VA: 420041
Private Declare Function CreatePen Lib "gdi32" Alias "CreatePen" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
'VA: 41EEF1
Private Declare Sub InternetOpenA Lib "wininet.dll"()
'VA: 41ECED
Private Declare Sub InternetConnectA Lib "wininet.dll"()
'VA: 41E751
Private Declare Sub HttpOpenRequestA Lib "wininet.dll"()
'VA: 41DFA5
Private Declare Sub HttpSendRequestA Lib "wininet.dll"()
'VA: 41DBD9
Private Declare Sub HttpQueryInfoA Lib "wininet.dll"()
'VA: 41D9D5
Private Declare Sub InternetCloseHandle Lib "wininet.dll"()
'VA: 41D431
Private Declare Sub InternetQueryOptionA Lib "wininet.dll"()
'VA: 41A8ED
Private Declare Function GetClientRect Lib "user32" Alias "GetClientRect" (ByVal hwnd As Long, lpRect As RECT) As Long
'VA: 41A8A5
Private Declare Function DestroyWindow Lib "user32" Alias "DestroyWindow" (ByVal hwnd As Long) As Long
'VA: 41A85D
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
'VA: 41A815
Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
'VA: 41A7CD
Private Declare Sub InitCommonControls Lib "comctl32.dll"()
'VA: 4147B5
Private Declare Function SetWindowPos Lib "user32" Alias "SetWindowPos" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
'VA: 41476D
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
'VA: 414725
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
'VA: 413C19
Private Declare Sub DestroyIcon Lib "user32"()
'VA: 413A25
Private Declare Sub DrawIcon Lib "user32"()
'VA: 4138F1
Private Declare Sub CommDlgExtendedError Lib "COMDLG32"()
'VA: 4138A1
Private Declare Sub PageSetupDlgA Lib "COMDLG32"()
'VA: 413849
Private Declare Sub PrintDlgA Lib "COMDLG32.DLL"()
'VA: 413805
Private Declare Sub ChooseFontA Lib "COMDLG32"()
'VA: 4137C1
Private Declare Function GetSysColor Lib "user32" Alias "GetSysColor" (ByVal nIndex As Long) As Long
'VA: 41377D
Private Declare Sub ChooseColorA Lib "COMDLG32.DLL"()
'VA: 413721
Private Declare Sub GetFileTitleA Lib "COMDLG32"()
'VA: 4136D9
Private Declare Sub GetSaveFileNameA Lib "COMDLG32"()
'VA: 41368D
Private Declare Sub GetOpenFileNameA Lib "COMDLG32"()
'VA: 413631
Private Declare Function GlobalUnlock Lib "kernel32" Alias "GlobalUnlock" (ByVal hMem As Long) As Long
'VA: 4135E9
Private Declare Function GlobalSize Lib "kernel32" Alias "GlobalSize" (ByVal hMem As Long) As Long
'VA: 4135A5
Private Declare Function GlobalReAlloc Lib "kernel32" Alias "GlobalReAlloc" (ByVal hMem As Long, ByVal dwBytes As Long, ByVal wFlags As Long) As Long
'VA: 41355D
Private Declare Function GlobalLock Lib "kernel32" Alias "GlobalLock" (ByVal hMem As Long) As Long
'VA: 413519
Private Declare Function GlobalFree Lib "kernel32" Alias "GlobalFree" (ByVal hMem As Long) As Long
'VA: 4134C9
Private Declare Function GlobalCompact Lib "kernel32" Alias "GlobalCompact" (ByVal dwMinFree As Long) As Long
'VA: 413481
Private Declare Function GlobalAlloc Lib "kernel32" Alias "GlobalAlloc" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
'VA: 41343D
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
'VA: 412C45
Private Declare Sub VarPtr Lib "msvbvm50.dll"()
'VA: 412BF9
Private Declare Sub OleCreatePictureIndirect Lib "olepro32.dll"()
'VA: 412B91
Private Declare Function GetIconInfo Lib "user32" Alias "GetIconInfo" (ByVal hIcon As Long, piconinfo As ICONINFO) As Long
'VA: 412B4D
Private Declare Function CreateIconIndirect Lib "user32" Alias "CreateIconIndirect" (piconinfo As ICONINFO) As Long
'VA: 412B01
Private Declare Function GdiFlush Lib "gdi32" Alias "GdiFlush" () As Long
'VA: 412ABD
Private Declare Function SetBkColor Lib "gdi32" Alias "SetBkColor" (ByVal hdc As Long, ByVal crColor As Long) As Long
'VA: 412A79
Private Declare Function GetPixel Lib "gdi32" Alias "GetPixel" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
'VA: 412A15
Private Declare Function GetStretchBltMode Lib "gdi32" Alias "GetStretchBltMode" (ByVal hdc As Long) As Long
'VA: 4129D1
Private Declare Function BitBlt Lib "gdi32" Alias "BitBlt" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
'VA: 412991
Private Declare Function DeleteObject Lib "gdi32" Alias "DeleteObject" (ByVal hObject As Long) As Long
'VA: 412949
Private Declare Function SelectObject Lib "gdi32" Alias "SelectObject" (ByVal hdc As Long, ByVal hObject As Long) As Long
'VA: 412901
Private Declare Function CreateCompatibleBitmap Lib "gdi32" Alias "CreateCompatibleBitmap" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
'VA: 4128B1
Private Declare Function CreateCompatibleDC Lib "gdi32" Alias "CreateCompatibleDC" (ByVal hdc As Long) As Long
'VA: 412855
Private Declare Function CreateBitmapIndirect Lib "gdi32" Alias "CreateBitmapIndirect" (lpBitmap As BITMAP) As Long
'VA: 412805
Private Declare Function DeleteDC Lib "gdi32" Alias "DeleteDC" (ByVal hdc As Long) As Long
'VA: 4127C1
Private Declare Function CreateDC Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, lpInitData As DEVMODE) As Long
'VA: 41277D
Private Declare Function GetObject Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
'VA: 412739
Private Declare Function CreateDIBSection Lib "gdi32" Alias "CreateDIBSection" (ByVal hDC As Long, pBitmapInfo As BITMAPINFO, ByVal un As Long, ByVal lplpVoid As Long, ByVal handle As Long, ByVal dw As Long) As Long
'VA: 4126ED
Private Declare Function CreateDIBitmap Lib "gdi32" Alias "CreateDIBitmap" (ByVal hdc As Long, lpInfoHeader As BITMAPINFOHEADER, ByVal dwUsage As Long, lpInitBits As Any, lpInitInfo As BITMAPINFO, ByVal wUsage As Long) As Long
'VA: 412695
Private Declare Function SetDIBitsToDevice Lib "gdi32" Alias "SetDIBitsToDevice" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal dx As Long, ByVal dy As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Scan As Long, ByVal NumScans As Long, Bits As Any, BitsInfo As BITMAPINFO, ByVal wUsage As Long) As Long
'VA: 412649
Private Declare Function SetDIBits Lib "gdi32" Alias "SetDIBits" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
'VA: 412605
Private Declare Function GetDIBits Lib "gdi32" Alias "GetDIBits" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
'VA: 4125B5
Private Declare Function FreeResource Lib "kernel32" Alias "FreeResource" (ByVal hResData As Long) As Long
'VA: 41256D
Private Declare Function SizeofResource Lib "kernel32" Alias "SizeofResource" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
'VA: 412525
Private Declare Function FindResource Lib "kernel32" Alias "FindResourceA" (ByVal hInstance As Long, ByVal lpName As String, ByVal lpType As String) As Long
'VA: 4124B9
Private Declare Function LockResource Lib "kernel32" Alias "LockResource" (ByVal hResData As Long) As Long
'VA: 412471
Private Declare Function LoadResource Lib "kernel32" Alias "LoadResource" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
'VA: 412429
Private Declare Function FreeLibrary Lib "kernel32" Alias "FreeLibrary" (ByVal hLibModule As Long) As Long
'VA: 4123E5
Private Declare Function LoadLibraryEx Lib "kernel32" Alias "LoadLibraryExA" (ByVal lpLibFileName As String, ByVal hFile As Long, ByVal dwFlags As Long) As Long
'VA: 41239D
Private Declare Function GetFileSize Lib "kernel32" Alias "GetFileSize" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long
'VA: 412359
Private Declare Function SetFilePointer Lib "kernel32" Alias "SetFilePointer" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
'VA: 412325
Private Declare Function WriteFile Lib "kernel32" Alias "WriteFile" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As OVERLAPPED) As Long
'VA: 4122E1
Private Declare Function ReadFile Lib "kernel32" Alias "ReadFile" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As OVERLAPPED) As Long
'VA: 41229D
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As SECURITY_ATTRIBUTES, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
'VA: 411931
Private Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconA" (ByVal hInst As Long, ByVal lpszExeFileName As String, ByVal nIconIndex As Long) As Long
'VA: 4118E9
Private Declare Function DrawIcon Lib "user32" Alias "DrawIcon" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal hIcon As Long) As Long
'VA: 410B99
Private Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
'VA: 410B51
Private Declare Function ReleaseMutex Lib "kernel32" Alias "ReleaseMutex" (ByVal hMutex As Long) As Long
'VA: 410B19
Private Declare Function CreateMutex Lib "kernel32" Alias "CreateMutexA" (lpMutexAttributes As SECURITY_ATTRIBUTES, ByVal bInitialOwner As Long, ByVal lpName As String) As Long
'VA: 410AD1
Private Declare Sub SHGetPathFromIDListA Lib "shell32.dll"()
'VA: 410A81
Private Declare Sub SHGetSpecialFolderLocation Lib "shell32.dll"()
'VA: 410A2D
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'VA: 4109D1
Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'VA: 410985
Private Declare Function GetCurrentTime Lib "kernel32" Alias "GetTickCount" () As Long
'VA: 410919
Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
'VA: 4108CD
Private Declare Function SetFileTime Lib "kernel32" Alias "SetFileTime" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long
'VA: 410889
Private Declare Function GetFileTime Lib "kernel32" Alias "GetFileTime" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long
'VA: 410845
Private Declare Function CloseHandle Lib "kernel32" Alias "CloseHandle" (ByVal hObject As Long) As Long
'VA: 410801
Private Declare Function OpenFile Lib "kernel32" Alias "OpenFile" (ByVal lpFileName As String, lpReOpenBuff As OFSTRUCT, ByVal wStyle As Long) As Long
'VA: 4107BD
Private Declare Sub URLDownloadToFileA Lib "urlmon"()
'VA: 41075D
Private Declare Function MessageBox Lib "user32" Alias "MessageBoxA" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long) As Long
'VA: 410719
Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
'VA: 4106D1
Private Declare Function GetActiveWindow Lib "user32" Alias "GetActiveWindow" () As Long
'VA: 410689
Private Declare Function GetWindowWord Lib "user32" Alias "GetWindowWord" (ByVal hwnd As Long, ByVal nIndex As Long) As Integer
'VA: 410641
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
'VA: 4105F5
Private Declare Sub keybd_event Lib "user32" Alias "keybd_event" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
'VA: 410581
Private Declare Sub GlobalMemoryStatus Lib "kernel32" Alias "GlobalMemoryStatus" (lpBuffer As MEMORYSTATUS)
'VA: 410535
Private Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
'VA: 4104ED
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
'VA: 4104A1
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
'VA: 410451
Private Declare Sub InternetGetConnectedState Lib "wininet.dll"()
'VA: 4103ED
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
'VA: 410201
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
'VA: 4101A9
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
'VA: 410041
Private Declare Sub GetIpAddrTable Lib "IPHlpApi"()

