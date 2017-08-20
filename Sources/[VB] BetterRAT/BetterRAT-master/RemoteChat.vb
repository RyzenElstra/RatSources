Public Class RemoteChat
    Public connected As Connection
    Public myname As String
    Private Sub RemoteChat_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        RichTextBox1.ReadOnly = True
        RichTextBox1.BackColor = Color.White
        connected.Send(New Encryption().AES_Encrypt("RemoteChatInitialize" & TextBox1.Text, Form1.enckey))
    End Sub
    Private Sub TextBox1_KeyDown(sender As Object, e As KeyEventArgs) Handles TextBox1.KeyDown
        If e.KeyCode = Keys.Enter Then
            Dim time As String = GetTime()
            connected.Send(New Encryption().AES_Encrypt("RemoteChat" & time & myname & vbCrLf & TextBox1.Text, Form1.enckey))
            RichTextBox1.AppendText(time & "Me" & vbCrLf)
            RichTextBox1.AppendText(TextBox1.Text & vbCrLf & vbCrLf)
            RichTextBox1.Find(time & "Me")
            RichTextBox1.SelectionColor = Color.Green
            TextBox1.Clear()
        End If
    End Sub
    Function GetTime()
        Return "[" & My.Computer.Clock.LocalTime.Hour & ":" & My.Computer.Clock.LocalTime.Minute & ":" & My.Computer.Clock.LocalTime.Second & "] - "
    End Function
End Class