Attribute VB_Name = "Module1"
Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_USERS = &H80000003
Public Const HKEY_PERFORMANCE_DATA = &H80000004

Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Declare Function RegQueryValue Lib "advapi32.dll" Alias "RegQueryValueA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal lpValue As String, lpcbValue As Long) As Long
Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Declare Function RegSetValue Lib "advapi32.dll" Alias "RegSetValueA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
    
    Const key_all_access = &HF003F
    Const HKEY_DYN_DATA = &H80000006
    Const REG_BINARY = 3
    Const REG_DWORD = 4
    Const REG_DWORD_BIG_ENDIAN = 5
    Const REG_DWORD_LITTLE_ENDIAN = 4
    Const REG_EXPAND_SZ = 2
    Const REG_LINK = 6
    Const REG_MULTI_SZ = 7
    Const REG_NONE = 0
    Const REG_RESOURCE_LIST = 8
    Const REG_SZ = 1
    
Public Const WinInfo = "Software\Microsoft\Windows\CurrentVersion"
Public Const WinInfoNT = "Software\Microsoft\Windows NT\CurrentVersion"

Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Const MAX_PATH = 260

Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Private Declare Function WritePrivateProfileString Lib "kernel32" _
Alias "WritePrivateProfileStringA" (ByVal lpApplicationname As String, _
ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Public Declare Function FindWindow Lib "USER32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

Public Declare Function PostMessage Lib "USER32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Const WM_CLOSE = &H10

Declare Function CreateToolhelp32Snapshot& Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long)
Declare Function Process32First& Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32)
Declare Function Process32Next& Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32)
Declare Function GetFileTitle% Lib "comdlg32" Alias "GetFileTitleA" (ByVal lpszFile As String, ByVal lpszTitle As String, ByVal cbBuf As Integer)
Declare Function DestroyWindow& Lib "USER32" (ByVal hwnd As Long)
Declare Function GetPriorityClass& Lib "kernel32" (ByVal hProcess As Long)
Declare Function SetPriorityClass& Lib "kernel32" (ByVal hProcess As Long, ByVal dwPriorityClass As Long)
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Declare Sub CloseHandle Lib "kernel32" (ByVal hPass As Long)
Declare Function TerminateProcess& Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long)

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

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Function GetWindows() As Boolean 'Get is NT or not
Dim a, vKey As String
a = GetStringKey(HKEY_LOCAL_MACHINE, WinInfoNT, vKey)
If vKey <> "" Then
   GetWindows = False 'is Windows NT
Else
   GetWindows = True 'is Windows
End If
End Function

Function RegQueryStringValue(ByVal hKey As Long, ByVal strValueName As String)
    Dim lResult As Long
    Dim lValueType As Long
    Dim strBuf As String
    Dim lDataBufSize As Long
    Dim intZeroPos As Integer
    
    lResult = RegQueryValueEx(hKey, strValueName, 0&, lValueType, ByVal 0&, lDataBufSize)
    If lResult = ERROR_SUCCESS Then
        If lValueType = REG_SZ Then
            strBuf = String(lDataBufSize, " ")
            lResult = RegQueryValueEx(hKey, strValueName, 0&, 0&, ByVal strBuf, lDataBufSize)
            If lResult = ERROR_SUCCESS Then
                intZeroPos = InStr(strBuf, Chr$(0))
                If intZeroPos > 0 Then
                   RegQueryStringValue = Left$(strBuf, intZeroPos - 1)
                Else
                   RegQueryStringValue = strBuf
                End If
            End If
        End If
    End If
End Function

Public Function GetStringKey(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String) As String
    Dim keyhand&
    Dim datatype&
    r = RegOpenKey(hKey, strPath, keyhand&)
    GetStringKey = RegQueryStringValue(keyhand&, strValue)
    r = RegCloseKey(keyhand&)
End Function

Public Sub SetStringKey(ByVal hKey As Long, ByVal strPath As String, Optional ByVal strValue As String = "", Optional ByVal strdata As String = "")
    Dim keyhand&
    r = RegCreateKey(hKey, strPath, keyhand&)
    r = RegSetValueEx(keyhand&, strValue, 0, REG_SZ, ByVal strdata, Len(strdata))
    r = RegCloseKey(keyhand&)
End Sub

Public Sub DeleteStringKey(ByVal hKey As Long, ByVal strPath As String, ByVal sKey As String)
    Dim keyhand&
    r = RegOpenKey(hKey, strPath, keyhand&)
    r = RegDeleteValue(keyhand&, sKey)
    r = RegCloseKey(hKey)
End Sub

Function Get_WinPath() As String
   Dim rtn
   Dim buffer As String 'declare the needed variables
   buffer = Space(MAX_PATH)
   rtn = GetWindowsDirectory(buffer, Len(buffer))  'get the path
   Get_WinPath = Left(buffer, rtn) 'parse the path to the global string
   If Right(Get_WinPath, 1) <> "\" Then
      Get_WinPath = Get_WinPath & "\"
   End If
End Function

Function Get_SysPath() As String
   Dim rtn
   Dim buffer As String 'declare the needed variables
   buffer = Space(MAX_PATH)
   rtn = GetSystemDirectory(buffer, Len(buffer)) 'get the path
   Get_SysPath = Left(buffer, rtn) 'parse the path into the global string
   If Right(Get_SysPath, 1) <> "\" Then
      Get_SysPath = Get_SysPath & "\"
   End If
End Function

Public Sub SaveProfile(AppName As String, KeyName As String, Values As String, FileName As String)
 Dim lpAppName As String, lpKeyName As String, lpValues As String, lpFileName As String
 
 lpAppName = AppName
 lpKeyName = KeyName
 lpValues = Values
 lpFileName = FileName
 
 Call WritePrivateProfileString(lpAppName, lpKeyName, lpValues, lpFileName)
 
End Sub

Function FileExists(ByVal strPathName As String) As Boolean
On Error GoTo errHandle
    Open strPathName For Input As #1
    Close #1
    FileExists = True
    Exit Function
errHandle:
FileExists = False
End Function
