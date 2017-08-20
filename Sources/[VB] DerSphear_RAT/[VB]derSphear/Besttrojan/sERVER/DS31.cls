VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "cICQ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"No"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public Event OnlineListChanged(ByVal iType As Long)

Private Type pArray
  pointers() As Long
End Type

Private m_lVersion As Long
Private m_lOnline As Long
Private m_lGroups As Long

Private m_aOnline() As Online
Private m_aGUsers() As Users

Public Enum UserState
  BICQAPI_USER_STATE_ONLINE = 0
  BICQAPI_USER_STATE_CHAT = 1
  BICQAPI_USER_STATE_AWAY = 2
  BICQAPI_USER_STATE_NA = 3
  BICQAPI_USER_STATE_OCCUPIED = 4
  BICQAPI_USER_STATE_DND = 5
  BICQAPI_USER_STATE_INVISIBLE = 6
  BICQAPI_USER_STATE_OFFLINE = 7
End Enum

Private Sub Class_Initialize()
  Dim lRet&, sName$, sPassword$, sLicense$
  
  ReDim m_aOnline(0)
  ReDim m_aGUsers(0)
  ObjPointer = ObjPtr(Me)
  
  sName = "Visual Basic"
  sPassword = "aaaaaaaa"
  sLicense = "E94AD7C14D1DBAE8"
  
  If Not Compiled Then On Error Resume Next
  lRet = SetLicenseKey(sName, sPassword, sLicense)
  lRet = GetVersion(m_lVersion)
End Sub

Private Sub Class_Terminate()
  If Not Compiled Then On Error Resume Next
  UnRegisterNotify
End Sub

Public Property Get VersionStr() As String
  VersionStr = CStr(HiWord(m_lVersion)) & "." & CStr(LoWord(m_lVersion))
End Property

Public Property Get VersionNum() As Long
  VersionNum = m_lVersion
End Property

Public Property Get NumberOnline() As Long
  NumberOnline = UBound(m_aOnline)
End Property

Public Property Get InGroupMode() As Boolean
  If Me.VersionNum < 65537 Then
    Exit Property
  End If
  
  If Not Compiled Then On Error Resume Next
  
  Dim ret&, lListType&
  ret = GetOnlineListType(lListType)
  If lListType = -1 Then
    InGroupMode = True
  Else
    InGroupMode = False
  End If
End Property

Public Property Get NumberInGroup() As Long
  NumberInGroup = UBound(m_aGUsers)
End Property

Public Property Get GroupName(Index As Long) As String
  If Index < 1 Or Index > m_lGroups Then Exit Property
  
  GroupName = m_aGUsers(Index).named
End Property

Public Property Get GroupCount(Index As Long) As Long
  If Index < 1 Or Index > m_lGroups Then Exit Property
  
  GroupCount = m_aGUsers(Index).count
End Property

Public Property Get GroupUserUIN(GroupIndex As Long, SubIndex As Long) As Long
  If GroupIndex < 1 Or GroupIndex > m_lGroups Then Exit Property
  If SubIndex < 1 Or SubIndex > GroupCount(GroupIndex) Then Exit Property
  
  GroupUserUIN = m_aGUsers(GroupIndex).UIN(SubIndex)
End Property

Public Property Get OnlineUIN(Index As Long) As Long
  If Index < 1 Or Index > m_lOnline Then Exit Property
  
  OnlineUIN = m_aOnline(Index).UIN
End Property

Public Property Get DockingState() As Long
  If Not Compiled Then On Error Resume Next
  
  Dim ret&, lDockingState&
  ret = GetDockingState(lDockingState)
  If ret <> 0 Then
    DockingState = lDockingState
  Else
    DockingState = -1
  End If
End Property

Public Sub FireWallData()
  Dim ret&
  
  If Not Compiled Then On Error Resume Next
  ret = GetFirewallSettings(fwd)
End Sub

Public Property Get ICQhWnd() As Long
  Dim ret&, hWindow&
  Me.FullOwnerData
  ret = FindWindow("#32770", bs.m_iUIN)
  ICQhWnd = ret
