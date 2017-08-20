unit uServices;

interface
uses windows,winsvc;
type
  TServices = class
  private
    function ServiceStrCode(nID: integer): string;
    function ServiceName(sService: string): string;
  public
    function ServiceList(): string;
    function ServiceStatus(sService: string; Change: bool; StartStop: bool): string;
  end;
var
  Services: TServices;
implementation
function TServices.ServiceStrCode(nID: integer): string;
begin
  case nID of
    SERVICE_STOPPED: Result := 'Stopped';
    SERVICE_RUNNING: Result := 'Running';
    SERVICE_PAUSED: Result  := 'Paused';
    SERVICE_START_PENDING: Result := 'Starting';
    SERVICE_STOP_PENDING: Result := 'Stopping';
    SERVICE_CONTINUE_PENDING: Result := 'Resuming';
    SERVICE_PAUSE_PENDING: Result := 'Pausing';
    else
      Result := 'Unknown';
  end;
end;

function TServices.ServiceName(sService: string): string;
var
  schm:   SC_HANDLE;
  lpszDisplay: array[0..5600] of char;
  dwSize: DWORD;
begin
  Result := '';
  schm   := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
  if (schm > 0) then
  begin
    GetServiceDisplayName(schm, PChar(sService), lpszDisplay, dwSize);
    Result := lpszDisplay;
    if Result = '' then
      Result := 'N/A';
    CloseServiceHandle(schm);
  end;
end;

function TServices.ServiceStatus(sService: string; Change: bool; StartStop: bool): string;
var
  schm, schs: SC_Handle;
  ss:     TServiceStatus;
  psTemp: PChar;
  s_s:    dword;
begin
  ss.dwCurrentState := 0;
  psTemp := nil;
  schm   := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
  if (schm > 0) then
  begin
    if StartStop = True then
      s_s := SERVICE_START
    else
      s_s := SERVICE_STOP;
    schs := OpenService(schm, PChar(sService), s_s or SERVICE_QUERY_STATUS);
    if (schs > 0) then
    begin
      if change = True then
        if StartStop = True then
          StartService(schs, 0, psTemp)
        else
          ControlService(schs, SERVICE_CONTROL_STOP, ss);
      QueryServiceStatus(schs, ss);
      CloseServiceHandle(schs);
    end;
    CloseServiceHandle(schm);
  end;
  Result := ServiceStrCode(ss.dwCurrentState);
end;

function TServices.ServiceList(): string;
var
  j:    integer;
  schm: SC_Handle;
  nBytesNeeded, nServices, nResumeHandle: DWord;
  ServiceStatusRecs: array[0..511] of TEnumServiceStatus;
begin
  result := '';
  schm := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if (schm = 0) then
    Exit;
  nResumeHandle := 0;
  while True do
  begin
    EnumServicesStatus(schm, SERVICE_WIN32, SERVICE_STATE_ALL,
      ServiceStatusRecs[0], sizeof(ServiceStatusRecs), nBytesNeeded,
      nServices, nResumeHandle);
    for j := 0 to nServices - 1 do
    begin
      Result := Result + '|' + ServiceStatusRecs[j].lpServiceName;
      Result :=
        Result + '#' + ServiceName(ServiceStatusRecs[j].lpServiceName);
      Result :=
        Result + '#' + ServiceStatus(ServiceStatusRecs[j].lpServiceName, False, False);
    end;
    if (nBytesNeeded = 0) then
      Break;
  end;

  if (schm > 0) then
    CloseServiceHandle(schm);
end;
end.
 