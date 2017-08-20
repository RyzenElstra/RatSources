<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class logs
    Inherits System.Windows.Forms.UserControl

    'UserControl overrides dispose to clean up the component list.
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
        Me.Label4 = New System.Windows.Forms.Label()
        Me.USB = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.cn = New System.Windows.Forms.Label()
        Me.snt = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.rc = New System.Windows.Forms.Label()
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.lgs = New System.Windows.Forms.RichTextBox()
        Me.Panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.BackColor = System.Drawing.Color.Transparent
        Me.Label4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(135, 10)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(33, 13)
        Me.Label4.TabIndex = 33
        Me.Label4.Text = "Sent"
        '
        'USB
        '
        Me.USB.AutoSize = True
        Me.USB.BackColor = System.Drawing.Color.Transparent
        Me.USB.ForeColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.USB.Location = New System.Drawing.Point(321, 23)
        Me.USB.Name = "USB"
        Me.USB.Size = New System.Drawing.Size(13, 13)
        Me.USB.TabIndex = 32
        Me.USB.Text = "0"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.BackColor = System.Drawing.Color.Transparent
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.ForeColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.Label3.Location = New System.Drawing.Point(321, 10)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(73, 13)
        Me.Label3.TabIndex = 31
        Me.Label3.Text = "Usb Victims"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.Transparent
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(14, 10)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(77, 13)
        Me.Label1.TabIndex = 30
        Me.Label1.Text = "Connections"
        '
        'cn
        '
        Me.cn.AutoSize = True
        Me.cn.BackColor = System.Drawing.Color.Transparent
        Me.cn.Location = New System.Drawing.Point(14, 23)
        Me.cn.Name = "cn"
        Me.cn.Size = New System.Drawing.Size(13, 13)
        Me.cn.TabIndex = 29
        Me.cn.Text = "0"
        '
        'snt
        '
        Me.snt.AutoSize = True
        Me.snt.BackColor = System.Drawing.Color.Transparent
        Me.snt.Location = New System.Drawing.Point(135, 23)
        Me.snt.Name = "snt"
        Me.snt.Size = New System.Drawing.Size(13, 13)
        Me.snt.TabIndex = 28
        Me.snt.Text = "0"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.BackColor = System.Drawing.Color.Transparent
        Me.Label6.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(228, 10)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(47, 13)
        Me.Label6.TabIndex = 27
        Me.Label6.Text = "Recive"
        '
        'rc
        '
        Me.rc.AutoSize = True
        Me.rc.BackColor = System.Drawing.Color.Transparent
        Me.rc.Location = New System.Drawing.Point(228, 23)
        Me.rc.Name = "rc"
        Me.rc.Size = New System.Drawing.Size(13, 13)
        Me.rc.TabIndex = 26
        Me.rc.Text = "0"
        '
        'Timer1
        '
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.Black
        Me.Panel1.Controls.Add(Me.Label1)
        Me.Panel1.Controls.Add(Me.Label4)
        Me.Panel1.Controls.Add(Me.rc)
        Me.Panel1.Controls.Add(Me.USB)
        Me.Panel1.Controls.Add(Me.Label6)
        Me.Panel1.Controls.Add(Me.Label3)
        Me.Panel1.Controls.Add(Me.snt)
        Me.Panel1.Controls.Add(Me.cn)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel1.ForeColor = System.Drawing.Color.White
        Me.Panel1.Location = New System.Drawing.Point(0, 0)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(569, 192)
        Me.Panel1.TabIndex = 34
        '
        'lgs
        '
        Me.lgs.BackColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.lgs.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.lgs.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.lgs.Location = New System.Drawing.Point(17, 58)
        Me.lgs.Name = "lgs"
        Me.lgs.ReadOnly = True
        Me.lgs.Size = New System.Drawing.Size(552, 125)
        Me.lgs.TabIndex = 35
        Me.lgs.Text = ""
        '
        'logs
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.lgs)
        Me.Controls.Add(Me.Panel1)
        Me.Name = "logs"
        Me.Size = New System.Drawing.Size(569, 192)
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents USB As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents cn As System.Windows.Forms.Label
    Friend WithEvents snt As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents rc As System.Windows.Forms.Label
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents lgs As System.Windows.Forms.RichTextBox

End Class
