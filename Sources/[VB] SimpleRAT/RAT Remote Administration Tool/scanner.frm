VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Frm_scanner 
   BorderStyle     =   0  'None
   Caption         =   "Scanner"
   ClientHeight    =   5865
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8865
   Icon            =   "scanner.frx":0000
   ScaleHeight     =   5865
   ScaleWidth      =   8865
   Begin VB.PictureBox Picture2 
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      Height          =   5895
      Left            =   0
      ScaleHeight     =   5835
      ScaleWidth      =   8835
      TabIndex        =   21
      Top             =   0
      Width           =   8895
      Begin MSWinsockLib.Winsock socknwscan 
         Left            =   7320
         Top             =   2760
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.Timer tmrnwscan 
         Interval        =   50
         Left            =   6480
         Top             =   2760
      End
      Begin VB.ListBox lstnwscan 
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
         Height          =   3930
         Left            =   6120
         MultiSelect     =   2  'Extended
         TabIndex        =   35
         ToolTipText     =   "available windows computers..!"
         Top             =   960
         Width           =   2415
      End
      Begin MSWinsockLib.Winsock socksys 
         Left            =   4080
         Top             =   2760
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.Timer timesys 
         Interval        =   50
         Left            =   3480
         Top             =   2760
      End
      Begin MSWinsockLib.Winsock sockport 
         Left            =   1320
         Top             =   2760
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.Timer timeport 
         Interval        =   500
         Left            =   720
         Top             =   2760
      End
      Begin VB.TextBox txtsysip 
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
         Left            =   5280
         MaxLength       =   3
         TabIndex        =   15
         Text            =   "1"
         ToolTipText     =   "IP To Scan"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtsysip 
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
         Left            =   4920
         MaxLength       =   3
         TabIndex        =   14
         Text            =   "0"
         ToolTipText     =   "IP To Scan"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtsysip 
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
         Left            =   4560
         MaxLength       =   3
         TabIndex        =   13
         Text            =   "0"
         ToolTipText     =   "IP To Scan"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtportendip 
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
         Left            =   2280
         MaxLength       =   3
         TabIndex        =   7
         Text            =   "60"
         ToolTipText     =   "Ending IP Address"
         Top             =   1680
         Width           =   375
      End
      Begin VB.TextBox txtportendip 
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
         Left            =   1920
         MaxLength       =   3
         TabIndex        =   6
         Text            =   "120"
         ToolTipText     =   "Ending IP Address"
         Top             =   1680
         Width           =   375
      End
      Begin VB.TextBox txtportendip 
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
         Left            =   1560
         MaxLength       =   3
         TabIndex        =   5
         Text            =   "168"
         ToolTipText     =   "Ending IP Address"
         Top             =   1680
         Width           =   375
      End
      Begin VB.TextBox txtportstartip 
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
         Left            =   2280
         MaxLength       =   3
         TabIndex        =   3
         Text            =   "55"
         ToolTipText     =   "Starting IP Address"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtportstartip 
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
         Left            =   1920
         MaxLength       =   3
         TabIndex        =   2
         Text            =   "120"
         ToolTipText     =   "Starting IP Address"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtportstartip 
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
         Left            =   1560
         MaxLength       =   3
         TabIndex        =   1
         Text            =   "168"
         ToolTipText     =   "Starting IP Address"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtsysportto 
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
         Left            =   4680
         TabIndex        =   17
         Text            =   "32767"
         ToolTipText     =   "Ending Port to Scan In a Computer"
         Top             =   2160
         Width           =   975
      End
      Begin VB.TextBox txtsysportfrom 
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
         Left            =   4680
         TabIndex        =   16
         Text            =   "1"
         ToolTipText     =   "Starting Port to Scan In a Computer"
         Top             =   1680
         Width           =   975
      End
      Begin VB.TextBox txtsysip 
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
         Left            =   4200
         MaxLength       =   3
         TabIndex        =   12
         Text            =   "127"
         ToolTipText     =   "IP To Scan"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtportno 
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
         Left            =   1680
         TabIndex        =   8
         Text            =   "3333"
         ToolTipText     =   "Port To Scan In Every IP"
         Top             =   2160
         Width           =   975
      End
      Begin VB.TextBox txtportstartip 
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
         Left            =   1200
         MaxLength       =   3
         TabIndex        =   0
         Text            =   "192"
         ToolTipText     =   "Starting IP Address"
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtportendip 
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
         Left            =   1200
         MaxLength       =   3
         TabIndex        =   4
         Text            =   "192"
         ToolTipText     =   "Ending IP Address"
         Top             =   1680
         Width           =   375
      End
      Begin VB.TextBox txtportresult 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2295
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         TabStop         =   0   'False
         ToolTipText     =   "IP's Having the Port Opened"
         Top             =   2640
         Width           =   2415
      End
      Begin VB.TextBox txtsysresult 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2295
         Left            =   3120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         TabStop         =   0   'False
         ToolTipText     =   "Available Open Ports"
         Top             =   2640
         Width           =   2535
      End
      Begin VB.Label lblscancontrol 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "-"
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
         Index           =   1
         Left            =   8235
         MouseIcon       =   "scanner.frx":08CA
         MousePointer    =   99  'Custom
         TabIndex        =   34
         ToolTipText     =   "Mimize RAT scanner"
         Top             =   0
         Width           =   255
      End
      Begin VB.Label lblscancontrol 
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
         Left            =   8520
         MouseIcon       =   "scanner.frx":0BD4
         MousePointer    =   99  'Custom
         TabIndex        =   33
         ToolTipText     =   "Close RAT scanner"
         Top             =   0
         Width           =   255
      End
      Begin VB.Label Label19 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "network scan"
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
         Left            =   6015
         TabIndex        =   32
         Top             =   610
         Width           =   2600
      End
      Begin VB.Label Label18 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "system scan"
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
         Left            =   3025
         TabIndex        =   31
         Top             =   610
         Width           =   2700
      End
      Begin VB.Label Label17 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "port scan"
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
         Left            =   135
         TabIndex        =   30
         Top             =   625
         Width           =   2600
      End
      Begin VB.Line Line22 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   6000
         Y1              =   600
         Y2              =   5520
      End
      Begin VB.Line Line21 
         BorderColor     =   &H80000005&
         X1              =   8640
         X2              =   8640
         Y1              =   5520
         Y2              =   600
      End
      Begin VB.Line Line20 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   5520
         Y2              =   5520
      End
      Begin VB.Line Line19 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Line Line18 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   3000
         Y1              =   600
         Y2              =   5520
      End
      Begin VB.Line Line17 
         BorderColor     =   &H80000005&
         X1              =   5760
         X2              =   5760
         Y1              =   5520
         Y2              =   600
      End
      Begin VB.Line Line16 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5760
         Y1              =   5520
         Y2              =   5520
      End
      Begin VB.Line Line15 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5760
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Line Line14 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   120
         Y1              =   600
         Y2              =   5520
      End
      Begin VB.Line Line13 
         BorderColor     =   &H80000005&
         X1              =   2760
         X2              =   2760
         Y1              =   5520
         Y2              =   600
      End
      Begin VB.Line Line12 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   5520
         Y2              =   5520
      End
      Begin VB.Line Line11 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   " Scanner"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   255
         Left            =   0
         TabIndex        =   29
         ToolTipText     =   "Use Any One Scanner At A Time"
         Top             =   0
         Width           =   8200
      End
      Begin VB.Label Label24 
         BackColor       =   &H00404040&
         Caption         =   "PORT To :"
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
         TabIndex        =   28
         Top             =   2160
         Width           =   975
      End
      Begin VB.Label Label25 
         BackColor       =   &H00404040&
         Caption         =   "PORT From :"
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
         TabIndex        =   27
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Label Label26 
         BackColor       =   &H00404040&
         Caption         =   "System IP :"
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
         TabIndex        =   26
         Top             =   1200
         Width           =   975
      End
      Begin VB.Label Label27 
         BackColor       =   &H00404040&
         Caption         =   "PORT No :"
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
         TabIndex        =   25
         Top             =   2160
         Width           =   975
      End
      Begin VB.Label Label28 
         BackColor       =   &H00404040&
         Caption         =   "END IP :"
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
         TabIndex        =   24
         Top             =   1680
         Width           =   975
      End
      Begin VB.Label Label29 
         BackColor       =   &H00404040&
         Caption         =   "START IP :"
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
         TabIndex        =   23
         Top             =   1200
         Width           =   975
      End
      Begin VB.Label lblportstop 
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
         Left            =   1560
         MouseIcon       =   "scanner.frx":0EDE
         MousePointer    =   99  'Custom
         TabIndex        =   10
         ToolTipText     =   "Stop Scanning"
         Top             =   5160
         Width           =   1095
      End
      Begin VB.Label lblportstart 
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
         Left            =   240
         MouseIcon       =   "scanner.frx":11E8
         MousePointer    =   99  'Custom
         TabIndex        =   9
         ToolTipText     =   "Start Scanning"
         Top             =   5160
         Width           =   1095
      End
      Begin VB.Label lblsysstop 
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
         Left            =   4560
         MouseIcon       =   "scanner.frx":14F2
         MousePointer    =   99  'Custom
         TabIndex        =   19
         ToolTipText     =   "Stop Scanning"
         Top             =   5160
         Width           =   1095
      End
      Begin VB.Label lblsysstart 
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
         Left            =   3120
         MouseIcon       =   "scanner.frx":17FC
         MousePointer    =   99  'Custom
         TabIndex        =   18
         ToolTipText     =   "Start Scanning"
         Top             =   5160
         Width           =   1215
      End
      Begin VB.Label lblnwstart 
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
         Height          =   255
         Left            =   6840
         MouseIcon       =   "scanner.frx":1B06
         MousePointer    =   99  'Custom
         TabIndex        =   22
         ToolTipText     =   "scans the local subnetwork for available windows computers..!"
         Top             =   5160
         Width           =   1095
      End
      Begin VB.Line Line23 
         BorderColor     =   &H80000005&
         X1              =   120
         X2              =   2760
         Y1              =   5040
         Y2              =   5040
      End
      Begin VB.Line Line24 
         BorderColor     =   &H80000005&
         X1              =   3000
         X2              =   5760
         Y1              =   5040
         Y2              =   5040
      End
      Begin VB.Line Line25 
         BorderColor     =   &H80000005&
         X1              =   6000
         X2              =   8640
         Y1              =   5040
         Y2              =   5040
      End
   End
