VERSION 5.00
Begin VB.Form frmChat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Victim Chat"
   ClientHeight    =   4005
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4995
   Icon            =   "frmChat.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4005
   ScaleWidth      =   4995
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   3
      ToolTipText     =   "Send text"
      Top             =   3540
      Width           =   800
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4110
      Style           =   1  'Graphical
      TabIndex        =   2
      ToolTipText     =   "Close"
      Top             =   3540
      Width           =   800
   End
   Begin VB.TextBox txtSend 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   90
      TabIndex        =   1
      Top             =   3540
      Width           =   3040
   End
   Begin VB.TextBox txtData 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   3300
      Left            =   90
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   120
      Width           =   4830
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim NickName As String

Private Sub cmdSend_Click()
  If Len(txtSend.text) > 0 Then
    txtData.text = txtData & "<" & NickName & ">" & Trim(txtSend) & vbCrLf
    Call frmMain.sendText(txtSend)
    DoEvents
    txtSend.text = ""
    txtSend.SetFocus
  End If
End Sub

Public Sub ReceiveText(text As String)
    txtData.text = txtData & "<Server>" & text & vbCrLf
End Sub

Private Sub txtData_Change()
    txtData.SelStart = Len(txtData.text)
End Sub

Public Sub SetNickname(Name As String)
    NickName = Name
End Sub

Private Sub cmdClose_Click()
    Call CloseChat
    DoEvents
    Unload Me
End Sub

Private Sub CloseChat()
    frmMain.Show
    Call frmMain.CloseChat
End Sub

Private Sub Form_Load()
    frmMain.Hide
    txtData.text = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Call CloseChat
    Unload Me
End Sub
