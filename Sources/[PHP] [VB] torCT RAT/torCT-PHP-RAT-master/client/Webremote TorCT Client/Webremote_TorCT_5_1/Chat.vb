Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports Webremote_TorCT_5_1.My

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class Chat
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.Chat_Load)
            AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.Chat_FormClosing)
            Dim list As List(Of WeakReference) = Chat.__ENCList
            SyncLock list
                Chat.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.SendChat = New WebClient
            Me.GetChat = New WebClient
            Me.a = ""
            Me.b = ""
            Me.InitializeComponent
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.TextBox2.Text = (Me.TextBox2.Text & ChrW(13) & ChrW(10) & "[]")
            Me.SendChat.DownloadString((MyProject.Forms.Client.HostName.ToString & "/Chat.php?c=Anonymous : " & Me.TextBox2.Text))
            Me.TextBox2.Clear
        End Sub

        Private Sub Chat_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
            Me.GetChat.DownloadString((MyProject.Forms.Client.HostName.ToString & "/Chat.php?del=DeliteChat"))
        End Sub

        Private Sub Chat_Load(ByVal sender As Object, ByVal e As EventArgs)
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

        Public Sub GetChatData()
            Me.b = Me.GetChat.DownloadString((MyProject.Forms.Client.HostName.ToString & "/Chat.txt"))
            If (Me.a <> Me.b) Then
                Me.a = Me.b
                Me.TextBox1.Text = Me.GetChat.DownloadString((MyProject.Forms.Client.HostName.ToString & "/Chat.txt"))
            End If
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(Chat))
            Me.Button1 = New Button
            Me.TextBox2 = New TextBox
            Me.TextBox1 = New TextBox
            Me.Timer1 = New Timer(Me.components)
            Me.SuspendLayout
            Dim point As New Point(&H1A2, &H120)
            Me.Button1.Location = point
            Me.Button1.Name = "Button1"
            Dim size As New Size(&H4B, &H3E)
            Me.Button1.Size = size
            Me.Button1.TabIndex = 5
            Me.Button1.Text = "SEND"
            Me.Button1.UseVisualStyleBackColor = True
            point = New Point(0, &H120)
            Me.TextBox2.Location = point
            Me.TextBox2.Multiline = True
            Me.TextBox2.Name = "TextBox2"
            size = New Size(&H19C, &H3E)
            Me.TextBox2.Size = size
            Me.TextBox2.TabIndex = 4
            Me.TextBox1.Dock = DockStyle.Top
            point = New Point(0, 0)
            Me.TextBox1.Location = point
            Me.TextBox1.Multiline = True
            Me.TextBox1.Name = "TextBox1"
            Me.TextBox1.ReadOnly = True
            Me.TextBox1.ScrollBars = ScrollBars.Vertical
            size = New Size(&H1EC, &H11A)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 3
            Me.Timer1.Enabled = True
            Me.Timer1.Interval = &HBB8
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H1EC, &H160)
            Me.ClientSize = size
            Me.Controls.Add(Me.Button1)
            Me.Controls.Add(Me.TextBox2)
            Me.Controls.Add(Me.TextBox1)
            Me.FormBorderStyle = FormBorderStyle.FixedSingle
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "Chat"
            Me.Text = "Chat"
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
End Namespace

