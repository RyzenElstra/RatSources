Attribute VB_Name = "Kernel"
'The Kernel oF KeKo Martainl 23-U virsion 1.0
'Copy rights reserved for The Black Guy
'<<<<<<<<<<<< Global Declrations & Variables >>>>>>>>>>>>>>
Public Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
Public Declare Function SetTimer Lib "user32" (ByVal hWnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Public Declare Function KillTimer Lib "user32" (ByVal hWnd As Long, ByVal nIDEvent As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function DeleteFile Lib "Kernel32.dll" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Public Declare Function inet_addr Lib "wsock32" (ByVal s As String) As Long
Private Declare Function RegisterHotKey Lib "user32" (ByVal hWnd As Long, ByVal ID As Long, ByVal fsModifiers As Long, ByVal vk As Long) As Long
Private Declare Function UnregisterHotKey Lib "user32" (ByVal hWnd As Long, ByVal ID As Long) As Long
Private Declare Function PeekMessage Lib "user32" Alias "PeekMessageA" (lpMsg As Msg, ByVal hWnd As Long, ByVal wMsgFilterMin As Long, ByVal wMsgFilterMax As Long, ByVal wRemoveMsg As Long) As Long
Private Declare Function WaitMessage Lib "user32" () As Long
Private Declare Function PlaySoundMem Lib "winmm.dll" Alias "PlaySoundA" (ByVal lpszName As Long, ByVal hModule As Long, ByVal dwFlags As Long) As Long

'General Counters
Const GWL_STYLE = (-16)
Const ES_NUMBER = &H2000&
Public Const SOCKET_ERROR As Long = -1
'Constants of Moaking Forms ON top
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const Flags = SWP_NOSIZE Or SWP_NOMOVE
'Constants of the Hotkey proccessing
Private Const MOD_ALT = &H1
Private Const MOD_CONTROL = &H2
Private Const MOD_SHIFT = &H4
Private Const PM_REMOVE = &H1
Private Const WM_HOTKEY = &H312
'Constants Of playing sounds
 Private Const SND_ASYNC = &H1
 Private Const SND_MEMORY = &H4
 Private Const SND_NODEFAULT = &H2
 Private Const SND_NOSTOP = &H10
 Private Const SND_NOWAIT = &H2000
    
Public Const Separator_Char = "|" 'The File Browser Separator Character , It should a char cann,t be written in the Folders and files  names
Public Const MAX_BUFFER_SIZE = 4 * 1024 '4KB Is The maximum size of data can be sent Via a Socket
Public Const AppName = "Handle-X Pro V1.0" 'The App name of the progra

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
Public Type ICMP_OPTIONS
   Ttl             As Byte
   Tos             As Byte
   Flags           As Byte
   OptionsSize     As Byte
   OptionsData     As Long
End Type
Public Type ICMP_ECHO_REPLY
   Address         As Long
   status          As Long
   RoundTripTime   As Long
   DataSize        As Long
  'Reserved        As Integer
   DataPointer     As Long
   Options         As ICMP_OPTIONS
   Data            As String * 250
End Type
Public Type POINTAPI
    X As Long
    Y As Long
End Type
Public Type Msg
    hWnd As Long
    Message As Long
    wParam As Long
    lParam As Long
    time As Long
    pt As POINTAPI
End Type

'Application Execution stats
Public Const SW_HIDE = 0
'Hide the opened window.
Public Const SW_SHOWNORMAL = 1
'Show the opened window and activate it (as usual).
Public Const SW_MAXIMIZE = 3
'Maximize the opened window.
Public Const SW_SHOWNOACTIVATE = 4
'Show the opened window in its most recent size and position but do not activate it.
Public Const SW_SHOW = 5
'Show the opened window.
Public Const SW_MINIMIZE = 6
'Minimize the opened window.
Public Const SW_SHOWMINNOACTIVE = 7
'Show the opened window minimized but do not activate the it.
Public Const SW_SHOWNA = 8
'Show the opened window in its current state but do not activate it.

'<<<<< File_Browser User-FeedBack Variables
Public File_Browser_Attributes_Value As Byte 'Value of Attributes
Public File_Browser_Shell_Value As Byte 'Value of Shell State
Public File_Browser_Search_Value As String 'Value Of the Patters comming from user
Public File_Browser_Copy_Move As CopiedMovedItem  'Value of Copy to or Move to and the Destination Path
'<<<<< Connection Variables >>>>>
Public Connected As Boolean, Connections_index As Integer
'<<<<< Style Values >>>>>
Public Label_Bgcolor As Long
Public Label_Forecolor As Long

'<<<<< Download Manager >>>>>
   'The Enum used in Downloading-Files Periorties
Public Const Highest = 5
Public Const High = 4
Public Const Normal = 3
Public Const Slow = 2
Public Const Waitting = 1
Public Const Pause = 0

Public Type Downloadable_Item '500 bytes total
    TFName As String * 95
    FFName As String * 95
    FPcName As String * 50 'Indicates the pc name of the source file
    FURL As String * 150 'Includes the Server sorece URL "C:\Folder 12\"
    Size As Long '4 Bytes reserver for the sizes of the file
    Done As Long
    Comment As String * 100
    Type As Byte 'Indicates the type of file (Web/Disk) "W" OR "D"
    Periority As Byte
    StartTime As String * 25 'Date And Time Of The Start Of That Threat
End Type
'<<<<< Task Manager >>>>>
Public Task_Manager_Shell_Value As Byte 'Value of Shell State

'General Global Variables
Public Win_Dir As String, Sys_Dir As String
Public OSPlateForm As Enum_OperatingPlatform '0 for others OS's,1 for Win98/Me , 2 for WinNT&XP
Public OSName As Enum_OperatingSystem 'Operatting System NAME
Public AppPath As String 'Global Application Path With Slash
Public LocalIP As String, LocalHostName As String  'Global Local information
Public WHandle As Long 'The Handle of the Main Window
Public HKMsgFlag As Boolean 'Flag indicates weather Handle-X Check hotkeys or not
Public CurIPToTest As String 'IP which will be transfeared to the tools from the IPtools drop menu
Public UserName As String, Password As String  'Authoriazation Stuff
Public SoundArray() As Byte 'The Sound Sata played when message arraive/Gamea arrived and others
Public Sub Initialize_KeKo()
    On Error Resume Next
    Dim i As Integer 'General Counter
   'Initialize The Main Rooms
    For i = 0 To Frm_Main.room.UBound
       With Frm_Main.room(i)
           .Visible = False
           .Top = 1200
           .Left = 2040
           .Height = 4935
           .Width = 8655
       End With
    Next i
   'Get Windows Info
    GetWinInfo
   'Set Application Path
    AppPath = AddBackslash(App.Path) & App.EXEName & ".exe"
    WHandle = Frm_Main.hWnd
End Sub
Public Sub Delay(NumberOfUnits As Currency)
    Dim i As Currency
    For i = 0 To NumberOfUnits
        DoEvents
    Next i
End Sub
Public Sub Set_Text_Box_Number(NumberText As TextBox, Flag As Boolean)
 'Function used for set any text box to Number-Style only
 'Used mainly in IP,PORT text boxs to disable Characters Entry
    Dim curstyle As Long, newstyle As Long
    'retrieve the window style
    curstyle = GetWindowLong(NumberText.hWnd, GWL_STYLE)
    If Flag Then
       curstyle = curstyle Or ES_NUMBER
    Else
       curstyle = curstyle And (Not ES_NUMBER)
    End If
    'Set the new style
    newstyle = SetWindowLong(NumberText.hWnd, GWL_STYLE, curstyle)
    'refresh
    NumberText.Refresh
End Sub
Public Function AddBackslash(s As String) As String
    If Len(s) Then
       If Right$(s, 1) <> "\" Then
          AddBackslash = s & "\"
       Else
          AddBackslash = s
       End If
    Else
       AddBackslash = "\"
    End If
End Function
Function String_Size(NuSize As Long) As String
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
Function Char_Representation(Value As Long) As String
   'This Function Accept long number and convert it to 32 bit lenght string
    Dim Char(3) As Byte
    On Error Resume Next
    For i = 0 To 3
        Char(i) = Int(Value / (255 ^ i)) Mod 255
    Next
    For i = 0 To 3: Char_Representation = Char_Representation & Chr$(Char(i)): Next
End Function
Function Long_Representation(Str As String) As Long
    Dim Char(3) As Byte
    For i = 0 To 3: Char(i) = Asc(Mid$(Str, i + 1, 1)): Next
    For i = 0 To 3
        Long_Representation = Long_Representation + (Char(i) * (255 ^ i))
    Next
End Function
Public Function Get_File_Data(FilePath As String, Optional DataOffset As Long) As String
    'Frame_number up to 20bit decoded to 1MB frames
    'The DataOffset To The Max_Buffer_Size is the Asked Frame
    'The Max_file_size supported = 4GB !
    Dim Data_Buffer As String 'The String variable carry the data and It could me Resize After (In Case Of Last Frame)
    Dim File_Lenght As Long, EndOfFile As Boolean
    On Error GoTo Failed
    'Check The File Existance
    If CStr(CBool(PathFileExists(FilePath))) = False Then err.Raise 12, , "File Doesn't Exist"
    'STore The size of the file in Bytes
    File_Lenght = FileLen(FilePath)
    'Check DataOffset didn't axcced the File lenght
    If (DataOffset > File_Lenght) Then
        EndOfFile = True
        GoTo True1
    End If
    'If Less Offset then The Offset is the first offset
    If (DataOffset < 1) Then DataOffset = 1
    'Check Last Frame
    If (DataOffset + MAX_BUFFER_SIZE) > File_Lenght Then
        'Last Frame
        'Resize the Data Buffer width
        Data_Buffer = String((File_Lenght - DataOffset + 1), vbNullChar)
        EndOfFile = True
    Else
        'Normal Frame
        'Resize the buffer by the Normal Buffer Width
        Data_Buffer = String(MAX_BUFFER_SIZE, vbNullChar)
    End If
    'Open The File For Binary Read
    Dim File_Number As Integer
    File_Number = FreeFile
    Open FilePath For Binary As File_Number
        Seek #File_Number, DataOffset
        Get #File_Number, , Data_Buffer
    Close File_Number
    'The Function Should Return Offset, Data and (EOF IF EndOfile encountered)
True1:
    Get_File_Data = "True " & Char_Representation(DataOffset) & Data_Buffer
    'Add EOF if EndOfFile Encountered
    If EndOfFile = True Then Get_File_Data = Get_File_Data & "EOF"
    Exit Function
Failed:
    'Retruns the Error Description
    Close File_Number 'Close The Opened File
    Get_File_Data = "False" & err.Description
    err.Clear
End Function
Function Put_File_data(File_Path As String, Data_Buffer As String, Optional Data_Offset As Long = -1) As String
    'returns true and false
    'Used In Appendding File At Any Offset by The Comming binary data
    'This function can write to file already opened by Another Applications
    'Data Offset = -1 means The append operation will be performed at the end of the file
    Dim File_Lenght As Long
    On Error GoTo Failed
    'Check The File Existance
    Dim File_Number As Integer
    File_Number = FreeFile
    If CStr(CBool(PathFileExists(File_Path))) = False Then
        'Creat the new file
            Open File_Path For Output As File_Number
            Close #File_Number
    End If
    'STore The size of the file in Bytes
    File_Lenght = FileLen(File_Path)
    'Check If The Data Offset > The Lenght of the file (IF Then Consider that "The End OF file"
    If Data_Offset > File_Lenght Then Data_Offset = -1
    'Calculate The Data_Offset if not comeing
    If Data_Offset = -1 Then Data_Offset = File_Lenght + 1
    'Check Availability of the data offset
    If (Data_Offset > File_Lenght + 1) Then err.Raise 14, , "Invalid File Offset !"
    'Open The File Appending the data into
    Open File_Path For Binary As File_Number
        Seek #File_Number, Data_Offset
        Put #File_Number, , Data_Buffer
    Close #File_Number
    'The function returns True signal
    Put_File_data = "True"
    Exit Function
Failed:
    'Retruns the Error number and Error Description
    Close #File_Number 'Close The File
    Put_File_data = "False" & File_Path & Separator_Char & err.Description
End Function
Public Function GET_RANDOM(VLow, VHigh) As Integer   'I IS MINIMUM VALUE AND J IS THE MAX VALUE
     Randomize
     GET_RANDOM = Int((VHigh - VLow + 1) * Rnd + VLow)
End Function
Public Sub UploadTimerProc()
    FileBrowser.UploadEngine
End Sub
Public Function IsValidIpAddress(IPAddress As String) As Boolean
    If IPAddress Like "*.*.*.*" Then IsValidIpAddress = True
End Function
Public Function IPAddressToNumber(ByVal IPAddress As String) As Currency
On Error Resume Next
Dim i As Integer, IPSections() As String
    IPSections = Split(IPAddress, ".")
    For i = 0 To 3
        IPAddressToNumber = IPAddressToNumber + (Val(IPSections(3 - i)) * (256 ^ i))
    Next i
End Function
Public Function IPNumberToAddress(ByVal IPNumber As Currency) As String
'On Error Resume Next
Dim i As Integer, Tmp As Double
    For i = 0 To 3
        IPNumberToAddress = IPNumberToAddress & "." & Int(IPNumber / (256 ^ (3 - i)))
        Tmp = (IPNumber / (256 ^ (3 - i))) - Int(IPNumber / (256 ^ (3 - i)))
        IPNumber = Tmp * (256 ^ (3 - i))
    Next i
    IPNumberToAddress = Mid$(IPNumberToAddress, 2)
End Function
Public Function IsValidPortNumber(PortNumber As String) As Boolean
    If Val(PortNumber) > 0 And Val(PortNumber) < 65534 Then
        IsValidPortNumber = True
    End If
End Function
Public Sub GetWinInfo()
'Function Retrive all windows system information in "OSPlateForm" & "OSName"
    On Error Resume Next
    Dim Iret As Long
   'Plate From Information
    Dim lpVersionInformation As OSVERSIONINFO
    lpVersionInformation.dwOSVersionInfoSize = Len(lpVersionInformation)
    Call GetVersionExA(lpVersionInformation)
    OSPlateForm = lpVersionInformation.dwPlatformId
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
    Win_Dir = Space(255)
    Iret = GetWindowsDirectory(Win_Dir, 255)
    Win_Dir = AddBackslash(Left$(Win_Dir, Iret))
   'System Directory
    Sys_Dir = Space(255)
    Iret = GetSystemDirectory(Sys_Dir, 255)
    Sys_Dir = AddBackslash(Left$(Sys_Dir, Iret))
End Sub
Public Sub AddText(TextObject As TextBox, SrcText As String, Optional Method = 0)
   'Method = 0 means Clear B4 Paste
   'Method = 1 means Append TextBox
    'On Error Resume Next
    If Method = 0 Then TextObject = ""
   'Paste The Text
    If Len(TextObject) = 0 Then
        TextObject = SrcText
    Else
        TextObject = TextObject & vbCrLf & SrcText
    End If
    TextObject.SelStart = Len(TextObject)
End Sub
Public Sub ComplieSystemFiles(FilePath As String, FileType As String)
    'System files is downloaded by x-downloader without any control from user
    'This files is needed for the client as a feedback data from server
     Dim Data As String
     Data = OpenFileToRead(FilePath)
     Select Case FileType
            Case "Files Info." 'Exploring FileSystem
                  Insert_Files Mid$(Data, 1, InStr(1, Data, Separator_Char) - 1), Mid$(Data, InStr(1, Data, Separator_Char) + 1)
            Case "Search Results." 'System Search Results
                  Editor.SetString Data, "Search Results"
            Case "Reg-Key-Search."
                  Editor.SetString Data, "Find Keys Results"
            Case "Reg-Val-Search."
                  Editor.SetString Data, "Find Values Results"
            Case "Reg-Explore."
                  SystemFunctions 178, "T0" & Data
            Case "Get-Hist-Result."
                  SystemFunctions 190, "T0" & Data
     End Select
     Kill FilePath
End Sub
Public Function OpenFileToRead(FilePath As String) As String
    On Error Resume Next
    Dim RetStr As String
    RetStr = Space(FileLen(FilePath))
    FFile = FreeFile
    Open FilePath For Binary As #FFile
        Get #FFile, , RetStr
    Close #FFile
    OpenFileToRead = RetStr
End Function
Public Sub MakeForOnTop(TargetForm As Long)
        SetWindowPos TargetForm, -1, 0, 0, 0, 0, Flags
End Sub
Public Sub Sound()
    On Error Resume Next
    If UBound(SoundArray) = 0 Then
        'Load
         SoundArray = LoadResData(101, "CUSTOM")
    End If
   'Play
    Call PlaySoundMem(VarPtr(SoundArray(0)), 0, _
    SND_NOWAIT Or SND_NODEFAULT Or SND_MEMORY Or SND_ASYNC Or SND_NOSTOP)
End Sub
Public Sub WriteInfo()
    Dim Info As String
    Info = vbCrLf & "---[ Ahmed Ezz ]---" & vbCrLf & "Email Address : mr.ezzuz@gmail.com" & vbCrLf & vbCrLf
    Info = Info & "--| Special Thanks To |--" & vbCrLf
    Info = Info & "-------------------------------------" & vbCrLf
    Info = Info & "[Dr. M. Allam] [The Sniper] [Lost&&Forgetten] [The_Proff] [7eles] [Bluepancy] [Fodo] [Rakan] [SaD JaCkAl] [M. M. M.] [Linux_Storm] [&&Others...]" & vbCrLf & vbCrLf
    Info = Info & "--| Referanced To |--" & vbCrLf
    Info = Info & "----------------------------------" & vbCrLf
    Info = Info & "[http://x-code.org]"
    Frm_Main.Description(2) = Info
End Sub
Public Function Remove_File(File_Path As String) As Boolean
    Dim Tmp As Long
    Tmp = DeleteFile(File_Path)
    If Tmp > 0 Then 'Succeed
        Remove_File = True
    Else
        Remove_File = False
    End If
End Function
Public Function CheckIPAddress(ByVal IPAddress As String) As Boolean
Dim i As Long
    i = inet_addr(IPAddress)
    If i <> SOCKET_ERROR Then
        CheckIPAddress = True
    Else
        CheckIPAddress = False
    End If
End Function
'''''''''''''''''''<< Hotkeys >>''''''''''''''''''
Public Sub ProcessMessages()
    Dim Message As Msg
    'loop until bCancel is set to True
    Do While HKMsgFlag
       'Wait for a message
        WaitMessage
       'Check if it's a HOTKEY-message
        If PeekMessage(Message, WHandle, WM_HOTKEY, WM_HOTKEY, PM_REMOVE) Then
            'Check Password protection
             If Len(Password) > 0 Then
                If InputBox("Please Mr. " & UserName & vbCrLf & "Input Your Password Below :", "Password Protection") <> Password Then
                    MsgBox "Invalid Password !", vbCritical, "Password Protection"
                    GoTo ResumeLoopping
                End If
             End If
            'Return The Application to t's normal state
             App.TaskVisible = True
             Frm_Main.Show
             UnregHotKeys
        End If
        DoEvents
ResumeLoopping:
    Loop
End Sub
Public Function RegHotKey() As Boolean
    Dim ret As Long
    ret = RegisterHotKey(WHandle, &HBFFF&, MOD_CONTROL Or MOD_ALT, vbKeyF12)
    RegHotKey = IIf(ret = 0, False, True)
End Function
Public Sub UnregHotKeys()
    HKMsgFlag = False
    UnregisterHotKey WHandle, &HBFFF&
End Sub
''''''''''''''''''' << IPTools Navigator >>'''''''''''''''''''
Public Sub IPtools(ToolIndex As Integer)
'Apply the tool in the Public variable : CurIPToTest
'Check The IP first
If Len(CurIPToTest) > 0 Then
    Select Case ToolIndex
           Case 0 'X-Router
                 Router.ExecuteRouter CurIPToTest
           Case 1 'X-Ping
                 Ping.ExecutePing CurIPToTest
           Case 2 'X-Whois
                 Whois.ExecuteWhois CurIPToTest
           Case 3 'X-Tracert
                 
           Case 4 'X-Scanner
                 
    End Select
End If
End Sub
Public Sub SeletctAll(MyTextBox As TextBox)
    MyTextBox.SetFocus
    MyTextBox.SelStart = 0
    MyTextBox.SelLength = Len(MyTextBox)
End Sub
