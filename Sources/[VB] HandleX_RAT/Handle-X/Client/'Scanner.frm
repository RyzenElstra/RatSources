VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form Scanner 
   Appearance      =   0  'Flat
   BackColor       =   &H00272727&
   BorderStyle     =   0  'None
   Caption         =   " X-Scanner V1.0"
   ClientHeight    =   4995
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7935
   Icon            =   "Scanner.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4995
   ScaleWidth      =   7935
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer 
      Enabled         =   0   'False
      Index           =   0
      Left            =   4800
      Top             =   2280
   End
   Begin MSWinsockLib.Winsock Scanner 
      Index           =   0
      Left            =   4020
      Top             =   2280
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox Log 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   2715
      Index           =   1
      Left            =   1980
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Top             =   1320
      Width           =   5835
   End
   Begin VB.OptionButton Speed 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Caption         =   "Dialup 56kbp"
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
      Height          =   180
      Index           =   1
      Left            =   240
      MaskColor       =   &H00000000&
      TabIndex        =   4
      Top             =   1380
      Width           =   1455
   End
   Begin VB.OptionButton Speed 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Caption         =   "DSL"
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
      Height          =   180
      Index           =   0
      Left            =   240
      MaskColor       =   &H00000000&
      TabIndex        =   5
      Top             =   1680
      Width           =   1455
   End
   Begin VB.TextBox ScannerData 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   260
      IMEMode         =   3  'DISABLE
      Index           =   3
      Left            =   4620
      TabIndex        =   3
      Text            =   "5000"
      Top             =   720
      Width           =   2310
   End
   Begin VB.TextBox ScannerData 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   260
      IMEMode         =   3  'DISABLE
      Index           =   2
      Left            =   1560
      TabIndex        =   2
      Text            =   "0"
      Top             =   720
      Width           =   2325
   End
   Begin VB.TextBox Log 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   495
      Index           =   0
      Left            =   1980
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      Top             =   4380
      Width           =   5835
   End
   Begin VB.TextBox ScannerData 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   260
      IMEMode         =   3  'DISABLE
      Index           =   1
      Left            =   4620
      TabIndex        =   1
      Text            =   "255.255.255.255"
      Top             =   420
      Width           =   2310
   End
   Begin VB.TextBox ScannerData 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   260
      IMEMode         =   3  'DISABLE
      Index           =   0
      Left            =   1560
      TabIndex        =   0
      Text            =   "127.0.0.1"
      Top             =   420
      Width           =   2325
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "IPeez && Ports Log Screen :-"
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
      Index           =   2
      Left            =   2040
      TabIndex        =   31
      Top             =   1080
      Width           =   2145
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Connection Type :"
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
      Left            =   240
      TabIndex        =   30
      Top             =   1080
      Width           =   1365
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   795
      Index           =   1
      Left            =   120
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label Label1 
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
      ForeColor       =   &H00008000&
      Height          =   255
      Index           =   13
      Left            =   180
      TabIndex        =   29
      Top             =   4620
      Width           =   1545
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ports Found"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Index           =   12
      Left            =   420
      TabIndex        =   28
      Top             =   4380
      Width           =   1065
   End
   Begin VB.Label Label1 
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
      ForeColor       =   &H00008000&
      Height          =   255
      Index           =   11
      Left            =   180
      TabIndex        =   27
      Top             =   3960
      Width           =   1545
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Current Threads"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Index           =   10
      Left            =   300
      TabIndex        =   26
      Top             =   3720
      Width           =   1305
   End
   Begin VB.Label Label1 
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
      ForeColor       =   &H00008000&
      Height          =   255
      Index           =   9
      Left            =   180
      TabIndex        =   25
      Top             =   3300
      Width           =   1545
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Current Port"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Index           =   8
      Left            =   420
      TabIndex        =   24
      Top             =   3060
      Width           =   1065
   End
   Begin VB.Label Label1 
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
      ForeColor       =   &H00008000&
      Height          =   255
      Index           =   7
      Left            =   180
      TabIndex        =   23
      Top             =   2640
      Width           =   1545
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Current IP"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Index           =   6
      Left            =   480
      TabIndex        =   22
      Top             =   2400
      Width           =   945
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Status bar :-"
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
      Index           =   0
      Left            =   2040
      TabIndex        =   21
      Top             =   4140
      Width           =   945
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Log :"
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
      Index           =   12
      Left            =   240
      TabIndex        =   20
      Top             =   2040
      Width           =   405
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "To :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   255
      Index           =   5
      Left            =   4080
      TabIndex        =   19
      Top             =   720
      Width           =   405
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "From :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   255
      Index           =   4
      Left            =   840
      TabIndex        =   18
      Top             =   720
      Width           =   585
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ports :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   255
      Index           =   3
      Left            =   60
      TabIndex        =   17
      Top             =   720
      Width           =   585
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "IP :---"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   255
      Index           =   2
      Left            =   60
      TabIndex        =   16
      Top             =   420
      Width           =   585
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   3
      X1              =   720
      X2              =   720
      Y1              =   1020
      Y2              =   360
   End
   Begin VB.Label Buttons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00009100&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Stop !"
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
      Height          =   240
      Index           =   1
      Left            =   6960
      MouseIcon       =   "Scanner.frx":0CCA
      MousePointer    =   99  'Custom
      TabIndex        =   15
      ToolTipText     =   "Copy The Comming Data To X-Editor"
      Top             =   720
      Width           =   915
   End
   Begin VB.Label Buttons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00009100&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Go !"
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
      Height          =   240
      Index           =   0
      Left            =   6960
      MouseIcon       =   "Scanner.frx":0FD4
      MousePointer    =   99  'Custom
      TabIndex        =   14
      ToolTipText     =   "Send Whois Quary to the spacified Host"
      Top             =   420
      Width           =   915
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "To :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   255
      Index           =   1
      Left            =   4080
      TabIndex        =   13
      Top             =   420
      Width           =   405
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   2
      X1              =   0
      X2              =   7920
      Y1              =   1030
      Y2              =   1030
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "From :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   255
      Index           =   0
      Left            =   840
      TabIndex        =   12
      Top             =   405
      Width           =   585
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   1
      X1              =   0
      X2              =   7920
      Y1              =   4980
      Y2              =   4980
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   0
      X1              =   0
      X2              =   7920
      Y1              =   360
      Y2              =   360
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   " X-Scanner V1.0"
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
      TabIndex        =   11
      Top             =   60
      Width           =   6840
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
      Left            =   7600
      MouseIcon       =   "Scanner.frx":12DE
      MousePointer    =   99  'Custom
      TabIndex        =   10
      ToolTipText     =   "Exit X-Downloader V1.0"
      Top             =   60
      Width           =   255
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   1
      X1              =   15
      X2              =   15
      Y1              =   0
      Y2              =   5040
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   0
      X1              =   7920
      X2              =   7920
      Y1              =   0
      Y2              =   5040
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   8
      X1              =   6960
      X2              =   6960
      Y1              =   340
      Y2              =   0
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "?"
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
      Index           =   2
      Left            =   7020
      MouseIcon       =   "Scanner.frx":15E8
      MousePointer    =   99  'Custom
      TabIndex        =   9
      ToolTipText     =   "Help ?"
      Top             =   60
      Width           =   255
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
      Left            =   7320
      MouseIcon       =   "Scanner.frx":18F2
      MousePointer    =   99  'Custom
      TabIndex        =   8
      ToolTipText     =   "Minimize"
      Top             =   60
      Width           =   255
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   11
      X1              =   0
      X2              =   7920
      Y1              =   15
      Y2              =   0
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   2775
      Index           =   2
      Left            =   120
      Top             =   2160
      Width           =   1695
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   675
      Index           =   0
      Left            =   1920
      Top             =   4260
      Width           =   5955
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   2895
      Index           =   3
      Left            =   1920
      Top             =   1200
      Width           =   5895
   End
