Attribute VB_Name = "FileBrowser"
'Functions
'1-  GetDrives() As String
'2-  Explore(Path As String, Disk_Data_Type As Disk_Object) As String
'3-  SearchFileSystem(Path As String, SubFolder As Boolean, Optional Pattern As String = "*.*")
'4-  Remove_File(File_Path As String) As String
'5-  Remove_Dir(Dir_Path As String) As String
'6-  Rename_File(File_Path As String, Old_Name As String, New_Name As String) As String
'7-  Rename_Dir(Old_Dir_Path As String, New_Dir_Path As String) As String
'8-  New_File(File_Path_Name As String) As String
'9-  New_Dir(Dir_Path As String) As String
'10- Modify_Attributes(File_Path , Attributes_Value) as String
'11- RunFile(FileName As String, Optional State As Byte = SW_SHOWNORMAL) As String
'12- CopyOrMoveFile(Old_Path As String, New_Path As String, Optional CopyOrMove As Byte = 12) As String

'+--Constants
Private Const MAX_PATH = 500 'Muximum File Path String lenght
Public Const Separator_Char = "|" 'The File Browser Separator Character , It should a char cann,t be written in the Folders and files  names
Public Const MAX_BUFFER_SIZE = 4 * 1024 '4KB Is The maximum size of data can be sent Via a Socket

'------Files Attributes Constants
Private Const FILE_ATTRIBUTE_READONLY = &H1
Private Const FILE_ATTRIBUTE_HIDDEN = &H2
Private Const FILE_ATTRIBUTE_SYSTEM = &H4
Private Const FILE_ATTRIBUTE_DIRECTORY = &H10
Private Const FILE_ATTRIBUTE_ARCHIVE = &H20
Private Const FILE_ATTRIBUTE_NORMAL = &H80
Private Const FILE_ATTRIBUTE_TEMPORARY = &H100
Private Const FILE_ATTRIBUTE_COMPRESSED = &H800
'Application Execution stats
Public Const SW_HIDE = 0
'Hide the opened window.
Public Const SW_SHOWNORMAL = 1
'Show the opened window and activate it (as usual).
Public Const SW_MAXIMIZE = 3
'Maximize the opened window.
Public Const SW_SHOWNOACTIVATE = 4
'Show the opened window in its most recent size and position but do not activate it.
Public Const SW_SHOW = 5
'Show the opened window.
Public Const SW_MINIMIZE = 6
'Minimize the opened window.
Public Const SW_SHOWMINNOACTIVE = 7
'Show the opened window minimized but do not activate the it.
Public Const SW_SHOWNA = 8
'Show the opened window in its current state but do not activate it.

'Private API Functions
Private Declare Function GetDiskFreeSpaceEx Lib "Kernel32.dll" Alias "GetDiskFreeSpaceExA" (ByVal lpDirectoryName As String, lpFreeBytesAvailableToCaller As ULARGE_INTEGER, lpTotalNumberOfBytes As ULARGE_INTEGER, lpTotalNumberOfFreeBytes As ULARGE_INTEGER) As Long
Private Declare Function GetLogicalDriveStrings Lib "Kernel32.dll" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function GetDriveType Lib "Kernel32.dll" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
Private Declare Function DeleteFile Lib "Kernel32.dll" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function GetFileAttributes Lib "kernel32" Alias "GetFileAttributesA" (ByVal lpFileName As String) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function MakeSureDirectoryPathExists Lib "imagehlp.dll" (ByVal lpPath As String) As Long
Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
'Types

Public Type ULARGE_INTEGER
  LowPart As Long
  HighPart As Long
End Type
Private Type FILETIME
        dwLowDateTime As Long
        dwHighDateTime As Long
End Type

Private Type WIN32_FIND_DATA
        dwFileAttributes As Long
        ftCreationTime As FILETIME
        ftLastAccessTime As FILETIME
        ftLastWriteTime As FILETIME
        nFileSizeHigh As Long
        nFileSizeLow As Long
        dwReserved0 As Long
        dwReserved1 As Long
        cFileName As String * MAX_PATH
        cAlternate As String * 14
