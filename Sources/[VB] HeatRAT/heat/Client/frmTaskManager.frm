VERSION 5.00
Begin VB.Form frmTaskManager 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Close Program"
   ClientHeight    =   3840
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4815
   ControlBox      =   0   'False
   Icon            =   "frmTaskManager.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3840
   ScaleWidth      =   4815
   StartUpPosition =   1  'CenterOwner
   Begin VB.ListBox lstID 
      Height          =   2205
      Left            =   4920
      TabIndex        =   5
      Top             =   120
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   350
      Left            =   3205
      TabIndex        =   4
      Top             =   3320
      Width           =   1390
   End
   Begin VB.CommandButton cmdShutDown 
      Caption         =   "Shut Down"
      Height          =   350
      Left            =   1655
      TabIndex        =   3
      Top             =   3320
      Width           =   1390
   End
   Begin VB.CommandButton cmdEndTask 
      Caption         =   "End Task"
      Height          =   350
      Left            =   185
      TabIndex        =   2
      Top             =   3320
      Width           =   1390
   End
   Begin VB.ListBox lstTasks 
      Height          =   2205
      Left            =   185
      TabIndex        =   0
      Top             =   170
      Width           =   4410
   End
   Begin VB.Label lblWarning 
      BackStyle       =   0  'Transparent
      Caption         =   $"frmTaskManager.frx":000C
      Height          =   735
      Left            =   180
      TabIndex        =   1
      Top             =   2453
      Width           =   4455
   End
End
Attribute VB_Name = "frmTaskManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub cmdEndTask_Click()
Send "process;end;" & lstID.Text
Unload Me
End Sub

Private Sub cmdShutDown_Click()
Dim result As VbMsgBoxResult
result = MsgBox("Are you sure you want to shut down remote computer?", vbExclamation + vbYesNo, "Warning")
If result = vbNo Then Exit Sub
Send "windows;power;shutdown"
End Sub

Private Sub Form_Load()
lstTasks.AddItem "Awaiting Data..."
lstID.AddItem "Awaiting Data..."
End Sub

Private Sub lstTasks_Click()
lstID.ListIndex = lstTasks.ListIndex
End Sub
