VERSION 5.00
Begin VB.Form app 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "App Launcher"
   ClientHeight    =   1035
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7440
   Icon            =   "app.frx":0000
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1035
   ScaleWidth      =   7440
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   855
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7215
      Begin VB.CommandButton Command2 
         Caption         =   "Enviar"
         Height          =   255
         Left            =   6240
         TabIndex        =   4
         Top             =   240
         Width           =   855
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Probar"
         Height          =   255
         Left            =   5280
         TabIndex        =   3
         Top             =   240
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   2400
         TabIndex        =   2
         Text            =   "C:\Windows\notepad.exe"
         Top             =   240
         Width           =   2775
      End
      Begin VB.Label Label1 
         Caption         =   "Ruta de la  aplicación :"
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
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   2055
      End
   End
End
Attribute VB_Name = "app"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
ShellExecLaunchFile Text1.Text, "", ""
End Sub

Private Sub Command2_Click()
enviar "ejcutar|" & Text1.Text

End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub
