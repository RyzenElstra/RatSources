VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FileBrowser 
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   ClientHeight    =   1650
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4815
   ControlBox      =   0   'False
   HasDC           =   0   'False
   Icon            =   "FileBrowser.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1650
   ScaleWidth      =   4815
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CMD1 
      Left            =   2160
      Top             =   1200
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      FontBold        =   -1  'True
      FontName        =   "Tahoma"
   End
   Begin VB.Frame Frame 
      BackColor       =   &H00404040&
      Caption         =   "<<<<<<<<<<<<<<<<  Execute File  >>>>>>>>>>>>>>>>"
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
      Height          =   1215
      Index           =   1
      Left            =   120
      TabIndex        =   10
      Tag             =   "Frm_Shell"
      Top             =   0
      Width           =   4575
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "ShowNa"
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
         Height          =   195
         Index           =   7
         Left            =   3480
         TabIndex        =   19
         Tag             =   "8"
         ToolTipText     =   "Show the opened window in its current state but do not activate it."
         Top             =   960
         Width           =   975
      End
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "MinNoActive"
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
         Height          =   195
         Index           =   6
         Left            =   2160
         TabIndex        =   18
         Tag             =   "7"
         ToolTipText     =   "Show the opened window minimized but do not activate the it."
         Top             =   960
         Width           =   1335
      End
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Minimize"
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
         Height          =   195
         Index           =   5
         Left            =   1080
         TabIndex        =   17
         Tag             =   "6"
         ToolTipText     =   "Minimize the opened window."
         Top             =   960
         Width           =   975
      End
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "SHow"
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
         Height          =   195
         Index           =   4
         Left            =   120
         TabIndex        =   16
         Tag             =   "5"
         ToolTipText     =   "Show the opened window."
         Top             =   960
         Width           =   1095
      End
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "NoActive"
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
         Height          =   195
         Index           =   3
         Left            =   3480
         TabIndex        =   15
         Tag             =   "4"
         ToolTipText     =   "Show the opened window in its most recent size and position but do not activate it."
         Top             =   720
         Width           =   975
      End
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Maximize"
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
         Height          =   195
         Index           =   2
         Left            =   2160
         TabIndex        =   14
         Tag             =   "3"
         ToolTipText     =   "Maximize the opened window."
         Top             =   720
         Width           =   1215
      End
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Normal"
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
         Height          =   195
         Index           =   1
         Left            =   1080
         TabIndex        =   13
         Tag             =   "1"
         ToolTipText     =   "Show the opened window and activate it (as usual)."
         Top             =   720
         Width           =   975
      End
      Begin VB.OptionButton Shell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Hidden"
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
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   12
         Tag             =   "0"
         ToolTipText     =   "Hide the opened window."
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox FileName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
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
         Height          =   420
         Index           =   1
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   11
         Top             =   260
         Width           =   4335
      End
   End
   Begin VB.Frame Frame 
      BackColor       =   &H00404040&
      Caption         =   "<<<<<<<<<<<<<<  Modify Attributes  >>>>>>>>>>>>>>"
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
      Height          =   1215
      Index           =   0
      Left            =   120
      TabIndex        =   6
      Tag             =   "Frm_Attributes"
      Top             =   0
      Width           =   4575
      Begin VB.TextBox FileName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
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
         Height          =   440
         Index           =   0
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   7
         Top             =   260
         Width           =   4335
      End
      Begin VB.CheckBox Attributes 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Normal"
         Enabled         =   0   'False
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
         Index           =   1
         Left            =   120
         TabIndex        =   2
         Top             =   800
         Width           =   975
      End
      Begin VB.CheckBox Attributes 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Hidden"
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
         Index           =   3
         Left            =   2440
         TabIndex        =   4
         Top             =   800
         Width           =   975
      End
      Begin VB.CheckBox Attributes 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Read Only"
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
         Left            =   1160
         TabIndex        =   3
         Top             =   800
         Width           =   1215
      End
      Begin VB.CheckBox Attributes 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "System"
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
         Index           =   4
         Left            =   3480
         TabIndex        =   5
         Top             =   800
         Width           =   975
      End
   End
   Begin VB.Frame Frame 
      BackColor       =   &H00404040&
      Caption         =   "<<<<<<<<<<<<<<<  Copy/Move To  >>>>>>>>>>>>>>>"
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
      Height          =   1215
      Index           =   4
      Left            =   120
      TabIndex        =   33
      Tag             =   "Frm_Search"
      Top             =   0
      Width           =   4575
      Begin VB.OptionButton Copy 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Copy To"
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
         Height          =   195
         Left            =   960
         MaskColor       =   &H00000000&
         TabIndex        =   38
         ToolTipText     =   "Copt The Dource File To Destination File"
         Top             =   600
         Width           =   1455
      End
      Begin VB.TextBox FileName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
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
         Height          =   255
         Index           =   5
         Left            =   720
         TabIndex        =   35
         ToolTipText     =   "Complete File Name Ex. : (C:\NewFile.Exe)"
         Top             =   840
         Width           =   3735
      End
      Begin VB.TextBox FileName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
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
         Height          =   255
         Index           =   4
         Left            =   720
         Locked          =   -1  'True
         TabIndex        =   34
         ToolTipText     =   "The Source FileName"
         Top             =   260
         Width           =   3735
      End
      Begin VB.OptionButton Move 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Move To"
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
         Height          =   195
         Left            =   2640
         MaskColor       =   &H00000000&
         TabIndex        =   39
         ToolTipText     =   "Move The Source File To The Destination File"
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "From :"
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
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   37
         Top             =   260
         Width           =   600
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "To :"
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
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   36
         Top             =   840
         Width           =   600
      End
   End
   Begin VB.Frame Frame 
      BackColor       =   &H00404040&
      Caption         =   "=>                                       Search                                       <="
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   3
      Left            =   120
      TabIndex        =   27
      Tag             =   "Frm_Search"
      Top             =   0
      Width           =   4575
      Begin VB.TextBox FileName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
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
         Height          =   255
         Index           =   3
         Left            =   1920
         TabIndex        =   28
         Top             =   500
         Width           =   2535
      End
      Begin VB.TextBox FileName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
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
         Height          =   255
         Index           =   2
         Left            =   720
         Locked          =   -1  'True
         TabIndex        =   31
         Top             =   260
         Width           =   3735
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Search results will be transfeared automattilcally to the X-Editor and X-DwnManager according to it's data size ."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   4
         Left            =   120
         TabIndex        =   32
         Top             =   770
         Width           =   4340
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Pattern (Ex: *.exe )  :- "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   30
         Top             =   500
         Width           =   1800
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Path :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   29
         Top             =   260
         Width           =   600
      End
   End
   Begin VB.Frame Frame 
      BackColor       =   &H00404040&
      Caption         =   "<<<<<<<<<<<<<<<<   Upload File  >>>>>>>>>>>>>>>>"
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
      Height          =   1215
      Index           =   2
      Left            =   120
      TabIndex        =   20
      Tag             =   "Frm_Upload"
      Top             =   0
      Width           =   4575
      Begin VB.TextBox FromFile 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
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
         Height          =   240
         Left            =   600
         TabIndex        =   0
         Text            =   "Local FileName"
         Top             =   220
         Width           =   3615
      End
      Begin VB.PictureBox ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H00CF843F&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   65
         Left            =   1455
         ScaleHeight     =   60
         ScaleWidth      =   1650
         TabIndex        =   21
         Top             =   1040
         Visible         =   0   'False
         Width           =   1650
      End
      Begin VB.TextBox ToFile 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
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
         Height          =   240
         Left            =   600
         TabIndex        =   1
         Text            =   "Forign FileName"
         Top             =   500
         Width           =   3855
      End
      Begin VB.Label OpenFile 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "..."
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
         Height          =   240
         Left            =   4200
         MouseIcon       =   "FileBrowser.frx":2052
         MousePointer    =   99  'Custom
         TabIndex        =   48
         ToolTipText     =   "Select File..."
         Top             =   220
         Width           =   255
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "From"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   240
         Index           =   0
         Left            =   120
         TabIndex        =   26
         Top             =   220
         Width           =   420
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "To"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   240
         Index           =   1
         Left            =   120
         TabIndex        =   25
         Top             =   500
         Width           =   420
      End
      Begin VB.Shape ProgressBack 
         BorderColor     =   &H00000000&
         Height          =   150
         Left            =   1440
         Top             =   990
         Visible         =   0   'False
         Width           =   1680
      End
      Begin VB.Label SizeIndicator 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0 B"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   1
         Left            =   120
         TabIndex        =   24
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label SizeIndicator 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0 B"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   23
         Top             =   780
         Width           =   1215
      End
      Begin VB.Label State 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Ready"
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
         Height          =   195
         Left            =   1440
         TabIndex        =   22
         Tag             =   "0"
         Top             =   780
         Width           =   1680
      End
      Begin VB.Image UploadButton 
         Appearance      =   0  'Flat
         Height          =   300
         Index           =   2
         Left            =   4070
         Stretch         =   -1  'True
         Tag             =   "Delete"
         ToolTipText     =   "Stop/Cancel"
         Top             =   800
         Width           =   300
      End
      Begin VB.Image UploadButton 
         Appearance      =   0  'Flat
         Height          =   300
         Index           =   1
         Left            =   3640
         Stretch         =   -1  'True
         Tag             =   "Pause"
         ToolTipText     =   "Pause"
         Top             =   800
         Width           =   300
      End
      Begin VB.Image UploadButton 
         Appearance      =   0  'Flat
         Height          =   300
         Index           =   0
         Left            =   3240
         Stretch         =   -1  'True
         Tag             =   "Start"
         ToolTipText     =   "Start"
         Top             =   800
         Width           =   300
      End
   End
   Begin VB.Frame Frame 
      BackColor       =   &H00404040&
      Caption         =   "<<<<<<<<<<<<<<<<<  New Task  >>>>>>>>>>>>>>>>>"
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
      Height          =   1215
      Index           =   5
      Left            =   120
      TabIndex        =   40
      Tag             =   "Frm_Shell"
      Top             =   0
      Width           =   4575
      Begin VB.TextBox FileName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
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
         Height          =   285
         Index           =   6
         Left            =   120
         TabIndex        =   42
         Top             =   240
         Width           =   4335
      End
      Begin VB.OptionButton NTShell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Hidden"
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
         Height          =   195
         Index           =   0
         Left            =   120
         MaskColor       =   &H00000000&
         TabIndex        =   47
         Tag             =   "0"
         ToolTipText     =   "Hide the opened window."
         Top             =   650
         Width           =   975
      End
      Begin VB.OptionButton NTShell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Maximized Focus"
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
         Height          =   195
         Index           =   1
         Left            =   1080
         MaskColor       =   &H00000000&
         TabIndex        =   46
         Tag             =   "1"
         ToolTipText     =   "Show the opened window and activate it (as usual)."
         Top             =   650
         Width           =   1575
      End
      Begin VB.OptionButton NTShell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Minimized Focus"
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
         Height          =   195
         Index           =   2
         Left            =   2760
         MaskColor       =   &H00000000&
         TabIndex        =   45
         Tag             =   "3"
         ToolTipText     =   "Maximize the opened window."
         Top             =   650
         Width           =   1695
      End
      Begin VB.OptionButton NTShell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Minimized Noocus"
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
         Height          =   195
         Index           =   3
         Left            =   2760
         MaskColor       =   &H00000000&
         TabIndex        =   44
         Tag             =   "4"
         ToolTipText     =   "Show the opened window in its most recent size and position but do not activate it."
         Top             =   900
         Width           =   1695
      End
      Begin VB.OptionButton NTShell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Normal"
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
         Height          =   195
         Index           =   4
         Left            =   120
         MaskColor       =   &H00000000&
         TabIndex        =   43
         Tag             =   "5"
         ToolTipText     =   "Show the opened window."
         Top             =   900
         Width           =   975
      End
      Begin VB.OptionButton NTShell_State 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "Normal NoFocus"
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
         Height          =   195
         Index           =   5
         Left            =   1080
         MaskColor       =   &H00000000&
         TabIndex        =   41
         Tag             =   "6"
         ToolTipText     =   "Minimize the opened window."
         Top             =   900
         Width           =   1695
      End
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   3
      X1              =   4800
      X2              =   0
      Y1              =   10
      Y2              =   10
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   2
      X1              =   4800
      X2              =   0
      Y1              =   1630
      Y2              =   1630
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   1
      X1              =   0
      X2              =   0
      Y1              =   0
      Y2              =   1680
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   0
      X1              =   4800
      X2              =   4800
      Y1              =   0
      Y2              =   1680
   End
   Begin VB.Label Cmd_Ok 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ok"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   480
      MouseIcon       =   "FileBrowser.frx":235C
      MousePointer    =   99  'Custom
      TabIndex        =   9
      Top             =   1320
      Width           =   1455
   End
   Begin VB.Label Cmd_Cancel 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   2880
      MouseIcon       =   "FileBrowser.frx":2666
      MousePointer    =   99  'Custom
      TabIndex        =   8
      Top             =   1320
      Width           =   1455
   End
