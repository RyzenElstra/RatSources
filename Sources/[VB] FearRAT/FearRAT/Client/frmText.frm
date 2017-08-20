VERSION 5.00
Begin VB.Form frmText 
   Caption         =   "Text Viewer"
   ClientHeight    =   4335
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   5865
   LinkTopic       =   "Form1"
   ScaleHeight     =   4335
   ScaleWidth      =   5865
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtText 
      Height          =   4335
      Left            =   -15
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   0
      Width           =   5895
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuSave 
         Caption         =   "&Save"
      End
   End
End
Attribute VB_Name = "frmText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Resize()
On Error Resume Next
txtText.Left = 0
txtText.Top = 0
txtText.Width = frmText.Width - 110
txtText.Height = frmText.Height - 400
End Sub

Private Sub mnuSave_Click()
Dim DR
DR = frmText.Caption
DR = InputBox("Enter filename to save to", "Save Text", DR)
If frmText.Caption <> "Batch Commands" Then
    SD "savetxtfile " & DR & "*" & txtText.Text
Else
    SD "savetxtfile " & DR & "*" & txtText.Text
End If
End Sub
