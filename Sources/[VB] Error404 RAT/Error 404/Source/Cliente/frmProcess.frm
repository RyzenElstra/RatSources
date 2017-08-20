VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmProcess 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Process"
   ClientHeight    =   5415
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   4695
   Icon            =   "frmProcess.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5415
   ScaleWidth      =   4695
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrGeneral 
      Interval        =   1
      Left            =   4200
      Top             =   4920
   End
   Begin VB.TextBox txtInterval 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      ForeColor       =   &H80000011&
      Height          =   285
      Left            =   3480
      TabIndex        =   6
      Text            =   "2000"
      Top             =   4440
      Width           =   495
   End
   Begin VB.Timer tmrAuto 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   4200
      Top             =   4440
   End
   Begin ComctlLib.ListView LV 
      Height          =   4215
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   7435
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Nombre del Proceso"
         Object.Width           =   7800
      EndProperty
   End
   Begin VB.CheckBox chkAuto 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Auto-Refrescar"
      Enabled         =   0   'False
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   4440
      Width           =   1335
   End
   Begin VB.Frame fraProcess 
      BackColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   480
      TabIndex        =   0
      Top             =   4680
      Width           =   3735
      Begin VB.CommandButton cmdKill 
         Caption         =   "Matar Proceso"
         Height          =   255
         Left            =   2040
         TabIndex        =   3
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "Refrescar"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.Label lblProcess 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Intervalo:"
      Height          =   195
      Left            =   2640
      TabIndex        =   5
      Top             =   4440
      Width           =   660
   End
   Begin VB.Menu mnu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu mnuRefresh 
         Caption         =   "Refrescar"
      End
      Begin VB.Menu mnuKill 
         Caption         =   "Matar Proceso"
      End
   End
End
Attribute VB_Name = "frmProcess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkAuto_Click()
Dim Auto As Byte
    If chkAuto.value = 0 Then
        chkAuto.value = 1
        tmrAuto.Enabled = True
      Exit Sub
    ElseIf chkAuto.value = 1 Then
        chkAuto.value = 0
        tmrAuto.Enabled = False
      Exit Sub
    End If
End Sub

Private Sub cmdKill_Click()
Send "KillProcess|" & LV.SelectedItem
End Sub

Private Sub cmdRefresh_Click()
LV.ListItems.Clear
Send "Process"
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Error 404 - Procesos [" & Form1.LV.SelectedItem & "]"
End Sub

Private Sub LV_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
PopupMenu mnu
End If
End Sub

Private Sub mnuKill_Click()
Send "KillProcess|" & LV.SelectedItem
End Sub

Private Sub mnuRefresh_Click()
LV.ListItems.Clear
Send "Process"
End Sub

Private Sub tmrAuto_Timer()
Send "Process"
End Sub

Private Sub tmrGeneral_Timer()
    If LV.ListItems.Count = 0 Then
        mnuKill.Enabled = False
        cmdKill.Enabled = False
    Else
        mnuKill.Enabled = True
        cmdKill.Enabled = True
    End If
End Sub
