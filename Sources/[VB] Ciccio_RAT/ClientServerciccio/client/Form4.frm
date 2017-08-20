VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "Print Text"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8115
   LinkTopic       =   "Form4"
   ScaleHeight     =   3195
   ScaleWidth      =   8115
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   2895
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Text            =   "Form4.frx":0000
      Top             =   120
      Width           =   5775
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Form4.frx":001B
      Left            =   7440
      List            =   "Form4.frx":0034
      TabIndex        =   2
      Text            =   "10"
      Top             =   1320
      Width           =   615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   6600
      TabIndex        =   1
      Top             =   720
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Print"
      Height          =   375
      Left            =   6600
      TabIndex        =   0
      Top             =   240
      Width           =   1455
   End
   Begin VB.Label Label2 
      Caption         =   "Print text in remote Printer"
      Height          =   495
      Left            =   6600
      TabIndex        =   4
      Top             =   2520
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Font Size:"
      Height          =   255
      Left            =   6600
      TabIndex        =   3
      Top             =   1440
      Width           =   735
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Combo1_Change()
    If Val(Combo1.Text) > 99 Then Combo1.Text = "99"
End Sub

Private Sub Command1_Click()
On Error GoTo Exitform4
    Form1.Winsock1.SendData "/PRINTTXT/" & Combo1.Text & Text1.Text
Exitform4:
    Form4.Hide
End Sub

Private Sub Command2_Click()
    Form4.Text1.Text = "Hello? Beautifull Printer!"
    Form4.Hide
End Sub

