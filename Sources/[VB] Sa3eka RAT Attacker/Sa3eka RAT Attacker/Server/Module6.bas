Attribute VB_Name = "Module3"
     Option Explicit
     Declare Function GetUsername Lib "advapi32.dll" Alias "GetUserNameA" _
     (ByVal lpBuffer As String, nSize As Long) As Long
     Sub Get_User_Name()
     Dim lpBuff As String * 25
     Dim ret As Long, UserName As String
     ret = GetUsername(lpBuff, 25)
     UserName = Left(lpBuff, InStr(lpBuff, Chr(0)) - 1)
     Form1.Text1.text = UserName
     End Sub

