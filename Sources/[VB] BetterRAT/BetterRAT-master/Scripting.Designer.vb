<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Scripting
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Scripting))
        Me.CodePlexTabControl1 = New Diamond_Remote_Administration_Tool.CodePlexTabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.btn_test_html = New System.Windows.Forms.Button()
        Me.btn_send_html = New System.Windows.Forms.Button()
        Me.RichTextBox1 = New System.Windows.Forms.RichTextBox()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.btn_test_vbs = New System.Windows.Forms.Button()
        Me.btn_send_vbs = New System.Windows.Forms.Button()
        Me.RichTextBox2 = New System.Windows.Forms.RichTextBox()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.btn_test_batch = New System.Windows.Forms.Button()
        Me.btn_send_batch = New System.Windows.Forms.Button()
        Me.RichTextBox3 = New System.Windows.Forms.RichTextBox()
        Me.CodePlexTabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.TabPage3.SuspendLayout()
        Me.SuspendLayout()
        '
        'CodePlexTabControl1
        '
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage1)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage2)
        Me.CodePlexTabControl1.Controls.Add(Me.TabPage3)
        Me.CodePlexTabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
        Me.CodePlexTabControl1.Font = New System.Drawing.Font("Segoe UI", 10.0!)
        Me.CodePlexTabControl1.ItemSize = New System.Drawing.Size(140, 41)
        Me.CodePlexTabControl1.Location = New System.Drawing.Point(0, 0)
        Me.CodePlexTabControl1.Name = "CodePlexTabControl1"
        Me.CodePlexTabControl1.SelectedIndex = 0
        Me.CodePlexTabControl1.Size = New System.Drawing.Size(423, 274)
        Me.CodePlexTabControl1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.CodePlexTabControl1.TabIndex = 0
        '
        'TabPage1
        '
        Me.TabPage1.BackColor = System.Drawing.Color.White
        Me.TabPage1.Controls.Add(Me.btn_test_html)
        Me.TabPage1.Controls.Add(Me.btn_send_html)
        Me.TabPage1.Controls.Add(Me.RichTextBox1)
        Me.TabPage1.Location = New System.Drawing.Point(4, 45)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(415, 225)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "HTML"
        '
        'btn_test_html
        '
        Me.btn_test_html.Location = New System.Drawing.Point(252, 190)
        Me.btn_test_html.Name = "btn_test_html"
        Me.btn_test_html.Size = New System.Drawing.Size(75, 27)
        Me.btn_test_html.TabIndex = 2
        Me.btn_test_html.Text = "Test"
        Me.btn_test_html.UseVisualStyleBackColor = True
        '
        'btn_send_html
        '
        Me.btn_send_html.Location = New System.Drawing.Point(333, 190)
        Me.btn_send_html.Name = "btn_send_html"
        Me.btn_send_html.Size = New System.Drawing.Size(75, 27)
        Me.btn_send_html.TabIndex = 1
        Me.btn_send_html.Text = "Send"
        Me.btn_send_html.UseVisualStyleBackColor = True
        '
        'RichTextBox1
        '
        Me.RichTextBox1.Location = New System.Drawing.Point(0, 0)
        Me.RichTextBox1.Name = "RichTextBox1"
        Me.RichTextBox1.Size = New System.Drawing.Size(415, 188)
        Me.RichTextBox1.TabIndex = 0
        Me.RichTextBox1.Text = ""
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.btn_test_vbs)
        Me.TabPage2.Controls.Add(Me.btn_send_vbs)
        Me.TabPage2.Controls.Add(Me.RichTextBox2)
        Me.TabPage2.Location = New System.Drawing.Point(4, 45)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(415, 225)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "VBS"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'btn_test_vbs
        '
        Me.btn_test_vbs.Location = New System.Drawing.Point(252, 190)
        Me.btn_test_vbs.Name = "btn_test_vbs"
        Me.btn_test_vbs.Size = New System.Drawing.Size(75, 27)
        Me.btn_test_vbs.TabIndex = 5
        Me.btn_test_vbs.Text = "Test"
        Me.btn_test_vbs.UseVisualStyleBackColor = True
        '
        'btn_send_vbs
        '
        Me.btn_send_vbs.Location = New System.Drawing.Point(333, 190)
        Me.btn_send_vbs.Name = "btn_send_vbs"
        Me.btn_send_vbs.Size = New System.Drawing.Size(75, 27)
        Me.btn_send_vbs.TabIndex = 4
        Me.btn_send_vbs.Text = "Send"
        Me.btn_send_vbs.UseVisualStyleBackColor = True
        '
        'RichTextBox2
        '
        Me.RichTextBox2.Location = New System.Drawing.Point(0, 0)
        Me.RichTextBox2.Name = "RichTextBox2"
        Me.RichTextBox2.Size = New System.Drawing.Size(415, 188)
        Me.RichTextBox2.TabIndex = 3
        Me.RichTextBox2.Text = ""
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.btn_test_batch)
        Me.TabPage3.Controls.Add(Me.btn_send_batch)
        Me.TabPage3.Controls.Add(Me.RichTextBox3)
        Me.TabPage3.Location = New System.Drawing.Point(4, 45)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Size = New System.Drawing.Size(415, 225)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Batch"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'btn_test_batch
        '
        Me.btn_test_batch.Location = New System.Drawing.Point(252, 190)
        Me.btn_test_batch.Name = "btn_test_batch"
        Me.btn_test_batch.Size = New System.Drawing.Size(75, 27)
        Me.btn_test_batch.TabIndex = 5
        Me.btn_test_batch.Text = "Test"
        Me.btn_test_batch.UseVisualStyleBackColor = True
        '
        'btn_send_batch
        '
        Me.btn_send_batch.Location = New System.Drawing.Point(333, 190)
        Me.btn_send_batch.Name = "btn_send_batch"
        Me.btn_send_batch.Size = New System.Drawing.Size(75, 27)
        Me.btn_send_batch.TabIndex = 4
        Me.btn_send_batch.Text = "Send"
        Me.btn_send_batch.UseVisualStyleBackColor = True
        '
        'RichTextBox3
        '
        Me.RichTextBox3.Location = New System.Drawing.Point(0, 0)
        Me.RichTextBox3.Name = "RichTextBox3"
        Me.RichTextBox3.Size = New System.Drawing.Size(415, 188)
        Me.RichTextBox3.TabIndex = 3
        Me.RichTextBox3.Text = ""
        '
        'Scripting
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(424, 274)
        Me.Controls.Add(Me.CodePlexTabControl1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Scripting"
        Me.Text = "Scripting"
        Me.CodePlexTabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage3.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents CodePlexTabControl1 As Diamond_Remote_Administration_Tool.CodePlexTabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents RichTextBox1 As System.Windows.Forms.RichTextBox
    Friend WithEvents btn_test_html As System.Windows.Forms.Button
    Friend WithEvents btn_send_html As System.Windows.Forms.Button
    Friend WithEvents btn_test_vbs As System.Windows.Forms.Button
    Friend WithEvents btn_send_vbs As System.Windows.Forms.Button
    Friend WithEvents RichTextBox2 As System.Windows.Forms.RichTextBox
    Friend WithEvents btn_test_batch As System.Windows.Forms.Button
    Friend WithEvents btn_send_batch As System.Windows.Forms.Button
    Friend WithEvents RichTextBox3 As System.Windows.Forms.RichTextBox
End Class
