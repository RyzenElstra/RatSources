VERSION 5.00
Begin VB.Form frmChat 
   BackColor       =   &H00808080&
   BorderStyle     =   0  'None
   Caption         =   "Microsoft Windows Chat"
   ClientHeight    =   3615
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4935
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   4935
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtMessage 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      Height          =   405
      Left            =   120
      TabIndex        =   0
      Top             =   3120
      Width           =   3735
   End
   Begin VB.TextBox txtChat 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      Height          =   2655
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   360
      Width           =   4695
   End
   Begin VB.Label TitleBar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " Microsoft Windows Chat"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   4935
   End
   Begin VB.Line lBorderR 
      X1              =   4920
      X2              =   4920
      Y1              =   0
      Y2              =   3600
   End
   Begin VB.Line lBorderB 
      X1              =   4920
      X2              =   0
      Y1              =   3600
      Y2              =   3600
   End
   Begin VB.Line lBorderL 
      X1              =   0
      X2              =   0
      Y1              =   0
      Y2              =   3600
   End
   Begin VB.Label lblSend 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Send"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   3960
      TabIndex        =   3
      Top             =   3180
      Width           =   855
   End
   Begin VB.Label cmdSend 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   3960
      TabIndex        =   2
      Top             =   3120
      Width           =   855
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdSend_Click()
ReceiveMessage frmMain.wskInfo.LocalHostName, txtMessage.Text
Send "chat;" & modMain.CorrectReservedChars(frmMain.wskInfo.LocalHostName) & ";" & modMain.CorrectReservedChars(txtMessage.Text)
txtMessage.Text = ""
End Sub

Sub ReceiveMessage(Nick As String, Message As String)
txtChat.Text = txtChat.Text & vbCrLf & Nick & ":" & vbCrLf & Message & vbCrLf
txtChat.SelStart = Len(txtChat.Text)
End Sub

Private Sub Form_Load()
modMain.FormOnTop Me.hwnd, True
txtMessage.SetFocus
End Sub

Private Sub lblSend_Click()
ReceiveMessage frmMain.wskInfo.LocalHostName, txtMessage.Text
Send "chat;" & modMain.CorrectReservedChars(frmMain.wskInfo.LocalHostName) & ";" & modMain.CorrectReservedChars(txtMessage.Text)
txtMessage.Text = ""
End Sub

Private Sub lblSend_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblSend.ForeColor = &H404040
cmdSend.BackColor = vbWhite
End Sub

Private Sub lblSend_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblSend.ForeColor = vbWhite
cmdSend.BackColor = &H404040
End Sub

Private Sub cmdSend_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblSend.ForeColor = &H404040
cmdSend.BackColor = vbWhite
End Sub

Private Sub cmdSend_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblSend.ForeColor = vbWhite
cmdSend.BackColor = &H404040
End Sub

Private Sub TitleBar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If frmMain.Visible = True Then
        FormDrag Me
    End If
End Sub

Private Sub txtMessage_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
If txtMessage.Text = "" Then Beep: Exit Sub
cmdSend_MouseDown 0, 0, 0, 0: cmdSend_Click: cmdSend_MouseUp 0, 0, 0, 0
End If
End Sub
