VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F5E116E1-0563-11D8-AA80-000B6A0D10CB}#1.0#0"; "HookMenu.ocx"
Begin VB.Form impresora 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Manejar Impresora"
   ClientHeight    =   8190
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   10320
   Icon            =   "impresora.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8190
   ScaleWidth      =   10320
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer5 
      Interval        =   1
      Left            =   4080
      Top             =   2160
   End
   Begin VB.Timer Timer4 
      Interval        =   1
      Left            =   3600
      Top             =   2160
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   7920
      Width           =   10335
      _ExtentX        =   18230
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Timer Timer3 
      Interval        =   1
      Left            =   3120
      Top             =   2160
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   2640
      Top             =   2160
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   2160
      Top             =   2160
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7935
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   10335
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
      Key:1           =   "#menu"
      Bmp:2           =   "impresora.frx":058A
      Key:2           =   "#Imprimir"
      Bmp:3           =   "impresora.frx":09B2
      Key:3           =   "#options"
      Bmp:4           =   "impresora.frx":0DDA
      Key:4           =   "#Tamaño"
      Bmp:5           =   "impresora.frx":1202
      Key:5           =   "#oc"
      Bmp:6           =   "impresora.frx":162A
      Key:6           =   "#do"
      Bmp:7           =   "impresora.frx":1A52
      Key:7           =   "#tr"
      Bmp:8           =   "impresora.frx":1E7A
      Key:8           =   "#se"
      Bmp:9           =   "impresora.frx":22A2
      Key:9           =   "#ta"
      Bmp:10          =   "impresora.frx":26CA
      Key:10          =   "#ci"
      Bmp:11          =   "impresora.frx":2AF2
      Mask:11         =   16777215
      Key:11          =   "#fuente"
      Bmp:12          =   "impresora.frx":2E44
      Key:12          =   "#Negrita"
      Bmp:13          =   "impresora.frx":326C
      Key:13          =   "#Cursiva"
      Bmp:14          =   "impresora.frx":3694
      Key:14          =   "#Subrayado"
      Bmp:15          =   "impresora.frx":3ABC
      Key:15          =   "#cut"
      Bmp:16          =   "impresora.frx":3EE4
      Key:16          =   "#copy"
      Bmp:17          =   "impresora.frx":430C
      Key:17          =   "#paste"
      Bmp:18          =   "impresora.frx":4734
      Key:18          =   "#cleartext"
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
      Caption         =   "Remote Print"
      Visible         =   0   'False
      Begin VB.Menu Imprimir 
         Caption         =   "Imprimir"
         Shortcut        =   ^P
      End
      Begin VB.Menu options 
         Caption         =   "Opciones"
         Begin VB.Menu Tamaño 
            Caption         =   "Tamaño"
            Begin VB.Menu oc 
               Caption         =   "8"
            End
            Begin VB.Menu do 
               Caption         =   "12"
            End
            Begin VB.Menu tr 
               Caption         =   "34"
            End
            Begin VB.Menu se 
               Caption         =   "62"
            End
            Begin VB.Menu ta 
               Caption         =   "80"
            End
            Begin VB.Menu ci 
               Caption         =   "100"
            End
         End
         Begin VB.Menu fuente 
            Caption         =   "Fuente"
            Begin VB.Menu Negrita 
               Caption         =   "Negrita"
            End
            Begin VB.Menu Cursiva 
               Caption         =   "Cursiva"
            End
            Begin VB.Menu Subrayado 
               Caption         =   "Subrayado"
            End
         End
      End
      Begin VB.Menu cut 
         Caption         =   "Cortar"
         Shortcut        =   ^X
      End
      Begin VB.Menu copy 
         Caption         =   "Copiar"
         Shortcut        =   ^C
      End
      Begin VB.Menu paste 
         Caption         =   "Pegar"
         Shortcut        =   ^V
      End
      Begin VB.Menu cleartext 
         Caption         =   "Clear Text"
         Shortcut        =   ^L
      End
   End
End
Attribute VB_Name = "impresora"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub ci_Click()
Text1.FontSize = 100
End Sub

Private Sub cleartext_Click()
Text1.Text = ""
End Sub

Private Sub copy_Click()
Clipboard.SetText Text1.Text
End Sub

Private Sub Cursiva_Click()
Text1.FontItalic = True
End Sub

Private Sub cut_Click()
Clipboard.SetText Text1.Text
Text1.Text = ""
End Sub

Private Sub do_Click()
Text1.FontSize = 12
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Manejando Impresora de " & Form1.LV.SelectedItem


With ProgressBar1
        
        .Max = 5000
        .Min = 0
        .value = 0
    
    End With


End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Me.Hide
End Sub

Private Sub Imprimir_Click()
enviar "impr|" & Text1.Text & "|" & Text1.FontSize

Dim X As Long
For X = ProgressBar1.Min To ProgressBar1.Max

DoEvents
ProgressBar1.value = X
Next X


MsgBox "Texto Imprimido Correctamente", vbInformation, "Info"

ProgressBar1.value = 0

End Sub

Private Sub negrita_Click()
Text1.FontBold = True
End Sub

Private Sub oc_Click()
Text1.FontSize = 8
End Sub


Private Sub paste_Click()
Text1.Text = Text1.Text & " " & Clipboard.GetText
End Sub

Private Sub Text1_Change()
Text1.SelStart = Len(Text1.Text)
End Sub

Private Sub se_Click()
Text1.FontSize = 62
End Sub

Private Sub Subrayado_Click()
Text1.FontUnderline = True
End Sub

Private Sub ta_Click()
Text1.FontSize = 80
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
If Clipboard.GetText = "" Then
paste.Enabled = False
Else
paste.Enabled = True
End If
End Sub

Private Sub Timer4_Timer()
If Text1.Text = "" Then
cleartext.Enabled = False
Else
cleartext.Enabled = True
End If
End Sub

Private Sub Timer5_Timer()
If Text1.Text = "" Then
Imprimir.Enabled = False
Else
Imprimir.Enabled = True
End If
End Sub

Private Sub tr_Click()
Text1.FontSize = 34
End Sub

Private Sub Text1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
Text1.Enabled = False
PopupMenu menu
Text1.Enabled = True
End If
End Sub