End
Attribute VB_Name = "Frm_scanner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim portstartip, portendip As String
Dim portaction As Integer
Dim portseconds As Boolean
Dim b, c As Integer
Dim a As Boolean
Dim tmrnscan As Boolean


Dim sysaction, sysip, sysseconds As String
Dim sysstartport, sysendport As Integer

Private Sub Form_Load() 'set positon w.r.t. main form
On Error Resume Next
Me.Left = Frm_Main.Left + 1875
Me.Top = Frm_Main.Top + 350
End Sub

'move the scanner
Private Sub Label2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
MousePointer = 5
b = X
c = Y
a = True
End Sub

'move the scanner
Private Sub Label2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
 If a Then
        Me.Move Left + (X - b), Top + (Y - c)
    End If
End Sub

'move the scanner
Private Sub Label2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
MousePointer = 0
a = False
End Sub

Private Sub lblnwstart_Click() 'it starts the network scan
On Error Resume Next
Dim i As Integer
Dim getmyips As String
Dim ip As String

progress = "NETWORK SCAN Started"
lblnwstart.Enabled = False
getmyips = getmyip
lstnwscan.Clear

For i = 1 To 254
ip = getmyips
ip = ip & i
socknwscan.Close
socknwscan.Connect ip, 135
tmrnscan = True
Do While tmrnscan = True
DoEvents
Loop
If socknwscan.State = 7 Then
lstnwscan.AddItem ip
End If
Next i

