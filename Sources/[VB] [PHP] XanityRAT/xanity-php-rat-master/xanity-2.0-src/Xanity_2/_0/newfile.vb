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
    Public Class newfile
        Inherits Form
        ' Methods
        Public Sub New()
            newfile.__ENCAddToList(Me)
            Me.server = New API
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = newfile.__ENCList
            SyncLock list
                If (newfile.__ENCList.Count = newfile.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (newfile.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = newfile.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                newfile.__ENCList.Item(index) = newfile.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    newfile.__ENCList.RemoveRange(index, (newfile.__ENCList.Count - index))
                    newfile.__ENCList.Capacity = newfile.__ENCList.Count
                End If
                newfile.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub btn_send_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If Information.IsNothing(Me.FlatTextBox1.Text) Then
                    Interaction.MsgBox("Please set a File Name !", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendlogs(host, file, Me.RichTextBox1.Text.ToString, "_newfile"), True, False))) Then
                        MyProject.Forms.SystemInformation.FlatStatusBar1.Text = "An error occured by creating a new file!"
                    ElseIf Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("mkfile|" & Me.path & Me.FlatTextBox1.Text), host, file), True, False))) Then
                        MyProject.Forms.SystemInformation.FlatStatusBar1.Text = "An error occured by creating a new file!"
                    Else
                        MyProject.Forms.SystemInformation.FlatStatusBar1.Text = "A new file was created successfully!"
                    End If
                    Me.Close
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                MyProject.Forms.SystemInformation.FlatStatusBar1.Text = "An error occured by creating a new file!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_test_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.Close
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
            Me.FormSkin1 = New FormSkin
            Me.FlatTextBox1 = New FlatTextBox
            Me.FlatLabel1 = New FlatLabel
            Me.RichTextBox1 = New RichTextBox
            Me.FlatLabel2 = New FlatLabel
            Me.Panel1 = New Panel
            Me.btn_send = New FlatStickyButton
            Me.btn_test = New FlatStickyButton
            Me.FormSkin1.SuspendLayout
            Me.SuspendLayout
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.Controls.Add(Me.btn_send)
            Me.FormSkin1.Controls.Add(Me.btn_test)
            Me.FormSkin1.Controls.Add(Me.Panel1)
            Me.FormSkin1.Controls.Add(Me.FlatLabel2)
            Me.FormSkin1.Controls.Add(Me.RichTextBox1)
            Me.FormSkin1.Controls.Add(Me.FlatLabel1)
            Me.FormSkin1.Controls.Add(Me.FlatTextBox1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.White
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(&H1E1, 350)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Create a new File!"
            Me.FlatTextBox1.BackColor = Color.Transparent
            point2 = New Point(&H60, &H37)
            Me.FlatTextBox1.Location = point2
            Me.FlatTextBox1.MaxLength = &H7FFF
            Me.FlatTextBox1.Multiline = False
            Me.FlatTextBox1.Name = "FlatTextBox1"
            Me.FlatTextBox1.ReadOnly = False
            size2 = New Size(&H176, &H1D)
            Me.FlatTextBox1.Size = size2
            Me.FlatTextBox1.TabIndex = 0
            Me.FlatTextBox1.TextAlign = HorizontalAlignment.Left
            Me.FlatTextBox1.TextColor = Color.White
            Me.FlatTextBox1.UseSystemPasswordChar = False
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 12!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(4, &H3A)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&H57, &H15)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 1
            Me.FlatLabel1.Text = "File Name: "
            point2 = New Point(12, &H7A)
            Me.RichTextBox1.Location = point2
            Me.RichTextBox1.Name = "RichTextBox1"
            size2 = New Size(&H1C9, &HB2)
            Me.RichTextBox1.Size = size2
            Me.RichTextBox1.TabIndex = 2
            Me.RichTextBox1.Text = ""
            Me.FlatLabel2.AutoSize = True
            Me.FlatLabel2.BackColor = Color.Transparent
            Me.FlatLabel2.Font = New Font("Segoe UI", 12!)
            Me.FlatLabel2.ForeColor = Color.White
            point2 = New Point(8, &H62)
            Me.FlatLabel2.Location = point2
            Me.FlatLabel2.Name = "FlatLabel2"
            size2 = New Size(&H48, &H15)
            Me.FlatLabel2.Size = size2
            Me.FlatLabel2.TabIndex = 3
            Me.FlatLabel2.Text = "Content: "
            Me.Panel1.BackColor = Color.DeepPink
            point2 = New Point(12, 90)
            Me.Panel1.Location = point2
            Me.Panel1.Name = "Panel1"
            size2 = New Size(&H1C9, 5)
            Me.Panel1.Size = size2
            Me.Panel1.TabIndex = 4
            Me.btn_send.BackColor = Color.Transparent
            Me.btn_send.BaseColor = Color.DeepPink
            Me.btn_send.Cursor = Cursors.Hand
            Me.btn_send.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H16B, &H132)
            Me.btn_send.Location = point2
            Me.btn_send.Name = "btn_send"
            Me.btn_send.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btn_send.Size = size2
            Me.btn_send.TabIndex = 10
            Me.btn_send.Text = "Create"
            Me.btn_send.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_test.BackColor = Color.Transparent
            Me.btn_test.BaseColor = Color.White
            Me.btn_test.Cursor = Cursors.Hand
            Me.btn_test.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H101, &H132)
            Me.btn_test.Location = point2
            Me.btn_test.Name = "btn_test"
            Me.btn_test.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btn_test.Size = size2
            Me.btn_test.TabIndex = 9
            Me.btn_test.Text = "Abort"
            Me.btn_test.TextColor = Color.Black
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H1E1, 350)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Name = "newfile"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "newfile"
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            Me.FormSkin1.PerformLayout
            Me.ResumeLayout(False)
        End Sub


        ' Properties
        Friend Overridable Property btn_send As FlatStickyButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_send
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStickyButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_send_Click)
                If (Not Me._btn_send Is Nothing) Then
                    RemoveHandler Me._btn_send.Click, handler
                End If
                Me._btn_send = value
                If (Not Me._btn_send Is Nothing) Then
                    AddHandler Me._btn_send.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_test As FlatStickyButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_test
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStickyButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_test_Click)
                If (Not Me._btn_test Is Nothing) Then
                    RemoveHandler Me._btn_test.Click, handler
                End If
                Me._btn_test = value
                If (Not Me._btn_test Is Nothing) Then
                    AddHandler Me._btn_test.Click, handler
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

        Friend Overridable Property Panel1 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Panel)
                Me._Panel1 = value
            End Set
        End Property

        Friend Overridable Property RichTextBox1 As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._RichTextBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._RichTextBox1 = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("btn_send")> _
        Private _btn_send As FlatStickyButton
        <AccessedThroughProperty("btn_test")> _
        Private _btn_test As FlatStickyButton
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatLabel2")> _
        Private _FlatLabel2 As FlatLabel
        <AccessedThroughProperty("FlatTextBox1")> _
        Private _FlatTextBox1 As FlatTextBox
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("Panel1")> _
        Private _Panel1 As Panel
        <AccessedThroughProperty("RichTextBox1")> _
        Private _RichTextBox1 As RichTextBox
        Private components As IContainer
        Public connected As String
        Public path As String
        Private server As API
    End Class
End Namespace

