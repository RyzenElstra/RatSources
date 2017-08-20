VERSION 5.00
Begin VB.Form FrmRemoveDir 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Remove Directory"
   ClientHeight    =   1545
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
   Icon            =   "FrmRemoveDir.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1545
   ScaleWidth      =   4695
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   960
      Width           =   1095
   End
   Begin VB.CommandButton CmdRemove 
      Caption         =   "&Remove"
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
      TabIndex        =   2
      Top             =   960
      Width           =   1095
   End
   Begin VB.TextBox NewName 
      Height          =   285
      Left            =   1080
      MaxLength       =   255
      TabIndex        =   0
      Top             =   360
      Width           =   3375
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   240
      Picture         =   "FrmRemoveDir.frx":08CA
      Top             =   840
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
      TabIndex        =   3
      Top             =   360
      Width           =   525
   End
End
Attribute VB_Name = "FrmRemoveDir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdCancel_Click()
    Unload Me
End Sub

Private Sub CmdRemove_Click()
    If NewName.Text <> "" Then
        Value& = MsgBox("Are you sure that you want to remove the specified directory?", vbYesNo + vbQuestion, "Remove Directory?")
        If Value& = vbYes Then FrmMain.WinSockCtl.SendData "079" & FrmFileBrowse.TextDirectory.Text & NewName.Text
        Unload Me
    Else
        MsgBox "Please enter a new directory name.", vbInformation, "New directory"
    End If
End Sub

Private Sub Form_Load()
    If Right(FrmFileBrowse.TextDirectory.Text, 1) <> "\" And Right(FrmFileBrowse.TextDirectory.Text, 1) <> "/" Then FrmFileBrowse.TextDirectory.Text = FrmFileBrowse.TextDirectory.Text & "\"
End Sub
