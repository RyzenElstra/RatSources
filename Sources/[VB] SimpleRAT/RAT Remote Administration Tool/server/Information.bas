Attribute VB_Name = "Information"
'Time Win running
Public Declare Function GetTickCount& Lib "kernel32" ()
'get process
Public Declare Function GetWindow Lib "user32" (ByVal hWnd As Long, ByVal wCmd As Long) As Long
Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function IsWindowVisible Lib "user32" (ByVal hWnd As Long) As Long
Public Declare Function GetDesktopWindow Lib "user32" () As Long
'Show Drive Informations
Public Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Public Declare Function GetDiskFreeSpace Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectorsPerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long) As Long
Public Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
'user name
Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'computer name
Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'country
Public Declare Function GetProfileString Lib "kernel32" Alias "GetProfileStringA" (ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long) As Long
'os version
Public Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVersionInfo) As Long
'os version
Type OSVersionInfo
    dwOSVersionInfoSize As Long
    dwMajorVersion      As Long
    dwMinorVersion      As Long
    dwBuildNumber       As Long
    dwPlatformId        As Long
    szCSDVersion        As String * 128
End Type
Public OS As OSVersionInfo

Public Function UserName() As String 'get user name
On Error Resume Next
    Dim a As String
    a = Space$(100)
    GetUserName a, 100
    a = Trim(a)
    a = Mid(a, 1, Len(a) - 1)
    UserName = a
End Function

Public Function ComputerName() As String 'get computer name
On Error Resume Next
    Dim a As String
    a = Space$(100)
    GetComputerName a, 100
    a = Trim(a)
    a = Mid(a, 1, Len(a) - 1)
    ComputerName = a
End Function

Public Function OSversion() As String 'get os version
On Error Resume Next
    Dim buffer As String
    
    OS.dwOSVersionInfoSize = Len(OS)
    GetVersionEx OS
    Select Case OS.dwPlatformId
    Case 0
        buffer = "Windows 3.1"
    Case 1
        buffer = "Windows 95/98/ME/2000"
    Case 2
        buffer = "Windows NT"
    End Select
    
    buffer = buffer & "   Version : " & OS.dwMajorVersion & "." & OS.dwMinorVersion & "." & OS.dwBuildNumber
    OSversion = buffer
End Function

Public Function Country() As String 'get country
On Error Resume Next
    Dim Temporary   As String * 50
    Dim ReturnValue As Long

    ReturnValue = GetProfileString("Intl", "sCountry", "", Temporary, 50)
    If ReturnValue Then
        countryn = Left(Temporary, ReturnValue)
    Else
        countryn = "-----"
    End If
    Country = countryn
End Function

Public Function GetSysInfo() As String 'get system information
On Error Resume Next
    Dim buffers As String
    Dim cuser, cname, cops, con, tim  As String

    buffers = "Computer Name    : " & ComputerName & vbNewLine & "Current User     : " & UserName & vbNewLine & "Operating System : " & OSversion & vbNewLine & "Country          : " & Country & vbNewLine & "Current Time     : " & Time & vbNewLine
    GetSysInfo = "GSI" & buffers
End Function

Public Function GetWindows() As String 'get windows
On Error Resume Next
    Dim ActiveWindows           As String
    Dim sText                   As String * 255
    Dim sTitle                  As String
    Dim buffer                  As String
    Dim tmpLen                  As Long
    Dim hWnd                    As Long
    Dim NumberOfActiveWindows   As Integer
    Dim bAdd                    As Boolean
    Dim transmit                As String
    
    NumberOfActiveWindows = 0
    
    hWnd = GetWindow(GetDesktopWindow, 5)
    Do While hWnd <> 0
        sText = String(255, vbNullChar)
        tmpLen = GetWindowText(hWnd, sText, 255)
        sTitle = Mid(sText, 1, tmpLen)
            'Check if window is visible
            bAdd = IsWindowVisible(hWnd)
            bAdd = bAdd And Len(sTitle)
        If bAdd Then
            NumberOfActiveWindows = NumberOfActiveWindows + 1
            buffer = Str(hWnd)
            buffer = Mid(buffer, 2)
            If IsWindowVisible(hWnd) Then
               ActiveWindows = sTitle
               transmit = transmit & NumberOfActiveWindows & " : " & ActiveWindows & vbNewLine
            End If
        End If
        hWnd = GetWindow(hWnd, 2)
    Loop

    transmit = "GWD" & transmit
    GetWindows = transmit
