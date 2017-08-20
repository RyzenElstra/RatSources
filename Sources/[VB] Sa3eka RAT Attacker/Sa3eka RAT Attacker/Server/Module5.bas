Attribute VB_Name = "Module5"
Option Explicit
Private Const SWP_HIDEWINDOW = &H80
Private Const SWP_SHOWWINDOW = &H40
Public Declare Function FindWindow Lib "user32" Alias _
"FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName _
As String) As Long

Public Declare Function SetWindowPos Lib "user32" _
(ByVal hwnd As Long, ByVal hWndInsertAfter As Long, _
ByVal X As Long, ByVal Y As Long, ByVal cx As Long, _
ByVal cy As Long, ByVal wFlags As Long) As Long
Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion      As Long
    dwMinorVersion      As Long
    dwBuildNumber       As Long
    dwPlatformId        As Long
    szCSDVersion        As String * 128
End Type
Private Declare Function ShowWindow Lib "user32" ( _
    ByVal hwnd As Long, _
    ByVal nCmdShow As Long) As Long

Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" ( _
    ByVal hWnd1 As Long, _
    ByVal hWnd2 As Long, _
    ByVal lpsz1 As String, _
    ByVal lpsz2 As String) As Long

Function DesktopIconsShow()
    Dim hwnd As Long
    hwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
    ShowWindow hwnd, 5
End Function

Function DesktopIconsHide()
    Dim hwnd As Long
    hwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
    ShowWindow hwnd, 0
End Function

Public Function HideTaskBar() As Boolean
Dim lRet As Long
    lRet = FindWindow("Shell_traywnd", "")
    If lRet > 0 Then
        lRet = SetWindowPos(lRet, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
        HideTaskBar = lRet > 0
    End If
End Function

Public Function ShowTaskBar() As Boolean
Dim lRet As Long
lRet = FindWindow("Shell_traywnd", "")
If lRet > 0 Then
    lRet = SetWindowPos(lRet, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
    ShowTaskBar = lRet > 0
End If
End Function
Function GetOSVersion() As String
#If Win32 Then
    Dim osvVersion As OSVERSIONINFO: osvVersion.dwOSVersionInfoSize = Len(osvVersion)
    If (GetVersionEx(osvVersion)) Then
        With osvVersion
            If (.dwPlatformId = 0) Then
                GetOSVersion = "Windows 32s"
            ElseIf (.dwPlatformId = 1) Then
                If (.dwMinorVersion = 0) Then
                    GetOSVersion = "Windows 95"
                ElseIf (.dwMinorVersion = 10) Then
                    GetOSVersion = "Windows 98"
                ElseIf (.dwMinorVersion = 90) Then
                    GetOSVersion = "Windows ME"
                End If
            ElseIf (.dwPlatformId = 2) Then
                If ((.dwMajorVersion = 3) And (.dwMinorVersion = 0)) Then
                    GetOSVersion = "Windows NT3"
                ElseIf ((.dwMajorVersion = 3) And (.dwMinorVersion = 1)) Then
                    GetOSVersion = "Windows NT3.1"
                ElseIf ((.dwMajorVersion = 3) And (.dwMinorVersion = 5)) Then
                    GetOSVersion = "Windows NT3.5"
                ElseIf ((.dwMajorVersion = 3) And (.dwMinorVersion = 51)) Then
                    GetOSVersion = "Windows NT3.51"
                ElseIf ((.dwMajorVersion = 4) And (.dwMinorVersion = 0)) Then
                    GetOSVersion = "Windows NT 4.0"
                ElseIf ((.dwMajorVersion = 5) And (.dwMinorVersion = 0)) Then
                    GetOSVersion = "Windows 2000"
                ElseIf (.dwMinorVersion = 1) Then
                    GetOSVersion = "Windows XP"
                ElseIf (.dwMinorVersion = 2) Then
                    GetOSVersion = "Windows 2003 Server"
                ElseIf (.dwMajorVersion = 6) Then
                    GetOSVersion = "Windows Vista"
                End If
            End If
            GetOSVersion = GetOSVersion
            Dim intPos As Integer: intPos = InStr(1, osvVersion.szCSDVersion, Chr$(0))
            If (intPos) Then GetOSVersion = GetOSVersion & " " & Left$(osvVersion.szCSDVersion, intPos - 1)
        End With
    End If
#Else
    GetOSVersion = "Windows 3.x"
#End If

End Function

Function FileName() As String

FileName = String$(260, Chr$(0))
FileName = Left$(FileName, GetModuleFileName(0, FileName, 260))

End Function




