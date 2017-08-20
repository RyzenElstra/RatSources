VERSION 5.00
Begin VB.Form frmExtra 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "storm v1.0"
   ClientHeight    =   3180
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4575
   LinkTopic       =   "Form1"
   ScaleHeight     =   3180
   ScaleWidth      =   4575
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picextra 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   2655
      Left            =   0
      ScaleHeight     =   2625
      ScaleWidth      =   4545
      TabIndex        =   0
      Top             =   480
      Width           =   4575
      Begin VB.Label lblhidedesktop 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "hide"
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
         Left            =   1110
         TabIndex        =   30
         Top             =   30
         Width           =   405
      End
      Begin VB.Shape Shape17 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1080
         Top             =   0
         Width           =   465
      End
      Begin VB.Label lblhidestart 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "hide"
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
         Left            =   1110
         TabIndex        =   29
         Top             =   510
         Width           =   405
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1080
         Top             =   480
         Width           =   465
      End
      Begin VB.Label lblhidetaskbar 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "hide"
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
         Left            =   1110
         TabIndex        =   28
         Top             =   990
         Width           =   405
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1080
         Top             =   960
         Width           =   465
      End
      Begin VB.Label Label11 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "desktop"
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
         Left            =   240
         TabIndex        =   27
         Top             =   30
         Width           =   765
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "start button"
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
         Left            =   0
         TabIndex        =   26
         Top             =   480
         Width           =   1005
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "taskbar"
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
         Left            =   240
         TabIndex        =   25
         Top             =   960
         Width           =   765
      End
      Begin VB.Label lblshowdesktop 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "show"
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
         Left            =   1710
         TabIndex        =   24
         Top             =   30
         Width           =   480
      End
      Begin VB.Shape Shape3 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1680
         Top             =   0
         Width           =   540
      End
      Begin VB.Label lblshowstart 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "show"
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
         Left            =   1710
         TabIndex        =   23
         Top             =   510
         Width           =   480
      End
      Begin VB.Shape Shape4 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1680
         Top             =   480
         Width           =   540
      End
      Begin VB.Label lblshowtaskbar 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "show"
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
         Left            =   1710
         TabIndex        =   22
         Top             =   990
         Width           =   480
      End
      Begin VB.Shape Shape5 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1680
         Top             =   960
         Width           =   540
      End
      Begin VB.Label lblopencd 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "open"
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
         Left            =   1110
         TabIndex        =   21
         Top             =   1470
         Width           =   405
      End
      Begin VB.Shape Shape6 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1080
         Top             =   1440
         Width           =   465
      End
      Begin VB.Label lblstartspeaker 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "start"
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
         Left            =   1110
         TabIndex        =   20
         Top             =   1950
         Width           =   405
      End
      Begin VB.Shape Shape7 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1080
         Top             =   1920
         Width           =   465
      End
      Begin VB.Label Label12 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "cd rom"
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
         Left            =   240
         TabIndex        =   19
         Top             =   1470
         Width           =   765
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "speaker"
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
         Left            =   0
         TabIndex        =   18
         Top             =   1920
         Width           =   1005
      End
      Begin VB.Label lblclosecd 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "close"
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
         Left            =   1710
         TabIndex        =   17
         Top             =   1470
         Width           =   480
      End
      Begin VB.Shape Shape9 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1680
         Top             =   1440
         Width           =   540
      End
      Begin VB.Label lblstopspeaker 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "stop"
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
         Left            =   1710
         TabIndex        =   16
         Top             =   1950
         Width           =   480
      End
      Begin VB.Shape Shape10 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1680
         Top             =   1920
         Width           =   540
      End
      Begin VB.Label lblmonitoron 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "on"
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
         Left            =   3510
         TabIndex        =   15
         Top             =   30
         Width           =   240
      End
      Begin VB.Shape Shape8 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3480
         Top             =   0
         Width           =   300
      End
      Begin VB.Label lblctrlon 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "on"
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
         Left            =   3510
         TabIndex        =   14
         Top             =   510
         Width           =   240
      End
      Begin VB.Shape Shape11 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3480
         Top             =   480
         Width           =   300
      End
      Begin VB.Label lblcapson 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "on"
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
         Left            =   3510
         TabIndex        =   13
         Top             =   1470
         Width           =   240
      End
      Begin VB.Shape Shape12 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3480
         Top             =   1440
         Width           =   300
      End
      Begin VB.Label lblnumon 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "on"
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
         Left            =   3510
         TabIndex        =   12
         Top             =   1950
         Width           =   240
      End
      Begin VB.Shape Shape13 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3480
         Top             =   1920
         Width           =   300
      End
      Begin VB.Label lblscrollon 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "on"
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
         Left            =   3510
         TabIndex        =   11
         Top             =   990
         Width           =   240
      End
      Begin VB.Shape Shape14 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3480
         Top             =   960
         Width           =   300
      End
      Begin VB.Label lblmonitoroff 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "off"
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
         Left            =   3990
         TabIndex        =   10
         Top             =   30
         Width           =   240
      End
      Begin VB.Shape Shape15 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3960
         Top             =   0
         Width           =   300
      End
      Begin VB.Label lblctrloff 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "off"
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
         Left            =   3990
         TabIndex        =   9
         Top             =   510
         Width           =   240
      End
      Begin VB.Shape Shape16 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3960
         Top             =   480
         Width           =   300
      End
      Begin VB.Label lblcapsoff 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "off"
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
         Left            =   3990
         TabIndex        =   8
         Top             =   1470
         Width           =   240
      End
      Begin VB.Shape Shape18 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3960
         Top             =   1440
         Width           =   300
      End
      Begin VB.Label lblnumoff 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "off"
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
         Left            =   3990
         TabIndex        =   7
         Top             =   1950
         Width           =   240
      End
      Begin VB.Shape Shape19 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3960
         Top             =   1920
         Width           =   300
      End
      Begin VB.Label lblscrolloff 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "off"
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
         Left            =   3990
         TabIndex        =   6
         Top             =   990
         Width           =   240
      End
      Begin VB.Shape Shape20 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   3960
         Top             =   960
         Width           =   300
      End
      Begin VB.Label Label25 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "monitor"
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
         Left            =   2640
         TabIndex        =   5
         Top             =   30
         Width           =   765
      End
      Begin VB.Label Label26 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "ctrl alt del"
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
         Left            =   2400
         TabIndex        =   4
         Top             =   480
         Width           =   1005
      End
      Begin VB.Label Label27 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "scrolllock"
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
         Left            =   2640
         TabIndex        =   3
         Top             =   960
         Width           =   765
      End
      Begin VB.Label Label28 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "capslock"
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
         Left            =   2640
         TabIndex        =   2
         Top             =   1470
         Width           =   765
      End
      Begin VB.Label Label29 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "numlock"
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
         Left            =   2400
         TabIndex        =   1
         Top             =   1920
         Width           =   1005
      End
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
      Left            =   4320
      TabIndex        =   31
      ToolTipText     =   "Close"
      Top             =   15
      Width           =   240
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "extra functions"
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
      TabIndex        =   32
      Top             =   0
      Width           =   4575
   End
