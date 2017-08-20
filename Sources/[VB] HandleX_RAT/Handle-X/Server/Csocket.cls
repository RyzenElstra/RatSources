VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Csocket"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'*********************************************************
'*********************************************************
'**
'**                  API Winsock Control Class
'**
'**    Calss Methods
'**
'**      -Intialize : used to initialize socket dll
'**                   return Error_Success if ok.
'**      -Cleanup   : used to release the dll.
'**      -Create    : create a socket and return
'**                   its handler as long value,if
'**                   an error occuer it will return
'**                   INVALID_SOCKET,and take two
'**                   arguments the type of socket
'**                   and the protocol used.
'**      -Sclose    : take socket handler and close
'**                   the socket associated with it.
'**      -Sconnect  : take socket handler,and create
'**                   connection, return ERROR_SUCCESS
'**                   if ok .
'**      -Sbind     : prepare the spicified socket.
'**      -Slisten   : it take socket handler and put
'**                   the port to listen state return
'**                   ERROR_SUCCESS if ok
'**      -Saccept   : it take socket handler and accept
'**                   any connection ,return
'**                   INVALID_SOCKET if not ok.
'**      -Slisten   : it take socket handler and the
'**                   data to be sent and return number
'**                   of bytes sent if ok and SOCK_ERROR
'**                   if not ok
'**      -Srecieve  : it take the socket handler and the
'**                   protocol(default tcp) to be used and
'**                   return the recieved string,if error
'**                   it return the code "11@*45*@78^^624"
'**
'**    Class properties:
'**
'**      -Port      : take the port to be used
'**      -IP        : take the IP to be used
'**      -Protocol  : take the Protocol to be used
'**
'**    Class events:
'**
'**      -DataArrival : occur when data arrive and
'**                     provide you the recieved data.
'**      -SockClose   : occur when the socket is closed.
'**
'**      -SockConnect : occur when a connection is
'**                     established.
'**
'**      created by eng. mohamed helala
'**           Mohamed_Helala@yahoo.com
'*********************************************************
'*********************************************************

'---------------------------------------------------------
'      Defined Events
'---------------------------------------------------------
'
Public Event DataArrival(ByVal Data As String)
Public Event SockClose()
Public Event SockConnect()
Public Event ConnectionRequest()
Public Event SendComplete()
'
'---------------------------------------------------------
'      Used Variables
'---------------------------------------------------------
'
Dim C_port As Long
Dim C_IP As String
Dim C_OldHnd As Long
Dim C_Protocol As Protocols
Private C_sockHandle As Long
Private udtdata As wsadata
Private addr    As sockaddr_in
Private remote_addr    As sockaddr_in
Private Ini_Flag As Boolean
'
'---------------------------------------------------------
'      Constants
'---------------------------------------------------------
'
'Winsock version constants.
Private Const WINSOCK_V1_1  As Long = &H101
Private Const WINSOCK_V2_2  As Long = &H202
Private Const SOCKET_ERROR As Long = -1

'
' Length of fields within the WSADATA structure.
Private Const WSADESCRIPTION_LEN  As Long = 256
Private Const WSASYS_STATUS_LEN   As Long = 128
'
' Internet addresses.
Private Const INADDR_ANY          As Long = &H0
Private Const INADDR_LOOPBACK     As Long = &H7F000001
Private Const INADDR_BROADCAST    As Long = &HFFFFFFFF
Private Const INADDR_NONE         As Long = &HFFFFFFFF
'
' Maximum backlog when calling listen().
Private Const SOMAXCONN  As Long = 5
'
' Socket Option
Private Const SOL_SOCKET = &HFFFF&
Private Const SO_LINGER = &H80&
Private Const SO_DONTLINGER = Not SO_LINGER
'
' Event Procedure Handling
Private Const GWL_WNDPROC = (-4)
'---------------------------------------------------------
'      Types
'---------------------------------------------------------
'
' To initialize winsock
Private Type wsadata
   wVersion                               As Integer
   wHighVersion                           As Integer
   szDescription(WSADESCRIPTION_LEN + 1)  As Byte
   szSystemstatus(WSASYS_STATUS_LEN + 1)  As Byte
   iMaxSockets                            As Integer
   iMaxUpdDg                              As Integer
   lpVendorInfo                           As Long
