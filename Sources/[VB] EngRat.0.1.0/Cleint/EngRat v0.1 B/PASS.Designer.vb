<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class PASS
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(PASS))
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.PassToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.L1 = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.CopyUserToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopyPassToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopySiteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopyALLToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SaveAllToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.InClipboardToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.InDiskToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FindToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoveEmptyPWToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog()
        Me.sf = New System.Windows.Forms.SaveFileDialog()
        Me.MenuStrip1.SuspendLayout()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.PassToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 290)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(568, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'PassToolStripMenuItem
        '
        Me.PassToolStripMenuItem.Image = CType(resources.GetObject("PassToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PassToolStripMenuItem.Name = "PassToolStripMenuItem"
        Me.PassToolStripMenuItem.Size = New System.Drawing.Size(58, 20)
        Me.PassToolStripMenuItem.Text = "Pass"
        '
        'ImageList1
        '
        Me.ImageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.ImageList1.ImageSize = New System.Drawing.Size(16, 16)
        Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
        '
        'L1
        '
        Me.L1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader5, Me.ColumnHeader4})
        Me.L1.ContextMenuStrip = Me.ContextMenuStrip1
        Me.L1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.L1.LargeImageList = Me.ImageList1
        Me.L1.Location = New System.Drawing.Point(0, 0)
        Me.L1.Name = "L1"
        Me.L1.Size = New System.Drawing.Size(568, 290)
        Me.L1.SmallImageList = Me.ImageList1
        Me.L1.TabIndex = 1
        Me.L1.UseCompatibleStateImageBehavior = False
        Me.L1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "User"
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Pass"
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "URL"
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "App"
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CopyUserToolStripMenuItem, Me.CopyPassToolStripMenuItem, Me.CopySiteToolStripMenuItem, Me.CopyALLToolStripMenuItem, Me.SaveAllToolStripMenuItem, Me.FindToolStripMenuItem, Me.RemoveEmptyPWToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(176, 180)
        '
        'CopyUserToolStripMenuItem
        '
        Me.CopyUserToolStripMenuItem.Image = CType(resources.GetObject("CopyUserToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CopyUserToolStripMenuItem.Name = "CopyUserToolStripMenuItem"
        Me.CopyUserToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.CopyUserToolStripMenuItem.Text = "Copy User"
        '
        'CopyPassToolStripMenuItem
        '
        Me.CopyPassToolStripMenuItem.Image = CType(resources.GetObject("CopyPassToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CopyPassToolStripMenuItem.Name = "CopyPassToolStripMenuItem"
        Me.CopyPassToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.CopyPassToolStripMenuItem.Text = "Copy Pass"
        '
        'CopySiteToolStripMenuItem
        '
        Me.CopySiteToolStripMenuItem.Image = CType(resources.GetObject("CopySiteToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CopySiteToolStripMenuItem.Name = "CopySiteToolStripMenuItem"
        Me.CopySiteToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.CopySiteToolStripMenuItem.Text = "Copy Site"
        '
        'CopyALLToolStripMenuItem
        '
        Me.CopyALLToolStripMenuItem.Image = CType(resources.GetObject("CopyALLToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CopyALLToolStripMenuItem.Name = "CopyALLToolStripMenuItem"
        Me.CopyALLToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.CopyALLToolStripMenuItem.Text = "Copy ALL"
        '
        'SaveAllToolStripMenuItem
        '
        Me.SaveAllToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.InClipboardToolStripMenuItem, Me.InDiskToolStripMenuItem})
        Me.SaveAllToolStripMenuItem.Image = CType(resources.GetObject("SaveAllToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SaveAllToolStripMenuItem.Name = "SaveAllToolStripMenuItem"
        Me.SaveAllToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.SaveAllToolStripMenuItem.Text = "Save All"
        '
        'InClipboardToolStripMenuItem
        '
        Me.InClipboardToolStripMenuItem.Image = CType(resources.GetObject("InClipboardToolStripMenuItem.Image"), System.Drawing.Image)
        Me.InClipboardToolStripMenuItem.Name = "InClipboardToolStripMenuItem"
        Me.InClipboardToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.InClipboardToolStripMenuItem.Text = "in Clipboard"
        '
        'InDiskToolStripMenuItem
        '
        Me.InDiskToolStripMenuItem.Image = CType(resources.GetObject("InDiskToolStripMenuItem.Image"), System.Drawing.Image)
        Me.InDiskToolStripMenuItem.Name = "InDiskToolStripMenuItem"
        Me.InDiskToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.InDiskToolStripMenuItem.Text = "in Disk"
        '
        'FindToolStripMenuItem
        '
        Me.FindToolStripMenuItem.Image = CType(resources.GetObject("FindToolStripMenuItem.Image"), System.Drawing.Image)
        Me.FindToolStripMenuItem.Name = "FindToolStripMenuItem"
        Me.FindToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.FindToolStripMenuItem.Text = "Find"
        '
        'RemoveEmptyPWToolStripMenuItem
        '
        Me.RemoveEmptyPWToolStripMenuItem.Image = CType(resources.GetObject("RemoveEmptyPWToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RemoveEmptyPWToolStripMenuItem.Name = "RemoveEmptyPWToolStripMenuItem"
        Me.RemoveEmptyPWToolStripMenuItem.Size = New System.Drawing.Size(175, 22)
        Me.RemoveEmptyPWToolStripMenuItem.Text = "Remove Empty PW"
        '
        'OpenFileDialog1
        '
        Me.OpenFileDialog1.FileName = "OpenFileDialog1"
        '
        'PASS
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(568, 314)
        Me.Controls.Add(Me.L1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "PASS"
        Me.Text = "PASS"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents ImageList1 As System.Windows.Forms.ImageList
    Friend WithEvents L1 As System.Windows.Forms.ListView
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents CopyUserToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopyPassToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopySiteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopyALLToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SaveAllToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents InClipboardToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents InDiskToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FindToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoveEmptyPWToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents sf As System.Windows.Forms.SaveFileDialog
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents PassToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
