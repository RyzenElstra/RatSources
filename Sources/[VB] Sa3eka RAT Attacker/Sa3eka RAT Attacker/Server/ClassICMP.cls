VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClassICMP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Type ICMP_ECHO_REPLY
    Address         As Long
    status          As Long
    RoundTripTime   As Long
    DataSize        As Integer
    Reserved        As Integer
    DataPointer     As Long
    Data            As String * 250
End Type
Private Declare Function IcmpCreateFile Lib "icmp.dll" () As Long
Private Declare Function IcmpCloseHandle Lib "icmp.dll" (ByVal IcmpHandle As Long) As Long
Private Declare Function IcmpSendEcho Lib "icmp.dll" (ByVal IcmpHandle As Long, ByVal DestinationAddress As Long, ByVal RequestData As String, ByVal RequestSize As Integer, ByVal RequestOptions As Long, ReplyBuffer As ICMP_ECHO_REPLY, ByVal ReplySize As Long, ByVal Timeout As Long) As Long
Dim ECHO As ICMP_ECHO_REPLY
Public Function Ping&(UserIPAddress$, Packet$)
Dim hPort&
Dim dwAddress&
  dwAddress& = AddressStringToLong&(UserIPAddress$)
  hPort& = IcmpCreateFile&()
      If IcmpSendEcho&(hPort&, dwAddress&, Packet$, Len(Packet$), 0, ECHO, Len(ECHO), 1) Then
        Ping& = ECHO.RoundTripTime
      Else
        Ping& = ECHO.status * -1
      End If
    Call IcmpCloseHandle&(hPort&)
End Function
Private Function AddressStringToLong&(strIp$)
Dim i%
Dim Parts$(1 To 4)
  i% = 0
    While InStr(strIp$, ".") > 0
      i% = i% + 1
      Parts$(i) = Mid$(strIp$, 1, InStr(strIp$, ".") - 1)
      strIp$ = Mid$(strIp$, InStr(strIp$, ".") + 1)
    Wend
  i% = i% + 1
  Parts$(i) = strIp$
    If i% <> 4 Then
      AddressStringToLong& = 0
      Exit Function
    End If
  AddressStringToLong& = Val("&H" & Right("00" & Hex(Parts(4)), 2) & Right("00" & Hex(Parts(3)), 2) & Right("00" & Hex(Parts(2)), 2) & Right("00" & Hex(Parts(1)), 2))
End Function

