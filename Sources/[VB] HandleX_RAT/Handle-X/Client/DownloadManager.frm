VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.Form DownloadManager 
   Appearance      =   0  'Flat
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   Caption         =   "X-Downloader V1.0"
   ClientHeight    =   6150
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10950
   Icon            =   "DownloadManager.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6150
   ScaleWidth      =   10950
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Speeder 
      Interval        =   1000
      Left            =   9840
      Top             =   5640
   End
   Begin VB.PictureBox Frm_Options 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   3375
      Left            =   3120
      ScaleHeight     =   3345
      ScaleWidth      =   5145
      TabIndex        =   5
      Top             =   1440
      Visible         =   0   'False
      Width           =   5175
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
         Left            =   3360
         MouseIcon       =   "DownloadManager.frx":0442
         MousePointer    =   99  'Custom
         TabIndex        =   8
         Top             =   3000
         Width           =   1335
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   " Options  "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   2160
         TabIndex        =   7
         Top             =   120
         Width           =   975
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
         MouseIcon       =   "DownloadManager.frx":074C
         MousePointer    =   99  'Custom
         TabIndex        =   6
         Top             =   3000
         Width           =   1335
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   10320
      Top             =   5520
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   12
      ImageHeight     =   12
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   19
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":0A56
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":0BB0
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":148A
            Key             =   "Start"
            Object.Tag             =   "Start"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":1D64
            Key             =   "Pause"
            Object.Tag             =   "Pause"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":263E
            Key             =   "Delete"
            Object.Tag             =   "Delete"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":2798
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":54A2
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":5D7C
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":6A56
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":8760
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":8A7A
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":9544
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":A596
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":AB30
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":B40A
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":C0E4
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":CDBE
            Key             =   "D"
            Object.Tag             =   "D"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":13064
            Key             =   "W"
            Object.Tag             =   "W"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "DownloadManager.frx":13EB6
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView Dwn_Items 
      Height          =   5330
      Left            =   45
      TabIndex        =   0
      Top             =   760
      Width           =   10845
      _ExtentX        =   19129
      _ExtentY        =   9393
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
      ForeColor       =   16777215
      BackColor       =   -2147483643
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   9
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Key             =   "File Name"
         Object.Tag             =   "File Name"
         Text            =   "File Name"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Key             =   "P"
         Object.Tag             =   "P"
         Text            =   "P"
         Object.Width           =   529
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Key             =   "Source URL"
         Object.Tag             =   "Source URL"
         Text            =   "Source URL"
         Object.Width           =   2294
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Key             =   "Size"
         Object.Tag             =   "Size"
         Text            =   "Size"
         Object.Width           =   1852
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Key             =   "Done"
         Object.Tag             =   "Done"
         Text            =   "Done"
         Object.Width           =   1852
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Key             =   "Left"
         Object.Tag             =   "Left"
         Text            =   "Left"
         Object.Width           =   1852
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Key             =   "%"
         Object.Tag             =   "%"
         Text            =   "%"
         Object.Width           =   1499
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Key             =   "Progress"
         Object.Tag             =   "Progress"
         Text            =   "Progress"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Key             =   "Comment"
         Object.Tag             =   "Comment"
         Text            =   "Comment"
         Object.Width           =   3069
      EndProperty
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   13
      Left            =   6360
      Stretch         =   -1  'True
      ToolTipText     =   "Open Downoads Direcorty"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   15
      Left            =   7260
      Stretch         =   -1  'True
      ToolTipText     =   "Hide Me !"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   2
      Left            =   1149
      Stretch         =   -1  'True
      ToolTipText     =   "Start"
      Top             =   390
      Width           =   300
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0 B"
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
      Left            =   9870
      TabIndex        =   10
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   415
      Width           =   1000
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   11
      Left            =   5397
      Stretch         =   -1  'True
      ToolTipText     =   "View Log"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   10
      Left            =   4806
      Stretch         =   -1  'True
      ToolTipText     =   "Treat a Dameged File"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   9
      Left            =   4368
      Stretch         =   -1  'True
      ToolTipText     =   "Options"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   8
      Left            =   3777
      Stretch         =   -1  'True
      ToolTipText     =   "Properties"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   7
      Left            =   3339
      Stretch         =   -1  'True
      ToolTipText     =   "Suggestions"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   6
      Left            =   2901
      Stretch         =   -1  'True
      ToolTipText     =   "Edit Comment"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   5
      Left            =   2463
      Stretch         =   -1  'True
      ToolTipText     =   "Set Periority"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   3
      Left            =   1587
      Stretch         =   -1  'True
      Tag             =   "ØÈÇÚå"
      ToolTipText     =   "Pause"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   0
      Left            =   120
      Stretch         =   -1  'True
      ToolTipText     =   "Refresh The Download Engine."
      Top             =   390
      Width           =   310
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   1
      Left            =   711
      Stretch         =   -1  'True
      ToolTipText     =   "New"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   4
      Left            =   2025
      Stretch         =   -1  'True
      ToolTipText     =   "Cancel/Delete"
      Top             =   390
      Width           =   300
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   4
      X1              =   4215
      X2              =   4215
      Y1              =   720
      Y2              =   360
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   5
      X1              =   5244
      X2              =   5244
      Y1              =   720
      Y2              =   360
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   6
      X1              =   6273
      X2              =   6273
      Y1              =   720
      Y2              =   360
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   12
      Left            =   5835
      Stretch         =   -1  'True
      ToolTipText     =   "Save Log"
      Top             =   390
      Width           =   300
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   14
      Left            =   6810
      Stretch         =   -1  'True
      ToolTipText     =   "AboutX-Downloader"
      Top             =   390
      Width           =   300
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   7
      X1              =   7680
      X2              =   7680
      Y1              =   720
      Y2              =   360
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   10
      X1              =   558
      X2              =   558
      Y1              =   720
      Y2              =   360
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Speed :-"
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
      Index           =   3
      Left            =   8985
      TabIndex        =   9
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   415
      Width           =   855
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   3
      X1              =   0
      X2              =   10920
      Y1              =   720
      Y2              =   720
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   1
      X1              =   0
      X2              =   10960
      Y1              =   6120
      Y2              =   6120
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   1
      X1              =   15
      X2              =   15
      Y1              =   0
      Y2              =   6120
   End
   Begin VB.Label XButton 
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
      Left            =   9960
      MouseIcon       =   "DownloadManager.frx":15D38
      MousePointer    =   99  'Custom
      TabIndex        =   4
      Top             =   45
      Width           =   255
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   0
      X1              =   10920
      X2              =   10920
      Y1              =   0
      Y2              =   6120
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
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   2
      X1              =   0
      X2              =   10920
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   8
      X1              =   9840
      X2              =   9840
      Y1              =   320
      Y2              =   0
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "X-Downloader V1.0"
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
      Left            =   75
      TabIndex        =   3
      Top             =   45
      Width           =   9660
   End
   Begin VB.Label XButton 
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
      Left            =   10600
      MouseIcon       =   "DownloadManager.frx":16042
      MousePointer    =   99  'Custom
      TabIndex        =   2
      ToolTipText     =   "Exit X-Downloader V1.0"
      Top             =   45
      Width           =   255
   End
   Begin VB.Label XButton 
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
      Left            =   10280
      MouseIcon       =   "DownloadManager.frx":1634C
      MousePointer    =   99  'Custom
      TabIndex        =   1
      Top             =   45
      Width           =   255
   End
