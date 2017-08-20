VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Login"
   ClientHeight    =   1125
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3915
   Icon            =   "frmLogin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1125
   ScaleWidth      =   3915
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2580
      TabIndex        =   3
      Top             =   660
      Width           =   1000
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1500
      TabIndex        =   2
      Top             =   660
      Width           =   1000
   End
   Begin VB.TextBox txtPassword 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   295
      IMEMode         =   3  'DISABLE
      Left            =   1215
      MaxLength       =   8
      PasswordChar    =   "*"
      TabIndex        =   1
      ToolTipText     =   "Port number"
      Top             =   210
      Width           =   2355
   End
   Begin VB.Label lblLabels 
      Caption         =   "Password:"
      Height          =   270
      Index           =   1
      Left            =   330
      TabIndex        =   0
      Top             =   240
      Width           =   1080
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
Unload Me
Call frmMain.sendText(" ")
End Sub

Private Sub cmdOk_Click()
If Len(Trim(txtPassword.text)) >= 6 And Len(Trim(txtPassword.text)) <= 8 Then
   If Trim(txtPassword.text) <> "" Then
      Call frmMain.sendText(Trim(txtPassword.text))
      DoEvents
      Unload Me
   Else
      MsgBox "Please input password.", vbExclamation, "Login"
   End If
Else
   MsgBox "Please input password between 6 to 8 characters.", vbExclamation, "Set Password"
End If
End Sub
