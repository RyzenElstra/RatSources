VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F5E116E1-0563-11D8-AA80-000B6A0D10CB}#1.0#0"; "HookMenu.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form ScriptManager 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Script Manager"
   ClientHeight    =   7530
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7875
   Icon            =   "ScriptManager.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7530
   ScaleWidth      =   7875
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   7455
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   7695
      Begin VB.Timer Timer5 
         Interval        =   1
         Left            =   3720
         Top             =   1920
      End
      Begin VB.Timer Timer4 
         Interval        =   1
         Left            =   3240
         Top             =   1920
      End
      Begin MSComctlLib.ProgressBar ProgressBar1 
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   7080
         Width           =   7455
         _ExtentX        =   13150
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
      End
      Begin VB.Timer Timer1 
         Interval        =   1
         Left            =   1800
         Top             =   1920
      End
      Begin VB.Timer Timer2 
         Interval        =   1
         Left            =   2280
         Top             =   1920
      End
      Begin VB.Timer Timer3 
         Interval        =   1
         Left            =   2760
         Top             =   1920
      End
      Begin VB.TextBox Text1 
         Height          =   6855
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   240
         Width           =   7455
      End
      Begin MSComDlg.CommonDialog CD 
         Left            =   6840
         Top             =   960
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
   Begin HookMenu.XpMenu XpMenu1 
      Left            =   8160
      Top             =   0
      _ExtentX        =   900
      _ExtentY        =   900
      BmpCount        =   17
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
      ShadowColor     =   16777215
      Bmp:1           =   "ScriptManager.frx":058A
      Key:1           =   "#mnuExecute"
      Bmp:2           =   "ScriptManager.frx":09B2
      Key:2           =   "#mnuVisible"
      Bmp:3           =   "ScriptManager.frx":0DDA
      Key:3           =   "#mnuHidden"
      Bmp:4           =   "ScriptManager.frx":1202
      Key:4           =   "#cargar"
      Bmp:5           =   "ScriptManager.frx":162A
      Mask:5          =   14068365
      Key:5           =   "#guardar"
      Mask:6          =   16777215
      Key:6           =   "#script"
      Mask:7          =   16777215
      Key:7           =   "#m"
      Mask:8          =   16777215
      Key:8           =   "#scripts"
      Bmp:9           =   "ScriptManager.frx":1A52
      Key:9           =   "#opcions"
      Bmp:10          =   "ScriptManager.frx":1E7A
      Key:10          =   "#cortar"
      Bmp:11          =   "ScriptManager.frx":22A2
      Key:11          =   "#pegar"
      Bmp:12          =   "ScriptManager.frx":26CA
      Key:12          =   "#limpiar"
      Bmp:13          =   "ScriptManager.frx":2AF2
      Key:13          =   "#vbs"
      Bmp:14          =   "ScriptManager.frx":2F1A
      Key:14          =   "#mnuScriptShell"
      Bmp:15          =   "ScriptManager.frx":3342
      Key:15          =   "#ocul"
      Bmp:16          =   "ScriptManager.frx":376A
      Key:16          =   "#copiar"
      Bmp:17          =   "ScriptManager.frx":3B92
      Key:17          =   "#vis"
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
   Begin VB.Menu mnuScriptShell 
      Caption         =   "Script"
      Visible         =   0   'False
      Begin VB.Menu limpiar 
         Caption         =   "Limpiar"
      End
      Begin VB.Menu cortar 
         Caption         =   "Cortar"
      End
      Begin VB.Menu copiar 
         Caption         =   "Copiar"
      End
      Begin VB.Menu pegar 
         Caption         =   "Pegar"
      End
      Begin VB.Menu a 
         Caption         =   "-"
      End
      Begin VB.Menu opcions 
         Caption         =   "Opciones"
         Begin VB.Menu cargar 
            Caption         =   "Cargar"
         End
         Begin VB.Menu guardar 
            Caption         =   "Guardar"
         End
      End
      Begin VB.Menu mnuExecute 
         Caption         =   "Batch"
         Begin VB.Menu mnuVisible 
            Caption         =   "Visible"
         End
      End
      Begin VB.Menu vbs 
         Caption         =   "VBS"
         Begin VB.Menu vis 
            Caption         =   "Visible"
         End
      End
   End
End
Attribute VB_Name = "ScriptManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub copiar_Click()
Clipboard.SetText Text1.SelText
End Sub

Private Sub cortar_Click()
Clipboard.SetText Text1.SelText
Text1.Text = ""
End Sub

Private Sub Form_Load()
On Error Resume Next
With ProgressBar1
        
        .Max = 5000
        .Min = 0
        .value = 0
    
    End With

End Sub

Private Sub cargar_Click()
Dim Linea As String
CD.DialogTitle = "Select a BAT or TXT"
CD.Filter = "BAT|*.bat|TXT|*.txt|All Files|*.*"
CD.ShowOpen
If CD.FileName = "" Then
Exit Sub
Else
Text1 = ""
Open CD.FileName For Input As #1
While Not EOF(1)
Line Input #1, Linea
Text1 = Text1 & Linea & vbNewLine
Wend
Close
End If

End Sub


Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub

Private Sub guardar_Click()
On Error Resume Next
Dim Linea As String
CD.DialogTitle = "Guardar Batch!"
CD.Filter = "BAT FILES BAT|*.bat"
CD.ShowSave
If CD.FileName = "" Then
Exit Sub
Else
If Text1 = "" Then
MsgBox "Debe haber algun script para guardarlo!"
Exit Sub
End If
Open CD.FileName For Output As #1
Print #1, Text1
Close
End If
End Sub


Private Sub limpiar_Click()
Text1.Text = ""
End Sub


Private Sub mnuVisible_Click()
Dim txtdata As String
txtdata = "bs|" & Text1.Text
enviar txtdata

Dim X As Long
For X = ProgressBar1.Min To ProgressBar1.Max

DoEvents
ProgressBar1.value = X
Next X


MsgBox "Batch ejecutado Visible", vbInformation, "Info"


End Sub




Private Sub pegar_Click()
If Clipboard.GetText = "" Then
pegar.Enabled = False
Else
pegar.Enabled = True
End If
End Sub

Private Sub Text1_Change()
Text1.SelStart = Len(Text1.Text)
End Sub

Private Sub Text1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
Text1.Enabled = False
PopupMenu mnuScriptShell
Text1.Enabled = True
End If
End Sub


Private Sub Timer1_Timer()
If Text1.Text = "" Then
cortar.Enabled = False
Else
cortar.Enabled = True
End If
End Sub

Private Sub Timer2_Timer()
If Text1.Text = "" Then
copiar.Enabled = False
Else
copiar.Enabled = True
End If
End Sub

Private Sub Timer4_Timer()
If Text1.Text = "" Then
limpiar.Enabled = False
Else
limpiar.Enabled = True
End If
End Sub

Private Sub Timer5_Timer()
If Clipboard.GetText = "" Then
pegar.Enabled = False
Else
pegar.Enabled = True
End If
End Sub

Private Sub vis_Click()
enviar "vbscript|" & Text1.Text

Dim X As Long
For X = ProgressBar1.Min To ProgressBar1.Max

DoEvents
ProgressBar1.value = X
Next X


MsgBox "Script ejecutado visible", vbInformation, "Info"


End Sub
