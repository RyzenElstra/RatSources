Attribute VB_Name = "modNotify"
Option Explicit
'Faccion copiada de SkyWeb07
Private Declare Function SetWindowPos Lib "user32" ( _
    ByVal hwnd As Long, _
    ByVal hWndInsertAfter As Long, _
    ByVal x As Long, _
    ByVal y As Long, _
    ByVal cx As Long, _
    ByVal cy As Long, _
    ByVal wFlags As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" ( _
    ByVal lpClassName As String, _
    ByVal lpWindowName As String) As Long
Private Declare Function GetWindowRect Lib "user32" ( _
    ByVal hwnd As Long, _
    lpRect As RECT) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" ( _
    ByVal hwnd As Long, _
    ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" ( _
    ByVal hwnd As Long, _
    ByVal nIndex As Long, _
    ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" ( _
    ByVal hwnd As Long, _
    ByVal crey As Byte, _
    ByVal bAlpha As Byte, _
    ByVal dwFlags As Long) As Long
Private Const GWL_EXSTYLE = (-20)
Private Const WS_EX_LAYERED = &H80000
Private Const LWA_ALPHA = &H2&
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_SHOWWINDOW = &H40
Private Const HWND_TOPMOST = -1
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Enum EAccion
    Mostrar = 0
    Ocultar = 1
End Enum
Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Public Sub msn(FRM As Form, Direccion As EAccion, Optional level As Byte = 255, Optional Velocidad As Integer = 1)

Dim Posicion As Integer
Dim Tamaño As Integer
Dim hwnd As Long
Dim res As Long
Dim buffRECT As RECT

hwnd& = FindWindow("Shell_TrayWnd", "")

If hwnd > 0 Then
    res = GetWindowRect(hwnd, buffRECT)
    If res > 0 Then
        Tamaño = CStr(buffRECT.Bottom - buffRECT.Top) * 15
        If buffRECT.Left <= 0 And buffRECT.Top > 0 Then
            Posicion = 1
        End If
        If buffRECT.Left > 0 And buffRECT.Top <= 0 Then
            Posicion = 2
            Tamaño = (buffRECT.Right - buffRECT.Left) * 15
        End If
        If buffRECT.Left <= 0 And buffRECT.Top <= 0 And buffRECT.Right < 600 Then
            Posicion = 3
            Tamaño = buffRECT.Right * 15
        End If
        If buffRECT.Left <= 0 And buffRECT.Top <= 0 And buffRECT.Right > 600 Then
            Posicion = 4
        End If
    End If
Else
    Posicion = 1
End If
If Direccion = Mostrar Then
    FRM.Height = 0
Select Case Posicion
Case 1
    FRM.Move Screen.Width - FRM.Width, Screen.Height - FRM.Height - Tamaño
Case 2
    FRM.Move Screen.Width - FRM.Width - Tamaño, Screen.Height - FRM.Height
Case 3
    FRM.Move Tamaño, Screen.Height - FRM.Height
Case 4
    FRM.Move Screen.Width - FRM.Width, Tamaño
End Select
    res = SetWindowPos(FRM.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or _
                       SWP_NOSIZE Or SWP_NOACTIVATE Or SWP_SHOWWINDOW)
       Do While FRM.Height <= 1515
        DoEvents
        FRM.Height = FRM.Height + Velocidad
        If Not Posicion = 4 Then
            FRM.Top = FRM.Top - Velocidad
        End If
    Loop
Else
    Do While FRM.Height >= 520
        DoEvents
        FRM.Height = FRM.Height - Velocidad
        If Not Posicion = 4 Then
            FRM.Top = FRM.Top + Velocidad
        End If
    Loop
    Unload FRM
End If

End Sub




