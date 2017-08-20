VERSION 5.00
Begin VB.Form Router 
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   Caption         =   "X-Router V1.0"
   ClientHeight    =   3015
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6135
   Icon            =   "Router.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   6135
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox RouterData 
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
      IMEMode         =   3  'DISABLE
      Index           =   4
      Left            =   1920
      Locked          =   -1  'True
      TabIndex        =   19
      Top             =   1080
      Width           =   4095
   End
   Begin VB.TextBox RouterData 
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
      IMEMode         =   3  'DISABLE
      Index           =   1
      Left            =   1920
      Locked          =   -1  'True
      TabIndex        =   14
      Top             =   1440
      Width           =   3135
   End
   Begin VB.TextBox RouterData 
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
      IMEMode         =   3  'DISABLE
      Index           =   2
      Left            =   1920
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   1800
      Width           =   3135
   End
   Begin VB.TextBox RouterData 
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
      IMEMode         =   3  'DISABLE
      Index           =   3
      Left            =   1920
      Locked          =   -1  'True
      TabIndex        =   12
      Top             =   2160
      Width           =   3135
   End
   Begin VB.PictureBox Progress 
      Appearance      =   0  'Flat
      BackColor       =   &H00A77236&
      ForeColor       =   &H80000008&
      Height          =   120
      Index           =   1
      Left            =   120
      ScaleHeight     =   90
      ScaleWidth      =   0
      TabIndex        =   10
      Top             =   750
      Width           =   15
      Begin VB.PictureBox Progress 
         Appearance      =   0  'Flat
         BackColor       =   &H00A77236&
         ForeColor       =   &H80000008&
         Height          =   90
         Index           =   2
         Left            =   0
         ScaleHeight     =   60
         ScaleWidth      =   5865
         TabIndex        =   11
         Top             =   2080
         Width           =   5895
      End
   End
   Begin VB.PictureBox Progress 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   120
      Index           =   0
      Left            =   120
      ScaleHeight     =   90
      ScaleWidth      =   5865
      TabIndex        =   9
      Top             =   750
      Width           =   5895
   End
   Begin VB.TextBox RouterData 
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
      IMEMode         =   3  'DISABLE
      Index           =   0
      Left            =   1920
      TabIndex        =   5
      Top             =   440
      Width           =   4095
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Host Name"
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
      Index           =   5
      Left            =   120
      TabIndex        =   18
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   1080
      Width           =   1575
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "IP Number"
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
      Left            =   120
      TabIndex        =   17
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   1440
      Width           =   1575
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Country Code"
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
      Left            =   120
      TabIndex        =   16
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   1800
      Width           =   1575
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Country Name"
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
      Index           =   2
      Left            =   120
      TabIndex        =   15
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   2160
      Width           =   1575
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   11
      X1              =   0
      X2              =   6120
      Y1              =   20
      Y2              =   20
   End
   Begin VB.Image Flag 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   5280
      Picture         =   "Router.frx":0CCA
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Flag"
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
      Index           =   4
      Left            =   5160
      TabIndex        =   8
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   1440
      Width           =   855
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
      Left            =   5520
      MouseIcon       =   "Router.frx":0FFD
      MousePointer    =   99  'Custom
      TabIndex        =   7
      ToolTipText     =   "Minimize"
      Top             =   60
      Width           =   255
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
      Left            =   5220
      MouseIcon       =   "Router.frx":1307
      MousePointer    =   99  'Custom
      TabIndex        =   6
      ToolTipText     =   "Help ?"
      Top             =   60
      Width           =   255
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   3
      X1              =   0
      X2              =   6120
      Y1              =   2520
      Y2              =   2520
   End
   Begin VB.Label RouterButtons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Execute Router"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   0
      Left            =   960
      MouseIcon       =   "Router.frx":1611
      MousePointer    =   99  'Custom
      TabIndex        =   4
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   2640
      Width           =   1695
   End
   Begin VB.Label RouterButtons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Exit Router"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   1
      Left            =   3600
      MouseIcon       =   "Router.frx":191B
      MousePointer    =   99  'Custom
      TabIndex        =   3
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   2640
      Width           =   1695
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   1
      X1              =   0
      X2              =   6120
      Y1              =   3000
      Y2              =   3000
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   0
      X1              =   0
      X2              =   6120
      Y1              =   360
      Y2              =   360
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   8
      X1              =   5160
      X2              =   5160
      Y1              =   340
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   2
      X1              =   0
      X2              =   6120
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   0
      X1              =   6120
      X2              =   6120
      Y1              =   0
      Y2              =   3000
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   1
      X1              =   15
      X2              =   15
      Y1              =   0
      Y2              =   3000
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
      Left            =   5820
      MouseIcon       =   "Router.frx":1C25
      MousePointer    =   99  'Custom
      TabIndex        =   2
      ToolTipText     =   "Exit X-Downloader V1.0"
      Top             =   60
      Width           =   255
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   " X-Router V1.0"
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
      TabIndex        =   1
      Top             =   60
      Width           =   5040
   End
   Begin VB.Label Indecator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "IP Address"
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
      Left            =   120
      TabIndex        =   0
      ToolTipText     =   "The Spped Of Downloadding"
      Top             =   440
      Width           =   1575
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   7
      X1              =   1800
      X2              =   1800
      Y1              =   2520
      Y2              =   360
   End
   Begin VB.Shape Shape1 
      BackStyle       =   1  'Opaque
      Height          =   615
      Left            =   5160
      Top             =   1800
      Width           =   855
   End
