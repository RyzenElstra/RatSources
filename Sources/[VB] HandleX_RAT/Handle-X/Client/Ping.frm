VERSION 5.00
Begin VB.Form Ping 
   Appearance      =   0  'Flat
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   Caption         =   "X-Ping V1.0"
   ClientHeight    =   6030
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6450
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HasDC           =   0   'False
   Icon            =   "Ping.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   6030
   ScaleMode       =   0  'User
   ScaleWidth      =   6216.867
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Inputs 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   4
      Left            =   2520
      TabIndex        =   18
      Text            =   "2000"
      Top             =   3690
      Width           =   3795
   End
   Begin VB.TextBox Output 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
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
      ForeColor       =   &H00FFFFFF&
      Height          =   1125
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   15
      Top             =   4320
      Width           =   6195
   End
   Begin VB.TextBox Inputs 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Index           =   3
      Left            =   2520
      MaxLength       =   6
      TabIndex        =   13
      Text            =   "1"
      Top             =   2920
      Width           =   3795
   End
   Begin VB.OptionButton PacketNo 
      BackColor       =   &H00FFFFFF&
      Caption         =   "UnLimited (Unlimited Number , It Will Be Ping until you Stop) ."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   1
      Left            =   240
      TabIndex        =   12
      Top             =   2580
      Width           =   6075
   End
   Begin VB.OptionButton PacketNo 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Custamized Number :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   2
      Left            =   240
      TabIndex        =   11
      Top             =   2940
      Width           =   2175
   End
   Begin VB.OptionButton PacketNo 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Single Packet (The Packet Will Be Sended To The Host once) ."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   0
      Left            =   240
      TabIndex        =   10
      Top             =   2220
      Width           =   6075
   End
   Begin VB.TextBox Inputs 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   2
      Left            =   2520
      TabIndex        =   8
      Text            =   "9"
      Top             =   1530
      Width           =   3795
   End
   Begin VB.TextBox Inputs 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   1
      Left            =   2520
      TabIndex        =   6
      Text            =   "Echo This"
      Top             =   1200
      Width           =   3795
   End
   Begin VB.TextBox Inputs 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   250
      Index           =   0
      Left            =   2520
      TabIndex        =   5
      Top             =   480
      Width           =   3855
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "The Packet Size :-"
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
      Height          =   225
      Index           =   9
      Left            =   240
      TabIndex        =   23
      Top             =   1540
      Width           =   2145
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "The Packet String :-"
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
      Height          =   225
      Index           =   2
      Left            =   240
      TabIndex        =   22
      Top             =   1240
      Width           =   2145
   End
   Begin VB.Label Link 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Exit"
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   2
      Left            =   4260
      MouseIcon       =   "Ping.frx":0CCA
      MousePointer    =   99  'Custom
      TabIndex        =   21
      ToolTipText     =   "Exit X-Pinger V1.0"
      Top             =   5640
      Width           =   1665
   End
   Begin VB.Label Link 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Stop"
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   1
      Left            =   2370
      MouseIcon       =   "Ping.frx":0FD4
      MousePointer    =   99  'Custom
      TabIndex        =   20
      ToolTipText     =   "Stop Pingging Operation"
      Top             =   5640
      Width           =   1665
   End
   Begin VB.Label Link 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "GO !"
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   0
      Left            =   480
      MouseIcon       =   "Ping.frx":12DE
      MousePointer    =   99  'Custom
      TabIndex        =   19
      ToolTipText     =   "Ping The Host IP"
      Top             =   5640
      Width           =   1665
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "TimeOut In Milliseconds :-"
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
      Height          =   225
      Index           =   1
      Left            =   300
      TabIndex        =   17
      Top             =   3720
      Width           =   2145
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Packet Information :"
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
      Left            =   300
      TabIndex        =   16
      Top             =   3420
      Width           =   1695
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   1
      X1              =   0
      X2              =   6187.952
      Y1              =   6000
      Y2              =   6000
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Replay :"
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
      TabIndex        =   14
      Top             =   4080
      Width           =   735
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   1335
      Index           =   1
      Left            =   60
      Top             =   4200
      Width           =   6315
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Number Of Packets :-"
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
      Left            =   240
      TabIndex        =   9
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   1275
      Index           =   0
      Left            =   60
      Top             =   2040
      Width           =   6315
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Packet Information :"
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
      TabIndex        =   7
      Top             =   900
      Width           =   1695
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   855
      Index           =   2
      Left            =   60
      Top             =   1020
      Width           =   6315
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Host Name Or IP Address :-"
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
      Height          =   225
      Index           =   0
      Left            =   240
      TabIndex        =   4
      Top             =   520
      Width           =   2145
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   " X-Pinger V1.0"
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
      TabIndex        =   3
      Top             =   60
      Width           =   5400
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
      Left            =   6120
      MouseIcon       =   "Ping.frx":15E8
      MousePointer    =   99  'Custom
      TabIndex        =   2
      ToolTipText     =   "Exit X-Downloader V1.0"
      Top             =   60
      Width           =   255
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   1
      X1              =   14.458
      X2              =   0
      Y1              =   0
      Y2              =   6000
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   0
      X1              =   6187.952
      X2              =   6187.952
      Y1              =   -60
      Y2              =   6000
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   2
      X1              =   0
      X2              =   6187.952
      Y1              =   840
      Y2              =   840
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   0
      X1              =   0
      X2              =   6187.952
      Y1              =   360
      Y2              =   360
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
      Left            =   5520
      MouseIcon       =   "Ping.frx":18F2
      MousePointer    =   99  'Custom
      TabIndex        =   1
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
      Left            =   5820
      MouseIcon       =   "Ping.frx":1BFC
      MousePointer    =   99  'Custom
      TabIndex        =   0
      ToolTipText     =   "Minimize"
      Top             =   60
      Width           =   255
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   11
      X1              =   0
      X2              =   6187.952
      Y1              =   15
      Y2              =   15
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   495
      Index           =   3
      Left            =   120
      Top             =   3540
      Width           =   6315
   End
