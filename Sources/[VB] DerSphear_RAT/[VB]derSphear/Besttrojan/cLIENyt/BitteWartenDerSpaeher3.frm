VERSION 5.00
Begin VB.Form BitteWarten 
   BackColor       =   &H00808000&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1395
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   6225
   ControlBox      =   0   'False
   FillColor       =   &H00808000&
   ForeColor       =   &H00808000&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1395
   ScaleWidth      =   6225
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   0
      Top             =   0
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "please wait..."
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0C000&
      Height          =   600
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   5865
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "BitteWarten"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Timer1_Timer()
Unload BitteWarten
Load DerSpaeher
DerSpaeher.Show
End Sub