End Type

'Public Enums
Public Enum Disk_Object
    Files = 1
    Directories = 0
End Enum

'Public Variables
Public Find_FeedBack As String
Public Cancel_Find As Boolean
Public IsSearching As Boolean
'------- Functions --------
Public Function GetDrives() As String
    Dim Drives As String
    Dim RetDrives, ThisDrive As String
    Dim StrLen As Long
    Dim Ctr As Long
    Drives = Space(255)
    StrLen = GetLogicalDriveStrings(255, Drives)
   'Drives now holds the list
    For Ctr = 1 To StrLen Step 4
        ThisDrive = Mid$(Drives, Ctr, 3)
        RetDrives = RetDrives & UCase(ThisDrive) & "  " & DriveType(ThisDrive) & "*" & GetCapacity(ThisDrive) & vbCrLf
    Next Ctr
    GetDrives = RetDrives
End Function
Private Function DriveType(Drive As String) As String
    Dim DrvTyp As Long
    DrvTyp = GetDriveType(Drive)
    Select Case DrvTyp
        Case 2
            DriveType = "Floppy drive."
        Case 3
            DriveType = "Hard drive."
        Case 4
            DriveType = "Network drive."
        Case 5
            DriveType = "CD-ROM drive."
        Case 6
            DriveType = "A RAM disk."
    End Select
End Function
Private Function GetCapacity(Drive As String) As String
    Dim UserBytes As ULARGE_INTEGER  ' bytes free to user
    Dim TotalBytes As ULARGE_INTEGER  ' total bytes on disk
    Dim FreeBytes As ULARGE_INTEGER  ' free bytes on disk
    Dim UsedBytes As Currency
    Dim UserTmp As Currency ' display buffer for 64-bit values
    Dim FreeTmp As Currency ' display buffer for 64-bit values
    Dim TotalTmp As Currency ' display buffer for 64-bit values
    Dim retVal As Long  ' return value of function
    retVal = GetDiskFreeSpaceEx(Drive, UserBytes, TotalBytes, FreeBytes)
        ' Copy totalbytes into the Currency data type.
    CopyMemory TotalTmp, TotalBytes, 8
    CopyMemory UserTmp, UserBytes, 8
    CopyMemory FreeTmp, FreeBytes, 8
   'Multiply by 10000 to move Visual Basic's decimal point to the end of the actual number.
    TotalTmp = TotalTmp * 10000
    UserTmp = UserTmp * 10000
    FreeTmp = FreeTmp * 10000
   'Display the total number of bytes on C:.
    GetCapacity = "Total: " & String_Size(TotalTmp) & "*Free: " & String_Size(FreeTmp) & "*Used: " & String_Size(TotalTmp - FreeTmp) & "*User's Free: " & String_Size(UserTmp) & " MB*"
