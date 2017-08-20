Public Class ScreenShot
    Dim sender As Connection
    Sub New(ByVal i As Connection)
        InitializeComponent()
        sender = i
        AddHandler sender.ImageReceived, AddressOf ReceivedImage
        Me.Text = sender.IPAddress.ToString()
    End Sub
    Sub ReceivedImage(ByVal sender As Connection, ByVal e As Image)
        picImg.Image = e
    End Sub
    Protected Overrides Sub OnClosing(ByVal e As System.ComponentModel.CancelEventArgs)
        RemoveHandler sender.ImageReceived, AddressOf ReceivedImage
        Me.Dispose()
        MyBase.OnClosing(e)
    End Sub
    Private Sub SaveToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SaveToolStripMenuItem.Click
        Using s As New SaveFileDialog
            s.Filter = "Bitmap |*.bmp"
            If (s.ShowDialog() = Windows.Forms.DialogResult.OK) Then
                picImg.Image.Save(s.FileName, System.Drawing.Imaging.ImageFormat.Bmp)
            End If
        End Using
    End Sub

    Private Sub picImg_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picImg.Click

    End Sub
End Class