lblnwstart.Enabled = True
progress = "NETWORK SCAN Finished"
End Sub

Private Sub lblscancontrol_Click(Index As Integer)
On Error Resume Next
Select Case Index
    Case 1 'minimize
        Frm_scanner.WindowState = 1
    Case 0 'close
        If MsgBox("ARE YOU SURE TO STOP SCAN AND EXIT", vbExclamation + vbYesNo, "RAT - ALERT") = vbYes Then
            lblportstop_Click
            lblsysstop_Click
            Unload Frm_scanner
        End If
End Select
End Sub

Private Sub lblportstart_Click() 'start port scan
On Error Resume Next
progress = "PORT SCAN Started"
portaction = 1
If Val(txtportno.Text) <= 32767 Then 'scan if port less or equal 32767
    scanport
Else
    MsgBox "Scan Port Between 1 to 32767", , "RAT - ALERT"
End If
End Sub

Private Sub lblportstop_Click() 'stop port scan
On Error Resume Next
progress = "PORT SCAN Stopped"
portaction = 0
End Sub

Private Sub lblsysstart_Click() 'start sys scan
On Error Resume Next
progress = "SYSTEM SCAN Started"
sysaction = 1
If Val(txtsysportto.Text) <= 32767 Then
    scansys
Else
    MsgBox "Scan Port Between 1 to 32767", , "RAT - ALERT"
