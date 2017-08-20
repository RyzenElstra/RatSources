Imports System.Threading

Public Class nt

    Public colms As String() = {"IP : ", "PC : ", "USR: ", "OS : ", "CO : "}
    Public mg As Bitmap
    Private sz As Size = Me.Size
    Public time As Integer = &H4D

    Public Sub Add(ByVal flg As Bitmap, ByVal title As String, ByVal ParamArray texte As String())
        Dim nt As nt = Me
        SyncLock nt
            Dim image As New Bitmap(P1.Width, P1.Height)
            Dim graphics As Graphics = graphics.FromImage(image)
            Dim s As String = ""
            Dim num2 As Integer = (colms.Length - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                s = (s & colms(i) & texte(i) & ChrW(13) & ChrW(10))
                i += 1
            Loop
            graphics.DrawString(s, Font, Brushes.Red, CSng(0.0!), CSng(0.0!))
            graphics.Dispose()
            mg = flg
            Label1.Text = title
            P1.Image = image
            time = 0
            Thread.Sleep(200)
        End SyncLock
    End Sub

    Private Sub nt_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs) Handles Me.FormClosing
        e.Cancel = True
    End Sub

    Private Sub nt_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        Me.Visible = False
    End Sub

    Private Sub Label1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Label1.Click
        Me.time = &H4D
    End Sub

    Private Sub Label1_Paint(ByVal sender As Object, ByVal e As PaintEventArgs) Handles Label1.Paint
        If (Not mg Is Nothing) Then
            e.Graphics.DrawImage(mg.GetThumbnailImage((Label1.Height * 2), Label1.Height, Nothing, IntPtr.Zero), 0, 0)
        End If
    End Sub

    Private Sub P1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles P1.Click
        time = &H4D
    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs) Handles Timer1.Tick
        If (time > 70) Then
            Me.Visible = False
        Else
            Me.time += 1
            If Not Me.Visible Then
                FN.ShowWindow(Me.Handle, 4)
                Me.Left = ((Screen.PrimaryScreen.WorkingArea.Width - Me.Width) - 5)
                Me.Top = ((Screen.PrimaryScreen.WorkingArea.Height - Me.Height) - 5)
            End If
        End If
    End Sub
End Class