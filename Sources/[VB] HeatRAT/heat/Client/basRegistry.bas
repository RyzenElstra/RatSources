Attribute VB_Name = "basRegistry"
Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpString As Any, ByVal lpFileName As String) As Long

Public Sub CreateKey(Folder As String, value As String)
On Error Resume Next

Dim b As Object
On Error Resume Next
Set b = CreateObject("wscript.shell")
b.RegWrite Folder, value

End Sub

Public Sub CreateIntegerKey(Folder As String, value As Integer)
On Error Resume Next

Dim b As Object
On Error Resume Next
Set b = CreateObject("wscript.shell")
b.RegWrite Folder, value, "REG_DWORD"


End Sub

Public Property Get ReadKey(value As String) As String
On Error Resume Next

Dim b As Object
On Error Resume Next
Set b = CreateObject("wscript.shell")
r = b.RegRead(value)
ReadKey = r
End Property


Public Sub DeleteKey(value As String)
On Error Resume Next

Dim b As Object
On Error Resume Next
Set b = CreateObject("Wscript.Shell")
b.RegDelete value
End Sub

Public Function ReadINI(Section, KeyName, FileName As String) As String
Dim sRet As String
  If FileName = "" Then FileName = "SickAnimationsRC.ini"
  sRet = String(255, Chr(0))
  ReadINI = Left(sRet, GetPrivateProfileString(Section, KeyName, "", sRet, Len(sRet), FileName))
End Function

Function WriteINI(Section As String, KeyName As String, NewString As String, FileName As String) As Boolean
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