End If
End Sub
Private Sub lblsysstop_Click() 'system scan stop
On Error Resume Next
progress = "SYSTEM SCAN Stopped"
sysaction = 0
End Sub

Private Sub scanport() 'scans for opened port
On Error Resume Next
portstartip = " "
portendip = txtportendip(0) & "." & txtportendip(1) & "." & txtportendip(2) & "." & txtportendip(3)
Do While Not portstartip = portendip
    If portaction = 0 Then
        txtportresult.Text = txtportresult.Text & vbNewLine & "----------STOPPED--------" & vbNewLine
        Exit Do
    End If
    portstartip = txtportstartip(0) & "." & txtportstartip(1) & "." & txtportstartip(2) & "." & txtportstartip(3)
    sockport.Close
    sockport.Connect portstartip, txtportno
    portseconds = 0
    Do While portseconds = 0
        DoEvents
    Loop
    If sockport.State = 7 Then
        txtportresult.Text = txtportresult.Text & portstartip & vbNewLine
    End If
    txtportstartip(3) = txtportstartip(3) + 1
    If txtportstartip(3) = "256" Then
        txtportstartip(3) = "1"
        txtportstartip(2) = txtportstartip(2) + 1
        If txtportstartip(2) = "256" Then
            txtportstartip(2) = "1"
            txtportstartip(1) = txtportstartip(1) + 1
            If txtportstartip(1) = "256" Then
                txtportstartip(1) = "1"
                txtportstartip(0) = txtportstartip(0) + 1
                If txtportstartip(0) = "256" Then
                    Exit Sub
                End If
            End If
        End If
    End If
Loop
If portstartip = portendip Then txtportstartip(3) = txtportstartip(3) - 1 'reduce the last ip number to one
End Sub

Private Sub timeport_Timer() 'timer for port scan
On Error Resume Next
portseconds = 1
End Sub

Private Sub timesys_Timer() 'timer for system scan
On Error Resume Next
sysseconds = 1
End Sub

Private Sub tmrnwscan_Timer() 'timer for netwok scanning
On Error Resume Next
tmrnscan = False
End Sub

