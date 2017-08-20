VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmScreenSave 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "storm v1.0"
   ClientHeight    =   4530
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4335
   LinkTopic       =   "Form1"
   ScaleHeight     =   4530
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtattributes 
      Height          =   285
      Left            =   2160
      TabIndex        =   42
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.PictureBox piclist 
      BackColor       =   &H80000012&
      BorderStyle     =   0  'None
      Height          =   15
      Left            =   840
      ScaleHeight     =   15
      ScaleWidth      =   2055
      TabIndex        =   6
      Top             =   1095
      Visible         =   0   'False
      Width           =   2055
      Begin VB.Label lblcourier 
         BackColor       =   &H00FF8080&
         Caption         =   "Courier New"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   0
         TabIndex        =   9
         Top             =   480
         Width           =   2055
      End
      Begin VB.Label lbltimesnew 
         BackColor       =   &H00FF8080&
         Caption         =   "Times New Roman"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   0
         TabIndex        =   8
         Top             =   240
         Width           =   2055
      End
      Begin VB.Label lblarial 
         BackColor       =   &H00FF8080&
         Caption         =   "Arial"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   0
         TabIndex        =   7
         Top             =   0
         Width           =   2055
      End
   End
   Begin VB.PictureBox picrandom 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   200
      Left            =   480
      ScaleHeight     =   165
      ScaleWidth      =   225
      TabIndex        =   41
      Top             =   2440
      Width           =   255
      Begin VB.Shape optionrandom 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   105
         Left            =   45
         Shape           =   3  'Circle
         Top             =   30
         Visible         =   0   'False
         Width           =   135
      End
      Begin VB.Shape shprandom 
         BackColor       =   &H00000000&
         BorderColor     =   &H00808080&
         FillStyle       =   0  'Solid
         Height          =   165
         Left            =   0
         Shape           =   3  'Circle
         Top             =   0
         Width           =   225
      End
   End
   Begin VB.PictureBox piccentre 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   200
      Left            =   480
      ScaleHeight     =   165
      ScaleWidth      =   225
      TabIndex        =   40
      Top             =   2160
      Width           =   255
      Begin VB.Shape optioncentre 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   105
         Left            =   45
         Shape           =   3  'Circle
         Top             =   30
         Width           =   135
      End
      Begin VB.Shape shpcentre 
         BackColor       =   &H00000000&
         BorderColor     =   &H00808080&
         FillStyle       =   0  'Solid
         Height          =   165
         Left            =   0
         Shape           =   3  'Circle
         Top             =   0
         Width           =   225
      End
   End
   Begin VB.PictureBox picbold 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   200
      Left            =   3360
      ScaleHeight     =   165
      ScaleWidth      =   225
      TabIndex        =   39
      Top             =   1320
      Width           =   255
      Begin VB.Shape optionbold 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   105
         Left            =   45
         Shape           =   1  'Square
         Top             =   30
         Visible         =   0   'False
         Width           =   135
      End
      Begin VB.Shape shpbold 
         BackColor       =   &H00000000&
         BorderColor     =   &H00808080&
         FillStyle       =   0  'Solid
         Height          =   165
         Left            =   0
         Shape           =   1  'Square
         Top             =   0
         Width           =   225
      End
   End
   Begin VB.PictureBox picitalic 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   200
      Left            =   2580
      ScaleHeight     =   165
      ScaleWidth      =   225
      TabIndex        =   38
      Top             =   1320
      Width           =   255
      Begin VB.Shape optionitalic 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   105
         Left            =   45
         Shape           =   1  'Square
         Top             =   30
         Visible         =   0   'False
         Width           =   135
      End
      Begin VB.Shape shpitalic 
         BackColor       =   &H00000000&
         BorderColor     =   &H00808080&
         FillStyle       =   0  'Solid
         Height          =   165
         Left            =   0
         Shape           =   1  'Square
         Top             =   0
         Width           =   225
      End
   End
   Begin VB.PictureBox picstrike 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   200
      Left            =   1440
      ScaleHeight     =   165
      ScaleWidth      =   225
      TabIndex        =   37
      Top             =   1320
      Width           =   255
      Begin VB.Shape optionstrike 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   105
         Left            =   45
         Shape           =   1  'Square
         Top             =   30
         Visible         =   0   'False
         Width           =   135
      End
      Begin VB.Shape shpstrike 
         BackColor       =   &H00000000&
         BorderColor     =   &H00808080&
         FillStyle       =   0  'Solid
         Height          =   165
         Left            =   0
         Shape           =   1  'Square
         Top             =   0
         Width           =   225
      End
   End
   Begin VB.PictureBox picunder 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   200
      Left            =   240
      ScaleHeight     =   165
      ScaleWidth      =   225
      TabIndex        =   36
      Top             =   1320
      Width           =   255
      Begin VB.Shape optionunder 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   105
         Left            =   45
         Shape           =   1  'Square
         Top             =   30
         Visible         =   0   'False
         Width           =   135
      End
      Begin VB.Shape shpunder 
         BackColor       =   &H00000000&
         BorderColor     =   &H00808080&
         FillStyle       =   0  'Solid
         Height          =   165
         Left            =   0
         Shape           =   1  'Square
         Top             =   0
         Width           =   225
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox txtscrollspeed 
      Height          =   285
      Left            =   2520
      TabIndex        =   26
      Text            =   "30"
      Top             =   2760
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.PictureBox image1 
      BorderStyle     =   0  'None
      Height          =   260
      Left            =   3040
      MousePointer    =   10  'Up Arrow
      Picture         =   "frmScreenSave.frx":0000
      ScaleHeight     =   255
      ScaleWidth      =   135
      TabIndex        =   24
      Top             =   2200
      Width           =   140
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   80
      Left            =   2340
      ScaleHeight     =   75
      ScaleWidth      =   1515
      TabIndex        =   25
      Top             =   2280
      Width           =   1510
   End
   Begin VB.Timer tmrsizeup 
      Enabled         =   0   'False
      Interval        =   150
      Left            =   1800
      Top             =   3240
   End
   Begin VB.Timer tmrsizedown 
      Enabled         =   0   'False
      Interval        =   150
      Left            =   1800
      Top             =   2760
   End
   Begin VB.TextBox txtsize 
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   3120
      TabIndex        =   16
      Text            =   "15"
      Top             =   840
      Width           =   495
   End
   Begin VB.TextBox txtfont 
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   260
      Left            =   840
      TabIndex        =   5
      Text            =   "Arial"
      Top             =   840
      Width           =   1900
   End
   Begin VB.TextBox txttext 
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   260
      Left            =   840
      TabIndex        =   2
      Text            =   "enter your text here"
      Top             =   360
      Width           =   3120
   End
   Begin VB.PictureBox piccombodown 
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   2730
      ScaleHeight     =   255
      ScaleWidth      =   165
      TabIndex        =   10
      Top             =   840
      Width           =   165
      Begin VB.Label lbldown 
         BackColor       =   &H00FF8080&
         BackStyle       =   0  'Transparent
         Caption         =   "€"
         BeginProperty Font 
            Name            =   "Wingdings 3"
            Size            =   9
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   0
         TabIndex        =   11
         Top             =   0
         Width           =   165
      End
   End
   Begin VB.PictureBox piccomboup 
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   2730
      ScaleHeight     =   255
      ScaleWidth      =   165
      TabIndex        =   12
      Top             =   840
      Width           =   165
      Begin VB.Label lblup 
         BackColor       =   &H00FF8080&
         BackStyle       =   0  'Transparent
         Caption         =   "~"
         BeginProperty Font 
            Name            =   "Wingdings 3"
            Size            =   9
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   135
         Left            =   0
         TabIndex        =   13
         Top             =   50
         Width           =   165
      End
   End
   Begin VB.Line Line9 
      BorderColor     =   &H00FFFFFF&
      X1              =   2674
      X2              =   2674
      Y1              =   2520
      Y2              =   2580
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00FFFFFF&
      X1              =   2400
      X2              =   2400
      Y1              =   2520
      Y2              =   2580
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   0
      Y1              =   0
      Y2              =   60
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   3508
      X2              =   3508
      Y1              =   2520
      Y2              =   2580
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FFFFFF&
      X1              =   3230
      X2              =   3230
      Y1              =   2520
      Y2              =   2580
   End
   Begin VB.Line Line4 
      BorderColor     =   &H00FFFFFF&
      X1              =   2952
      X2              =   2952
      Y1              =   2520
      Y2              =   2580
   End
   Begin VB.Line Line5 
      BorderColor     =   &H00FFFFFF&
      X1              =   3786
      X2              =   3786
      Y1              =   2520
      Y2              =   2580
   End
   Begin VB.Label Label9 
      BackColor       =   &H00000000&
      Caption         =   "scrolling speed:"
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
      TabIndex        =   35
      Top             =   1800
      Width           =   1365
   End
   Begin VB.Label labelbackcolor 
      BackColor       =   &H000000FF&
      Caption         =   "255 255 255"
      Height          =   255
      Left            =   3240
      TabIndex        =   34
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label textcolor 
      BackColor       =   &H000000FF&
      Caption         =   "255 0 0"
      Height          =   255
      Left            =   600
      TabIndex        =   33
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Shape Shape12 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   2280
      Top             =   3960
      Width           =   1665
   End
   Begin VB.Label lblrunsaver 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "run screensaver"
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
      Left            =   2310
      TabIndex        =   32
      Top             =   3990
      Width           =   1605
   End
   Begin VB.Shape Shape11 
      BorderColor     =   &H00FF8080&
      Height          =   300
      Left            =   480
      Top             =   3960
      Width           =   1425
   End
   Begin VB.Label lblsavesettings 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "save settings"
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
      TabIndex        =   31
      Top             =   3990
      Width           =   1365
   End
   Begin VB.Label label12 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "background color:"
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
      Left            =   1800
      TabIndex        =   30
      Top             =   3120
      Width           =   1575
   End
   Begin VB.Label Label11 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "text color:"
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
      Left            =   120
      TabIndex        =   29
      Top             =   3120
      Width           =   855
   End
   Begin VB.Label lblbackcolor 
      BackColor       =   &H00FFFFFF&
      Height          =   405
      Left            =   3525
      TabIndex        =   28
      Top             =   3045
      Width           =   525
   End
   Begin VB.Shape Shape10 
      BorderColor     =   &H00FF8080&
      Height          =   495
      Left            =   3480
      Top             =   3000
      Width           =   615
   End
   Begin VB.Label lbltextcolor 
      BackColor       =   &H000000FF&
      Height          =   405
      Left            =   1125
      TabIndex        =   27
      Top             =   3045
      Width           =   525
   End
   Begin VB.Shape Shape9 
      BorderColor     =   &H00FF8080&
      Height          =   495
      Left            =   1080
      Top             =   3000
      Width           =   615
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   " random"
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
      Left            =   720
      TabIndex        =   23
      Top             =   2415
      Width           =   855
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   " centered"
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
      Left            =   720
      TabIndex        =   22
      Top             =   2115
      Width           =   855
   End
   Begin VB.Label Label6 
      BackColor       =   &H00000000&
      Caption         =   "text position:"
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
      Left            =   360
      TabIndex        =   21
      Top             =   1800
      Width           =   1125
   End
   Begin VB.Label Label5 
      BackColor       =   &H00000000&
      Caption         =   " bold"
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
      Left            =   3600
      TabIndex        =   20
      Top             =   1290
      Width           =   420
   End
   Begin VB.Label Label4 
      BackColor       =   &H00000000&
      Caption         =   " italic"
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
      Left            =   2835
      TabIndex        =   19
      Top             =   1290
      Width           =   435
   End
   Begin VB.Label Label3 
      BackColor       =   &H00000000&
      Caption         =   " strikeout"
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
      Left            =   1680
      TabIndex        =   18
      Top             =   1290
      Width           =   795
   End
   Begin VB.Label Label2 
      BackColor       =   &H00000000&
      Caption         =   " underline"
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
      Left            =   480
      TabIndex        =   17
      Top             =   1290
      Width           =   855
   End
   Begin VB.Label lblsizedown 
      BackColor       =   &H00000000&
      Caption         =   "¤"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   9.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   195
      Left            =   3720
      TabIndex        =   15
      Top             =   960
      Width           =   195
   End
   Begin VB.Label lblsizeup 
      BackColor       =   &H00000000&
      Caption         =   "£"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   9.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   195
      Left            =   3720
      TabIndex        =   14
      Top             =   720
      Width           =   195
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "font:"
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
      Left            =   360
      TabIndex        =   4
      Top             =   840
      Width           =   405
   End
   Begin VB.Label Label19 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "text:"
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
      Left            =   360
      TabIndex        =   3
      Top             =   360
      Width           =   405
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
      TabIndex        =   1
      ToolTipText     =   "Close"
      Top             =   15
      Width           =   240
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "screensaver manager"
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
      TabIndex        =   0
      Top             =   0
      Width           =   4335
   End
