VERSION 5.00
Begin VB.Form msns 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MSN Manager"
   ClientHeight    =   4530
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   8625
   Icon            =   "msns.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4530
   ScaleWidth      =   8625
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame4 
      Caption         =   "Status"
      Height          =   1095
      Left            =   3240
      TabIndex        =   22
      Top             =   3120
      Width           =   5175
      Begin VB.TextBox txt 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   120
         TabIndex        =   23
         Top             =   360
         Width           =   4935
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Floodear Victim!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   3120
      TabIndex        =   18
      Top             =   240
      Width           =   5415
      Begin VB.CommandButton Command11 
         Caption         =   "Parar Flood"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   21
         Top             =   1920
         Width           =   5175
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Comenzar a Flooear"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   120
         TabIndex        =   20
         Top             =   1080
         Width           =   5175
      End
      Begin VB.TextBox Text2 
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
         Height          =   615
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         Text            =   "msns.frx":058A
         Top             =   240
         Width           =   5175
      End
   End
   Begin VB.PictureBox Picture2 
      BorderStyle     =   0  'None
      Height          =   375
      Left            =   2520
      Picture         =   "msns.frx":0610
      ScaleHeight     =   375
      ScaleWidth      =   255
      TabIndex        =   2
      Top             =   120
      Width           =   255
   End
   Begin VB.Frame Frame1 
      Caption         =   "Cambiar Status del MSN!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2895
      Begin VB.CommandButton Command8 
         Caption         =   "No Conectado"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         TabIndex        =   17
         Top             =   3840
         Width           =   2055
      End
      Begin VB.PictureBox Picture9 
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         Picture         =   "msns.frx":0B9A
         ScaleHeight     =   255
         ScaleWidth      =   255
         TabIndex        =   16
         Top             =   3840
         Width           =   255
      End
      Begin VB.CommandButton Command7 
         Caption         =   "Fui a Comer"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         TabIndex        =   15
         Top             =   3360
         Width           =   2055
      End
      Begin VB.PictureBox Picture8 
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         Picture         =   "msns.frx":1124
         ScaleHeight     =   255
         ScaleWidth      =   255
         TabIndex        =   14
         Top             =   3360
         Width           =   255
      End
      Begin VB.CommandButton Command6 
         Caption         =   "Al Teléfono"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         TabIndex        =   13
         Top             =   2880
         Width           =   2055
      End
      Begin VB.PictureBox Picture7 
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         Picture         =   "msns.frx":16AE
         ScaleHeight     =   255
         ScaleWidth      =   255
         TabIndex        =   12
         Top             =   2880
         Width           =   255
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Ausente"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         TabIndex        =   11
         Top             =   2400
         Width           =   2055
      End
      Begin VB.PictureBox Picture6 
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         Picture         =   "msns.frx":1C38
         ScaleHeight     =   255
         ScaleWidth      =   255
         TabIndex        =   10
         Top             =   2400
         Width           =   255
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Vuelvo Enseguida"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         TabIndex        =   9
         Top             =   1920
         Width           =   2055
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Offline"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   480
         TabIndex        =   8
         Top             =   1440
         Width           =   2055
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Conectado"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         TabIndex        =   7
         Top             =   960
         Width           =   2055
      End
      Begin VB.CommandButton Command1 
         Caption         =   "No disponible"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         TabIndex        =   6
         Top             =   480
         Width           =   2055
      End
      Begin VB.PictureBox Picture5 
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         Picture         =   "msns.frx":21C2
         ScaleHeight     =   255
         ScaleWidth      =   255
         TabIndex        =   5
         Top             =   960
         Width           =   255
      End
      Begin VB.PictureBox Picture4 
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "msns.frx":274C
         ScaleHeight     =   375
         ScaleWidth      =   255
         TabIndex        =   4
         Top             =   1440
         Width           =   255
      End
      Begin VB.PictureBox Picture3 
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         Picture         =   "msns.frx":2CD6
         ScaleHeight     =   255
         ScaleWidth      =   255
         TabIndex        =   3
         Top             =   1920
         Width           =   255
      End
      Begin VB.PictureBox Picture1 
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         Picture         =   "msns.frx":3260
         ScaleHeight     =   255
         ScaleWidth      =   375
         TabIndex        =   1
         Top             =   480
         Width           =   375
      End
   End
End
Attribute VB_Name = "msns"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
enviar "nodisponible|"
txt.Text = "Estado del MSN Cambio a No disponible"
End Sub

Private Sub Command10_Click()
enviar "flood|"
txt.Text = "Floodeando MSN"
End Sub

Private Sub Command11_Click()
enviar "detenerflood|"
txt.Text = "Flood parado"
End Sub

Private Sub Command2_Click()
enviar "conectado|"
txt.Text = "Estado del MSN Cambio a Conectado"
End Sub

Private Sub Command3_Click()
enviar "offline|"
txt.Text = "Estado del MSN Cambio a Offline"
End Sub

Private Sub Command4_Click()
enviar "vuelvoahora|"
txt.Text = "Estado del MSN Cambio a Vuelvo enseguida"
End Sub

Private Sub Command5_Click()
enviar "ausente|"
txt.Text = "Estado del MSN Cambio a Ocupado"
End Sub

Private Sub Command6_Click()
enviar "altelefono|"
txt.Text = "Estado del MSN Cambio a Al Telefono"
End Sub

Private Sub Command7_Click()
enviar "saliacomer|"
txt.Text = "Estado del MSN Cambio a Fui a Comer"
End Sub

Private Sub Command8_Click()
enviar "noconectado|"
txt.Text = "Estado del MSN Cambio a No conectado"
End Sub


Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Manejando MSN de " & Form1.LV.SelectedItem
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub


