VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.ocx"
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3990
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   5445
   LinkTopic       =   "Form2"
   ScaleHeight     =   3990
   ScaleWidth      =   5445
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtOutput 
      Height          =   2655
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   5415
   End
   Begin VB.TextBox txtSendData 
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   2760
      Width           =   4575
   End
   Begin MSWinsockLib.Winsock tcpServer 
      Left            =   6600
      Top             =   3240
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
' Set the LocalPort property to an integer.
' Then invoke the Listen method.
tcpServer.LocalPort = 3175
tcpServer.Listen
End Sub

Private Sub tcpServer_ConnectionRequest _
(ByVal requestID As Long)
tcpServer.Accept requestID
End Sub

Private Sub txtSendData_Change()
' The TextBox control named txtSendData
' contains the data to be sent. Whenever the user
' types into the textbox, the string is sent
' using the SendData method.
tcpServer.SendData txtSendData.Text
End Sub

Private Sub tcpServer_DataArrival _
(ByVal bytesTotal As Long)
' Declare a variable for the incoming data.
' Invoke the GetData method and set the Text
' property of a TextBox named txtOutput to
' the data.
Dim strData As String
tcpServer.GetData strData
txtOutput.Text = strData
End Sub