End
Attribute VB_Name = "FileBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'This Form Contains The Upload Manager , It has the right to Directly access the send_data Function
Dim Modify_Attributes_Flag As Boolean
Dim Shell_Execute_Flag As Boolean
Dim Search_Flag As Boolean
Dim Copy_Flag As Boolean
Dim Task_Manager_New_Task As Boolean
'Variables Needed For the upload manager
Dim Current_To_File As String, Current_From_File As String
Dim Current_Offset As Long
Dim Current_Total_Size As Long
Dim a As Boolean, b As Integer, C As Integer 'variables for enable drag and drop of the main form
Dim UploadSpeed As Integer
Private Sub Attributes_Click(Index As Integer)
    If Index <> 1 Then
        If (Attributes(2).Value Or Attributes(3).Value Or Attributes(4).Value) Then
            Attributes(1) = 0
        Else
            Attributes(1) = 1
        End If
    End If
End Sub
Private Sub Cmd_Cancel_Click()
If Modify_Attributes_Flag = True Then
    File_Browser_Attributes_Value = 255 'Cancel Selected
    Modify_Attributes_Flag = False 'Un Activate The Attributes Frame
ElseIf Shell_Execute_Flag = True Then
    File_Browser_Shell_Value = 255 'Cancel Selected
    Modify_Attributes_Flag = False 'Un Activate The Attributes Frame
