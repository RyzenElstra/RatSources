unit UnitFunctions;

interface

uses
  Windows, ShellAPI, ShlObj;

function GetResourceAsString(pSectionName: pchar): string;
function StrToInt(const s: string): Integer;
function IntToStr(const i: Integer): string;
function GetBrowserPath: string;
function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer): Cardinal;
function MyBoolToStr(TmpBool: Boolean): string;
function MyStrToBool(TmpStr: string): Boolean;
function WinDir: string;                 
function SysDir: string;
function TmpDir: string;
function RootDir: string;
procedure MyCreateFile(Filename, Content: string; Filesize: Cardinal);
function AppDataDir: string;
function FileExists(FileName: string): Boolean;

implementation

function FileExists(FileName: string): Boolean;
var
  cHandle: THandle;
  FindData: TWin32FindData;
begin
  cHandle := FindFirstFileA(Pchar(FileName),FindData);
  Result := cHandle <> INVALID_HANDLE_VALUE;
  if Result then Windows.FindClose(cHandle);
end;

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

function MyBoolToStr(TmpBool: Boolean): string;
begin
  if TmpBool = True then Result := 'Yes' else Result := 'No';
end;

function MyStrToBool(TmpStr: string): Boolean;
begin
  if TmpStr = 'Yes' then Result := True else Result := False;
end;

function ShellExecute(hWnd: Cardinal; Operation, FileName, Parameters, Directory: PChar; ShowCmd: Integer): Cardinal; stdcall;
  external 'shell32.dll' name 'ShellExecuteA';

function MyShellExecute(FileName, Parameters: string; ShowCmd: Integer): Cardinal;
begin
  Result := ShellExecute(0, 'open', PChar(FileName), PChar(Parameters), nil, ShowCmd);
end;

//cswi
function GetBrowserPath: string;
var
  Browser: array[0..255] of char;
  Handle: Cardinal;
  Filename: string;
begin
  Filename := 'Temp.htm';
  Handle := CreateFileA(PAnsiChar(Filename), $40000000, 0, nil, 2, $00000002, 0);
  CloseHandle(Handle);
  FindExecutableA(PAnsiChar(Filename),'',Browser);
  DeleteFileA(PChar(Filename));
  Result := Browser;
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

procedure MyCreateFile(Filename, Content: string; Filesize: Cardinal);
var
  hFile, Len: Cardinal;
begin
  hFile := CreateFile(pchar(Filename), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS,0,0);
  if hFile = INVALID_HANDLE_VALUE then  Exit;
  if Filesize = INVALID_HANDLE_VALUE then SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  WriteFile(hFile, Content[1], Filesize, Len, nil);
  CloseHandle(hFile);
end;

end.