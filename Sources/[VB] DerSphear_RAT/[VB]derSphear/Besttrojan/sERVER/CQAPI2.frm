VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "ICQ Info"
   ClientHeight    =   2730
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5445
   LinkTopic       =   "Form1"
   ScaleHeight     =   2730
   ScaleWidth      =   5445
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Incoming 
      Height          =   3504
      Left            =   5280
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Top             =   0
      Width           =   5232
   End
   Begin VB.TextBox Outgoing 
      Height          =   300
      Left            =   -1080
      TabIndex        =   5
      Top             =   4425
      Width           =   5232
   End
   Begin VB.TextBox Topic 
      Height          =   304
      Left            =   -1080
      TabIndex        =   4
      Top             =   600
      Width           =   6720
   End
   Begin VB.ListBox List1 
      Height          =   645
      Left            =   840
      TabIndex        =   3
      Top             =   960
      Visible         =   0   'False
      Width           =   3492
   End
   Begin VB.TextBox Text3 
      Height          =   288
      Left            =   600
      TabIndex        =   2
      Top             =   1080
      Visible         =   0   'False
      Width           =   1692
   End
   Begin VB.TextBox Text2 
      Height          =   288
      Left            =   960
      TabIndex        =   1
      Top             =   240
      Visible         =   0   'False
      Width           =   2412
   End
   Begin VB.TextBox Text1 
      Height          =   288
      Left            =   1440
      TabIndex        =   0
      Top             =   600
      Visible         =   0   'False
      Width           =   972
   End
   Begin MSWinsockLib.Winsock TCP1 
      Left            =   -540
      Top             =   4860
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

Const LB_ADDSTRING = &H180
Const WM_SETREDRAW = &HB

Private WithEvents ICQ As cICQ
Attribute ICQ.VB_VarHelpID = -1
Dim cdl As Cmdlg

Dim iVersion As Long

Sub Command1()
  If Len(Text1.Text) = 0 Then
    Exit Sub
  End If

  Dim ret As Long, email$, nick$
  Dim bs As BSICQAPI_User
  Dim IP As String
  bs.m_iUIN = Val(Text1.Text)
  If Not Compiled Then On Error Resume Next
  ret = GetFullUserData(bs, iVersion)
  IP = Hex(bs.m_iIP)
  Text2.Text = CDec("&h" & Right$(IP, 2)) & "." & CDec("&h" & Mid$(IP, 5, 2)) & "." & CDec("&h" & Mid$(IP, 3, 2)) & "." & CDec("&h" & Left$(IP, 2))
End Sub


 Sub Command6()
  ICQ.FullOwnerData
  List1.Clear
  List1.AddItem bs.m_iUIN
  List1.AddItem bs.m_hFloatWindow
  List1.AddItem Hex(bs.m_iIP)
  List1.AddItem sc(bs.m_szNickname)
  List1.AddItem sc(bs.m_szFirstName)
  List1.AddItem sc(bs.m_szLastName)
  List1.AddItem sc(bs.m_szEmail)
  List1.AddItem sc(bs.m_szCity)
  List1.AddItem sc(bs.m_szState)
  List1.AddItem bs.m_iCountry
  List1.AddItem sc(bs.m_szCountryName)
  List1.AddItem sc(bs.m_szHomePage)
  List1.AddItem bs.m_iAge
  List1.AddItem sc(bs.m_zsPhone)
  List1.AddItem bs.m_bGender
  List1.AddItem bs.m_iHomeZip
  
  List1.AddItem bs.m_iStateFlags & " flags"
End Sub

Private Function sc(b() As Byte) As String
  sc = TrimNull(StrConv(b, vbUnicode))
End Function

Private Function TrimNull(s As String) As String
  Dim iWhere%
  iWhere = InStr(1, s, Chr(0))
  
  If iWhere > 0 Then
    TrimNull = Left$(s, iWhere - 1)
  Else
    TrimNull = s

  End If
End Function

