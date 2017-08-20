VERSION 5.00
Begin VB.Form frmFixed
  Caption = "Changes/Bugfixes in this version"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 4 'Fixed ToolWindow
  'Icon = n/a
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 285
  ClientWidth = 4815
  ClientHeight = 3435
  ShowInTaskbar = 0   'False
  StartUpPosition = 3 'Windows Default
  Begin VB.TextBox Text1
    BackColor = &HFFFFFF&
    ForeColor = &H404040&
    Left = 0
    Top = 0
    Width = 4815
    Height = 3420
    Text = "- Mutiple connections can be made to the same IP.\n- Optimization of socket management (socket tracking).\n- Automatically trim directory images connection bug fixed.\n- False positive multiple IP reverse connection error fixed.\n- Add-in raw data hooking error resolved.\n- Coded custom progress bar for preloader.\n- Optimized code in preloader for slower machines.\n- Fixed variable resolving problems server fake error.\n- Fixed http:// conflict with comments in UserCmd scripts.\n- Fixed ""send to website"" UserCmd bug in server.\n- Fixed Runonce startup reboot error in server.\n"
    TabIndex = 0
    MultiLine = -1  'True
    ScrollBars = 2
    Locked = -1  'True
  End
End

Attribute VB_Name = "frmFixed"


