Attribute VB_Name = "modSaArchive"
'Visual example of File Structure:


'EXEBINARY
'@###!!!!!!!!!!!!!!!!!!!!-+
'@###!!!!!!!!!!!!!!!!!!!!-+
'@###!!!!!!!!!!!!!!!!!!!!-+
'@###!!!!!!!!!!!!!!!!!!!!-+
'%%%%%%%%%%^^^^^^^^^^%%%%%%%%%%^^^^^^^^^^::$

'Key:
'EXEBINARY     - Executable file data
'#             - Destination length
'!             - File length
'@             - Shell File
'-             - File destination
'+             - File data
'%             - File Address
'^             - File Address (The same as % but presented as ^ so we can tell them apart)
':             - File count
'$             - Invisible Install

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpszOp As String, ByVal lpszFile As String, ByVal lpszParams As String, ByVal lpszDir As String, ByVal FsShowCmd As Long) As Long

Public Function AppPath() As String
    Dim modName As String * 512
    Dim i As Long
    i = GetModuleFileName(App.hInstance, modName, Len(modName))
    AppPath = Left$(modName, i)
End Function


Function MakeSelfExtractor(SourceExe As String, Destination As String, Files() As String) As Long
    'On Error GoTo ErrorHandler
    'SourceExe - The source for the self-extract executible file
    'Destination is the path of the new self-extract executible with files embeded will be saved.
    'Files() is an array that contains entries like : "filesource|filedest|shell" where filepath is the source file, where filedest is the output destination, where shell is either 0 or 1.
    
    Dim SourceNumber As String
    Dim DestinationNumber As Integer, DestinationLen As Long
    Dim FileBinary As String
    Dim FileAddresses As String
    Dim SelfExtractBinary As String
    Dim FilesSuccessful As Integer
    Dim ByteArray() As Byte
    
    If Dir(SourceExe) <> "" Then
    If Dir(Destination) <> "" Then Kill Destination
        If MakePath(GetFileDir(Destination)) <> 0 Then
            Exit Function
        End If
    End If
    
    
    Dim CurrentFileSource As String, CurrentFileDest As String, CurrentFileShell As String, FileNumber As Integer, FileLen As Long, BytesSaved As Long
    SourceNumber = FreeFile
    Open SourceExe For Binary Access Read As SourceNumber
    DestinationNumber = FreeFile
    Open Destination For Binary Access Write As DestinationNumber
        ReDim ByteArray(1 To LOF(SourceNumber))
        Get SourceNumber, , ByteArray()
        Put DestinationNumber, , ByteArray()
    Close SourceNumber
        
        For i = 0 To UBound(Files)
            CurrentFileSource = Split(Files(i), "|")(0)
            CurrentFileDest = Split(Files(i), "|")(1)
            CurrentFileShell = Split(Files(i), "|")(2)
            
            If Dir(CurrentFileSource) = "" Then GoTo NextFile
            
            FileNumber = FreeFile
            
            DestinationLen = LOF(DestinationNumber)
            
            Open CurrentFileSource For Binary Access Read As FileNumber
                
                FileAddresses = FileAddresses & SetLen(CStr(DestinationLen) + 1, 10, "0", "r")
                
                FileLen = LOF(FileNumber)
                
                Put DestinationNumber, , CurrentFileShell
                Put DestinationNumber, , SetLen(Len(CurrentFileDest), 3, "0", "r")
                Put DestinationNumber, , SetLen(CStr(FileLen), 20, "0", "r")
                Put DestinationNumber, , CurrentFileDest
                                
                BytesSaved = 0
                
                Do Until BytesSaved >= FileLen
                    If FileLen - BytesSaved > (10 * (1024 ^ 2)) Then 'There is more than 10 mb to archive
                        ReDim ByteArray(1 To (10 * (1024 ^ 2)))
                    Else ' There is less than 5 mb
                        ReDim ByteArray(1 To FileLen - BytesSaved)
                    End If
                    
                    Get FileNumber, , ByteArray()
                    Put DestinationNumber, , ByteArray()
                    
                    BytesSaved = BytesSaved + UBound(ByteArray)
                Loop
                
            Close FileNumber
            
            FilesSuccessful = FilesSuccessful + 1
                        
NextFile:
        Next i
    

        Put DestinationNumber, , FileAddresses & SetLen(CStr(FilesSuccessful), 2, "0", "r")
    
    Close DestinationNumber
    
    MakeSelfExtractor = FilesSuccessful
            
    On Error Resume Next
    Close SourceNumber
    Close FileNumber
    
    Exit Function
ErrorHandler:
    On Error Resume Next
    Close FileNumber
    Close SourceNumber
    Close DestinationNumber
    MakeSelfExtractor = 0
End Function

Public Function ExtractArchive(ExeFile As String, DefaultPath As String, Optional FileToExtract As String)
    Dim TotalFiles As Long, ExtractedFiles As Long
    Dim ExeNumber As Long, CurrentNumber As Long
    Dim ByteArray() As Byte, BytesSaved As Long
    Dim temp As String
    Dim Address As Currency, FileDestLen As Long, FileDest As String, FileLen As Long, ShellFile As String
    Dim Stage As Long
        
    ExeNumber = FreeFile
    
    Stage = 1
    Open ExeFile For Binary Access Read As ExeNumber
        
        Stage = 2
        Seek ExeNumber, LOF(ExeNumber) - 1
        temp = String(2, Chr(0))
        Get ExeNumber, , temp
        TotalFiles = Val(temp)
              
        For i = 1 To TotalFiles
            
            
            'Get the current file's "address"
            Stage = 4
            Seek ExeNumber, LOF(ExeNumber) - 1 - (10 * i)
            temp = String(10, Chr(0))
            Get ExeNumber, , temp
            Address = Val(temp)
            If Address = 0 Then GoTo NextFile
            
            'Now we have the 'address' of our file, we can access the file's details.
               
            'check if we have to shell the file
            Stage = 5
            Seek ExeNumber, Address
            temp = String(1, Chr(0))
            Get ExeNumber, , temp
            ShellFile = temp
            
            'Get the destination path length
            Stage = 6
            Seek ExeNumber, Address + 1
            temp = String(3, Chr(0))
            Get ExeNumber, , temp
            FileDestLen = Val(temp)
            
            'Get the file size
            Stage = 7
            Seek ExeNumber, Address + 1 + 3
            temp = String(20, Chr(0))
            Get ExeNumber, , temp
            FileLen = Val(temp)
            
            'Get the file destination
            Stage = 8
            Seek ExeNumber, Address + 1 + 3 + 20
            FileDest = String(FileDestLen, Chr(0))
            Get ExeNumber, , FileDest
            
            If FileToExtract <> "" Then
                If FileDest <> FileToExtract Then GoTo NextFile
            End If

            'Complete file destination
            Stage = 9
            FileDest = CheckDest(FileDest)
            
            If GetFileDir(FileDest) = "" Then FileDest = DefaultPath & FileDest
            
            MakePath GetFileDir(FileDest)
            
            'Transfer to file in 5mb(max) blocks.
            
            'Ok we have the data! Let's save!
            CurrentNumber = FreeFile
                        
            Stage = 10
            Seek ExeNumber, Address + 1 + 3 + 20 + FileDestLen
            
            Debug.Print FileDest
            Open FileDest For Binary Access Write As CurrentNumber
            
            BytesSaved = 0
            
            Do Until BytesSaved >= FileLen
                If FileLen - BytesSaved > 5242880 Then
                    ReDim ByteArray(1 To 5242880)
                Else
                    ReDim ByteArray(1 To FileLen - BytesSaved)
                End If
                
                Get ExeNumber, , ByteArray()
                
                Debug.Print StrConv(ByteArray(), vbUnicode)
                
                Put CurrentNumber, , ByteArray()
                
                BytesSaved = BytesSaved + UBound(ByteArray)
            Loop
            
            Close CurrentNumber
            
            ExtractedFiles = ExtractedFiles + 1
            
            If ShellFile = "1" Then
                Shell FileDest
            End If
