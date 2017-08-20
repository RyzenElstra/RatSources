VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsSocket"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Private Declare Function SetWindowLong Lib "USER32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
    
Public Enum sckState
       sckClosed = 0
       sckConnected = 1
       sckConnecting = 2
       sckDisconnected = 3
       sckError = -1
       sckListening = 4
End Enum

'Events
Event DataArrival(pDATA As Variant)
Event Connected()
Event ConnectionRequest(RequestID As Long)
Event Disconnected()
Event Error(ByVal number As Long, ErrorDescription As String)

'Variables
Private mSocket As Long
Private mhWnd As Long
Private mlpPrevWndProc As Long
Private SingleConnect As Boolean

Private mState As sckState

Property Get State() As sckState
    State = mState
End Property

'Procedures and Functions
Public Sub sckAccept(RequestID As Long, SingleConnection As Boolean)
Dim Sock As sockaddr
Dim newSock As Long
    
    'SingleConnect started is FALSE
    newSock = accept(RequestID, Sock, sockaddr_size)
    If SingleConnect <> SingleConnection Then
       Call closesocket(RequestID)
    End If
    mSocket = newSock
    mState = sckConnected
    RaiseEvent Connected
End Sub

Public Sub sckListen(Port As Long)
Dim S As Long, dummy As Long
Dim SelectOps As Long
Dim saZero As sockaddr
Dim sockin As sockaddr
Dim errors As Long
    
    mState = sckListening
    SingleConnect = False  'started is Multi connection, so is FALSE
    
    sockin = saZero     'zero out the structure
    sockin.sin_family = AF_INET
    sockin.sin_port = htons(Port)
    
    If sockin.sin_port = INVALID_SOCKET Then
        errors = WSAGetLastError()
        RaiseEvent Error(errors, "ERROR in sockin.sin_port -->" & GetWSAErrorString(errors))
        Exit Sub
    End If
    
    sockin.sin_addr = htonl(INADDR_ANY)
    If sockin.sin_addr = INADDR_NONE Then
        errors = WSAGetLastError()
        RaiseEvent Error(errors, "ERROR in htonl" & GetWSAErrorString(errors))
        Exit Sub
    End If
    
    'Create a socket TCP
    S = Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
    If S < 0 Then
        errors = WSAGetLastError()
        RaiseEvent Error(errors, "ERROR in Socket() --> " & GetWSAErrorString(errors))
        Exit Sub
    End If
    'Bound the (unbound) socket to the address
    If bind(S, sockin, sockaddr_size) Then
        errors = WSAGetLastError()
        RaiseEvent Error(errors, "ERROR in bind()" & " --> " & GetWSAErrorString(errors))
        If S > 0 Then
            dummy = closesocket(S)
        End If
        Exit Sub
    End If
    
    'Events to generate
    SelectOps = FD_READ Or FD_CONNECT Or FD_ACCEPT Or FD_CLOSE
    'Set the message notification for the socket
    If WSAAsyncSelect(S, mhWnd, ByVal 1025, ByVal SelectOps) Then
        errors = WSAGetLastError()
        RaiseEvent Error(errors, "ERROR in WSAAsnycSelect --> " & GetWSAErrorString(errors))
        If S > 0 Then
            dummy = closesocket(S)
        End If
        Exit Sub
    End If
    
    'Listen the connection requests
    If listen(S, 1) Then
        errors = WSAGetLastError()
        RaiseEvent Error(errors, "ERROR in listen() --> " & GetWSAErrorString(errors))
        If S > 0 Then
            dummy = closesocket(S)
        End If
        Exit Sub
    End If
    
End Sub

Public Sub sckConnect(m_host As String, m_port As String)
    
    Dim temp As Variant
    
    mState = sckConnecting
    
    'make sure the port is closed!
    If mSocket <> 0 Then Call closesocket(mSocket)
    
    temp = ConnectSock(m_host, m_port, 0, mhWnd, True)
        
    'Winsock Error
    If temp < 0 Then
        errors = WSAGetLastError()
        RaiseEvent Error(errors, "WINPROC Error: " & GetWSAErrorString(errors))
        mState = sckError
        Exit Sub
    End If
    
    'Wait for Error or FD_CONNECT Event
    Do While mState = sckConnecting And (Not mState = sckError)
        DoEvents
    Loop
    
End Sub

Public Sub sckSendData(DATA As String)
'Send DATA
    Call SendData(mSocket, DATA)
End Sub

Public Sub sckHook(ByVal pHwnd As Long)
    'ok, we are going to catch ALL msg's sent
    'to the handle we are subclassing (form1)
     mhWnd = pHwnd
     mlpPrevWndProc = SetWindowLong(mhWnd, GWL_WNDPROC, AddressOf SubWndProc)
    Call SetWindowLong(mhWnd, GWL_USERDATA, ObjPtr(Me))
End Sub

Public Sub sckUnHook()
    'if we dont un-subclass before we shutdown
    'the program, we get an illigal procedure error.
    'fun.
    Call SetWindowLong(mhWnd, GWL_WNDPROC, mlpPrevWndProc)
End Sub

Sub sckClose()
    mState = sckClosed
    Call closesocket(mSocket)
    Close
End Sub

Private Sub sckDataArrival(ByVal pDATA As Variant, pDataLenght As Long)
    RaiseEvent DataArrival(pDATA)
End Sub

Function WindowProc(ByVal hw As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim recvBuffer As String
Dim BytesReceived As Long
Dim totalLenght As Long
Dim buf As String
Dim buflen As Long

Dim WSAEvent As Long
Dim WSAError As Long


    If uMsg <> 1025 Then
        WindowProc = CallWindowProc(mlpPrevWndProc, hw, uMsg, wParam, ByVal lParam)
        Exit Function
    End If

    WSAEvent = WSAGetSelectEvent(lParam)
    WSAError = WSAGetAsyncError(lParam)
    
    If WSAError <> 0 Then
       RaiseEvent Error(WSAError, "WINPROC Error: " & GetWSAErrorString(WSAError))
       mState = sckError
       Exit Function
    End If
    
    Select Case WSAEvent
            
                Case FD_READ: 'Lets check for data
                    
                     'Allocate a buffer
                     buflen = 1024
                     buf = String$(buflen, Chr$(0))
                     recvBuffer = ""
                     totalLenght = 0
                    'Continue reading the data until the buffer is empty
                    Do
                      BytesReceived = recv(mSocket, ByVal buf, buflen, 0)
                      totalLenght = totalLenght + BytesReceived
                      'Add to the buffer
                      If BytesReceived > 0 Then
                         recvBuffer = recvBuffer & Left$(buf, BytesReceived)
                      Else
                         Exit Do
                      End If
                    Loop
                    'Return the buffer
                    sckDataArrival recvBuffer, totalLenght
                   
                Case FD_CONNECT: 'Did we connect?
                
                     mState = sckConnected
                     RaiseEvent Connected
                     mSocket = wParam 'we connected!
                        
                Case FD_ACCEPT:
                     
                     RaiseEvent ConnectionRequest(wParam)
                        
                Case FD_CLOSE: 'they closed the connection
                    
                     mState = sckDisconnected
                     RaiseEvent Disconnected
                    
                     Call closesocket(mSocket)   'so we need to close
            
            End Select

End Function