End Type
'
' Basic IPv4 addressing structures.
Private Type in_addr
   s_addr   As Long
End Type
'
Private Type sockaddr_in
   sin_family        As Integer 'address family IPV4 here
   sin_port          As Integer 'Port number
   sin_addr          As in_addr 'IP Address
   sin_zero(0 To 7)  As Byte    'Padding ,can be ignored
End Type
'
Private Type LingerType
    l_onoff As Integer
    l_linger As Integer
End Type
'
'---------------------------------------------------------
'      Enumerators
'---------------------------------------------------------
'
'Address Familes
Public Enum AddressFamilies
   AF_INET = 2
   AF_INET6 = 23
End Enum
'
'Socket types
Public Enum SocketTypes
   SOCK_STREAM = 1
   SOCK_DGRAM = 2
   SOCK_RAW = 3
   SOCK_RDM = 4
   SOCK_SEQPACKET = 5
End Enum
'
'Prorocols Used with socket().
Public Enum Protocols
   IPPROTO_IP = 0
   IPPROTO_ICMP = 1
   IPPROTO_GGP = 2
   IPPROTO_TCP = 6
   IPPROTO_PUP = 12
   IPPROTO_UDP = 17
   IPPROTO_IDP = 22
   IPPROTO_ND = 77
   IPPROTO_RAW = 255
   IPPROTO_MAX = 256
End Enum
'
'---------------------------------------------------------
'    API Functions
'---------------------------------------------------------
'
' DLL handling functions.
Private Declare Function WSAStartup Lib "ws2_32.dll" (ByVal wVersionRequested As Integer, ByRef lpWSAData As wsadata) As Long
Private Declare Function WSACleanup Lib "ws2_32.dll" () As Long
'
' Socket functions.
Private Declare Function socket Lib "ws2_32.dll" (ByVal af As AddressFamilies, ByVal Stype As SocketTypes, ByVal Protocol As Protocols) As Long
'
Private Declare Function Listen Lib "ws2_32.dll" Alias "listen" (ByVal S As Long, ByVal backlog As Long) As Long
Private Declare Function bind Lib "ws2_32.dll" (ByVal S As Long, ByRef name As sockaddr_in, ByVal namelen As Long) As Long
Private Declare Function Connect Lib "ws2_32.dll" Alias "connect" (ByVal S As Long, ByRef name As sockaddr_in, ByVal namelen As Long) As Long
Private Declare Function accept Lib "ws2_32.dll" (ByVal S As Long, ByRef addr As sockaddr_in, ByRef addrlen As Long) As Long
'
Private Declare Function Send Lib "ws2_32.dll" Alias "send" (ByVal S As Long, ByRef buf As Byte, ByVal datalen As Long, ByVal Flags As Long) As Long
Private Declare Function sendto Lib "ws2_32.dll" (ByVal S As Long, ByRef buf As Byte, ByVal datalen As Long, ByVal Flags As Long, ByRef toaddr As sockaddr_in, ByVal tolen As Long) As Long
Private Declare Function recv Lib "ws2_32.dll" (ByVal S As Long, ByRef buf As Byte, ByVal datalen As Long, ByVal Flags As Long) As Long
Private Declare Function recvfrom Lib "ws2_32.dll" (ByVal S As Long, ByRef buf As Byte, ByVal datalen As Long, ByVal Flags As Long, ByRef fromaddr As sockaddr_in, ByRef fromlen As Long) As Long
'
Private Declare Function closesocket Lib "ws2_32.dll" (ByVal S As Long) As Long
'
' Conversion functions used to convert from host byte order
' to network byte order or vice versa.
Private Declare Function inet_addr Lib "ws2_32.dll" (ByVal cp As String) As Long
Private Declare Function inet_ntoa Lib "ws2_32.dll" (ByVal laddr As Long) As Long
Private Declare Function htonl Lib "ws2_32.dll" (ByVal hostlong As Long) As Long
Private Declare Function ntohl Lib "ws2_32.dll" (ByVal netlong As Long) As Long
Private Declare Function htons Lib "ws2_32.dll" (ByVal hostshort As Long) As Integer
Private Declare Function ntohs Lib "ws2_32.dll" (ByVal netshort As Long) As Integer
'
'    Async Functions
Private Declare Function WSAAsyncSelect Lib "wsock32.dll" (ByVal S As Long, ByVal hwnd As Long, ByVal wMsg As Long, ByVal lEvent As Long) As Long
Private Declare Function setsockopt Lib "wsock32.dll" (ByVal S As Long, ByVal Level As Long, ByVal optname As Long, optval As Any, ByVal optlen As Long) As Long
Private Declare Function getsockopt Lib "wsock32.dll" (ByVal S As Long, ByVal Level As Long, ByVal optname As Long, optval As Any, optlen As Long) As Long
Private Declare Function WSACancelBlockingCall Lib "wsock32.dll" () As Long
Private Declare Function WSAIsBlocking Lib "wsock32.dll" () As Long
Private Declare Function GetHostName Lib "WSOCK32" Alias "gethostname" (ByVal szHost As String, ByVal dwHostLen As Long) As Long
'

