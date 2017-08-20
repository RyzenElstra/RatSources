unit UnitTasksManager;

interface

uses
  Windows, WinSvc, SysUtils, TlHelp32, PsAPI, UnitFunctions, UnitRegistryManager;

function ListServices: string;
function ListProcess: string;
function ListProcessModules(Pid: integer): string;
function ListPrograms: string;
function ListAllWindows: string;
function ListWindows: string;
function ResumeProcess(Pid: integer): Boolean;
function SuspendProcess(Pid: integer): Boolean;
function KillProcess(Pid: String): Boolean;
function StopService(ServiceName: string): Boolean;
function xStartService(ServiceName: string): Boolean;
function RemoveService(ServiceName: string): Boolean;
function InstallService(ServiceName, DisplayName, FileName, Desc: string;
  StartType: integer): Boolean;
function EditService(ServiceName, DisplayName, FileName, Desc: string;
  StartType: Integer): Boolean;
procedure ShakeWindow(wHandle: THandle; const SHAKETIMES: Integer);
function SetProcessPriority(dwPID: DWORD; StrClass: string): Boolean;

implementation
                     
type
  P_TokenUser = ^User;
  User = record
    Userinfo: TSidAndAttributes;
  end;
  tUser = User;

const
  THREAD_TERMINATE            = ($0001);
  THREAD_SUSPEND_RESUME       = ($0002);
  THREAD_GET_CONTEXT          = ($0008);
  THREAD_SET_CONTEXT          = ($0010);
  THREAD_SET_INFORMATION      = ($0020);
  THREAD_QUERY_INFORMATION    = ($0040);
  THREAD_SET_THREAD_TOKEN     = ($0080);
  THREAD_IMPERSONATE          = ($0100);
  THREAD_DIRECT_IMPERSONATION = ($0200);
  THREAD_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE or $3FF);

  function OpenThread(dwDesiredAccess: DWORD; bInheritHandle: BOOL; dwThreadId: DWORD): THandle; stdcall; external kernel32 Name 'OpenThread';
                                                    
var
  Windowslist: string = '';

function ProcessPriority(PID: Cardinal):string;
var
  ProcessHandle: THandle;
  pClass: Cardinal;
begin
  ProcessHandle  := OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ, FALSE, PID);
  pClass := GetPriorityClass(ProcessHandle);
  if pClass = NORMAL_PRIORITY_CLASS then Result := 'Normal' else
  if pClass = IDLE_PRIORITY_CLASS then Result := 'Idle' else
  if pClass = HIGH_PRIORITY_CLASS then Result := 'Alto' else
  if pClass = REALTIME_PRIORITY_CLASS then Result := 'Real Time' else Result := '-';
  CloseHandle(ProcessHandle);
end;

function GetProcessMemoryUsage(PID: cardinal): Cardinal;
var
  l_nWndHandle, l_nProcID, l_nTmpHandle: HWND;
  l_pPMC: PPROCESS_MEMORY_COUNTERS;
  l_pPMCSize: Cardinal;
begin
  result := 0;
  l_pPMCSize := SizeOf(PROCESS_MEMORY_COUNTERS);
  GetMem(l_pPMC, l_pPMCSize);
  l_pPMC^.cb := l_pPMCSize;
  l_nTmpHandle := OpenProcess(PROCESS_ALL_ACCESS, False, PID);
  try
    if (GetProcessMemoryInfo(l_nTmpHandle, l_pPMC, l_pPMCSize)) then
      Result := l_pPMC^.WorkingSetSize
    else Result := 0;
  except
  end;
  FreeMem(l_pPMC);
end;

function ListProcess: string;
var
  User, Domain, Location: string;
  proc: TProcessEntry32;
  mCreationTime, mExitTime,
  mKernelTime, mUserTime: _FILETIME;
  snap: THandle;
  HToken: THandle;
  rLength: Cardinal;
  ProcUser: P_Tokenuser;
  snu: SID_NAME_USE;
  ProcessHandle: THandle;
  UserSize, DomainSize: DWORD;
  bSuccess: Boolean;
  Buf: array[0..MAX_PATH] of char;
  Usage: Cardinal;
  CreationTime: string;
