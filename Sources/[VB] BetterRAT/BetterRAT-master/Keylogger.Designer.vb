<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Keylogger
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Keylogger))
        Me.RichTextBox1 = New System.Windows.Forms.RichTextBox()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.DownloadLogsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SaveLogsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DeleteLogsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FindTextToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FindNextToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'RichTextBox1
        '
        Me.RichTextBox1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.RichTextBox1.Location = New System.Drawing.Point(12, 27)
        Me.RichTextBox1.MinimumSize = New System.Drawing.Size(597, 283)
        Me.RichTextBox1.Name = "RichTextBox1"
        Me.RichTextBox1.Size = New System.Drawing.Size(597, 283)
        Me.RichTextBox1.TabIndex = 0
        Me.RichTextBox1.Text = ""
        '
        'MenuStrip1
        '
        Me.MenuStrip1.BackColor = System.Drawing.Color.White
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.DownloadLogsToolStripMenuItem, Me.SaveLogsToolStripMenuItem, Me.DeleteLogsToolStripMenuItem, Me.FindTextToolStripMenuItem, Me.FindNextToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(621, 24)
        Me.MenuStrip1.TabIndex = 1
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'DownloadLogsToolStripMenuItem
        '
        Me.DownloadLogsToolStripMenuItem.BackColor = System.Drawing.Color.White
        Me.DownloadLogsToolStripMenuItem.Image = CType(resources.GetObject("DownloadLogsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DownloadLogsToolStripMenuItem.Name = "DownloadLogsToolStripMenuItem"
        Me.DownloadLogsToolStripMenuItem.Size = New System.Drawing.Size(117, 20)
        Me.DownloadLogsToolStripMenuItem.Text = "Download Logs"
        '
        'SaveLogsToolStripMenuItem
        '
        Me.SaveLogsToolStripMenuItem.Image = CType(resources.GetObject("SaveLogsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SaveLogsToolStripMenuItem.Name = "SaveLogsToolStripMenuItem"
        Me.SaveLogsToolStripMenuItem.Size = New System.Drawing.Size(87, 20)
        Me.SaveLogsToolStripMenuItem.Text = "Save Logs"
        '
        'DeleteLogsToolStripMenuItem
        '
        Me.DeleteLogsToolStripMenuItem.Image = CType(resources.GetObject("DeleteLogsToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DeleteLogsToolStripMenuItem.Name = "DeleteLogsToolStripMenuItem"
        Me.DeleteLogsToolStripMenuItem.Size = New System.Drawing.Size(96, 20)
        Me.DeleteLogsToolStripMenuItem.Text = "Delete Logs"
        '
        'FindTextToolStripMenuItem
        '
        Me.FindTextToolStripMenuItem.Image = CType(resources.GetObject("FindTextToolStripMenuItem.Image"), System.Drawing.Image)
        Me.FindTextToolStripMenuItem.Name = "FindTextToolStripMenuItem"
        Me.FindTextToolStripMenuItem.Size = New System.Drawing.Size(95, 20)
        Me.FindTextToolStripMenuItem.Text = "Search Text"
        '
        'FindNextToolStripMenuItem
        '
        Me.FindNextToolStripMenuItem.Image = CType(resources.GetObject("FindNextToolStripMenuItem.Image"), System.Drawing.Image)
        Me.FindNextToolStripMenuItem.Name = "FindNextToolStripMenuItem"
        Me.FindNextToolStripMenuItem.Size = New System.Drawing.Size(85, 20)
        Me.FindNextToolStripMenuItem.Text = "Find Next"
        '
        'Keylogger
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(621, 322)
        Me.Controls.Add(Me.RichTextBox1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.MinimumSize = New System.Drawing.Size(637, 361)
        Me.Name = "Keylogger"
        Me.Text = "Keylogger"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents RichTextBox1 As System.Windows.Forms.RichTextBox
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents DownloadLogsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SaveLogsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DeleteLogsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FindTextToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FindNextToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
