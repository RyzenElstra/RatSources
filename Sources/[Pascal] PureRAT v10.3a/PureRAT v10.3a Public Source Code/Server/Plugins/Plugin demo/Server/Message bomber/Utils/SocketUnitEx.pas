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
  Windows, Winsock, Classes, SysUtils;

type
  TClientSocket = class(TObject)
  private
		FSocket: TSocket;  
    FData: Pointer;
    FConnected: Boolean; 
  public
    constructor Create;
    procedure Connect(Host: string; Port: Word);
    destructor Destroy; override;  
    procedure SetConnection;
    procedure Disconnect;
    function LocalAddress: string;
		function RemoteAddress: string;
		function LocalPort: Word;
    function RemotePort: Word;
    function SendBuffer(var Buffer; BufferSize: Integer): Integer;
    function RecvBuffer(var Buffer; BufferSize: Integer): Integer;
    function SendText(const Text: string): Integer;
    function RecvText: string;
    function SendStream(Stream: TMemoryStream): Integer;
    function RecvStream(StreamSize: Int64; var Stream: TMemoryStream): Integer;
    function SendFile(Filename: string): Integer;
    function RecvFile(Filename: string; FileSize: Int64): Integer;
    property Socket: TSocket read FSocket write FSocket;
    property Data: Pointer read FData write FData;
    property Connected: Boolean read FConnected;
  end;

implementation

const 
  WSCKVER = $101; //Set winsock version here
	MIN_BUFF_SIZE = 2047;
  MAX_BUFF_SIZE = 8191;
  MAX_FILE_BUFF_SIZE = 32767;
	
var
	WSAData: TWSAData;

{Region TClientSocket}
//--Begin
constructor TClientSocket.Create;
begin    
	inherited Create;
  FSocket := INVALID_SOCKET;
  FConnected := False;
end;

destructor TClientSocket.Destroy;
begin
  inherited Destroy;
  Disconnect;
end;

//Set connection status without connecting to a server 
procedure TClientSocket.SetConnection;
begin
  if FSocket <> INVALID_SOCKET then FConnected := True else
  FConnected := False;
end;

//Set connection status by connecting to server
procedure TClientSocket.Connect(Host: string; Port: Word);
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
begin
  FSocket := WinSock.socket(AF_INET, SOCK_STREAM, 0); 
  if FSocket = INVALID_SOCKET then Exit; 

  SockAddrIn.sin_family := AF_INET;
	SockAddrIn.sin_port := htons(Port);
  SockAddrIn.sin_addr.S_addr := inet_addr(PChar(Host));

  //Resolving ip address
	if SockAddrIn.sin_addr.s_addr = INADDR_NONE then
  begin
    HostEnt := gethostbyname(PChar(Host));
    if HostEnt = nil then Exit;
    SockAddrIn.sin_addr.s_addr := Longint(PLongint(HostEnt^.h_addr_list^)^);
  end;
	                                   
  if WinSock.connect(FSocket, SockAddrIn, SizeOf(SockAddrIn)) = 0 then FConnected := True;
  //Set FConnected True only if connected
end;

//Clearing initialized variable and close connection
procedure TClientSocket.Disconnect;
begin
  shutdown(FSocket, SD_BOTH);
  closesocket(FSocket);
	FSocket := INVALID_SOCKET;
  FConnected := False;
end;

function TClientSocket.LocalAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := SizeOf(SockAddrIn);
  getsockname(FSocket, SockAddrIn, Size);
  Result := inet_ntoa(SockAddrIn.sin_addr);
end;

function TClientSocket.RemoteAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := SizeOf(SockAddrIn);
  getpeername(FSocket, SockAddrIn, Size);
  Result := inet_ntoa(SockAddrIn.sin_addr);
end;

function TClientSocket.LocalPort: Word;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := SizeOf(SockAddrIn);
  getsockname(FSocket, SockAddrIn, Size);
  Result := ntohs(SockAddrIn.sin_port);
end;

function TClientSocket.RemotePort: Word;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := SizeOf(SockAddrIn);
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

function TClientSocket.SendText(const Text: string): Integer;
begin
  Result := SendBuffer(Pointer(Text)^, Length(Text));
end;

function TClientSocket.RecvText: string;
var
  Buffer: array[0..MAX_BUFF_SIZE] of Char;
  bRecv: Integer;
begin
  bRecv := 0;
  Result := '';
  if not FConnected then Exit;
  ZeroMemory(@Buffer[0], SizeOf(Buffer));
  bRecv := RecvBuffer(Buffer[0], SizeOf(Buffer));
  if bRecv <= 0 then Exit;
  Result := string(Buffer);
end;

function TClientSocket.SendStream(Stream: TMemoryStream): Integer;
var
  Buffer: array[0..MIN_BUFF_SIZE] of Byte;
  bRead: Integer;
begin
  Result := -1;
  if FConnected = False then Exit;

  bRead := 0;
  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRead := Stream.Read(Buffer[0], SizeOf(Buffer));
    if bRead <= 0 then Break;
    Result := SendBuffer(Buffer[0], bRead);
    if Result <= 0 then Break;
  until bRead = 0;

  Stream.Free;
end;

function TClientSocket.RecvStream(StreamSize: Int64; var Stream: TMemoryStream): Integer;
var
  Buffer: array[0..MAX_BUFF_SIZE] of Byte;
  bRecv, iRecv: Integer;
begin
  Result := -1;
  if not FConnected then Exit;
             
  Stream := TMemoryStream.Create;
  bRecv := 0;
	iRecv := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRecv := RecvBuffer(Buffer[0], SizeOf(Buffer));
    if bRecv <= 0 then Break;
    Result := Stream.Write(Buffer[0], bRecv);
    if Result <= 0 then Break;
    iRecv := Stream.Size;
  until iRecv >= StreamSize;
end;

function TClientSocket.SendFile(Filename: string): Integer;
var
  FileStream: TFileStream;
  Buffer: array[0..MAX_FILE_BUFF_SIZE] of Byte;
  bRead: Integer;
begin
  Result := -1;
  if FConnected = False then Exit;

  FileStream := TFileStream.Create(Filename, fmOpenRead + fmShareDenyNone);
  bRead := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRead := FileStream.Read(Buffer[0], SizeOf(Buffer));
    if bRead <= 0 then Break;
    Result := SendBuffer(Buffer[0], bRead);
    if Result <= 0 then Break;
  until bRead = 0;

  FileStream.Free;
end;

function TClientSocket.RecvFile(Filename: string; FileSize: Int64): Integer;
var
  FileStream: TFileStream;
  Buffer: array[0..MAX_FILE_BUFF_SIZE] of Byte;
  bRecv, iRecv, i: Integer;
begin
  Result := -1;
  if FConnected = False then Exit;

  FileStream := TFileStream.Create(Filename, fmCreate);
  bRecv := 0;
	iRecv := 0;
	i := SizeOf(Buffer);

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
		if (Filesize - iRecv) >= i then bRecv := i else bRecv := Filesize - iRecv;
    RecvBuffer(Buffer[0], bRecv);
		iRecv := iRecv + bRecv;
    FileStream.Write(Buffer[0], bRecv);
		bRecv := 0;
  until iRecv >= FileSize;

  FileStream.Free;
end;
//--End;

//Don't remove following lines!
initialization
  WSAStartup(WSCKVER, WSAData);

finalization
  WSACleanup();

end.