begin
  SetTokenPrivileges('SeDebugPrivilege');
  snap := CreateToolHelp32SnapShot(TH32CS_SNAPALL, 0);
  proc.dwSize := SizeOf(TProcessEntry32);

  Process32First(snap, proc);
  repeat
    ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or  PROCESS_VM_READ, False, proc.th32ProcessID);

    Location := '-';
    if GetModuleFileNameEx(ProcessHandle, 0, Buf, MAX_PATH) > 0 then Location := Buf;
    if GetProcessTimes(Processhandle, mCreationTime, mExitTime, mKernelTime, mUserTime) then
      CreationTime := GetCreationTime(mCreationtime);

    if OpenProcessToken(ProcessHandle, TOKEN_QUERY, hToken) then
    begin
      bSuccess := GetTokenInformation(hToken, TokenUser, nil, 0, rLength);
      ProcUser  := nil;

      while (not bSuccess) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) do
      begin
        ReallocMem(ProcUser,rLength);
        bSuccess := GetTokenInformation(hToken, TokenUser, ProcUser, rLength, rLength);
      end;
      CloseHandle(hToken);

      UserSize := 0;
      DomainSize := 0;
      LookupAccountSid(nil, ProcUser.Userinfo.Sid, nil, UserSize, nil, DomainSize, snu);
      if (UserSize <> 0) and (DomainSize <> 0) then
      begin
        SetLength(User, UserSize);
        SetLength(Domain, DomainSize);
        if LookupAccountSid(nil, ProcUser.Userinfo.Sid, PChar(User), UserSize, PChar(Domain), DomainSize, snu) then
        begin
          User := PChar(User);
          Domain := PChar(Domain);
        end;
      end;
      FreeMem(ProcUser);
    end;
    CloseHandle(ProcessHandle);

    if User = '' then User := '-';
    if Domain = '' then Domain := '-';
    if CreationTime = '' then CreationTime := '-';

    Result := Result + inttostr(Proc.th32ProcessID) + '|';
    if Proc.szExeFile = '' then Result := Result + '-|' else
      Result := Result + Proc.szExeFile + '|';
    Result := Result + User + '/' + Domain + '|';
    Result := Result + IntToStr(proc.cntThreads) + '|';
    Result := Result + ProcessPriority(Proc.th32ProcessID) + '|';
    Result := Result + IntToStr(GetProcessMemoryUsage(proc.th32ProcessID)) + '|';
    Result := Result + CreationTime + '|';
    Result := Result + Location + '|' + #13#10;
  until not Process32Next(snap, proc);

  CloseHandle(snap);
end;

//From Aero-RAT
function ListProcessModules(Pid: integer): string;
var
  Module32: TModuleEntry32;
  ModuleSnapshot: THandle;
begin
  SetTokenPrivileges('SeDebugPrivilege');
  ModuleSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPMODULE, Pid);
  Module32.dwSize := SizeOf(TModuleEntry32);
  Module32First(ModuleSnapshot, Module32);
  repeat Result := Result + Module32.szExePath + '|';
  until not Module32Next(ModuleSnapshot, Module32);
  CloseHandle(ModuleSnapshot);
end;

function SuspendProcess(Pid: integer): Boolean;
var
  Thread32: TThreadEntry32;
  ThreadSnapshot: THandle;
  ThreadHandle: THandle;
begin
  Result := False;
  ThreadSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPTHREAD, Pid);
  Thread32.dwSize := SizeOf(TThreadEntry32);
  Thread32First(ThreadSnapshot, Thread32);
  repeat
    if Thread32.th32OwnerProcessID = Pid then
    begin
      ThreadHandle := OpenThread(THREAD_ALL_ACCESS,False,Thread32.th32ThreadID);
      if ThreadHandle <> INVALID_HANDLE_VALUE then
      begin
        Result := True;
        SuspendThread(ThreadHandle);
        CloseHandle(ThreadHandle);
      end;
    end;
  until not (Thread32Next(ThreadSnapshot, Thread32));

  CloseHandle(ThreadSnapshot);
end;

function ResumeProcess(Pid: integer): Boolean;
var
  Thread32: TThreadEntry32;
  ThreadSnapshot: THandle;
  ThreadHandle: THandle;
begin
  Result := False;
  ThreadSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPTHREAD, Pid);
  Thread32.dwSize := SizeOf(TThreadEntry32);
  Thread32First(ThreadSnapshot, Thread32);
  repeat
    if Thread32.th32OwnerProcessID = Pid then
    begin
      ThreadHandle := OpenThread(THREAD_ALL_ACCESS,False,Thread32.th32ThreadID);
      if ThreadHandle <> INVALID_HANDLE_VALUE then
      begin
        Result := True;
        ResumeThread(ThreadHandle);
        CloseHandle(ThreadHandle);
      end;
    end;
  until not (Thread32Next(ThreadSnapshot, Thread32));

  CloseHandle(ThreadSnapshot);
