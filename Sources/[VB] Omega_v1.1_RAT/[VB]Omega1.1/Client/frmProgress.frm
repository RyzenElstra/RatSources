VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmProgress 
   ClientHeight    =   1305
   ClientLeft      =   2355
   ClientTop       =   1950
   ClientWidth     =   5070
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmProgress.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   900.734
   ScaleMode       =   0  'User
   ScaleWidth      =   4760.992
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   345
      Left            =   3840
      TabIndex        =   3
      ToolTipText     =   "Cancel"
      Top             =   840
      Width           =   1065
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   285
      Left            =   180
      TabIndex        =   0
      Top             =   360
      Width           =   4365
      _ExtentX        =   7699
      _ExtentY        =   503
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   0
      Scrolling       =   1
   End
   Begin VB.Label lblSpeed 
      AutoSize        =   -1  'True
      Caption         =   "Speed: 0 / KBps"
      Height          =   195
      Left            =   1680
      TabIndex        =   5
      Top             =   900
      Width           =   1140
   End
   Begin VB.Label lblBytes 
      AutoSize        =   -1  'True
      Caption         =   "0KB of 0KB"
      Height          =   195
      Left            =   180
      TabIndex        =   4
      Top             =   900
      Width           =   780
   End
   Begin VB.Label lblStatus 
      AutoSize        =   -1  'True
      Caption         =   "Status"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   90
      Width           =   465
   End
   Begin VB.Label lblPercent 
      AutoSize        =   -1  'True
      Caption         =   "0%"
      Height          =   195
      Left            =   4620
      TabIndex        =   1
      Top             =   390
      Width           =   255
   End
End
Attribute VB_Name = "frmProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private FileName As String
Private frmName As Byte

Public Sub setFilePath(File As String)
  FileName = File
End Sub

Public Sub Reset()
ProgressBar1.Value = 0
lblPercent.Caption = "0%"
End Sub

Public Sub setfrmName(Name As Byte)
frmName = Name
End Sub

Private Sub setForm(Enabled As Boolean)
Select Case frmName
    Case 0
         frmMain.Enabled = Enabled
    Case 1
         frmFileGM.Enabled = Enabled
End Select
frmMain.Enabled = Enabled
End Sub

Private Sub cmdCancel_Click()
   Unload Me
   If Me.Caption = "Upload File" Then
      If FileExists(FileName) Then
         Kill FileName
         DoEvents
      End If
      Call frmMain.CancelUpload
      Call frmMain.sendText("UPCANCEL")
      DoEvents
   Else
      Call frmMain.CancelDownload
      Call frmMain.sendText("DLCANCEL")
      DoEvents
   End If
   Call setForm(True)
   DoEvents
End Sub

Private Sub Form_Load()
Dim MyMenu As Long

MyMenu = GetSystemMenu(Me.hwnd, 0) 'disable X button
Call RemoveMenu(MyMenu, &HF060, 0)

Call StayOnTop(Me)
Call setForm(False)
DoEvents
End Sub

Private Sub Form_Unload(Cancel As Integer)
Call setForm(True)
DoEvents
End Sub