End
Attribute VB_Name = "Ping"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'My Variables
Dim b As Integer, C As Integer, a As Boolean   'Variables Needed for the movinfg of the editor

'Constatnts
Private Const IP_SUCCESS As Long = 0
Private Const IP_STATUS_BASE As Long = 11000
Private Const IP_BUF_TOO_SMALL As Long = (IP_STATUS_BASE + 1)
Private Const IP_DEST_NET_UNREACHABLE As Long = (IP_STATUS_BASE + 2)
Private Const IP_DEST_HOST_UNREACHABLE As Long = (IP_STATUS_BASE + 3)
Private Const IP_DEST_PROT_UNREACHABLE As Long = (IP_STATUS_BASE + 4)
Private Const IP_DEST_PORT_UNREACHABLE As Long = (IP_STATUS_BASE + 5)
Private Const IP_NO_RESOURCES As Long = (IP_STATUS_BASE + 6)
Private Const IP_BAD_OPTION As Long = (IP_STATUS_BASE + 7)
Private Const IP_HW_ERROR As Long = (IP_STATUS_BASE + 8)
Private Const IP_PACKET_TOO_BIG As Long = (IP_STATUS_BASE + 9)
Private Const IP_REQ_TIMED_OUT As Long = (IP_STATUS_BASE + 10)
Private Const IP_BAD_REQ As Long = (IP_STATUS_BASE + 11)
Private Const IP_BAD_ROUTE As Long = (IP_STATUS_BASE + 12)
Private Const IP_TTL_EXPIRED_TRANSIT As Long = (IP_STATUS_BASE + 13)
Private Const IP_TTL_EXPIRED_REASSEM As Long = (IP_STATUS_BASE + 14)
Private Const IP_PARAM_PROBLEM As Long = (IP_STATUS_BASE + 15)
Private Const IP_SOURCE_QUENCH As Long = (IP_STATUS_BASE + 16)
Private Const IP_OPTION_TOO_BIG As Long = (IP_STATUS_BASE + 17)
Private Const IP_BAD_DESTINATION As Long = (IP_STATUS_BASE + 18)
Private Const IP_ADDR_DELETED As Long = (IP_STATUS_BASE + 19)
Private Const IP_SPEC_MTU_CHANGE As Long = (IP_STATUS_BASE + 20)
Private Const IP_MTU_CHANGE As Long = (IP_STATUS_BASE + 21)
Private Const IP_UNLOAD As Long = (IP_STATUS_BASE + 22)
Private Const IP_ADDR_ADDED As Long = (IP_STATUS_BASE + 23)
Private Const IP_GENERAL_FAILURE As Long = (IP_STATUS_BASE + 50)
Private Const MAX_IP_STATUS As Long = (IP_STATUS_BASE + 50)
Private Const IP_PENDING As Long = (IP_STATUS_BASE + 255)

