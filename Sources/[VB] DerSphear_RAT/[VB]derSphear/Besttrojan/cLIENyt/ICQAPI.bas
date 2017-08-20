Attribute VB_Name = "Module1"
Option Explicit

Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Declare Sub RtlMoveMemory Lib "kernel32" (dest As Any, src As Any, ByVal cb&)

Declare Sub FreeUser Lib "ICQMAPI" Alias "ICQAPIUtil_FreeUser" (puser As Long)
Declare Sub SetUserNotify Lib "ICQMAPI" Alias "ICQAPIUtil_SetUserNotificationFunc" (ByVal uNotificationCode As Long, ByVal pUserFunc As Long)

Declare Function GetDockingState Lib "ICQMAPI" Alias "ICQAPICall_GetDockingState" (iDockingState As Long) As Long
Declare Function GetFirewallSettings Lib "ICQMAPI" Alias "ICQAPICall_GetFirewallSettings" (oFireWallData As BSICQAPI_FireWallData) As Long
Declare Function GetFullOwnerData Lib "ICQMAPI" Alias "ICQAPICall_GetFullOwnerData" (ByVal ppUser As Long, ByVal iVersion As Long) As Long
Declare Function GetFullUserData Lib "ICQMAPI" Alias "ICQAPICall_GetFullUserData" (puser As BSICQAPI_User, ByVal iVersion As Long) As Long
Declare Function GetOnlineListDetails Lib "ICQMAPI" Alias "ICQAPICall_GetOnlineListDetails" (iCount As Long, ppUser As Long) As Long
Declare Function GetOnlineListPlacement Lib "ICQMAPI" (iIsShowOnlineList As Long) As Long
Declare Function GetOnlineListType Lib "ICQMAPI" Alias "ICQAPICall_GetOnlineListType" (iListType As Long) As Long
Declare Function GetVersion Lib "ICQMAPI" Alias "ICQAPICall_GetVersion" (iVersion As Long) As Long
Declare Function GetWindowHandle Lib "ICQMAPI" Alias "ICQAPICall_GetWindowHandle" (hWindow As Long) As Long
Declare Function SendFile Lib "ICQMAPI" Alias "ICQAPICall_SendFile" (ByVal iUIN As Long, ByVal pszFileNames As String) As Long
Declare Function SetLicenseKey Lib "ICQMAPI" Alias "ICQAPICall_SetLicenseKey" (ByVal pszName As String, ByVal pszPassword As String, ByVal pszLicense As String) As Long
Declare Function RegisterNotify Lib "ICQMAPI" Alias "ICQAPICall_RegisterNotify" (ByVal iVersion As Long, ByVal iCount As Long, piEvents As Byte) As Long
Declare Function UnRegisterNotify Lib "ICQMAPI" Alias "ICQAPICall_UnRegisterNotify" () As Long

Declare Sub FreeUsers Lib "ICQMAPI" Alias "ICQAPIUtil_FreeUsers" (ByVal iCount As Long, ppUsers As Long)
Declare Sub FreeGroup Lib "ICQMAPI" Alias "ICQAPIUtil_FreeGroup" (pGroup As Long)
Declare Function GetGroupOnlineListDetails Lib "ICQMAPI" Alias "ICQAPICall_GetGroupOnlineListDetails" (iGroupCount As Long, ppGroups As Long) As Long
Declare Function SetOwnerPhoneState Lib "ICQMAPI" (ByVal iPhoneState As Long) As Long
Declare Function SetOwnerState Lib "ICQMAPI" (ByVal iState As Long) As Long
Declare Function SendExternal Lib "ICQMAPI" Alias "ICQAPICall_SendExternal" (ByVal iUIN As Long, ByVal pszExternal As String, ByVal bautosend As Byte) As Long
Declare Function SendICQMessage Lib "ICQMAPI" Alias "ICQAPICall_SendMessage" (ByVal iUIN As Long, ByVal pszMessage As String) As Long
Declare Function SendURL Lib "ICQMAPI" Alias "ICQAPICall_SendURL" (ByVal iUIN As Long, ByVal pszMessage As String) As Long

Public Const ICQAPINOTIFY_ONLINELIST_CHANGE = 0&
Public Const ICQAPINOTIFY_ONLINE_FULLUSERDATA_CHANGE = 1&
Public Const ICQAPINOTIFY_APPBAR_STATE_CHANGE = 2&
Public Const ICQAPINOTIFY_ONLINE_PLACEMENT_CHANGE = 3&
Public Const ICQAPINOTIFY_OWNER_CHANGE = 4&
Public Const ICQAPINOTIFY_OWNER_FULLUSERDATA_CHANGE = 5&
Public Const ICQAPINOTIFY_ONLINELIST_HANDLE_CHANGE = 6&
Public Const ICQAPINOTIFY_FILE_RECEIVED = 8&

Public Const ICQAPINOTIFY_LAST = &H80

Public Const ICQAPINOTIFY_ONLINELISTCHANGE_ONOFF = 1&
Public Const ICQAPINOTIFY_ONLINELISTCHANGE_FLOAT = 2&
Public Const ICQAPINOTIFY_ONLINELISTCHANGE_POS = 3&

Public Type BSICQAPI_User
  m_iUIN               As Long
  m_hFloatWindow       As Long
  m_iIP                As Long
  m_szNickname(19)     As Byte
  m_szFirstName(19)    As Byte
  m_szLastName(19)     As Byte
  m_szEmail(99)        As Byte
  m_szCity(99)         As Byte
  m_szState(99)        As Byte
  m_iCountry           As Long
  m_szCountryName(99)  As Byte
  m_szHomePage(99)     As Byte
  m_iAge               As Long
  m_zsPhone(19)        As Byte
  m_bGender            As Byte
  m_iHomeZip           As Long
  m_iStateFlags        As Long
  pad(2)               As Byte
End Type

Public Type BSICQAPI_Group
  m_szName(49) As Byte
  m_iUserCount As Long
  bsUser       As Long
  pad(1)       As Byte
End Type

Public Type BSICQAPI_FireWallData
  m_bEnabled                   As Byte
  m_bSocksEnabled              As Byte
  m_sSocksVersion              As Integer
  m_szSocksHost(511)           As Byte
  m_iSocksPort                 As Long
  m_bSocksAuthenticationMethod As Byte
End Type

Public Type Online
  UIN As Long
  hWnd As Long
End Type

Public Type Users
  named(49) As Byte
  count     As Long
  UIN()     As Long
  pad(1)    As Byte
End Type
  
Public Function Compiled() As Boolean
  On Error Resume Next
  Debug.Print 1 \ 0
  Compiled = (Err.Number = 0)
End Function

Public Function PointerToString(p As Long) As String
  Dim c&
  c = lstrlen(p)
  Debug.Print c & "<- lstrlen"
  PointerToString = String$(c, 0)
  RtlMoveMemory ByVal PointerToString, ByVal p, c
  PointerToString = TrimNull(PointerToString)
End Function

Public Function TrimNull(s As String) As String
  Dim iWhere%
  iWhere = InStr(1, s, Chr(0))
  
  If iWhere > 0 Then
    TrimNull = left$(s, iWhere - 1)
  Else
    TrimNull = s
    Debug.Print s & "<- no null present"
  End If
End Function


