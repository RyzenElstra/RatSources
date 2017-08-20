VERSION 5.00
Begin VB.Form frmScreenCapture 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Screen Capture"
   ClientHeight    =   6240
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6240
   ScaleWidth      =   7680
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cmbInterval 
      Height          =   315
      ItemData        =   "frmScreenCapture.frx":0000
      Left            =   5040
      List            =   "frmScreenCapture.frx":0025
      TabIndex        =   3
      Text            =   "15"
      Top             =   5760
      Width           =   735
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Start"
      Height          =   375
      Left            =   5880
      TabIndex        =   2
      Top             =   5760
      Width           =   1695
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   5760
      Width           =   1695
   End
   Begin VB.PictureBox picScreen 
      Height          =   5535
      Left            =   120
      ScaleHeight     =   5475
      ScaleWidth      =   7395
      TabIndex        =   0
      Top             =   120
      Width           =   7455
   End
End
Attribute VB_Name = "frmScreenCapture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const sSplit = "#^#"

Private Sub cmdStart_Click()
frmMain.SendData "[STARTSCREENCAPTURE]" & sSplit & cmbInterval.Text & sSplit
End Sub

Private Sub cmdStop_Click()
frmMain.SendData "[STOPSCREENCAPTURE]"
End Sub

Private Sub Form_Unload(Cancel As Integer)
Me.Caption = "Screen Capture"
End Sub
