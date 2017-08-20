Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Public Class DW
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.DW_FormClosing)
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.DW_Load)
        Me.os = 0
        Me.InitializeComponent()
    End Sub
    Public c As Client
    Public FNNNN As String
    Public folder As String
    Public FS As FileStream
    Public os As New Integer
    Public osk As Client
    Public SZ As Integer
    Public tmp As String

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Try
            Me.Lv1.Items.Item(2).SubItems.Item(1).Text = FN.Siz(CLng((Me.ProgressBar1.Value - Me.os)))
            Me.os = Me.ProgressBar1.Value
            Me.Lv1.Items.Item(3).SubItems.Item(1).Text = FN.Siz(CLng(Me.ProgressBar1.Value))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub DW_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        Try
            Me.FS.Close()
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
        Try
            Me.FS.Dispose()
        Catch exception4 As Exception
            ProjectData.SetProjectError(exception4)
            Dim exception2 As Exception = exception4
            ProjectData.ClearProjectError()
        End Try
        Try
            File.Delete(Me.tmp)
        Catch exception5 As Exception
            ProjectData.SetProjectError(exception5)
            Dim exception3 As Exception = exception5
            ProjectData.ClearProjectError()
        End Try
        Me.Button1.Enabled = False
        Me.c.CN = False
    End Sub

    Private Sub DW_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.Text = FN.DEB(Me.FNNNN)
        Me.ProgressBar1.Maximum = Me.SZ
        Dim fm As FM = DirectCast(ind.Gform(("fm" & Me.osk.ip)), FM)
        Me.folder = (Me.osk.Folder & "Downloads\")
        If Not Directory.Exists(Me.folder) Then
            Directory.CreateDirectory(Me.folder)
        End If
        Me.folder = (Me.folder & New FileInfo(FN.DEB(Me.FNNNN)).Name)
        Me.Lv1.Items.Item(0).SubItems.Item(1).Text = New FileInfo(FN.DEB(Me.FNNNN)).Name
        Me.Lv1.Items.Item(1).SubItems.Item(1).Text = FN.Siz(CLng(Me.SZ))
        Do
            Me.tmp = (Interaction.Environ("temp") & "\njfm_" & FN.RN(10))
        Loop While File.Exists(Me.tmp)
        Me.FS = New FileStream(Me.tmp, FileMode.Append)
        Me.Lv1.Items.Item(2).SubItems.Item(1).Text = FN.Siz(CLng((Me.ProgressBar1.Value - Me.os)))
        Me.os = Me.ProgressBar1.Value
        Me.Lv1.Items.Item(3).SubItems.Item(1).Text = FN.Siz(CLng(Me.ProgressBar1.Value))
        Me.Lv1.FX()
        Me.Timer1.Enabled = True
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Me.Button1.Text = "Stop") Then
            Me.FS.Close()
            Me.FS.Dispose()
            File.Delete(Me.tmp)
            Me.Button1.Enabled = False
            Me.c.CN = False
            Me.Close()
        Else
            Me.FS.Close()
            Me.FS.Dispose()
            File.Move(Me.tmp, Me.folder)
        End If
    End Sub
End Class