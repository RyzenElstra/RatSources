Attribute VB_Name = "Module2"
Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Public Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long



Public Function ShellExecLaunchFile(ByVal strPathFile As String, ByVal strOpenInPath As String, ByVal strArguments As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
ShellExecLaunchFile = ShellExecute(Scr_hDC, "Open", strPathFile, "", strOpenInPath, SW_SHOWNORMAL)
End Function

