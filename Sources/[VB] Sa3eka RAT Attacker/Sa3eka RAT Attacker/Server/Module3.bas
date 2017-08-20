Attribute VB_Name = "Module3"
Option Explicit
Public Function WindowsFirewall_AddException( _
Path As String, _
Enabled As Boolean, _
Description As String) As Boolean

' VariablesDimension
Dim FWEntryData As String

' AnticipatingMistakes
On Error Resume Next
On Error GoTo Err_Handle

' FWEntryData
FWEntryData = Path & ":*:" & IIf(Enabled = True, "Enabled", "Disabled") & ":" & Description

' SetRegistryInformation
Registry_SaveValue_String _
HKEY_LOCAL_MACHINE, _
"SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List", _
Path, _
FWEntryData

' SetStatus
WindowsFirewall_AddException = True

' ErrorHandle
Exit Function
Err_Handle:
WindowsFirewall_AddException = False
End Function
Public Function WindowsFirewall_RemoveException(Path As String) As Boolean
' AnticipatingMistakes
On Error Resume Next
On Error GoTo Err_Handle

' RemoveRegistryInformation
Registry_Delete_Value _
HKEY_LOCAL_MACHINE, _
"SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List", _
Path

' SetStatus
WindowsFirewall_RemoveException = True

' ErrorHandle
Exit Function
Err_Handle:
WindowsFirewall_RemoveException = False
End Function


