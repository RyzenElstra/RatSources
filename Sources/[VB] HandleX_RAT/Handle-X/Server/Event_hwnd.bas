Attribute VB_Name = "Event_hwnd"
'API Functions

'Subclassing Functions
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

'Constants
'Messages send with WSAAsyncSelect().
Public Const FD_READ       As Long = &H1
Public Const FD_WRITE      As Long = &H2
Public Const FD_ACCEPT     As Long = &H8
Public Const FD_CONNECT    As Long = &H10
Public Const FD_CLOSE      As Long = &H20

'Used Variables
Public sock_count As Integer
Public BusyConnection As Boolean
Public array_handle(1) As Long
Public Pointer() As Csocket
Public PrevProc As Long
Private Const WINSOCKMSG = 1025
'Window Message Handling
Public Function WindowProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    If uMsg = WINSOCKMSG Then
        ProcessMessage wParam, lParam
    Else
        WindowProc = CallWindowProc(PrevProc, hwnd, uMsg, wParam, lParam)
        If TextChatFlag = True Then Exit Function 'Cancel Returned Messages
    End If
End Function
'Our Winsock-message handler
Public Sub ProcessMessage(ByVal lFromSocket As Long, ByVal lParam As Long)
    Dim Adata As String
    Dim i As Byte
    For i = 0 To 1
       If array_handle(i) = lFromSocket Then
           Exit For
       End If
    Next
    Select Case lParam
        Case FD_WRITE
            Pointer(i).E_SendComplete
        Case FD_CONNECT 'we are connected to Dest
            Pointer(i).E_Connect
        Case FD_READ 'we have data waiting to be processed
            'start reading the data
            Adata = Pointer(i).Srecieve
             Pointer(i).E_Data_arrive Adata
        Case FD_CLOSE
             If i = 0 Then
               BusyConnection = False
             End If
             Pointer(i).E_Close
        Case FD_ACCEPT
        If Not BusyConnection Then
             BusyConnection = True
             Pointer(i).E_Accept
        End If
    End Select
End Sub
Public Sub ChatManager(Data As String)
    Dim ID As Long
    ID = Asc(Mid(Data, 1, 1))
    If ID >= 96 And ID <= 100 Then
         Call Text_chat.initialize(Data)
    ElseIf ID >= 101 And ID <= 104 Then
        voice.initialize Data
    End If
End Sub