End
Attribute VB_Name = "frmScreenSave"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer
Public SlideFlag
Public IX, IY, TX, TY, FX, FY

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsavesettings.BackColor = &H8
lblrunsaver.BackColor = &H8
shpunder.FillColor = &H8
shpstrike.FillColor = &H8
shpitalic.FillColor = &H8
shpbold.FillColor = &H8
shprandom.FillColor = &H8
shpcentre.FillColor = &H8
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
        If pos < 2340 Then pos = 2340
        If pos > 3740 Then pos = 3740
        FX = pos: image1.Left = pos
    End If
    If image1.Left >= 2340 Then
      txtscrollspeed.Text = "10"
      End If
      If image1.Left >= 2610 Then
      txtscrollspeed.Text = "20"
      End If
      If image1.Left >= 2890 Then
      txtscrollspeed.Text = "30"
      End If
      If image1.Left >= 3170 Then
      txtscrollspeed.Text = "40"
      End If
      If image1.Left >= 3450 Then
      txtscrollspeed.Text = "50"
      End If
      If image1.Left >= 3720 Then
      txtscrollspeed.Text = "60"
      End If
End Sub

Private Sub Image1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  SlideFlag = False
End Sub

Private Sub Form_Load()
piclist.Height = 15
End Sub

Private Sub Label2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpunder.FillColor = &HFFC0C0
End Sub