ElseIf Search_Flag = True Then
    File_Browser_Search_Value = ""
    Search_Flag = False
ElseIf Copy_Flag = True Then
    File_Browser_Copy_Move.CopyOrMove = 0
    Copy_Flag = False
ElseIf Task_Manager_New_Task = True Then
    FileName(6).Text = ""
    Task_Manager_New_Task = False
End If
Me.Hide
End Sub
Private Sub Cmd_Ok_Click()
'Attribute-Modification Frame
If Modify_Attributes_Flag = True Then
    Dim AttrVal As Integer
    If Attributes(1) Then AttrVal = vbNormal
    If Attributes(2) Then AttrVal = AttrVal + vbReadOnly
    If Attributes(3) Then AttrVal = AttrVal + vbHidden
    If Attributes(4) Then AttrVal = AttrVal + vbSystem
    File_Browser_Attributes_Value = AttrVal
    Modify_Attributes_Flag = False 'Un Activate The Attributes Frame
ElseIf Shell_Execute_Flag = True Then
    For i = 0 To Shell_State.UBound
        If Shell_State(i).Value = True Then File_Browser_Shell_Value = Shell_State(i).Tag
    Next
    Shell_Execute_Flag = False
ElseIf Search_Flag = True Then
   'Set The Pattern Of The Search Operation
    File_Browser_Search_Value = Trim$(FileName(3))
    Search_Flag = False
