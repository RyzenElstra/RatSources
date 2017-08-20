VERSION 5.00
Object = "{F5E116E1-0563-11D8-AA80-000B6A0D10CB}#1.0#0"; "HookMenu.ocx"
Begin VB.Form clip 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Clipboard"
   ClientHeight    =   3600
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6570
   Icon            =   "clip.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3600
   ScaleWidth      =   6570
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   3495
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6375
      Begin VB.TextBox Text10 
         Height          =   3135
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   240
         Width           =   6135
      End
   End
   Begin HookMenu.XpMenu XpMenu1 
      Left            =   0
      Top             =   0
      _ExtentX        =   900
      _ExtentY        =   900
      BmpCount        =   6
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
      Bmp:1           =   "clip.frx":058A
      Key:1           =   "#verclipboard"
      Bmp:2           =   "clip.frx":09B2
      Key:2           =   "#limpiar"
      Bmp:3           =   "clip.frx":0DDA
      Key:3           =   "#block"
      Bmp:4           =   "clip.frx":1202
      Key:4           =   "#desblock"
      Bmp:5           =   "clip.frx":162A
      Key:5           =   "#ponerclip"
      Bmp:6           =   "clip.frx":1A52
      Key:6           =   "#limpiartext"
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
      Begin VB.Menu verclipboard 
         Caption         =   "Ver Clipboard"
      End
      Begin VB.Menu limpiar 
         Caption         =   "Limpiar Clipboard"
      End
      Begin VB.Menu block 
         Caption         =   "Block Clipboard"
      End
      Begin VB.Menu desblock 
         Caption         =   "Desblock Clipboard"
      End
      Begin VB.Menu ponerclip 
         Caption         =   "Poner Clipboard"
      End
      Begin VB.Menu limpiartext 
         Caption         =   "Limpiar"
      End
   End
End
Attribute VB_Name = "clip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False






Private Sub block_Click()
Dim txtdata As String
txtdata = "lockclip|"
enviar txtdata
End Sub





Private Sub desblock_Click()
Dim txtdata As String
txtdata = "unlockclip|"
enviar txtdata
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Clipboard de " & Form1.LV.SelectedItem
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub

Private Sub limpiar_Click()
Dim txtdata As String
txtdata = "clearclip|"
enviar txtdata
End Sub

Private Sub limpiartext_Click()
Text10.Text = ""
End Sub

Private Sub ponerclip_Click()
Dim txtdata As String
txtdata = "setclip|" & Text10.Text
enviar txtdata
End Sub

Private Sub text10_Mousedown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
Text10.Enabled = False
PopupMenu menu
Text10.Enabled = True
End If
End Sub

Private Sub verclipboard_Click()
Dim txtdata As String
txtdata = "getclip|"
enviar txtdata
End Sub