NextFile:
        Next i
        
    Close ExeNumber
    
    ExtractArchive = ExtractedFiles
    Exit Function

ErrorHandler:
    Select Case Error
    Case 53
    'File destination not found
        If Stage = 10 Then
            Exit Function
        End If
    Case Else
    
    End Select
End Function

Private Function CheckDest(Path As String) As String
    Dim Registry As clsRegistry
    Set Registry = New clsRegistry
    
    Select Case Mid(Path, 1, 4)
    Case "*wd*"
        CheckDest = Registry.GetValue(eHKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion", "SystemRoot") & "\" & Mid(Path, 5)
        If CheckDest = "" Then CheckDest = Registry.GetValue(eHKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows NT\CurrentVersion", "SystemRoot") & "\" & Mid(Path, 5)
    Case "*hd*"
        CheckDest = GetDrive(App.Path) & Mid(Path, 5)
    Case "*md*"
        CheckDest = Registry.GetValue(eHKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Personal") & "\" & Mid(Path, 5)
    Case "*su*"
        CheckDest = Registry.GetValue(eHKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Startup") & "\" & Mid(Path, 5)
    Case "*pf*"
        CheckDest = Registry.GetValue(eHKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion", "ProgramFilesDir") & "\" & Mid(Path, 5)
    Case "*dt*"
        CheckDest = Registry.GetValue(eHKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Desktop") & "\" & Mid(Path, 5)
    Case Else
        CheckDest = Path
    End Select
End Function

Function GetFileDir(Path As String) As String
    Dim temp() As String
    
    If InStr(1, Path, "\") <> 0 Then
        temp() = Split(Path, "\")
        
        For i = 0 To UBound(temp) - 1
            GetFileDir = GetFileDir & temp(i) & "\"
        Next i
    End If
End Function

Function Shell(Path As String, Optional Arguments As String, Optional PathToStart As String, Optional Visible As Long = 1) As String
     ShellExecute GetDesktopWindow, vbNullString, Path, Arguments, PathToStart, Visible
End Function

Function FixPath(Path As String) As String
    FixPath = Path
    If InStr(4, FixPath, ":") > 0 Then FixPath = Replace(FixPath, ":", "", 4)
    FixPath = Replace(FixPath, "*", "")
    FixPath = Replace(FixPath, "/", "")
    FixPath = Replace(FixPath, "|", "")
    FixPath = Replace(FixPath, "?", "")
    FixPath = Replace(FixPath, "<", "")
    FixPath = Replace(FixPath, ">", "")
End Function

Private Function MakePath(Path As String)
    Dim temp() As String, CurrentDir As String
        
        On Error Resume Next
        
        If InStr(1, Path, "\") = 0 Then Exit Function
        temp() = Split(Path, "\")
        CurrentDir = temp(0) & "\"
        
    For i = 1 To UBound(temp)
        CurrentDir = CurrentDir & temp(i) & "\"
        If Dir(CurrentDir, vbDirectory) = "" Then
            MkDir CurrentDir
        End If
    Next i
    
    MakePath = 0
    
    Exit Function
ErrorHandler:
    MakePath = Err.Number
End Function

Private Function SetLen(Text As String, Length As String, Optional Filler As String = " ", Optional Alignment As String = "r") As String
    SetLen = String(Length - Len(Text), Filler)
    Select Case Alignment
    Case "l"
        SetLen = Text & SetLen
    Case "r"
        SetLen = SetLen & Text
    End Select
End Function

Function GetDrive(Path As String) As String
    Dim temp() As String
    
    If InStr(1, Path, "\") < 1 Then GetDrive = ""
    temp() = Split(Path, "\")
    
    GetDrive = temp(0) & "\"
    
End Function

Function GetFile(Path As String) As String
    Dim temp() As String
    On Error Resume Next
    
    temp() = Split(Path, "\")
    
    GetFile = temp(UBound(temp))
    
End Function
