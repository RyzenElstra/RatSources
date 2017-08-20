Attribute VB_Name = "mdFileDate"
'api to open a file
Public Declare Function OpenFile Lib "kernel32" (ByVal lpFileName As String, lpReOpenBuff As OFSTRUCT, ByVal wStyle As Long) As Long

'api to close a handle
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

'api to read the file date/time stamp
Public Declare Function GetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long

'api to set the file date/time stamp
Public Declare Function SetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long

'api to convert a UTC time file to local time file
Public Declare Function FileTimeToLocalFileTime Lib "kernel32" (lpFileTime As FILETIME, lpLocalFileTime As FILETIME) As Long

'api to convert a local time to a UTC time
Public Declare Function LocalFileTimeToFileTime Lib "kernel32" (lpLocalFileTime As FILETIME, lpFileTime As FILETIME) As Long

'api to convert a file time to a system time
Public Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIME, lpSystemTime As SYSTEMTIME) As Long

'api to convert a system time to a file time
Public Declare Function SystemTimeToFileTime Lib "kernel32" (lpSystemTime As SYSTEMTIME, lpFileTime As FILETIME) As Long

'constants
Public Const OF_READWRITE = &H2
Public Const HFILE_ERROR = &HFFFF
Public Const OFS_MAXPATHNAME = 128

'api needed types
Public Type OFSTRUCT
       cBytes As Byte
       fFixedDisk As Byte
       nErrCode As Integer
       Reserved1 As Integer
       Reserved2 As Integer
       szPathName(OFS_MAXPATHNAME) As Byte
End Type

Public Type FILETIME
       dwLowDateTime As Long
       dwHighDateTime As Long
End Type

Public Type SYSTEMTIME
       wYear As Integer
       wMonth As Integer
       wDayOfWeek As Integer
       wDay As Integer
       wHour As Integer
       wMinute As Integer
       wSecond As Integer
       wMilliseconds As Integer
End Type

'globals
Global FileInfoStruct As OFSTRUCT
Global CreateTime As FILETIME
Global LastAccessTime As FILETIME
Global LastWriteTime As FILETIME
Global hFile As Long
Global SysTime As SYSTEMTIME

Public Function SysTime_To_String(sTime As SYSTEMTIME) As String
  'this converts a system time to a string
  SysTime_To_String = sTime.wHour & ":" & sTime.wMinute & ":" & sTime.wSecond & "." & sTime.wMilliseconds
End Function

Public Function SysDate_To_String(sTime As SYSTEMTIME) As String
  'this converts a system time to a string
  SysDate_To_String = Format(sTime.wDay, "00") & "/" & Format(sTime.wMonth, "00") & "/" & sTime.wYear
End Function

Public Function String_To_SysDateTime(strDate As String, strTime As String) As SYSTEMTIME
  'this puts the text into a systemtime variable
  If Len(strDate) = 10 Then
     String_To_SysDateTime.wDay = Mid(strDate, 1, 2)
     String_To_SysDateTime.wMonth = Mid(strDate, 4, 2)
     String_To_SysDateTime.wYear = Mid(strDate, 7, 4)
  End If
     
  If Len(strTime) = 12 Then
     String_To_SysDateTime.wHour = Mid(strTime, 1, 2)
     String_To_SysDateTime.wMinute = Mid(strTime, 4, 2)
     String_To_SysDateTime.wSecond = Mid(strTime, 7, 2)
     String_To_SysDateTime.wMilliseconds = Mid(strTime, 10, 3)
  End If
End Function
