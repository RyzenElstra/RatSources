Attribute VB_Name = "modSysTray"
'This code shows how to add tray icon
'Methods:
'        CreteIcon         -        Create the tray icon

'        ModifyIcon        -        Modify the properties of the icon;
'                                   Chanhge the picture in the assiciated picturebox and call this
'                                   method to change the tray icon image

'        DeleteIcon        -        Removes the icon from the tray
'                                   Be sure to call this method before your application ends *** IMPORTANT ***

Private Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long

Type NOTIFYICONDATA
    cbSize As Long
    hwnd As Long
    uID As Long
    uFlags As Long
    uCallbackMessage As Long
    hIcon As Long
    szTip As String * 9 'Replace the szTip string's length with your tip's length
End Type

Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4
Private Const NIF_DOALL = NIF_MESSAGE Or NIF_ICON Or NIF_TIP
Public Const WM_MOUSEMOVE = &H200
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_RBUTTONDOWN = &H204

Sub CreateIcon() 'Call this method to create the tray icon
    Dim Tic As NOTIFYICONDATA, erg As Long
    Tic.cbSize = Len(Tic)
    Tic.hwnd = Frm_Main.picTray.hwnd
    Tic.uID = 1&
    Tic.uFlags = NIF_DOALL
    Tic.uCallbackMessage = WM_MOUSEMOVE
    Tic.hIcon = Frm_Main.picTray.Picture
    Tic.szTip = "Show RAT"
    erg = Shell_NotifyIcon(NIM_ADD, Tic)
End Sub

Sub ModifyIcon() 'Call this method to modify the tray icon properties
    Dim Tic As NOTIFYICONDATA, erg As Long
    Tic.cbSize = Len(Tic)
    Tic.hwnd = Frm_Main.picTray.hwnd
    Tic.uID = 1&
    Tic.uFlags = NIF_DOALL
    Tic.uCallbackMessage = WM_MOUSEMOVE
    Tic.hIcon = Frm_Main.picTray.Picture
    Tic.szTip = "Show RAT"
    erg = Shell_NotifyIcon(NIM_MODIFY, Tic)
End Sub

Sub DeleteIcon() 'Call this method to remove the tray icon
    Dim Tic As NOTIFYICONDATA, erg As Long
    Tic.cbSize = Len(Tic)
    Tic.hwnd = Frm_Main.picTray.hwnd
    Tic.uID = 1&
    erg = Shell_NotifyIcon(NIM_DELETE, Tic)
End Sub


