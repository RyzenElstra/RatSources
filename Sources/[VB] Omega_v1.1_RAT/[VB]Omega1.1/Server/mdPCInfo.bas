Attribute VB_Name = "mdPCInfo"
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Const MAX_PATH = 260

Private Declare Sub GlobalMemoryStatus Lib "kernel32" (lpBuffer As MEMORYSTATUS)
Type MEMORYSTATUS
dwLength As Long
dwMemoryLoad As Long
dwTotalPhys As Long
dwAvailPhys As Long
dwTotalPageFile As Long
dwAvailPageFile As Long
dwTotalVirtual As Long
dwAvailVirtual As Long
End Type

Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long

Private Declare Function GetVersionX Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Private Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type

Private Declare Function CreateIC Lib "gdi32" Alias "CreateICA" (ByVal lpDriverName As String, ByVal lpDeviceName As Any, ByVal lpOutput As Any, ByVal lpInitData As Any) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Const BITSPIXEL = 12
Private Const PLANES = 14

Private Declare Function GetDiskFreeSpaceEx Lib "kernel32" Alias "GetDiskFreeSpaceExA" (ByVal lpDirectoryName As String, lpFreeBytesAvailableToCaller As Currency, lpTotalNumberOfBytes As Currency, lpTotalNumberOfFreeBytes As Currency) As Long
Public Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Public Const DRIVE_REMOVABLE = 2
Public Const DRIVE_FIXED = 3
Public Const DRIVE_CDROM = 5

'********Get PC Information********************************
Function Get_ComputerName() As String
Dim x As Integer
Dim y As String

y = String(255, " ")
x = GetComputerName(y, 256)
y = Trim(y)
If Len(y) > 0 Then
   Get_ComputerName = Left(y, Len(y) - 1)
End If
If Trim(Get_ComputerName) = "" Then
   Get_ComputerName = "-Not Found-"
End If
End Function

Function Get_UserName() As String
Dim x As Integer
Dim y As String

y = String(255, " ")
x = GetUserName(y, 256)
y = Trim(y)
If Len(y) > 0 Then
   Get_UserName = Left(y, Len(y) - 1)
End If
If Trim(Get_UserName) = "" Then
   Get_UserName = "-Not Found-"
End If
End Function

Function Get_RegOwner() As String
If GetWindows Then
   Get_RegOwner = GetStringKey(HKEY_LOCAL_MACHINE, WinInfo, "RegisteredOwner")
Else
   Get_RegOwner = GetStringKey(HKEY_LOCAL_MACHINE, WinInfoNT, "RegisteredOwner")
End If
If Trim(Get_RegOwner) = "" Then
   Get_RegOwner = "-Not Found-"
End If
End Function

Function Get_RegCompany() As String
If GetWindows Then
   Get_RegCompany = GetStringKey(HKEY_LOCAL_MACHINE, WinInfo, "RegisteredOrganization")
Else
   Get_RegCompany = GetStringKey(HKEY_LOCAL_MACHINE, WinInfoNT, "RegisteredOrganization")
End If
If Trim(Get_RegCompany) = "" Then
   Get_RegCompany = "-Not Found-"
End If
End Function

Function Get_WinPath() As String
Dim rtn
Dim Buffer As String 'declare the needed variables
   
   Buffer = Space(MAX_PATH)
   rtn = GetWindowsDirectory(Buffer, Len(Buffer)) 'get the path
   Get_WinPath = Left(Buffer, rtn) 'parse the path to the global string
   If Right(Get_WinPath, 1) <> "\" Then
      Get_WinPath = Get_WinPath & "\"
   End If
End Function

Function Get_SysPath() As String
Dim rtn
Dim Buffer As String 'declare the needed variables
   
   Buffer = Space(MAX_PATH)
   rtn = GetSystemDirectory(Buffer, Len(Buffer)) 'get the path
   Get_SysPath = Left(Buffer, rtn) 'parse the path into the global string
   If Right(Get_SysPath, 1) <> "\" Then
      Get_SysPath = Get_SysPath & "\"
   End If
End Function

Function Get_OSPlatform() As String
If GetWindows Then
   Get_OSPlatform = GetStringKey(HKEY_LOCAL_MACHINE, WinInfo, "ProductName")
Else
   Get_OSPlatform = GetStringKey(HKEY_LOCAL_MACHINE, WinInfoNT, "ProductName")
End If
If Trim(Get_OSPlatform) = "" Then
   Get_OSPlatform = "-Not Found-"
End If
End Function

Function Get_OSVersion() As String
Dim OSInfo As OSVERSIONINFO
Dim retVal As Long

retVal = GetVersionX(OSInfo)
OSInfo.dwOSVersionInfoSize = 148
OSInfo.szCSDVersion = Space(128)
retVal = GetVersionX(OSInfo)
Get_OSVersion = OSInfo.dwMajorVersion & "." & OSInfo.dwMinorVersion
End Function

