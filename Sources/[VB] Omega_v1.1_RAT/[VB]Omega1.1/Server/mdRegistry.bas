Attribute VB_Name = "mdRegistry"
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


