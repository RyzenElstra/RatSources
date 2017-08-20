VERSION 5.00
Begin VB.Form frmSCR 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   2295
      Left            =   0
      ScaleHeight     =   2295
      ScaleWidth      =   3465
      TabIndex        =   0
      Top             =   0
      Width           =   3465
   End
End
Attribute VB_Name = "frmSCR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Me.Cls
Picture1.Cls
Call StayOnTop(Me)
End Sub

Private Sub Picture1_Click()
Me.Hide 'close if user clicks on captured screen
End Sub
