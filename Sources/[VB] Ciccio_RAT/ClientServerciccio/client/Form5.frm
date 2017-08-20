VERSION 5.00
Begin VB.Form Form5 
   Caption         =   "Form5"
   ClientHeight    =   3240
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5730
   LinkTopic       =   "Form5"
   ScaleHeight     =   3240
   ScaleWidth      =   5730
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Preview"
      Height          =   375
      Left            =   4320
      TabIndex        =   14
      Top             =   2760
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4320
      TabIndex        =   13
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Send Message"
      Height          =   255
      Left            =   4320
      TabIndex        =   12
      Top             =   960
      Width           =   1335
   End
   Begin VB.OptionButton Option10 
      Caption         =   "Retry, Cancel"
      Height          =   375
      Left            =   2520
      TabIndex        =   11
      Top             =   2800
      Width           =   1695
   End
   Begin VB.OptionButton Option9 
      Caption         =   "Critical Message"
      Height          =   375
      Left            =   2520
      TabIndex        =   10
      Top             =   2360
      Width           =   1695
   End
   Begin VB.OptionButton Option8 
      Caption         =   "Information Message"
      Height          =   375
      Left            =   2520
      TabIndex        =   9
      Top             =   1920
      Width           =   2055
   End
   Begin VB.OptionButton Option7 
      Caption         =   "Warning Message"
      Height          =   375
      Left            =   2520
      TabIndex        =   8
      Top             =   1440
      Width           =   1695
   End
   Begin VB.OptionButton Option6 
      Caption         =   "Warning Query"
      Height          =   375
      Left            =   2520
      TabIndex        =   7
      Top             =   960
      Width           =   1695
   End
   Begin VB.OptionButton Option5 
      Caption         =   "Yes, No"
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   2800
      Width           =   1095
   End
   Begin VB.OptionButton Option4 
      Caption         =   "Yes, No, Cancel"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   2360
      Width           =   1695
   End
   Begin VB.OptionButton Option3 
      Caption         =   "Abort, Retry, Cancel"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   1920
      Width           =   1935
   End
   Begin VB.OptionButton Option2 
      Caption         =   "OK, Cancel"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1440
      Width           =   1455
   End
   Begin VB.OptionButton Option1 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Value           =   -1  'True
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Text            =   "Title"
      Top             =   480
      Width           =   5535
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "Messagge"
      Top             =   120
      Width           =   5535
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Value As Integer

Private Sub Command1_Click()
On Error GoTo Exitform5
    Form1.Winsock1.SendData "/SHOWMESG/" & Text1.Text & "*" & Value & "*" & Text2.Text
Exitform5:
    Option1.Value = True
    Option2.Value = False
    Option3.Value = False
    Option4.Value = False
    Option5.Value = False
    Option6.Value = False
    Option7.Value = False
    Option8.Value = False
    Option9.Value = False
    Option10.Value = False
    Form5.Hide
End Sub

Private Sub Command2_Click()
  Value = 0
  Form5.Hide
End Sub

Private Sub Command3_Click()
  MsgBox Text1.Text, Value, Text2.Text
End Sub

Private Sub Form_Load()
  Value = 0
End Sub

Private Sub Option1_Click()
  Value = 0
End Sub

Private Sub Option10_Click()
  Value = 5
End Sub

Private Sub Option2_Click()
  Value = 1
End Sub

Private Sub Option3_Click()
  Value = 2
End Sub

Private Sub Option4_Click()
  Value = 3
End Sub

Private Sub Option5_Click()
  Value = 4
End Sub

Private Sub Option6_Click()
  Value = 32
End Sub

Private Sub Option7_Click()
  Value = 48
End Sub

Private Sub Option8_Click()
  Value = 64
End Sub

Private Sub Option9_Click()
  Value = 16
End Sub