Private Const WS_VERSION_REQD As Long = &H101
Private Const MIN_SOCKETS_REQD As Long = 1
Private Const SOCKET_ERROR As Long = -1
Private Const INADDR_NONE As Long = &HFFFFFFFF
Private Const MAX_WSADescription As Long = 256
Private Const MAX_WSASYSStatus As Long = 128
Private Const MAX_PACKET_SIZE As Long = 2 ^ 18
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

Private Type WSADATA
   wVersion As Integer
   wHighVersion As Integer
   szDescription(0 To MAX_WSADescription) As Byte
   szSystemStatus(0 To MAX_WSASYSStatus) As Byte
   wMaxSockets As Long
   wMaxUDPDG As Long
   dwVendorInfo As Long
End Type

Private Declare Function gethostbyname Lib "wsock32" (ByVal hostname As String) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (xDest As Any, xSource As Any, ByVal nbytes As Long)
Private Declare Function lstrlenA Lib "kernel32" (lpString As Any) As Long
Private Declare Function WSAStartup Lib "wsock32" (ByVal wVersionRequired As Long, lpWSADATA As WSADATA) As Long
Private Declare Function WSACleanup Lib "wsock32" () As Long
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
Private Declare Function inet_addr Lib "wsock32" (ByVal s As String) As Long
Private Declare Function inet_ntoa Lib "wsock32.dll" (ByVal addr As Long) As Long
Private Declare Function lstrcpyA Lib "kernel32" (ByVal RetVal As String, ByVal Ptr As Long) As Long
'Variables
Dim ECHOT As ICMP_ECHO_REPLY
Private StopFlag As Boolean
Private Packet As String
Private PING_TIMEOUT As Long
Public Sub ExecutePing(IPAddress As String)
    Me.Show
    Inputs(0) = IPAddress
    Link_Click 0
End Sub
Private Sub Form_Load()
    PacketNo(0).Value = True
    Set_Text_Box_Number Inputs(2), True
    Set_Text_Box_Number Inputs(3), True
End Sub
Private Sub Inputs_Change(Index As Integer)
    Select Case Index
           Case 0
                  
           Case 1
                  Inputs(2) = Len(Inputs(1))
           Case 2
                  If Val(Inputs(Index)) > MAX_PACKET_SIZE Then
                        MsgBox "Maximum Packet Size Is : " & String_Size(MAX_PACKET_SIZE), vbExclamation, apnname
                        Inputs(Index) = MAX_PACKET_SIZE
                  End If
           Case 3

    End Select
End Sub
Private Sub Inputs_LostFocus(Index As Integer)
    Inputs(Index) = Trim$(Inputs(Index))
    Select Case Index
           Case 0
           
           Case 1
                  
           Case 2
           
    End Select
