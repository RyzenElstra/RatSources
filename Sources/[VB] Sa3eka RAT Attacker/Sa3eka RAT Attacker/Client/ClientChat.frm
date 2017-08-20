VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.ocx"
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   720
   ClientWidth     =   5250
   LinkTopic       =   "Form2"
   ScaleHeight     =   3030
   ScaleWidth      =   5250
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   4680
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send"
      Height          =   375
      Left            =   3840
      TabIndex        =   2
      Top             =   2640
      Width           =   1335
   End
   Begin VB.TextBox txtSend 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   2640
      Width           =   2775
   End
   Begin VB.TextBox txtMain 
      Height          =   2535
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5055
   End
   Begin VB.Menu newcon 
      Caption         =   "New Connection"
      Index           =   0
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdSend_Click()
Winsock1.SendData "Client : " & txtSend
txtMain = txtMain & "Client : " & TextSend & vbCrLf
End Sub

Private Sub newcon_Click(Index As Integer)
Dim Newip As String
Newip = InputBox("Buddy IP")
Winsock1.Close
Winsock1.Connect Newip, 3174

End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Dim GetMessage As String
Winsock1.GetData GetMessage
txtMain = txtMain & GetMessage & vbNewLine & vbCrLf
End Sub
