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
    Public Class MapView
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.MapView_Load)
            MapView.__ENCAddToList(Me)
            Me.web = New WebClient
            Me.x = New Thread(New ThreadStart(AddressOf Me.getmap))
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = MapView.__ENCList
            SyncLock list
                If (MapView.__ENCList.Count = MapView.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (MapView.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = MapView.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                MapView.__ENCList.Item(index) = MapView.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    MapView.__ENCList.RemoveRange(index, (MapView.__ENCList.Count - index))
                    MapView.__ENCList.Capacity = MapView.__ENCList.Count
                End If
                MapView.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Public Function ByteArray2Image(ByVal ByAr As Byte()) As Image
            Dim stream As New MemoryStream(ByAr)
            Return Image.FromStream(stream)
        End Function

        Public Function displayinfo(ByVal info As String) As Object
            Dim str5 As String = info.Split(New Char() { ";"c })(0)
            Dim str3 As String = info.Split(New Char() { ";"c })(1)
            Dim str2 As String = info.Split(New Char() { ";"c })(2)
            Dim str8 As String = info.Split(New Char() { ";"c })(3)
            Dim str As String = info.Split(New Char() { ";"c })(4)
            Dim str9 As String = info.Split(New Char() { ";"c })(5)
            Dim str6 As String = info.Split(New Char() { ";"c })(6)
            Dim str7 As String = info.Split(New Char() { ";"c })(7)
            Dim str4 As String = info.Split(New Char() { ";"c })(8)
            Return String.Concat(New String() { "IP: ", str5, ChrW(13) & ChrW(10) & "CountryCode: ", str3, ChrW(13) & ChrW(10) & "Country: ", str2, ChrW(13) & ChrW(10) & "Province: ", str8, ChrW(13) & ChrW(10) & "City: ", str, ChrW(13) & ChrW(10) & "Zip / Postal Code: ", str9, ChrW(13) & ChrW(10) & "Latitude: ", str6, ChrW(13) & ChrW(10) & "Longitude: ", str7, ChrW(13) & ChrW(10) & "GMT: ", str4, ChrW(13) & ChrW(10) })
        End Function

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

        Public Sub getmap()
            Dim num4 As Integer
            Try 
                Dim num5 As Integer
            Label_0001:
                ProjectData.ClearProjectError
                Dim num3 As Integer = -2
            Label_000A:
                num5 = 2
                If (MyProject.Forms.Form1.CountCharacter(Me.connected, "|"c) <= 1) Then
                    goto Label_0188
                End If
            Label_002C:
                num5 = 3
                Dim num2 As Integer = (MyProject.Forms.Form1.CountCharacter(Me.connected, "|"c) - 1)
                Dim index As Integer = 0
                goto Label_0105
            Label_0050:
                num5 = 4
                Dim str As String = Me.web.DownloadString(("http://api.ipinfodb.com/v3/ip-city/?key=2800d97df94929ecca12c4ec7f15a1dae8e4964f2d29e7353dc41a27aaf11f16&ip=" & Me.connected.Split(New Char() { "|"c })(index)))
            Label_0086:
                num5 = 5
                str = str.Remove(0, 4)
            Label_0092:
                num5 = 6
                Me.positions = String.Concat(New String() { Me.positions, "|", str.Split(New Char() { ";"c })(6), ",", str.Split(New Char() { ";"c })(7) })
            Label_00FE:
                num5 = 7
                index += 1
            Label_0105:
                If (index <= num2) Then
                    goto Label_0050
                End If
            Label_0110:
                num5 = 8
                Me.positions = Me.positions.Remove(0, 1)
            Label_0126:
                num5 = 9
                MyProject.Computer.Clipboard.SetText(("http://maps.google.com/maps/api/staticmap?center=1,1&zoom=4&markers=color:red|" & Me.positions & "&size=538x295&sensor=false"))
            Label_014E:
                num5 = 10
                Me.PictureBox1.Image = Me.ByteArray2Image(Me.web.DownloadData(("http://maps.google.com/maps/api/staticmap?center=1,1&zoom=1&markers=color:red|" & Me.positions & "&size=538x295&sensor=false")))
                goto Label_03FF
            Label_0188:
                num5 = 12
            Label_018C:
                num5 = 13
                Me.connected = Me.connected.Replace("|", "")
            Label_01AB:
                num5 = 14
                Dim info As String = Me.web.DownloadString(("http://api.ipinfodb.com/v3/ip-city/?key=2800d97df94929ecca12c4ec7f15a1dae8e4964f2d29e7353dc41a27aaf11f16&ip=" & Me.connected))
            Label_01CB:
                num5 = 15
                info = info.Remove(0, 4)
            Label_01D8:
                num5 = &H10
                Me.Invoke(New WriteTextDelegate(AddressOf Me.writetext), New Object() { RuntimeHelpers.GetObjectValue(Me.displayinfo(info)) })
            Label_020A:
                num5 = &H11
                Me.PictureBox1.Image = Me.ByteArray2Image(Me.web.DownloadData(String.Concat(New String() { "http://maps.google.com/maps/api/staticmap?center=", info.Split(New Char() { ";"c })(6), ",", info.Split(New Char() { ";"c })(7), "&zoom=4&markers=color:red|", info.Split(New Char() { ";"c })(6), ",", info.Split(New Char() { ";"c })(7), "&size=538x295&sensor=false" })))
            Label_02D7:
                num5 = &H12
                Dim point2 As New Point(12, 12)
                Me.labelinfo.Location = point2
            Label_02F3:
                num5 = &H13
                Me.labelinfo.BackColor = Color.White
            Label_0307:
                num5 = 20
                Me.labelinfo.AutoSize = True
            Label_0317:
                num5 = &H15
                Me.labelinfo.Show
            Label_0326:
                num5 = &H16
                Me.PictureBox1.Controls.Add(Me.labelinfo)
                goto Label_03FF
            Label_0345:
                num4 = 0
                Select Case (num4 + 1)
                    Case 1
                        goto Label_0001
                    Case 2
                        goto Label_000A
                    Case 3
                        goto Label_002C
                    Case 4
                        goto Label_0050
                    Case 5
                        goto Label_0086
                    Case 6
                        goto Label_0092
                    Case 7
                        goto Label_00FE
                    Case 8
                        goto Label_0110
                    Case 9
                        goto Label_0126
                    Case 10
                        goto Label_014E
                    Case 11, &H17, &H18
                        goto Label_03FF
                    Case 12
                        goto Label_0188
                    Case 13
                        goto Label_018C
                    Case 14
                        goto Label_01AB
                    Case 15
                        goto Label_01CB
                    Case &H10
                        goto Label_01D8
                    Case &H11
                        goto Label_020A
                    Case &H12
                        goto Label_02D7
                    Case &H13
                        goto Label_02F3
                    Case 20
                        goto Label_0307
                    Case &H15
                        goto Label_0317
                    Case &H16
                        goto Label_0326
                    Case Else
                        goto Label_03F4
                End Select
            Label_03B7:
                num4 = num5
                If (num3 <= -2) Then
                    goto Label_0345
                End If
                Select Case num3
                    Case 0
                        goto Label_03F4
                    Case 1
                        goto Label_0345
                End Select
            Catch obj1 As Object When (?)
                ProjectData.SetProjectError(DirectCast(obj1, Exception))
                goto Label_03B7
            End Try
        Label_03F4:
            Throw ProjectData.CreateProjectError(-2146828237)
        Label_03FF:
            If (num4 <> 0) Then
                ProjectData.ClearProjectError
            End If
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Dim manager As New ComponentResourceManager(GetType(MapView))
            Me.FormSkin1 = New FormSkin
            Me.FlatCloseMapView1 = New FlatCloseMapView
            Me.FlatMax1 = New FlatMax
            Me.FlatMini1 = New FlatMini
            Me.PictureBox1 = New PictureBox
            Me.labelinfo = New FlatLabel
            Me.FormSkin1.SuspendLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.SuspendLayout
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.FlatCloseMapView1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.PictureBox1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(&H246, &H169)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "MapView"
            Me.FlatCloseMapView1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseMapView1.BackColor = Color.White
            Me.FlatCloseMapView1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseMapView1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H228, 12)
            Me.FlatCloseMapView1.Location = point2
            Me.FlatCloseMapView1.Name = "FlatCloseMapView1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseMapView1.Size = size2
            Me.FlatCloseMapView1.TabIndex = 3
            Me.FlatCloseMapView1.Text = "FlatCloseMapView1"
            Me.FlatCloseMapView1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H210, 12)
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
            point2 = New Point(&H1F8, 12)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = 1
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.PictureBox1.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            point2 = New Point(&H16, &H36)
            Me.PictureBox1.Location = point2
            Me.PictureBox1.Name = "PictureBox1"
            size2 = New Size(&H21A, &H127)
            Me.PictureBox1.Size = size2
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.CenterImage
            Me.PictureBox1.TabIndex = 0
            Me.PictureBox1.TabStop = False
            Me.labelinfo.AutoSize = True
            Me.labelinfo.BackColor = SystemColors.Control
            Me.labelinfo.Font = New Font("Segoe UI", 8!)
            Me.labelinfo.ForeColor = Color.Black
            point2 = New Point(&H17, &H36)
            Me.labelinfo.Location = point2
            Me.labelinfo.Name = "labelinfo"
            size2 = New Size(0, 13)
            Me.labelinfo.Size = size2
            Me.labelinfo.TabIndex = 1
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H246, &H169)
            Me.ClientSize = size2
            Me.Controls.Add(Me.labelinfo)
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "MapView"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "MapView"
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub MapView_Load(ByVal sender As Object, ByVal e As EventArgs)
            Me.PictureBox1.Image = Resources.gif_load
            Me.x.Start
        End Sub

        Public Sub writetext(ByVal [text] As String)
            Me.labelinfo.Text = [text]
        End Sub


        ' Properties
        Friend Overridable Property FlatCloseMapView1 As FlatCloseMapView
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseMapView1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseMapView)
                Me._FlatCloseMapView1 = value
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

        Friend Overridable Property labelinfo As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._labelinfo
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._labelinfo = value
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


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("FlatCloseMapView1")> _
        Private _FlatCloseMapView1 As FlatCloseMapView
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("labelinfo")> _
        Private _labelinfo As FlatLabel
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        Private components As IContainer
        Public connected As String
        Private positions As String
        Private web As WebClient
        Private x As Thread

        ' Nested Types
        Public Delegate Sub WriteTextDelegate(ByVal [Text] As String)
    End Class
End Namespace

