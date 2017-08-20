Attribute VB_Name = "modMain"
Public Declare Function GetTickCount Lib "kernel32.dll" () As Long
Public Declare Sub GlobalMemoryStatus Lib "kernel32" (lpBuffer As MEMORYSTATUS)
Public Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
Const LOCALE_SYSTEM_DEFAULT As Long = &H400
Const LOCALE_SENGCOUNTRY = &H1002
Const BytesInMB = 1048576
Const sSplit = "#^#"

Private Type MEMORYSTATUS
dwLength As Long
dwMemoryLoad As Long
dwTotalPhys As Long
dwAvailPhys As Long
dwTotalPageFile As Long
dwAvailPageFile As Long
dwTotalVirtual As Long
dwAvailVirtual As Long
End Type

Public Function RAM() As String
Dim MemStat As MEMORYSTATUS
GlobalMemoryStatus MemStat
RAM = Round(MemStat.dwTotalPhys / BytesInMB, 0) & " MB"
End Function

Public Function GetCountry() As String
GetCountry = String$(256, Chr$(0))
GetCountry = Left$(GetCountry, GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SENGCOUNTRY, GetCountry, Len(GetCountry)) - 1)
End Function

Public Function GetPCUptime() As String
On Error Resume Next
GetPCUptime = GetTickCount / 3600000 Mod 24
End Function

'Public Function DaysUptime() As String
'On Error Resume Next
'    DaysUptime = ((GetTickCount / 1000) \ (24& * 3600&))
'End Function
