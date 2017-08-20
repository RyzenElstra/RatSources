VERSION 5.00
Begin VB.Form frmPrint 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "FEAR - Print Text"
   ClientHeight    =   3300
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   3720
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3300
   ScaleWidth      =   3720
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command2 
      Caption         =   "&Print"
      Height          =   330
      Left            =   1755
      TabIndex        =   2
      Top             =   2955
      Width           =   960
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Close"
      Height          =   330
      Left            =   2745
      TabIndex        =   1
      Top             =   2955
      Width           =   975
   End
   Begin VB.TextBox txtprinT 
      Height          =   2925
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "frmPrint.frx":0000
      Top             =   0
      Width           =   3720
   End
End
Attribute VB_Name = "frmPrint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClose_Click()
Unload Me
End Sub

Private Sub Command2_Click()
SD "print " & txtprinT.Text
End Sub
