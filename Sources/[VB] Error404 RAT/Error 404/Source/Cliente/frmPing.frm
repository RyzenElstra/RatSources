VERSION 5.00
Begin VB.Form frmPing 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Ping"
   ClientHeight    =   5175
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   5895
   Icon            =   "frmPing.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5175
   ScaleWidth      =   5895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdTracert 
      Caption         =   "Tracert"
      Height          =   255
      Left            =   4320
      TabIndex        =   4
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton cmdPing 
      Caption         =   "Ping"
      Height          =   255
      Left            =   3120
      TabIndex        =   3
      Top             =   120
      Width           =   975
   End
   Begin VB.TextBox txtHostIP 
      Height          =   285
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   2
      Top             =   120
      Width           =   1335
   End
   Begin VB.TextBox txtLog 
      BackColor       =   &H00000000&
      ForeColor       =   &H80000005&
      Height          =   4575
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   480
      Width           =   5655
   End
   Begin VB.Label lblPing 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Host/IP:"
      Height          =   195
      Left            =   480
      TabIndex        =   1
      Top             =   120
      Width           =   600
   End
End
Attribute VB_Name = "frmPing"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdPing_Click()
    If txtHostIP.Text = "" Then
        MsgBox "No hay Host/IP para hacer Ping", vbExclamation, "Error 404"
      Exit Sub
    End If
    
Send "GetPing|" & txtHostIP.Text
End Sub

Private Sub cmdTracert_Click()
    If txtHostIP.Text = "" Then
        MsgBox "No hay Host/IP para hacer Tracert", vbExclamation, "Error 404"
      Exit Sub
    End If
    
Send "GetTracert|" & txtHostIP.Text
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Error 404 - Ping [" & frmMain.LV.SelectedItem & "]"
txtHostIP.Text = frmMain.LV.SelectedItem.SubItems(2)
End Sub
