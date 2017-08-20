VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmChatConfig 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Configuracion del Chat"
   ClientHeight    =   3000
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   3030
   Icon            =   "frmChatConfig.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3000
   ScaleWidth      =   3030
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CD 
      Left            =   2400
      Top             =   2640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Iniciar Chat"
      Height          =   255
      Left            =   720
      TabIndex        =   11
      Top             =   2640
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   120
      TabIndex        =   6
      Top             =   1920
      Width           =   2775
      Begin VB.CommandButton cmdTextColor 
         BackColor       =   &H00000000&
         Height          =   255
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   240
         Width           =   255
      End
      Begin VB.CommandButton cmdFondoColor 
         BackColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   240
         Width           =   255
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Color Texto"
         Height          =   195
         Left            =   1440
         TabIndex        =   9
         Top             =   240
         Width           =   810
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Color Fondo"
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.TextBox txtServerNick 
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Top             =   1560
      Width           =   2775
   End
   Begin VB.TextBox txtClientNick 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   960
      Width           =   2775
   End
   Begin VB.TextBox txtWindowTitle 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   2775
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nick Servidor"
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   1320
      Width           =   960
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nick Cliente"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   855
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Titulo de la ventana"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1410
   End
End
Attribute VB_Name = "frmChatConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim FondoColor As String, TextColor As String

Private Sub cmdFondoColor_Click()
CD.ShowColor
FondoColor = CD.Color
cmdFondoColor.BackColor = CD.Color
End Sub

Private Sub cmdStart_Click()
frmChat.Show
End Sub

Private Sub cmdTextColor_Click()
CD.ShowColor
TextColor = CD.Color
cmdTextColor.BackColor = CD.Color
End Sub