End
Attribute VB_Name = "Router"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'System Constants and declerations
Private Const WSADescription_Len As Long = 256
Private Const WSASYS_Status_Len As Long = 128
Private Const WS_VERSION_REQD As Long = &H101
Private Const IP_SUCCESS As Long = 0
Private Const AF_INET As Long = 2

Private Type WSADATA
  wVersion As Integer
  wHighVersion As Integer
  szDescription(0 To WSADescription_Len) As Byte
  szSystemStatus(0 To WSASYS_Status_Len) As Byte
  imaxsockets As Integer
  imaxudp As Integer
  lpszvenderinfo As Long
End Type

Private Declare Function WSAStartup Lib "wsock32" (ByVal VersionReq As Long, WSADataReturn As WSADATA) As Long
Private Declare Function WSACleanup Lib "wsock32" () As Long
Private Declare Function gethostbyaddr Lib "wsock32" (haddr As Long, ByVal hnlen As Long, ByVal addrtype As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (xDest As Any, xSource As Any, ByVal nbytes As Long)
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (lpString As Any) As Long

'My Variables
Dim b As Integer, C As Integer, a As Boolean   'Variables Needed for the movinfg of the editor
Private DBPath As String, DBFileNumber As Integer
Private FlagsPath As String
Private Sub Form_Load()
    DBPath = App.Path & "\Public Data\GeoIPCountryWhois.dat"
    FlagsPath = App.Path & "\Public Data"
    If CStr(CBool(PathFileExists(DBPath))) = False Then
        MsgBox "Unable to find the IP/Countries data file comming with Handle-X Pro.", vbCritical, AppName
        Unload Me
    End If
End Sub
Public Sub ExecuteRouter(IP_Address As String)
    Me.Show
    DoEvents
    RouterData(0) = IP_Address
    RouterButtons_Click (0)
End Sub
Private Sub RouterButtons_Click(Index As Integer)
    Select Case Index
           Case 0 'Execute X-Router
                If CheckIPAddress(RouterData(0)) = True Then
                '1 - Resolve The The Host Name From The IPAddress Given
                     RouterData(4) = ""
                     RouterData(4) = GetHostNameFromIP(RouterData(0))
                '2 - Resolve Country Information Of The Given IPAddress
                     Dim CurrentPos As Long, PrevPos As Long, DBdata As String
                     PrevPos = 1
                     DBFileNumber = FreeFile
                     RouterData(2) = ""
                     RouterData(3) = ""
                     Flag.Picture = LoadPicture("")
                    'Check Data Base Existance
                     If CStr(CBool(PathFileExists(DBPath))) = False Then
                         MsgBox "Unable to find the IP/Countries data file comming with Handle-X Pro.", vbCritical, AppName
                         Unload Me
                     End If
                    'Resume To open the file
                     Open DBPath For Binary As #DBFileNumber
                        DBdata = String(FileLen(DBPath), vbNullChar)
                        Get #DBFileNumber, , DBdata
                     Close #DBFileNumber
                     Dim Tmp As String, DBLen As Long, Data() As String
                     Dim IP As Currency, Found As Boolean
                     IP = Val(IPAddressToNumber(RouterData(0)))
                    'Search Over the IP Range
                     DBLen = Len(DBdata)
                     Do While (PrevPos < DBLen)
                            CurrentPos = InStr(PrevPos, DBdata, vbCrLf) - PrevPos + 1
                            Tmp = Mid$(DBdata, PrevPos, CurrentPos)
                            Data = Split(Tmp, ",")
                            If (Val(Data(2)) <= IP) And (Val(Data(3)) >= IP) Then
                                Found = True
                                Exit Do
                            End If
                           'Progress Bar Code
                            Progress(1).Width = 5895 * (PrevPos / DBLen)
                            DoEvents
                            PrevPos = CurrentPos + PrevPos + 1
                     Loop
                     If Found = True Then
                       'Show The Found Data
                        RouterData(2) = Data(4)
                        RouterData(3) = Data(5)
                        If CStr(CBool(PathFileExists(FlagsPath))) = True Then
                            If CStr(CBool(PathFileExists(FlagsPath & "\Flags\" & Data(4) & ".gif"))) = True Then
                                Flag.Picture = LoadPicture(FlagsPath & "\Flags\" & Data(4) & ".gif")
                            End If
                        End If
                     Else
                        MsgBox "Unable to find this IP information!", vbInformation, AppName
                     End If
                     Progress(1).Width = 0
                Else
                    MsgBox "Please,Insert a valid IP address", vbExclamation, AppName
                End If
           Case 1 'Exit X-Router
                Unload Me
    End Select
End Sub
Private Function SocketsInitialize() As Boolean
   Dim WSAD As WSADATA
   SocketsInitialize = WSAStartup(WS_VERSION_REQD, WSAD) = IP_SUCCESS
End Function
Private Function SocketsCleanup() As Boolean
   SocketsCleanup = True
   If WSACleanup() <> 0 Then
       SocketsCleanup = False
   End If
End Function
Public Function GetHostNameFromIP(ByVal sAddress As String) As String
   Dim ptrHosent As Long
   Dim hAddress As Long
   Dim nbytes As Long
   If SocketsInitialize() Then
     'convert string address to long
      hAddress = inet_addr(sAddress)
      If hAddress <> SOCKET_ERROR Then
        'obtain a pointer to the HOSTENT structure
        'that contains the name and address
        'corresponding to the given network address.
         ptrHosent = gethostbyaddr(hAddress, 4, AF_INET)
         If ptrHosent <> 0 Then
           'convert address and
           'get resolved hostname
            CopyMemory ptrHosent, ByVal ptrHosent, 4
            nbytes = lstrlen(ByVal ptrHosent)
            If nbytes > 0 Then
               sAddress = Space$(nbytes)
               CopyMemory ByVal sAddress, ByVal ptrHosent, nbytes
               GetHostNameFromIP = sAddress
            End If
         Else
            GetHostNameFromIP = "Failed To Resolve The Host Name!"
         End If 'If ptrHosent
      If SocketsCleanup = False Then GetHostNameFromIP = "Unable To Cleanup The System Socket!"
      Else
         GetHostNameFromIP = "Invalid IP Address!"
      End If 'If hAddress
   Else
      GetHostNameFromIP = "Failed To Resolve The Host Name!"
   End If  'If SocketsInitialize
End Function
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
Private Sub RouterButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    RouterButtons(Index).BackColor = &HE0E0E0
End Sub
Private Sub RouterButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    RouterButtons(Index).BackColor = vbWhite
End Sub
Private Sub RouterData_Change(Index As Integer)
    Select Case Index
        Case 0 'IP Address
            If CheckIPAddress(RouterData(0)) = True Then
                RouterData(1) = IPAddressToNumber(RouterData(0))
            Else
                RouterData(1) = "Invalid IP Address!"
            End If
    End Select
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
