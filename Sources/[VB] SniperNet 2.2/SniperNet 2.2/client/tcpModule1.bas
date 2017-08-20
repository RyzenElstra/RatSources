Attribute VB_Name = "Module1"
Private Const HWND_TOPMOST = -&H1
Private Const HWND_NOTOPMOST = -&H2
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOMOVE = &H2
Public Const WM_LBUTTONDBLCLICK = &H203
Public Const WM_RBUTTONUP = &H205
Public Const WM_LBUTTONUP = &H202
Public Const WM_MOUSEMOVE = &H200
Public Const NIM_ADD = &H0
Public Const NIM_MODIFY = &H1
Public Const NIM_DELETE = &H2
Public Const NIF_MESSAGE = &H1
Public Const NIF_ICON = &H2
Public Const NIF_TIP = &H4
Public Type NOTIFYICONDATA
     cbSize As Long
     hwnd As Long
     uId As Long
     uFlags As Long
     ucallbackMessage As Long
     hIcon As Long
     szTip As String * 64
End Type
Public VBGTray As NOTIFYICONDATA
Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Public Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Sub SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

Public Function NTDomainUserName() As String
Dim strBuffer As String * 255
Dim lngBufferLength As Long
Dim lngRet As Long
Dim strTemp As String
    lngBufferLength = 255
    lngRet = GetUserName(strBuffer, lngBufferLength)
    strTemp = UCase(Trim$(strBuffer))
    NTDomainUserName = Left$(strTemp, Len(strTemp) - 1)
End Function
Public Sub send(ByVal sendstring As String)
If frmPeerA.tcp.State = 7 Then
    frmPeerA.tcp.SendData sendstring
    Else
    MsgBox "Connection failed...", vbCritical, "Error !"
End If
End Sub
