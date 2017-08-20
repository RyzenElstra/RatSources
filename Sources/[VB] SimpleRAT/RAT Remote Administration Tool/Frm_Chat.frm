VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Frm_Chat 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   0  'None
   Caption         =   "CHAT"
   ClientHeight    =   5445
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6285
   Icon            =   "Frm_Chat.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5445
   ScaleWidth      =   6285
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrchat 
      Interval        =   2000
      Left            =   480
      Top             =   3120
   End
   Begin MSWinsockLib.Winsock sockschat 
      Left            =   960
      Top             =   3120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.PictureBox picchat 
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H8000000C&
      Height          =   5415
      Left            =   0
      ScaleHeight     =   5415
      ScaleWidth      =   6255
      TabIndex        =   7
      Top             =   0
      Width           =   6255
      Begin VB.TextBox txtrecivedmsg 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   4095
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   480
         Width           =   5775
      End
      Begin VB.TextBox txtname 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2160
         TabIndex        =   0
         Text            =   "RAT"
         ToolTipText     =   "Your Nick Name"
         Top             =   2520
         Width           =   1575
      End
      Begin VB.TextBox txtsendmsg 
         Height          =   375
         Left            =   240
         TabIndex        =   2
         ToolTipText     =   "Message To Be Sent"
         Top             =   4765
         Width           =   4575
      End
      Begin VB.Label lblcaption 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00404040&
         Caption         =   "LOGIN AS"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000016&
         Height          =   255
         Left            =   1080
         TabIndex        =   9
         Top             =   2550
         Width           =   855
      End
      Begin VB.Label lbllogin 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "LOGIN"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   270
         Left            =   3960
         MouseIcon       =   "Frm_Chat.frx":030A
         MousePointer    =   99  'Custom
         TabIndex        =   1
         ToolTipText     =   "Login With Server"
         Top             =   2520
         Width           =   975
      End
      Begin VB.Label lblchatminimize 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   1
         Left            =   5660
         MouseIcon       =   "Frm_Chat.frx":0614
         MousePointer    =   99  'Custom
         TabIndex        =   5
         ToolTipText     =   "Minimize RAT chat"
         Top             =   40
         Width           =   255
      End
      Begin VB.Label lblchatclose 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   0
         Left            =   5950
         MouseIcon       =   "Frm_Chat.frx":091E
         MousePointer    =   99  'Custom
         TabIndex        =   6
         ToolTipText     =   "Exit RAT chat"
         Top             =   40
         Width           =   255
      End
      Begin VB.Label lblchat 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "  Chat"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   240
         Left            =   0
         TabIndex        =   8
         ToolTipText     =   "RAT - Chat"
         Top             =   40
         Width           =   5620
      End
      Begin VB.Label lblsend 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SEND"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   270
         Left            =   5040
         MouseIcon       =   "Frm_Chat.frx":0C28
         MousePointer    =   99  'Custom
         TabIndex        =   3
         ToolTipText     =   "Send The Message To Server"
         Top             =   4815
         Width           =   980
      End
   End
End
Attribute VB_Name = "Frm_Chat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a, b, c As Integer
Dim timer As Integer
Dim nick, printmsg, msg As String

Private Sub Form_Load() 'invisible the message area to show login
On Error Resume Next
chatopen = True
lblsend.Visible = False
txtsendmsg.Visible = False
txtrecivedmsg.Visible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
chatopen = False
End Sub

'chat move
Private Sub lblchat_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
MousePointer = 5
b = X
c = Y
a = True
End Sub

'chat move
Private Sub lblchat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
 If a Then
       Frm_Chat.Move Left + (X - b), Top + (Y - c)
    End If
End Sub

'chat move
Private Sub lblchat_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
MousePointer = 0
a = False
End Sub

Private Sub lblchatclose_Click(Index As Integer)
On Error Resume Next
If sockschat.State = 7 Then
sockschat.SendData "EXITCHAT" 'send message to server to close the chat
End If
timer = 0
Do While timer = 0
    DoEvents
Loop
Unload Me
progress = "Chat Ended"
End Sub

Private Sub lblchatminimize_Click(Index As Integer) 'minimize
On Error Resume Next
Frm_Chat.WindowState = 1
End Sub

Private Sub lbllogin_Click() 'login
On Error Resume Next
sockschat.Close
sockschat.Connect serverip, 3334
timer = 0
Do While timer = 0
    DoEvents
Loop
If sockschat.State = 7 Then
    lblsend.Visible = True
    txtsendmsg.Visible = True
    txtrecivedmsg.Visible = True
    nick = Trim(txtname.Text)
    sockschat.SendData (nick & "2222") 'send "NICK+2222"
    txtrecivedmsg.Text = "CHAT_STARTED_WITH_" & sockschat.RemoteHost & "_on_(" & Date & " , " & Time & ")_AS_" & nick & vbNewLine & vbNewLine
Else
    MsgBox "No Connection For Chat", , "RAT - ALERT"
End If
End Sub

Private Sub lblsend_Click() 'send message
On Error Resume Next
If Len(txtsendmsg.Text) <> 0 Then
    msg = nick & " :  " & Trim(txtsendmsg.Text)
    txtrecivedmsg.Text = txtrecivedmsg.Text & msg & vbNewLine
    txtrecivedmsg.SelStart = Len(txtrecivedmsg.Text)
    sockschat.SendData txtsendmsg.Text
    txtsendmsg.SelStart = 0
    txtsendmsg.SelLength = Len(txtsendmsg.Text)
End If
End Sub

'''''''''''''''''''''''CHAT DATA ARRIVAL'''''''''''''''''''''''
Private Sub sockschat_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim rvdata As String

sockschat.GetData rvdata 'Recived data
printmsg = sockschat.RemoteHost & " :  " & Trim(rvdata)
txtrecivedmsg.Text = txtrecivedmsg.Text & printmsg & vbNewLine
txtrecivedmsg.SelStart = Len(txtrecivedmsg.Text)
End Sub

Private Sub tmrchat_Timer()
On Error Resume Next
timer = 1
End Sub

Private Sub lblsend_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BorderStyle = 1
End Sub

Private Sub lblsend_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BorderStyle = 0
End Sub

Private Sub txtname_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lbllogin_Click
End Sub

Private Sub txtsendmsg_Click()
txtsendmsg.SelStart = 0
txtsendmsg.SelLength = Len(txtsendmsg.Text)
End Sub

Private Sub txtsendmsg_GotFocus()
txtsendmsg.SelStart = 0
txtsendmsg.SelLength = Len(txtsendmsg.Text)
End Sub

Private Sub txtsendmsg_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblsend_Click
End Sub

Private Sub lbllogin_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbllogin.BorderStyle = 1
End Sub

Private Sub lbllogin_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbllogin.BorderStyle = 0
End Sub