Function Get_WinCDKey() As String
If GetWindows Then
   Get_WinCDKey = GetStringKey(HKEY_LOCAL_MACHINE, WinInfo, "ProductKey")
Else
   Get_WinCDKey = GetStringKey(HKEY_LOCAL_MACHINE, WinInfoNT, "ProductKey")
End If
If Trim(Get_WinCDKey) = "" Then
   Get_WinCDKey = "-Not Found-"
End If
End Function

Function Get_DirectXVer() As String
Dim Ver As String

Ver = GetStringKey(HKEY_LOCAL_MACHINE, "Software\Microsoft\DirectX", "Version")
Get_DirectXVer = "DirectX " & Mid(Ver, 4, 3) & " (" & Ver & ")"
If Trim(Get_DirectXVer) = "" Then
   Get_DirectXVer = "-Not Found-"
End If
End Function

Function Get_ScrResolution() As String
Dim iWidth As Integer
Dim iHeight As Integer
    
    iWidth = Screen.Width / Screen.TwipsPerPixelX
    iHeight = Screen.Height / Screen.TwipsPerPixelY
    Get_ScrResolution = iWidth & " x " & iHeight
End Function

Public Function Get_ColorDepth() As String
Dim lhDC As Long, lPlanes As Long, lBitsPerPixel As Integer
'Declare variables

lhDC = CreateIC("DISPLAY", 0&, 0&, 0&)
'Create the device context for the display

If lhDC = 0 Then
   'An error has occurred and the function will exit
   Get_ColorDepth = "Error"
   Exit Function
End If

lPlanes = GetDeviceCaps(lhDC, PLANES)
'Return info on number of planes

lBitsPerPixel = GetDeviceCaps(lhDC, BITSPIXEL)
'Use display device context to return info on the
'number of pixels

lhDC = DeleteDC(lhDC)
'Delete the device context

Select Case lPlanes

  Case 1
    '1 plane is available. This will be the same for most
    'computer systems

    Select Case lBitsPerPixel
      'Select the number of colours available
      Case 4: Get_ColorDepth = "4 Bit 16 Colors"
      Case 8: Get_ColorDepth = "8 Bit 256 Colors"
      Case 16: Get_ColorDepth = "16 Bit High Color"
      Case 24: Get_ColorDepth = "24 Bit True Color"
      Case 32: Get_ColorDepth = "32 Bit True Color"
    End Select

  Case 4
    Get_ColorDepth = "16 Bit High Color"
    'If there are 4 planes then the availible
    'colours will be 16-bit

  Case Else
    Get_ColorDepth = "Undetermined"
    'The number of colours could not bee determined

End Select

End Function

Function Get_CPUModel() As String
Get_CPUModel = GetStringKey(HKEY_LOCAL_MACHINE, "Hardware\Description\System\CentralProcessor\0", "Identifier")
If Trim(Get_CPUModel) = "" Then
   Get_CPUModel = GetStringKey(HKEY_LOCAL_MACHINE, "Hardware\Description\System\CentralProcessor\0", "VendorIdentifier")
End If
If Trim(Get_CPUModel) = "" Then
   Get_CPUModel = "-Not Found-"
End If
End Function

Function Get_RAM() As String
Dim m As MEMORYSTATUS

Call GlobalMemoryStatus(m)
Get_RAM = Format(m.dwTotalPhys / 1024 / 1021.45, "###") & ".0MB RAM"
End Function

Function Get_HDDSpace() As String
Dim HDD, hd, i As Integer
Dim HDDLetter, GetHDD, HDS As String
Dim Status As Long
Dim TotalBytes As Currency
Dim FreeBytes As Currency
Dim BytesAvailableToCaller As Currency
Dim FreeMB, TotalMB As Currency

For HDD = Asc("C") To Asc("Z")
   If GetDriveType(Chr(HDD) + ":\") = 3 Then '3 is DRIVE_FIXED (Hard Disk)
   GetHDD = GetHDD & Chr(HDD)
   End If
Next HDD

FreeMB = 0
TotalMB = 0
HDS = ""

hd = Len(GetHDD) 'get how many hard disk.
For i = 1 To hd
    HDDLetter = Mid(GetHDD, i, 1) 'get hard disk letter
    Status = GetDiskFreeSpaceEx(HDDLetter & ":", BytesAvailableToCaller, TotalBytes, FreeBytes)
    If Status <> 0 Then
       TotalMB = Format((TotalBytes * 10000) / 1000000, "###")
       FreeMB = Format((FreeBytes * 10000) / 1000000, "###")
       HDS = HDS & "Drive " & HDDLetter & ": " & FreeMB & " MB of " & TotalMB & " MB" & vbCrLf
    End If
Next i
Get_HDDSpace = HDS
End Function
'**********************************************************

