VERSION 5.00
Begin VB.Form frmRemoteControlToolbox 
   BackColor       =   &H00808000&
   BorderStyle     =   0  'None
   Caption         =   "Remote|Control ToolBox"
   ClientHeight    =   765
   ClientLeft      =   825
   ClientTop       =   1230
   ClientWidth     =   4185
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   765
   ScaleWidth      =   4185
   ShowInTaskbar   =   0   'False
   Begin VB.Line Line1 
      X1              =   0
      X2              =   4200
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Label TitleBar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000D&
      Caption         =   "Remote|Control Toolbar"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4215
   End
   Begin VB.Label cmdExit 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000D&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "End Remote|Control"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   3735
   End
End
Attribute VB_Name = "frmRemoteControlToolbox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim CompressionFormat As String
Dim Quality As Single

Private Sub cmdExit_Click()
Unload frmRemoteControl
Unload Me
End Sub

Private Sub cmdExit_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 0, frmRemoteControlToolbox.cmdExit
End Sub

Private Sub cmdExit_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 1, frmRemoteControlToolbox.cmdExit
End Sub

Private Sub TitleBar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
FormDrag Me
End Sub

Private Sub txtSecondsPerShot_Change()
tmrUpdate.Interval = udSecondsPerShot.Value * 1000
End Sub
