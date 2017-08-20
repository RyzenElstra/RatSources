VERSION 5.00
Begin VB.Form frmMain
  Caption = "DC"
  ScaleMode = 1
  'Unknown = 0   'False
  Icon = "frmMain.frx":0
  LinkTopic = "Form1"
  ClientLeft = 165
  ClientTop = 450
  ClientWidth = 5280
  ClientHeight = 4440
  BeginProperty Font
    Name = "Tahoma"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 1 'CenterOwner
  Begin VB.Timer tmrKeys
    Interval = 3000
    Left = 4800
    Top = 0
    Width = 49160
    Height = 3
  End
  Begin MSComctlLib.ImageList ImageList2
  End
  Begin MSComctlLib.ImageList ImageList1
  End
  Begin VB.Timer tmrCapture
    Enabled = 0   'False
    Interval = 1000
    Left = 4800
    Top = 0
    Width = 57352
    Height = 1
  End
  Begin MSComctlLib.Toolbar Toolbar1
    Left = 0
    Top = 0
    Width = 5280
    Height = 360
    TabIndex = 3
    Begin VB.ComboBox cbSeconds
      Left = 4005
      Top = 20
      Width = 615
      Height = 315
      Text = "-"
      TabIndex = 6
      List = "frmMain.frx":1272
      ItemData = "frmMain.frx":129F
      ToolTipText = "Seconds between captures"
    End
    Begin VB.ComboBox txtQuality
      Left = 3405
      Top = 20
      Width = 615
      Height = 315
      Text = "70"
      TabIndex = 5
      List = "frmMain.frx":12C4
      ItemData = "frmMain.frx":12EC
      ToolTipText = "Capture quality"
    End
    Begin VB.ComboBox cmbCapType
      Left = 1965
      Top = 20
      Width = 1455
      Height = 315
      Text = "Entire screen"
      TabIndex = 4
      List = "frmMain.frx":130B
      ItemData = "frmMain.frx":1342
      ToolTipText = "Select capture type"
    End
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 4185
    Width = 5280
    Height = 255
    TabIndex = 1
  End
  Begin VB.PictureBox picDisplay
    BackColor = &H808080&
    Picture = "frmMain.frx":1352
    Left = 0
    Top = 360
    Width = 5280
    Height = 3825
    TabIndex = 0
    ScaleMode = 1
    'Unknown = 0   'False
    AutoSize = -1  'True
  End
  Begin MSComctlLib.ProgressBar ProgressBar1
    Left = 240
    Top = 5520
    Width = 2055
    Height = 255
    TabIndex = 2
  End
  Begin MSWinsockLib.Winsock wskCAPTURE
  End
  Begin VB.Menu mnu_righty
    Visible = 0   'False
    Caption = "cap area"
    Begin VB.Menu mnu_areacap
      Caption = "Capture area"
    End
    Begin VB.Menu mnu_saveimage
      Caption = "Save image"
    End
    Begin VB.Menu send_keystrokes
      Caption = "Send Keystrokes"
    End
  End
End

Attribute VB_Name = "frmMain"

'VA: 42D139
Private Declare Sub DrawTextW Lib "user32"()
'VA: 42D0F5
Private Declare Function InflateRect Lib "user32" Alias "InflateRect" (lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
'VA: 42D0B1
Private Declare Function SetBkMode Lib "gdi32" Alias "SetBkMode" (ByVal hdc As Long, ByVal nBkMode As Long) As Long
'VA: 42D06D
Private Declare Sub GradientFill Lib "msimg32"()
'VA: 42CE79
Private Declare Sub DrawDibDraw Lib "msvfw32.dll"()
'VA: 42CE21
Private Declare Sub DrawDibClose Lib "msvfw32.dll"()
'VA: 42CDD9
Private Declare Sub DrawDibOpen Lib "msvfw32.dll"()
'VA: 42CD85
Private Declare Function CreateDIBitmap Lib "gdi32" Alias "CreateDIBitmap" (ByVal hdc As Long, lpInfoHeader As BITMAPINFOHEADER, ByVal dwUsage As Long, lpInitBits As Any, lpInitInfo As BITMAPINFO, ByVal wUsage As Long) As Long
'VA: 42CD3D
Private Declare Function GetDIBits Lib "gdi32" Alias "GetDIBits" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
'VA: 42CCF9
Private Declare Function FormatMessage Lib "kernel32" Alias "FormatMessageA" (ByVal dwFlags As Long, lpSource As Any, ByVal dwMessageId As Long, ByVal dwLanguageId As Long, ByVal lpBuffer As String, ByVal nSize As Long, Arguments As Long) As Long
'VA: 42CCB1
Private Declare Function CloseHandle Lib "kernel32" Alias "CloseHandle" (ByVal hObject As Long) As Long
'VA: 42CC45
Private Declare Function SetFilePointer Lib "kernel32" Alias "SetFilePointer" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
'VA: 42CBFD
Private Declare Function WriteFile Lib "kernel32" Alias "WriteFile" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As OVERLAPPED) As Long
'VA: 42CBB9
Private Declare Function ReadFile Lib "kernel32" Alias "ReadFile" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As OVERLAPPED) As Long
'VA: 42CB75
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As SECURITY_ATTRIBUTES, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
'VA: 42CB31
Private Declare Function GetObject Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
'VA: 42CAED
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal un1 As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal un2 As Long) As Long
'VA: 42CA99
Private Declare Sub AlphaBlend Lib "MSIMG32.dll"()
'VA: 42CA45
Private Declare Function CreateDIBSection Lib "gdi32" Alias "CreateDIBSection" (ByVal hDC As Long, pBitmapInfo As BITMAPINFO, ByVal un As Long, ByVal lplpVoid As Long, ByVal handle As Long, ByVal dw As Long) As Long
'VA: 42C9F9
Private Declare Function GetDesktopWindow Lib "user32" Alias "GetDesktopWindow" () As Long
'VA: 42C9AD
Private Declare Function ReleaseDC Lib "user32" Alias "ReleaseDC" (ByVal hwnd As Long, ByVal hdc As Long) As Long
'VA: 42C969
Private Declare Function GetDC Lib "user32" Alias "GetDC" (ByVal hwnd As Long) As Long
'VA: 42C929
Private Declare Sub VarPtr Lib "msvbvm60.dll"()
'VA: 42BA49
Private Declare Function GetFileAttributes Lib "kernel32" Alias "GetFileAttributesA" (ByVal lpFileName As String) As Long
'VA: 427A49
Private Declare Function DrawFocusRect Lib "user32" Alias "DrawFocusRect" (ByVal hdc As Long, lpRect As RECT) As Long
'VA: 4279DD
Private Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hDC As Long, ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, lpDrawTextParams As DRAWTEXTPARAMS) As Long
'VA: 427999
Private Declare Function WindowFromPoint Lib "user32" Alias "WindowFromPoint" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
'VA: 427951
Private Declare Function SetCapture Lib "user32" Alias "SetCapture" (ByVal hwnd As Long) As Long
'VA: 42790D
Private Declare Sub PlaySoundA Lib "WINMM.DLL"()
'VA: 4278C9
Private Declare Function DrawState Lib "user32" Alias "DrawStateA" (ByVal hDC As Long, ByVal hBrush As Long, ByVal lpDrawStateProc As Long, ByVal lParam As Long, ByVal wParam As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal n3 As Long, ByVal n4 As Long, ByVal un As Long) As Long
'VA: 427885
Private Declare Function RealizePalette Lib "gdi32" Alias "RealizePalette" (ByVal hdc As Long) As Long
'VA: 427821
Private Declare Function SelectPalette Lib "gdi32" Alias "SelectPalette" (ByVal hdc As Long, ByVal hPalette As Long, ByVal bForceBackground As Long) As Long
'VA: 4277D9
Private Declare Function GetTextColor Lib "gdi32" Alias "GetTextColor" (ByVal hdc As Long) As Long
'VA: 427791
Private Declare Function GetBkColor Lib "gdi32" Alias "GetBkColor" (ByVal hdc As Long) As Long
'VA: 42774D
Private Declare Function CreateBitmap Lib "gdi32" Alias "CreateBitmap" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal nPlanes As Long, ByVal nBitCount As Long, lpBits As Any) As Long
'VA: 427705
Private Declare Function SetTextColor Lib "gdi32" Alias "SetTextColor" (ByVal hdc As Long, ByVal crColor As Long) As Long
'VA: 4276BD
Private Declare Function CreateCompatibleBitmap Lib "gdi32" Alias "CreateCompatibleBitmap" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
'VA: 427651
Private Declare Function DeleteDC Lib "gdi32" Alias "DeleteDC" (ByVal hdc As Long) As Long
'VA: 42760D
Private Declare Function CreateCompatibleDC Lib "gdi32" Alias "CreateCompatibleDC" (ByVal hdc As Long) As Long
'VA: 4275C1
Private Declare Function SetBkColor Lib "gdi32" Alias "SetBkColor" (ByVal hdc As Long, ByVal crColor As Long) As Long
'VA: 42757D
Private Declare Function BitBlt Lib "gdi32" Alias "BitBlt" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
'VA: 42753D
Private Declare Function GetStretchBltMode Lib "gdi32" Alias "GetStretchBltMode" (ByVal hdc As Long) As Long
'VA: 4274F9
Private Declare Function SetWindowRgn Lib "user32" Alias "SetWindowRgn" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
'VA: 4274C5
Private Declare Function CombineRgn Lib "gdi32" Alias "CombineRgn" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
'VA: 427481
Private Declare Function CreateRectRgn Lib "gdi32" Alias "CreateRectRgn" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
'VA: 427439
Private Declare Function SetPixelV Lib "gdi32" Alias "SetPixelV" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
'VA: 4273F5
Private Declare Function FrameRect Lib "user32" Alias "FrameRect" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
'VA: 4273B1
Private Declare Function LineTo Lib "gdi32" Alias "LineTo" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
'VA: 427371
Private Declare Function MoveToEx Lib "gdi32" Alias "MoveToEx" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, lpPoint As POINTAPI) As Long
'VA: 42732D
Private Declare Function CreatePen Lib "gdi32" Alias "CreatePen" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
'VA: 425475
Private Declare Sub gethostbyaddr Lib "wsock32"()
'VA: 425421
Private Declare Sub IcmpCreateFile Lib "icmp.dll"()
'VA: 4253C9
Private Declare Sub IcmpCloseHandle Lib "icmp.dll"()
'VA: 425381
Private Declare Sub IcmpSendEcho Lib "icmp.dll"()
'VA: 425329
Private Declare Sub gethostbyname Lib "WSOCK32.DLL"()
'VA: 4252E1
Private Declare Sub gethostname Lib "WSOCK32.DLL"()
'VA: 42529D
Private Declare Sub WSACleanup Lib "WSOCK32.DLL"()
'VA: 425259
Private Declare Sub WSAStartup Lib "WSOCK32.DLL"()
'VA: 4251FD
Private Declare Sub WSAGetLastError Lib "WSOCK32.DLL"()
'VA: 421079
Private Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias " Shell_NotifyIconA" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long
'VA: 420D39
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
'VA: 420CF5
Private Declare Function SetGraphicsMode Lib "gdi32" Alias "SetGraphicsMode" (ByVal hdc As Long, ByVal iMode As Long) As Long
'VA: 420CA9
Private Declare Sub OleTranslateColor Lib "OLEPRO32.DLL"()
'VA: 420C49
Private Declare Function DeleteObject Lib "gdi32" Alias "DeleteObject" (ByVal hObject As Long) As Long
'VA: 420C01
Private Declare Function SelectObject Lib "gdi32" Alias "SelectObject" (ByVal hdc As Long, ByVal hObject As Long) As Long
'VA: 420BB9
Private Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
'VA: 420B6D
Private Declare Function MulDiv Lib "kernel32" Alias "MulDiv" (ByVal nNumber As Long, ByVal nNumerator As Long, ByVal nDenominator As Long) As Long
'VA: 420B2D
Private Declare Function GetDeviceCaps Lib "gdi32" Alias "GetDeviceCaps" (ByVal hdc As Long, ByVal nIndex As Long) As Long
'VA: 420AE5
Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
'VA: 420AA1
Private Declare Function CreateSolidBrush Lib "gdi32" Alias "CreateSolidBrush" (ByVal crColor As Long) As Long
'VA: 420A49
Private Declare Function FillRect Lib "user32" Alias "FillRect" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
'VA: 41F825
Private Declare Sub keybd_event Lib "user32" Alias "keybd_event" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
'VA: 41F7E1
Private Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconA" (ByVal hInst As Long, ByVal lpszExeFileName As String, ByVal nIconIndex As Long) As Long
'VA: 41F799
Private Declare Sub DestroyIcon Lib "user32"()
'VA: 41F755
Private Declare Sub DrawIcon Lib "user32"()
'VA: 41F6F5
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
'VA: 41F6A9
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
'VA: 41EF6D
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
'VA: 41E3C5
Private Declare Function OffsetRect Lib "user32" Alias "OffsetRect" (lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
'VA: 41E381
Private Declare Function SetWindowPos Lib "user32" Alias "SetWindowPos" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
'VA: 41E339
Private Declare Function GetCursorPos Lib "user32" Alias "GetCursorPos" (lpPoint As POINTAPI) As Long
'VA: 41E2F1
Private Declare Function GetWindowRect Lib "user32" Alias "GetWindowRect" (ByVal hwnd As Long, lpRect As RECT) As Long
'VA: 41E27D
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByRef lpvParam As Any, ByVal fuWinIni As Long) As Long
'VA: 41E22D
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
'VA: 41E1E5
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
'VA: 41E19D
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
'VA: 41E155
Private Declare Function MoveWindow Lib "user32" Alias "MoveWindow" (ByVal hwnd As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
'VA: 41E0DD
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
'VA: 41E095
Private Declare Function ReleaseCapture Lib "user32" Alias "ReleaseCapture" () As Long
'VA: 41DD1D
Private Declare Function GetAsyncKeyState Lib "user32" Alias "GetAsyncKeyState" (ByVal vKey As Long) As Integer
'VA: 41DCD1
Private Declare Function SetClassLong Lib "user32" Alias "SetClassLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
'VA: 41DC89
Private Declare Function GetClassLong Lib "user32" Alias "GetClassLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
'VA: 41DC41
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
'VA: 41DBE9
Private Declare Sub sndPlaySoundA Lib "WINMM.DLL"()
'VA: 41DB91
Private Declare Sub MakeSureDirectoryPathExists Lib "imagehlp.dll"()
'VA: 41DB29
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'VA: 41DACD
Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'VA: 41DA81
Private Declare Function IsIconic Lib "user32" Alias "IsIconic" (ByVal hwnd As Long) As Long
'VA: 41D83D
Private Declare Sub CommDlgExtendedError Lib "COMDLG32"()
'VA: 41D7ED
Private Declare Sub PageSetupDlgA Lib "COMDLG32"()
'VA: 41D7A5
Private Declare Sub PrintDlgA Lib "COMDLG32.DLL"()
'VA: 41D761
Private Declare Sub ChooseFontA Lib "COMDLG32"()
'VA: 41D71D
Private Declare Function GetSysColor Lib "user32" Alias "GetSysColor" (ByVal nIndex As Long) As Long
'VA: 41D6E5
Private Declare Sub ChooseColorA Lib "COMDLG32.DLL"()
'VA: 41D689
Private Declare Sub GetFileTitleA Lib "COMDLG32"()
'VA: 41D641
Private Declare Sub GetSaveFileNameA Lib "COMDLG32"()
'VA: 41D5F5
Private Declare Sub GetOpenFileNameA Lib "COMDLG32"()
'VA: 41D599
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
'VA: 41D551
Private Declare Function GlobalUnlock Lib "kernel32" Alias "GlobalUnlock" (ByVal hMem As Long) As Long
'VA: 41D4ED
Private Declare Function GlobalSize Lib "kernel32" Alias "GlobalSize" (ByVal hMem As Long) As Long
'VA: 41D4A9
Private Declare Function GlobalReAlloc Lib "kernel32" Alias "GlobalReAlloc" (ByVal hMem As Long, ByVal dwBytes As Long, ByVal wFlags As Long) As Long
'VA: 41D461
Private Declare Function GlobalLock Lib "kernel32" Alias "GlobalLock" (ByVal hMem As Long) As Long
'VA: 41D41D
Private Declare Function GlobalFree Lib "kernel32" Alias "GlobalFree" (ByVal hMem As Long) As Long
'VA: 41D3D9
Private Declare Function GlobalCompact Lib "kernel32" Alias "GlobalCompact" (ByVal dwMinFree As Long) As Long
'VA: 41D391
Private Declare Function GlobalAlloc Lib "kernel32" Alias "GlobalAlloc" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
'VA: 41D34D
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
'VA: 41BFF5
Private Declare Function GetCurrentTime Lib "kernel32" Alias "GetTickCount" () As Long
'VA: 41BF9D
Private Declare Function IsZoomed Lib "user32" Alias "IsZoomed" (ByVal hwnd As Long) As Long
Private Sub Form__488300
  '00488300: push ebp
  '00488301: mov ebp, esp
  '00488303: sub esp, 00000018h
  '00488306: push 004081B6h
  '0048830B: mov eax, fs:[00h]
  '00488311: push eax
  '00488312: mov fs:[00000000h], esp
  '00488319: mov eax, 00000104h
  '0048831E: call 004081B0h
  '00488323: push ebx
  '00488324: push esi
  '00488325: push edi
  '00488326: mov [ebp-18h], esp
  '00488329: mov [ebp-14h], 00401538h
  '00488330: mov eax, [ebp+08h]
  '00488333: and eax, 00000001h
  '00488336: mov [ebp-10h], eax
  '00488339: mov ecx, [ebp+08h]
  '0048833C: and ecx, FFFFFFFEh
  '0048833F: mov [ebp+08h], ecx
  '00488342: mov [ebp-0Ch], 00000000h
  '00488349: mov edx, [ebp+08h]
  '0048834C: mov eax, [edx]
  '0048834E: mov ecx, [ebp+08h]
  '00488351: push ecx
  '00488352: call [eax+04h]
  '00488355: mov [ebp-04h], 00000001h
  '0048835C: mov [ebp-04h], 00000002h
  '00488363: push FFFFFFFFh
  '00488365: call [004010E8h]
  '0048836B: mov [ebp-04h], 00000003h
  '00488372: cmp [0054238Ch], 00000000h
  '00488379: jnz 488397h
  '0048837B: push 0054238Ch
  '00488380: push 0041D9E0h
  '00488385: call [004012B8h]
  '0048838B: mov [ebp-000000E8h], 0054238Ch
  '00488395: jmp 4883A1h
  '00488397: mov [ebp-000000E8h], 0054238Ch
  '004883A1: mov edx, [ebp-000000E8h]
  '004883A7: mov eax, [edx]
  '004883A9: mov [ebp-0000009Ch], eax
  '004883AF: lea ecx, [ebp-3Ch]
  '004883B2: push ecx
  '004883B3: mov edx, [ebp-0000009Ch]
  '004883B9: mov eax, [edx]
  '004883BB: mov ecx, [ebp-0000009Ch]
  '004883C1: push ecx
  '004883C2: call [eax+14h]
  '004883C5: fclex 
  '004883C7: mov [ebp-000000A0h], eax
  '004883CD: cmp [ebp-000000A0h], 00000000h
  '004883D4: jnl 4883F9h
  '004883D6: push 00000014h
  '004883D8: push 0041D9D0h
  '004883DD: mov edx, [ebp-0000009Ch]
  '004883E3: push edx
  '004883E4: mov eax, [ebp-000000A0h]
  '004883EA: push eax
  '004883EB: call [004010A0h]
  '004883F1: mov [ebp-000000ECh], eax
  '004883F7: jmp 488403h
  '004883F9: mov [ebp-000000ECh], 00000000h
  '00488403: mov ecx, [ebp-3Ch]
  '00488406: mov [ebp-000000A4h], ecx
  '0048840C: lea edx, [ebp-24h]
  '0048840F: push edx
  '00488410: mov eax, [ebp-000000A4h]
  '00488416: mov ecx, [eax]
  '00488418: mov edx, [ebp-000000A4h]
  '0048841E: push edx
  '0048841F: call [ecx+50h]
  '00488422: fclex 
  '00488424: mov [ebp-000000A8h], eax
  '0048842A: cmp [ebp-000000A8h], 00000000h
  '00488431: jnl 488456h
  '00488433: push 00000050h
  '00488435: push 0041D9F0h
  '0048843A: mov eax, [ebp-000000A4h]
  '00488440: push eax
  '00488441: mov ecx, [ebp-000000A8h]
  '00488447: push ecx
  '00488448: call [004010A0h]
  '0048844E: mov [ebp-000000F0h], eax
  '00488454: jmp 488460h
  '00488456: mov [ebp-000000F0h], 00000000h
  '00488460: push 00000001h
  '00488462: mov edx, [ebp-24h]
  '00488465: push edx
  '00488466: call [00401380h]
  '0048846C: mov edx, eax
  '0048846E: lea ecx, [ebp-38h]
  '00488471: call [00401378h]
  '00488477: cmp [0054238Ch], 00000000h
  '0048847E: jnz 48849Ch
  '00488480: push 0054238Ch
  '00488485: push 0041D9E0h
  '0048848A: call [004012B8h]
  '00488490: mov [ebp-000000F4h], 0054238Ch
  '0048849A: jmp 4884A6h
  '0048849C: mov [ebp-000000F4h], 0054238Ch
  '004884A6: mov eax, [ebp-000000F4h]
  '004884AC: mov ecx, [eax]
  '004884AE: mov [ebp-000000ACh], ecx
  '004884B4: lea edx, [ebp-40h]
  '004884B7: push edx
  '004884B8: mov eax, [ebp-000000ACh]
  '004884BE: mov ecx, [eax]
  '004884C0: mov edx, [ebp-000000ACh]
  '004884C6: push edx
  '004884C7: call [ecx+14h]
  '004884CA: fclex 
  '004884CC: mov [ebp-000000B0h], eax
  '004884D2: cmp [ebp-000000B0h], 00000000h
  '004884D9: jnl 4884FEh
  '004884DB: push 00000014h
  '004884DD: push 0041D9D0h
  '004884E2: mov eax, [ebp-000000ACh]
  '004884E8: push eax
  '004884E9: mov ecx, [ebp-000000B0h]
  '004884EF: push ecx
  '004884F0: call [004010A0h]
  '004884F6: mov [ebp-000000F8h], eax
  '004884FC: jmp 488508h
  '004884FE: mov [ebp-000000F8h], 00000000h
  '00488508: mov edx, [ebp-40h]
  '0048850B: mov [ebp-000000B4h], edx
  '00488511: lea eax, [ebp-2Ch]
  '00488514: push eax
  '00488515: mov ecx, [ebp-000000B4h]
  '0048851B: mov edx, [ecx]
  '0048851D: mov eax, [ebp-000000B4h]
  '00488523: push eax
  '00488524: call [edx+50h]
  '00488527: fclex 
  '00488529: mov [ebp-000000B8h], eax
  '0048852F: cmp [ebp-000000B8h], 00000000h
  '00488536: jnl 48855Bh
  '00488538: push 00000050h
  '0048853A: push 0041D9F0h
  '0048853F: mov ecx, [ebp-000000B4h]
  '00488545: push ecx
  '00488546: mov edx, [ebp-000000B8h]
  '0048854C: push edx
  '0048854D: call [004010A0h]
  '00488553: mov [ebp-000000FCh], eax
  '00488559: jmp 488565h
  '0048855B: mov [ebp-000000FCh], 00000000h
  '00488565: cmp [0054238Ch], 00000000h
  '0048856C: jnz 48858Ah
  '0048856E: push 0054238Ch
  '00488573: push 0041D9E0h
  '00488578: call [004012B8h]
  '0048857E: mov [ebp-00000100h], 0054238Ch
  '00488588: jmp 488594h
  '0048858A: mov [ebp-00000100h], 0054238Ch
  '00488594: mov eax, [ebp-00000100h]
  '0048859A: mov ecx, [eax]
  '0048859C: mov [ebp-000000BCh], ecx
  '004885A2: lea edx, [ebp-44h]
  '004885A5: push edx
  '004885A6: mov eax, [ebp-000000BCh]
  '004885AC: mov ecx, [eax]
  '004885AE: mov edx, [ebp-000000BCh]
  '004885B4: push edx
  '004885B5: call [ecx+14h]
  '004885B8: fclex 
  '004885BA: mov [ebp-000000C0h], eax
  '004885C0: cmp [ebp-000000C0h], 00000000h
  '004885C7: jnl 4885ECh
  '004885C9: push 00000014h
  '004885CB: push 0041D9D0h
  '004885D0: mov eax, [ebp-000000BCh]
  '004885D6: push eax
  '004885D7: mov ecx, [ebp-000000C0h]
  '004885DD: push ecx
  '004885DE: call [004010A0h]
  '004885E4: mov [ebp-00000104h], eax
  '004885EA: jmp 4885F6h
  '004885EC: mov [ebp-00000104h], 00000000h
  '004885F6: mov edx, [ebp-44h]
  '004885F9: mov [ebp-000000C4h], edx
  '004885FF: lea eax, [ebp-30h]
  '00488602: push eax
  '00488603: mov ecx, [ebp-000000C4h]
  '00488609: mov edx, [ecx]
  '0048860B: mov eax, [ebp-000000C4h]
  '00488611: push eax
  '00488612: call [edx+50h]
  '00488615: fclex 
  '00488617: mov [ebp-000000C8h], eax
  '0048861D: cmp [ebp-000000C8h], 00000000h
  '00488624: jnl 488649h
  '00488626: push 00000050h
  '00488628: push 0041D9F0h
  '0048862D: mov ecx, [ebp-000000C4h]
  '00488633: push ecx
  '00488634: mov edx, [ebp-000000C8h]
  '0048863A: push edx
  '0048863B: call [004010A0h]
  '00488641: mov [ebp-00000108h], eax
  '00488647: jmp 488653h
  '00488649: mov [ebp-00000108h], 00000000h
  '00488653: mov eax, [ebp-30h]
  '00488656: mov [ebp-000000E0h], eax
  '0048865C: mov [ebp-30h], 00000000h
  '00488663: mov ecx, [ebp-000000E0h]
  '00488669: mov [ebp-5Ch], ecx
  '0048866C: mov [ebp-64h], 00000008h
  '00488673: mov edx, [ebp-2Ch]
  '00488676: push edx
  '00488677: push 0041DE34h
  '0048867C: call [0040108Ch]
  '00488682: mov [ebp-4Ch], eax
  '00488685: mov [ebp-54h], 00000008h
  '0048868C: mov eax, [ebp-38h]
  '0048868F: mov [ebp-000000E4h], eax
  '00488695: mov [ebp-38h], 00000000h
  '0048869C: mov edx, [ebp-000000E4h]
  '004886A2: lea ecx, [ebp-28h]
  '004886A5: call [00401378h]
  '004886AB: push eax
  '004886AC: push 0041DE34h
  '004886B1: call [00401184h]
  '004886B7: neg eax
  '004886B9: sbb eax, eax
  '004886BB: neg eax
  '004886BD: neg eax
  '004886BF: mov [ebp-7Ch], ax
  '004886C3: mov [ebp-00000084h], 0000000Bh
  '004886CD: lea ecx, [ebp-64h]
  '004886D0: push ecx
  '004886D1: lea edx, [ebp-54h]
  '004886D4: push edx
  '004886D5: lea eax, [ebp-00000084h]
  '004886DB: push eax
  '004886DC: lea ecx, [ebp-74h]
  '004886DF: push ecx
  '004886E0: call [004012DCh]
  '004886E6: lea edx, [ebp-74h]
  '004886E9: push edx
  '004886EA: call [0040103Ch]
  '004886F0: mov edx, eax
  '004886F2: lea ecx, [ebp-34h]
  '004886F5: call [00401378h]
  '004886FB: mov edx, eax
  '004886FD: mov ecx, [ebp+08h]
  '00488700: add ecx, 0000005Ch
  '00488703: call [004012D8h]
  '00488709: lea eax, [ebp-38h]
  '0048870C: push eax
  '0048870D: lea ecx, [ebp-34h]
  '00488710: push ecx
  '00488711: lea edx, [ebp-2Ch]
  '00488714: push edx
  '00488715: lea eax, [ebp-28h]
  '00488718: push eax
  '00488719: lea ecx, [ebp-24h]
  '0048871C: push ecx
  '0048871D: push 00000005h
  '0048871F: call [004012E8h]
  '00488725: add esp, 00000018h
  '00488728: lea edx, [ebp-44h]
  '0048872B: push edx
  '0048872C: lea eax, [ebp-40h]
  '0048872F: push eax
  '00488730: lea ecx, [ebp-3Ch]
  '00488733: push ecx
  '00488734: push 00000003h
  '00488736: call [00401064h]
  '0048873C: add esp, 00000010h
  '0048873F: lea edx, [ebp-74h]
  '00488742: push edx
  '00488743: lea eax, [ebp-64h]
  '00488746: push eax
  '00488747: lea ecx, [ebp-54h]
  '0048874A: push ecx
  '0048874B: lea edx, [ebp-00000084h]
  '00488751: push edx
  '00488752: push 00000004h
  '00488754: call [00401050h]
  '0048875A: add esp, 00000014h
  '0048875D: mov [ebp-04h], 00000004h
  '00488764: cmp [0054106Ch], 00000000h
  '0048876B: jnz 488789h
  '0048876D: push 0054106Ch
  '00488772: push 00411238h
  '00488777: call [004012B8h]
  '0048877D: mov [ebp-0000010Ch], 0054106Ch
  '00488787: jmp 488793h
  '00488789: mov [ebp-0000010Ch], 0054106Ch
  '00488793: mov eax, [ebp-0000010Ch]
  '00488799: mov ecx, [eax]
  '0048879B: mov edx, [ebp-0000010Ch]
  '004887A1: mov eax, [edx]
  '004887A3: mov edx, [eax]
  '004887A5: push ecx
  '004887A6: call [edx+00000328h]
  '004887AC: push eax
  '004887AD: lea eax, [ebp-3Ch]
  '004887B0: push eax
  '004887B1: call [004010E4h]
  '004887B7: mov [ebp-0000009Ch], eax
  '004887BD: lea ecx, [ebp-00000088h]
  '004887C3: push ecx
  '004887C4: mov edx, [ebp-0000009Ch]
  '004887CA: mov eax, [edx]
  '004887CC: mov ecx, [ebp-0000009Ch]
  '004887D2: push ecx
  '004887D3: call [eax+000000E0h]
  '004887D9: fclex 
  '004887DB: mov [ebp-000000A0h], eax
  '004887E1: cmp [ebp-000000A0h], 00000000h
  '004887E8: jnl 488810h
  '004887EA: push 000000E0h
  '004887EF: push 0041E108h
  '004887F4: mov edx, [ebp-0000009Ch]
  '004887FA: push edx
  '004887FB: mov eax, [ebp-000000A0h]
  '00488801: push eax
  '00488802: call [004010A0h]
  '00488808: mov [ebp-00000110h], eax
  '0048880E: jmp 48881Ah
  '00488810: mov [ebp-00000110h], 00000000h
  '0048881A: xor ecx, ecx
  '0048881C: cmp word ptr [ebp-00000088h], 0001h
  '00488824: setz cl
  '00488827: neg ecx
  '00488829: mov [ebp-000000A4h], cx
  '00488830: lea ecx, [ebp-3Ch]
  '00488833: call [004013B8h]
  '00488839: movsx edx, word ptr [ebp-000000A4h]
  '00488840: test edx, edx
  '00488842: jz 488876h
  '00488844: mov [ebp-04h], 00000005h
  '0048884B: push 00000000h
  '0048884D: push 0041E3ECh
  '00488852: mov eax, [ebp+08h]
  '00488855: push eax
  '00488856: call [0040137Ch]
  '0048885C: push eax
  '0048885D: lea ecx, [ebp-3Ch]
  '00488860: push ecx
  '00488861: call [004010E4h]
  '00488867: push eax
  '00488868: call 004F8E60h
  '0048886D: lea ecx, [ebp-3Ch]
  '00488870: call [004013B8h]
  '00488876: mov [ebp-04h], 00000007h
  '0048887D: mov edx, [ebp+08h]
  '00488880: mov word ptr [edx+66h], FFFFh
  '00488886: mov [ebp-04h], 00000008h
  '0048888D: mov eax, [ebp+08h]
  '00488890: mov word ptr [eax+4Ch], 0000h
  '00488896: mov [ebp-04h], 00000009h
  '0048889D: mov ecx, [ebp+08h]
  '004888A0: mov edx, [ecx]
  '004888A2: mov eax, [ebp+08h]
  '004888A5: push eax
  '004888A6: call [edx+0000074Ch]
  '004888AC: mov [ebp-04h], 0000000Ah
  '004888B3: lea ecx, [ebp-24h]
  '004888B6: push ecx
  '004888B7: mov edx, [ebp+08h]
  '004888BA: mov eax, [edx]
  '004888BC: mov ecx, [ebp+08h]
  '004888BF: push ecx
  '004888C0: call [eax+000001C0h]
  '004888C6: fclex 
  '004888C8: mov [ebp-0000009Ch], eax
  '004888CE: cmp [ebp-0000009Ch], 00000000h
  '004888D5: jnl 4888FAh
  '004888D7: push 000001C0h
  '004888DC: push 0041BC88h
  '004888E1: mov edx, [ebp+08h]
  '004888E4: push edx
  '004888E5: mov eax, [ebp-0000009Ch]
  '004888EB: push eax
  '004888EC: call [004010A0h]
  '004888F2: mov [ebp-00000114h], eax
  '004888F8: jmp 488904h
  '004888FA: mov [ebp-00000114h], 00000000h
  '00488904: mov [ebp-4Ch], 80020004h
  '0048890B: mov [ebp-54h], 0000000Ah
  '00488912: lea ecx, [ebp-54h]
  '00488915: push ecx
  '00488916: push 00000004h
  '00488918: mov edx, [ebp-24h]
  '0048891B: push edx
  '0048891C: call [00401148h]
  '00488922: mov edx, eax
  '00488924: lea ecx, [ebp-28h]
  '00488927: call [00401378h]
  '0048892D: push eax
  '0048892E: call [004013BCh]
  '00488934: fstp real8 ptr [ebp-00000098h]
  '0048893A: cmp [00541024h], 00000000h
  '00488941: jnz 48895Fh
  '00488943: push 00541024h
  '00488948: push 00413334h
  '0048894D: call [004012B8h]
  '00488953: mov [ebp-00000118h], 00541024h
  '0048895D: jmp 488969h
  '0048895F: mov [ebp-00000118h], 00541024h
  '00488969: mov eax, [ebp-00000118h]
  '0048896F: mov ecx, [eax]
  '00488971: mov [ebp-000000A0h], ecx
  '00488977: mov word ptr [ebp-0000008Ch], FFFFh
  '00488980: fld real8 ptr [ebp-00000098h]
  '00488986: call [00401348h]
  '0048898C: mov [ebp-00000088h], ax
  '00488993: lea edx, [ebp-0000008Ch]
  '00488999: push edx
  '0048899A: lea eax, [ebp-00000088h]
  '004889A0: push eax
  '004889A1: mov ecx, [ebp-000000A0h]
  '004889A7: mov edx, [ecx]
  '004889A9: mov eax, [ebp-000000A0h]
  '004889AF: push eax
  '004889B0: call [edx+000007A4h]
  '004889B6: fclex 
  '004889B8: mov [ebp-000000A4h], eax
  '004889BE: cmp [ebp-000000A4h], 00000000h
  '004889C5: jnl 4889EDh
  '004889C7: push 000007A4h
  '004889CC: push 0041C118h
  '004889D1: mov ecx, [ebp-000000A0h]
  '004889D7: push ecx
  '004889D8: mov edx, [ebp-000000A4h]
  '004889DE: push edx
  '004889DF: call [004010A0h]
  '004889E5: mov [ebp-0000011Ch], eax
  '004889EB: jmp 4889F7h
  '004889ED: mov [ebp-0000011Ch], 00000000h
  '004889F7: lea eax, [ebp-28h]
  '004889FA: push eax
  '004889FB: lea ecx, [ebp-24h]
  '004889FE: push ecx
  '004889FF: push 00000002h
  '00488A01: call [004012E8h]
  '00488A07: add esp, 0000000Ch
  '00488A0A: lea ecx, [ebp-54h]
  '00488A0D: call [00401030h]
  '00488A13: mov [ebp-04h], 0000000Bh
  '00488A1A: call [00401104h]
  '00488A20: mov [ebp-04h], 0000000Ch
  '00488A27: cmp [0054106Ch], 00000000h
  '00488A2E: jnz 488A4Ch
  '00488A30: push 0054106Ch
  '00488A35: push 00411238h
  '00488A3A: call [004012B8h]
  '00488A40: mov [ebp-00000120h], 0054106Ch
  '00488A4A: jmp 488A56h
  '00488A4C: mov [ebp-00000120h], 0054106Ch
  '00488A56: mov edx, [ebp-00000120h]
  '00488A5C: mov eax, [edx]
  '00488A5E: mov ecx, [ebp-00000120h]
  '00488A64: mov edx, [ecx]
  '00488A66: mov ecx, [edx]
  '00488A68: push eax
  '00488A69: call [ecx+000003A8h]
  '00488A6F: push eax
  '00488A70: lea edx, [ebp-3Ch]
  '00488A73: push edx
  '00488A74: call [004010E4h]
  '00488A7A: mov [ebp-0000009Ch], eax
  '00488A80: lea eax, [ebp-00000088h]
  '00488A86: push eax
  '00488A87: mov ecx, [ebp-0000009Ch]
  '00488A8D: mov edx, [ecx]
  '00488A8F: mov eax, [ebp-0000009Ch]
  '00488A95: push eax
  '00488A96: call [edx+000000E0h]
  '00488A9C: fclex 
  '00488A9E: mov [ebp-000000A0h], eax
  '00488AA4: cmp [ebp-000000A0h], 00000000h
  '00488AAB: jnl 488AD3h
  '00488AAD: push 000000E0h
  '00488AB2: push 0041E108h
  '00488AB7: mov ecx, [ebp-0000009Ch]
  '00488ABD: push ecx
  '00488ABE: mov edx, [ebp-000000A0h]
  '00488AC4: push edx
  '00488AC5: call [004010A0h]
  '00488ACB: mov [ebp-00000124h], eax
  '00488AD1: jmp 488ADDh
  '00488AD3: mov [ebp-00000124h], 00000000h
  '00488ADD: movsx eax, word ptr [ebp-00000088h]
  '00488AE4: mov [ebp-00000090h], eax
  '00488AEA: lea ecx, [ebp-00000090h]
  '00488AF0: push ecx
  '00488AF1: mov edx, [ebp+08h]
  '00488AF4: mov eax, [edx]
  '00488AF6: mov ecx, [ebp+08h]
  '00488AF9: push ecx
  '00488AFA: call [eax+00000718h]
  '00488B00: lea ecx, [ebp-3Ch]
  '00488B03: call [004013B8h]
  '00488B09: mov [ebp-10h], 00000000h
  '00488B10: wait 
  '00488B11: push 00488B6Bh
  '00488B16: jmp 488B6Ah
  '00488B18: lea edx, [ebp-38h]
  '00488B1B: push edx
  '00488B1C: lea eax, [ebp-34h]
  '00488B1F: push eax
  '00488B20: lea ecx, [ebp-30h]
  '00488B23: push ecx
  '00488B24: lea edx, [ebp-2Ch]
  '00488B27: push edx
  '00488B28: lea eax, [ebp-28h]
  '00488B2B: push eax
  '00488B2C: lea ecx, [ebp-24h]
  '00488B2F: push ecx
  '00488B30: push 00000006h
  '00488B32: call [004012E8h]
  '00488B38: add esp, 0000001Ch
  '00488B3B: lea edx, [ebp-44h]
  '00488B3E: push edx
  '00488B3F: lea eax, [ebp-40h]
  '00488B42: push eax
  '00488B43: lea ecx, [ebp-3Ch]
  '00488B46: push ecx
  '00488B47: push 00000003h
  '00488B49: call [00401064h]
  '00488B4F: add esp, 00000010h
  '00488B52: lea edx, [ebp-74h]
  '00488B55: push edx
  '00488B56: lea eax, [ebp-64h]
  '00488B59: push eax
  '00488B5A: lea ecx, [ebp-54h]
  '00488B5D: push ecx
  '00488B5E: push 00000003h
  '00488B60: call [00401050h]
  '00488B66: add esp, 00000010h
  '00488B69: ret 
End Sub
Private Sub Form__48B2C0
  '0048B2C0: push ebp
  '0048B2C1: mov ebp, esp
  '0048B2C3: sub esp, 00000018h
  '0048B2C6: push 004081B6h
  '0048B2CB: mov eax, fs:[00h]
  '0048B2D1: push eax
  '0048B2D2: mov fs:[00000000h], esp
  '0048B2D9: mov eax, 0000007Ch
  '0048B2DE: call 004081B0h
  '0048B2E3: push ebx
  '0048B2E4: push esi
  '0048B2E5: push edi
  '0048B2E6: mov [ebp-18h], esp
  '0048B2E9: mov [ebp-14h], 00401848h
  '0048B2F0: mov eax, [ebp+08h]
  '0048B2F3: and eax, 00000001h
  '0048B2F6: mov [ebp-10h], eax
  '0048B2F9: mov ecx, [ebp+08h]
  '0048B2FC: and ecx, FFFFFFFEh
  '0048B2FF: mov [ebp+08h], ecx
  '0048B302: mov [ebp-0Ch], 00000000h
  '0048B309: mov edx, [ebp+08h]
  '0048B30C: mov eax, [edx]
  '0048B30E: mov ecx, [ebp+08h]
  '0048B311: push ecx
  '0048B312: call [eax+04h]
  '0048B315: mov [ebp-04h], 00000001h
  '0048B31C: mov [ebp-04h], 00000002h
  '0048B323: push FFFFFFFFh
  '0048B325: call [004010E8h]
  '0048B32B: mov [ebp-04h], 00000003h
  '0048B332: lea edx, [ebp-58h]
  '0048B335: push edx
  '0048B336: mov eax, [ebp+08h]
  '0048B339: mov ecx, [eax]
  '0048B33B: mov edx, [ebp+08h]
  '0048B33E: push edx
  '0048B33F: call [ecx+00000080h]
  '0048B345: fclex 
  '0048B347: mov [ebp-60h], eax
  '0048B34A: cmp [ebp-60h], 00000000h
  '0048B34E: jnl 48B370h
  '0048B350: push 00000080h
  '0048B355: push 0041BC88h
  '0048B35A: mov eax, [ebp+08h]
  '0048B35D: push eax
  '0048B35E: mov ecx, [ebp-60h]
  '0048B361: push ecx
  '0048B362: call [004010A0h]
  '0048B368: mov [ebp-00000084h], eax
  '0048B36E: jmp 48B37Ah
  '0048B370: mov [ebp-00000084h], 00000000h
  '0048B37A: fld real4 ptr [ebp-58h]
  '0048B37D: fcomp real4 ptr [00401898h]
  '0048B383: fstsw ax
  '0048B385: test ah, 01h
  '0048B388: jz 48B3DAh
  '0048B38A: mov [ebp-04h], 00000004h
  '0048B391: push 44610000h
  '0048B396: mov edx, [ebp+08h]
  '0048B399: mov eax, [edx]
  '0048B39B: mov ecx, [ebp+08h]
  '0048B39E: push ecx
  '0048B39F: call [eax+00000084h]
  '0048B3A5: fclex 
  '0048B3A7: mov [ebp-60h], eax
  '0048B3AA: cmp [ebp-60h], 00000000h
  '0048B3AE: jnl 48B3D0h
  '0048B3B0: push 00000084h
  '0048B3B5: push 0041BC88h
  '0048B3BA: mov edx, [ebp+08h]
  '0048B3BD: push edx
  '0048B3BE: mov eax, [ebp-60h]
  '0048B3C1: push eax
  '0048B3C2: call [004010A0h]
  '0048B3C8: mov [ebp-00000088h], eax
  '0048B3CE: jmp 48B3DAh
  '0048B3D0: mov [ebp-00000088h], 00000000h
  '0048B3DA: mov [ebp-04h], 00000006h
  '0048B3E1: lea ecx, [ebp-58h]
  '0048B3E4: push ecx
  '0048B3E5: mov edx, [ebp+08h]
  '0048B3E8: mov eax, [edx]
  '0048B3EA: mov ecx, [ebp+08h]
  '0048B3ED: push ecx
  '0048B3EE: call [eax+00000088h]
  '0048B3F4: fclex 
  '0048B3F6: mov [ebp-60h], eax
  '0048B3F9: cmp [ebp-60h], 00000000h
  '0048B3FD: jnl 48B41Fh
  '0048B3FF: push 00000088h
  '0048B404: push 0041BC88h
  '0048B409: mov edx, [ebp+08h]
  '0048B40C: push edx
  '0048B40D: mov eax, [ebp-60h]
  '0048B410: push eax
  '0048B411: call [004010A0h]
  '0048B417: mov [ebp-0000008Ch], eax
  '0048B41D: jmp 48B429h
  '0048B41F: mov [ebp-0000008Ch], 00000000h
  '0048B429: fld real4 ptr [ebp-58h]
  '0048B42C: fcomp real4 ptr [00401894h]
  '0048B432: fstsw ax
  '0048B434: test ah, 01h
  '0048B437: jz 48B489h
  '0048B439: mov [ebp-04h], 00000007h
  '0048B440: push 44D48000h
  '0048B445: mov ecx, [ebp+08h]
  '0048B448: mov edx, [ecx]
  '0048B44A: mov eax, [ebp+08h]
  '0048B44D: push eax
  '0048B44E: call [edx+0000008Ch]
  '0048B454: fclex 
  '0048B456: mov [ebp-60h], eax
  '0048B459: cmp [ebp-60h], 00000000h
  '0048B45D: jnl 48B47Fh
  '0048B45F: push 0000008Ch
  '0048B464: push 0041BC88h
  '0048B469: mov ecx, [ebp+08h]
  '0048B46C: push ecx
  '0048B46D: mov edx, [ebp-60h]
  '0048B470: push edx
  '0048B471: call [004010A0h]
  '0048B477: mov [ebp-00000090h], eax
  '0048B47D: jmp 48B489h
  '0048B47F: mov [ebp-00000090h], 00000000h
  '0048B489: mov [ebp-04h], 00000009h
  '0048B490: lea eax, [ebp-58h]
  '0048B493: push eax
  '0048B494: mov ecx, [ebp+08h]
  '0048B497: mov edx, [ecx]
  '0048B499: mov eax, [ebp+08h]
  '0048B49C: push eax
  '0048B49D: call [edx+00000100h]
  '0048B4A3: fclex 
  '0048B4A5: mov [ebp-60h], eax
  '0048B4A8: cmp [ebp-60h], 00000000h
  '0048B4AC: jnl 48B4CEh
  '0048B4AE: push 00000100h
  '0048B4B3: push 0041BC88h
  '0048B4B8: mov ecx, [ebp+08h]
  '0048B4BB: push ecx
  '0048B4BC: mov edx, [ebp-60h]
  '0048B4BF: push edx
  '0048B4C0: call [004010A0h]
  '0048B4C6: mov [ebp-00000094h], eax
  '0048B4CC: jmp 48B4D8h
  '0048B4CE: mov [ebp-00000094h], 00000000h
  '0048B4D8: mov eax, [ebp+08h]
  '0048B4DB: mov ecx, [eax]
  '0048B4DD: mov edx, [ebp+08h]
  '0048B4E0: push edx
  '0048B4E1: call [ecx+00000310h]
  '0048B4E7: push eax
  '0048B4E8: lea eax, [ebp-24h]
  '0048B4EB: push eax
  '0048B4EC: call [004010E4h]
  '0048B4F2: mov [ebp-68h], eax
  '0048B4F5: lea ecx, [ebp-5Ch]
  '0048B4F8: push ecx
  '0048B4F9: mov edx, [ebp+08h]
  '0048B4FC: mov eax, [edx]
  '0048B4FE: mov ecx, [ebp+08h]
  '0048B501: push ecx
  '0048B502: call [eax+00000108h]
  '0048B508: fclex 
  '0048B50A: mov [ebp-64h], eax
  '0048B50D: cmp [ebp-64h], 00000000h
  '0048B511: jnl 48B533h
  '0048B513: push 00000108h
  '0048B518: push 0041BC88h
  '0048B51D: mov edx, [ebp+08h]
  '0048B520: push edx
  '0048B521: mov eax, [ebp-64h]
  '0048B524: push eax
  '0048B525: call [004010A0h]
  '0048B52B: mov [ebp-00000098h], eax
  '0048B531: jmp 48B53Dh
  '0048B533: mov [ebp-00000098h], 00000000h
  '0048B53D: fld real4 ptr [ebp-5Ch]
  '0048B540: fsub real4 ptr [00401890h]
  '0048B546: fstp real4 ptr [ebp-4Ch]
  '0048B549: fstsw ax
  '0048B54B: test al, 0Dh
  '0048B54D: jnz 0048B669h
  '0048B553: mov [ebp-54h], 00000004h
  '0048B55A: mov ecx, [ebp-58h]
  '0048B55D: mov [ebp-3Ch], ecx
  '0048B560: mov [ebp-44h], 00000004h
  '0048B567: mov [ebp-2Ch], 00000172h
  '0048B56E: mov [ebp-34h], 00000002h
  '0048B575: mov eax, 00000010h
  '0048B57A: call 004081B0h
  '0048B57F: mov edx, esp
  '0048B581: mov eax, [ebp-54h]
  '0048B584: mov [edx], eax
  '0048B586: mov ecx, [ebp-50h]
  '0048B589: mov [edx+04h], ecx
  '0048B58C: mov eax, [ebp-4Ch]
  '0048B58F: mov [edx+08h], eax
  '0048B592: mov ecx, [ebp-48h]
  '0048B595: mov [edx+0Ch], ecx
  '0048B598: mov eax, 00000010h
  '0048B59D: call 004081B0h
  '0048B5A2: mov edx, esp
  '0048B5A4: mov eax, [ebp-44h]
  '0048B5A7: mov [edx], eax
  '0048B5A9: mov ecx, [ebp-40h]
  '0048B5AC: mov [edx+04h], ecx
  '0048B5AF: mov eax, [ebp-3Ch]
  '0048B5B2: mov [edx+08h], eax
  '0048B5B5: mov ecx, [ebp-38h]
  '0048B5B8: mov [edx+0Ch], ecx
  '0048B5BB: mov eax, 00000010h
  '0048B5C0: call 004081B0h
  '0048B5C5: mov edx, esp
  '0048B5C7: mov eax, [ebp-34h]
  '0048B5CA: mov [edx], eax
  '0048B5CC: mov ecx, [ebp-30h]
  '0048B5CF: mov [edx+04h], ecx
  '0048B5D2: mov eax, [ebp-2Ch]
  '0048B5D5: mov [edx+08h], eax
  '0048B5D8: mov ecx, [ebp-28h]
  '0048B5DB: mov [edx+0Ch], ecx
  '0048B5DE: push 00000000h
  '0048B5E0: mov edx, [ebp-68h]
  '0048B5E3: mov eax, [edx]
  '0048B5E5: mov ecx, [ebp-68h]
  '0048B5E8: push ecx
  '0048B5E9: call [eax+00000268h]
  '0048B5EF: fclex 
  '0048B5F1: mov [ebp-6Ch], eax
  '0048B5F4: cmp [ebp-6Ch], 00000000h
  '0048B5F8: jnl 48B61Ah
  '0048B5FA: push 00000268h
  '0048B5FF: push 0041C058h
  '0048B604: mov edx, [ebp-68h]
  '0048B607: push edx
  '0048B608: mov eax, [ebp-6Ch]
  '0048B60B: push eax
  '0048B60C: call [004010A0h]
  '0048B612: mov [ebp-0000009Ch], eax
  '0048B618: jmp 48B624h
  '0048B61A: mov [ebp-0000009Ch], 00000000h
  '0048B624: lea ecx, [ebp-24h]
  '0048B627: call [004013B8h]
  '0048B62D: mov [ebp-10h], 00000000h
  '0048B634: wait 
  '0048B635: push 0048B647h
  '0048B63A: jmp 48B646h
  '0048B63C: lea ecx, [ebp-24h]
  '0048B63F: call [004013B8h]
  '0048B645: ret 
End Sub
Private Sub Form__48B000
  '0048B000: push ebp
  '0048B001: mov ebp, esp
  '0048B003: sub esp, 0000000Ch
  '0048B006: push 004081B6h
  '0048B00B: mov eax, fs:[00h]
  '0048B011: push eax
  '0048B012: mov fs:[00000000h], esp
  '0048B019: sub esp, 00000050h
  '0048B01C: push ebx
  '0048B01D: push esi
  '0048B01E: push edi
  '0048B01F: mov [ebp-0Ch], esp
  '0048B022: mov [ebp-08h], 00401810h
  '0048B029: mov edi, [ebp+08h]
  '0048B02C: mov eax, edi
  '0048B02E: and eax, 00000001h
  '0048B031: mov [ebp-04h], eax
  '0048B034: and edi, FFFFFFFEh
  '0048B037: push edi
  '0048B038: mov [ebp+08h], edi
  '0048B03B: mov ecx, [edi]
  '0048B03D: call [ecx+04h]
  '0048B040: mov edx, [edi]
  '0048B042: xor ebx, ebx
  '0048B044: push ebx
  '0048B045: push 00000008h
  '0048B047: push edi
  '0048B048: mov [ebp-18h], ebx
  '0048B04B: mov [ebp-1Ch], ebx
  '0048B04E: mov [ebp-20h], ebx
  '0048B051: mov [ebp-30h], ebx
  '0048B054: mov [ebp-44h], ebx
  '0048B057: mov [ebp-48h], ebx
  '0048B05A: call [edx+00000338h]
  '0048B060: push eax
  '0048B061: lea eax, [ebp-20h]
  '0048B064: push eax
  '0048B065: call [004010E4h]
  '0048B06B: lea ecx, [ebp-30h]
  '0048B06E: push eax
  '0048B06F: push ecx
  '0048B070: call [004011E4h]
  '0048B076: add esp, 00000010h
  '0048B079: push eax
  '0048B07A: call [00401284h]
  '0048B080: mov si, ax
  '0048B083: lea ecx, [ebp-20h]
  '0048B086: neg si
  '0048B089: sbb esi, esi
  '0048B08B: neg esi
  '0048B08D: neg esi
  '0048B08F: call [004013B8h]
  '0048B095: lea ecx, [ebp-30h]
  '0048B098: call [00401030h]
  '0048B09E: cmp si, bx
  '0048B0A1: jz 48B0CDh
  '0048B0A3: mov edx, [edi]
  '0048B0A5: push ebx
  '0048B0A6: push 00000046h
  '0048B0A8: push edi
  '0048B0A9: call [edx+00000338h]
  '0048B0AF: push eax
  '0048B0B0: lea eax, [ebp-20h]
  '0048B0B3: push eax
  '0048B0B4: call [004010E4h]
  '0048B0BA: push eax
  '0048B0BB: call [00401040h]
  '0048B0C1: add esp, 0000000Ch
  '0048B0C4: lea ecx, [ebp-20h]
  '0048B0C7: call [004013B8h]
  '0048B0CD: mov ecx, [edi]
  '0048B0CF: lea edx, [ebp-18h]
  '0048B0D2: push edx
  '0048B0D3: push edi
  '0048B0D4: call [ecx+000001C0h]
  '0048B0DA: cmp eax, ebx
  '0048B0DC: fclex 
  '0048B0DE: jnl 48B0F2h
  '0048B0E0: push 000001C0h
  '0048B0E5: push 0041BC88h
  '0048B0EA: push edi
  '0048B0EB: push eax
  '0048B0EC: call [004010A0h]
  '0048B0F2: mov ecx, [ebp-18h]
  '0048B0F5: lea eax, [ebp-30h]
  '0048B0F8: push eax
  '0048B0F9: push 00000004h
  '0048B0FB: push ecx
  '0048B0FC: mov [ebp-28h], 80020004h
  '0048B103: mov [ebp-30h], 0000000Ah
  '0048B10A: call [00401148h]
  '0048B110: mov edx, eax
  '0048B112: lea ecx, [ebp-1Ch]
  '0048B115: call [00401378h]
  '0048B11B: push eax
  '0048B11C: call [004013BCh]
  '0048B122: mov eax, [541024h]
  '0048B127: fstp real8 ptr [ebp-50h]
  '0048B12A: cmp eax, ebx
  '0048B12C: jnz 48B13Eh
  '0048B12E: push 00541024h
  '0048B133: push 00413334h
  '0048B138: call [004012B8h]
  '0048B13E: fld real8 ptr [ebp-50h]
  '0048B141: mov esi, [00541024h]
  '0048B147: mov [ebp-48h], ebx
  '0048B14A: call [00401348h]
  '0048B150: mov [ebp-44h], eax
  '0048B153: mov edx, [esi]
  '0048B155: lea eax, [ebp-48h]
  '0048B158: lea ecx, [ebp-44h]
  '0048B15B: push eax
  '0048B15C: push ecx
  '0048B15D: push esi
  '0048B15E: call [edx+000007A4h]
  '0048B164: cmp eax, ebx
  '0048B166: fclex 
  '0048B168: jnl 48B17Ch
  '0048B16A: push 000007A4h
  '0048B16F: push 0041C118h
  '0048B174: push esi
  '0048B175: push eax
  '0048B176: call [004010A0h]
  '0048B17C: lea edx, [ebp-1Ch]
  '0048B17F: lea eax, [ebp-18h]
  '0048B182: push edx
  '0048B183: push eax
  '0048B184: push 00000002h
  '0048B186: call [004012E8h]
  '0048B18C: add esp, 0000000Ch
  '0048B18F: lea ecx, [ebp-30h]
  '0048B192: call [00401030h]
  '0048B198: mov ecx, [edi]
  '0048B19A: push edi
  '0048B19B: call [ecx+00000750h]
  '0048B1A1: mov [ebp-04h], ebx
  '0048B1A4: wait 
  '0048B1A5: push 0048B1D3h
  '0048B1AA: jmp 48B1D2h
  '0048B1AC: lea edx, [ebp-1Ch]
  '0048B1AF: lea eax, [ebp-18h]
  '0048B1B2: push edx
  '0048B1B3: push eax
  '0048B1B4: push 00000002h
  '0048B1B6: call [004012E8h]
  '0048B1BC: add esp, 0000000Ch
  '0048B1BF: lea ecx, [ebp-20h]
  '0048B1C2: call [004013B8h]
  '0048B1C8: lea ecx, [ebp-30h]
  '0048B1CB: call [00401030h]
  '0048B1D1: ret 
End Sub
Private Sub Form__486710
  '00486710: push ebp
  '00486711: mov ebp, esp
  '00486713: sub esp, 0000000Ch
  '00486716: push 004081B6h
  '0048671B: mov eax, fs:[00h]
  '00486721: push eax
  '00486722: mov fs:[00000000h], esp
  '00486729: sub esp, 00000060h
  '0048672C: push ebx
  '0048672D: push esi
  '0048672E: push edi
  '0048672F: mov [ebp-0Ch], esp
  '00486732: mov [ebp-08h], 004013C8h
  '00486739: mov esi, [ebp+08h]
  '0048673C: mov eax, esi
  '0048673E: and eax, 00000001h
  '00486741: mov [ebp-04h], eax
  '00486744: and esi, FFFFFFFEh
  '00486747: push esi
  '00486748: mov [ebp+08h], esi
  '0048674B: mov ecx, [esi]
  '0048674D: call [ecx+04h]
  '00486750: mov edx, [esi]
  '00486752: xor ebx, ebx
  '00486754: push 0041C038h
  '00486759: push ebx
  '0048675A: push 00000003h
  '0048675C: push esi
  '0048675D: mov [ebp-18h], ebx
  '00486760: mov [ebp-1Ch], ebx
  '00486763: mov [ebp-20h], ebx
  '00486766: mov [ebp-24h], ebx
  '00486769: mov [ebp-34h], ebx
  '0048676C: mov [ebp-44h], ebx
  '0048676F: mov [ebp-54h], ebx
  '00486772: mov [ebp-58h], ebx
  '00486775: call [edx+0000032Ch]
  '0048677B: mov edi, [004010E4h]
  '00486781: push eax
  '00486782: lea eax, [ebp-1Ch]
  '00486785: push eax
  '00486786: call edi
  '00486788: lea ecx, [ebp-34h]
  '0048678B: push eax
  '0048678C: push ecx
  '0048678D: call [004011E4h]
  '00486793: add esp, 00000010h
  '00486796: push eax
  '00486797: call [004011C8h]
  '0048679D: lea edx, [ebp-20h]
  '004867A0: push eax
  '004867A1: push edx
  '004867A2: call edi
  '004867A4: mov edi, eax
  '004867A6: lea ecx, [ebp-24h]
  '004867A9: lea edx, [ebp-44h]
  '004867AC: mov [ebp-3Ch], 00000005h
  '004867B3: mov [ebp-44h], 00000002h
  '004867BA: mov eax, [edi]
  '004867BC: push ecx
  '004867BD: push edx
  '004867BE: push edi
  '004867BF: call [eax+24h]
  '004867C2: cmp eax, ebx
  '004867C4: fclex 
  '004867C6: jnl 4867D7h
  '004867C8: push 00000024h
  '004867CA: push 0041C038h
  '004867CF: push edi
  '004867D0: push eax
  '004867D1: call [004010A0h]
  '004867D7: mov eax, [ebp-24h]
  '004867DA: lea edx, [ebp-58h]
  '004867DD: push edx
  '004867DE: push eax
  '004867DF: mov ecx, [eax]
  '004867E1: mov edi, eax
  '004867E3: call [ecx+7Ch]
  '004867E6: cmp eax, ebx
  '004867E8: fclex 
  '004867EA: jnl 4867FBh
  '004867EC: push 0000007Ch
  '004867EE: push 0041C048h
  '004867F3: push edi
  '004867F4: push eax
  '004867F5: call [004010A0h]
  '004867FB: mov ecx, [ebp-58h]
  '004867FE: xor eax, eax
  '00486800: cmp ecx, 00000001h
  '00486803: lea ecx, [ebp-24h]
  '00486806: setz al
  '00486809: neg eax
  '0048680B: mov edi, eax
  '0048680D: lea edx, [ebp-20h]
  '00486810: push ecx
  '00486811: lea eax, [ebp-1Ch]
  '00486814: push edx
  '00486815: push eax
  '00486816: push 00000003h
  '00486818: call [00401064h]
  '0048681E: lea ecx, [ebp-44h]
  '00486821: lea edx, [ebp-34h]
  '00486824: push ecx
  '00486825: push edx
  '00486826: push 00000002h
  '00486828: call [00401050h]
  '0048682E: add esp, 0000001Ch
  '00486831: cmp di, bx
  '00486834: jz 4868A1h
  '00486836: mov ecx, [ebp+0Ch]
  '00486839: mov eax, [esi+68h]
  '0048683C: add esi, 00000068h
  '0048683F: mov [ebp-4Ch], eax
  '00486842: movsx edx, word ptr [ecx]
  '00486845: lea eax, [ebp-34h]
  '00486848: push edx
  '00486849: push eax
  '0048684A: mov [ebp-54h], 00000008h
  '00486851: call [00401254h]
  '00486857: lea ecx, [ebp-54h]
  '0048685A: lea edx, [ebp-34h]
  '0048685D: push ecx
  '0048685E: lea eax, [ebp-44h]
  '00486861: push edx
  '00486862: push eax
  '00486863: call [00401274h]
  '00486869: push eax
  '0048686A: call [0040103Ch]
  '00486870: mov edx, eax
  '00486872: lea ecx, [ebp-18h]
  '00486875: call [00401378h]
  '0048687B: mov edx, eax
  '0048687D: mov ecx, esi
  '0048687F: call [004012D8h]
  '00486885: lea ecx, [ebp-18h]
  '00486888: call [004013B4h]
  '0048688E: lea ecx, [ebp-44h]
  '00486891: lea edx, [ebp-34h]
  '00486894: push ecx
  '00486895: push edx
  '00486896: push 00000002h
  '00486898: call [00401050h]
  '0048689E: add esp, 0000000Ch
  '004868A1: mov [ebp-04h], ebx
  '004868A4: push 004868DDh
  '004868A9: jmp 4868DCh
  '004868AB: lea ecx, [ebp-18h]
  '004868AE: call [004013B4h]
  '004868B4: lea eax, [ebp-24h]
  '004868B7: lea ecx, [ebp-20h]
  '004868BA: push eax
  '004868BB: lea edx, [ebp-1Ch]
  '004868BE: push ecx
  '004868BF: push edx
  '004868C0: push 00000003h
  '004868C2: call [00401064h]
  '004868C8: lea eax, [ebp-44h]
  '004868CB: lea ecx, [ebp-34h]
  '004868CE: push eax
  '004868CF: push ecx
  '004868D0: push 00000002h
  '004868D2: call [00401050h]
  '004868D8: add esp, 0000001Ch
  '004868DB: ret 
End Sub
Private Sub Toolbar1__489BA0
  '00489BA0: push ebp
  '00489BA1: mov ebp, esp
  '00489BA3: sub esp, 00000018h
  '00489BA6: push 004081B6h
  '00489BAB: mov eax, fs:[00h]
  '00489BB1: push eax
  '00489BB2: mov fs:[00000000h], esp
  '00489BB9: mov eax, 000000DCh
  '00489BBE: call 004081B0h
  '00489BC3: push ebx
  '00489BC4: push esi
  '00489BC5: push edi
  '00489BC6: mov [ebp-18h], esp
  '00489BC9: mov [ebp-14h], 00401698h
  '00489BD0: mov eax, [ebp+08h]
  '00489BD3: and eax, 00000001h
  '00489BD6: mov [ebp-10h], eax
  '00489BD9: mov ecx, [ebp+08h]
  '00489BDC: and ecx, FFFFFFFEh
  '00489BDF: mov [ebp+08h], ecx
  '00489BE2: mov [ebp-0Ch], 00000000h
  '00489BE9: mov edx, [ebp+08h]
  '00489BEC: mov eax, [edx]
  '00489BEE: mov ecx, [ebp+08h]
  '00489BF1: push ecx
  '00489BF2: call [eax+04h]
  '00489BF5: mov [ebp-04h], 00000001h
  '00489BFC: mov edx, [ebp+0Ch]
  '00489BFF: push edx
  '00489C00: lea eax, [ebp-24h]
  '00489C03: push eax
  '00489C04: call [004010F8h]
  '00489C0A: mov [ebp-04h], 00000002h
  '00489C11: push FFFFFFFFh
  '00489C13: call [004010E8h]
  '00489C19: mov [ebp-04h], 00000003h
  '00489C20: lea ecx, [ebp-68h]
  '00489C23: push ecx
  '00489C24: mov edx, [ebp-24h]
  '00489C27: mov eax, [edx]
  '00489C29: mov ecx, [ebp-24h]
  '00489C2C: push ecx
  '00489C2D: call [eax+3Ch]
  '00489C30: fclex 
  '00489C32: mov [ebp-78h], eax
  '00489C35: cmp [ebp-78h], 00000000h
  '00489C39: jnl 489C58h
  '00489C3B: push 0000003Ch
  '00489C3D: push 0041C048h
  '00489C42: mov edx, [ebp-24h]
  '00489C45: push edx
  '00489C46: mov eax, [ebp-78h]
  '00489C49: push eax
  '00489C4A: call [004010A0h]
  '00489C50: mov [ebp-000000A4h], eax
  '00489C56: jmp 489C62h
  '00489C58: mov [ebp-000000A4h], 00000000h
  '00489C62: cmp word ptr [ebp-68h], 0001h
  '00489C67: jnz 0048A08Ch
  '00489C6D: mov [ebp-04h], 00000004h
  '00489C74: mov ecx, [ebp+08h]
  '00489C77: mov edx, [ecx]
  '00489C79: mov eax, [ebp+08h]
  '00489C7C: push eax
  '00489C7D: call [edx+00000304h]
  '00489C83: push eax
  '00489C84: lea ecx, [ebp-2Ch]
  '00489C87: push ecx
  '00489C88: call [004010E4h]
  '00489C8E: mov [ebp-78h], eax
  '00489C91: lea edx, [ebp-28h]
  '00489C94: push edx
  '00489C95: mov eax, [ebp-78h]
  '00489C98: mov ecx, [eax]
  '00489C9A: mov edx, [ebp-78h]
  '00489C9D: push edx
  '00489C9E: call [ecx+000000A8h]
  '00489CA4: fclex 
  '00489CA6: mov [ebp-7Ch], eax
  '00489CA9: cmp [ebp-7Ch], 00000000h
  '00489CAD: jnl 489CCFh
  '00489CAF: push 000000A8h
  '00489CB4: push 0041C0C4h
  '00489CB9: mov eax, [ebp-78h]
  '00489CBC: push eax
  '00489CBD: mov ecx, [ebp-7Ch]
  '00489CC0: push ecx
  '00489CC1: call [004010A0h]
  '00489CC7: mov [ebp-000000A8h], eax
  '00489CCD: jmp 489CD9h
  '00489CCF: mov [ebp-000000A8h], 00000000h
  '00489CD9: mov edx, [ebp-28h]
  '00489CDC: push edx
  '00489CDD: push 0041E5C8h
  '00489CE2: call [00401184h]
  '00489CE8: neg eax
  '00489CEA: sbb eax, eax
  '00489CEC: inc eax
  '00489CED: neg eax
  '00489CEF: mov [ebp-80h], ax
  '00489CF3: lea ecx, [ebp-28h]
  '00489CF6: call [004013B4h]
  '00489CFC: lea ecx, [ebp-2Ch]
  '00489CFF: call [004013B8h]
  '00489D05: movsx eax, word ptr [ebp-80h]
  '00489D09: test eax, eax
  '00489D0B: jz 489D75h
  '00489D0D: mov [ebp-04h], 00000005h
  '00489D14: mov ecx, [ebp+08h]
  '00489D17: mov edx, [ecx]
  '00489D19: mov eax, [ebp+08h]
  '00489D1C: push eax
  '00489D1D: call [edx+00000748h]
  '00489D23: mov [ebp-04h], 00000006h
  '00489D2A: push 00000000h
  '00489D2C: mov ecx, [ebp-24h]
  '00489D2F: mov edx, [ecx]
  '00489D31: mov eax, [ebp-24h]
  '00489D34: push eax
  '00489D35: call [edx+00000080h]
  '00489D3B: fclex 
  '00489D3D: mov [ebp-78h], eax
  '00489D40: cmp [ebp-78h], 00000000h
  '00489D44: jnl 489D66h
  '00489D46: push 00000080h
  '00489D4B: push 0041C048h
  '00489D50: mov ecx, [ebp-24h]
  '00489D53: push ecx
  '00489D54: mov edx, [ebp-78h]
  '00489D57: push edx
  '00489D58: call [004010A0h]
  '00489D5E: mov [ebp-000000ACh], eax
  '00489D64: jmp 489D70h
  '00489D66: mov [ebp-000000ACh], 00000000h
  '00489D70: jmp 0048A087h
  '00489D75: mov [ebp-04h], 00000007h
  '00489D7C: mov eax, [ebp+08h]
  '00489D7F: mov ecx, [eax]
  '00489D81: mov edx, [ebp+08h]
  '00489D84: push edx
  '00489D85: call [ecx+00000304h]
  '00489D8B: push eax
  '00489D8C: lea eax, [ebp-2Ch]
  '00489D8F: push eax
  '00489D90: call [004010E4h]
  '00489D96: mov [ebp-78h], eax
  '00489D99: lea ecx, [ebp-28h]
  '00489D9C: push ecx
  '00489D9D: mov edx, [ebp-78h]
  '00489DA0: mov eax, [edx]
  '00489DA2: mov ecx, [ebp-78h]
  '00489DA5: push ecx
  '00489DA6: call [eax+000000A8h]
  '00489DAC: fclex 
  '00489DAE: mov [ebp-7Ch], eax
  '00489DB1: cmp [ebp-7Ch], 00000000h
  '00489DB5: jnl 489DD7h
  '00489DB7: push 000000A8h
  '00489DBC: push 0041C0C4h
  '00489DC1: mov edx, [ebp-78h]
  '00489DC4: push edx
  '00489DC5: mov eax, [ebp-7Ch]
  '00489DC8: push eax
  '00489DC9: call [004010A0h]
  '00489DCF: mov [ebp-000000B0h], eax
  '00489DD5: jmp 489DE1h
  '00489DD7: mov [ebp-000000B0h], 00000000h
  '00489DE1: mov ecx, [ebp+08h]
  '00489DE4: mov edx, [ecx]
  '00489DE6: mov eax, [ebp+08h]
  '00489DE9: push eax
  '00489DEA: call [edx+00000300h]
  '00489DF0: push eax
  '00489DF1: lea ecx, [ebp-30h]
  '00489DF4: push ecx
  '00489DF5: call [004010E4h]
  '00489DFB: mov [ebp-80h], eax
  '00489DFE: lea edx, [ebp-68h]
  '00489E01: push edx
  '00489E02: mov eax, [ebp-80h]
  '00489E05: mov ecx, [eax]
  '00489E07: mov edx, [ebp-80h]
  '00489E0A: push edx
  '00489E0B: call [ecx+58h]
  '00489E0E: fclex 
  '00489E10: mov [ebp-00000084h], eax
  '00489E16: cmp [ebp-00000084h], 00000000h
  '00489E1D: jnl 489E3Fh
  '00489E1F: push 00000058h
  '00489E21: push 0041E5CCh
  '00489E26: mov eax, [ebp-80h]
  '00489E29: push eax
  '00489E2A: mov ecx, [ebp-00000084h]
  '00489E30: push ecx
  '00489E31: call [004010A0h]
  '00489E37: mov [ebp-000000B4h], eax
  '00489E3D: jmp 489E49h
  '00489E3F: mov [ebp-000000B4h], 00000000h
  '00489E49: mov edx, [ebp-28h]
  '00489E4C: push edx
  '00489E4D: push 0041E5C8h
  '00489E52: call [00401184h]
  '00489E58: neg eax
  '00489E5A: sbb eax, eax
  '00489E5C: neg eax
  '00489E5E: neg eax
  '00489E60: xor ecx, ecx
  '00489E62: cmp word ptr [ebp-68h], 0000h
  '00489E67: setz cl
  '00489E6A: neg ecx
  '00489E6C: and ax, cx
  '00489E6F: mov [ebp-00000088h], ax
  '00489E76: lea ecx, [ebp-28h]
  '00489E79: call [004013B4h]
  '00489E7F: lea edx, [ebp-30h]
  '00489E82: push edx
  '00489E83: lea eax, [ebp-2Ch]
  '00489E86: push eax
  '00489E87: push 00000002h
  '00489E89: call [00401064h]
  '00489E8F: add esp, 0000000Ch
  '00489E92: movsx ecx, word ptr [ebp-00000088h]
  '00489E99: test ecx, ecx
  '00489E9B: jz 00489F24h
  '00489EA1: mov [ebp-04h], 00000008h
  '00489EA8: mov edx, [ebp+08h]
  '00489EAB: mov [edx+48h], 00000001h
  '00489EB2: mov [ebp-04h], 00000009h
  '00489EB9: mov eax, [ebp+08h]
  '00489EBC: mov ecx, [eax]
  '00489EBE: mov edx, [ebp+08h]
  '00489EC1: push edx
  '00489EC2: call [ecx+00000300h]
  '00489EC8: push eax
  '00489EC9: lea eax, [ebp-2Ch]
  '00489ECC: push eax
  '00489ECD: call [004010E4h]
  '00489ED3: mov [ebp-78h], eax
  '00489ED6: push FFFFFFFFh
  '00489ED8: mov ecx, [ebp-78h]
  '00489EDB: mov edx, [ecx]
  '00489EDD: mov eax, [ebp-78h]
  '00489EE0: push eax
  '00489EE1: call [edx+5Ch]
  '00489EE4: fclex 
  '00489EE6: mov [ebp-7Ch], eax
  '00489EE9: cmp [ebp-7Ch], 00000000h
  '00489EED: jnl 489F0Ch
  '00489EEF: push 0000005Ch
  '00489EF1: push 0041E5CCh
  '00489EF6: mov ecx, [ebp-78h]
  '00489EF9: push ecx
  '00489EFA: mov edx, [ebp-7Ch]
  '00489EFD: push edx
  '00489EFE: call [004010A0h]
  '00489F04: mov [ebp-000000B8h], eax
  '00489F0A: jmp 489F16h
  '00489F0C: mov [ebp-000000B8h], 00000000h
  '00489F16: lea ecx, [ebp-2Ch]
  '00489F19: call [004013B8h]
  '00489F1F: jmp 0048A087h
  '00489F24: mov [ebp-04h], 0000000Ah
  '00489F2B: mov eax, [ebp+08h]
  '00489F2E: mov ecx, [eax]
  '00489F30: mov edx, [ebp+08h]
  '00489F33: push edx
  '00489F34: call [ecx+00000300h]
  '00489F3A: push eax
  '00489F3B: lea eax, [ebp-2Ch]
  '00489F3E: push eax
  '00489F3F: call [004010E4h]
  '00489F45: mov [ebp-78h], eax
  '00489F48: lea ecx, [ebp-68h]
  '00489F4B: push ecx
  '00489F4C: mov edx, [ebp-78h]
  '00489F4F: mov eax, [edx]
  '00489F51: mov ecx, [ebp-78h]
  '00489F54: push ecx
  '00489F55: call [eax+58h]
  '00489F58: fclex 
  '00489F5A: mov [ebp-7Ch], eax
  '00489F5D: cmp [ebp-7Ch], 00000000h
  '00489F61: jnl 489F80h
  '00489F63: push 00000058h
  '00489F65: push 0041E5CCh
  '00489F6A: mov edx, [ebp-78h]
  '00489F6D: push edx
  '00489F6E: mov eax, [ebp-7Ch]
  '00489F71: push eax
  '00489F72: call [004010A0h]
  '00489F78: mov [ebp-000000BCh], eax
  '00489F7E: jmp 489F8Ah
  '00489F80: mov [ebp-000000BCh], 00000000h
  '00489F8A: xor ecx, ecx
  '00489F8C: cmp word ptr [ebp-68h], FFFFh
  '00489F91: setz cl
  '00489F94: neg ecx
  '00489F96: mov [ebp-80h], cx
  '00489F9A: lea ecx, [ebp-2Ch]
  '00489F9D: call [004013B8h]
  '00489FA3: movsx edx, word ptr [ebp-80h]
  '00489FA7: test edx, edx
  '00489FA9: jz 0048A087h
  '00489FAF: mov [ebp-04h], 0000000Bh
  '00489FB6: push 00000000h
  '00489FB8: mov eax, [ebp-24h]
  '00489FBB: mov ecx, [eax]
  '00489FBD: mov edx, [ebp-24h]
  '00489FC0: push edx
  '00489FC1: call [ecx+00000080h]
  '00489FC7: fclex 
  '00489FC9: mov [ebp-78h], eax
  '00489FCC: cmp [ebp-78h], 00000000h
  '00489FD0: jnl 489FF2h
  '00489FD2: push 00000080h
  '00489FD7: push 0041C048h
  '00489FDC: mov eax, [ebp-24h]
  '00489FDF: push eax
  '00489FE0: mov ecx, [ebp-78h]
  '00489FE3: push ecx
  '00489FE4: call [004010A0h]
  '00489FEA: mov [ebp-000000C0h], eax
  '00489FF0: jmp 489FFCh
  '00489FF2: mov [ebp-000000C0h], 00000000h
  '00489FFC: mov [ebp-04h], 0000000Ch
  '0048A003: mov edx, [ebp+08h]
  '0048A006: mov [edx+48h], 0000000Ah
  '0048A00D: mov [ebp-04h], 0000000Dh
  '0048A014: call [00401104h]
  '0048A01A: mov [ebp-04h], 0000000Eh
  '0048A021: mov eax, [ebp+08h]
  '0048A024: mov ecx, [eax]
  '0048A026: mov edx, [ebp+08h]
  '0048A029: push edx
  '0048A02A: call [ecx+00000300h]
  '0048A030: push eax
  '0048A031: lea eax, [ebp-2Ch]
  '0048A034: push eax
  '0048A035: call [004010E4h]
  '0048A03B: mov [ebp-78h], eax
  '0048A03E: push 00000000h
  '0048A040: mov ecx, [ebp-78h]
  '0048A043: mov edx, [ecx]
  '0048A045: mov eax, [ebp-78h]
  '0048A048: push eax
  '0048A049: call [edx+5Ch]
  '0048A04C: fclex 
  '0048A04E: mov [ebp-7Ch], eax
  '0048A051: cmp [ebp-7Ch], 00000000h
  '0048A055: jnl 48A074h
  '0048A057: push 0000005Ch
  '0048A059: push 0041E5CCh
  '0048A05E: mov ecx, [ebp-78h]
  '0048A061: push ecx
  '0048A062: mov edx, [ebp-7Ch]
  '0048A065: push edx
  '0048A066: call [004010A0h]
  '0048A06C: mov [ebp-000000C4h], eax
  '0048A072: jmp 48A07Eh
  '0048A074: mov [ebp-000000C4h], 00000000h
  '0048A07E: lea ecx, [ebp-2Ch]
  '0048A081: call [004013B8h]
  '0048A087: jmp 0048A799h
  '0048A08C: mov [ebp-04h], 00000010h
  '0048A093: lea eax, [ebp-68h]
  '0048A096: push eax
  '0048A097: mov ecx, [ebp-24h]
  '0048A09A: mov edx, [ecx]
  '0048A09C: mov eax, [ebp-24h]
  '0048A09F: push eax
  '0048A0A0: call [edx+3Ch]
  '0048A0A3: fclex 
  '0048A0A5: mov [ebp-78h], eax
  '0048A0A8: cmp [ebp-78h], 00000000h
  '0048A0AC: jnl 48A0CBh
  '0048A0AE: push 0000003Ch
  '0048A0B0: push 0041C048h
  '0048A0B5: mov ecx, [ebp-24h]
  '0048A0B8: push ecx
  '0048A0B9: mov edx, [ebp-78h]
  '0048A0BC: push edx
  '0048A0BD: call [004010A0h]
  '0048A0C3: mov [ebp-000000C8h], eax
  '0048A0C9: jmp 48A0D5h
  '0048A0CB: mov [ebp-000000C8h], 00000000h
  '0048A0D5: cmp word ptr [ebp-68h], 0003h
  '0048A0DA: jnz 0048A2D1h
  '0048A0E0: mov [ebp-04h], 00000011h
  '0048A0E7: push FFFFFFFFh
  '0048A0E9: call [004010E8h]
  '0048A0EF: mov [ebp-04h], 00000012h
  '0048A0F6: mov eax, [ebp+08h]
  '0048A0F9: push eax
  '0048A0FA: lea ecx, [ebp-0000008Ch]
  '0048A100: push ecx
  '0048A101: call [004010F8h]
  '0048A107: mov [ebp-04h], 00000013h
  '0048A10E: lea edx, [ebp-70h]
  '0048A111: push edx
  '0048A112: mov eax, [ebp-0000008Ch]
  '0048A118: mov ecx, [eax]
  '0048A11A: mov edx, [ebp-0000008Ch]
  '0048A120: push edx
  '0048A121: call [ecx+00000088h]
  '0048A127: fclex 
  '0048A129: mov [ebp-78h], eax
  '0048A12C: cmp [ebp-78h], 00000000h
  '0048A130: jnl 48A155h
  '0048A132: push 00000088h
  '0048A137: push 0041BC88h
  '0048A13C: mov eax, [ebp-0000008Ch]
  '0048A142: push eax
  '0048A143: mov ecx, [ebp-78h]
  '0048A146: push ecx
  '0048A147: call [004010A0h]
  '0048A14D: mov [ebp-000000CCh], eax
  '0048A153: jmp 48A15Fh
  '0048A155: mov [ebp-000000CCh], 00000000h
  '0048A15F: lea edx, [ebp-74h]
  '0048A162: push edx
  '0048A163: mov eax, [ebp-0000008Ch]
  '0048A169: mov ecx, [eax]
  '0048A16B: mov edx, [ebp-0000008Ch]
  '0048A171: push edx
  '0048A172: call [ecx+00000108h]
  '0048A178: fclex 
  '0048A17A: mov [ebp-7Ch], eax
  '0048A17D: cmp [ebp-7Ch], 00000000h
  '0048A181: jnl 48A1A6h
  '0048A183: push 00000108h
  '0048A188: push 0041BC88h
  '0048A18D: mov eax, [ebp-0000008Ch]
  '0048A193: push eax
  '0048A194: mov ecx, [ebp-7Ch]
  '0048A197: push ecx
  '0048A198: call [004010A0h]
  '0048A19E: mov [ebp-000000D0h], eax
  '0048A1A4: jmp 48A1B0h
  '0048A1A6: mov [ebp-000000D0h], 00000000h
  '0048A1B0: lea edx, [ebp-6Ch]
  '0048A1B3: push edx
  '0048A1B4: mov eax, [ebp-0000008Ch]
  '0048A1BA: mov ecx, [eax]
  '0048A1BC: mov edx, [ebp-0000008Ch]
  '0048A1C2: push edx
  '0048A1C3: call [ecx+00000100h]
  '0048A1C9: fclex 
  '0048A1CB: mov [ebp-80h], eax
  '0048A1CE: cmp [ebp-80h], 00000000h
  '0048A1D2: jnl 48A1F7h
  '0048A1D4: push 00000100h
  '0048A1D9: push 0041BC88h
  '0048A1DE: mov eax, [ebp-0000008Ch]
  '0048A1E4: push eax
  '0048A1E5: mov ecx, [ebp-80h]
  '0048A1E8: push ecx
  '0048A1E9: call [004010A0h]
  '0048A1EF: mov [ebp-000000D4h], eax
  '0048A1F5: jmp 48A201h
  '0048A1F7: mov [ebp-000000D4h], 00000000h
  '0048A201: fld real4 ptr [ebp-6Ch]
  '0048A204: fld real8 ptr [00401758h]
  '0048A20A: cmp [00541000h], 00000000h
  '0048A211: jnz 48A21Bh
  '0048A213: fdiv real8 ptr [00401750h]
  '0048A219: jmp 48A22Ch
  '0048A21B: push [00401754h]
  '0048A221: push [00401750h]
  '0048A227: call 004081D4h
  '0048A22C: fmulp st(1), st(0)
  '0048A22E: fld real4 ptr [ebp-70h]
  '0048A231: fsub real4 ptr [ebp-74h]
  '0048A234: fstsw ax
  '0048A236: test al, 0Dh
  '0048A238: jnz 0048A814h
  '0048A23E: faddp st(1), st(0)
  '0048A240: fadd real8 ptr [00401748h]
  '0048A246: fstsw ax
  '0048A248: test al, 0Dh
  '0048A24A: jnz 0048A814h
  '0048A250: fstp real4 ptr [ebp-000000D8h]
  '0048A256: fld real4 ptr [ebp-000000D8h]
  '0048A25C: push ecx
  '0048A25D: fstp real4 ptr [esp]
  '0048A260: mov edx, [ebp-0000008Ch]
  '0048A266: mov eax, [edx]
  '0048A268: mov ecx, [ebp-0000008Ch]
  '0048A26E: push ecx
  '0048A26F: call [eax+0000008Ch]
  '0048A275: fclex 
  '0048A277: mov [ebp-00000084h], eax
  '0048A27D: cmp [ebp-00000084h], 00000000h
  '0048A284: jnl 48A2ACh
  '0048A286: push 0000008Ch
  '0048A28B: push 0041BC88h
  '0048A290: mov edx, [ebp-0000008Ch]
  '0048A296: push edx
  '0048A297: mov eax, [ebp-00000084h]
  '0048A29D: push eax
  '0048A29E: call [004010A0h]
  '0048A2A4: mov [ebp-000000DCh], eax
  '0048A2AA: jmp 48A2B6h
  '0048A2AC: mov [ebp-000000DCh], 00000000h
  '0048A2B6: mov [ebp-04h], 00000014h
  '0048A2BD: push 00000000h
  '0048A2BF: lea ecx, [ebp-0000008Ch]
  '0048A2C5: push ecx
  '0048A2C6: call [004010F8h]
  '0048A2CC: jmp 0048A799h
  '0048A2D1: mov [ebp-04h], 00000015h
  '0048A2D8: lea edx, [ebp-68h]
  '0048A2DB: push edx
  '0048A2DC: mov eax, [ebp-24h]
  '0048A2DF: mov ecx, [eax]
  '0048A2E1: mov edx, [ebp-24h]
  '0048A2E4: push edx
  '0048A2E5: call [ecx+3Ch]
  '0048A2E8: fclex 
  '0048A2EA: mov [ebp-78h], eax
  '0048A2ED: cmp [ebp-78h], 00000000h
  '0048A2F1: jnl 48A310h
  '0048A2F3: push 0000003Ch
  '0048A2F5: push 0041C048h
  '0048A2FA: mov eax, [ebp-24h]
  '0048A2FD: push eax
  '0048A2FE: mov ecx, [ebp-78h]
  '0048A301: push ecx
  '0048A302: call [004010A0h]
  '0048A308: mov [ebp-000000E0h], eax
  '0048A30E: jmp 48A31Ah
  '0048A310: mov [ebp-000000E0h], 00000000h
  '0048A31A: cmp word ptr [ebp-68h], 0004h
  '0048A31F: jnz 0048A4C7h
  '0048A325: mov [ebp-04h], 00000016h
  '0048A32C: push 0041C038h
  '0048A331: push 00000000h
  '0048A333: push 00000003h
  '0048A335: mov edx, [ebp+08h]
  '0048A338: mov eax, [edx]
  '0048A33A: mov ecx, [ebp+08h]
  '0048A33D: push ecx
  '0048A33E: call [eax+0000032Ch]
  '0048A344: push eax
  '0048A345: lea edx, [ebp-2Ch]
  '0048A348: push edx
  '0048A349: call [004010E4h]
  '0048A34F: push eax
  '0048A350: lea eax, [ebp-44h]
  '0048A353: push eax
  '0048A354: call [004011E4h]
  '0048A35A: add esp, 00000010h
  '0048A35D: push eax
  '0048A35E: call [004011C8h]
  '0048A364: push eax
  '0048A365: lea ecx, [ebp-30h]
  '0048A368: push ecx
  '0048A369: call [004010E4h]
  '0048A36F: mov [ebp-78h], eax
  '0048A372: mov [ebp-4Ch], 00000004h
  '0048A379: mov [ebp-54h], 00000002h
  '0048A380: lea edx, [ebp-34h]
  '0048A383: push edx
  '0048A384: lea eax, [ebp-54h]
  '0048A387: push eax
  '0048A388: mov ecx, [ebp-78h]
  '0048A38B: mov edx, [ecx]
  '0048A38D: mov eax, [ebp-78h]
  '0048A390: push eax
  '0048A391: call [edx+24h]
  '0048A394: fclex 
  '0048A396: mov [ebp-7Ch], eax
  '0048A399: cmp [ebp-7Ch], 00000000h
  '0048A39D: jnl 48A3BCh
  '0048A39F: push 00000024h
  '0048A3A1: push 0041C038h
  '0048A3A6: mov ecx, [ebp-78h]
  '0048A3A9: push ecx
  '0048A3AA: mov edx, [ebp-7Ch]
  '0048A3AD: push edx
  '0048A3AE: call [004010A0h]
  '0048A3B4: mov [ebp-000000E4h], eax
  '0048A3BA: jmp 48A3C6h
  '0048A3BC: mov [ebp-000000E4h], 00000000h
  '0048A3C6: mov eax, [ebp-34h]
  '0048A3C9: mov [ebp-80h], eax
  '0048A3CC: lea ecx, [ebp-6Ch]
  '0048A3CF: push ecx
  '0048A3D0: mov edx, [ebp-80h]
  '0048A3D3: mov eax, [edx]
  '0048A3D5: mov ecx, [ebp-80h]
  '0048A3D8: push ecx
  '0048A3D9: call [eax+7Ch]
  '0048A3DC: fclex 
  '0048A3DE: mov [ebp-00000084h], eax
  '0048A3E4: cmp [ebp-00000084h], 00000000h
  '0048A3EB: jnl 48A40Dh
  '0048A3ED: push 0000007Ch
  '0048A3EF: push 0041C048h
  '0048A3F4: mov edx, [ebp-80h]
  '0048A3F7: push edx
  '0048A3F8: mov eax, [ebp-00000084h]
  '0048A3FE: push eax
  '0048A3FF: call [004010A0h]
  '0048A405: mov [ebp-000000E8h], eax
  '0048A40B: jmp 48A417h
  '0048A40D: mov [ebp-000000E8h], 00000000h
  '0048A417: xor ecx, ecx
  '0048A419: cmp [ebp-6Ch], 00000001h
  '0048A41D: setz cl
  '0048A420: neg ecx
  '0048A422: mov [ebp-00000088h], cx
  '0048A429: lea edx, [ebp-34h]
  '0048A42C: push edx
  '0048A42D: lea eax, [ebp-30h]
  '0048A430: push eax
  '0048A431: lea ecx, [ebp-2Ch]
  '0048A434: push ecx
  '0048A435: push 00000003h
  '0048A437: call [00401064h]
  '0048A43D: add esp, 00000010h
  '0048A440: lea edx, [ebp-54h]
  '0048A443: push edx
  '0048A444: lea eax, [ebp-44h]
  '0048A447: push eax
  '0048A448: push 00000002h
  '0048A44A: call [00401050h]
  '0048A450: add esp, 0000000Ch
  '0048A453: movsx ecx, word ptr [ebp-00000088h]
  '0048A45A: test ecx, ecx
  '0048A45C: jz 48A491h
  '0048A45E: mov [ebp-04h], 00000017h
  '0048A465: mov edx, 0041E5E0h
  '0048A46A: lea ecx, [ebp-28h]
  '0048A46D: call [004012D8h]
  '0048A473: lea edx, [ebp-28h]
  '0048A476: push edx
  '0048A477: mov eax, [ebp+08h]
  '0048A47A: mov ecx, [eax]
  '0048A47C: mov edx, [ebp+08h]
  '0048A47F: push edx
  '0048A480: call [ecx+00000740h]
  '0048A486: lea ecx, [ebp-28h]
  '0048A489: call [004013B4h]
  '0048A48F: jmp 48A4C2h
  '0048A491: mov [ebp-04h], 00000019h
  '0048A498: mov edx, 0041E620h
  '0048A49D: lea ecx, [ebp-28h]
  '0048A4A0: call [004012D8h]
  '0048A4A6: lea eax, [ebp-28h]
  '0048A4A9: push eax
  '0048A4AA: mov ecx, [ebp+08h]
  '0048A4AD: mov edx, [ecx]
  '0048A4AF: mov eax, [ebp+08h]
  '0048A4B2: push eax
  '0048A4B3: call [edx+00000740h]
  '0048A4B9: lea ecx, [ebp-28h]
  '0048A4BC: call [004013B4h]
  '0048A4C2: jmp 0048A799h
  '0048A4C7: mov [ebp-04h], 0000001Bh
  '0048A4CE: lea ecx, [ebp-68h]
  '0048A4D1: push ecx
  '0048A4D2: mov edx, [ebp-24h]
  '0048A4D5: mov eax, [edx]
  '0048A4D7: mov ecx, [ebp-24h]
  '0048A4DA: push ecx
  '0048A4DB: call [eax+3Ch]
  '0048A4DE: fclex 
  '0048A4E0: mov [ebp-78h], eax
  '0048A4E3: cmp [ebp-78h], 00000000h
  '0048A4E7: jnl 48A506h
  '0048A4E9: push 0000003Ch
  '0048A4EB: push 0041C048h
  '0048A4F0: mov edx, [ebp-24h]
  '0048A4F3: push edx
  '0048A4F4: mov eax, [ebp-78h]
  '0048A4F7: push eax
  '0048A4F8: call [004010A0h]
  '0048A4FE: mov [ebp-000000ECh], eax
  '0048A504: jmp 48A510h
  '0048A506: mov [ebp-000000ECh], 00000000h
  '0048A510: cmp word ptr [ebp-68h], 0005h
  '0048A515: jnz 0048A799h
  '0048A51B: mov [ebp-04h], 0000001Ch
  '0048A522: push 0041C038h
  '0048A527: push 00000000h
  '0048A529: push 00000003h
  '0048A52B: mov ecx, [ebp+08h]
  '0048A52E: mov edx, [ecx]
  '0048A530: mov eax, [ebp+08h]
  '0048A533: push eax
  '0048A534: call [edx+0000032Ch]
  '0048A53A: push eax
  '0048A53B: lea ecx, [ebp-2Ch]
  '0048A53E: push ecx
  '0048A53F: call [004010E4h]
  '0048A545: push eax
  '0048A546: lea edx, [ebp-44h]
  '0048A549: push edx
  '0048A54A: call [004011E4h]
  '0048A550: add esp, 00000010h
  '0048A553: push eax
  '0048A554: call [004011C8h]
  '0048A55A: push eax
  '0048A55B: lea eax, [ebp-30h]
  '0048A55E: push eax
  '0048A55F: call [004010E4h]
  '0048A565: mov [ebp-78h], eax
  '0048A568: mov [ebp-4Ch], 00000005h
  '0048A56F: mov [ebp-54h], 00000002h
  '0048A576: lea ecx, [ebp-34h]
  '0048A579: push ecx
  '0048A57A: lea edx, [ebp-54h]
  '0048A57D: push edx
  '0048A57E: mov eax, [ebp-78h]
  '0048A581: mov ecx, [eax]
  '0048A583: mov edx, [ebp-78h]
  '0048A586: push edx
  '0048A587: call [ecx+24h]
  '0048A58A: fclex 
  '0048A58C: mov [ebp-7Ch], eax
  '0048A58F: cmp [ebp-7Ch], 00000000h
  '0048A593: jnl 48A5B2h
  '0048A595: push 00000024h
  '0048A597: push 0041C038h
  '0048A59C: mov eax, [ebp-78h]
  '0048A59F: push eax
  '0048A5A0: mov ecx, [ebp-7Ch]
  '0048A5A3: push ecx
  '0048A5A4: call [004010A0h]
  '0048A5AA: mov [ebp-000000F0h], eax
  '0048A5B0: jmp 48A5BCh
  '0048A5B2: mov [ebp-000000F0h], 00000000h
  '0048A5BC: mov edx, [ebp-34h]
  '0048A5BF: mov [ebp-80h], edx
  '0048A5C2: lea eax, [ebp-6Ch]
  '0048A5C5: push eax
  '0048A5C6: mov ecx, [ebp-80h]
  '0048A5C9: mov edx, [ecx]
  '0048A5CB: mov eax, [ebp-80h]
  '0048A5CE: push eax
  '0048A5CF: call [edx+7Ch]
  '0048A5D2: fclex 
  '0048A5D4: mov [ebp-00000084h], eax
  '0048A5DA: cmp [ebp-00000084h], 00000000h
  '0048A5E1: jnl 48A603h
  '0048A5E3: push 0000007Ch
  '0048A5E5: push 0041C048h
  '0048A5EA: mov ecx, [ebp-80h]
  '0048A5ED: push ecx
  '0048A5EE: mov edx, [ebp-00000084h]
  '0048A5F4: push edx
  '0048A5F5: call [004010A0h]
  '0048A5FB: mov [ebp-000000F4h], eax
  '0048A601: jmp 48A60Dh
  '0048A603: mov [ebp-000000F4h], 00000000h
  '0048A60D: xor eax, eax
  '0048A60F: cmp [ebp-6Ch], 00000001h
  '0048A613: setz al
  '0048A616: neg eax
  '0048A618: mov [ebp-00000088h], ax
  '0048A61F: lea ecx, [ebp-34h]
  '0048A622: push ecx
  '0048A623: lea edx, [ebp-30h]
  '0048A626: push edx
  '0048A627: lea eax, [ebp-2Ch]
  '0048A62A: push eax
  '0048A62B: push 00000003h
  '0048A62D: call [00401064h]
  '0048A633: add esp, 00000010h
  '0048A636: lea ecx, [ebp-54h]
  '0048A639: push ecx
  '0048A63A: lea edx, [ebp-44h]
  '0048A63D: push edx
  '0048A63E: push 00000002h
  '0048A640: call [00401050h]
  '0048A646: add esp, 0000000Ch
  '0048A649: movsx eax, word ptr [ebp-00000088h]
  '0048A650: test eax, eax
  '0048A652: jz 0048A6FBh
  '0048A658: mov [ebp-04h], 0000001Dh
  '0048A65F: mov ecx, [ebp+08h]
  '0048A662: mov edx, [ecx]
  '0048A664: mov eax, [ebp+08h]
  '0048A667: push eax
  '0048A668: call [edx+000002FCh]
  '0048A66E: push eax
  '0048A66F: lea ecx, [ebp-2Ch]
  '0048A672: push ecx
  '0048A673: call [004010E4h]
  '0048A679: mov [ebp-78h], eax
  '0048A67C: push FFFFFFFFh
  '0048A67E: mov edx, [ebp-78h]
  '0048A681: mov eax, [edx]
  '0048A683: mov ecx, [ebp-78h]
  '0048A686: push ecx
  '0048A687: call [eax+5Ch]
  '0048A68A: fclex 
  '0048A68C: mov [ebp-7Ch], eax
  '0048A68F: cmp [ebp-7Ch], 00000000h
  '0048A693: jnl 48A6B2h
  '0048A695: push 0000005Ch
  '0048A697: push 0041E5CCh
  '0048A69C: mov edx, [ebp-78h]
  '0048A69F: push edx
  '0048A6A0: mov eax, [ebp-7Ch]
  '0048A6A3: push eax
  '0048A6A4: call [004010A0h]
  '0048A6AA: mov [ebp-000000F8h], eax
  '0048A6B0: jmp 48A6BCh
  '0048A6B2: mov [ebp-000000F8h], 00000000h
  '0048A6BC: lea ecx, [ebp-2Ch]
  '0048A6BF: call [004013B8h]
  '0048A6C5: mov [ebp-04h], 0000001Eh
  '0048A6CC: mov edx, 0041E650h
  '0048A6D1: lea ecx, [ebp-28h]
  '0048A6D4: call [004012D8h]
  '0048A6DA: lea ecx, [ebp-28h]
  '0048A6DD: push ecx
  '0048A6DE: mov edx, [ebp+08h]
  '0048A6E1: mov eax, [edx]
  '0048A6E3: mov ecx, [ebp+08h]
  '0048A6E6: push ecx
  '0048A6E7: call [eax+00000740h]
  '0048A6ED: lea ecx, [ebp-28h]
  '0048A6F0: call [004013B4h]
  '0048A6F6: jmp 0048A799h
  '0048A6FB: mov [ebp-04h], 00000020h
  '0048A702: mov edx, [ebp+08h]
  '0048A705: mov eax, [edx]
  '0048A707: mov ecx, [ebp+08h]
  '0048A70A: push ecx
  '0048A70B: call [eax+000002FCh]
  '0048A711: push eax
  '0048A712: lea edx, [ebp-2Ch]
  '0048A715: push edx
  '0048A716: call [004010E4h]
  '0048A71C: mov [ebp-78h], eax
  '0048A71F: push 00000000h
  '0048A721: mov eax, [ebp-78h]
  '0048A724: mov ecx, [eax]
  '0048A726: mov edx, [ebp-78h]
  '0048A729: push edx
  '0048A72A: call [ecx+5Ch]
  '0048A72D: fclex 
  '0048A72F: mov [ebp-7Ch], eax
  '0048A732: cmp [ebp-7Ch], 00000000h
  '0048A736: jnl 48A755h
  '0048A738: push 0000005Ch
  '0048A73A: push 0041E5CCh
  '0048A73F: mov eax, [ebp-78h]
  '0048A742: push eax
  '0048A743: mov ecx, [ebp-7Ch]
  '0048A746: push ecx
  '0048A747: call [004010A0h]
  '0048A74D: mov [ebp-000000FCh], eax
  '0048A753: jmp 48A75Fh
  '0048A755: mov [ebp-000000FCh], 00000000h
  '0048A75F: lea ecx, [ebp-2Ch]
  '0048A762: call [004013B8h]
  '0048A768: mov [ebp-04h], 00000021h
  '0048A76F: mov edx, 0041E684h
  '0048A774: lea ecx, [ebp-28h]
  '0048A777: call [004012D8h]
  '0048A77D: lea edx, [ebp-28h]
  '0048A780: push edx
  '0048A781: mov eax, [ebp+08h]
  '0048A784: mov ecx, [eax]
  '0048A786: mov edx, [ebp+08h]
  '0048A789: push edx
  '0048A78A: call [ecx+00000740h]
  '0048A790: lea ecx, [ebp-28h]
  '0048A793: call [004013B4h]
  '0048A799: mov [ebp-10h], 00000000h
  '0048A7A0: wait 
  '0048A7A1: push 0048A7F2h
  '0048A7A6: jmp 48A7DCh
  '0048A7A8: lea ecx, [ebp-28h]
  '0048A7AB: call [004013B4h]
  '0048A7B1: lea eax, [ebp-34h]
  '0048A7B4: push eax
  '0048A7B5: lea ecx, [ebp-30h]
  '0048A7B8: push ecx
  '0048A7B9: lea edx, [ebp-2Ch]
  '0048A7BC: push edx
  '0048A7BD: push 00000003h
  '0048A7BF: call [00401064h]
  '0048A7C5: add esp, 00000010h
  '0048A7C8: lea eax, [ebp-54h]
  '0048A7CB: push eax
  '0048A7CC: lea ecx, [ebp-44h]
  '0048A7CF: push ecx
  '0048A7D0: push 00000002h
  '0048A7D2: call [00401050h]
  '0048A7D8: add esp, 0000000Ch
  '0048A7DB: ret 
End Sub
Private Sub tmrCapture__48D310
  '0048D310: push ebp
  '0048D311: mov ebp, esp
  '0048D313: sub esp, 00000018h
  '0048D316: push 004081B6h
  '0048D31B: mov eax, fs:[00h]
  '0048D321: push eax
  '0048D322: mov fs:[00000000h], esp
  '0048D329: mov eax, 00000074h
  '0048D32E: call 004081B0h
  '0048D333: push ebx
  '0048D334: push esi
  '0048D335: push edi
  '0048D336: mov [ebp-18h], esp
  '0048D339: mov [ebp-14h], 004019E8h
  '0048D340: mov eax, [ebp+08h]
  '0048D343: and eax, 00000001h
  '0048D346: mov [ebp-10h], eax
  '0048D349: mov ecx, [ebp+08h]
  '0048D34C: and ecx, FFFFFFFEh
  '0048D34F: mov [ebp+08h], ecx
  '0048D352: mov [ebp-0Ch], 00000000h
  '0048D359: mov edx, [ebp+08h]
  '0048D35C: mov eax, [edx]
  '0048D35E: mov ecx, [ebp+08h]
  '0048D361: push ecx
  '0048D362: call [eax+04h]
  '0048D365: mov [ebp-04h], 00000001h
  '0048D36C: mov [ebp-04h], 00000002h
  '0048D373: push FFFFFFFFh
  '0048D375: call [004010E8h]
  '0048D37B: mov [ebp-04h], 00000003h
  '0048D382: mov edx, [ebp+08h]
  '0048D385: mov eax, [edx+48h]
  '0048D388: sub eax, 00000001h
  '0048D38B: jo 0048D6A5h
  '0048D391: mov ecx, [ebp+08h]
  '0048D394: mov [ecx+48h], eax
  '0048D397: mov [ebp-04h], 00000004h
  '0048D39E: push 0041E958h
  '0048D3A3: push 00000000h
  '0048D3A5: push 00000003h
  '0048D3A7: mov edx, [ebp+08h]
  '0048D3AA: mov eax, [edx]
  '0048D3AC: mov ecx, [ebp+08h]
  '0048D3AF: push ecx
  '0048D3B0: call [eax+00000330h]
  '0048D3B6: push eax
  '0048D3B7: lea edx, [ebp-28h]
  '0048D3BA: push edx
  '0048D3BB: call [004010E4h]
  '0048D3C1: push eax
  '0048D3C2: lea eax, [ebp-40h]
  '0048D3C5: push eax
  '0048D3C6: call [004011E4h]
  '0048D3CC: add esp, 00000010h
  '0048D3CF: push eax
  '0048D3D0: call [004011C8h]
  '0048D3D6: push eax
  '0048D3D7: lea ecx, [ebp-2Ch]
  '0048D3DA: push ecx
  '0048D3DB: call [004010E4h]
  '0048D3E1: mov [ebp-64h], eax
  '0048D3E4: mov [ebp-48h], 00000002h
  '0048D3EB: mov [ebp-50h], 00000002h
  '0048D3F2: lea edx, [ebp-30h]
  '0048D3F5: push edx
  '0048D3F6: lea eax, [ebp-50h]
  '0048D3F9: push eax
  '0048D3FA: mov ecx, [ebp-64h]
  '0048D3FD: mov edx, [ecx]
  '0048D3FF: mov eax, [ebp-64h]
  '0048D402: push eax
  '0048D403: call [edx+24h]
  '0048D406: fclex 
  '0048D408: mov [ebp-68h], eax
  '0048D40B: cmp [ebp-68h], 00000000h
  '0048D40F: jnl 48D42Eh
  '0048D411: push 00000024h
  '0048D413: push 0041E958h
  '0048D418: mov ecx, [ebp-64h]
  '0048D41B: push ecx
  '0048D41C: mov edx, [ebp-68h]
  '0048D41F: push edx
  '0048D420: call [004010A0h]
  '0048D426: mov [ebp-00000088h], eax
  '0048D42C: jmp 48D438h
  '0048D42E: mov [ebp-00000088h], 00000000h
  '0048D438: mov eax, [ebp-30h]
  '0048D43B: mov [ebp-6Ch], eax
  '0048D43E: mov ecx, [ebp+08h]
  '0048D441: mov edx, [ecx+48h]
  '0048D444: push edx
  '0048D445: call [00401024h]
  '0048D44B: mov edx, eax
  '0048D44D: lea ecx, [ebp-24h]
  '0048D450: call [00401378h]
  '0048D456: push eax
  '0048D457: mov eax, [ebp-6Ch]
  '0048D45A: mov ecx, [eax]
  '0048D45C: mov edx, [ebp-6Ch]
  '0048D45F: push edx
  '0048D460: call [ecx+00000080h]
  '0048D466: fclex 
  '0048D468: mov [ebp-70h], eax
  '0048D46B: cmp [ebp-70h], 00000000h
  '0048D46F: jnl 48D491h
  '0048D471: push 00000080h
  '0048D476: push 0041E968h
  '0048D47B: mov eax, [ebp-6Ch]
  '0048D47E: push eax
  '0048D47F: mov ecx, [ebp-70h]
  '0048D482: push ecx
  '0048D483: call [004010A0h]
  '0048D489: mov [ebp-0000008Ch], eax
  '0048D48F: jmp 48D49Bh
  '0048D491: mov [ebp-0000008Ch], 00000000h
  '0048D49B: lea ecx, [ebp-24h]
  '0048D49E: call [004013B4h]
  '0048D4A4: lea edx, [ebp-30h]
  '0048D4A7: push edx
  '0048D4A8: lea eax, [ebp-2Ch]
  '0048D4AB: push eax
  '0048D4AC: lea ecx, [ebp-28h]
  '0048D4AF: push ecx
  '0048D4B0: push 00000003h
  '0048D4B2: call [00401064h]
  '0048D4B8: add esp, 00000010h
  '0048D4BB: lea edx, [ebp-50h]
  '0048D4BE: push edx
  '0048D4BF: lea eax, [ebp-40h]
  '0048D4C2: push eax
  '0048D4C3: push 00000002h
  '0048D4C5: call [00401050h]
  '0048D4CB: add esp, 0000000Ch
  '0048D4CE: mov [ebp-04h], 00000005h
  '0048D4D5: mov ecx, [ebp+08h]
  '0048D4D8: cmp [ecx+48h], 00000000h
  '0048D4DC: jnle 0048D63Ah
  '0048D4E2: mov [ebp-04h], 00000006h
  '0048D4E9: mov edx, 0041E97Ch
  '0048D4EE: lea ecx, [ebp-24h]
  '0048D4F1: call [004012D8h]
  '0048D4F7: lea edx, [ebp-24h]
  '0048D4FA: push edx
  '0048D4FB: mov eax, [ebp+08h]
  '0048D4FE: mov ecx, [eax]
  '0048D500: mov edx, [ebp+08h]
  '0048D503: push edx
  '0048D504: call [ecx+00000740h]
  '0048D50A: lea ecx, [ebp-24h]
  '0048D50D: call [004013B4h]
  '0048D513: mov [ebp-04h], 00000007h
  '0048D51A: mov eax, [ebp+08h]
  '0048D51D: mov ecx, [eax]
  '0048D51F: mov edx, [ebp+08h]
  '0048D522: push edx
  '0048D523: call [ecx+00000748h]
  '0048D529: mov [ebp-04h], 00000008h
  '0048D530: mov eax, [ebp+08h]
  '0048D533: mov ecx, [eax]
  '0048D535: mov edx, [ebp+08h]
  '0048D538: push edx
  '0048D539: call [ecx+00000304h]
  '0048D53F: push eax
  '0048D540: lea eax, [ebp-28h]
  '0048D543: push eax
  '0048D544: call [004010E4h]
  '0048D54A: mov [ebp-64h], eax
  '0048D54D: lea ecx, [ebp-24h]
  '0048D550: push ecx
  '0048D551: mov edx, [ebp-64h]
  '0048D554: mov eax, [edx]
  '0048D556: mov ecx, [ebp-64h]
  '0048D559: push ecx
  '0048D55A: call [eax+000000A8h]
  '0048D560: fclex 
  '0048D562: mov [ebp-68h], eax
  '0048D565: cmp [ebp-68h], 00000000h
  '0048D569: jnl 48D58Bh
  '0048D56B: push 000000A8h
  '0048D570: push 0041C0C4h
  '0048D575: mov edx, [ebp-64h]
  '0048D578: push edx
  '0048D579: mov eax, [ebp-68h]
  '0048D57C: push eax
  '0048D57D: call [004010A0h]
  '0048D583: mov [ebp-00000090h], eax
  '0048D589: jmp 48D595h
  '0048D58B: mov [ebp-00000090h], 00000000h
  '0048D595: mov ecx, [ebp-24h]
  '0048D598: push ecx
  '0048D599: call [004013BCh]
  '0048D59F: fadd real8 ptr [004019B8h]
  '0048D5A5: fstsw ax
  '0048D5A7: test al, 0Dh
  '0048D5A9: jnz 0048D6A0h
  '0048D5AF: call [0040135Ch]
  '0048D5B5: mov edx, [ebp+08h]
  '0048D5B8: mov [edx+48h], eax
  '0048D5BB: lea ecx, [ebp-24h]
  '0048D5BE: call [004013B4h]
  '0048D5C4: lea ecx, [ebp-28h]
  '0048D5C7: call [004013B8h]
  '0048D5CD: mov [ebp-04h], 00000009h
  '0048D5D4: mov eax, [ebp+08h]
  '0048D5D7: mov ecx, [eax]
  '0048D5D9: mov edx, [ebp+08h]
  '0048D5DC: push edx
  '0048D5DD: call [ecx+00000300h]
  '0048D5E3: push eax
  '0048D5E4: lea eax, [ebp-28h]
  '0048D5E7: push eax
  '0048D5E8: call [004010E4h]
  '0048D5EE: mov [ebp-64h], eax
  '0048D5F1: push 00000000h
  '0048D5F3: mov ecx, [ebp-64h]
  '0048D5F6: mov edx, [ecx]
  '0048D5F8: mov eax, [ebp-64h]
  '0048D5FB: push eax
  '0048D5FC: call [edx+5Ch]
  '0048D5FF: fclex 
  '0048D601: mov [ebp-68h], eax
  '0048D604: cmp [ebp-68h], 00000000h
  '0048D608: jnl 48D627h
  '0048D60A: push 0000005Ch
  '0048D60C: push 0041E5CCh
  '0048D611: mov ecx, [ebp-64h]
  '0048D614: push ecx
  '0048D615: mov edx, [ebp-68h]
  '0048D618: push edx
  '0048D619: call [004010A0h]
  '0048D61F: mov [ebp-00000094h], eax
  '0048D625: jmp 48D631h
  '0048D627: mov [ebp-00000094h], 00000000h
  '0048D631: lea ecx, [ebp-28h]
  '0048D634: call [004013B8h]
  '0048D63A: mov [ebp-10h], 00000000h
  '0048D641: wait 
  '0048D642: push 0048D67Eh
  '0048D647: jmp 48D67Dh
  '0048D649: lea ecx, [ebp-24h]
  '0048D64C: call [004013B4h]
  '0048D652: lea eax, [ebp-30h]
  '0048D655: push eax
  '0048D656: lea ecx, [ebp-2Ch]
  '0048D659: push ecx
  '0048D65A: lea edx, [ebp-28h]
  '0048D65D: push edx
  '0048D65E: push 00000003h
  '0048D660: call [00401064h]
  '0048D666: add esp, 00000010h
  '0048D669: lea eax, [ebp-50h]
  '0048D66C: push eax
  '0048D66D: lea ecx, [ebp-40h]
  '0048D670: push ecx
  '0048D671: push 00000002h
  '0048D673: call [00401050h]
  '0048D679: add esp, 0000000Ch
  '0048D67C: ret 
End Sub
Private Sub mnu_areacap__486900
  '00486900: push ebp
  '00486901: mov ebp, esp
  '00486903: sub esp, 00000018h
  '00486906: push 004081B6h
  '0048690B: mov eax, fs:[00h]
  '00486911: push eax
  '00486912: mov fs:[00000000h], esp
  '00486919: mov eax, 000000F4h
  '0048691E: call 004081B0h
  '00486923: push ebx
  '00486924: push esi
  '00486925: push edi
  '00486926: mov [ebp-18h], esp
  '00486929: mov [ebp-14h], 004013D8h
  '00486930: mov eax, [ebp+08h]
  '00486933: and eax, 00000001h
  '00486936: mov [ebp-10h], eax
  '00486939: mov ecx, [ebp+08h]
  '0048693C: and ecx, FFFFFFFEh
  '0048693F: mov [ebp+08h], ecx
  '00486942: mov [ebp-0Ch], 00000000h
  '00486949: mov edx, [ebp+08h]
  '0048694C: mov eax, [edx]
  '0048694E: mov ecx, [ebp+08h]
  '00486951: push ecx
  '00486952: call [eax+04h]
  '00486955: mov [ebp-04h], 00000001h
  '0048695C: mov [ebp-04h], 00000002h
  '00486963: push FFFFFFFFh
  '00486965: call [004010E8h]
  '0048696B: mov [ebp-04h], 00000003h
  '00486972: mov edx, [ebp+08h]
  '00486975: mov eax, [edx]
  '00486977: mov ecx, [ebp+08h]
  '0048697A: push ecx
  '0048697B: call [eax+00000310h]
  '00486981: push eax
  '00486982: lea edx, [ebp-6Ch]
  '00486985: push edx
  '00486986: call [004010E4h]
  '0048698C: mov [ebp-000000ACh], eax
  '00486992: lea eax, [ebp-000000A0h]
  '00486998: push eax
  '00486999: mov ecx, [ebp-000000ACh]
  '0048699F: mov edx, [ecx]
  '004869A1: mov eax, [ebp-000000ACh]
  '004869A7: push eax
  '004869A8: call [edx+00000080h]
  '004869AE: fclex 
  '004869B0: mov [ebp-000000B0h], eax
  '004869B6: cmp [ebp-000000B0h], 00000000h
  '004869BD: jnl 4869E5h
  '004869BF: push 00000080h
  '004869C4: push 0041C058h
  '004869C9: mov ecx, [ebp-000000ACh]
  '004869CF: push ecx
  '004869D0: mov edx, [ebp-000000B0h]
  '004869D6: push edx
  '004869D7: call [004010A0h]
  '004869DD: mov [ebp-000000E4h], eax
  '004869E3: jmp 4869EFh
  '004869E5: mov [ebp-000000E4h], 00000000h
  '004869EF: lea eax, [ebp-0000009Ch]
  '004869F5: push eax
  '004869F6: mov ecx, [ebp+08h]
  '004869F9: mov edx, [ecx]
  '004869FB: mov eax, [ebp+08h]
  '004869FE: push eax
  '004869FF: call [edx+00000080h]
  '00486A05: fclex 
  '00486A07: mov [ebp-000000B4h], eax
  '00486A0D: cmp [ebp-000000B4h], 00000000h
  '00486A14: jnl 486A39h
  '00486A16: push 00000080h
  '00486A1B: push 0041BC88h
  '00486A20: mov ecx, [ebp+08h]
  '00486A23: push ecx
  '00486A24: mov edx, [ebp-000000B4h]
  '00486A2A: push edx
  '00486A2B: call [004010A0h]
  '00486A31: mov [ebp-000000E8h], eax
  '00486A37: jmp 486A43h
  '00486A39: mov [ebp-000000E8h], 00000000h
  '00486A43: fld real4 ptr [ebp-0000009Ch]
  '00486A49: fsub real4 ptr [ebp-000000A0h]
  '00486A4F: fstsw ax
  '00486A51: test al, 0Dh
  '00486A53: jnz 004871EAh
  '00486A59: call [00401108h]
  '00486A5F: fcomp real4 ptr [00401430h]
  '00486A65: fstsw ax
  '00486A67: test ah, 41h
  '00486A6A: jnz 486A78h
  '00486A6C: mov [ebp-000000ECh], 00000001h
  '00486A76: jmp 486A82h
  '00486A78: mov [ebp-000000ECh], 00000000h
  '00486A82: mov eax, [ebp-000000ECh]
  '00486A88: neg eax
  '00486A8A: mov [ebp-000000B8h], ax
  '00486A91: lea ecx, [ebp-6Ch]
  '00486A94: call [004013B8h]
  '00486A9A: movsx ecx, word ptr [ebp-000000B8h]
  '00486AA1: test ecx, ecx
  '00486AA3: jz 00486C3Ah
  '00486AA9: mov [ebp-04h], 00000004h
  '00486AB0: lea edx, [ebp-0000009Ch]
  '00486AB6: push edx
  '00486AB7: mov eax, [ebp+08h]
  '00486ABA: mov ecx, [eax]
  '00486ABC: mov edx, [ebp+08h]
  '00486ABF: push edx
  '00486AC0: call [ecx+00000080h]
  '00486AC6: fclex 
  '00486AC8: mov [ebp-000000ACh], eax
  '00486ACE: cmp [ebp-000000ACh], 00000000h
  '00486AD5: jnl 486AFAh
  '00486AD7: push 00000080h
  '00486ADC: push 0041BC88h
  '00486AE1: mov eax, [ebp+08h]
  '00486AE4: push eax
  '00486AE5: mov ecx, [ebp-000000ACh]
  '00486AEB: push ecx
  '00486AEC: call [004010A0h]
  '00486AF2: mov [ebp-000000F0h], eax
  '00486AF8: jmp 486B04h
  '00486AFA: mov [ebp-000000F0h], 00000000h
  '00486B04: fld real4 ptr [ebp-0000009Ch]
  '00486B0A: fadd real4 ptr [0040142Ch]
  '00486B10: fstsw ax
  '00486B12: test al, 0Dh
  '00486B14: jnz 004871EAh
  '00486B1A: push ecx
  '00486B1B: fstp real4 ptr [esp]
  '00486B1E: mov edx, [ebp+08h]
  '00486B21: mov eax, [edx]
  '00486B23: mov ecx, [ebp+08h]
  '00486B26: push ecx
  '00486B27: call [eax+00000084h]
  '00486B2D: fclex 
  '00486B2F: mov [ebp-000000B0h], eax
  '00486B35: cmp [ebp-000000B0h], 00000000h
  '00486B3C: jnl 486B61h
  '00486B3E: push 00000084h
  '00486B43: push 0041BC88h
  '00486B48: mov edx, [ebp+08h]
  '00486B4B: push edx
  '00486B4C: mov eax, [ebp-000000B0h]
  '00486B52: push eax
  '00486B53: call [004010A0h]
  '00486B59: mov [ebp-000000F4h], eax
  '00486B5F: jmp 486B6Bh
  '00486B61: mov [ebp-000000F4h], 00000000h
  '00486B6B: mov [ebp-04h], 00000005h
  '00486B72: lea ecx, [ebp-0000009Ch]
  '00486B78: push ecx
  '00486B79: mov edx, [ebp+08h]
  '00486B7C: mov eax, [edx]
  '00486B7E: mov ecx, [ebp+08h]
  '00486B81: push ecx
  '00486B82: call [eax+00000080h]
  '00486B88: fclex 
  '00486B8A: mov [ebp-000000ACh], eax
  '00486B90: cmp [ebp-000000ACh], 00000000h
  '00486B97: jnl 486BBCh
  '00486B99: push 00000080h
  '00486B9E: push 0041BC88h
  '00486BA3: mov edx, [ebp+08h]
  '00486BA6: push edx
  '00486BA7: mov eax, [ebp-000000ACh]
  '00486BAD: push eax
  '00486BAE: call [004010A0h]
  '00486BB4: mov [ebp-000000F8h], eax
  '00486BBA: jmp 486BC6h
  '00486BBC: mov [ebp-000000F8h], 00000000h
  '00486BC6: fld real4 ptr [ebp-0000009Ch]
  '00486BCC: fsub real4 ptr [0040142Ch]
  '00486BD2: fstsw ax
  '00486BD4: test al, 0Dh
  '00486BD6: jnz 004871EAh
  '00486BDC: push ecx
  '00486BDD: fstp real4 ptr [esp]
  '00486BE0: mov ecx, [ebp+08h]
  '00486BE3: mov edx, [ecx]
  '00486BE5: mov eax, [ebp+08h]
  '00486BE8: push eax
  '00486BE9: call [edx+00000084h]
  '00486BEF: fclex 
  '00486BF1: mov [ebp-000000B0h], eax
  '00486BF7: cmp [ebp-000000B0h], 00000000h
  '00486BFE: jnl 486C23h
  '00486C00: push 00000084h
  '00486C05: push 0041BC88h
  '00486C0A: mov ecx, [ebp+08h]
  '00486C0D: push ecx
  '00486C0E: mov edx, [ebp-000000B0h]
  '00486C14: push edx
  '00486C15: call [004010A0h]
  '00486C1B: mov [ebp-000000FCh], eax
  '00486C21: jmp 486C2Dh
  '00486C23: mov [ebp-000000FCh], 00000000h
  '00486C2D: mov [ebp-04h], 00000006h
  '00486C34: call [00401104h]
  '00486C3A: mov [ebp-04h], 00000008h
  '00486C41: push 00000000h
  '00486C43: push 00000008h
  '00486C45: mov eax, [ebp+08h]
  '00486C48: mov ecx, [eax]
  '00486C4A: mov edx, [ebp+08h]
  '00486C4D: push edx
  '00486C4E: call [ecx+00000338h]
  '00486C54: push eax
  '00486C55: lea eax, [ebp-6Ch]
  '00486C58: push eax
  '00486C59: call [004010E4h]
  '00486C5F: push eax
  '00486C60: lea ecx, [ebp-00000084h]
  '00486C66: push ecx
  '00486C67: call [004011E4h]
  '00486C6D: add esp, 00000010h
  '00486C70: push eax
  '00486C71: call [00401284h]
  '00486C77: movsx edx, ax
  '00486C7A: xor eax, eax
  '00486C7C: cmp edx, 00000007h
  '00486C7F: setnz al
  '00486C82: neg eax
  '00486C84: mov [ebp-000000ACh], ax
  '00486C8B: lea ecx, [ebp-6Ch]
  '00486C8E: call [004013B8h]
  '00486C94: lea ecx, [ebp-00000084h]
  '00486C9A: call [00401030h]
  '00486CA0: movsx ecx, word ptr [ebp-000000ACh]
  '00486CA7: test ecx, ecx
  '00486CA9: jz 486CE1h
  '00486CAB: mov [ebp-04h], 00000009h
  '00486CB2: mov edx, 0041C06Ch
  '00486CB7: lea ecx, [ebp-28h]
  '00486CBA: call [004012D8h]
  '00486CC0: lea edx, [ebp-28h]
  '00486CC3: push edx
  '00486CC4: mov eax, [ebp+08h]
  '00486CC7: mov ecx, [eax]
  '00486CC9: mov edx, [ebp+08h]
  '00486CCC: push edx
  '00486CCD: call [ecx+00000740h]
  '00486CD3: lea ecx, [ebp-28h]
  '00486CD6: call [004013B4h]
  '00486CDC: jmp 00487145h
  '00486CE1: mov [ebp-04h], 0000000Ch
  '00486CE8: lea eax, [ebp-28h]
  '00486CEB: push eax
  '00486CEC: mov ecx, [ebp+08h]
  '00486CEF: mov edx, [ecx]
  '00486CF1: mov eax, [ebp+08h]
  '00486CF4: push eax
  '00486CF5: call [edx+000001C0h]
  '00486CFB: fclex 
  '00486CFD: mov [ebp-000000ACh], eax
  '00486D03: cmp [ebp-000000ACh], 00000000h
  '00486D0A: jnl 486D2Fh
  '00486D0C: push 000001C0h
  '00486D11: push 0041BC88h
  '00486D16: mov ecx, [ebp+08h]
  '00486D19: push ecx
  '00486D1A: mov edx, [ebp-000000ACh]
  '00486D20: push edx
  '00486D21: call [004010A0h]
  '00486D27: mov [ebp-00000100h], eax
  '00486D2D: jmp 486D39h
  '00486D2F: mov [ebp-00000100h], 00000000h
  '00486D39: mov [ebp-7Ch], 80020004h
  '00486D40: mov [ebp-00000084h], 0000000Ah
  '00486D4A: lea eax, [ebp-00000084h]
  '00486D50: push eax
  '00486D51: push 00000004h
  '00486D53: mov ecx, [ebp-28h]
  '00486D56: push ecx
  '00486D57: call [00401148h]
  '00486D5D: mov edx, eax
  '00486D5F: lea ecx, [ebp-2Ch]
  '00486D62: call [00401378h]
  '00486D68: push eax
  '00486D69: call [004013BCh]
  '00486D6F: fstp real8 ptr [ebp-000000A8h]
  '00486D75: cmp [00541024h], 00000000h
  '00486D7C: jnz 486D9Ah
  '00486D7E: push 00541024h
  '00486D83: push 00413334h
  '00486D88: call [004012B8h]
  '00486D8E: mov [ebp-00000104h], 00541024h
  '00486D98: jmp 486DA4h
  '00486D9A: mov [ebp-00000104h], 00541024h
  '00486DA4: mov edx, [ebp-00000104h]
  '00486DAA: mov eax, [edx]
  '00486DAC: mov [ebp-000000C8h], eax
  '00486DB2: mov ecx, [ebp+08h]
  '00486DB5: mov edx, [ecx]
  '00486DB7: mov eax, [ebp+08h]
  '00486DBA: push eax
  '00486DBB: call [edx+00000308h]
  '00486DC1: push eax
  '00486DC2: lea ecx, [ebp-6Ch]
  '00486DC5: push ecx
  '00486DC6: call [004010E4h]
  '00486DCC: mov [ebp-000000B0h], eax
  '00486DD2: lea edx, [ebp-30h]
  '00486DD5: push edx
  '00486DD6: mov eax, [ebp-000000B0h]
  '00486DDC: mov ecx, [eax]
  '00486DDE: mov edx, [ebp-000000B0h]
  '00486DE4: push edx
  '00486DE5: call [ecx+000000A8h]
  '00486DEB: fclex 
  '00486DED: mov [ebp-000000B4h], eax
  '00486DF3: cmp [ebp-000000B4h], 00000000h
  '00486DFA: jnl 486E22h
  '00486DFC: push 000000A8h
  '00486E01: push 0041C0C4h
  '00486E06: mov eax, [ebp-000000B0h]
  '00486E0C: push eax
  '00486E0D: mov ecx, [ebp-000000B4h]
  '00486E13: push ecx
  '00486E14: call [004010A0h]
  '00486E1A: mov [ebp-00000108h], eax
  '00486E20: jmp 486E2Ch
  '00486E22: mov [ebp-00000108h], 00000000h
  '00486E2C: mov edx, [ebp+08h]
  '00486E2F: mov eax, [edx]
  '00486E31: mov ecx, [ebp+08h]
  '00486E34: push ecx
  '00486E35: call [eax+00000310h]
  '00486E3B: push eax
  '00486E3C: lea edx, [ebp-70h]
  '00486E3F: push edx
  '00486E40: call [004010E4h]
  '00486E46: mov [ebp-000000B8h], eax
  '00486E4C: lea eax, [ebp-0000009Ch]
  '00486E52: push eax
  '00486E53: mov ecx, [ebp-000000B8h]
  '00486E59: mov edx, [ecx]
  '00486E5B: mov eax, [ebp-000000B8h]
  '00486E61: push eax
  '00486E62: call [edx+00000088h]
  '00486E68: fclex 
  '00486E6A: mov [ebp-000000BCh], eax
  '00486E70: cmp [ebp-000000BCh], 00000000h
  '00486E77: jnl 486E9Fh
  '00486E79: push 00000088h
  '00486E7E: push 0041C058h
  '00486E83: mov ecx, [ebp-000000B8h]
  '00486E89: push ecx
  '00486E8A: mov edx, [ebp-000000BCh]
  '00486E90: push edx
  '00486E91: call [004010A0h]
  '00486E97: mov [ebp-0000010Ch], eax
  '00486E9D: jmp 486EA9h
  '00486E9F: mov [ebp-0000010Ch], 00000000h
  '00486EA9: mov eax, [ebp+08h]
  '00486EAC: mov ecx, [eax]
  '00486EAE: mov edx, [ebp+08h]
  '00486EB1: push edx
  '00486EB2: call [ecx+00000310h]
  '00486EB8: push eax
  '00486EB9: lea eax, [ebp-74h]
  '00486EBC: push eax
  '00486EBD: call [004010E4h]
  '00486EC3: mov [ebp-000000C0h], eax
  '00486EC9: lea ecx, [ebp-000000A0h]
  '00486ECF: push ecx
  '00486ED0: mov edx, [ebp-000000C0h]
  '00486ED6: mov eax, [edx]
  '00486ED8: mov ecx, [ebp-000000C0h]
  '00486EDE: push ecx
  '00486EDF: call [eax+00000080h]
  '00486EE5: fclex 
  '00486EE7: mov [ebp-000000C4h], eax
  '00486EED: cmp [ebp-000000C4h], 00000000h
  '00486EF4: jnl 486F1Ch
  '00486EF6: push 00000080h
  '00486EFB: push 0041C058h
  '00486F00: mov edx, [ebp-000000C0h]
  '00486F06: push edx
  '00486F07: mov eax, [ebp-000000C4h]
  '00486F0D: push eax
  '00486F0E: call [004010A0h]
  '00486F14: mov [ebp-00000110h], eax
  '00486F1A: jmp 486F26h
  '00486F1C: mov [ebp-00000110h], 00000000h
  '00486F26: push 0041C0B0h
  '00486F2B: mov ecx, [ebp-30h]
  '00486F2E: push ecx
  '00486F2F: call [0040108Ch]
  '00486F35: mov edx, eax
  '00486F37: lea ecx, [ebp-34h]
  '00486F3A: call [00401378h]
  '00486F40: push eax
  '00486F41: push 0041C0D8h
  '00486F46: call [0040108Ch]
  '00486F4C: mov edx, eax
  '00486F4E: lea ecx, [ebp-38h]
  '00486F51: call [00401378h]
  '00486F57: push eax
  '00486F58: mov edx, [ebp-0000009Ch]
  '00486F5E: push edx
  '00486F5F: call [004011D4h]
  '00486F65: mov edx, eax
  '00486F67: lea ecx, [ebp-3Ch]
  '00486F6A: call [00401378h]
  '00486F70: push eax
  '00486F71: call [0040108Ch]
  '00486F77: mov edx, eax
  '00486F79: lea ecx, [ebp-40h]
  '00486F7C: call [00401378h]
  '00486F82: push eax
  '00486F83: push 0041C0D8h
  '00486F88: call [0040108Ch]
  '00486F8E: mov edx, eax
  '00486F90: lea ecx, [ebp-44h]
  '00486F93: call [00401378h]
  '00486F99: push eax
  '00486F9A: mov eax, [ebp-000000A0h]
  '00486FA0: push eax
  '00486FA1: call [004011D4h]
  '00486FA7: mov edx, eax
  '00486FA9: lea ecx, [ebp-48h]
  '00486FAC: call [00401378h]
  '00486FB2: push eax
  '00486FB3: call [0040108Ch]
  '00486FB9: mov edx, eax
  '00486FBB: lea ecx, [ebp-4Ch]
  '00486FBE: call [00401378h]
  '00486FC4: push eax
  '00486FC5: push 0041C0D8h
  '00486FCA: call [0040108Ch]
  '00486FD0: mov edx, eax
  '00486FD2: lea ecx, [ebp-50h]
  '00486FD5: call [00401378h]
  '00486FDB: push eax
  '00486FDC: mov ecx, [ebp+08h]
  '00486FDF: mov edx, [ecx+40h]
  '00486FE2: push edx
  '00486FE3: call [00401024h]
  '00486FE9: mov edx, eax
  '00486FEB: lea ecx, [ebp-54h]
  '00486FEE: call [00401378h]
  '00486FF4: push eax
  '00486FF5: call [0040108Ch]
  '00486FFB: mov edx, eax
  '00486FFD: lea ecx, [ebp-58h]
  '00487000: call [00401378h]
  '00487006: push eax
  '00487007: push 0041C0D8h
  '0048700C: call [0040108Ch]
  '00487012: mov edx, eax
  '00487014: lea ecx, [ebp-5Ch]
  '00487017: call [00401378h]
  '0048701D: push eax
  '0048701E: mov eax, [ebp+08h]
  '00487021: mov ecx, [eax+44h]
  '00487024: push ecx
  '00487025: call [00401024h]
  '0048702B: mov edx, eax
  '0048702D: lea ecx, [ebp-60h]
  '00487030: call [00401378h]
  '00487036: push eax
  '00487037: call [0040108Ch]
  '0048703D: mov edx, eax
  '0048703F: lea ecx, [ebp-64h]
  '00487042: call [00401378h]
  '00487048: push eax
  '00487049: push 0041C0E0h
  '0048704E: call [0040108Ch]
  '00487054: mov edx, eax
  '00487056: lea ecx, [ebp-68h]
  '00487059: call [00401378h]
  '0048705F: fld real8 ptr [ebp-000000A8h]
  '00487065: call [00401348h]
  '0048706B: mov [ebp-00000098h], ax
  '00487072: lea edx, [ebp-68h]
  '00487075: push edx
  '00487076: lea eax, [ebp-00000098h]
  '0048707C: push eax
  '0048707D: mov ecx, [ebp-000000C8h]
  '00487083: mov edx, [ecx]
  '00487085: mov eax, [ebp-000000C8h]
  '0048708B: push eax
  '0048708C: call [edx+00000714h]
  '00487092: fclex 
  '00487094: mov [ebp-000000CCh], eax
  '0048709A: cmp [ebp-000000CCh], 00000000h
  '004870A1: jnl 4870C9h
  '004870A3: push 00000714h
  '004870A8: push 0041C118h
  '004870AD: mov ecx, [ebp-000000C8h]
  '004870B3: push ecx
  '004870B4: mov edx, [ebp-000000CCh]
  '004870BA: push edx
  '004870BB: call [004010A0h]
  '004870C1: mov [ebp-00000114h], eax
  '004870C7: jmp 4870D3h
  '004870C9: mov [ebp-00000114h], 00000000h
  '004870D3: lea eax, [ebp-68h]
  '004870D6: push eax
  '004870D7: lea ecx, [ebp-64h]
  '004870DA: push ecx
  '004870DB: lea edx, [ebp-60h]
  '004870DE: push edx
  '004870DF: lea eax, [ebp-5Ch]
  '004870E2: push eax
  '004870E3: lea ecx, [ebp-58h]
  '004870E6: push ecx
  '004870E7: lea edx, [ebp-54h]
  '004870EA: push edx
  '004870EB: lea eax, [ebp-50h]
  '004870EE: push eax
  '004870EF: lea ecx, [ebp-4Ch]
  '004870F2: push ecx
  '004870F3: lea edx, [ebp-48h]
  '004870F6: push edx
  '004870F7: lea eax, [ebp-44h]
  '004870FA: push eax
  '004870FB: lea ecx, [ebp-40h]
  '004870FE: push ecx
  '004870FF: lea edx, [ebp-3Ch]
  '00487102: push edx
  '00487103: lea eax, [ebp-38h]
  '00487106: push eax
  '00487107: lea ecx, [ebp-34h]
  '0048710A: push ecx
  '0048710B: lea edx, [ebp-30h]
  '0048710E: push edx
  '0048710F: lea eax, [ebp-2Ch]
  '00487112: push eax
  '00487113: lea ecx, [ebp-28h]
  '00487116: push ecx
  '00487117: push 00000011h
  '00487119: call [004012E8h]
  '0048711F: add esp, 00000048h
  '00487122: lea edx, [ebp-74h]
  '00487125: push edx
  '00487126: lea eax, [ebp-70h]
  '00487129: push eax
  '0048712A: lea ecx, [ebp-6Ch]
  '0048712D: push ecx
  '0048712E: push 00000003h
  '00487130: call [00401064h]
  '00487136: add esp, 00000010h
  '00487139: lea ecx, [ebp-00000084h]
  '0048713F: call [00401030h]
  '00487145: mov [ebp-10h], 00000000h
  '0048714C: wait 
  '0048714D: push 004871C8h
  '00487152: jmp 4871C7h
  '00487154: lea edx, [ebp-68h]
  '00487157: push edx
  '00487158: lea eax, [ebp-64h]
  '0048715B: push eax
  '0048715C: lea ecx, [ebp-60h]
  '0048715F: push ecx
  '00487160: lea edx, [ebp-5Ch]
  '00487163: push edx
  '00487164: lea eax, [ebp-58h]
  '00487167: push eax
  '00487168: lea ecx, [ebp-54h]
  '0048716B: push ecx
  '0048716C: lea edx, [ebp-50h]
  '0048716F: push edx
  '00487170: lea eax, [ebp-4Ch]
  '00487173: push eax
  '00487174: lea ecx, [ebp-48h]
  '00487177: push ecx
  '00487178: lea edx, [ebp-44h]
  '0048717B: push edx
  '0048717C: lea eax, [ebp-40h]
  '0048717F: push eax
  '00487180: lea ecx, [ebp-3Ch]
  '00487183: push ecx
  '00487184: lea edx, [ebp-38h]
  '00487187: push edx
  '00487188: lea eax, [ebp-34h]
  '0048718B: push eax
  '0048718C: lea ecx, [ebp-30h]
  '0048718F: push ecx
  '00487190: lea edx, [ebp-2Ch]
  '00487193: push edx
  '00487194: lea eax, [ebp-28h]
  '00487197: push eax
  '00487198: push 00000011h
  '0048719A: call [004012E8h]
  '004871A0: add esp, 00000048h
  '004871A3: lea ecx, [ebp-74h]
  '004871A6: push ecx
  '004871A7: lea edx, [ebp-70h]
  '004871AA: push edx
  '004871AB: lea eax, [ebp-6Ch]
  '004871AE: push eax
  '004871AF: push 00000003h
  '004871B1: call [00401064h]
  '004871B7: add esp, 00000010h
  '004871BA: lea ecx, [ebp-00000084h]
  '004871C0: call [00401030h]
  '004871C6: ret 
End Sub
Private Sub tmrKeys__489870
  '00489870: push ebp
  '00489871: mov ebp, esp
  '00489873: sub esp, 00000018h
  '00489876: push 004081B6h
  '0048987B: mov eax, fs:[00h]
  '00489881: push eax
  '00489882: mov fs:[00000000h], esp
  '00489889: mov eax, 00000070h
  '0048988E: call 004081B0h
  '00489893: push ebx
  '00489894: push esi
  '00489895: push edi
  '00489896: mov [ebp-18h], esp
  '00489899: mov [ebp-14h], 00401650h
  '004898A0: mov eax, [ebp+08h]
  '004898A3: and eax, 00000001h
  '004898A6: mov [ebp-10h], eax
  '004898A9: mov ecx, [ebp+08h]
  '004898AC: and ecx, FFFFFFFEh
  '004898AF: mov [ebp+08h], ecx
  '004898B2: mov [ebp-0Ch], 00000000h
  '004898B9: mov edx, [ebp+08h]
  '004898BC: mov eax, [edx]
  '004898BE: mov ecx, [ebp+08h]
  '004898C1: push ecx
  '004898C2: call [eax+04h]
  '004898C5: mov [ebp-04h], 00000001h
  '004898CC: mov [ebp-04h], 00000002h
  '004898D3: push FFFFFFFFh
  '004898D5: call [004010E8h]
  '004898DB: mov [ebp-04h], 00000003h
  '004898E2: mov edx, [ebp+08h]
  '004898E5: mov eax, [edx+68h]
  '004898E8: push eax
  '004898E9: push 00000000h
  '004898EB: call [00401184h]
  '004898F1: test eax, eax
  '004898F3: jz 00489B44h
  '004898F9: mov [ebp-04h], 00000004h
  '00489900: mov ecx, [ebp+08h]
  '00489903: mov edx, [ecx+68h]
  '00489906: mov ecx, [ebp+08h]
  '00489909: add ecx, 0000006Ch
  '0048990C: call [004012D8h]
  '00489912: mov [ebp-04h], 00000005h
  '00489919: xor edx, edx
  '0048991B: mov ecx, [ebp+08h]
  '0048991E: add ecx, 00000068h
  '00489921: call [004012D8h]
  '00489927: mov [ebp-04h], 00000006h
  '0048992E: lea edx, [ebp-28h]
  '00489931: push edx
  '00489932: mov eax, [ebp+08h]
  '00489935: mov ecx, [eax]
  '00489937: mov edx, [ebp+08h]
  '0048993A: push edx
  '0048993B: call [ecx+000001C0h]
  '00489941: fclex 
  '00489943: mov [ebp-68h], eax
  '00489946: cmp [ebp-68h], 00000000h
  '0048994A: jnl 48996Ch
  '0048994C: push 000001C0h
  '00489951: push 0041BC88h
  '00489956: mov eax, [ebp+08h]
  '00489959: push eax
  '0048995A: mov ecx, [ebp-68h]
  '0048995D: push ecx
  '0048995E: call [004010A0h]
  '00489964: mov [ebp-00000088h], eax
  '0048996A: jmp 489976h
  '0048996C: mov [ebp-00000088h], 00000000h
  '00489976: mov [ebp-40h], 80020004h
  '0048997D: mov [ebp-48h], 0000000Ah
  '00489984: lea edx, [ebp-48h]
  '00489987: push edx
  '00489988: push 00000004h
  '0048998A: mov eax, [ebp-28h]
  '0048998D: push eax
  '0048998E: call [00401148h]
  '00489994: mov edx, eax
  '00489996: lea ecx, [ebp-2Ch]
  '00489999: call [00401378h]
  '0048999F: push eax
  '004899A0: call [004013BCh]
  '004899A6: fstp real8 ptr [ebp-64h]
  '004899A9: cmp [00541024h], 00000000h
  '004899B0: jnz 4899CEh
  '004899B2: push 00541024h
  '004899B7: push 00413334h
  '004899BC: call [004012B8h]
  '004899C2: mov [ebp-0000008Ch], 00541024h
  '004899CC: jmp 4899D8h
  '004899CE: mov [ebp-0000008Ch], 00541024h
  '004899D8: mov ecx, [ebp-0000008Ch]
  '004899DE: mov edx, [ecx]
  '004899E0: mov [ebp-6Ch], edx
  '004899E3: push 0041E55Ch
  '004899E8: mov eax, [ebp+08h]
  '004899EB: mov ecx, [eax+6Ch]
  '004899EE: push ecx
  '004899EF: call [0040108Ch]
  '004899F5: mov edx, eax
  '004899F7: lea ecx, [ebp-30h]
  '004899FA: call [00401378h]
  '00489A00: fld real8 ptr [ebp-64h]
  '00489A03: call [00401348h]
  '00489A09: mov [ebp-5Ch], ax
  '00489A0D: lea edx, [ebp-30h]
  '00489A10: push edx
  '00489A11: lea eax, [ebp-5Ch]
  '00489A14: push eax
  '00489A15: mov ecx, [ebp-6Ch]
  '00489A18: mov edx, [ecx]
  '00489A1A: mov eax, [ebp-6Ch]
  '00489A1D: push eax
  '00489A1E: call [edx+00000714h]
  '00489A24: fclex 
  '00489A26: mov [ebp-70h], eax
  '00489A29: cmp [ebp-70h], 00000000h
  '00489A2D: jnl 489A4Fh
  '00489A2F: push 00000714h
  '00489A34: push 0041C118h
  '00489A39: mov ecx, [ebp-6Ch]
  '00489A3C: push ecx
  '00489A3D: mov edx, [ebp-70h]
  '00489A40: push edx
  '00489A41: call [004010A0h]
  '00489A47: mov [ebp-00000090h], eax
  '00489A4D: jmp 489A59h
  '00489A4F: mov [ebp-00000090h], 00000000h
  '00489A59: lea eax, [ebp-30h]
  '00489A5C: push eax
  '00489A5D: lea ecx, [ebp-2Ch]
  '00489A60: push ecx
  '00489A61: lea edx, [ebp-28h]
  '00489A64: push edx
  '00489A65: push 00000003h
  '00489A67: call [004012E8h]
  '00489A6D: add esp, 00000010h
  '00489A70: lea ecx, [ebp-48h]
  '00489A73: call [00401030h]
  '00489A79: mov [ebp-04h], 00000007h
  '00489A80: push 0041E578h
  '00489A85: mov eax, [ebp+08h]
  '00489A88: mov ecx, [eax+6Ch]
  '00489A8B: push ecx
  '00489A8C: call [0040108Ch]
  '00489A92: mov edx, eax
  '00489A94: lea ecx, [ebp-28h]
  '00489A97: call [00401378h]
  '00489A9D: push eax
  '00489A9E: push 0041E5A8h
  '00489AA3: call [0040108Ch]
  '00489AA9: mov edx, eax
  '00489AAB: lea ecx, [ebp-2Ch]
  '00489AAE: call [00401378h]
  '00489AB4: push eax
  '00489AB5: mov edx, [ebp+08h]
  '00489AB8: mov eax, [edx+6Ch]
  '00489ABB: push eax
  '00489ABC: call [00401044h]
  '00489AC2: push eax
  '00489AC3: call [00401024h]
  '00489AC9: mov edx, eax
  '00489ACB: lea ecx, [ebp-30h]
  '00489ACE: call [00401378h]
  '00489AD4: push eax
  '00489AD5: call [0040108Ch]
  '00489ADB: mov edx, eax
  '00489ADD: lea ecx, [ebp-34h]
  '00489AE0: call [00401378h]
  '00489AE6: push eax
  '00489AE7: push 0041E5B4h
  '00489AEC: call [0040108Ch]
  '00489AF2: mov edx, eax
  '00489AF4: lea ecx, [ebp-38h]
  '00489AF7: call [00401378h]
  '00489AFD: lea ecx, [ebp-38h]
  '00489B00: push ecx
  '00489B01: mov edx, [ebp+08h]
  '00489B04: mov eax, [edx]
  '00489B06: mov ecx, [ebp+08h]
  '00489B09: push ecx
  '00489B0A: call [eax+00000740h]
  '00489B10: lea edx, [ebp-38h]
  '00489B13: push edx
  '00489B14: lea eax, [ebp-34h]
  '00489B17: push eax
  '00489B18: lea ecx, [ebp-30h]
  '00489B1B: push ecx
  '00489B1C: lea edx, [ebp-2Ch]
  '00489B1F: push edx
  '00489B20: lea eax, [ebp-28h]
  '00489B23: push eax
  '00489B24: push 00000005h
  '00489B26: call [004012E8h]
  '00489B2C: add esp, 00000018h
  '00489B2F: mov [ebp-04h], 00000008h
  '00489B36: xor edx, edx
  '00489B38: mov ecx, [ebp+08h]
  '00489B3B: add ecx, 0000006Ch
  '00489B3E: call [004012D8h]
  '00489B44: mov [ebp-10h], 00000000h
  '00489B4B: wait 
  '00489B4C: push 00489B7Dh
  '00489B51: jmp 489B7Ch
  '00489B53: lea ecx, [ebp-38h]
  '00489B56: push ecx
  '00489B57: lea edx, [ebp-34h]
  '00489B5A: push edx
  '00489B5B: lea eax, [ebp-30h]
  '00489B5E: push eax
  '00489B5F: lea ecx, [ebp-2Ch]
  '00489B62: push ecx
  '00489B63: lea edx, [ebp-28h]
  '00489B66: push edx
  '00489B67: push 00000005h
  '00489B69: call [004012E8h]
  '00489B6F: add esp, 00000018h
  '00489B72: lea ecx, [ebp-48h]
  '00489B75: call [00401030h]
  '00489B7B: ret 
End Sub
Private Sub mnu_saveimage__4871F0
  '004871F0: push ebp
  '004871F1: mov ebp, esp
  '004871F3: sub esp, 00000018h
  '004871F6: push 004081B6h
  '004871FB: mov eax, fs:[00h]
  '00487201: push eax
  '00487202: mov fs:[00000000h], esp
  '00487209: mov eax, 00000084h
  '0048720E: call 004081B0h
  '00487213: push ebx
  '00487214: push esi
  '00487215: push edi
  '00487216: mov [ebp-18h], esp
  '00487219: mov [ebp-14h], 00401438h
  '00487220: mov eax, [ebp+08h]
  '00487223: and eax, 00000001h
  '00487226: mov [ebp-10h], eax
  '00487229: mov ecx, [ebp+08h]
  '0048722C: and ecx, FFFFFFFEh
  '0048722F: mov [ebp+08h], ecx
  '00487232: mov [ebp-0Ch], 00000000h
  '00487239: mov edx, [ebp+08h]
  '0048723C: mov eax, [edx]
  '0048723E: mov ecx, [ebp+08h]
  '00487241: push ecx
  '00487242: call [eax+04h]
  '00487245: mov [ebp-04h], 00000001h
  '0048724C: mov [ebp-04h], 00000002h
  '00487253: push FFFFFFFFh
  '00487255: call [004010E8h]
  '0048725B: mov [ebp-04h], 00000003h
  '00487262: lea edx, [ebp-2Ch]
  '00487265: push edx
  '00487266: mov eax, [ebp+08h]
  '00487269: mov ecx, [eax]
  '0048726B: mov edx, [ebp+08h]
  '0048726E: push edx
  '0048726F: call [ecx+50h]
  '00487272: fclex 
  '00487274: mov [ebp-60h], eax
  '00487277: cmp [ebp-60h], 00000000h
  '0048727B: jnl 48729Ah
  '0048727D: push 00000050h
  '0048727F: push 0041BC88h
  '00487284: mov eax, [ebp+08h]
  '00487287: push eax
  '00487288: mov ecx, [ebp-60h]
  '0048728B: push ecx
  '0048728C: call [004010A0h]
  '00487292: mov [ebp-0000008Ch], eax
  '00487298: jmp 4872A4h
  '0048729A: mov [ebp-0000008Ch], 00000000h
  '004872A4: push 0041D0A8h
  '004872A9: push 00000000h
  '004872AB: push FFFFFFFFh
  '004872AD: push 00000001h
  '004872AF: push 0041BC60h
  '004872B4: push 0041D0B4h
  '004872B9: mov edx, [ebp-2Ch]
  '004872BC: push edx
  '004872BD: call [00401230h]
  '004872C3: mov edx, eax
  '004872C5: lea ecx, [ebp-30h]
  '004872C8: call [00401378h]
  '004872CE: push eax
  '004872CF: call [0040108Ch]
  '004872D5: mov edx, eax
  '004872D7: lea ecx, [ebp-34h]
  '004872DA: call [00401378h]
  '004872E0: push eax
  '004872E1: push 0041D0CCh
  '004872E6: call [0040108Ch]
  '004872EC: mov edx, eax
  '004872EE: lea ecx, [ebp-38h]
  '004872F1: call [00401378h]
  '004872F7: mov edx, eax
  '004872F9: mov ecx, [ebp+08h]
  '004872FC: add ecx, 00000050h
  '004872FF: call [004012D8h]
  '00487305: lea eax, [ebp-38h]
  '00487308: push eax
  '00487309: lea ecx, [ebp-34h]
  '0048730C: push ecx
  '0048730D: lea edx, [ebp-30h]
  '00487310: push edx
  '00487311: lea eax, [ebp-2Ch]
  '00487314: push eax
  '00487315: push 00000004h
  '00487317: call [004012E8h]
  '0048731D: add esp, 00000014h
  '00487320: mov [ebp-04h], 00000004h
  '00487327: push 00409784h
  '0048732C: call [00401200h]
  '00487332: push eax
  '00487333: lea ecx, [ebp-24h]
  '00487336: push ecx
  '00487337: call [004010E4h]
  '0048733D: mov [ebp-04h], 00000005h
  '00487344: cmp [0054238Ch], 00000000h
  '0048734B: jnz 487369h
  '0048734D: push 0054238Ch
  '00487352: push 0041D9E0h
  '00487357: call [004012B8h]
  '0048735D: mov [ebp-00000090h], 0054238Ch
  '00487367: jmp 487373h
  '00487369: mov [ebp-00000090h], 0054238Ch
  '00487373: mov edx, [ebp-00000090h]
  '00487379: mov eax, [edx]
  '0048737B: mov [ebp-60h], eax
  '0048737E: lea ecx, [ebp-44h]
  '00487381: push ecx
  '00487382: mov edx, [ebp-60h]
  '00487385: mov eax, [edx]
  '00487387: mov ecx, [ebp-60h]
  '0048738A: push ecx
  '0048738B: call [eax+14h]
  '0048738E: fclex 
  '00487390: mov [ebp-64h], eax
  '00487393: cmp [ebp-64h], 00000000h
  '00487397: jnl 4873B6h
  '00487399: push 00000014h
  '0048739B: push 0041D9D0h
  '004873A0: mov edx, [ebp-60h]
  '004873A3: push edx
  '004873A4: mov eax, [ebp-64h]
  '004873A7: push eax
  '004873A8: call [004010A0h]
  '004873AE: mov [ebp-00000094h], eax
  '004873B4: jmp 4873C0h
  '004873B6: mov [ebp-00000094h], 00000000h
  '004873C0: mov ecx, [ebp-44h]
  '004873C3: mov [ebp-68h], ecx
  '004873C6: lea edx, [ebp-2Ch]
  '004873C9: push edx
  '004873CA: mov eax, [ebp-68h]
  '004873CD: mov ecx, [eax]
  '004873CF: mov edx, [ebp-68h]
  '004873D2: push edx
  '004873D3: call [ecx+50h]
  '004873D6: fclex 
  '004873D8: mov [ebp-6Ch], eax
  '004873DB: cmp [ebp-6Ch], 00000000h
  '004873DF: jnl 4873FEh
  '004873E1: push 00000050h
  '004873E3: push 0041D9F0h
  '004873E8: mov eax, [ebp-68h]
  '004873EB: push eax
  '004873EC: mov ecx, [ebp-6Ch]
  '004873EF: push ecx
  '004873F0: call [004010A0h]
  '004873F6: mov [ebp-00000098h], eax
  '004873FC: jmp 487408h
  '004873FE: mov [ebp-00000098h], 00000000h
  '00487408: lea edx, [ebp-50h]
  '0048740B: push edx
  '0048740C: mov eax, [ebp+08h]
  '0048740F: mov ecx, [eax]
  '00487411: mov edx, [ebp+08h]
  '00487414: push edx
  '00487415: call [ecx+58h]
  '00487418: fclex 
  '0048741A: mov [ebp-70h], eax
  '0048741D: cmp [ebp-70h], 00000000h
  '00487421: jnl 487440h
  '00487423: push 00000058h
  '00487425: push 0041BC88h
  '0048742A: mov eax, [ebp+08h]
  '0048742D: push eax
  '0048742E: mov ecx, [ebp-70h]
  '00487431: push ecx
  '00487432: call [004010A0h]
  '00487438: mov [ebp-0000009Ch], eax
  '0048743E: jmp 48744Ah
  '00487440: mov [ebp-0000009Ch], 00000000h
  '0048744A: mov [ebp-5Ch], 00000000h
  '00487451: mov edx, [ebp-50h]
  '00487454: mov [ebp-58h], edx
  '00487457: mov edx, 0041DA30h
  '0048745C: lea ecx, [ebp-40h]
  '0048745F: call [004012D8h]
  '00487465: mov edx, 0041DA1Ch
  '0048746A: lea ecx, [ebp-3Ch]
  '0048746D: call [004012D8h]
  '00487473: mov eax, [ebp-2Ch]
  '00487476: push eax
  '00487477: push 0041DA04h
  '0048747C: call [0040108Ch]
  '00487482: mov edx, eax
  '00487484: lea ecx, [ebp-38h]
  '00487487: call [00401378h]
  '0048748D: mov [ebp-54h], 00000001h
  '00487494: mov edx, 0041D98Ch
  '00487499: lea ecx, [ebp-34h]
  '0048749C: call [004012D8h]
  '004874A2: mov word ptr [ebp-48h], FFFFh
  '004874A8: xor edx, edx
  '004874AA: lea ecx, [ebp-30h]
  '004874AD: call [004012D8h]
  '004874B3: lea ecx, [ebp-4Ch]
  '004874B6: push ecx
  '004874B7: lea edx, [ebp-5Ch]
  '004874BA: push edx
  '004874BB: lea eax, [ebp-58h]
  '004874BE: push eax
  '004874BF: lea ecx, [ebp-40h]
  '004874C2: push ecx
  '004874C3: lea edx, [ebp-3Ch]
  '004874C6: push edx
  '004874C7: lea eax, [ebp-38h]
  '004874CA: push eax
  '004874CB: lea ecx, [ebp-54h]
  '004874CE: push ecx
  '004874CF: lea edx, [ebp-34h]
  '004874D2: push edx
  '004874D3: lea eax, [ebp-48h]
  '004874D6: push eax
  '004874D7: lea ecx, [ebp-30h]
  '004874DA: push ecx
  '004874DB: lea edx, [ebp-28h]
  '004874DE: push edx
  '004874DF: mov eax, [ebp-24h]
  '004874E2: mov ecx, [eax]
  '004874E4: mov edx, [ebp-24h]
  '004874E7: push edx
  '004874E8: call [ecx+28h]
  '004874EB: fclex 
  '004874ED: mov [ebp-74h], eax
  '004874F0: cmp [ebp-74h], 00000000h
  '004874F4: jnl 487513h
  '004874F6: push 00000028h
  '004874F8: push 0041D108h
  '004874FD: mov eax, [ebp-24h]
  '00487500: push eax
  '00487501: mov ecx, [ebp-74h]
  '00487504: push ecx
  '00487505: call [004010A0h]
  '0048750B: mov [ebp-000000A0h], eax
  '00487511: jmp 48751Dh
  '00487513: mov [ebp-000000A0h], 00000000h
  '0048751D: lea edx, [ebp-40h]
  '00487520: push edx
  '00487521: lea eax, [ebp-3Ch]
  '00487524: push eax
  '00487525: lea ecx, [ebp-38h]
  '00487528: push ecx
  '00487529: lea edx, [ebp-34h]
  '0048752C: push edx
  '0048752D: lea eax, [ebp-30h]
  '00487530: push eax
  '00487531: lea ecx, [ebp-2Ch]
  '00487534: push ecx
  '00487535: push 00000006h
  '00487537: call [004012E8h]
  '0048753D: add esp, 0000001Ch
  '00487540: lea ecx, [ebp-44h]
  '00487543: call [004013B8h]
  '00487549: mov [ebp-04h], 00000006h
  '00487550: mov edx, [ebp-28h]
  '00487553: push edx
  '00487554: push 0041BC60h
  '00487559: call [00401184h]
  '0048755F: test eax, eax
  '00487561: jnz 487568h
  '00487563: jmp 004875FBh
  '00487568: mov [ebp-04h], 00000009h
  '0048756F: lea eax, [ebp-48h]
  '00487572: push eax
  '00487573: mov ecx, [ebp+08h]
  '00487576: mov edx, [ecx+50h]
  '00487579: push edx
  '0048757A: mov eax, [ebp+08h]
  '0048757D: mov ecx, [eax]
  '0048757F: mov edx, [ebp+08h]
  '00487582: push edx
  '00487583: call [ecx+000006F8h]
  '00487589: mov [ebp-60h], eax
  '0048758C: cmp [ebp-60h], 00000000h
  '00487590: jnl 4875B2h
  '00487592: push 000006F8h
  '00487597: push 0041BCB8h
  '0048759C: mov eax, [ebp+08h]
  '0048759F: push eax
  '004875A0: mov ecx, [ebp-60h]
  '004875A3: push ecx
  '004875A4: call [004010A0h]
  '004875AA: mov [ebp-000000A4h], eax
  '004875B0: jmp 4875BCh
  '004875B2: mov [ebp-000000A4h], 00000000h
  '004875BC: movsx edx, word ptr [ebp-48h]
  '004875C0: test edx, edx
  '004875C2: jz 4875DCh
  '004875C4: mov [ebp-04h], 0000000Ah
  '004875CB: mov eax, [ebp-28h]
  '004875CE: push eax
  '004875CF: mov ecx, [ebp+08h]
  '004875D2: mov edx, [ecx+50h]
  '004875D5: push edx
  '004875D6: call [004012ECh]
  '004875DC: mov [ebp-04h], 0000000Ch
  '004875E3: push 0041D108h
  '004875E8: push 00000000h
  '004875EA: call [0040137Ch]
  '004875F0: push eax
  '004875F1: lea eax, [ebp-24h]
  '004875F4: push eax
  '004875F5: call [004010E4h]
  '004875FB: mov [ebp-10h], 00000000h
  '00487602: push 00487649h
  '00487607: jmp 487636h
  '00487609: lea ecx, [ebp-40h]
  '0048760C: push ecx
  '0048760D: lea edx, [ebp-3Ch]
  '00487610: push edx
  '00487611: lea eax, [ebp-38h]
  '00487614: push eax
  '00487615: lea ecx, [ebp-34h]
  '00487618: push ecx
  '00487619: lea edx, [ebp-30h]
  '0048761C: push edx
  '0048761D: lea eax, [ebp-2Ch]
  '00487620: push eax
  '00487621: push 00000006h
  '00487623: call [004012E8h]
  '00487629: add esp, 0000001Ch
  '0048762C: lea ecx, [ebp-44h]
  '0048762F: call [004013B8h]
  '00487635: ret 
End Sub
Private Sub send_keystrokes__489440
  '00489440: push ebp
  '00489441: mov ebp, esp
  '00489443: sub esp, 00000018h
  '00489446: push 004081B6h
  '0048944B: mov eax, fs:[00h]
  '00489451: push eax
  '00489452: mov fs:[00000000h], esp
  '00489459: mov eax, 00000080h
  '0048945E: call 004081B0h
  '00489463: push ebx
  '00489464: push esi
  '00489465: push edi
  '00489466: mov [ebp-18h], esp
  '00489469: mov [ebp-14h], 00401608h
  '00489470: mov eax, [ebp+08h]
  '00489473: and eax, 00000001h
  '00489476: mov [ebp-10h], eax
  '00489479: mov ecx, [ebp+08h]
  '0048947C: and ecx, FFFFFFFEh
  '0048947F: mov [ebp+08h], ecx
  '00489482: mov [ebp-0Ch], 00000000h
  '00489489: mov edx, [ebp+08h]
  '0048948C: mov eax, [edx]
  '0048948E: mov ecx, [ebp+08h]
  '00489491: push ecx
  '00489492: call [eax+04h]
  '00489495: mov [ebp-04h], 00000001h
  '0048949C: mov [ebp-04h], 00000002h
  '004894A3: push FFFFFFFFh
  '004894A5: call [004010E8h]
  '004894AB: mov [ebp-04h], 00000003h
  '004894B2: lea edx, [ebp-28h]
  '004894B5: push edx
  '004894B6: mov eax, [ebp+08h]
  '004894B9: mov ecx, [eax]
  '004894BB: mov edx, [ebp+08h]
  '004894BE: push edx
  '004894BF: call [ecx+000001C0h]
  '004894C5: fclex 
  '004894C7: mov [ebp-6Ch], eax
  '004894CA: cmp [ebp-6Ch], 00000000h
  '004894CE: jnl 4894F0h
  '004894D0: push 000001C0h
  '004894D5: push 0041BC88h
  '004894DA: mov eax, [ebp+08h]
  '004894DD: push eax
  '004894DE: mov ecx, [ebp-6Ch]
  '004894E1: push ecx
  '004894E2: call [004010A0h]
  '004894E8: mov [ebp-0000008Ch], eax
  '004894EE: jmp 4894FAh
  '004894F0: mov [ebp-0000008Ch], 00000000h
  '004894FA: mov [ebp-3Ch], 80020004h
  '00489501: mov [ebp-44h], 0000000Ah
  '00489508: lea edx, [ebp-44h]
  '0048950B: push edx
  '0048950C: push 00000004h
  '0048950E: mov eax, [ebp-28h]
  '00489511: push eax
  '00489512: call [00401148h]
  '00489518: mov edx, eax
  '0048951A: lea ecx, [ebp-34h]
  '0048951D: call [00401378h]
  '00489523: mov word ptr [ebp-68h], FFFFh
  '00489529: mov ecx, [ebp-34h]
  '0048952C: mov [ebp-00000088h], ecx
  '00489532: mov [ebp-34h], 00000000h
  '00489539: push 0041E4BCh
  '0048953E: mov edx, [ebp-00000088h]
  '00489544: lea ecx, [ebp-2Ch]
  '00489547: call [00401378h]
  '0048954D: push eax
  '0048954E: call [0040108Ch]
  '00489554: mov edx, eax
  '00489556: lea ecx, [ebp-30h]
  '00489559: call [00401378h]
  '0048955F: lea edx, [ebp-68h]
  '00489562: push edx
  '00489563: lea eax, [ebp-30h]
  '00489566: push eax
  '00489567: call 005139F0h
  '0048956C: neg ax
  '0048956F: sbb eax, eax
  '00489571: inc eax
  '00489572: neg eax
  '00489574: mov [ebp-70h], ax
  '00489578: lea ecx, [ebp-34h]
  '0048957B: push ecx
  '0048957C: lea edx, [ebp-30h]
  '0048957F: push edx
  '00489580: lea eax, [ebp-2Ch]
  '00489583: push eax
  '00489584: lea ecx, [ebp-28h]
  '00489587: push ecx
  '00489588: push 00000004h
  '0048958A: call [004012E8h]
  '00489590: add esp, 00000014h
  '00489593: lea ecx, [ebp-44h]
  '00489596: call [00401030h]
  '0048959C: movsx edx, word ptr [ebp-70h]
  '004895A0: test edx, edx
  '004895A2: jz 00489807h
  '004895A8: mov [ebp-04h], 00000004h
  '004895AF: push 0040D854h
  '004895B4: call [00401200h]
  '004895BA: push eax
  '004895BB: lea eax, [ebp-24h]
  '004895BE: push eax
  '004895BF: call [004010E4h]
  '004895C5: mov [ebp-04h], 00000005h
  '004895CC: lea ecx, [ebp-28h]
  '004895CF: push ecx
  '004895D0: mov edx, [ebp+08h]
  '004895D3: mov eax, [edx]
  '004895D5: mov ecx, [ebp+08h]
  '004895D8: push ecx
  '004895D9: call [eax+000001C0h]
  '004895DF: fclex 
  '004895E1: mov [ebp-6Ch], eax
  '004895E4: cmp [ebp-6Ch], 00000000h
  '004895E8: jnl 48960Ah
  '004895EA: push 000001C0h
  '004895EF: push 0041BC88h
  '004895F4: mov edx, [ebp+08h]
  '004895F7: push edx
  '004895F8: mov eax, [ebp-6Ch]
  '004895FB: push eax
  '004895FC: call [004010A0h]
  '00489602: mov [ebp-00000090h], eax
  '00489608: jmp 489614h
  '0048960A: mov [ebp-00000090h], 00000000h
  '00489614: mov [ebp-3Ch], 80020004h
  '0048961B: mov [ebp-44h], 0000000Ah
  '00489622: push 0041E4BCh
  '00489627: lea ecx, [ebp-44h]
  '0048962A: push ecx
  '0048962B: push 00000004h
  '0048962D: mov edx, [ebp-28h]
  '00489630: push edx
  '00489631: call [00401148h]
  '00489637: mov edx, eax
  '00489639: lea ecx, [ebp-2Ch]
  '0048963C: call [00401378h]
  '00489642: push eax
  '00489643: call [0040108Ch]
  '00489649: mov edx, eax
  '0048964B: lea ecx, [ebp-30h]
  '0048964E: call [00401378h]
  '00489654: push eax
  '00489655: mov eax, [ebp-24h]
  '00489658: mov ecx, [eax]
  '0048965A: mov edx, [ebp-24h]
  '0048965D: push edx
  '0048965E: call [ecx+000001C4h]
  '00489664: fclex 
  '00489666: mov [ebp-70h], eax
  '00489669: cmp [ebp-70h], 00000000h
  '0048966D: jnl 48968Fh
  '0048966F: push 000001C4h
  '00489674: push 0041E4C4h
  '00489679: mov eax, [ebp-24h]
  '0048967C: push eax
  '0048967D: mov ecx, [ebp-70h]
  '00489680: push ecx
  '00489681: call [004010A0h]
  '00489687: mov [ebp-00000094h], eax
  '0048968D: jmp 489699h
  '0048968F: mov [ebp-00000094h], 00000000h
  '00489699: lea edx, [ebp-30h]
  '0048969C: push edx
  '0048969D: lea eax, [ebp-2Ch]
  '004896A0: push eax
  '004896A1: lea ecx, [ebp-28h]
  '004896A4: push ecx
  '004896A5: push 00000003h
  '004896A7: call [004012E8h]
  '004896AD: add esp, 00000010h
  '004896B0: lea ecx, [ebp-44h]
  '004896B3: call [00401030h]
  '004896B9: mov [ebp-04h], 00000006h
  '004896C0: lea edx, [ebp-28h]
  '004896C3: push edx
  '004896C4: mov eax, [ebp+08h]
  '004896C7: mov ecx, [eax]
  '004896C9: mov edx, [ebp+08h]
  '004896CC: push edx
  '004896CD: call [ecx+50h]
  '004896D0: fclex 
  '004896D2: mov [ebp-6Ch], eax
  '004896D5: cmp [ebp-6Ch], 00000000h
  '004896D9: jnl 4896F8h
  '004896DB: push 00000050h
  '004896DD: push 0041BC88h
  '004896E2: mov eax, [ebp+08h]
  '004896E5: push eax
  '004896E6: mov ecx, [ebp-6Ch]
  '004896E9: push ecx
  '004896EA: call [004010A0h]
  '004896F0: mov [ebp-00000098h], eax
  '004896F6: jmp 489702h
  '004896F8: mov [ebp-00000098h], 00000000h
  '00489702: mov edx, [ebp-28h]
  '00489705: push edx
  '00489706: mov eax, [ebp-24h]
  '00489709: mov ecx, [eax]
  '0048970B: mov edx, [ebp-24h]
  '0048970E: push edx
  '0048970F: call [ecx+54h]
  '00489712: fclex 
  '00489714: mov [ebp-70h], eax
  '00489717: cmp [ebp-70h], 00000000h
  '0048971B: jnl 48973Ah
  '0048971D: push 00000054h
  '0048971F: push 0041E4C4h
  '00489724: mov eax, [ebp-24h]
  '00489727: push eax
  '00489728: mov ecx, [ebp-70h]
  '0048972B: push ecx
  '0048972C: call [004010A0h]
  '00489732: mov [ebp-0000009Ch], eax
  '00489738: jmp 489744h
  '0048973A: mov [ebp-0000009Ch], 00000000h
  '00489744: lea ecx, [ebp-28h]
  '00489747: call [004013B4h]
  '0048974D: mov [ebp-04h], 00000007h
  '00489754: call [00401104h]
  '0048975A: mov [ebp-04h], 00000008h
  '00489761: mov [ebp-5Ch], 80020004h
  '00489768: mov [ebp-64h], 0000000Ah
  '0048976F: mov [ebp-4Ch], 80020004h
  '00489776: mov [ebp-54h], 0000000Ah
  '0048977D: mov eax, 00000010h
  '00489782: call 004081B0h
  '00489787: mov edx, esp
  '00489789: mov eax, [ebp-64h]
  '0048978C: mov [edx], eax
  '0048978E: mov ecx, [ebp-60h]
  '00489791: mov [edx+04h], ecx
  '00489794: mov eax, [ebp-5Ch]
  '00489797: mov [edx+08h], eax
  '0048979A: mov ecx, [ebp-58h]
  '0048979D: mov [edx+0Ch], ecx
  '004897A0: mov eax, 00000010h
  '004897A5: call 004081B0h
  '004897AA: mov edx, esp
  '004897AC: mov eax, [ebp-54h]
  '004897AF: mov [edx], eax
  '004897B1: mov ecx, [ebp-50h]
  '004897B4: mov [edx+04h], ecx
  '004897B7: mov eax, [ebp-4Ch]
  '004897BA: mov [edx+08h], eax
  '004897BD: mov ecx, [ebp-48h]
  '004897C0: mov [edx+0Ch], ecx
  '004897C3: mov edx, [ebp-24h]
  '004897C6: mov eax, [edx]
  '004897C8: mov ecx, [ebp-24h]
  '004897CB: push ecx
  '004897CC: call [eax+000002B0h]
  '004897D2: fclex 
  '004897D4: mov [ebp-6Ch], eax
  '004897D7: cmp [ebp-6Ch], 00000000h
  '004897DB: jnl 4897FDh
  '004897DD: push 000002B0h
  '004897E2: push 0041E4C4h
  '004897E7: mov edx, [ebp-24h]
  '004897EA: push edx
  '004897EB: mov eax, [ebp-6Ch]
  '004897EE: push eax
  '004897EF: call [004010A0h]
  '004897F5: mov [ebp-000000A0h], eax
  '004897FB: jmp 489807h
  '004897FD: mov [ebp-000000A0h], 00000000h
  '00489807: mov [ebp-10h], 00000000h
  '0048980E: push 00489844h
  '00489813: jmp 48983Ah
  '00489815: lea ecx, [ebp-34h]
  '00489818: push ecx
  '00489819: lea edx, [ebp-30h]
  '0048981C: push edx
  '0048981D: lea eax, [ebp-2Ch]
  '00489820: push eax
  '00489821: lea ecx, [ebp-28h]
  '00489824: push ecx
  '00489825: push 00000004h
  '00489827: call [004012E8h]
  '0048982D: add esp, 00000014h
  '00489830: lea ecx, [ebp-44h]
  '00489833: call [00401030h]
  '00489839: ret 
End Sub
Private Sub wskCAPTURE__48ACD0
  '0048ACD0: push ebp
  '0048ACD1: mov ebp, esp
  '0048ACD3: sub esp, 00000018h
  '0048ACD6: push 004081B6h
  '0048ACDB: mov eax, fs:[00h]
  '0048ACE1: push eax
  '0048ACE2: mov fs:[00000000h], esp
  '0048ACE9: mov eax, 00000048h
  '0048ACEE: call 004081B0h
  '0048ACF3: push ebx
  '0048ACF4: push esi
  '0048ACF5: push edi
  '0048ACF6: mov [ebp-18h], esp
  '0048ACF9: mov [ebp-14h], 004017B0h
  '0048AD00: mov eax, [ebp+08h]
  '0048AD03: and eax, 00000001h
  '0048AD06: mov [ebp-10h], eax
  '0048AD09: mov ecx, [ebp+08h]
  '0048AD0C: and ecx, FFFFFFFEh
  '0048AD0F: mov [ebp+08h], ecx
  '0048AD12: mov [ebp-0Ch], 00000000h
  '0048AD19: mov edx, [ebp+08h]
  '0048AD1C: mov eax, [edx]
  '0048AD1E: mov ecx, [ebp+08h]
  '0048AD21: push ecx
  '0048AD22: call [eax+04h]
  '0048AD25: mov [ebp-04h], 00000001h
  '0048AD2C: mov edx, [ebp+18h]
  '0048AD2F: lea ecx, [ebp-28h]
  '0048AD32: call [004012D8h]
  '0048AD38: mov edx, [ebp+1Ch]
  '0048AD3B: lea ecx, [ebp-24h]
  '0048AD3E: call [004012D8h]
  '0048AD44: mov [ebp-04h], 00000002h
  '0048AD4B: cmp word ptr [ebp+0Ch], 274Dh
  '0048AD51: jnz 0048AE28h
  '0048AD57: mov [ebp-04h], 00000003h
  '0048AD5E: push 00000000h
  '0048AD60: push 00000008h
  '0048AD62: mov edx, [ebp+08h]
  '0048AD65: mov eax, [edx]
  '0048AD67: mov ecx, [ebp+08h]
  '0048AD6A: push ecx
  '0048AD6B: call [eax+00000338h]
  '0048AD71: push eax
  '0048AD72: lea edx, [ebp-3Ch]
  '0048AD75: push edx
  '0048AD76: call [004010E4h]
  '0048AD7C: push eax
  '0048AD7D: lea eax, [ebp-4Ch]
  '0048AD80: push eax
  '0048AD81: call [004011E4h]
  '0048AD87: add esp, 00000010h
  '0048AD8A: push eax
  '0048AD8B: call [00401284h]
  '0048AD91: movsx ecx, ax
  '0048AD94: neg ecx
  '0048AD96: sbb ecx, ecx
  '0048AD98: neg ecx
  '0048AD9A: neg ecx
  '0048AD9C: mov [ebp-54h], cx
  '0048ADA0: lea ecx, [ebp-3Ch]
  '0048ADA3: call [004013B8h]
  '0048ADA9: lea ecx, [ebp-4Ch]
  '0048ADAC: call [00401030h]
  '0048ADB2: movsx edx, word ptr [ebp-54h]
  '0048ADB6: test edx, edx
  '0048ADB8: jz 48ADF2h
  '0048ADBA: mov [ebp-04h], 00000004h
  '0048ADC1: push 00000000h
  '0048ADC3: push 00000046h
  '0048ADC5: mov eax, [ebp+08h]
  '0048ADC8: mov ecx, [eax]
  '0048ADCA: mov edx, [ebp+08h]
  '0048ADCD: push edx
  '0048ADCE: call [ecx+00000338h]
  '0048ADD4: push eax
  '0048ADD5: lea eax, [ebp-3Ch]
  '0048ADD8: push eax
  '0048ADD9: call [004010E4h]
  '0048ADDF: push eax
  '0048ADE0: call [00401040h]
  '0048ADE6: add esp, 0000000Ch
  '0048ADE9: lea ecx, [ebp-3Ch]
  '0048ADEC: call [004013B8h]
  '0048ADF2: mov [ebp-04h], 00000006h
  '0048ADF9: mov edx, 0041E758h
  '0048ADFE: lea ecx, [ebp-2Ch]
  '0048AE01: call [004012D8h]
  '0048AE07: lea ecx, [ebp-2Ch]
  '0048AE0A: push ecx
  '0048AE0B: mov edx, [ebp+08h]
  '0048AE0E: mov eax, [edx]
  '0048AE10: mov ecx, [ebp+08h]
  '0048AE13: push ecx
  '0048AE14: call [eax+00000740h]
  '0048AE1A: lea ecx, [ebp-2Ch]
  '0048AE1D: call [004013B4h]
  '0048AE23: jmp 0048AF8Bh
  '0048AE28: mov [ebp-04h], 00000008h
  '0048AE2F: push FFFFFFFFh
  '0048AE31: call [004010E8h]
  '0048AE37: mov [ebp-04h], 00000009h
  '0048AE3E: push 00000000h
  '0048AE40: push 00000008h
  '0048AE42: mov edx, [ebp+08h]
  '0048AE45: mov eax, [edx]
  '0048AE47: mov ecx, [ebp+08h]
  '0048AE4A: push ecx
  '0048AE4B: call [eax+00000338h]
  '0048AE51: push eax
  '0048AE52: lea edx, [ebp-3Ch]
  '0048AE55: push edx
  '0048AE56: call [004010E4h]
  '0048AE5C: push eax
  '0048AE5D: lea eax, [ebp-4Ch]
  '0048AE60: push eax
  '0048AE61: call [004011E4h]
  '0048AE67: add esp, 00000010h
  '0048AE6A: push eax
  '0048AE6B: call [00401284h]
  '0048AE71: movsx ecx, ax
  '0048AE74: neg ecx
  '0048AE76: sbb ecx, ecx
  '0048AE78: neg ecx
  '0048AE7A: neg ecx
  '0048AE7C: mov [ebp-54h], cx
  '0048AE80: lea ecx, [ebp-3Ch]
  '0048AE83: call [004013B8h]
  '0048AE89: lea ecx, [ebp-4Ch]
  '0048AE8C: call [00401030h]
  '0048AE92: movsx edx, word ptr [ebp-54h]
  '0048AE96: test edx, edx
  '0048AE98: jz 48AED2h
  '0048AE9A: mov [ebp-04h], 0000000Ah
  '0048AEA1: push 00000000h
  '0048AEA3: push 00000046h
  '0048AEA5: mov eax, [ebp+08h]
  '0048AEA8: mov ecx, [eax]
  '0048AEAA: mov edx, [ebp+08h]
  '0048AEAD: push edx
  '0048AEAE: call [ecx+00000338h]
  '0048AEB4: push eax
  '0048AEB5: lea eax, [ebp-3Ch]
  '0048AEB8: push eax
  '0048AEB9: call [004010E4h]
  '0048AEBF: push eax
  '0048AEC0: call [00401040h]
  '0048AEC6: add esp, 0000000Ch
  '0048AEC9: lea ecx, [ebp-3Ch]
  '0048AECC: call [004013B8h]
  '0048AED2: mov [ebp-04h], 0000000Ch
  '0048AED9: mov ecx, [ebp+10h]
  '0048AEDC: push ecx
  '0048AEDD: mov edx, [ebp+08h]
  '0048AEE0: mov eax, [edx]
  '0048AEE2: mov ecx, [ebp+08h]
  '0048AEE5: push ecx
  '0048AEE6: call [eax+00000740h]
  '0048AEEC: mov [ebp-04h], 0000000Dh
  '0048AEF3: mov [ebp-50h], 00000004h
  '0048AEFA: push 0041E78Ch
  '0048AEFF: mov dx, [ebp+0Ch]
  '0048AF03: push edx
  '0048AF04: call [0040100Ch]
  '0048AF0A: mov edx, eax
  '0048AF0C: lea ecx, [ebp-2Ch]
  '0048AF0F: call [00401378h]
  '0048AF15: push eax
  '0048AF16: call [0040108Ch]
  '0048AF1C: mov edx, eax
  '0048AF1E: lea ecx, [ebp-30h]
  '0048AF21: call [00401378h]
  '0048AF27: push eax
  '0048AF28: push 0041E7B0h
  '0048AF2D: call [0040108Ch]
  '0048AF33: mov edx, eax
  '0048AF35: lea ecx, [ebp-34h]
  '0048AF38: call [00401378h]
  '0048AF3E: push eax
  '0048AF3F: mov eax, [ebp+10h]
  '0048AF42: mov ecx, [eax]
  '0048AF44: push ecx
  '0048AF45: call [0040108Ch]
  '0048AF4B: mov edx, eax
  '0048AF4D: lea ecx, [ebp-38h]
  '0048AF50: call [00401378h]
  '0048AF56: lea edx, [ebp-50h]
  '0048AF59: push edx
  '0048AF5A: lea eax, [ebp-38h]
  '0048AF5D: push eax
  '0048AF5E: lea ecx, [ebp-4Ch]
  '0048AF61: push ecx
  '0048AF62: call 00513060h
  '0048AF67: lea edx, [ebp-38h]
  '0048AF6A: push edx
  '0048AF6B: lea eax, [ebp-34h]
  '0048AF6E: push eax
  '0048AF6F: lea ecx, [ebp-30h]
  '0048AF72: push ecx
  '0048AF73: lea edx, [ebp-2Ch]
  '0048AF76: push edx
  '0048AF77: push 00000004h
  '0048AF79: call [004012E8h]
  '0048AF7F: add esp, 00000014h
  '0048AF82: lea ecx, [ebp-4Ch]
  '0048AF85: call [00401030h]
  '0048AF8B: mov [ebp-10h], 00000000h
  '0048AF92: push 0048AFDAh
  '0048AF97: jmp 48AFC7h
  '0048AF99: lea eax, [ebp-38h]
  '0048AF9C: push eax
  '0048AF9D: lea ecx, [ebp-34h]
  '0048AFA0: push ecx
  '0048AFA1: lea edx, [ebp-30h]
  '0048AFA4: push edx
  '0048AFA5: lea eax, [ebp-2Ch]
  '0048AFA8: push eax
  '0048AFA9: push 00000004h
  '0048AFAB: call [004012E8h]
  '0048AFB1: add esp, 00000014h
  '0048AFB4: lea ecx, [ebp-3Ch]
  '0048AFB7: call [004013B8h]
  '0048AFBD: lea ecx, [ebp-4Ch]
  '0048AFC0: call [00401030h]
  '0048AFC6: ret 
End Sub
Private Sub wskCAPTURE__48B670
  '0048B670: push ebp
  '0048B671: mov ebp, esp
  '0048B673: sub esp, 00000018h
  '0048B676: push 004081B6h
  '0048B67B: mov eax, fs:[00h]
  '0048B681: push eax
  '0048B682: mov fs:[00000000h], esp
  '0048B689: mov eax, 00000174h
  '0048B68E: call 004081B0h
  '0048B693: push ebx
  '0048B694: push esi
  '0048B695: push edi
  '0048B696: mov [ebp-18h], esp
  '0048B699: mov [ebp-14h], 004018A0h
  '0048B6A0: mov eax, [ebp+08h]
  '0048B6A3: and eax, 00000001h
  '0048B6A6: mov [ebp-10h], eax
  '0048B6A9: mov ecx, [ebp+08h]
  '0048B6AC: and ecx, FFFFFFFEh
  '0048B6AF: mov [ebp+08h], ecx
  '0048B6B2: mov [ebp-0Ch], 00000000h
  '0048B6B9: mov edx, [ebp+08h]
  '0048B6BC: mov eax, [edx]
  '0048B6BE: mov ecx, [ebp+08h]
  '0048B6C1: push ecx
  '0048B6C2: call [eax+04h]
  '0048B6C5: mov [ebp-04h], 00000001h
  '0048B6CC: mov [ebp-04h], 00000002h
  '0048B6D3: push FFFFFFFFh
  '0048B6D5: call [004010E8h]
  '0048B6DB: mov [ebp-04h], 00000003h
  '0048B6E2: lea edx, [ebp-28h]
  '0048B6E5: mov [ebp-000000C0h], edx
  '0048B6EB: mov [ebp-000000C8h], 00004008h
  '0048B6F5: mov [ebp-000000D0h], 00000008h
  '0048B6FF: mov [ebp-000000D8h], 00000003h
  '0048B709: mov eax, [ebp+0Ch]
  '0048B70C: mov [ebp-000000F0h], eax
  '0048B712: mov [ebp-000000F8h], 00000003h
  '0048B71C: mov eax, 00000010h
  '0048B721: call 004081B0h
  '0048B726: mov ecx, esp
  '0048B728: mov edx, [ebp-000000C8h]
  '0048B72E: mov [ecx], edx
  '0048B730: mov eax, [ebp-000000C4h]
  '0048B736: mov [ecx+04h], eax
  '0048B739: mov edx, [ebp-000000C0h]
  '0048B73F: mov [ecx+08h], edx
  '0048B742: mov eax, [ebp-000000BCh]
  '0048B748: mov [ecx+0Ch], eax
  '0048B74B: mov eax, 00000010h
  '0048B750: call 004081B0h
  '0048B755: mov ecx, esp
  '0048B757: mov edx, [ebp-000000D8h]
  '0048B75D: mov [ecx], edx
  '0048B75F: mov eax, [ebp-000000D4h]
  '0048B765: mov [ecx+04h], eax
  '0048B768: mov edx, [ebp-000000D0h]
  '0048B76E: mov [ecx+08h], edx
  '0048B771: mov eax, [ebp-000000CCh]
  '0048B777: mov [ecx+0Ch], eax
  '0048B77A: mov eax, 00000010h
  '0048B77F: call 004081B0h
  '0048B784: mov ecx, esp
  '0048B786: mov edx, [ebp-000000F8h]
  '0048B78C: mov [ecx], edx
  '0048B78E: mov eax, [ebp-000000F4h]
  '0048B794: mov [ecx+04h], eax
  '0048B797: mov edx, [ebp-000000F0h]
  '0048B79D: mov [ecx+08h], edx
  '0048B7A0: mov eax, [ebp-000000ECh]
  '0048B7A6: mov [ecx+0Ch], eax
  '0048B7A9: push 00000003h
  '0048B7AB: push 00000044h
  '0048B7AD: mov ecx, [ebp+08h]
  '0048B7B0: mov edx, [ecx]
  '0048B7B2: mov eax, [ebp+08h]
  '0048B7B5: push eax
  '0048B7B6: call [edx+00000338h]
  '0048B7BC: push eax
  '0048B7BD: lea ecx, [ebp-60h]
  '0048B7C0: push ecx
  '0048B7C1: call [004010E4h]
  '0048B7C7: push eax
  '0048B7C8: call [00401040h]
  '0048B7CE: add esp, 0000003Ch
  '0048B7D1: lea ecx, [ebp-60h]
  '0048B7D4: call [004013B8h]
  '0048B7DA: mov [ebp-04h], 00000004h
  '0048B7E1: mov edx, [ebp-28h]
  '0048B7E4: push edx
  '0048B7E5: push 0041E7B8h
  '0048B7EA: call [00401184h]
  '0048B7F0: test eax, eax
  '0048B7F2: jz 0048BA11h
  '0048B7F8: mov [ebp-04h], 00000005h
  '0048B7FF: mov eax, [ebp+08h]
  '0048B802: mov ecx, [eax+000000ACh]
  '0048B808: mov edx, [ecx]
  '0048B80A: push edx
  '0048B80B: mov eax, [ebp-28h]
  '0048B80E: push eax
  '0048B80F: call [0040108Ch]
  '0048B815: mov edx, eax
  '0048B817: lea ecx, [ebp-34h]
  '0048B81A: call [00401378h]
  '0048B820: mov edx, eax
  '0048B822: mov ecx, [ebp+08h]
  '0048B825: mov ecx, [ecx+000000ACh]
  '0048B82B: call [004012D8h]
  '0048B831: lea ecx, [ebp-34h]
  '0048B834: call [004013B4h]
  '0048B83A: mov [ebp-04h], 00000006h
  '0048B841: mov edx, [ebp+08h]
  '0048B844: mov eax, [edx+000000ACh]
  '0048B84A: mov [ebp-000000C0h], eax
  '0048B850: mov [ebp-000000C8h], 00004008h
  '0048B85A: push 00000007h
  '0048B85C: lea ecx, [ebp-000000C8h]
  '0048B862: push ecx
  '0048B863: lea edx, [ebp-78h]
  '0048B866: push edx
  '0048B867: call [00401390h]
  '0048B86D: mov [ebp-000000D0h], 0041E7B8h
  '0048B877: mov [ebp-000000D8h], 00008008h
  '0048B881: lea eax, [ebp-78h]
  '0048B884: push eax
  '0048B885: lea ecx, [ebp-000000D8h]
  '0048B88B: push ecx
  '0048B88C: call [00401198h]
  '0048B892: mov [ebp-00000114h], ax
  '0048B899: lea ecx, [ebp-78h]
  '0048B89C: call [00401030h]
  '0048B8A2: movsx edx, word ptr [ebp-00000114h]
  '0048B8A9: test edx, edx
  '0048B8AB: jz 0048B93Bh
  '0048B8B1: mov [ebp-04h], 00000007h
  '0048B8B8: mov eax, [ebp+08h]
  '0048B8BB: mov ecx, [eax+000000ACh]
  '0048B8C1: mov [ebp-000000C0h], ecx
  '0048B8C7: mov [ebp-000000C8h], 00004008h
  '0048B8D1: mov edx, [ebp+08h]
  '0048B8D4: mov eax, [edx+000000ACh]
  '0048B8DA: mov ecx, [eax]
  '0048B8DC: push ecx
  '0048B8DD: call [00401044h]
  '0048B8E3: sub eax, 00000003h
  '0048B8E6: jo 0048D096h
  '0048B8EC: push eax
  '0048B8ED: lea edx, [ebp-000000C8h]
  '0048B8F3: push edx
  '0048B8F4: lea eax, [ebp-78h]
  '0048B8F7: push eax
  '0048B8F8: call [0040136Ch]
  '0048B8FE: lea ecx, [ebp-78h]
  '0048B901: push ecx
  '0048B902: call [0040103Ch]
  '0048B908: mov edx, eax
  '0048B90A: lea ecx, [ebp-34h]
  '0048B90D: call [00401378h]
  '0048B913: mov edx, eax
  '0048B915: mov eax, [ebp+08h]
  '0048B918: mov ecx, [eax+000000ACh]
  '0048B91E: call [004012D8h]
  '0048B924: lea ecx, [ebp-34h]
  '0048B927: call [004013B4h]
  '0048B92D: lea ecx, [ebp-78h]
  '0048B930: call [00401030h]
  '0048B936: jmp 0048BA11h
  '0048B93B: mov [ebp-04h], 0000000Ah
  '0048B942: push 00000000h
  '0048B944: push 00000005h
  '0048B946: mov ecx, [ebp+08h]
  '0048B949: mov edx, [ecx]
  '0048B94B: mov eax, [ebp+08h]
  '0048B94E: push eax
  '0048B94F: call [edx+00000334h]
  '0048B955: push eax
  '0048B956: lea ecx, [ebp-60h]
  '0048B959: push ecx
  '0048B95A: call [004010E4h]
  '0048B960: push eax
  '0048B961: lea edx, [ebp-78h]
  '0048B964: push edx
  '0048B965: call [004011E4h]
  '0048B96B: add esp, 00000010h
  '0048B96E: push eax
  '0048B96F: call [004011DCh]
  '0048B975: fild dword ptr [ebp+0Ch]
  '0048B978: fstp real8 ptr [ebp-00000148h]
  '0048B97E: fadd real8 ptr [ebp-00000148h]
  '0048B984: fstp real4 ptr [ebp-000000C0h]
  '0048B98A: fstsw ax
  '0048B98C: test al, 0Dh
  '0048B98E: jnz 0048D091h
  '0048B994: mov [ebp-000000C8h], 00000004h
  '0048B99E: mov eax, 00000010h
  '0048B9A3: call 004081B0h
  '0048B9A8: mov eax, esp
  '0048B9AA: mov ecx, [ebp-000000C8h]
  '0048B9B0: mov [eax], ecx
  '0048B9B2: mov edx, [ebp-000000C4h]
  '0048B9B8: mov [eax+04h], edx
  '0048B9BB: mov ecx, [ebp-000000C0h]
  '0048B9C1: mov [eax+08h], ecx
  '0048B9C4: mov edx, [ebp-000000BCh]
  '0048B9CA: mov [eax+0Ch], edx
  '0048B9CD: push 00000005h
  '0048B9CF: mov eax, [ebp+08h]
  '0048B9D2: mov ecx, [eax]
  '0048B9D4: mov edx, [ebp+08h]
  '0048B9D7: push edx
  '0048B9D8: call [ecx+00000334h]
  '0048B9DE: push eax
  '0048B9DF: lea eax, [ebp-64h]
  '0048B9E2: push eax
  '0048B9E3: call [004010E4h]
  '0048B9E9: push eax
  '0048B9EA: call [0040139Ch]
  '0048B9F0: lea ecx, [ebp-64h]
  '0048B9F3: push ecx
  '0048B9F4: lea edx, [ebp-60h]
  '0048B9F7: push edx
  '0048B9F8: push 00000002h
  '0048B9FA: call [00401064h]
  '0048BA00: add esp, 0000000Ch
  '0048BA03: lea ecx, [ebp-78h]
  '0048BA06: call [00401030h]
  '0048BA0C: jmp 0048CFDCh
  '0048BA11: mov [ebp-04h], 0000000Dh
  '0048BA18: push 00000000h
  '0048BA1A: push 00000004h
  '0048BA1C: mov eax, [ebp+08h]
  '0048BA1F: mov ecx, [eax]
  '0048BA21: mov edx, [ebp+08h]
  '0048BA24: push edx
  '0048BA25: call [ecx+00000338h]
  '0048BA2B: push eax
  '0048BA2C: lea eax, [ebp-60h]
  '0048BA2F: push eax
  '0048BA30: call [004010E4h]
  '0048BA36: push eax
  '0048BA37: lea ecx, [ebp-78h]
  '0048BA3A: push ecx
  '0048BA3B: call [004011E4h]
  '0048BA41: add esp, 00000010h
  '0048BA44: push eax
  '0048BA45: call [0040103Ch]
  '0048BA4B: mov edx, eax
  '0048BA4D: lea ecx, [ebp-34h]
  '0048BA50: call [00401378h]
  '0048BA56: lea edx, [ebp-34h]
  '0048BA59: push edx
  '0048BA5A: call 00515370h
  '0048BA5F: mov [ebp-2Ch], ax
  '0048BA63: lea ecx, [ebp-34h]
  '0048BA66: call [004013B4h]
  '0048BA6C: lea ecx, [ebp-60h]
  '0048BA6F: call [004013B8h]
  '0048BA75: lea ecx, [ebp-78h]
  '0048BA78: call [00401030h]
  '0048BA7E: mov [ebp-04h], 0000000Eh
  '0048BA85: movsx eax, word ptr [ebp-2Ch]
  '0048BA89: test eax, eax
  '0048BA8B: jnz 0048BB4Dh
  '0048BA91: mov [ebp-04h], 0000000Fh
  '0048BA98: push 00000000h
  '0048BA9A: push 00000004h
  '0048BA9C: mov ecx, [ebp+08h]
  '0048BA9F: mov edx, [ecx]
  '0048BAA1: mov eax, [ebp+08h]
  '0048BAA4: push eax
  '0048BAA5: call [edx+00000338h]
  '0048BAAB: push eax
  '0048BAAC: lea ecx, [ebp-60h]
  '0048BAAF: push ecx
  '0048BAB0: call [004010E4h]
  '0048BAB6: push eax
  '0048BAB7: lea edx, [ebp-78h]
  '0048BABA: push edx
  '0048BABB: call [004011E4h]
  '0048BAC1: add esp, 00000010h
  '0048BAC4: mov [ebp-00000110h], 00000004h
  '0048BACE: push 0041E7F0h
  '0048BAD3: lea eax, [ebp-78h]
  '0048BAD6: push eax
  '0048BAD7: call [0040103Ch]
  '0048BADD: mov edx, eax
  '0048BADF: lea ecx, [ebp-34h]
  '0048BAE2: call [00401378h]
  '0048BAE8: push eax
  '0048BAE9: call [0040108Ch]
  '0048BAEF: mov edx, eax
  '0048BAF1: lea ecx, [ebp-38h]
  '0048BAF4: call [00401378h]
  '0048BAFA: lea ecx, [ebp-00000110h]
  '0048BB00: push ecx
  '0048BB01: lea edx, [ebp-38h]
  '0048BB04: push edx
  '0048BB05: lea eax, [ebp-00000088h]
  '0048BB0B: push eax
  '0048BB0C: call 00513060h
  '0048BB11: lea ecx, [ebp-38h]
  '0048BB14: push ecx
  '0048BB15: lea edx, [ebp-34h]
  '0048BB18: push edx
  '0048BB19: push 00000002h
  '0048BB1B: call [004012E8h]
  '0048BB21: add esp, 0000000Ch
  '0048BB24: lea ecx, [ebp-60h]
  '0048BB27: call [004013B8h]
  '0048BB2D: lea eax, [ebp-00000088h]
  '0048BB33: push eax
  '0048BB34: lea ecx, [ebp-78h]
  '0048BB37: push ecx
  '0048BB38: push 00000002h
  '0048BB3A: call [00401050h]
  '0048BB40: add esp, 0000000Ch
  '0048BB43: jmp 0048CFDCh
  '0048BB48: jmp 0048BC4Bh
  '0048BB4D: mov [ebp-04h], 00000012h
  '0048BB54: push 00000000h
  '0048BB56: push 00000004h
  '0048BB58: mov edx, [ebp+08h]
  '0048BB5B: mov eax, [edx]
  '0048BB5D: mov ecx, [ebp+08h]
  '0048BB60: push ecx
  '0048BB61: call [eax+00000338h]
  '0048BB67: push eax
  '0048BB68: lea edx, [ebp-60h]
  '0048BB6B: push edx
  '0048BB6C: call [004010E4h]
  '0048BB72: push eax
  '0048BB73: lea eax, [ebp-78h]
  '0048BB76: push eax
  '0048BB77: call [004011E4h]
  '0048BB7D: add esp, 00000010h
  '0048BB80: mov [ebp-00000110h], 00000001h
  '0048BB8A: push 0041E844h
  '0048BB8F: lea ecx, [ebp-78h]
  '0048BB92: push ecx
  '0048BB93: call [0040103Ch]
  '0048BB99: mov edx, eax
  '0048BB9B: lea ecx, [ebp-34h]
  '0048BB9E: call [00401378h]
  '0048BBA4: push eax
  '0048BBA5: call [0040108Ch]
  '0048BBAB: mov edx, eax
  '0048BBAD: lea ecx, [ebp-38h]
  '0048BBB0: call [00401378h]
  '0048BBB6: push eax
  '0048BBB7: push 0041E85Ch
  '0048BBBC: call [0040108Ch]
  '0048BBC2: mov edx, eax
  '0048BBC4: lea ecx, [ebp-3Ch]
  '0048BBC7: call [00401378h]
  '0048BBCD: push eax
  '0048BBCE: mov dx, [ebp-2Ch]
  '0048BBD2: push edx
  '0048BBD3: call [0040100Ch]
  '0048BBD9: mov edx, eax
  '0048BBDB: lea ecx, [ebp-40h]
  '0048BBDE: call [00401378h]
  '0048BBE4: push eax
  '0048BBE5: call [0040108Ch]
  '0048BBEB: mov edx, eax
  '0048BBED: lea ecx, [ebp-44h]
  '0048BBF0: call [00401378h]
  '0048BBF6: lea eax, [ebp-00000110h]
  '0048BBFC: push eax
  '0048BBFD: lea ecx, [ebp-44h]
  '0048BC00: push ecx
  '0048BC01: lea edx, [ebp-00000088h]
  '0048BC07: push edx
  '0048BC08: call 00513060h
  '0048BC0D: lea eax, [ebp-44h]
  '0048BC10: push eax
  '0048BC11: lea ecx, [ebp-40h]
  '0048BC14: push ecx
  '0048BC15: lea edx, [ebp-3Ch]
  '0048BC18: push edx
  '0048BC19: lea eax, [ebp-38h]
  '0048BC1C: push eax
  '0048BC1D: lea ecx, [ebp-34h]
  '0048BC20: push ecx
  '0048BC21: push 00000005h
  '0048BC23: call [004012E8h]
  '0048BC29: add esp, 00000018h
  '0048BC2C: lea ecx, [ebp-60h]
  '0048BC2F: call [004013B8h]
  '0048BC35: lea edx, [ebp-00000088h]
  '0048BC3B: push edx
  '0048BC3C: lea eax, [ebp-78h]
  '0048BC3F: push eax
  '0048BC40: push 00000002h
  '0048BC42: call [00401050h]
  '0048BC48: add esp, 0000000Ch
  '0048BC4B: mov [ebp-04h], 00000014h
  '0048BC52: push 00000000h
  '0048BC54: push 00000001h
  '0048BC56: mov ecx, [ebp+08h]
  '0048BC59: mov edx, [ecx]
  '0048BC5B: mov eax, [ebp+08h]
  '0048BC5E: push eax
  '0048BC5F: call [edx+00000334h]
  '0048BC65: push eax
  '0048BC66: lea ecx, [ebp-60h]
  '0048BC69: push ecx
  '0048BC6A: call [004010E4h]
  '0048BC70: push eax
  '0048BC71: lea edx, [ebp-78h]
  '0048BC74: push edx
  '0048BC75: call [004011E4h]
  '0048BC7B: add esp, 00000010h
  '0048BC7E: push eax
  '0048BC7F: call [004011DCh]
  '0048BC85: fstp real4 ptr [ebp-000000C0h]
  '0048BC8B: mov [ebp-000000C8h], 00000004h
  '0048BC95: mov eax, 00000010h
  '0048BC9A: call 004081B0h
  '0048BC9F: mov eax, esp
  '0048BCA1: mov ecx, [ebp-000000C8h]
  '0048BCA7: mov [eax], ecx
  '0048BCA9: mov edx, [ebp-000000C4h]
  '0048BCAF: mov [eax+04h], edx
  '0048BCB2: mov ecx, [ebp-000000C0h]
  '0048BCB8: mov [eax+08h], ecx
  '0048BCBB: mov edx, [ebp-000000BCh]
  '0048BCC1: mov [eax+0Ch], edx
  '0048BCC4: push 00000005h
  '0048BCC6: mov eax, [ebp+08h]
  '0048BCC9: mov ecx, [eax]
  '0048BCCB: mov edx, [ebp+08h]
  '0048BCCE: push edx
  '0048BCCF: call [ecx+00000334h]
  '0048BCD5: push eax
  '0048BCD6: lea eax, [ebp-64h]
  '0048BCD9: push eax
  '0048BCDA: call [004010E4h]
  '0048BCE0: push eax
  '0048BCE1: call [0040139Ch]
  '0048BCE7: lea ecx, [ebp-64h]
  '0048BCEA: push ecx
  '0048BCEB: lea edx, [ebp-60h]
  '0048BCEE: push edx
  '0048BCEF: push 00000002h
  '0048BCF1: call [00401064h]
  '0048BCF7: add esp, 0000000Ch
  '0048BCFA: lea ecx, [ebp-78h]
  '0048BCFD: call [00401030h]
  '0048BD03: mov [ebp-04h], 00000015h
  '0048BD0A: lea eax, [ebp-34h]
  '0048BD0D: push eax
  '0048BD0E: mov ecx, [ebp+08h]
  '0048BD11: mov edx, [ecx]
  '0048BD13: mov eax, [ebp+08h]
  '0048BD16: push eax
  '0048BD17: call [edx+50h]
  '0048BD1A: fclex 
  '0048BD1C: mov [ebp-00000114h], eax
  '0048BD22: cmp [ebp-00000114h], 00000000h
  '0048BD29: jnl 48BD4Bh
  '0048BD2B: push 00000050h
  '0048BD2D: push 0041BC88h
  '0048BD32: mov ecx, [ebp+08h]
  '0048BD35: push ecx
  '0048BD36: mov edx, [ebp-00000114h]
  '0048BD3C: push edx
  '0048BD3D: call [004010A0h]
  '0048BD43: mov [ebp-0000014Ch], eax
  '0048BD49: jmp 48BD55h
  '0048BD4B: mov [ebp-0000014Ch], 00000000h
  '0048BD55: push 0041D0A8h
  '0048BD5A: push 00000000h
  '0048BD5C: push FFFFFFFFh
  '0048BD5E: push 00000001h
  '0048BD60: push 0041BC60h
  '0048BD65: push 0041D0B4h
  '0048BD6A: mov eax, [ebp-34h]
  '0048BD6D: push eax
  '0048BD6E: call [00401230h]
  '0048BD74: mov edx, eax
  '0048BD76: lea ecx, [ebp-38h]
  '0048BD79: call [00401378h]
  '0048BD7F: push eax
  '0048BD80: call [0040108Ch]
  '0048BD86: mov edx, eax
  '0048BD88: lea ecx, [ebp-3Ch]
  '0048BD8B: call [00401378h]
  '0048BD91: push eax
  '0048BD92: push 0041D0CCh
  '0048BD97: call [0040108Ch]
  '0048BD9D: mov edx, eax
  '0048BD9F: lea ecx, [ebp-40h]
  '0048BDA2: call [00401378h]
  '0048BDA8: mov edx, eax
  '0048BDAA: mov ecx, [ebp+08h]
  '0048BDAD: add ecx, 00000050h
  '0048BDB0: call [004012D8h]
  '0048BDB6: lea ecx, [ebp-40h]
  '0048BDB9: push ecx
  '0048BDBA: lea edx, [ebp-3Ch]
  '0048BDBD: push edx
  '0048BDBE: lea eax, [ebp-38h]
  '0048BDC1: push eax
  '0048BDC2: lea ecx, [ebp-34h]
  '0048BDC5: push ecx
  '0048BDC6: push 00000004h
  '0048BDC8: call [004012E8h]
  '0048BDCE: add esp, 00000014h
  '0048BDD1: mov [ebp-04h], 00000016h
  '0048BDD8: call [00401104h]
  '0048BDDE: mov [ebp-04h], 00000017h
  '0048BDE5: mov [ebp-70h], 80020004h
  '0048BDEC: mov [ebp-78h], 0000000Ah
  '0048BDF3: lea edx, [ebp-78h]
  '0048BDF6: push edx
  '0048BDF7: call [004012BCh]
  '0048BDFD: mov ecx, [ebp+08h]
  '0048BE00: mov [ecx+64h], ax
  '0048BE04: lea ecx, [ebp-78h]
  '0048BE07: call [00401030h]
  '0048BE0D: mov [ebp-04h], 00000018h
  '0048BE14: mov edx, [ebp+08h]
  '0048BE17: mov eax, [edx+50h]
  '0048BE1A: push eax
  '0048BE1B: mov ecx, [ebp+08h]
  '0048BE1E: mov dx, [ecx+64h]
  '0048BE22: push edx
  '0048BE23: push FFFFFFFFh
  '0048BE25: push 00000002h
  '0048BE27: call [004012A0h]
  '0048BE2D: mov [ebp-04h], 00000019h
  '0048BE34: mov eax, [ebp+08h]
  '0048BE37: mov ecx, [eax+000000ACh]
  '0048BE3D: mov edx, [ecx]
  '0048BE3F: push edx
  '0048BE40: mov eax, [ebp+08h]
  '0048BE43: mov cx, [eax+64h]
  '0048BE47: push ecx
  '0048BE48: push 0041E878h
  '0048BE4D: call [00401234h]
  '0048BE53: add esp, 0000000Ch
  '0048BE56: mov [ebp-04h], 0000001Ah
  '0048BE5D: mov edx, [ebp+08h]
  '0048BE60: mov ax, [edx+64h]
  '0048BE64: push eax
  '0048BE65: call [00401168h]
  '0048BE6B: mov [ebp-04h], 0000001Bh
  '0048BE72: push 0041C038h
  '0048BE77: push 00000000h
  '0048BE79: push 00000003h
  '0048BE7B: mov ecx, [ebp+08h]
  '0048BE7E: mov edx, [ecx]
  '0048BE80: mov eax, [ebp+08h]
  '0048BE83: push eax
  '0048BE84: call [edx+0000032Ch]
  '0048BE8A: push eax
  '0048BE8B: lea ecx, [ebp-60h]
  '0048BE8E: push ecx
  '0048BE8F: call [004010E4h]
  '0048BE95: push eax
  '0048BE96: lea edx, [ebp-78h]
  '0048BE99: push edx
  '0048BE9A: call [004011E4h]
  '0048BEA0: add esp, 00000010h
  '0048BEA3: push eax
  '0048BEA4: call [004011C8h]
  '0048BEAA: push eax
  '0048BEAB: lea eax, [ebp-64h]
  '0048BEAE: push eax
  '0048BEAF: call [004010E4h]
  '0048BEB5: mov [ebp-00000114h], eax
  '0048BEBB: mov [ebp-80h], 00000006h
  '0048BEC2: mov [ebp-00000088h], 00000002h
  '0048BECC: lea ecx, [ebp-68h]
  '0048BECF: push ecx
  '0048BED0: lea edx, [ebp-00000088h]
  '0048BED6: push edx
  '0048BED7: mov eax, [ebp-00000114h]
  '0048BEDD: mov ecx, [eax]
  '0048BEDF: mov edx, [ebp-00000114h]
  '0048BEE5: push edx
  '0048BEE6: call [ecx+24h]
  '0048BEE9: fclex 
  '0048BEEB: mov [ebp-00000118h], eax
  '0048BEF1: cmp [ebp-00000118h], 00000000h
  '0048BEF8: jnl 48BF1Dh
  '0048BEFA: push 00000024h
  '0048BEFC: push 0041C038h
  '0048BF01: mov eax, [ebp-00000114h]
  '0048BF07: push eax
  '0048BF08: mov ecx, [ebp-00000118h]
  '0048BF0E: push ecx
  '0048BF0F: call [004010A0h]
  '0048BF15: mov [ebp-00000150h], eax
  '0048BF1B: jmp 48BF27h
  '0048BF1D: mov [ebp-00000150h], 00000000h
  '0048BF27: mov edx, [ebp-68h]
  '0048BF2A: mov [ebp-0000011Ch], edx
  '0048BF30: lea eax, [ebp-00000110h]
  '0048BF36: push eax
  '0048BF37: mov ecx, [ebp-0000011Ch]
  '0048BF3D: mov edx, [ecx]
  '0048BF3F: mov eax, [ebp-0000011Ch]
  '0048BF45: push eax
  '0048BF46: call [edx+7Ch]
  '0048BF49: fclex 
  '0048BF4B: mov [ebp-00000120h], eax
  '0048BF51: cmp [ebp-00000120h], 00000000h
  '0048BF58: jnl 48BF7Dh
  '0048BF5A: push 0000007Ch
  '0048BF5C: push 0041C048h
  '0048BF61: mov ecx, [ebp-0000011Ch]
  '0048BF67: push ecx
  '0048BF68: mov edx, [ebp-00000120h]
  '0048BF6E: push edx
  '0048BF6F: call [004010A0h]
  '0048BF75: mov [ebp-00000154h], eax
  '0048BF7B: jmp 48BF87h
  '0048BF7D: mov [ebp-00000154h], 00000000h
  '0048BF87: xor eax, eax
  '0048BF89: cmp [ebp-00000110h], 00000001h
  '0048BF90: setz al
  '0048BF93: neg eax
  '0048BF95: mov [ebp-00000124h], ax
  '0048BF9C: lea ecx, [ebp-68h]
  '0048BF9F: push ecx
  '0048BFA0: lea edx, [ebp-64h]
  '0048BFA3: push edx
  '0048BFA4: lea eax, [ebp-60h]
  '0048BFA7: push eax
  '0048BFA8: push 00000003h
  '0048BFAA: call [00401064h]
  '0048BFB0: add esp, 00000010h
  '0048BFB3: lea ecx, [ebp-00000088h]
  '0048BFB9: push ecx
  '0048BFBA: lea edx, [ebp-78h]
  '0048BFBD: push edx
  '0048BFBE: push 00000002h
  '0048BFC0: call [00401050h]
  '0048BFC6: add esp, 0000000Ch
  '0048BFC9: movsx eax, word ptr [ebp-00000124h]
  '0048BFD0: test eax, eax
  '0048BFD2: jz 0048C2A2h
  '0048BFD8: mov [ebp-04h], 0000001Ch
  '0048BFDF: lea ecx, [ebp-34h]
  '0048BFE2: push ecx
  '0048BFE3: mov edx, [ebp+08h]
  '0048BFE6: mov eax, [edx]
  '0048BFE8: mov ecx, [ebp+08h]
  '0048BFEB: push ecx
  '0048BFEC: call [eax+50h]
  '0048BFEF: fclex 
  '0048BFF1: mov [ebp-00000114h], eax
  '0048BFF7: cmp [ebp-00000114h], 00000000h
  '0048BFFE: jnl 48C020h
  '0048C000: push 00000050h
  '0048C002: push 0041BC88h
  '0048C007: mov edx, [ebp+08h]
  '0048C00A: push edx
  '0048C00B: mov eax, [ebp-00000114h]
  '0048C011: push eax
  '0048C012: call [004010A0h]
  '0048C018: mov [ebp-00000158h], eax
  '0048C01E: jmp 48C02Ah
  '0048C020: mov [ebp-00000158h], 00000000h
  '0048C02A: mov ecx, [ebp+08h]
  '0048C02D: mov edx, [ecx+5Ch]
  '0048C030: push edx
  '0048C031: push 0041E880h
  '0048C036: call [0040108Ch]
  '0048C03C: mov edx, eax
  '0048C03E: lea ecx, [ebp-38h]
  '0048C041: call [00401378h]
  '0048C047: push eax
  '0048C048: push 00000000h
  '0048C04A: push FFFFFFFFh
  '0048C04C: push 00000001h
  '0048C04E: push 0041BC60h
  '0048C053: push 0041D0B4h
  '0048C058: mov eax, [ebp-34h]
  '0048C05B: push eax
  '0048C05C: call [00401230h]
  '0048C062: mov edx, eax
  '0048C064: lea ecx, [ebp-3Ch]
  '0048C067: call [00401378h]
  '0048C06D: push eax
  '0048C06E: call [0040108Ch]
  '0048C074: mov edx, eax
  '0048C076: lea ecx, [ebp-40h]
  '0048C079: call [00401378h]
  '0048C07F: push eax
  '0048C080: push 0041DE34h
  '0048C085: call [0040108Ch]
  '0048C08B: mov edx, eax
  '0048C08D: lea ecx, [ebp-44h]
  '0048C090: call [00401378h]
  '0048C096: mov edx, eax
  '0048C098: mov ecx, [ebp+08h]
  '0048C09B: add ecx, 00000060h
  '0048C09E: call [004012D8h]
  '0048C0A4: lea ecx, [ebp-44h]
  '0048C0A7: push ecx
  '0048C0A8: lea edx, [ebp-40h]
  '0048C0AB: push edx
  '0048C0AC: lea eax, [ebp-3Ch]
  '0048C0AF: push eax
  '0048C0B0: lea ecx, [ebp-38h]
  '0048C0B3: push ecx
  '0048C0B4: lea edx, [ebp-34h]
  '0048C0B7: push edx
  '0048C0B8: push 00000005h
  '0048C0BA: call [004012E8h]
  '0048C0C0: add esp, 00000018h
  '0048C0C3: mov [ebp-04h], 0000001Dh
  '0048C0CA: mov eax, [ebp+08h]
  '0048C0CD: mov ecx, [eax+60h]
  '0048C0D0: push ecx
  '0048C0D1: lea edx, [ebp-34h]
  '0048C0D4: push edx
  '0048C0D5: call [00401330h]
  '0048C0DB: push eax
  '0048C0DC: call 0041DB7Ch
  '0048C0E1: call [0040109Ch]
  '0048C0E7: mov eax, [ebp-34h]
  '0048C0EA: push eax
  '0048C0EB: mov ecx, [ebp+08h]
  '0048C0EE: add ecx, 00000060h
  '0048C0F1: push ecx
  '0048C0F2: call [00401238h]
  '0048C0F8: lea ecx, [ebp-34h]
  '0048C0FB: call [004013B4h]
  '0048C101: mov [ebp-04h], 0000001Eh
  '0048C108: lea edx, [ebp-34h]
  '0048C10B: push edx
  '0048C10C: mov eax, [ebp+08h]
  '0048C10F: mov ecx, [eax]
  '0048C111: mov edx, [ebp+08h]
  '0048C114: push edx
  '0048C115: call [ecx+50h]
  '0048C118: fclex 
  '0048C11A: mov [ebp-00000114h], eax
  '0048C120: cmp [ebp-00000114h], 00000000h
  '0048C127: jnl 48C149h
  '0048C129: push 00000050h
  '0048C12B: push 0041BC88h
  '0048C130: mov eax, [ebp+08h]
  '0048C133: push eax
  '0048C134: mov ecx, [ebp-00000114h]
  '0048C13A: push ecx
  '0048C13B: call [004010A0h]
  '0048C141: mov [ebp-0000015Ch], eax
  '0048C147: jmp 48C153h
  '0048C149: mov [ebp-0000015Ch], 00000000h
  '0048C153: lea edx, [ebp-78h]
  '0048C156: push edx
  '0048C157: call [00401334h]
  '0048C15D: mov eax, [ebp+08h]
  '0048C160: mov ecx, [eax+60h]
  '0048C163: push ecx
  '0048C164: push 00000000h
  '0048C166: push FFFFFFFFh
  '0048C168: push 00000001h
  '0048C16A: push 0041BC60h
  '0048C16F: push 0041D0B4h
  '0048C174: mov edx, [ebp-34h]
  '0048C177: push edx
  '0048C178: call [00401230h]
  '0048C17E: mov edx, eax
  '0048C180: lea ecx, [ebp-38h]
  '0048C183: call [00401378h]
  '0048C189: push eax
  '0048C18A: call [0040108Ch]
  '0048C190: mov edx, eax
  '0048C192: lea ecx, [ebp-3Ch]
  '0048C195: call [00401378h]
  '0048C19B: push eax
  '0048C19C: push 0041E8A0h
  '0048C1A1: call [0040108Ch]
  '0048C1A7: mov edx, eax
  '0048C1A9: lea ecx, [ebp-40h]
  '0048C1AC: call [00401378h]
  '0048C1B2: push eax
  '0048C1B3: mov eax, [ebp+08h]
  '0048C1B6: mov ecx, [eax+000000ACh]
  '0048C1BC: mov edx, [ecx+0Ch]
  '0048C1BF: push edx
  '0048C1C0: call [00401024h]
  '0048C1C6: mov edx, eax
  '0048C1C8: lea ecx, [ebp-44h]
  '0048C1CB: call [00401378h]
  '0048C1D1: push eax
  '0048C1D2: call [0040108Ch]
  '0048C1D8: mov edx, eax
  '0048C1DA: lea ecx, [ebp-48h]
  '0048C1DD: call [00401378h]
  '0048C1E3: push eax
  '0048C1E4: push 0041E8A0h
  '0048C1E9: call [0040108Ch]
  '0048C1EF: mov edx, eax
  '0048C1F1: lea ecx, [ebp-50h]
  '0048C1F4: call [00401378h]
  '0048C1FA: push eax
  '0048C1FB: push 00000000h
  '0048C1FD: push FFFFFFFFh
  '0048C1FF: push 00000001h
  '0048C201: push 0041E8A8h
  '0048C206: push 0041E6DCh
  '0048C20B: lea eax, [ebp-78h]
  '0048C20E: push eax
  '0048C20F: lea ecx, [ebp-4Ch]
  '0048C212: push ecx
  '0048C213: call [0040126Ch]
  '0048C219: push eax
  '0048C21A: call [00401230h]
  '0048C220: mov edx, eax
  '0048C222: lea ecx, [ebp-54h]
  '0048C225: call [00401378h]
  '0048C22B: push eax
  '0048C22C: call [0040108Ch]
  '0048C232: mov edx, eax
  '0048C234: lea ecx, [ebp-58h]
  '0048C237: call [00401378h]
  '0048C23D: push eax
  '0048C23E: push 0041D0CCh
  '0048C243: call [0040108Ch]
  '0048C249: mov edx, eax
  '0048C24B: lea ecx, [ebp-5Ch]
  '0048C24E: call [00401378h]
  '0048C254: push eax
  '0048C255: mov edx, [ebp+08h]
  '0048C258: mov eax, [edx+50h]
  '0048C25B: push eax
  '0048C25C: call [004012ECh]
  '0048C262: lea ecx, [ebp-5Ch]
  '0048C265: push ecx
  '0048C266: lea edx, [ebp-58h]
  '0048C269: push edx
  '0048C26A: lea eax, [ebp-54h]
  '0048C26D: push eax
  '0048C26E: lea ecx, [ebp-50h]
  '0048C271: push ecx
  '0048C272: lea edx, [ebp-4Ch]
  '0048C275: push edx
  '0048C276: lea eax, [ebp-48h]
  '0048C279: push eax
  '0048C27A: lea ecx, [ebp-44h]
  '0048C27D: push ecx
  '0048C27E: lea edx, [ebp-40h]
  '0048C281: push edx
  '0048C282: lea eax, [ebp-3Ch]
  '0048C285: push eax
  '0048C286: lea ecx, [ebp-38h]
  '0048C289: push ecx
  '0048C28A: lea edx, [ebp-34h]
  '0048C28D: push edx
  '0048C28E: push 0000000Bh
  '0048C290: call [004012E8h]
  '0048C296: add esp, 00000030h
  '0048C299: lea ecx, [ebp-78h]
  '0048C29C: call [00401030h]
  '0048C2A2: mov [ebp-04h], 00000020h
  '0048C2A9: mov eax, [ebp+08h]
  '0048C2AC: mov ecx, [eax+000000ACh]
  '0048C2B2: mov edx, [ecx+0Ch]
  '0048C2B5: add edx, 00000001h
  '0048C2B8: jo 0048D096h
  '0048C2BE: mov eax, [ebp+08h]
  '0048C2C1: mov ecx, [eax+000000ACh]
  '0048C2C7: mov [ecx+0Ch], edx
  '0048C2CA: mov [ebp-04h], 00000021h
  '0048C2D1: call 0041BFE0h
  '0048C2D6: mov [ebp-00000110h], eax
  '0048C2DC: call [0040109Ch]
  '0048C2E2: mov edx, [ebp+08h]
  '0048C2E5: mov eax, [edx+000000ACh]
  '0048C2EB: mov ecx, [ebp-00000110h]
  '0048C2F1: mov [eax+08h], ecx
  '0048C2F4: mov [ebp-04h], 00000022h
  '0048C2FB: mov edx, [ebp+08h]
  '0048C2FE: mov eax, [edx]
  '0048C300: mov ecx, [ebp+08h]
  '0048C303: push ecx
  '0048C304: call [eax+00000310h]
  '0048C30A: push eax
  '0048C30B: lea edx, [ebp-64h]
  '0048C30E: push edx
  '0048C30F: call [004010E4h]
  '0048C315: mov [ebp-0000011Ch], eax
  '0048C31B: cmp [0054238Ch], 00000000h
  '0048C322: jnz 48C340h
  '0048C324: push 0054238Ch
  '0048C329: push 0041D9E0h
  '0048C32E: call [004012B8h]
  '0048C334: mov [ebp-00000160h], 0054238Ch
  '0048C33E: jmp 48C34Ah
  '0048C340: mov [ebp-00000160h], 0054238Ch
  '0048C34A: mov eax, [ebp-00000160h]
  '0048C350: mov ecx, [eax]
  '0048C352: mov [ebp-00000114h], ecx
  '0048C358: mov [ebp-00000100h], 80020004h
  '0048C362: mov [ebp-00000108h], 0000000Ah
  '0048C36C: mov [ebp-000000F0h], 80020004h
  '0048C376: mov [ebp-000000F8h], 0000000Ah
  '0048C380: mov [ebp-000000E0h], 80020004h
  '0048C38A: mov [ebp-000000E8h], 0000000Ah
  '0048C394: mov [ebp-000000D0h], 80020004h
  '0048C39E: mov [ebp-000000D8h], 0000000Ah
  '0048C3A8: mov edx, [ebp+08h]
  '0048C3AB: mov eax, [edx+50h]
  '0048C3AE: mov [ebp-000000C0h], eax
  '0048C3B4: mov [ebp-000000C8h], 00000008h
  '0048C3BE: lea ecx, [ebp-60h]
  '0048C3C1: push ecx
  '0048C3C2: mov eax, 00000010h
  '0048C3C7: call 004081B0h
  '0048C3CC: mov edx, esp
  '0048C3CE: mov eax, [ebp-00000108h]
  '0048C3D4: mov [edx], eax
  '0048C3D6: mov ecx, [ebp-00000104h]
  '0048C3DC: mov [edx+04h], ecx
  '0048C3DF: mov eax, [ebp-00000100h]
  '0048C3E5: mov [edx+08h], eax
  '0048C3E8: mov ecx, [ebp-000000FCh]
  '0048C3EE: mov [edx+0Ch], ecx
  '0048C3F1: mov eax, 00000010h
  '0048C3F6: call 004081B0h
  '0048C3FB: mov edx, esp
  '0048C3FD: mov eax, [ebp-000000F8h]
  '0048C403: mov [edx], eax
  '0048C405: mov ecx, [ebp-000000F4h]
  '0048C40B: mov [edx+04h], ecx
  '0048C40E: mov eax, [ebp-000000F0h]
  '0048C414: mov [edx+08h], eax
  '0048C417: mov ecx, [ebp-000000ECh]
  '0048C41D: mov [edx+0Ch], ecx
  '0048C420: mov eax, 00000010h
  '0048C425: call 004081B0h
  '0048C42A: mov edx, esp
  '0048C42C: mov eax, [ebp-000000E8h]
  '0048C432: mov [edx], eax
  '0048C434: mov ecx, [ebp-000000E4h]
  '0048C43A: mov [edx+04h], ecx
  '0048C43D: mov eax, [ebp-000000E0h]
  '0048C443: mov [edx+08h], eax
  '0048C446: mov ecx, [ebp-000000DCh]
  '0048C44C: mov [edx+0Ch], ecx
  '0048C44F: mov eax, 00000010h
  '0048C454: call 004081B0h
  '0048C459: mov edx, esp
  '0048C45B: mov eax, [ebp-000000D8h]
  '0048C461: mov [edx], eax
  '0048C463: mov ecx, [ebp-000000D4h]
  '0048C469: mov [edx+04h], ecx
  '0048C46C: mov eax, [ebp-000000D0h]
  '0048C472: mov [edx+08h], eax
  '0048C475: mov ecx, [ebp-000000CCh]
  '0048C47B: mov [edx+0Ch], ecx
  '0048C47E: mov eax, 00000010h
  '0048C483: call 004081B0h
  '0048C488: mov edx, esp
  '0048C48A: mov eax, [ebp-000000C8h]
  '0048C490: mov [edx], eax
  '0048C492: mov ecx, [ebp-000000C4h]
  '0048C498: mov [edx+04h], ecx
  '0048C49B: mov eax, [ebp-000000C0h]
  '0048C4A1: mov [edx+08h], eax
  '0048C4A4: mov ecx, [ebp-000000BCh]
  '0048C4AA: mov [edx+0Ch], ecx
  '0048C4AD: mov edx, [ebp-00000114h]
  '0048C4B3: mov eax, [edx]
  '0048C4B5: mov ecx, [ebp-00000114h]
  '0048C4BB: push ecx
  '0048C4BC: call [eax+44h]
  '0048C4BF: fclex 
  '0048C4C1: mov [ebp-00000118h], eax
  '0048C4C7: cmp [ebp-00000118h], 00000000h
  '0048C4CE: jnl 48C4F3h
  '0048C4D0: push 00000044h
  '0048C4D2: push 0041D9D0h
  '0048C4D7: mov edx, [ebp-00000114h]
  '0048C4DD: push edx
  '0048C4DE: mov eax, [ebp-00000118h]
  '0048C4E4: push eax
  '0048C4E5: call [004010A0h]
  '0048C4EB: mov [ebp-00000164h], eax
  '0048C4F1: jmp 48C4FDh
  '0048C4F3: mov [ebp-00000164h], 00000000h
  '0048C4FD: mov ecx, [ebp-60h]
  '0048C500: mov [ebp-0000013Ch], ecx
  '0048C506: mov [ebp-60h], 00000000h
  '0048C50D: mov edx, [ebp-0000013Ch]
  '0048C513: mov [ebp-70h], edx
  '0048C516: mov [ebp-78h], 00000009h
  '0048C51D: mov eax, 00000010h
  '0048C522: call 004081B0h
  '0048C527: mov eax, esp
  '0048C529: mov ecx, [ebp-78h]
  '0048C52C: mov [eax], ecx
  '0048C52E: mov edx, [ebp-74h]
  '0048C531: mov [eax+04h], edx
  '0048C534: mov ecx, [ebp-70h]
  '0048C537: mov [eax+08h], ecx
  '0048C53A: mov edx, [ebp-6Ch]
  '0048C53D: mov [eax+0Ch], edx
  '0048C540: mov eax, [ebp-0000011Ch]
  '0048C546: mov ecx, [eax]
  '0048C548: mov edx, [ebp-0000011Ch]
  '0048C54E: push edx
  '0048C54F: call [ecx+44h]
  '0048C552: fclex 
  '0048C554: mov [ebp-00000120h], eax
  '0048C55A: cmp [ebp-00000120h], 00000000h
  '0048C561: jnl 48C586h
  '0048C563: push 00000044h
  '0048C565: push 0041C058h
  '0048C56A: mov eax, [ebp-0000011Ch]
  '0048C570: push eax
  '0048C571: mov ecx, [ebp-00000120h]
  '0048C577: push ecx
  '0048C578: call [004010A0h]
  '0048C57E: mov [ebp-00000168h], eax
  '0048C584: jmp 48C590h
  '0048C586: mov [ebp-00000168h], 00000000h
  '0048C590: lea ecx, [ebp-64h]
  '0048C593: call [004013B8h]
  '0048C599: lea ecx, [ebp-78h]
  '0048C59C: call [00401030h]
  '0048C5A2: mov [ebp-04h], 00000023h
  '0048C5A9: mov edx, [ebp+08h]
  '0048C5AC: mov eax, [edx+50h]
  '0048C5AF: push eax
  '0048C5B0: call [004012FCh]
  '0048C5B6: mov [ebp-00000110h], eax
  '0048C5BC: mov [ebp-000000E0h], 0041E8B0h
  '0048C5C6: mov [ebp-000000E8h], 00000008h
  '0048C5D0: mov [ebp-000000D0h], 0041E8E0h
  '0048C5DA: mov [ebp-000000D8h], 00000008h
  '0048C5E4: lea edx, [ebp-000000D8h]
  '0048C5EA: lea ecx, [ebp-00000088h]
  '0048C5F0: call [00401338h]
  '0048C5F6: fild dword ptr [ebp-00000110h]
  '0048C5FC: fstp real8 ptr [ebp-00000170h]
  '0048C602: fld real8 ptr [ebp-00000170h]
  '0048C608: cmp [00541000h], 00000000h
  '0048C60F: jnz 48C619h
  '0048C611: fdiv real8 ptr [004019C0h]
  '0048C617: jmp 48C62Ah
  '0048C619: push [004019C4h]
  '0048C61F: push [004019C0h]
  '0048C625: call 004081D4h
  '0048C62A: fstp real8 ptr [ebp-70h]
  '0048C62D: fstsw ax
  '0048C62F: test al, 0Dh
  '0048C631: jnz 0048D091h
  '0048C637: mov [ebp-78h], 00000005h
  '0048C63E: push 00000001h
  '0048C640: push 00000001h
  '0048C642: lea ecx, [ebp-00000088h]
  '0048C648: push ecx
  '0048C649: lea edx, [ebp-78h]
  '0048C64C: push edx
  '0048C64D: lea eax, [ebp-00000098h]
  '0048C653: push eax
  '0048C654: call [00401094h]
  '0048C65A: mov [ebp-000000F0h], 0041E8ECh
  '0048C664: mov [ebp-000000F8h], 00000008h
  '0048C66E: lea ecx, [ebp-000000E8h]
  '0048C674: push ecx
  '0048C675: lea edx, [ebp-00000098h]
  '0048C67B: push edx
  '0048C67C: lea eax, [ebp-000000A8h]
  '0048C682: push eax
  '0048C683: call [00401274h]
  '0048C689: push eax
  '0048C68A: lea ecx, [ebp-000000F8h]
  '0048C690: push ecx
  '0048C691: lea edx, [ebp-000000B8h]
  '0048C697: push edx
  '0048C698: call [00401274h]
  '0048C69E: push eax
  '0048C69F: call [0040103Ch]
  '0048C6A5: mov edx, eax
  '0048C6A7: lea ecx, [ebp-34h]
  '0048C6AA: call [00401378h]
  '0048C6B0: lea eax, [ebp-34h]
  '0048C6B3: push eax
  '0048C6B4: mov ecx, [ebp+08h]
  '0048C6B7: mov edx, [ecx]
  '0048C6B9: mov eax, [ebp+08h]
  '0048C6BC: push eax
  '0048C6BD: call [edx+00000740h]
  '0048C6C3: lea ecx, [ebp-34h]
  '0048C6C6: call [004013B4h]
  '0048C6CC: lea ecx, [ebp-000000B8h]
  '0048C6D2: push ecx
  '0048C6D3: lea edx, [ebp-000000A8h]
  '0048C6D9: push edx
  '0048C6DA: lea eax, [ebp-00000098h]
  '0048C6E0: push eax
  '0048C6E1: lea ecx, [ebp-00000088h]
  '0048C6E7: push ecx
  '0048C6E8: lea edx, [ebp-78h]
  '0048C6EB: push edx
  '0048C6EC: push 00000005h
  '0048C6EE: call [00401050h]
  '0048C6F4: add esp, 00000018h
  '0048C6F7: mov [ebp-04h], 00000024h
  '0048C6FE: call [00401104h]
  '0048C704: mov [ebp-04h], 00000025h
  '0048C70B: xor edx, edx
  '0048C70D: mov eax, [ebp+08h]
  '0048C710: mov ecx, [eax+000000ACh]
  '0048C716: call [004012D8h]
  '0048C71C: mov [ebp-04h], 00000026h
  '0048C723: lea ecx, [ebp-0000010Ch]
  '0048C729: push ecx
  '0048C72A: mov edx, [ebp+08h]
  '0048C72D: mov eax, [edx+50h]
  '0048C730: push eax
  '0048C731: mov ecx, [ebp+08h]
  '0048C734: mov edx, [ecx]
  '0048C736: mov eax, [ebp+08h]
  '0048C739: push eax
  '0048C73A: call [edx+000006F8h]
  '0048C740: mov [ebp-00000114h], eax
  '0048C746: cmp [ebp-00000114h], 00000000h
  '0048C74D: jnl 48C772h
  '0048C74F: push 000006F8h
  '0048C754: push 0041BCB8h
  '0048C759: mov ecx, [ebp+08h]
  '0048C75C: push ecx
  '0048C75D: mov edx, [ebp-00000114h]
  '0048C763: push edx
  '0048C764: call [004010A0h]
  '0048C76A: mov [ebp-00000174h], eax
  '0048C770: jmp 48C77Ch
  '0048C772: mov [ebp-00000174h], 00000000h
  '0048C77C: movsx eax, word ptr [ebp-0000010Ch]
  '0048C783: test eax, eax
  '0048C785: jz 48C7B1h
  '0048C787: mov [ebp-04h], 00000027h
  '0048C78E: mov ecx, [ebp+08h]
  '0048C791: add ecx, 00000050h
  '0048C794: mov [ebp-000000C0h], ecx
  '0048C79A: mov [ebp-000000C8h], 00004008h
  '0048C7A4: lea edx, [ebp-000000C8h]
  '0048C7AA: push edx
  '0048C7AB: call [00401188h]
  '0048C7B1: mov [ebp-04h], 00000029h
  '0048C7B8: mov [ebp-000000C0h], 00000000h
  '0048C7C2: mov [ebp-000000C8h], 00000004h
  '0048C7CC: mov eax, 00000010h
  '0048C7D1: call 004081B0h
  '0048C7D6: mov eax, esp
  '0048C7D8: mov ecx, [ebp-000000C8h]
  '0048C7DE: mov [eax], ecx
  '0048C7E0: mov edx, [ebp-000000C4h]
  '0048C7E6: mov [eax+04h], edx
  '0048C7E9: mov ecx, [ebp-000000C0h]
  '0048C7EF: mov [eax+08h], ecx
  '0048C7F2: mov edx, [ebp-000000BCh]
  '0048C7F8: mov [eax+0Ch], edx
  '0048C7FB: push 00000005h
  '0048C7FD: mov eax, [ebp+08h]
  '0048C800: mov ecx, [eax]
  '0048C802: mov edx, [ebp+08h]
  '0048C805: push edx
  '0048C806: call [ecx+00000334h]
  '0048C80C: push eax
  '0048C80D: lea eax, [ebp-60h]
  '0048C810: push eax
  '0048C811: call [004010E4h]
  '0048C817: push eax
  '0048C818: call [0040139Ch]
  '0048C81E: lea ecx, [ebp-60h]
  '0048C821: call [004013B8h]
  '0048C827: mov [ebp-04h], 0000002Ah
  '0048C82E: mov [ebp-000000C0h], 00000000h
  '0048C838: mov [ebp-000000C8h], 0000000Bh
  '0048C842: mov eax, 00000010h
  '0048C847: call 004081B0h
  '0048C84C: mov ecx, esp
  '0048C84E: mov edx, [ebp-000000C8h]
  '0048C854: mov [ecx], edx
  '0048C856: mov eax, [ebp-000000C4h]
  '0048C85C: mov [ecx+04h], eax
  '0048C85F: mov edx, [ebp-000000C0h]
  '0048C865: mov [ecx+08h], edx
  '0048C868: mov eax, [ebp-000000BCh]
  '0048C86E: mov [ecx+0Ch], eax
  '0048C871: push 80010007h
  '0048C876: mov ecx, [ebp+08h]
  '0048C879: mov edx, [ecx]
  '0048C87B: mov eax, [ebp+08h]
  '0048C87E: push eax
  '0048C87F: call [edx+00000334h]
  '0048C885: push eax
  '0048C886: lea ecx, [ebp-60h]
  '0048C889: push ecx
  '0048C88A: call [004010E4h]
  '0048C890: push eax
  '0048C891: call [0040139Ch]
  '0048C897: lea ecx, [ebp-60h]
  '0048C89A: call [004013B8h]
  '0048C8A0: mov [ebp-04h], 0000002Bh
  '0048C8A7: call [00401104h]
  '0048C8AD: mov [ebp-04h], 0000002Ch
  '0048C8B4: cmp [0054106Ch], 00000000h
  '0048C8BB: jnz 48C8D9h
  '0048C8BD: push 0054106Ch
  '0048C8C2: push 00411238h
  '0048C8C7: call [004012B8h]
  '0048C8CD: mov [ebp-00000178h], 0054106Ch
  '0048C8D7: jmp 48C8E3h
  '0048C8D9: mov [ebp-00000178h], 0054106Ch
  '0048C8E3: mov edx, [ebp-00000178h]
  '0048C8E9: mov eax, [edx]
  '0048C8EB: mov ecx, [ebp-00000178h]
  '0048C8F1: mov edx, [ecx]
  '0048C8F3: mov ecx, [edx]
  '0048C8F5: push eax
  '0048C8F6: call [ecx+00000324h]
  '0048C8FC: push eax
  '0048C8FD: lea edx, [ebp-60h]
  '0048C900: push edx
  '0048C901: call [004010E4h]
  '0048C907: mov [ebp-00000114h], eax
  '0048C90D: lea eax, [ebp-0000010Ch]
  '0048C913: push eax
  '0048C914: mov ecx, [ebp-00000114h]
  '0048C91A: mov edx, [ecx]
  '0048C91C: mov eax, [ebp-00000114h]
  '0048C922: push eax
  '0048C923: call [edx+000000E0h]
  '0048C929: fclex 
  '0048C92B: mov [ebp-00000118h], eax
  '0048C931: cmp [ebp-00000118h], 00000000h
  '0048C938: jnl 48C960h
  '0048C93A: push 000000E0h
  '0048C93F: push 0041E108h
  '0048C944: mov ecx, [ebp-00000114h]
  '0048C94A: push ecx
  '0048C94B: mov edx, [ebp-00000118h]
  '0048C951: push edx
  '0048C952: call [004010A0h]
  '0048C958: mov [ebp-0000017Ch], eax
  '0048C95E: jmp 48C96Ah
  '0048C960: mov [ebp-0000017Ch], 00000000h
  '0048C96A: xor eax, eax
  '0048C96C: cmp word ptr [ebp-0000010Ch], 0001h
  '0048C974: setz al
  '0048C977: neg eax
  '0048C979: mov [ebp-0000011Ch], ax
  '0048C980: lea ecx, [ebp-60h]
  '0048C983: call [004013B8h]
  '0048C989: movsx ecx, word ptr [ebp-0000011Ch]
  '0048C990: test ecx, ecx
  '0048C992: jz 0048CC89h
  '0048C998: mov [ebp-04h], 0000002Dh
  '0048C99F: mov edx, 0041E8FCh
  '0048C9A4: lea ecx, [ebp-34h]
  '0048C9A7: call [004012D8h]
  '0048C9AD: lea edx, [ebp-34h]
  '0048C9B0: push edx
  '0048C9B1: call 00517E20h
  '0048C9B6: mov edx, eax
  '0048C9B8: lea ecx, [ebp-38h]
  '0048C9BB: call [00401378h]
  '0048C9C1: push eax
  '0048C9C2: call [004013BCh]
  '0048C9C8: call [0040135Ch]
  '0048C9CE: mov [ebp-24h], eax
  '0048C9D1: lea eax, [ebp-38h]
  '0048C9D4: push eax
  '0048C9D5: lea ecx, [ebp-34h]
  '0048C9D8: push ecx
  '0048C9D9: push 00000002h
  '0048C9DB: call [004012E8h]
  '0048C9E1: add esp, 0000000Ch
  '0048C9E4: mov [ebp-04h], 0000002Eh
  '0048C9EB: mov edx, [ebp+08h]
  '0048C9EE: mov eax, [edx+50h]
  '0048C9F1: push eax
  '0048C9F2: call [004012FCh]
  '0048C9F8: mov ecx, [ebp-24h]
  '0048C9FB: add ecx, eax
  '0048C9FD: jo 0048D096h
  '0048CA03: mov [ebp-24h], ecx
  '0048CA06: mov [ebp-04h], 0000002Fh
  '0048CA0D: lea edx, [ebp-24h]
  '0048CA10: mov [ebp-000000C0h], edx
  '0048CA16: mov [ebp-000000C8h], 00004003h
  '0048CA20: lea eax, [ebp-000000C8h]
  '0048CA26: push eax
  '0048CA27: lea ecx, [ebp-78h]
  '0048CA2A: push ecx
  '0048CA2B: call [00401344h]
  '0048CA31: lea edx, [ebp-78h]
  '0048CA34: push edx
  '0048CA35: call [0040103Ch]
  '0048CA3B: mov edx, eax
  '0048CA3D: lea ecx, [ebp-38h]
  '0048CA40: call [00401378h]
  '0048CA46: mov edx, 0041E8FCh
  '0048CA4B: lea ecx, [ebp-34h]
  '0048CA4E: call [004012D8h]
  '0048CA54: lea eax, [ebp-38h]
  '0048CA57: push eax
  '0048CA58: lea ecx, [ebp-34h]
  '0048CA5B: push ecx
  '0048CA5C: lea edx, [ebp-00000088h]
  '0048CA62: push edx
  '0048CA63: call 005180A0h
  '0048CA68: lea eax, [ebp-38h]
  '0048CA6B: push eax
  '0048CA6C: lea ecx, [ebp-34h]
  '0048CA6F: push ecx
  '0048CA70: push 00000002h
  '0048CA72: call [004012E8h]
  '0048CA78: add esp, 0000000Ch
  '0048CA7B: lea edx, [ebp-00000088h]
  '0048CA81: push edx
  '0048CA82: lea eax, [ebp-78h]
  '0048CA85: push eax
  '0048CA86: push 00000002h
  '0048CA88: call [00401050h]
  '0048CA8E: add esp, 0000000Ch
  '0048CA91: mov [ebp-04h], 00000030h
  '0048CA98: mov ecx, [ebp+08h]
  '0048CA9B: mov edx, [ecx]
  '0048CA9D: mov eax, [ebp+08h]
  '0048CAA0: push eax
  '0048CAA1: call [edx+0000030Ch]
  '0048CAA7: push eax
  '0048CAA8: lea ecx, [ebp-60h]
  '0048CAAB: push ecx
  '0048CAAC: call [004010E4h]
  '0048CAB2: mov [ebp-00000114h], eax
  '0048CAB8: lea edx, [ebp-34h]
  '0048CABB: push edx
  '0048CABC: mov eax, [ebp-00000114h]
  '0048CAC2: mov ecx, [eax]
  '0048CAC4: mov edx, [ebp-00000114h]
  '0048CACA: push edx
  '0048CACB: call [ecx+000000A8h]
  '0048CAD1: fclex 
  '0048CAD3: mov [ebp-00000118h], eax
  '0048CAD9: cmp [ebp-00000118h], 00000000h
  '0048CAE0: jnl 48CB08h
  '0048CAE2: push 000000A8h
  '0048CAE7: push 0041C0C4h
  '0048CAEC: mov eax, [ebp-00000114h]
  '0048CAF2: push eax
  '0048CAF3: mov ecx, [ebp-00000118h]
  '0048CAF9: push ecx
  '0048CAFA: call [004010A0h]
  '0048CB00: mov [ebp-00000180h], eax
  '0048CB06: jmp 48CB12h
  '0048CB08: mov [ebp-00000180h], 00000000h
  '0048CB12: mov edx, [ebp-34h]
  '0048CB15: push edx
  '0048CB16: push 0041E910h
  '0048CB1B: call [00401184h]
  '0048CB21: neg eax
  '0048CB23: sbb eax, eax
  '0048CB25: inc eax
  '0048CB26: neg eax
  '0048CB28: mov [ebp-0000011Ch], ax
  '0048CB2F: lea ecx, [ebp-34h]
  '0048CB32: call [004013B4h]
  '0048CB38: lea ecx, [ebp-60h]
  '0048CB3B: call [004013B8h]
  '0048CB41: movsx eax, word ptr [ebp-0000011Ch]
  '0048CB48: test eax, eax
  '0048CB4A: jz 0048CBEFh
  '0048CB50: mov [ebp-04h], 00000031h
  '0048CB57: mov edx, 0041E924h
  '0048CB5C: lea ecx, [ebp-34h]
  '0048CB5F: call [004012D8h]
  '0048CB65: lea ecx, [ebp-34h]
  '0048CB68: push ecx
  '0048CB69: call 00517E20h
  '0048CB6E: mov edx, eax
  '0048CB70: lea ecx, [ebp-38h]
  '0048CB73: call [00401378h]
  '0048CB79: push eax
  '0048CB7A: call [004013BCh]
  '0048CB80: fadd real8 ptr [004019B8h]
  '0048CB86: fstsw ax
  '0048CB88: test al, 0Dh
  '0048CB8A: jnz 0048D091h
  '0048CB90: sub esp, 00000008h
  '0048CB93: fstp real8 ptr [esp]
  '0048CB96: call [004011F4h]
  '0048CB9C: mov edx, eax
  '0048CB9E: lea ecx, [ebp-40h]
  '0048CBA1: call [00401378h]
  '0048CBA7: mov edx, 0041E924h
  '0048CBAC: lea ecx, [ebp-3Ch]
  '0048CBAF: call [004012D8h]
  '0048CBB5: lea edx, [ebp-40h]
  '0048CBB8: push edx
  '0048CBB9: lea eax, [ebp-3Ch]
  '0048CBBC: push eax
  '0048CBBD: lea ecx, [ebp-78h]
  '0048CBC0: push ecx
  '0048CBC1: call 005180A0h
  '0048CBC6: lea edx, [ebp-40h]
  '0048CBC9: push edx
  '0048CBCA: lea eax, [ebp-3Ch]
  '0048CBCD: push eax
  '0048CBCE: lea ecx, [ebp-38h]
  '0048CBD1: push ecx
  '0048CBD2: lea edx, [ebp-34h]
  '0048CBD5: push edx
  '0048CBD6: push 00000004h
  '0048CBD8: call [004012E8h]
  '0048CBDE: add esp, 00000014h
  '0048CBE1: lea ecx, [ebp-78h]
  '0048CBE4: call [00401030h]
  '0048CBEA: jmp 0048CC89h
  '0048CBEF: mov [ebp-04h], 00000033h
  '0048CBF6: mov edx, 0041E938h
  '0048CBFB: lea ecx, [ebp-34h]
  '0048CBFE: call [004012D8h]
  '0048CC04: lea eax, [ebp-34h]
  '0048CC07: push eax
  '0048CC08: call 00517E20h
  '0048CC0D: mov edx, eax
  '0048CC0F: lea ecx, [ebp-38h]
  '0048CC12: call [00401378h]
  '0048CC18: push eax
  '0048CC19: call [004013BCh]
  '0048CC1F: fadd real8 ptr [004019B8h]
  '0048CC25: fstsw ax
  '0048CC27: test al, 0Dh
  '0048CC29: jnz 0048D091h
  '0048CC2F: sub esp, 00000008h
  '0048CC32: fstp real8 ptr [esp]
  '0048CC35: call [004011F4h]
  '0048CC3B: mov edx, eax
  '0048CC3D: lea ecx, [ebp-40h]
  '0048CC40: call [00401378h]
  '0048CC46: mov edx, 0041E938h
  '0048CC4B: lea ecx, [ebp-3Ch]
  '0048CC4E: call [004012D8h]
  '0048CC54: lea ecx, [ebp-40h]
  '0048CC57: push ecx
  '0048CC58: lea edx, [ebp-3Ch]
  '0048CC5B: push edx
  '0048CC5C: lea eax, [ebp-78h]
  '0048CC5F: push eax
  '0048CC60: call 005180A0h
  '0048CC65: lea ecx, [ebp-40h]
  '0048CC68: push ecx
  '0048CC69: lea edx, [ebp-3Ch]
  '0048CC6C: push edx
  '0048CC6D: lea eax, [ebp-38h]
  '0048CC70: push eax
  '0048CC71: lea ecx, [ebp-34h]
  '0048CC74: push ecx
  '0048CC75: push 00000004h
  '0048CC77: call [004012E8h]
  '0048CC7D: add esp, 00000014h
  '0048CC80: lea ecx, [ebp-78h]
  '0048CC83: call [00401030h]
  '0048CC89: mov [ebp-04h], 00000036h
  '0048CC90: call [00401300h]
  '0048CC96: push eax
  '0048CC97: lea edx, [ebp-60h]
  '0048CC9A: push edx
  '0048CC9B: call [004010E4h]
  '0048CCA1: mov [ebp-00000114h], eax
  '0048CCA7: lea eax, [ebp-00000110h]
  '0048CCAD: push eax
  '0048CCAE: mov ecx, [ebp-00000114h]
  '0048CCB4: mov edx, [ecx]
  '0048CCB6: mov eax, [ebp-00000114h]
  '0048CCBC: push eax
  '0048CCBD: call [edx+1Ch]
  '0048CCC0: fclex 
  '0048CCC2: mov [ebp-00000118h], eax
  '0048CCC8: cmp [ebp-00000118h], 00000000h
  '0048CCCF: jnl 48CCF4h
  '0048CCD1: push 0000001Ch
  '0048CCD3: push 0041E948h
  '0048CCD8: mov ecx, [ebp-00000114h]
  '0048CCDE: push ecx
  '0048CCDF: mov edx, [ebp-00000118h]
  '0048CCE5: push edx
  '0048CCE6: call [004010A0h]
  '0048CCEC: mov [ebp-00000184h], eax
  '0048CCF2: jmp 48CCFEh
  '0048CCF4: mov [ebp-00000184h], 00000000h
  '0048CCFE: xor eax, eax
  '0048CD00: cmp [ebp-00000110h], 00000000h
  '0048CD07: setnz al
  '0048CD0A: neg eax
  '0048CD0C: mov [ebp-0000011Ch], ax
  '0048CD13: lea ecx, [ebp-60h]
  '0048CD16: call [004013B8h]
  '0048CD1C: movsx ecx, word ptr [ebp-0000011Ch]
  '0048CD23: test ecx, ecx
  '0048CD25: jz 0048CDE1h
  '0048CD2B: mov [ebp-04h], 00000037h
  '0048CD32: call [00401300h]
  '0048CD38: push eax
  '0048CD39: lea edx, [ebp-60h]
  '0048CD3C: push edx
  '0048CD3D: call [004010E4h]
  '0048CD43: mov [ebp-00000114h], eax
  '0048CD49: lea eax, [ebp-34h]
  '0048CD4C: push eax
  '0048CD4D: mov ecx, [ebp-00000114h]
  '0048CD53: mov edx, [ecx]
  '0048CD55: mov eax, [ebp-00000114h]
  '0048CD5B: push eax
  '0048CD5C: call [edx+2Ch]
  '0048CD5F: fclex 
  '0048CD61: mov [ebp-00000118h], eax
  '0048CD67: cmp [ebp-00000118h], 00000000h
  '0048CD6E: jnl 48CD93h
  '0048CD70: push 0000002Ch
  '0048CD72: push 0041E948h
  '0048CD77: mov ecx, [ebp-00000114h]
  '0048CD7D: push ecx
  '0048CD7E: mov edx, [ebp-00000118h]
  '0048CD84: push edx
  '0048CD85: call [004010A0h]
  '0048CD8B: mov [ebp-00000188h], eax
  '0048CD91: jmp 48CD9Dh
  '0048CD93: mov [ebp-00000188h], 00000000h
  '0048CD9D: mov eax, [ebp-34h]
  '0048CDA0: mov [ebp-00000140h], eax
  '0048CDA6: mov [ebp-34h], 00000000h
  '0048CDAD: mov edx, [ebp-00000140h]
  '0048CDB3: lea ecx, [ebp-38h]
  '0048CDB6: call [00401378h]
  '0048CDBC: lea ecx, [ebp-38h]
  '0048CDBF: push ecx
  '0048CDC0: mov edx, [ebp+08h]
  '0048CDC3: mov eax, [edx]
  '0048CDC5: mov ecx, [ebp+08h]
  '0048CDC8: push ecx
  '0048CDC9: call [eax+00000740h]
  '0048CDCF: lea ecx, [ebp-38h]
  '0048CDD2: call [004013B4h]
  '0048CDD8: lea ecx, [ebp-60h]
  '0048CDDB: call [004013B8h]
  '0048CDE1: mov [ebp-04h], 00000039h
  '0048CDE8: mov edx, [ebp+08h]
  '0048CDEB: mov eax, [edx]
  '0048CDED: mov ecx, [ebp+08h]
  '0048CDF0: push ecx
  '0048CDF1: call [eax+00000304h]
  '0048CDF7: push eax
  '0048CDF8: lea edx, [ebp-60h]
  '0048CDFB: push edx
  '0048CDFC: call [004010E4h]
  '0048CE02: mov [ebp-00000114h], eax
  '0048CE08: lea eax, [ebp-34h]
  '0048CE0B: push eax
  '0048CE0C: mov ecx, [ebp-00000114h]
  '0048CE12: mov edx, [ecx]
  '0048CE14: mov eax, [ebp-00000114h]
  '0048CE1A: push eax
  '0048CE1B: call [edx+000000A8h]
  '0048CE21: fclex 
  '0048CE23: mov [ebp-00000118h], eax
  '0048CE29: cmp [ebp-00000118h], 00000000h
  '0048CE30: jnl 48CE58h
  '0048CE32: push 000000A8h
  '0048CE37: push 0041C0C4h
  '0048CE3C: mov ecx, [ebp-00000114h]
  '0048CE42: push ecx
  '0048CE43: mov edx, [ebp-00000118h]
  '0048CE49: push edx
  '0048CE4A: call [004010A0h]
  '0048CE50: mov [ebp-0000018Ch], eax
  '0048CE56: jmp 48CE62h
  '0048CE58: mov [ebp-0000018Ch], 00000000h
  '0048CE62: mov eax, [ebp-34h]
  '0048CE65: push eax
  '0048CE66: call [004013BCh]
  '0048CE6C: fadd real8 ptr [004019B8h]
  '0048CE72: fstsw ax
  '0048CE74: test al, 0Dh
  '0048CE76: jnz 0048D091h
  '0048CE7C: call [0040135Ch]
  '0048CE82: mov ecx, [ebp+08h]
  '0048CE85: mov [ecx+48h], eax
  '0048CE88: lea ecx, [ebp-34h]
  '0048CE8B: call [004013B4h]
  '0048CE91: lea ecx, [ebp-60h]
  '0048CE94: call [004013B8h]
  '0048CE9A: mov [ebp-04h], 0000003Ah
  '0048CEA1: mov edx, [ebp+08h]
  '0048CEA4: mov eax, [edx]
  '0048CEA6: mov ecx, [ebp+08h]
  '0048CEA9: push ecx
  '0048CEAA: call [eax+00000304h]
  '0048CEB0: push eax
  '0048CEB1: lea edx, [ebp-60h]
  '0048CEB4: push edx
  '0048CEB5: call [004010E4h]
  '0048CEBB: mov [ebp-00000114h], eax
  '0048CEC1: lea eax, [ebp-34h]
  '0048CEC4: push eax
  '0048CEC5: mov ecx, [ebp-00000114h]
  '0048CECB: mov edx, [ecx]
  '0048CECD: mov eax, [ebp-00000114h]
  '0048CED3: push eax
  '0048CED4: call [edx+000000A8h]
  '0048CEDA: fclex 
  '0048CEDC: mov [ebp-00000118h], eax
  '0048CEE2: cmp [ebp-00000118h], 00000000h
  '0048CEE9: jnl 48CF11h
  '0048CEEB: push 000000A8h
  '0048CEF0: push 0041C0C4h
  '0048CEF5: mov ecx, [ebp-00000114h]
  '0048CEFB: push ecx
  '0048CEFC: mov edx, [ebp-00000118h]
  '0048CF02: push edx
  '0048CF03: call [004010A0h]
  '0048CF09: mov [ebp-00000190h], eax
  '0048CF0F: jmp 48CF1Bh
  '0048CF11: mov [ebp-00000190h], 00000000h
  '0048CF1B: mov eax, [ebp-34h]
  '0048CF1E: push eax
  '0048CF1F: push 0041E5C8h
  '0048CF24: call [00401184h]
  '0048CF2A: neg eax
  '0048CF2C: sbb eax, eax
  '0048CF2E: neg eax
  '0048CF30: neg eax
  '0048CF32: mov [ebp-0000011Ch], ax
  '0048CF39: lea ecx, [ebp-34h]
  '0048CF3C: call [004013B4h]
  '0048CF42: lea ecx, [ebp-60h]
  '0048CF45: call [004013B8h]
  '0048CF4B: movsx ecx, word ptr [ebp-0000011Ch]
  '0048CF52: test ecx, ecx
  '0048CF54: jz 0048CFDCh
  '0048CF5A: mov [ebp-04h], 0000003Bh
  '0048CF61: mov edx, [ebp+08h]
  '0048CF64: mov eax, [edx]
  '0048CF66: mov ecx, [ebp+08h]
  '0048CF69: push ecx
  '0048CF6A: call [eax+00000300h]
  '0048CF70: push eax
  '0048CF71: lea edx, [ebp-60h]
  '0048CF74: push edx
  '0048CF75: call [004010E4h]
  '0048CF7B: mov [ebp-00000114h], eax
  '0048CF81: push FFFFFFFFh
  '0048CF83: mov eax, [ebp-00000114h]
  '0048CF89: mov ecx, [eax]
  '0048CF8B: mov edx, [ebp-00000114h]
  '0048CF91: push edx
  '0048CF92: call [ecx+5Ch]
  '0048CF95: fclex 
  '0048CF97: mov [ebp-00000118h], eax
  '0048CF9D: cmp [ebp-00000118h], 00000000h
  '0048CFA4: jnl 48CFC9h
  '0048CFA6: push 0000005Ch
  '0048CFA8: push 0041E5CCh
  '0048CFAD: mov eax, [ebp-00000114h]
  '0048CFB3: push eax
  '0048CFB4: mov ecx, [ebp-00000118h]
  '0048CFBA: push ecx
  '0048CFBB: call [004010A0h]
  '0048CFC1: mov [ebp-00000194h], eax
  '0048CFC7: jmp 48CFD3h
  '0048CFC9: mov [ebp-00000194h], 00000000h
  '0048CFD3: lea ecx, [ebp-60h]
  '0048CFD6: call [004013B8h]
  '0048CFDC: mov [ebp-10h], 00000000h
  '0048CFE3: wait 
  '0048CFE4: push 0048D06Fh
  '0048CFE9: jmp 48D065h
  '0048CFEB: lea edx, [ebp-5Ch]
  '0048CFEE: push edx
  '0048CFEF: lea eax, [ebp-58h]
  '0048CFF2: push eax
  '0048CFF3: lea ecx, [ebp-54h]
  '0048CFF6: push ecx
  '0048CFF7: lea edx, [ebp-50h]
  '0048CFFA: push edx
  '0048CFFB: lea eax, [ebp-4Ch]
  '0048CFFE: push eax
  '0048CFFF: lea ecx, [ebp-48h]
  '0048D002: push ecx
  '0048D003: lea edx, [ebp-44h]
  '0048D006: push edx
  '0048D007: lea eax, [ebp-40h]
  '0048D00A: push eax
  '0048D00B: lea ecx, [ebp-3Ch]
  '0048D00E: push ecx
  '0048D00F: lea edx, [ebp-38h]
  '0048D012: push edx
  '0048D013: lea eax, [ebp-34h]
  '0048D016: push eax
  '0048D017: push 0000000Bh
  '0048D019: call [004012E8h]
  '0048D01F: add esp, 00000030h
  '0048D022: lea ecx, [ebp-68h]
  '0048D025: push ecx
  '0048D026: lea edx, [ebp-64h]
  '0048D029: push edx
  '0048D02A: lea eax, [ebp-60h]
  '0048D02D: push eax
  '0048D02E: push 00000003h
  '0048D030: call [00401064h]
  '0048D036: add esp, 00000010h
  '0048D039: lea ecx, [ebp-000000B8h]
  '0048D03F: push ecx
  '0048D040: lea edx, [ebp-000000A8h]
  '0048D046: push edx
  '0048D047: lea eax, [ebp-00000098h]
  '0048D04D: push eax
  '0048D04E: lea ecx, [ebp-00000088h]
  '0048D054: push ecx
  '0048D055: lea edx, [ebp-78h]
  '0048D058: push edx
  '0048D059: push 00000005h
  '0048D05B: call [00401050h]
  '0048D061: add esp, 00000018h
  '0048D064: ret 
End Sub
Private Sub wskCAPTURE__48A820
  '0048A820: push ebp
  '0048A821: mov ebp, esp
  '0048A823: sub esp, 0000000Ch
  '0048A826: push 004081B6h
  '0048A82B: mov eax, fs:[00h]
  '0048A831: push eax
  '0048A832: mov fs:[00000000h], esp
  '0048A839: sub esp, 0000004Ch
  '0048A83C: push ebx
  '0048A83D: push esi
  '0048A83E: push edi
  '0048A83F: mov [ebp-0Ch], esp
  '0048A842: mov [ebp-08h], 00401760h
  '0048A849: mov esi, [ebp+08h]
  '0048A84C: mov eax, esi
  '0048A84E: and eax, 00000001h
  '0048A851: mov [ebp-04h], eax
  '0048A854: and esi, FFFFFFFEh
  '0048A857: push esi
  '0048A858: mov [ebp+08h], esi
  '0048A85B: mov ecx, [esi]
  '0048A85D: call [ecx+04h]
  '0048A860: mov edx, [esi]
  '0048A862: xor ebx, ebx
  '0048A864: push 0041E6BCh
  '0048A869: push ebx
  '0048A86A: push 00000004h
  '0048A86C: push esi
  '0048A86D: mov [ebp-18h], ebx
  '0048A870: mov [ebp-1Ch], ebx
  '0048A873: mov [ebp-20h], ebx
  '0048A876: mov [ebp-24h], ebx
  '0048A879: mov [ebp-28h], ebx
  '0048A87C: mov [ebp-2Ch], ebx
  '0048A87F: mov [ebp-30h], ebx
  '0048A882: mov [ebp-40h], ebx
  '0048A885: mov [ebp-50h], ebx
  '0048A888: call [edx+00000338h]
  '0048A88E: push eax
  '0048A88F: lea eax, [ebp-2Ch]
  '0048A892: push eax
  '0048A893: call [004010E4h]
  '0048A899: lea ecx, [ebp-40h]
  '0048A89C: push eax
  '0048A89D: push ecx
  '0048A89E: call [004011E4h]
  '0048A8A4: add esp, 00000010h
  '0048A8A7: push eax
  '0048A8A8: call [0040103Ch]
  '0048A8AE: mov edi, [00401378h]
  '0048A8B4: mov edx, eax
  '0048A8B6: lea ecx, [ebp-18h]
  '0048A8B9: call edi
  '0048A8BB: push eax
  '0048A8BC: call [0040108Ch]
  '0048A8C2: mov edx, eax
  '0048A8C4: lea ecx, [ebp-1Ch]
  '0048A8C7: call edi
  '0048A8C9: push eax
  '0048A8CA: push 0041E6DCh
  '0048A8CF: call [0040108Ch]
  '0048A8D5: mov edx, eax
  '0048A8D7: lea ecx, [ebp-20h]
  '0048A8DA: call edi
  '0048A8DC: mov edx, [esi]
  '0048A8DE: push eax
  '0048A8DF: push ebx
  '0048A8E0: push 00000001h
  '0048A8E2: push esi
  '0048A8E3: call [edx+00000338h]
  '0048A8E9: push eax
  '0048A8EA: lea eax, [ebp-30h]
  '0048A8ED: push eax
  '0048A8EE: call [004010E4h]
  '0048A8F4: lea ecx, [ebp-50h]
  '0048A8F7: push eax
  '0048A8F8: push ecx
  '0048A8F9: call [004011E4h]
  '0048A8FF: add esp, 00000010h
  '0048A902: push eax
  '0048A903: call [0040130Ch]
  '0048A909: push eax
  '0048A90A: call [00401024h]
  '0048A910: mov edx, eax
  '0048A912: lea ecx, [ebp-24h]
  '0048A915: call edi
  '0048A917: push eax
  '0048A918: call [0040108Ch]
  '0048A91E: mov edx, eax
  '0048A920: lea ecx, [ebp-28h]
  '0048A923: call edi
  '0048A925: mov edx, [esi]
  '0048A927: lea eax, [ebp-28h]
  '0048A92A: push eax
  '0048A92B: push esi
  '0048A92C: call [edx+00000740h]
  '0048A932: lea ecx, [ebp-28h]
  '0048A935: lea edx, [ebp-24h]
  '0048A938: push ecx
  '0048A939: lea eax, [ebp-20h]
  '0048A93C: push edx
  '0048A93D: lea ecx, [ebp-1Ch]
  '0048A940: push eax
  '0048A941: lea edx, [ebp-18h]
  '0048A944: push ecx
  '0048A945: push edx
  '0048A946: push 00000005h
  '0048A948: call [004012E8h]
  '0048A94E: lea eax, [ebp-30h]
  '0048A951: lea ecx, [ebp-2Ch]
  '0048A954: push eax
  '0048A955: push ecx
  '0048A956: push 00000002h
  '0048A958: call [00401064h]
  '0048A95E: lea edx, [ebp-50h]
  '0048A961: lea eax, [ebp-40h]
  '0048A964: push edx
  '0048A965: push eax
  '0048A966: push 00000002h
  '0048A968: call [00401050h]
  '0048A96E: mov eax, [541024h]
  '0048A973: add esp, 00000030h
  '0048A976: cmp eax, ebx
  '0048A978: jnz 48A98Ah
  '0048A97A: push 00541024h
  '0048A97F: push 00413334h
  '0048A984: call [004012B8h]
  '0048A98A: mov esi, [00541024h]
  '0048A990: mov edx, 0041E6E4h
  '0048A995: lea ecx, [ebp-18h]
  '0048A998: call [004012D8h]
  '0048A99E: mov ecx, [esi]
  '0048A9A0: lea edx, [ebp-18h]
  '0048A9A3: push edx
  '0048A9A4: push esi
  '0048A9A5: call [ecx+0000071Ch]
  '0048A9AB: cmp eax, ebx
  '0048A9AD: fclex 
  '0048A9AF: jnl 48A9C3h
  '0048A9B1: push 0000071Ch
  '0048A9B6: push 0041C118h
  '0048A9BB: push esi
  '0048A9BC: push eax
  '0048A9BD: call [004010A0h]
  '0048A9C3: lea ecx, [ebp-18h]
  '0048A9C6: call [004013B4h]
  '0048A9CC: mov [ebp-04h], ebx
  '0048A9CF: push 0048AA17h
  '0048A9D4: jmp 48AA16h
  '0048A9D6: lea eax, [ebp-28h]
  '0048A9D9: lea ecx, [ebp-24h]
  '0048A9DC: push eax
  '0048A9DD: lea edx, [ebp-20h]
  '0048A9E0: push ecx
  '0048A9E1: lea eax, [ebp-1Ch]
  '0048A9E4: push edx
  '0048A9E5: lea ecx, [ebp-18h]
  '0048A9E8: push eax
  '0048A9E9: push ecx
  '0048A9EA: push 00000005h
  '0048A9EC: call [004012E8h]
  '0048A9F2: lea edx, [ebp-30h]
  '0048A9F5: lea eax, [ebp-2Ch]
  '0048A9F8: push edx
  '0048A9F9: push eax
  '0048A9FA: push 00000002h
  '0048A9FC: call [00401064h]
  '0048AA02: lea ecx, [ebp-50h]
  '0048AA05: lea edx, [ebp-40h]
  '0048AA08: push ecx
  '0048AA09: push edx
  '0048AA0A: push 00000002h
  '0048AA0C: call [00401050h]
  '0048AA12: add esp, 00000030h
  '0048AA15: ret 
End Sub
Private Sub wskCAPTURE__48AA40
  '0048AA40: push ebp
  '0048AA41: mov ebp, esp
  '0048AA43: sub esp, 00000018h
  '0048AA46: push 004081B6h
  '0048AA4B: mov eax, fs:[00h]
  '0048AA51: push eax
  '0048AA52: mov fs:[00000000h], esp
  '0048AA59: mov eax, 00000050h
  '0048AA5E: call 004081B0h
  '0048AA63: push ebx
  '0048AA64: push esi
  '0048AA65: push edi
  '0048AA66: mov [ebp-18h], esp
  '0048AA69: mov [ebp-14h], 00401770h
  '0048AA70: mov eax, [ebp+08h]
  '0048AA73: and eax, 00000001h
  '0048AA76: mov [ebp-10h], eax
  '0048AA79: mov ecx, [ebp+08h]
  '0048AA7C: and ecx, FFFFFFFEh
  '0048AA7F: mov [ebp+08h], ecx
  '0048AA82: mov [ebp-0Ch], 00000000h
  '0048AA89: mov edx, [ebp+08h]
  '0048AA8C: mov eax, [edx]
  '0048AA8E: mov ecx, [ebp+08h]
  '0048AA91: push ecx
  '0048AA92: call [eax+04h]
  '0048AA95: mov [ebp-04h], 00000001h
  '0048AA9C: mov [ebp-04h], 00000002h
  '0048AAA3: push FFFFFFFFh
  '0048AAA5: call [004010E8h]
  '0048AAAB: mov [ebp-04h], 00000003h
  '0048AAB2: push 00000000h
  '0048AAB4: push 00000046h
  '0048AAB6: mov edx, [ebp+08h]
  '0048AAB9: mov eax, [edx]
  '0048AABB: mov ecx, [ebp+08h]
  '0048AABE: push ecx
  '0048AABF: call [eax+00000338h]
  '0048AAC5: push eax
  '0048AAC6: lea edx, [ebp-2Ch]
  '0048AAC9: push edx
  '0048AACA: call [004010E4h]
  '0048AAD0: push eax
  '0048AAD1: call [00401040h]
  '0048AAD7: add esp, 0000000Ch
  '0048AADA: lea ecx, [ebp-2Ch]
  '0048AADD: call [004013B8h]
  '0048AAE3: mov [ebp-04h], 00000004h
  '0048AAEA: lea eax, [ebp+0Ch]
  '0048AAED: mov [ebp-44h], eax
  '0048AAF0: mov [ebp-4Ch], 00004003h
  '0048AAF7: mov eax, 00000010h
  '0048AAFC: call 004081B0h
  '0048AB01: mov ecx, esp
  '0048AB03: mov edx, [ebp-4Ch]
  '0048AB06: mov [ecx], edx
  '0048AB08: mov eax, [ebp-48h]
  '0048AB0B: mov [ecx+04h], eax
  '0048AB0E: mov edx, [ebp-44h]
  '0048AB11: mov [ecx+08h], edx
  '0048AB14: mov eax, [ebp-40h]
  '0048AB17: mov [ecx+0Ch], eax
  '0048AB1A: push 00000001h
  '0048AB1C: push 00000042h
  '0048AB1E: mov ecx, [ebp+08h]
  '0048AB21: mov edx, [ecx]
  '0048AB23: mov eax, [ebp+08h]
  '0048AB26: push eax
  '0048AB27: call [edx+00000338h]
  '0048AB2D: push eax
  '0048AB2E: lea ecx, [ebp-2Ch]
  '0048AB31: push ecx
  '0048AB32: call [004010E4h]
  '0048AB38: push eax
  '0048AB39: call [00401040h]
  '0048AB3F: add esp, 0000001Ch
  '0048AB42: lea ecx, [ebp-2Ch]
  '0048AB45: call [004013B8h]
  '0048AB4B: mov [ebp-04h], 00000005h
  '0048AB52: push 0041E724h
  '0048AB57: push 00000000h
  '0048AB59: push 00000004h
  '0048AB5B: mov edx, [ebp+08h]
  '0048AB5E: mov eax, [edx]
  '0048AB60: mov ecx, [ebp+08h]
  '0048AB63: push ecx
  '0048AB64: call [eax+00000338h]
  '0048AB6A: push eax
  '0048AB6B: lea edx, [ebp-2Ch]
  '0048AB6E: push edx
  '0048AB6F: call [004010E4h]
  '0048AB75: push eax
  '0048AB76: lea eax, [ebp-3Ch]
  '0048AB79: push eax
  '0048AB7A: call [004011E4h]
  '0048AB80: add esp, 00000010h
  '0048AB83: push eax
  '0048AB84: call [0040103Ch]
  '0048AB8A: mov edx, eax
  '0048AB8C: lea ecx, [ebp-24h]
  '0048AB8F: call [00401378h]
  '0048AB95: push eax
  '0048AB96: call [0040108Ch]
  '0048AB9C: mov edx, eax
  '0048AB9E: lea ecx, [ebp-28h]
  '0048ABA1: call [00401378h]
  '0048ABA7: lea ecx, [ebp-28h]
  '0048ABAA: push ecx
  '0048ABAB: mov edx, [ebp+08h]
  '0048ABAE: mov eax, [edx]
  '0048ABB0: mov ecx, [ebp+08h]
  '0048ABB3: push ecx
  '0048ABB4: call [eax+00000740h]
  '0048ABBA: lea edx, [ebp-28h]
  '0048ABBD: push edx
  '0048ABBE: lea eax, [ebp-24h]
  '0048ABC1: push eax
  '0048ABC2: push 00000002h
  '0048ABC4: call [004012E8h]
  '0048ABCA: add esp, 0000000Ch
  '0048ABCD: lea ecx, [ebp-2Ch]
  '0048ABD0: call [004013B8h]
  '0048ABD6: lea ecx, [ebp-3Ch]
  '0048ABD9: call [00401030h]
  '0048ABDF: mov [ebp-04h], 00000006h
  '0048ABE6: cmp [00541024h], 00000000h
  '0048ABED: jnz 48AC08h
  '0048ABEF: push 00541024h
  '0048ABF4: push 00413334h
  '0048ABF9: call [004012B8h]
  '0048ABFF: mov [ebp-6Ch], 00541024h
  '0048AC06: jmp 48AC0Fh
  '0048AC08: mov [ebp-6Ch], 00541024h
  '0048AC0F: mov ecx, [ebp-6Ch]
  '0048AC12: mov edx, [ecx]
  '0048AC14: mov [ebp-50h], edx
  '0048AC17: mov edx, 0041E6E4h
  '0048AC1C: lea ecx, [ebp-24h]
  '0048AC1F: call [004012D8h]
  '0048AC25: lea eax, [ebp-24h]
  '0048AC28: push eax
  '0048AC29: mov ecx, [ebp-50h]
  '0048AC2C: mov edx, [ecx]
  '0048AC2E: mov eax, [ebp-50h]
  '0048AC31: push eax
  '0048AC32: call [edx+0000071Ch]
  '0048AC38: fclex 
  '0048AC3A: mov [ebp-54h], eax
  '0048AC3D: cmp [ebp-54h], 00000000h
  '0048AC41: jnl 48AC60h
  '0048AC43: push 0000071Ch
  '0048AC48: push 0041C118h
  '0048AC4D: mov ecx, [ebp-50h]
  '0048AC50: push ecx
  '0048AC51: mov edx, [ebp-54h]
  '0048AC54: push edx
  '0048AC55: call [004010A0h]
  '0048AC5B: mov [ebp-70h], eax
  '0048AC5E: jmp 48AC67h
  '0048AC60: mov [ebp-70h], 00000000h
  '0048AC67: lea ecx, [ebp-24h]
  '0048AC6A: call [004013B4h]
  '0048AC70: mov [ebp-10h], 00000000h
  '0048AC77: push 0048ACA5h
  '0048AC7C: jmp 48ACA4h
  '0048AC7E: lea eax, [ebp-28h]
  '0048AC81: push eax
  '0048AC82: lea ecx, [ebp-24h]
  '0048AC85: push ecx
  '0048AC86: push 00000002h
  '0048AC88: call [004012E8h]
  '0048AC8E: add esp, 0000000Ch
  '0048AC91: lea ecx, [ebp-2Ch]
  '0048AC94: call [004013B8h]
  '0048AC9A: lea ecx, [ebp-3Ch]
  '0048AC9D: call [00401030h]
  '0048ACA3: ret 
End Sub
Private Sub picDisplay__487670
  '00487670: push ebp
  '00487671: mov ebp, esp
  '00487673: sub esp, 00000018h
  '00487676: push 004081B6h
  '0048767B: mov eax, fs:[00h]
  '00487681: push eax
  '00487682: mov fs:[00000000h], esp
  '00487689: mov eax, 00000074h
  '0048768E: call 004081B0h
  '00487693: push ebx
  '00487694: push esi
  '00487695: push edi
  '00487696: mov [ebp-18h], esp
  '00487699: mov [ebp-14h], 00401490h
  '004876A0: mov eax, [ebp+08h]
  '004876A3: and eax, 00000001h
  '004876A6: mov [ebp-10h], eax
  '004876A9: mov ecx, [ebp+08h]
  '004876AC: and ecx, FFFFFFFEh
  '004876AF: mov [ebp+08h], ecx
  '004876B2: mov [ebp-0Ch], 00000000h
  '004876B9: mov edx, [ebp+08h]
  '004876BC: mov eax, [edx]
  '004876BE: mov ecx, [ebp+08h]
  '004876C1: push ecx
  '004876C2: call [eax+04h]
  '004876C5: mov [ebp-04h], 00000001h
  '004876CC: mov [ebp-04h], 00000002h
  '004876D3: push FFFFFFFFh
  '004876D5: call [004010E8h]
  '004876DB: mov [ebp-04h], 00000003h
  '004876E2: push 0041C038h
  '004876E7: push 00000000h
  '004876E9: push 00000003h
  '004876EB: mov edx, [ebp+08h]
  '004876EE: mov eax, [edx]
  '004876F0: mov ecx, [ebp+08h]
  '004876F3: push ecx
  '004876F4: call [eax+0000032Ch]
  '004876FA: push eax
  '004876FB: lea edx, [ebp-28h]
  '004876FE: push edx
  '004876FF: call [004010E4h]
  '00487705: push eax
  '00487706: lea eax, [ebp-40h]
  '00487709: push eax
  '0048770A: call [004011E4h]
  '00487710: add esp, 00000010h
  '00487713: push eax
  '00487714: call [004011C8h]
  '0048771A: push eax
  '0048771B: lea ecx, [ebp-2Ch]
  '0048771E: push ecx
  '0048771F: call [004010E4h]
  '00487725: mov [ebp-68h], eax
  '00487728: mov [ebp-48h], 00000005h
  '0048772F: mov [ebp-50h], 00000002h
  '00487736: lea edx, [ebp-30h]
  '00487739: push edx
  '0048773A: lea eax, [ebp-50h]
  '0048773D: push eax
  '0048773E: mov ecx, [ebp-68h]
  '00487741: mov edx, [ecx]
  '00487743: mov eax, [ebp-68h]
  '00487746: push eax
  '00487747: call [edx+24h]
  '0048774A: fclex 
  '0048774C: mov [ebp-6Ch], eax
  '0048774F: cmp [ebp-6Ch], 00000000h
  '00487753: jnl 487772h
  '00487755: push 00000024h
  '00487757: push 0041C038h
  '0048775C: mov ecx, [ebp-68h]
  '0048775F: push ecx
  '00487760: mov edx, [ebp-6Ch]
  '00487763: push edx
  '00487764: call [004010A0h]
  '0048776A: mov [ebp-00000090h], eax
  '00487770: jmp 48777Ch
  '00487772: mov [ebp-00000090h], 00000000h
  '0048777C: mov eax, [ebp-30h]
  '0048777F: mov [ebp-70h], eax
  '00487782: lea ecx, [ebp-64h]
  '00487785: push ecx
  '00487786: mov edx, [ebp-70h]
  '00487789: mov eax, [edx]
  '0048778B: mov ecx, [ebp-70h]
  '0048778E: push ecx
  '0048778F: call [eax+7Ch]
  '00487792: fclex 
  '00487794: mov [ebp-74h], eax
  '00487797: cmp [ebp-74h], 00000000h
  '0048779B: jnl 4877BAh
  '0048779D: push 0000007Ch
  '0048779F: push 0041C048h
  '004877A4: mov edx, [ebp-70h]
  '004877A7: push edx
  '004877A8: mov eax, [ebp-74h]
  '004877AB: push eax
  '004877AC: call [004010A0h]
  '004877B2: mov [ebp-00000094h], eax
  '004877B8: jmp 4877C4h
  '004877BA: mov [ebp-00000094h], 00000000h
  '004877C4: xor ecx, ecx
  '004877C6: cmp [ebp-64h], 00000001h
  '004877CA: setz cl
  '004877CD: neg ecx
  '004877CF: mov [ebp-78h], cx
  '004877D3: lea edx, [ebp-30h]
  '004877D6: push edx
  '004877D7: lea eax, [ebp-2Ch]
  '004877DA: push eax
  '004877DB: lea ecx, [ebp-28h]
  '004877DE: push ecx
  '004877DF: push 00000003h
  '004877E1: call [00401064h]
  '004877E7: add esp, 00000010h
  '004877EA: lea edx, [ebp-50h]
  '004877ED: push edx
  '004877EE: lea eax, [ebp-40h]
  '004877F1: push eax
  '004877F2: push 00000002h
  '004877F4: call [00401050h]
  '004877FA: add esp, 0000000Ch
  '004877FD: movsx ecx, word ptr [ebp-78h]
  '00487801: test ecx, ecx
  '00487803: jz 48787Bh
  '00487805: mov [ebp-04h], 00000004h
  '0048780C: mov edx, [ebp+08h]
  '0048780F: mov eax, [edx+68h]
  '00487812: mov [ebp-58h], eax
  '00487815: mov [ebp-60h], 00000008h
  '0048781C: mov ecx, [ebp+0Ch]
  '0048781F: movsx edx, word ptr [ecx]
  '00487822: push edx
  '00487823: lea eax, [ebp-40h]
  '00487826: push eax
  '00487827: call [00401254h]
  '0048782D: lea ecx, [ebp-60h]
  '00487830: push ecx
  '00487831: lea edx, [ebp-40h]
  '00487834: push edx
  '00487835: lea eax, [ebp-50h]
  '00487838: push eax
  '00487839: call [00401274h]
  '0048783F: push eax
  '00487840: call [0040103Ch]
  '00487846: mov edx, eax
  '00487848: lea ecx, [ebp-24h]
  '0048784B: call [00401378h]
  '00487851: mov edx, eax
  '00487853: mov ecx, [ebp+08h]
  '00487856: add ecx, 00000068h
  '00487859: call [004012D8h]
  '0048785F: lea ecx, [ebp-24h]
  '00487862: call [004013B4h]
  '00487868: lea ecx, [ebp-50h]
  '0048786B: push ecx
  '0048786C: lea edx, [ebp-40h]
  '0048786F: push edx
  '00487870: push 00000002h
  '00487872: call [00401050h]
  '00487878: add esp, 0000000Ch
  '0048787B: mov [ebp-10h], 00000000h
  '00487882: push 004878BEh
  '00487887: jmp 4878BDh
  '00487889: lea ecx, [ebp-24h]
  '0048788C: call [004013B4h]
  '00487892: lea eax, [ebp-30h]
  '00487895: push eax
  '00487896: lea ecx, [ebp-2Ch]
  '00487899: push ecx
  '0048789A: lea edx, [ebp-28h]
  '0048789D: push edx
  '0048789E: push 00000003h
  '004878A0: call [00401064h]
  '004878A6: add esp, 00000010h
  '004878A9: lea eax, [ebp-50h]
  '004878AC: push eax
  '004878AD: lea ecx, [ebp-40h]
  '004878B0: push ecx
  '004878B1: push 00000002h
  '004878B3: call [00401050h]
  '004878B9: add esp, 0000000Ch
  '004878BC: ret 
End Sub
Private Sub picDisplay__4878E0
  '004878E0: push ebp
  '004878E1: mov ebp, esp
  '004878E3: sub esp, 00000018h
  '004878E6: push 004081B6h
  '004878EB: mov eax, fs:[00h]
  '004878F1: push eax
  '004878F2: mov fs:[00000000h], esp
  '004878F9: mov eax, 0000010Ch
  '004878FE: call 004081B0h
  '00487903: push ebx
  '00487904: push esi
  '00487905: push edi
  '00487906: mov [ebp-18h], esp
  '00487909: mov [ebp-14h], 004014C8h
  '00487910: mov eax, [ebp+08h]
  '00487913: and eax, 00000001h
  '00487916: mov [ebp-10h], eax
  '00487919: mov ecx, [ebp+08h]
  '0048791C: and ecx, FFFFFFFEh
  '0048791F: mov [ebp+08h], ecx
  '00487922: mov [ebp-0Ch], 00000000h
  '00487929: mov edx, [ebp+08h]
  '0048792C: mov eax, [edx]
  '0048792E: mov ecx, [ebp+08h]
  '00487931: push ecx
  '00487932: call [eax+04h]
  '00487935: mov [ebp-04h], 00000001h
  '0048793C: mov [ebp-04h], 00000002h
  '00487943: mov edx, [ebp+14h]
  '00487946: fld real4 ptr [edx]
  '00487948: call [0040135Ch]
  '0048794E: mov ecx, [ebp+08h]
  '00487951: mov [ecx+40h], eax
  '00487954: mov [ebp-04h], 00000003h
  '0048795B: mov edx, [ebp+18h]
  '0048795E: fld real4 ptr [edx]
  '00487960: call [0040135Ch]
  '00487966: mov ecx, [ebp+08h]
  '00487969: mov [ecx+44h], eax
  '0048796C: mov [ebp-04h], 00000004h
  '00487973: push FFFFFFFFh
  '00487975: call [004010E8h]
  '0048797B: mov [ebp-04h], 00000005h
  '00487982: mov edx, [ebp+0Ch]
  '00487985: xor ebx, ebx
  '00487987: cmp word ptr [edx], 0002h
  '0048798B: setnz bl
  '0048798E: call 00519E40h
  '00487993: movsx eax, ax
  '00487996: neg eax
  '00487998: sbb eax, eax
  '0048799A: neg eax
  '0048799C: or ebx, eax
  '0048799E: test ebx, ebx
  '004879A0: jnz 00487B2Fh
  '004879A6: mov [ebp-04h], 00000006h
  '004879AD: mov [ebp-000000BCh], 80020004h
  '004879B7: mov [ebp-000000C4h], 0000000Ah
  '004879C1: mov [ebp-000000ACh], 80020004h
  '004879CB: mov [ebp-000000B4h], 0000000Ah
  '004879D5: mov [ebp-0000009Ch], 80020004h
  '004879DF: mov [ebp-000000A4h], 0000000Ah
  '004879E9: mov [ebp-0000008Ch], 80020004h
  '004879F3: mov [ebp-00000094h], 0000000Ah
  '004879FD: mov eax, 00000010h
  '00487A02: call 004081B0h
  '00487A07: mov ecx, esp
  '00487A09: mov edx, [ebp-000000C4h]
  '00487A0F: mov [ecx], edx
  '00487A11: mov eax, [ebp-000000C0h]
  '00487A17: mov [ecx+04h], eax
  '00487A1A: mov edx, [ebp-000000BCh]
  '00487A20: mov [ecx+08h], edx
  '00487A23: mov eax, [ebp-000000B8h]
  '00487A29: mov [ecx+0Ch], eax
  '00487A2C: mov eax, 00000010h
  '00487A31: call 004081B0h
  '00487A36: mov ecx, esp
  '00487A38: mov edx, [ebp-000000B4h]
  '00487A3E: mov [ecx], edx
  '00487A40: mov eax, [ebp-000000B0h]
  '00487A46: mov [ecx+04h], eax
  '00487A49: mov edx, [ebp-000000ACh]
  '00487A4F: mov [ecx+08h], edx
  '00487A52: mov eax, [ebp-000000A8h]
  '00487A58: mov [ecx+0Ch], eax
  '00487A5B: mov eax, 00000010h
  '00487A60: call 004081B0h
  '00487A65: mov ecx, esp
  '00487A67: mov edx, [ebp-000000A4h]
  '00487A6D: mov [ecx], edx
  '00487A6F: mov eax, [ebp-000000A0h]
  '00487A75: mov [ecx+04h], eax
  '00487A78: mov edx, [ebp-0000009Ch]
  '00487A7E: mov [ecx+08h], edx
  '00487A81: mov eax, [ebp-00000098h]
  '00487A87: mov [ecx+0Ch], eax
  '00487A8A: mov eax, 00000010h
  '00487A8F: call 004081B0h
  '00487A94: mov ecx, esp
  '00487A96: mov edx, [ebp-00000094h]
  '00487A9C: mov [ecx], edx
  '00487A9E: mov eax, [ebp-00000090h]
  '00487AA4: mov [ecx+04h], eax
  '00487AA7: mov edx, [ebp-0000008Ch]
  '00487AAD: mov [ecx+08h], edx
  '00487AB0: mov eax, [ebp-00000088h]
  '00487AB6: mov [ecx+0Ch], eax
  '00487AB9: mov ecx, [ebp+08h]
  '00487ABC: mov edx, [ecx]
  '00487ABE: mov eax, [ebp+08h]
  '00487AC1: push eax
  '00487AC2: call [edx+00000314h]
  '00487AC8: push eax
  '00487AC9: lea ecx, [ebp-5Ch]
  '00487ACC: push ecx
  '00487ACD: call [004010E4h]
  '00487AD3: push eax
  '00487AD4: mov edx, [ebp+08h]
  '00487AD7: mov eax, [edx]
  '00487AD9: mov ecx, [ebp+08h]
  '00487ADC: push ecx
  '00487ADD: call [eax+000002BCh]
  '00487AE3: fclex 
  '00487AE5: mov [ebp-000000DCh], eax
  '00487AEB: cmp [ebp-000000DCh], 00000000h
  '00487AF2: jnl 487B17h
  '00487AF4: push 000002BCh
  '00487AF9: push 0041BC88h
  '00487AFE: mov edx, [ebp+08h]
  '00487B01: push edx
  '00487B02: mov eax, [ebp-000000DCh]
  '00487B08: push eax
  '00487B09: call [004010A0h]
  '00487B0F: mov [ebp-0000010Ch], eax
  '00487B15: jmp 487B21h
  '00487B17: mov [ebp-0000010Ch], 00000000h
  '00487B21: lea ecx, [ebp-5Ch]
  '00487B24: call [004013B8h]
  '00487B2A: jmp 0048825Eh
  '00487B2F: mov [ebp-04h], 00000008h
  '00487B36: push 0041C038h
  '00487B3B: push 00000000h
  '00487B3D: push 00000003h
  '00487B3F: mov ecx, [ebp+08h]
  '00487B42: mov edx, [ecx]
  '00487B44: mov eax, [ebp+08h]
  '00487B47: push eax
  '00487B48: call [edx+0000032Ch]
  '00487B4E: push eax
  '00487B4F: lea ecx, [ebp-5Ch]
  '00487B52: push ecx
  '00487B53: call [004010E4h]
  '00487B59: push eax
  '00487B5A: lea edx, [ebp-74h]
  '00487B5D: push edx
  '00487B5E: call [004011E4h]
  '00487B64: add esp, 00000010h
  '00487B67: push eax
  '00487B68: call [004011C8h]
  '00487B6E: push eax
  '00487B6F: lea eax, [ebp-60h]
  '00487B72: push eax
  '00487B73: call [004010E4h]
  '00487B79: mov [ebp-000000DCh], eax
  '00487B7F: mov [ebp-7Ch], 00000004h
  '00487B86: mov [ebp-00000084h], 00000002h
  '00487B90: lea ecx, [ebp-64h]
  '00487B93: push ecx
  '00487B94: lea edx, [ebp-00000084h]
  '00487B9A: push edx
  '00487B9B: mov eax, [ebp-000000DCh]
  '00487BA1: mov ecx, [eax]
  '00487BA3: mov edx, [ebp-000000DCh]
  '00487BA9: push edx
  '00487BAA: call [ecx+24h]
  '00487BAD: fclex 
  '00487BAF: mov [ebp-000000E0h], eax
  '00487BB5: cmp [ebp-000000E0h], 00000000h
  '00487BBC: jnl 487BE1h
  '00487BBE: push 00000024h
  '00487BC0: push 0041C038h
  '00487BC5: mov eax, [ebp-000000DCh]
  '00487BCB: push eax
  '00487BCC: mov ecx, [ebp-000000E0h]
  '00487BD2: push ecx
  '00487BD3: call [004010A0h]
  '00487BD9: mov [ebp-00000110h], eax
  '00487BDF: jmp 487BEBh
  '00487BE1: mov [ebp-00000110h], 00000000h
  '00487BEB: mov edx, [ebp-64h]
  '00487BEE: mov [ebp-000000E4h], edx
  '00487BF4: lea eax, [ebp-000000CCh]
  '00487BFA: push eax
  '00487BFB: mov ecx, [ebp-000000E4h]
  '00487C01: mov edx, [ecx]
  '00487C03: mov eax, [ebp-000000E4h]
  '00487C09: push eax
  '00487C0A: call [edx+7Ch]
  '00487C0D: fclex 
  '00487C0F: mov [ebp-000000E8h], eax
  '00487C15: cmp [ebp-000000E8h], 00000000h
  '00487C1C: jnl 487C41h
  '00487C1E: push 0000007Ch
  '00487C20: push 0041C048h
  '00487C25: mov ecx, [ebp-000000E4h]
  '00487C2B: push ecx
  '00487C2C: mov edx, [ebp-000000E8h]
  '00487C32: push edx
  '00487C33: call [004010A0h]
  '00487C39: mov [ebp-00000114h], eax
  '00487C3F: jmp 487C4Bh
  '00487C41: mov [ebp-00000114h], 00000000h
  '00487C4B: xor eax, eax
  '00487C4D: cmp [ebp-000000CCh], 00000000h
  '00487C54: setz al
  '00487C57: neg eax
  '00487C59: mov [ebp-000000ECh], ax
  '00487C60: lea ecx, [ebp-64h]
  '00487C63: push ecx
  '00487C64: lea edx, [ebp-60h]
  '00487C67: push edx
  '00487C68: lea eax, [ebp-5Ch]
  '00487C6B: push eax
  '00487C6C: push 00000003h
  '00487C6E: call [00401064h]
  '00487C74: add esp, 00000010h
  '00487C77: lea ecx, [ebp-00000084h]
  '00487C7D: push ecx
  '00487C7E: lea edx, [ebp-74h]
  '00487C81: push edx
  '00487C82: push 00000002h
  '00487C84: call [00401050h]
  '00487C8A: add esp, 0000000Ch
  '00487C8D: movsx eax, word ptr [ebp-000000ECh]
  '00487C94: test eax, eax
  '00487C96: jz 487C9Dh
  '00487C98: jmp 0048825Eh
  '00487C9D: mov [ebp-04h], 0000000Bh
  '00487CA4: mov ecx, [ebp+08h]
  '00487CA7: mov edx, [ecx]
  '00487CA9: mov eax, [ebp+08h]
  '00487CAC: push eax
  '00487CAD: call [edx+0000030Ch]
  '00487CB3: push eax
  '00487CB4: lea ecx, [ebp-5Ch]
  '00487CB7: push ecx
  '00487CB8: call [004010E4h]
  '00487CBE: mov [ebp-000000DCh], eax
  '00487CC4: lea edx, [ebp-2Ch]
  '00487CC7: push edx
  '00487CC8: mov eax, [ebp-000000DCh]
  '00487CCE: mov ecx, [eax]
  '00487CD0: mov edx, [ebp-000000DCh]
  '00487CD6: push edx
  '00487CD7: call [ecx+000000A8h]
  '00487CDD: fclex 
  '00487CDF: mov [ebp-000000E0h], eax
  '00487CE5: cmp [ebp-000000E0h], 00000000h
  '00487CEC: jnl 487D14h
  '00487CEE: push 000000A8h
  '00487CF3: push 0041C0C4h
  '00487CF8: mov eax, [ebp-000000DCh]
  '00487CFE: push eax
  '00487CFF: mov ecx, [ebp-000000E0h]
  '00487D05: push ecx
  '00487D06: call [004010A0h]
  '00487D0C: mov [ebp-00000118h], eax
  '00487D12: jmp 487D1Eh
  '00487D14: mov [ebp-00000118h], 00000000h
  '00487D1E: mov edx, [ebp-2Ch]
  '00487D21: push edx
  '00487D22: push 0041DD3Ch
  '00487D27: call [00401184h]
  '00487D2D: neg eax
  '00487D2F: sbb eax, eax
  '00487D31: neg eax
  '00487D33: neg eax
  '00487D35: mov [ebp-000000E4h], ax
  '00487D3C: lea ecx, [ebp-2Ch]
  '00487D3F: call [004013B4h]
  '00487D45: lea ecx, [ebp-5Ch]
  '00487D48: call [004013B8h]
  '00487D4E: movsx eax, word ptr [ebp-000000E4h]
  '00487D55: test eax, eax
  '00487D57: jz 487D8Fh
  '00487D59: mov [ebp-04h], 0000000Ch
  '00487D60: mov edx, 0041DD5Ch
  '00487D65: lea ecx, [ebp-2Ch]
  '00487D68: call [004012D8h]
  '00487D6E: lea ecx, [ebp-2Ch]
  '00487D71: push ecx
  '00487D72: mov edx, [ebp+08h]
  '00487D75: mov eax, [edx]
  '00487D77: mov ecx, [ebp+08h]
  '00487D7A: push ecx
  '00487D7B: call [eax+00000740h]
  '00487D81: lea ecx, [ebp-2Ch]
  '00487D84: call [004013B4h]
  '00487D8A: jmp 0048825Eh
  '00487D8F: mov [ebp-04h], 0000000Fh
  '00487D96: lea edx, [ebp-2Ch]
  '00487D99: push edx
  '00487D9A: mov eax, [ebp+08h]
  '00487D9D: mov ecx, [eax]
  '00487D9F: mov edx, [ebp+08h]
  '00487DA2: push edx
  '00487DA3: call [ecx+000001C0h]
  '00487DA9: fclex 
  '00487DAB: mov [ebp-000000DCh], eax
  '00487DB1: cmp [ebp-000000DCh], 00000000h
  '00487DB8: jnl 487DDDh
  '00487DBA: push 000001C0h
  '00487DBF: push 0041BC88h
  '00487DC4: mov eax, [ebp+08h]
  '00487DC7: push eax
  '00487DC8: mov ecx, [ebp-000000DCh]
  '00487DCE: push ecx
  '00487DCF: call [004010A0h]
  '00487DD5: mov [ebp-0000011Ch], eax
  '00487DDB: jmp 487DE7h
  '00487DDD: mov [ebp-0000011Ch], 00000000h
  '00487DE7: mov [ebp-6Ch], 80020004h
  '00487DEE: mov [ebp-74h], 0000000Ah
  '00487DF5: lea edx, [ebp-74h]
  '00487DF8: push edx
  '00487DF9: push 00000004h
  '00487DFB: mov eax, [ebp-2Ch]
  '00487DFE: push eax
  '00487DFF: call [00401148h]
  '00487E05: mov edx, eax
  '00487E07: lea ecx, [ebp-30h]
  '00487E0A: call [00401378h]
  '00487E10: push eax
  '00487E11: call [004013BCh]
  '00487E17: fstp real8 ptr [ebp-000000D8h]
  '00487E1D: mov ecx, [ebp+08h]
  '00487E20: mov edx, [ecx]
  '00487E22: mov eax, [ebp+08h]
  '00487E25: push eax
  '00487E26: call [edx+00000310h]
  '00487E2C: push eax
  '00487E2D: lea ecx, [ebp-5Ch]
  '00487E30: push ecx
  '00487E31: call [004010E4h]
  '00487E37: mov [ebp-000000E0h], eax
  '00487E3D: lea edx, [ebp-000000CCh]
  '00487E43: push edx
  '00487E44: mov eax, [ebp-000000E0h]
  '00487E4A: mov ecx, [eax]
  '00487E4C: mov edx, [ebp-000000E0h]
  '00487E52: push edx
  '00487E53: call [ecx+00000108h]
  '00487E59: fclex 
  '00487E5B: mov [ebp-000000E4h], eax
  '00487E61: cmp [ebp-000000E4h], 00000000h
  '00487E68: jnl 487E90h
  '00487E6A: push 00000108h
  '00487E6F: push 0041C058h
  '00487E74: mov eax, [ebp-000000E0h]
  '00487E7A: push eax
  '00487E7B: mov ecx, [ebp-000000E4h]
  '00487E81: push ecx
  '00487E82: call [004010A0h]
  '00487E88: mov [ebp-00000120h], eax
  '00487E8E: jmp 487E9Ah
  '00487E90: mov [ebp-00000120h], 00000000h
  '00487E9A: mov edx, [ebp+08h]
  '00487E9D: mov eax, [edx]
  '00487E9F: mov ecx, [ebp+08h]
  '00487EA2: push ecx
  '00487EA3: call [eax+00000310h]
  '00487EA9: push eax
  '00487EAA: lea edx, [ebp-60h]
  '00487EAD: push edx
  '00487EAE: call [004010E4h]
  '00487EB4: mov [ebp-000000E8h], eax
  '00487EBA: lea eax, [ebp-000000D0h]
  '00487EC0: push eax
  '00487EC1: mov ecx, [ebp-000000E8h]
  '00487EC7: mov edx, [ecx]
  '00487EC9: mov eax, [ebp-000000E8h]
  '00487ECF: push eax
  '00487ED0: call [edx+00000110h]
  '00487ED6: fclex 
  '00487ED8: mov [ebp-000000ECh], eax
  '00487EDE: cmp [ebp-000000ECh], 00000000h
  '00487EE5: jnl 487F0Dh
  '00487EE7: push 00000110h
  '00487EEC: push 0041C058h
  '00487EF1: mov ecx, [ebp-000000E8h]
  '00487EF7: push ecx
  '00487EF8: mov edx, [ebp-000000ECh]
  '00487EFE: push edx
  '00487EFF: call [004010A0h]
  '00487F05: mov [ebp-00000124h], eax
  '00487F0B: jmp 487F17h
  '00487F0D: mov [ebp-00000124h], 00000000h
  '00487F17: cmp [00541024h], 00000000h
  '00487F1E: jnz 487F3Ch
  '00487F20: push 00541024h
  '00487F25: push 00413334h
  '00487F2A: call [004012B8h]
  '00487F30: mov [ebp-00000128h], 00541024h
  '00487F3A: jmp 487F46h
  '00487F3C: mov [ebp-00000128h], 00541024h
  '00487F46: mov eax, [ebp-00000128h]
  '00487F4C: mov ecx, [eax]
  '00487F4E: mov [ebp-000000F0h], ecx
  '00487F54: push 0041DDC8h
  '00487F59: push 0041C0D8h
  '00487F5E: call [0040108Ch]
  '00487F64: mov edx, eax
  '00487F66: lea ecx, [ebp-34h]
  '00487F69: call [00401378h]
  '00487F6F: push eax
  '00487F70: mov edx, [ebp+14h]
  '00487F73: fld real4 ptr [edx]
  '00487F75: cmp [00541000h], 00000000h
  '00487F7C: jnz 487F86h
  '00487F7E: fdiv real4 ptr [ebp-000000CCh]
  '00487F84: jmp 487F91h
  '00487F86: push [ebp-000000CCh]
  '00487F8C: call 004081C8h
  '00487F91: fmul real4 ptr [00401530h]
  '00487F97: fstsw ax
  '00487F99: test al, 0Dh
  '00487F9B: jnz 004882F9h
  '00487FA1: call [004013ACh]
  '00487FA7: push ecx
  '00487FA8: fstp real4 ptr [esp]
  '00487FAB: call [004011D4h]
  '00487FB1: mov edx, eax
  '00487FB3: lea ecx, [ebp-38h]
  '00487FB6: call [00401378h]
  '00487FBC: push eax
  '00487FBD: call [0040108Ch]
  '00487FC3: mov edx, eax
  '00487FC5: lea ecx, [ebp-3Ch]
  '00487FC8: call [00401378h]
  '00487FCE: push eax
  '00487FCF: push 0041C0D8h
  '00487FD4: call [0040108Ch]
  '00487FDA: mov edx, eax
  '00487FDC: lea ecx, [ebp-40h]
  '00487FDF: call [00401378h]
  '00487FE5: push eax
  '00487FE6: mov eax, [ebp+18h]
  '00487FE9: fld real4 ptr [eax]
  '00487FEB: cmp [00541000h], 00000000h
  '00487FF2: jnz 487FFCh
  '00487FF4: fdiv real4 ptr [ebp-000000D0h]
  '00487FFA: jmp 488007h
  '00487FFC: push [ebp-000000D0h]
  '00488002: call 004081C8h
  '00488007: fmul real4 ptr [00401530h]
  '0048800D: fstsw ax
  '0048800F: test al, 0Dh
  '00488011: jnz 004882F9h
  '00488017: call [004013ACh]
  '0048801D: push ecx
  '0048801E: fstp real4 ptr [esp]
  '00488021: call [004011D4h]
  '00488027: mov edx, eax
  '00488029: lea ecx, [ebp-44h]
  '0048802C: call [00401378h]
  '00488032: push eax
  '00488033: call [0040108Ch]
  '00488039: mov edx, eax
  '0048803B: lea ecx, [ebp-48h]
  '0048803E: call [00401378h]
  '00488044: push eax
  '00488045: push 0041C0D8h
  '0048804A: call [0040108Ch]
  '00488050: mov edx, eax
  '00488052: lea ecx, [ebp-4Ch]
  '00488055: call [00401378h]
  '0048805B: push eax
  '0048805C: mov ecx, [ebp+0Ch]
  '0048805F: mov dx, [ecx]
  '00488062: push edx
  '00488063: call [0040100Ch]
  '00488069: mov edx, eax
  '0048806B: lea ecx, [ebp-50h]
  '0048806E: call [00401378h]
  '00488074: push eax
  '00488075: call [0040108Ch]
  '0048807B: mov edx, eax
  '0048807D: lea ecx, [ebp-54h]
  '00488080: call [00401378h]
  '00488086: push eax
  '00488087: push 0041DA4Ch
  '0048808C: call [0040108Ch]
  '00488092: mov edx, eax
  '00488094: lea ecx, [ebp-58h]
  '00488097: call [00401378h]
  '0048809D: fld real8 ptr [ebp-000000D8h]
  '004880A3: call [00401348h]
  '004880A9: mov [ebp-000000C8h], ax
  '004880B0: lea eax, [ebp-58h]
  '004880B3: push eax
  '004880B4: lea ecx, [ebp-000000C8h]
  '004880BA: push ecx
  '004880BB: mov edx, [ebp-000000F0h]
  '004880C1: mov eax, [edx]
  '004880C3: mov ecx, [ebp-000000F0h]
  '004880C9: push ecx
  '004880CA: call [eax+00000714h]
  '004880D0: fclex 
  '004880D2: mov [ebp-000000F4h], eax
  '004880D8: cmp [ebp-000000F4h], 00000000h
  '004880DF: jnl 488107h
  '004880E1: push 00000714h
  '004880E6: push 0041C118h
  '004880EB: mov edx, [ebp-000000F0h]
  '004880F1: push edx
  '004880F2: mov eax, [ebp-000000F4h]
  '004880F8: push eax
  '004880F9: call [004010A0h]
  '004880FF: mov [ebp-0000012Ch], eax
  '00488105: jmp 488111h
  '00488107: mov [ebp-0000012Ch], 00000000h
  '00488111: lea ecx, [ebp-58h]
  '00488114: push ecx
  '00488115: lea edx, [ebp-54h]
  '00488118: push edx
  '00488119: lea eax, [ebp-50h]
  '0048811C: push eax
  '0048811D: lea ecx, [ebp-4Ch]
  '00488120: push ecx
  '00488121: lea edx, [ebp-48h]
  '00488124: push edx
  '00488125: lea eax, [ebp-44h]
  '00488128: push eax
  '00488129: lea ecx, [ebp-40h]
  '0048812C: push ecx
  '0048812D: lea edx, [ebp-3Ch]
  '00488130: push edx
  '00488131: lea eax, [ebp-38h]
  '00488134: push eax
  '00488135: lea ecx, [ebp-34h]
  '00488138: push ecx
  '00488139: lea edx, [ebp-30h]
  '0048813C: push edx
  '0048813D: lea eax, [ebp-2Ch]
  '00488140: push eax
  '00488141: push 0000000Ch
  '00488143: call [004012E8h]
  '00488149: add esp, 00000034h
  '0048814C: lea ecx, [ebp-60h]
  '0048814F: push ecx
  '00488150: lea edx, [ebp-5Ch]
  '00488153: push edx
  '00488154: push 00000002h
  '00488156: call [00401064h]
  '0048815C: add esp, 0000000Ch
  '0048815F: lea ecx, [ebp-74h]
  '00488162: call [00401030h]
  '00488168: mov [ebp-04h], 00000010h
  '0048816F: push 0041DDE4h
  '00488174: mov eax, [ebp+14h]
  '00488177: mov ecx, [eax]
  '00488179: push ecx
  '0048817A: call [004011D4h]
  '00488180: mov edx, eax
  '00488182: lea ecx, [ebp-2Ch]
  '00488185: call [00401378h]
  '0048818B: push eax
  '0048818C: call [0040108Ch]
  '00488192: mov edx, eax
  '00488194: lea ecx, [ebp-30h]
  '00488197: call [00401378h]
  '0048819D: push eax
  '0048819E: push 0041DE10h
  '004881A3: call [0040108Ch]
  '004881A9: mov edx, eax
  '004881AB: lea ecx, [ebp-34h]
  '004881AE: call [00401378h]
  '004881B4: push eax
  '004881B5: mov edx, [ebp+18h]
  '004881B8: mov eax, [edx]
  '004881BA: push eax
  '004881BB: call [004011D4h]
  '004881C1: mov edx, eax
  '004881C3: lea ecx, [ebp-38h]
  '004881C6: call [00401378h]
  '004881CC: push eax
  '004881CD: call [0040108Ch]
  '004881D3: mov edx, eax
  '004881D5: lea ecx, [ebp-3Ch]
  '004881D8: call [00401378h]
  '004881DE: push eax
  '004881DF: push 0041DE18h
  '004881E4: call [0040108Ch]
  '004881EA: mov edx, eax
  '004881EC: lea ecx, [ebp-40h]
  '004881EF: call [00401378h]
  '004881F5: push eax
  '004881F6: mov ecx, [ebp+0Ch]
  '004881F9: mov dx, [ecx]
  '004881FC: push edx
  '004881FD: call [0040100Ch]
  '00488203: mov edx, eax
  '00488205: lea ecx, [ebp-44h]
  '00488208: call [00401378h]
  '0048820E: push eax
  '0048820F: call [0040108Ch]
  '00488215: mov edx, eax
  '00488217: lea ecx, [ebp-48h]
  '0048821A: call [00401378h]
  '00488220: lea eax, [ebp-48h]
  '00488223: push eax
  '00488224: mov ecx, [ebp+08h]
  '00488227: mov edx, [ecx]
  '00488229: mov eax, [ebp+08h]
  '0048822C: push eax
  '0048822D: call [edx+00000740h]
  '00488233: lea ecx, [ebp-48h]
  '00488236: push ecx
  '00488237: lea edx, [ebp-44h]
  '0048823A: push edx
  '0048823B: lea eax, [ebp-40h]
  '0048823E: push eax
  '0048823F: lea ecx, [ebp-3Ch]
  '00488242: push ecx
  '00488243: lea edx, [ebp-38h]
  '00488246: push edx
  '00488247: lea eax, [ebp-34h]
  '0048824A: push eax
  '0048824B: lea ecx, [ebp-30h]
  '0048824E: push ecx
  '0048824F: lea edx, [ebp-2Ch]
  '00488252: push edx
  '00488253: push 00000008h
  '00488255: call [004012E8h]
  '0048825B: add esp, 00000024h
  '0048825E: mov [ebp-10h], 00000000h
  '00488265: wait 
  '00488266: push 004882D7h
  '0048826B: jmp 4882D6h
  '0048826D: lea eax, [ebp-58h]
  '00488270: push eax
  '00488271: lea ecx, [ebp-54h]
  '00488274: push ecx
  '00488275: lea edx, [ebp-50h]
  '00488278: push edx
  '00488279: lea eax, [ebp-4Ch]
  '0048827C: push eax
  '0048827D: lea ecx, [ebp-48h]
  '00488280: push ecx
  '00488281: lea edx, [ebp-44h]
  '00488284: push edx
  '00488285: lea eax, [ebp-40h]
  '00488288: push eax
  '00488289: lea ecx, [ebp-3Ch]
  '0048828C: push ecx
  '0048828D: lea edx, [ebp-38h]
  '00488290: push edx
  '00488291: lea eax, [ebp-34h]
  '00488294: push eax
  '00488295: lea ecx, [ebp-30h]
  '00488298: push ecx
  '00488299: lea edx, [ebp-2Ch]
  '0048829C: push edx
  '0048829D: push 0000000Ch
  '0048829F: call [004012E8h]
  '004882A5: add esp, 00000034h
  '004882A8: lea eax, [ebp-64h]
  '004882AB: push eax
  '004882AC: lea ecx, [ebp-60h]
  '004882AF: push ecx
  '004882B0: lea edx, [ebp-5Ch]
  '004882B3: push edx
  '004882B4: push 00000003h
  '004882B6: call [00401064h]
  '004882BC: add esp, 00000010h
  '004882BF: lea eax, [ebp-00000084h]
  '004882C5: push eax
  '004882C6: lea ecx, [ebp-74h]
  '004882C9: push ecx
  '004882CA: push 00000002h
  '004882CC: call [00401050h]
  '004882D2: add esp, 0000000Ch
  '004882D5: ret 
End Sub
Private Sub unknown_48B200
  '0048B200: push ebp
  '0048B201: mov ebp, esp
  '0048B203: sub esp, 00000014h
  '0048B206: push 004081B6h
  '0048B20B: mov eax, fs:[00h]
  '0048B211: push eax
  '0048B212: mov fs:[00000000h], esp
  '0048B219: sub esp, 00000028h
  '0048B21C: push ebx
  '0048B21D: push esi
  '0048B21E: push edi
  '0048B21F: mov [ebp-14h], esp
  '0048B222: mov [ebp-10h], 00401820h
  '0048B229: xor esi, esi
  '0048B22B: mov [ebp-0Ch], esi
  '0048B22E: mov [ebp-08h], esi
  '0048B231: mov eax, [ebp+08h]
  '0048B234: mov ecx, [eax]
  '0048B236: push eax
  '0048B237: call [ecx+04h]
  '0048B23A: mov [ebp-20h], esi
  '0048B23D: mov [ebp-24h], esi
  '0048B240: mov edx, [ebp+0Ch]
  '0048B243: lea ecx, [ebp-24h]
  '0048B246: call [004012D8h]
  '0048B24C: push 00000001h
  '0048B24E: call [004010E8h]
  '0048B254: mov edx, [ebp-24h]
  '0048B257: push edx
  '0048B258: push 00000001h
  '0048B25A: push FFFFFFFFh
  '0048B25C: push 00000001h
  '0048B25E: call [004012A0h]
  '0048B264: push 00000001h
  '0048B266: call [00401168h]
  '0048B26C: mov [ebp-20h], FFFFFFFFh
  '0048B273: jmp 48B27Ch
  '0048B275: mov [ebp-20h], 00000000h
  '0048B27C: call [004010D0h]
  '0048B282: push 0048B291h
  '0048B287: lea ecx, [ebp-24h]
  '0048B28A: call [004013B4h]
  '0048B290: ret 
End Sub
Private Sub unknown_48D1F0
  '0048D1F0: push ebp
  '0048D1F1: mov ebp, esp
  '0048D1F3: sub esp, 0000000Ch
  '0048D1F6: push 004081B6h
  '0048D1FB: mov eax, fs:[00h]
  '0048D201: push eax
  '0048D202: mov fs:[00000000h], esp
  '0048D209: sub esp, 00000074h
  '0048D20C: push ebx
  '0048D20D: push esi
  '0048D20E: push edi
  '0048D20F: mov [ebp-0Ch], esp
  '0048D212: mov [ebp-08h], 004019D8h
  '0048D219: xor esi, esi
  '0048D21B: mov [ebp-04h], esi
  '0048D21E: mov eax, [ebp+08h]
  '0048D221: push eax
  '0048D222: mov ecx, [eax]
  '0048D224: call [ecx+04h]
  '0048D227: mov edx, [ebp+10h]
  '0048D22A: mov [ebp-24h], esi
  '0048D22D: mov [ebp-3Ch], esi
  '0048D230: mov [ebp-4Ch], esi
  '0048D233: mov [ebp-5Ch], esi
  '0048D236: mov [ebp-6Ch], esi
  '0048D239: mov [ebp-7Ch], esi
  '0048D23C: mov [edx], esi
  '0048D23E: call [0040127Ch]
  '0048D244: fstp real8 ptr [ebp-2Ch]
  '0048D247: mov edi, [ebp+0Ch]
  '0048D24A: mov ebx, [ebp-28h]
  '0048D24D: call [0040127Ch]
  '0048D253: mov eax, [ebp-2Ch]
  '0048D256: lea ecx, [ebp-7Ch]
  '0048D259: fstp real4 ptr [ebp-74h]
  '0048D25C: lea edx, [ebp-5Ch]
  '0048D25F: push ecx
  '0048D260: push edx
  '0048D261: mov edx, edi
  '0048D263: lea ecx, [ebp-6Ch]
  '0048D266: mov [ebp-7Ch], 00008004h
  '0048D26D: mov [ebp-54h], eax
  '0048D270: mov [ebp-50h], ebx
  '0048D273: mov [ebp-5Ch], 00000005h
  '0048D27A: call [00401028h]
  '0048D280: push eax
  '0048D281: lea eax, [ebp-3Ch]
  '0048D284: push eax
  '0048D285: call [00401328h]
  '0048D28B: push eax
  '0048D28C: call [00401138h]
  '0048D292: lea ecx, [ebp-3Ch]
  '0048D295: mov esi, eax
  '0048D297: call [00401030h]
  '0048D29D: test si, si
  '0048D2A0: jz 48D2AAh
  '0048D2A2: call [00401104h]
  '0048D2A8: jmp 48D24Dh
  '0048D2AA: wait 
  '0048D2AB: push 0048D2D6h
  '0048D2B0: jmp 48D2D5h
  '0048D2B2: test byte ptr [ebp-04h], 04h
  '0048D2B6: jz 48D2C1h
  '0048D2B8: lea ecx, [ebp-24h]
  '0048D2BB: call [00401030h]
  '0048D2C1: lea ecx, [ebp-4Ch]
  '0048D2C4: lea edx, [ebp-3Ch]
  '0048D2C7: push ecx
  '0048D2C8: push edx
  '0048D2C9: push 00000002h
  '0048D2CB: call [00401050h]
  '0048D2D1: add esp, 0000000Ch
  '0048D2D4: ret 
End Sub
Private Sub unknown_488B90
  '00488B90: push ebp
  '00488B91: mov ebp, esp
  '00488B93: sub esp, 00000018h
  '00488B96: push 004081B6h
  '00488B9B: mov eax, fs:[00h]
  '00488BA1: push eax
  '00488BA2: mov fs:[00000000h], esp
  '00488BA9: mov eax, 000000BCh
  '00488BAE: call 004081B0h
  '00488BB3: push ebx
  '00488BB4: push esi
  '00488BB5: push edi
  '00488BB6: mov [ebp-18h], esp
  '00488BB9: mov [ebp-14h], 00401590h
  '00488BC0: mov [ebp-10h], 00000000h
  '00488BC7: mov [ebp-0Ch], 00000000h
  '00488BCE: mov [ebp-04h], 00000001h
  '00488BD5: mov [ebp-04h], 00000002h
  '00488BDC: push FFFFFFFFh
  '00488BDE: call [004010E8h]
  '00488BE4: mov [ebp-04h], 00000003h
  '00488BEB: mov eax, [ebp+0Ch]
  '00488BEE: cmp [eax], 00000001h
  '00488BF1: jnz 00489197h
  '00488BF7: mov [ebp-04h], 00000004h
  '00488BFE: push 00000000h
  '00488C00: push 00000008h
  '00488C02: mov ecx, [ebp+08h]
  '00488C05: mov edx, [ecx]
  '00488C07: mov eax, [ebp+08h]
  '00488C0A: push eax
  '00488C0B: call [edx+00000338h]
  '00488C11: push eax
  '00488C12: lea ecx, [ebp-30h]
  '00488C15: push ecx
  '00488C16: call [004010E4h]
  '00488C1C: push eax
  '00488C1D: lea edx, [ebp-48h]
  '00488C20: push edx
  '00488C21: call [004011E4h]
  '00488C27: add esp, 00000010h
  '00488C2A: push eax
  '00488C2B: call [00401284h]
  '00488C31: neg ax
  '00488C34: sbb eax, eax
  '00488C36: neg eax
  '00488C38: neg eax
  '00488C3A: mov [ebp-00000098h], ax
  '00488C41: lea ecx, [ebp-30h]
  '00488C44: call [004013B8h]
  '00488C4A: lea ecx, [ebp-48h]
  '00488C4D: call [00401030h]
  '00488C53: movsx eax, word ptr [ebp-00000098h]
  '00488C5A: test eax, eax
  '00488C5C: jz 488C96h
  '00488C5E: mov [ebp-04h], 00000005h
  '00488C65: push 00000000h
  '00488C67: push 00000046h
  '00488C69: mov ecx, [ebp+08h]
  '00488C6C: mov edx, [ecx]
  '00488C6E: mov eax, [ebp+08h]
  '00488C71: push eax
  '00488C72: call [edx+00000338h]
  '00488C78: push eax
  '00488C79: lea ecx, [ebp-30h]
  '00488C7C: push ecx
  '00488C7D: call [004010E4h]
  '00488C83: push eax
  '00488C84: call [00401040h]
  '00488C8A: add esp, 0000000Ch
  '00488C8D: lea ecx, [ebp-30h]
  '00488C90: call [004013B8h]
  '00488C96: mov [ebp-04h], 00000007h
  '00488C9D: cmp [0054106Ch], 00000000h
  '00488CA4: jnz 488CC2h
  '00488CA6: push 0054106Ch
  '00488CAB: push 00411238h
  '00488CB0: call [004012B8h]
  '00488CB6: mov [ebp-000000BCh], 0054106Ch
  '00488CC0: jmp 488CCCh
  '00488CC2: mov [ebp-000000BCh], 0054106Ch
  '00488CCC: mov edx, [ebp-000000BCh]
  '00488CD2: mov eax, [edx]
  '00488CD4: mov ecx, [ebp-000000BCh]
  '00488CDA: mov edx, [ecx]
  '00488CDC: mov ecx, [edx]
  '00488CDE: push eax
  '00488CDF: call [ecx+000003B0h]
  '00488CE5: push eax
  '00488CE6: lea edx, [ebp-30h]
  '00488CE9: push edx
  '00488CEA: call [004010E4h]
  '00488CF0: mov [ebp-00000098h], eax
  '00488CF6: lea eax, [ebp-24h]
  '00488CF9: push eax
  '00488CFA: mov ecx, [ebp-00000098h]
  '00488D00: mov edx, [ecx]
  '00488D02: mov eax, [ebp-00000098h]
  '00488D08: push eax
  '00488D09: call [edx+000000A0h]
  '00488D0F: fclex 
  '00488D11: mov [ebp-0000009Ch], eax
  '00488D17: cmp [ebp-0000009Ch], 00000000h
  '00488D1E: jnl 488D46h
  '00488D20: push 000000A0h
  '00488D25: push 0041E3FCh
  '00488D2A: mov ecx, [ebp-00000098h]
  '00488D30: push ecx
  '00488D31: mov edx, [ebp-0000009Ch]
  '00488D37: push edx
  '00488D38: call [004010A0h]
  '00488D3E: mov [ebp-000000C0h], eax
  '00488D44: jmp 488D50h
  '00488D46: mov [ebp-000000C0h], 00000000h
  '00488D50: mov eax, [ebp-24h]
  '00488D53: push eax
  '00488D54: call [004012E0h]
  '00488D5A: mov [ebp-70h], eax
  '00488D5D: mov [ebp-78h], 00000003h
  '00488D64: mov eax, 00000010h
  '00488D69: call 004081B0h
  '00488D6E: mov ecx, esp
  '00488D70: mov edx, [ebp-78h]
  '00488D73: mov [ecx], edx
  '00488D75: mov eax, [ebp-74h]
  '00488D78: mov [ecx+04h], eax
  '00488D7B: mov edx, [ebp-70h]
  '00488D7E: mov [ecx+08h], edx
  '00488D81: mov eax, [ebp-6Ch]
  '00488D84: mov [ecx+0Ch], eax
  '00488D87: push 00000002h
  '00488D89: mov ecx, [ebp+08h]
  '00488D8C: mov edx, [ecx]
  '00488D8E: mov eax, [ebp+08h]
  '00488D91: push eax
  '00488D92: call [edx+00000338h]
  '00488D98: push eax
  '00488D99: lea ecx, [ebp-34h]
  '00488D9C: push ecx
  '00488D9D: call [004010E4h]
  '00488DA3: push eax
  '00488DA4: call [0040139Ch]
  '00488DAA: lea ecx, [ebp-24h]
  '00488DAD: call [004013B4h]
  '00488DB3: lea edx, [ebp-34h]
  '00488DB6: push edx
  '00488DB7: lea eax, [ebp-30h]
  '00488DBA: push eax
  '00488DBB: push 00000002h
  '00488DBD: call [00401064h]
  '00488DC3: add esp, 0000000Ch
  '00488DC6: mov [ebp-04h], 00000008h
  '00488DCD: push 00000000h
  '00488DCF: push 00000041h
  '00488DD1: mov ecx, [ebp+08h]
  '00488DD4: mov edx, [ecx]
  '00488DD6: mov eax, [ebp+08h]
  '00488DD9: push eax
  '00488DDA: call [edx+00000338h]
  '00488DE0: push eax
  '00488DE1: lea ecx, [ebp-30h]
  '00488DE4: push ecx
  '00488DE5: call [004010E4h]
  '00488DEB: push eax
  '00488DEC: call [00401040h]
  '00488DF2: add esp, 0000000Ch
  '00488DF5: lea ecx, [ebp-30h]
  '00488DF8: call [004013B8h]
  '00488DFE: mov [ebp-04h], 00000009h
  '00488E05: call [00401104h]
  '00488E0B: mov [ebp-04h], 0000000Ah
  '00488E12: push 00000000h
  '00488E14: push 00000008h
  '00488E16: mov edx, [ebp+08h]
  '00488E19: mov eax, [edx]
  '00488E1B: mov ecx, [ebp+08h]
  '00488E1E: push ecx
  '00488E1F: call [eax+00000338h]
  '00488E25: push eax
  '00488E26: lea edx, [ebp-30h]
  '00488E29: push edx
  '00488E2A: call [004010E4h]
  '00488E30: push eax
  '00488E31: lea eax, [ebp-48h]
  '00488E34: push eax
  '00488E35: call [004011E4h]
  '00488E3B: add esp, 00000010h
  '00488E3E: push eax
  '00488E3F: call [00401284h]
  '00488E45: movsx ecx, ax
  '00488E48: xor edx, edx
  '00488E4A: cmp ecx, 00000002h
  '00488E4D: setz dl
  '00488E50: neg edx
  '00488E52: mov [ebp-00000098h], dx
  '00488E59: lea ecx, [ebp-30h]
  '00488E5C: call [004013B8h]
  '00488E62: lea ecx, [ebp-48h]
  '00488E65: call [00401030h]
  '00488E6B: movsx eax, word ptr [ebp-00000098h]
  '00488E72: test eax, eax
  '00488E74: jz 00489161h
  '00488E7A: mov [ebp-04h], 0000000Bh
  '00488E81: push 0041E410h
  '00488E86: push 00000000h
  '00488E88: push 00000002h
  '00488E8A: mov ecx, [ebp+08h]
  '00488E8D: mov edx, [ecx]
  '00488E8F: mov eax, [ebp+08h]
  '00488E92: push eax
  '00488E93: call [edx+00000338h]
  '00488E99: push eax
  '00488E9A: lea ecx, [ebp-30h]
  '00488E9D: push ecx
  '00488E9E: call [004010E4h]
  '00488EA4: push eax
  '00488EA5: lea edx, [ebp-48h]
  '00488EA8: push edx
  '00488EA9: call [004011E4h]
  '00488EAF: add esp, 00000010h
  '00488EB2: push eax
  '00488EB3: call [0040130Ch]
  '00488EB9: push eax
  '00488EBA: call [00401024h]
  '00488EC0: mov edx, eax
  '00488EC2: lea ecx, [ebp-24h]
  '00488EC5: call [00401378h]
  '00488ECB: push eax
  '00488ECC: call [0040108Ch]
  '00488ED2: mov edx, eax
  '00488ED4: lea ecx, [ebp-28h]
  '00488ED7: call [00401378h]
  '00488EDD: lea eax, [ebp-28h]
  '00488EE0: push eax
  '00488EE1: mov ecx, [ebp+08h]
  '00488EE4: mov edx, [ecx]
  '00488EE6: mov eax, [ebp+08h]
  '00488EE9: push eax
  '00488EEA: call [edx+00000740h]
  '00488EF0: lea ecx, [ebp-28h]
  '00488EF3: push ecx
  '00488EF4: lea edx, [ebp-24h]
  '00488EF7: push edx
  '00488EF8: push 00000002h
  '00488EFA: call [004012E8h]
  '00488F00: add esp, 0000000Ch
  '00488F03: lea ecx, [ebp-30h]
  '00488F06: call [004013B8h]
  '00488F0C: lea ecx, [ebp-48h]
  '00488F0F: call [00401030h]
  '00488F15: mov [ebp-04h], 0000000Ch
  '00488F1C: cmp [00541024h], 00000000h
  '00488F23: jnz 488F41h
  '00488F25: push 00541024h
  '00488F2A: push 00413334h
  '00488F2F: call [004012B8h]
  '00488F35: mov [ebp-000000C4h], 00541024h
  '00488F3F: jmp 488F4Bh
  '00488F41: mov [ebp-000000C4h], 00541024h
  '00488F4B: push 0041E438h
  '00488F50: push 00000000h
  '00488F52: push 0000000Dh
  '00488F54: mov eax, [ebp-000000C4h]
  '00488F5A: mov ecx, [eax]
  '00488F5C: mov edx, [ebp-000000C4h]
  '00488F62: mov eax, [edx]
  '00488F64: mov edx, [eax]
  '00488F66: push ecx
  '00488F67: call [edx+00000690h]
  '00488F6D: push eax
  '00488F6E: lea eax, [ebp-30h]
  '00488F71: push eax
  '00488F72: call [004010E4h]
  '00488F78: push eax
  '00488F79: lea ecx, [ebp-48h]
  '00488F7C: push ecx
  '00488F7D: call [004011E4h]
  '00488F83: add esp, 00000010h
  '00488F86: push eax
  '00488F87: call [004011C8h]
  '00488F8D: push eax
  '00488F8E: lea edx, [ebp-34h]
  '00488F91: push edx
  '00488F92: call [004010E4h]
  '00488F98: mov [ebp-00000098h], eax
  '00488F9E: lea eax, [ebp-58h]
  '00488FA1: push eax
  '00488FA2: mov ecx, [ebp-00000098h]
  '00488FA8: mov edx, [ecx]
  '00488FAA: mov eax, [ebp-00000098h]
  '00488FB0: push eax
  '00488FB1: call [edx+6Ch]
  '00488FB4: fclex 
  '00488FB6: mov [ebp-0000009Ch], eax
  '00488FBC: cmp [ebp-0000009Ch], 00000000h
  '00488FC3: jnl 488FE8h
  '00488FC5: push 0000006Ch
  '00488FC7: push 0041E438h
  '00488FCC: mov ecx, [ebp-00000098h]
  '00488FD2: push ecx
  '00488FD3: mov edx, [ebp-0000009Ch]
  '00488FD9: push edx
  '00488FDA: call [004010A0h]
  '00488FE0: mov [ebp-000000C8h], eax
  '00488FE6: jmp 488FF2h
  '00488FE8: mov [ebp-000000C8h], 00000000h
  '00488FF2: lea eax, [ebp-58h]
  '00488FF5: push eax
  '00488FF6: lea ecx, [ebp-24h]
  '00488FF9: push ecx
  '00488FFA: call [0040126Ch]
  '00489000: push eax
  '00489001: call [004013BCh]
  '00489007: fstp real8 ptr [ebp-00000094h]
  '0048900D: cmp [00541024h], 00000000h
  '00489014: jnz 489032h
  '00489016: push 00541024h
  '0048901B: push 00413334h
  '00489020: call [004012B8h]
  '00489026: mov [ebp-000000CCh], 00541024h
  '00489030: jmp 48903Ch
  '00489032: mov [ebp-000000CCh], 00541024h
  '0048903C: mov edx, [ebp-000000CCh]
  '00489042: mov eax, [edx]
  '00489044: mov [ebp-000000A0h], eax
  '0048904A: push 0041E44Ch
  '0048904F: push 00000000h
  '00489051: push 00000002h
  '00489053: mov ecx, [ebp+08h]
  '00489056: mov edx, [ecx]
  '00489058: mov eax, [ebp+08h]
  '0048905B: push eax
  '0048905C: call [edx+00000338h]
  '00489062: push eax
  '00489063: lea ecx, [ebp-38h]
  '00489066: push ecx
  '00489067: call [004010E4h]
  '0048906D: push eax
  '0048906E: lea edx, [ebp-68h]
  '00489071: push edx
  '00489072: call [004011E4h]
  '00489078: add esp, 00000010h
  '0048907B: push eax
  '0048907C: call [0040130Ch]
  '00489082: push eax
  '00489083: call [00401024h]
  '00489089: mov edx, eax
  '0048908B: lea ecx, [ebp-28h]
  '0048908E: call [00401378h]
  '00489094: push eax
  '00489095: call [0040108Ch]
  '0048909B: mov edx, eax
  '0048909D: lea ecx, [ebp-2Ch]
  '004890A0: call [00401378h]
  '004890A6: fld real8 ptr [ebp-00000094h]
  '004890AC: call [00401348h]
  '004890B2: mov [ebp-0000008Ch], ax
  '004890B9: lea eax, [ebp-2Ch]
  '004890BC: push eax
  '004890BD: lea ecx, [ebp-0000008Ch]
  '004890C3: push ecx
  '004890C4: mov edx, [ebp-000000A0h]
  '004890CA: mov eax, [edx]
  '004890CC: mov ecx, [ebp-000000A0h]
  '004890D2: push ecx
  '004890D3: call [eax+00000714h]
  '004890D9: fclex 
  '004890DB: mov [ebp-000000A4h], eax
  '004890E1: cmp [ebp-000000A4h], 00000000h
  '004890E8: jnl 489110h
  '004890EA: push 00000714h
  '004890EF: push 0041C118h
  '004890F4: mov edx, [ebp-000000A0h]
  '004890FA: push edx
  '004890FB: mov eax, [ebp-000000A4h]
  '00489101: push eax
  '00489102: call [004010A0h]
  '00489108: mov [ebp-000000D0h], eax
  '0048910E: jmp 48911Ah
  '00489110: mov [ebp-000000D0h], 00000000h
  '0048911A: lea ecx, [ebp-2Ch]
  '0048911D: push ecx
  '0048911E: lea edx, [ebp-28h]
  '00489121: push edx
  '00489122: lea eax, [ebp-24h]
  '00489125: push eax
  '00489126: push 00000003h
  '00489128: call [004012E8h]
  '0048912E: add esp, 00000010h
  '00489131: lea ecx, [ebp-38h]
  '00489134: push ecx
  '00489135: lea edx, [ebp-34h]
  '00489138: push edx
  '00489139: lea eax, [ebp-30h]
  '0048913C: push eax
  '0048913D: push 00000003h
  '0048913F: call [00401064h]
  '00489145: add esp, 00000010h
  '00489148: lea ecx, [ebp-68h]
  '0048914B: push ecx
  '0048914C: lea edx, [ebp-58h]
  '0048914F: push edx
  '00489150: lea eax, [ebp-48h]
  '00489153: push eax
  '00489154: push 00000003h
  '00489156: call [00401050h]
  '0048915C: add esp, 00000010h
  '0048915F: jmp 489192h
  '00489161: mov [ebp-04h], 0000000Eh
  '00489168: mov edx, 0041E484h
  '0048916D: lea ecx, [ebp-24h]
  '00489170: call [004012D8h]
  '00489176: lea ecx, [ebp-24h]
  '00489179: push ecx
  '0048917A: mov edx, [ebp+08h]
  '0048917D: mov eax, [edx]
  '0048917F: mov ecx, [ebp+08h]
  '00489182: push ecx
  '00489183: call [eax+00000740h]
  '00489189: lea ecx, [ebp-24h]
  '0048918C: call [004013B4h]
  '00489192: jmp 004893CDh
  '00489197: mov [ebp-04h], 00000011h
  '0048919E: push 00000000h
  '004891A0: push 00000008h
  '004891A2: mov edx, [ebp+08h]
  '004891A5: mov eax, [edx]
  '004891A7: mov ecx, [ebp+08h]
  '004891AA: push ecx
  '004891AB: call [eax+00000338h]
  '004891B1: push eax
  '004891B2: lea edx, [ebp-30h]
  '004891B5: push edx
  '004891B6: call [004010E4h]
  '004891BC: push eax
  '004891BD: lea eax, [ebp-48h]
  '004891C0: push eax
  '004891C1: call [004011E4h]
  '004891C7: add esp, 00000010h
  '004891CA: push eax
  '004891CB: call [00401284h]
  '004891D1: neg ax
  '004891D4: sbb eax, eax
  '004891D6: neg eax
  '004891D8: neg eax
  '004891DA: mov [ebp-00000098h], ax
  '004891E1: lea ecx, [ebp-30h]
  '004891E4: call [004013B8h]
  '004891EA: lea ecx, [ebp-48h]
  '004891ED: call [00401030h]
  '004891F3: movsx ecx, word ptr [ebp-00000098h]
  '004891FA: test ecx, ecx
  '004891FC: jz 489236h
  '004891FE: mov [ebp-04h], 00000012h
  '00489205: push 00000000h
  '00489207: push 00000046h
  '00489209: mov edx, [ebp+08h]
  '0048920C: mov eax, [edx]
  '0048920E: mov ecx, [ebp+08h]
  '00489211: push ecx
  '00489212: call [eax+00000338h]
  '00489218: push eax
  '00489219: lea edx, [ebp-30h]
  '0048921C: push edx
  '0048921D: call [004010E4h]
  '00489223: push eax
  '00489224: call [00401040h]
  '0048922A: add esp, 0000000Ch
  '0048922D: lea ecx, [ebp-30h]
  '00489230: call [004013B8h]
  '00489236: mov [ebp-04h], 00000014h
  '0048923D: cmp [00541024h], 00000000h
  '00489244: jnz 489262h
  '00489246: push 00541024h
  '0048924B: push 00413334h
  '00489250: call [004012B8h]
  '00489256: mov [ebp-000000D4h], 00541024h
  '00489260: jmp 48926Ch
  '00489262: mov [ebp-000000D4h], 00541024h
  '0048926C: mov eax, [ebp-000000D4h]
  '00489272: mov ecx, [eax]
  '00489274: mov [ebp-00000098h], ecx
  '0048927A: lea edx, [ebp-24h]
  '0048927D: push edx
  '0048927E: mov eax, [ebp-00000098h]
  '00489284: mov ecx, [eax]
  '00489286: mov edx, [ebp-00000098h]
  '0048928C: push edx
  '0048928D: call [ecx+00000700h]
  '00489293: fclex 
  '00489295: mov [ebp-0000009Ch], eax
  '0048929B: cmp [ebp-0000009Ch], 00000000h
  '004892A2: jnl 4892CAh
  '004892A4: push 00000700h
  '004892A9: push 0041C118h
  '004892AE: mov eax, [ebp-00000098h]
  '004892B4: push eax
  '004892B5: mov ecx, [ebp-0000009Ch]
  '004892BB: push ecx
  '004892BC: call [004010A0h]
  '004892C2: mov [ebp-000000D8h], eax
  '004892C8: jmp 4892D4h
  '004892CA: mov [ebp-000000D8h], 00000000h
  '004892D4: mov edx, [ebp-24h]
  '004892D7: push edx
  '004892D8: call [0040107Ch]
  '004892DE: mov [ebp-40h], eax
  '004892E1: mov [ebp-48h], 00000008h
  '004892E8: cmp [0054106Ch], 00000000h
  '004892EF: jnz 48930Dh
  '004892F1: push 0054106Ch
  '004892F6: push 00411238h
  '004892FB: call [004012B8h]
  '00489301: mov [ebp-000000DCh], 0054106Ch
  '0048930B: jmp 489317h
  '0048930D: mov [ebp-000000DCh], 0054106Ch
  '00489317: mov eax, [ebp-000000DCh]
  '0048931D: mov ecx, [eax]
  '0048931F: mov edx, [ebp-000000DCh]
  '00489325: mov eax, [edx]
  '00489327: mov edx, [eax]
  '00489329: push ecx
  '0048932A: call [edx+000003BCh]
  '00489330: mov [ebp-50h], eax
  '00489333: mov [ebp-58h], 00000009h
  '0048933A: mov eax, 00000010h
  '0048933F: call 004081B0h
  '00489344: mov eax, esp
  '00489346: mov ecx, [ebp-48h]
  '00489349: mov [eax], ecx
  '0048934B: mov edx, [ebp-44h]
  '0048934E: mov [eax+04h], edx
  '00489351: mov ecx, [ebp-40h]
  '00489354: mov [eax+08h], ecx
  '00489357: mov edx, [ebp-3Ch]
  '0048935A: mov [eax+0Ch], edx
  '0048935D: mov eax, 00000010h
  '00489362: call 004081B0h
  '00489367: mov eax, esp
  '00489369: mov ecx, [ebp-58h]
  '0048936C: mov [eax], ecx
  '0048936E: mov edx, [ebp-54h]
  '00489371: mov [eax+04h], edx
  '00489374: mov ecx, [ebp-50h]
  '00489377: mov [eax+08h], ecx
  '0048937A: mov edx, [ebp-4Ch]
  '0048937D: mov [eax+0Ch], edx
  '00489380: push 00000002h
  '00489382: push 00000040h
  '00489384: mov eax, [ebp+08h]
  '00489387: mov ecx, [eax]
  '00489389: mov edx, [ebp+08h]
  '0048938C: push edx
  '0048938D: call [ecx+00000338h]
  '00489393: push eax
  '00489394: lea eax, [ebp-30h]
  '00489397: push eax
  '00489398: call [004010E4h]
  '0048939E: push eax
  '0048939F: call [00401040h]
  '004893A5: add esp, 0000002Ch
  '004893A8: lea ecx, [ebp-24h]
  '004893AB: call [004013B4h]
  '004893B1: lea ecx, [ebp-30h]
  '004893B4: call [004013B8h]
  '004893BA: lea ecx, [ebp-58h]
  '004893BD: push ecx
  '004893BE: lea edx, [ebp-48h]
  '004893C1: push edx
  '004893C2: push 00000002h
  '004893C4: call [00401050h]
  '004893CA: add esp, 0000000Ch
  '004893CD: wait 
  '004893CE: push 0048941Ch
  '004893D3: jmp 48941Bh
  '004893D5: lea eax, [ebp-2Ch]
  '004893D8: push eax
  '004893D9: lea ecx, [ebp-28h]
  '004893DC: push ecx
  '004893DD: lea edx, [ebp-24h]
  '004893E0: push edx
  '004893E1: push 00000003h
  '004893E3: call [004012E8h]
  '004893E9: add esp, 00000010h
  '004893EC: lea eax, [ebp-38h]
  '004893EF: push eax
  '004893F0: lea ecx, [ebp-34h]
  '004893F3: push ecx
  '004893F4: lea edx, [ebp-30h]
  '004893F7: push edx
  '004893F8: push 00000003h
  '004893FA: call [00401064h]
  '00489400: add esp, 00000010h
  '00489403: lea eax, [ebp-68h]
  '00489406: push eax
  '00489407: lea ecx, [ebp-58h]
  '0048940A: push ecx
  '0048940B: lea edx, [ebp-48h]
  '0048940E: push edx
  '0048940F: push 00000003h
  '00489411: call [00401050h]
  '00489417: add esp, 00000010h
  '0048941A: ret 
End Sub
Private Sub unknown_48D0A0
  '0048D0A0: push ebp
  '0048D0A1: mov ebp, esp
  '0048D0A3: sub esp, 00000008h
  '0048D0A6: push 004081B6h
  '0048D0AB: mov eax, fs:[00h]
  '0048D0B1: push eax
  '0048D0B2: mov fs:[00000000h], esp
  '0048D0B9: sub esp, 00000050h
  '0048D0BC: push ebx
  '0048D0BD: push esi
  '0048D0BE: push edi
  '0048D0BF: mov [ebp-08h], esp
  '0048D0C2: mov [ebp-04h], 004019C8h
  '0048D0C9: mov eax, [ebp+08h]
  '0048D0CC: xor edi, edi
  '0048D0CE: push 0041E958h
  '0048D0D3: push edi
  '0048D0D4: mov ecx, [eax]
  '0048D0D6: push 00000003h
  '0048D0D8: push eax
  '0048D0D9: mov [ebp-14h], edi
  '0048D0DC: mov [ebp-18h], edi
  '0048D0DF: mov [ebp-1Ch], edi
  '0048D0E2: mov [ebp-2Ch], edi
  '0048D0E5: mov [ebp-3Ch], edi
  '0048D0E8: call [ecx+00000330h]
  '0048D0EE: mov esi, [004010E4h]
  '0048D0F4: lea edx, [ebp-14h]
  '0048D0F7: push eax
  '0048D0F8: push edx
  '0048D0F9: call esi
  '0048D0FB: push eax
  '0048D0FC: lea eax, [ebp-2Ch]
  '0048D0FF: push eax
  '0048D100: call [004011E4h]
  '0048D106: add esp, 00000010h
  '0048D109: push eax
  '0048D10A: call [004011C8h]
  '0048D110: lea ecx, [ebp-18h]
  '0048D113: push eax
  '0048D114: push ecx
  '0048D115: call esi
  '0048D117: mov esi, eax
  '0048D119: lea eax, [ebp-1Ch]
  '0048D11C: lea ecx, [ebp-3Ch]
  '0048D11F: mov [ebp-34h], 00000003h
  '0048D126: mov [ebp-3Ch], 00000002h
  '0048D12D: mov edx, [esi]
  '0048D12F: push eax
  '0048D130: push ecx
  '0048D131: push esi
  '0048D132: call [edx+24h]
  '0048D135: cmp eax, edi
  '0048D137: fclex 
  '0048D139: jnl 48D14Ah
  '0048D13B: push 00000024h
  '0048D13D: push 0041E958h
  '0048D142: push esi
  '0048D143: push eax
  '0048D144: call [004010A0h]
  '0048D14A: mov ecx, [ebp+0Ch]
  '0048D14D: mov eax, [ebp-1Ch]
  '0048D150: mov esi, eax
  '0048D152: mov ecx, [ecx]
  '0048D154: mov edx, [eax]
  '0048D156: push ecx
  '0048D157: push eax
  '0048D158: call [edx+00000080h]
  '0048D15E: cmp eax, edi
  '0048D160: fclex 
  '0048D162: jnl 48D176h
  '0048D164: push 00000080h
  '0048D169: push 0041E968h
  '0048D16E: push esi
  '0048D16F: push eax
  '0048D170: call [004010A0h]
  '0048D176: lea edx, [ebp-1Ch]
  '0048D179: lea eax, [ebp-18h]
  '0048D17C: push edx
  '0048D17D: lea ecx, [ebp-14h]
  '0048D180: push eax
  '0048D181: push ecx
  '0048D182: push 00000003h
  '0048D184: call [00401064h]
  '0048D18A: lea edx, [ebp-3Ch]
  '0048D18D: lea eax, [ebp-2Ch]
  '0048D190: push edx
  '0048D191: push eax
  '0048D192: push 00000002h
  '0048D194: call [00401050h]
  '0048D19A: add esp, 0000001Ch
  '0048D19D: push 0048D1CDh
  '0048D1A2: jmp 48D1CCh
  '0048D1A4: lea ecx, [ebp-1Ch]
  '0048D1A7: lea edx, [ebp-18h]
  '0048D1AA: push ecx
  '0048D1AB: lea eax, [ebp-14h]
  '0048D1AE: push edx
  '0048D1AF: push eax
  '0048D1B0: push 00000003h
  '0048D1B2: call [00401064h]
  '0048D1B8: lea ecx, [ebp-3Ch]
  '0048D1BB: lea edx, [ebp-2Ch]
  '0048D1BE: push ecx
  '0048D1BF: push edx
  '0048D1C0: push 00000002h
  '0048D1C2: call [00401050h]
  '0048D1C8: add esp, 0000001Ch
  '0048D1CB: ret 
End Sub
Private Sub EventWait_48D6B0
  '0048D6B0: push ebp
  '0048D6B1: mov ebp, esp
  '0048D6B3: sub esp, 00000018h
  '0048D6B6: push 004081B6h
  '0048D6BB: mov eax, fs:[00h]
  '0048D6C1: push eax
  '0048D6C2: mov fs:[00000000h], esp
  '0048D6C9: mov eax, 0000012Ch
  '0048D6CE: call 004081B0h
  '0048D6D3: push ebx
  '0048D6D4: push esi
  '0048D6D5: push edi
  '0048D6D6: mov [ebp-18h], esp
  '0048D6D9: mov [ebp-14h], 00401A38h
  '0048D6E0: mov [ebp-10h], 00000000h
  '0048D6E7: mov [ebp-0Ch], 00000000h
  '0048D6EE: mov [ebp-04h], 00000001h
  '0048D6F5: mov [ebp-04h], 00000002h
  '0048D6FC: push FFFFFFFFh
  '0048D6FE: call [004010E8h]
  '0048D704: mov [ebp-04h], 00000003h
  '0048D70B: push 00000000h
  '0048D70D: push 00000008h
  '0048D70F: mov eax, [ebp+08h]
  '0048D712: mov ecx, [eax]
  '0048D714: mov edx, [ebp+08h]
  '0048D717: push edx
  '0048D718: call [ecx+00000338h]
  '0048D71E: push eax
  '0048D71F: lea eax, [ebp-64h]
  '0048D722: push eax
  '0048D723: call [004010E4h]
  '0048D729: push eax
  '0048D72A: lea ecx, [ebp-7Ch]
  '0048D72D: push ecx
  '0048D72E: call [004011E4h]
  '0048D734: add esp, 00000010h
  '0048D737: push eax
  '0048D738: call [00401284h]
  '0048D73E: movsx edx, ax
  '0048D741: xor eax, eax
  '0048D743: cmp edx, 00000007h
  '0048D746: setnz al
  '0048D749: neg eax
  '0048D74B: mov [ebp-000000B4h], ax
  '0048D752: lea ecx, [ebp-64h]
  '0048D755: call [004013B8h]
  '0048D75B: lea ecx, [ebp-7Ch]
  '0048D75E: call [00401030h]
  '0048D764: movsx ecx, word ptr [ebp-000000B4h]
  '0048D76B: test ecx, ecx
  '0048D76D: jz 48D7A5h
  '0048D76F: mov [ebp-04h], 00000004h
  '0048D776: mov edx, 0041E7CCh
  '0048D77B: lea ecx, [ebp-2Ch]
  '0048D77E: call [004012D8h]
  '0048D784: lea edx, [ebp-2Ch]
  '0048D787: push edx
  '0048D788: mov eax, [ebp+08h]
  '0048D78B: mov ecx, [eax]
  '0048D78D: mov edx, [ebp+08h]
  '0048D790: push edx
  '0048D791: call [ecx+00000740h]
  '0048D797: lea ecx, [ebp-2Ch]
  '0048D79A: call [004013B4h]
  '0048D7A0: jmp 0048E66Eh
  '0048D7A5: mov [ebp-04h], 00000007h
  '0048D7AC: mov eax, [ebp+08h]
  '0048D7AF: mov ecx, [eax]
  '0048D7B1: mov edx, [ebp+08h]
  '0048D7B4: push edx
  '0048D7B5: call [ecx+00000310h]
  '0048D7BB: push eax
  '0048D7BC: lea eax, [ebp-68h]
  '0048D7BF: push eax
  '0048D7C0: call [004010E4h]
  '0048D7C6: mov [ebp-000000B4h], eax
  '0048D7CC: lea ecx, [ebp-000000A8h]
  '0048D7D2: push ecx
  '0048D7D3: mov edx, [ebp-000000B4h]
  '0048D7D9: mov eax, [edx]
  '0048D7DB: mov ecx, [ebp-000000B4h]
  '0048D7E1: push ecx
  '0048D7E2: call [eax+00000080h]
  '0048D7E8: fclex 
  '0048D7EA: mov [ebp-000000B8h], eax
  '0048D7F0: cmp [ebp-000000B8h], 00000000h
  '0048D7F7: jnl 48D81Fh
  '0048D7F9: push 00000080h
  '0048D7FE: push 0041C058h
  '0048D803: mov edx, [ebp-000000B4h]
  '0048D809: push edx
  '0048D80A: mov eax, [ebp-000000B8h]
  '0048D810: push eax
  '0048D811: call [004010A0h]
  '0048D817: mov [ebp-000000ECh], eax
  '0048D81D: jmp 48D829h
  '0048D81F: mov [ebp-000000ECh], 00000000h
  '0048D829: mov ecx, [ebp+08h]
  '0048D82C: mov edx, [ecx]
  '0048D82E: mov eax, [ebp+08h]
  '0048D831: push eax
  '0048D832: call [edx+0000030Ch]
  '0048D838: push eax
  '0048D839: lea ecx, [ebp-64h]
  '0048D83C: push ecx
  '0048D83D: call [004010E4h]
  '0048D843: mov [ebp-000000BCh], eax
  '0048D849: lea edx, [ebp-2Ch]
  '0048D84C: push edx
  '0048D84D: mov eax, [ebp-000000BCh]
  '0048D853: mov ecx, [eax]
  '0048D855: mov edx, [ebp-000000BCh]
  '0048D85B: push edx
  '0048D85C: call [ecx+000000A8h]
  '0048D862: fclex 
  '0048D864: mov [ebp-000000C0h], eax
  '0048D86A: cmp [ebp-000000C0h], 00000000h
  '0048D871: jnl 48D899h
  '0048D873: push 000000A8h
  '0048D878: push 0041C0C4h
  '0048D87D: mov eax, [ebp-000000BCh]
  '0048D883: push eax
  '0048D884: mov ecx, [ebp-000000C0h]
  '0048D88A: push ecx
  '0048D88B: call [004010A0h]
  '0048D891: mov [ebp-000000F0h], eax
  '0048D897: jmp 48D8A3h
  '0048D899: mov [ebp-000000F0h], 00000000h
  '0048D8A3: lea edx, [ebp-000000A4h]
  '0048D8A9: push edx
  '0048D8AA: mov eax, [ebp+08h]
  '0048D8AD: mov ecx, [eax]
  '0048D8AF: mov edx, [ebp+08h]
  '0048D8B2: push edx
  '0048D8B3: call [ecx+00000080h]
  '0048D8B9: fclex 
  '0048D8BB: mov [ebp-000000C4h], eax
  '0048D8C1: cmp [ebp-000000C4h], 00000000h
  '0048D8C8: jnl 48D8EDh
  '0048D8CA: push 00000080h
  '0048D8CF: push 0041BC88h
  '0048D8D4: mov eax, [ebp+08h]
  '0048D8D7: push eax
  '0048D8D8: mov ecx, [ebp-000000C4h]
  '0048D8DE: push ecx
  '0048D8DF: call [004010A0h]
  '0048D8E5: mov [ebp-000000F4h], eax
  '0048D8EB: jmp 48D8F7h
  '0048D8ED: mov [ebp-000000F4h], 00000000h
  '0048D8F7: fld real4 ptr [ebp-000000A4h]
  '0048D8FD: fsub real4 ptr [ebp-000000A8h]
  '0048D903: fstsw ax
  '0048D905: test al, 0Dh
  '0048D907: jnz 0048E6FDh
  '0048D90D: call [00401108h]
  '0048D913: fcomp real4 ptr [00401430h]
  '0048D919: fstsw ax
  '0048D91B: test ah, 41h
  '0048D91E: jnz 48D92Ch
  '0048D920: mov [ebp-000000F8h], 00000001h
  '0048D92A: jmp 48D936h
  '0048D92C: mov [ebp-000000F8h], 00000000h
  '0048D936: mov edx, [ebp-2Ch]
  '0048D939: push edx
  '0048D93A: push 0041E464h
  '0048D93F: call [00401184h]
  '0048D945: neg eax
  '0048D947: sbb eax, eax
  '0048D949: neg eax
  '0048D94B: neg eax
  '0048D94D: mov ecx, [ebp-000000F8h]
  '0048D953: neg ecx
  '0048D955: and ax, cx
  '0048D958: mov [ebp-000000C8h], ax
  '0048D95F: lea ecx, [ebp-2Ch]
  '0048D962: call [004013B4h]
  '0048D968: lea edx, [ebp-68h]
  '0048D96B: push edx
  '0048D96C: lea eax, [ebp-64h]
  '0048D96F: push eax
  '0048D970: push 00000002h
  '0048D972: call [00401064h]
  '0048D978: add esp, 0000000Ch
  '0048D97B: movsx ecx, word ptr [ebp-000000C8h]
  '0048D982: test ecx, ecx
  '0048D984: jz 0048DB1Bh
  '0048D98A: mov [ebp-04h], 00000008h
  '0048D991: lea edx, [ebp-000000A4h]
  '0048D997: push edx
  '0048D998: mov eax, [ebp+08h]
  '0048D99B: mov ecx, [eax]
  '0048D99D: mov edx, [ebp+08h]
  '0048D9A0: push edx
  '0048D9A1: call [ecx+00000080h]
  '0048D9A7: fclex 
  '0048D9A9: mov [ebp-000000B4h], eax
  '0048D9AF: cmp [ebp-000000B4h], 00000000h
  '0048D9B6: jnl 48D9DBh
  '0048D9B8: push 00000080h
  '0048D9BD: push 0041BC88h
  '0048D9C2: mov eax, [ebp+08h]
  '0048D9C5: push eax
  '0048D9C6: mov ecx, [ebp-000000B4h]
  '0048D9CC: push ecx
  '0048D9CD: call [004010A0h]
  '0048D9D3: mov [ebp-000000FCh], eax
  '0048D9D9: jmp 48D9E5h
  '0048D9DB: mov [ebp-000000FCh], 00000000h
  '0048D9E5: fld real4 ptr [ebp-000000A4h]
  '0048D9EB: fadd real4 ptr [0040142Ch]
  '0048D9F1: fstsw ax
  '0048D9F3: test al, 0Dh
  '0048D9F5: jnz 0048E6FDh
  '0048D9FB: push ecx
  '0048D9FC: fstp real4 ptr [esp]
  '0048D9FF: mov edx, [ebp+08h]
  '0048DA02: mov eax, [edx]
  '0048DA04: mov ecx, [ebp+08h]
  '0048DA07: push ecx
  '0048DA08: call [eax+00000084h]
  '0048DA0E: fclex 
  '0048DA10: mov [ebp-000000B8h], eax
  '0048DA16: cmp [ebp-000000B8h], 00000000h
  '0048DA1D: jnl 48DA42h
  '0048DA1F: push 00000084h
  '0048DA24: push 0041BC88h
  '0048DA29: mov edx, [ebp+08h]
  '0048DA2C: push edx
  '0048DA2D: mov eax, [ebp-000000B8h]
  '0048DA33: push eax
  '0048DA34: call [004010A0h]
  '0048DA3A: mov [ebp-00000100h], eax
  '0048DA40: jmp 48DA4Ch
  '0048DA42: mov [ebp-00000100h], 00000000h
  '0048DA4C: mov [ebp-04h], 00000009h
  '0048DA53: lea ecx, [ebp-000000A4h]
  '0048DA59: push ecx
  '0048DA5A: mov edx, [ebp+08h]
  '0048DA5D: mov eax, [edx]
  '0048DA5F: mov ecx, [ebp+08h]
  '0048DA62: push ecx
  '0048DA63: call [eax+00000080h]
  '0048DA69: fclex 
  '0048DA6B: mov [ebp-000000B4h], eax
  '0048DA71: cmp [ebp-000000B4h], 00000000h
  '0048DA78: jnl 48DA9Dh
  '0048DA7A: push 00000080h
  '0048DA7F: push 0041BC88h
  '0048DA84: mov edx, [ebp+08h]
  '0048DA87: push edx
  '0048DA88: mov eax, [ebp-000000B4h]
  '0048DA8E: push eax
  '0048DA8F: call [004010A0h]
  '0048DA95: mov [ebp-00000104h], eax
  '0048DA9B: jmp 48DAA7h
  '0048DA9D: mov [ebp-00000104h], 00000000h
  '0048DAA7: fld real4 ptr [ebp-000000A4h]
  '0048DAAD: fsub real4 ptr [0040142Ch]
  '0048DAB3: fstsw ax
  '0048DAB5: test al, 0Dh
  '0048DAB7: jnz 0048E6FDh
  '0048DABD: push ecx
  '0048DABE: fstp real4 ptr [esp]
  '0048DAC1: mov ecx, [ebp+08h]
  '0048DAC4: mov edx, [ecx]
  '0048DAC6: mov eax, [ebp+08h]
  '0048DAC9: push eax
  '0048DACA: call [edx+00000084h]
  '0048DAD0: fclex 
  '0048DAD2: mov [ebp-000000B8h], eax
  '0048DAD8: cmp [ebp-000000B8h], 00000000h
  '0048DADF: jnl 48DB04h
  '0048DAE1: push 00000084h
  '0048DAE6: push 0041BC88h
  '0048DAEB: mov ecx, [ebp+08h]
  '0048DAEE: push ecx
  '0048DAEF: mov edx, [ebp-000000B8h]
  '0048DAF5: push edx
  '0048DAF6: call [004010A0h]
  '0048DAFC: mov [ebp-00000108h], eax
  '0048DB02: jmp 48DB0Eh
  '0048DB04: mov [ebp-00000108h], 00000000h
  '0048DB0E: mov [ebp-04h], 0000000Ah
  '0048DB15: call [00401104h]
  '0048DB1B: mov [ebp-04h], 0000000Ch
  '0048DB22: lea eax, [ebp-2Ch]
  '0048DB25: push eax
  '0048DB26: mov ecx, [ebp+08h]
  '0048DB29: mov edx, [ecx]
  '0048DB2B: mov eax, [ebp+08h]
  '0048DB2E: push eax
  '0048DB2F: call [edx+000001C0h]
  '0048DB35: fclex 
  '0048DB37: mov [ebp-000000B4h], eax
  '0048DB3D: cmp [ebp-000000B4h], 00000000h
  '0048DB44: jnl 48DB69h
  '0048DB46: push 000001C0h
  '0048DB4B: push 0041BC88h
  '0048DB50: mov ecx, [ebp+08h]
  '0048DB53: push ecx
  '0048DB54: mov edx, [ebp-000000B4h]
  '0048DB5A: push edx
  '0048DB5B: call [004010A0h]
  '0048DB61: mov [ebp-0000010Ch], eax
  '0048DB67: jmp 48DB73h
  '0048DB69: mov [ebp-0000010Ch], 00000000h
  '0048DB73: mov [ebp-74h], 80020004h
  '0048DB7A: mov [ebp-7Ch], 0000000Ah
  '0048DB81: lea eax, [ebp-7Ch]
  '0048DB84: push eax
  '0048DB85: push 00000004h
  '0048DB87: mov ecx, [ebp-2Ch]
  '0048DB8A: push ecx
  '0048DB8B: call [00401148h]
  '0048DB91: mov edx, eax
  '0048DB93: lea ecx, [ebp-30h]
  '0048DB96: call [00401378h]
  '0048DB9C: push eax
  '0048DB9D: call [004013BCh]
  '0048DBA3: fstp real8 ptr [ebp-000000B0h]
  '0048DBA9: cmp [00541024h], 00000000h
  '0048DBB0: jnz 48DBCEh
  '0048DBB2: push 00541024h
  '0048DBB7: push 00413334h
  '0048DBBC: call [004012B8h]
  '0048DBC2: mov [ebp-00000110h], 00541024h
  '0048DBCC: jmp 48DBD8h
  '0048DBCE: mov [ebp-00000110h], 00541024h
  '0048DBD8: mov edx, [ebp-00000110h]
  '0048DBDE: mov eax, [edx]
  '0048DBE0: mov ecx, [ebp-00000110h]
  '0048DBE6: mov edx, [ecx]
  '0048DBE8: mov ecx, [edx]
  '0048DBEA: push eax
  '0048DBEB: call [ecx+00000688h]
  '0048DBF1: push eax
  '0048DBF2: lea edx, [ebp-64h]
  '0048DBF5: push edx
  '0048DBF6: call [004010E4h]
  '0048DBFC: mov [ebp-000000B8h], eax
  '0048DC02: lea eax, [ebp-68h]
  '0048DC05: push eax
  '0048DC06: fld real8 ptr [ebp-000000B0h]
  '0048DC0C: call [00401348h]
  '0048DC12: push eax
  '0048DC13: mov ecx, [ebp-000000B8h]
  '0048DC19: mov edx, [ecx]
  '0048DC1B: mov eax, [ebp-000000B8h]
  '0048DC21: push eax
  '0048DC22: call [edx+40h]
  '0048DC25: fclex 
  '0048DC27: mov [ebp-000000BCh], eax
  '0048DC2D: cmp [ebp-000000BCh], 00000000h
  '0048DC34: jnl 48DC59h
  '0048DC36: push 00000040h
  '0048DC38: push 0041E60Ch
  '0048DC3D: mov ecx, [ebp-000000B8h]
  '0048DC43: push ecx
  '0048DC44: mov edx, [ebp-000000BCh]
  '0048DC4A: push edx
  '0048DC4B: call [004010A0h]
  '0048DC51: mov [ebp-00000114h], eax
  '0048DC57: jmp 48DC63h
  '0048DC59: mov [ebp-00000114h], 00000000h
  '0048DC63: push 00000000h
  '0048DC65: push 00000008h
  '0048DC67: mov eax, [ebp-68h]
  '0048DC6A: push eax
  '0048DC6B: lea ecx, [ebp-0000008Ch]
  '0048DC71: push ecx
  '0048DC72: call [004011E4h]
  '0048DC78: add esp, 00000010h
  '0048DC7B: push eax
  '0048DC7C: call [00401284h]
  '0048DC82: movsx edx, ax
  '0048DC85: xor eax, eax
  '0048DC87: cmp edx, 00000007h
  '0048DC8A: setnz al
  '0048DC8D: neg eax
  '0048DC8F: mov [ebp-000000C0h], ax
  '0048DC96: lea ecx, [ebp-30h]
  '0048DC99: push ecx
  '0048DC9A: lea edx, [ebp-2Ch]
  '0048DC9D: push edx
  '0048DC9E: push 00000002h
  '0048DCA0: call [004012E8h]
  '0048DCA6: add esp, 0000000Ch
  '0048DCA9: lea eax, [ebp-68h]
  '0048DCAC: push eax
  '0048DCAD: lea ecx, [ebp-64h]
  '0048DCB0: push ecx
  '0048DCB1: push 00000002h
  '0048DCB3: call [00401064h]
  '0048DCB9: add esp, 0000000Ch
  '0048DCBC: lea edx, [ebp-0000008Ch]
  '0048DCC2: push edx
  '0048DCC3: lea eax, [ebp-7Ch]
  '0048DCC6: push eax
  '0048DCC7: push 00000002h
  '0048DCC9: call [00401050h]
  '0048DCCF: add esp, 0000000Ch
  '0048DCD2: movsx ecx, word ptr [ebp-000000C0h]
  '0048DCD9: test ecx, ecx
  '0048DCDB: jz 48DD13h
  '0048DCDD: mov [ebp-04h], 0000000Dh
  '0048DCE4: mov edx, 0041E9A8h
  '0048DCE9: lea ecx, [ebp-2Ch]
  '0048DCEC: call [004012D8h]
  '0048DCF2: lea edx, [ebp-2Ch]
  '0048DCF5: push edx
  '0048DCF6: mov eax, [ebp+08h]
  '0048DCF9: mov ecx, [eax]
  '0048DCFB: mov edx, [ebp+08h]
  '0048DCFE: push edx
  '0048DCFF: call [ecx+00000740h]
  '0048DD05: lea ecx, [ebp-2Ch]
  '0048DD08: call [004013B4h]
  '0048DD0E: jmp 0048E66Eh
  '0048DD13: mov [ebp-04h], 00000010h
  '0048DD1A: mov edx, 0041E9DCh
  '0048DD1F: lea ecx, [ebp-2Ch]
  '0048DD22: call [004012D8h]
  '0048DD28: lea eax, [ebp-2Ch]
  '0048DD2B: push eax
  '0048DD2C: mov ecx, [ebp+08h]
  '0048DD2F: mov edx, [ecx]
  '0048DD31: mov eax, [ebp+08h]
  '0048DD34: push eax
  '0048DD35: call [edx+00000740h]
  '0048DD3B: lea ecx, [ebp-2Ch]
  '0048DD3E: call [004013B4h]
  '0048DD44: mov [ebp-04h], 00000011h
  '0048DD4B: mov ecx, [ebp+08h]
  '0048DD4E: mov edx, [ecx]
  '0048DD50: mov eax, [ebp+08h]
  '0048DD53: push eax
  '0048DD54: call [edx+0000030Ch]
  '0048DD5A: push eax
  '0048DD5B: lea ecx, [ebp-64h]
  '0048DD5E: push ecx
  '0048DD5F: call [004010E4h]
  '0048DD65: mov [ebp-000000B4h], eax
  '0048DD6B: lea edx, [ebp-2Ch]
  '0048DD6E: push edx
  '0048DD6F: mov eax, [ebp-000000B4h]
  '0048DD75: mov ecx, [eax]
  '0048DD77: mov edx, [ebp-000000B4h]
  '0048DD7D: push edx
  '0048DD7E: call [ecx+000000A8h]
  '0048DD84: fclex 
  '0048DD86: mov [ebp-000000B8h], eax
  '0048DD8C: cmp [ebp-000000B8h], 00000000h
  '0048DD93: jnl 48DDBBh
  '0048DD95: push 000000A8h
  '0048DD9A: push 0041C0C4h
  '0048DD9F: mov eax, [ebp-000000B4h]
  '0048DDA5: push eax
  '0048DDA6: mov ecx, [ebp-000000B8h]
  '0048DDAC: push ecx
  '0048DDAD: call [004010A0h]
  '0048DDB3: mov [ebp-00000118h], eax
  '0048DDB9: jmp 48DDC5h
  '0048DDBB: mov [ebp-00000118h], 00000000h
  '0048DDC5: mov edx, [ebp-2Ch]
  '0048DDC8: push edx
  '0048DDC9: push 0041E910h
  '0048DDCE: call [00401184h]
  '0048DDD4: neg eax
  '0048DDD6: sbb eax, eax
  '0048DDD8: neg eax
  '0048DDDA: neg eax
  '0048DDDC: mov [ebp-000000BCh], ax
  '0048DDE3: lea ecx, [ebp-2Ch]
  '0048DDE6: call [004013B4h]
  '0048DDEC: lea ecx, [ebp-64h]
  '0048DDEF: call [004013B8h]
  '0048DDF5: movsx eax, word ptr [ebp-000000BCh]
  '0048DDFC: test eax, eax
  '0048DDFE: jz 0048E46Eh
  '0048DE04: mov [ebp-04h], 00000012h
  '0048DE0B: mov ecx, [ebp+08h]
  '0048DE0E: mov edx, [ecx]
  '0048DE10: mov eax, [ebp+08h]
  '0048DE13: push eax
  '0048DE14: call [edx+0000030Ch]
  '0048DE1A: push eax
  '0048DE1B: lea ecx, [ebp-64h]
  '0048DE1E: push ecx
  '0048DE1F: call [004010E4h]
  '0048DE25: mov [ebp-000000B4h], eax
  '0048DE2B: lea edx, [ebp-2Ch]
  '0048DE2E: push edx
  '0048DE2F: mov eax, [ebp-000000B4h]
  '0048DE35: mov ecx, [eax]
  '0048DE37: mov edx, [ebp-000000B4h]
  '0048DE3D: push edx
  '0048DE3E: call [ecx+000000A8h]
  '0048DE44: fclex 
  '0048DE46: mov [ebp-000000B8h], eax
  '0048DE4C: cmp [ebp-000000B8h], 00000000h
  '0048DE53: jnl 48DE7Bh
  '0048DE55: push 000000A8h
  '0048DE5A: push 0041C0C4h
  '0048DE5F: mov eax, [ebp-000000B4h]
  '0048DE65: push eax
  '0048DE66: mov ecx, [ebp-000000B8h]
  '0048DE6C: push ecx
  '0048DE6D: call [004010A0h]
  '0048DE73: mov [ebp-0000011Ch], eax
  '0048DE79: jmp 48DE85h
  '0048DE7B: mov [ebp-0000011Ch], 00000000h
  '0048DE85: mov edx, [ebp-2Ch]
  '0048DE88: push edx
  '0048DE89: push 0041DD3Ch
  '0048DE8E: call [00401184h]
  '0048DE94: neg eax
  '0048DE96: sbb eax, eax
  '0048DE98: inc eax
  '0048DE99: neg eax
  '0048DE9B: mov [ebp-000000BCh], ax
  '0048DEA2: lea ecx, [ebp-2Ch]
  '0048DEA5: call [004013B4h]
  '0048DEAB: lea ecx, [ebp-64h]
  '0048DEAE: call [004013B8h]
  '0048DEB4: movsx eax, word ptr [ebp-000000BCh]
  '0048DEBB: test eax, eax
  '0048DEBD: jz 48DECDh
  '0048DEBF: mov [ebp-04h], 00000013h
  '0048DEC6: mov [ebp-28h], 00000001h
  '0048DECD: mov [ebp-04h], 00000015h
  '0048DED4: mov ecx, [ebp+08h]
  '0048DED7: mov edx, [ecx]
  '0048DED9: mov eax, [ebp+08h]
  '0048DEDC: push eax
  '0048DEDD: call [edx+0000030Ch]
  '0048DEE3: push eax
  '0048DEE4: lea ecx, [ebp-64h]
  '0048DEE7: push ecx
  '0048DEE8: call [004010E4h]
  '0048DEEE: mov [ebp-000000B4h], eax
  '0048DEF4: lea edx, [ebp-2Ch]
  '0048DEF7: push edx
  '0048DEF8: mov eax, [ebp-000000B4h]
  '0048DEFE: mov ecx, [eax]
  '0048DF00: mov edx, [ebp-000000B4h]
  '0048DF06: push edx
  '0048DF07: call [ecx+000000A8h]
  '0048DF0D: fclex 
  '0048DF0F: mov [ebp-000000B8h], eax
  '0048DF15: cmp [ebp-000000B8h], 00000000h
  '0048DF1C: jnl 48DF44h
  '0048DF1E: push 000000A8h
  '0048DF23: push 0041C0C4h
  '0048DF28: mov eax, [ebp-000000B4h]
  '0048DF2E: push eax
  '0048DF2F: mov ecx, [ebp-000000B8h]
  '0048DF35: push ecx
  '0048DF36: call [004010A0h]
  '0048DF3C: mov [ebp-00000120h], eax
  '0048DF42: jmp 48DF4Eh
  '0048DF44: mov [ebp-00000120h], 00000000h
  '0048DF4E: mov edx, [ebp-2Ch]
  '0048DF51: push edx
  '0048DF52: push 0041E464h
  '0048DF57: call [00401184h]
  '0048DF5D: neg eax
  '0048DF5F: sbb eax, eax
  '0048DF61: inc eax
  '0048DF62: neg eax
  '0048DF64: mov [ebp-000000BCh], ax
  '0048DF6B: lea ecx, [ebp-2Ch]
  '0048DF6E: call [004013B4h]
  '0048DF74: lea ecx, [ebp-64h]
  '0048DF77: call [004013B8h]
  '0048DF7D: movsx eax, word ptr [ebp-000000BCh]
  '0048DF84: test eax, eax
  '0048DF86: jz 48DF96h
  '0048DF88: mov [ebp-04h], 00000016h
  '0048DF8F: mov [ebp-28h], 00000004h
  '0048DF96: mov [ebp-04h], 00000018h
  '0048DF9D: mov ecx, [ebp+08h]
  '0048DFA0: mov edx, [ecx]
  '0048DFA2: mov eax, [ebp+08h]
  '0048DFA5: push eax
  '0048DFA6: call [edx+0000030Ch]
  '0048DFAC: push eax
  '0048DFAD: lea ecx, [ebp-64h]
  '0048DFB0: push ecx
  '0048DFB1: call [004010E4h]
  '0048DFB7: mov [ebp-000000B4h], eax
  '0048DFBD: lea edx, [ebp-2Ch]
  '0048DFC0: push edx
  '0048DFC1: mov eax, [ebp-000000B4h]
  '0048DFC7: mov ecx, [eax]
  '0048DFC9: mov edx, [ebp-000000B4h]
  '0048DFCF: push edx
  '0048DFD0: call [ecx+000000A8h]
  '0048DFD6: fclex 
  '0048DFD8: mov [ebp-000000B8h], eax
  '0048DFDE: cmp [ebp-000000B8h], 00000000h
  '0048DFE5: jnl 48E00Dh
  '0048DFE7: push 000000A8h
  '0048DFEC: push 0041C0C4h
  '0048DFF1: mov eax, [ebp-000000B4h]
  '0048DFF7: push eax
  '0048DFF8: mov ecx, [ebp-000000B8h]
  '0048DFFE: push ecx
  '0048DFFF: call [004010A0h]
  '0048E005: mov [ebp-00000124h], eax
  '0048E00B: jmp 48E017h
  '0048E00D: mov [ebp-00000124h], 00000000h
  '0048E017: mov edx, [ebp-2Ch]
  '0048E01A: push edx
  '0048E01B: push 0041EA0Ch
  '0048E020: call [00401184h]
  '0048E026: neg eax
  '0048E028: sbb eax, eax
  '0048E02A: inc eax
  '0048E02B: neg eax
  '0048E02D: mov [ebp-000000BCh], ax
  '0048E034: lea ecx, [ebp-2Ch]
  '0048E037: call [004013B4h]
  '0048E03D: lea ecx, [ebp-64h]
  '0048E040: call [004013B8h]
  '0048E046: movsx eax, word ptr [ebp-000000BCh]
  '0048E04D: test eax, eax
  '0048E04F: jz 48E05Fh
  '0048E051: mov [ebp-04h], 00000019h
  '0048E058: mov [ebp-28h], 00000003h
  '0048E05F: mov [ebp-04h], 0000001Bh
  '0048E066: lea ecx, [ebp-2Ch]
  '0048E069: push ecx
  '0048E06A: mov edx, [ebp+08h]
  '0048E06D: mov eax, [edx]
  '0048E06F: mov ecx, [ebp+08h]
  '0048E072: push ecx
  '0048E073: call [eax+000001C0h]
  '0048E079: fclex 
  '0048E07B: mov [ebp-000000B4h], eax
  '0048E081: cmp [ebp-000000B4h], 00000000h
  '0048E088: jnl 48E0ADh
  '0048E08A: push 000001C0h
  '0048E08F: push 0041BC88h
  '0048E094: mov edx, [ebp+08h]
  '0048E097: push edx
  '0048E098: mov eax, [ebp-000000B4h]
  '0048E09E: push eax
  '0048E09F: call [004010A0h]
  '0048E0A5: mov [ebp-00000128h], eax
  '0048E0AB: jmp 48E0B7h
  '0048E0AD: mov [ebp-00000128h], 00000000h
  '0048E0B7: mov [ebp-74h], 80020004h
  '0048E0BE: mov [ebp-7Ch], 0000000Ah
  '0048E0C5: lea ecx, [ebp-7Ch]
  '0048E0C8: push ecx
  '0048E0C9: push 00000004h
  '0048E0CB: mov edx, [ebp-2Ch]
  '0048E0CE: push edx
  '0048E0CF: call [00401148h]
  '0048E0D5: mov edx, eax
  '0048E0D7: lea ecx, [ebp-30h]
  '0048E0DA: call [00401378h]
  '0048E0E0: push eax
  '0048E0E1: call [004013BCh]
  '0048E0E7: fstp real8 ptr [ebp-000000B0h]
  '0048E0ED: cmp [00541024h], 00000000h
  '0048E0F4: jnz 48E112h
  '0048E0F6: push 00541024h
  '0048E0FB: push 00413334h
  '0048E100: call [004012B8h]
  '0048E106: mov [ebp-0000012Ch], 00541024h
  '0048E110: jmp 48E11Ch
  '0048E112: mov [ebp-0000012Ch], 00541024h
  '0048E11C: mov eax, [ebp-0000012Ch]
  '0048E122: mov ecx, [eax]
  '0048E124: mov [ebp-000000D0h], ecx
  '0048E12A: mov edx, [ebp+08h]
  '0048E12D: mov eax, [edx]
  '0048E12F: mov ecx, [ebp+08h]
  '0048E132: push ecx
  '0048E133: call [eax+00000308h]
  '0048E139: push eax
  '0048E13A: lea edx, [ebp-64h]
  '0048E13D: push edx
  '0048E13E: call [004010E4h]
  '0048E144: mov [ebp-000000B8h], eax
  '0048E14A: lea eax, [ebp-3Ch]
  '0048E14D: push eax
  '0048E14E: mov ecx, [ebp-000000B8h]
  '0048E154: mov edx, [ecx]
  '0048E156: mov eax, [ebp-000000B8h]
  '0048E15C: push eax
  '0048E15D: call [edx+000000A8h]
  '0048E163: fclex 
  '0048E165: mov [ebp-000000BCh], eax
  '0048E16B: cmp [ebp-000000BCh], 00000000h
  '0048E172: jnl 48E19Ah
  '0048E174: push 000000A8h
  '0048E179: push 0041C0C4h
  '0048E17E: mov ecx, [ebp-000000B8h]
  '0048E184: push ecx
  '0048E185: mov edx, [ebp-000000BCh]
  '0048E18B: push edx
  '0048E18C: call [004010A0h]
  '0048E192: mov [ebp-00000130h], eax
  '0048E198: jmp 48E1A4h
  '0048E19A: mov [ebp-00000130h], 00000000h
  '0048E1A4: mov eax, [ebp+08h]
  '0048E1A7: mov ecx, [eax]
  '0048E1A9: mov edx, [ebp+08h]
  '0048E1AC: push edx
  '0048E1AD: call [ecx+00000310h]
  '0048E1B3: push eax
  '0048E1B4: lea eax, [ebp-68h]
  '0048E1B7: push eax
  '0048E1B8: call [004010E4h]
  '0048E1BE: mov [ebp-000000C0h], eax
  '0048E1C4: lea ecx, [ebp-000000A4h]
  '0048E1CA: push ecx
  '0048E1CB: mov edx, [ebp-000000C0h]
  '0048E1D1: mov eax, [edx]
  '0048E1D3: mov ecx, [ebp-000000C0h]
  '0048E1D9: push ecx
  '0048E1DA: call [eax+00000088h]
  '0048E1E0: fclex 
  '0048E1E2: mov [ebp-000000C4h], eax
  '0048E1E8: cmp [ebp-000000C4h], 00000000h
  '0048E1EF: jnl 48E217h
  '0048E1F1: push 00000088h
  '0048E1F6: push 0041C058h
  '0048E1FB: mov edx, [ebp-000000C0h]
  '0048E201: push edx
  '0048E202: mov eax, [ebp-000000C4h]
  '0048E208: push eax
  '0048E209: call [004010A0h]
  '0048E20F: mov [ebp-00000134h], eax
  '0048E215: jmp 48E221h
  '0048E217: mov [ebp-00000134h], 00000000h
  '0048E221: mov ecx, [ebp+08h]
  '0048E224: mov edx, [ecx]
  '0048E226: mov eax, [ebp+08h]
  '0048E229: push eax
  '0048E22A: call [edx+00000310h]
  '0048E230: push eax
  '0048E231: lea ecx, [ebp-6Ch]
  '0048E234: push ecx
  '0048E235: call [004010E4h]
  '0048E23B: mov [ebp-000000C8h], eax
  '0048E241: lea edx, [ebp-000000A8h]
  '0048E247: push edx
  '0048E248: mov eax, [ebp-000000C8h]
  '0048E24E: mov ecx, [eax]
  '0048E250: mov edx, [ebp-000000C8h]
  '0048E256: push edx
  '0048E257: call [ecx+00000080h]
  '0048E25D: fclex 
  '0048E25F: mov [ebp-000000CCh], eax
  '0048E265: cmp [ebp-000000CCh], 00000000h
  '0048E26C: jnl 48E294h
  '0048E26E: push 00000080h
  '0048E273: push 0041C058h
  '0048E278: mov eax, [ebp-000000C8h]
  '0048E27E: push eax
  '0048E27F: mov ecx, [ebp-000000CCh]
  '0048E285: push ecx
  '0048E286: call [004010A0h]
  '0048E28C: mov [ebp-00000138h], eax
  '0048E292: jmp 48E29Eh
  '0048E294: mov [ebp-00000138h], 00000000h
  '0048E29E: push 0041EA28h
  '0048E2A3: mov edx, [ebp-28h]
  '0048E2A6: push edx
  '0048E2A7: call [00401024h]
  '0048E2AD: mov edx, eax
  '0048E2AF: lea ecx, [ebp-34h]
  '0048E2B2: call [00401378h]
  '0048E2B8: push eax
  '0048E2B9: call [0040108Ch]
  '0048E2BF: mov edx, eax
  '0048E2C1: lea ecx, [ebp-38h]
  '0048E2C4: call [00401378h]
  '0048E2CA: push eax
  '0048E2CB: push 0041C0D8h
  '0048E2D0: call [0040108Ch]
  '0048E2D6: mov edx, eax
  '0048E2D8: lea ecx, [ebp-40h]
  '0048E2DB: call [00401378h]
  '0048E2E1: push eax
  '0048E2E2: mov eax, [ebp-3Ch]
  '0048E2E5: push eax
  '0048E2E6: call [0040108Ch]
  '0048E2EC: mov edx, eax
  '0048E2EE: lea ecx, [ebp-44h]
  '0048E2F1: call [00401378h]
  '0048E2F7: push eax
  '0048E2F8: push 0041C0D8h
  '0048E2FD: call [0040108Ch]
  '0048E303: mov edx, eax
  '0048E305: lea ecx, [ebp-48h]
  '0048E308: call [00401378h]
  '0048E30E: push eax
  '0048E30F: mov ecx, [ebp-000000A4h]
  '0048E315: push ecx
  '0048E316: call [004011D4h]
  '0048E31C: mov edx, eax
  '0048E31E: lea ecx, [ebp-4Ch]
  '0048E321: call [00401378h]
  '0048E327: push eax
  '0048E328: call [0040108Ch]
  '0048E32E: mov edx, eax
  '0048E330: lea ecx, [ebp-50h]
  '0048E333: call [00401378h]
  '0048E339: push eax
  '0048E33A: push 0041C0D8h
  '0048E33F: call [0040108Ch]
  '0048E345: mov edx, eax
  '0048E347: lea ecx, [ebp-54h]
  '0048E34A: call [00401378h]
  '0048E350: push eax
  '0048E351: mov edx, [ebp-000000A8h]
  '0048E357: push edx
  '0048E358: call [004011D4h]
  '0048E35E: mov edx, eax
  '0048E360: lea ecx, [ebp-58h]
  '0048E363: call [00401378h]
  '0048E369: push eax
  '0048E36A: call [0040108Ch]
  '0048E370: mov edx, eax
  '0048E372: lea ecx, [ebp-5Ch]
  '0048E375: call [00401378h]
  '0048E37B: push eax
  '0048E37C: push 0041DA4Ch
  '0048E381: call [0040108Ch]
  '0048E387: mov edx, eax
  '0048E389: lea ecx, [ebp-60h]
  '0048E38C: call [00401378h]
  '0048E392: fld real8 ptr [ebp-000000B0h]
  '0048E398: call [00401348h]
  '0048E39E: mov [ebp-000000A0h], ax
  '0048E3A5: lea eax, [ebp-60h]
  '0048E3A8: push eax
  '0048E3A9: lea ecx, [ebp-000000A0h]
  '0048E3AF: push ecx
  '0048E3B0: mov edx, [ebp-000000D0h]
  '0048E3B6: mov eax, [edx]
  '0048E3B8: mov ecx, [ebp-000000D0h]
  '0048E3BE: push ecx
  '0048E3BF: call [eax+00000714h]
  '0048E3C5: fclex 
  '0048E3C7: mov [ebp-000000D4h], eax
  '0048E3CD: cmp [ebp-000000D4h], 00000000h
  '0048E3D4: jnl 48E3FCh
  '0048E3D6: push 00000714h
  '0048E3DB: push 0041C118h
  '0048E3E0: mov edx, [ebp-000000D0h]
  '0048E3E6: push edx
  '0048E3E7: mov eax, [ebp-000000D4h]
  '0048E3ED: push eax
  '0048E3EE: call [004010A0h]
  '0048E3F4: mov [ebp-0000013Ch], eax
  '0048E3FA: jmp 48E406h
  '0048E3FC: mov [ebp-0000013Ch], 00000000h
  '0048E406: lea ecx, [ebp-60h]
  '0048E409: push ecx
  '0048E40A: lea edx, [ebp-5Ch]
  '0048E40D: push edx
  '0048E40E: lea eax, [ebp-58h]
  '0048E411: push eax
  '0048E412: lea ecx, [ebp-54h]
  '0048E415: push ecx
  '0048E416: lea edx, [ebp-50h]
  '0048E419: push edx
  '0048E41A: lea eax, [ebp-4Ch]
  '0048E41D: push eax
  '0048E41E: lea ecx, [ebp-48h]
  '0048E421: push ecx
  '0048E422: lea edx, [ebp-44h]
  '0048E425: push edx
  '0048E426: lea eax, [ebp-3Ch]
  '0048E429: push eax
  '0048E42A: lea ecx, [ebp-40h]
  '0048E42D: push ecx
  '0048E42E: lea edx, [ebp-38h]
  '0048E431: push edx
  '0048E432: lea eax, [ebp-34h]
  '0048E435: push eax
  '0048E436: lea ecx, [ebp-30h]
  '0048E439: push ecx
  '0048E43A: lea edx, [ebp-2Ch]
  '0048E43D: push edx
  '0048E43E: push 0000000Eh
  '0048E440: call [004012E8h]
  '0048E446: add esp, 0000003Ch
  '0048E449: lea eax, [ebp-6Ch]
  '0048E44C: push eax
  '0048E44D: lea ecx, [ebp-68h]
  '0048E450: push ecx
  '0048E451: lea edx, [ebp-64h]
  '0048E454: push edx
  '0048E455: push 00000003h
  '0048E457: call [00401064h]
  '0048E45D: add esp, 00000010h
  '0048E460: lea ecx, [ebp-7Ch]
  '0048E463: call [00401030h]
  '0048E469: jmp 0048E66Eh
  '0048E46E: mov [ebp-04h], 0000001Dh
  '0048E475: lea eax, [ebp-2Ch]
  '0048E478: push eax
  '0048E479: mov ecx, [ebp+08h]
  '0048E47C: mov edx, [ecx]
  '0048E47E: mov eax, [ebp+08h]
  '0048E481: push eax
  '0048E482: call [edx+000001C0h]
  '0048E488: fclex 
  '0048E48A: mov [ebp-000000B4h], eax
  '0048E490: cmp [ebp-000000B4h], 00000000h
  '0048E497: jnl 48E4BCh
  '0048E499: push 000001C0h
  '0048E49E: push 0041BC88h
  '0048E4A3: mov ecx, [ebp+08h]
  '0048E4A6: push ecx
  '0048E4A7: mov edx, [ebp-000000B4h]
  '0048E4AD: push edx
  '0048E4AE: call [004010A0h]
  '0048E4B4: mov [ebp-00000140h], eax
  '0048E4BA: jmp 48E4C6h
  '0048E4BC: mov [ebp-00000140h], 00000000h
  '0048E4C6: mov [ebp-74h], 80020004h
  '0048E4CD: mov [ebp-7Ch], 0000000Ah
  '0048E4D4: lea eax, [ebp-7Ch]
  '0048E4D7: push eax
  '0048E4D8: push 00000004h
  '0048E4DA: mov ecx, [ebp-2Ch]
  '0048E4DD: push ecx
  '0048E4DE: call [00401148h]
  '0048E4E4: mov edx, eax
  '0048E4E6: lea ecx, [ebp-30h]
  '0048E4E9: call [00401378h]
  '0048E4EF: push eax
  '0048E4F0: call [004013BCh]
  '0048E4F6: fstp real8 ptr [ebp-000000B0h]
  '0048E4FC: cmp [00541024h], 00000000h
  '0048E503: jnz 48E521h
  '0048E505: push 00541024h
  '0048E50A: push 00413334h
  '0048E50F: call [004012B8h]
  '0048E515: mov [ebp-00000144h], 00541024h
  '0048E51F: jmp 48E52Bh
  '0048E521: mov [ebp-00000144h], 00541024h
  '0048E52B: mov edx, [ebp-00000144h]
  '0048E531: mov eax, [edx]
  '0048E533: mov [ebp-000000C0h], eax
  '0048E539: mov ecx, [ebp+08h]
  '0048E53C: mov edx, [ecx]
  '0048E53E: mov eax, [ebp+08h]
  '0048E541: push eax
  '0048E542: call [edx+00000308h]
  '0048E548: push eax
  '0048E549: lea ecx, [ebp-64h]
  '0048E54C: push ecx
  '0048E54D: call [004010E4h]
  '0048E553: mov [ebp-000000B8h], eax
  '0048E559: lea edx, [ebp-34h]
  '0048E55C: push edx
  '0048E55D: mov eax, [ebp-000000B8h]
  '0048E563: mov ecx, [eax]
  '0048E565: mov edx, [ebp-000000B8h]
  '0048E56B: push edx
  '0048E56C: call [ecx+000000A8h]
  '0048E572: fclex 
  '0048E574: mov [ebp-000000BCh], eax
  '0048E57A: cmp [ebp-000000BCh], 00000000h
  '0048E581: jnl 48E5A9h
  '0048E583: push 000000A8h
  '0048E588: push 0041C0C4h
  '0048E58D: mov eax, [ebp-000000B8h]
  '0048E593: push eax
  '0048E594: mov ecx, [ebp-000000BCh]
  '0048E59A: push ecx
  '0048E59B: call [004010A0h]
  '0048E5A1: mov [ebp-00000148h], eax
  '0048E5A7: jmp 48E5B3h
  '0048E5A9: mov [ebp-00000148h], 00000000h
  '0048E5B3: push 0041EA40h
  '0048E5B8: mov edx, [ebp-34h]
  '0048E5BB: push edx
  '0048E5BC: call [0040108Ch]
  '0048E5C2: mov edx, eax
  '0048E5C4: lea ecx, [ebp-38h]
  '0048E5C7: call [00401378h]
  '0048E5CD: fld real8 ptr [ebp-000000B0h]
  '0048E5D3: call [00401348h]
  '0048E5D9: mov [ebp-000000A0h], ax
  '0048E5E0: lea eax, [ebp-38h]
  '0048E5E3: push eax
  '0048E5E4: lea ecx, [ebp-000000A0h]
  '0048E5EA: push ecx
  '0048E5EB: mov edx, [ebp-000000C0h]
  '0048E5F1: mov eax, [edx]
  '0048E5F3: mov ecx, [ebp-000000C0h]
  '0048E5F9: push ecx
  '0048E5FA: call [eax+00000714h]
  '0048E600: fclex 
  '0048E602: mov [ebp-000000C4h], eax
  '0048E608: cmp [ebp-000000C4h], 00000000h
  '0048E60F: jnl 48E637h
  '0048E611: push 00000714h
  '0048E616: push 0041C118h
  '0048E61B: mov edx, [ebp-000000C0h]
  '0048E621: push edx
  '0048E622: mov eax, [ebp-000000C4h]
  '0048E628: push eax
  '0048E629: call [004010A0h]
  '0048E62F: mov [ebp-0000014Ch], eax
  '0048E635: jmp 48E641h
  '0048E637: mov [ebp-0000014Ch], 00000000h
  '0048E641: lea ecx, [ebp-38h]
  '0048E644: push ecx
  '0048E645: lea edx, [ebp-34h]
  '0048E648: push edx
  '0048E649: lea eax, [ebp-30h]
  '0048E64C: push eax
  '0048E64D: lea ecx, [ebp-2Ch]
  '0048E650: push ecx
  '0048E651: push 00000004h
  '0048E653: call [004012E8h]
  '0048E659: add esp, 00000014h
  '0048E65C: lea ecx, [ebp-64h]
  '0048E65F: call [004013B8h]
  '0048E665: lea ecx, [ebp-7Ch]
  '0048E668: call [00401030h]
  '0048E66E: wait 
  '0048E66F: push 0048E6E8h
  '0048E674: jmp 48E6E7h
  '0048E676: lea edx, [ebp-60h]
  '0048E679: push edx
  '0048E67A: lea eax, [ebp-5Ch]
  '0048E67D: push eax
  '0048E67E: lea ecx, [ebp-58h]
  '0048E681: push ecx
  '0048E682: lea edx, [ebp-54h]
  '0048E685: push edx
  '0048E686: lea eax, [ebp-50h]
  '0048E689: push eax
  '0048E68A: lea ecx, [ebp-4Ch]
  '0048E68D: push ecx
  '0048E68E: lea edx, [ebp-48h]
  '0048E691: push edx
  '0048E692: lea eax, [ebp-44h]
  '0048E695: push eax
  '0048E696: lea ecx, [ebp-40h]
  '0048E699: push ecx
  '0048E69A: lea edx, [ebp-3Ch]
  '0048E69D: push edx
  '0048E69E: lea eax, [ebp-38h]
  '0048E6A1: push eax
  '0048E6A2: lea ecx, [ebp-34h]
  '0048E6A5: push ecx
  '0048E6A6: lea edx, [ebp-30h]
  '0048E6A9: push edx
  '0048E6AA: lea eax, [ebp-2Ch]
  '0048E6AD: push eax
  '0048E6AE: push 0000000Eh
  '0048E6B0: call [004012E8h]
  '0048E6B6: add esp, 0000003Ch
  '0048E6B9: lea ecx, [ebp-6Ch]
  '0048E6BC: push ecx
  '0048E6BD: lea edx, [ebp-68h]
  '0048E6C0: push edx
  '0048E6C1: lea eax, [ebp-64h]
  '0048E6C4: push eax
  '0048E6C5: push 00000003h
  '0048E6C7: call [00401064h]
  '0048E6CD: add esp, 00000010h
  '0048E6D0: lea ecx, [ebp-0000008Ch]
  '0048E6D6: push ecx
  '0048E6D7: lea edx, [ebp-7Ch]
  '0048E6DA: push edx
  '0048E6DB: push 00000002h
  '0048E6DD: call [00401050h]
  '0048E6E3: add esp, 0000000Ch
  '0048E6E6: ret 
End Sub
Private Sub unknown_48E710
  '0048E710: push ebp
  '0048E711: mov ebp, esp
  '0048E713: sub esp, 00000018h
  '0048E716: push 004081B6h
  '0048E71B: mov eax, fs:[00h]
  '0048E721: push eax
  '0048E722: mov fs:[00000000h], esp
  '0048E729: mov eax, 0000008Ch
  '0048E72E: call 004081B0h
  '0048E733: push ebx
  '0048E734: push esi
  '0048E735: push edi
  '0048E736: mov [ebp-18h], esp
  '0048E739: mov [ebp-14h], 00401AD8h
  '0048E740: mov [ebp-10h], 00000000h
  '0048E747: mov [ebp-0Ch], 00000000h
  '0048E74E: mov [ebp-04h], 00000001h
  '0048E755: mov [ebp-04h], 00000002h
  '0048E75C: push FFFFFFFFh
  '0048E75E: call [004010E8h]
  '0048E764: mov [ebp-04h], 00000003h
  '0048E76B: mov [ebp-58h], 80020004h
  '0048E772: mov [ebp-60h], 0000000Ah
  '0048E779: mov eax, 00000010h
  '0048E77E: call 004081B0h
  '0048E783: mov eax, esp
  '0048E785: mov ecx, [ebp-60h]
  '0048E788: mov [eax], ecx
  '0048E78A: mov edx, [ebp-5Ch]
  '0048E78D: mov [eax+04h], edx
  '0048E790: mov ecx, [ebp-58h]
  '0048E793: mov [eax+08h], ecx
  '0048E796: mov edx, [ebp-54h]
  '0048E799: mov [eax+0Ch], edx
  '0048E79C: push 0041EA80h
  '0048E7A1: push 0041EA6Ch
  '0048E7A6: push 0041EA58h
  '0048E7AB: call [00401314h]
  '0048E7B1: mov edx, eax
  '0048E7B3: lea ecx, [ebp-24h]
  '0048E7B6: call [00401378h]
  '0048E7BC: mov [ebp-04h], 00000004h
  '0048E7C3: mov eax, [ebp-24h]
  '0048E7C6: push eax
  '0048E7C7: call [00401044h]
  '0048E7CD: test eax, eax
  '0048E7CF: jle 48E82Ah
  '0048E7D1: mov [ebp-04h], 00000005h
  '0048E7D8: mov ecx, [ebp-24h]
  '0048E7DB: push ecx
  '0048E7DC: call [0040119Ch]
  '0048E7E2: push ecx
  '0048E7E3: fstp real4 ptr [esp]
  '0048E7E6: mov edx, [ebp+08h]
  '0048E7E9: mov eax, [edx]
  '0048E7EB: mov ecx, [ebp+08h]
  '0048E7EE: push ecx
  '0048E7EF: call [eax+00000084h]
  '0048E7F5: fclex 
  '0048E7F7: mov [ebp-64h], eax
  '0048E7FA: cmp [ebp-64h], 00000000h
  '0048E7FE: jnl 48E820h
  '0048E800: push 00000084h
  '0048E805: push 0041BC88h
  '0048E80A: mov edx, [ebp+08h]
  '0048E80D: push edx
  '0048E80E: mov eax, [ebp-64h]
  '0048E811: push eax
  '0048E812: call [004010A0h]
  '0048E818: mov [ebp-00000088h], eax
  '0048E81E: jmp 48E82Ah
  '0048E820: mov [ebp-00000088h], 00000000h
  '0048E82A: mov [ebp-04h], 00000007h
  '0048E831: mov [ebp-58h], 80020004h
  '0048E838: mov [ebp-60h], 0000000Ah
  '0048E83F: mov eax, 00000010h
  '0048E844: call 004081B0h
  '0048E849: mov ecx, esp
  '0048E84B: mov edx, [ebp-60h]
  '0048E84E: mov [ecx], edx
  '0048E850: mov eax, [ebp-5Ch]
  '0048E853: mov [ecx+04h], eax
  '0048E856: mov edx, [ebp-58h]
  '0048E859: mov [ecx+08h], edx
  '0048E85C: mov eax, [ebp-54h]
  '0048E85F: mov [ecx+0Ch], eax
  '0048E862: push 0041EA98h
  '0048E867: push 0041EA6Ch
  '0048E86C: push 0041EA58h
  '0048E871: call [00401314h]
  '0048E877: mov edx, eax
  '0048E879: lea ecx, [ebp-24h]
  '0048E87C: call [00401378h]
  '0048E882: mov [ebp-04h], 00000008h
  '0048E889: mov ecx, [ebp-24h]
  '0048E88C: push ecx
  '0048E88D: call [00401044h]
  '0048E893: test eax, eax
  '0048E895: jle 48E8F0h
  '0048E897: mov [ebp-04h], 00000009h
  '0048E89E: mov edx, [ebp-24h]
  '0048E8A1: push edx
  '0048E8A2: call [0040119Ch]
  '0048E8A8: push ecx
  '0048E8A9: fstp real4 ptr [esp]
  '0048E8AC: mov eax, [ebp+08h]
  '0048E8AF: mov ecx, [eax]
  '0048E8B1: mov edx, [ebp+08h]
  '0048E8B4: push edx
  '0048E8B5: call [ecx+0000008Ch]
  '0048E8BB: fclex 
  '0048E8BD: mov [ebp-64h], eax
  '0048E8C0: cmp [ebp-64h], 00000000h
  '0048E8C4: jnl 48E8E6h
  '0048E8C6: push 0000008Ch
  '0048E8CB: push 0041BC88h
  '0048E8D0: mov eax, [ebp+08h]
  '0048E8D3: push eax
  '0048E8D4: mov ecx, [ebp-64h]
  '0048E8D7: push ecx
  '0048E8D8: call [004010A0h]
  '0048E8DE: mov [ebp-0000008Ch], eax
  '0048E8E4: jmp 48E8F0h
  '0048E8E6: mov [ebp-0000008Ch], 00000000h
  '0048E8F0: mov [ebp-04h], 0000000Bh
  '0048E8F7: mov [ebp-58h], 80020004h
  '0048E8FE: mov [ebp-60h], 0000000Ah
  '0048E905: mov eax, 00000010h
  '0048E90A: call 004081B0h
  '0048E90F: mov edx, esp
  '0048E911: mov eax, [ebp-60h]
  '0048E914: mov [edx], eax
  '0048E916: mov ecx, [ebp-5Ch]
  '0048E919: mov [edx+04h], ecx
  '0048E91C: mov eax, [ebp-58h]
  '0048E91F: mov [edx+08h], eax
  '0048E922: mov ecx, [ebp-54h]
  '0048E925: mov [edx+0Ch], ecx
  '0048E928: push 0041EAB0h
  '0048E92D: push 0041EA6Ch
  '0048E932: push 0041EA58h
  '0048E937: call [00401314h]
  '0048E93D: mov edx, eax
  '0048E93F: lea ecx, [ebp-24h]
  '0048E942: call [00401378h]
  '0048E948: mov [ebp-04h], 0000000Ch
  '0048E94F: mov edx, [ebp-24h]
  '0048E952: push edx
  '0048E953: call [00401044h]
  '0048E959: test eax, eax
  '0048E95B: jle 48E9D2h
  '0048E95D: mov [ebp-04h], 0000000Dh
  '0048E964: mov eax, [ebp+08h]
  '0048E967: mov ecx, [eax]
  '0048E969: mov edx, [ebp+08h]
  '0048E96C: push edx
  '0048E96D: call [ecx+00000308h]
  '0048E973: push eax
  '0048E974: lea eax, [ebp-28h]
  '0048E977: push eax
  '0048E978: call [004010E4h]
  '0048E97E: mov [ebp-64h], eax
  '0048E981: mov ecx, [ebp-24h]
  '0048E984: push ecx
  '0048E985: mov edx, [ebp-64h]
  '0048E988: mov eax, [edx]
  '0048E98A: mov ecx, [ebp-64h]
  '0048E98D: push ecx
  '0048E98E: call [eax+000000ACh]
  '0048E994: fclex 
  '0048E996: mov [ebp-68h], eax
  '0048E999: cmp [ebp-68h], 00000000h
  '0048E99D: jnl 48E9BFh
  '0048E99F: push 000000ACh
  '0048E9A4: push 0041C0C4h
  '0048E9A9: mov edx, [ebp-64h]
  '0048E9AC: push edx
  '0048E9AD: mov eax, [ebp-68h]
  '0048E9B0: push eax
  '0048E9B1: call [004010A0h]
  '0048E9B7: mov [ebp-00000090h], eax
  '0048E9BD: jmp 48E9C9h
  '0048E9BF: mov [ebp-00000090h], 00000000h
  '0048E9C9: lea ecx, [ebp-28h]
  '0048E9CC: call [004013B8h]
  '0048E9D2: mov [ebp-04h], 0000000Fh
  '0048E9D9: mov [ebp-58h], 80020004h
  '0048E9E0: mov [ebp-60h], 0000000Ah
  '0048E9E7: mov eax, 00000010h
  '0048E9EC: call 004081B0h
  '0048E9F1: mov ecx, esp
  '0048E9F3: mov edx, [ebp-60h]
  '0048E9F6: mov [ecx], edx
  '0048E9F8: mov eax, [ebp-5Ch]
  '0048E9FB: mov [ecx+04h], eax
  '0048E9FE: mov edx, [ebp-58h]
  '0048EA01: mov [ecx+08h], edx
  '0048EA04: mov eax, [ebp-54h]
  '0048EA07: mov [ecx+0Ch], eax
  '0048EA0A: push 0041EACCh
  '0048EA0F: push 0041EA6Ch
  '0048EA14: push 0041EA58h
  '0048EA19: call [00401314h]
  '0048EA1F: mov edx, eax
  '0048EA21: lea ecx, [ebp-24h]
  '0048EA24: call [00401378h]
  '0048EA2A: mov [ebp-04h], 00000010h
  '0048EA31: mov ecx, [ebp-24h]
  '0048EA34: push ecx
  '0048EA35: call [00401044h]
  '0048EA3B: test eax, eax
  '0048EA3D: jle 48EAB4h
  '0048EA3F: mov [ebp-04h], 00000011h
  '0048EA46: mov edx, [ebp+08h]
  '0048EA49: mov eax, [edx]
  '0048EA4B: mov ecx, [ebp+08h]
  '0048EA4E: push ecx
  '0048EA4F: call [eax+00000304h]
  '0048EA55: push eax
  '0048EA56: lea edx, [ebp-28h]
  '0048EA59: push edx
  '0048EA5A: call [004010E4h]
  '0048EA60: mov [ebp-64h], eax
  '0048EA63: mov eax, [ebp-24h]
  '0048EA66: push eax
  '0048EA67: mov ecx, [ebp-64h]
  '0048EA6A: mov edx, [ecx]
  '0048EA6C: mov eax, [ebp-64h]
  '0048EA6F: push eax
  '0048EA70: call [edx+000000ACh]
  '0048EA76: fclex 
  '0048EA78: mov [ebp-68h], eax
  '0048EA7B: cmp [ebp-68h], 00000000h
  '0048EA7F: jnl 48EAA1h
  '0048EA81: push 000000ACh
  '0048EA86: push 0041C0C4h
  '0048EA8B: mov ecx, [ebp-64h]
  '0048EA8E: push ecx
  '0048EA8F: mov edx, [ebp-68h]
  '0048EA92: push edx
  '0048EA93: call [004010A0h]
  '0048EA99: mov [ebp-00000094h], eax
  '0048EA9F: jmp 48EAABh
  '0048EAA1: mov [ebp-00000094h], 00000000h
  '0048EAAB: lea ecx, [ebp-28h]
  '0048EAAE: call [004013B8h]
  '0048EAB4: mov [ebp-04h], 00000013h
  '0048EABB: mov [ebp-58h], 80020004h
  '0048EAC2: mov [ebp-60h], 0000000Ah
  '0048EAC9: mov eax, 00000010h
  '0048EACE: call 004081B0h
  '0048EAD3: mov eax, esp
  '0048EAD5: mov ecx, [ebp-60h]
  '0048EAD8: mov [eax], ecx
  '0048EADA: mov edx, [ebp-5Ch]
  '0048EADD: mov [eax+04h], edx
  '0048EAE0: mov ecx, [ebp-58h]
  '0048EAE3: mov [eax+08h], ecx
  '0048EAE6: mov edx, [ebp-54h]
  '0048EAE9: mov [eax+0Ch], edx
  '0048EAEC: push 0041EAE8h
  '0048EAF1: push 0041EA6Ch
  '0048EAF6: push 0041EA58h
  '0048EAFB: call [00401314h]
  '0048EB01: mov edx, eax
  '0048EB03: lea ecx, [ebp-24h]
  '0048EB06: call [00401378h]
  '0048EB0C: mov [ebp-04h], 00000014h
  '0048EB13: mov eax, [ebp-24h]
  '0048EB16: push eax
  '0048EB17: call [00401044h]
  '0048EB1D: test eax, eax
  '0048EB1F: jle 0048EC4Bh
  '0048EB25: mov [ebp-04h], 00000015h
  '0048EB2C: push 0041C038h
  '0048EB31: push 00000000h
  '0048EB33: push 00000003h
  '0048EB35: mov ecx, [ebp+08h]
  '0048EB38: mov edx, [ecx]
  '0048EB3A: mov eax, [ebp+08h]
  '0048EB3D: push eax
  '0048EB3E: call [edx+0000032Ch]
  '0048EB44: push eax
  '0048EB45: lea ecx, [ebp-28h]
  '0048EB48: push ecx
  '0048EB49: call [004010E4h]
  '0048EB4F: push eax
  '0048EB50: lea edx, [ebp-40h]
  '0048EB53: push edx
  '0048EB54: call [004011E4h]
  '0048EB5A: add esp, 00000010h
  '0048EB5D: push eax
  '0048EB5E: call [004011C8h]
  '0048EB64: push eax
  '0048EB65: lea eax, [ebp-2Ch]
  '0048EB68: push eax
  '0048EB69: call [004010E4h]
  '0048EB6F: mov [ebp-64h], eax
  '0048EB72: mov [ebp-48h], 00000004h
  '0048EB79: mov [ebp-50h], 00000002h
  '0048EB80: lea ecx, [ebp-30h]
  '0048EB83: push ecx
  '0048EB84: lea edx, [ebp-50h]
  '0048EB87: push edx
  '0048EB88: mov eax, [ebp-64h]
  '0048EB8B: mov ecx, [eax]
  '0048EB8D: mov edx, [ebp-64h]
  '0048EB90: push edx
  '0048EB91: call [ecx+24h]
  '0048EB94: fclex 
  '0048EB96: mov [ebp-68h], eax
  '0048EB99: cmp [ebp-68h], 00000000h
  '0048EB9D: jnl 48EBBCh
  '0048EB9F: push 00000024h
  '0048EBA1: push 0041C038h
  '0048EBA6: mov eax, [ebp-64h]
  '0048EBA9: push eax
  '0048EBAA: mov ecx, [ebp-68h]
  '0048EBAD: push ecx
  '0048EBAE: call [004010A0h]
  '0048EBB4: mov [ebp-00000098h], eax
  '0048EBBA: jmp 48EBC6h
  '0048EBBC: mov [ebp-00000098h], 00000000h
  '0048EBC6: mov edx, [ebp-30h]
  '0048EBC9: mov [ebp-6Ch], edx
  '0048EBCC: mov eax, [ebp-24h]
  '0048EBCF: push eax
  '0048EBD0: call [004013BCh]
  '0048EBD6: call [0040135Ch]
  '0048EBDC: push eax
  '0048EBDD: mov ecx, [ebp-6Ch]
  '0048EBE0: mov edx, [ecx]
  '0048EBE2: mov eax, [ebp-6Ch]
  '0048EBE5: push eax
  '0048EBE6: call [edx+00000080h]
  '0048EBEC: fclex 
  '0048EBEE: mov [ebp-70h], eax
  '0048EBF1: cmp [ebp-70h], 00000000h
  '0048EBF5: jnl 48EC17h
  '0048EBF7: push 00000080h
  '0048EBFC: push 0041C048h
  '0048EC01: mov ecx, [ebp-6Ch]
  '0048EC04: push ecx
  '0048EC05: mov edx, [ebp-70h]
  '0048EC08: push edx
  '0048EC09: call [004010A0h]
  '0048EC0F: mov [ebp-0000009Ch], eax
  '0048EC15: jmp 48EC21h
  '0048EC17: mov [ebp-0000009Ch], 00000000h
  '0048EC21: lea eax, [ebp-30h]
  '0048EC24: push eax
  '0048EC25: lea ecx, [ebp-2Ch]
  '0048EC28: push ecx
  '0048EC29: lea edx, [ebp-28h]
  '0048EC2C: push edx
  '0048EC2D: push 00000003h
  '0048EC2F: call [00401064h]
  '0048EC35: add esp, 00000010h
  '0048EC38: lea eax, [ebp-50h]
  '0048EC3B: push eax
  '0048EC3C: lea ecx, [ebp-40h]
  '0048EC3F: push ecx
  '0048EC40: push 00000002h
  '0048EC42: call [00401050h]
  '0048EC48: add esp, 0000000Ch
  '0048EC4B: mov [ebp-04h], 00000017h
  '0048EC52: mov [ebp-58h], 80020004h
  '0048EC59: mov [ebp-60h], 0000000Ah
  '0048EC60: mov eax, 00000010h
  '0048EC65: call 004081B0h
  '0048EC6A: mov edx, esp
  '0048EC6C: mov eax, [ebp-60h]
  '0048EC6F: mov [edx], eax
  '0048EC71: mov ecx, [ebp-5Ch]
  '0048EC74: mov [edx+04h], ecx
  '0048EC77: mov eax, [ebp-58h]
  '0048EC7A: mov [edx+08h], eax
  '0048EC7D: mov ecx, [ebp-54h]
  '0048EC80: mov [edx+0Ch], ecx
  '0048EC83: push 0041EB00h
  '0048EC88: push 0041EA6Ch
  '0048EC8D: push 0041EA58h
  '0048EC92: call [00401314h]
  '0048EC98: mov edx, eax
  '0048EC9A: lea ecx, [ebp-24h]
  '0048EC9D: call [00401378h]
  '0048ECA3: mov [ebp-04h], 00000018h
  '0048ECAA: mov edx, [ebp-24h]
  '0048ECAD: push edx
  '0048ECAE: call [00401044h]
  '0048ECB4: test eax, eax
  '0048ECB6: jle 0048EDE2h
  '0048ECBC: mov [ebp-04h], 00000019h
  '0048ECC3: push 0041C038h
  '0048ECC8: push 00000000h
  '0048ECCA: push 00000003h
  '0048ECCC: mov eax, [ebp+08h]
  '0048ECCF: mov ecx, [eax]
  '0048ECD1: mov edx, [ebp+08h]
  '0048ECD4: push edx
  '0048ECD5: call [ecx+0000032Ch]
  '0048ECDB: push eax
  '0048ECDC: lea eax, [ebp-28h]
  '0048ECDF: push eax
  '0048ECE0: call [004010E4h]
  '0048ECE6: push eax
  '0048ECE7: lea ecx, [ebp-40h]
  '0048ECEA: push ecx
  '0048ECEB: call [004011E4h]
  '0048ECF1: add esp, 00000010h
  '0048ECF4: push eax
  '0048ECF5: call [004011C8h]
  '0048ECFB: push eax
  '0048ECFC: lea edx, [ebp-2Ch]
  '0048ECFF: push edx
  '0048ED00: call [004010E4h]
  '0048ED06: mov [ebp-64h], eax
  '0048ED09: mov [ebp-48h], 00000005h
  '0048ED10: mov [ebp-50h], 00000002h
  '0048ED17: lea eax, [ebp-30h]
  '0048ED1A: push eax
  '0048ED1B: lea ecx, [ebp-50h]
  '0048ED1E: push ecx
  '0048ED1F: mov edx, [ebp-64h]
  '0048ED22: mov eax, [edx]
  '0048ED24: mov ecx, [ebp-64h]
  '0048ED27: push ecx
  '0048ED28: call [eax+24h]
  '0048ED2B: fclex 
  '0048ED2D: mov [ebp-68h], eax
  '0048ED30: cmp [ebp-68h], 00000000h
  '0048ED34: jnl 48ED53h
  '0048ED36: push 00000024h
  '0048ED38: push 0041C038h
  '0048ED3D: mov edx, [ebp-64h]
  '0048ED40: push edx
  '0048ED41: mov eax, [ebp-68h]
  '0048ED44: push eax
  '0048ED45: call [004010A0h]
  '0048ED4B: mov [ebp-000000A0h], eax
  '0048ED51: jmp 48ED5Dh
  '0048ED53: mov [ebp-000000A0h], 00000000h
  '0048ED5D: mov ecx, [ebp-30h]
  '0048ED60: mov [ebp-6Ch], ecx
  '0048ED63: mov edx, [ebp-24h]
  '0048ED66: push edx
  '0048ED67: call [004013BCh]
  '0048ED6D: call [0040135Ch]
  '0048ED73: push eax
  '0048ED74: mov eax, [ebp-6Ch]
  '0048ED77: mov ecx, [eax]
  '0048ED79: mov edx, [ebp-6Ch]
  '0048ED7C: push edx
  '0048ED7D: call [ecx+00000080h]
  '0048ED83: fclex 
  '0048ED85: mov [ebp-70h], eax
  '0048ED88: cmp [ebp-70h], 00000000h
  '0048ED8C: jnl 48EDAEh
  '0048ED8E: push 00000080h
  '0048ED93: push 0041C048h
  '0048ED98: mov eax, [ebp-6Ch]
  '0048ED9B: push eax
  '0048ED9C: mov ecx, [ebp-70h]
  '0048ED9F: push ecx
  '0048EDA0: call [004010A0h]
  '0048EDA6: mov [ebp-000000A4h], eax
  '0048EDAC: jmp 48EDB8h
  '0048EDAE: mov [ebp-000000A4h], 00000000h
  '0048EDB8: lea edx, [ebp-30h]
  '0048EDBB: push edx
  '0048EDBC: lea eax, [ebp-2Ch]
  '0048EDBF: push eax
  '0048EDC0: lea ecx, [ebp-28h]
  '0048EDC3: push ecx
  '0048EDC4: push 00000003h
  '0048EDC6: call [00401064h]
  '0048EDCC: add esp, 00000010h
  '0048EDCF: lea edx, [ebp-50h]
  '0048EDD2: push edx
  '0048EDD3: lea eax, [ebp-40h]
  '0048EDD6: push eax
  '0048EDD7: push 00000002h
  '0048EDD9: call [00401050h]
  '0048EDDF: add esp, 0000000Ch
  '0048EDE2: mov [ebp-04h], 0000001Bh
  '0048EDE9: mov [ebp-58h], 80020004h
  '0048EDF0: mov [ebp-60h], 0000000Ah
  '0048EDF7: mov eax, 00000010h
  '0048EDFC: call 004081B0h
  '0048EE01: mov ecx, esp
  '0048EE03: mov edx, [ebp-60h]
  '0048EE06: mov [ecx], edx
  '0048EE08: mov eax, [ebp-5Ch]
  '0048EE0B: mov [ecx+04h], eax
  '0048EE0E: mov edx, [ebp-58h]
  '0048EE11: mov [ecx+08h], edx
  '0048EE14: mov eax, [ebp-54h]
  '0048EE17: mov [ecx+0Ch], eax
  '0048EE1A: push 0041EB14h
  '0048EE1F: push 0041EA6Ch
  '0048EE24: push 0041EA58h
  '0048EE29: call [00401314h]
  '0048EE2F: mov edx, eax
  '0048EE31: lea ecx, [ebp-24h]
  '0048EE34: call [00401378h]
  '0048EE3A: mov [ebp-04h], 0000001Ch
  '0048EE41: mov ecx, [ebp-24h]
  '0048EE44: push ecx
  '0048EE45: call [00401044h]
  '0048EE4B: test eax, eax
  '0048EE4D: jle 0048EF79h
  '0048EE53: mov [ebp-04h], 0000001Dh
  '0048EE5A: push 0041C038h
  '0048EE5F: push 00000000h
  '0048EE61: push 00000003h
  '0048EE63: mov edx, [ebp+08h]
  '0048EE66: mov eax, [edx]
  '0048EE68: mov ecx, [ebp+08h]
  '0048EE6B: push ecx
  '0048EE6C: call [eax+0000032Ch]
  '0048EE72: push eax
  '0048EE73: lea edx, [ebp-28h]
  '0048EE76: push edx
  '0048EE77: call [004010E4h]
  '0048EE7D: push eax
  '0048EE7E: lea eax, [ebp-40h]
  '0048EE81: push eax
  '0048EE82: call [004011E4h]
  '0048EE88: add esp, 00000010h
  '0048EE8B: push eax
  '0048EE8C: call [004011C8h]
  '0048EE92: push eax
  '0048EE93: lea ecx, [ebp-2Ch]
  '0048EE96: push ecx
  '0048EE97: call [004010E4h]
  '0048EE9D: mov [ebp-64h], eax
  '0048EEA0: mov [ebp-48h], 00000006h
  '0048EEA7: mov [ebp-50h], 00000002h
  '0048EEAE: lea edx, [ebp-30h]
  '0048EEB1: push edx
  '0048EEB2: lea eax, [ebp-50h]
  '0048EEB5: push eax
  '0048EEB6: mov ecx, [ebp-64h]
  '0048EEB9: mov edx, [ecx]
  '0048EEBB: mov eax, [ebp-64h]
  '0048EEBE: push eax
  '0048EEBF: call [edx+24h]
  '0048EEC2: fclex 
  '0048EEC4: mov [ebp-68h], eax
  '0048EEC7: cmp [ebp-68h], 00000000h
  '0048EECB: jnl 48EEEAh
  '0048EECD: push 00000024h
  '0048EECF: push 0041C038h
  '0048EED4: mov ecx, [ebp-64h]
  '0048EED7: push ecx
  '0048EED8: mov edx, [ebp-68h]
  '0048EEDB: push edx
  '0048EEDC: call [004010A0h]
  '0048EEE2: mov [ebp-000000A8h], eax
  '0048EEE8: jmp 48EEF4h
  '0048EEEA: mov [ebp-000000A8h], 00000000h
  '0048EEF4: mov eax, [ebp-30h]
  '0048EEF7: mov [ebp-6Ch], eax
  '0048EEFA: mov ecx, [ebp-24h]
  '0048EEFD: push ecx
  '0048EEFE: call [004013BCh]
  '0048EF04: call [0040135Ch]
  '0048EF0A: push eax
  '0048EF0B: mov edx, [ebp-6Ch]
  '0048EF0E: mov eax, [edx]
  '0048EF10: mov ecx, [ebp-6Ch]
  '0048EF13: push ecx
  '0048EF14: call [eax+00000080h]
  '0048EF1A: fclex 
  '0048EF1C: mov [ebp-70h], eax
  '0048EF1F: cmp [ebp-70h], 00000000h
  '0048EF23: jnl 48EF45h
  '0048EF25: push 00000080h
  '0048EF2A: push 0041C048h
  '0048EF2F: mov edx, [ebp-6Ch]
  '0048EF32: push edx
  '0048EF33: mov eax, [ebp-70h]
  '0048EF36: push eax
  '0048EF37: call [004010A0h]
  '0048EF3D: mov [ebp-000000ACh], eax
  '0048EF43: jmp 48EF4Fh
  '0048EF45: mov [ebp-000000ACh], 00000000h
  '0048EF4F: lea ecx, [ebp-30h]
  '0048EF52: push ecx
  '0048EF53: lea edx, [ebp-2Ch]
  '0048EF56: push edx
  '0048EF57: lea eax, [ebp-28h]
  '0048EF5A: push eax
  '0048EF5B: push 00000003h
  '0048EF5D: call [00401064h]
  '0048EF63: add esp, 00000010h
  '0048EF66: lea ecx, [ebp-50h]
  '0048EF69: push ecx
  '0048EF6A: lea edx, [ebp-40h]
  '0048EF6D: push edx
  '0048EF6E: push 00000002h
  '0048EF70: call [00401050h]
  '0048EF76: add esp, 0000000Ch
  '0048EF79: wait 
  '0048EF7A: push 0048EFB6h
  '0048EF7F: jmp 48EFACh
  '0048EF81: lea eax, [ebp-30h]
  '0048EF84: push eax
  '0048EF85: lea ecx, [ebp-2Ch]
  '0048EF88: push ecx
  '0048EF89: lea edx, [ebp-28h]
  '0048EF8C: push edx
  '0048EF8D: push 00000003h
  '0048EF8F: call [00401064h]
  '0048EF95: add esp, 00000010h
  '0048EF98: lea eax, [ebp-50h]
  '0048EF9B: push eax
  '0048EF9C: lea ecx, [ebp-40h]
  '0048EF9F: push ecx
  '0048EFA0: push 00000002h
  '0048EFA2: call [00401050h]
  '0048EFA8: add esp, 0000000Ch
  '0048EFAB: ret 
End Sub
Private Sub unknown_48EFD0
  '0048EFD0: push ebp
  '0048EFD1: mov ebp, esp
  '0048EFD3: sub esp, 00000018h
  '0048EFD6: push 004081B6h
  '0048EFDB: mov eax, fs:[00h]
  '0048EFE1: push eax
  '0048EFE2: mov fs:[00000000h], esp
  '0048EFE9: mov eax, 00000094h
  '0048EFEE: call 004081B0h
  '0048EFF3: push ebx
  '0048EFF4: push esi
  '0048EFF5: push edi
  '0048EFF6: mov [ebp-18h], esp
  '0048EFF9: mov [ebp-14h], 00401B78h
  '0048F000: mov [ebp-10h], 00000000h
  '0048F007: mov [ebp-0Ch], 00000000h
  '0048F00E: mov [ebp-04h], 00000001h
  '0048F015: mov [ebp-04h], 00000002h
  '0048F01C: push FFFFFFFFh
  '0048F01E: call [004010E8h]
  '0048F024: mov [ebp-04h], 00000003h
  '0048F02B: lea eax, [ebp-64h]
  '0048F02E: push eax
  '0048F02F: mov ecx, [ebp+08h]
  '0048F032: mov edx, [ecx]
  '0048F034: mov eax, [ebp+08h]
  '0048F037: push eax
  '0048F038: call [edx+00000754h]
  '0048F03E: movsx ecx, word ptr [ebp-64h]
  '0048F042: test ecx, ecx
  '0048F044: jnz 0048F0CDh
  '0048F04A: mov [ebp-04h], 00000004h
  '0048F051: lea edx, [ebp-68h]
  '0048F054: push edx
  '0048F055: mov eax, [ebp+08h]
  '0048F058: mov ecx, [eax]
  '0048F05A: mov edx, [ebp+08h]
  '0048F05D: push edx
  '0048F05E: call [ecx+00000080h]
  '0048F064: fclex 
  '0048F066: mov [ebp-6Ch], eax
  '0048F069: cmp [ebp-6Ch], 00000000h
  '0048F06D: jnl 48F08Fh
  '0048F06F: push 00000080h
  '0048F074: push 0041BC88h
  '0048F079: mov eax, [ebp+08h]
  '0048F07C: push eax
  '0048F07D: mov ecx, [ebp-6Ch]
  '0048F080: push ecx
  '0048F081: call [004010A0h]
  '0048F087: mov [ebp-00000090h], eax
  '0048F08D: jmp 48F099h
  '0048F08F: mov [ebp-00000090h], 00000000h
  '0048F099: mov edx, [ebp-68h]
  '0048F09C: push edx
  '0048F09D: call [004011D4h]
  '0048F0A3: mov edx, eax
  '0048F0A5: lea ecx, [ebp-24h]
  '0048F0A8: call [00401378h]
  '0048F0AE: push eax
  '0048F0AF: push 0041EA80h
  '0048F0B4: push 0041EA6Ch
  '0048F0B9: push 0041EA58h
  '0048F0BE: call [00401010h]
  '0048F0C4: lea ecx, [ebp-24h]
  '0048F0C7: call [004013B4h]
  '0048F0CD: mov [ebp-04h], 00000006h
  '0048F0D4: lea eax, [ebp-64h]
  '0048F0D7: push eax
  '0048F0D8: mov ecx, [ebp+08h]
  '0048F0DB: mov edx, [ecx]
  '0048F0DD: mov eax, [ebp+08h]
  '0048F0E0: push eax
  '0048F0E1: call [edx+00000754h]
  '0048F0E7: movsx ecx, word ptr [ebp-64h]
  '0048F0EB: test ecx, ecx
  '0048F0ED: jnz 0048F176h
  '0048F0F3: mov [ebp-04h], 00000007h
  '0048F0FA: lea edx, [ebp-68h]
  '0048F0FD: push edx
  '0048F0FE: mov eax, [ebp+08h]
  '0048F101: mov ecx, [eax]
  '0048F103: mov edx, [ebp+08h]
  '0048F106: push edx
  '0048F107: call [ecx+00000088h]
  '0048F10D: fclex 
  '0048F10F: mov [ebp-6Ch], eax
  '0048F112: cmp [ebp-6Ch], 00000000h
  '0048F116: jnl 48F138h
  '0048F118: push 00000088h
  '0048F11D: push 0041BC88h
  '0048F122: mov eax, [ebp+08h]
  '0048F125: push eax
  '0048F126: mov ecx, [ebp-6Ch]
  '0048F129: push ecx
  '0048F12A: call [004010A0h]
  '0048F130: mov [ebp-00000094h], eax
  '0048F136: jmp 48F142h
  '0048F138: mov [ebp-00000094h], 00000000h
  '0048F142: mov edx, [ebp-68h]
  '0048F145: push edx
  '0048F146: call [004011D4h]
  '0048F14C: mov edx, eax
  '0048F14E: lea ecx, [ebp-24h]
  '0048F151: call [00401378h]
  '0048F157: push eax
  '0048F158: push 0041EA98h
  '0048F15D: push 0041EA6Ch
  '0048F162: push 0041EA58h
  '0048F167: call [00401010h]
  '0048F16D: lea ecx, [ebp-24h]
  '0048F170: call [004013B4h]
  '0048F176: mov [ebp-04h], 00000009h
  '0048F17D: mov eax, [ebp+08h]
  '0048F180: mov ecx, [eax]
  '0048F182: mov edx, [ebp+08h]
  '0048F185: push edx
  '0048F186: call [ecx+00000308h]
  '0048F18C: push eax
  '0048F18D: lea eax, [ebp-28h]
  '0048F190: push eax
  '0048F191: call [004010E4h]
  '0048F197: mov [ebp-6Ch], eax
  '0048F19A: lea ecx, [ebp-24h]
  '0048F19D: push ecx
  '0048F19E: mov edx, [ebp-6Ch]
  '0048F1A1: mov eax, [edx]
  '0048F1A3: mov ecx, [ebp-6Ch]
  '0048F1A6: push ecx
  '0048F1A7: call [eax+000000A8h]
  '0048F1AD: fclex 
  '0048F1AF: mov [ebp-70h], eax
  '0048F1B2: cmp [ebp-70h], 00000000h
  '0048F1B6: jnl 48F1D8h
  '0048F1B8: push 000000A8h
  '0048F1BD: push 0041C0C4h
  '0048F1C2: mov edx, [ebp-6Ch]
  '0048F1C5: push edx
  '0048F1C6: mov eax, [ebp-70h]
  '0048F1C9: push eax
  '0048F1CA: call [004010A0h]
  '0048F1D0: mov [ebp-00000098h], eax
  '0048F1D6: jmp 48F1E2h
  '0048F1D8: mov [ebp-00000098h], 00000000h
  '0048F1E2: mov ecx, [ebp-24h]
  '0048F1E5: push ecx
  '0048F1E6: push 0041EAB0h
  '0048F1EB: push 0041EA6Ch
  '0048F1F0: push 0041EA58h
  '0048F1F5: call [00401010h]
  '0048F1FB: lea ecx, [ebp-24h]
  '0048F1FE: call [004013B4h]
  '0048F204: lea ecx, [ebp-28h]
  '0048F207: call [004013B8h]
  '0048F20D: mov [ebp-04h], 0000000Ah
  '0048F214: mov edx, [ebp+08h]
  '0048F217: mov eax, [edx]
  '0048F219: mov ecx, [ebp+08h]
  '0048F21C: push ecx
  '0048F21D: call [eax+00000304h]
  '0048F223: push eax
  '0048F224: lea edx, [ebp-28h]
  '0048F227: push edx
  '0048F228: call [004010E4h]
  '0048F22E: mov [ebp-6Ch], eax
  '0048F231: lea eax, [ebp-24h]
  '0048F234: push eax
  '0048F235: mov ecx, [ebp-6Ch]
  '0048F238: mov edx, [ecx]
  '0048F23A: mov eax, [ebp-6Ch]
  '0048F23D: push eax
  '0048F23E: call [edx+000000A8h]
  '0048F244: fclex 
  '0048F246: mov [ebp-70h], eax
  '0048F249: cmp [ebp-70h], 00000000h
  '0048F24D: jnl 48F26Fh
  '0048F24F: push 000000A8h
  '0048F254: push 0041C0C4h
  '0048F259: mov ecx, [ebp-6Ch]
  '0048F25C: push ecx
  '0048F25D: mov edx, [ebp-70h]
  '0048F260: push edx
  '0048F261: call [004010A0h]
  '0048F267: mov [ebp-0000009Ch], eax
  '0048F26D: jmp 48F279h
  '0048F26F: mov [ebp-0000009Ch], 00000000h
  '0048F279: mov eax, [ebp-24h]
  '0048F27C: push eax
  '0048F27D: push 0041EACCh
  '0048F282: push 0041EA6Ch
  '0048F287: push 0041EA58h
  '0048F28C: call [00401010h]
  '0048F292: lea ecx, [ebp-24h]
  '0048F295: call [004013B4h]
  '0048F29B: lea ecx, [ebp-28h]
  '0048F29E: call [004013B8h]
  '0048F2A4: mov [ebp-04h], 0000000Bh
  '0048F2AB: push 0041C038h
  '0048F2B0: push 00000000h
  '0048F2B2: push 00000003h
  '0048F2B4: mov ecx, [ebp+08h]
  '0048F2B7: mov edx, [ecx]
  '0048F2B9: mov eax, [ebp+08h]
  '0048F2BC: push eax
  '0048F2BD: call [edx+0000032Ch]
  '0048F2C3: push eax
  '0048F2C4: lea ecx, [ebp-28h]
  '0048F2C7: push ecx
  '0048F2C8: call [004010E4h]
  '0048F2CE: push eax
  '0048F2CF: lea edx, [ebp-40h]
  '0048F2D2: push edx
  '0048F2D3: call [004011E4h]
  '0048F2D9: add esp, 00000010h
  '0048F2DC: push eax
  '0048F2DD: call [004011C8h]
  '0048F2E3: push eax
  '0048F2E4: lea eax, [ebp-2Ch]
  '0048F2E7: push eax
  '0048F2E8: call [004010E4h]
  '0048F2EE: mov [ebp-6Ch], eax
  '0048F2F1: mov [ebp-48h], 00000004h
  '0048F2F8: mov [ebp-50h], 00000002h
  '0048F2FF: lea ecx, [ebp-30h]
  '0048F302: push ecx
  '0048F303: lea edx, [ebp-50h]
  '0048F306: push edx
  '0048F307: mov eax, [ebp-6Ch]
  '0048F30A: mov ecx, [eax]
  '0048F30C: mov edx, [ebp-6Ch]
  '0048F30F: push edx
  '0048F310: call [ecx+24h]
  '0048F313: fclex 
  '0048F315: mov [ebp-70h], eax
  '0048F318: cmp [ebp-70h], 00000000h
  '0048F31C: jnl 48F33Bh
  '0048F31E: push 00000024h
  '0048F320: push 0041C038h
  '0048F325: mov eax, [ebp-6Ch]
  '0048F328: push eax
  '0048F329: mov ecx, [ebp-70h]
  '0048F32C: push ecx
  '0048F32D: call [004010A0h]
  '0048F333: mov [ebp-000000A0h], eax
  '0048F339: jmp 48F345h
  '0048F33B: mov [ebp-000000A0h], 00000000h
  '0048F345: mov edx, [ebp-30h]
  '0048F348: mov [ebp-74h], edx
  '0048F34B: lea eax, [ebp-68h]
  '0048F34E: push eax
  '0048F34F: mov ecx, [ebp-74h]
  '0048F352: mov edx, [ecx]
  '0048F354: mov eax, [ebp-74h]
  '0048F357: push eax
  '0048F358: call [edx+7Ch]
  '0048F35B: fclex 
  '0048F35D: mov [ebp-78h], eax
  '0048F360: cmp [ebp-78h], 00000000h
  '0048F364: jnl 48F383h
  '0048F366: push 0000007Ch
  '0048F368: push 0041C048h
  '0048F36D: mov ecx, [ebp-74h]
  '0048F370: push ecx
  '0048F371: mov edx, [ebp-78h]
  '0048F374: push edx
  '0048F375: call [004010A0h]
  '0048F37B: mov [ebp-000000A4h], eax
  '0048F381: jmp 48F38Dh
  '0048F383: mov [ebp-000000A4h], 00000000h
  '0048F38D: mov eax, [ebp-68h]
  '0048F390: push eax
  '0048F391: call [00401024h]
  '0048F397: mov edx, eax
  '0048F399: lea ecx, [ebp-24h]
  '0048F39C: call [00401378h]
  '0048F3A2: push eax
  '0048F3A3: push 0041EAE8h
  '0048F3A8: push 0041EA6Ch
  '0048F3AD: push 0041EA58h
  '0048F3B2: call [00401010h]
  '0048F3B8: lea ecx, [ebp-24h]
  '0048F3BB: call [004013B4h]
  '0048F3C1: lea ecx, [ebp-30h]
  '0048F3C4: push ecx
  '0048F3C5: lea edx, [ebp-2Ch]
  '0048F3C8: push edx
  '0048F3C9: lea eax, [ebp-28h]
  '0048F3CC: push eax
  '0048F3CD: push 00000003h
  '0048F3CF: call [00401064h]
  '0048F3D5: add esp, 00000010h
  '0048F3D8: lea ecx, [ebp-50h]
  '0048F3DB: push ecx
  '0048F3DC: lea edx, [ebp-40h]
  '0048F3DF: push edx
  '0048F3E0: push 00000002h
  '0048F3E2: call [00401050h]
  '0048F3E8: add esp, 0000000Ch
  '0048F3EB: mov [ebp-04h], 0000000Ch
  '0048F3F2: push 0041C038h
  '0048F3F7: push 00000000h
  '0048F3F9: push 00000003h
  '0048F3FB: mov eax, [ebp+08h]
  '0048F3FE: mov ecx, [eax]
  '0048F400: mov edx, [ebp+08h]
  '0048F403: push edx
  '0048F404: call [ecx+0000032Ch]
  '0048F40A: push eax
  '0048F40B: lea eax, [ebp-28h]
  '0048F40E: push eax
  '0048F40F: call [004010E4h]
  '0048F415: push eax
  '0048F416: lea ecx, [ebp-40h]
  '0048F419: push ecx
  '0048F41A: call [004011E4h]
  '0048F420: add esp, 00000010h
  '0048F423: push eax
  '0048F424: call [004011C8h]
  '0048F42A: push eax
  '0048F42B: lea edx, [ebp-2Ch]
  '0048F42E: push edx
  '0048F42F: call [004010E4h]
  '0048F435: mov [ebp-6Ch], eax
  '0048F438: mov [ebp-48h], 00000005h
  '0048F43F: mov [ebp-50h], 00000002h
  '0048F446: lea eax, [ebp-30h]
  '0048F449: push eax
  '0048F44A: lea ecx, [ebp-50h]
  '0048F44D: push ecx
  '0048F44E: mov edx, [ebp-6Ch]
  '0048F451: mov eax, [edx]
  '0048F453: mov ecx, [ebp-6Ch]
  '0048F456: push ecx
  '0048F457: call [eax+24h]
  '0048F45A: fclex 
  '0048F45C: mov [ebp-70h], eax
  '0048F45F: cmp [ebp-70h], 00000000h
  '0048F463: jnl 48F482h
  '0048F465: push 00000024h
  '0048F467: push 0041C038h
  '0048F46C: mov edx, [ebp-6Ch]
  '0048F46F: push edx
  '0048F470: mov eax, [ebp-70h]
  '0048F473: push eax
  '0048F474: call [004010A0h]
  '0048F47A: mov [ebp-000000A8h], eax
  '0048F480: jmp 48F48Ch
  '0048F482: mov [ebp-000000A8h], 00000000h
  '0048F48C: mov ecx, [ebp-30h]
  '0048F48F: mov [ebp-74h], ecx
  '0048F492: lea edx, [ebp-68h]
  '0048F495: push edx
  '0048F496: mov eax, [ebp-74h]
  '0048F499: mov ecx, [eax]
  '0048F49B: mov edx, [ebp-74h]
  '0048F49E: push edx
  '0048F49F: call [ecx+7Ch]
  '0048F4A2: fclex 
  '0048F4A4: mov [ebp-78h], eax
  '0048F4A7: cmp [ebp-78h], 00000000h
  '0048F4AB: jnl 48F4CAh
  '0048F4AD: push 0000007Ch
  '0048F4AF: push 0041C048h
  '0048F4B4: mov eax, [ebp-74h]
  '0048F4B7: push eax
  '0048F4B8: mov ecx, [ebp-78h]
  '0048F4BB: push ecx
  '0048F4BC: call [004010A0h]
  '0048F4C2: mov [ebp-000000ACh], eax
  '0048F4C8: jmp 48F4D4h
  '0048F4CA: mov [ebp-000000ACh], 00000000h
  '0048F4D4: mov edx, [ebp-68h]
  '0048F4D7: push edx
  '0048F4D8: call [00401024h]
  '0048F4DE: mov edx, eax
  '0048F4E0: lea ecx, [ebp-24h]
  '0048F4E3: call [00401378h]
  '0048F4E9: push eax
  '0048F4EA: push 0041EB00h
  '0048F4EF: push 0041EA6Ch
  '0048F4F4: push 0041EA58h
  '0048F4F9: call [00401010h]
  '0048F4FF: lea ecx, [ebp-24h]
  '0048F502: call [004013B4h]
  '0048F508: lea eax, [ebp-30h]
  '0048F50B: push eax
  '0048F50C: lea ecx, [ebp-2Ch]
  '0048F50F: push ecx
  '0048F510: lea edx, [ebp-28h]
  '0048F513: push edx
  '0048F514: push 00000003h
  '0048F516: call [00401064h]
  '0048F51C: add esp, 00000010h
  '0048F51F: lea eax, [ebp-50h]
  '0048F522: push eax
  '0048F523: lea ecx, [ebp-40h]
  '0048F526: push ecx
  '0048F527: push 00000002h
  '0048F529: call [00401050h]
  '0048F52F: add esp, 0000000Ch
  '0048F532: mov [ebp-04h], 0000000Dh
  '0048F539: push 0041C038h
  '0048F53E: push 00000000h
  '0048F540: push 00000003h
  '0048F542: mov edx, [ebp+08h]
  '0048F545: mov eax, [edx]
  '0048F547: mov ecx, [ebp+08h]
  '0048F54A: push ecx
  '0048F54B: call [eax+0000032Ch]
  '0048F551: push eax
  '0048F552: lea edx, [ebp-28h]
  '0048F555: push edx
  '0048F556: call [004010E4h]
  '0048F55C: push eax
  '0048F55D: lea eax, [ebp-40h]
  '0048F560: push eax
  '0048F561: call [004011E4h]
  '0048F567: add esp, 00000010h
  '0048F56A: push eax
  '0048F56B: call [004011C8h]
  '0048F571: push eax
  '0048F572: lea ecx, [ebp-2Ch]
  '0048F575: push ecx
  '0048F576: call [004010E4h]
  '0048F57C: mov [ebp-6Ch], eax
  '0048F57F: mov [ebp-48h], 00000006h
  '0048F586: mov [ebp-50h], 00000002h
  '0048F58D: lea edx, [ebp-30h]
  '0048F590: push edx
  '0048F591: lea eax, [ebp-50h]
  '0048F594: push eax
  '0048F595: mov ecx, [ebp-6Ch]
  '0048F598: mov edx, [ecx]
  '0048F59A: mov eax, [ebp-6Ch]
  '0048F59D: push eax
  '0048F59E: call [edx+24h]
  '0048F5A1: fclex 
  '0048F5A3: mov [ebp-70h], eax
  '0048F5A6: cmp [ebp-70h], 00000000h
  '0048F5AA: jnl 48F5C9h
  '0048F5AC: push 00000024h
  '0048F5AE: push 0041C038h
  '0048F5B3: mov ecx, [ebp-6Ch]
  '0048F5B6: push ecx
  '0048F5B7: mov edx, [ebp-70h]
  '0048F5BA: push edx
  '0048F5BB: call [004010A0h]
  '0048F5C1: mov [ebp-000000B0h], eax
  '0048F5C7: jmp 48F5D3h
  '0048F5C9: mov [ebp-000000B0h], 00000000h
  '0048F5D3: mov eax, [ebp-30h]
  '0048F5D6: mov [ebp-74h], eax
  '0048F5D9: lea ecx, [ebp-68h]
  '0048F5DC: push ecx
  '0048F5DD: mov edx, [ebp-74h]
  '0048F5E0: mov eax, [edx]
  '0048F5E2: mov ecx, [ebp-74h]
  '0048F5E5: push ecx
  '0048F5E6: call [eax+7Ch]
  '0048F5E9: fclex 
  '0048F5EB: mov [ebp-78h], eax
  '0048F5EE: cmp [ebp-78h], 00000000h
  '0048F5F2: jnl 48F611h
  '0048F5F4: push 0000007Ch
  '0048F5F6: push 0041C048h
  '0048F5FB: mov edx, [ebp-74h]
  '0048F5FE: push edx
  '0048F5FF: mov eax, [ebp-78h]
  '0048F602: push eax
  '0048F603: call [004010A0h]
  '0048F609: mov [ebp-000000B4h], eax
  '0048F60F: jmp 48F61Bh
  '0048F611: mov [ebp-000000B4h], 00000000h
  '0048F61B: mov ecx, [ebp-68h]
  '0048F61E: push ecx
  '0048F61F: call [00401024h]
  '0048F625: mov edx, eax
  '0048F627: lea ecx, [ebp-24h]
  '0048F62A: call [00401378h]
  '0048F630: push eax
  '0048F631: push 0041EB14h
  '0048F636: push 0041EA6Ch
  '0048F63B: push 0041EA58h
  '0048F640: call [00401010h]
  '0048F646: lea ecx, [ebp-24h]
  '0048F649: call [004013B4h]
  '0048F64F: lea edx, [ebp-30h]
  '0048F652: push edx
  '0048F653: lea eax, [ebp-2Ch]
  '0048F656: push eax
  '0048F657: lea ecx, [ebp-28h]
  '0048F65A: push ecx
  '0048F65B: push 00000003h
  '0048F65D: call [00401064h]
  '0048F663: add esp, 00000010h
  '0048F666: lea edx, [ebp-50h]
  '0048F669: push edx
  '0048F66A: lea eax, [ebp-40h]
  '0048F66D: push eax
  '0048F66E: push 00000002h
  '0048F670: call [00401050h]
  '0048F676: add esp, 0000000Ch
  '0048F679: wait 
  '0048F67A: push 0048F6B6h
  '0048F67F: jmp 48F6B5h
  '0048F681: lea ecx, [ebp-24h]
  '0048F684: call [004013B4h]
  '0048F68A: lea ecx, [ebp-30h]
  '0048F68D: push ecx
  '0048F68E: lea edx, [ebp-2Ch]
  '0048F691: push edx
  '0048F692: lea eax, [ebp-28h]
  '0048F695: push eax
  '0048F696: push 00000003h
  '0048F698: call [00401064h]
  '0048F69E: add esp, 00000010h
  '0048F6A1: lea ecx, [ebp-50h]
  '0048F6A4: push ecx
  '0048F6A5: lea edx, [ebp-40h]
  '0048F6A8: push edx
  '0048F6A9: push 00000002h
  '0048F6AB: call [00401050h]
  '0048F6B1: add esp, 0000000Ch
  '0048F6B4: ret 
End Sub
Private Sub unknown_48F6D0
  '0048F6D0: push ecx
  '0048F6D1: push esi
  '0048F6D2: mov esi, [esp+0Ch]
  '0048F6D6: lea ecx, [esp+04h]
  '0048F6DA: mov [esp+04h], 00000000h
  '0048F6E2: mov eax, [esi]
  '0048F6E4: push ecx
  '0048F6E5: push esi
  '0048F6E6: call [eax+58h]
  '0048F6E9: test eax, eax
  '0048F6EB: fclex 
  '0048F6ED: jnl 48F6FEh
  '0048F6EF: push 00000058h
  '0048F6F1: push 0041BC88h
  '0048F6F6: push esi
  '0048F6F7: push eax
  '0048F6F8: call [004010A0h]
  '0048F6FE: mov edx, [esp+04h]
  '0048F702: push edx
  '0048F703: call 0041BF88h
  '0048F708: mov esi, eax
  '0048F70A: call [0040109Ch]
  '0048F710: neg si
  '0048F713: mov eax, [esp+10h]
  '0048F717: jo 48F72Ch
  '0048F719: neg si
  '0048F71C: sbb esi, esi
  '0048F71E: neg esi
  '0048F720: neg esi
  '0048F722: mov [eax], si
  '0048F725: xor eax, eax
  '0048F727: pop esi
  '0048F728: pop ecx
  '0048F729: retn 0008h
End Sub

