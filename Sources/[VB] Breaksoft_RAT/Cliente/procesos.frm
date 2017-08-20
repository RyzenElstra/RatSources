VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F5E116E1-0563-11D8-AA80-000B6A0D10CB}#1.0#0"; "HookMenu.ocx"
Begin VB.Form procesos 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Process"
   ClientHeight    =   5550
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   4905
   Icon            =   "procesos.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5550
   ScaleWidth      =   4905
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   5415
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4695
      Begin MSComctlLib.ImageList ImageList2 
         Left            =   1920
         Top             =   1560
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   1
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "procesos.frx":058A
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList ImageList1 
         Left            =   960
         Top             =   1440
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   1
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "procesos.frx":0B24
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView ListView1 
         Height          =   5055
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   4455
         _ExtentX        =   7858
         _ExtentY        =   8916
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "ImageList1"
         SmallIcons      =   "ImageList1"
         ColHdrIcons     =   "ImageList2"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   1
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Process"
            Object.Width           =   7233
         EndProperty
      End
   End
   Begin HookMenu.XpMenu XpMenu1 
      Left            =   0
      Top             =   0
      _ExtentX        =   900
      _ExtentY        =   900
      BmpCount        =   2
      CheckBorderColor=   7021576
      SelMenuBorder   =   7021576
      SelMenuBackColor=   14073525
      SelMenuForeColor=   0
      SelCheckBackColor=   14791828
      MenuBorderColor =   6956042
      SeparatorColor  =   -2147483632
      MenuBackColor   =   14609903
      MenuForeColor   =   0
      CheckBackColor  =   15326939
      CheckForeColor  =   16776960
      DisabledMenuBorderColor=   -2147483632
      DisabledMenuBackColor=   15660791
      DisabledMenuForeColor=   -2147483631
      MenuBarBackColor=   15790320
      MenuPopupBackColor=   16777215
      ShortCutNormalColor=   0
      ShortCutSelectColor=   0
      ArrowNormalColor=   16776960
      ArrowSelectColor=   12484864
      ShadowColor     =   0
      Bmp:1           =   "procesos.frx":10BE
      Key:1           =   "#refresh"
      Bmp:2           =   "procesos.frx":14E6
      Key:2           =   "#Kill"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Menu Proc 
      Caption         =   "Proc"
      Visible         =   0   'False
      Begin VB.Menu refresh 
         Caption         =   "Refresh"
      End
      Begin VB.Menu Kill 
         Caption         =   "Kill"
      End
   End
End
Attribute VB_Name = "procesos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Procesos de " & Form1.LV.SelectedItem & " "

End Sub



Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub



Private Sub ListView1_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
ListView1.Sorted = True
End Sub

Private Sub ListView1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
PopupMenu Proc
End If
End Sub
Private Sub kill_click()

enviar "kill|" & ListView1.SelectedItem


End Sub

Private Sub refresh_Click()
ListView1.ListItems.Clear
enviar "procesos|"
End Sub

