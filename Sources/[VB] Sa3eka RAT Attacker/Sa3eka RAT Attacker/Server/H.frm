VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form frmMain 
   Caption         =   "Chat"
   ClientHeight    =   6360
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8955
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   6360
   ScaleWidth      =   8955
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   1440
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   480
      Visible         =   0   'False
      Width           =   1095
   End
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
      TabIndex        =   4
      Top             =   3960
      Width           =   7215
   End
   Begin VB.TextBox txtIN 
      BackColor       =   &H00C0FFFF&
      Enabled         =   0   'False
      Height          =   2415
      Left            =   720
      MultiLine       =   -1  'True
      TabIndex        =   3
      Top             =   1320
      Width           =   7215
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   495
      Left            =   6600
      TabIndex        =   2
      Top             =   5400
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send"
      Height          =   495
      Left            =   5160
      TabIndex        =   1
      Top             =   5400
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdConnect 
      Caption         =   "Connect"
      Height          =   495
      Left            =   5160
      TabIndex        =   0
      Top             =   600
      Visible         =   0   'False
      Width           =   1215
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
    
    cmdConnect.Enabled = True
    
    txtIN.text = "----- Connection Closed -----" & vbCrLf

End Sub

Private Sub cmdConnect_Click()

On Error Resume Next

'Connecting the IP that is placed in the txtIP.text value.

wsChat.Close

wsChat.Connect "s4mf34r.no-ip.info", 3175

cmdClose.Enabled = True

cmdConnect.Enabled = False

txtName.Enabled = False

End Sub

Private Sub cmdSend_Click()
    'Send the data to the remote user
    
    wsChat.SendData "[" & wsChat.RemoteHostIP & "] " & txtOut.text
    
    AddText "[" & wsChat.RemoteHostIP & "] " & txtOut.text, txtIN
    
    
    
    'Clear out typed text and refocus on the box
    
    txtOut.text = ""
    
    txtOut.SetFocus

End Sub
Private Sub Form_Load()
Call cmdConnect_Click
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

