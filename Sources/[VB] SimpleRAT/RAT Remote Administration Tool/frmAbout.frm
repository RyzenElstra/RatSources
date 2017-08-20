VERSION 5.00
Begin VB.Form frmAbout 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   0  'None
   Caption         =   "About MyApp"
   ClientHeight    =   4710
   ClientLeft      =   5250
   ClientTop       =   3495
   ClientWidth     =   6855
   ClipControls    =   0   'False
   LinkTopic       =   "Form2"
   ScaleHeight     =   4710
   ScaleWidth      =   6855
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox picinfo 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4695
      Left            =   6840
      ScaleHeight     =   4665
      ScaleWidth      =   3825
      TabIndex        =   8
      Top             =   0
      Width           =   3855
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   735
         Index           =   1
         Left            =   1320
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   20
         Text            =   "frmAbout.frx":0000
         Top             =   3960
         Width           =   2415
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   2175
         Index           =   0
         Left            =   1320
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   18
         Text            =   "frmAbout.frx":0047
         Top             =   1560
         Width           =   2415
      End
      Begin VB.Label lblclose 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   10
         Left            =   3720
         MouseIcon       =   "frmAbout.frx":01CA
         MousePointer    =   99  'Custom
         TabIndex        =   21
         ToolTipText     =   "Away From Me"
         Top             =   0
         Width           =   135
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "REFERENCE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   19
         Top             =   3960
         Width           =   975
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "ABOUT RAT"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   17
         Top             =   1560
         Width           =   975
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "The DayWalker"
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
         Height          =   255
         Index           =   7
         Left            =   1320
         TabIndex        =   16
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "B.TECH in INFO TECH"
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
         Height          =   255
         Index           =   6
         Left            =   1320
         TabIndex        =   15
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "DEGREE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   14
         Top             =   1200
         Width           =   975
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Yuvaraj.B"
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
         Height          =   255
         Index           =   5
         Left            =   1320
         TabIndex        =   13
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "D.O.B/AGE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   12
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "3rd June 1985 ,      21 yrs"
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
         Height          =   255
         Index           =   3
         Left            =   1320
         TabIndex        =   11
         Top             =   840
         Width           =   2295
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "NICK"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   10
         Top             =   480
         Width           =   975
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "NAME"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   9
         Top             =   120
         Width           =   975
      End
   End
   Begin VB.PictureBox picme 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4695
      Left            =   0
      Picture         =   "frmAbout.frx":04D4
      ScaleHeight     =   4665
      ScaleMode       =   0  'User
      ScaleWidth      =   0
      TabIndex        =   7
      Top             =   0
      Width           =   15
   End
   Begin VB.PictureBox picIcon 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   2505
      Left            =   240
      Picture         =   "frmAbout.frx":4783
      ScaleHeight     =   1759.345
      ScaleMode       =   0  'User
      ScaleWidth      =   1548.645
      TabIndex        =   0
      Top             =   720
      Width           =   2205
      Begin VB.CommandButton cmdhidden 
         BackColor       =   &H80000007&
         Caption         =   "Command1"
         Height          =   135
         Left            =   1320
         MaskColor       =   &H00000000&
         TabIndex        =   6
         Top             =   1320
         Width           =   15
      End
   End
   Begin VB.Label lblVersion 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "Remote Administration Tool"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   2400
      TabIndex        =   2
      Top             =   1200
      Width           =   4365
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "The Daywalker"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   2
      Left            =   3840
      MouseIcon       =   "frmAbout.frx":592E
      MousePointer    =   99  'Custom
      TabIndex        =   5
      ToolTipText     =   "machayuva@gmail.com"
      Top             =   3120
      Width           =   1395
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "Coded By"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2400
      TabIndex        =   4
      Top             =   2760
      Width           =   4365
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "RAT"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   50.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   1080
      Left            =   2400
      TabIndex        =   1
      Top             =   120
      Width           =   4335
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "Version  1.0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   0
      Left            =   2400
      TabIndex        =   3
      Top             =   2040
      Width           =   4365
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   6840
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line3 
      X1              =   0
      X2              =   0
      Y1              =   0
      Y2              =   4680
   End
   Begin VB.Line Line2 
      X1              =   0
      X2              =   6840
      Y1              =   4680
      Y2              =   4680
   End
   Begin VB.Line Line1 
      X1              =   6840
      X2              =   6840
      Y1              =   0
      Y2              =   4680
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdhidden_Click()
On Error Resume Next
    picme.Width = 3015
    picIcon.Visible = False
    picinfo.Left = 3000
End Sub

Private Sub Form_Click()
    Unload Me
End Sub

Private Sub Form_Load()
On Error Resume Next
    picIcon.Visible = True
    picme.Width = 15
    picinfo.Left = 9000
End Sub

Private Sub Label1_Click(Index As Integer)
On Error Resume Next
Select Case Index
    Case 0
        Unload Me
    Case 3
        Unload Me
    Case 1
        Call ShellExecute(Me.hwnd, vbNullString, "mailto:gladigocool@yahoo.com", vbNullString, "C:\", 1)
    Case 2
        Call ShellExecute(Me.hwnd, vbNullString, "mailto:machayuva@gmail.com", vbNullString, "C:\", 1)
End Select
End Sub

Private Sub Label1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Select Case Index
Case 1
    If Label1(Index).FontUnderline = False Then
    Label1(Index).FontUnderline = True
    Else
    If Label1(Index).FontUnderline = True Then
    Label1(Index).FontUnderline = False
    End If
    End If
Case 2
    If Label1(Index).FontUnderline = False Then
    Label1(Index).FontUnderline = True
    Else
    If Label1(Index).FontUnderline = True Then
    Label1(Index).FontUnderline = False
    End If
    End If
End Select
End Sub

Private Sub Label2_Click()
    Unload Me
End Sub

Private Sub lblclose_Click(Index As Integer)
On Error Resume Next
    picinfo.Left = 9000
    picme.Width = 15
    picIcon.Visible = True
End Sub

Private Sub lblclose_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblclose(10).BorderStyle = 1
End Sub

Private Sub lblclose_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblclose(10).BorderStyle = 0
End Sub

Private Sub lblTitle_Click()
    Unload Me
End Sub

Private Sub lblVersion_Click()
    Unload Me
End Sub

Private Sub picIcon_Click()
    Unload Me
End Sub