Private Sub Label2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpunder.FillColor = &H800000
shpstrike.FillColor = &H8
shpitalic.FillColor = &H8
shpbold.FillColor = &H8
End Sub

Private Sub Label2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionunder.Visible = False Then
optionunder.Visible = True
Else: optionunder.Visible = False
End If
End Sub

Private Sub Label3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpstrike.FillColor = &HFFC0C0
End Sub

Private Sub Label3_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpstrike.FillColor = &H800000
shpunder.FillColor = &H8
shpitalic.FillColor = &H8
shpbold.FillColor = &H8
End Sub

Private Sub Label3_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionstrike.Visible = False Then
optionstrike.Visible = True
Else: optionstrike.Visible = False
End If
End Sub

Private Sub Label4_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpitalic.FillColor = &HFFC0C0
End Sub

Private Sub Label4_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpitalic.FillColor = &H800000
shpunder.FillColor = &H8
shpstrike.FillColor = &H8
shpbold.FillColor = &H8
End Sub

Private Sub Label4_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionitalic.Visible = False Then
optionitalic.Visible = True
Else: optionitalic.Visible = False
End If
End Sub

Private Sub Label5_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbold.FillColor = &HFFC0C0
End Sub

Private Sub Label5_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbold.FillColor = &H800000
shpunder.FillColor = &H8
shpstrike.FillColor = &H8
shpitalic.FillColor = &H8
End Sub

