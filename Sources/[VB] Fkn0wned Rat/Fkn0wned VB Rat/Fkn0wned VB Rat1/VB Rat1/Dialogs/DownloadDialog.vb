Public Class DownloadDialog
    Public Property Url As String
    Public Property ShowVisible As Boolean
    Public Property Filename As String
    Sub loaded() Handles Me.Load
        Dim boxes As New List(Of TextBox)
        Dim text As New List(Of String)
        boxes.AddRange(New TextBox() {txtUrl, txtFilename})
        Text.AddRange(New String() {"http://www.google.com/file.exe", "File.exe"})
        APIs.SetCueText(boxes, Text)
    End Sub
    Private Sub btnExecute_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExecute.Click

        Url = txtUrl.Text
        ShowVisible = cVisible.Checked
        Filename = txtFilename.Text
        txtUrl.Clear()
        Me.DialogResult = Windows.Forms.DialogResult.OK
        Me.Close()
    End Sub

    Private Sub txtUrl_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtUrl.TextChanged

    End Sub
End Class