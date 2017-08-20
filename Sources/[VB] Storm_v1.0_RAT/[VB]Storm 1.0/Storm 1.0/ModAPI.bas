Attribute VB_Name = "ModAPI"
Option Explicit
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
Type POINTAPI
    X As Integer
    Y As Integer
End Type
Type KeyboardBytes
     kbByte(0 To 255) As Byte
End Type
Type SHELLEXECUTEINFO
    cbSize As Long
    fMask As Long
    hwnd As Long
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
Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, _
  ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As Any, ByVal uReturnLength As Long, ByVal hWndCallback As Long) As Long
Declare Function ReleaseCapture Lib "user32" () As Long
Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function GetDesktopWindow Lib "user32" () As Long
Public Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Declare Function GetLogicalDrives& Lib "kernel32" ()
Declare Function GetDriveType& Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String)
Declare Function GetDiskFreeSpace& Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectorsPerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long)
Declare Function auxGetNumDevs% Lib "winmm" ()
Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Declare Function GetTickCount& Lib "kernel32" ()
Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Long
Declare Function GetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Declare Function SetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Declare Function tapiRequestMakeCall Lib "TAPI32.DLL" (ByVal dest As String, ByVal AppName As String, ByVal CalledParty As String, ByVal Comment As String) As Long
Declare Function ShellExecuteEX Lib "shell32.dll" Alias "ShellExecuteEx" (SEI As SHELLEXECUTEINFO) As Long
Declare Function SetCursorPos& Lib "user32.dll" (ByVal X As Long, ByVal Y As Long)
Declare Function GetCursorPos& Lib "user32.dll" (lpPoint As POINTAPI)
Declare Sub SHAddToRecentDocs Lib "shell32.dll" (ByVal uFlags As Long, ByVal pv As String)
Declare Sub GetSystemInfo Lib "kernel32" (lpSystemInfo As SYSTEM_INFO)
Declare Function SetCaretBlinkTime Lib "user32" (ByVal wMSeconds As Long) As Long
Declare Function GetCaretBlinkTime Lib "user32" () As Long
Declare Function SetDoubleClickTime Lib "user32" (ByVal wCount As Long) As Long
Declare Function GetDoubleClickTime Lib "user32" () As Long
Declare Function GetKeyboardType Lib "user32" (ByVal nTypeFlag As Long) As Long
Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function StartDocPrinter Lib "winspool.drv" Alias "StartDocPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pDocInfo As DOCINFO) As Long
Private Declare Function EndDocPrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function EndPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function StartPagePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Function WritePrinter Lib "winspool.drv" (ByVal hPrinter As Long, pBuf As Any, ByVal cdBuf As Long, pcWritten As Long) As Long
Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As Any) As Long
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hwnd1 As Long, ByVal hwnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Global vararyDriveInfo(26, 11)
Global System As SYSTEM_INFO
Global Cmd() As String
Public bFileTransfer    As Boolean  ' Is true when a file is being received.
Public lFileSize        As Long     ' Global file size variable.
Public bGettingDesktop As Boolean
Global Const MERGEPAINT = &HBB0226
Public Const HWND_TOP = 0
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const FLAGS = SWP_NOMOVE Or SWP_NOSIZE
Public Const EWX_LOGOFF = 0
Public Const EWX_SHUTDOWN = 1
Public Const EWX_REBOOT = 2
Public Const EWX_POWEROFF = 3
Public Const EWX_FORCE = 4
Public Const VK_CAPITAL = &H14
Public Const VK_NUMLOCK = &H90
Public Const VK_SCROLL = &H91
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
Public Const SPI_SCREENSAVERRUNNING& = 97
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
Public Const SPI_SETMOUSETRAILS& = 93
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
Public Const SPIF_UPDATEINIFILE = 1
Public Const SPIF_SENDWININICHANGE = 2
Public Const SEE_MASK_INVOKEIDLIST = &HC
Public Const SEE_MASK_NOCLOSEPROCESS = &H40
Public Const SEE_MASK_FLAG_NO_UI = &H400
Public Const SRCINVERT = &H660046 'set constants
Public Const SRCCOPY = &HCC0020
Public Const SRCAND = &H8800C6
Public Const SRCERASE = &H440328
Public Const SRCPAINT = &HEE0086
Const WM_SYSCOMMAND = &H112&
Const SC_SCREENSAVE = &HF140&
Const SWP_HIDEWINDOW = &H80
Const SWP_SHOWWINDOW = &H40
Global Const HTCAPTION = 2
Global Const WM_NCLBUTTONDOWN = &HA1
Global kbArray As KeyboardBytes
Global HideStart, ShowStart
Public pt As POINTAPI
Private Type DOCINFO
    pDocName As String
    pOutputFile As String
    pDatatype As String
