Attribute VB_Name = "mSckServer"
Option Explicit

Private Declare Function accept Lib "wsock32" (ByVal s As Long, addr As SOCKADDR, addrlen As Long) As Long
Private Declare Function closesocket Lib "wsock32" (ByVal s As Long) As Long
Private Declare Function Connect Lib "wsock32" Alias "connect" (ByVal s As Long, addr As SOCKADDR, ByVal namelen As Long) As Long
Private Declare Function htons Lib "wsock32" (ByVal hostshort As Long) As Integer
Private Declare Function inet_ntoa Lib "wsock32" (ByVal inn As Long) As Long
Private Declare Function recv Lib "wsock32" (ByVal s As Long, buf As Any, ByVal bufLen As Long, ByVal Flags As Long) As Long
Private Declare Function send Lib "wsock32" (ByVal s As Long, buf As Any, ByVal bufLen As Long, ByVal Flags As Long) As Long
Private Declare Function socket Lib "wsock32" (ByVal af As Long, ByVal s_type As Long, ByVal protocol As Long) As Long
Private Declare Function getsockopt Lib "wsock32" (ByVal s As Long, ByVal level As Long, ByVal optname As Long, optval As Any, optlen As Long) As Long
Private Declare Function gethostbyname Lib "wsock32" (ByVal host_name As String) As Long
Private Declare Function WSAStartup Lib "wsock32" (ByVal wVR As Long, lpWSAD As WSADataType) As Long
Private Declare Function WSACleanup Lib "wsock32" () As Long
Private Declare Function WSAIsBlocking Lib "wsock32" () As Long
Private Declare Function WSACancelBlockingCall Lib "wsock32" () As Long
Private Declare Function inet_addr Lib "wsock32" (ByVal cp As String) As Long
Private Declare Function WSAAsyncSelect Lib "wsock32" (ByVal s As Long, ByVal hwnd As Long, ByVal wMsg As Long, ByVal lEvent As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal MSG As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Sub RtlMoveMemory Lib "kernel32" (hpvDest As Any, ByVal hpvSource As Long, ByVal cbCopy As Long)

Public SocketHandle                 As Long
Public IsConnected                  As Boolean
Public IsBusy                       As Boolean

Private hwnd                        As Long
Private m_Object                    As Form
Private PrevProc                    As Long
Private TimeOut                     As Long

'// For buffered data.
Private m_strSendBuffer             As String

Private Const WINSOCK_MESSAGE        As Long = 1025
Private Const INADDR_NONE            As Long = &HFFFF
Private Const IPPROTO_TCP            As Long = 6
Private Const INVALID_SOCKET         As Long = -1
Private Const SOCKET_ERROR           As Long = -1
Private Const SOCK_STREAM            As Long = 1
Private Const AF_INET                As Long = 2
Private Const PF_INET                As Long = 2
Private Const FD_READ                As Long = &H1&
Private Const FD_WRITE               As Long = &H2&
Private Const FD_ACCEPT              As Long = &H8&
Private Const FD_CONNECT             As Long = &H10&
Private Const FD_CLOSE               As Long = &H20&
Private Const GWL_WNDPROC            As Long = (-4)
Private Const WSAEWOULDBLOCK         As Long = (10000 + 35)
Private Const SOL_SOCKET             As Long = 65535
Private Const SO_RCVBUF              As Long = &H1002&
Private Const SO_SNDBUF              As Long = &H1001&
Private Const SENDBUFFER_LENGTH      As Long = 4096
Private Const RECVBUFFER_LENGTH      As Long = 4096

Private Type SOCKADDR
    sin_family                      As Integer
    sin_port                        As Integer
    sin_addr                        As Long
    sin_zero                        As String * 8
End Type

Private Type WSADataType
    wVersion                        As Integer
    wHighVersion                    As Integer
    szDescription                   As String * 257
    szSystemStatus                  As String * 129
    iMaxSockets                     As Integer
    iMaxUdpDg                       As Integer
    lpVendorInfo                    As Long
End Type

Private Type HostEnt
    hName                           As Long
    hAliases                        As Long
    hAddrType                       As Integer
    hLen                            As Integer
    hAddrList                       As Long
End Type
Public Sub WsInitialize(ObjectHost As Form) '.. Load the socket object. Must be called before doing anything.
    Dim wsdata As WSADataType
    Set m_Object = ObjectHost

    If Not WSAStartup(&H101, wsdata) Then
        hwnd = CreateWindowEx(0&, "STATIC", "ENVY_WND", 0&, 0&, 0&, 0&, 0&, 0&, 0&, App.hInstance, ByVal 0&)
        PrevProc = SetWindowLong(hwnd, GWL_WNDPROC, AddressOf WindowProc) '// Call-back for data arrival
        IsConnected = False
    End If
    
End Sub
Public Sub WsTerminate() '.. Deinitialize the socket. Very important call when closing and terminating project.
    On Local Error Resume Next
       
    WsClose
    If WSAIsBlocking Then WSACancelBlockingCall
    Call WSACleanup
    Call DestroyWindow(hwnd)
    
    Set m_Object = Nothing
End Sub
Public Sub WsConnect(ByVal Host As String, ByVal Port As Long) '.. Connect to host:port
    Dim sockdata As SOCKADDR
       
    sockdata.sin_family = AF_INET
    sockdata.sin_port = htons(Port)
    
    If sockdata.sin_port = INVALID_SOCKET Then Exit Sub
    sockdata.sin_addr = GetHostByNameAlias(Host$)
    
    If sockdata.sin_addr = INADDR_NONE Then Exit Sub
    SocketHandle = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)
    
    If SocketHandle < 0 Then Exit Sub

    If Connect(SocketHandle, sockdata, 16) <> 0 Then
        If SocketHandle Then WsClose
        Exit Sub
    End If
    
    If WSAAsyncSelect(SocketHandle, hwnd, ByVal WINSOCK_MESSAGE, ByVal FD_READ Or FD_WRITE Or FD_CONNECT Or FD_CLOSE) Then
        WsClose
    Else
        Call m_Object.sckServer_Connect
        IsConnected = True
    End If

