<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FunManager
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FunManager))
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.btn_startdiscomouse = New System.Windows.Forms.Button()
        Me.btn_stopdiscomouse = New System.Windows.Forms.Button()
        Me.btn_shutdown = New System.Windows.Forms.Button()
        Me.btn_logoff = New System.Windows.Forms.Button()
        Me.btn_restart = New System.Windows.Forms.Button()
        Me.btn_speak = New System.Windows.Forms.Button()
        Me.btn_changewp = New System.Windows.Forms.Button()
        Me.btn_undo = New System.Windows.Forms.Button()
        Me.btn_swap = New System.Windows.Forms.Button()
        Me.btn_hidetb = New System.Windows.Forms.Button()
        Me.btn_openweb = New System.Windows.Forms.Button()
        Me.btn_closecd = New System.Windows.Forms.Button()
        Me.btn_showtb = New System.Windows.Forms.Button()
        Me.btn_opencd = New System.Windows.Forms.Button()
        Me.btn_hidedi = New System.Windows.Forms.Button()
        Me.btn_showdi = New System.Windows.Forms.Button()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.btn_startdiscomouse)
        Me.GroupBox2.Controls.Add(Me.btn_stopdiscomouse)
        Me.GroupBox2.Controls.Add(Me.btn_shutdown)
        Me.GroupBox2.Controls.Add(Me.btn_logoff)
        Me.GroupBox2.Controls.Add(Me.btn_restart)
        Me.GroupBox2.Controls.Add(Me.btn_speak)
        Me.GroupBox2.Controls.Add(Me.btn_changewp)
        Me.GroupBox2.Controls.Add(Me.btn_undo)
        Me.GroupBox2.Controls.Add(Me.btn_swap)
        Me.GroupBox2.Controls.Add(Me.btn_hidetb)
        Me.GroupBox2.Controls.Add(Me.btn_openweb)
        Me.GroupBox2.Controls.Add(Me.btn_closecd)
        Me.GroupBox2.Controls.Add(Me.btn_showtb)
        Me.GroupBox2.Controls.Add(Me.btn_opencd)
        Me.GroupBox2.Controls.Add(Me.btn_hidedi)
        Me.GroupBox2.Controls.Add(Me.btn_showdi)
        Me.GroupBox2.Location = New System.Drawing.Point(12, 12)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(298, 256)
        Me.GroupBox2.TabIndex = 13
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "FUN Buttons"
        '
        'btn_startdiscomouse
        '
        Me.btn_startdiscomouse.Image = CType(resources.GetObject("btn_startdiscomouse.Image"), System.Drawing.Image)
        Me.btn_startdiscomouse.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_startdiscomouse.Location = New System.Drawing.Point(6, 222)
        Me.btn_startdiscomouse.Name = "btn_startdiscomouse"
        Me.btn_startdiscomouse.Size = New System.Drawing.Size(148, 23)
        Me.btn_startdiscomouse.TabIndex = 15
        Me.btn_startdiscomouse.Text = "Start DiscoMouse"
        Me.btn_startdiscomouse.UseVisualStyleBackColor = True
        '
        'btn_stopdiscomouse
        '
        Me.btn_stopdiscomouse.Image = CType(resources.GetObject("btn_stopdiscomouse.Image"), System.Drawing.Image)
        Me.btn_stopdiscomouse.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_stopdiscomouse.Location = New System.Drawing.Point(160, 222)
        Me.btn_stopdiscomouse.Name = "btn_stopdiscomouse"
        Me.btn_stopdiscomouse.Size = New System.Drawing.Size(131, 23)
        Me.btn_stopdiscomouse.TabIndex = 14
        Me.btn_stopdiscomouse.Text = "Stop DiscoMouse"
        Me.btn_stopdiscomouse.UseVisualStyleBackColor = True
        '
        'btn_shutdown
        '
        Me.btn_shutdown.Image = CType(resources.GetObject("btn_shutdown.Image"), System.Drawing.Image)
        Me.btn_shutdown.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_shutdown.Location = New System.Drawing.Point(6, 193)
        Me.btn_shutdown.Name = "btn_shutdown"
        Me.btn_shutdown.Size = New System.Drawing.Size(148, 23)
        Me.btn_shutdown.TabIndex = 13
        Me.btn_shutdown.Text = "Shutdown Computer"
        Me.btn_shutdown.UseVisualStyleBackColor = True
        '
        'btn_logoff
        '
        Me.btn_logoff.Image = CType(resources.GetObject("btn_logoff.Image"), System.Drawing.Image)
        Me.btn_logoff.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_logoff.Location = New System.Drawing.Point(160, 193)
        Me.btn_logoff.Name = "btn_logoff"
        Me.btn_logoff.Size = New System.Drawing.Size(131, 23)
        Me.btn_logoff.TabIndex = 12
        Me.btn_logoff.Text = "Logout Computer"
        Me.btn_logoff.UseVisualStyleBackColor = True
        '
        'btn_restart
        '
        Me.btn_restart.Image = CType(resources.GetObject("btn_restart.Image"), System.Drawing.Image)
        Me.btn_restart.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_restart.Location = New System.Drawing.Point(160, 164)
        Me.btn_restart.Name = "btn_restart"
        Me.btn_restart.Size = New System.Drawing.Size(131, 23)
        Me.btn_restart.TabIndex = 11
        Me.btn_restart.Text = "Restart Computer"
        Me.btn_restart.UseVisualStyleBackColor = True
        '
        'btn_speak
        '
        Me.btn_speak.Image = CType(resources.GetObject("btn_speak.Image"), System.Drawing.Image)
        Me.btn_speak.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_speak.Location = New System.Drawing.Point(160, 135)
        Me.btn_speak.Name = "btn_speak"
        Me.btn_speak.Size = New System.Drawing.Size(131, 23)
        Me.btn_speak.TabIndex = 10
        Me.btn_speak.Text = "Speak Text"
        Me.btn_speak.UseVisualStyleBackColor = True
        '
        'btn_changewp
        '
        Me.btn_changewp.Image = CType(resources.GetObject("btn_changewp.Image"), System.Drawing.Image)
        Me.btn_changewp.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_changewp.Location = New System.Drawing.Point(6, 164)
        Me.btn_changewp.Name = "btn_changewp"
        Me.btn_changewp.Size = New System.Drawing.Size(148, 23)
        Me.btn_changewp.TabIndex = 9
        Me.btn_changewp.Text = "Change Wallpaper"
        Me.btn_changewp.UseVisualStyleBackColor = True
        '
        'btn_undo
        '
        Me.btn_undo.Image = CType(resources.GetObject("btn_undo.Image"), System.Drawing.Image)
        Me.btn_undo.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_undo.Location = New System.Drawing.Point(160, 106)
        Me.btn_undo.Name = "btn_undo"
        Me.btn_undo.Size = New System.Drawing.Size(131, 23)
        Me.btn_undo.TabIndex = 8
        Me.btn_undo.Text = "Undo Mouse"
        Me.btn_undo.UseVisualStyleBackColor = True
        '
        'btn_swap
        '
        Me.btn_swap.Image = CType(resources.GetObject("btn_swap.Image"), System.Drawing.Image)
        Me.btn_swap.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_swap.Location = New System.Drawing.Point(6, 106)
        Me.btn_swap.Name = "btn_swap"
        Me.btn_swap.Size = New System.Drawing.Size(148, 23)
        Me.btn_swap.TabIndex = 7
        Me.btn_swap.Text = "Swap Mouse Buttons"
        Me.btn_swap.UseVisualStyleBackColor = True
        '
        'btn_hidetb
        '
        Me.btn_hidetb.Image = CType(resources.GetObject("btn_hidetb.Image"), System.Drawing.Image)
        Me.btn_hidetb.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_hidetb.Location = New System.Drawing.Point(6, 19)
        Me.btn_hidetb.Name = "btn_hidetb"
        Me.btn_hidetb.Size = New System.Drawing.Size(148, 23)
        Me.btn_hidetb.TabIndex = 1
        Me.btn_hidetb.Text = "Hide Taskbar"
        Me.btn_hidetb.UseVisualStyleBackColor = True
        '
        'btn_openweb
        '
        Me.btn_openweb.Image = CType(resources.GetObject("btn_openweb.Image"), System.Drawing.Image)
        Me.btn_openweb.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_openweb.Location = New System.Drawing.Point(6, 135)
        Me.btn_openweb.Name = "btn_openweb"
        Me.btn_openweb.Size = New System.Drawing.Size(148, 23)
        Me.btn_openweb.TabIndex = 0
        Me.btn_openweb.Text = "Open Website"
        Me.btn_openweb.UseVisualStyleBackColor = True
        '
        'btn_closecd
        '
        Me.btn_closecd.Image = CType(resources.GetObject("btn_closecd.Image"), System.Drawing.Image)
        Me.btn_closecd.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_closecd.Location = New System.Drawing.Point(160, 77)
        Me.btn_closecd.Name = "btn_closecd"
        Me.btn_closecd.Size = New System.Drawing.Size(131, 23)
        Me.btn_closecd.TabIndex = 6
        Me.btn_closecd.Text = "Close CD Tray"
        Me.btn_closecd.UseVisualStyleBackColor = True
        '
        'btn_showtb
        '
        Me.btn_showtb.Image = CType(resources.GetObject("btn_showtb.Image"), System.Drawing.Image)
        Me.btn_showtb.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_showtb.Location = New System.Drawing.Point(160, 19)
        Me.btn_showtb.Name = "btn_showtb"
        Me.btn_showtb.Size = New System.Drawing.Size(131, 23)
        Me.btn_showtb.TabIndex = 2
        Me.btn_showtb.Text = "Show Taskbar"
        Me.btn_showtb.UseVisualStyleBackColor = True
        '
        'btn_opencd
        '
        Me.btn_opencd.Image = CType(resources.GetObject("btn_opencd.Image"), System.Drawing.Image)
        Me.btn_opencd.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_opencd.Location = New System.Drawing.Point(6, 77)
        Me.btn_opencd.Name = "btn_opencd"
        Me.btn_opencd.Size = New System.Drawing.Size(148, 23)
        Me.btn_opencd.TabIndex = 5
        Me.btn_opencd.Text = "Open CD Tray"
        Me.btn_opencd.UseVisualStyleBackColor = True
        '
        'btn_hidedi
        '
        Me.btn_hidedi.Image = CType(resources.GetObject("btn_hidedi.Image"), System.Drawing.Image)
        Me.btn_hidedi.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_hidedi.Location = New System.Drawing.Point(6, 48)
        Me.btn_hidedi.Name = "btn_hidedi"
        Me.btn_hidedi.Size = New System.Drawing.Size(148, 23)
        Me.btn_hidedi.TabIndex = 3
        Me.btn_hidedi.Text = "Hide Desktop Icons"
        Me.btn_hidedi.UseVisualStyleBackColor = True
        '
        'btn_showdi
        '
        Me.btn_showdi.Image = CType(resources.GetObject("btn_showdi.Image"), System.Drawing.Image)
        Me.btn_showdi.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_showdi.Location = New System.Drawing.Point(160, 48)
        Me.btn_showdi.Name = "btn_showdi"
        Me.btn_showdi.Size = New System.Drawing.Size(131, 23)
        Me.btn_showdi.TabIndex = 4
        Me.btn_showdi.Text = "Show Desktop Icons"
        Me.btn_showdi.UseVisualStyleBackColor = True
        '
        'FunManager
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(315, 275)
        Me.Controls.Add(Me.GroupBox2)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(331, 314)
        Me.MinimizeBox = False
        Me.MinimumSize = New System.Drawing.Size(331, 314)
        Me.Name = "FunManager"
        Me.Text = "FunManager"
        Me.GroupBox2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents btn_shutdown As System.Windows.Forms.Button
    Friend WithEvents btn_logoff As System.Windows.Forms.Button
    Friend WithEvents btn_restart As System.Windows.Forms.Button
    Friend WithEvents btn_speak As System.Windows.Forms.Button
    Friend WithEvents btn_changewp As System.Windows.Forms.Button
    Friend WithEvents btn_undo As System.Windows.Forms.Button
    Friend WithEvents btn_swap As System.Windows.Forms.Button
    Friend WithEvents btn_hidetb As System.Windows.Forms.Button
    Friend WithEvents btn_openweb As System.Windows.Forms.Button
    Friend WithEvents btn_closecd As System.Windows.Forms.Button
    Friend WithEvents btn_showtb As System.Windows.Forms.Button
    Friend WithEvents btn_opencd As System.Windows.Forms.Button
    Friend WithEvents btn_hidedi As System.Windows.Forms.Button
    Friend WithEvents btn_showdi As System.Windows.Forms.Button
    Friend WithEvents btn_startdiscomouse As System.Windows.Forms.Button
    Friend WithEvents btn_stopdiscomouse As System.Windows.Forms.Button
End Class