End Sub
Private Sub Link_Click(Index As Integer)
 Select Case Index
  Case 0
    StopFlag = False
    Link(0).Enabled = False
    Dim Times As Long, sIPAddress As String
    If Len(Inputs(0)) < 1 Then
         MsgBox "Input The Host Name First!", vbExclamation, AppName
         Exit Sub
    End If
   'Gathering Information
    Times = IIf(PacketNo(1).Value = True, 0, Val(Inputs(3)))
    Packet = IIf(Val(Inputs(2)) = Len(Inputs(1)), Inputs(1), String(Val(Inputs(2)), " "))
    PING_TIMEOUT = Val(Inputs(4))
    If CheckIPAddress(Inputs(0)) = True Then
        'IP Address
         AddText Output, "Pinging [" & Router.GetHostNameFromIP(Inputs(0)) & "  :  " & Inputs(0) & "] ..."
         sIPAddress = Inputs(0)
    Else
        'Host Name
         sIPAddress = GetIPFromHostName(Inputs(0))
         AddText Output, "Pinging [" & Inputs(0) & "  :  " & sIPAddress & "] ..."
    End If
   'Ping sIPaddress ...
    Dim Success As Long, Cnt As Long, Msg As String
    If SocketsInitialize() Then
          Do While ((Times = 0) Or (Cnt < Times)) And (Not (StopFlag))
             Msg = ""
             Success = Ping(sIPAddress, Packet, ECHOT) 'Ping Instruction
             If Times > 0 Then Cnt = Cnt + 1
             If Success = 0 Then
                Msg = "Replay From : [" & sIPAddress & "] ,Bytes : [" & String_Size(ECHOT.DataSize) & "] ,TripTime : [" & ECHOT.RoundTripTime & " ms]"
             Else
                Msg = " Error : [" & GetStatusCode(Success) & "]"
             End If
             AddText Output, Msg, 1
             Delay 100000
          Loop
      SocketsCleanup
      AddText Output, vbCrLf & "X-Pinger V1.0 Finished It's Work !", 1
      Link(0).Enabled = True
   Else
        AddText Output, "Failed To Initialize WIN32 Sockets.", 1
   End If
 Case 1 'Stop
    StopFlag = True
 Case 2 'End
    StopFlag = True
    Unload Me
End Select
End Sub
Private Function Ping(sAddress As String, sDataToSend As String, Echo As ICMP_ECHO_REPLY) As Long
  'If Ping fails .Status will be the error code
   Dim hPort As Long
   Dim dwAddress As Long
  'Convert the address into a long representation
   dwAddress = inet_addr(sAddress)
   If dwAddress <> INADDR_NONE Then
      hPort = IcmpCreateFile()
      If hPort Then
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
Public Function GetIPFromHostName(ByVal sHostName As String) As String
  'converts a host name to an IP address
   Dim ptrHosent As Long  'address of HOSENT structure
   Dim ptrName As Long    'address of name pointer
   Dim ptrAddress As Long 'address of address pointer
   Dim ptrIPAddress As Long
   Dim ptrIPAddress2 As Long
   ptrHosent = gethostbyname(sHostName & vbNullChar)
   If ptrHosent <> 0 Then
      ptrName = ptrHosent
      ptrAddress = ptrHosent + 12
     'get the IP address
      CopyMemory ptrName, ByVal ptrName, 4
      CopyMemory ptrAddress, ByVal ptrAddress, 4
      CopyMemory ptrIPAddress, ByVal ptrAddress, 4
      CopyMemory ptrIPAddress2, ByVal ptrIPAddress, 4
      GetIPFromHostName = GetInetStrFromPtr(ptrIPAddress2)
   End If
End Function
Private Function GetStrFromPtrA(ByVal lpszA As Long) As String
   GetStrFromPtrA = String$(lstrlenA(ByVal lpszA), 0)
   Call lstrcpyA(ByVal GetStrFromPtrA, ByVal lpszA)
End Function
Private Function GetInetStrFromPtr(Address As Long) As String
   GetInetStrFromPtr = GetStrFromPtrA(inet_ntoa(Address))
