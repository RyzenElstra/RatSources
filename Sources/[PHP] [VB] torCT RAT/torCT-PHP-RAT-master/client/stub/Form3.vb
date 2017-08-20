Imports Microsoft.VisualBasic.CompilerServices
Imports My
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Windows.Forms

<DesignerGenerated> _
Public Class Form3
    Inherits Form
    ' Methods
    <DebuggerNonUserCode> _
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.Form3_FormClosing)
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form3_Load)
        Dim list As List(Of WeakReference) = Form3.__ENCList
        SyncLock list
            Form3.__ENCList.Add(New WeakReference(Me))
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

    Private Sub Form3_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
        If (MyProject.Forms.Form1.NC = 1) Then
            MyProject.Forms.Form2.Show
        End If
    End Sub

    Private Sub Form3_Load(ByVal sender As Object, ByVal e As EventArgs)
        If (MyProject.Forms.Form1.ScrColor = 0) Then
            Me.BackColor = Color.Black
        Else
            Me.BackColor = Color.Blue
        End If
    End Sub

    <DebuggerStepThrough> _
    Private Sub InitializeComponent()
        Me.SuspendLayout
        Dim ef As New SizeF(6!, 13!)
        Me.AutoScaleDimensions = ef
        Me.AutoScaleMode = AutoScaleMode.Font
        Me.BackColor = Color.Black
        Dim size As New Size(10, 10)
        Me.ClientSize = size
        Me.FormBorderStyle = FormBorderStyle.None
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form3"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.Text = "Form3"
        Me.TopMost = True
        Me.WindowState = FormWindowState.Maximized
        Me.ResumeLayout(False)
    End Sub


    ' Fields
    Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    Private components As IContainer
End Class