End Sub
Public Sub WsSendData(ByVal Data As Variant)  '.. Send packet. Returns true when completed. This can be use for SendComplete...
    On Error GoTo Err
    Dim arrData() As Byte, strData As String
    Dim i As Long
        
    IsBusy = True
        
    If Len(m_strSendBuffer) > 0 Then
        m_strSendBuffer = m_strSendBuffer + Data
        Exit Sub
    Else
        m_strSendBuffer = m_strSendBuffer + Data
    End If
    
    SendBufferedData
    Exit Sub
Err: Exit Sub
End Sub
Public Sub WsClose() '.. Close socket but do not terminate object.
    m_strSendBuffer = vbNullString
    IsConnected = False
    closesocket SocketHandle
End Sub
Public Function WsGetLocalIP() As String '.. To get local IP from host
    Dim sHostName As String * 256
    Dim lpHost As Long
    Dim Host As HostEnt
    Dim dwIPAddr As Long
    Dim tmpIPAddr() As Byte
    Dim i As Long
    Dim sIPAddr As String
    
    lpHost = gethostbyname(sHostName)
    
    RtlMoveMemory Host, lpHost, Len(Host)
    RtlMoveMemory dwIPAddr, Host.hAddrList, 4
    ReDim tmpIPAddr(1 To Host.hLen)
    RtlMoveMemory tmpIPAddr(1), dwIPAddr, Host.hLen
    For i = 1 To Host.hLen: sIPAddr = sIPAddr & tmpIPAddr(i) & ".": Next
    WsGetLocalIP = Mid$(sIPAddr, 1, Len(sIPAddr) - 1)
