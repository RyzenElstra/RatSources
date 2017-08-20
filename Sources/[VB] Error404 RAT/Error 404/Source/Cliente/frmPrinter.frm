VERSION 5.00
Begin VB.Form frmPrinter 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Impresora"
   ClientHeight    =   7215
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   9615
   Icon            =   "frmPrinter.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7215
   ScaleWidth      =   9615
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdFontConfig 
      Caption         =   "Config"
      Height          =   375
      Left            =   8880
      TabIndex        =   17
      Top             =   0
      Width           =   735
   End
   Begin VB.Frame fraPrinter 
      BorderStyle     =   0  'None
      Height          =   375
      Index           =   3
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   2535
      Begin VB.TextBox txtFont 
         Height          =   285
         Left            =   720
         Locked          =   -1  'True
         TabIndex        =   16
         Text            =   "MS Sans Serif"
         Top             =   85
         Width           =   1575
      End
      Begin VB.Label lblPrinter 
         AutoSize        =   -1  'True
         Caption         =   "Fuente:"
         Height          =   195
         Index           =   3
         Left            =   120
         TabIndex        =   15
         Top             =   120
         Width           =   540
      End
   End
   Begin VB.Frame fraPrinter 
      BorderStyle     =   0  'None
      Height          =   375
      Index           =   0
      Left            =   6720
      TabIndex        =   11
      Top             =   0
      Width           =   2055
      Begin VB.ComboBox cmbFontSize 
         Height          =   315
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   13
         Text            =   "10"
         Top             =   85
         Width           =   615
      End
      Begin VB.Label lblPrinter 
         AutoSize        =   -1  'True
         Caption         =   "Tamaño de Fuente:"
         Height          =   195
         Index           =   2
         Left            =   0
         TabIndex        =   12
         Top             =   120
         Width           =   1395
      End
   End
   Begin VB.Frame fraPrinter 
      BorderStyle     =   0  'None
      Height          =   375
      Index           =   1
      Left            =   5040
      TabIndex        =   8
      Top             =   0
      Width           =   1575
      Begin VB.CommandButton cmdFontColor 
         BackColor       =   &H00000000&
         Height          =   255
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   120
         Width           =   255
      End
      Begin VB.Label lblPrinter 
         AutoSize        =   -1  'True
         Caption         =   "Color de Fuente:"
         Height          =   195
         Index           =   0
         Left            =   0
         TabIndex        =   9
         Top             =   120
         Width           =   1170
      End
   End
   Begin VB.Frame fraPrinter 
      BorderStyle     =   0  'None
      Height          =   375
      Index           =   2
      Left            =   2640
      TabIndex        =   2
      Top             =   0
      Width           =   2295
      Begin VB.CheckBox chkItalic 
         Height          =   255
         Left            =   1440
         Picture         =   "frmPrinter.frx":48FA
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   120
         Width           =   255
      End
      Begin VB.CheckBox chkUnderline 
         Height          =   255
         Left            =   1680
         Picture         =   "frmPrinter.frx":4E84
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   120
         Width           =   255
      End
      Begin VB.CheckBox chkStrikethru 
         Height          =   255
         Left            =   1920
         Picture         =   "frmPrinter.frx":540E
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   120
         Width           =   255
      End
      Begin VB.CheckBox chkBold 
         Height          =   255
         Left            =   1200
         Picture         =   "frmPrinter.frx":5998
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   120
         Width           =   255
      End
      Begin VB.Label lblPrinter 
         AutoSize        =   -1  'True
         Caption         =   "Estilo de Fuente:"
         Height          =   195
         Index           =   1
         Left            =   0
         TabIndex        =   3
         Top             =   120
         Width           =   1185
      End
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Imprimir Texto"
      Height          =   255
      Left            =   4920
      TabIndex        =   1
      Top             =   6840
      Width           =   2055
   End
   Begin VB.CommandButton cmdSearchPrinter 
      Caption         =   "Buscar Impresora"
      Height          =   255
      Left            =   2640
      TabIndex        =   20
      Top             =   6840
      Width           =   2055
   End
   Begin VB.ComboBox cmbPrinter 
      Height          =   315
      Left            =   1920
      Locked          =   -1  'True
      TabIndex        =   19
      Text            =   "Ninguno"
      Top             =   6480
      Width           =   7575
   End
   Begin VB.TextBox txtLog 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5895
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   480
      Width           =   9615
   End
   Begin VB.Label lblPrinter 
      AutoSize        =   -1  'True
      Caption         =   "Dispositivo de Impresora:"
      Height          =   195
      Index           =   4
      Left            =   0
      TabIndex        =   18
      Top             =   6520
      Width           =   1770
   End
End
Attribute VB_Name = "frmPrinter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkBold_Click()
If chkBold.value = 1 Then txtLog.FontBold = True Else txtLog.FontBold = False
End Sub

Private Sub chkItalic_Click()
If chkItalic.value = 1 Then txtLog.FontItalic = True Else txtLog.FontItalic = False
End Sub

Private Sub chkStrikethru_Click()
If chkStrikethru.value = 1 Then txtLog.FontStrikethru = True Else txtLog.FontStrikethru = False
End Sub

Private Sub chkUnderline_Click()
If chkUnderline.value = 1 Then txtLog.FontUnderline = True Else txtLog.FontUnderline = False
End Sub

Private Sub cmdFontColor_Click()
CD.ShowColor
cmdFontColor.BackColor = CD.Color
txtLog.ForeColor = CD.Color
End Sub

Private Sub cmdFontConfig_Click()
CD.ShowFont
txtFont.Text = CD.FontName
  txtLog.Font = CD.FontName
    If CD.FontBold = True Then
        chkBold.value = 1
          txtLog.FontBold = True
    Else: chkBold.value = 0
    End If
    If CD.FontItalic = True Then
        chkItalic.value = 1
          txtLog.FontItalic = True
    Else: chkItalic.value = 0
    End If
    If CD.FontUnderline = True Then
        chkUnderline.value = 1
          txtLog.FontUnderline = True
    Else: chkUnderline.value = 0
    End If
    If CD.FontStrikethru = True Then
        chkStrikethru.value = 1
          txtLog.FontStrikethru = True
    Else: chkStrikethru.value = 0
    End If
cmbFontSize.Text = CD.FontSize
  txtLog.FontSize = CD.FontSize
End Sub

Private Sub cmdPrint_Click()
If cmbPrinter.Text = "Ninguno" Then MsgBox "No se ha seleccionado ninguna impresora." & vbCrLf & "¿Desea intentar imprimir el texto igualmente?", vbOKCancel, "Error 404"
Send "Print|" & txtLog.Text
MsgBox "Texto enviado para imprimir", vbInformation, "Error 404"
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Error 404 - Impresora [" & frmMain.LV.SelectedItem & "]"
End Sub
