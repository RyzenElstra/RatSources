Imports System.IO
Public Class InfoReader
    Dim ms As MemoryStream
    Dim sr As StreamReader
    Dim lines As New List(Of String)
    Sub New(ByVal bytes() As Byte, ByVal password() As Byte)
        Dim b() As Byte
        b = Encryption.rc4(bytes, password)
        ms = New MemoryStream(bytes)
        sr = New StreamReader(ms)
        Dim lines() As String = sr.ReadToEnd().Split(Environment.NewLine.ToCharArray())
        For Each l As String In lines
            If Not (String.IsNullOrEmpty(l)) Then
                Me.lines.Add(l)
            End If
        Next
        sr.Close()
        ms.Close()
        sr.Dispose()
        ms.Dispose()
    End Sub
    Public Function ReadLine(ByVal line As Integer) As String
        Return lines(line)
    End Function
End Class
