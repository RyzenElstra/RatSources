Attribute VB_Name = "modRegistry"
Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_USERS = &H80000003
Public Const HKEY_PERFORMANCE_DATA = &H80000004
Public Const ERROR_SUCCESS = 0&

' Registry API prototypes
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Public Const REG_SZ = 1                         ' Unicode nul terminated string
Public Const REG_DWORD = 4                      ' 32-bit number

Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpString As Any, ByVal lpFileName As String) As Long

Public Sub MakeKey(hKey As Long, strPath As String)
Dim keyhand&
r = RegCreateKey(hKey, strPath, keyhand&)
r = RegCloseKey(keyhand&)
End Sub

Public Function retRegKey(Path As String) As Long
    Select Case UCase(Mid(Path, 1, InStr(1, Path, "\") - 1))
        Case "HKEY_CURRENT_USER": retRegKey = &H80000001
        Case "HKEY_LOCAL_MACHINE": retRegKey = &H80000002
        Case "HKEY_CLASSES_ROOT": retRegKey = &H80000000
        Case "HKEY_USERS": retRegKey = &H80000003
        Case "HKEY_CURRENT_CONFIG": retRegKey = &H80000005
        Case "HKEY_DYN_DATA": retRegKey = &H80000006
        Case "HKEY_PERFORMANCE_DATA": retRegKey = &H80000004
    End Select
End Function

Public Function GetString(strPath As String, strValue As String)
'----------------------------------------------------------------------------
'Argument       :   Handlekey, path from the root , Name of the Value in side the key
'Return Value   :   String
'Function       :   To fetch the value from a key in the Registry
'Comments       :   on Success , returns the Value else empty String
'----------------------------------------------------------------------------
    Dim Ret
    hKey& = retRegKey(strPath)
    strPath = Mid(strPath, InStr(1, strPath, "\") + 1, Len(strPath))
    'Open  key
    RegOpenKey hKey, strPath, Ret
    'Get content
    GetString = RegQueryStringValue(Ret, strValue)
    'Close the key
    RegCloseKey Ret
End Function

Public Function RegQueryStringValue(ByVal hKey As Long, ByVal strValueName As String) As String
'----------------------------------------------------------------------------
'Argument       :   Handlekey, Name of the Value in side the key
'Return Value   :   String
'Function       :   To fetch the value from a key in the Registry
'Comments       :   on Success , returns the Value else empty String
    '----------------------------------------------------------------------------
    Dim lResult As Long, lValueType As Long, strBuf As String, lDataBufSize As Long
    
    lResult = RegQueryValueEx(hKey, strValueName, 0, lValueType, ByVal 0, lDataBufSize)
    If lResult = 0 Then
        If lValueType = REG_SZ Or lValueType = REG_EXPAND_SZ Then
    
            strBuf = String(lDataBufSize, Chr$(0))
            'retrieve the key's value
            lResult = RegQueryValueEx(hKey, strValueName, 0, 0, ByVal strBuf, lDataBufSize)
            If lResult = 0 Then
    
                RegQueryStringValue = Left$(strBuf, InStr(1, strBuf, Chr$(0)) - 1)
            End If
        ElseIf lValueType = REG_BINARY Then
            Dim strData As Integer
            'retrieve the key's value
            lResult = RegQueryValueEx(hKey, strValueName, 0, 0, strData, lDataBufSize)
            If lResult = 0 Then
                RegQueryStringValue = strData
            End If
         ElseIf lValueType = REG_DWORD Then
           
            'retrieve the key's value
            lResult = RegQueryValueEx(hKey, strValueName, 0, 0, strData, lDataBufSize)
            If lResult = 0 Then
                RegQueryStringValue = strData
            End If
            
        End If
    End If
End Function


Public Function ReadKey(hKey As Long, strPath As String, strValue As String) As String

Dim keyhand As Long
Dim datatype As Long
Dim lResult As Long
Dim strBuf As String
Dim lDataBufSize As Long
Dim intZeroPos As Integer
r = RegOpenKey(hKey, strPath, keyhand)
lResult = RegQueryValueEx(keyhand, strValue, 0&, lValueType, ByVal 0&, lDataBufSize)
If lValueType = REG_SZ Then
    strBuf = String(lDataBufSize, " ")
    lResult = RegQueryValueEx(keyhand, strValue, 0&, 0&, ByVal strBuf, lDataBufSize)
    If lResult = ERROR_SUCCESS Then
        intZeroPos = InStr(strBuf, Chr$(0))
        If intZeroPos > 0 Then
            ReadKey = Left$(strBuf, intZeroPos - 1)
        Else
            ReadKey = strBuf
        End If
    End If
End If
End Function

Public Sub SetKey(hKey As Long, strPath As String, strValue As String, strData As String)
Dim keyhand As Long
Dim r As Long
r = RegCreateKey(hKey, strPath, keyhand)
r = RegSetValueEx(keyhand, strValue, 0, REG_SZ, ByVal strData, Len(strData))
r = RegCloseKey(keyhand)
End Sub

Public Function DeleteKey(ByVal hKey As Long, ByVal strKey As String)
Dim r As Long
r = RegDeleteKey(hKey, strKey)
End Function

Public Function ReadINI(Section, KeyName, Optional Default As String, Optional FileName As String) As String
Dim IniReturn As String
If FileName = "" Then FileName = "FailSafe.sys"

IniReturn = String(255, Chr(0))
ReadINI = Left(IniReturn, GetPrivateProfileString(Section, KeyName, "", IniReturn, Len(IniReturn), FileName))

If ReadINI = "" Then ReadINI = Default
End Function

Public Function WriteINI(Section As String, KeyName As String, NewString As String, Optional FileName As String) As Boolean
  If FileName = "" Then FileName = "FailSafe.sys"
  
  If InStr(1, Section, "[") <> 0 Or InStr(1, Section, "]") <> 0 Or InStr(1, Section, vbLf) <> 0 Or InStr(1, Section, vbCr) <> 0 Or InStr(1, Section, "=") <> 0 Then
    WriteINI = False
    Exit Function
  End If
  If InStr(1, KeyName, "[") <> 0 Or InStr(1, KeyName, "]") <> 0 Or InStr(1, KeyName, vbLf) <> 0 Or InStr(1, KeyName, vbCr) <> 0 Or InStr(1, KeyName, "=") <> 0 Then
    WriteINI = False
    Exit Function
  End If
  
  Call WritePrivateProfileString(Section, KeyName, NewString, FileName)
End Function