End
Attribute VB_Name = "DownloadManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Constants
 Const MaxActiveThreats = 5 'The Max Avtive Parallel currently downloaded
 Const INIPreNames = "DMNames.ini"
 Const INICurrentThreats = "DowMan.ini"
 Const DwnExtension = ".Xdm"
 'Constants of the file existance b4 downloaded
 Const FNormalCurrentlyDownloaded = 0
 Const FNormalExistOnDisk = 1
 Const FNormalPreDownloaded = 2
 Const FSystemCurrentlyDownloaded = 3
 Const FSystemExistOnDisk = 4
 Const FNotExist = 5
 Const Timeout = 5 'Seconds
'Variables
 Dim b As Integer, C As Integer, a As Boolean   'Variables Needed for the movinfg of the editor
 Dim ActiveItems As Integer 'Current Active Items
 Dim CurrentItems() As Downloadable_Item 'Currently Loaded Items (All items in the list view)
 Dim CTS As Integer 'Current Threats = Ubound(CurrentItems)
 Dim PreFiles() As String 'The Previuos File's Name witch completly downloaded
 Dim SpeedValue As Long 'value of comming bytes per sec
 Dim DwnDirectory As String
 Dim INIPreNamesPath As String, INICurrentThreatsPath As String
 Dim PreVThreat As String
 Dim EngineIsActivated As Boolean
 Dim StartUpTime As String
Private Sub Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BorderStyle = 1
End Sub
Private Sub Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BorderStyle = 0
End Sub
Private Sub Dwn_Items_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then 'Right Click
        PopupMenu Menus.FBDwnManger, , X + Dwn_Items.Left, Y + Dwn_Items.Top
    End If
End Sub
Private Sub Speeder_Timer()
    Static TimeOutVar As Integer
    If SpeedValue = 0 Then
        If (TimeOutVar >= Timeout) Then
           'TimeOut is Happen
           'Reset The Timer
            TimeOutVar = 0
           'Call The Download Engine To Refresh The Download Mnaager
            DownloadEngine
        Else
           'Update New Counter
            TimeOutVar = TimeOutVar + 1
        End If
    Else
       'Reset The Speed Value and The TimeOut Variable
        TimeOutVar = 0
    End If
    Indecator(0) = String_Size(SpeedValue)
    SpeedValue = 0
End Sub
Private Sub TiTle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  b = X
  C = Y
  a = True
End Sub
Private Sub TiTle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    If a Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub TiTle_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
End Sub
Private Sub XButton_Click(Index As Integer)
     Select Case Index
            Case 0 'Exit
                If MsgBox("Are You Sure You Want To Exit ?", vbQuestion + vbYesNo, AppName) = vbYes Then
                    Set DownloadManager = Nothing
                    Unload Me
                End If
            Case 1 'Minimize
                Me.WindowState = 1
            Case 2 'Help
                MsgBox "Demo Help !", , AppName
     End Select
End Sub
Private Sub XButton_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    XButton(Index).ForeColor = vbblcack
    XButton(Index).BackColor = vbWhite
End Sub
Private Sub XButton_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    XButton(Index).ForeColor = vbWhite
    XButton(Index).BackColor = vbBlack
