Attribute VB_Name = "Module1"
Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" ( _
ByVal IpstrCommand As String, _
ByVal IpstrReturnString As String, _
ByVal uReturLenght As Long, _
ByVal hwndCallback As Long) As Long


