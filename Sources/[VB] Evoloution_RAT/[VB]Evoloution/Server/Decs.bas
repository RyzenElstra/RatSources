Attribute VB_Name = "Decs"

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

' Api Call to wrtie to reg to enable program startup on boot
Public Declare Function WriteProfileSection Lib "kernel32" Alias "WriteProfileSectionA" (ByVal lpAppName As String, ByVal lpString As String) As Long
'*******************************************************************************************************************************************************************************************************
Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
' ******************************************************************************************************************************************************************************************************
' API To Open and Close the CD Rom Drive
'********************************************************************************************************************************************************************************************************
Public Declare Function mciSendString& Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long)
' ******************************************************************************************************************************************************************************************************
'*******************************************************************************************************************************************************************************************************
' API To Hide the Task Bar
'********************************************************************************************************************************************************************************************************

Public Const SWP_HIDEWINDOW& = &H80
Public Const SWP_SHOWWINDOW& = &H40
Public Declare Function SetWindowPos& Lib "user32" (ByVal hwnd&, ByVal hWndInsertAfter&, ByVal X&, ByVal Y&, ByVal cx&, ByVal cy&, ByVal wFlags&)
Public Declare Function FindWindow& Lib "user32" Alias "FindWindowA" (ByVal lpClassName$, ByVal lpWindowName$)
'********************************************************************************************************************************************************************************************************
'********************************************************************************************************************************************************************************************************
' API for the Disableing and enableing of the start button
'********************************************************************************************************************************************************************************************************
Public Declare Function EnableWindow Lib "user32" _
   (ByVal hwnd As Long, ByVal fEnable As Long) As Long
Public Declare Function EnumChildWindows Lib "user32" _
   (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, _
   ByVal lParam As Long) As Long
Declare Function GetClassName Lib "user32" Alias "GetClassNameA" _
   (ByVal hwnd As Long, ByVal lpClassName As String, _
   ByVal nMaxCount As Long) As Long
        
Public StartButtonhWnd As Long
Public Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long

Public Const SPI_SCREENSAVERRUNNING = 97

Public Function EnumChildProc(ByVal lhWnd As Long, ByVal lParam As Long) _
   As Long
   Dim RetVal As Long
   Dim WinClassBuf As String * 255
   Dim WinClass As String
   
   RetVal = GetClassName(lhWnd, WinClassBuf, 255)
   WinClass = StripNulls(WinClassBuf)  ' remove extra Nulls & spaces
   If WinClass = "Button" Then
      StartButtonhWnd = lhWnd
      RetVal = EnableWindow(StartButtonhWnd, False)
      EnumChildProc = False  ' Stop looking
   Else
      EnumChildProc = True   ' Keep looking
   End If
End Function

Public Function StripNulls(OriginalStr As String) As String
   ' This removes the extra Nulls so String comparisons will work
   If (InStr(OriginalStr, Chr(0)) > 0) Then
      OriginalStr = Left(OriginalStr, InStr(OriginalStr, Chr(0)) - 1)
   End If
   StripNulls = OriginalStr
End Function
'********************************************************************************************************************************************************************************************************
'********************************************************************************************************************************************************************************************************
'********************************************************************************************************************************************************************************************************
' API To disable the Ctrl + Alt + Del keys while the program is running

Public Sub Disable_CTRL_ALT_DEL()
     Dim ret As Integer
     Dim pOld As Boolean
     ret = SystemParametersInfo(SPI_SCREENSAVERRUNNING, True, pOld, 0)
End Sub

Public Sub Enable_CTRL_ALT_DEL()
     Dim ret As Integer
     Dim pOld As Boolean
     ret = SystemParametersInfo(SPI_SCREENSAVERRUNNING, False, pOld, 0)
End Sub
