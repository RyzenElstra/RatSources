VERSION 5.00
Begin VB.Form Form3 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Typed URLs"
   ClientHeight    =   3480
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5190
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3480
   ScaleWidth      =   5190
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Save list"
      Height          =   375
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   3120
      Width           =   5295
   End
   Begin VB.TextBox Text1 
      Height          =   3135
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   5175
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
On Error Resume Next
Dim X As String
X = InputBox("Path to save to:", "path", App.Path & "\Typed URL Log.txt")
Open X For Append As #1
Print #1, "Typed URL History from " & Form1.Text1.Text
Print #1, Text1.Text
Close #1
MsgBox "Saved.", vbInformation, "Saved"
End Sub
