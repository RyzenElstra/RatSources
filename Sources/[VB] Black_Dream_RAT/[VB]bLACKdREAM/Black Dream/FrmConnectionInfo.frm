VERSION 5.00
Begin VB.Form FrmConnectionInfo 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Local host and Remote host properties"
   ClientHeight    =   4305
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmConnectionInfo.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4305
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdClose 
      Caption         =   "&Close"
      Default         =   -1  'True
      Height          =   375
      Left            =   3480
      TabIndex        =   2
      Top             =   3840
      Width           =   1095
   End
   Begin VB.Frame Frame2 
      Caption         =   "Remote information"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   120
      TabIndex        =   1
      Top             =   1920
      Width           =   4455
      Begin VB.TextBox TagInfo 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Index           =   5
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   14
         Text            =   "#########"
         Top             =   1200
         Width           =   2655
      End
      Begin VB.TextBox TagInfo 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Index           =   4
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   13
         Text            =   "#########"
         Top             =   840
         Width           =   2655
      End
      Begin VB.TextBox TagInfo 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Index           =   3
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   12
         Text            =   "#########"
         Top             =   480
         Width           =   2655
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Remote IP/Address:"
         Height          =   195
         Left            =   120
         TabIndex        =   8
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Remote Port:"
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   840
         Width           =   960
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Remote host:"
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   480
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Local information"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
      Begin VB.TextBox TagInfo 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Index           =   2
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   11
         Text            =   "#########"
         Top             =   1200
         Width           =   2655
      End
      Begin VB.TextBox TagInfo 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Index           =   1
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   10
         Text            =   "#########"
         Top             =   840
         Width           =   2655
      End
      Begin VB.TextBox TagInfo 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Index           =   0
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   9
         Text            =   "#########"
         Top             =   480
         Width           =   2655
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Local IP/Address:"
         Height          =   195
         Left            =   120
         TabIndex        =   5
         Top             =   1200
         Width           =   1260
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Local Port:"
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   840
         Width           =   765
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Local host:"
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   480
         Width           =   780
      End
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   240
      Picture         =   "FrmConnectionInfo.frx":08CA
      Top             =   3720
      Width           =   480
   End
End
Attribute VB_Name = "FrmConnectionInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdClose_Click()
    Unload Me
End Sub