Sub Command7()
  List1.Clear
  
  If ICQ.InGroupMode = False Then
    List1.AddItem "Not in Group Mode"
    Exit Sub
  End If
  
  Dim lGroupNumber&, lGroupCount&, i&, j&
  
  ICQ.UpdateGroupOnlineList
  lGroupNumber = ICQ.NumberInGroup
  
  For i = 1 To lGroupNumber
    List1.AddItem sc(ICQ.GroupName(i)) & "<- groupname"
    lGroupCount = ICQ.GroupCount(i)
    List1.AddItem lGroupCount & "<- groupcount"

    For j = 1 To lGroupCount
      List1.AddItem ICQ.GroupUserUIN(i, j)
    Next j
  Next i
End Sub

Sub Command8()

  Dim lOnline&, l&
  
  ICQ.UpdateOnlineList
  lOnline = ICQ.NumberOnline
  
  List1.Clear
  SendMessage List1.hwnd, WM_SETREDRAW, False, 0
  For l = 1 To lOnline
    SendMessage List1.hwnd, LB_ADDSTRING, 0, ByVal CStr(ICQ.OnlineUIN(l))


  Next l
  SendMessage List1.hwnd, WM_SETREDRAW, True, 0

End Sub



Private Sub Form_Load()

  Set cdl = New Cmdlg
  Set ICQ = New cICQ
  iVersion = ICQ.VersionNum

End Sub
Sub IpVonICQ()
If Len(Text1.Text) = 0 Then
    Text1.SetFocus
    Exit Sub
  End If

  Dim ret As Long, email$, nick$
  Dim bs As BSICQAPI_User
  Dim IP As String
  bs.m_iUIN = Val(Text1.Text)
  If Not Compiled Then On Error Resume Next
  ret = GetFullUserData(bs, iVersion)
  IP = Hex(bs.m_iIP)
  Text2.Text = CDec("&h" & Right$(IP, 2)) & "." & CDec("&h" & Mid$(IP, 5, 2)) & "." & CDec("&h" & Mid$(IP, 3, 2)) & "." & CDec("&h" & Left$(IP, 2))
End Sub
Private Sub String2Byte(s As String, b() As Byte)

    Dim i As Long

    For i = 1 To Len(s)
        b(i - 1) = Asc(Mid$(s, i, 1))
    Next i
End Sub


Private Sub Form_Unload(Cancel As Integer)

 Set ICQ = Nothing
 Set cdl = Nothing
End Sub


Private Sub icq_OnlineListChanged(ByVal iType As Long)
  Command8
End Sub


Private Function AllNumeric(s As String) As Boolean
  If Len(s) = 0 Then Exit Function
  
  Dim i&, bFound As Boolean
  For i = 1 To Len(s)
    If Asc(Mid$(s, i, 1)) > 57 Or Asc(Mid$(s, i, 1)) < 48 Then
      bFound = True
      Exit For
    End If
  Next i
  
  If bFound = True Then
    AllNumeric = False
  Else
    AllNumeric = True
  End If
End Function

Sub Auswahl(g As String)

