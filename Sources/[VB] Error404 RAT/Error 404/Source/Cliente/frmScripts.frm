VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmScripts 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Script Manager"
   ClientHeight    =   5895
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7455
   Icon            =   "frmScripts.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5895
   ScaleWidth      =   7455
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CD 
      Left            =   6600
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Enviar"
      Height          =   375
      Left            =   4200
      TabIndex        =   8
      Top             =   5280
      Width           =   1455
   End
   Begin VB.CommandButton cmdTest 
      Caption         =   "Probar"
      Height          =   375
      Left            =   2520
      TabIndex        =   7
      Top             =   5280
      Width           =   1455
   End
   Begin VB.Frame fraScripts 
      BackColor       =   &H00FFFFFF&
      Height          =   735
      Index           =   1
      Left            =   5880
      TabIndex        =   4
      Top             =   5040
      Width           =   1455
      Begin VB.CommandButton cmdSave 
         Caption         =   "Guardar"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   400
         Width           =   1215
      End
      Begin VB.CommandButton cmdLoad 
         Caption         =   "Cargar"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   120
         Width           =   1215
      End
   End
   Begin VB.Frame fraScripts 
      BackColor       =   &H00FFFFFF&
      Height          =   735
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   5040
      Width           =   2195
      Begin VB.OptionButton optVisual 
         BackColor       =   &H00FFFFFF&
         Caption         =   "VisualBasicScript (*.vbs)"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   400
         Width           =   2055
      End
      Begin VB.OptionButton optBatch 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Batch (*.bat)"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   160
         Value           =   -1  'True
         Width           =   1215
      End
   End
   Begin VB.TextBox txtLog 
      Height          =   4935
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   120
      Width           =   7215
   End
End
Attribute VB_Name = "frmScripts"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdLoad_Click()
Dim Line As String
CD.DialogTitle = "Selecciona un Script"
CD.Filter = "Texto|*.txt|Batch|*.bat|VisualBasicScript|*.vbs"
CD.ShowOpen
If CD.FileName = "" Then
Exit Sub
Else
txtLog.Text = ""
Open CD.FileName For Input As #1
While Not EOF(1)
Line Input #1, Line
txtLog.Text = txtLog.Text & Line & vbCrLf
Wend
Close
End If
End Sub

Private Sub cmdSave_Click()
On Error Resume Next
CD.DialogTitle = "Guardar Script"
CD.Filter = "Texto|*.txt|Batch|*.bat|VisualBasicScript|*.vbs"
CD.ShowSave
If CD.FileName = "" Then
Exit Sub
Else
If txtLog.Text = "" Then
MsgBox "No hay ningun script para guardar", vbExclamation, "Error 404"
Exit Sub
End If
Open CD.FileName For Output As #1
Print #1, txtLog.Text
Close
End If
End Sub

Private Sub cmdSend_Click()
If optBatch.value = True Then Send "ScriptBAT|" & txtLog.Text Else Send "ScriptVBS|" & txtLog.Text
End Sub

Private Sub cmdTest_Click()
    If optBatch.value = True Then
        Open "C:\temp.bat" For Output As #1
        Print #1, , txtLog.Text
        Close #1
        ShellExecLaunchFile "C:\temp.bat", "", ""
    Else
        Open "C:\temp.vbs" For Output As #1
        Print #1, , txtLog.Text
        Close #1
        ShellExecLaunchFile "C:\temp.vbs", "", ""
    End If
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Error 404 - Scripts [" & frmMain.LV.SelectedItem & "]"
End Sub