End Function
Private Sub SocketsCleanup()
   If WSACleanup() <> 0 Then
       MsgBox "Windows Sockets error occurred in Cleanup.", vbExclamation
   End If
End Sub
Private Function SocketsInitialize() As Boolean
   Dim WSAD As WSADATA
   SocketsInitialize = WSAStartup(WS_VERSION_REQD, WSAD) = IP_SUCCESS
End Function
Private Function GetStatusCode(status As Long) As String
   Dim Msg As String
   Select Case status
      Case IP_SUCCESS:               Msg = "IP success"
      Case INADDR_NONE:              Msg = "inet_addr: bad IP format"
      Case IP_BUF_TOO_SMALL:         Msg = "IP buffer too_small"
      Case IP_DEST_NET_UNREACHABLE:  Msg = "IP dest net unreachable"
      Case IP_DEST_HOST_UNREACHABLE: Msg = "IP dest host unreachable"
      Case IP_DEST_PROT_UNREACHABLE: Msg = "IP dest prot unreachable"
      Case IP_DEST_PORT_UNREACHABLE: Msg = "IP dest port unreachable"
      Case IP_NO_RESOURCES:          Msg = "IP no resources"
      Case IP_BAD_OPTION:            Msg = "IP bad option"
      Case IP_HW_ERROR:              Msg = "IP hw_error"
      Case IP_PACKET_TOO_BIG:        Msg = "IP packet too_big"
      Case IP_REQ_TIMED_OUT:         Msg = "IP req timed out"
      Case IP_BAD_REQ:               Msg = "IP bad req"
      Case IP_BAD_ROUTE:             Msg = "IP bad route"
      Case IP_TTL_EXPIRED_TRANSIT:   Msg = "IP ttl expired transit"
      Case IP_TTL_EXPIRED_REASSEM:   Msg = "IP ttl expired reassem"
      Case IP_PARAM_PROBLEM:         Msg = "IP param_problem"
      Case IP_SOURCE_QUENCH:         Msg = "IP source quench"
      Case IP_OPTION_TOO_BIG:        Msg = "IP option too_big"
      Case IP_BAD_DESTINATION:       Msg = "IP bad destination"
      Case IP_ADDR_DELETED:          Msg = "IP addr deleted"
      Case IP_SPEC_MTU_CHANGE:       Msg = "IP spec mtu change"
      Case IP_MTU_CHANGE:            Msg = "IP mtu_change"
      Case IP_UNLOAD:                Msg = "IP unload"
      Case IP_ADDR_ADDED:            Msg = "IP addr added"
      Case IP_GENERAL_FAILURE:       Msg = "IP general failure"
      Case IP_PENDING:               Msg = "IP pending"
      Case PING_TIMEOUT:             Msg = "Ping timeout"
      Case Else:                     Msg = "Unknown msg returned"
   End Select
   GetStatusCode = Msg
End Function
Private Sub Inputs_GotFocus(Index As Integer)
    'Select the whole text
     Inputs(Index).SelStart = 0
     Inputs(Index).SelLength = Len(Inputs(Index))
End Sub
Private Sub Inputs_KeyPress(Index As Integer, KeyAscii As Integer)
    If KeyAscii = 13 Then
        If Index = 0 Or Index = 1 Then Link_Click (0)
    End If
End Sub
Private Sub Control_Box_Click(Index As Integer)
Select Case Index
    Case 0 'Hide
        Unload Me
    Case 1 'Minimize
        Me.WindowState = 1
    Case 2 'Help
        MsgBox "X-Router V1.0 Can Bring IPnumber,Country Name And Coutry Code Of The Inserted IP Address", vbInformation, AppName
End Select
End Sub
Private Sub Link_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Link(Index).BackColor = &HE0E0E0
End Sub
Private Sub Link_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Link(Index).BackColor = vbWhite
End Sub
Private Sub PacketNo_Click(Index As Integer)
    Inputs(3).Enabled = (PacketNo(2).Value)
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
