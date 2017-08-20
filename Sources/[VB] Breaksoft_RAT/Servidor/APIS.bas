Attribute VB_Name = "APIS"
Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Public Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function BlockInput Lib "user32" (ByVal fBlock As Long) As Long


Sub Pause(interval)
Current = Timer
Do While Timer - Current < Val(interval)
DoEvents
Loop
End Sub

Sub PrintText(Texty As String)

End Sub

Function SuspenderSistema() As Boolean
res = ExitWindowsEx(0, 0&)
End Function

Sub ApagarSistema()
Shell "cmd /c shutdown -s"
End Sub

Sub ReiniciarSistema()
 Shell "cmd /c shutdown -r"
 End Sub


Function leer(ByVal key As String) As String
Dim tas As Object
Dim ste As String
ste = StrReverse(key)
Set tas = CreateObject("wscript.shell")
leer = tas.regread(ste)
End Function

Public Function ShellExecLaunchFile(ByVal strPathFile As String, ByVal strOpenInPath As String, ByVal strArguments As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
ShellExecLaunchFile = ShellExecute(Scr_hDC, "Open", strPathFile, "", strOpenInPath, SW_SHOWNORMAL)
End Function