Private Sub Label5_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionbold.Visible = False Then
optionbold.Visible = True
Else: optionbold.Visible = False
End If
End Sub

Private Sub lblarial_Click()
txtfont.Text = lblarial.Caption
piclist.Height = 15
piclist.Visible = False
piccombodown.Visible = True
piccomboup.Visible = False
End Sub

Private Sub lblarial_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltimesnew.BackColor = &HFF8080
lblcourier.BackColor = &HFF8080
lblarial.BackColor = &H800000
End Sub

Private Sub lblbackcolor_Click()
Call Choose2
End Sub

Private Sub lblbackcolor_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
End Sub

Private Sub lblcourier_Click()
txtfont.Text = lblcourier.Caption
piclist.Height = 15
piclist.Visible = False
piccombodown.Visible = True
piccomboup.Visible = False
End Sub

Private Sub lblcourier_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblarial.BackColor = &HFF8080
lbltimesnew.BackColor = &HFF8080
lblcourier.BackColor = &H800000
End Sub

Private Sub lbldown_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccomboup.Visible = True
piccombodown.Visible = False
End Sub

Private Sub lbldown_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
piclist.Visible = True
piclist.Height = 735
txtfont.SetFocus
txtfont.SelStart = 0
txtfont.SelLength = Len(txtfont.Text)
End Sub