end;
       
function KillProcess(Pid: String): Boolean;
var
  ProcessHandle :THandle;
begin
  ProcessHandle := OpenProcess(PROCESS_TERMINATE, BOOL(0), StrToInt(Pid));
  Result := TerminateProcess(ProcessHandle, 0);
end;

//By steve10120, modified by wrh1d3 :)
function SetProcessPriority(dwPID: DWORD; StrClass: string): Boolean;
var
  hOpen: THandle;
  pClass: Cardinal;
begin
  Result := False;
  SetTokenPrivileges('SeDebugPrivilege');
  if StrClass = 'Normal' then pClass := NORMAL_PRIORITY_CLASS else
  if StrClass = 'Idle' then pClass := IDLE_PRIORITY_CLASS else
  if StrClass = 'Alto' then pClass := HIGH_PRIORITY_CLASS else
  if StrClass = 'Real Time' then pClass := REALTIME_PRIORITY_CLASS else Exit;
  hOpen := OpenProcess(PROCESS_SET_INFORMATION, FALSE, dwPID);
  if hOpen <> 0 then Result := SetPriorityClass(hOpen, pClass);
  CloseHandle(hOpen);
end;

function GetValue(SubKey, Value: string): string;
begin
  try Result := ReadKeyString(HKEY_LOCAL_MACHINE, PChar(SubKey), PChar(Value), '');
  except Result := '';
  end;
end;

function ListPrograms: string;
var
  dwIndex, lpcbName: DWORD;
  phkResult: HKEY;
  lpName: Array[0..MAX_PATH] of Char;
  DisplayName, Version, UninstallCmd,
  sUninstallCmd, InstallDate, Publisher: string;
  pSize: Integer;
