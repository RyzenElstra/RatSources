Public Class SelectPorts

    Private Sub btnOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOK.Click
        Main.conPort = Integer.Parse(TextBox1.Text)
        Main.tranPort = Integer.Parse(TextBox2.Text)
        Main.Show()
        Me.Close()
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        End
    End Sub
End Class