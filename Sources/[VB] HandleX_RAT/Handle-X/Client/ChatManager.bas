Attribute VB_Name = "ChatManager"
'Declerations
'WaveIN API'S
Declare Function waveInOpen Lib "winmm.dll" (lphWaveIn As Long, ByVal uDeviceID As Long, lpFormat As WAVEFORMAT, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
Declare Function waveInPrepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Declare Function waveInReset Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Declare Function waveInStart Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Declare Function waveInStop Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Declare Function waveInUnprepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Declare Function waveInClose Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Declare Function waveInGetErrorText Lib "winmm.dll" Alias "waveInGetErrorTextA" (ByVal err As Long, ByVal lpText As String, ByVal uSize As Long) As Long
Declare Function waveInAddBuffer Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
'Memory Managment API's
Declare Sub CopyPTRtoBYTES Lib "Kernel32.dll" Alias "RtlMoveMemory" (ByRef ByteDest As Byte, ByVal PtrSrc As Long, ByVal length As Long)
Declare Sub CopyBYTEStoPTR Lib "Kernel32.dll" Alias "RtlMoveMemory" (ByVal PtrDest As Long, ByRef ByteSrc As Byte, ByVal length As Long)
Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long

'Constants
Public Const CALLBACK_FUNCTION = &H30000
Public Const CALLBACK_WINDOW = &H10000      '  dwCallback is a HWND
Public Const MM_WIM_DATA = &H3C0
Public Const WHDR_DONE = &H1         '  done bit
Public Const GMEM_FIXED = &H0         ' Global Memory Flag used by GlobalAlloc functin
Public Const WAVE_MAPPER = -1&
Public Const WAVE_FORMAT_QUERY = &H1&
Public Const MAXEXTRABYTES = 3          ' Maximum (Extra Bytes + 1) In Non PCM Wave Formats...
Public Const WAVE_FORMAT_GSM610 = &H31
Public Const GMEM_MOVEABLE = &H2&
Public Const GMEM_SHARE = &H2000&
Public Const GMEM_ZEROINIT = &H40&

'Types And Structure
Type WAVEHDR
   lpData As Long
   dwBufferLength As Long
   dwBytesRecorded As Long
   dwUser As Long
   dwFlags As Long
   dwLoops As Long
   lpNext As Long
   Reserved As Long
   hpData As Long
End Type
Type WAVEFORMAT
   wFormatTag As Integer
   nChannels As Integer
   nSamplesPerSec As Long
   nAvgBytesPerSec As Long
   nBlockAlign As Integer
   wBitsPerSample As Integer
   cbSize As Integer
   xBytes(MAXEXTRABYTES) As Byte ' (FACT CHUNCK)
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

'MsgBOX Variables
Private MsgString As String
Private CurrentIcon As Integer, CurrentIconStr As Integer
Private CurrentButtonSystem As Integer, CurrentButtonSystemStr As Integer
'Text Chat Variables & Constants
Private Const TextChatSparator = vbNullChar
Private TextChatFlag As Boolean, VoiceChatFlag As Boolean
Private Client_ID As String, Server_ID As String
'VoiceChat Variables And Psudo Constants
Private i As Integer, J As Integer, rc As Long, Msg As String * 200, hWaveIn As Long, hWaveOut As Long
Private Const NUM_BUFFERS = 2
Private Format As WAVEFORMAT, hMem(NUM_BUFFERS) As Long, inHdr(NUM_BUFFERS) As WAVEHDR
Private Const DEVICEID = 0
Private Wavedata(MAX_BUFFER_SIZE - 1) As Byte
Private fRecording As Boolean
Private Wave_InExist As Boolean
'White Board Variables
Private CurrentSize As Long, TerminalSize As Long
Private CurrentColor As Long, TerminalColor As Long
Private CurrentTool As Long
Private WhiteBoardFlag As Boolean
Private PrevPoint As Point
Private WBCode() As String
'Games Variables and constants
Private Const XSize = 19  'Number of Rows in the Minesweeper
Private Const YSize = 11  'Number of Cols in the minesweeper
Private Mines As Integer    'Number of mines in the minesweeper
Private MSMap() As MineCell
Private MineSweeperFlag As Boolean
Private XTmp As Integer, YTmp As Integer 'Temperory random values
Private MeScore As Integer
Private ForignScore As Integer
Public MyRound As Boolean
'This Module Is Include The Code of the System-GUI Control Code
Public Function Load_Chat_Manager()
    On Error Resume Next
    Dim i As Integer 'General Counter
    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Initializing..."
    For i = 0 To Frm_Main.ChatRoom.ubound
        With Frm_Main.ChatRoom(i)
            .Top = 500
            .Left = 20
            .Height = 4400
            .Width = 8600
            Frm_Main.ChatRoom(i).Visible = False
        End With
    Next i
   'Load WhiteBoard Buttons
    For i = 0 To Frm_Main.WhiteBoardButtons.ubound
        Frm_Main.WhiteBoardButtons(i).Picture = Frm_Main.WhiteBoardImages.ListImages(i + 1).Picture
    Next i
    Mines = 45 'Number Of Mines in the Mine sweeper Board
    LoadWB 'Load The White Board
   'Load Msgbox Room companants
    CurrentIcon = 1
    CurrentButtonSystem = 1
    Frm_Main.MsgIcon.Picture = Frm_Main.MsgBoxIcons.ListImages(CurrentIcon).Picture
    Frm_Main.ChatRoom(0).Visible = True 'Msgbox Room
   'Load Text Chat Room
    Frm_Main.ChatType(0).Value = True
    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
End Function
Public Sub ChatManagerButtons(Index As Integer)
On Error Resume Next
    Select Case Index
           Case 0 'Test Message
                MsgBox Frm_Main.WindowsControl(3), CurrentIconStr + CurrentButtonSystemStr, Frm_Main.WindowsControl(4)
           Case 1 'Send Message
                'Prepare The MsgBox String
                MsgString = Frm_Main.WindowsControl(3) & Chr$(0) & CurrentIconStr & Chr$(0) & CurrentButtonSystemStr & Chr$(0) & Frm_Main.WindowsControl(4)
                Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>" & "Sending Massege Box Information ..."
                If Frm_Main.Send_Data(Chr$(65) & MsgString) = False Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
                End If
           Case 2 '1st Button
           
           Case 3 '2nd Buuton
           
           Case 4 '3rd Button
                'MsgIcon , MsgBoxIcons
                
           Case 5 'Left Buttons
                CurrentButtonSystem = CurrentButtonSystem - 1
                If SetButtonsSystem(CurrentButtonSystem) = False Then
                    CurrentButtonSystem = CurrentButtonSystem + 1
                End If
           Case 6 'Right Buttons
                CurrentButtonSystem = CurrentButtonSystem + 1
                If SetButtonsSystem(CurrentButtonSystem) = False Then
                    CurrentButtonSystem = CurrentButtonSystem - 1
                End If
           Case 7 'Left Image
                CurrentIcon = CurrentIcon - 1
                Frm_Main.MsgIcon.Picture = Frm_Main.MsgBoxIcons.ListImages(CurrentIcon).Picture
                SetIcon (CurrentIcon)
                If CurrentIcon < 1 Then CurrentIcon = 1
           Case 8 'Right Image
                CurrentIcon = CurrentIcon + 1
                Frm_Main.MsgIcon.Picture = Frm_Main.MsgBoxIcons.ListImages(CurrentIcon).Picture
                SetIcon (CurrentIcon)
                If CurrentIcon > 5 Then CurrentIcon = 5
           Case 9 'LogIn Text Chat
                If CheckAlreadyLoginIntoChatSystem = True Then
                    MsgBox "Cann't Log Into This Chat System While Other Chat Systems Already existed!", vbExclamation, AppName
                    Exit Sub
                End If
                Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Logging InTo Text Chat ..."
               'Initialize The Variables
                Client_ID = Frm_Main.txt_msg(1) 'Read The NikeNames
                Server_ID = Frm_Main.txt_msg(2)
               'Send Login Signal
                If Frm_Main.Send_Data(Chr$(67) & IIf(Frm_Main.ChatType(0).Value, 0, 1) & Client_ID & TextChatSparator & Server_ID) = False Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
                Else
                    TextChatFlag = True 'Set Chat Flag
                    Frm_Main.txt_msg(1).Enabled = False
                    Frm_Main.txt_msg(2).Enabled = False
                    Frm_Main.ChatButtons(9).Enabled = False
                End If
           Case 10 'LogOut From Text Chat
                Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Logging Out From Text Chat ..."
                If TextChatFlag = True Then
                    TextChatFlag = False 'UNSet Chat Flag
                    Frm_Main.txt_msg(3).Enabled = False
                    Frm_Main.txt_msg(3).BackColor = &HC0C0C0
                    Frm_Main.txt_msg(1).Enabled = True
                    Frm_Main.txt_msg(2).Enabled = True
                    Frm_Main.txt_msg(3) = ""
                    AddText Frm_Main.txt_msg(0), "//Text Chat Ends At : [" & Now & "]", 1
                    Frm_Main.ChatButtons(9).Enabled = True
                    If Frm_Main.Send_Data(Chr$(69)) = False Then
                        Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager:\>_"
                    End If
                Else
                    MsgBox "Still Not Connected To TextChat!", vbExclamation, AppName
                End If
                Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
           Case 11 'Copy All Conversation To X-Editor
                CopyConversation
           Case 12 'Login Into Voice Chat
                LogOutVoiceChat 'Logout from previus instants
                If CheckWaveInDevice = True Then
                    If Frm_Main.Send_Data(Chr$(71) & MsgString) = False Then
                        Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
                    End If
                Else
                    MsgBox "Error In Initializing Your Wave Device", vbExclamation, AppName
                End If
           Case 13 'Logout Out From Voice Chat
                Frm_Main.Send_Data (Chr$(73))
                LogOutVoiceChat 'Logout Voice Chat
           Case 14 'Login Spyer
                MsgBox "Not supported in this version", vbInformation, AppName
           Case 15 'Logout Spyer
                MsgBox "Not supported in this version", vbInformation, AppName
           Case 16 'Login into MineSweeper Game
                If CheckAlreadyLoginIntoChatSystem = True Then
                    MsgBox "Cann't Log Into This Chat System While Other Chat Systems Already existed!", vbExclamation, AppName
                    Exit Sub
                End If
               'Collect the mines positions data
                Dim MinesData As String, i As Integer, J As Integer
                LoadMS
                For J = 0 To YSize - 1
                    For i = 0 To XSize - 1
                        MinesData = MinesData & MSMap(i, J).Case & Separator_Char
                    Next i
                Next J
                If Frm_Main.Send_Data(Chr$(83) & "0" & Char_Representation(XSize) & Char_Representation(YSize) & MinesData) = True Then '[Game ID = 0 minesweepe] 'Mines is number of mines witch sended to server side
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Logging In MineSweeper..."
                End If
           Case 17 'Logout from Minesweeper Game
                Frm_Main.MSscreen.Enabled = False
                MineSweeperFlag = False
                Frm_Main.ChatButtons(16).Enabled = True 'Enable The Login button
                Frm_Main.MSscreen.Cls
                If Frm_Main.Send_Data(Chr$(85)) = True Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Logging Out From Mine Sweeper ..."
                End If
           Case 18 'Login White Board
                If CheckAlreadyLoginIntoChatSystem = True Then
                    MsgBox "Cann't Log Into This Chat System While Other Chat Systems Already existed!", vbExclamation, AppName
                    Exit Sub
                End If
               'Send Login Signal
                If Frm_Main.Send_Data(Chr$(79)) = True Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Logging InTo White Board ..."
                End If
           Case 19 'LogOut From White Board
                If Frm_Main.Send_Data(Chr$(81)) = True Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Logging Out From White Board ..."
                End If
    End Select
End Sub
Public Sub ChatManagerFunctions(Function_ID As Byte, Function_Data As String)
'File Browser Functions
'010xxxxx [B: 01000000 > 01011111][D: 192 > 223]
On Error Resume Next
Dim Done As String 'Done If True
Done = Left$(Function_Data, 1)
Function_Data = Mid$(Function_Data, 2)
    Select Case Function_ID
           Case 64 'Reserved
           
           Case 65 'Show Messagebox
                Dim SRet As String
                 Select Case Val(Function_Data)
                        Case vbOK: SRet = "[Ok]"
                        Case vbYes: SRet = "[Yes]"
                        Case vbNo:   SRet = "[No]"
                        Case vbCancel: SRet = "[Cancel]"
                        Case vbRetry: SRet = "[Retry]"
                        Case vbAbort: SRet = "[Abort]"
                        Case vbIgnore: SRet = "[Ignore]"
                        Case Else: SRet = "[UnKnown]"
                 End Select
                 MsgBox SRet & " Button Clicked There", vbInformation, "Msgbox Retrun Value"
                 If Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>" & "Sending Massege Box Information ..." Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
                 End If
           Case 66 'Reserved

           Case 67 'Login Text Chat
                    If Done = "T" Then
                        TextChatFlag = True
                        Frm_Main.txt_msg(3).Enabled = True
                        Frm_Main.txt_msg(3).BackColor = &HA66539 'Active The Text Box
                        Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Connected To Text Chat."
                        Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>" & "Connected To Text Chat Engine"
                        AddText Frm_Main.txt_msg(0), "//Text Chat Start At : [" & Now & "]"
                        Frm_Main.txt_msg(3).SetFocus
                    Else
                       'Cann't LogIN Text Chat
                        TextChatFlag = False
                        MsgBox "Cann't initialize server to login into textchat! ,  Try Again.", vbInformation, AppName
                        Frm_Main.ChatButtons(9).Enabled = True 'Enable Login Text Chat
                        Frm_Main.txt_msg(1).Enabled = True
                        Frm_Main.txt_msg(2).Enabled = True
                    End If
           Case 68 'Text Data Comes From Server
                   'Check If TextChat flag Set , Else Discard Comming Data
                   If Done = "T" Then
                        If TextChatFlag = True Then
                            AddText Frm_Main.txt_msg(0), "[" & Server_ID & "] Says :" & vbCrLf & Function_Data, 1
                            Sound
                        End If
                   ElseIf Done = "F" Then
                        MsgBox "The Chat Manager is not ready  at the remoted computer,Ensure Loging In", vbInformation, AppName
                        ChatManagerButtons (10) 'Log Out
                   End If
           Case 69 'Logout Text Chat
                    If Done = "F" Then
                        MsgBox "Failed to logout From Text Chat!", vbExclamation, AppName
                    End If
                    
           Case 70 'Reserved
           
           Case 71 'Feedback From LoginVoiceChat signal
                If Done = "T" Then
                    'Open Wave Device For Start Recording
                     StartVoiceRec
                     SetTimer WHandle, 3, 1, AddressOf ReqTimer
                     Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Voice Chat Is Connected Successfully."
                End If
           Case 72 'Feedback From Send VoiceData
                If Done = "F" Then
                    'Log Out From Voice Chat And Show Info. Message
                End If
           Case 73 'Logout From Voice Chat
                 Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
           Case 74 'Reserved
           
           Case 75 'Login In Spyer
           
           Case 76 'Send Data
           
           Case 77 'Logout Spyer
           
           Case 78 'Reserved
           
           Case 79 'Login White Board
                If Done = "T" Then
                    If Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>" & "Logging InTo White Board ..." Then
                       Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Connected To White Board,Enjoy!"
                    End If
                    WhiteBoardFlag = True
                    LoadWB
                    Frm_Main.ChatButtons(18).Enabled = False
                    SetTimer WHandle, 4, 500, AddressOf PackCode
                Else
                    MsgBox "Unable To Login WhiteBoard At Server Side!", vbInformation, AppName
                End If
           Case 80 'Send Whiteboard Data
                ParseWBCode Function_Data
           Case 81 'Logout Whiteboard
                If Done = "F" Then
                    MsgBox "Failed to logout From White Board at server side!", vbExclamation, AppName
                Else
                    WhiteBoardFlag = False
                    Frm_Main.WBScreen.Cls
                    MsgBox "White Board Has Been Deativated!", vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>" & "Logging Out From White Board ..." Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
                End If
                Frm_Main.ChatButtons(18).Enabled = True
                If WhiteBoardFlag = True Then KillTimer WHandle, 4 'Kill The Timer
           Case 82 'Send Simple Chat Text During Playing
                
           Case 83 'Login Games (By Game ID)
                If Done = "T" Then
                    Frm_Main.MSscreen.Enabled = True
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Mine Sweeper is successfully activated with the server"
                    MineSweeperFlag = True
                    Frm_Main.ChatButtons(16).Enabled = False 'Disable The Login button
                Else
                    MsgBox "Unable To Login Minesweeper Game At Server Side!", vbInformation, AppName
                    MineSweeperFlag = False
                End If
           Case 84 'Send Game Data
                OtherSideShot Val(Function_Data)
                Sound
           Case 85 'Logout Games
                If Done = "F" Then
                    MsgBox "Failed to logout From Minesweeper at server side!", vbExclamation, AppName
                Else
                    MsgBox "Minesweeper is successfully logged out at the server side.", vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>Logging Out From Mine Sweeper ..." Then
                    Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
                End If
           Case 86 'Reserved
           
           Case 87 'Reserved
           
           Case 88 'Advanced Topics
    End Select
End Sub
Private Function CheckAlreadyLoginIntoChatSystem() As Boolean
    CheckAlreadyLoginIntoChatSystem = TextChatFlag Or WhiteBoardFlag Or MineSweeperFlag
End Function
''''''''''''''''''''''''''''''''' << White Board >> '''''''''''''''''''''''''''''''''
Public Sub LoadWB()
   'Initializations
    CurrentTool = 1
    CurrentSize = 1
    TerminalSize = 1
    TerminalColor = vbBlack
    Frm_Main.WBScreen.DrawWidth = 3
    Frm_Main.WBScreen.ForeColor = vbBlack
    Frm_Main.WBScreen.Cls
    Frm_Main.WBSelectColor.BackColor = vbBlack
    CurrentColor = vbBlack
    ReDim Preserve WBCode(0)
End Sub
Public Sub WhiteBoardButtonsClick(Index As Integer)
    Select Case Index
           Case 0  'New Area
                Frm_Main.WBScreen.Cls
                InsertCode 0
           Case 1  'Pin Tool
                CurrentTool = 1
           Case 2  'Line Tool
                CurrentTool = 2
           Case 3  'Spray Tool
                CurrentTool = 3
           Case 4  'Sizes
                'Clear The Menus Checks
                 Menus.ClearWBsizesMenu
                'Select The Current Size And Disable It
                 Menus.WBSize(CurrentSize).Checked = True
                 Menus.WBSize(CurrentSize).Enabled = False
                'Show The Menu
                 With Frm_Main
                    .PopupMenu Menus.WBSizes, , _
                    .WhiteBoardButtons(Index).Left + .room(1).Left + .WBScreen.Left + 20, _
                    .WhiteBoardButtons(Index).Top + .room(1).Top + .ChatRoom(3).Top + .WBScreen.Top + .WhiteBoardButtons(Index).Height
                 End With
           Case 5 'Save As...
                 FileBrowser.CMD1.DialogTitle = "Save The Picture As BMP Format"
                 FileBrowser.CMD1.FileName = ""
                 FileBrowser.CMD1.CancelError = False
                 FileBrowser.CMD1.ShowSave
                'Save The Picture
                 If Len(FileBrowser.CMD1.FileName) Then
                    If LCase(Right$(FileBrowser.CMD1.FileName, 4)) = ".bmp" Then
                        SavePicture Frm_Main.WBScreen.Image, FileBrowser.CMD1.FileName
                    Else
                        SavePicture Frm_Main.WBScreen.Image, FileBrowser.CMD1.FileName & ".bmp"
                    End If
                 End If
           Case 6  'Colors
                 CurrentColor = Frm_Main.WBSelectColor.BackColor
                 Frm_Main.WBScreen.ForeColor = CurrentColor
                 InsertCode 3 & Char_Representation(CurrentColor)
           Case Else 'Sizes
                 CurrentSize = Index - 6
                 Frm_Main.WBScreen.DrawWidth = CurrentSize * 3 'Strech The DrowWidth Sizes
                 InsertCode 4 & CurrentSize
    End Select
End Sub
Public Sub WhiteBoardSRDown(X As Integer, Y As Integer)
    'The White Board Screen Left-Mouse Down Event
     Dim Temp As String
     With Frm_Main.WBScreen
        Select Case CurrentTool
               Case 1 'Free Line
                    PrevPoint.X = X: PrevPoint.Y = Y
                    Frm_Main.WBScreen.PSet (X, Y)
                    InsertCode 5 & IntToChar(X) & IntToChar(Y)
               Case 2 'Solid Line
                    Frm_Main.WBline.X1 = X
                    Frm_Main.WBline.Y1 = Y
                    Frm_Main.WBline.X2 = X
                    Frm_Main.WBline.Y2 = Y
                    Frm_Main.WBline.BorderWidth = Frm_Main.WBScreen.DrawWidth
                    Frm_Main.WBline.BorderColor = CurrentColor
                    Frm_Main.WBline.Visible = True
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
     With Frm_Main.WBScreen
        Select Case CurrentTool
               Case 1 'Free Line
                    LineTo X, Y
                    PrevPoint.X = X: PrevPoint.Y = Y
               Case 2 'Solid Line
                    Frm_Main.WBline.X2 = X
                    Frm_Main.WBline.Y2 = Y
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
     With Frm_Main.WBScreen
        Select Case CurrentTool
               Case 1 'Free Line

               Case 2 'Solid Line
                    Frm_Main.WBline.Visible = False
                    PrevPoint.X = Frm_Main.WBline.X1
                    PrevPoint.Y = Frm_Main.WBline.Y1
                    LineTo Frm_Main.WBline.X2, Frm_Main.WBline.Y2
               Case 3 'Spray

        End Select
     End With
End Sub
Private Function SetButtonsSystem(SystemID As Integer) As Boolean
'function deals with ChatButtons(2),ChatButtons(3),ChatButtons(4)
    If SystemID < 1 Or SystemID > 6 Then
            SetButtonsSystem = False
            Exit Function
    End If
    With Frm_Main
        .ChatButtons(2).Visible = False
        .ChatButtons(3).Visible = False
        .ChatButtons(4).Visible = False
        Select Case SystemID
               Case 1 'vbOK
                    .ChatButtons(3).Caption = "OK"
                    .ChatButtons(3).Visible = True
                    CurrentButtonSystemStr = vbOKOnly
               Case 2 'VbOkCancel
                    .ChatButtons(2).Caption = "OK"
                    .ChatButtons(4).Caption = "Cancel"
                    .ChatButtons(2).Visible = True
                    .ChatButtons(4).Visible = True
                    CurrentButtonSystemStr = vbOKCancel
               Case 3 'AbortRetryIgnore
                    .ChatButtons(2).Caption = "Abort"
                    .ChatButtons(3).Caption = "Retry"
                    .ChatButtons(4).Caption = "Ignore"
                    .ChatButtons(2).Visible = True
                    .ChatButtons(3).Visible = True
                    .ChatButtons(4).Visible = True
                    CurrentButtonSystemStr = vbAbortRetryIgnore
               Case 4 'VBYesNo
                    .ChatButtons(2).Caption = "Yes"
                    .ChatButtons(4).Caption = "No"
                    .ChatButtons(2).Visible = True
                    .ChatButtons(4).Visible = True
                    CurrentButtonSystemStr = vbYesNo
               Case 5 'VbYesNoCancel
                    .ChatButtons(2).Caption = "Yes"
                    .ChatButtons(3).Caption = "No"
                    .ChatButtons(4).Caption = "Cancel"
                    .ChatButtons(2).Visible = True
                    .ChatButtons(3).Visible = True
                    .ChatButtons(4).Visible = True
                    CurrentButtonSystemStr = vbYesNoCancel
               Case 6 'VbOkCancel
                    .ChatButtons(2).Caption = "Ok"
                    .ChatButtons(4).Caption = "Cancel"
                    .ChatButtons(2).Visible = True
                    .ChatButtons(4).Visible = True
                    CurrentButtonSystemStr = vbOKCancel
        End Select
    End With
    SetButtonsSystem = True
End Function
Private Sub SetIcon(IconID As Integer)
    Select Case IconID
           Case 1 ' VbNone
                CurrentIconStr = 0
           Case 2 'Question
                CurrentIconStr = vbQuestion
           Case 3 'Error
                CurrentIconStr = vbCritical
           Case 4 'Infomraion
                CurrentIconStr = vbInformation
           Case 5 'Warning
                CurrentIconStr = vbExclamation
    End Select
End Sub
Private Sub CopyConversation()
    Editor.SetString Frm_Main.txt_msg(0), "Text Chat Conversation"
    Editor.Show 0
End Sub
Private Function CheckWaveInDevice() As Boolean
     Format.wFormatTag = &H1                ' format type
     Format.nChannels = 1                ' number of channels (i.e. mono, stereo, etc.)
     Format.nSamplesPerSec = 8000                    ' sample rate 8.0 kHz
     Format.nAvgBytesPerSec = Format.nSamplesPerSec    ' for buffer estimation
     Format.wBitsPerSample = 8                          ' [8, 16, or 0]
     Format.nBlockAlign = Format.nChannels * Format.wBitsPerSample / 8 '  block size of data
     Format.cbSize = 0
     Dim rc As Long
     rc = waveInOpen(hWaveIn, WAVE_MAPPER, Format, 0&, 0&, 0&)
     If rc <> 0 Then
        CheckWaveInDevice = False
        Exit Function
     End If
     rc = waveInClose(hWaveIn)
     If rc <> 0 Then
         CheckWaveInDevice = False
         Exit Function
     End If
    CheckWaveInDevice = True
End Function
Private Sub StartVoiceRec()
    For i = 0 To NUM_BUFFERS - 1
        hMem(i) = GlobalAlloc(GMEM_MOVEABLE Or GMEM_ZEROINIT Or GMEM_SHARE, MAX_BUFFER_SIZE)
        inHdr(i).lpData = GlobalLock(hMem(i))
        inHdr(i).dwBufferLength = MAX_BUFFER_SIZE
        inHdr(i).dwFlags = 0
        inHdr(i).dwLoops = 0
    Next
    rc = waveInOpen(hWaveIn, WAVE_MAPPER, Format, 0&, 0&, 0&)
    If rc <> 0 Then
        waveInGetErrorText rc, Msg, Len(Msg)
        MsgBox Msg
        StartInput = False
        Exit Sub
    End If
    For i = 0 To NUM_BUFFERS - 1
        rc = waveInPrepareHeader(hWaveIn, inHdr(i), Len(inHdr(i)))
        If (rc <> 0) Then
            waveInGetErrorText rc, Msg, Len(Msg)
            MsgBox Msg
        End If
    Next
    For i = 0 To NUM_BUFFERS - 1
        rc = waveInAddBuffer(hWaveIn, inHdr(i), Len(inHdr(i)))
        If (rc <> 0) Then
            waveInGetErrorText rc, Msg, Len(Msg)
            MsgBox Msg
        End If
    Next
    fRecording = True
    
    rc = waveInStart(hWaveIn)
    If rc = 0 Then
    End If
End Sub
Private Sub ReqTimer()
 Dim strData  As String
 If fRecording Then
 For i = 0 To NUM_BUFFERS - 1
    If inHdr(i).dwFlags And WHDR_DONE Then
        CopyPTRtoBYTES Wavedata(0), inHdr(i).lpData, MAX_BUFFER_SIZE
        rc = waveInAddBuffer(hWaveIn, inHdr(i), Len(inHdr(i)))
        strData = StrConv(Wavedata, vbUnicode)
        If Frm_Main.Send_Data(Chr$(72) & strData) = False Then
            'Kill The Voice Timer
             LogOutVoiceChat
             Frm_Main.RoomTitle(1) = "\Handle-X\Chat Manager :\>_"
        End If
    End If
 Next
 End If
End Sub
Public Sub ComposeTextChatData(Data As String)
   'Send The Data
    Frm_Main.Send_Data Chr$(68) & Data
   'Add The Data Into The Text Screen
    AddText Frm_Main.txt_msg(0), "[" & Client_ID & "] Says :" & vbCrLf & Data, 1
    Frm_Main.txt_msg(3).SetFocus
End Sub
Private Sub LogOutVoiceChat()
    KillTimer WHandle, 3
    fRecording = False
    waveInReset hWaveIn
    waveInStop hWaveIn
    For i = 0 To NUM_BUFFERS - 1
        waveInUnprepareHeader hWaveIn, inHdr(i), Len(inHdr(i))
        GlobalFree hMem(i)
    Next
    waveInClose hWaveIn
End Sub
'Functions of drowing of the white board
Private Sub LineTo(X As Integer, Y As Integer)
    'Drow The Line form The previuos Point to the Passed Point
     Dim Temp As String
     Frm_Main.WBScreen.Line (PrevPoint.X, PrevPoint.Y)-(X, Y)
     Temp = 1 & IntToChar(PrevPoint.X) & IntToChar(PrevPoint.Y) & IntToChar(X) & IntToChar(Y)
     If Len(Temp) = 9 Then InsertCode Temp
End Sub
Private Sub SprayAt(X As Integer, Y As Integer, TSize As Long)
    'Make a spray at the pased point
     Dim i As Integer 'General counter
     Dim TmpSize As Integer, Size As Integer
     Dim NewPoint As Point, Temp As String
     TmpSize = TSize
     Frm_Main.WBScreen.DrawWidth = 1
     Size = (TSize * 50)
     For i = 0 To (Size)
        NewPoint.X = GET_RANDOM(X - Size, X + Size)
        NewPoint.Y = GET_RANDOM(Y - Size, Y + Size)
        If TestDistance(X, Y, NewPoint.X, NewPoint.Y, Size / (2 ^ 0.5)) = True Then
            Frm_Main.WBScreen.PSet (NewPoint.X, NewPoint.Y)
        End If
     Next
     Frm_Main.WBScreen.Refresh
     Frm_Main.WBScreen.DrawWidth = TmpSize * 3
End Sub
Private Function TestDistance(X1 As Integer, Y1 As Integer, X2 As Integer, Y2 As Integer, Dest As Integer) As Boolean
    'Test if the distance be ok or not
     If (((X1 - X2) ^ 2) + ((Y1 - Y2) ^ 2)) ^ 0.5 <= Dest Then
        TestDistance = True
     End If
End Function
Private Function GET_RANDOM(i, J) As Integer   'I IS MINIMUM VALUE AND J IS THE MAX VALUE
     GET_RANDOM = Int((J - i + 1) * Rnd + i)
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
            If Frm_Main.Send_Data(Chr$(80) & Package) = False Then 'Kill The WB Timer
                If WhiteBoardFlag = True Then KillTimer WHandle, 4
            End If
         Else
            WhiteBoardFlag = False
         End If
         ReDim WBCode(0)
    End If
End Function
Private Sub ParseWBCode(Package As String)
    Dim Codes() As String, i As Integer
    Codes = Split(Package, Separator_Char)
    Frm_Main.WBScreen.ForeColor = TerminalColor
    Frm_Main.WBScreen.DrawWidth = TerminalSize * 3
    For i = 0 To UBound(Codes) - 1
        Select Case Left$(Codes(i), 1)
               Case 0 'Clear Screen
                    Frm_Main.WBScreen.Cls
               Case 1 'Lines
                    Frm_Main.WBScreen.Line (CharToInt(Mid$(Codes(i), 2, 2)), CharToInt(Mid$(Codes(i), 4, 2)))-(CharToInt(Mid$(Codes(i), 6, 2)), CharToInt(Mid$(Codes(i), 8, 2)))
               Case 2 'Spray
                    SprayAt CharToInt(Mid$(Codes(i), 2, 2)), CharToInt(Mid$(Codes(i), 4, 2)), TerminalSize
               Case 3 'ColorCode
                    TerminalColor = Long_Representation(Mid$(Codes(i), 2))
                    Frm_Main.WBScreen.ForeColor = TerminalColor
               Case 4 'Sizes
                    TerminalSize = Mid$(Codes(i), 2)
                    Frm_Main.WBScreen.DrawWidth = TerminalSize * 3
               Case 5 'Point
                    Frm_Main.WBScreen.PSet (CharToInt(Mid$(Codes(i), 2, 2)), CharToInt(Mid$(Codes(i), 4, 2)))
        End Select
    Next i
   'Retrive Current Values
    Frm_Main.WBScreen.ForeColor = CurrentColor
    Frm_Main.WBScreen.DrawWidth = CurrentSize * 3
End Sub
''''''''''''''''''''''''''''''''''<< Games >>''''''''''''''''''''''''''''''''
'Mine Sweeeper
Private Sub LoadMS()
     On Error Resume Next
     Dim i As Integer, J As Integer 'General Counters
    'Clear The Mine Sweeper Screen
     Frm_Main.MSscreen.Cls
    'Initializations
     MeScore = 0
     Frm_Main.Score(0) = "0"
     ForignScore = 0
     Frm_Main.Score(1) = "0"
     Frm_Main.bar(9) = "Number of rest mines is [" & Mines & "] mines"
    'Drow The Map In The Memory (Build The MSMap)
     Randomize
    'Set The Positions of the cells
     ReDim MSMap(XSize - 1, YSize - 1) 'Clear The Mine Map
     XTmp = Frm_Main.MSscreen.Width / XSize
     YTmp = Frm_Main.MSscreen.Height / YSize
     For i = 0 To Frm_Main.MSscreen.Width Step XTmp
        For J = 0 To Frm_Main.MSscreen.Height Step YTmp
            With MSMap(i / XTmp, J / YTmp)
                .Position.X = i
                .Position.Y = J
                .Position.XE = i + XTmp
                .Position.YE = J + YTmp
            End With
        Next J
     Next i
    'Set The Mines Cells
     i = 0
    'Check If Mines more than available places
     If Mines > (XSize - 1) * (YSize - 1) Then Mines = (XSize - 1) * (YSize - 1)
     Do While i < Mines
        XTmp = Int(Rnd * XSize)
        YTmp = Int(Rnd * YSize)
        If MSMap(XTmp, YTmp).Case <> mine Then
            MSMap(XTmp, YTmp).Case = mine
            i = i + 1
        End If
     Loop
     XTmp = Frm_Main.MSscreen.Width / XSize
     YTmp = Frm_Main.MSscreen.Height / YSize
    'Set The Cells Values
     For i = 0 To XSize
        For J = 0 To YSize
            If MSMap(i, J).Case <> mine Then
               'Set Value Flag
                MSMap(i, J).Case = Value
               'Set The Values
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i - 1, J - 1).Case = mine))
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i - 1, J).Case = mine))
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i - 1, J + 1).Case = mine))
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i, J - 1).Case = mine))
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i, J + 1).Case = mine))
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i + 1, J - 1).Case = mine))
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i + 1, J).Case = mine))
                MSMap(i, J).ValueInt = MSMap(i, J).ValueInt + Abs(Int(MSMap(i + 1, J + 1).Case = mine))
            End If
        Next J
     Next i
    'Drow The Mine Map At The screen
     For i = 0 To Frm_Main.MSscreen.Width Step XTmp
        Frm_Main.MSscreen.Line (i, 0)-(i, Frm_Main.MSscreen.Height)
     Next i
     For J = 0 To Frm_Main.MSscreen.Height Step YTmp
        Frm_Main.MSscreen.Line (0, J)-(Frm_Main.MSscreen.Width, J)
     Next J
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
    If MyRound Then Frm_Main.MSscreen.Enabled = False
   'Send The Cell ID to other side
    Dim CellID As Integer
    CellID = (PY * XSize) + PX
    If MyRound = True Then
        If Frm_Main.Send_Data(Chr$(84) & CellID) = False Then
            MsgBox "Other Side is been dropped down!", vbInformation, AppName
            Frm_Main.MSscreen.Enabled = False
            Exit Sub
        End If
    End If
    If MSMap(PX, PY).Case = mine Then 'Mine Found
        MSMap(PX, PY).IsPressed = True
       'Register the score And Check winning
        If MyRound Then
            MeScore = MeScore + 1
            Frm_Main.Score(0) = MeScore
        Else
            ForignScore = ForignScore + 1
            Frm_Main.Score(1) = ForignScore
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
                Frm_Main.MSscreen.Enabled = True
            Else
                Frm_Main.MSscreen.Enabled = False
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
     For i = 0 To (Frm_Main.MSscreen.Width) Step XTmp
        Frm_Main.MSscreen.Line (i, 0)-(i, Frm_Main.MSscreen.Height)
     Next i
     For J = 0 To (Frm_Main.MSscreen.Height) Step YTmp
        Frm_Main.MSscreen.Line (0, J)-(Frm_Main.MSscreen.Width, J)
     Next J
    'Select The Cell
     PX = Int(X / XTmp)
     PY = Int(Y / YTmp)
     SelCell MSMap(PX, PY), &HE9CAAD
End Sub
Private Sub ShowAll()
     Dim i As Integer, J As Integer 'General Counters
     For i = 0 To XSize
        For J = 0 To YSize
            'If MSMap(i, j).Case = mine Then
                ShowCell MSMap(i, J)
            'End If
        Next J
     Next i
End Sub
Private Sub ShowCell(Cell As MineCell)
     On Error Resume Next
     Dim i As Integer, J As Integer 'General Counters
     Dim W As Integer, H As Integer, TmpColor As Long
     Select Case Cell.Case
            Case Value
                If Cell.ValueInt > 0 Then '1 , 2, 3, 4, ... [Value more than One]
                    W = Frm_Main.MSscreen.TextWidth(Cell.ValueInt)
                    H = Frm_Main.MSscreen.TextHeight(Cell.ValueInt)
                    With Frm_Main.MSscreen
                         TmpColor = .ForeColor
                        .ForeColor = vbBlack
                        .CurrentX = ((XTmp - W) / 2) + Cell.Position.X - 40
                        .CurrentY = ((YTmp - H) / 2) + Cell.Position.Y
                         Frm_Main.MSscreen.Print Cell.ValueInt
                        .ForeColor = TmpColor
                    End With
                Else 'Zero Place
                   'Drow An Empty Place
                    W = Frm_Main.MSscreen.TextWidth("")
                    H = Frm_Main.MSscreen.TextHeight("")
                    With Frm_Main.MSscreen
                         TmpColor = .ForeColor
                        .ForeColor = vbBlack
                        .CurrentX = ((Cell.Position.XE - Cell.Position.X) / 2) + Cell.Position.X
                        .CurrentY = ((Cell.Position.YE - Cell.Position.Y) / 2) + Cell.Position.Y
                         Frm_Main.MSscreen.PSet (.CurrentX, .CurrentY)
                        .ForeColor = TmpColor
                    End With
                   'Show The Around Empty Places
                End If
            Case mine
               'First Show the number of rest of the mines
                Frm_Main.bar(9) = "Number of rest mines is [" & (Mines - MeScore - ForignScore) & "] mines"
                W = Frm_Main.MSscreen.TextWidth("M")
                H = Frm_Main.MSscreen.TextHeight("M")
                With Frm_Main.MSscreen
                     TmpColor = .ForeColor
                    .ForeColor = vbRed
                    .CurrentX = ((XTmp - W) / 2) + Cell.Position.X
                    .CurrentY = ((YTmp - H) / 2) + Cell.Position.Y
                     Frm_Main.MSscreen.Print "M"
                    .ForeColor = TmpColor
                End With
     End Select
End Sub
Private Sub SelCell(Cell As MineCell, CColor As Long)
     On Error Resume Next
     Dim TmpColor As Long
     TmpColor = Frm_Main.MSscreen.ForeColor
     Frm_Main.MSscreen.ForeColor = CColor
     Frm_Main.MSscreen.Line (Cell.Position.X, Cell.Position.Y)-(Cell.Position.XE, Cell.Position.YE), , B
     Frm_Main.MSscreen.ForeColor = TmpColor
End Sub
Public Sub OtherSideShot(Cell As Integer)
   'Cell is the ID of the cell which Other side Clicked There
   'Check Game Activated
    If MineSweeperFlag = False Then Exit Sub
    MyRound = False 'This is not my round for playing
    Frm_Main.MSscreen.Enabled = True
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
     ChatManagerButtons 17 'Log out from the game
End Sub
