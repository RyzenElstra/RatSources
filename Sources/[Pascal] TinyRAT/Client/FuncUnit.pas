unit FuncUnit;

interface

uses
  Windows;

function IntToStr(I: DWORD): String;
function StrToInt(S: String): DWORD;
function HexToInt(S: String): DWORD;
function IntToHex( Value : DWord; Digits : Integer ) : String;

function StrCmp(String1, String2: string): Boolean;
function StrPCopy(Dest: PChar; const Source: string): PChar;

function ExtractFileName(FileName: string): string;
function ExtractURLName(FileName: string): string;

function GetPcUserName(I: Integer): String;
function GetSetupPathEx(I: Integer): String;

procedure AddStrToReg(RootKey: HKEY; const StrPath, StrName, StrData: PChar);
procedure DelStrToReg(RootKey: HKEY; const StrPath, StrName: PChar);

procedure GetDebugPrivs;
function CreatedMutexEx(MutexName: Pchar): Boolean;

implementation

function IntToStr(I: DWORD): String;
begin
  Str(I, Result);
end;

function StrToInt(S: String): DWORD;
begin
  Val(S, Result, Result);
end;

function HexToInt(S: String): DWORD;
begin
  Val('$' + S, Result, Result);
end;


function IntToHex( Value : DWord; Digits : Integer ) : String;
asm     // EAX = Value
        // EDX = Digits
        // ECX = @Result

  PUSH      0
  ADD       ESP, -0Ch

  PUSH      EDI
  PUSH      ECX

  LEA       EDI, [ESP+8+0Fh]  // EBX := @Buf[ 15 ]
  {$IFDEF SMALLEST_CODE}
  {$ELSE}
  AND       EDX, $F
  {$ENDIF}

@@loop:
  DEC       EDI
  DEC       EDX

  PUSH      EAX
  {$IFDEF PARANOIA}
  DB $24, $0F
  {$ELSE}
  AND       AL, 0Fh
  {$ENDIF}

  {$IFDEF oldcode}

  {$IFDEF PARANOIA}
  DB $3C, 9
  {$ELSE}
  CMP       AL, 9
  {$ENDIF}
  JA        @@10
  {$IFDEF PARANOIA}
  DB $04, 30h-41h+0Ah
  {$ELSE}
  ADD       AL,30h-41h+0Ah
  {$ENDIF}

@@10:
  {$IFDEF PARANOIA}
  DB $04, 41h-0Ah
  {$ELSE}
  ADD       AL,41h-0Ah
  {$ENDIF}

  {$ELSE newcode}
  AAM
  DB $D5, $11 //AAD
  ADD      AL, $30
  {$ENDIF newcode}


        //MOV       byte ptr [EDI], AL
  STOSB
  DEC       EDI
  POP       EAX
  SHR       EAX, 4

  JNZ       @@loop
  TEST      EDX, EDX
  JG        @@loop
  POP       EAX      // EAX = @Result
  MOV       EDX, EDI // EDX = @resulting string
  CALL      System.@LStrFromPChar

  POP       EDI
  ADD       ESP, 10h
end;

//比较两个字符串---不区分大小写
function StrCmp(String1, String2: string): Boolean;
begin
  Result := lstrcmpi(Pchar(String1), Pchar(String2)) = 0;
end;

//  Copy字符串
function StrPCopy(Dest: PChar; const Source: string): PChar;
begin
  Result := lstrcpyn(Dest, PChar(Source), 255);
end;

//获取文件名
function ExtractFileName(FileName: string): string;
begin
  while Pos('\', FileName) <> 0 do Delete(FileName, 1, Pos('\', FileName));
  Result := FileName;
end;

//获取文件名
function ExtractURLName(FileName: string): string;
begin
  while Pos('/', FileName) <> 0 do Delete(FileName, 1, Pos('/', FileName));
  Result := FileName;
end;

//  获取用户名
function GetPcUserName(I: Integer): String;
var
  szBuffer: Array[0..MAX_PATH - 1] of char;
  dwSize: DWORD;
begin
  dwSize := MAX_COMPUTERNAME_LENGTH + 1;
  ZeroMemory(@szBuffer, MAX_PATH);
  if I = 0 then
  begin
    if Not GetUserName(@szBuffer, dwSize) then GetUserName(@szBuffer, dwSize);
  end else
  begin
    if Not GetComputerName(@szBuffer, dwSize) then GetComputerName(@szBuffer, dwSize);
  end;
  Result := String(szBuffer);
end;

function GetSetupPathEx(I: Integer): String;
var
  szBuffer: Array[0..MAX_PATH - 1] of char;
begin
  ZeroMemory(@szBuffer, MAX_PATH);
  Case I of
    0:
    begin
      GetWindowsDirectory(szBuffer, MAX_PATH);
      Result := String(szBuffer) + '\';
    end;

    1:
    begin
      GetSystemDirectory(szBuffer, MAX_PATH);
      Result := String(szBuffer) + '\';
    end;

    2:
    begin
      GetTempPath(MAX_PATH, szBuffer);
      Result := String(szBuffer);
    end;
  end;
end;

//获取计算机名
function GetPcName: String;
var
  szBuffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  FillChar(szBuffer, Size, #0);
  GetComputerName(szBuffer, Size);
  Result := String(szBuffer);
end;

//写入注册表数据
procedure AddStrToReg(RootKey: HKEY; const StrPath, StrName, StrData: PChar);
var
  TempKey: HKEY;
  Disposition, DataSize: LongWord;
begin
  TempKey := 0;
  Disposition := REG_CREATED_NEW_KEY;
  RegCreateKeyEx(RootKey, StrPath, 0, nil, 0, KEY_ALL_ACCESS, nil, TempKey, @Disposition);
  DataSize := Length(StrData) + 1;
  RegSetValueEx(TempKey, StrName, 0, REG_SZ, StrData, DataSize);
  RegCloseKey(TempKey);
end;

//  删除注册表数据
procedure DelStrToReg(RootKey: HKEY; const StrPath, StrName: PChar);
var
  TempKey: HKEY;
  Disposition: LongWord;
begin
  TempKey := 0;
  Disposition := REG_OPENED_EXISTING_KEY;
  RegCreateKeyEx(RootKey, StrPath, 0, nil, 0, KEY_ALL_ACCESS, nil, TempKey, @Disposition);
  RegDeleteValue(TempKey, StrName);
  RegCloseKey(TempKey);
end;

procedure GetDebugPrivs;
var
  hToken: THandle;
  tkp: TTokenPrivileges;
  retval: dword;
begin
  If (OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken)) then
  begin
    LookupPrivilegeValue(nil, 'SeDebugPrivilege', tkp.Privileges[0].Luid);
    tkp.PrivilegeCount := 1;
    tkp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
    AdjustTokenPrivileges(hToken, False, tkp, 0, nil, retval);
  end;
end;

function CreatedMutexEx(MutexName: Pchar): Boolean;
var
  MutexHandle: dword;
begin
  MutexHandle := CreateMutex(nil, True, MutexName);
  if MutexHandle <> 0 then
  begin
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      //CloseHandle(MutexHandle);
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

end.
