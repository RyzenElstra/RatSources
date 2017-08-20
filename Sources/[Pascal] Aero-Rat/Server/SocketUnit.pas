unit SocketUnit;

interface

uses Windows, Winsock, CompressionStreamUnit;

type
  TClientSocket = class(TObject)
  private
    FAddress: pchar;
    FData: pointer;
    FTag: integer;
    FConnected: boolean;
    function GetLocalAddress: string;
    function GetLocalPort: integer;
    function GetRemoteAddress: string;
    function GetRemotePort: integer;
  protected
    FSocket: TSocket;
  public
    procedure Connect(Address: string; Port: integer);
    property Connected: boolean read FConnected;
    property Data: pointer read FData write FData;
    destructor Destroy; override;
    procedure Disconnect;
    procedure Idle(Seconds: integer);
    property LocalAddress: string read GetLocalAddress;
    property LocalPort: integer read GetLocalPort;
    function ReceiveBuffer(var Buffer; BufferSize: integer): integer;
    function ReceiveLength: integer;
    function ReceiveString: string;
    property RemoteAddress: string read GetRemoteAddress;
    property RemotePort: integer read GetRemotePort;
    function SendBuffer(var Buffer; BufferSize: integer): integer;
    function SendString(const Buffer: string): integer;
    function SendStream(AStream: TStream): Boolean;
    property Socket: TSocket read FSocket;
    property Tag: integer read FTag write FTag;
  end;

var
  WSAData: TWSAData;

var
  NewWSAStartup: function(wVersionRequired: word; var WSData: TWSAData): Integer; stdcall;
  NewWSACleanup: function: Integer; stdcall;
  NewWSAGetLastError: function: Integer; stdcall;
  Newgethostbyname: function(name: PChar): PHostEnt; stdcall;
  Newsocket: function(af, Struct, protocol: Integer): TSocket; stdcall;
  Newsend: function(s: TSocket; var Buf; len, flags: Integer): Integer; stdcall;
  Newrecv: function(s: TSocket; var Buf; len, flags: Integer): Integer; stdcall;
  Newntohs: function(netshort: u_short): u_short; stdcall;
  Newioctlsocket: function(s: TSocket; cmd: DWORD; var arg: u_long): Integer; stdcall;
  Newinet_ntoa: function(inaddr: TInAddr): PChar; stdcall;
  Newinet_addr: function(cp: PChar): u_long; stdcall;
  Newhtons: function(hostshort: u_short): u_short; stdcall;
  Newgetpeername: function(s: TSocket; var name: TSockAddr; var namelen: Integer): Integer; stdcall;
  Newgetsockname: function(s: TSocket; var name: TSockAddr; var namelen: Integer): Integer; stdcall;
  Newclosesocket: function(s: TSocket): Integer; stdcall;
  Newconnect: function(s: TSocket; var name: TSockAddr; namelen: Integer): Integer; stdcall;

implementation

procedure TClientSocket.Connect(Address: string; Port: integer);
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
begin
  Disconnect;
  FAddress := pchar(Address);
  FSocket := Newsocket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
  SockAddrIn.sin_family := AF_INET;
  SockAddrIn.sin_port := Newhtons(Port);
  SockAddrIn.sin_addr.s_addr := Newinet_addr(FAddress);
  if SockAddrIn.sin_addr.s_addr = INADDR_NONE then
  begin
    HostEnt := Newgethostbyname(FAddress);
    if HostEnt = nil then
    begin
      Exit;
    end;
    SockAddrIn.sin_addr.s_addr := Longint(PLongint(HostEnt^.h_addr_list^)^);
  end;
  NewConnect(FSocket, SockAddrIn, SizeOf(SockAddrIn));
  FConnected := True;
end;

procedure TClientSocket.Disconnect;
begin
  Newclosesocket(FSocket);
  FConnected := False;
end;

function TClientSocket.GetLocalAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: integer;
begin
  Size := sizeof(SockAddrIn);
  Newgetsockname(FSocket, SockAddrIn, Size);
  Result := Newinet_ntoa(SockAddrIn.sin_addr);
end;

function TClientSocket.GetLocalPort: integer;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := sizeof(SockAddrIn);
  Newgetsockname(FSocket, SockAddrIn, Size);
  Result := Newntohs(SockAddrIn.sin_port);
end;

function TClientSocket.GetRemoteAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := sizeof(SockAddrIn);
  Newgetpeername(FSocket, SockAddrIn, Size);
  Result := Newinet_ntoa(SockAddrIn.sin_addr);
end;

function TClientSocket.GetRemotePort: integer;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := sizeof(SockAddrIn);
  Newgetpeername(FSocket, SockAddrIn, Size);
  Result := Newntohs(SockAddrIn.sin_port);
end;

procedure TClientSocket.Idle(Seconds: integer);
var
  FDset: TFDset;
  TimeVal: TTimeVal;