End Property

Public Property Get OnlinehWnd(Index As Long) As Long
  If Index < 1 Or Index > m_lOnline Then Exit Property
  
  OnlinehWnd = m_aOnline(Index).hwnd
End Property

Public Sub FullOwnerData()
  Dim ppUser&, ret&, iVersion&, pointer&, bsPointer&
  
  iVersion = 1
  On Error Resume Next
  bsPointer = VarPtr(bs)
  ret = GetFullOwnerData(bsPointer, m_lVersion)
  RtlMoveMemory pointer, ByVal bsPointer, 4
  RtlMoveMemory bs, ByVal pointer, Len(bs)

  FreeUser bsPointer
End Sub

Public Sub FullUserData(UIN As Long)
  If UIN = 0 Then Exit Sub
  
  Dim ret As Long, email$, nick$
  Dim IP As String
  bs.m_iUIN = UIN

  On Error Resume Next
  ret = GetFullUserData(bs, m_lVersion)
End Sub

Public Sub UpdateOnlineList()
  Dim ret&, ppUser&, Online&, i&
  Dim bs As BSICQAPI_User
  Dim pa As pArray
  Dim oltemp As Online

  On Error Resume Next
  ret = GetOnlineListDetails(m_lOnline, ppUser)
  ReDim pa.pointers(1 To m_lOnline)
  ReDim m_aOnline(0 To m_lOnline)

  RtlMoveMemory pa.pointers(1), ByVal ppUser, (m_lOnline * 4)
  FreeUser ppUser
  For i = 1 To m_lOnline
   
    RtlMoveMemory m_aOnline(i), ByVal pa.pointers(i), Len(oltemp)
  Next i
End Sub

Public Sub UpdateGroupOnlineList()
  If Me.VersionNum < 65537 Then
    Exit Sub
  End If

  Dim bsu() As BSICQAPI_Group
  Dim ppUsers&, ret&, lGroupCount&
  Dim pa As pArray, i&, j&
  Dim pUsers As pArray
  
  Dim bsgTemp As BSICQAPI_Group
  Dim bsTemp As BSICQAPI_User
  
  
  If Not Compiled Then On Error Resume Next
  ret = GetGroupOnlineListDetails(lGroupCount, ppUsers)
  
  If lGroupCount = 0 Then
    ReDim m_aGUsers(0)
    m_lGroups = 0

    Exit Sub
  End If
  
  m_lGroups = lGroupCount
  
  ReDim pa.pointers(1 To lGroupCount)
  ReDim bsu(1 To lGroupCount)
  ReDim m_aGUsers(0 To lGroupCount)
  
  RtlMoveMemory pa.pointers(1), ByVal ppUsers, (lGroupCount * 4)
  
  For i = 1 To lGroupCount
    RtlMoveMemory bsu(i), ByVal pa.pointers(i), Len(bsgTemp)
    ReDim pUsers.pointers(1 To bsu(i).m_iUserCount)
      RtlMoveMemory pUsers.pointers(1), ByVal bsu(i).bsUser, (bsu(i).m_iUserCount * 4)
      ReDim m_aGUsers(i).UIN(1 To bsu(i).m_iUserCount)
      For j = 1 To bsu(i).m_iUserCount
        m_aGUsers(i).count = bsu(i).m_iUserCount
        RtlMoveMemory m_aGUsers(i).named(0), bsu(i).m_szName(0), 50
        RtlMoveMemory m_aGUsers(i).UIN(j), ByVal pUsers.pointers(j), 4
        FreeUser ByVal pUsers.pointers(j)
      Next j
  Next i
  
  FreeUsers lGroupCount, ppUsers
End Sub

Public Sub ListChanged(ByVal iType As Long)
  RaiseEvent OnlineListChanged(iType)
End Sub

Private Function LoWord(ByVal dw As Long) As Integer
    LoWord = CInt(dw And &HFFFF&)
End Function

Private Function HiWord(ByVal dw As Long) As Integer
     HiWord = (dw \ 65536) And &HFFFF
End Function
