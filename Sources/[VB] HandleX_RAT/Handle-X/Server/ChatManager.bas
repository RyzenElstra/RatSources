Attribute VB_Name = "ChatManager"
'Declerations
'Hook
Public Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Public Declare Function SetWindowsHookEx Lib "user32" Alias "SetWindowsHookExA" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hmod As Long, ByVal dwThreadId As Long) As Long
Public Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Long, ByVal nCode As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Long) As Long
'Wave Out
Private Declare Function waveOutOpen Lib "winmm.dll" (hWaveOut As Long, ByVal uDeviceID As Long, waveFmt As WAVEwaveFmt, ByVal dwCallback As Long, ByRef fPlaying As Boolean, ByVal dwFlags As Long) As Long
Private Declare Function waveOutPrepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutReset Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveOutUnprepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutClose Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveOutGetErrorText Lib "winmm.dll" Alias "waveInGetErrorTextA" (ByVal err As Long, ByVal lpText As String, ByVal uSize As Long) As Long
Private Declare Function waveOutWrite Lib "winmm.dll" (ByVal hWaveOut As Long, lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
'== Global Memory Functions ==================================================
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long

Private Declare Sub CopyPTRtoBYTES Lib "Kernel32.dll" Alias "RtlMoveMemory" (ByRef ByteDest As Byte, ByVal PtrSrc As Long, ByVal length As Long)
Private Declare Sub CopyBYTEStoPTR Lib "Kernel32.dll" Alias "RtlMoveMemory" (ByVal PtrDest As Long, ByRef ByteSrc As Byte, ByVal length As Long)

Public Const HC_ACTION = 0
Public Const WM_KEYDOWN = &H100
Public Const WM_KEYUP = &H101
Public Const WM_SYSKEYDOWN = &H104
Public Const WM_SYSKEYUP = &H105
Public Const VK_TAB = &H9
Public Const VK_CONTROL = &H11
Public Const VK_ESCAPE = &H1B

Public Const WH_KEYBOARD_LL = 13
Public Const LLKHF_ALTDOWN = &H20



Dim p As KBDLLHOOKSTRUCT
'Constants
Private Const CALLBACK_FUNCTION = &H20000
Private Const CALLBACK_WINDOW = &H10000      '  dwCallback is a HWND
Private Const MM_WIM_DATA = &H3C0
Private Const WAVE_MAPPER = -1&
Private Const WAVE_waveFmt_QUERY = &H1&
Private Const MAXEXTRABYTES = 3           ' Maximum (Extra Bytes + 1) In Non PCM Wave waveFmts...
Private Const WAVE_waveFmt_GSM610 = &H31
Private Const GMEM_MOVEABLE = &H2&
Private Const GMEM_SHARE = &H2000&
Private Const GMEM_ZEROINIT = &H40&
'MCI WaveHeader Bit Values In dwflags ==============================
Private Const WHDR_DONE = &H1&           '[00001][01] done bit
Private Const WHDR_PREPARED = &H2&       '[00010][02] set if this header has been prepared
Private Const WHDR_BEGINLOOP = &H4&      '[00100][04] loop start block
Private Const WHDR_ENDLOOP = &H8&        '[01000][08] loop end block
Private Const WHDR_INQUEUE = &H10&       '[10000][16] reserved for driver
Private Const MINSTREAM = 0
Private Const MAXSTREAM = 63

'Types And Structures
Private Type WAVEHDR
    lpData As Long              ' pointer to locked data buffer
    dwBufferLength As Long      ' length of data buffer
    dwBytesRecorded As Long     ' used for input only
    dwUser As Long              ' for client's use
    dwFlags As Long             ' assorted flags (see defines)
    dwLoops As Long             ' loop control counter
    wavehdr_tag As Long         ' reserved for driver
    Reserved As Long            ' reserved for driver
    hData As Long               ' handle to locked data buffer
End Type
Private Type WAVEwaveFmt
   wwaveFmtTag As Integer
   nChannels As Integer
   nSamplesPerSec As Long
   nAvgBytesPerSec As Long
   nBlockAlign As Integer
   wBitsPerSample As Integer
   cbSize As Integer
   xBytes(MAXEXTRABYTES) As Byte ' (FACT CHUNCK)
End Type
Private Type WaveData                   ' [Wave Stream Segment]
    Data() As Byte                      ' Wave data byte array
    Lgth As Long
End Type
Private Type uArrayWaves                ' [Array of Wave Streams]
    stream(MINSTREAM To MAXSTREAM) As WaveData ' Wave Buffer Array...
End Type
Public Type KBDLLHOOKSTRUCT
    vkCode As Long
    scanCode As Long
    Flags As Long
    time As Long
    dwExtraInfo As Long
End Type
Type Point
    X As Integer
    Y As Integer
    XE As Integer 'End X-Position
    YE As Integer 'End Y-Position
End Type
'Mine Sweeper
Enum CellCase
    Value = 1 'Numbers (0 for Empty)
    mine = 2 'Mine Found
End Enum
Type MineCell
    Case As CellCase
    IsPressed As Boolean
    Position As Point 'Carry the X,Y position
    ValueInt As Integer 'The Value of the value inside the cell
End Type

'VVoice Chat Variables
Private VoiceChatFlag As Boolean
Private CurRecPos As Long
Private CurPlayPos As Long
Private PlayWaveBuffer As uArrayWaves
Public TextChatFlag As Boolean
Private ClientName As String, ServerName As String
Private VoiceChatTimer As Long
Private IsPlayingVoice As Boolean
Private waveFmt As WAVEwaveFmt
Private IsPlayError As String
Private hhkLowLevelKybd As Long
'White Board Variables
Private CurrentSize As Long, TerminalSize As Long
Private CurrentColor As Long, TerminalColor As Long
Private CurrentTool As Long
Private WhiteBoardFlag As Boolean
Private PrevPoint As Point
Private WBCode() As String
Private WBTimer As Long
'Games Variables and constants
Private XSize As Long    'Number of Rows in the Minesweeper
Private YSize As Long   'Number of Cols in the minesweeper
Private Mines As Integer    'Number of mines in the minesweeper
Private MSMap() As MineCell
Private MineSweeperFlag As Boolean
Private XTmp As Integer, YTmp As Integer 'Temperory random values
Private MeScore As Integer, ForignScore As Integer
Public MyRound As Boolean 'Public for this variable is set from the MouseDown event over the screen
''''''''''''''''''''''''''''''''' << Msg Boxes >> '''''''''''''''''''''''''''''''
Public Function ShowMsgbox(MsgBody As String, MsgIcon As Integer, MsgButtons As Integer, MsgTitle As String) As String
    Dim IRet As Integer
    IRet = MsgBox(MsgBody, MsgIcon + MsgButtons, MsgTitle)
    ShowMsgbox = "T" & IRet
End Function
'''''''''''''''''''''''''''''''' << Text Chat >> ''''''''''''''''''''''''''''''''
Public Function LogIntoTextChat(StrClientName As String, Optional StrServerName As String, Optional ChatType As Integer = 0) As String
     On Error GoTo Failed
    'ChatType points to the method of controlling and showing the Chat Window (Normal = 0/Matrix = 1)
    'Load Text Chat Window And Show It , Disable ALT+CTRL+DEL , ShowOnTop , Maximize The form
    'Resize Form And Text Box
     TextChatFlag = True
    'Hide All Found visible Rooms
     CloseAllRooms
    'Check Chat Types
    'Set The Form On Top
     SetWindowPos frm_main.hwnd, -1, 0, 0, frm_main.Width, frm_main.Height, Flags
     frm_main.Rooms(0).Top = 0: frm_main.Rooms(0).Left = 0
     If ChatType = 1 Then 'Matrix Chat
        With frm_main
           .Width = Screen.Width: .Height = Screen.Height 'Resize The Main Form to maximize state
           .Rooms(0).Width = .Width: .Rooms(0).Height = .Height 'Resize Chat Room
           .TxtBox(0).Width = .Rooms(0).Width 'Resize The Text Boxs
           .TxtBox(0).Height = .Rooms(0).Height - .TxtBox(1).Height - 250
           .TxtBox(1).Width = .Rooms(0).Width - 200
           .TxtBox(1).Left = (.Rooms(0).Width - .TxtBox(1).Width) / 2
           .TxtBox(1).Top = .Rooms(0).Height - .TxtBox(1).Height - 150
        End With
     Else 'Normal Mode
        With frm_main
           .Rooms(0).Width = 8655: .Rooms(0).Height = 4695 'Resize Chat Room
           .Width = .Rooms(0).Width + 20: .Height = .Rooms(0).Height + 20 'Resize The Form
           .Left = (Screen.Width - .Width) / 2: .Top = (Screen.Height - .Height) / 2 'Centrate the form
           .TxtBox(0).Width = 8625: .TxtBox(0).Height = 4185
           .TxtBox(1).Width = 8500: .TxtBox(1).Left = 60
           .TxtBox(1).Top = 4240
        End With
     End If
     frm_main.Rooms(0).Visible = True
     frm_main.Show
     frm_main.TxtBox(1).SetFocus
     If ChatType = 1 Then 'Matrix Chat
        'Fix The Chat Window
         DisbleWindowsTaskManger
        'Set The Hook To The System To Disable Windows Hot Keys
         hhkLowLevelKybd = SetWindowsHookEx(WH_KEYBOARD_LL, AddressOf LowLevelKeyboardProc, App.hInstance, 0)
     End If
    'Initialize Chat System
     ClientName = StrClientName
     ServerName = StrServerName
    'Initialize The Conversation
     frm_main.SetFocus
     frm_main.TxtBox(1).SetFocus
     AddText frm_main.TxtBox(0), "---<< Hnadle-X Pro V1.0 Text Chat Window! >>---"
    'Return True
     LogIntoTextChat = "T"
     Exit Function
Failed:
     LogIntoTextChat = "F" & err.Description
End Function
Public Function LogIntoWhiteBoard() As String
     On Error GoTo Failed
     Dim i As Integer 'Genral counter
    'Load WhiteBoard Window And Show It , Disable ALT+CTRL+DEL , ShowOnTop
    'Resize Form And White Board Componants
     WhiteBoardFlag = True
    'Set The Form On Top
     SetWindowPos frm_main.hwnd, -1, 0, 0, frm_main.Width, frm_main.Height, Flags
    'Initialize the componants positions
     With frm_main
        .Width = .Rooms(1).Width
        .Height = .Rooms(1).Height
        .Left = (Screen.Width - .Width) / 2
        .Top = (Screen.Height - .Height) / 2
        .WBScreen.DrawWidth = 3
        .Rooms(1).Top = 0: .Rooms(1).Left = 0
        .Show
        .Rooms(1).Visible = True
     End With
    'Fix The Chat Window
     DisbleWindowsTaskManger
    'Set The Hook To The System To Disable Windows Hot Keys
     hhkLowLevelKybd = SetWindowsHookEx(WH_KEYBOARD_LL, AddressOf LowLevelKeyboardProc, App.hInstance, 0)
     LoadWB
    'Set a timer in the system to pack the code each time
     WBTimer = Timer_start(AddressOf PackCode, 500)
    'Return True
     LogIntoWhiteBoard = "T"
     Exit Function
Failed:
     LogIntoWhiteBoard = "F" & err.Description
End Function
Public Function LogInMS(XData As Long, YData As Long, MapData As String) As String 'Mine Sweeper game
     On Error GoTo Failed
     Dim i As Integer, j As Integer 'General Counters
    'Clear The Mine Sweeper Screen
     frm_main.MSscreen.Cls
    'Initializations
     MeScore = 0
     frm_main.Score(0) = "0"
     ForignScore = 0
     frm_main.Score(1) = "0"
     XSize = XData
     YSize = YData
     ReDim MSMap(XSize - 1, YSize - 1)
     Dim TMPArray() As String, PX As Integer, PY As Integer
     TMPArray = Split(MapData, Separator_Char)
    'Set the Mines Positins
     Mines = 0
     For i = 0 To UBound(TMPArray) - 1
        PX = i Mod XSize
        PY = Int(i / XSize)
        MSMap(PX, PY).Case = TMPArray(i)
        If MSMap(PX, PY).Case = mine Then Mines = Mines + 1
     Next i
     MineSweeperFlag = True
     XTmp = frm_main.MSscreen.Width / XSize 'The Width of each cell
     YTmp = frm_main.MSscreen.Height / YSize 'The Height of each cell
    'Initialize the componants positions
     With frm_main
        .Width = .Rooms(2).Width + 30
        .Height = .Rooms(2).Height + 30
        .Left = (Screen.Width - .Width) / 2
        .Top = (Screen.Height - .Height) / 2
        .Rooms(2).Top = 0: .Rooms(2).Left = 0
        .Rooms(2).Visible = True
        .Show
     End With
     frm_main.bar(9) = "Number of rest mines is [" & Mines & "] mines" 'Set The Mines Number
     frm_main.MSscreen.Enabled = False 'Disable The Game Area , That the client will start first
    'Set The Form On Top
     'SetWindowPos frm_main.hwnd, -1, 0, 0, frm_main.Width, frm_main.Height, Flags
     LoadMS
    'Return True
     LogInMS = "T"
     Exit Function
Failed:
     LogInMS = "F" & err.Description
     Debug.Print err.Description
End Function
Public Function LogoutWhiteBoard() As String
    On Error Resume Next
    Dim i As Integer 'Genral counter
    WhiteBoardFlag = False
    Timer_stop WBTimer 'Stop the previuos registered timer
    UnhookWindowsHookEx hhkLowLevelKybd 'UnHook The Hot Keys
    EnableWindowsTaskManger 'Enable The Task manager
    hhkLowLevelKybd = 0
    With frm_main
        .Hide 'Hide the form
        .Width = 0: .Height = 0
        .WBScreen.Cls
    End With
    CloseAllRooms
End Function
Public Sub LogoutTextChat()
    UnhookWindowsHookEx hhkLowLevelKybd 'UnHook The Hot Keys
    EnableWindowsTaskManger
    hhkLowLevelKybd = 0
    frm_main.TxtBox(0) = ""
    frm_main.TxtBox(1) = ""
    CloseAllRooms
    frm_main.Hide
    ClientName = ""
    ServerName = ""
End Sub
Public Sub LogoutMS()
    MineSweeperFlag = False
    frm_main.MSscreen.Cls
    CloseAllRooms
    frm_main.Hide
End Sub
Public Function ProcessTextChatData(Data As String)
    If TextChatFlag = True Then
        AddText frm_main.TxtBox(0), "[" & ClientName & "] Says :" & vbCrLf & Data, 1
    End If
End Function
Public Sub ComposeTextChatData(Data As String)
   'Send The Data
    frm_main.send_data Chr$(68) & "T" & Data
   'Add The Data Into The Text Screen
    AddText frm_main.TxtBox(0), "[" & ServerName & "] Says :" & vbCrLf & Data, 1
    frm_main.TxtBox(1).SetFocus
End Sub
Public Function LowLevelKeyboardProc(ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Dim fEatKeystroke As Boolean
   If (nCode = HC_ACTION) Then
      If wParam = WM_KEYDOWN Or wParam = WM_SYSKEYDOWN Or wParam = WM_KEYUP Or wParam = WM_SYSKEYUP Then
         CopyMemory p, ByVal lParam, Len(p)
         fEatKeystroke = _
            ((p.vkCode = VK_TAB) And ((p.Flags And LLKHF_ALTDOWN) <> 0)) Or _
            ((p.vkCode = VK_ESCAPE) And ((p.Flags And LLKHF_ALTDOWN) <> 0)) Or _
            ((p.vkCode = VK_ESCAPE) And ((GetKeyState(VK_CONTROL) And &H8000) <> 0))
        End If
    End If
    If fEatKeystroke Then
        LowLevelKeyboardProc = -1
    Else
        LowLevelKeyboardProc = CallNextHookEx(0, nCode, wParam, ByVal lParam)
    End If
End Function
'''''''''''''''''''''''''''''''''''' << Voice Chat >> '''''''''''''''''''''''''''''''''
Private Sub DataStream()
    'Check If There is any new data to play
     If (CurRecPos <> CurPlayPos) And Not IsPlayingVoice Then
        PlayQueue
     End If
End Sub
Public Function LoginVoiceChat() As String
    'Logout from previuos Voice chats
     LogoutVoiceChat
    'Test Wave Device
     Dim hWaveOut As Long
     Dim rc As Long
     Dim waveFmt As WAVEwaveFmt
     InitWavewaveFmt waveFmt 'Initial The Wave waveFmt
     rc = waveOutOpen(hWaveOut, WAVE_MAPPER, waveFmt, 0&, 0&, 0&)
     If rc <> 0 Then
        LoginVoiceChat = "F"
        Exit Function
     End If
     rc = waveOutClose(hWaveOut)
     If rc <> 0 Then
         LoginVoiceChat = "F"
         Exit Function
     End If
    'Wave Device Is Ready To Accept And Play Data From My Application
     IsPlayError = "T" 'Set No Error In Playing
    'Set The Timer
     VoiceChatTimer = Timer_start(AddressOf DataStream, 2000)
     LoginVoiceChat = "T" 'True resturn value
End Function
Public Sub LogoutVoiceChat()
    If VoiceChatTimer Then Timer_stop VoiceChatTimer
    VoiceChatTimer = 0
End Sub
Public Function ProcessVoiceData(Data As String) As String
    Dim ByteData() As Byte
    Dim lngCount As Long
    ByteData = StrConv(Data, vbFromUnicode)
    lngCount = UBound(ByteData) + 1
    WaveStream lngCount, ByteData
    ProcessVoiceData = IsPlayError
End Function
Private Sub WaveStream(length As Long, Bytes() As Byte)
  ReDim PlayWaveBuffer.stream(CurRecPos).Data(length - 1) As Byte
  PlayWaveBuffer.stream(CurRecPos).Lgth = length
  PlayWaveBuffer.stream(CurRecPos).Data = Bytes
  CurRecPos = (CurRecPos + 1) Mod 64 'Warped Around
End Sub
Private Sub PlayQueue()
   Dim i As Integer
   IsPlayingVoice = True 'Start Collecting Comming Data While Playing Current Data
   Do Until (CurRecPos = CurPlayPos)
      play PlayWaveBuffer.stream(CurPlayPos).Data, PlayWaveBuffer.stream(CurPlayPos).Lgth
      CurPlayPos = (CurPlayPos + 1) Mod 64
   Loop
   IsPlayingVoice = False 'Normal Mode
End Sub
Private Sub play(Data() As Byte, BUFFER_SIZE As Long)
    On Error GoTo Failed
   'This Function Opens The Wave-In Device,Play Data Passed Into Data() Array Then Closes The Wave-Out Device
    Dim rc As Long                                      ' Function Return Code
    Dim waveFmt As WAVEwaveFmt                          ' Wave format type
    Dim hWaveOut As Long                                ' Handle To A Wave Output Device
    Dim WaveOutHdr As WAVEHDR                           ' Handle To A Wave Output Device Header
    Call InitWavewaveFmt(waveFmt)
    rc = waveOutOpen(hWaveOut, WAVE_MAPPER, waveFmt, 0&, 0&, 0&)
    Call InitWaveHDR(WaveOutHdr, BUFFER_SIZE)
    rc = waveOutPrepareHeader(hWaveOut, WaveOutHdr, Len(WaveOutHdr)) ' Validate Return Code
    Call CopyBYTEStoPTR(WaveOutHdr.lpData, Data(0), WaveOutHdr.dwBufferLength)
    Call WaitForCallBack(WaveOutHdr.dwFlags, WHDR_PREPARED)
    rc = waveOutWrite(hWaveOut, WaveOutHdr, Len(WaveOutHdr))
    Call WaitForCallBack(WaveOutHdr.dwFlags, WHDR_DONE)
    rc = waveOutUnprepareHeader(hWaveOut, WaveOutHdr, Len(WaveOutHdr))
    rc = waveOutClose(hWaveOut)
    rc = FreeWaveHDR(WaveOutHdr)                        ' Free Wave Header Data\
    Exit Sub
Failed:
    IsPlayError = "F" 'Error Occur In Playing Data Stream
End Sub
Private Sub InitWaveHDR(WaveHeader As WAVEHDR, buffer_length As Long)
' Initialize's An Input Wave Header's DataBuffer And Size Members...
    Dim rc As Long                                      ' Function Return Code...
    WaveHeader.hData = GlobalAlloc(GMEM_MOVEABLE Or GMEM_ZEROINIT Or GMEM_SHARE, buffer_length)  ' Allocate Global Memory
    WaveHeader.lpData = GlobalLock(WaveHeader.hData)    ' Lock Memory handle
    WaveHeader.dwBufferLength = buffer_length                ' Get Wave Buffer Size
    WaveHeader.dwFlags = 0                              ' Must Be Set To 0 For (waveOutPrepareHeader & waveInPrepareHeader)
End Sub
Private Sub WaitForCallBack(CallBackBit As Long, cbFlag As Long)
' Waits For Asynchronous Function Callback Bit To Be Set.
    Do Until (((CallBackBit And cbFlag) = cbFlag) Or _
               (CallBackBit = WHDR_PREPARED) Or _
               (CallBackBit = 0))       ' Check For (CallBack Bit Or Null)...
        DoEvents                        ' Post Events...
    Loop
End Sub
Private Function FreeWaveHDR(WaveHeader As WAVEHDR) As Boolean
    Dim rc As Long                                      ' Function return code
    rc = GlobalUnlock(WaveHeader.lpData)                ' Unlock Global Memory
    rc = GlobalFree(WaveHeader.hData)                   ' Free Global Memory
    FreeWaveHDR = True                                  ' Set Default Return Code
End Function
Private Sub InitWavewaveFmt(format As WAVEwaveFmt)
        format.wwaveFmtTag = &H1                ' waveFmt type
        format.nChannels = 1                ' number of channels (i.e. mono, stereo, etc.)
        format.nSamplesPerSec = 8000                    ' sample rate 8.0 kHz
        format.nAvgBytesPerSec = format.nSamplesPerSec    ' for buffer estimation
        format.wBitsPerSample = 8                          ' [8, 16, or 0]
        format.nBlockAlign = format.nChannels * format.wBitsPerSample / 8 '  block size of data
        format.cbSize = 0
End Sub
''''''''''''''''''''''''''''''''' << White Board >> '''''''''''''''''''''''''''''''''
Public Sub LoadWB()
   'Initializations
    CurrentTool = 1
    CurrentSize = 1
    TerminalSize = 1
    TerminalColor = vbBlack
    frm_main.WBScreen.DrawWidth = 3
    frm_main.WBScreen.ForeColor = vbBlack
    frm_main.WBScreen.Cls
    frm_main.WBSelectColor.BackColor = vbBlack
    frm_main.WhiteBoardButtons(1).BorderStyle = 1
    CurrentColor = vbBlack
    ReDim Preserve WBCode(0)
End Sub
Public Sub WhiteBoardButtonsClick(Index As Integer)
    Select Case Index
           Case 0  'New Area
                frm_main.WBScreen.Cls
                InsertCode 0
           Case 1  'Pin Tool
                CurrentTool = 1
           Case 2  'Line Tool
                CurrentTool = 2
           Case 3  'Spray Tool
                CurrentTool = 3
           Case 4  'Sizes
                'Clear The Menus Checks
                 ClearWBsizesMenu
                'Select The Current Size And Disable It
                 frm_main.WBSize(CurrentSize).Checked = True
                 frm_main.WBSize(CurrentSize).Enabled = False
                'Show The Menu
                 frm_main.PopupMenu frm_main.WBSizes, , frm_main.WhiteBoardButtons(Index).Left, frm_main.WhiteBoardButtons(Index).Top + frm_main.WhiteBoardButtons(Index).Height
           Case 5 To frm_main.WBSize.UBound + 5 'Sizes
                CurrentSize = Index - 5
                frm_main.WBScreen.DrawWidth = CurrentSize * 3
                InsertCode 4 & CurrentSize
           Case Else 'Colors (- frm_main.WBSize.UBound + 5)
                Select Case (Index - frm_main.WBSize.UBound - 6)
                       Case 0 'White
                            CurrentColor = &HFFFFFF
                       Case 1 'White Yellow
                            CurrentColor = &HC0FFFF
                       Case 2 'Dark Yelloo
                            CurrentColor = &HFFFF&
                       Case 3 'Orange
                            CurrentColor = &H80FF&
                       Case 4 'White Green
                            CurrentColor = &H80FF80
                       Case 5 'Dark Green
                            CurrentColor = &HFF00&
                       Case 6 'WhiteBlue
                            CurrentColor = &HFFFF00
                       Case 7 'DarkBlue
                            CurrentColor = &HFF0000
                       Case 8 'White Red
                            CurrentColor = &H8080FF
                       Case 9 'Dark Red
                            CurrentColor = &HFF&
                       Case 10 'Brown
                            CurrentColor = &H4080&
                       Case 11 'Black
                            CurrentColor = &H0&
                End Select
                frm_main.WBScreen.ForeColor = CurrentColor
                frm_main.WBSelectColor.BackColor = CurrentColor
                InsertCode 3 & Char_Representation(CurrentColor)
    End Select
End Sub
Public Sub WhiteBoardSRDown(X As Integer, Y As Integer)
    'The White Board Screen Left-Mouse Down Event
     Dim Temp As String
     With frm_main.WBScreen
        Select Case CurrentTool
               Case 1 'Free Line
                    PrevPoint.X = X: PrevPoint.Y = Y
                    frm_main.WBScreen.PSet (X, Y)
                    InsertCode 5 & IntToChar(X) & IntToChar(Y)
               Case 2 'Solid Line
                    frm_main.WBline.X1 = X
                    frm_main.WBline.Y1 = Y
                    frm_main.WBline.X2 = X
                    frm_main.WBline.Y2 = Y
                    frm_main.WBline.BorderWidth = frm_main.WBScreen.DrawWidth
                    frm_main.WBline.BorderColor = CurrentColor
                    frm_main.WBline.Visible = True
               Case 3 'Spray
                    SprayAt X, Y, CurrentSize
                   'Code Insertion
                    Temp = 2 & IntToChar(X) & IntToChar(Y)
                    If Len(Temp) = 5 Then InsertCode Temp
        End Select
     End With
End Sub
Public Sub WhiteBoardSRMove(X As Integer, Y As Integer)
    'The White Board Screen Mouse Move Event
     Dim Temp As String
     If X < 0 Then X = 0
     If Y < 0 Then Y = 0
     With frm_main.WBScreen
        Select Case CurrentTool
               Case 1 'Free Line
                    LineTo X, Y
                    PrevPoint.X = X: PrevPoint.Y = Y
               Case 2 'Solid Line
                    frm_main.WBline.X2 = X
                    frm_main.WBline.Y2 = Y
               Case 3 'Spray
                    SprayAt X, Y, CurrentSize
                   'Code Insertion
                    Temp = 2 & IntToChar(X) & IntToChar(Y)
                    If Len(Temp) = 5 Then InsertCode Temp
        End Select
     End With
End Sub
Public Sub WhiteBoardSRUP(X As Integer, Y As Integer)
    'The White Board Screen Left-Mouse UP Event
     With frm_main.WBScreen
        Select Case CurrentTool
               Case 1 'Free Line

               Case 2 'Solid Line
                    frm_main.WBline.Visible = False
                    PrevPoint.X = frm_main.WBline.X1
                    PrevPoint.Y = frm_main.WBline.Y1
                    LineTo frm_main.WBline.X2, frm_main.WBline.Y2
               Case 3 'Spray

        End Select
     End With
End Sub
Private Sub ClearWBsizesMenu()
    Dim i As Integer
    For i = 1 To frm_main.WBSize.UBound
        frm_main.WBSize(i).Checked = False
        frm_main.WBSize(i).Enabled = True
    Next i
End Sub
'Functions of drowing of the white board
Private Sub LineTo(X As Integer, Y As Integer)
    'Drow The Line form The previuos Point to the Passed Point
     Dim Temp As String
     frm_main.WBScreen.Line (PrevPoint.X, PrevPoint.Y)-(X, Y)
     Temp = 1 & IntToChar(PrevPoint.X) & IntToChar(PrevPoint.Y) & IntToChar(X) & IntToChar(Y)
     If Len(Temp) = 9 Then InsertCode Temp
End Sub
Private Sub SprayAt(X As Integer, Y As Integer, TSize As Long)
    'Make a spray at the pased point
     Dim i As Integer 'General counter
     Dim TmpSize As Integer, Size As Integer
     Dim NewPoint As Point, Temp As String
     TmpSize = TSize
     frm_main.WBScreen.DrawWidth = 1
     Size = (TSize * 50)
     For i = 0 To (Size)
        NewPoint.X = GET_RANDOM(X - Size, X + Size)
        NewPoint.Y = GET_RANDOM(Y - Size, Y + Size)
        If TestDistance(X, Y, NewPoint.X, NewPoint.Y, Size / (2 ^ 0.5)) = True Then
            frm_main.WBScreen.PSet (NewPoint.X, NewPoint.Y)
        End If
     Next
     frm_main.WBScreen.Refresh
     frm_main.WBScreen.DrawWidth = TmpSize * 3
End Sub
Private Function TestDistance(X1 As Integer, Y1 As Integer, X2 As Integer, Y2 As Integer, Dest As Integer) As Boolean
    'Test if the distance be ok or not
     If (((X1 - X2) ^ 2) + ((Y1 - Y2) ^ 2)) ^ 0.5 <= Dest Then
        TestDistance = True
     End If
End Function
Private Function GET_RANDOM(i, j) As Integer   'I IS MINIMUM VALUE AND J IS THE MAX VALUE
     GET_RANDOM = Int((j - i + 1) * Rnd + i)
End Function
Private Function IntToChar(Amount As Integer) As String
    On Error Resume Next
    IntToChar = Chr$(Int(Amount / 255)) & Chr$(Amount Mod 255)
End Function
Private Function CharToInt(Amount As String) As Integer
    CharToInt = (Asc(Left$(Amount, 1)) * 255) + Asc(Right$(Amount, 1))
End Function
Private Sub InsertCode(Code As String)
    On Error Resume Next
    Dim Package As String
    ReDim Preserve WBCode(UBound(WBCode) + 1)
    WBCode(UBound(WBCode)) = Code
End Sub
Private Function PackCode()
    If UBound(WBCode) > 0 Then
        'Start Pack The Codes and send it to the other side
         Dim i As Integer
         For i = 0 To UBound(WBCode)
            Package = Package & WBCode(i) & Separator_Char
         Next
         If WhiteBoardFlag = True Then
            frm_main.send_data (Chr$(80) & Package)
         Else
            WhiteBoardFlag = False
         End If
         ReDim WBCode(0)
    End If
End Function
Public Sub ParseWBCode(Package As String)
    Dim Codes() As String, i As Integer
    Codes = Split(Package, Separator_Char)
    frm_main.WBScreen.ForeColor = TerminalColor
    frm_main.WBScreen.DrawWidth = TerminalSize * 3
    For i = 0 To UBound(Codes) - 1
        Select Case Left$(Codes(i), 1)
               Case 0 'Clear Screen
                    frm_main.WBScreen.Cls
               Case 1 'Lines
                    frm_main.WBScreen.Line (CharToInt(Mid$(Codes(i), 2, 2)), CharToInt(Mid$(Codes(i), 4, 2)))-(CharToInt(Mid$(Codes(i), 6, 2)), CharToInt(Mid$(Codes(i), 8, 2)))
               Case 2 'Spray
                    SprayAt CharToInt(Mid$(Codes(i), 2, 2)), CharToInt(Mid$(Codes(i), 4, 2)), TerminalSize
               Case 3 'ColorCode
                    TerminalColor = Long_Representation(Mid$(Codes(i), 2))
                    frm_main.WBScreen.ForeColor = TerminalColor
               Case 4 'Sizes
                    TerminalSize = Mid$(Codes(i), 2)
                    frm_main.WBScreen.DrawWidth = TerminalSize * 3
               Case 5 'Point
                    frm_main.WBScreen.PSet (CharToInt(Mid$(Codes(i), 2, 2)), CharToInt(Mid$(Codes(i), 4, 2)))
        End Select
    Next i
   'Retrive Current Values
    frm_main.WBScreen.ForeColor = CurrentColor
    frm_main.WBScreen.DrawWidth = CurrentSize * 3
End Sub
Private Sub CloseAllRooms()
     Dim i As Integer 'General counter
     For i = 0 To frm_main.Rooms.UBound
        frm_main.Rooms(i).Visible = False
     Next i
End Sub
''''''''''''''''''''''''''''''''''<< Games >>''''''''''''''''''''''''''''''''
'Mine Sweeeper
Private Sub LoadMS()
    'Drow The Map In The Memory (Build The MSMap)
    'Set The Positions of the cells
     On Error Resume Next
     Dim i As Integer, j As Integer
     For i = 0 To frm_main.MSscreen.Width Step XTmp
        For j = 0 To frm_main.MSscreen.Height Step YTmp
            With MSMap(i / XTmp, j / YTmp)
                .Position.X = i
                .Position.Y = j
                .Position.XE = i + XTmp
                .Position.YE = j + YTmp
            End With
            Debug.Print i & " , " & j
        Next j
     Next i
    'Set The Cells Values
     For i = 0 To XSize
        For j = 0 To YSize
            If MSMap(i, j).Case <> mine Then
               'Set Value Flag
                MSMap(i, j).Case = Value
               'Set The Values
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i - 1, j - 1).Case = mine))
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i - 1, j).Case = mine))
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i - 1, j + 1).Case = mine))
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i, j - 1).Case = mine))
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i, j + 1).Case = mine))
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i + 1, j - 1).Case = mine))
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i + 1, j).Case = mine))
                MSMap(i, j).ValueInt = MSMap(i, j).ValueInt + Abs(Int(MSMap(i + 1, j + 1).Case = mine))
            End If
        Next j
     Next i
    'Drow The Mine Map At The screen
     For i = 0 To frm_main.MSscreen.Width Step XTmp
        frm_main.MSscreen.Line (i, 0)-(i, frm_main.MSscreen.Height)
     Next i
     For j = 0 To frm_main.MSscreen.Height Step YTmp
        frm_main.MSscreen.Line (0, j)-(frm_main.MSscreen.Width, j)
     Next j
End Sub
Public Sub MsScreenDown(X As Integer, Y As Integer)
    On Error Resume Next
   'Check Playing Allowed
    Dim PX As Integer, PY As Integer
    PX = Int(X / XTmp)
    PY = Int(Y / YTmp)
    If PX < 0 Then Exit Sub
    If PY < 0 Then Exit Sub
   'Check Already Activated
    If MSMap(PX, PY).IsPressed = True Then
        Beep
        Exit Sub
    End If
    If MyRound Then frm_main.MSscreen.Enabled = False
   'Send The Cell ID to other side
    Dim CellID As Integer
    CellID = (PY * XSize) + PX
    If MyRound = True Then frm_main.send_data (Chr$(84) & "T" & CellID)
    If MSMap(PX, PY).Case = mine Then 'Mine Found
        MSMap(PX, PY).IsPressed = True
       'Register the score And Check winning
        If MyRound Then
            MeScore = MeScore + 1
            frm_main.Score(0) = MeScore
        Else
            ForignScore = ForignScore + 1
            frm_main.Score(1) = ForignScore
        End If
       'Show the mine symbol
        ShowCell MSMap(PX, PY)
        If (MeScore + ForignScore) >= Mines Then 'The Game is over
            Select Case (MeScore - ForignScore)
                   Case Is > 0
                        ShowResult 1 'Win Case
                   Case Is < 0
                        ShowResult 2 'Lose Case
                   Case 0
                        ShowResult 0 'Drown Case
            End Select
        ElseIf MeScore > (ForignScore + (Mines - MeScore - ForignScore)) Then
            ShowResult 1
        ElseIf ForignScore > (MeScore + (Mines - MeScore - ForignScore)) Then
            ShowResult 2
        Else 'Check Round Limited Code (This means that each one has a round in the game ,it cann't play twice else he got a mine!
            If MyRound Then
                frm_main.MSscreen.Enabled = True
            Else
                frm_main.MSscreen.Enabled = False
            End If
        End If
    Else
        MSMap(PX, PY).IsPressed = True 'Value Found
        ShowCell MSMap(PX, PY) 'Show The Cell
        If MSMap(PX, PY).ValueInt = 0 Then 'Check Empty
            MsScreenDown X - XTmp, Y - YTmp
            MsScreenDown X - XTmp, Y
            MsScreenDown X - XTmp, Y + YTmp
            MsScreenDown X, Y - YTmp
            MsScreenDown X, Y + YTmp
            MsScreenDown X + XTmp, Y - YTmp
            MsScreenDown X + XTmp, Y
            MsScreenDown X + XTmp, Y + YTmp
        End If
    End If
End Sub
Public Sub MsScreenMove(X As Integer, Y As Integer)
     On Error Resume Next
     Dim PX As Integer, PY As Integer
    'Drow The Lines
     For i = 0 To (frm_main.MSscreen.Width) Step XTmp
        frm_main.MSscreen.Line (i, 0)-(i, frm_main.MSscreen.Height)
     Next i
     For j = 0 To (frm_main.MSscreen.Height) Step YTmp
        frm_main.MSscreen.Line (0, j)-(frm_main.MSscreen.Width, j)
     Next j
    'Select The Cell
     PX = Int(X / XTmp)
     PY = Int(Y / YTmp)
     SelCell MSMap(PX, PY), &HE9CAAD
End Sub
Private Sub ShowAll()
     Dim i As Integer, j As Integer 'General Counters
     For i = 0 To XSize
        For j = 0 To YSize
            'If MSMap(i, j).Case = mine Then
                ShowCell MSMap(i, j)
            'End If
        Next j
     Next i
End Sub
Private Sub ShowCell(Cell As MineCell)
     On Error Resume Next
     Dim i As Integer, j As Integer 'General Counters
     Dim W As Integer, H As Integer, TmpColor As Long
     Select Case Cell.Case
            Case Value
                If Cell.ValueInt > 0 Then '1 , 2, 3, 4, ... [Value more than One]
                    W = frm_main.MSscreen.TextWidth(Cell.ValueInt)
                    H = frm_main.MSscreen.TextHeight(Cell.ValueInt)
                    With frm_main.MSscreen
                         TmpColor = .ForeColor
                        .ForeColor = vbBlack
                        .CurrentX = ((XTmp - W) / 2) + Cell.Position.X - 40
                        .CurrentY = ((YTmp - H) / 2) + Cell.Position.Y
                         frm_main.MSscreen.Print Cell.ValueInt
                        .ForeColor = TmpColor
                    End With
                Else 'Zero Place
                   'Drow An Empty Place
                    W = frm_main.MSscreen.TextWidth("")
                    H = frm_main.MSscreen.TextHeight("")
                    With frm_main.MSscreen
                         TmpColor = .ForeColor
                        .ForeColor = vbBlack
                        .CurrentX = ((Cell.Position.XE - Cell.Position.X) / 2) + Cell.Position.X
                        .CurrentY = ((Cell.Position.YE - Cell.Position.Y) / 2) + Cell.Position.Y
                         frm_main.MSscreen.PSet (.CurrentX, .CurrentY)
                        .ForeColor = TmpColor
                    End With
                   'Show The Around Empty Places
                End If
            Case mine
               'First Show the number of rest of the mines
                frm_main.bar(9) = "Number of rest mines is [" & (Mines - (MeScore + ForignScore)) & "] mines"
                W = frm_main.MSscreen.TextWidth("M")
                H = frm_main.MSscreen.TextHeight("M")
                With frm_main.MSscreen
                     TmpColor = .ForeColor
                    .ForeColor = vbRed
                    .CurrentX = ((XTmp - W) / 2) + Cell.Position.X
                    .CurrentY = ((YTmp - H) / 2) + Cell.Position.Y
                     frm_main.MSscreen.Print "M"
                    .ForeColor = TmpColor
                End With
     End Select
End Sub
Private Sub SelCell(Cell As MineCell, CColor As Long)
     On Error Resume Next
     Dim TmpColor As Long
     TmpColor = frm_main.MSscreen.ForeColor
     frm_main.MSscreen.ForeColor = CColor
     frm_main.MSscreen.Line (Cell.Position.X, Cell.Position.Y)-(Cell.Position.XE, Cell.Position.YE), , B
     frm_main.MSscreen.ForeColor = TmpColor
End Sub
Public Sub OtherSideShot(Cell As Integer)
   'Cell is the ID of the cell which Other side Clicked There
   'Check Game Activated
    If MineSweeperFlag = False Then Exit Sub
    MyRound = False 'This is not my round for playing
    frm_main.MSscreen.Enabled = True
    Dim PX As Integer, PY As Integer
        PX = Cell Mod XSize
        PY = Int(Cell / XSize)
    MsScreenMove PX * XTmp, PY * YTmp
    SelCell MSMap(PX, PY), vbRed
    MsScreenDown PX * XTmp, PY * YTmp
End Sub
Private Sub ShowResult(Result As Integer)
    'This code responsable for proceesing win and loss cases
    'Result = true if I Won , False For I Lost
     Beep
     If Result = 1 Then
        'Win
         MsgBox "Congratulations!,Vectories", vbInformation, "Game Over!"
     ElseIf Result = 2 Then
        'Lose
         MsgBox "Opps!,Losser!,Good Luck Next Time", vbExclamation, "Game Over!"
     Else 'Drow case
         MsgBox "No One Wins! ,Good luck next time ;)", vbInformation, "Game Over!"
     End If
End Sub
