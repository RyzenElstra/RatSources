VERSION 5.00
Begin VB.Form frmChat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form2"
   ClientHeight    =   4455
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   8520
   Icon            =   "frmChat.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   8520
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   4455
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8535
      Begin VB.Timer tmrLock 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   8040
         Top             =   0
      End
      Begin VB.TextBox txtCancel 
         Height          =   285
         Left            =   600
         TabIndex        =   6
         Top             =   0
         Visible         =   0   'False
         Width           =   150
      End
      Begin VB.TextBox txtClientNick 
         Height          =   285
         Left            =   360
         TabIndex        =   5
         Top             =   0
         Visible         =   0   'False
         Width           =   150
      End
      Begin VB.TextBox txtServerNick 
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Top             =   0
         Visible         =   0   'False
         Width           =   150
      End
      Begin VB.TextBox txtSend 
         Height          =   285
         Left            =   120
         TabIndex        =   3
         Top             =   4080
         Width           =   6855
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Enviar"
         Height          =   255
         Left            =   7200
         TabIndex        =   2
         Top             =   4080
         Width           =   1215
      End
      Begin VB.TextBox txtLog 
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00000000&
         Height          =   3735
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   240
         Width           =   8295
      End
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
txtLog.Text = txtLog.Text & vbCrLf & vbCrLf & Time & " " & txtServerNick.Text & " dice:" & vbCrLf & "    " & txtSend.Text
Send "msgChat|" & vbCrLf & vbCrLf & Time & " " & txtServerNick.Text & " dice:" & vbCrLf & "    " & txtSend.Text
txtSend.Text = ""
txtSend.SetFocus
End Sub

Private Sub Form_Load()
App.TaskVisible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
If txtCancel.Text = "" Then
Cancel = 1
Send "ServerClose|"
Else: Cancel = 0
End If
End Sub

Private Sub txtSend_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
KeyAscii = 0
Call Command1_Click
End If
End Sub

Private Sub txtLog_Change()
txtLog.SelStart = Len(txtLog.Text)
End Sub
