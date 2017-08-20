VERSION 5.00
Begin VB.Form frmColorMsg 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1575
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7335
   LinkTopic       =   "Form1"
   ScaleHeight     =   1575
   ScaleWidth      =   7335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label Label2 
      BackColor       =   &H00000000&
      Caption         =   "this is how the colors will look on the remote system. click ok to restore original colors."
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   7095
   End
   Begin VB.Shape Shape4 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   3000
      Top             =   1080
      Width           =   1425
   End
   Begin VB.Label lblrestorecolors 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "ok"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   3030
      TabIndex        =   1
      Top             =   1110
      Width           =   1365
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "storm"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7335
   End
End
Attribute VB_Name = "frmColorMsg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestorecolors.backcolor = &H8
End Sub

Private Sub lblrestorecolors_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestorecolors.backcolor = &HFFC0C0
End Sub

Private Sub lblrestorecolors_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestorecolors.backcolor = &H800000
End Sub

Private Sub lblrestorecolors_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
a = SetSysColors(1, 4, frmColor.lbloldmenucolor.backcolor)
a = SetSysColors(1, 15, frmColor.lbloldbuttoncolor.backcolor)
a = SetSysColors(1, 5, frmColor.lbloldwincolor.backcolor)
a = SetSysColors(1, 1, frmColor.lbloldbackground.backcolor)
a = SetSysColors(1, 6, frmColor.lbloldwinframecolor.backcolor)
a = SetSysColors(1, 10, frmColor.lbloldactivebordercolor.backcolor)
a = SetSysColors(1, 11, frmColor.lbloldinactivebordercolor.backcolor)
a = SetSysColors(1, 12, frmColor.lbloldappworkspace.backcolor)
Unload Me
End Sub
