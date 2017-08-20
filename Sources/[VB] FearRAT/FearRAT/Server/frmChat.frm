VERSION 5.00
Begin VB.Form frmChat 
   BackColor       =   &H00404040&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Chat Window"
   ClientHeight    =   2445
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4095
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2445
   ScaleWidth      =   4095
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdSend 
      BackColor       =   &H00C0C0C0&
      Caption         =   "&Send"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3300
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   2100
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin VB.TextBox txtSend 
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   30
      MaxLength       =   125
      TabIndex        =   1
      Top             =   2085
      Width           =   3210
   End
   Begin VB.TextBox txtChat 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00000000&
      Height          =   2025
      Left            =   45
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   30
      Width           =   4005
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public chatRespond As Boolean
Public Sub addChat(name As String, message As String)
txtChat.text = txtChat.text & vbCrLf & "<" & name$ & "> " & message$
txtChat.SelStart = Len(txtChat)
End Sub

Private Sub cmdSend_Click()
txtSend_KeyPress (13)
End Sub

Private Sub Form_Load()
StayOnTop Me
Me.Height = 2775
Me.Width = 4185
End Sub

Private Sub Form_Unload(Cancel As Integer)
chatShown = False
End Sub

Private Sub txtChat_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtSend.SetFocus
End Sub

Private Sub txtSend_KeyPress(KeyAscii As Integer)
If txtSend = "" Then Exit Sub
If KeyAscii = 13 Then
If frmMAIN.WS.State <> 7 Then
Exit Sub
End If
SD "chatmsg " & frmMAIN.WS.LocalIP & ":" & txtSend
addChat frmMAIN.WS.LocalIP, txtSend
txtSend = ""
End If
txtSend.SetFocus
End Sub