begin
  if Seconds = 0 then
  begin
    FD_ZERO(FDSet);
    FD_SET(FSocket, FDSet);
    select(0, @FDset, nil, nil, nil);
  end
  else
  begin
    TimeVal.tv_sec := Seconds;
    TimeVal.tv_usec := 0;
    FD_ZERO(FDSet);
    FD_SET(FSocket, FDSet);
    select(0, @FDset, nil, nil, @TimeVal);
  end;
end;

function TClientSocket.ReceiveLength: integer;
begin
  Result := ReceiveBuffer(pointer(nil)^, -1);
end;

function TClientSocket.ReceiveBuffer(var Buffer; BufferSize: integer): integer;
begin
  if BufferSize = -1 then
  begin
    if Newioctlsocket(FSocket, FIONREAD, Longint(Result)) = SOCKET_ERROR then
    begin
      Result := SOCKET_ERROR;
      Disconnect;
    end;
  end
  else
  begin
     Result := Newrecv(FSocket, Buffer, BufferSize, 0);
     if Result = 0 then
     begin
       Disconnect;
     end;
     if Result = SOCKET_ERROR then
     begin
       Result := NewWSAGetLastError;
       if Result = WSAEWOULDBLOCK then
       begin
         Result := 0;
       end
       else
       begin
         Disconnect;
       end;
     end;
  end;
end;

function TClientSocket.ReceiveString: string;
begin
  SetLength(Result, ReceiveBuffer(pointer(nil)^, -1));
  SetLength(Result, ReceiveBuffer(pointer(Result)^, Length(Result)));
end;

function TClientSocket.SendBuffer(var Buffer; BufferSize: integer): integer;
var
  ErrorCode: integer;
begin
  Result := Newsend(FSocket, Buffer, BufferSize, 0);
  if Result = SOCKET_ERROR then
  begin
    ErrorCode := NewWSAGetLastError;
    if (ErrorCode = WSAEWOULDBLOCK) then
    begin
      Result := -1;
    end
    else
    begin
      Disconnect;
    end;
  end;
end;

function TClientSocket.SendString(const Buffer: string): integer;
begin
  Result := SendBuffer(pointer(Buffer)^, Length(Buffer));
end;

function TClientSocket.SendStream(AStream: TStream): Boolean;
var
  Buffer: array[0..32767] of Byte;
  StartPos: Integer;
  AmountInBuf: Integer;
  AmountSent: Integer;
  ErrorCode: Integer;
  FSendStream: TStream;
begin
  Result := False;
  FSendStream := AStream;
  if FSendStream <> nil then
  begin
    if (FSocket = INVALID_SOCKET) or (not FConnected) then exit;
    while True do
    begin
      StartPos := FSendStream.Position;
      AmountInBuf := FSendStream.Read(Buffer, SizeOf(Buffer));
      if AmountInBuf > 0 then
      begin
        AmountSent := send(FSocket, Buffer, AmountInBuf, 0);
        if AmountSent = SOCKET_ERROR then
        begin
          ErrorCode := WSAGetLastError;
          if ErrorCode <> WSAEWOULDBLOCK then
          begin
            Disconnect;
            Break;
          end else
          begin
            FSendStream.Position := StartPos;
            Break;
          end;
        end else if AmountInBuf > AmountSent then
          FSendStream.Position := StartPos + AmountSent
        else if FSendStream.Position = FSendStream.Size then
        begin
          Break;
        end;
      end else
      begin
        Break;
      end;
    end;
    Result := True;
  end;
end;

destructor TClientSocket.Destroy;
begin
  inherited Destroy;
  Disconnect;
end;

initialization
  loadlibrary('wsock32');

  NewWSAStartup := GetProcAddress(GetModuleHandle('wsock32'),'WSAStartup');
  NewWSACleanup := GetProcAddress(GetModuleHandle('wsock32'),'WSACleanup');
  NewWSAGetLastError := GetProcAddress(GetModuleHandle('wsock32'),'WSAGetLastError');
  Newgethostbyname := GetProcAddress(GetModuleHandle('wsock32'),'gethostbyname');
  NewSocket := GetProcAddress(GetModuleHandle('wsock32'),'socket');
  Newsend := GetProcAddress(GetModuleHandle('wsock32'),'send');
  Newrecv := GetProcAddress(GetModuleHandle('wsock32'),'recv');
  Newntohs := GetProcAddress(GetModuleHandle('wsock32'),'ntohs');
  Newioctlsocket := GetProcAddress(GetModuleHandle('wsock32'),'ioctlsocket');
  Newinet_ntoa := GetProcAddress(GetModuleHandle('wsock32'),'inet_ntoa');
  Newinet_addr := GetProcAddress(GetModuleHandle('wsock32'),'inet_addr');
  Newhtons := GetProcAddress(GetModuleHandle('wsock32'),'htons');
  Newgetpeername := GetProcAddress(GetModuleHandle('wsock32'),'getpeername');
  Newgetsockname := GetProcAddress(GetModuleHandle('wsock32'),'getsockname');
  Newclosesocket := GetProcAddress(GetModuleHandle('wsock32'),'closesocket');
  Newconnect := GetProcAddress(GetModuleHandle('wsock32'),'connect');

  NewWSAStartUp(257, WSAData);

finalization
  NewWSACleanup;

end.
