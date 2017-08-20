Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class up
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.up_FormClosing)
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.up_Load)
        Me.os = 0
        Me.InitializeComponent()
    End Sub
    Public c As Client
    Public FNNN As String
    Public FS As FileStream
    Public os As Integer
    Public sk As Client
    Public SZ As Integer
    Public TMP As String

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

    Private Sub up_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        Try
            Me.FS.Close()
            Me.FS.Dispose()
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub up_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FS = New FileStream(Me.TMP, FileMode.Open)
        Me.Lv1.Items.Item(0).SubItems.Item(1).Text = New FileInfo(Me.TMP).Name
        Me.Lv1.Items.Item(1).SubItems.Item(1).Text = FN.Siz(CLng(Me.SZ))
        Me.Lv1.Items.Item(2).SubItems.Item(1).Text = FN.Siz(0)
        Me.Lv1.Items.Item(3).SubItems.Item(1).Text = FN.Siz(0)
        Me.ProgressBar1.Maximum = Me.SZ
        Me.c.Send(String.Concat(New String() {"up", ind.Y, Me.c.ip, ind.Y, FN.ENB(Me.FNNN), ind.Y, Conversions.ToString(Me.SZ)}))
        Me.Lv1.FX()
        Me.Timer1.Enabled = True
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.Close()
    End Sub
End Class