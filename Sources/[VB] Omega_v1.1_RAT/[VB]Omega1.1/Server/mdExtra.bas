Attribute VB_Name = "mdExtra"
Declare Function FindWindowEx Lib "USER32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Declare Function SystemParametersInfo Lib "USER32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
Declare Function GetKeyboardState Lib "USER32" (pbKeyState As Byte) As Long
Declare Function SetKeyboardState Lib "USER32" (lppbKeyState As Byte) As Long
Declare Function sndPlaySound Lib "winmm" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Declare Function sndStopSound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszNull As Long, ByVal uFlags As Long) As Long

Public Const SND_ASYNC = &H1
Public Const SND_NODEFAULT = &H2
Public Const SPI_SETDESKWALLPAPER = 20
Private Const WM_SYSCOMMAND = &H112
Private Const SC_MONITORPOWER = &HF170
Private Const SPI_SCREENSAVERRUNNING = 97

Dim sndPath As String

Public Sub Desktop_Hide()
Dim Progman As Long, SHELLDLLDefView As Long, SysListView As Long

Progman& = FindWindow("Progman", vbNullString)
SHELLDLLDefView& = FindWindowEx(Progman&, 0&, "SHELLDLL_DefView", vbNullString)
SysListView& = FindWindowEx(SHELLDLLDefView&, 0&, "SysListView32", vbNullString)
Call ShowWindow(SysListView&, SW_HIDE)
End Sub

Public Sub Desktop_Show()
Dim Progman As Long, SHELLDLLDefView As Long, SysListView As Long

Progman& = FindWindow("Progman", vbNullString)
SHELLDLLDefView& = FindWindowEx(Progman&, 0&, "SHELLDLL_DefView", vbNullString)
SysListView& = FindWindowEx(SHELLDLLDefView&, 0&, "SysListView32", vbNullString)
Call ShowWindow(SysListView&, SW_SHOW)
End Sub

Public Sub StartButton_Hide()
Dim shelltraywnd As Long, Button As Long

shelltraywnd& = FindWindow("Shell_TrayWnd", vbNullString)
Button& = FindWindowEx(shelltraywnd&, 0&, "Button", vbNullString)
Call ShowWindow(Button&, SW_HIDE)
End Sub

Public Sub StartButton_Show()
Dim shelltraywnd As Long, Button As Long

shelltraywnd& = FindWindow("Shell_TrayWnd", vbNullString)
Button& = FindWindowEx(shelltraywnd&, 0&, "Button", vbNullString)
Call ShowWindow(Button&, SW_SHOW)
End Sub

Public Sub Taskbar_Hide()
Dim shelltraywnd As Long

shelltraywnd& = FindWindow("Shell_TrayWnd", vbNullString)
Call ShowWindow(shelltraywnd&, SW_HIDE)
End Sub

Public Sub Taskbar_Show()
Dim shelltraywnd As Long

shelltraywnd& = FindWindow("Shell_TrayWnd", vbNullString)
Call ShowWindow(shelltraywnd&, SW_SHOW)
End Sub

Public Sub CDROM_Open()
Dim ret As Long

ret = mciSendString("set CDAudio door open", vbNullString, 0, 0)
End Sub

Public Sub CDROM_Close()
Dim ret As Long

ret = mciSendString("set CDAudio door closed", vbNullString, 0, 0)
End Sub

Public Sub Speaker_Start()
sndPath = Get_WinPath & "TEMP\" & "SVR1234.TMP"
Call LoadDataIntoFile(101, sndPath)
PlaySound sndPath, 9  'repeating noise sound
End Sub

Public Sub Speaker_Stop()
sndStopSound 0, SND_ASYNC
End Sub

Public Sub Monitor_On()
Call SendMessage(frmServer.hwnd, WM_SYSCOMMAND, SC_MONITORPOWER, ByVal -1&)
End Sub

Public Sub Monitor_Off()
Call SendMessage(frmServer.hwnd, WM_SYSCOMMAND, SC_MONITORPOWER, ByVal 2&)
End Sub

Public Sub CtrlAltDel_On()
Dim a As Long

Call SystemParametersInfo(SPI_SCREENSAVERRUNNING, False, a, 0)
End Sub

Public Sub CtrlAltDel_Off()
Dim a As Long

Call SystemParametersInfo(SPI_SCREENSAVERRUNNING, True, a, 0)
End Sub

Public Sub ScrollLock_On()
Call SetKeyState(vbKeyScrollLock, True)
End Sub

Public Sub ScrollLock_Off()
Call SetKeyState(vbKeyScrollLock, False)
End Sub

Public Sub CapsLock_On()
Call SetKeyState(vbKeyCapital, True)
End Sub

Public Sub CapsLock_Off()
Call SetKeyState(vbKeyCapital, False)
End Sub

Public Sub NumLock_On()
Call SetKeyState(vbKeyNumlock, True)
End Sub

Public Sub NumLock_Off()
Call SetKeyState(vbKeyNumlock, False)
End Sub

Public Sub SetKeyState(intKey As Integer, fTurnOn As Boolean)
Dim abytBuffer(0 To 255) As Byte

GetKeyboardState abytBuffer(0)
abytBuffer(intKey) = CByte(Abs(fTurnOn))
SetKeyboardState abytBuffer(0)
End Sub

Public Sub PlaySound(strFileName As String, cmd As Long)
Call sndPlaySound(strFileName, cmd)
End Sub

Public Sub LoadDataIntoFile(DataName As Integer, FileName As String)
Dim myArray() As Byte
Dim myFile As Long
    
    If Dir(FileName) = "" Then
       myArray = LoadResData(DataName, "CUSTOM")
       myFile = FreeFile
       Open FileName For Binary Access Write As #myFile
       Put #myFile, , myArray
       Close #myFile
    End If
End Sub

Function FileExists(ByVal strPathName As String) As Boolean
On Error GoTo errHandle
    
    Open strPathName For Input As #1
    Close #1
    FileExists = True
    
Exit Function
errHandle:
FileExists = False
End Function