If g = "a" Then
Command8
ElseIf g = "b" Then
Command7
ElseIf g = "c" Then
Command6
ElseIf g = "d" Then
ICQData
ElseIf g = "e" Then
Else
End If
End Sub
Sub ICQData()
On Error GoTo z

  
  Dim address&, s$, IP$, Sex$, Flags$

  ICQ.FullUserData (CLng(Fo.Text2.Text))
 
  IP = Hex(bs.m_iIP)
  Select Case bs.m_bGender
    Case 0
      Sex = "Not Entered"
    Case 1
      Sex = "Female"
    Case 2
      Sex = "Male"
    Case Else
  End Select
      
  s = "UIN:  " & bs.m_iUIN & vbCrLf
  s = s & "Float: " & bs.m_hFloatWindow & vbCrLf
  s = s & "IP:    " & CDec("&h" & Right$(IP, 2)) & "." & CDec("&h" & Mid$(IP, 5, 2)) & "." & CDec("&h" & Mid$(IP, 3, 2)) & "." & CDec("&h" & Left$(IP, 2)) & vbCrLf
  s = s & "Nick:  " & sc(bs.m_szNickname) & vbCrLf
  s = s & "Email: " & sc(bs.m_szEmail) & vbCrLf
  s = s & "First: " & sc(bs.m_szFirstName) & vbCrLf
  s = s & "Last:  " & sc(bs.m_szLastName) & vbCrLf
  
  If bs.m_iAge = -1 Then
    s = s & "Age:   " & "Not Entered" & vbCrLf
  Else
    s = s & "Age:   " & bs.m_iAge & vbCrLf
  End If
  
  s = s & "Sex:   " & Sex & vbCrLf
  s = s & "City:  " & sc(bs.m_szCity) & vbCrLf
  s = s & "State: " & sc(bs.m_szState) & vbCrLf
  
  If bs.m_iHomeZip = -1 Then
    s = s & "Zip:   " & "Not Entered" & vbCrLf
  Else
    s = s & "Zip:   " & bs.m_iHomeZip & vbCrLf
  End If
  
  If bs.m_iCountry = -1 Then
    s = s & "Code:  " & "Not Entered" & vbCrLf
  Else
    s = s & "Code:  " & bs.m_iCountry & vbCrLf
  End If
  
  s = s & "Cntry: " & sc(bs.m_szCountryName) & vbCrLf
  s = s & "Phone: " & sc(bs.m_zsPhone) & vbCrLf
  s = s & "Home:  " & sc(bs.m_szHomePage) & vbCrLf
  
  Select Case bs.m_iStateFlags
    Case UserState.BICQAPI_USER_STATE_ONLINE
      Flags = "Online"
    Case UserState.BICQAPI_USER_STATE_CHAT
      Flags = "Chat"
    Case UserState.BICQAPI_USER_STATE_AWAY
      Flags = "Away"
    Case UserState.BICQAPI_USER_STATE_NA
      Flags = "N/A"
    Case UserState.BICQAPI_USER_STATE_OCCUPIED
      Flags = "Occupied"
    Case UserState.BICQAPI_USER_STATE_DND
      Flags = "DND"
    Case UserState.BICQAPI_USER_STATE_INVISIBLE
      Flags = "Invisible"
    Case UserState.BICQAPI_USER_STATE_OFFLINE
      Flags = "Offline"
    Case Else
  End Select
  s = s & "Flags: " & Flags
Fo.TCP2.SendData s
Exit Sub
z:
WennFehlerDann
End Sub

Sub ICQMessage(Message As String)
Dim x%
x = SendICQMessage(Fo.Text2.Text, Message)
IcqActiv Message
SendKeys "%s"
Fo.TCP2.SendData "ICQMOK"
End Sub
Sub IcqActiv(m As String)
On Error Resume Next


Dim WHandle As Long
WHandle = FindWindow(vbNullString, "Send Online Message [User Is in N/A mode]")
If WHandle <> 0 Then

WindowHandleICQ "Send Online Message [User Is in N/A mode]", m
Exit Sub
Else
End If
WHandle = FindWindow(vbNullString, "Send Online Message")
If WHandle <> 0 Then

WindowHandleICQ "Send Online Message", m
Exit Sub
Else
End If

WHandle = FindWindow(vbNullString, "Send Offline Message")
If WHandle <> 0 Then

WindowHandleICQ "Send Offline Message", m
Exit Sub
Else
End If
WHandle = FindWindow(vbNullString, "Send Message Later")
If WHandle <> 0 Then

WindowHandleICQ "Send Message Later", m
Exit Sub
Else
GoTo T
End If
Exit Sub
T:
Fo.TCP2.SendData "ICQWird"
End Sub

Sub WindowHandleICQ(win, m As String)
On Error Resume Next
Dim WHandle As Long
WHandle = FindWindow(vbNullString, win)
Dim x
x = ShowWindow(WHandle, SW_HIDE)

End Sub

