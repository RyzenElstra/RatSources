<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
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

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.CloseToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CloseToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.UninstallToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ii = New System.Windows.Forms.ImageList(Me.components)
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.NotifyIcon1 = New System.Windows.Forms.NotifyIcon(Me.components)
        Me.ContextMenuStrip2 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.SdfghToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripSeparator()
        Me.ExitToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.c2 = New System.Windows.Forms.ComboBox()
        Me.c1 = New System.Windows.Forms.ComboBox()
        Me.c = New System.Windows.Forms.NumericUpDown()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        Me.ListView1 = New System.Windows.Forms.ListView()
        Me.ColumnHeader13 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ToolStrip1 = New System.Windows.Forms.ToolStrip()
        Me.ToolStripLabel1 = New System.Windows.Forms.ToolStripLabel()
        Me.ToolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripLabel2 = New System.Windows.Forms.ToolStripLabel()
        Me.ToolStripSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripLabel3 = New System.Windows.Forms.ToolStripLabel()
        Me.ToolStripSeparator3 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripButton1 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton2 = New System.Windows.Forms.ToolStripButton()
        Me.L1 = New Client.LV()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader6 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader7 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CheckForUpdateToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.ContextMenuStrip2.SuspendLayout()
        CType(Me.c, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        Me.ToolStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.BackgroundImage = CType(resources.GetObject("ContextMenuStrip1.BackgroundImage"), System.Drawing.Image)
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CloseToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(107, 26)
        '
        'CloseToolStripMenuItem
        '
        Me.CloseToolStripMenuItem.BackColor = System.Drawing.Color.DeepSkyBlue
        Me.CloseToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CloseToolStripMenuItem1, Me.UninstallToolStripMenuItem})
        Me.CloseToolStripMenuItem.ForeColor = System.Drawing.SystemColors.MenuHighlight
        Me.CloseToolStripMenuItem.Image = CType(resources.GetObject("CloseToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CloseToolStripMenuItem.Name = "CloseToolStripMenuItem"
        Me.CloseToolStripMenuItem.Size = New System.Drawing.Size(106, 22)
        Me.CloseToolStripMenuItem.Text = "Server"
        '
        'CloseToolStripMenuItem1
        '
        Me.CloseToolStripMenuItem1.BackColor = System.Drawing.Color.DimGray
        Me.CloseToolStripMenuItem1.ForeColor = System.Drawing.Color.Black
        Me.CloseToolStripMenuItem1.Name = "CloseToolStripMenuItem1"
        Me.CloseToolStripMenuItem1.Size = New System.Drawing.Size(120, 22)
        Me.CloseToolStripMenuItem1.Text = "close"
        '
        'UninstallToolStripMenuItem
        '
        Me.UninstallToolStripMenuItem.BackColor = System.Drawing.Color.DeepSkyBlue
        Me.UninstallToolStripMenuItem.ForeColor = System.Drawing.Color.Black
        Me.UninstallToolStripMenuItem.Name = "UninstallToolStripMenuItem"
        Me.UninstallToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.UninstallToolStripMenuItem.Text = "Uninstall"
        '
        'ii
        '
        Me.ii.ImageStream = CType(resources.GetObject("ii.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ii.TransparentColor = System.Drawing.Color.Transparent
        Me.ii.Images.SetKeyName(0, "F15-Sniper.png")
        Me.ii.Images.SetKeyName(1, "1.gif")
        Me.ii.Images.SetKeyName(2, "2.gif")
        Me.ii.Images.SetKeyName(3, "3.gif")
        Me.ii.Images.SetKeyName(4, "4.gif")
        Me.ii.Images.SetKeyName(5, "5.gif")
        Me.ii.Images.SetKeyName(6, "6.gif")
        Me.ii.Images.SetKeyName(7, "7.gif")
        Me.ii.Images.SetKeyName(8, "8.gif")
        Me.ii.Images.SetKeyName(9, "9.gif")
        Me.ii.Images.SetKeyName(10, "10.gif")
        Me.ii.Images.SetKeyName(11, "11.gif")
        Me.ii.Images.SetKeyName(12, "12.gif")
        Me.ii.Images.SetKeyName(13, "13.gif")
        Me.ii.Images.SetKeyName(14, "14.gif")
        Me.ii.Images.SetKeyName(15, "15.gif")
        Me.ii.Images.SetKeyName(16, "16.gif")
        Me.ii.Images.SetKeyName(17, "17.gif")
        Me.ii.Images.SetKeyName(18, "18.gif")
        Me.ii.Images.SetKeyName(19, "19.gif")
        Me.ii.Images.SetKeyName(20, "20.gif")
        Me.ii.Images.SetKeyName(21, "21.gif")
        Me.ii.Images.SetKeyName(22, "22.gif")
        Me.ii.Images.SetKeyName(23, "23.gif")
        Me.ii.Images.SetKeyName(24, "24.gif")
        Me.ii.Images.SetKeyName(25, "25.gif")
        Me.ii.Images.SetKeyName(26, "26.gif")
        Me.ii.Images.SetKeyName(27, "27.gif")
        Me.ii.Images.SetKeyName(28, "28.gif")
        Me.ii.Images.SetKeyName(29, "29.gif")
        Me.ii.Images.SetKeyName(30, "30.gif")
        Me.ii.Images.SetKeyName(31, "31.gif")
        Me.ii.Images.SetKeyName(32, "32.gif")
        Me.ii.Images.SetKeyName(33, "33.gif")
        Me.ii.Images.SetKeyName(34, "34.gif")
        Me.ii.Images.SetKeyName(35, "35.gif")
        Me.ii.Images.SetKeyName(36, "36.gif")
        Me.ii.Images.SetKeyName(37, "37.gif")
        Me.ii.Images.SetKeyName(38, "38.gif")
        Me.ii.Images.SetKeyName(39, "39.gif")
        Me.ii.Images.SetKeyName(40, "40.gif")
        Me.ii.Images.SetKeyName(41, "41.gif")
        Me.ii.Images.SetKeyName(42, "42.gif")
        Me.ii.Images.SetKeyName(43, "43.gif")
        Me.ii.Images.SetKeyName(44, "44.gif")
        Me.ii.Images.SetKeyName(45, "45.gif")
        Me.ii.Images.SetKeyName(46, "46.gif")
        Me.ii.Images.SetKeyName(47, "47.gif")
        Me.ii.Images.SetKeyName(48, "48.gif")
        Me.ii.Images.SetKeyName(49, "49.gif")
        Me.ii.Images.SetKeyName(50, "50.gif")
        Me.ii.Images.SetKeyName(51, "51.gif")
        Me.ii.Images.SetKeyName(52, "52.gif")
        Me.ii.Images.SetKeyName(53, "53.gif")
        Me.ii.Images.SetKeyName(54, "54.gif")
        Me.ii.Images.SetKeyName(55, "55.gif")
        Me.ii.Images.SetKeyName(56, "56.gif")
        Me.ii.Images.SetKeyName(57, "57.gif")
        Me.ii.Images.SetKeyName(58, "58.gif")
        Me.ii.Images.SetKeyName(59, "59.gif")
        Me.ii.Images.SetKeyName(60, "60.gif")
        Me.ii.Images.SetKeyName(61, "61.gif")
        Me.ii.Images.SetKeyName(62, "62.gif")
        Me.ii.Images.SetKeyName(63, "63.gif")
        Me.ii.Images.SetKeyName(64, "64.gif")
        Me.ii.Images.SetKeyName(65, "65.gif")
        Me.ii.Images.SetKeyName(66, "66.gif")
        Me.ii.Images.SetKeyName(67, "67.gif")
        Me.ii.Images.SetKeyName(68, "68.gif")
        Me.ii.Images.SetKeyName(69, "69.gif")
        Me.ii.Images.SetKeyName(70, "70.gif")
        Me.ii.Images.SetKeyName(71, "71.gif")
        Me.ii.Images.SetKeyName(72, "72.gif")
        Me.ii.Images.SetKeyName(73, "73.gif")
        Me.ii.Images.SetKeyName(74, "74.gif")
        Me.ii.Images.SetKeyName(75, "75.gif")
        Me.ii.Images.SetKeyName(76, "76.gif")
        Me.ii.Images.SetKeyName(77, "77.gif")
        Me.ii.Images.SetKeyName(78, "78.gif")
        Me.ii.Images.SetKeyName(79, "79.gif")
        Me.ii.Images.SetKeyName(80, "80.gif")
        Me.ii.Images.SetKeyName(81, "81.gif")
        Me.ii.Images.SetKeyName(82, "82.gif")
        Me.ii.Images.SetKeyName(83, "83.gif")
        Me.ii.Images.SetKeyName(84, "84.gif")
        Me.ii.Images.SetKeyName(85, "85.gif")
        Me.ii.Images.SetKeyName(86, "86.gif")
        Me.ii.Images.SetKeyName(87, "87.gif")
        Me.ii.Images.SetKeyName(88, "88.gif")
        Me.ii.Images.SetKeyName(89, "89.gif")
        Me.ii.Images.SetKeyName(90, "90.gif")
        Me.ii.Images.SetKeyName(91, "91.gif")
        Me.ii.Images.SetKeyName(92, "92.gif")
        Me.ii.Images.SetKeyName(93, "93.gif")
        Me.ii.Images.SetKeyName(94, "94.gif")
        Me.ii.Images.SetKeyName(95, "95.gif")
        Me.ii.Images.SetKeyName(96, "96.gif")
        Me.ii.Images.SetKeyName(97, "97.gif")
        Me.ii.Images.SetKeyName(98, "98.gif")
        Me.ii.Images.SetKeyName(99, "99.gif")
        Me.ii.Images.SetKeyName(100, "100.gif")
        Me.ii.Images.SetKeyName(101, "101.gif")
        Me.ii.Images.SetKeyName(102, "102.gif")
        Me.ii.Images.SetKeyName(103, "103.gif")
        Me.ii.Images.SetKeyName(104, "104.gif")
        Me.ii.Images.SetKeyName(105, "105.gif")
        Me.ii.Images.SetKeyName(106, "106.gif")
        Me.ii.Images.SetKeyName(107, "107.gif")
        Me.ii.Images.SetKeyName(108, "108.gif")
        Me.ii.Images.SetKeyName(109, "109.gif")
        Me.ii.Images.SetKeyName(110, "110.gif")
        Me.ii.Images.SetKeyName(111, "111.gif")
        Me.ii.Images.SetKeyName(112, "112.gif")
        Me.ii.Images.SetKeyName(113, "113.gif")
        Me.ii.Images.SetKeyName(114, "114.gif")
        Me.ii.Images.SetKeyName(115, "115.gif")
        Me.ii.Images.SetKeyName(116, "116.gif")
        Me.ii.Images.SetKeyName(117, "117.gif")
        Me.ii.Images.SetKeyName(118, "118.gif")
        Me.ii.Images.SetKeyName(119, "119.gif")
        Me.ii.Images.SetKeyName(120, "120.gif")
        Me.ii.Images.SetKeyName(121, "121.gif")
        Me.ii.Images.SetKeyName(122, "122.gif")
        Me.ii.Images.SetKeyName(123, "123.gif")
        Me.ii.Images.SetKeyName(124, "124.gif")
        Me.ii.Images.SetKeyName(125, "125.gif")
        Me.ii.Images.SetKeyName(126, "126.gif")
        Me.ii.Images.SetKeyName(127, "127.gif")
        Me.ii.Images.SetKeyName(128, "128.gif")
        Me.ii.Images.SetKeyName(129, "129.gif")
        Me.ii.Images.SetKeyName(130, "130.gif")
        Me.ii.Images.SetKeyName(131, "131.gif")
        Me.ii.Images.SetKeyName(132, "132.gif")
        Me.ii.Images.SetKeyName(133, "133.gif")
        Me.ii.Images.SetKeyName(134, "134.gif")
        Me.ii.Images.SetKeyName(135, "135.gif")
        Me.ii.Images.SetKeyName(136, "136.gif")
        Me.ii.Images.SetKeyName(137, "137.gif")
        Me.ii.Images.SetKeyName(138, "138.gif")
        Me.ii.Images.SetKeyName(139, "139.gif")
        Me.ii.Images.SetKeyName(140, "140.gif")
        Me.ii.Images.SetKeyName(141, "141.gif")
        Me.ii.Images.SetKeyName(142, "142.gif")
        Me.ii.Images.SetKeyName(143, "143.gif")
        Me.ii.Images.SetKeyName(144, "144.gif")
        Me.ii.Images.SetKeyName(145, "145.gif")
        Me.ii.Images.SetKeyName(146, "146.gif")
        Me.ii.Images.SetKeyName(147, "147.gif")
        Me.ii.Images.SetKeyName(148, "148.gif")
        Me.ii.Images.SetKeyName(149, "149.gif")
        Me.ii.Images.SetKeyName(150, "150.gif")
        Me.ii.Images.SetKeyName(151, "151.gif")
        Me.ii.Images.SetKeyName(152, "152.gif")
        Me.ii.Images.SetKeyName(153, "153.gif")
        Me.ii.Images.SetKeyName(154, "154.gif")
        Me.ii.Images.SetKeyName(155, "155.gif")
        Me.ii.Images.SetKeyName(156, "156.gif")
        Me.ii.Images.SetKeyName(157, "157.gif")
        Me.ii.Images.SetKeyName(158, "158.gif")
        Me.ii.Images.SetKeyName(159, "159.gif")
        Me.ii.Images.SetKeyName(160, "160.gif")
        Me.ii.Images.SetKeyName(161, "161.gif")
        Me.ii.Images.SetKeyName(162, "162.gif")
        Me.ii.Images.SetKeyName(163, "163.gif")
        Me.ii.Images.SetKeyName(164, "164.gif")
        Me.ii.Images.SetKeyName(165, "165.gif")
        Me.ii.Images.SetKeyName(166, "166.gif")
        Me.ii.Images.SetKeyName(167, "167.gif")
        Me.ii.Images.SetKeyName(168, "168.gif")
        Me.ii.Images.SetKeyName(169, "169.gif")
        Me.ii.Images.SetKeyName(170, "170.gif")
        Me.ii.Images.SetKeyName(171, "171.gif")
        Me.ii.Images.SetKeyName(172, "172.gif")
        Me.ii.Images.SetKeyName(173, "173.gif")
        Me.ii.Images.SetKeyName(174, "174.gif")
        Me.ii.Images.SetKeyName(175, "175.gif")
        Me.ii.Images.SetKeyName(176, "176.gif")
        Me.ii.Images.SetKeyName(177, "177.gif")
        Me.ii.Images.SetKeyName(178, "178.gif")
        Me.ii.Images.SetKeyName(179, "179.gif")
        Me.ii.Images.SetKeyName(180, "180.gif")
        Me.ii.Images.SetKeyName(181, "181.gif")
        Me.ii.Images.SetKeyName(182, "182.gif")
        Me.ii.Images.SetKeyName(183, "183.gif")
        Me.ii.Images.SetKeyName(184, "184.gif")
        Me.ii.Images.SetKeyName(185, "185.gif")
        Me.ii.Images.SetKeyName(186, "186.gif")
        Me.ii.Images.SetKeyName(187, "187.gif")
        Me.ii.Images.SetKeyName(188, "188.gif")
        Me.ii.Images.SetKeyName(189, "189.gif")
        Me.ii.Images.SetKeyName(190, "190.gif")
        Me.ii.Images.SetKeyName(191, "191.gif")
        Me.ii.Images.SetKeyName(192, "192.gif")
        Me.ii.Images.SetKeyName(193, "193.gif")
        Me.ii.Images.SetKeyName(194, "194.gif")
        Me.ii.Images.SetKeyName(195, "195.gif")
        Me.ii.Images.SetKeyName(196, "196.gif")
        Me.ii.Images.SetKeyName(197, "197.gif")
        Me.ii.Images.SetKeyName(198, "198.gif")
        Me.ii.Images.SetKeyName(199, "199.gif")
        Me.ii.Images.SetKeyName(200, "200.gif")
        Me.ii.Images.SetKeyName(201, "201.gif")
        Me.ii.Images.SetKeyName(202, "202.gif")
        Me.ii.Images.SetKeyName(203, "203.gif")
        Me.ii.Images.SetKeyName(204, "204.gif")
        Me.ii.Images.SetKeyName(205, "205.gif")
        Me.ii.Images.SetKeyName(206, "206.gif")
        Me.ii.Images.SetKeyName(207, "207.jpg")
        Me.ii.Images.SetKeyName(208, "208.gif")
        Me.ii.Images.SetKeyName(209, "209.gif")
        Me.ii.Images.SetKeyName(210, "210.gif")
        Me.ii.Images.SetKeyName(211, "211.gif")
        Me.ii.Images.SetKeyName(212, "212.gif")
        Me.ii.Images.SetKeyName(213, "213.gif")
        Me.ii.Images.SetKeyName(214, "214.gif")
        Me.ii.Images.SetKeyName(215, "215.gif")
        Me.ii.Images.SetKeyName(216, "216.gif")
        Me.ii.Images.SetKeyName(217, "217.gif")
        Me.ii.Images.SetKeyName(218, "218.gif")
        Me.ii.Images.SetKeyName(219, "219.gif")
        Me.ii.Images.SetKeyName(220, "220.gif")
        Me.ii.Images.SetKeyName(221, "221.gif")
        Me.ii.Images.SetKeyName(222, "222.gif")
        Me.ii.Images.SetKeyName(223, "223.gif")
        Me.ii.Images.SetKeyName(224, "224.gif")
        Me.ii.Images.SetKeyName(225, "225.gif")
        Me.ii.Images.SetKeyName(226, "226.gif")
        Me.ii.Images.SetKeyName(227, "227.gif")
        Me.ii.Images.SetKeyName(228, "228.gif")
        Me.ii.Images.SetKeyName(229, "229.gif")
        Me.ii.Images.SetKeyName(230, "230.gif")
        Me.ii.Images.SetKeyName(231, "231.gif")
        Me.ii.Images.SetKeyName(232, "232.gif")
        Me.ii.Images.SetKeyName(233, "233.gif")
        Me.ii.Images.SetKeyName(234, "234.gif")
        Me.ii.Images.SetKeyName(235, "235.gif")
        Me.ii.Images.SetKeyName(236, "236.gif")
        Me.ii.Images.SetKeyName(237, "237.gif")
        Me.ii.Images.SetKeyName(238, "238.gif")
        Me.ii.Images.SetKeyName(239, "239.gif")
        Me.ii.Images.SetKeyName(240, "240.gif")
        Me.ii.Images.SetKeyName(241, "241.gif")
        Me.ii.Images.SetKeyName(242, "basic.png")
        Me.ii.Images.SetKeyName(243, "connections.png")
        Me.ii.Images.SetKeyName(244, "group.png")
        Me.ii.Images.SetKeyName(245, "misc.png")
        Me.ii.Images.SetKeyName(246, "user.png")
        Me.ii.Images.SetKeyName(247, "user_gray.png")
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        '
        'NotifyIcon1
        '
        Me.NotifyIcon1.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info
        Me.NotifyIcon1.ContextMenuStrip = Me.ContextMenuStrip2
        Me.NotifyIcon1.Visible = True
        '
        'ContextMenuStrip2
        '
        Me.ContextMenuStrip2.BackgroundImage = CType(resources.GetObject("ContextMenuStrip2.BackgroundImage"), System.Drawing.Image)
        Me.ContextMenuStrip2.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.SdfghToolStripMenuItem, Me.ToolStripMenuItem1, Me.CheckForUpdateToolStripMenuItem, Me.ExitToolStripMenuItem})
        Me.ContextMenuStrip2.Name = "ContextMenuStrip2"
        Me.ContextMenuStrip2.RenderMode = System.Windows.Forms.ToolStripRenderMode.System
        Me.ContextMenuStrip2.Size = New System.Drawing.Size(166, 98)
        '
        'SdfghToolStripMenuItem
        '
        Me.SdfghToolStripMenuItem.ForeColor = System.Drawing.SystemColors.MenuHighlight
        Me.SdfghToolStripMenuItem.Image = CType(resources.GetObject("SdfghToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SdfghToolStripMenuItem.Name = "SdfghToolStripMenuItem"
        Me.SdfghToolStripMenuItem.Size = New System.Drawing.Size(165, 22)
        Me.SdfghToolStripMenuItem.Text = "Show"
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(162, 6)
        '
        'ExitToolStripMenuItem
        '
        Me.ExitToolStripMenuItem.ForeColor = System.Drawing.SystemColors.MenuHighlight
        Me.ExitToolStripMenuItem.Image = CType(resources.GetObject("ExitToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ExitToolStripMenuItem.Name = "ExitToolStripMenuItem"
        Me.ExitToolStripMenuItem.Size = New System.Drawing.Size(165, 22)
        Me.ExitToolStripMenuItem.Text = "Exit"
        '
        'c2
        '
        Me.c2.FormattingEnabled = True
        Me.c2.Location = New System.Drawing.Point(359, 330)
        Me.c2.Name = "c2"
        Me.c2.Size = New System.Drawing.Size(121, 21)
        Me.c2.TabIndex = 7
        Me.c2.Visible = False
        '
        'c1
        '
        Me.c1.FormattingEnabled = True
        Me.c1.Location = New System.Drawing.Point(202, 305)
        Me.c1.Name = "c1"
        Me.c1.Size = New System.Drawing.Size(121, 21)
        Me.c1.TabIndex = 8
        Me.c1.Visible = False
        '
        'c
        '
        Me.c.Location = New System.Drawing.Point(246, 358)
        Me.c.Name = "c"
        Me.c.Size = New System.Drawing.Size(120, 20)
        Me.c.TabIndex = 9
        Me.c.Value = New Decimal(New Integer() {20, 0, 0, 0})
        Me.c.Visible = False
        '
        'SplitContainer1
        '
        Me.SplitContainer1.BackColor = System.Drawing.Color.DeepSkyBlue
        Me.SplitContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer1.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer1.Name = "SplitContainer1"
        Me.SplitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal
        '
        'SplitContainer1.Panel1
        '
        Me.SplitContainer1.Panel1.Controls.Add(Me.L1)
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.ListView1)
        Me.SplitContainer1.Panel2.Controls.Add(Me.ToolStrip1)
        Me.SplitContainer1.Size = New System.Drawing.Size(864, 443)
        Me.SplitContainer1.SplitterDistance = 221
        Me.SplitContainer1.TabIndex = 24
        '
        'ListView1
        '
        Me.ListView1.BackColor = System.Drawing.Color.Black
        Me.ListView1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.ListView1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader13})
        Me.ListView1.ContextMenuStrip = Me.ContextMenuStrip1
        Me.ListView1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ListView1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.ListView1.ForeColor = System.Drawing.Color.DeepSkyBlue
        Me.ListView1.FullRowSelect = True
        Me.ListView1.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.None
        Me.ListView1.LargeImageList = Me.ii
        Me.ListView1.Location = New System.Drawing.Point(0, 0)
        Me.ListView1.Name = "ListView1"
        Me.ListView1.Size = New System.Drawing.Size(864, 193)
        Me.ListView1.SmallImageList = Me.ii
        Me.ListView1.TabIndex = 24
        Me.ListView1.UseCompatibleStateImageBehavior = False
        Me.ListView1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader13
        '
        Me.ColumnHeader13.Text = "Logs"
        Me.ColumnHeader13.Width = 695
        '
        'ToolStrip1
        '
        Me.ToolStrip1.BackColor = System.Drawing.Color.DeepSkyBlue
        Me.ToolStrip1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.ToolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden
        Me.ToolStrip1.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.ToolStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripLabel1, Me.ToolStripSeparator1, Me.ToolStripLabel2, Me.ToolStripSeparator2, Me.ToolStripLabel3, Me.ToolStripSeparator3, Me.ToolStripButton1, Me.ToolStripButton2})
        Me.ToolStrip1.Location = New System.Drawing.Point(0, 193)
        Me.ToolStrip1.Name = "ToolStrip1"
        Me.ToolStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System
        Me.ToolStrip1.Size = New System.Drawing.Size(864, 25)
        Me.ToolStrip1.TabIndex = 25
        Me.ToolStrip1.Text = "Hacx"
        '
        'ToolStripLabel1
        '
        Me.ToolStripLabel1.BackColor = System.Drawing.SystemColors.Control
        Me.ToolStripLabel1.ForeColor = System.Drawing.Color.Black
        Me.ToolStripLabel1.Name = "ToolStripLabel1"
        Me.ToolStripLabel1.Size = New System.Drawing.Size(91, 22)
        Me.ToolStripLabel1.Text = "Port : [ waiting ]"
        '
        'ToolStripSeparator1
        '
        Me.ToolStripSeparator1.Name = "ToolStripSeparator1"
        Me.ToolStripSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'ToolStripLabel2
        '
        Me.ToolStripLabel2.BackColor = System.Drawing.SystemColors.Control
        Me.ToolStripLabel2.ForeColor = System.Drawing.Color.Black
        Me.ToolStripLabel2.Name = "ToolStripLabel2"
        Me.ToolStripLabel2.Size = New System.Drawing.Size(83, 22)
        Me.ToolStripLabel2.Text = "[ Build Server ]"
        '
        'ToolStripSeparator2
        '
        Me.ToolStripSeparator2.Name = "ToolStripSeparator2"
        Me.ToolStripSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'ToolStripLabel3
        '
        Me.ToolStripLabel3.BackColor = System.Drawing.SystemColors.Control
        Me.ToolStripLabel3.ForeColor = System.Drawing.Color.Black
        Me.ToolStripLabel3.Name = "ToolStripLabel3"
        Me.ToolStripLabel3.Size = New System.Drawing.Size(57, 22)
        Me.ToolStripLabel3.Text = "[ About  ]"
        '
        'ToolStripSeparator3
        '
        Me.ToolStripSeparator3.Name = "ToolStripSeparator3"
        Me.ToolStripSeparator3.Size = New System.Drawing.Size(6, 25)
        '
        'ToolStripButton1
        '
        Me.ToolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton1.Image = CType(resources.GetObject("ToolStripButton1.Image"), System.Drawing.Image)
        Me.ToolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton1.Name = "ToolStripButton1"
        Me.ToolStripButton1.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton1.Text = "ToolStripButton1"
        '
        'ToolStripButton2
        '
        Me.ToolStripButton2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton2.Image = CType(resources.GetObject("ToolStripButton2.Image"), System.Drawing.Image)
        Me.ToolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton2.Name = "ToolStripButton2"
        Me.ToolStripButton2.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton2.Text = "ToolStripButton1"
        '
        'L1
        '
        Me.L1.BackColor = System.Drawing.Color.Black
        Me.L1.BackgroundImage = CType(resources.GetObject("L1.BackgroundImage"), System.Drawing.Image)
        Me.L1.BackgroundImageTiled = True
        Me.L1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.L1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader6, Me.ColumnHeader7})
        Me.L1.ContextMenuStrip = Me.ContextMenuStrip1
        Me.L1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.L1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Bold)
        Me.L1.ForeColor = System.Drawing.Color.DeepSkyBlue
        Me.L1.FullRowSelect = True
        Me.L1.LargeImageList = Me.ii
        Me.L1.Location = New System.Drawing.Point(0, 0)
        Me.L1.Name = "L1"
        Me.L1.OwnerDraw = True
        Me.L1.Size = New System.Drawing.Size(864, 221)
        Me.L1.SmallImageList = Me.ii
        Me.L1.TabIndex = 0
        Me.L1.UseCompatibleStateImageBehavior = False
        Me.L1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Country"
        Me.ColumnHeader1.Width = 123
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "IP"
        Me.ColumnHeader2.Width = 108
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Server ID"
        Me.ColumnHeader3.Width = 126
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Computer/User"
        Me.ColumnHeader4.Width = 163
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "OS"
        Me.ColumnHeader6.Width = 169
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.Text = "Anti Virus"
        Me.ColumnHeader7.Width = 174
        '
        'CheckForUpdateToolStripMenuItem
        '
        Me.CheckForUpdateToolStripMenuItem.ForeColor = System.Drawing.Color.DeepSkyBlue
        Me.CheckForUpdateToolStripMenuItem.Image = CType(resources.GetObject("CheckForUpdateToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CheckForUpdateToolStripMenuItem.Name = "CheckForUpdateToolStripMenuItem"
        Me.CheckForUpdateToolStripMenuItem.Size = New System.Drawing.Size(165, 22)
        Me.CheckForUpdateToolStripMenuItem.Text = "Check for update"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(864, 443)
        Me.Controls.Add(Me.SplitContainer1)
        Me.Controls.Add(Me.c1)
        Me.Controls.Add(Me.c2)
        Me.Controls.Add(Me.c)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Form1"
        Me.Opacity = 0.9R
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "InternetXHackers -RAT Coded By HacxXcoder Version one Collect Victims"
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.ContextMenuStrip2.ResumeLayout(False)
        CType(Me.c, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.Panel1.ResumeLayout(False)
        Me.SplitContainer1.Panel2.ResumeLayout(False)
        Me.SplitContainer1.Panel2.PerformLayout()
        Me.SplitContainer1.ResumeLayout(False)
        Me.ToolStrip1.ResumeLayout(False)
        Me.ToolStrip1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents CloseToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ii As System.Windows.Forms.ImageList
    Friend WithEvents CloseToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents NotifyIcon1 As System.Windows.Forms.NotifyIcon
    Friend WithEvents ContextMenuStrip2 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents SdfghToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ExitToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UninstallToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents c2 As System.Windows.Forms.ComboBox
    Friend WithEvents c1 As System.Windows.Forms.ComboBox
    Friend WithEvents c As System.Windows.Forms.NumericUpDown
    Friend WithEvents SplitContainer1 As System.Windows.Forms.SplitContainer
    Friend WithEvents ToolStrip1 As System.Windows.Forms.ToolStrip
    Friend WithEvents ListView1 As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader13 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ToolStripLabel1 As System.Windows.Forms.ToolStripLabel
    Friend WithEvents ToolStripSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ToolStripLabel2 As System.Windows.Forms.ToolStripLabel
    Friend WithEvents ToolStripSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ToolStripButton1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripButton2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents L1 As Client.LV
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader6 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader7 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ToolStripLabel3 As System.Windows.Forms.ToolStripLabel
    Friend WithEvents ToolStripSeparator3 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents CheckForUpdateToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    '// Friend WithEvents SkinCrafter1 As DMSoft.SkinCrafter

End Class