End
Attribute VB_Name = "frmExtra"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer

Private Sub lblcapsoff_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "CapsLockOff"
frmMain.Status.Caption = "switching capslock off..."
End If
End Sub

Private Sub lblcapson_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "CapsLockOn"
frmMain.Status.Caption = "switching capslock on..."
End If
End Sub

Private Sub lblclosecd_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "CloseCD"
frmMain.Status.Caption = "closing cd rom drive..."
End If
End Sub

Private Sub lblctrloff_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "CtrlAltDelOff"
frmMain.Status.Caption = "enabling ctrl alt del..."
End If
End Sub

Private Sub lblctrlon_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "CtrlAltDelOn"
frmMain.Status.Caption = "disabling ctrl alt del..."
End If
End Sub

Private Sub lblhidedesktop_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "HideDesktop"
frmMain.Status.Caption = "hiding desktop..."
End If
End Sub

Private Sub lblhidestart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "HideStartButton"
frmMain.Status.Caption = "hiding start button..."
End If
End Sub

Private Sub lblhidetaskbar_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "HideTaskBar"
frmMain.Status.Caption = "hiding the taskbar..."
End If
End Sub

Private Sub lblmonitoroff_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "MonitorOff"
frmMain.Status.Caption = "turning monitor off..."
End If
End Sub

Private Sub lblmonitoron_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "MonitorOn"
frmMain.Status.Caption = "turning monitor on..."
End If
End Sub

Private Sub lblnumoff_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "NumLockOff"
frmMain.Status.Caption = "switching the numlock off..."
End If
End Sub

Private Sub lblnumon_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "NumLockOn"
frmMain.Status.Caption = "switching numlock on..."
End If
End Sub

Private Sub lblopencd_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "OpenCD"
frmMain.Status.Caption = "opening cd rom drive..."
End If
End Sub

