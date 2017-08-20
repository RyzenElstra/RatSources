VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form msg 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Enviar Mensajes"
   ClientHeight    =   3330
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   8250
   Icon            =   "msg.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3330
   ScaleWidth      =   8250
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer3 
      Interval        =   1
      Left            =   3240
      Top             =   3600
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   4320
      Top             =   4440
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   4440
      Top             =   3720
   End
   Begin VB.TextBox Text5 
      Height          =   495
      Left            =   2400
      TabIndex        =   14
      Top             =   4560
      Width           =   735
   End
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   1320
      TabIndex        =   13
      Top             =   4560
      Width           =   735
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   240
      TabIndex        =   12
      Top             =   4560
      Width           =   855
   End
   Begin VB.TextBox envio 
      Height          =   1845
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   960
      Width           =   4095
   End
   Begin VB.TextBox title 
      Height          =   285
      Left            =   240
      TabIndex        =   2
      Text            =   "Titulo del Mensaje"
      Top             =   480
      Width           =   4095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Enviar"
      Height          =   375
      Left            =   4560
      TabIndex        =   1
      Top             =   2400
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Probar"
      Height          =   375
      Left            =   6480
      TabIndex        =   0
      Top             =   2400
      Width           =   1575
   End
   Begin VB.Frame Frame3 
      Caption         =   "Enviar Mensajes"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   8055
      Begin MSComctlLib.ProgressBar ProgressBar1 
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   2760
         Width           =   7815
         _ExtentX        =   13785
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
         Min             =   1e-4
      End
      Begin VB.Frame Frame1 
         Height          =   1815
         Left            =   6360
         TabIndex        =   15
         Top             =   360
         Width           =   1575
         Begin VB.PictureBox Picture4 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   720
            Picture         =   "msg.frx":058A
            ScaleHeight     =   615
            ScaleWidth      =   615
            TabIndex        =   19
            Top             =   960
            Width           =   615
         End
         Begin VB.PictureBox Picture3 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   120
            Picture         =   "msg.frx":396D
            ScaleHeight     =   615
            ScaleWidth      =   615
            TabIndex        =   18
            Top             =   960
            Width           =   615
         End
         Begin VB.PictureBox Picture2 
            BorderStyle     =   0  'None
            Height          =   495
            Left            =   720
            Picture         =   "msg.frx":6C44
            ScaleHeight     =   495
            ScaleWidth      =   615
            TabIndex        =   17
            Top             =   120
            Width           =   615
         End
         Begin VB.PictureBox Picture1 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   120
            Picture         =   "msg.frx":9DC8
            ScaleHeight     =   615
            ScaleWidth      =   615
            TabIndex        =   16
            Top             =   120
            Width           =   615
         End
      End
      Begin VB.Frame Frame14 
         Caption         =   "Botones"
         Height          =   1815
         Left            =   4440
         TabIndex        =   6
         Top             =   360
         Width           =   1815
         Begin VB.OptionButton Option1 
            Caption         =   "Error"
            Height          =   255
            Left            =   120
            TabIndex        =   11
            Top             =   360
            Value           =   -1  'True
            Width           =   1095
         End
         Begin VB.OptionButton Option2 
            Caption         =   "Exclamación"
            Height          =   255
            Left            =   120
            TabIndex        =   10
            Top             =   600
            Width           =   1575
         End
         Begin VB.OptionButton Option3 
            Caption         =   "Información"
            Height          =   255
            Left            =   120
            TabIndex        =   9
            Top             =   840
            Width           =   1575
         End
         Begin VB.OptionButton Option4 
            Caption         =   "Pregunta?"
            Height          =   255
            Left            =   120
            TabIndex        =   8
            Top             =   1080
            Width           =   1455
         End
         Begin VB.OptionButton Option5 
            Caption         =   "None"
            Height          =   255
            Left            =   120
            TabIndex        =   7
            Top             =   1320
            Width           =   1455
         End
      End
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   7920
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   4320
      Width           =   150
   End
End
Attribute VB_Name = "msg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()

    
    
    If Text5.Text = "critical" Then MsgBox Text4.Text, vbCritical, Text3.Text
    If Text5.Text = "excla" Then MsgBox Text4.Text, vbExclamation, Text3.Text
    If Text5.Text = "info" Then MsgBox Text4.Text, vbInformation, Text3.Text
    If Text5.Text = "question" Then MsgBox Text4.Text, vbQuestion, Text3.Text
    If Text5.Text = "none" Then MsgBox Text4.Text, vbApplicationModal, Text3.Text
    
    
End Sub

Private Sub Command2_Click()
Dim txtdata As String
txtdata = "mmtitle|" & title.Text
enviar txtdata

Dim X As Long
For X = ProgressBar1.Min To ProgressBar1.Max

DoEvents
ProgressBar1.value = X
Next X


MsgBox "Mensaje Enviado", vbInformation, "Info"

ProgressBar1.value = 1

End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Enviar Mensajes a " & Form1.LV.SelectedItem
Option2.value = False
Option3.value = False
Option4.value = False
Option5.value = False

With ProgressBar1
        
        .Max = 5000
        .Min = 0
        .value = 0
    
    End With


End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub

Private Sub Timer1_Timer()
 If Option1.value = True Then Text5.Text = "critical"
    If Option2.value = True Then Text5.Text = "excla"
    If Option3.value = True Then Text5.Text = "info"
    If Option4.value = True Then Text5.Text = "question"
    If Option5.value = True Then Text5.Text = "none"
End Sub

Private Sub Timer2_Timer()
Text3.Text = title.Text
End Sub

Private Sub Timer3_Timer()
Text4.Text = envio.Text
End Sub
