VERSION 5.00
Begin VB.Form frmMouse 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3495
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4335
   LinkTopic       =   "Form1"
   ScaleHeight     =   3495
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox image1 
      BorderStyle     =   0  'None
      Height          =   260
      Left            =   3360
      MousePointer    =   10  'Up Arrow
      Picture         =   "Form1.frx":0000
      ScaleHeight     =   255
      ScaleWidth      =   135
      TabIndex        =   11
      Top             =   2325
      Width           =   140
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   80
      Left            =   2880
      ScaleHeight     =   75
      ScaleWidth      =   1125
      TabIndex        =   12
      Top             =   2400
      Width           =   1125
   End
   Begin VB.Line Line5 
      BorderColor     =   &H00FFFFFF&
      X1              =   3690
      X2              =   3690
      Y1              =   2580
      Y2              =   2640
   End
   Begin VB.Line Line4 
      BorderColor     =   &H00FFFFFF&
      X1              =   3420
      X2              =   3420
      Y1              =   2580
      Y2              =   2640
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FFFFFF&
      X1              =   3150
      X2              =   3150
      Y1              =   2580
      Y2              =   2640
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   3975
      X2              =   3975
      Y1              =   2580
      Y2              =   2640
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFFFFF&
      X1              =   2880
      X2              =   2880
      Y1              =   2580
      Y2              =   2640
   End
   Begin VB.Label lbltrail 
      Alignment       =   2  'Center
      BackColor       =   &H00800000&
      Caption         =   "6"
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
      TabIndex        =   10
      Top             =   2325
      Width           =   300
   End
   Begin VB.Label lblhidetrail 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "hide mouse trails"
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
      TabIndex        =   9
      Top             =   2910
      Width           =   3285
   End
   Begin VB.Shape Shape7 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   480
      Top             =   2880
      Width           =   3345
   End
   Begin VB.Label lblsettrail 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "set mouse trail to:"
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
      Top             =   2310
      Width           =   1725
   End
   Begin VB.Shape Shape6 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   480
      Top             =   2280
      Width           =   1785
   End
   Begin VB.Label lblstop 
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
      Height          =   240
      Left            =   3030
      TabIndex        =   7
      Top             =   1710
      Width           =   765
   End
   Begin VB.Shape Shape5 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   3000
      Top             =   1680
      Width           =   825
   End
   Begin VB.Label lblcontrol 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "move/control mouse"
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
      TabIndex        =   6
      Top             =   1710
      Width           =   2085
   End
   Begin VB.Shape Shape4 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   480
      Top             =   1680
      Width           =   2145
   End
   Begin VB.Label lblshow 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "show mouse"
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
      TabIndex        =   5
      Top             =   1110
      Width           =   1365
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   2400
      Top             =   1080
      Width           =   1425
   End
   Begin VB.Label lblhide 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "hide mouse"
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
      TabIndex        =   4
      Top             =   1110
      Width           =   1365
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   480
      Top             =   1080
      Width           =   1425
   End
   Begin VB.Label lblrestore 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "restore buttons"
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
      TabIndex        =   3
      Top             =   510
      Width           =   1365
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   2400
      Top             =   480
      Width           =   1425
   End
   Begin VB.Label lblreverse 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "reverse buttons"
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
      TabIndex        =   2
      Top             =   510
      Width           =   1365
   End
   Begin VB.Shape Shape11 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   480
      Top             =   480
      Width           =   1425
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
      Caption         =   "mouse manager"
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
Attribute VB_Name = "frmMouse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer
Public SlideFlag
Public IX, IY, TX, TY, FX, FY

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreverse.BackColor = &H8
lblrestore.BackColor = &H8
lblhide.BackColor = &H8
lblshow.BackColor = &H8
lblcontrol.BackColor = &H8
lblsettrail.BackColor = &H8
lblhidetrail.BackColor = &H8
lblstop.BackColor = &H8
End Sub

Private Sub Image1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
 If SlideFlag = False Then
        IX = X: FX = image1.Left
        TX = Screen.TwipsPerPixelX
        SlideFlag = True
    End If
End Sub

Private Sub Image1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 If SlideFlag = True Then
        pos = FX + (X - IX) / TX
        If pos < 2820 Then pos = 2820
        If pos > 3920 Then pos = 3920
        FX = pos: image1.Left = pos
    End If
    If image1.Left >= 2820 Then
    lbltrail.Caption = "2"
    End If
    If image1.Left >= 2960 Then
    lbltrail.Caption = "3"
    End If
     If image1.Left >= 3090 Then
    lbltrail.Caption = "4"
    End If
    If image1.Left >= 3230 Then
    lbltrail.Caption = "5"
    End If
    If image1.Left >= 3360 Then
    lbltrail.Caption = "6"
    End If
    If image1.Left >= 3500 Then
    lbltrail.Caption = "7"
    End If
    If image1.Left >= 3630 Then
    lbltrail.Caption = "8"
    End If
    If image1.Left >= 3780 Then
    lbltrail.Caption = "9"
    End If
    If image1.Left >= 3920 Then
    lbltrail.Caption = "10"
    End If
   End Sub

Private Sub Image1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  SlideFlag = False
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
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
cmdX.ForeColor = &HC00000
End Sub

Private Sub lblreverse_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreverse.BackColor = &HFFC0C0
End Sub

Private Sub lblreverse_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreverse.BackColor = &H800000
End Sub

Private Sub lblrestore_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestore.BackColor = &HFFC0C0
End Sub

Private Sub lblrestore_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestore.BackColor = &H800000
End Sub

Private Sub lblhide_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhide.BackColor = &HFFC0C0
End Sub

Private Sub lblhide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhide.BackColor = &H800000
End Sub

Private Sub lblshow_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshow.BackColor = &HFFC0C0
End Sub

Private Sub lblshow_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblshow.BackColor = &H800000
End Sub

Private Sub lblcontrol_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcontrol.BackColor = &HFFC0C0
End Sub

Private Sub lblcontrol_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcontrol.BackColor = &H800000
End Sub

Private Sub lblsettrail_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsettrail.BackColor = &HFFC0C0
End Sub

Private Sub lblsettrail_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsettrail.BackColor = &H800000
End Sub

Private Sub lblhidetrail_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidetrail.BackColor = &HFFC0C0
End Sub

Private Sub lblhidetrail_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhidetrail.BackColor = &H800000
End Sub

Private Sub lblstop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstop.BackColor = &HFFC0C0
End Sub

Private Sub lblstop_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstop.BackColor = &H800000
End Sub
