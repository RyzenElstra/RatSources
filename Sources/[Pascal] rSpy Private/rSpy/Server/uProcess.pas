unit uProcess;

interface

uses
  Windows, TlHelp32;

function KillProcess(const ProcessName : string) : boolean;

implementation

function KillProcess(const ProcessName : string) : boolean;
var ProcessEntry32 : TProcessEntry32;
    HSnapShot : THandle;
    HProcess : THandle;
begin
  Result := False;

  HSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if HSnapShot = 0 then exit;

  ProcessEntry32.dwSize := sizeof(ProcessEntry32);
  if Process32First(HSnapShot, ProcessEntry32) then
  repeat
    if (ProcessEntry32.szExeFile = ProcessName) then
    begin
      HProcess := OpenProcess(PROCESS_TERMINATE, False, ProcessEntry32.th32ProcessID);
      if HProcess <> 0 then
      begin
        Result := TerminateProcess(HProcess, 0);
        CloseHandle(HProcess);
      end;
      Break;
    end;
  until not Process32Next(HSnapShot, ProcessEntry32);

  CloseHandle(HSnapshot);
end;

end.
