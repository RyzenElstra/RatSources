unit UnitTasksManager;

interface

uses
  Windows, SysUtils, TlHelp32, PsAPI, WinSvc, UnitUtils;

function ListProcess: string;
function KillProcess(Pid: string): Boolean;     
function ListServices: string;
function ListAllWindows: string;  
function ListWindows: string;
function StopService(ServiceName: string): Boolean;
function xStartService(ServiceName: string): Boolean;

implementation

var
  Windowslist: string = '';

function HandleToPid(Handle: integer): integer;
var
  PID: dword;
begin
  GetWindowThreadProcessId(Handle,Pid);
  Result := Pid;
end;
       
function PidToPath(Pid: integer): string;
var
  ProcessHandle: THandle;
  Buf: array[0..MAX_PATH] of char;
begin
  ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or  PROCESS_VM_READ,   False,Pid);
  GetModuleFileNameEx(ProcessHandle,0,Buf,MAX_PATH);
  Result := String(Buf);
  CloseHandle(ProcessHandle);
end;

function WindowVisibility(hwnd: HWND): string;
begin
  if IsWindowVisible(hwnd) then Result := 'Yes' else Result := 'No';
end;

function ListAllWindows: string;
  function EnumWindowProc(Hwnd: HWND; i: integer): boolean; stdcall;
  var
    Title: string;
  begin
    if (Hwnd = 0) then result := false else
    begin
      SetLength(Title, 255);
      SetLength(Title, GetWindowText(Hwnd, PChar(Title), Length(Title)));

      Windowslist := Windowslist + IntToStr(Hwnd) + '|' + Title + '|' + WindowVisibility(Hwnd) + '|' +
        PidToPath(HandleToPid(Hwnd)) + '|' + #13#10;
      
      Result := True;
    end;
  end;
begin
  Windowslist := '';
  EnumWindows(@EnumWindowProc, 0);
  Result := Windowslist;
end;
      
function ListWindows: string;
  function EnumWindowProc(Hwnd: HWND; i: integer): boolean; stdcall;
  var
    Title: string;
  begin
    if (Hwnd = 0) then result := false else
    begin
      SetLength(Title, 255);
      SetLength(Title, GetWindowText(Hwnd, PChar(Title), Length(Title)));

      if IsWindowVisible(Hwnd) then
      begin
        Windowslist := Windowslist + IntToStr(Hwnd) + '|' + Title + '|Yes|' +
          PidToPath(HandleToPid(Hwnd)) + '|' + #13#10;
      end;
      
      Result := True;
    end;
  end;
begin
  Windowslist := '';
  EnumWindows(@EnumWindowProc, 0);
  Result := Windowslist;
end;

function ServiceState(Code: integer): string;
begin
  case Code of
    SERVICE_STOPPED: Result := 'Stopped';
    SERVICE_RUNNING: Result := 'Running';
    SERVICE_PAUSED: Result  := 'Paused';
    SERVICE_START_PENDING: Result := 'Starting';
    SERVICE_STOP_PENDING: Result := 'Stopping';
    SERVICE_CONTINUE_PENDING: Result := 'Resuming';
    SERVICE_PAUSE_PENDING: Result := 'Pausing';
  else
    Result := '';
  end;
end;

function ListServices: string;
var
  j: integer;
  schm: SC_Handle;
  nBytesNeeded, nServices, nResumeHandle: DWord;
  ServiceStatus: array[0..511] of TEnumServiceStatus;
begin
  result := '';
  schm := OpenSCManager(nil, nil, SC_MANAGER_CONNECT or SC_MANAGER_ENUMERATE_SERVICE);
  if schm = 0 then Exit;
  nResumeHandle := 0;

  EnumServicesStatus(schm, SERVICE_WIN32, SERVICE_STATE_ALL, ServiceStatus[0],
    sizeof(ServiceStatus), nBytesNeeded, nServices, nResumeHandle);

  for j := 0 to nServices - 1 do
  begin
    Result := Result + ServiceStatus[j].lpServiceName + '|';
    Result := Result + ServiceState(ServiceStatus[j].ServiceStatus.dwCurrentState) + '|';
    Result := Result + ServiceStatus[j].lpDisplayName + '|' + #13#10;
  end;

  CloseServiceHandle(schm);
end;

function StopService(ServiceName: string): Boolean;
var
  SCManager: SC_Handle;
  Service: SC_Handle;
  ServiceStatus: TServiceStatus;
begin
  Result := False;
  SetTokenPrivileges('SeDebugPrivilege');
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  try
    Service := OpenService(SCManager, PChar(ServiceName), SERVICE_ALL_ACCESS);
    Result := ControlService(Service, SERVICE_CONTROL_STOP, ServiceStatus);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

function xStartService(ServiceName: string): Boolean;
var
  SCManager: SC_Handle;
  Service: SC_Handle;
  ARgs: pchar;
begin
  Result := False;
  SetTokenPrivileges('SeDebugPrivilege');
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  try
    Service := OpenService(SCManager, PChar(ServiceName), SERVICE_ALL_ACCESS);
    Args := nil;
    Result := winsvc.StartService(Service, 0, ARgs);
  finally
    CloseServiceHandle(SCManager);
  end;
end;
      
function KillProcess(Pid: string): Boolean;
var
  ProcessHandle :THandle;
begin
  ProcessHandle := OpenProcess(PROCESS_TERMINATE, BOOL(0), StrToInt(Pid));
  Result := TerminateProcess(ProcessHandle, 0);
end;
  
function ListProcess: string;
var
  Location: string;
  proc: TProcessEntry32;
  snap: THandle;
  ProcessHandle: THandle;
  Buf: array[0..MAX_PATH] of char;
begin
  SetTokenPrivileges('SeDebugPrivilege');

  snap := CreateToolHelp32SnapShot(TH32CS_SNAPALL, 0);
  proc.dwSize := SizeOf(TProcessEntry32);

  Process32First(snap, proc);
  repeat
    ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or  PROCESS_VM_READ, False, proc.th32ProcessID);
    if GetModuleFileNameEx(ProcessHandle, 0, Buf, MAX_PATH) > 0 then Location := Buf;

    Result := Result + IntToStr(Proc.th32ProcessID) + '|';
    Result := Result + Proc.szExeFile + '|';
    Result := Result + Location + '|' + #13#10;
  until not Process32Next(snap, proc);

  CloseHandle(snap);
end;

end.
