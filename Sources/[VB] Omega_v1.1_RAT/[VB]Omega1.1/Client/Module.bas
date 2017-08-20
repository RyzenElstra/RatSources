Attribute VB_Name = "Module"
Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, _
ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, _
ByVal dwExtraInfo As Long)

Declare Function WritePrivateProfileString Lib "kernel32" _
Alias "WritePrivateProfileStringA" (ByVal lpApplicationname As String, _
ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long

Declare Function SetSysColors Lib "user32" _
(ByVal nChanges As Long, lpSysColor As _
Long, lpColorValues As Long) As Long

Public Const COLOR_BACKGROUND = 1
Public Const COLOR_MENU = 4
Public Const COLOR_WINDOW = 5
Public Const COLOR_WINDOWTEXT = 8
Public Const COLOR_BTNFACE = 15

Public Declare Function GetCursorPos Lib "user32" (mpPoint As MousePosition) As Long
Type MousePosition
    x As Long
    y As Long
End Type

Public Type BrowseInfo      'receive information about the folder selected by user.
     
     hwndOwner As Long      'Handle to th owner window for the dialog box.
     pIDLRoot As Long       'Pointer to an itemlist structure.
     pszDisplayName As Long 'Add. of buffer -receive the display name of folder selected.
     lpszTitle As Long      'Display above the tree view control.
     ulFlags As Long        'specifying the options for the dialog box (notify event).
     lpfnCallback As Long   'Add. of application-defined funtion.
     lParam As Long         'Application-defined value pass to callback function.
                            '(receives messages from the operating system.)
     iImage As Long         'Receive image associated with the selected folder.

End Type

Public Const BIF_RETURNONLYFSDIRS = 1
Public Const MAX_PATH = 260

Public Declare Function lstrcat Lib "kernel32" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Public Declare Function SHBrowseForFolder Lib "shell32" (lpbi As BrowseInfo) As Long
Public Declare Function SHGetPathFromIDList Lib "shell32" (ByVal pidList As Long, ByVal lpBuffer As String) As Long

Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Public Const HWND_TOP = 0
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const Flags = SWP_NOMOVE Or SWP_NOSIZE

Declare Function GetSystemMenu Lib "user32" (ByVal hwnd As Integer, _
ByVal bRevert As Integer) As Integer

Declare Function RemoveMenu Lib "user32" (ByVal hMenu As Integer, _
ByVal nPosition As Integer, ByVal wFlags As Integer) As Integer

Public Const Delimiter = "©" 'ascii 169

Public Function BrowseForFolder(hwndOwner As Long, sPrompt As String) As String
'Creates a dialog box (select a folder and returns the selected folder's Folder object).

    'declare variables to be used
     Dim iNull As Integer
     Dim lpIDList As Long
     Dim lResult As Long
     Dim sPath As String
     Dim udtBI As BrowseInfo

    'initialise variables
     With udtBI
        .hwndOwner = hwndOwner
        .lpszTitle = lstrcat(sPrompt, "")
        .ulFlags = BIF_RETURNONLYFSDIRS
     End With

    'Call the browse for folder API
     lpIDList = SHBrowseForFolder(udtBI)
     
    'get the resulting string path
     If lpIDList Then
        sPath = String$(MAX_PATH, 0)
        lResult = SHGetPathFromIDList(lpIDList, sPath)
        iNull = InStr(sPath, vbNullChar)
        If iNull Then sPath = Left$(sPath, iNull - 1)
     End If
     BrowseForFolder = sPath

End Function

Public Sub SaveProfile(AppName As String, KeyName As String, Values As String, FileName As String)
Dim lpAppName As String, lpKeyName As String, lpValues As String, lpFileName As String
 
 lpAppName = AppName
 lpKeyName = KeyName
 lpValues = Values
 lpFileName = FileName
 
 Call WritePrivateProfileString(lpAppName, lpKeyName, lpValues, lpFileName)
 
End Sub

Function FileExists(ByVal strPathName As String) As Boolean
On Error GoTo errHandle

    Open strPathName For Input As #1
    Close #1
    FileExists = True

Exit Function
errHandle:
FileExists = False
End Function

Public Function FileByteFormat(FileBytes As Long) As String
On Error Resume Next
Dim nFileNum As Integer
Dim TempNum As Single

