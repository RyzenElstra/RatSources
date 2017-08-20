<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Proc
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Proc))
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.SL = New System.Windows.Forms.ToolStripStatusLabel()
        Me.pr = New System.Windows.Forms.ToolStripProgressBar()
        Me.M1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RefreshToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KillToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KillDeleteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SuspendToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ResumeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.L1 = New EngRat_v0._1_B.LV()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.StatusStrip1.SuspendLayout()
        Me.M1.SuspendLayout()
        Me.SuspendLayout()
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.SL, Me.pr})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 364)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(648, 22)
        Me.StatusStrip1.TabIndex = 0
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'SL
        '
        Me.SL.Name = "SL"
        Me.SL.Size = New System.Drawing.Size(13, 17)
        Me.SL.Text = ".."
        '
        'pr
        '
        Me.pr.Name = "pr"
        Me.pr.Size = New System.Drawing.Size(100, 16)
        '
        'M1
        '
        Me.M1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RefreshToolStripMenuItem, Me.KillToolStripMenuItem, Me.KillDeleteToolStripMenuItem, Me.SuspendToolStripMenuItem, Me.ResumeToolStripMenuItem})
        Me.M1.Name = "M1"
        Me.M1.Size = New System.Drawing.Size(153, 136)
        '
        'RefreshToolStripMenuItem
        '
        Me.RefreshToolStripMenuItem.Image = CType(resources.GetObject("RefreshToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem.Name = "RefreshToolStripMenuItem"
        Me.RefreshToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.RefreshToolStripMenuItem.Text = "Refresh"
        '
        'KillToolStripMenuItem
        '
        Me.KillToolStripMenuItem.Image = CType(resources.GetObject("KillToolStripMenuItem.Image"), System.Drawing.Image)
        Me.KillToolStripMenuItem.Name = "KillToolStripMenuItem"
        Me.KillToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.KillToolStripMenuItem.Text = "Kill"
        '
        'KillDeleteToolStripMenuItem
        '
        Me.KillDeleteToolStripMenuItem.Image = CType(resources.GetObject("KillDeleteToolStripMenuItem.Image"), System.Drawing.Image)
        Me.KillDeleteToolStripMenuItem.Name = "KillDeleteToolStripMenuItem"
        Me.KillDeleteToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.KillDeleteToolStripMenuItem.Text = "Kill + Delete"
        '
        'SuspendToolStripMenuItem
        '
        Me.SuspendToolStripMenuItem.Image = CType(resources.GetObject("SuspendToolStripMenuItem.Image"), System.Drawing.Image)
        Me.SuspendToolStripMenuItem.Name = "SuspendToolStripMenuItem"
        Me.SuspendToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.SuspendToolStripMenuItem.Text = "Suspend"
        '
        'ResumeToolStripMenuItem
        '
        Me.ResumeToolStripMenuItem.Name = "ResumeToolStripMenuItem"
        Me.ResumeToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.ResumeToolStripMenuItem.Text = "Resume"
        '
        'L1
        '
        Me.L1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3})
        Me.L1.ContextMenuStrip = Me.M1
        Me.L1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.L1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Bold)
        Me.L1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.L1.FullRowSelect = True
        Me.L1.Location = New System.Drawing.Point(0, 0)
        Me.L1.Name = "L1"
        Me.L1.Size = New System.Drawing.Size(648, 364)
        Me.L1.TabIndex = 2
        Me.L1.UseCompatibleStateImageBehavior = False
        Me.L1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Name"
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "PID"
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Location"
        '
        'Timer1
        '
        '
        'Proc
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(648, 386)
        Me.Controls.Add(Me.L1)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Proc"
        Me.Text = "Proc"
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.M1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents SL As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents pr As System.Windows.Forms.ToolStripProgressBar
    Friend WithEvents M1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents L1 As EngRat_v0._1_B.LV
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents RefreshToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KillToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KillDeleteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SuspendToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ResumeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
End Class