End Sub
Public Sub Buttons_Click(Index As Integer)
   'Check Therats Operations (Start,Pause,Cancel,....,Prorerties)
    If Index > 1 And Index <= 9 Then
        On Error GoTo NoSelection
        Dim ItemIndex As Integer
        Dim i As Integer 'General Purpuse Counter
        ItemIndex = Dwn_Items.SelectedItem.Index
    End If
    On Error Resume Next
    Select Case Index
        Case 0 'Refresh
            Dwn_Items.Refresh
            Me.Refresh
           'Check If The Engine Is Not Acyive ?
            If EngineIsActivated = False Then DownloadEngine
        Case 1 'New Threat
            Dim newThreat As String
            newThreat = InputBox("Enter A Valid File(On The Connected PC)" & vbCrLf & _
            "Hint: Wait The Respond From The Server for Few Minuits.", AppName)
            If Len(Trim$(newThreat)) > 0 Then
                Frm_Main.Send_Data Chr$(146) & newThreat
            End If
        Case 2 'Start
           'Check Periority of the selected threat
            If CurrentItems(ItemIndex - 1).Periority <= Waitting Then
                If ActiveItems < MaxActiveThreats Then 'There is a free space for the threat
                    ActiveItems = ActiveItems + 1
                    If CurrentItems(ItemIndex - 1).Type = Asc("S") Then
                            CurrentItems(ItemIndex - 1).Periority = Highest 'System File Periority
                    Else
                            CurrentItems(ItemIndex - 1).Periority = Normal 'Normal File
                    End If
                    Dwn_Items.ListItems(ItemIndex).SubItems(1) = Normal
                Else
                    CurrentItems(ItemIndex - 1).Periority = Waitting
                    Dwn_Items.ListItems(ItemIndex).SubItems(1) = Waitting
                End If
                'Call Download Engin
                If EngineIsActivated = False Then DownloadEngine
            End If
        Case 3 'Pause
            'Pause The Current Item
            If CurrentItems(ItemIndex - 1).Periority <> Pause Then
                CurrentItems(ItemIndex - 1).Periority = Pause
                Dwn_Items.ListItems(ItemIndex).SubItems(1) = Pause
                ActiveItems = ActiveItems - 1
            End If
        Case 4 'Remove
            If MsgBox("Are You Sure You Want To Remove This Threat ?", vbQuestion + vbYesNo, AppName) = vbYes Then
                RemoveItem CurrentItems(ItemIndex - 1)
            End If
        Case 5 'SetPeriority
           'Check If System File , No Comment
            If CurrentItems(ItemIndex - 1).Type = Asc("S") Then
                MsgBox "Modifying Periority to system file is not Allowed!", vbExclamation, AppName
                Exit Sub
            End If
           'Clear All Checked Periorities
            Menus.ClearFBperiorityMenu
           'Read The Cuurent Peririty
            Menus.Per(CurrentItems(ItemIndex - 1).Periority).Checked = True
           'Pop UP The Periority Menu
            PopupMenu Menus.FBPeriority, , Buttons(5).Left, Buttons(5).Top + Buttons(5).Height + 10
        Case 6 'Edit Comment
            Dim NewComment As String
           'Check If System File , No Comment
            If CurrentItems(ItemIndex - 1).Type = Asc("S") Then
                MsgBox "Editting Comment to system file is not Allowed!", vbExclamation, AppName
                Exit Sub
            End If
            NewComment = Trim$(CurrentItems(ItemIndex - 1).Comment)
