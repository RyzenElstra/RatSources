Public Class frmConnected
    Public dismiss As Integer = 5
    Public client As String = "PC\User"
    Public ip As String = "127.0.0.1"
    Public socket As String = "777"
    Public country As String = "Reserved"
    Public namer As String

    Private Sub frmConnected_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        fade_out()
    End Sub
    Private Sub frmConnected_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        namer = "Control: [" & ip & "] - Socket [" & socket & "]"
        Label1.Text = "New client '" & client & "' connected"
        Label2.Text = "From: " & ip & " in " & country
        Me.Location = New Point(Screen.PrimaryScreen.WorkingArea.Width - Me.Width, Screen.PrimaryScreen.WorkingArea.Height - Me.Height)
        fade_in()
        dismiss = 5
        tmrDismiss.Enabled = True
    End Sub

    Private Sub tmrDismiss_Tick(sender As Object, e As EventArgs) Handles tmrDismiss.Tick
        dismiss -= 1
        btnDismiss.Text = "Dismiss (" & dismiss & ")"
        If dismiss = 0 Then
            Me.Close()
            tmrDismiss.Enabled = False
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles btnDismiss.Click
        Me.Close()
    End Sub

    Public Sub fade_in()
        For FadeIn = 0.0 To 1.1 Step 0.1
            Me.Opacity = FadeIn
            Me.Refresh()
            Threading.Thread.Sleep(25)
        Next
    End Sub
    Public Sub fade_out()
        For FadeOut = 90 To 10 Step -10
            Me.Opacity = FadeOut / 100
            Me.Refresh()
            Threading.Thread.Sleep(25)
        Next
    End Sub

    Private Sub btnSelect_Click(sender As Object, e As EventArgs) Handles btnSelect.Click
        Try
            frmMain.frm.Add(ip & ":" & socket, New x(namer, ip & ":" & socket))
            frmMain.frm(ip & ":" & socket).Show()
        Catch
            frmMain.frm(ip & ":" & socket).Focus()
        End Try
        Me.Close()
    End Sub
End Class