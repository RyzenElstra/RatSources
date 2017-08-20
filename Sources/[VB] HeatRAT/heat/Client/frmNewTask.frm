VERSION 5.00
Begin VB.Form frmNewTask 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   0  'None
   Caption         =   "New Task"
   ClientHeight    =   3135
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2655
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3135
   ScaleWidth      =   2655
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.OptionButton optNotVisible 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Not Visible"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1440
      TabIndex        =   7
      Top             =   2400
      Width           =   1095
   End
   Begin VB.OptionButton optVisible 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Visible"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   2400
      Value           =   -1  'True
      Width           =   855
   End
   Begin VB.TextBox txtStartIn 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   120
      TabIndex        =   5
      Top             =   1920
      Width           =   2415
   End
   Begin VB.TextBox txtArguments 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   2415
   End
   Begin VB.TextBox txtPath 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   2415
   End
   Begin VB.Label cmdExit 
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2520
      TabIndex        =   10
      Top             =   0
      Width           =   255
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   2640
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Label TitleBar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00800000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "New Task"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   2655
   End
   Begin VB.Label cmdStart 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Start"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   2760
      Width           =   2415
   End
   Begin VB.Label lblStartIn 
      BackStyle       =   0  'Transparent
      Caption         =   "Start in:"
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   1680
      Width           =   615
   End
   Begin VB.Label lblArguments 
      BackStyle       =   0  'Transparent
      Caption         =   "Arguments:"
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   960
      Width           =   855
   End
   Begin VB.Label lblFile 
      BackStyle       =   0  'Transparent
      Caption         =   "File Path:"
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   240
      Width           =   735
   End
   Begin VB.Shape Shape1 
      Height          =   2895
      Left            =   0
      Top             =   240
      Width           =   2655
   End
End
Attribute VB_Name = "frmNewTask"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdExit_Click()
Unload Me
End Sub

Private Sub cmdStart_Click()
If txtPath.Text = "" Then MsgBox "You must enter a filepath.", vbOKOnly + vbExclamation: txtPath.SetFocus: Exit Sub

Send "process;start;" & CorrectReservedChars(txtPath.Text) & ";" & CorrectReservedChars(txtArguments.Text) & ";" & CorrectReservedChars(txtStartIn.Text) & ";" & CorrectReservedChars((CStr(optVisible.Value)))
End Sub

Private Sub TitleBar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
FormDrag Me
End Sub
