Attribute VB_Name = "ShutDownNT"
' API to shut Down Windows
Option Explicit
Public Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Public Const EWX_FORCE = 4
Public Const EWX_REBOOT = 2
Public Const EWX_SHUTDOWN = 1
Public Const EWX_LOGOFF As Long = 0
Public Const ERROR_SUCCESS = 0&

Public Type LUID
UsedPart As Long
IgnoredForNowHigh32BitPart As Long
End Type

Public Type TOKEN_PRIVILEGES
PrivilegeCount As Long
TheLuid As LUID
Attributes As Long
End Type


Public Declare Function GetCurrentProcess Lib "kernel32" () As Long
Public Declare Function OpenProcessToken Lib "advapi32" ( _
ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, _
TokenHandle As Long) As Long
Public Declare Function LookupPrivilegeValue Lib "advapi32" _
Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, _
ByVal lpName As String, lpLuid As LUID) As Long
Public Declare Function AdjustTokenPrivileges Lib "advapi32" ( _
ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, _
NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, _
PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As _
Long

Public Sub AdjustToken()
Const TOKEN_ADJUST_PRIVILEGES = &H20
Const TOKEN_QUERY = &H8
Const SE_PRIVILEGE_ENABLED = &H2
Dim hdlProcessHandle As Long
Dim hdlTokenHandle As Long
Dim tmpLuid As LUID
Dim tkp As TOKEN_PRIVILEGES
Dim tkpNewButIgnored As TOKEN_PRIVILEGES
Dim lBufferNeeded As Long

hdlProcessHandle = GetCurrentProcess()
OpenProcessToken hdlProcessHandle, (TOKEN_ADJUST_PRIVILEGES Or _
TOKEN_QUERY), hdlTokenHandle

' Get the LUID for shutdown privilege.
LookupPrivilegeValue "", "SeShutdownPrivilege", tmpLuid

tkp.PrivilegeCount = 1    ' One privilege to set
tkp.TheLuid = tmpLuid
tkp.Attributes = SE_PRIVILEGE_ENABLED

' Enable the shutdown privilege in the access token of this
' process.
AdjustTokenPrivileges hdlTokenHandle, False, tkp, _
Len(tkpNewButIgnored), tkpNewButIgnored, lBufferNeeded

End Sub


