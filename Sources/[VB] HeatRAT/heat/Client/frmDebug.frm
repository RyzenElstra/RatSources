VERSION 5.00
Begin VB.Form frmDebug 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "RC Debugger"
   ClientHeight    =   5955
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9210
   Icon            =   "frmDebug.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5955
   ScaleWidth      =   9210
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtValue 
      Height          =   285
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   9
      Top             =   5520
      Width           =   9015
   End
   Begin VB.ListBox lstSent 
      Height          =   2010
      Left            =   4560
      TabIndex        =   7
      Top             =   480
      Width           =   4455
   End
   Begin VB.ListBox lstReceived 
      Height          =   2010
      Left            =   4560
      TabIndex        =   5
      Top             =   3000
      Width           =   4455
   End
   Begin VB.ListBox lstRemoteErrors 
      Height          =   2010
      Left            =   120
      TabIndex        =   3
      Top             =   3000
      Width           =   4095
   End
   Begin VB.ListBox lstLocalErrors 
      Height          =   2010
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   4095
   End
   Begin VB.Label lblInfo 
      BackStyle       =   0  'Transparent
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   5280
      Width           =   9015
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Data Sent"
      Height          =   375
      Left            =   4560
      TabIndex        =   6
      Top             =   120
      Width           =   1575
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   9000
      Y1              =   75
      Y2              =   75
   End
   Begin VB.Line Line5 
      BorderColor     =   &H00808080&
      X1              =   9000
      X2              =   0
      Y1              =   65
      Y2              =   65
   End
   Begin VB.Line Line4 
      BorderColor     =   &H00FFFFFF&
      X1              =   120
      X2              =   9120
      Y1              =   5170
      Y2              =   5170
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00808080&
      X1              =   9120
      X2              =   120
      Y1              =   5160
      Y2              =   5160
   End
   Begin VB.Label lblReceived 
      BackStyle       =   0  'Transparent
      Caption         =   "Data Received:"
      Height          =   255
      Left            =   4560
      TabIndex        =   4
      Top             =   2640
      Width           =   4575
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFFFFF&
      X1              =   4455
      X2              =   4455
      Y1              =   75
      Y2              =   5160
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      X1              =   4440
      X2              =   4440
      Y1              =   75
      Y2              =   5160
   End
   Begin VB.Label lblRemote 
      BackStyle       =   0  'Transparent
      Caption         =   "Remote Errors:"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   2640
      Width           =   4095
   End
   Begin VB.Label lblLocal 
      BackStyle       =   0  'Transparent
      Caption         =   "Local Errors:"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4095
   End
End
Attribute VB_Name = "frmDebug"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Unload(Cancel As Integer)
Cancel = 1
Me.Hide
End Sub

Private Sub lstLocalErrors_Click()
On Error Resume Next
Dim Procedure As String, eTime As String, Temp As String
Dim oBracket As Single, cBracket As Single
eTime = Mid(lstLocalErrors.Text, 2, (InStr(2, lstLocalErrors.Text, ">") - 2))
oBracket = InStr(1, lstLocalErrors.Text, "(") + 1
cBracket = InStr(1, lstLocalErrors.Text, ")")
Procedure = Mid(lstLocalErrors.Text, oBracket, cBracket - oBracket)
lblInfo.Caption = "Error in procedure '" & Procedure & "' at " & eTime & ":"
txtValue.Text = Mid(lstLocalErrors.Text, cBracket + 3)
End Sub

Private Sub lstReceived_Click()
On Error Resume Next
Dim IPAddress As String, eTime As String, Temp As String
Dim oBracket As Single, cBracket As Single
eTime = Mid(lstReceived.Text, 2, (InStr(2, lstReceived.Text, ">") - 2))
oBracket = InStr(1, lstReceived.Text, "(") + 1
cBracket = InStr(1, lstReceived.Text, ")")
IPAddress = Mid(lstReceived.Text, oBracket, cBracket - oBracket)
lblInfo.Caption = "Data received from '" & IPAddress & "' at " & eTime & ":"
txtValue.Text = Mid(lstReceived.Text, cBracket + 3)
End Sub

Private Sub lstRemoteErrors_Click()
On Error Resume Next
Dim Procedure As String, eTime As String, Temp As String
Dim oBracket As Single, cBracket As Single
eTime = Mid(lstRemoteErrors.Text, 2, (InStr(2, lstRemoteErrors.Text, ">") - 2))
oBracket = InStr(1, lstRemoteErrors.Text, "(") + 1
cBracket = InStr(1, lstRemoteErrors.Text, ")")
Procedure = Mid(lstRemoteErrors.Text, oBracket, cBracket - oBracket)
lblInfo.Caption = "Remote error in procedure '" & Procedure & "' at " & eTime & ":"
txtValue.Text = Mid(lstRemoteErrors.Text, cBracket + 3)
End Sub

Private Sub lstSent_Click()
On Error Resume Next
Dim IPAddress As String, eTime As String, Temp As String
Dim oBracket As Single, cBracket As Single
eTime = Mid(lstSent.Text, 2, (InStr(2, lstSent.Text, ">") - 2))
oBracket = InStr(1, lstSent.Text, "(") + 1
cBracket = InStr(1, lstSent.Text, ")")
IPAddress = Mid(lstSent.Text, oBracket, cBracket - oBracket)
lblInfo.Caption = "Data sent to '" & IPAddress & "' at " & eTime & ":"
txtValue.Text = Mid(lstSent.Text, cBracket + 3)
End Sub
