Attribute VB_Name = "Module4"
Public Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Public Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Public Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long

Const HKEY_LOCAL_MACHINE = &H80000002
Const KEY_ALL_ACCESS = &H3F
Const REG_SZ = 1&

Public Function IsInAnubis() As Boolean
Dim hKey As Long, hOpen As Long, hQuery As Long
Dim szBuffer As String * 128
hOpen = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion", 0, KEY_ALL_ACCESS, hKey)
If hOpen = 0 Then
    hQuery = RegQueryValueEx(hKey, "ProductId", 0, REG_SZ, szBuffer, 128)
    If hQuery = 0 Then
        If InStr(1, szBuffer, "76487-337-8429955-22614") > 0 Then
            IsInAnubis = True
        End If
    End If
End If
RegCloseKey (hKey)
End Function


Public Sub anubisDetect()
If IsInAnubis = True Then
'MsgBox "Is in Anubis"
End
Else

'MsgBox "Not in Anubis"
End If

End Sub

