VERSION 5.00
Begin VB.Form FrmKeyCtrls 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Control Keys"
   ClientHeight    =   3810
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5310
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmKeyCtrls.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3810
   ScaleWidth      =   5310
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdClose 
      Caption         =   "Cl&ose"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   11
      Top             =   3360
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Key options (Turn off)"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   13
      Top             =   1200
      Width           =   5055
      Begin VB.CommandButton CmdUnPressInstertKey 
         Caption         =   "&Instert Key"
         Height          =   375
         Left            =   3720
         TabIndex        =   7
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdUnPressScrollLock 
         Caption         =   "&Scroll lock"
         Height          =   375
         Left            =   2520
         TabIndex        =   6
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdUnPressNumLock 
         Caption         =   "&Num lock"
         Height          =   375
         Left            =   1320
         TabIndex        =   5
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdUnPressCapsLock 
         Caption         =   "&Caps lock"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Key options (Turn on)"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   12
      Top             =   120
      Width           =   5055
      Begin VB.CommandButton CmdSetCapslock 
         Caption         =   "&Caps lock"
         Height          =   375
         Left            =   120
         TabIndex        =   0
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdSetNumLock 
         Caption         =   "&Num lock"
         Height          =   375
         Left            =   1320
         TabIndex        =   1
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdSetScrollLock 
         Caption         =   "&Scroll lock"
         Height          =   375
         Left            =   2520
         TabIndex        =   2
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdPressInstertKey 
         Caption         =   "&Instert Key"
         Height          =   375
         Left            =   3720
         TabIndex        =   3
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Key options (Press)"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   14
      Top             =   2280
      Width           =   5055
      Begin VB.CommandButton CmdPressShiftKey 
         Caption         =   "S&hift Key"
         Height          =   375
         Left            =   2520
         TabIndex        =   10
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdPressAltKey 
         Caption         =   "&Alt Key"
         Height          =   375
         Left            =   1320
         TabIndex        =   9
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton CmdPressCtrlKey 
         Caption         =   "C&trl Key"
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   1095
      End
      Begin VB.Image Image1 
         Height          =   480
         Left            =   4320
         Picture         =   "FrmKeyCtrls.frx":08CA
         Top             =   240
         Width           =   480
      End
   End
End
Attribute VB_Name = "FrmKeyCtrls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdClose_Click()
    Unload Me
End Sub

Private Sub CmdSetCapslock_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "011"
End Sub

Private Sub CmdSetNumLock_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "012"
End Sub

Private Sub CmdSetScrollLock_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "013"
End Sub

Private Sub CmdPressAltKey_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-5"
End Sub

Private Sub CmdPressShiftKey_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-4"
End Sub

Private Sub CmdPressInstertKey_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-2"
End Sub

Private Sub CmdPressCtrlKey_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-3"
End Sub

Private Sub CmdUnPressCapsLock_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-8"
End Sub

Private Sub CmdUnPressInstertKey_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-9"
End Sub

Private Sub CmdUnPressNumLock_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-7"
End Sub

Private Sub CmdUnPressScrollLock_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "0-6"
End Sub
