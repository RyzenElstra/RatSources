Attribute VB_Name = "mdKILL"
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Const MAX_PATH = 260

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Function GetShortPathName Lib "kernel32" Alias _
"GetShortPathNameA" (ByVal lpszLongPath As String, ByVal _
lpszShortPath As String, ByVal lBuffer As Long) As Long

Declare Function CreateToolhelp32Snapshot& Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long)
Declare Function Process32First& Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32)
Declare Function Process32Next& Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32)
Declare Function GetFileTitle% Lib "comdlg32" Alias "GetFileTitleA" (ByVal lpszFile As String, ByVal lpszTitle As String, ByVal cbBuf As Integer)
Declare Function DestroyWindow& Lib "USER32" (ByVal hwnd As Long)
Declare Function GetPriorityClass& Lib "kernel32" (ByVal hProcess As Long)
Declare Function SetPriorityClass& Lib "kernel32" (ByVal hProcess As Long, ByVal dwPriorityClass As Long)
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Declare Function TerminateProcess& Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long)
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long

Public Type PROCESSENTRY32
 dwSize As Long
 cntUsage As Long
 th32ProcessID As Long
 th32DefaultHeapID As Long
 th32ModuleID As Long
 cntThreads As Long
 th32ParentProcessID As Long
 pcPriClassBase As Long
 dwFlags As Long
 szExeFile As String * 260
End Type

Public Const TH32CS_SNAPPROCESS = 2
Public Const STILL_ACTIVE As Long = &H103
Public Const PROCESS_ALL_ACCESS As Long = &H1F0FFF

Function Get_WinPath() As String
   Dim rtn
   Dim Buffer As String 'declare the needed variables
   Buffer = Space(MAX_PATH)
   rtn = GetWindowsDirectory(Buffer, Len(Buffer)) 'get the path
   Get_WinPath = Left(Buffer, rtn) 'parse the path to the global string
   If Right(Get_WinPath, 1) <> "\" Then
      Get_WinPath = Get_WinPath & "\"
   End If
End Function

Function Get_SysPath() As String
   Dim rtn
   Dim Buffer As String 'declare the needed variables
   Buffer = Space(MAX_PATH)
   rtn = GetSystemDirectory(Buffer, Len(Buffer)) 'get the path
   Get_SysPath = Left(Buffer, rtn) 'parse the path into the global string
   If Right(Get_SysPath, 1) <> "\" Then
      Get_SysPath = Get_SysPath & "\"
   End If
End Function

Function FileExists(ByVal strPathName As String) As Boolean
On Error GoTo errHandle
    Open strPathName For Input As #1
    Close #1
    FileExists = True
    Exit Function
errHandle:
FileExists = False
End Function

Public Function GetShortPath(strFileName As String) As String
Dim lngRes As Long
Dim strPath As String

strPath = String$(165, 0)
lngRes = GetShortPathName(strFileName, strPath, 164)
GetShortPath = Left$(strPath, lngRes)

End Function
