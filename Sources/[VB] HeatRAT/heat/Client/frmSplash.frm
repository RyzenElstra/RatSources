VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSplash 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Loading RemoteCOntrol"
   ClientHeight    =   5715
   ClientLeft      =   210
   ClientTop       =   1365
   ClientWidth     =   6840
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5715
   ScaleWidth      =   6840
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmrLoad 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   6360
      Top             =   4920
   End
   Begin MSComctlLib.ProgressBar prgLoad 
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   5400
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   0
      Scrolling       =   1
   End
   Begin VB.Label lblStatus 
      BackColor       =   &H8000000E&
      Caption         =   "Loading Remote|Control..."
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   5160
      Width           =   6135
   End
   Begin VB.Image Image1 
      Height          =   5100
      Left            =   0
      Picture         =   "frmSplash.frx":000C
      Top             =   0
      Width           =   6810
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public LastSuccessfulConnectionIP As String, LastSuccessfulConnectionPort As Single
Public FormColor As ColorConstants, TextColor As ColorConstants, ButtonBack As ColorConstants
Public ButtonFore As ColorConstants, TitleBarBack As ColorConstants, TitleBarFore As ColorConstants
Public TextBoxFore As ColorConstants, TextBoxBack As ColorConstants

Private Sub Form_Load()
On Error Resume Next
Status "Getting last connection information...", 5
LastSuccessfulConnectionIP = ReadINI("LastSuccessfulConnection", "Computer", "SickAnimationsRC.ini")
LastSuccessfulConnectionPort = ReadINI("LastSuccessfulConnection", "Port", "SickAnimationsRC.ini")
Status "Getting form background color...", 10
FormColor = ReadINI("ColorScheme", "Form", "remotecontrol.ini")
Status "Getting label color...", 20
TextColor = ReadINI("ColorScheme", "TextColor", "SickAnimationsRC.ini")
Status "Getting button background colors...", 30
ButtonBack = ReadINI("ColorScheme", "ButtonBack", "SickAnimationsRC.ini")
Status "Getting button foreground color...", 45
ButtonFore = ReadINI("ColorScheme", "ButtonFore", "SickAnimationsRC.ini")
Status "Getting title bar background color", 58
TitleBarBack = ReadINI("ColorScheme", "TitleBarBack", "SickAnimationsRC.ini")
Status "Getting title bar foreground color...", 75
TitleBarFore = ReadINI("ColorScheme", "TitleBarFore", "SickAnimationsRC.ini")
Status "Getting text box background color...", 90
TextBoxBack = ReadINI("ColorScheme", "TextBoxBack", "SickAnimationsRC.ini")
Status "Getting text box foreground color...", 100
TextBoxFore = ReadINI("ColorScheme", "TextBoxFore", "SickAnimationsRC.ini")
Status "Loading SickAnimations Remote|Control...", 0
tmrLoad.Enabled = True
With frmMain
.lstMain.AddItem "Connection Info"
.lstMain.AddItem "Remote Computer Info"
.lstMain.AddItem "Spying"
.lstMain.AddItem "File Manager"
.lstMain.AddItem "File Transfers"
.lstMain.AddItem "Keyboard"
.lstMain.AddItem "Mouse"
.lstMain.AddItem "Windows"
.lstMain.AddItem "RemoteAxe-S"
.lstMain.AddItem "Chat"
.lstMain.AddItem "Message Boxes"
.lstMain.AddItem "Connection Bouncing"
.lstMain.AddItem "About RemoteControl"
.txtHost.Text = ReadINI("RememberedSettings", "Host", "remotecontrol.ini")
.txtPort.Text = ReadINI("RememberedSettings", "Port", "remotecontrol.ini")
.NickName = ReadINI("Chat", "nick", "remotecontrol.ini")
.txtChat.BackColor = ReadINI("Chat", "back", "remotecontrol.ini")

basDeclare.LastPath = basRegistry.ReadINI("Settings", "LastPath", "remotecontrol.ini")

Randomize
.CredRandX = Int(Rnd(picCredits.Width - lblCredits.Width) + 1)
Randomize
.CredRandX = Int(Rnd(picCredits.Height - lblCredits.Height) + 1)
End With

End Sub

Private Sub tmrLoad_Timer()
prgLoad.Value = prgLoad.Value + 2
If prgLoad.Value = 100 Then frmMain.Show: Unload Me
End Sub

Sub Status(Data As String, Progress As Single)
lblStatus.Caption = Data
prgLoad.Value = Progress
End Sub