Test:
            NewComment = InputBox("Note That Maximum Comment Lenght is: " & String_Size(Len(CurrentItems(ItemIndex - 1).Comment)) & vbCrLf & vbCrLf & _
            "File: " & Dwn_Items.ListItems(ItemIndex).Key & vbCrLf & _
            "Source PC: " & CurrentItems(ItemIndex - 1).FPcName, "Commenting Modification...", _
            NewComment)
            If Len(NewComment) > Len(CurrentItems(ItemIndex - 1).Comment) Then
                GoTo Test
            End If
            If (Trim$(NewComment) <> Trim$(CurrentItems(ItemIndex - 1).Comment)) Then
                'Update The New Comment
                'To System Buffers
                 CurrentItems(ItemIndex - 1).Comment = NewComment
                'To INI File
                 Dim FFile As Integer
                 FFile = FreeFile
                 Open INICurrentThreatsPath For Random As FFile Len = Len(CurrentItems(ItemIndex - 1))
                    Put #FFile, ItemIndex, CurrentItems(ItemIndex - 1)
                 Close #FFile
                'To List View
                 Dwn_Items.ListItems(ItemIndex).SubItems(8) = NewComment
            End If
        Case 7 'Suggestions
           'Suggestions Engine Depend ON :-
           '- The Extremly Ratio Of The Transfer Ratio
           '- And The Size & Done Of The Threat
           '- The Current Periority
           '- The Rest Of The Current Active Threats
           '- And Then Shows The Opinion ABout These information After Making Some Matching and If...Then :)
           '- Not Supported In This Version Untill Now
           MsgBox "This Action Is Not Supported In This Version.", vbExclamation, AppName
        Case 8 'Properties
           'Show The Properities of the Threat And It's Relation To Download Manager
            Dim Msg As String
            Msg = Msg & "> Source Aspects:-" & vbCrLf
            Msg = Msg & "    Source Path :  " & Trim$(CurrentItems(ItemIndex - 1).FURL) & vbCrLf
            Msg = Msg & "    Source FileName :  " & Trim$(CurrentItems(ItemIndex - 1).FFName) & vbCrLf
            Msg = Msg & "    Source PCName :  " & Trim$(CurrentItems(ItemIndex - 1).FPcName) & vbCrLf
            Msg = Msg & vbCrLf
            Msg = Msg & "> Destination Aspects:-" & vbCrLf
            Msg = Msg & "    Dest. Path :  " & DwnDirectory & vbCrLf
            Msg = Msg & "    Dest. FileName :  " & Trim$(CurrentItems(ItemIndex - 1).TFName) & vbCrLf
            Msg = Msg & vbCrLf
            Msg = Msg & "> Threat Aspects:-" & vbCrLf
            Msg = Msg & "    Total Size :  " & String_Size(CurrentItems(ItemIndex - 1).Size) & " [" & CurrentItems(ItemIndex - 1).Size & " Bytes]" & vbCrLf
            Msg = Msg & "    Done Amount :  " & String_Size(CurrentItems(ItemIndex - 1).Done) & " [" & CurrentItems(ItemIndex - 1).Done & " Bytes]" & vbCrLf
            Msg = Msg & "    Completed Percent : " & Round((CurrentItems(ItemIndex - 1).Done / CurrentItems(ItemIndex - 1).Size * 100), 1) & " %" & vbCrLf
            Msg = Msg & "    Start Date & Time : " & Trim$(CurrentItems(ItemIndex - 1).StartTime) & vbCrLf
            Msg = Msg & "    Periority Or State :  " & GetStringPeriority(CurrentItems(ItemIndex - 1).Periority) & vbCrLf
            Msg = Msg & "    Comment :  " & Trim$(CurrentItems(ItemIndex - 1).Comment)
           'Show The X-Editor Of The Properties
            Editor.SetString Msg, "X-Downloader Item Properties..."
        Case 9 'Options
           'Options About The Color & The Internal Variables
            MsgBox "This Action Is Not Supported In This Version.", vbExclamation, AppName
        Case 10 'Treat A Damaged File
            MsgBox "This Action Is Not Supported In This Version.", vbExclamation, AppName
        Case 11 'View Log
            MsgBox "This Action Is Not Supported In This Version.", vbExclamation, AppName
        Case 12 'SaveLog
            MsgBox "This Action Is Not Supported In This Version.", vbExclamation, AppName
        Case 13 'Show Download Directory
            Shell Win_Dir & "explorer.exe " & Left$(DwnDirectory, Len(DwnDirectory) - 1), vbNormalFocus
        Case 14 'About
            MsgBox "Demo About !", vbInformation, AppName
        Case 15 'Hide
            Me.Hide
    End Select
    Exit Sub
NoSelection:
   'No Threat Selected
    If CTS > 0 Then 'CTS Is The Number Of Total Current Threats Now In The LiST vIEW
        MsgBox "Please ,Select Item First...", vbExclamation, AppName
    End If
End Sub
Function Set_Periority(PerVal As Integer)
'PerVal : The Periority Value Needed To be Selected
    On Error Resume Next
    Dim Temp As Integer, Index As Integer
    Index = Dwn_Items.SelectedItem.Index
   'Previuos Periority
    Temp = CurrentItems(Index - 1).Periority
    CurrentItems(Index - 1).Periority = PerVal
    Dwn_Items.ListItems(Index).SubItems(1) = PerVal
   'Check Avtive To UnActive Periorities
    If Temp < 2 And PerVal > 1 Then
        ActiveItems = ActiveItems + 1
    ElseIf Temp > 1 And PerVal < 2 Then
        ActiveItems = ActiveItems - 1
    End If
   'Call The DownLoadMnager
    DownloadEngine
End Function
Private Function GetStringPeriority(PerVal As Byte) As String
   'Function Used To Return The String Description Of Passed Integer Periority (0 -- 5)
    On Error Resume Next
    Select Case PerVal
           Case 0 'Paused
                GetStringPeriority = "Paused"
           Case 1 'Waitting
                GetStringPeriority = "Waitting"
           Case 2 'Low
                GetStringPeriority = "Low"
           Case 3 'Normal
                GetStringPeriority = "Normal"
           Case 4 'High
                GetStringPeriority = "High"
           Case 5 'Highest
                GetStringPeriority = "Highest"
    End Select