begin
  Result := '';

  if RegOpenKeyEx(HKEY_LOCAL_MACHINE, PChar('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'),
    0, KEY_READ, phkResult) <> ERROR_SUCCESS
  then Exit;
                
  dwIndex := 0;
  lpcbName := sizeof(lpName);
  ZeroMemory(@lpName, sizeof(lpName));
  
  while RegEnumKeyEx(phkResult, dwIndex, @lpName, lpcbName, nil, nil, nil, nil) <> ERROR_NO_MORE_ITEMS do
  begin
    DisplayName := GetValue('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+ lpName, 'DisplayName');
    Version := GetValue('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+ lpName, 'DisplayVersion');
    InstallDate := GetValue('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+ lpName, 'InstallDate');
    UninstallCmd := GetValue('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+ lpName, 'UninstallString');
    sUninstallCmd := GetValue('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+ lpName, 'QuietUninstallString');
    Publisher := GetValue('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'+ lpName, 'Publisher');
    pSize :=  ReadKeyDword(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + lpName, 'EstimatedSize');

    if sUninstallCmd = '' then sUninstallCmd := '-';
    if DisplayName <> '' then
    begin
      Result := Result + DisplayName + '|';
      Result := Result + Version + '|';
      Result := Result + IntToStr(pSize) + '|';  
      Result := Result + InstallDate + '|';
      Result := Result + Publisher + '|';
      Result := Result + UninstallCmd + '|';
      Result := Result + sUninstallCmd + '|' + #13#10;
    end;

    ZeroMemory(@lpName, sizeof(lpName));
    lpcbName := sizeof(lpName);
    inc(dwIndex);
  end;
  
  RegCloseKey(phkResult);
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
   
function EditService(ServiceName, DisplayName, FileName, Desc: string;
  StartType: Integer): Boolean;
var
  SCManager: SC_Handle;
  Service: SC_Handle;
begin
  Result := false;
  if (Trim(ServiceName) = '') and not FileExists(PChar(Filename)) then Exit;

  SetTokenPrivileges('SeDebugPrivilege');
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  try
    Service := OpenService(SCManager,PChar(ServiceName),SERVICE_CHANGE_CONFIG);
    Result := ChangeServiceConfig(Service, SERVICE_NO_CHANGE, StartType,
       SERVICE_NO_CHANGE,PChar(FileName), nil, nil, nil, nil, nil, PChar(DisplayName));
    if Result = True then
    CreateKeyString(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\' + ServiceName + '\', 'Description', Desc);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

function InstallService(ServiceName, DisplayName, FileName, Desc: string;
  StartType: integer): Boolean;
var
  SCManager: SC_Handle;
begin
  Result := false;
  if (Trim(ServiceName) = '') and not FileExists(PChar(Filename)) then Exit;

  SetTokenPrivileges('SeDebugPrivilege');
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  try
    Result := CreateService(SCManager, PChar(ServiceName), PChar(DisplayName),
      SERVICE_ALL_ACCESS, SERVICE_WIN32_OWN_PROCESS, STartType,
      SERVICE_ERROR_IGNORE, PChar(FileName), nil, nil, nil, nil, nil) <> 0;
    if Result = True then
    begin
      Result := EditService(ServiceName, DisplayName, FileName, Desc, StartType);
      xStartService(ServiceName);
    end;
  finally
    CloseServiceHandle(SCManager);
  end;
end;

function RemoveService(ServiceName: string): Boolean;
var
  SCManager: SC_Handle;
  Service: SC_Handle;
  Status: TServiceStatus;
begin
  Result := False;
  SetTokenPrivileges('SeDebugPrivilege');
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then
  begin
    CloseServiceHandle(SCManager);
    Exit;
  end;
  try
    Service := OpenService(SCManager, PChar(ServiceName), SERVICE_ALL_ACCESS);
    ControlService(Service, SERVICE_CONTROL_STOP, Status);
    Result := DeleteService(Service);
    CloseServiceHandle(Service);
  finally
    CloseServiceHandle(SCManager);
    DelRegKey('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\', ServiceName);
  end;
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
    Result := '-';
  end;
end;

function ServiceStartup(Code: Integer): string;
begin
  case Code of
    2: Result := 'Automatic';
    3: Result := 'Manual';
    4: Result := 'Disable';
  else
    Result := '-';
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
    Result := Result + ServiceStartup(ReadKeyDword(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\' + ServiceStatus[j].lpServiceName, 'Start')) + '|';
    Result := Result + ServiceStatus[j].lpDisplayName + '|';
    Result := Result + ReadKeyString(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\' + ServiceStatus[j].lpServiceName, 'ImagePath', '') + '|' + #13#10;
  end;

  CloseServiceHandle(schm);
end;

function WindowState(hwnd: HWND): string;
begin
  Result := 'Normal';
  if IsIconic(hwnd) then Result := 'Minimized';
  if IsZoomed(hwnd) then Result := 'Maximized';
end;

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

procedure ShakeWindow(wHandle: THandle; const SHAKETIMES: Integer);
const
   MAXDELTA = 5;
var
   oRect, wRect :TRect;
   deltax : integer;
   deltay : integer;
   cnt : integer;
   dx, dy : integer;
begin
   //remember original position
   GetWindowRect(wHandle, wRect) ;
   oRect := wRect;

   Randomize;
   for cnt := 0 to SHAKETIMES do
   begin
     deltax := Round(Random(MAXDELTA)) ;
     deltay := Round(Random(MAXDELTA)) ;
     dx := Round(1 + Random(2)) ;
     if dx = 2 then dx := -1;
     dy := Round(1 + Random(2)) ;
     if dy = 2 then dy := -1;
     OffsetRect(wRect,dx * deltax, dy * deltay) ;
     MoveWindow(wHandle, wRect.Left,wRect.Top,wRect.Right - wRect.Left,wRect.Bottom - wRect.Top,true) ;
   end;
   //return to start position
   MoveWindow(wHandle, oRect.Left,oRect.Top,oRect.Right - oRect.Left,oRect.Bottom - oRect.Top,true) ;
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
      if Title = '' then Title := '[Untilted]';
      Windowslist := Windowslist + Title + '|' + WindowState(Hwnd) + '|' +
        WindowVisibility(Hwnd) + '|' + IntToStr(Hwnd) + '|' +
        IntToStr(HandleToPid(Hwnd)) + '|' + PidToPath(HandleToPid(Hwnd)) + '|' + #13#10;
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
      if Title = '' then Title := '[Untilted]';
      if IsWindowVisible(Hwnd) then                                          
      begin
        Windowslist := Windowslist + Title + '|' + WindowState(Hwnd) + '|' + 'Yes' + '|' +
          IntToStr(Hwnd) + '|' + IntToStr(HandleToPid(Hwnd)) + '|' +
          PidToPath(HandleToPid(Hwnd)) + '|' + #13#10;
      end;

      Result := true;
    end;
  end;
begin
  Windowslist := '';
  EnumWindows(@EnumWindowProc, 0);
  Result := Windowslist;
end;

end.
