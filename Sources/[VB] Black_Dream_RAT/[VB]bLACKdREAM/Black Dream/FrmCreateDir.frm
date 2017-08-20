VERSION 5.00
Begin VB.Form FrmCreateDir 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Create Directory"
   ClientHeight    =   1740
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4695
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmCreateDir.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1740
   ScaleWidth      =   4695
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdCancel 
      Caption         =   "C&ancel"
      Height          =   375
      Left            =   2160
      TabIndex        =   2
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox NewName 
      Height          =   285
      Left            =   1080
      MaxLength       =   255
      TabIndex        =   1
      Top             =   720
      Width           =   3375
   End
   Begin VB.CommandButton CmdCreate 
      Caption         =   "&Create"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox TextDirectory 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   1080
      Locked          =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   3375
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   240
      Picture         =   "FrmCreateDir.frx":08CA
      Top             =   1080
      Width           =   480
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Name:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   240
      TabIndex        =   5
      Top             =   720
      Width           =   525
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Create in:"
      Height          =   195
      Left            =   240
      TabIndex        =   4
      Top             =   240
      Width           =   720
   End
End
Attribute VB_Name = "FrmCreateDir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdCreate_Click()
    If NewName.Text <> "" Then
        FrmMain.WinSockCtl.SendData "080" & TextDirectory.Text & NewName.Text
        Unload Me
    Else
        MsgBox "Please enter a new directory name.", vbInformation, "New directory"
    End If
End Sub

Private Sub Form_Load()
    TextDirectory.Text = FrmFileBrowse.TextDirectory.Text
    If Right(TextDirectory.Text, 1) <> "\" And Right(TextDirectory.Text, 1) <> "/" Then TextDirectory.Text = TextDirectory.Text & "\"
End Sub

Private Sub CmdCancel_Click()
    Unload Me
End Sub

