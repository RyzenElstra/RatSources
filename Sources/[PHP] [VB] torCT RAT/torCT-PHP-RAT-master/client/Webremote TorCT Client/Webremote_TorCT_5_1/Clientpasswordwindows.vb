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
    Public Class Clientpasswordwindows
        Inherits Form
        ' Methods
        <DebuggerNonUserCode> _
        Public Sub New()
            Dim list As List(Of WeakReference) = Clientpasswordwindows.__ENCList
            SyncLock list
                Clientpasswordwindows.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.InitializeComponent
        End Sub

        Private Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim writer As StreamWriter = MyProject.Computer.FileSystem.OpenTextFileWriter((Application.StartupPath & "\ClientSafe.txt"), False)
            writer.Write(Me.TextBox1.Text)
            writer.Close
            Interaction.MsgBox("Added, Please restart The programm" & ChrW(13) & ChrW(10) & "The Program wil be closed!", MsgBoxStyle.ApplicationModal, Nothing)
            MyProject.Forms.Client.Close
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
            Dim manager As New ComponentResourceManager(GetType(Clientpasswordwindows))
            Me.Button2 = New Button
            Me.GroupBox1 = New GroupBox
            Me.Label7 = New Label
            Me.Label6 = New Label
            Me.TextBox1 = New TextBox
            Me.GroupBox1.SuspendLayout
            Me.SuspendLayout
            Dim point As New Point(&H6A, 140)
            Me.Button2.Location = point
            Me.Button2.Name = "Button2"
            Dim size As New Size(&H68, &H17)
            Me.Button2.Size = size
            Me.Button2.TabIndex = 11
            Me.Button2.Text = "Add Pasword"
            Me.Button2.UseVisualStyleBackColor = True
            Me.GroupBox1.Controls.Add(Me.Label7)
            point = New Point(12, 50)
            Me.GroupBox1.Location = point
            Me.GroupBox1.Name = "GroupBox1"
            size = New Size(&H13B, &H54)
            Me.GroupBox1.Size = size
            Me.GroupBox1.TabIndex = 10
            Me.GroupBox1.TabStop = False
            Me.GroupBox1.Text = "Information"
            Me.Label7.AutoSize = True
            point = New Point(12, &H1B)
            Me.Label7.Location = point
            Me.Label7.Name = "Label7"
            size = New Size(&H123, &H27)
            Me.Label7.Size = size
            Me.Label7.TabIndex = 4
            Me.Label7.Text = "If you want to use a password Set it on true in password.php" & ChrW(13) & ChrW(10) & ChrW(13) & ChrW(10) & "Make empty to delite the password!"
            Me.Label6.AutoSize = True
            point = New Point(&H24, 13)
            Me.Label6.Location = point
            Me.Label6.Name = "Label6"
            size = New Size(&H3E, 13)
            Me.Label6.Size = size
            Me.Label6.TabIndex = 9
            Me.Label6.Text = "Password : "
            point = New Point(&H6A, 10)
            Me.TextBox1.Location = point
            Me.TextBox1.Name = "TextBox1"
            size = New Size(&H9C, 20)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 8
            Me.TextBox1.Text = "ww"
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H15B, &HAF)
            Me.ClientSize = size
            Me.Controls.Add(Me.Button2)
            Me.Controls.Add(Me.GroupBox1)
            Me.Controls.Add(Me.Label6)
            Me.Controls.Add(Me.TextBox1)
            Me.FormBorderStyle = FormBorderStyle.FixedSingle
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "Clientpasswordwindows"
            Me.Text = "TorCT Client Password"
            Me.GroupBox1.ResumeLayout(False)
            Me.GroupBox1.PerformLayout
            Me.ResumeLayout(False)
            Me.PerformLayout
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
                Me._TextBox1 = WithEventsValue
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Button2")> _
        Private _Button2 As Button
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

