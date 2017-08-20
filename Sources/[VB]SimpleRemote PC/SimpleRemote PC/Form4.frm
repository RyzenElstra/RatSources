VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Chat"
   ClientHeight    =   3990
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5670
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3990
   ScaleWidth      =   5670
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton send 
      BackColor       =   &H80000001&
      Caption         =   "Envoyer"
      Height          =   375
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   3480
      Width           =   4935
   End
   Begin VB.TextBox txtsend 
      BackColor       =   &H00FFFF00&
      Height          =   975
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   2400
      Width           =   4935
   End
   Begin VB.TextBox txtOutput 
      BackColor       =   &H00FFFF00&
      Height          =   1935
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   240
      Width           =   4935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub send_Click()
frmmain.Winsock2(Counter).SendData txtsend.Text
ChatName = frmmain.Winsock2(Counter).LocalHostName

txtOutput.Text = txtOutput.Text + vbCrLf + ChatName + ": " + txtsend.Text
txtsend.Text = ""
End Sub
Private Sub txtsend_Change()
If KeyAscii = 13 Then send_Click

End Sub
Public Sub Unloadme()
Unload Form1
End Sub