'---------------------------------------------------------
'    Properties
'---------------------------------------------------------
'
Public Property Get port() As Long
port = C_port
End Property

Public Property Let port(Value As Long)
C_port = Value
End Property

Public Property Get IP() As String
IP = C_IP
End Property

Public Property Let IP(Value As String)
C_IP = Value
End Property
Public Property Get Protocol() As Protocols
Protocol = C_Protocol
End Property

Public Property Let Protocol(Value As Protocols)
C_Protocol = Value
End Property
'

'---------------------------------------------------------
'    Methods
'---------------------------------------------------------
'
Private Function initialize() As Long
 initialize = WSAStartup(WINSOCK_V2_2, udtdata)
 PrevProc = SetWindowLong(SrvHwnd, GWL_WNDPROC, AddressOf Event_hwnd.WindowProc)
End Function
Public Function Cleanup() As Long
    If WSAIsBlocking() Then
        WSACancelBlockingCall
    End If
   Call WSACleanup
   If PrevProc <> 0 Then
        SetWindowLong SrvHwnd, GWL_WNDPROC, PrevProc
        PrevProc = 0
   End If
End Function
Public Function Create(Stype As SocketTypes) As Long
If Ini_Flag = False Then
        initialize
        Ini_Flag = True
End If
If sock_count >= 2 Then Exit Function
   Create = socket(AF_INET, Stype, C_Protocol)
   If Create > 0 Then
        C_sockHandle = Create
        ReDim Preserve Pointer(sock_count)
        Set Pointer(sock_count) = Me
        array_handle(sock_count) = Create
        sock_count = sock_count + 1
   Else
        'TODO "Error Handlling"
   End If
End Function
Public Function SClose()
  Call closesocket(C_sockHandle)
  If C_OldHnd Then
   Call closesocket(C_OldHnd)
  End If
   sock_count = sock_count - 1
  If sock_count = 0 Then
   Erase Pointer
   Ini_Flag = False
   Call Cleanup
  End If
End Function
Public Function Sconnect()
  With addr
    .sin_family = AF_INET
    .sin_port = htons(C_port)
    .sin_addr.s_addr = inet_addr(C_IP)
  End With
     Sconnect = Connect(C_sockHandle, addr, LenB(addr))
 If Prepare(C_sockHandle) <> 0 Then
    SClose C_sockHandle
 End If
End Function
Public Function Sbind() As Long
  With addr
    .sin_family = AF_INET
    .sin_port = htons(C_port)
    .sin_addr.s_addr = inet_addr(INADDR_ANY)
  End With
 Sbind = bind(C_sockHandle, addr, LenB(addr))
End Function
Public Function Slisten() As Long
 If Prepare(C_sockHandle) <> 0 Then
    SClose
 End If
 If Sbind() <> -1 Then
  Slisten = Listen(C_sockHandle, SOMAXCONN)
 Else
  Slisten = -1
 'TODO :Error Description
 End If
End Function
Public Function Saccept() As Long
  Saccept = accept(C_sockHandle, remote_addr, LenB(remote_addr))
  C_OldHnd = C_sockHandle
  array_handle(0) = Saccept
  C_sockHandle = Saccept
