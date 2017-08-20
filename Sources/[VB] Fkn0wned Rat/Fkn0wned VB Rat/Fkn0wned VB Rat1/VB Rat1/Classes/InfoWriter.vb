Imports System.IO
Public Class InfoWriter
    Dim ms As MemoryStream
    Dim sr As StreamWriter
    Sub New(ByVal cap As Integer)
        ms = New MemoryStream(cap)
        sr = New StreamWriter(ms)
    End Sub
    Sub New()
        ms = New MemoryStream()
        sr = New StreamWriter(ms)
    End Sub
    Public Sub WriteLine(ByVal str As String)
        sr.WriteLine(str)
    End Sub
    Public Function GetBytes(ByVal password() As Byte) As Byte()
        sr.Close()
        Dim b() As Byte = ms.ToArray()
        ms.Close()
        ms.Dispose()
        sr.Dispose()
        Return Encryption.rc4(b, password)
    End Function
End Class
