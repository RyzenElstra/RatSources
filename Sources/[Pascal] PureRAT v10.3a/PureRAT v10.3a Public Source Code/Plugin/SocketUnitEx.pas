{
  ---------------------------------------------------

  SocketUnitEx.pas v1.5 [moded by wrh1d3]
	Original unit by Aphex -> unremote@knology.net
	Modified by wrh1d3 -> wrh1d3@gmail.com

  ---------------------------------------------------
}

unit SocketUnitEx;

interface

uses
  Windows, Winsock, UnitConstants, UnitConfiguration, UnitEncryption, UnitFunctions;

type
  TClientSocket = class(TObject)
  private
		FSocket: TSocket;
    FConnected: Boolean;
  public
    constructor Create;
    procedure Connect(Host: string; Port: Word);                                           
    procedure Disconnect;
    function LocalAddress: string;
    function RemotePort: Word;
    function SendBuffer(var Buffer; BufferSize: Integer): Integer;
    function RecvBuffer(var Buffer; BufferSize: Integer): Integer;
    function SendText(Text: string): Integer;
    function SendDatas(Datas: string): Integer;
    function RecvDatas: string;
    property Socket: TSocket read FSocket write FSocket;
    property Connected: Boolean read FConnected;
  end;
             
implementation

var
	WSAData: TWSAData;

constructor TClientSocket.Create;
begin    
	inherited Create;
  FSocket := INVALID_SOCKET;
  FConnected := False;
end;

procedure TClientSocket.Connect(Host: string; Port: Word);
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
begin
  FSocket := WinSock.socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
  if FSocket = INVALID_SOCKET then Exit;

  SockAddrIn.sin_family := PF_INET;
	SockAddrIn.sin_port := htons(Port);
  SockAddrIn.sin_addr.S_addr := inet_addr(PChar(Host));

	if SockAddrIn.sin_addr.s_addr = INADDR_NONE then
  begin
    HostEnt := gethostbyname(PChar(Host));
    if HostEnt = nil then Exit;
    SockAddrIn.sin_addr.s_addr := Longint(PLongint(HostEnt^.h_addr_list^)^);
  end;
	                                   
  if WinSock.connect(FSocket, SockAddrIn, SizeOf(SockAddrIn)) = 0 then FConnected := True;
end;

procedure TClientSocket.Disconnect;
begin
  shutdown(FSocket, SD_BOTH);
  if FSocket <> INVALID_SOCKET then closesocket(FSocket);
  FConnected := False;
end;

function TClientSocket.LocalAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: integer;
begin
  Size := sizeof(SockAddrIn);
  getsockname(FSocket, SockAddrIn, Size);
  Result := inet_ntoa(SockAddrIn.sin_addr);
end;

function TClientSocket.RemotePort: Word;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := sizeof(SockAddrIn);
  getpeername(FSocket, SockAddrIn, Size);
  Result := ntohs(SockAddrIn.sin_port);
end;
       
function TClientSocket.SendBuffer(var Buffer; BufferSize: Integer): Integer;
begin
  Result := send(FSocket, Buffer, BufferSize, 0);
end;

function TClientSocket.RecvBuffer(var Buffer; BufferSize: Integer): Integer;
begin
  Result := recv(FSocket, Buffer, BufferSize, 0);
end;

function TClientSocket.SendText(Text: string): Integer;
begin                                   
  Result := -1;
  if (not FConnected) or (Text = '') then Exit;
  Result := SendBuffer(Pointer(Text)^, Length(Text));
end;

function TClientSocket.SendDatas(Datas: string): Integer;
begin
  Datas := EncryptDatas(Datas, _Password);
  Result := SendText(Datas);
end;

function TClientSocket.RecvDatas: string;
var
  Buffer: array[0..32767] of Byte; //TODO: Update SocketUnitEx to version 1.7
  bRecv: Integer;
begin
  bRecv := 0;
  Result := '';
  if FConnected = False then  Exit;
  ZeroMemory(@Buffer[0], SizeOf(Buffer));
  bRecv := RecvBuffer(Buffer[0], SizeOf(Buffer));
  if bRecv <= 0 then Exit;
  SetLength(Result, bRecv);
  MoveMemory(@Result[1], @Buffer[0], bRecv);
  Result := DecryptDatas(Result, _Password);
end;

initialization
  WSAStartup($101, WSAData);

finalization
  WSACleanup();

end.

