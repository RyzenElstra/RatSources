VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   Caption         =   "Chat Screen"
   ClientHeight    =   6360
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8955
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   6360
   ScaleWidth      =   8955
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock wsChat 
      Left            =   960
      Top             =   5640
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox txtOut 
      Height          =   1335
      Left            =   720
      MultiLine       =   -1  'True
      TabIndex        =   6
      Top             =   3960
      Width           =   7215
   End
   Begin VB.TextBox txtIN 
      BackColor       =   &H00C0FFFF&
      Enabled         =   0   'False
      Height          =   2415
      Left            =   720
      MultiLine       =   -1  'True
      TabIndex        =   5
      Top             =   1320
      Width           =   7215
   End
   Begin VB.TextBox txtName 
      Height          =   495
      Left            =   720
      TabIndex        =   3
      Top             =   600
      Width           =   1935
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   495
      Left            =   6240
      TabIndex        =   2
      Top             =   5400
      Width           =   1575
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send"
      Height          =   495
      Left            =   4680
      TabIndex        =   1
      Top             =   5400
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdListen 
      Caption         =   "Start"
      Height          =   495
      Left            =   6720
      TabIndex        =   0
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Name:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   960
      TabIndex        =   4
      Top             =   360
      Width           =   735
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClose_Click()
    'Disable the outgoing buttons and tell the user
    
    'that the connection has been closed
    
    wsChat.Close
    
    cmdClose.Enabled = False
    
    cmdSend.Enabled = False
    
    txtName.Enabled = True
    
    cmdListen.Enabled = True
    
    txtIN.text = "----- Connection Closed -----" & vbCrLf

End Sub


Private Sub cmdListen_Click()
    If txtName.text = "" Then
    
    MsgBox "You must enter an alias first!", vbCritical, "Error!"
    
    txtName.SetFocus
    
    Exit Sub
    
    End If
    
    wsChat.Close
    
    wsChat.LocalPort = 3175
    
    wsChat.Listen
    
    cmdClose.Enabled = True
    
    cmdListen.Enabled = False
    
    txtName.Enabled = False
    
    AddText "----- Waiting for Connection -----", txtIN

End Sub

Private Sub cmdSend_Click()
    'Send the data to the remote user
    
    wsChat.SendData "[" & txtName.text & "] " & txtOut.text
    
    AddText "[" & txtName.text & "] " & txtOut.text, txtIN
    
    
    
    'Clear out typed text and refocus on the box
    
    txtOut.text = ""
    
    txtOut.SetFocus

End Sub



Private Sub txtOut_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        cmdSend_Click
    End If
End Sub

Private Sub wsChat_Connect()
    Do
    
    DoEvents
    
    Loop Until wsChat.State = sckConnected Or wsChat.State = sckError
    If wsChat.State = sckConnected Then

    'Tell the user that the connection has been established
    
    AddText "----- Connection Established -----" & vbCrLf, txtIN
    
    cmdSend.Enabled = True
    
    txtName.Enabled = False
    
    txtOut.SetFocus
    
    Else
    
    'Tell the user that the connection has been established
    
    AddText "----- Connection Failed -----" & vbCrLf, txtIN
    
    End If

End Sub

Private Sub AddText(ByVal text As String, ByRef Box As TextBox)
    'Take the text box passed as a reference and
    
    'add the "text" variable to it
    
    Box.text = Box.text & text & vbCrLf
    
    Box.SelStart = Len(Box.text)
    
    

End Sub

Private Sub wsChat_ConnectionRequest(ByVal requestID As Long)
  
    wsChat.Close
    
    wsChat.Accept requestID
    
    
    
    'If the remote system requests a connection, accept it and connect
    
    AddText "----- Connection Established -----" & vbCrLf, txtIN
    
    'Tell the user that the connection has been established
    
    cmdSend.Enabled = True
    
    txtName.Enabled = False
    
    txtOut.SetFocus

End Sub

Private Sub wsChat_DataArrival(ByVal bytesTotal As Long)
    Dim incoming As String



    'Tell the Winsock control to place the incoming data into a string.
    
    'Then call the function to print the data into the "Incoming Data" textbox.
    
    
    
    wsChat.GetData incoming
    
    AddText incoming, txtIN

End Sub

Private Sub wsChat_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    If Number <> 0 Then

    AddText "----- Error [" & Description & "] -----" & vbCrLf, txtIN

    Call cmdClose_Click

End If

End Sub

Private Sub txtIP_Change()

End Sub

