VERSION 5.00
Begin VB.Form frmDesktop 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3135
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   2295
      Left            =   0
      ScaleHeight     =   2295
      ScaleWidth      =   3255
      TabIndex        =   0
      Top             =   0
      Width           =   3255
   End
End
Attribute VB_Name = "frmDesktop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
With frmDesktop
.Top = 0
.Left = 0
.Width = Screen.Width
.Height = Screen.Height
.Picture1.Height = Screen.Height
.Picture1.Width = Screen.Width
End With
End Sub

Private Sub Picture1_dblClick()
Unload frmDesktop 'close if user clicks on captured screen
frmDesktop.Cls
End Sub
