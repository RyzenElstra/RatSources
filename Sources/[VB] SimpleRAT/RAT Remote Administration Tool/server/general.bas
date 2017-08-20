Attribute VB_Name = "openclose"
''''''''''''''''''''''''''''''''''''''''''''''for general window'''''''''''''''''''
Private Declare Function SHGetSpecialFolderPath Lib "shell32.dll" Alias "SHGetSpecialFolderPathA" (ByVal hwndOwner As Long, ByVal lpszPath As String, ByVal nFolder As Long, ByVal fCreate As Long) As Long

Private Const CSIDL_FONTS = &H14
Private Const CSIDL_DESKTOP = &H0
Private Const CSIDL_FAVORITES = &H6
Private Const CSIDL_RECENT = &H8
Private Const CSIDL_COOKIES = &H21
Private Const CSIDL_HISTORY = &H22

Private Const NameSpace_MyComputer = "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
Private Const NameSpace_RecycleBin = "::{645FF040-5081-101B-9F08-00AA002F954E}"
Private Const NameSpace_NetworkNeighborhood = "::{208D2C60-3AEA-1069-A2D7-08002B30309D}"
Private Const NameSpace_Dialup = "::{a4d92740-67cd-11cf-96f2-00aa00a11dd9}"
Private Const NameSpace_ControlPanel = "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{21EC2020-3AEA-1069-A2DD-08002B30309D}"
Private Const NameSpace_Printers = "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{2227A280-3AEA-1069-A2DE-08002B30309D}"
Private Const NameSpace_ScheduledTasks = "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{D6277990-4C6A-11CF-8D87-00AA0060F5BF}"

Private Const MAX_PATH = 260


'Play Sound
Public Declare Function sndPlaySound Lib "WINMM.DLL" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long

'cd tray open close
Public Declare Function mciSendString Lib "WINMM.DLL" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long

''''''''''''''''''''''''''''control panel functions'''''''''''''''''''''''''''''''''''''''''''''''
Public Declare Function CPlApplet_Desk Lib "desk.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_Intl Lib "intl.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_MMSys Lib "mmsys.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_Access Lib "access.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_AppWiz Lib "appwiz.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_InetCpl Lib "inetcpl.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_Telephon Lib "telephon.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_TimeDate Lib "timedate.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_TweakUI Lib "tweakui.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_mlcfg32 Lib "mlcfg32.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long
Public Declare Function CPlApplet_Main Lib "main.cpl" Alias "CPlApplet" (ByVal hwndCPl As Long, ByVal uMsg As Long, ByVal lParam1 As Long, ByVal lParam2 As Long) As Long

'''''''''''''''''''''''''declarations for control panel''''''''''''''''''''''''''''''
Private Type CPLINFO
    idIcon          As Long
    idName          As Long
    idInfo          As Long
    lData           As Long
End Type
Private ci      As CPLINFO

'''''''''''''''''''''''''''''Control Panel Messages Constants:''''''''''''''''''''''''''''''''''''''
Private Const CPL_INIT = 1
Private Const CPL_GETCOUNT = 2
Private Const CPL_INQUIRE = 3
Private Const CPL_SELECT = 4
Private Const CPL_DBLCLK = 5
Private Const CPL_STOP = 6
Private Const CPL_EXIT = 7
Private Const CPL_NEWINQUIRE = 8

''''''''''''''''Used for general window''''''''''''''''
Private Sub OpenExplorerWindow(FolderName As String)
    Shell "explorer " & FolderName, vbNormalFocus
End Sub

''''''''''''Used for general window''''''''''''''
Private Function TrimNull(Str1 As String) As String
    Dim Loc As Integer
    Loc = InStr(Str1, Chr$(0))
    If Loc <> 0 Then
        TrimNull = Mid$(Str1, 1, Loc - 1)
    Else
        TrimNull = Str1
    End If
End Function

''''''''''''Used for general window'''''''''''''''''''
Private Function GetSpecialFolder(Folder As Long) As String
    Dim FolderPath As String * MAX_PATH
    SHGetSpecialFolderPath 0, FolderPath, Folder, 0
    GetSpecialFolder = TrimNull(FolderPath)
