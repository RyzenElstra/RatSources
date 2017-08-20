Attribute VB_Name = "mdIPTool"
'option information for network ping, we don't implement these here as this is
'a simple sample (simon says).
Public Type ip_option_information
    TTL             As Byte     'Time To Live
    Tos             As Byte     'Type Of Service
    Flags           As Byte     'IP header flags
    OptionsSize     As Byte     'Size in bytes of options data
    OptionsData     As Long     'Pointer to options data
End Type

'structure that is returned from the ping to give status and error information
Public Type icmp_echo_reply
    Address         As Long             'Replying address
    Status          As Long             'Reply IP_STATUS, values as defined above
    RoundTripTime   As Long             'RTT in milliseconds
    DataSize        As Integer          'Reply data size in bytes
    Reserved        As Integer          'Reserved for system use
    DataPointer     As Long             'Pointer to the reply data
    Options         As ip_option_information    'Reply options
    Data            As String * 250     'Reply data which should be a copy of the string sent, NULL terminated
                                        ' this field length should be large enough to contain the string sent
End Type

'declares for function to be used from icmp.dll
Public Declare Function IcmpCreateFile Lib "icmp.dll" () As Long
Public Declare Function IcmpCloseHandle Lib "icmp.dll" (ByVal IcmpHandle As Long) As Long

Public Declare Function IcmpSendEcho Lib "icmp.dll" _
(ByVal IcmpHandle As Long, ByVal DestinationAddress As Long, _
ByVal RequestData As String, ByVal RequestSize As Integer, _
RequestOptions As ip_option_information, ReplyBuffer As icmp_echo_reply, _
ByVal ReplySize As Long, ByVal Timeout As Long) As Long

Public Const PING_TIMEOUT = 200 'number of milliseconds to wait for the reply

Public Const WSA_DESCRIPTIONLEN = 256
Public Const WSA_DescriptionSize = WSA_DESCRIPTIONLEN + 1

Public Const WSA_SYS_STATUS_LEN = 128
Public Const WSA_SysStatusSize = WSA_SYS_STATUS_LEN + 1

Type WSADataType
    wVersion As Integer
    wHighVersion As Integer
    szDescription As String * WSA_DescriptionSize
    szSystemStatus As String * WSA_SysStatusSize
    iMaxSockets As Integer
    iMaxUdpDg As Integer
    lpVendorInfo As Long
End Type

Public Const INADDR_NONE = &HFFFF

'- Hostent Structure
Type HostEnt
    h_name As Long
    h_aliases As Long
    h_addrtype As Integer
    h_length As Integer
    h_addr_list As Long
End Type
Public Const hostent_size = 16

Public Const PF_INET = 2  'internetwork: UDP, TCP, etc.
Public Const WSA_NoName = "Unknown"

#If Win16 Then
Public Declare Function lstrlen Lib "Kernel" (ByVal lpString As Any) As Integer
Public Declare Sub MemCopy Lib "Kernel" Alias "hmemcpy" (dest As Any, src As Any, ByVal cb&)
Public Declare Function WSAIsBlocking Lib "Winsock.dll" () As Integer
Public Declare Function WSACancelBlockingCall Lib "Winsock.dll" () As Integer
Public Declare Function gethostbyaddr Lib "Winsock.dll" (addr As Long, ByVal addr_len As Integer, ByVal addr_type As Integer) As Long
Public Declare Function gethostbyname Lib "Winsock.dll" (ByVal host_name As String) As Long
Public Declare Function inet_addr Lib "Winsock.dll" (ByVal cp As String) As Long
Public Declare Function inet_ntoa Lib "Winsock.dll" (ByVal inn As Long) As Long
Public Declare Function WSAStartup Lib "Winsock.dll" (ByVal wVR As Integer, lpWSAD As WSADataType) As Integer
Public Declare Function WSACleanup Lib "Winsock.dll" () As Integer
#ElseIf Win32 Then
Public Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Any) As Long
Public Declare Sub MemCopy Lib "kernel32" Alias "RtlMoveMemory" (dest As Any, src As Any, ByVal cb&)
Public Declare Function WSAIsBlocking Lib "wsock32.dll" () As Long
Public Declare Function WSACancelBlockingCall Lib "wsock32.dll" () As Long
Public Declare Function gethostbyaddr Lib "wsock32.dll" (addr As Long, ByVal addr_len As Long, ByVal addr_type As Long) As Long
Public Declare Function gethostbyname Lib "wsock32.dll" (ByVal host_name As String) As Long
Public Declare Function inet_addr Lib "wsock32.dll" (ByVal cp As String) As Long
Public Declare Function inet_ntoa Lib "wsock32.dll" (ByVal inn As Long) As Long
Public Declare Function WSAStartup Lib "wsock32.dll" (ByVal wVR As Long, lpWSAD As WSADataType) As Long
Public Declare Function WSACleanup Lib "wsock32.dll" () As Long

