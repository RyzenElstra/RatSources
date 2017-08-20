VERSION 5.00
Begin VB.Form Chat 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Chat"
   ClientHeight    =   7680
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   9195
   FillColor       =   &H00C0C0C0&
   ForeColor       =   &H00C0C0C0&
   Icon            =   "chatme.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7680
   ScaleWidth      =   9195
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   360
      Top             =   1440
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H00000000&
      Height          =   3495
      Left            =   240
      MaxLength       =   1500
      MultiLine       =   -1  'True
      TabIndex        =   1
      ToolTipText     =   "Der Text wird jede 5sec aktualisiert"
      Top             =   240
      Width           =   8895
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Height          =   3495
      Left            =   240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   4080
      Width           =   8895
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "The other Site:"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   3840
      Width           =   1050
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "You:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   0
      Width           =   330
   End
End
Attribute VB_Name = "Chat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const FLOAT = 1, SINK = 0
Private Sub Form_Load()
Fo.TCP2.SendData "Chat"
Timer1.Enabled = True
Dim f As Integer
f = Me.hwnd
Call FloatWindow(f, FLOAT)
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
Fo.TCP2.SendData "LocalChatClose"
Timer1.Enabled = False
Exit Sub
f:
End Sub



Private Sub Timer1_Timer()
Fo.TCP2.SendData Text1.Text
End Sub