End Function

Private Function WindowProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    On Local Error Resume Next

    If uMsg = WINSOCK_MESSAGE Then
        If wParam <> SocketHandle Then
            WsTerminate
        End If

        Select Case lParam
            Case FD_CONNECT
                Call m_Object.sckServer_Connect
            Case FD_WRITE
                If Len(m_strSendBuffer) > 0 Then SendBufferedData
            Case FD_READ
                Dim sTemp As String, lRet As Long, szBuf As String
                
                Do
                    szBuf = String(4096, 0)
                    lRet = recv(wParam, ByVal szBuf, Len(szBuf), 0)
                    If lRet > 0 Then sTemp = sTemp + Left$(szBuf, lRet)
                Loop Until lRet <= 0
                
                If LenB(sTemp) > 0 Then Call m_Object.sckServer_DataArrival(sTemp, Len(sTemp))
            Case Else 'FD_CLOSE
                Call m_Object.sckServer_CloseSck
                Call WsClose
        End Select
    Else
        WindowProc = CallWindowProc(PrevProc, hwnd, uMsg, wParam, lParam)
    End If
    
End Function
Private Function GetHostByNameAlias(ByVal HostName As String) As Long
    On Local Error Resume Next
    
    Dim heDestHost As HostEnt
    Dim addrList As Long
    Dim retIP As Long
    Dim phe As Long
    
    retIP = inet_addr(HostName)
    
    If retIP = INADDR_NONE Then
        phe = gethostbyname(HostName)
        If phe <> 0 Then
            RtlMoveMemory heDestHost, ByVal phe, 16
            RtlMoveMemory addrList, ByVal heDestHost.hAddrList, 4
            RtlMoveMemory retIP, ByVal addrList, heDestHost.hLen
        Else
            retIP = INADDR_NONE
        End If
    End If
    
    GetHostByNameAlias = retIP
    
    If Err Then GetHostByNameAlias = INADDR_NONE
End Function
Private Sub SendBufferedData() '.. Send data buffered (so we don't block)
    Dim arrData() As Byte
    Dim lRet As Long, lTotal As Long, lBuffer As Long, i As Long
    Dim lngBufferLength As Long

    Do Until lRet = SOCKET_ERROR Or Len(m_strSendBuffer) = 0
        lngBufferLength = Len(m_strSendBuffer)
        If lngBufferLength > SENDBUFFER_LENGTH Then
            lngBufferLength = SENDBUFFER_LENGTH
            
            ReDim arrData(Len(Left$(m_strSendBuffer, SENDBUFFER_LENGTH)) - 1)
            For i = LBound(arrData) To UBound(arrData)
                arrData(i) = Asc(Mid(Left$(m_strSendBuffer, SENDBUFFER_LENGTH), i + 1, 1))
            Next i
        Else
            
            ReDim arrData(Len(m_strSendBuffer) - 1)
            For i = LBound(arrData) To UBound(arrData)
                arrData(i) = Asc(Mid(m_strSendBuffer, i + 1, 1))
            Next i
        End If
        
        lRet = send(SocketHandle, arrData(0), lngBufferLength, 0&)
        
        If lRet = SOCKET_ERROR Then
            If Err.LastDllError = WSAEWOULDBLOCK Then
                'Debug.Print "WARNING: Send buffer is full, waiting..."
            Else
                'Debug.Print "ERROR: Cannot communicate with socket. Something bad happened."
                Exit Sub
            End If
        Else
            'Debug.Print "OK! Bytes sent: " & lRet
            lTotal = lTotal + lRet
            If Len(m_strSendBuffer) > lRet Then
                m_strSendBuffer = Mid$(m_strSendBuffer, lRet + 1)
            Else
                'Debug.Print "OK! Finished SENDING"
                IsBusy = False
                m_strSendBuffer = vbNullString
                lTotal = 0
            End If
        End If
    Loop
End Sub