#End If

Function PingIp(ByVal IP As String) As String
Dim hFile       As Long             ' handle for the icmp port opened
Dim lRet        As Long             ' hold return values as required
Dim lIPAddress  As Long
Dim strMessage  As String
Dim pOptions    As ip_option_information
Dim pReturn     As icmp_echo_reply
Dim iVal        As Integer
Dim lPingRet    As Long
Dim pWsaData    As WSADataType
    
    strMessage = "Echo this string of data"
    
    iVal = WSAStartup(&H101, pWsaData)
    
    'convert the IP address to a long, lIPAddress will be zero
    'if the function failed. Normally you wouldn't ping if the address
    'was no good to start with but we don't mind seeing bad return status
    'as that is what samples are all about
    lIPAddress = ConvertIPAddressToLong(IP)
    
    'open up a file handle for doing the ping
    hFile = IcmpCreateFile()
    
    pOptions.TTL = 128
    
    'Call the function that actually does the ping. It is a blocking call so we
    'don't get control back until it completes.
    lRet = IcmpSendEcho(hFile, _
                        lIPAddress, _
                        strMessage, _
                        Len(strMessage), _
                        pOptions, _
                        pReturn, _
                        Len(pReturn), _
                        PING_TIMEOUT)

  If lRet = 0 Then
     'the ping failed for some reason, hopefully the error is in the return buffer
     PingIp = "Failed"
  Else
     'the ping succeeded, .Status will be 0, .RoundTripTime is the time in ms for
     'the ping to complete, .Data is the data returned (NULL terminated), .Address
     'is the Ip address that actually replied, .DataSize is the size of the string in
     '.Data
     If pReturn.Status <> 0 Then
        PingIp = "Offline"
     Else
        PingIp = "Online"
     End If
  End If
                        
  'close the file handle that was used
  lRet = IcmpCloseHandle(hFile)
   
  iVal = WSACleanup()
  
End Function

'ConvertIPAddressToLong
'======================
'Converts a dotted IP address (eg: "123.234.2.45") to a long
'integer for use in sending a ping. This routine converts
'the string as required by an Intel system.
'
'Essentially we take the 4 numbers, flip them around and make
'a long by shifting all the parts into the correct byte. We
'do it here by making a hex string and converting it to a long.
'Not pretty but it works (most of the time<g>).
'
'When we get in "a.b.c.d" what we want out is Val(&Hddccbbaa).

Function ConvertIPAddressToLong(strAddress As String) As Long
Dim strTemp             As String
Dim lAddress            As Long
Dim iValCount           As Integer
Dim lDotValues(1 To 4)  As String
    
    'set up the initial storage and counter
    strTemp = strAddress
    iValCount = 0
    
    ' keep going while we still have dots in the string
    While InStr(strTemp, ".") > 0
        iValCount = iValCount + 1 'count the number
        lDotValues(iValCount) = Mid(strTemp, 1, InStr(strTemp, ".") - 1)    ' pick it off and convert it
        strTemp = Mid(strTemp, InStr(strTemp, ".") + 1) 'chop off the number and the dot
    Wend
        
    'the string only has the last number in it now
    iValCount = iValCount + 1
    lDotValues(iValCount) = strTemp
    
    'if we didn't get four pieces then the IP address is no good
    If iValCount <> 4 Then
        ConvertIPAddressToLong = 0
        Exit Function
        End If
        
    'take the four value, hex them, pad to 2 digits, make a hex
    'string and then convert the whole mess to a long for returning
    lAddress = Val("&H" & Right("00" & Hex(lDotValues(4)), 2) & _
                Right("00" & Hex(lDotValues(3)), 2) & _
                Right("00" & Hex(lDotValues(2)), 2) & _
                Right("00" & Hex(lDotValues(1)), 2))
                
    'set the return value
    ConvertIPAddressToLong = lAddress
    
End Function

Function AddrToIP(ByVal AddrOrIP$) As String
    On Error Resume Next
    frmIPTool.MousePointer = vbHourglass
    AddrToIP$ = getascip(GetHostByNameAlias(AddrOrIP$))
    If Err Then AddrToIP$ = "255.255.255.255"
    frmIPTool.MousePointer = vbDefault