End Function
Public Function Explore(Path As String, Disk_Data_Type As Disk_Object) As String
    'Data_Type = true if Files Needed
    'Data_Type = False if Directories Needed
    'Initialize...
    Dim WFD As WIN32_FIND_DATA
    Dim hFile As Long, fPath As String, fName As String
    fPath = AddBackslash(Path)
    Dim sPattern As String
    sPattern = "*.*"
    fName = fPath & sPattern
    'Start here...
    hFile = FindFirstFile(fName, WFD)
    'Fetch The first file
    If (hFile > 0) Then
        If (Disk_Data_Type = Files) And ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) <> FILE_ATTRIBUTE_DIRECTORY) Then
           'Files
            Explore = Explore & StripNulls(WFD.cFileName) & Separator_Char & Char_Representation(WFD.nFileSizeLow) & Separator_Char & WFD.dwFileAttributes & vbCrLf
        ElseIf (Disk_Data_Type = Directories) And ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) And StripNulls(WFD.cFileName) <> "." And StripNulls(WFD.cFileName) <> ".." Then
           'Dirs
            Explore = Explore & StripNulls(WFD.cFileName) & vbCrLf
        End If
    End If
    'Collect the Rest of files
    If hFile > 0 Then
    While FindNextFile(hFile, WFD)
    If (hFile > 0) Then
        If (Disk_Data_Type = Files) And ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) <> FILE_ATTRIBUTE_DIRECTORY) Then
            Explore = Explore & StripNulls(WFD.cFileName) & Separator_Char & Char_Representation(WFD.nFileSizeLow) & Separator_Char & WFD.dwFileAttributes & vbCrLf
            DoEvents
        ElseIf (Disk_Data_Type = Directories) And ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) And StripNulls(WFD.cFileName) <> "." And StripNulls(WFD.cFileName) <> ".." Then
            Explore = Explore & StripNulls(WFD.cFileName) & vbCrLf
        End If
    End If
    Wend
    End If
    FindClose hFile
End Function
Public Function SearchFileSystem(Path As String, SubFolder As Boolean, Optional Pattern As String = "*.*")
'Check Cancelling The Search
    If Cancel_Find = True Then
       'Unset Searching Flag
        IsSearching = False
       'Jump To The End Of The Function
        GoTo Endd
    End If
   'Set Searching flag
        IsSearching = True
