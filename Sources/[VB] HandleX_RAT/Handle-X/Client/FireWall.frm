VERSION 5.00
Begin VB.Form FireWall 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2415
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   4575
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2415
   ScaleWidth      =   4575
   Begin VB.Frame Window 
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      Height          =   1935
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   60
      Width           =   4455
      Begin VB.TextBox TxtEditServer 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   675
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   50
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   28
         Top             =   340
         Width           =   4360
      End
      Begin VB.OptionButton AccessSate 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Allow And Ask Next Time When Application Attempts To Access The Network ."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   2
         Left            =   60
         MaskColor       =   &H00000000&
         TabIndex        =   17
         Top             =   1560
         Width           =   4335
      End
      Begin VB.OptionButton AccessSate 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Block Application From Accessing The Network"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   1
         Left            =   60
         MaskColor       =   &H00000000&
         TabIndex        =   16
         Top             =   1320
         Width           =   4335
      End
      Begin VB.OptionButton AccessSate 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Allow Application To Access The Network ."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   0
         Left            =   60
         MaskColor       =   &H00000000&
         TabIndex        =   15
         Top             =   1080
         Width           =   4335
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Alert"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   5
         Left            =   1320
         TabIndex        =   11
         Top             =   40
         Width           =   1815
      End
   End
   Begin VB.Frame Window 
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      Height          =   1935
      Index           =   1
      Left            =   60
      TabIndex        =   6
      Top             =   60
      Width           =   4455
      Begin VB.OptionButton AddOpt 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Ask    [Ask User When The Application Tries To Access The Network Next Time]"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   2
         Left            =   60
         MaskColor       =   &H00000000&
         TabIndex        =   14
         Top             =   1560
         Width           =   4215
      End
      Begin VB.OptionButton AddOpt 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Block [Block Application From  Accessing The Net.]"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   1
         Left            =   60
         MaskColor       =   &H00000000&
         TabIndex        =   13
         Top             =   1260
         Width           =   4215
      End
      Begin VB.OptionButton AddOpt 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Allow [Allow Application To Access The Network]"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   0
         Left            =   60
         MaskColor       =   &H00000000&
         TabIndex        =   12
         Top             =   960
         Width           =   4215
      End
      Begin VB.TextBox TxtEditServer 
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   240
         IMEMode         =   3  'DISABLE
         Index           =   0
         Left            =   75
         Locked          =   -1  'True
         TabIndex        =   7
         Top             =   600
         Width           =   4335
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Add Application"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   3
         Left            =   1320
         TabIndex        =   9
         Top             =   40
         Width           =   1935
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Applicatio Path :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   2
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   1515
      End
   End
   Begin VB.Frame Window 
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      Height          =   1935
      Index           =   3
      Left            =   60
      TabIndex        =   18
      Top             =   60
      Width           =   4455
      Begin VB.TextBox TxtFireWall 
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   27
         Top             =   1080
         Width           =   3555
      End
      Begin VB.TextBox TxtFireWall 
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   3
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   26
         Top             =   1440
         Width           =   2835
      End
      Begin VB.TextBox TxtFireWall 
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   25
         Top             =   720
         Width           =   3555
      End
      Begin VB.TextBox TxtFireWall 
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   0
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   24
         Top             =   360
         Width           =   3315
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Creation Time :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   9
         Left            =   120
         TabIndex        =   23
         Top             =   1480
         Width           =   1875
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Type :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   8
         Left            =   120
         TabIndex        =   22
         Top             =   1106
         Width           =   915
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Size :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   7
         Left            =   120
         TabIndex        =   21
         Top             =   733
         Width           =   915
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "File Datails"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   6
         Left            =   1320
         TabIndex        =   20
         Top             =   40
         Width           =   1815
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Full Path :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   4
         Left            =   120
         TabIndex        =   19
         Top             =   360
         Width           =   915
      End
   End
   Begin VB.Frame Window 
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      Height          =   1935
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4455
      Begin VB.TextBox TxtEditServer 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   120
         MaxLength       =   10
         TabIndex        =   4
         Top             =   1080
         Width           =   4095
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Applications File :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   1
         Left            =   160
         TabIndex        =   5
         Top             =   840
         Width           =   1635
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   0
         Left            =   1320
         TabIndex        =   3
         Top             =   40
         Width           =   1815
      End
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   2
      X1              =   4560
      X2              =   4560
      Y1              =   2400
      Y2              =   0
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   1
      X1              =   -120
      X2              =   4560
      Y1              =   2400
      Y2              =   2400
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   0
      X1              =   0
      X2              =   0
      Y1              =   2400
      Y2              =   0
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   50
      X1              =   0
      X2              =   4560
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Label FireWallButtons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   1
      Left            =   3120
      MouseIcon       =   "FireWall.frx":0000
      MousePointer    =   99  'Custom
      TabIndex        =   2
      ToolTipText     =   "Ask For Selected Connection When It Try to Access The Network"
      Top             =   2040
      Width           =   975
   End
   Begin VB.Label FireWallButtons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ok"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   0
      Left            =   600
      MouseIcon       =   "FireWall.frx":030A
      MousePointer    =   99  'Custom
      TabIndex        =   1
      ToolTipText     =   "Ask For Selected Connection When It Try to Access The Network"
      Top             =   2040
      Width           =   975
   End
End
Attribute VB_Name = "FireWall"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim b As Integer, C As Integer, a As Boolean   'Variables Needed for the movinfg of the editor
Dim CurrentWindow As Integer
Public AppSatet As Integer, NewAPP As String   'Variable needed to
Private Sub AccessSate_Click(Index As Integer)
    AppSatet = Index
End Sub
Private Sub AddOpt_Click(Index As Integer)
    AppSatet = Index
End Sub
Private Sub FireWallButtons_Click(Index As Integer)
Select Case Index
    Case 0 'OK
        If CurrentWindow = 1 Then NewAPP = TxtEditServer(0)
        Unload Me
    Case 1 'Cancel
        If CurrentWindow = 1 Then TxtEditServer(0) = ""
        Unload Me
End Select
End Sub
Private Sub FireWallButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    FireWallButtons(Index).BackColor = &HC0C0C0
End Sub
Private Sub FireWallButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    FireWallButtons(Index).BackColor = &HE0E0E0
End Sub
Public Function ShowWindow(Index As Integer)
    Dim i As Integer 'Genral counter
    For i = 0 To Window.UBound
        Window(i).Visible = False
    Next
    Window(Index).Visible = True
    CurrentWindow = Index
End Function
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  b = X
  C = Y
  a = True
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    If a And CurrentWindow <> 2 Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
End Sub
Public Sub ShowAlert()
    On Error Resume Next
    Dim i As Integer 'General Counter
   'Preper The Form To Be A Slider Window
    With Me
        .Left = Screen.Width - .Width - 20
        .Top = Screen.Height - .Height - 500
         ShowWindow (2)
         MakeForOnTop (Me.hWnd)
         AccessSate(0).Value = True
         AppSatet = 0 'Set Allow State as startup
        .Show 1
    End With
End Sub
