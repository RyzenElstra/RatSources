VERSION 5.00
Begin VB.Form frmKeyStrokes 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "KeyStrokes"
   ClientHeight    =   5130
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4995
   Icon            =   "frmKeyStrokes.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5130
   ScaleWidth      =   4995
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdHelp 
      Caption         =   "Help"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   120
      TabIndex        =   8
      Top             =   4650
      Width           =   645
   End
   Begin VB.TextBox txtData 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1350
      Left            =   90
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Top             =   2940
      Width           =   4800
   End
   Begin VB.CommandButton cmdSendKeys 
      Caption         =   "Send Keys"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2580
      Style           =   1  'Graphical
      TabIndex        =   5
      ToolTipText     =   "Send keystrokes"
      Top             =   4650
      Width           =   1200
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2205
      ItemData        =   "frmKeyStrokes.frx":030A
      Left            =   105
      List            =   "frmKeyStrokes.frx":030C
      TabIndex        =   3
      Top             =   300
      Width           =   4800
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh Windows"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   870
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "Refresh active windows list"
      Top             =   4650
      Width           =   1600
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3900
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Clear all"
      Top             =   4650
      Width           =   1000
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "P.S: ~Enter | %Alt | ^Ctrl | +Shift   e.g: Alt+F4 = %{f4}"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   7
      Top             =   4320
      Width           =   4140
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Type or paste the keys you wanna send:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   2700
      Width           =   2955
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Window to send keys:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   60
      Width           =   1590
   End
End
Attribute VB_Name = "frmKeyStrokes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClear_Click()
List1.Clear
txtData.text = ""
End Sub

Private Sub cmdHelp_Click()
If FileExists(cPath & "SendKeys.html") Then
   frmHelpSendKeys.Show
Else
   MsgBox "SendKeys.html not found.", vbExclamation, "Help - SendKeys"
End If
End Sub

Private Sub cmdRefresh_Click()
List1.Clear
Call frmMain.sendText("REFRESH")
DoEvents
End Sub

Public Sub ReceiveWindowList(DATA As String)
List1.AddItem DATA
End Sub

Private Sub cmdSendKeys_Click()
txtData.text = Trim(txtData.text)
If List1.ListIndex <> -1 Then
   If Len(txtData.text) > 0 And Len(txtData.text) <= 1000 Then
      Call frmMain.sendText("SK" & List1.List(List1.ListIndex) & Delimiter & txtData.text & Delimiter)
      DoEvents
   Else
      MsgBox "Please input between 1 to 1000 characters.", vbExclamation, "KeyStrokes"
   End If
Else
   MsgBox "Please select a window you want to send.", vbExclamation, "KeyStrokes"
End If
End Sub

Private Sub Form_Load()
frmMain.Hide
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
frmMain.Show
frmMain.txtAction.text = ""
Call frmMain.sendText("END")
DoEvents
Unload Me
End Sub
