VERSION 5.00
Begin VB.Form test 
   Caption         =   "test client"
   ClientHeight    =   7425
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10005
   LinkTopic       =   "Form7"
   ScaleHeight     =   7425
   ScaleWidth      =   10005
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   3855
   End
   Begin VB.TextBox Text1 
      Height          =   6735
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "test.frx":0000
      Top             =   600
      Width           =   9735
   End
End
Attribute VB_Name = "test"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