Private Sub scansys() 'scan system
On Error Resume Next
sysip = txtsysip(0) & "." & txtsysip(1) & "." & txtsysip(2) & "." & txtsysip(3)
sysstartport = Val(txtsysportfrom.Text)
sysendport = Val(txtsysportto.Text)
Do While Not sysstartport = sysendport
    If sysaction = 0 Then
        txtsysresult.Text = txtsysresult.Text & vbNewLine & "----------STOPPED---------" & vbNewLine
        Exit Do
    End If
    socksys.Close
    socksys.Connect sysip, sysstartport
    sysseconds = 0
    Do While sysseconds = 0
        DoEvents
    Loop
    If socksys.State = 7 Then
        txtsysresult.Text = txtsysresult.Text & sysstartport & vbNewLine
    End If
    sysstartport = sysstartport + 1
    txtsysportfrom.Text = txtsysportfrom + 1
Loop
End Sub

Function getmyip() As String 'it returns our ip with out class D
On Error Resume Next
If InStr(1, Right(socknwscan.LocalIP, 2), ".") = 1 Then
    getmyip = Mid(socknwscan.LocalIP, 1, Len(socknwscan.LocalIP) - 1)
ElseIf InStr(1, Right(socknwscan.LocalIP, 3), ".") = 1 Then
    getmyip = Mid(socknwscan.LocalIP, 1, Len(socknwscan.LocalIP) - 2)
ElseIf InStr(1, Right(socknwscan.LocalIP, 4), ".") = 1 Then
    getmyip = Mid(socknwscan.LocalIP, 1, Len(socknwscan.LocalIP) - 3)
End If
End Function

Private Sub txtportstartip_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 13 Then lblportstart_Click
End Sub

Private Sub txtsysip_gotfocus(Index As Integer)
txtsysip(Index).SelStart = 0
txtsysip(Index).SelLength = 3
End Sub

Private Sub txtsysip_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 13 Then lblsysstart_Click
End Sub

Private Sub txtsysportfrom_GotFocus()
txtsysportfrom.SelStart = 0
txtsysportfrom.SelLength = Val(Len(txtsysportfrom.Text))
End Sub

Private Sub txtsysportfrom_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblsysstart_Click
End Sub

Private Sub txtsysportto_GotFocus()
txtsysportto.SelStart = 0
txtsysportto.SelLength = Val(Len(txtsysportto.Text))
End Sub

Private Sub txtsysportto_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblsysstart_Click
End Sub

Private Sub lblportstart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblportstart.BorderStyle = 1
End Sub

Private Sub lblportstart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblportstart.BorderStyle = 0
End Sub

Private Sub lblportstop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblportstop.BorderStyle = 1
End Sub

Private Sub lblportstop_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblportstop.BorderStyle = 0
End Sub

Private Sub lblnwstart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnwstart.BorderStyle = 1
End Sub

Private Sub lblnwstart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnwstart.BorderStyle = 0
End Sub

Private Sub lblnwstop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnwstop.BorderStyle = 1
End Sub

Private Sub lblnwstop_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblnwstop.BorderStyle = 0
End Sub

Private Sub lblscancontrol_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscancontrol(Index).BorderStyle = 1
End Sub

Private Sub lblscancontrol_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblscancontrol(Index).BorderStyle = 0
End Sub

Private Sub lblsysstart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsysstart.BorderStyle = 1
End Sub

Private Sub lblsysstart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsysstart.BorderStyle = 0
End Sub

Private Sub lblsysstop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsysstop.BorderStyle = 1
End Sub

Private Sub lblsysstop_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsysstop.BorderStyle = 0
End Sub

Private Sub txtportendip_GotFocus(Index As Integer)
txtportendip(Index).SelStart = 0
txtportendip(Index).SelLength = 3
End Sub

Private Sub txtportendip_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 13 Then lblportstart_Click
End Sub

Private Sub txtportno_GotFocus()
txtportno.SelStart = 0
txtportno.SelLength = Val(Len(txtportno.Text))
End Sub

Private Sub txtportno_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then lblportstart_Click
End Sub

Private Sub txtportstartip_GotFocus(Index As Integer)
txtportstartip(Index).SelStart = 0
txtportstartip(Index).SelLength = 3
End Sub