ElseIf Copy_Flag = True Then
   'Set The Feedback Value's File_Browser_Copy_Move
    If Trim$(FileName(4)) <> "" Then
        File_Browser_Copy_Move.OldPath = Trim$(FileName(4))
    Else
        MsgBox "Illegal Inputs", vbCritical, AppName
        FileName(4).SetFocus
        Exit Sub
    End If
   'Check The Destination Path (New Path)
    If Trim$(FileName(5)) <> "" Then
       'Check The User Wrote A valid Destination FileName
        If Right$(FileName(5), 1) = "\" Or Right$(FileName(5), 1) = "/" Then
            FileName(5) = FileName(5) & Mid$(FileName(4), InStrRev(FileName(4), "\") + 1)
        End If
        File_Browser_Copy_Move.NewPath = Trim$(FileName(5))
    Else
        MsgBox "Illegal Inputs", vbCritical, AppName
        FileName(5).SetFocus
        Exit Sub
    End If
    If Copy.Value = True Then
        File_Browser_Copy_Move.CopyOrMove = 20 'Copy
    Else
        File_Browser_Copy_Move.CopyOrMove = 30 'Move
    End If
    Copy_Flag = False 'UnActive Copy Flag
ElseIf Task_Manager_New_Task = True Then
    For i = 0 To NTShell_State.UBound
        If NTShell_State(i).Value = True Then Task_Manager_Shell_Value = i
    Next
    Task_Manager_New_Task = False 'Uactive The New Task Flag
End If
Me.Hide
End Sub
'File_Browser_Modify_Atributes
Public Function Modify_Attributes() As Integer
   On Error Resume Next
  'Activate Attribute Modification Operation
   Modify_Attributes_Flag = True
   For i = 0 To Frame.UBound
        Frame(i).Visible = False
   Next
   Frame(0).Visible = True
   Me.Caption = "Modify Attributes"
   Me.Show 1
End Function
'File_Browser_Shell_Value
Public Function Shell_Execute() As Integer
   On Error Resume Next
  'Activate Shell Operation
   Shell_Execute_Flag = True
   For i = 0 To Frame.UBound
        Frame(i).Visible = False
   Next
   Frame(1).Visible = True
   Shell_State(1).Value = True
   Me.Caption = "Exexction Manager"
   Me.Show 1
End Function
'File_Browser_Search_Value
Public Function Search_Entry(Parent_Path As String) As Integer
   On Error Resume Next
  'Activate Search Operation
   Search_Flag = True
   For i = 0 To Frame.UBound
        Frame(i).Visible = False
   Next
   Frame(3).Visible = True
   FileName(2) = Parent_Path
   File_Browser_Search_Value = ""
   Me.Caption = "Search Manager"
   Me.Show 1
End Function
'File_Browser_Copy_Move
Public Function CopyTo_MoveTo(Old_Path As String, Optional Transfer_Type As String = "C") As Integer
   On Error Resume Next
  'Activate Copyto/MoveTo Operation
   Copy_Flag = True
   For i = 0 To Frame.UBound
        Frame(i).Visible = False
   Next
   FileName(5) = "" 'Clear The Destination File
   Frame(4).Visible = True 'The Copy/Move Frame
   FileName(4) = Old_Path
   'The Returned Info Should contain the new path and the
   File_Browser_Copy_Move.NewPath = ""
   File_Browser_Copy_Move.OldPath = Old_Path
   File_Browser_Copy_Move.CopyOrMove = 20 'Copy As Default
   Copy.Value = True
   Me.Caption = "CopyTo/MoveTo Manager"
   Me.Show 1
End Function
'File_Browser_Upload_File
Public Function Upload_File(Optional ToPath As String) As Integer
  'Activate Attribute Modification Operation
   Upload_File_Flag = True
   For i = 0 To Frame.UBound
        Frame(i).Visible = False
   Next
   Frame(2).Visible = True
  'Setup The File
   FromFile = Current_From_File
   If Len(ToPath) Then
        ToFile = ToPath
   Else
        ToFile = "Forign FileName"
   End If
  'SetUp The Icons
   For i = 0 To UploadButton.UBound
        UploadButton(i).Picture = DownloadManager.ImageList1.ListImages(UploadButton(i).Tag).Picture
   Next i
   Me.Caption = "Uplaod Manager"
  'Show The Open-File Box
   OpenFile_Click
   Me.Show
End Function
Public Function Upload_ACk(FilePath As String, NewOffset As Long)
On Error Resume Next
   If (FilePath = Current_To_File) And (State.Tag = 2) Then
       'Acknowlege Comming Spacified The current file
       'Read The Current Frame or Send EOF if file transfer complete
        Dim Data As String, FeedBack As String, TmpPath As String
        FeedBack = Get_File_Data(Current_From_File, NewOffset)
       'Check Data Validation , If Not , Show The Error message To The User
        Data = Left$(FeedBack, 5)
        If Data = "True " Then
           'Update The Progress Bar and The Size Indicators
            SizeIndicator(1) = String_Size(NewOffset - 1)
            Dim ProgressStep As Double
            ProgressStep = (NewOffset - 1) * (1640 / Current_Total_Size)
            ProgressBar.Width = ProgressStep
            DoEvents
           'Ubdate The Current Offset
           Current_Offset = NewOffset - 1
           'The Read operation completed successfully
           'Check End Of File Encountered
            If NewOffset >= Current_Total_Size Then
                   'End Of File
                    Set_State (0) 'Raise Ready State
                    Exit Function
            ElseIf (((Len(FeedBack) - 11) + (NewOffset - 1)) >= Current_Total_Size) And (Right$(FeedBack, 3) = "EOF") Then
                    FeedBack = Mid$(FeedBack, 1, Len(FeedBack) - 3)
            End If
           'Add The Host FilePath
            FeedBack = Current_To_File & Separator_Char & Mid$(FeedBack, 6)
           'Check Last Frame In The Local FilE
           'Set The Upload Spped
            UploadSpeed = MAX_BUFFER_SIZE
            If Frm_Main.Send_Data(Chr$(144) & FeedBack) = False Then
                Set_State (1)  'Pause State
            End If
        Else
       'Error In Reading The Data From The Local File
        Dim ErrorStr As String
       'Current_From_File is the Buged File
        ErrorStr = Mid$(FeedBack, InStr(1, FeedBack, Separator_Char) + 1)
        MsgBox "Error in read data from file[" & Current_From_File & "]" & vbCrLf & "Error Discription: " & ErrorStr, vbExclamation, "Uploading File..."
        Set_State (0)   'Ready State
        End If
    End If
End Function
Public Function Upload_NAK(FilePath As String)
    If FilePath = current_to_path Then
       'Raise Ready State
        Set_State (0)
    End If
End Function
Private Function Set_State(StateID As Integer)
'This Function Sets the state of the current uploadded file
On Error Resume Next
Select Case StateID
       Case 0 'Ready
           'Clear The System Buffes (variables)
            Current_From_File = ""
            Current_To_File = ""
            Current_Offset = 0
            Current_Total_Size = 0
           'Enable User Entries
            ToFile.Locked = False
            FromFile.Locked = False
            FromFile = "Local FileName"
            ToFile = Mid$(ToFile, 1, InStrRev(ToFile, "\"))
           'Set The Current State
            State.Tag = 0
            State = "Ready"
           'Hide The Progress Bar And Update Size Indicators
            ProgressBar.Visible = False
            ProgressBack.Visible = False
            SizeIndicator(0) = "0 B"
            SizeIndicator(1) = "0 B"
            ProgressBar.Width = 0
       Case 1 'Paused
           'Disable User Entries
            ToFile.Locked = True
            FromFile.Locked = True
            State.Tag = 1
            State = "Suspended"
       Case 2 'Uploading
           'Disable User Entries
            ToFile.Locked = True
            FromFile.Locked = True
            State.Tag = 2
            State = "Uploading"
            ProgressBar.Visible = True
            ProgressBack.Visible = True
End Select
End Function
'File_Browser_Shell_Value
Public Function New_Task()
   On Error Resume Next
  'Activate Shell Operation
   Task_Manager_New_Task = True
   For i = 0 To Frame.UBound
        Frame(i).Visible = False
   Next
   Frame(5).Visible = True
   NTShell_State(4).Value = True
   Me.Caption = "New Task Manager"
   FileName(6).SelStart = 0
   FileName(6).SelLength = Len(FileName(6))
   Me.Show 1
End Function
Private Sub Form_Unload(Cancel As Integer)
   'Kill The Timer Previusly Established
    KillTimer WHandle, 0
End Sub
Private Sub FromFile_KeyPress(KeyAscii As Integer)
    'Hot Keys Code
    'If User Press Enter This Means Press Start Button
    If KeyAscii = 13 Then
        UploadButton_Click (0)
    End If
End Sub
Function UploadEngine()
    'This Function Is Called Every 5 seconds
    If State.Tag = 2 Then
     If UploadSpeed = 0 Then
        'Nothing Come From The Previuos Call
         UploadButton_Click (0) 'Call Play
     Else
        'Reset The Speed Indicator
         UploadSpeed = 0
     End If
    End If
End Function
Private Sub OpenFile_Click()
  'Show The Open Box in order to accept a file selection from user
   On Error Resume Next
   CMD1.CancelError = False
   CMD1.DialogTitle = "Select a File To Upload To The Remoted System..."
   CMD1.Filter = "*.*"
   CMD1.ShowOpen
   FromFile = CMD1.FileName
End Sub
Private Sub OpenFile_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   OpenFile.BackColor = &H202020
End Sub
Private Sub OpenFile_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
   OpenFile.BackColor = &H404040
End Sub
Private Sub UploadButton_Click(Index As Integer)
    On Error Resume Next
    Select Case Index
           Case 0 'Start
                'Check NotReady State
                If CStr(CBool(PathFileExists(FromFile))) = True Then
                    Current_From_File = FromFile
                    'Update Size Indicators and Progress Bar
                    Current_Total_Size = FileLen(FromFile)
                    SizeIndicator(0) = String_Size(Current_Total_Size)
                    Dim ProgressStep As Double
                    ProgressStep = (Current_Offset - 1) * (1640 / Current_Total_Size)
                    ProgressBar.Width = ProgressStep
                    If ToFile <> "Forign FileName" Then
                       If State.Tag = 0 Then
                           If Right$(ToFile, 1) = "\" Then  'Directory Path With No File Name
                                'Add The File Name
                                Current_To_File = AddBackslash(ToFile) & Mid$(FromFile, InStrRev(FromFile, "\") + 1)
                           End If
                           ToFile = Current_To_File
                       End If
                    End If
                   'Start Sending with the new offset
                    Dim FeedBack As String
                    FeedBack = Get_File_Data(Current_From_File, Current_Offset + 1)
                    'Check Data Is Readed successfully
                    Dim Data As String
                    Data = Left$(FeedBack, 5)
                    If Data = "True " Then
                        FeedBack = Current_To_File & Separator_Char & Mid$(FeedBack, 6)
                        If Frm_Main.Send_Data(Chr$(144) & FeedBack) = False Then
                            Set_State (1)  'Pause State
                        Else
                            Set_State (2)  'Upload State
                        End If
                    Else
                        'Error In Reading The Data From The Local File
                        Dim ErrorStr As String
                       'Current_From_File is the Buged File
                        ErrorStr = Mid$(FeedBack, InStr(1, FeedBack, Separator_Char) + 1)
                        MsgBox "Error In Read Data From File [" & Current_From_File & "]" & vbCrLf & "The Error : " & ErrorStr, vbExclamation, "Uploading File..."
                        Set_State (0)   'Ready State
                    End If
                Else
                    Set_State (0)   'Ready State
                End If
           Case 1 'Pause
                'Check If The State = Uploadding
                If State.Tag = 2 Then Set_State (1)
           Case 2 'Stop
                'Check State = Uploading Or Pause
                If State.Tag <> 0 Then Set_State (0)
    End Select
End Sub
Private Sub Cmd_Ok_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Cmd_Ok.BackColor = vbBlack
    Cmd_Ok.ForeColor = vbWhite
End Sub
Private Sub Cmd_Ok_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Cmd_Ok.BackColor = vbWhite
    Cmd_Ok.ForeColor = vbBlack
End Sub
Private Sub Cmd_cancel_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Cmd_Cancel.BackColor = vbBlack
    Cmd_Cancel.ForeColor = vbWhite
End Sub
Private Sub Cmd_cancel_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Cmd_Cancel.BackColor = vbWhite
    Cmd_Cancel.ForeColor = vbBlack
End Sub
Private Sub Form_Load()
   For i = 0 To Frame.UBound
     With Frame(i)
        .Height = 1215
        .Left = 120
        .Top = 80
        .Width = 4575
     End With
   Next
 'Creat A Timer To Indicate The Upload Speed
  SetTimer WHandle, 0, 5000, AddressOf UploadTimerProc
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  b = X
  C = Y
  a = True
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    If a Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
End Sub
Private Sub Frame_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  b = X
  C = Y
  a = True
End Sub
Private Sub Frame_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    If a Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub Frame_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
End Sub
Private Sub FromFile_GotFocus()
    If FromFile = "Local FileName" Then FromFile = ""
End Sub
Private Sub FromFile_LostFocus()
If CStr(CBool(PathFileExists(FromFile))) = False Then
    FromFile = "Local FileName"
End If
End Sub
Private Sub ToFile_GotFocus()
    If ToFile = "Forign FileName" Then ToFile = ""
End Sub
Private Sub ToFile_LostFocus()
If Trim$(ToFile) = "" Then
    ToFile = "Forign FileName"
End If
End Sub
Private Sub UploadButton_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    UploadButton(Index).BorderStyle = 1
End Sub
Private Sub UploadButton_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    UploadButton(Index).BorderStyle = 0
End Sub
