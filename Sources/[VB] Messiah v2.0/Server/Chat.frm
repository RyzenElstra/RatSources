VERSION 5.00
Begin VB.Form Chat 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Chat"
   ClientHeight    =   3600
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4680
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3600
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Send"
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   3360
      Width           =   4695
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   2880
      Width           =   4695
   End
   Begin VB.TextBox Text1 
      Height          =   2775
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Chat.frx":0000
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "Chat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
On Error Resume Next
Form1.Winsock1.SendData "cmessage|" & Text2.Text
Text1.Text = Text1.Text & vbCrLf & "I said: " & Text2.Text
Text2.Text = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next
Cancel = 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
Cancel = 1
End Sub