Private Sub lblscrolloff_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "ScrollLockOff"
frmMain.Status.Caption = "switching scrolllock off..."
End If
End Sub

Private Sub lblscrollon_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "ScrollLockOn"
frmMain.Status.Caption = "switching scrolllock on..."
End If
End Sub

Private Sub lblshowdesktop_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "ShowDesktop"
frmMain.Status.Caption = "showing desktop..."
End If
End Sub

Private Sub lblshowstart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "ShowStartButton"
frmMain.Status.Caption = "showing starting button..."
End If
End Sub

Private Sub lblshowtaskbar_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "ShowTaskBar"
frmMain.Status.Caption = "showing taskbar..."
End If
End Sub

Private Sub lblstartspeaker_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "StartBeep"
frmMain.Status.Caption = "attempting to beep internal speaker..."
End If
End Sub

Private Sub lblstopspeaker_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "StopBeep"
frmMain.Status.Caption = "stopping internal speaker beeping..."
End If
End Sub

Private Sub picextra_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
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

Private Sub lblhidedesktop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidedesktop.BackColor = &HFFC0C0
End Sub

Private Sub lblhidedesktop_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidedesktop.BackColor = &H800000
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblshowdesktop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshowdesktop.BackColor = &HFFC0C0
End Sub

Private Sub lblshowdesktop_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshowdesktop.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblhidestart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidestart.BackColor = &HFFC0C0
End Sub

Private Sub lblhidestart_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidestart.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblshowstart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshowstart.BackColor = &HFFC0C0
End Sub

Private Sub lblshowstart_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshowstart.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblhidetaskbar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidetaskbar.BackColor = &HFFC0C0
End Sub

Private Sub lblhidetaskbar_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidetaskbar.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblshowtaskbar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshowtaskbar.BackColor = &HFFC0C0
End Sub

Private Sub lblshowtaskbar_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshowtaskbar.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblopencd_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopencd.BackColor = &HFFC0C0
End Sub

Private Sub lblopencd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopencd.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblclosecd_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclosecd.BackColor = &HFFC0C0
End Sub

Private Sub lblclosecd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclosecd.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblstartspeaker_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartspeaker.BackColor = &HFFC0C0
End Sub

Private Sub lblstartspeaker_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartspeaker.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblstopspeaker_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstopspeaker.BackColor = &HFFC0C0
End Sub

Private Sub lblstopspeaker_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstopspeaker.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblmonitoron_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmonitoron.BackColor = &HFFC0C0
End Sub

Private Sub lblmonitoron_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmonitoron.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblmonitoroff_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmonitoroff.BackColor = &HFFC0C0
End Sub

Private Sub lblmonitoroff_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmonitoroff.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblctrlon_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblctrlon.BackColor = &HFFC0C0
End Sub

Private Sub lblctrlon_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblctrlon.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblctrloff_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblctrloff.BackColor = &HFFC0C0
End Sub

Private Sub lblctrloff_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblctrloff.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblscrollon_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscrollon.BackColor = &HFFC0C0
End Sub

Private Sub lblscrollon_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscrollon.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblscrolloff_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscrolloff.BackColor = &HFFC0C0
End Sub

Private Sub lblscrolloff_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscrolloff.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblcapson_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcapson.BackColor = &HFFC0C0
End Sub

Private Sub lblcapson_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcapson.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblcapsoff_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcapsoff.BackColor = &HFFC0C0
End Sub

Private Sub lblcapsoff_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcapsoff.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblnumon.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblnumon_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnumon.BackColor = &HFFC0C0
End Sub

Private Sub lblnumon_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnumon.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumoff.BackColor = &H8
End Sub

Private Sub lblnumoff_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnumoff.BackColor = &HFFC0C0
End Sub

Private Sub lblnumoff_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnumoff.BackColor = &H800000
lblhidedesktop.BackColor = &H8
lblshowdesktop.BackColor = &H8
lblhidestart.BackColor = &H8
lblshowstart.BackColor = &H8
lblhidetaskbar.BackColor = &H8
lblshowtaskbar.BackColor = &H8
lblopencd.BackColor = &H8
lblclosecd.BackColor = &H8
lblstartspeaker.BackColor = &H8
lblstopspeaker.BackColor = &H8
lblmonitoron.BackColor = &H8
lblmonitoroff.BackColor = &H8
lblctrlon.BackColor = &H8
lblctrloff.BackColor = &H8
lblscrollon.BackColor = &H8
lblscrolloff.BackColor = &H8
lblcapson.BackColor = &H8
lblcapsoff.BackColor = &H8
lblnumon.BackColor = &H8
End Sub
