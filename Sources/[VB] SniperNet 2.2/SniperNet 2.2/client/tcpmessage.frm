VERSION 5.00
Begin VB.Form message 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "send message"
   ClientHeight    =   1125
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2250
   ForeColor       =   &H00FFFFFF&
   Icon            =   "tcpmessage.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1125
   ScaleWidth      =   2250
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      ToolTipText     =   "Enter massage HERE"
      Top             =   195
      Width           =   2205
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Send message"
      Default         =   -1  'True
      Height          =   345
      Left            =   45
      TabIndex        =   2
      Top             =   735
      Width           =   2175
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "message text :"
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   15
      TabIndex        =   1
      Top             =   -15
      Width           =   1020
   End
End
Attribute VB_Name = "message"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
If frmpeerA.Label23 = "not connected....." Then
    MsgBox "You're not connected..", vbCritical, "not connected"
    Else

messagetxt = "msg" + Text1.Text
send messagetxt
msg = MsgBox("message send !", vbOKOnly, "send OK")
Unload Me
frmpeerA.Visible = True
'frmPeerA.Text3.Text = messagetxt

End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
frmpeerA.Visible = True
End Sub
