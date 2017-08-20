VERSION 5.00
Begin VB.Form frmScreenPreview 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Desktop Preview"
   ClientHeight    =   4695
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4995
   Icon            =   "frmScreenPreview.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4695
   ScaleWidth      =   4995
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox CheckAllowMouse 
      Caption         =   "Allow Mouse Clicks"
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
      Left            =   3270
      TabIndex        =   5
      Top             =   3870
      Width           =   1665
   End
   Begin VB.VScrollBar ScrollBar 
      Height          =   315
      Left            =   1980
      Max             =   1
      Min             =   100
      TabIndex        =   4
      Top             =   3810
      Value           =   5
      Width           =   315
   End
   Begin VB.TextBox txtInterval 
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1470
      Locked          =   -1  'True
      MaxLength       =   3
      TabIndex        =   3
      Text            =   "5"
      Top             =   3810
      Width           =   420
   End
   Begin VB.CommandButton cmdEnable 
      Caption         =   "Enable"
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
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "Enable capture"
      Top             =   4260
      Width           =   800
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
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
      Left            =   4080
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Close"
      Top             =   4260
      Width           =   800
   End
   Begin VB.Image ImgScreen 
      Height          =   3600
      Left            =   105
      Stretch         =   -1  'True
      Top             =   100
      Width           =   4800
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "P.S: Press Shift+Button is double click."
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
      Left            =   1110
      TabIndex        =   6
      Top             =   4320
      Width           =   2775
   End
   Begin VB.Shape ShapeScreen 
      BackColor       =   &H00000000&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H0000FFFF&
      FillColor       =   &H00E0E0E0&
      Height          =   3640
      Left            =   95
      Top             =   90
      Width           =   4840
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Capture Interval:"
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
      Left            =   150
      TabIndex        =   2
      Top             =   3840
      Width           =   1260
   End
End
Attribute VB_Name = "frmScreenPreview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim X1, X2, Y1, Y2 As Single

Private Sub Form_Load()
    frmMain.Hide
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Call CloseSCRPreview
End Sub

'get the drag X,Y
Private Sub ImgScreen_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
X1 = x
Y1 = y
End Sub

Private Sub ImgScreen_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Dim MouseButton As Integer

'get the drop X,Y
X2 = x
Y2 = y
'if not press shift with click
If Shift = 0 Then
   MouseButton = Button
Else 'if press shift with click, mean double click
   MouseButton = 3
End If
If CheckAllowMouse.Value = Checked Then
   Call frmMain.sendText((X1 / ImgScreen.Width) & Delimiter & (Y1 / ImgScreen.Height) & Delimiter & (X2 / ImgScreen.Width) & Delimiter & (Y2 / ImgScreen.Height) & Delimiter & MouseButton & Delimiter)
   DoEvents
End If
End Sub

Private Sub cmdEnable_Click()
If cmdEnable.Caption = "Enable" Then
   cmdEnable.Caption = "Disable"
   cmdEnable.ToolTipText = "Disable capture"
   frmMain.txtAction.text = "4FILEGM_13" 'download preview screen
   Call frmMain.setFilename_13("preview.jpg")
   Call frmMain.sendText("START" & txtInterval.text)
   DoEvents
ElseIf cmdEnable.Caption = "Disable" Then
   cmdEnable.Caption = "Enable"
   cmdEnable.ToolTipText = "Enable capture"
   Call ExitSCRPreview
   Call frmMain.sendText("END")
   DoEvents
End If
End Sub

Private Sub cmdClose_Click()
Call CloseSCRPreview
End Sub

Private Sub CloseSCRPreview()
    frmMain.Show
    If cmdEnable.Caption = "Disable" Then
       cmdEnable.Caption = "Enable"
       cmdEnable.ToolTipText = "Enable capture"
       Call ExitSCRPreview
       Call frmMain.sendText("END")
    End If
    DoEvents
    Call frmMain.sendText("EXIT")
    DoEvents
    Unload Me
End Sub

Private Sub ExitSCRPreview()
    frmMain.setFilename_13 ("")
    frmMain.txtAction.text = ""
    frmMain.lblAction.Caption = ""
End Sub

Private Sub ScrollBar_Change()
txtInterval.text = ScrollBar.Value
End Sub