End Function

'this function DOES work on 16 and 32 bit systems
Function getascip(ByVal inn As Long) As String
    On Error Resume Next
    Dim lpStr&
#If Win16 Then
    Dim nStr%
#ElseIf Win32 Then
    Dim nStr&
#End If
    Dim retString$
    retString = String(32, 0)
    lpStr = inet_ntoa(inn)
    If lpStr = 0 Then
        getascip = "255.255.255.255"
        Exit Function
    End If
    nStr = lstrlen(lpStr)
    If nStr > 32 Then nStr = 32
    MemCopy ByVal retString, ByVal lpStr, nStr
    retString = Left(retString, nStr)
    getascip = retString
    If Err Then getascip = "255.255.255.255"
End Function

'this function DOES work on 16 and 32 bit systems
Function GetHostByNameAlias(ByVal hostname$) As Long
    On Error Resume Next
    'Return IP address as a long, in network byte order

    Dim phe&    ' pointer to host information entry
    Dim heDestHost As HostEnt 'hostent structure
    Dim addrList&
    Dim retIP&
    'first check to see if what we have been passed is a valid IP
    retIP = inet_addr(hostname)
    If retIP = INADDR_NONE Then
        'it wasn't an IP, so do a DNS lookup
        phe = gethostbyname(hostname)
        If phe <> 0 Then
            'Pointer is non-null, so copy in hostent structure
            MemCopy heDestHost, ByVal phe, hostent_size
            'Now get first pointer in address list
            MemCopy addrList, ByVal heDestHost.h_addr_list, 4
            MemCopy retIP, ByVal addrList, heDestHost.h_length
        Else
            'its not a valid address
            retIP = INADDR_NONE
        End If
    End If
    GetHostByNameAlias = retIP
    If Err Then GetHostByNameAlias = INADDR_NONE
End Function

'this function DOES work on 16 and 32 bit systems
Function IpToAddr(ByVal AddrOrIP$) As String
    On Error Resume Next
    frmIPTool.MousePointer = vbHourglass
    IpToAddr = GetHostByAddress(GetHostByNameAlias(AddrOrIP$))
    If Err Then IpToAddr = WSA_NoName
    frmIPTool.MousePointer = vbDefault
End Function

'this function DOES work on 32bit and 16 bit systems
Function GetHostByAddress(ByVal addr As Long) As String
    On Error Resume Next
    Dim phe&, ret&
    Dim heDestHost As HostEnt
    Dim hostname$
    phe = gethostbyaddr(addr, 4, PF_INET)
    Debug.Print phe
    If phe <> 0 Then
        MemCopy heDestHost, ByVal phe, hostent_size
        Debug.Print heDestHost.h_name
        Debug.Print heDestHost.h_aliases
        Debug.Print heDestHost.h_addrtype
        Debug.Print heDestHost.h_length
        Debug.Print heDestHost.h_addr_list

        hostname = String(256, 0)
        MemCopy ByVal hostname, ByVal heDestHost.h_name, 256
        GetHostByAddress = Left(hostname, InStr(hostname, Chr(0)) - 1)
    Else
        GetHostByAddress = WSA_NoName
    End If
    If Err Then GetHostByAddress = WSA_NoName
End Function

Public Function StartWinsock(sDescription As String) As Boolean
    Dim StartupData As WSADataType
    If Not WSAStartedUp Then
        If Not WSAStartup(&H101, StartupData) Then
            WSAStartedUp = True
            Debug.Print "wVersion="; StartupData.wVersion, "wHighVersion="; StartupData.wHighVersion
            Debug.Print "If wVersion == 257 then everything is kewl"
            Debug.Print "szDescription="; StartupData.szDescription
            Debug.Print "szSystemStatus="; StartupData.szSystemStatus
            Debug.Print "iMaxSockets="; StartupData.iMaxSockets, "iMaxUdpDg="; StartupData.iMaxUdpDg
            sDescription = StartupData.szDescription
        Else
            WSAStartedUp = False
        End If
    End If
    StartWinsock = WSAStartedUp
End Function

'this function DOES work on 16 and 32 bit systems
Sub EndWinsock()
    Dim ret&
    If WSAIsBlocking() Then
        ret = WSACancelBlockingCall()
    End If
    ret = WSACleanup()
    WSAStartedUp = False
End Sub
