Attribute VB_Name = "NetConnect"

Public Declare Function InternetGetConnectedState _
   Lib "wininet.dll" (ByRef dwflags As Long, _
   ByVal dwReserved As Long) As Long

'Local system uses a modem to connect to the Internet.
Public Const INTERNET_CONNECTION_MODEM As Long = &H1

'Local system uses a LAN to connect to the Internet.
Public Const INTERNET_CONNECTION_LAN As Long = &H2

'Local system uses a proxy server to connect to the Internet.
Public Const INTERNET_CONNECTION_PROXY As Long = &H4

'No longer used.
Public Const INTERNET_CONNECTION_MODEM_BUSY As Long = &H8

Public Const INTERNET_RAS_INSTALLED As Long = &H10
Public Const INTERNET_CONNECTION_OFFLINE As Long = &H20
Public Const INTERNET_CONNECTION_CONFIGURED As Long = &H40


'InternetGetConnectedState wrapper functions
Public Function IsNetConnectViaLAN() As Boolean

   Dim dwflags As Long
   
  'pass an empty variable into which the API will
  'return the flags associated with the connection
   Call InternetGetConnectedState(dwflags, 0&)

  'return True if the flags indicate a LAN connection
   IsNetConnectViaLAN = dwflags And INTERNET_CONNECTION_LAN
     
End Function


Public Function IsNetConnectViaModem() As Boolean

   Dim dwflags As Long
   
  'pass an empty variable into which the API will
  'return the flags associated with the connection
   Call InternetGetConnectedState(dwflags, 0&)

  'return True if the flags indicate a modem connection
   IsNetConnectViaModem = dwflags And INTERNET_CONNECTION_MODEM
     
End Function


Public Function IsNetConnectViaProxy() As Boolean

   Dim dwflags As Long
   
  'pass an empty variable into which the API will
  'return the flags associated with the connection
   Call InternetGetConnectedState(dwflags, 0&)

  'return True if the flags indicate a proxy connection
   IsNetConnectViaProxy = dwflags And INTERNET_CONNECTION_PROXY
     
End Function


Public Function IsNetConnectOnline() As Boolean

  'no flags needed here - the API returns True
  'if there is a connection of any type
   IsNetConnectOnline = InternetGetConnectedState(0&, 0&)
     
End Function


Public Function IsNetRASInstalled() As Boolean

   Dim dwflags As Long
   
  'pass an empty variable into which the API will
  'return the flags associated with the connection
   Call InternetGetConnectedState(dwflags, 0&)

  'return True if the flags include RAS installed
   IsNetRASInstalled = dwflags And INTERNET_RAS_INSTALLED
     
End Function


Public Function GetNetConnectString() As String

   Dim dwflags As Long
   Dim msg As String

  'build a string for display
   If InternetGetConnectedState(dwflags, 0&) Then
     
      If dwflags And INTERNET_CONNECTION_CONFIGURED Then
         msg = msg & "You have a network connection configured." & vbCrLf
      End If

      If dwflags And INTERNET_CONNECTION_LAN Then
         msg = msg & "The local system connects to the Internet via a LAN"
      End If
      
      If dwflags And INTERNET_CONNECTION_PROXY Then
            msg = msg & ", and uses a proxy server. "
      Else: msg = msg & "."
      End If
      
      If dwflags And INTERNET_CONNECTION_MODEM Then
         msg = msg & "The local system uses a modem to connect to the Internet. "
      End If
      
      If dwflags And INTERNET_CONNECTION_OFFLINE Then
         msg = msg & "The connection is currently offline. "
      End If
      
      If dwflags And INTERNET_CONNECTION_MODEM_BUSY Then
         msg = msg & "The local system's modem is busy with a non-Internet connection. "
      End If
      
      If dwflags And INTERNET_RAS_INSTALLED Then
         msg = msg & "Remote Access Services are installed on this system."
      End If
      
   Else
    
      msg = "Not connected to the internet now."
      
   End If
   
   GetNetConnectString = msg

End Function


