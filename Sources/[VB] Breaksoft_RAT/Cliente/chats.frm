VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form chats 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chat"
   ClientHeight    =   5115
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   9090
   Icon            =   "chats.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5115
   ScaleWidth      =   9090
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   360
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Height          =   5055
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   8895
      Begin VB.CommandButton Command6 
         Caption         =   "Limpiar"
         Height          =   255
         Left            =   8040
         TabIndex        =   11
         Top             =   3960
         Width           =   735
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Enviar"
         Height          =   255
         Left            =   7080
         TabIndex        =   10
         Top             =   3960
         Width           =   855
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   120
         TabIndex        =   9
         Top             =   3960
         Width           =   6855
      End
      Begin VB.TextBox Text3 
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
         Left            =   960
         TabIndex        =   7
         Text            =   "Hacker"
         Top             =   4440
         Width           =   975
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
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
         Height          =   285
         Left            =   240
         TabIndex        =   6
         Text            =   "Nick :"
         Top             =   4440
         Width           =   615
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Guardar"
         Height          =   375
         Left            =   7200
         TabIndex        =   5
         Top             =   4440
         Width           =   1335
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Forzar Chat Server"
         Height          =   375
         Left            =   3600
         TabIndex        =   4
         Top             =   4440
         Width           =   1815
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Cerra Chat"
         Height          =   375
         Left            =   5520
         TabIndex        =   3
         Top             =   4440
         Width           =   1575
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Block Teclas"
         Height          =   375
         Left            =   2160
         TabIndex        =   2
         Top             =   4440
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         Height          =   3615
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   240
         Width           =   8655
      End
      Begin VB.Frame Frame2 
         Height          =   735
         Left            =   120
         TabIndex        =   8
         Top             =   4200
         Width           =   8655
      End
   End
End
Attribute VB_Name = "chats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim Eric As String
Text1.Text = Text1.Text & vbNewLine & Time & " " & Text3.Text & " dice: " & Text2.Text
enviar "men|" & Text1.Text
Text2.Text = ""
Text2.SetFocus
End Sub

Private Sub Command2_Click()
Dim Linea As String
CommonDialog1.DialogTitle = "Guardar LOG del Chat"
CommonDialog1.Filter = "Text Files TXT|*.txt"
CommonDialog1.ShowSave
If CommonDialog1.FileName = "" Then
Exit Sub
Else
If Text1 = "" Then
MsgBox "Debe haber algo para Guardar!"
Exit Sub
End If
Open CommonDialog1.FileName For Output As #1
Print #1, Text1
Close
End If
End Sub

Private Sub Command3_Click()
enviar "chat"
End Sub

Private Sub Command4_Click()
enviar "cerrarchat"
End Sub

Private Sub Command5_Click()
enviar "bloquearmouseteclado"
End Sub

Private Sub Command6_Click()
Text1.Text = ""
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Chat con " & Form1.LV.SelectedItem
End Sub

Private Sub Form_Unload(Cancel As Integer)
enviar "cerrarchat"
Form1.Show
Unload Me
End Sub

Private Sub Text1_Change()
On Error Resume Next
Text1.SelStart = Len(Text1.Text)
End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
KeyAscii = 0
Call Command1_Click
End If
End Sub