Private Sub lblrunsaver_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "RunScreenSaver"
frmMain.Status.Caption = "running screen saver..."
End If
End Sub

Private Sub lblsavesettings_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.Status.Caption = "setting new screensaver settings..."
frmMain.WS.SendData "SetSaver;" & txttext.Text & ";" & txtfont.Text & ";" & txtsize.Text & ";" & txtscrollspeed.Text & ";" & textcolor.Caption & ";" & labelbackcolor.Caption & ";" & txtattributes.Text
End If
End Sub

Private Sub lblsizedown_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
If txtsize.Text = 1 Then
tmrsizedown.Enabled = False
Else: tmrsizedown.Enabled = True
End If
lblsizedown.ForeColor = &HFFC0C0
End Sub

Private Sub lblsizedown_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
tmrsizedown.Enabled = False
lblsizedown.ForeColor = &HFF8080
End Sub

Private Sub lblsizeup_Mousedown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
If txtsize.Text = 999 Then
tmrsizeup.Enabled = False
Else: tmrsizeup.Enabled = True
End If
lblsizeup.ForeColor = &HFFC0C0
End Sub

Private Sub lblsizeup_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
tmrsizeup.Enabled = False
lblsizeup.ForeColor = &HFF8080
End Sub

Private Sub lbltextcolor_Click()
Call Choose
End Sub

Private Sub lbltextcolor_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
End Sub

Private Sub lbltimesnew_Click()
txtfont.Text = lbltimesnew.Caption
piclist.Height = 15
piclist.Visible = False
piccombodown.Visible = True
piccomboup.Visible = False
End Sub

Private Sub lbltimesnew_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblarial.BackColor = &HFF8080
lblcourier.BackColor = &HFF8080
lbltimesnew.BackColor = &H800000
End Sub

Private Sub picbold_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbold.FillColor = &HFFC0C0
End Sub

Private Sub picbold_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbold.FillColor = &H800000
shpunder.FillColor = &H8
shpstrike.FillColor = &H8
shpitalic.FillColor = &H8
End Sub

Private Sub picbold_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionbold.Visible = False Then
optionbold.Visible = True
Else: optionbold.Visible = False
End If
End Sub

Private Sub piccentre_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpcentre.FillColor = &HFFC0C0
End Sub

Private Sub piccentre_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpcentre.FillColor = &H800000
shprandom.FillColor = &H8
End Sub

Private Sub piccentre_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optioncentre.Visible = True
optionrandom.Visible = False
End Sub

Private Sub label7_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpcentre.FillColor = &HFFC0C0
End Sub

Private Sub label7_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpcentre.FillColor = &H800000
shprandom.FillColor = &H8
End Sub

Private Sub label7_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optioncentre.Visible = True
optionrandom.Visible = False
End Sub

Private Sub piccomboup_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
End Sub

Private Sub piccomboup_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
piclist.Height = 15
piclist.Visible = False
End Sub

Private Sub lblup_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
End Sub