End Type
Public Enum StartBar_Constants
        isontaskbar = 1
        innotontaskbar = 0
End Enum

Function GetSystemParameters(Info, Newsetting)
Dim es
es = SystemParametersInfo(Info, Newsetting, GetSystemParameters, 0)
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

Function GetCaretBlink()
GetCaretBlink = GetCaretBlinkTime
End Function

Function GetDoubleClick()
GetDoubleClick = GetDoubleClickTime
End Function

Function GetSysInfo()
GetSystemInfo System
End Function

Sub ShowProperties(FileName As String, OwnerhWnd As Long)
Dim SEI As SHELLEXECUTEINFO
Dim r As Long
With SEI
    .cbSize = Len(SEI)
    .fMask = SEE_MASK_NOCLOSEPROCESS Or SEE_MASK_INVOKEIDLIST Or SEE_MASK_FLAG_NO_UI
    .hwnd = OwnerhWnd
    .lpVerb = "properties"
    .lpFile = FileName
    .lpParameters = vbNullChar
    .lpDirectory = vbNullChar
    .nShow = 0
    .hInstApp = 0
    .lpIDList = 0
End With
r = ShellExecuteEX(SEI)
End Sub

Sub ClearDocuments()
Call SHAddToRecentDocs(2, vbNullString)
End Sub

Sub AddToDocuments(FileName As String)
Call SHAddToRecentDocs(2, FileName)
End Sub

Function IsCapsLockOn()
GetKeyboardState kbArray
IsCapsLockOn = kbArray.kbByte(VK_CAPITAL)
End Function

Function IsNumLockOn()
GetKeyboardState kbArray
IsNumLockOn = kbArray.kbByte(VK_NUMLOCK)
End Function

