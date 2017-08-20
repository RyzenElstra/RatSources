Attribute VB_Name = "Module1"
Public Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Const SND_ASYNC = &H1

Public Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Public Const EWX_SHUTDOWN As Long = 1
Public Const EWX_REBOOT As Long = 2
Public Const EWX_LOGOFF As Long = 0
Public Const EWX_FORCE = 4
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
Const SWP_HIDEWINDOW = &H80
Const SWP_SHOWWINDOW = &H40
Const GW_CHILD = 5
Const GW_HWNDNEXT = 2
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Public Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Dim tWnd As Long, bWnd As Long, sSave As String * 250


Public Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Public Function ScreenShot(ByVal theFile As String) As Boolean
Dim lString As String
    DoEvents
    DoEvents
    Call keybd_event(vbKeySnapshot, 1, 0, 0)
    DoEvents
    DoEvents
SavePicture Clipboard.GetData(vbCFBitmap), theFile
GetDesktopPrint = True
Exit Function
End Function
