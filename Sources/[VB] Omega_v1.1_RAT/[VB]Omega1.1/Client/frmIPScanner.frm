VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmIPScanner 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "IP Scanner"
   ClientHeight    =   480
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   3090
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   480
   ScaleWidth      =   3090
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   2640
      Top             =   30
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox txtPort 
      Height          =   285
      Left            =   1680
      TabIndex        =   1
      Text            =   "Port"
      Top             =   60
      Width           =   885
   End
   Begin VB.TextBox txtIP 
      Height          =   285
      Left            =   60
      TabIndex        =   0
      Text            =   "IP"
      Top             =   60
      Width           =   1545
   End
End
Attribute VB_Name = "frmIPScanner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Winsock1_Close()
Winsock1.Close
Unload Me
End Sub

Private Sub Winsock1_Connect()
Winsock1.Close
frmMain.ListIP_0.AddItem txtIP.text & ":" & txtPort.text
Unload Me
End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
Winsock1.Close
Unload Me
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Winsock1.Close
Unload Me
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Winsock1.Close
Unload Me
End Sub
