<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Misc
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Misc))
        Me.CodePlexTabControl1 = New Diamond_Remote_Administration_Tool.CodePlexTabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.btn_loadhosts = New System.Windows.Forms.Button()
        Me.btn_savehosts = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.RichTextBox1 = New System.Windows.Forms.RichTextBox()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.pb_cpimage = New System.Windows.Forms.PictureBox()
        Me.btn_getcpimage = New System.Windows.Forms.Button()
        Me.btn_savecpimage = New System.Windows.Forms.Button()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.btn_getcptext = New System.Windows.Forms.Button()
        Me.btn_savecptext = New System.Windows.Forms.Button()
        Me.RichTextBox2 = New System.Windows.Forms.RichTextBox()
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.RichTextBox3 = New System.Windows.Forms.RichTextBox()
        Me.btn_sendshell = New System.Windows.Forms.Button()
        Me.tb_shellcmd = New System.Windows.Forms.TextBox()
        Me.CodePlexTabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        CType(Me.pb_cpimage, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage3.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        Me.SuspendLayout()
        '
        'CodePlexTabControl1
        '
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage1)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage2)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage3)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage4)
        Me.CodePlexTabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
        Me.CodePlexTabControl1.Font = New System.Drawing.Font("Segoe UI", 10.0!)
        Me.CodePlexTabControl1.ItemSize = New System.Drawing.Size(140, 41)
        Me.CodePlexTabControl1.Location = New System.Drawing.Point(2, 2)
        Me.CodePlexTabControl1.Name = "CodePlexTabControl1"
        Me.CodePlexTabControl1.SelectedIndex = 0
        Me.CodePlexTabControl1.Size = New System.Drawing.Size(565, 312)
        Me.CodePlexTabControl1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.CodePlexTabControl1.TabIndex = 0
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.btn_loadhosts)
        Me.TabPage1.Controls.Add(Me.btn_savehosts)
        Me.TabPage1.Controls.Add(Me.Label1)
        Me.TabPage1.Controls.Add(Me.RichTextBox1)
        Me.TabPage1.Location = New System.Drawing.Point(4, 45)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(557, 263)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Hosts File Editor"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'btn_loadhosts
        '
        Me.btn_loadhosts.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_loadhosts.Location = New System.Drawing.Point(395, 227)
        Me.btn_loadhosts.Name = "btn_loadhosts"
        Me.btn_loadhosts.Size = New System.Drawing.Size(75, 28)
        Me.btn_loadhosts.TabIndex = 3
        Me.btn_loadhosts.Text = "Load"
        Me.btn_loadhosts.UseVisualStyleBackColor = True
        '
        'btn_savehosts
        '
        Me.btn_savehosts.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_savehosts.Location = New System.Drawing.Point(476, 227)
        Me.btn_savehosts.Name = "btn_savehosts"
        Me.btn_savehosts.Size = New System.Drawing.Size(75, 28)
        Me.btn_savehosts.TabIndex = 2
        Me.btn_savehosts.Text = "Save"
        Me.btn_savehosts.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(9, 233)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(249, 19)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "This works only with admin permission!"
        '
        'RichTextBox1
        '
        Me.RichTextBox1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.RichTextBox1.Location = New System.Drawing.Point(3, 6)
        Me.RichTextBox1.Name = "RichTextBox1"
        Me.RichTextBox1.Size = New System.Drawing.Size(551, 215)
        Me.RichTextBox1.TabIndex = 0
        Me.RichTextBox1.Text = ""
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.pb_cpimage)
        Me.TabPage2.Controls.Add(Me.btn_getcpimage)
        Me.TabPage2.Controls.Add(Me.btn_savecpimage)
        Me.TabPage2.Controls.Add(Me.Label2)
        Me.TabPage2.Location = New System.Drawing.Point(4, 45)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(557, 263)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Clipboard Image"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'pb_cpimage
        '
        Me.pb_cpimage.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.pb_cpimage.Location = New System.Drawing.Point(6, 6)
        Me.pb_cpimage.Name = "pb_cpimage"
        Me.pb_cpimage.Size = New System.Drawing.Size(545, 212)
        Me.pb_cpimage.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.pb_cpimage.TabIndex = 6
        Me.pb_cpimage.TabStop = False
        '
        'btn_getcpimage
        '
        Me.btn_getcpimage.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_getcpimage.Location = New System.Drawing.Point(381, 224)
        Me.btn_getcpimage.Name = "btn_getcpimage"
        Me.btn_getcpimage.Size = New System.Drawing.Size(85, 28)
        Me.btn_getcpimage.TabIndex = 5
        Me.btn_getcpimage.Text = "Get Image"
        Me.btn_getcpimage.UseVisualStyleBackColor = True
        '
        'btn_savecpimage
        '
        Me.btn_savecpimage.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_savecpimage.Location = New System.Drawing.Point(472, 224)
        Me.btn_savecpimage.Name = "btn_savecpimage"
        Me.btn_savecpimage.Size = New System.Drawing.Size(75, 28)
        Me.btn_savecpimage.TabIndex = 4
        Me.btn_savecpimage.Text = "Save"
        Me.btn_savecpimage.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(6, 230)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(219, 19)
        Me.Label2.TabIndex = 0
        Me.Label2.Text = "This works only with .bmp images!"
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.btn_getcptext)
        Me.TabPage3.Controls.Add(Me.btn_savecptext)
        Me.TabPage3.Controls.Add(Me.RichTextBox2)
        Me.TabPage3.Location = New System.Drawing.Point(4, 45)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Size = New System.Drawing.Size(557, 263)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Clipboard Text"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'btn_getcptext
        '
        Me.btn_getcptext.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_getcptext.Location = New System.Drawing.Point(395, 228)
        Me.btn_getcptext.Name = "btn_getcptext"
        Me.btn_getcptext.Size = New System.Drawing.Size(75, 28)
        Me.btn_getcptext.TabIndex = 6
        Me.btn_getcptext.Text = "Load"
        Me.btn_getcptext.UseVisualStyleBackColor = True
        '
        'btn_savecptext
        '
        Me.btn_savecptext.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_savecptext.Location = New System.Drawing.Point(476, 228)
        Me.btn_savecptext.Name = "btn_savecptext"
        Me.btn_savecptext.Size = New System.Drawing.Size(75, 28)
        Me.btn_savecptext.TabIndex = 5
        Me.btn_savecptext.Text = "Save"
        Me.btn_savecptext.UseVisualStyleBackColor = True
        '
        'RichTextBox2
        '
        Me.RichTextBox2.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.RichTextBox2.Location = New System.Drawing.Point(3, 7)
        Me.RichTextBox2.Name = "RichTextBox2"
        Me.RichTextBox2.Size = New System.Drawing.Size(551, 215)
        Me.RichTextBox2.TabIndex = 4
        Me.RichTextBox2.Text = ""
        '
        'TabPage4
        '
        Me.TabPage4.Controls.Add(Me.RichTextBox3)
        Me.TabPage4.Controls.Add(Me.btn_sendshell)
        Me.TabPage4.Controls.Add(Me.tb_shellcmd)
        Me.TabPage4.Location = New System.Drawing.Point(4, 45)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Size = New System.Drawing.Size(557, 263)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "Remote Shell"
        Me.TabPage4.UseVisualStyleBackColor = True
        '
        'RichTextBox3
        '
        Me.RichTextBox3.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.RichTextBox3.BackColor = System.Drawing.Color.Black
        Me.RichTextBox3.ForeColor = System.Drawing.Color.White
        Me.RichTextBox3.Location = New System.Drawing.Point(6, 3)
        Me.RichTextBox3.Name = "RichTextBox3"
        Me.RichTextBox3.Size = New System.Drawing.Size(541, 218)
        Me.RichTextBox3.TabIndex = 2
        Me.RichTextBox3.Text = ""
        '
        'btn_sendshell
        '
        Me.btn_sendshell.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_sendshell.Location = New System.Drawing.Point(471, 226)
        Me.btn_sendshell.Name = "btn_sendshell"
        Me.btn_sendshell.Size = New System.Drawing.Size(76, 26)
        Me.btn_sendshell.TabIndex = 1
        Me.btn_sendshell.Text = "Send"
        Me.btn_sendshell.UseVisualStyleBackColor = True
        '
        'tb_shellcmd
        '
        Me.tb_shellcmd.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.tb_shellcmd.BackColor = System.Drawing.Color.Black
        Me.tb_shellcmd.ForeColor = System.Drawing.Color.White
        Me.tb_shellcmd.Location = New System.Drawing.Point(6, 227)
        Me.tb_shellcmd.Name = "tb_shellcmd"
        Me.tb_shellcmd.Size = New System.Drawing.Size(459, 25)
        Me.tb_shellcmd.TabIndex = 0
        '
        'Misc
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(565, 311)
        Me.Controls.Add(Me.CodePlexTabControl1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximumSize = New System.Drawing.Size(581, 350)
        Me.MinimumSize = New System.Drawing.Size(581, 350)
        Me.Name = "Misc"
        Me.Text = "Miscellaneous"
        Me.CodePlexTabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        CType(Me.pb_cpimage, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage4.ResumeLayout(False)
        Me.TabPage4.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents CodePlexTabControl1 As Diamond_Remote_Administration_Tool.CodePlexTabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents btn_loadhosts As System.Windows.Forms.Button
    Friend WithEvents btn_savehosts As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents RichTextBox1 As System.Windows.Forms.RichTextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents btn_getcpimage As System.Windows.Forms.Button
    Friend WithEvents btn_savecpimage As System.Windows.Forms.Button
    Friend WithEvents pb_cpimage As System.Windows.Forms.PictureBox
    Friend WithEvents btn_getcptext As System.Windows.Forms.Button
    Friend WithEvents btn_savecptext As System.Windows.Forms.Button
    Friend WithEvents RichTextBox2 As System.Windows.Forms.RichTextBox
    Friend WithEvents TabPage4 As System.Windows.Forms.TabPage
    Friend WithEvents btn_sendshell As System.Windows.Forms.Button
    Friend WithEvents tb_shellcmd As System.Windows.Forms.TextBox
    Friend WithEvents RichTextBox3 As System.Windows.Forms.RichTextBox
End Class