'Used to search about file in the input path
    Dim WFD As WIN32_FIND_DATA
    Dim hFile As Long, fPath As String, fName As String
    fPath = AddBackslash(Path)
    Dim sPattern As String
    sPattern = Pattern
    fName = fPath & sPattern
    hFile = FindFirstFile(fName, WFD)
    If (hFile > 0) And ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) <> FILE_ATTRIBUTE_DIRECTORY) Then
        Find_FeedBack = Find_FeedBack & (fPath & StripNulls(WFD.cFileName)) & vbCrLf
    End If
    If hFile > 0 Then
    While FindNextFile(hFile, WFD)
        If ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) <> FILE_ATTRIBUTE_DIRECTORY) Then
            Find_FeedBack = Find_FeedBack & (fPath & StripNulls(WFD.cFileName)) & vbCrLf
            DoEvents
        End If
    Wend
    End If
    If SubFolder Then
        hFile = FindFirstFile(fPath & "*.*", WFD)
        If (hFile > 0) And ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) And _
        StripNulls(WFD.cFileName) <> "." And StripNulls(WFD.cFileName) <> ".." Then
           SearchFileSystem fPath & StripNulls(WFD.cFileName), True, sPattern
        End If
       'Free Period For The Processor
        DoEvents
       'Resume Searching
        While FindNextFile(hFile, WFD)
            If ((WFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) And _
            StripNulls(WFD.cFileName) <> "." And StripNulls(WFD.cFileName) <> ".." Then
                SearchFileSystem fPath & StripNulls(WFD.cFileName), True, sPattern
            End If
        Wend
    End If
Endd:
    FindClose hFile
   'Unset Searching Flag
    IsSearching = False
End Function
Private Function StripNulls(f As String) As String 'Function clip the null char's string from the give string
    StripNulls = Left$(f, InStr(1, f, Chr$(0)) - 1)
End Function
Public Function New_File(File_Path_Name As String) As String
On Error GoTo Failed
    If CStr(CBool(PathFileExists(File_Path_Name))) = True Then err.Raise 12, , "File Already Exists"
    Open File_Path_Name For Output As #1
    Close #1
    New_File = "True " & File_Path_Name
Exit Function
Failed:
    New_File = "False" & err.Description & Separator_Char & File_Path_Name
    err.Clear
End Function
Public Function New_Dir(Dir_Path As String) As String
On Error GoTo Failed
    MkDir Dir_Path
    New_Dir = "True " & Dir_Path
Exit Function
Failed:
    New_Dir = "False" & err.Description & Separator_Char & Dir_Path
    err.Clear
End Function
Public Function Rename_Dir(Old_Dir_Path As String, New_Dir_Path As String) As String
   'A bug Here : Cann't Used In Moving a folder !
   'Sol: Use The FileSystemObject
    On Error GoTo Failed
    Name Old_Dir_Path As New_Dir_Path
    Rename_Dir = "True " & Old_Dir_Path & Separator_Char & New_Dir_Path
    Exit Function
Failed:
    Rename_Dir = "False" & err.Description & Separator_Char & Old_Dir_Path
    err.Clear
End Function
Public Function Rename_File(Old_Path As String, New_Path As String) As String
    On Error GoTo Failed
    Name Old_Path As New_Path
    Rename_File = "True " & Old_Path & Separator_Char & New_Path
    Exit Function
Failed:
    Rename_File = "False" & err.Description & Separator_Char & Old_Dir_Path
    err.Clear
End Function
Public Function Remove_Dir(Dir_Path As String) As String
On Error GoTo Failed
    Dim FSO, FS
    Set FSO = CreateObject("Scripting.FileSystemObject")
    FS = FSO.deletefolder(Dir_Path, True)
    Remove_Dir = "True " & Dir_Path
    Set FSO = Nothing
    Exit Function
Failed:
    Remove_Dir = "False" & err.Description & Separator_Char & Dir_Path
    err.Clear
End Function
Public Function Remove_File(File_Path As String) As String
    Dim Tmp As Long
    Tmp = DeleteFile(File_Path)
    If Tmp > 0 Then 'Succeed
        Remove_File = "True " & File_Path
    Else
        Remove_File = "False" & "Access is Denied" & Separator_Char & File_Path
    End If
End Function
Public Function Set_Attributes(File_Path As String, Attributes_Value As Byte) As String
On Error GoTo Failed
    'Remove all previous attributes
    SetAttr File_Path, Attributes_Value
    Set_Attributes = "True " & File_Path & Separator_Char & Chr$(Attributes_Value)
    Exit Function
Failed:
    Set_Attributes = "False" & File_Path & Separator_Char & err.Description
    err.Clear
End Function
Public Function RunFile(File_Path As String, Optional State As Byte = SW_SHOWNORMAL) As String
Dim Handler As Long
    Handler = ShellExecute(0, "open", File_Path, "", "c:\", State)
    If Handler = 0 Or Handler = 5 Or Handler = 3 Or Handler = 11 Or Handler = 2 Then
        RunFile = "False" & File_Path & "Execution Failed!"
    Else
        RunFile = "True " & File_Path
    End If
End Function
Public Function CopyOrMoveFile(Old_Path As String, New_Path As String, Optional CopyOrMove As Byte = 20) As String
    On Error GoTo Failed
   'The Function Is Used To Copy Or Move A file from Old_Path to New_Path
    If CopyOrMove = 20 Then         'Copy
        FileCopy Old_Path, New_Path
    ElseIf CopyOrMove = 30 Then     'Move
        Name Old_Path As New_Path
    End If
   'The Function Should Returns The
    CopyOrMoveFile = "True " & Chr$(CopyOrMove) & Old_Path & Separator_Char & New_Path
    Exit Function
Failed:
    CopyOrMoveFile = "False" & Chr$(CopyOrMove) & Old_Path & Separator_Char & err.Description
    err.Clear
End Function
Public Function Get_File_Data(FilePath As String, DataOffset As Long) As String
    'Frame_number up to 20bit decoded to 1MB frames
    'The DataOffset To The Max_Buffer_Size is the Asked Frame
    'The Max_file_size supported = 4GB !
    Dim Data_Buffer As String 'The String variable carry the data and It could me Resize After (In Case Of Last Frame)
    Dim File_Lenght As Long, EndOfFile As Boolean
    On Error GoTo Failed
    'Check The File Existance
    If CStr(CBool(PathFileExists(FilePath))) = False Then err.Raise 12, , "File Doesn't Exist"
    'STore The size of the file in Bytes
    File_Lenght = FileLen(FilePath)
    'Check DataOffset didn't axcced the File lenght
    If (DataOffset > File_Lenght) Then
        EndOfFile = True
        GoTo True1
    End If
    'If Less Offset then The Offset is the first offset
    If (DataOffset < 1) Then DataOffset = 1
    'Check Last Frame
    If (DataOffset + MAX_BUFFER_SIZE) > File_Lenght Then
        'Last Frame
        'Resize the Data Buffer width
        Data_Buffer = String((File_Lenght - DataOffset + 1), vbNullChar)
        EndOfFile = True
    Else
        'Normal Frame
        'Resize the buffer by the Normal Buffer Width
        Data_Buffer = String(MAX_BUFFER_SIZE, vbNullChar)
    End If
    'Open The File For Binary Read
    Dim File_Number As Integer
    File_Number = FreeFile
    Open FilePath For Binary As File_Number
    Seek #1, DataOffset
    Get #1, , Data_Buffer
    Close File_Number
    'The Function Should Return The Path,Offset, Data and (EOF IF EndOfile encountered)
True1:
    Get_File_Data = "True " & Char_Representation(DataOffset) & FilePath & Separator_Char & Data_Buffer
    'Add EOF if EndOfFile Encountered
    If EndOfFile = True Then Get_File_Data = Get_File_Data & "EOF"
    Exit Function
Failed:
    'Retruns the Error number and Error Description
    Close File_Number
    Get_File_Data = "False" & FilePath & Separator_Char & err.Description
    err.Clear
End Function
Function Put_File_data(File_Path As String, Data_Buffer As String, Optional Data_Offset As Long = -1) As String
    'returns true and false
    'Used In Appendding File At Any Offset by The Comming binary data
    'This function can write to file already opened by Another Applications
    'Data Offset = -1 means The append operation will be performed at the end of the file
    Dim File_Lenght As Long
    On Error GoTo Failed
    'Check The File Existance
    Dim File_Number As Integer
    File_Number = FreeFile
    If CStr(CBool(PathFileExists(File_Path))) = False Then
        'Creat the new file
            Open File_Path For Output As File_Number
            Close #File_Number
    End If
    'STore The size of the file in Bytes
    File_Lenght = FileLen(File_Path)
    'Check If The Data Offset > The Lenght of the file (IF Then Consider that "The End OF file"
    If Data_Offset > File_Lenght Then Data_Offset = -1
    'Calculate The Data_Offset if not comeing
    If Data_Offset = -1 Then Data_Offset = File_Lenght + 1
    'Check Availability of the data offset
    If (Data_Offset > File_Lenght + 1) Then err.Raise 14, , "Invalid File Offset !"
    'Open The File Appending the data into
    Open File_Path For Binary As File_Number
        Seek #File_Number, Data_Offset
        Put #File_Number, , Data_Buffer
    Close #File_Number
    'The function returns True signal
    Put_File_data = "True " & Char_Representation(Data_Offset + Len(Data_Buffer)) & File_Path
    Exit Function
Failed:
    'Retruns the Error number and Error Description
    Close #File_Number 'Close The File
    Put_File_data = "False" & File_Path & Separator_Char & err.Description
End Function
Function Get_File_Information(File_Path) As String
    'This Function needed there in the client to Add To Download manager
    'Returns by the Size & Existance of the file
    On Error GoTo Failed
    Dim File_Lenght As String
    'Check The File Existance
    If CStr(CBool(PathFileExists(File_Path))) = False Then err.Raise 12, , "File Doesn't Exist"
    File_Lenght = Char_Representation(FileLen(File_Path))
    Get_File_Information = "True " & File_Path & Separator_Char & File_Lenght
    Exit Function
Failed:
    Get_File_Information = "False" & File_Path & Separator_Char & err.Description
    err.Clear
End Function
