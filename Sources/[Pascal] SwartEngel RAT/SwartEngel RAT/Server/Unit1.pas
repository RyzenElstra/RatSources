Unit Unit1;
Interface
Uses
  Windows, SysUtils;

Function ListAllDrives: String;
Function ListFiles(sDir: String): String;
Function GetFileSize(sFile: PChar): Int64;
Procedure DelFile(sFile: String);

Implementation

Function ListAllDrives: String;
Const
  DRIVE_UNKNOWN = 0;
  DRIVE_NO_ROOT_DIR = 1;
  DRIVE_REMOVABLE = 2;
  DRIVE_FIXED = 3;
  DRIVE_REMOTE = 4;
  DRIVE_CDROM = 5;
  DRIVE_RAMDISK = 6;
Var
  lW: LongWord;
  cDrives: Array[0..128] Of Char;
  pDrive: PChar;
  sDrives: String;
Begin
  lW := GetLogicalDriveStrings(SizeOf(cDrives), cDrives);
  If lW = 0 Then Exit;

  If lW > SizeOf(cDrives) Then
  Begin
    //Out Of Memory
  End;

  pDrive := cDrives;

  While pDrive^ <> #0 Do
  Begin
    If GetDriveType(pDrive) = DRIVE_FIXED Then
    Begin
     sDrives := sDrives + pDrive + '++';
    End;

    Inc(pDrive, 4);
  End;

  Result := sDrives;
End;

Function ListFiles(sDir: String): String;
Var
  sFileName: String;
  sFileList: String;
  sDirList: String;
  sSizeList: String;
  sRec: TWin32FindData;
  findHandle: THandle;
Begin

  If AnsiLastChar(sDir) <> '\' Then
  Begin
    sDir := sDir + '\';
  End;

  Try
    findHandle := FindFirstFile(PChar(sDir + '*.*'), sRec);

    If findHandle <> INVALID_HANDLE_VALUE Then
      Repeat
        sFileName := sRec.cFileName;

        If (sRec.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY) <> 0 Then Begin
          sDirList := sDirList + sDir + sFileName + '++';
        End
        Else
        Begin
          sFileList := sFileList + sDir + sFileName + '++';
          sSizeList := sSizeList + IntToStr(GetFileSize(PChar(sDir + sFileName))) + '++';
        End;
      Until FindNextFile(findHandle, sRec) = False;
  Finally
    //FindClose(findHandle);
  End;

  Result :=  sDirList + '|' + sFileList + '|' + sSizeList;
End;

Function GetFileSize(sFile: PChar): Int64;
Var
  fFile: THandle;
  wFD: TWIN32FINDDATA;
Begin
  Result := 0;

  If Not FileExists(sFile) Then
  Begin
    Exit;
  End;

  fFile := FindFirstFile(PChar(sFile), wFD);

  If fFile = INVALID_HANDLE_VALUE Then
  Begin
    Exit;
  End;

  Result := (wFD.nFileSizeHigh * (Int64(MAXDWORD) + 1)) + wFD.nFileSizeLow;
  Windows.FindClose(fFile);
End;

Procedure DelFile(sFile: String);
Begin
  If Not FileExists(sFile) Then
  Begin
    Exit;
  End;

  DeleteFile(sFile);
End;

End.
