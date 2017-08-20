Public Class Thumbnails
    Public curntthumb As Integer = 0
    Dim thumbs(Form1.ListView1.Items.Count) As ThumbNail
    Function CheckX(ByVal input As Integer)
        If input Mod 3 = 2 Then
            Return 274 * 2 + 5
        ElseIf input Mod 3 = 1 Then
            Return 274 * 1 + 3
        Else
            Return 1
        End If
    End Function
    Function CheckY(ByVal input As Integer)
        If input <= 2 Then
            Return 1
        Else
            Dim i As Integer = Fix(input / 3)
            Return 190 * i + 3 + 2 * (i - 1)
        End If
    End Function
    Private Sub Thumbnails_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Form1.SendToAll(New Encryption().AES_Encrypt("GetThumbNails", Form1.enckey))
    End Sub
    Public Sub AddThumbNail(ByVal ip As String, ByVal img As String)
        thumbs(curntthumb) = New ThumbNail
        With thumbs(curntthumb)
            .caption = ip
            .Image = Form1.ByteArray2Image(Convert.FromBase64String(img))
            .LocationX = CheckX(curntthumb)
            .LocationY = CheckY(curntthumb)
            .NewThumbnail()
        End With
        curntthumb += 1
    End Sub
    Private Sub VScrollBar1_Scroll(sender As Object, e As ScrollEventArgs)

    End Sub
End Class