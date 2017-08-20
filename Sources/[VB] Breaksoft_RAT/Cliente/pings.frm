VERSION 5.00
Begin VB.Form pings 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "PING"
   ClientHeight    =   5745
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   5730
   Icon            =   "pings.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5745
   ScaleWidth      =   5730
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Height          =   4335
      Left            =   120
      TabIndex        =   7
      Top             =   1320
      Width           =   5535
      Begin VB.TextBox txtSalida 
         BackColor       =   &H00000000&
         ForeColor       =   &H00FFFF00&
         Height          =   3855
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         Top             =   240
         Width           =   5295
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1095
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5535
      Begin VB.CommandButton Command2 
         Caption         =   "Trace"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4320
         TabIndex        =   6
         Top             =   600
         Width           =   975
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Ping"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4320
         TabIndex        =   5
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Text            =   "Paquetes :"
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   3
         Text            =   "Host / IP :"
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1200
         TabIndex        =   2
         Text            =   "4"
         Top             =   600
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   1200
         TabIndex        =   1
         Top             =   240
         Width           =   2775
      End
   End
End
Attribute VB_Name = "pings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim clsPing As getPing


Private Sub Command1_Click()

With clsPing

    .NombreHost = Text1
    .nPaquetes = Text2
    .ping txtSalida
    Frame1.Caption = "IP: " & .IPHost
End With



End Sub


Private Sub Command2_Click()

With clsPing
    .NombreHost = Text1
    .Trace txtSalida
    Frame1.Caption = "IP: " & .IPHost
End With

End Sub

Private Sub Form_Load()
On Error Resume Next

Set clsPing = New getPing
Me.Caption = "Ping to " & Form1.LV.SelectedItem
Text1.Text = Form1.LV.SelectedItem.SubItems(1)
End Sub


Private Sub Form_Unload(Cancel As Integer)

Set clsPing = Nothing
Form1.Show
Unload Me
End Sub





