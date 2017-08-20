VERSION 5.00
Begin VB.Form frmMouse 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Move Server's Mouse"
   ClientHeight    =   3015
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   3525
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   3525
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame frmMouse 
      Caption         =   "Mouse Pad"
      Height          =   2880
      Left            =   45
      TabIndex        =   0
      Top             =   45
      Width           =   3420
   End
End
Attribute VB_Name = "frmMouse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub frmMouse_DragDrop(Source As Control, X As Single, Y As Single)
SD "setcp " & Format(X / frmMouse.Width, ".##") & Format(Y / frmMouse.Height, ".##")
End Sub

Private Sub frmMouse_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
SD "setcp " & Format(X / frmMouse.Width, ".##") & Format(Y / frmMouse.Height, ".##")
End Sub