End Function
Public Function Ssend(Data As String) As Long
  '
  Dim ByteData() As Byte
  Dim lngCount      As Long
    '
    ' Convert the string data to a byte array, and count how many bytes there are.
    ByteData = StrConv(Data, vbFromUnicode)
    lngCount = UBound(ByteData) + 1
    '
    ' Send the byte array, and check the return value for errors, just in case.
    If C_Protocol = IPPROTO_TCP Then
    '
    Ssend = Send(C_sockHandle, ByteData(0), lngCount, 0&)
    '
    Else
       If C_Protocol = IPPROTO_UDP Then
          With remote_addr
           .sin_family = AF_INET
           .sin_addr.s_addr = inet_addr(C_IP)
           .sin_port = htons(C_port)
          End With
         Ssend = sendto(C_sockHandle, ByteData(0), lngCount, 0&, remote_addr, LenB(remote_addr))
       Else
          MsgBox "Error,not defined protocol"
       End If
    End If
End Function
Public Function Srecieve() As String
  '
  Dim ByteData()        As Byte
  Dim lngCount         As Long
  Dim lngBytesReceived As Long
  Dim strdata          As String
    ' Prepare our receive buffer to 1KB (should be plenty of space).
    ReDim ByteData(0 To 8192) As Byte
    lngCount = UBound(ByteData) + 1
    ' Call receive, and check for errors.
    If C_Protocol = IPPROTO_TCP Then
       lngBytesReceived = recv(C_sockHandle, ByteData(0), lngCount, 0&)
    Else
      If C_Protocol = IPPROTO_UDP Then
       lngBytesReceived = recvfrom(C_sockHandle, ByteData(0), lngCount, 0&, addr, LenB(addr))
      Else
       MsgBox "error,not defined protocol"
      End If
    End If
    If (lngBytesReceived = -1) Then
      Srecieve = "11@*45*@78^^624"
    Else
       ' Convert the received data back into a string and return.
       strdata = StrConv(ByteData, vbUnicode)
       Srecieve = Mid$(strdata, 1, lngBytesReceived)
    End If
End Function
Public Function GetLocalHostName() As String
    Dim IRet As Long, HostStrBuffer As String
    HostStrBuffer = Space(255)
    IRet = GetHostName(HostStrBuffer, 255)
    If IRet = SOCKET_ERROR Then
        GetLocalHostName = "UnKnown Host Name" 'Demo Host Name
    Else
        GetLocalHostName = StripNulls(Trim$(HostStrBuffer))
    End If
End Function
Private Function Prepare(Hnd As Long) As Long
  Dim SelectOps&
  If SetSockLinger(Hnd, 0, 0) = -1 Then
       'Error & Close previous created socket
        If C_sockHandle > 0 Then
            SClose
        End If
        Prepare = -1
       'TODO : Error Description
        Exit Function
    End If
   SelectOps = FD_READ Or FD_WRITE Or FD_CONNECT Or FD_CLOSE Or FD_ACCEPT
        If WSAAsyncSelect(Hnd, SrvHwnd, ByVal 1025, ByVal SelectOps) Then
           'Error & Close previous created socket
            If C_sockHandle > 0 Then
                SClose
            End If
            Prepare = -1
           'TODO : Error Description
            Exit Function
        End If
  Prepare = 0
End Function
Private Function SetSockLinger(ByVal SockNum&, ByVal OnOff%, ByVal LingerTime%) As Long
    Dim Linger As LingerType
    Linger.l_onoff = OnOff
    Linger.l_linger = LingerTime
    If setsockopt(SockNum, SOL_SOCKET, SO_DONTLINGER, Linger, 4) Then
        SetSockLinger = -1
    Else
        If getsockopt(SockNum, SOL_SOCKET, SO_DONTLINGER, Linger, 4) Then
            SetSockLinger = -1
        End If
    End If
End Function
'---------------------------------------------------------
'      Event Handling
'---------------------------------------------------------
'
Public Sub E_Connect()
RaiseEvent SockConnect
End Sub
Public Sub E_Close()
RaiseEvent SockClose
End Sub
Public Sub E_Data_arrive(Data As String)
RaiseEvent DataArrival(Data)
End Sub
Public Sub E_Accept()
RaiseEvent ConnectionRequest
End Sub
Public Sub E_SendComplete()
RaiseEvent SendComplete
End Sub