If FileBytes > 0 Then
    ' Get file's length
    FileByteFormat = FileBytes / 1024
    
    ' Round number
    TempNum = FileByteFormat - Int(FileByteFormat)
    
    ' Use different scale according to the size of the file
    Select Case Val(FileByteFormat)
        Case Is > 1024 ' Use Mega Byte
            FileByteFormat = Format(FileByteFormat / 1000, "#.##MB")
        Case Else  ' Use Kilo Byte
            ' All values are to round up
            FileByteFormat = Format(FileByteFormat + (1 - TempNum), "###KB")
    End Select
Else
    FileByteFormat = "0KB"
End If

End Function

Public Sub StayOnTop(TheForm As Form)
SetWinOnTop = SetWindowPos(TheForm.hwnd, HWND_TOPMOST, 0, 0, 0, 0, Flags)
End Sub

Public Function cPath() As String
If Right(App.Path, 1) <> "\" Then
   cPath = App.Path & "\"
End If
End Function

Public Function PicIndex(FileName As String) As Integer
Dim NameTemp As String

'Floder        24
'My Documents  25
'Floppy        26
'Drive         27
'CD            28

'is Drive
Select Case UCase(FileName)
   Case "FLOPPY___|"
        PicIndex = 26
        Exit Function
   Case "HARDDRIVE|"
        PicIndex = 27
        Exit Function
   Case "CDROM____|"
        PicIndex = 28
        Exit Function
   Case "UNKNOWN__|"
        PicIndex = 24
        Exit Function
End Select

'is folder
If Right$(FileName, 1) = "\" Then
   If Mid$(FileName, 4, 12) = "My Documents" Or _
      Mid$(FileName, 1, 12) = "My Documents" Then
      PicIndex = 25
   Else
      PicIndex = 24
   End If
   Exit Function
End If

'is file
If InStr(1, FileName, ".") <> 0 Then
   NameTemp = Mid(FileName, InStrRev(FileName, ".", Len(FileName)) + 1, Len(FileName))
   
  Select Case LCase(NameTemp)
    Case "avi": PicIndex = 2
    Case "mov": PicIndex = 2
    Case "bat": PicIndex = 3
    Case "bmp": PicIndex = 4
    Case "pcx": PicIndex = 4
    Case "zip": PicIndex = 5
    Case "cab": PicIndex = 5
    Case "wav": PicIndex = 6
    Case "wma": PicIndex = 6
    Case "voc": PicIndex = 6
    Case "exe": PicIndex = 7
    Case "com": PicIndex = 7
    Case "dll": PicIndex = 8
    Case "sys": PicIndex = 8
    Case "cpl": PicIndex = 8
    Case "scr": PicIndex = 9
    Case "fon": PicIndex = 10
    Case "gif": PicIndex = 11
    Case "hlp": PicIndex = 12
    Case "htm": PicIndex = 13
    Case "html": PicIndex = 13
    Case "ini": PicIndex = 14
    Case "inf": PicIndex = 14
    Case "css": PicIndex = 14
    Case "jpg": PicIndex = 15
    Case "jpeg": PicIndex = 15
    Case "mid": PicIndex = 16
    Case "midi": PicIndex = 16
    Case "mp1": PicIndex = 17
    Case "mp2": PicIndex = 17
    Case "mp3": PicIndex = 17
    Case "pif": PicIndex = 18
    Case "rar": PicIndex = 19
    Case "reg": PicIndex = 20
    Case "key": PicIndex = 20
    Case "rtf": PicIndex = 21
    Case "doc": PicIndex = 21
    Case "ttf": PicIndex = 22
    Case "txt": PicIndex = 23
    Case "log": PicIndex = 23
    Case "cfg": PicIndex = 23
    Case "cda": PicIndex = 29
    Case "chm": PicIndex = 30
    Case "js": PicIndex = 31
    Case "jse": PicIndex = 31
    Case "m1v": PicIndex = 32
    Case "mpa": PicIndex = 32
    Case "mpe": PicIndex = 32
    Case "mpeg": PicIndex = 32
    Case "mpg": PicIndex = 32
    Case "wmv": PicIndex = 32
    Case "swf": PicIndex = 33
    Case "spl": PicIndex = 33
    Case "url": PicIndex = 34
    Case "vbs": PicIndex = 35
    Case "vbe": PicIndex = 35
    Case "wsh": PicIndex = 36
    Case Else: PicIndex = 1
  End Select
Else
  PicIndex = 1
End If

End Function
