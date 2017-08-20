Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Public Class logs

    Public Sub Append(ByVal T As String)
        If (Me.lgs.TextLength > &H9C40) Then
            Try
                Me.lgs.Text = Me.lgs.Text.Remove(0, &H4E20)
            Catch exception1 As Exception
            End Try
        End If
        Me.lgs.AppendText((T & ChrW(13) & ChrW(10)))
        Me.lgs.SelectionStart = (Me.lgs.TextLength - 1)
        Me.lgs.ScrollToCaret()
    End Sub

    Private Sub Label4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Label4.Click
        ind.SNT = 0
        ind.RC = 0
    End Sub

    Private Sub Label6_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Label6.Click
        ind.SNT = 0
        ind.RC = 0
    End Sub

    Private Sub Lgs_Resize(ByVal sender As Object, ByVal e As EventArgs) Handles lgs.Resize
        Try
            Me.lgs.ScrollToCaret()
        Catch exception1 As Exception
        End Try
    End Sub

    Private Sub Lgs_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles lgs.TextChanged
    End Sub

    Private Sub Logs_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        Control.CheckForIllegalCrossThreadCalls = False
    End Sub


    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs) Handles Timer1.Tick
        Me.Timer1.Enabled = False
        If (ind.LG.Count > 0) Then
            Me.Append(ind.LG.Item(0))
            ind.LG.RemoveAt(0)
        End If
        Dim count As Integer = ind.F.L1.Items.Count
        Me.USB.Text = Convert.ToString(ind.usb.Count)
        Me.cn.Text = Convert.ToString(ind.W.Online2.Count)
        Me.snt.Text = FN.Siz(CLng(ind.SNT))
        Me.rc.Text = FN.Siz(CLng(ind.RC))
        ind.F.Text = String.Concat(New String() {"[ ", Convert.ToString(ind.F.port), " ] ", ind.vr, " Online[ ", Convert.ToString(ind.F.L1.Items.Count), " ]"})
        Me.Timer1.Enabled = True
    End Sub

End Class
