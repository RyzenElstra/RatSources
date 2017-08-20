<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class SystemInformation
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(SystemInformation))
        Dim TreeNode1 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Computer Name: ")
        Dim TreeNode2 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Username: ")
        Dim TreeNode3 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Virtual Screen Width: ")
        Dim TreeNode4 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Virtual Screen Height: ")
        Dim TreeNode5 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Available Physical Memory: ")
        Dim TreeNode6 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Available Virtual Memory: ")
        Dim TreeNode7 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("OS Full Name: ")
        Dim TreeNode8 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("OS Platform: ")
        Dim TreeNode9 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("OS Version: ")
        Dim TreeNode10 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Total Physical Memory: ")
        Dim TreeNode11 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Total Virtual Memory: ")
        Dim TreeNode12 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Battery Charge Status: ")
        Dim TreeNode13 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Battery Full Lifetime: ")
        Dim TreeNode14 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Battery Life Percent: ")
        Dim TreeNode15 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Battery Life Remaining: ")
        Dim TreeNode16 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("CPU Info: ")
        Dim TreeNode17 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("GPU Name: ")
        Dim TreeNode18 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Uptime: ")
        Dim TreeNode19 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Computer Information", New System.Windows.Forms.TreeNode() {TreeNode1, TreeNode2, TreeNode3, TreeNode4, TreeNode5, TreeNode6, TreeNode7, TreeNode8, TreeNode9, TreeNode10, TreeNode11, TreeNode12, TreeNode13, TreeNode14, TreeNode15, TreeNode16, TreeNode17, TreeNode18})
        Dim TreeNode20 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Registered Owner: ")
        Dim TreeNode21 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Registered Organization: ")
        Dim TreeNode22 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Product Key: ")
        Dim TreeNode23 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("MAC Adress: ")
        Dim TreeNode24 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Webcam Available: ")
        Dim TreeNode25 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Installed AntiVirus Engine: ")
        Dim TreeNode26 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Server Location: ")
        Dim TreeNode27 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Other Information", New System.Windows.Forms.TreeNode() {TreeNode20, TreeNode21, TreeNode22, TreeNode23, TreeNode24, TreeNode25, TreeNode26})
        Me.ImageList_Info = New System.Windows.Forms.ImageList(Me.components)
        Me.rightclick_Info = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RefreshToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.rightclickprocess = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.KillProcessToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NewProcessToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.rightclick_is = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem2 = New System.Windows.Forms.ToolStripMenuItem()
        Me.rightclick_tcp = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem3 = New System.Windows.Forms.ToolStripMenuItem()
        Me.rightclick_startup = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem4 = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoveToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.rightclick_nothing = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RefreshToolStripMenuItem3 = New System.Windows.Forms.ToolStripMenuItem()
        Me.CreateNewFolderToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.CreateNewFileToolStripMenuItem3 = New System.Windows.Forms.ToolStripMenuItem()
        Me.UploadFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ImageList_FileManager = New System.Windows.Forms.ImageList(Me.components)
        Me.rightclick_service = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RefreshToolStripMenuItem4 = New System.Windows.Forms.ToolStripMenuItem()
        Me.CloseToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ContinueToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PauseToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StartToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StopToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.rightclick_filemanagerfolders = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RefreshToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.CreateNewFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CreateNewFileToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.DeleteFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RenameFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopyThisFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MoveThisFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UploadFileToolStripMenuItem2 = New System.Windows.Forms.ToolStripMenuItem()
        Me.rightclick_filemanagerfiles = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RefreshToolStripMenuItem2 = New System.Windows.Forms.ToolStripMenuItem()
        Me.CreateNewFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CreateNewFileToolStripMenuItem2 = New System.Windows.Forms.ToolStripMenuItem()
        Me.DeleteFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RenameFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopyFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MoveFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DownloadFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UploadFileToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.CodePlexTabControl1 = New Diamond_Remote_Administration_Tool.CodePlexTabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.TreeView1 = New System.Windows.Forms.TreeView()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.listprocess = New System.Windows.Forms.ListView()
        Me.name = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.mem = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.work = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.init = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.id = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.ListBox_Software = New System.Windows.Forms.ListBox()
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.ListView_tcp = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage5 = New System.Windows.Forms.TabPage()
        Me.ListView_Startup = New System.Windows.Forms.ListView()
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader6 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage6 = New System.Windows.Forms.TabPage()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.ListView_Files = New System.Windows.Forms.ListView()
        Me.ColumnHeader7 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader8 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader9 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader10 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader11 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.ComboBox1 = New System.Windows.Forms.ComboBox()
        Me.TabPage7 = New System.Windows.Forms.TabPage()
        Me.ListView_Service = New System.Windows.Forms.ListView()
        Me.ColumnHeader12 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader13 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader14 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader15 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ImageList_Service = New System.Windows.Forms.ImageList(Me.components)
        Me.rightclick_Info.SuspendLayout()
        Me.rightclickprocess.SuspendLayout()
        Me.rightclick_is.SuspendLayout()
        Me.rightclick_tcp.SuspendLayout()
        Me.rightclick_startup.SuspendLayout()
        Me.rightclick_nothing.SuspendLayout()
        Me.rightclick_service.SuspendLayout()
        Me.rightclick_filemanagerfolders.SuspendLayout()
        Me.rightclick_filemanagerfiles.SuspendLayout()
        Me.CodePlexTabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.TabPage3.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        Me.TabPage5.SuspendLayout()
        Me.TabPage6.SuspendLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage7.SuspendLayout()
        Me.SuspendLayout()
        '
        'ImageList_Info
        '
        Me.ImageList_Info.ImageStream = CType(resources.GetObject("ImageList_Info.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList_Info.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList_Info.Images.SetKeyName(0, "alarm-clock.png")
        Me.ImageList_Info.Images.SetKeyName(1, "application-monitor.png")
        Me.ImageList_Info.Images.SetKeyName(2, "battery.png")
        Me.ImageList_Info.Images.SetKeyName(3, "battery-charge.png")
        Me.ImageList_Info.Images.SetKeyName(4, "battery--exclamation.png")
        Me.ImageList_Info.Images.SetKeyName(5, "graphic-card.png")
        Me.ImageList_Info.Images.SetKeyName(6, "information.png")
        Me.ImageList_Info.Images.SetKeyName(7, "information-white.png")
        Me.ImageList_Info.Images.SetKeyName(8, "user.png")
        Me.ImageList_Info.Images.SetKeyName(9, "resource-monitor.png")
        Me.ImageList_Info.Images.SetKeyName(10, "processor.png")
        Me.ImageList_Info.Images.SetKeyName(11, "monitor.png")
        Me.ImageList_Info.Images.SetKeyName(12, "memory.png")
        Me.ImageList_Info.Images.SetKeyName(13, "selection.png")
        Me.ImageList_Info.Images.SetKeyName(14, "computer.png")
        Me.ImageList_Info.Images.SetKeyName(15, "information-shield.png")
        Me.ImageList_Info.Images.SetKeyName(16, "user-business.png")
        Me.ImageList_Info.Images.SetKeyName(17, "home-medium.png")
        Me.ImageList_Info.Images.SetKeyName(18, "key.png")
        Me.ImageList_Info.Images.SetKeyName(19, "address-book-blue.png")
        Me.ImageList_Info.Images.SetKeyName(20, "webcam.png")
        Me.ImageList_Info.Images.SetKeyName(21, "wall.png")
        Me.ImageList_Info.Images.SetKeyName(22, "arrow.png")
        '
        'rightclick_Info
        '
        Me.rightclick_Info.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RefreshToolStripMenuItem})
        Me.rightclick_Info.Name = "rightclick_Info"
        Me.rightclick_Info.Size = New System.Drawing.Size(114, 26)
        '
        'RefreshToolStripMenuItem
        '
        Me.RefreshToolStripMenuItem.Image = CType(resources.GetObject("RefreshToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem.Name = "RefreshToolStripMenuItem"
        Me.RefreshToolStripMenuItem.Size = New System.Drawing.Size(113, 22)
        Me.RefreshToolStripMenuItem.Text = "Refresh"
        '
        'rightclickprocess
        '
        Me.rightclickprocess.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem1, Me.KillProcessToolStripMenuItem, Me.NewProcessToolStripMenuItem})
        Me.rightclickprocess.Name = "rightclick"
        Me.rightclickprocess.Size = New System.Drawing.Size(142, 70)
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Image = CType(resources.GetObject("ToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(141, 22)
        Me.ToolStripMenuItem1.Text = "Refresh"
        '
        'KillProcessToolStripMenuItem
        '
        Me.KillProcessToolStripMenuItem.Image = CType(resources.GetObject("KillProcessToolStripMenuItem.Image"), System.Drawing.Image)
        Me.KillProcessToolStripMenuItem.Name = "KillProcessToolStripMenuItem"
        Me.KillProcessToolStripMenuItem.Size = New System.Drawing.Size(141, 22)
        Me.KillProcessToolStripMenuItem.Text = "Kill Process"
        '
        'NewProcessToolStripMenuItem
        '
        Me.NewProcessToolStripMenuItem.Image = CType(resources.GetObject("NewProcessToolStripMenuItem.Image"), System.Drawing.Image)
        Me.NewProcessToolStripMenuItem.Name = "NewProcessToolStripMenuItem"
        Me.NewProcessToolStripMenuItem.Size = New System.Drawing.Size(141, 22)
        Me.NewProcessToolStripMenuItem.Text = "New Process"
        '
        'rightclick_is
        '
        Me.rightclick_is.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem2})
        Me.rightclick_is.Name = "rightclick_Info"
        Me.rightclick_is.Size = New System.Drawing.Size(114, 26)
        '
        'ToolStripMenuItem2
        '
        Me.ToolStripMenuItem2.Image = CType(resources.GetObject("ToolStripMenuItem2.Image"), System.Drawing.Image)
        Me.ToolStripMenuItem2.Name = "ToolStripMenuItem2"
        Me.ToolStripMenuItem2.Size = New System.Drawing.Size(113, 22)
        Me.ToolStripMenuItem2.Text = "Refresh"
        '
        'rightclick_tcp
        '
        Me.rightclick_tcp.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem3})
        Me.rightclick_tcp.Name = "rightclick_Info"
        Me.rightclick_tcp.Size = New System.Drawing.Size(114, 26)
        '
        'ToolStripMenuItem3
        '
        Me.ToolStripMenuItem3.Image = CType(resources.GetObject("ToolStripMenuItem3.Image"), System.Drawing.Image)
        Me.ToolStripMenuItem3.Name = "ToolStripMenuItem3"
        Me.ToolStripMenuItem3.Size = New System.Drawing.Size(113, 22)
        Me.ToolStripMenuItem3.Text = "Refresh"
        '
        'rightclick_startup
        '
        Me.rightclick_startup.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem4, Me.RemoveToolStripMenuItem})
        Me.rightclick_startup.Name = "rightclick_Info"
        Me.rightclick_startup.Size = New System.Drawing.Size(118, 48)
        '
        'ToolStripMenuItem4
        '
        Me.ToolStripMenuItem4.Image = CType(resources.GetObject("ToolStripMenuItem4.Image"), System.Drawing.Image)
        Me.ToolStripMenuItem4.Name = "ToolStripMenuItem4"
        Me.ToolStripMenuItem4.Size = New System.Drawing.Size(117, 22)
        Me.ToolStripMenuItem4.Text = "Refresh"
        '
        'RemoveToolStripMenuItem
        '
        Me.RemoveToolStripMenuItem.Image = CType(resources.GetObject("RemoveToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoveToolStripMenuItem.Name = "RemoveToolStripMenuItem"
        Me.RemoveToolStripMenuItem.Size = New System.Drawing.Size(117, 22)
        Me.RemoveToolStripMenuItem.Text = "Remove"
        '
        'rightclick_nothing
        '
        Me.rightclick_nothing.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RefreshToolStripMenuItem3, Me.CreateNewFolderToolStripMenuItem1, Me.CreateNewFileToolStripMenuItem3, Me.UploadFileToolStripMenuItem})
        Me.rightclick_nothing.Name = "rightclick_nothing"
        Me.rightclick_nothing.Size = New System.Drawing.Size(172, 92)
        '
        'RefreshToolStripMenuItem3
        '
        Me.RefreshToolStripMenuItem3.BackColor = System.Drawing.Color.White
        Me.RefreshToolStripMenuItem3.ForeColor = System.Drawing.Color.Black
        Me.RefreshToolStripMenuItem3.Image = CType(resources.GetObject("RefreshToolStripMenuItem3.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem3.Name = "RefreshToolStripMenuItem3"
        Me.RefreshToolStripMenuItem3.Size = New System.Drawing.Size(171, 22)
        Me.RefreshToolStripMenuItem3.Text = "Refresh"
        '
        'CreateNewFolderToolStripMenuItem1
        '
        Me.CreateNewFolderToolStripMenuItem1.BackColor = System.Drawing.Color.White
        Me.CreateNewFolderToolStripMenuItem1.ForeColor = System.Drawing.Color.Black
        Me.CreateNewFolderToolStripMenuItem1.Image = CType(resources.GetObject("CreateNewFolderToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.CreateNewFolderToolStripMenuItem1.Name = "CreateNewFolderToolStripMenuItem1"
        Me.CreateNewFolderToolStripMenuItem1.Size = New System.Drawing.Size(171, 22)
        Me.CreateNewFolderToolStripMenuItem1.Text = "Create New Folder"
        '
        'CreateNewFileToolStripMenuItem3
        '
        Me.CreateNewFileToolStripMenuItem3.BackColor = System.Drawing.Color.White
        Me.CreateNewFileToolStripMenuItem3.ForeColor = System.Drawing.Color.Black
        Me.CreateNewFileToolStripMenuItem3.Image = CType(resources.GetObject("CreateNewFileToolStripMenuItem3.Image"), System.Drawing.Image)
        Me.CreateNewFileToolStripMenuItem3.Name = "CreateNewFileToolStripMenuItem3"
        Me.CreateNewFileToolStripMenuItem3.Size = New System.Drawing.Size(171, 22)
        Me.CreateNewFileToolStripMenuItem3.Text = "Create New File"
        '
        'UploadFileToolStripMenuItem
        '
        Me.UploadFileToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.UploadFileToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.UploadFileToolStripMenuItem.Image = CType(resources.GetObject("UploadFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UploadFileToolStripMenuItem.Name = "UploadFileToolStripMenuItem"
        Me.UploadFileToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.UploadFileToolStripMenuItem.Text = "Upload File"
        '
        'ImageList_FileManager
        '
        Me.ImageList_FileManager.ImageStream = CType(resources.GetObject("ImageList_FileManager.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList_FileManager.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList_FileManager.Images.SetKeyName(0, "folder-horizontal.png")
        Me.ImageList_FileManager.Images.SetKeyName(1, "application-blue.png")
        Me.ImageList_FileManager.Images.SetKeyName(2, "blue-document-code.png")
        Me.ImageList_FileManager.Images.SetKeyName(3, "blue-document-excel.png")
        Me.ImageList_FileManager.Images.SetKeyName(4, "blue-document-flash-movie.png")
        Me.ImageList_FileManager.Images.SetKeyName(5, "blue-document-globe.png")
        Me.ImageList_FileManager.Images.SetKeyName(6, "blue-document-illustrator.png")
        Me.ImageList_FileManager.Images.SetKeyName(7, "blue-document-music.png")
        Me.ImageList_FileManager.Images.SetKeyName(8, "blue-document-pdf.png")
        Me.ImageList_FileManager.Images.SetKeyName(9, "blue-document-photoshop.png")
        Me.ImageList_FileManager.Images.SetKeyName(10, "blue-document-php.png")
        Me.ImageList_FileManager.Images.SetKeyName(11, "blue-document-powerpoint.png")
        Me.ImageList_FileManager.Images.SetKeyName(12, "blue-document-visual-studio.png")
        Me.ImageList_FileManager.Images.SetKeyName(13, "blue-document-word.png")
        Me.ImageList_FileManager.Images.SetKeyName(14, "blue-document-xaml.png")
        Me.ImageList_FileManager.Images.SetKeyName(15, "briefcase.png")
        Me.ImageList_FileManager.Images.SetKeyName(16, "database.png")
        Me.ImageList_FileManager.Images.SetKeyName(17, "document.png")
        Me.ImageList_FileManager.Images.SetKeyName(18, "document-outlook.png")
        Me.ImageList_FileManager.Images.SetKeyName(19, "film.png")
        Me.ImageList_FileManager.Images.SetKeyName(20, "folder-zipper.png")
        Me.ImageList_FileManager.Images.SetKeyName(21, "image.png")
        Me.ImageList_FileManager.Images.SetKeyName(22, "script.png")
        Me.ImageList_FileManager.Images.SetKeyName(23, "folder-horizontal-up.png")
        Me.ImageList_FileManager.Images.SetKeyName(24, "document-text.png")
        '
        'rightclick_service
        '
        Me.rightclick_service.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RefreshToolStripMenuItem4, Me.CloseToolStripMenuItem, Me.ContinueToolStripMenuItem, Me.PauseToolStripMenuItem, Me.StartToolStripMenuItem, Me.StopToolStripMenuItem})
        Me.rightclick_service.Name = "rightclick_service"
        Me.rightclick_service.Size = New System.Drawing.Size(124, 136)
        '
        'RefreshToolStripMenuItem4
        '
        Me.RefreshToolStripMenuItem4.Image = CType(resources.GetObject("RefreshToolStripMenuItem4.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem4.Name = "RefreshToolStripMenuItem4"
        Me.RefreshToolStripMenuItem4.Size = New System.Drawing.Size(123, 22)
        Me.RefreshToolStripMenuItem4.Text = "Refresh"
        '
        'CloseToolStripMenuItem
        '
        Me.CloseToolStripMenuItem.Image = CType(resources.GetObject("CloseToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CloseToolStripMenuItem.Name = "CloseToolStripMenuItem"
        Me.CloseToolStripMenuItem.Size = New System.Drawing.Size(123, 22)
        Me.CloseToolStripMenuItem.Text = "Close"
        '
        'ContinueToolStripMenuItem
        '
        Me.ContinueToolStripMenuItem.Image = CType(resources.GetObject("ContinueToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ContinueToolStripMenuItem.Name = "ContinueToolStripMenuItem"
        Me.ContinueToolStripMenuItem.Size = New System.Drawing.Size(123, 22)
        Me.ContinueToolStripMenuItem.Text = "Continue"
        '
        'PauseToolStripMenuItem
        '
        Me.PauseToolStripMenuItem.Image = CType(resources.GetObject("PauseToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PauseToolStripMenuItem.Name = "PauseToolStripMenuItem"
        Me.PauseToolStripMenuItem.Size = New System.Drawing.Size(123, 22)
        Me.PauseToolStripMenuItem.Text = "Pause"
        '
        'StartToolStripMenuItem
        '
        Me.StartToolStripMenuItem.Image = CType(resources.GetObject("StartToolStripMenuItem.Image"), System.Drawing.Image)
        Me.StartToolStripMenuItem.Name = "StartToolStripMenuItem"
        Me.StartToolStripMenuItem.Size = New System.Drawing.Size(123, 22)
        Me.StartToolStripMenuItem.Text = "Start"
        '
        'StopToolStripMenuItem
        '
        Me.StopToolStripMenuItem.Image = CType(resources.GetObject("StopToolStripMenuItem.Image"), System.Drawing.Image)
        Me.StopToolStripMenuItem.Name = "StopToolStripMenuItem"
        Me.StopToolStripMenuItem.Size = New System.Drawing.Size(123, 22)
        Me.StopToolStripMenuItem.Text = "Stop"
        '
        'rightclick_filemanagerfolders
        '
        Me.rightclick_filemanagerfolders.BackColor = System.Drawing.SystemColors.Control
        Me.rightclick_filemanagerfolders.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RefreshToolStripMenuItem1, Me.CreateNewFolderToolStripMenuItem, Me.CreateNewFileToolStripMenuItem1, Me.DeleteFolderToolStripMenuItem, Me.RenameFolderToolStripMenuItem, Me.CopyThisFolderToolStripMenuItem, Me.MoveThisFolderToolStripMenuItem, Me.UploadFileToolStripMenuItem2})
        Me.rightclick_filemanagerfolders.Name = "rightclick_filemanager"
        Me.rightclick_filemanagerfolders.Size = New System.Drawing.Size(172, 180)
        '
        'RefreshToolStripMenuItem1
        '
        Me.RefreshToolStripMenuItem1.BackColor = System.Drawing.Color.White
        Me.RefreshToolStripMenuItem1.ForeColor = System.Drawing.Color.Black
        Me.RefreshToolStripMenuItem1.Image = CType(resources.GetObject("RefreshToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem1.Name = "RefreshToolStripMenuItem1"
        Me.RefreshToolStripMenuItem1.Size = New System.Drawing.Size(171, 22)
        Me.RefreshToolStripMenuItem1.Text = "Refresh"
        '
        'CreateNewFolderToolStripMenuItem
        '
        Me.CreateNewFolderToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.CreateNewFolderToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.CreateNewFolderToolStripMenuItem.Image = CType(resources.GetObject("CreateNewFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CreateNewFolderToolStripMenuItem.Name = "CreateNewFolderToolStripMenuItem"
        Me.CreateNewFolderToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.CreateNewFolderToolStripMenuItem.Text = "Create New Folder"
        '
        'CreateNewFileToolStripMenuItem1
        '
        Me.CreateNewFileToolStripMenuItem1.BackColor = System.Drawing.Color.White
        Me.CreateNewFileToolStripMenuItem1.ForeColor = System.Drawing.Color.Black
        Me.CreateNewFileToolStripMenuItem1.Image = CType(resources.GetObject("CreateNewFileToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.CreateNewFileToolStripMenuItem1.Name = "CreateNewFileToolStripMenuItem1"
        Me.CreateNewFileToolStripMenuItem1.Size = New System.Drawing.Size(171, 22)
        Me.CreateNewFileToolStripMenuItem1.Text = "Create New File"
        '
        'DeleteFolderToolStripMenuItem
        '
        Me.DeleteFolderToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.DeleteFolderToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.DeleteFolderToolStripMenuItem.Image = CType(resources.GetObject("DeleteFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DeleteFolderToolStripMenuItem.Name = "DeleteFolderToolStripMenuItem"
        Me.DeleteFolderToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.DeleteFolderToolStripMenuItem.Text = "Delete Folder"
        '
        'RenameFolderToolStripMenuItem
        '
        Me.RenameFolderToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.RenameFolderToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.RenameFolderToolStripMenuItem.Image = CType(resources.GetObject("RenameFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RenameFolderToolStripMenuItem.Name = "RenameFolderToolStripMenuItem"
        Me.RenameFolderToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.RenameFolderToolStripMenuItem.Text = "Rename Folder"
        '
        'CopyThisFolderToolStripMenuItem
        '
        Me.CopyThisFolderToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.CopyThisFolderToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.CopyThisFolderToolStripMenuItem.Image = CType(resources.GetObject("CopyThisFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CopyThisFolderToolStripMenuItem.Name = "CopyThisFolderToolStripMenuItem"
        Me.CopyThisFolderToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.CopyThisFolderToolStripMenuItem.Text = "Copy this Folder"
        '
        'MoveThisFolderToolStripMenuItem
        '
        Me.MoveThisFolderToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.MoveThisFolderToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.MoveThisFolderToolStripMenuItem.Image = CType(resources.GetObject("MoveThisFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.MoveThisFolderToolStripMenuItem.Name = "MoveThisFolderToolStripMenuItem"
        Me.MoveThisFolderToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.MoveThisFolderToolStripMenuItem.Text = "Move this Folder"
        '
        'UploadFileToolStripMenuItem2
        '
        Me.UploadFileToolStripMenuItem2.BackColor = System.Drawing.Color.White
        Me.UploadFileToolStripMenuItem2.ForeColor = System.Drawing.Color.Black
        Me.UploadFileToolStripMenuItem2.Image = CType(resources.GetObject("UploadFileToolStripMenuItem2.Image"), System.Drawing.Image)
        Me.UploadFileToolStripMenuItem2.Name = "UploadFileToolStripMenuItem2"
        Me.UploadFileToolStripMenuItem2.Size = New System.Drawing.Size(171, 22)
        Me.UploadFileToolStripMenuItem2.Text = "Upload File"
        '
        'rightclick_filemanagerfiles
        '
        Me.rightclick_filemanagerfiles.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RefreshToolStripMenuItem2, Me.CreateNewFileToolStripMenuItem, Me.CreateNewFileToolStripMenuItem2, Me.DeleteFileToolStripMenuItem, Me.RenameFileToolStripMenuItem, Me.CopyFileToolStripMenuItem, Me.MoveFileToolStripMenuItem, Me.DownloadFileToolStripMenuItem, Me.UploadFileToolStripMenuItem1})
        Me.rightclick_filemanagerfiles.Name = "rightclick_filemanagerfiles"
        Me.rightclick_filemanagerfiles.Size = New System.Drawing.Size(172, 202)
        '
        'RefreshToolStripMenuItem2
        '
        Me.RefreshToolStripMenuItem2.BackColor = System.Drawing.Color.White
        Me.RefreshToolStripMenuItem2.ForeColor = System.Drawing.Color.Black
        Me.RefreshToolStripMenuItem2.Image = CType(resources.GetObject("RefreshToolStripMenuItem2.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem2.Name = "RefreshToolStripMenuItem2"
        Me.RefreshToolStripMenuItem2.Size = New System.Drawing.Size(171, 22)
        Me.RefreshToolStripMenuItem2.Text = "Refresh"
        '
        'CreateNewFileToolStripMenuItem
        '
        Me.CreateNewFileToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.CreateNewFileToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.CreateNewFileToolStripMenuItem.Image = CType(resources.GetObject("CreateNewFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CreateNewFileToolStripMenuItem.Name = "CreateNewFileToolStripMenuItem"
        Me.CreateNewFileToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.CreateNewFileToolStripMenuItem.Text = "Create New Folder"
        '
        'CreateNewFileToolStripMenuItem2
        '
        Me.CreateNewFileToolStripMenuItem2.BackColor = System.Drawing.Color.White
        Me.CreateNewFileToolStripMenuItem2.ForeColor = System.Drawing.Color.Black
        Me.CreateNewFileToolStripMenuItem2.Image = CType(resources.GetObject("CreateNewFileToolStripMenuItem2.Image"), System.Drawing.Image)
        Me.CreateNewFileToolStripMenuItem2.Name = "CreateNewFileToolStripMenuItem2"
        Me.CreateNewFileToolStripMenuItem2.Size = New System.Drawing.Size(171, 22)
        Me.CreateNewFileToolStripMenuItem2.Text = "Create New File"
        '
        'DeleteFileToolStripMenuItem
        '
        Me.DeleteFileToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.DeleteFileToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.DeleteFileToolStripMenuItem.Image = CType(resources.GetObject("DeleteFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DeleteFileToolStripMenuItem.Name = "DeleteFileToolStripMenuItem"
        Me.DeleteFileToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.DeleteFileToolStripMenuItem.Text = "Delete File"
        '
        'RenameFileToolStripMenuItem
        '
        Me.RenameFileToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.RenameFileToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.RenameFileToolStripMenuItem.Image = CType(resources.GetObject("RenameFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RenameFileToolStripMenuItem.Name = "RenameFileToolStripMenuItem"
        Me.RenameFileToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.RenameFileToolStripMenuItem.Text = "Rename File"
        '
        'CopyFileToolStripMenuItem
        '
        Me.CopyFileToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.CopyFileToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.CopyFileToolStripMenuItem.Image = CType(resources.GetObject("CopyFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CopyFileToolStripMenuItem.Name = "CopyFileToolStripMenuItem"
        Me.CopyFileToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.CopyFileToolStripMenuItem.Text = "Copy File"
        '
        'MoveFileToolStripMenuItem
        '
        Me.MoveFileToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.MoveFileToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.MoveFileToolStripMenuItem.Image = CType(resources.GetObject("MoveFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.MoveFileToolStripMenuItem.Name = "MoveFileToolStripMenuItem"
        Me.MoveFileToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.MoveFileToolStripMenuItem.Text = "Move File"
        '
        'DownloadFileToolStripMenuItem
        '
        Me.DownloadFileToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.DownloadFileToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.DownloadFileToolStripMenuItem.Image = CType(resources.GetObject("DownloadFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DownloadFileToolStripMenuItem.Name = "DownloadFileToolStripMenuItem"
        Me.DownloadFileToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.DownloadFileToolStripMenuItem.Text = "Download File"
        '
        'UploadFileToolStripMenuItem1
        '
        Me.UploadFileToolStripMenuItem1.BackColor = System.Drawing.Color.White
        Me.UploadFileToolStripMenuItem1.ForeColor = System.Drawing.Color.Black
        Me.UploadFileToolStripMenuItem1.Image = CType(resources.GetObject("UploadFileToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.UploadFileToolStripMenuItem1.Name = "UploadFileToolStripMenuItem1"
        Me.UploadFileToolStripMenuItem1.Size = New System.Drawing.Size(171, 22)
        Me.UploadFileToolStripMenuItem1.Text = "Upload File"
        '
        'CodePlexTabControl1
        '
        Me.CodePlexTabControl1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage1)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage2)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage3)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage4)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage5)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage6)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage7)
        Me.CodePlexTabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
        Me.CodePlexTabControl1.Font = New System.Drawing.Font("Segoe UI", 10.0!)
        Me.CodePlexTabControl1.ItemSize = New System.Drawing.Size(140, 41)
        Me.CodePlexTabControl1.Location = New System.Drawing.Point(0, 0)
        Me.CodePlexTabControl1.Name = "CodePlexTabControl1"
        Me.CodePlexTabControl1.SelectedIndex = 0
        Me.CodePlexTabControl1.Size = New System.Drawing.Size(985, 463)
        Me.CodePlexTabControl1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.CodePlexTabControl1.TabIndex = 0
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.TreeView1)
        Me.TabPage1.Location = New System.Drawing.Point(4, 45)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(977, 414)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Main Info"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'TreeView1
        '
        Me.TreeView1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.TreeView1.ContextMenuStrip = Me.rightclick_Info
        Me.TreeView1.Font = New System.Drawing.Font("Segoe UI", 9.0!)
        Me.TreeView1.ImageIndex = 13
        Me.TreeView1.ImageList = Me.ImageList_Info
        Me.TreeView1.Location = New System.Drawing.Point(0, 0)
        Me.TreeView1.Name = "TreeView1"
        TreeNode1.ImageKey = "information-white.png"
        TreeNode1.Name = "computername"
        TreeNode1.Text = "Computer Name: "
        TreeNode2.ImageKey = "user.png"
        TreeNode2.Name = "username"
        TreeNode2.Text = "Username: "
        TreeNode3.ImageKey = "monitor.png"
        TreeNode3.Name = "width"
        TreeNode3.Text = "Virtual Screen Width: "
        TreeNode4.ImageKey = "monitor.png"
        TreeNode4.Name = "height"
        TreeNode4.Text = "Virtual Screen Height: "
        TreeNode5.ImageKey = "memory.png"
        TreeNode5.Name = "apm"
        TreeNode5.Text = "Available Physical Memory: "
        TreeNode6.ImageKey = "memory.png"
        TreeNode6.Name = "avm"
        TreeNode6.Text = "Available Virtual Memory: "
        TreeNode7.ImageKey = "application-monitor.png"
        TreeNode7.Name = "osname"
        TreeNode7.Text = "OS Full Name: "
        TreeNode8.ImageKey = "application-monitor.png"
        TreeNode8.Name = "osplattform"
        TreeNode8.Text = "OS Platform: "
        TreeNode9.ImageKey = "application-monitor.png"
        TreeNode9.Name = "osversion"
        TreeNode9.Text = "OS Version: "
        TreeNode10.ImageKey = "resource-monitor.png"
        TreeNode10.Name = "tpm"
        TreeNode10.Text = "Total Physical Memory: "
        TreeNode11.ImageKey = "resource-monitor.png"
        TreeNode11.Name = "tvm"
        TreeNode11.Text = "Total Virtual Memory: "
        TreeNode12.ImageKey = "battery-charge.png"
        TreeNode12.Name = "BCS"
        TreeNode12.Text = "Battery Charge Status: "
        TreeNode13.ImageKey = "battery.png"
        TreeNode13.Name = "bfl"
        TreeNode13.Text = "Battery Full Lifetime: "
        TreeNode14.ImageKey = "battery.png"
        TreeNode14.Name = "blp"
        TreeNode14.Text = "Battery Life Percent: "
        TreeNode15.ImageKey = "battery--exclamation.png"
        TreeNode15.Name = "blr"
        TreeNode15.Text = "Battery Life Remaining: "
        TreeNode16.ImageKey = "processor.png"
        TreeNode16.Name = "cpu"
        TreeNode16.Text = "CPU Info: "
        TreeNode17.ImageKey = "graphic-card.png"
        TreeNode17.Name = "gpu"
        TreeNode17.Text = "GPU Name: "
        TreeNode18.ImageKey = "application-monitor.png"
        TreeNode18.Name = "uptime"
        TreeNode18.Text = "Uptime: "
        TreeNode19.ImageKey = "computer.png"
        TreeNode19.Name = "Knoten0"
        TreeNode19.Text = "Computer Information"
        TreeNode20.ImageKey = "user-business.png"
        TreeNode20.Name = "Knoten1"
        TreeNode20.Text = "Registered Owner: "
        TreeNode21.ImageKey = "home-medium.png"
        TreeNode21.Name = "Knoten0"
        TreeNode21.Text = "Registered Organization: "
        TreeNode22.ImageKey = "key.png"
        TreeNode22.Name = "Knoten1"
        TreeNode22.Text = "Product Key: "
        TreeNode23.ImageKey = "address-book-blue.png"
        TreeNode23.Name = "Knoten2"
        TreeNode23.Text = "MAC Adress: "
        TreeNode24.ImageKey = "webcam.png"
        TreeNode24.Name = "Knoten3"
        TreeNode24.Text = "Webcam Available: "
        TreeNode25.ImageKey = "wall.png"
        TreeNode25.Name = "Knoten4"
        TreeNode25.Text = "Installed AntiVirus Engine: "
        TreeNode26.ImageKey = "arrow.png"
        TreeNode26.Name = "Knoten5"
        TreeNode26.Text = "Server Location: "
        TreeNode27.ImageKey = "information-shield.png"
        TreeNode27.Name = "Knoten0"
        TreeNode27.Text = "Other Information"
        Me.TreeView1.Nodes.AddRange(New System.Windows.Forms.TreeNode() {TreeNode19, TreeNode27})
        Me.TreeView1.SelectedImageIndex = 13
        Me.TreeView1.ShowNodeToolTips = True
        Me.TreeView1.Size = New System.Drawing.Size(974, 414)
        Me.TreeView1.TabIndex = 1
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.Label1)
        Me.TabPage2.Controls.Add(Me.listprocess)
        Me.TabPage2.Location = New System.Drawing.Point(4, 45)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(977, 414)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Task Manager"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(6, 390)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(117, 19)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Total Processes: 0"
        '
        'listprocess
        '
        Me.listprocess.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.listprocess.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.name, Me.mem, Me.work, Me.init, Me.id})
        Me.listprocess.ContextMenuStrip = Me.rightclickprocess
        Me.listprocess.FullRowSelect = True
        Me.listprocess.GridLines = True
        Me.listprocess.Location = New System.Drawing.Point(0, 0)
        Me.listprocess.Name = "listprocess"
        Me.listprocess.Size = New System.Drawing.Size(974, 387)
        Me.listprocess.Sorting = System.Windows.Forms.SortOrder.Ascending
        Me.listprocess.TabIndex = 2
        Me.listprocess.UseCompatibleStateImageBehavior = False
        Me.listprocess.View = System.Windows.Forms.View.Details
        '
        'name
        '
        Me.name.Text = "Name"
        Me.name.Width = 289
        '
        'mem
        '
        Me.mem.Text = "Memory"
        Me.mem.Width = 294
        '
        'work
        '
        Me.work.Text = "Working"
        Me.work.Width = 111
        '
        'init
        '
        Me.init.Text = "Initialized"
        Me.init.Width = 153
        '
        'id
        '
        Me.id.Text = "ID"
        Me.id.Width = 93
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.Label2)
        Me.TabPage3.Controls.Add(Me.ListBox_Software)
        Me.TabPage3.Location = New System.Drawing.Point(4, 45)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Size = New System.Drawing.Size(977, 414)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Inst. Software"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(2, 389)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(124, 19)
        Me.Label2.TabIndex = 4
        Me.Label2.Text = "Installed Software: "
        '
        'ListBox_Software
        '
        Me.ListBox_Software.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.ListBox_Software.ContextMenuStrip = Me.rightclick_is
        Me.ListBox_Software.FormattingEnabled = True
        Me.ListBox_Software.ItemHeight = 17
        Me.ListBox_Software.Location = New System.Drawing.Point(0, 0)
        Me.ListBox_Software.Name = "ListBox_Software"
        Me.ListBox_Software.Size = New System.Drawing.Size(974, 378)
        Me.ListBox_Software.TabIndex = 0
        '
        'TabPage4
        '
        Me.TabPage4.Controls.Add(Me.ListView_tcp)
        Me.TabPage4.Location = New System.Drawing.Point(4, 45)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Size = New System.Drawing.Size(977, 414)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "TCP Connections"
        Me.TabPage4.UseVisualStyleBackColor = True
        '
        'ListView_tcp
        '
        Me.ListView_tcp.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.ListView_tcp.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4})
        Me.ListView_tcp.ContextMenuStrip = Me.rightclick_tcp
        Me.ListView_tcp.FullRowSelect = True
        Me.ListView_tcp.Location = New System.Drawing.Point(0, 0)
        Me.ListView_tcp.Name = "ListView_tcp"
        Me.ListView_tcp.Size = New System.Drawing.Size(974, 414)
        Me.ListView_tcp.TabIndex = 0
        Me.ListView_tcp.UseCompatibleStateImageBehavior = False
        Me.ListView_tcp.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Protocoll"
        Me.ColumnHeader1.Width = 69
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Local EndPoint"
        Me.ColumnHeader2.Width = 281
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Remote EndPoint"
        Me.ColumnHeader3.Width = 366
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Status"
        Me.ColumnHeader4.Width = 105
        '
        'TabPage5
        '
        Me.TabPage5.Controls.Add(Me.ListView_Startup)
        Me.TabPage5.Location = New System.Drawing.Point(4, 45)
        Me.TabPage5.Name = "TabPage5"
        Me.TabPage5.Size = New System.Drawing.Size(977, 414)
        Me.TabPage5.TabIndex = 4
        Me.TabPage5.Text = "Startup Manager"
        Me.TabPage5.UseVisualStyleBackColor = True
        '
        'ListView_Startup
        '
        Me.ListView_Startup.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.ListView_Startup.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader5, Me.ColumnHeader6})
        Me.ListView_Startup.ContextMenuStrip = Me.rightclick_startup
        Me.ListView_Startup.FullRowSelect = True
        Me.ListView_Startup.Location = New System.Drawing.Point(0, 0)
        Me.ListView_Startup.Name = "ListView_Startup"
        Me.ListView_Startup.Size = New System.Drawing.Size(977, 414)
        Me.ListView_Startup.TabIndex = 0
        Me.ListView_Startup.UseCompatibleStateImageBehavior = False
        Me.ListView_Startup.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Entry Name"
        Me.ColumnHeader5.Width = 222
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "Location"
        Me.ColumnHeader6.Width = 610
        '
        'TabPage6
        '
        Me.TabPage6.Controls.Add(Me.PictureBox2)
        Me.TabPage6.Controls.Add(Me.ListView_Files)
        Me.TabPage6.Controls.Add(Me.TextBox1)
        Me.TabPage6.Controls.Add(Me.ComboBox1)
        Me.TabPage6.Location = New System.Drawing.Point(4, 45)
        Me.TabPage6.Name = "TabPage6"
        Me.TabPage6.Size = New System.Drawing.Size(977, 414)
        Me.TabPage6.TabIndex = 5
        Me.TabPage6.Text = "FileManager"
        Me.TabPage6.UseVisualStyleBackColor = True
        '
        'PictureBox2
        '
        Me.PictureBox2.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.PictureBox2.Image = CType(resources.GetObject("PictureBox2.Image"), System.Drawing.Image)
        Me.PictureBox2.Location = New System.Drawing.Point(943, 13)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(25, 25)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox2.TabIndex = 4
        Me.PictureBox2.TabStop = False
        '
        'ListView_Files
        '
        Me.ListView_Files.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.ListView_Files.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader7, Me.ColumnHeader8, Me.ColumnHeader9, Me.ColumnHeader10, Me.ColumnHeader11})
        Me.ListView_Files.ContextMenuStrip = Me.rightclick_nothing
        Me.ListView_Files.Location = New System.Drawing.Point(8, 44)
        Me.ListView_Files.Name = "ListView_Files"
        Me.ListView_Files.Size = New System.Drawing.Size(960, 362)
        Me.ListView_Files.SmallImageList = Me.ImageList_FileManager
        Me.ListView_Files.TabIndex = 2
        Me.ListView_Files.UseCompatibleStateImageBehavior = False
        Me.ListView_Files.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.Text = "Files"
        Me.ColumnHeader7.Width = 360
        '
        'ColumnHeader8
        '
        Me.ColumnHeader8.Text = "Creation Time"
        Me.ColumnHeader8.Width = 161
        '
        'ColumnHeader9
        '
        Me.ColumnHeader9.Text = "Last Access Time"
        Me.ColumnHeader9.Width = 182
        '
        'ColumnHeader10
        '
        Me.ColumnHeader10.Text = "File Size"
        Me.ColumnHeader10.Width = 98
        '
        'ColumnHeader11
        '
        Me.ColumnHeader11.Text = ""
        Me.ColumnHeader11.Width = 0
        '
        'TextBox1
        '
        Me.TextBox1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.TextBox1.Location = New System.Drawing.Point(113, 13)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(824, 25)
        Me.TextBox1.TabIndex = 1
        '
        'ComboBox1
        '
        Me.ComboBox1.FormattingEnabled = True
        Me.ComboBox1.Location = New System.Drawing.Point(8, 13)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(99, 25)
        Me.ComboBox1.TabIndex = 0
        '
        'TabPage7
        '
        Me.TabPage7.Controls.Add(Me.ListView_Service)
        Me.TabPage7.Location = New System.Drawing.Point(4, 45)
        Me.TabPage7.Name = "TabPage7"
        Me.TabPage7.Size = New System.Drawing.Size(977, 414)
        Me.TabPage7.TabIndex = 6
        Me.TabPage7.Text = "Services"
        Me.TabPage7.UseVisualStyleBackColor = True
        '
        'ListView_Service
        '
        Me.ListView_Service.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.ListView_Service.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader12, Me.ColumnHeader13, Me.ColumnHeader14, Me.ColumnHeader15})
        Me.ListView_Service.ContextMenuStrip = Me.rightclick_service
        Me.ListView_Service.FullRowSelect = True
        Me.ListView_Service.Location = New System.Drawing.Point(3, 3)
        Me.ListView_Service.Name = "ListView_Service"
        Me.ListView_Service.Size = New System.Drawing.Size(971, 408)
        Me.ListView_Service.SmallImageList = Me.ImageList_Service
        Me.ListView_Service.TabIndex = 0
        Me.ListView_Service.UseCompatibleStateImageBehavior = False
        Me.ListView_Service.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader12
        '
        Me.ColumnHeader12.Text = "Service Name"
        Me.ColumnHeader12.Width = 314
        '
        'ColumnHeader13
        '
        Me.ColumnHeader13.Text = "Display Name"
        Me.ColumnHeader13.Width = 311
        '
        'ColumnHeader14
        '
        Me.ColumnHeader14.Text = "Service Type"
        Me.ColumnHeader14.Width = 183
        '
        'ColumnHeader15
        '
        Me.ColumnHeader15.Text = "Status"
        Me.ColumnHeader15.Width = 132
        '
        'ImageList_Service
        '
        Me.ImageList_Service.ImageStream = CType(resources.GetObject("ImageList_Service.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList_Service.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList_Service.Images.SetKeyName(0, "gear.png")
        '
        'SystemInformation
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(984, 463)
        Me.Controls.Add(Me.CodePlexTabControl1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MinimumSize = New System.Drawing.Size(880, 502)
        'Me.name = "SystemInformation"
        Me.Text = "System Information - "
        Me.rightclick_Info.ResumeLayout(False)
        Me.rightclickprocess.ResumeLayout(False)
        Me.rightclick_is.ResumeLayout(False)
        Me.rightclick_tcp.ResumeLayout(False)
        Me.rightclick_startup.ResumeLayout(False)
        Me.rightclick_nothing.ResumeLayout(False)
        Me.rightclick_service.ResumeLayout(False)
        Me.rightclick_filemanagerfolders.ResumeLayout(False)
        Me.rightclick_filemanagerfiles.ResumeLayout(False)
        Me.CodePlexTabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage3.PerformLayout()
        Me.TabPage4.ResumeLayout(False)
        Me.TabPage5.ResumeLayout(False)
        Me.TabPage6.ResumeLayout(False)
        Me.TabPage6.PerformLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage7.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents CodePlexTabControl1 As Diamond_Remote_Administration_Tool.CodePlexTabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents TreeView1 As System.Windows.Forms.TreeView
    Friend WithEvents ImageList_Info As System.Windows.Forms.ImageList
    Friend WithEvents rightclick_Info As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RefreshToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents listprocess As System.Windows.Forms.ListView
    Friend WithEvents name As System.Windows.Forms.ColumnHeader
    Friend WithEvents mem As System.Windows.Forms.ColumnHeader
    Friend WithEvents work As System.Windows.Forms.ColumnHeader
    Friend WithEvents init As System.Windows.Forms.ColumnHeader
    Friend WithEvents id As System.Windows.Forms.ColumnHeader
    Friend WithEvents rightclickprocess As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KillProcessToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NewProcessToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents ListBox_Software As System.Windows.Forms.ListBox
    Friend WithEvents rightclick_is As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem2 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents TabPage4 As System.Windows.Forms.TabPage
    Friend WithEvents ListView_tcp As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents rightclick_tcp As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem3 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TabPage5 As System.Windows.Forms.TabPage
    Friend WithEvents ListView_Startup As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader6 As System.Windows.Forms.ColumnHeader
    Friend WithEvents rightclick_startup As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem4 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoveToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TabPage6 As System.Windows.Forms.TabPage
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents ColumnHeader7 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader8 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader9 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader10 As System.Windows.Forms.ColumnHeader
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
    Friend WithEvents ImageList_FileManager As System.Windows.Forms.ImageList
    Public WithEvents ListView_Files As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader11 As System.Windows.Forms.ColumnHeader
    Friend WithEvents rightclick_filemanagerfolders As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RefreshToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CreateNewFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CreateNewFileToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DeleteFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RenameFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopyThisFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MoveThisFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UploadFileToolStripMenuItem2 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents rightclick_filemanagerfiles As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RefreshToolStripMenuItem2 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CreateNewFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CreateNewFileToolStripMenuItem2 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DeleteFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RenameFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopyFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MoveFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DownloadFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UploadFileToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents rightclick_nothing As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RefreshToolStripMenuItem3 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CreateNewFolderToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CreateNewFileToolStripMenuItem3 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UploadFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TabPage7 As System.Windows.Forms.TabPage
    Friend WithEvents ListView_Service As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader12 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader13 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader14 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader15 As System.Windows.Forms.ColumnHeader
    Friend WithEvents rightclick_service As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RefreshToolStripMenuItem4 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CloseToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ContinueToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PauseToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StartToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StopToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ImageList_Service As System.Windows.Forms.ImageList
End Class
