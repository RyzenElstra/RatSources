Attribute VB_Name = "mdConnected"
Public Declare Function RasEnumConnections Lib "rasapi32.dll" Alias "RasEnumConnectionsA" (lpRasCon As Any, lpcb As Long, lpcConnections As Long) As Long
Public Declare Function RasGetConnectStatus Lib "rasapi32.dll" Alias "RasGetConnectStatusA" (ByVal hRasCon As Long, lpStatus As Any) As Long
Public Declare Function RasHangUp Lib "rasapi32.dll" Alias _
"RasHangUpA" (ByVal hRasConn As Long) As Long

Public Const RAS_MAXENTRYNAME As Integer = 256
Public Const RAS_MAXDEVICETYPE As Integer = 16
Public Const RAS_MAXDEVICENAME As Integer = 128
Public Const RAS_RASCONNSIZE As Integer = 412
Public Const ERROR_SUCCESS = 0&

Public Type RasEntryName
    dwSize As Long
    szEntryName(RAS_MAXENTRYNAME) As Byte
End Type

Public Type RasConn
    dwSize As Long
    hRasConn As Long
    szEntryName(RAS_MAXENTRYNAME) As Byte
    szDeviceType(RAS_MAXDEVICETYPE) As Byte
    szDeviceName(RAS_MAXDEVICENAME) As Byte
End Type

Public gstrISPName As String
Public ReturnCode As Long

Public Const RAS95_MaxEntryName = 256
Public Const RAS95_MaxDeviceType = 16
Public Const RAS95_MaxDeviceName = 32

Public Type RASCONN95
    dwSize As Long
    hRasCon As Long
    szEntryName(RAS95_MaxEntryName) As Byte
    szDeviceType(RAS95_MaxDeviceType) As Byte
    szDeviceName(RAS95_MaxDeviceName) As Byte
End Type

Public Type RASCONNSTATUS95
    dwSize As Long
    RasConnState As Long
    dwError As Long
    szDeviceType(RAS95_MaxDeviceType) As Byte
    szDeviceName(RAS95_MaxDeviceName) As Byte
End Type

Public Function Connected() As Boolean
Dim TRasCon(255) As RASCONN95
Dim lg As Long
Dim lpcon As Long
Dim retVal As Long
Dim Tstatus As RASCONNSTATUS95

    TRasCon(0).dwSize = 412
    lg = 256 * TRasCon(0).dwSize

    retVal = RasEnumConnections(TRasCon(0), lg, lpcon)
    If retVal <> 0 Then
       Exit Function
    End If

    Tstatus.dwSize = 160
    retVal = RasGetConnectStatus(TRasCon(0).hRasCon, Tstatus)
    If Tstatus.RasConnState = &H2000 Then
      Connected = True
    Else
      Connected = False
    End If
End Function

Public Sub HangUp()
Dim i As Long
Dim lpRasConn(255) As RasConn
Dim lpcb As Long
Dim lpcConnections As Long
Dim hRasConn As Long

lpRasConn(0).dwSize = RAS_RASCONNSIZE
lpcb = RAS_MAXENTRYNAME * lpRasConn(0).dwSize
lpcConnections = 0
ReturnCode = RasEnumConnections(lpRasConn(0), lpcb, _
lpcConnections)

If ReturnCode = ERROR_SUCCESS Then
    For i = 0 To lpcConnections - 1
        If Trim(ByteToString(lpRasConn(i).szEntryName)) _
            = Trim(gstrISPName) Then
            hRasConn = lpRasConn(i).hRasConn
            ReturnCode = RasHangUp(ByVal hRasConn)
        End If
    Next i
End If
End Sub

Public Function ByteToString(bytString() As Byte) As String
Dim i As Integer

ByteToString = ""
i = 0
While bytString(i) = 0&
ByteToString = ByteToString & Chr(bytString(i))
i = i + 1
Wend
End Function