End Function
Private Function IsFileExist(FilePath As String, IType As Integer) As Integer
    'The Function Checks The EXistance of the file
    'In the list view / disk / and previous downloaded files
    'IType indecates if the File is normal file or System file
    'The System file may not show any notification message to user and treat the errors alone
    On Error GoTo SuccessfulCheck
    Dim i As Integer 'General Procedure Variable
    Dim Fname As String 'The Name Only of the file
    Dim To_Path As String 'The Destination Path
    Fname = Mid$(FilePath, InStrRev(FilePath, "\") + 1)
    To_Path = DwnDirectory & Fname & DwnExtension
       'Check Current Downloading items
        For i = 1 To CTS
            If FilePath = Dwn_Items.ListItems(i).Key Then
               'Check Failed
                If IType = 0 Then 'Normail file
                    IsFileExist = FNormalCurrentlyDownloaded
                Else
                    IsFileExist = FSystemCurrentlyDownloaded
                End If
                Exit Function
            End If
        Next i
       'Check File Is Exit On The Disk Now
        If CStr(CBool(PathFileExists(To_Path))) = True Then
            'Check Found The File Already exist on the hard disk
            If IType = 0 Then 'Normal File
                IsFileExist = FNormalExistOnDisk
            Else
                IsFileExist = FSystemExistOnDisk
            End If
            Exit Function
        End If
       'Check Previusly successfully downloaded
        If IType = 0 Then
            For i = 0 To UBound(PreFiles)
                If Fname = PreFiles(i) Then
                    'Check Found That The File Is Previuosly Successfully downloaded
                     IsFileExist = FNormalPreDownloaded
                     Exit Function
                End If
            Next
        End If
SuccessfulCheck:
    IsFileExist = FNotExist 'Good File
End Function
Public Function Accept_File_Disk(FilePath As String, FileSize As Long, Optional IType As Integer = 0, Optional NComment As String = "New Threat !")
   'IType is a variable , indecates if the file needs to be Checked (by default) or no
   'If No ,Don't call IsFileExist and if it in the current downloaded items ,Then Add sequance of numbers (Such File1,File2,File3,...)
   'Also if file is present on the disk then , change the name and write a comment that the file is system file (Search data,loger data,FeedBack's,....)
    On Error Resume Next
   'Check Lenght
    If FileSize <= 0 Then
        MsgBox "Zero File Size ,There Is Need to download it !", vbExclamation, AppName
        Exit Function
    End If
    Dim Temp As Integer, Fname As String, Item As Downloadable_Item, mYUrl As String
   'Fetch The File Name
    Fname = Mid$(FilePath, InStrRev(FilePath, "\") + 1) 'The File name
   'Check FileName Lenght
    If Len(Fname) > Len(Item.FFName) Then
        MsgBox "Length of The File Name acceed The Max Allawable Length" & vbCrLf & _
        vbCrLf & "Max Allawable FileName Length : [" & Len(Item.FFName) & " Byte]" & _
        vbCrLf & "Hint : [Rename The File To Smallest Lenght]", vbExclamation, AppName
        Exit Function
    End If
   'Fetch The Url
    mYUrl = Mid$(FilePath, 1, Len(FilePath) - Len(Fname)) 'Url without filename
    If Len(Fname) > Len(Item.FURL) Then
        MsgBox "Length of directory depth Of this file exccees the max allawable length" & vbCrLf & _
        vbCrLf & "Max Allawable Directory Depth Length : [" & Len(Item.FURL) & " Byte]" & _
        vbCrLf & "Hint : [Copy The File To Another Path]", vbExclamation, AppName
        Exit Function
    End If
    Temp = IsFileExist(FilePath, IType)
   'Is Exist Code Here
    Select Case Temp
           Case FNormalCurrentlyDownloaded:
                MsgBox "File is currently downloading", vbCritical, AppName
                Exit Function
           Case FNormalExistOnDisk:
                MsgBox "File:- " & vbCrLf & "[" & DwnDirectory & Fname & DwnExtension & "]" & _
                vbCrLf & "Is Found On Ur Download folder,Remove It And Then Try Again", vbExclamation, AppName
                Exit Function
           Case FNormalPreDownloaded:
                If MsgBox("The File [" & Fname & "] Is Successfully downloaded Before,Download Again ?", vbInformation + vbYesNo, AppName) = vbNo Then
                    Exit Function
                End If
               'Destination file name is the same of Source file name
                Item.TFName = Fname
           Case FSystemCurrentlyDownloaded:
               'Remove The Item Before Download comming file
                RemoveItem CurrentItems(Dwn_Items.ListItems(FilePath).Index)
                Item.TFName = Fname
           Case FSystemExistOnDisk:
               'Change The Destination File Name
                Kill DwnDirectory & Fname & DwnExtension
                Item.TFName = Fname
           Case Else
               'Destination file name is the same of Source file name
                Item.TFName = Fname
           End Select
   'Add The file to current_files
    Item.FFName = Fname
    Item.FURL = mYUrl
    Item.FPcName = Current_PC 'The PcName of The Current Connected PC(Source of the file)
    Item.Size = FileSize
   'Proccess Periority Approash
    If ActiveItems >= MaxActiveThreats Then
        If IType = 0 Then 'Normal File
            Item.Periority = Waitting 'Resume The Threats In The Pause mode
        Else 'Sstem File
            'Stop The Last Active Download
            For i = CTS To 1 Step -1
                If (CurrentItems(i - 1).Periority > Waitting And CurrentItems(i - 1).Type = Asc("D")) Then
                    'Item Found And Then It pused , so that The Comming System File Will take Place
                    CurrentItems(i - 1).Periority = Waitting
                    Dwn_Items.ListItems(i).SubItems(1) = Waitting
                    Item.Periority = Highest
                    Exit For
                End If
            Next i
        End If
    Else 'Empty place for new comming order
        If IType = 0 Then 'Normal File
            Item.Periority = Normal
        Else 'System File
            Item.Periority = Highest
        End If
        'Increase The Activeitems Counter
        ActiveItems = ActiveItems + 1
    End If
    Item.Done = 0 'Spacify a zero as start done size of the file
    If IType = 0 Then 'Normal File
        Item.Type = Asc("D") 'Normal Disk File
    Else
        Item.Type = Asc("S") 'System File
    End If
    Item.Comment = NComment
    Item.StartTime = Now 'Set The Start Time Of The Therat
   'Add the file to the current items buffer
    ReDim Preserve CurrentItems(CTS)
    CurrentItems(CTS) = Item
    CTS = CTS + 1
   'Write The File Entries to the disk
    Dim FFile As Integer
    FFile = FreeFile
    Open INICurrentThreatsPath For Random As FFile Len = Len(Item)
        Seek #FFile, FileLen(INICurrentThreatsPath)
        Put #FFile, CTS, Item
    Close FFile
   'Show The Item Entries In The List View
    ShowItem Item
   'Call The Download Engine
    If EngineIsActivated = False Then DownloadEngine
End Function
Private Function RemoveItem(Item As Downloadable_Item)
    On Error Resume Next
    Dim i As Integer 'General Counter
    Dim Index As Integer 'Index of the Downloaded Item
    Index = Dwn_Items.ListItems(Trim$(Item.FURL) & Trim$(Item.FFName)).Index
   'Remove From CurrentItems First
    If Item.Periority > Waitting Then ActiveItems = ActiveItems - 1
    For i = Index To CTS - 1
        'Replace Items
         CurrentItems(i - 1) = CurrentItems(i)
    Next i
    CTS = CTS - 1
   'Remove From The Hard
    Kill INICurrentThreatsPath
    DoEvents
    Dim FFile As String
    FFile = FreeFile
    Open INICurrentThreatsPath For Random As FFile Len = Len(Item)
        For i = 0 To CTS - 1
            Put #FFile, i + 1, CurrentItems(i)
        Next i
    Close FFile
   'Remove From List View
    Dwn_Items.ListItems.Remove (Index)
    DoEvents
End Function
Public Function Error_Handel(FilePath)
    On Error GoTo FailedToHandel
    Dim Index As Integer
    Index = Dwn_Items.ListItems(FilePath).Index
   'Stop The Threat
    If CurrentItems(Index - 1).Periority <> Pause Then
        ActiveItems = ActiveItems - 1
        CurrentItems(Index - 1).Periority = Pause
       'Check Next Waitting Threat
        Dim i As Integer
        For i = 0 To CTS 'Scan all Items
            If CurrentItems(i).Periority = Waitting Then
               'Item Found
                CurrentItems(i).Periority = Normal
                Dwn_Items.ListItems(i + 1).SubItems(1) = Normal
                ActiveItems = ActiveItems + 1
            End If
        Next i
    End If
   'Update The Periority
    Dwn_Items.ListItems(Index).SubItems(1) = Pause
FailedToHandel:
    'Error may be occur result from filpath is not in the current items !
End Function
Private Function LoadPreFileNames()
    'The Function Uses INIPreNames to load the file names
    On Error Resume Next
    Dim i As Long, Tmp As String
    i = FileLen(INIPreNamesPath)
    'Preper the buffer witch carry all file contents
    Tmp = String(i, vbNullChar)
    'Open the file
    Dim FFile As Integer
    FFile = FreeFile
    Open INIPreNamesPath For Binary As FFile
        Get FFile, , Tmp
    Close FFile
    'Analysis The File Contents
    PreFiles = Split(Tmp, Separator_Char)
    'File names is loaded successfully
End Function
Private Function ShowItem(Item As Downloadable_Item)
   'Show The Item Entries In The List View
    On Error Resume Next
    Tmp = Trim$(Item.FURL) & Trim$(Item.FFName)
    If Item.Type = Asc("D") Then
        Dwn_Items.ListItems.Add , Tmp, Trim$(Item.FFName), , 17 'Normal Disk iCON
    ElseIf Item.Type = Asc("W") Then
        Dwn_Items.ListItems.Add , Tmp, Trim$(Item.FFName), , 18 'Web iCON
    ElseIf Item.Type = Asc("S") Then
        Dwn_Items.ListItems.Add , Tmp, Trim$(Item.FFName), , 19 'System iCON
    End If
    Dim ProgressStep As Integer
    ProgressStep = Dwn_Items.ColumnHeaders(8).Width / 82
    With Dwn_Items.ListItems(Tmp)
        .SubItems(1) = Item.Periority  'Periority
        .SubItems(2) = Trim$(Item.FURL)  'From URL
        .SubItems(3) = String_Size(Item.Size) 'The File Size
        .SubItems(4) = String_Size(Item.Done) 'The File Done Size
        .SubItems(5) = String_Size(Item.Size - Item.Done) 'The Left Ammount
        .SubItems(6) = Round(Item.Done * 100 / Item.Size, 1) & " %" 'Percent
        .SubItems(7) = String(Int(Item.Done * ProgressStep / Item.Size), ")")  'Progress (Max 16 'l' Char's)
        .SubItems(8) = Trim$(Item.Comment) 'The Comment
    End With
End Function
Private Function LoadCurrentThreats()
   'The Function Uses INICurrentThreats to load the Current downloaded Threats
    On Error Resume Next
    Dim i As Long, Tmp As String
    i = FileLen(INICurrentThreatsPath)
   'Preper the buffer witch carry all file contents
    Tmp = String(i, vbNullChar)
   'Open the file
    Dim FFile As Integer, Item As Downloadable_Item
    FFile = FreeFile
    i = i / Len(Item) 'Number Of Files Etrieis inside the file
    Open INICurrentThreatsPath For Random As FFile Len = Len(Item)
       'Read The Files Information
        Do While Not EOF(FFile)
            Get #FFile, CTS + 1, Item
            Item.Periority = Pause 'Pause the downloaded threat as the default
            If CTS < i Then
               'Update The Cuurrent item
                ReDim Preserve CurrentItems(CTS)
                CurrentItems(CTS) = Item
                CTS = CTS + 1
               'Show The Item Entries In the List View
                ShowItem Item
            End If
        Loop
    Close FFile
       'Decrease in order to last loop witch is not valid
       'CTS = CTS - 1
    'File names is loaded successfully
End Function
Private Function UpdateSize(FilePath As String, nSize As Long)
   'Index is the index of the Will Updated Item
    On Error GoTo ErrorHappen
    Dim Index As Integer
    Index = Dwn_Items.ListItems(FilePath).Index
    On Error Resume Next
  'Update The Buffer Size
    CurrentItems(Index - 1).Done = CurrentItems(Index - 1).Done + nSize
    Dim ProgressStep As Double, ProgressVal As String
    ProgressStep = Dwn_Items.ColumnHeaders(8).Width / 82
    ProgressVal = String(Int(CurrentItems(Index - 1).Done * ProgressStep / CurrentItems(Index - 1).Size), ")")   'Progress (Max 16 'l' Char's)
  'Update The List View
    With Dwn_Items.ListItems(Index)
        .SubItems(4) = String_Size(CurrentItems(Index - 1).Done)
        .SubItems(5) = String_Size(CurrentItems(Index - 1).Size - CurrentItems(Index - 1).Done) 'The Left Ammount
        .SubItems(6) = Round((CurrentItems(Index - 1).Done / CurrentItems(Index - 1).Size * 100), 1) & " %" 'Percent
        .SubItems(7) = ProgressVal
    End With
  'Update The Disk INI file
    Dim FFile As Integer
    FFile = FreeFile
    Open INICurrentThreatsPath For Random As FFile Len = Len(CurrentItems(Index - 1))
        Put #FFile, Index, CurrentItems(Index - 1)
    Close #FFile
ErrorHappen:
    DoEvents
End Function
Public Function Accept_Data(FilePath As String, FileOffset As Long, Data As String)
   'Function Accepts The Data of the files and Organize/Store it
    On Error GoTo ResumeDownloadding
   'Increase The Sppeed Rate by the len of comming data
    SpeedValue = SpeedValue + Len(Data)
    Dim Index As Integer
   'select The Destination Threat
    Index = Dwn_Items.ListItems(FilePath).Index
    If Index = 0 Then GoTo ResumeDownloadding
   'Index is the destination file
    Dim LofFile As Long
    LofFile = CurrentItems(Index - 1).Size 'Length of the file
   'Destination file
    Dim ToPath As String
    ToPath = DwnDirectory & Trim$(CurrentItems(Index - 1).TFName) & DwnExtension '\Downloads\file.exe.Xdm
   'Check The Destination file
   'Check Existance
    If FileOffset > 1 Then 'Check If There is a Frame sended Before This Frame
        If CStr(CBool(PathFileExists(ToPath))) = False Then
            'File Is Deleted Manually
             If CurrentItems(Index - 1).Type <> Asc("S") Then MsgBox "Destination file [" & ToPath & "] Is Currently Unavailable!" & vbCrLf & "So Sorry I Cann't Complete This Threat.", vbCritical, AppName
             RemoveItem CurrentItems(Index - 1)
             Exit Function
        Else
           'Check File Is Manually Edited
            Dim ExpectedOffset As Long
            ExpectedOffset = FileLen(ToPath) + 1
           'No Errors When FileOffset = ExpectedOffset
            If FileOffset < ExpectedOffset Then
                'Manually Added > Discard The Old Data Comes And Resume Downloadding
                'Update The Done Entry In The Therat Info With The Exist-On-Disk Size
                 Dim TempInt As Long
                 TempInt = CurrentItems(Index - 1).Done
                 If ExpectedOffset - 1 > TempInt Then
                      UpdateSize FilePath, ExpectedOffset - 1 - TempInt
                 End If
                 GoTo ResumeDownloadding
            End If
        End If
    End If
   'Resume Work
   'Check Is Paused Threat
    If CurrentItems(Index - 1).Periority <= Waitting Then
        'Code Here
        'Exit Function 'Descard The Comming Frame Then
    End If
   'Start To Write The Comming Data
   'Check Last Frame of EOF sended
ResumeWork: 'Label For Feedback Approash
    Dim FeedBack As String
    If ((FileOffset + Len(Data)) > LofFile) And (Right$(Data, 3) = "EOF") Then
       'Last Frame , Call The Function To Write it To The Destination file
        FeedBack = Put_File_data(ToPath, Mid$(Data, 1, Len(Data) - 3), FileOffset)
        If FeedBack = "True" Then
            'Register The File Name as a previuosly Successfulled Downloaded File , and don't register System Files
            'If It Not Registered Before
             If CurrentItems(Index - 1).Type = Asc("S") Then
                'System File
                 ComplieSystemFiles ToPath, Trim$(CurrentItems(Index - 1).Comment)
             Else
                'Normal File
             Dim FFNmae As String
                 FFName = Trim$(CurrentItems(Index - 1).FFName)
                'Check Previuosly Registered
                 For i = 0 To UBound(PreFiles)
                    If FFName = PreFiles(i) Then GoTo Resume1
                 Next i
                 Dim FFile As Integer, Tmp As String
                 FFile = FreeFile
                 Open INIPreNamesPath For Binary Access Write As FFile
                    Seek #FFile, FileLen(INIPreNamesPath) + 1
                    Tmp = FFName & Separator_Char
                    Put #FFile, , Tmp
                 Close #FFile
                'Update The PreNames Array
                 ReDim Preserve PreFiles(UBound(PreFiles) + 1)
                 PreFiles(UBound(PreFiles)) = FFName
             End If
Resume1:
            'Remove The Threat
             RemoveItem CurrentItems(Index - 1)
            'Return The File To It'S Origenal Name
             Dim OrFileName As String
             OrFileName = Left$(ToPath, Len(ToPath) - Len(DwnExtension))
             If CStr(CBool(PathFileExists(OrFileName))) = True Then
                If CurrentItems(Index - 1).Type <> Asc("S") Then MsgBox "Destination File [" & OrFileName & "] Is Already Existed So The File Is Ready but within our Extinsion", vbExclamation, AppName
             Else
                Name ToPath As OrFileName
             End If
        Else
            'Error Happen Durring Writting,Show An Error Descreption To User with
            'Ability To Resume The Data After he Treat The Error
             MsgBox "Error Occurs While Writting To Disk" & vbCrLf & "Error Description : " & Mid$(FeedBack, InStrRev(FeedBack, Separator_Char) + 1), vbExclamation, AppName
             Error_Handel FilePath
        End If
    Else
        'Normal Frame
        FeedBack = Put_File_data(ToPath, Data, FileOffset)
        If FeedBack = "True" Then
            'Update The New File Size
             UpdateSize FilePath, Len(Data)
        Else
            'Error Happen Durring Writting,Show An Error Descreption To User with
            'Ability To Resume The Data After he Treat The Error
             MsgBox "An error occured while Writting to disk" & vbCrLf & "Error Description : " & Mid$(FeedBack, InStrRev(FeedBack, Separator_Char) + 1), vbExclamation, AppName
             Error_Handel FilePath
        End If
    End If
ResumeDownloadding:
    'FilePath is not in the Current Threats
    If EngineIsActivated = False Then DownloadEngine
End Function
Public Function DownloadEngine()
    Dim Index As Integer
    On Error Resume Next
    Dim i As Integer 'General Purpuse Counter
   'Speedy Check About Exist One Item At Least
    If CTS < 1 Then Exit Function 'There is no Threats Now
   'Check If There Is Waitting State
    i = 1 'Start Scan From First Item In The List
    Do While (ActiveItems < MaxActiveThreats) And (i <= CTS)
        If CurrentItems(i - 1).Periority = Waitting Then 'Wait State
            CurrentItems(i - 1).Periority = Normal
            Dwn_Items.ListItems(i).SubItems(1) = Normal
            ActiveItems = ActiveItems + 1
        End If
        i = i + 1
    Loop
   'Check Active Items Exist ??
    If ActiveItems < 1 Then Exit Function
   'Selecting The Lucky Threat
   'To Make The Selection Depend On The Periority First B4 FCFS , Start The Scan After The Previuos Selected ThREAT
    i = 0
    i = Dwn_Items.ListItems(PreVThreat).Index
    i = i + 1
    Dim RndVal As Integer
    Do While (Index = 0)
        If i > CTS Then i = 1 'Scan Is Wraped Around
        RndVal = Rnd * 1000
        If (CurrentItems(i - 1).Periority > Waitting) And (RndVal Mod (6 - (CurrentItems(i - 1).Periority))) = 0 Then
            Index = i
            PreVThreat = Dwn_Items.ListItems(i).Key
        End If
        i = i + 1
    Loop
   'Check If Active Item
    If CurrentItems(Index - 1).Periority > Waitting Then
       'Send Order To Server
        If Frm_Main.Send_Data((Chr$(143) & Char_Representation(CurrentItems(Index - 1).Done + 1) & Dwn_Items.ListItems(Index).Key)) = False Then
            CurrentItems(Index - 1).Periority = Pause
            Dwn_Items.ListItems(Index).SubItems(1) = Pause
            ActiveItems = ActiveItems - 1
        End If
    End If
End Function
Private Sub Form_Load()
    Dim i As Integer
   'Load Pictures in the Images Buttons
    For i = 0 To Buttons.UBound
        Buttons(i).Picture = ImageList1.ListImages(i + 1).Picture
    Next
    DwnDirectory = App.Path & "\Downloads\"
    INICurrentThreatsPath = App.Path & "\INI\" & INICurrentThreats
    INIPreNamesPath = App.Path & "\INI\" & INIPreNames
   'Set The UpTime
    StartUpTime = Now
   'Load INI files
    LoadPreFileNames
    LoadCurrentThreats
End Sub