Sub StayOnTop(TheForm As Form)
 Dim a
 a = SetWindowPos(TheForm.hwnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
End Sub

Function IsScrollLockOn()
GetKeyboardState kbArray
IsScrollLockOn = kbArray.kbByte(VK_SCROLL)
End Function

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

Sub StartScreensaver(Form1 As Form)
Dim result As Long
result = SendMessage(Form1.hwnd, WM_SYSCOMMAND, SC_SCREENSAVE, 0&)
End Sub

Sub Taskbar(visible As Boolean)
Dim Thwnd As Long
Thwnd = FindWindow("Shell_traywnd", "")
If visible = True Then
    Call SetWindowPos(Thwnd, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
ElseIf visible = False Then
    Call SetWindowPos(Thwnd, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
End If
End Sub

Sub Desktop(visible As Boolean)
Dim hwnd As Long
hwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
ShowWindow hwnd, 0
End Sub

Sub CtrlAltDel(visible As Boolean)
Dim a
Dim huh
a = SystemParametersInfo(97, huh, CStr(1), 0)
End Sub

Function MilliToHMS(Milliseconds)
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

Function GetTimeOnWindows()
GetTimeOnWindows = MilliToHMS(GetTickCount&)
End Function

Sub ShutDownWindows()
Dim a
a = ExitWindowsEx(EWX_FORCE Or EWX_SHUTDOWN, 0)
End Sub

Sub RestartWindows()
Dim a
a = ExitWindowsEx(EWX_FORCE Or EWX_REBOOT, 0)
End Sub

Sub LogOffWindows()
Dim a
a = ExitWindowsEx(EWX_FORCE Or EWX_LOGOFF, 0)
End Sub


Sub PrintText(Text As String)
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

Public Sub DumpToWindow(TargetBox As Control, change, fliph As Boolean, flipv As Boolean)
Dim Desktop As Long 'this will be set the hDc of the desktop
Dim ww, hh
Desktop = GetDC(GetDesktopWindow) 'get the hDc of the desktop and put it in the variable 'desktop'
ww = Screen.Width / Screen.TwipsPerPixelX 'get screen size in pixels
hh = Screen.Height / Screen.TwipsPerPixelY
BitBlt TargetBox.hdc, 0, 0, ww, hh, Desktop, 0, 0, change 'copy to form2.picture1
If fliph = True Then Call FlipPictureHorizontal(frmDesktop.Picture1, frmDesktop.Picture1) 'if requested, flip
If flipv = True Then Call FlipPictureVertical(frmDesktop.Picture1, frmDesktop.Picture1) 'if requested, flip
End Sub
Sub FlipPictureHorizontal(pic1 As PictureBox, pic2 As PictureBox)
pic1.ScaleMode = 3 'set scale modes
pic2.ScaleMode = 3
Dim px%
Dim py%
Dim retval%
px% = pic1.ScaleWidth
py% = pic1.ScaleHeight
retval% = StretchBlt(pic2.hdc, px%, 0, -px%, py%, pic1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub
Sub FlipPictureVertical(pic1 As PictureBox, pic2 As PictureBox)
pic1.ScaleMode = 3 'set scale modes
pic2.ScaleMode = 3
Dim px%
Dim py%
Dim retval%
px% = pic1.ScaleWidth
py% = pic1.ScaleHeight
retval% = StretchBlt(pic2.hdc, 0, py%, px%, -py%, pic1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub

Public Sub Arrayize(sTxt As String, sToken As String)
    Dim iTokenCnt As Integer
    Dim NumCmd As Integer
    Dim iTokenLen As Integer
    Dim lOffset As Long
    Dim lPrevOffset As Long
    iTokenLen = Len(sToken)
    lOffset = InStr(sTxt, sToken)
    Do While lOffset > 0
        ReDim Preserve Cmd(iTokenCnt)
        If lOffset - lPrevOffset > 1 Then
           Cmd(iTokenCnt) = Mid$(sTxt, lPrevOffset + 1, lOffset - 1 - lPrevOffset)
        Else
        End If
        lPrevOffset = lOffset
        lOffset = InStr(lOffset + iTokenLen, sTxt, sToken)
        iTokenCnt = iTokenCnt + 1
    Loop
    ReDim Preserve Cmd(iTokenCnt)
    Cmd(iTokenCnt) = Mid$(sTxt, lPrevOffset + 1)
NumCmd = iTokenCnt
End Sub

Sub MouseTrail(Trails As Long)
Dim a
a = SystemParametersInfo(SPI_SETMOUSETRAILS, Trails, ByVal 0&, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE)
End Sub

Public Sub ScreenShot(TargetBox As Control)
' here i supose u are dumping it to a window/control
' that actually HAS a .hdc property, i mean, tweek it at will.
Dim Desktop As Long
Dim ww, hh
Desktop = GetDC(GetDesktopWindow)

ww = Screen.Width / Screen.TwipsPerPixelX
hh = Screen.Height / Screen.TwipsPerPixelY

BitBlt TargetBox.hdc, 0, 0, ww, hh, Desktop, 0, 0, &HCC0020

End Sub

Sub GoToWebsite(Website As String)
If ShellExecute(&O0, "Open", Website$, vbNullString, vbNullString, vbNormal) < 33 Then
End If
End Sub

Function GetFilePath(FileName As String, Optional IncludeDrive As Boolean = True) As String
' returns full path. drive can be excluded if needed
  GetFilePath = FileName
  If (Not IncludeDrive) Then FileName = Right$(FileName, Len(FileName) - 3)
  Dim i As Integer
  GetFilePath = FileName     ' Just in case there is no "\" in the file
  For i = 1 To Len(FileName)
    If Mid$(FileName, Len(FileName) - i, 1) = "\" Then
      GetFilePath = Mid$(FileName, 1, Len(FileName) - (i + 1))
      Exit For
    End If
  Next
End Function

Sub PlayMedia(MediaFile)
On Error GoTo error_handler
lRet = mciSendString("play " & MediaFile, 0&, 0, 0)
error_handler:
frmServer.WS.SendData "WavError"
End Sub

Public Sub SendDesktop(FileName As String, WinS As Winsock)

Dim FreeF As Integer
Dim LenFile As Long
Dim nCnt As Long
Dim LocData As String
Dim LoopTimes As Long
Dim i As Long

FreeF = FreeFile

Open FileName For Binary As #99

nCnt = 1

LenFile = LOF(99)


Sleep (400)


Do Until nCnt >= (LenFile)
  
    LocData = Space$(1024) 'Set size of chunks

  
  Get #99, nCnt, LocData 'Get data from the file nCnt is from where to start the get
  
  
  If nCnt + 1024 > LenFile Then
      WinS.SendData Mid$(LocData, 1, (LenFile - nCnt))
  Else
  
    WinS.SendData LocData 'Send the chunk
  End If
  
  nCnt = nCnt + 1024
 
Loop


Close #99

End Sub

Public Function Get_Desktop(ByVal theFile As String) As Boolean
Dim lString As String
    
    DoEvents
    DoEvents
    Call keybd_event(vbKeySnapshot, 1, 0, 0)
    DoEvents
    DoEvents
    
    'To get the Active Window
    SavePicture Clipboard.GetData(vbCFBitmap), theFile

    Get_Desktop = True
Exit Function
End Function

Function GetFileName(FileName As String) As String
'returns filename.ext from drive:\path\path\etc\filename.ext or path\path\path\filename.ext
  Dim i As Integer
  Dim tmp As String
  GetFileName = FileName
  For i = 1 To Len(FileName)
    tmp = Right$(FileName, i)
    If Left$(tmp, 1) = "\" Then
      GetFileName = Mid$(tmp, 2)
      Exit For
    End If
  Next
End Function
