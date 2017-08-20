VERSION 5.00
Begin VB.Form cmd 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Remote Shell"
   ClientHeight    =   3765
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   8760
   Icon            =   "cmd.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3765
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Enviar"
      Height          =   255
      Left            =   9960
      TabIndex        =   2
      Top             =   3720
      Width           =   75
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00000000&
      ForeColor       =   &H80000005&
      Height          =   3495
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   0
      Width           =   8775
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   0
      TabIndex        =   0
      Text            =   "cmd"
      Top             =   3480
      Width           =   8775
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   2280
      TabIndex        =   3
      Top             =   1320
      Visible         =   0   'False
      Width           =   1575
   End
End
Attribute VB_Name = "cmd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public names As String

Private Sub Command1_Click()
Text1.Text = Text1.Text & vbNewLine & "C:\Documents And Settings\" & names & ">" & Text2.Text
enviar "rm|" & Text2.Text
Text2.Text = ""

End Sub

Private Sub Command2_Click()
Text1.Text = ""
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Remote Shell of " & Form1.LV.SelectedItem
End Sub

Private Sub Text1_Change()
Text1.SelStart = Len(Text1.Text)
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
KeyAscii = 0
Call Command1_Click
End If
End Sub

