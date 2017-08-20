unit UnitFunctions;

interface

uses
  Windows, SysUtils, ShellAPI;

function WriteResData(sServerFile: string; pFile: pointer; Size: integer; Name: string): Boolean;
function FileToStr(Filename: string): string;
function MyGetFileSize(Filename: string): Int64;
function FileSizeToStr(Bytes: LongInt): string;
function MyBoolToStr(TmpBool: Boolean): string;
function MyStrToBool(TmpStr: string): Boolean;
function FileIconInit(FullInit: BOOL): BOOL; stdcall;
function GetImageIndex(FileName: string): integer;

implementation
      
function GetImageIndex(FileName: string): integer;
var
  SHFileInfo: TSHFileInfo;
begin
  result := - 1;
  try
    SHGetFileInfo(PChar(FileName), FILE_ATTRIBUTE_NORMAL, SHFileInfo,
      SizeOf(SHFileInfo), SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES or SHGFI_SYSICONINDEX);
    Result := SHFileInfo.iIcon;
  finally
    if Result <= 0 then result := - 1;
  end;
end;

function FileIconInit(FullInit: BOOL): BOOL; stdcall;
type
  TFileIconInit = function(FullInit: BOOL): BOOL; stdcall;
var
  PFileIconInit: TFileIconInit;
  ShellDLL: integer;
begin
  Result := False;
  if (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
    ShellDLL := LoadLibrary('Shell32.dll');
    PFileIconInit := GetProcAddress(ShellDLL, PChar(660));
    if (Assigned(PFileIconInit)) then Result := PFileIconInit(FullInit);
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

function MyGetFileSize(Filename: string): Int64;
var
  hFile: THandle;
begin
  hFile := CreateFile(pchar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL,0);
  Result := GetFileSize(hFile, nil);
  CloseHandle(hFile);
end;
   
function FileSizeToStr(Bytes: LongInt): string;
var
  dB, dKB, dMB, dGB, dT: Integer;
begin
  dB := Bytes;
  dKB := 0;
  dMB := 0;
  dGB := 0;
  dT  := 1;

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
    1: result := inttostr(dKB) + '.' + copy(inttostr(dB ),1,2) + ' Kb';
    2: result := inttostr(dMB) + '.' + copy(inttostr(dKB),1,2) + ' Mb';
    3: result := inttostr(dGB) + '.' + copy(inttostr(dMB),1,2) + ' Gb';
  end;
end;

//P0ke
function WriteResData(sServerFile: string; pFile: pointer; Size: Integer; Name: String): Boolean;
var
  hResourceHandle: THandle;
  pwServerFile: PWideChar;
  pwName: PWideChar;
begin
  GetMem(pwServerFile, (Length(sServerFile) + 1) *2);
  GetMem(pwName, (Length(Name) + 1) *2);
  try
    StringToWideChar(sServerFile, pwServerFile, Length(sServerFile) * 2);
    StringToWideChar(Name, pwName, Length(Name) * 2);
    hResourceHandle := BeginUpdateResourceW(pwServerFile, False);
    Result := UpdateResourceW(hResourceHandle, MakeIntResourceW(10), pwName, 0, pFile, Size);
    EndUpdateResourceW(hResourceHandle, False);
  finally
    FreeMem(pwServerFile);
    FreeMem(pwName);
  end;
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

end.