End Function

Public Function FreeDiskSpace(ByVal DriveLetter As String) As Long 'get free disk space
On Error Resume Next
    Dim SectorsPerCluster   As Long
    Dim BytesPerSector      As Long
    Dim FreeClusters        As Long
    Dim NumberOfClusters    As Long
    Dim buffer              As Double
    Dim ReturnValue         As Long

    ReturnValue = GetDiskFreeSpace(DriveLetter & ":\", SectorsPerCluster, BytesPerSector, FreeClusters, NumberOfClusters)
    buffer = FreeClusters / 1024
    buffer = buffer / 1024
    FreeDiskSpace = BytesPerSector * SectorsPerCluster * buffer
End Function

Public Function ShowFileSystemType(ByVal DriveLetter As String) As String 'show file system
On Error Resume Next

    Dim SerNo           As Long
    Dim ReturnValue     As Long
    Dim DriveLabel      As String
    Dim FileSystemType  As String

    DriveLabel = Space$(255)
    FileSystemType = Space$(255)
    DriveLetter = DriveLetter & ":\"
    ReturnValue = GetVolumeInformation(DriveLetter, DriveLabel, Len(DriveLabel), SerNo, 0, 0, FileSystemType, Len(FileSystemType))
    If ReturnValue > 0 Then
        FileSystemType = Left(FileSystemType, InStr(FileSystemType, Chr(0)) - 1)
    Else
        FileSystemType = "-----"
    End If
    
    ShowFileSystemType = FileSystemType
End Function

Public Function GetDriveLabel(ByVal DriveLetter As String) As String 'get drive label
On Error Resume Next
    Dim SerNo           As Long
    Dim DriveLabel      As String
    Dim FileSystemType  As String
    Dim ReturnValue     As Long

    DriveLabel = Space$(255)
    FileSystemType = Space$(255)
    DriveLetter = DriveLetter & ":\"
    ReturnValue = GetVolumeInformation(DriveLetter, DriveLabel, Len(DriveLabel), SerNo, 0, 0, FileSystemType, Len(FileSystemType))
    If ReturnValue > 0 Then
        DriveLabel = Left(DriveLabel, InStr(DriveLabel, Chr(0)) - 1)
    Else
        DriveLabel = "-----"
    End If
    
    GetDriveLabel = DriveLabel
End Function

Public Function GetDriveInformations() As String 'drive informaiton
On Error Resume Next
   Dim NumberOfDrives      As Byte
   Dim i                   As Long
   Dim Typ                 As Long
   Dim FreeSpace           As Long
   Dim FileSystem          As String
   Dim DriveLabel          As String
   Dim strFreeSpace        As String
   Dim buffer              As String

   NumberOfDrives = 0
   For i = 0 To 25
      Typ = GetDriveType(Chr(i + 65) + ":\")
        If Typ > 1 Then
            If Typ = 2 Then
                FreeSpace = 0
                FileSystem = "-----"
                DriveLabel = "-----"
            Else
                FreeSpace = Round(FreeDiskSpace(Chr(i + 65)))
                FileSystem = ShowFileSystemType(Chr(i + 65))
                FileSystem = spaces(FileSystem, 9)
                DriveLabel = GetDriveLabel(Chr(i + 65))
                DriveLabel = spaces(DriveLabel, 13)
            End If
            strFreeSpace = Mid(Str(FreeSpace), 2)
            NumberOfDrives = NumberOfDrives + 1
            buffer = buffer & Chr(i + 65) & ":    " & DriveLabel & FileSystem & FreeSpace & " MB " & vbNewLine
        End If
    Next i
    
    GetDriveInformations = "GDI" & buffer
End Function

Private Function spaces(name As String, length As Integer) As String ' to add spaces on suffix
On Error Resume Next
    Do While Len(name) <> length And Len(name) < length
        name = name & "-"
    Loop
    spaces = name
End Function