Private Sub lblup_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
piclist.Height = 15
piclist.Visible = False
End Sub

Private Sub picitalic_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpitalic.FillColor = &HFFC0C0
End Sub

Private Sub picitalic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpitalic.FillColor = &H800000
shpunder.FillColor = &H8
shpstrike.FillColor = &H8
shpbold.FillColor = &H8
End Sub

Private Sub picitalic_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionitalic.Visible = False Then
optionitalic.Visible = True
Else: optionitalic.Visible = False
End If
End Sub

Private Sub picrandom_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shprandom.FillColor = &HFFC0C0
End Sub

Private Sub picrandom_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shprandom.FillColor = &H800000
shpcentre.FillColor = &H8
End Sub

Private Sub picrandom_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionrandom.Visible = True
optioncentre.Visible = False
End Sub

Private Sub label8_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shprandom.FillColor = &HFFC0C0
End Sub

Private Sub label8_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shprandom.FillColor = &H800000
shpcentre.FillColor = &H8
End Sub

Private Sub label8_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionrandom.Visible = True
optioncentre.Visible = False
End Sub

Private Sub picstrike_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpstrike.FillColor = &HFFC0C0
End Sub

Private Sub picstrike_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpstrike.FillColor = &H800000
shpunder.FillColor = &H8
shpitalic.FillColor = &H8
shpbold.FillColor = &H8
End Sub

Private Sub picstrike_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionstrike.Visible = False Then
optionstrike.Visible = True
Else: optionstrike.Visible = False
End If
End Sub

Private Sub picunder_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpunder.FillColor = &HFFC0C0
End Sub

Private Sub picunder_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpunder.FillColor = &H800000
shpstrike.FillColor = &H8
shpitalic.FillColor = &H8
shpbold.FillColor = &H8
End Sub

Private Sub picunder_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If optionunder.Visible = False Then
optionunder.Visible = True
Else: optionunder.Visible = False
End If
End Sub

Private Sub tmrsizedown_Timer()
txtsize.Text = txtsize.Text - 1
If txtsize.Text = 1 Then
tmrsizedown.Enabled = False
End If
End Sub

Private Sub tmrsizeup_Timer()
txtsize.Text = txtsize.Text + 1
If txtsize.Text = 999 Then
tmrsizeup.Enabled = False
End If
End Sub

Private Sub title_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
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

Private Sub lblsavesettings_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
lblsavesettings.BackColor = &HFFC0C0
If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "11111"
End If

If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "11101"
End If

If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "11011"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "10111"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "01111"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "00000"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "00001"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "10000"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "01000"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "00100"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "00001"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "00010"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "10110"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "01110"
End If

If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "11100"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "10001"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "01100"
End If

If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "11000"
End If

If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "11001"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "00011"
End If

If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "11110"
End If

If optionunder.Visible = True And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "11010"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "10010"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "10011"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "01010"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "00111"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "01001"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = False And optionbold.Visible = True And optionrandom.Visible = True Then
txtattributes.Text = "01011"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = True Then
txtattributes.Text = "00110"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "10101"
End If

If optionunder.Visible = False And optionstrike.Visible = True And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "01101"
End If

If optionunder.Visible = False And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = True And optionrandom.Visible = False Then
txtattributes.Text = "00101"
End If

If optionunder.Visible = True And optionstrike.Visible = False And optionitalic.Visible = True And optionbold.Visible = False And optionrandom.Visible = False Then
txtattributes.Text = "10100"
End If
End Sub

Private Sub lblsavesettings_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrunsaver.BackColor = &H8
lblsavesettings.BackColor = &H800000
End Sub

Private Sub lblrunsaver_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
lblrunsaver.BackColor = &HFFC0C0
End Sub

Private Sub lblrunsaver_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsavesettings.BackColor = &H8
lblrunsaver.BackColor = &H800000
End Sub

Private Sub txtsize_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
End Sub

Private Sub txttext_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piccombodown.Visible = True
piccomboup.Visible = False
piclist.Height = 15
piclist.Visible = False
End Sub
