Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Windows.Forms
Imports Webremote_TorCT_5_1.My

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class Loding_Screen
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.Loding_Screen_Load)
            Dim list As List(Of WeakReference) = Loding_Screen.__ENCList
            SyncLock list
                Loding_Screen.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.Webclient = New WebClient
            Me.FoundOrNot = 0
            Me.InitializeComponent
        End Sub

        Public Sub Check_Update()
            Me.Label2.Text = "Status : Checking for updates"
            Try 
                If (Me.Webclient.DownloadString("Http://www.torct.eu/Updates/5.4.txt") = "1") Then
                    Me.Label2.Text = "Status : Update fount"
                    Loding_Screen.Sleep(500)
                    Process.Start("Http://www.torct.eu")
                    Me.FoundOrNot = 1
                Else
                    Me.Label2.Text = "Status : No Updates fount"
                    Loding_Screen.Sleep(500)
                    Me.FoundOrNot = 1
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Me.Label2.Text = "Status : Couldn't conect to TorCT.eu"
                Loding_Screen.Sleep(500)
                Me.FoundOrNot = 1
                ProjectData.ClearProjectError
            End Try
            MyProject.Forms.Client.Show
            Me.Hide
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
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(Loding_Screen))
            Me.Label1 = New Label
            Me.Label2 = New Label
            Me.Timer1 = New Timer(Me.components)
            Me.Label3 = New Label
            Me.SuspendLayout
            Me.Label1.AutoSize = True
            Me.Label1.BackColor = Color.Transparent
            Me.Label1.ForeColor = Color.FromArgb(&HE0, &HE0, &HE0)
            Dim point As New Point(&H169, 210)
            Me.Label1.Location = point
            Me.Label1.Name = "Label1"
            Dim size As New Size(90, 13)
            Me.Label1.Size = size
            Me.Label1.TabIndex = 0
            Me.Label1.Text = "Version : 6.21.0.4"
            Me.Label2.AutoSize = True
            Me.Label2.BackColor = Color.Transparent
            Me.Label2.ForeColor = Color.FromArgb(&HE0, &HE0, &HE0)
            point = New Point(12, 210)
            Me.Label2.Location = point
            Me.Label2.Name = "Label2"
            size = New Size(&H9B, 13)
            Me.Label2.Size = size
            Me.Label2.TabIndex = 1
            Me.Label2.Text = "Status :  Checking For Updates"
            Me.Timer1.Interval = 500
            Me.Label3.AutoSize = True
            Me.Label3.BackColor = Color.Transparent
            Me.Label3.ForeColor = Color.FromArgb(&HE0, &HE0, &HE0)
            point = New Point(12, &HDF)
            Me.Label3.Location = point
            Me.Label3.Name = "Label3"
            size = New Size(&H7F, 13)
            Me.Label3.Size = size
            Me.Label3.TabIndex = 2
            Me.Label3.Text = "Website : www.TorCT.eu"
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            Me.BackgroundImage = DirectCast(manager.GetObject("$this.BackgroundImage"), Image)
            Me.BackgroundImageLayout = ImageLayout.None
            size = New Size(500, &HF3)
            Me.ClientSize = size
            Me.Controls.Add(Me.Label3)
            Me.Controls.Add(Me.Label2)
            Me.Controls.Add(Me.Label1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "Loding_Screen"
            Me.ShowIcon = False
            Me.ShowInTaskbar = False
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "TorCT Webremote Loding"
            Me.TopMost = True
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub Loding_Screen_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.Timer1.Start
        End Sub

        <DllImport("kernel32.dll", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
        Public Shared Sub Sleep(ByVal Milliseconds As Integer)
        End Sub

        Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Me.Check_Update
            Me.Timer1.Stop
        End Sub


        ' Properties
        Friend Overridable Property Label1 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Label2 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label2 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Label3 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._Label3 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Timer1 As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._Timer1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer1_Tick)
                If (Not Me._Timer1 Is Nothing) Then
                    RemoveHandler Me._Timer1.Tick, handler
                End If
                Me._Timer1 = WithEventsValue
                If (Not Me._Timer1 Is Nothing) Then
                    AddHandler Me._Timer1.Tick, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Label1")> _
        Private _Label1 As Label
        <AccessedThroughProperty("Label2")> _
        Private _Label2 As Label
        <AccessedThroughProperty("Label3")> _
        Private _Label3 As Label
        <AccessedThroughProperty("Timer1")> _
        Private _Timer1 As Timer
        Private components As IContainer
        Private FoundOrNot As Integer
        Private Webclient As WebClient
    End Class
End Namespace

