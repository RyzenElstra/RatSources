VERSION 5.00
Begin VB.Form frmDrives 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1965
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3015
   LinkTopic       =   "Form1"
   ScaleHeight     =   1965
   ScaleWidth      =   3015
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
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
      Height          =   930
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   2775
   End
   Begin VB.Label lblchange 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "change to..."
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
      Left            =   1710
      TabIndex        =   3
      Top             =   1470
      Width           =   1130
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   1680
      Top             =   1440
      Width           =   1185
   End
   Begin VB.Label lblclose 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "close"
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
      Left            =   145
      TabIndex        =   2
      Top             =   1470
      Width           =   1005
   End
   Begin VB.Shape Shape11 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   120
      Top             =   1440
      Width           =   1065
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "drives"
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
      Width           =   3015
   End
End
Attribute VB_Name = "frmDrives"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &H8
lblchange.BackColor = &H8
End Sub

Private Sub lblchange_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmFile.txtpath.Text = List1.Text
frmMain.WS.SendData "Files;" & frmFile.txtpath.Text
frmMain.Status.Caption = "changing drive..."
Unload Me
End If
End Sub

Private Sub lblClose_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &HFFC0C0
End Sub

Private Sub lblClose_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &H800000
End Sub

Private Sub lblChange_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblchange.BackColor = &HFFC0C0
End Sub

Private Sub lblChange_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblchange.BackColor = &H800000
End Sub

Private Sub lblclose_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Unload Me
End Sub

Private Sub List1_DblClick()
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmFile.txtpath.Text = List1.Text
frmMain.WS.SendData "Files;" & frmFile.txtpath.Text
frmMain.Status.Caption = "changing drive..."
Unload Me
End If
End Sub

Private Sub title_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    FirstX = X
    FirstY = Y
End If
End Sub

Private Sub title_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    Me.Left = Me.Left + (X - FirstX)
    Me.Top = Me.Top + (Y - FirstY)
End If
End Sub