End
Attribute VB_Name = "Scanner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function IcmpCreateFile Lib "icmp.dll" () As Long
Private Declare Function IcmpCloseHandle Lib "icmp.dll" (ByVal IcmpHandle As Long) As Long
Private Declare Function IcmpSendEcho Lib "icmp.dll" _
   (ByVal IcmpHandle As Long, _
    ByVal DestinationAddress As Long, _
    ByVal RequestData As String, _
    ByVal RequestSize As Long, _
    ByVal RequestOptions As Long, _
    ReplyBuffer As ICMP_ECHO_REPLY, _
    ByVal ReplySize As Long, _
    ByVal TimeOut As Long) As Long

Private Type ICMP_OPTIONS
   Ttl             As Byte
   Tos             As Byte
   Flags           As Byte
   OptionsSize     As Byte
   OptionsData     As Long
End Type
Private Type ICMP_ECHO_REPLY
   Address         As Long
   status          As Long
   RoundTripTime   As Long
   DataSize        As Long
  'Reserved        As Integer
   DataPointer     As Long
   Options         As ICMP_OPTIONS
   Data            As String * 250
End Type

Private Const INADDR_NONE As Long = &HFFFFFFFF

'My Variables
Dim b As Integer, C As Integer, a As Boolean   'Variables Needed for the movinfg of the editor
Private FromIP As Currency, ToIP As Currency 'Numirical FROM/TO IP addresses
Private FromPort As Single, ToPort As Single
Private Threads As Integer 'Number of Socket Threads in the Scanner right now
Private CurrentIP As String, CurrentPort As String   'Curren idetifications
Private PrevIP As String
Private NumOfFoundPorts As Currency 'Number of opened Ports Found
Private StopScan As Boolean
Private ThreadReady() As Boolean
Private Echo As ICMP_ECHO_REPLY
Private PING_TIMEOUT As Long 'Number of timeout m.seconds to wait for the connection
Private Sub Buttons_Click(Index As Integer)
    Select Case Index
        Case 0 'Go
                Buttons(0).Enabled = False 'Disables Me Until Stop The Scan Operation
                Buttons(1).Enabled = True
                StopScan = False
            'Check Validation of iser Inputs
                AddText Log(1), "Validating User Inputs ..."
                If IsValidIpAddress(ScannerData(0)) = True Then
                    If (IPAddressToNumber(ScannerData(0)) < 0) Or (IPAddressToNumber(ScannerData(0)) >= 4294967295#) Then
                        FromIP = 0
                        ScannerData(0) = "0.0.0.0"
                    Else
                        FromIP = IPAddressToNumber(ScannerData(0))
                    End If
                Else
                    MsgBox "Invalid [To IP] Address Format !", vbCritical, AppName
                    SeletctAll ScannerData(0)
                    GoTo EndScan
                End If
                If IsValidIpAddress(ScannerData(1)) = True Then
                    If (IPAddressToNumber(ScannerData(1)) < 0) Or (IPAddressToNumber(ScannerData(1)) >= 4294967295#) Then
                        ToIP = 4294967295#
                        ScannerData(1) = "255.255.255.255"
                    Else
                        ToIP = IPAddressToNumber(ScannerData(1))
                    End If
                Else
                    MsgBox "Invalid [From IP] Address Format !", vbCritical, AppName
                    SeletctAll ScannerData(1)
                    GoTo EndScan
                End If
                FromPort = Val(ScannerData(2))
                ToPort = Val(ScannerData(3))
           'Initializations
                AddText Log(1), "Initializing Componants ...", 1
                Label1(13) = NumOfFoundPorts 'Found Ports Until Now
                ScannerGO
                AddText Log(1), "Scan Finished At [" & time & "] ...", 1
                Buttons(1).Enabled = False 'Disables Me Until Scan operation start again
                Buttons(0).Enabled = True
                Beep
        Case 1 'Stop
EndScan:
                ScannerStop
                Buttons(1).Enabled = False 'Disables Me Until Scan operation start again
                Buttons(0).Enabled = True
    End Select
End Sub
Private Sub ScannerGO()
    'Declirations
     Dim i As Currency, J As Integer
     Dim CurrentSock As Integer 'Current Socket and current Timer
    'Calculate TimeOut Amount
        PING_TIMEOUT = IIf(Speed(0) = 0, 2000, 500)
        AddText Log(1), "TimeOut intervel is set to [" & PING_TIMEOUT & " ms]", 1
    'Loading Threads
        AddText Log(1), "Loading Threads [" & Threads & "] ...", 1
        ReDim ThreadReady(Threads)
        For i = 0 To Threads
            ThreadReady(i) = True
            Timer(i).Interval = PING_TIMEOUT
        Next i
    'Start Scan Algorithm
        AddText Log(1), "Scan Starts at [" & time & "] ..." & vbCrLf, 1
        i = FromIP
        Do While (Not StopScan) And (i <= ToIP)
            'Ping IP First
             CurrentIP = IPNumberToAddress(i)
             Label1(7) = CurrentIP
             AddText Log(0), " Ping " & CurrentIP & " ...", 1
             DoEvents 'Free The Processor to write the string b4 scanning ports
             If Ping(CurrentIP, "Echo !", Echo) = 0 Then
                Sound
                CurrentPort = FromPort
                For CurrentSock = 0 To Threads
                    If Scanner(CurrentSock).State = 7 Then
                        'Connected
                         If PrevIP <> CurrentIP Then
                            AddText Log(1), vbCrLf, 1
                            PrevIP = CurrentIP
                         End If
                         AddText Log(1), " -" & Scanner(CurrentSock).Tag, 1
                    End If
                    If CurrentPort > ToPort Then Exit For
                    Label1(9) = CurrentPort
                    Scanner(CurrentSock).Close
                    Scanner(CurrentSock).Tag = CurrentPort
                    Scanner(CurrentSock).Connect CurrentIP, CurrentPort
                    CurrentPort = CurrentPort + 1
                    If CurrentSock = Threads Then CurrentSock = 0
                    DoEvents
                Next CurrentSock
             Else
                If (Not StopScan) Then AddText Log(0), " [" & CurrentIP & "] Is OFFLINE !"
             End If
            'Wait for the timers
             IsTimers
             Label1(9) = ""
             i = i + 1
        Loop
End Sub
Private Sub Timer_Timer(Index As Integer)
     Timer(Index).Enabled = False
    'Scanner(Index).Close
     ThreadReady(Index) = True
     If StopScan Then Exit Sub 'Check Stop Scan
     If Scanner(Index).State = 7 Then
        'Found Openned Port
            If PrevIP <> Scanner(Index).Tag Then 'Check New IP Range Selected
                PrevIP = Scanner(Index)
                AddText Log(1), vbCrLf, 1
            End If
            AddText Log(1), " - [" & Scanner(Index).Tag & " : " & Timer(Index).Tag & "] Is Valid", 1
            NumOfFoundPorts = NumOfFoundPorts + 1
            Label1(13) = NumOfFoundPorts
     End If
End Sub
Private Sub IsTimers()

End Sub
Private Sub ScannerStop()
    'This Function Stops The Scanning Operations
     StopScan = True
     AddText Log(1), vbCrLf & "Scan Stopped Manually At [" & time & "] ...", 1
     IsTimers
     AddText Log(0), "Ready !"
     Label1(7) = ""
     Label1(9) = ""
End Sub
Private Function Ping(sAddress As String, sDataToSend As String, Echo As ICMP_ECHO_REPLY) As Long
  'If Ping succeeds :
  '.RoundTripTime = time in ms for the ping to complete,
  '.Data is the data returned (NULL terminated)
  '.Address is the IP address that actually replied
  '.DataSize is the size of the string in .Data
  '.Status will be 0
  '
  'If Ping fails .Status will be the error code
   Dim hPort As Long
   Dim dwAddress As Long
  'convert the address into a long representation
   dwAddress = inet_addr(sAddress)
  'if dwAddress is valid
   If dwAddress <> INADDR_NONE Then
     'open a port
      hPort = IcmpCreateFile()
     'and if successful,
      If hPort Then
        'ping it.
         Call IcmpSendEcho(hPort, _
                           dwAddress, _
                           sDataToSend, _
                           Len(sDataToSend), _
                           0, _
                           Echo, _
                           Len(Echo), _
                           PING_TIMEOUT)

        'return the status as ping success
         Ping = Echo.status
        'close the port handle
         Call IcmpCloseHandle(hPort)
      End If  'If hPort
   Else
        'the address format was probably invalid
         Ping = INADDR_NONE
   End If
End Function
Private Sub Form_Load()
    'Initialization of vasriables
        Threads = 500

    'Initialization of controls
        For i = (Scanner.UBound + 1) To Threads
            Load Scanner(i)
            Load Timer(i)
            DoEvents
        Next i
        Label1(11) = Threads
        Speed(1).Value = True
        Set_Text_Box_Number ScannerData(3), True
        Set_Text_Box_Number ScannerData(2), True
End Sub
Private Sub Control_Box_Click(Index As Integer)
Select Case Index
    Case 0 'Hide
        Unload Me
    Case 1 'Minimize
        Me.WindowState = 1
    Case 2 'Help
        MsgBox "X-Scanner V1.0 Can execute the net command [Scanner] " & vbCrLf & _
               "The Scanner data may includes the location,ISP,region," & vbCrLf & _
               "Country,server information and admin contact information." & vbCrLf & vbCrLf & _
               "Copy Rights Reserved To:" & vbCrLf & _
               "Author: Blackguy" & vbCrLf & _
               "Email Address: blackguy@hotmail.com", vbInformation, AppName
End Select
End Sub
Private Sub ScannerData_GotFocus(Index As Integer)
     ScannerData(Index).SelStart = 0
     ScannerData(Index).SelLength = Len(ScannerData(Index))
End Sub
Private Sub TiTle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  b = X
  C = Y
  a = True
End Sub
Private Sub TiTle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   'Operate the drag and drop of the main form
    On Error Resume Next
    If a Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub TiTle_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
End Sub
Private Sub Control_Box_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbBlack
    Control_Box(Index).BackColor = vbWhite
End Sub
Private Sub Control_Box_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbWhite
    Control_Box(Index).BackColor = vbBlack
End Sub
Private Sub Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BackColor = &H5000&
End Sub
Private Sub Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BackColor = &H9000&
End Sub
Private Sub ScannerData_LostFocus(Index As Integer)
    Select Case Index
        Case 2 'From Port
                If (Val(ScannerData(Index)) < 0) Or (Val(ScannerData(Index)) > 65535) Then ScannerData(Index) = 0
        Case 3 'TO Port
                If (Val(ScannerData(Index)) < 0) Or (Val(ScannerData(Index)) > 65535) Then ScannerData(Index) = 65535
    End Select
End Sub
