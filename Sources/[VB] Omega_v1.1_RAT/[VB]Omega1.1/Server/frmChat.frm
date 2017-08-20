VERSION 5.00
Begin VB.Form frmChat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chat"
   ClientHeight    =   3630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4905
   Icon            =   "frmChat.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3630
   ScaleWidth      =   4905
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtData 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   3000
      Left            =   60
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   60
      Width           =   4800
   End
   Begin VB.TextBox txtSend 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   60
      TabIndex        =   1
      Top             =   3180
      Width           =   3855
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send"
      Height          =   330
      Left            =   4020
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Send text"
      Top             =   3180
      Width           =   800
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim NickName As String
Dim isCloseChat As Boolean

Private Sub cmdSend_Click()
 If Len(txtSend.Text) > 0 Then
    txtData.Text = txtData & "<Server>" & Trim(txtSend) & vbCrLf
    Call frmServer.sendText(txtSend)
    txtSend.Text = ""
    txtSend.SetFocus
 End If
End Sub

Public Sub ReceiveText(Text As String)
    txtData.Text = txtData & "<" & NickName & ">" & Text & vbCrLf
End Sub

Private Sub txtData_Change()
    txtData.SelStart = Len(txtData.Text)
End Sub

Public Sub SetNickname(Name As String)
    NickName = Name
End Sub

Public Sub closeChat()
    isCloseChat = True
    Unload Me
End Sub

Public Sub SetFormsize(size As Double)
Dim x, y As Long
  
  x = Screen.Width / Screen.TwipsPerPixelX
  y = Screen.Height / Screen.TwipsPerPixelY
  
  x = (size / 100) * x * 15
  y = (size / 100) * y * 15
  
  frmChat.Width = x
  frmChat.Height = y
  
  txtData.Width = x - 200
  txtData.Height = y - 1000
  
  txtSend.Width = x - 1120
  txtSend.Top = y - 820
  
  cmdSend.Left = x - 980
  cmdSend.Top = y - 820
  
End Sub

Private Sub Form_Load()
Dim MyMenu As Long

isCloseChat = False
Call StayOnTop(Me)
MyMenu = GetSystemMenu(Me.hwnd, 0) 'disable X button
Call RemoveMenu(MyMenu, &HF060, 0)
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
If isCloseChat Then
   Cancel = 0
Else
   Cancel = 1
End If
End Sub