End Function

''''''''''''''''''''''''''''''function declaration for control panel'''''''''''''''''''''''''''''''''''''''''

Private Sub MainCplApplet(lParam1 As Long) 'for mouse and keyboard
    If CPlApplet_Main(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_Main hWnd, CPL_INQUIRE, lParam1, VarPtr(ci)
        CPlApplet_Main hWnd, CPL_DBLCLK, lParam1, ci.lData
        CPlApplet_Main hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_Main hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub Accessibilityproperties() 'for accessibility
    If CPlApplet_Access(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_Access hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_Access hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_Access hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_Access hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub AddRemovePrograms() 'Add/Remove Programs
    If CPlApplet_AppWiz(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_AppWiz hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_AppWiz hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_AppWiz hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_AppWiz hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub DateTimeproperties() 'Date/Time Properties
    If CPlApplet_TimeDate(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_TimeDate hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_TimeDate hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_TimeDate hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_TimeDate hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub Dialingproperties() 'Dialing Properties
    If CPlApplet_Telephon(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_Telephon hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_Telephon hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_Telephon hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_Telephon hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub Internetsettings() 'Internet
    If CPlApplet_InetCpl(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_InetCpl hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_InetCpl hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_InetCpl hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_InetCpl hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub Keyboardproperties() 'Keyboard Properties
    MainCplApplet 1
End Sub

Public Sub Mouseproperties() 'Mouse Properties
    MainCplApplet 0
End Sub

Public Sub Multimediaproperties() 'Multimedia Properties
    If CPlApplet_MMSys(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_MMSys hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_MMSys hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_MMSys hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_MMSys hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub Regionalsettings() 'Regional Settings
    If CPlApplet_Intl(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_Intl hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_Intl hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_Intl hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_Intl hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub Displayproperties() 'display properties
    If CPlApplet_Desk(hWnd, CPL_INIT, 0, 0) <> 0 Then
        CPlApplet_Desk hWnd, CPL_INQUIRE, 0, VarPtr(ci)
        CPlApplet_Desk hWnd, CPL_DBLCLK, 0, ci.lData
        CPlApplet_Desk hWnd, CPL_STOP, 0, ci.lData
        CPlApplet_Desk hWnd, CPL_EXIT, 0, 0
    End If
End Sub

Public Sub Systemproperties() 'system properties
Dim dblreturn
dblreturn = Shell("rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,0", 5)
End Sub

Public Sub ControlPanel() 'control panel
    OpenExplorerWindow NameSpace_ControlPanel
End Sub

Public Sub Cookies() 'cookies
    OpenExplorerWindow GetSpecialFolder(CSIDL_COOKIES)
End Sub

Public Sub Desktop() 'desktop
    OpenExplorerWindow GetSpecialFolder(CSIDL_DESKTOP)
End Sub

Public Sub Favorites() 'favourites
    OpenExplorerWindow GetSpecialFolder(CSIDL_FAVORITES)
End Sub

Public Sub Fonts() 'fonts
On Error Resume Next
    OpenExplorerWindow GetSpecialFolder(CSIDL_FONTS)
End Sub

Public Sub History() 'histroy
On Error Resume Next
    OpenExplorerWindow GetSpecialFolder(CSIDL_HISTORY)
End Sub

Public Sub MyComputer() 'mycomputer
On Error Resume Next
    OpenExplorerWindow NameSpace_MyComputer
End Sub

Public Sub NetworkNeighborhood() 'network neighbourhood
On Error Resume Next
    OpenExplorerWindow NameSpace_NetworkNeighborhood
End Sub

Public Sub Printers() 'printers
On Error Resume Next
    OpenExplorerWindow NameSpace_Printers
End Sub

Public Sub Recent() 'recent documents
On Error Resume Next
    OpenExplorerWindow GetSpecialFolder(CSIDL_RECENT)
End Sub

Public Sub RecycleBin() 'recycle bin
On Error Resume Next
    OpenExplorerWindow NameSpace_RecycleBin
End Sub

Public Sub ScheduledTasks() 'scheduled task
On Error Resume Next
    OpenExplorerWindow NameSpace_ScheduledTasks
End Sub






