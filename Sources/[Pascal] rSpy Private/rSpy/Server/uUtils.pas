unit uUtils;

interface

uses
  Windows, ShlObj;

function StrToInt(const S :String): Integer;
function IntToStr(const Value :Integer): String;
function StrToIntDef(const S: string; Default: integer): integer;
function WinDir(FileName: String): String;
function FileExists(const FileName: string): Boolean;
function ReadKeyToString(hRoot:HKEY; sKey:string; sSubKey:string):string;
function GetMyDocuments :String;
function GetProgramFiles :String;

implementation

function StrToInt(const S :String): Integer;
var
  E: integer;
begin
  Val(S, Result, E);
end;

function IntToStr(const Value :Integer): String;
var
  S: string[11];
begin
  Str(Value, S);
  Result := S;
end;

function StrToIntDef(const S: string; Default: integer): integer;
var
  E: integer;
begin
  Val(S, Result, E);
  if E <> 0 then Result := Default;
end;

function WinDir(FileName: String): String;
var
  Dir: Array[0..256] Of Char;
begin
  GetWindowsDirectory(Dir, 256);
  Result := String(Dir)+'\'+FileName;
end;

function FileExists(const FileName: string): Boolean;
var
lpFindFileData: TWin32FindData;
hFile: Cardinal;
begin
  hFile := FindFirstFile(PChar(FileName), lpFindFileData);
  if hFile <> INVALID_HANDLE_VALUE then
  begin
    result := True;
    Windows.FindClose(hFile)
  end
  else
    result := False;
end;

function ReadKeyToString(hRoot:HKEY; sKey:string; sSubKey:string):string;
var
  hOpen: HKEY;
  sBuff: array[0..255] of char;
  dSize: integer;
begin
  Result := '';
  if (RegOpenKeyEx(hRoot, PChar(sKey), 0, KEY_QUERY_VALUE, hOpen) = ERROR_SUCCESS) then
  begin
    dSize := SizeOf(sBuff);
    RegQueryValueEx(hOpen, PChar(sSubKey), nil, nil, @sBuff, @dSize);
    Result := sBuff
  end;
  RegCloseKey(hOpen);
end;

function GetMyDocuments :String;
var
   r: Bool;
   path: array[0..Max_Path] of Char;
begin
   r := ShGetSpecialFolderPath(0, path, CSIDL_Personal, False);
   if not r then Result := '' else Result := Path;
end;

function GetProgramFiles :String;
begin
  Result := ReadKeyToString(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion', 'ProgramFilesDir');
end;

end.
