VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmOfflineLogs 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Offline Logs"
   ClientHeight    =   3090
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4695
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete Log"
      Height          =   255
      Left            =   3120
      TabIndex        =   2
      Top             =   2760
      Width           =   1455
   End
   Begin VB.CommandButton cmdDowloadAll 
      Caption         =   "Download All"
      Height          =   255
      Left            =   1560
      TabIndex        =   3
      Top             =   2760
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog cd 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdDownload 
      Caption         =   "Download"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   2760
      Width           =   1455
   End
   Begin VB.ListBox lstLogs 
      Height          =   2595
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmOfflineLogs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdDelete_Click()
If lstLogs.ListIndex < 0 Then Beep: Exit Sub

Send "file;delete;\:OldLogs:\" & lstLogs.Text
lstLogs.RemoveItem lstLogs.ListIndex
End Sub

Private Sub cmdDowloadAll_Click()
Dim Directory As String

Directory = BasMain.BrowseForFolder("Save Log", , , frmOfflineLogs, True)



    For i = 0 To lstLogs.ListCount - 1
        lstLogs.ListIndex = i
        Send "transfer;request;" & "\:OldLogs:\" & lstLogs.Text & "|" & Directory & "\" & lstLogs.Text & ".txt"
    Next i
End Sub

Private Sub cmdDownload_Click()
On Error GoTo ErrorHandler
If lstLogs.ListIndex < 0 Then Beep: Exit Sub

CD.DialogTitle = "Save Log"
CD.ShowSave
Destination = CD.FileName

Send "transfer;request;" & "\:OldLogs:\" & lstLogs.Text & "|" & Destination

Exit Sub
ErrorHandler:
Beep
End Sub
