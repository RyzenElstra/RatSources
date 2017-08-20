{
  ---------------------------------------------------

  SocketUnitEx.pas v1.7
	Original unit by Aphex -> unremote@knology.net
	Modified by wrh1d3 -> wrh1d3@gmail.com

  ---------------------------------------------------

  As all open source software, you can redistribute,
  modify code, ... But don't forget to give credits :)

  ---------------------------------------------------

  Modified by wrh1d3 Thursday 30th March 2017 1:50:00 PM

  ---------------------------------------------------

  [+] Added ClientSocket handled events
  [!] Changed socket type

  ---------------------------------------------------
}

unit SocketUnitEx; 

interface

uses
  Windows, Winsock, Classes, SysUtils;

type
  TClientSocket = class;

	TTransferCallback = procedure(Sender: TObject; Transfered: Integer) of object;
  TClientSocketEvent = procedure(Sender: TObject; ClientSocket: TClientSocket) of object;
  TClientSocketDatas = procedure(Sender: TObject; ClientSocket: TClientSocket; Datas: string) of object;
  //ClientSocket events (OnConnect, OnDisconect, OnRead)
  
  //From SS RAT 2.0 source code
  //-----
  PConnectionHeader = ^TConnectionHeader;
  TConnectionHeader = record
    DatasLen: Int64;
  end;
  //-----
	
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
    procedure SetIdle(Seconds: integer);
    function LocalAddress: string;
		function RemoteAddress: string;
		function LocalPort: Word;
    function RemotePort: Word;
    function SendBuffer(var Buffer; BufferSize: Integer): Integer;
    function RecvBuffer(var Buffer; BufferSize: Integer): Integer;
    function SendText(const Text: string): Integer;
    function SendStream(Stream: TMemoryStream; TransferCallback: TTransferCallback): Integer;
    function RecvStream(StreamSize: Int64; TransferCallback: TTransferCallback): TMemoryStream;
    function SendFile(Filename: string; TransferCallback: TTransferCallback): Integer;
    function RecvFile(Filename: string; FileSize: Int64; TransferCallback: TTransferCallback): Integer;
    property Socket: TSocket read FSocket write FSocket;
    property Data: Pointer read FData write FData;
    property Connected: Boolean read FConnected;
  end;

  TClientSocketThread = class(TThread)
  private
    FReceivedText: string;
		FClientSocket: TClientSocket;     
    FOnClientDisconnect: TClientSocketEvent;
    FOnClientRead: TClientSocketDatas;
    procedure ProcessDatas;
    procedure FreeClientSocket;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean = True);
    property ClientSocket: TClientSocket write FClientSocket;
    property OnClientDisconnect: TClientSocketEvent write FOnClientDisconnect;
    property OnClientRead: TClientSocketDatas write FOnClientRead;
  end;
                    
  TServerSocket = class(TObject)
  private
    FSocket: TSocket;
  public
    constructor Create;
    destructor Destroy; override;
    function Listen(Port: Word): Boolean;
    function AcceptConnection: TClientSocket;
    procedure StopListening;
  end;

  TServerSocketThread = class(TThread)
  private
    FSocket: TSocket;
    FPort: Word;
    FListening: Boolean;  
		FClientSocket: TClientSocket;
    FServerSocket: TServerSocket;
    FClientSocketThread: TClientSocketThread; 
    FOnClientConnect, FOnClientDisconnect: TClientSocketEvent;
    FOnClientRead: TClientSocketDatas;
    procedure StartServer;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean = True);
    procedure StopServer;
    property Port: Word read FPort write FPort;
    property Listening: Boolean read FListening;
    property OnClientConnect: TClientSocketEvent write FOnClientConnect;
    property OnClientDisconnect: TClientSocketEvent write FOnClientDisconnect;
    property OnClientRead: TClientSocketDatas write FOnClientRead;
    //TServerSocketThread don't let have access to TClientSocketThread, so
    //we need to write all properties here to ensure that TClientSocketThread
    //properties will set too
  end;

implementation

const 
  WSCKVER = $101; //Set winsock version here
	MIN_BUFF_SIZE = 4095;
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
  FSocket := WinSock.socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
  if FSocket = INVALID_SOCKET then Exit; 

  SockAddrIn.sin_family := PF_INET;
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

procedure TClientSocket.SetIdle(Seconds: Integer);
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
    TimeVal.tv_sec  := Seconds;
    TimeVal.tv_usec := 0;
    FD_ZERO(FDSet);
    FD_SET(FSocket, FDSet);
    select(0, @FDset, nil, nil, @TimeVal);
  end;
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
var
  Buffer: array of Byte;
  dSize, sSize: Int64;
begin
  Result := -1;
  if (FConnected = False) or (Text = '') then Exit;
  dSize := Length(Text);
  sSize := SizeOf(TConnectionHeader) + dSize;
  SetLength(Buffer, sSize);
  PConnectionHeader(@Buffer[0])^.DatasLen := dSize;
  MoveMemory(@Buffer[SizeOf(TConnectionHeader)], @Text[1], dSize);
  Result := SendBuffer(Buffer[0], sSize);
end;

function TClientSocket.SendStream(Stream: TMemoryStream; TransferCallback: TTransferCallback): Integer;
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
		if Assigned(TransferCallback) then TransferCallback(Self, Result);
  until bRead = 0;

  Stream.Free;
end;

function TClientSocket.RecvStream(StreamSize: Int64;
  TransferCallback: TTransferCallback): TMemoryStream;
var
  Buffer: array[0..MAX_BUFF_SIZE] of Byte;
  bRecv, iRecv: Integer;
begin
  Result := nil;
  if FConnected = False then Exit;
             
  Result := TMemoryStream.Create;
  bRecv := 0;
	iRecv := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRecv := RecvBuffer(Buffer[0], SizeOf(Buffer));
    if bRecv <= 0 then Break;
    Result.Write(Buffer[0], bRecv);
    iRecv := Result.Size;
		if Assigned(TransferCallback) then TransferCallback(Self, iRecv);
  until iRecv >= StreamSize;
end;

function TClientSocket.SendFile(Filename: string; TransferCallback: TTransferCallback): Integer;
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
		if Assigned(TransferCallback) then TransferCallback(Self, Result);
  until bRead = 0;

  FileStream.Free;
end;

function TClientSocket.RecvFile(Filename: string; FileSize: Int64;
  TransferCallback: TTransferCallback): Integer;
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
		if Assigned(TransferCallback) then TransferCallback(Self, iRecv);
  until iRecv >= FileSize;

  FileStream.Free;
end;
//--End;

{Region TClientSocketThread}
//--Begin
constructor TClientSocketThread.Create(CreateSuspended: Boolean);
begin
	inherited Create(CreateSuspended);
  FClientSocket := nil;
  FReceivedText := '';
  FOnClientDisconnect := nil;
  FOnClientRead := nil;
  FreeOnTerminate := True;
end;

procedure TClientSocketThread.ProcessDatas;
var
  Buffer: array[0..MAX_BUFF_SIZE] of Byte;
  Datas, s: string;
  bRecv: Integer;
  bSize, rSize: Int64;
  p: Pointer;
begin
  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRecv := FClientSocket.RecvBuffer(Buffer[0], SizeOf(Buffer));
    if bRecv <= 0 then Exit;
    SetLength(s, bRecv);
    MoveMemory(@s[1], @Buffer[0], bRecv);
    Datas := Datas + s; //Repeat until we'll get full incomming datas

    repeat
      p := @Datas[1];
      bSize := PConnectionHeader(p)^.DatasLen;
      rSize := Length(Datas) - SizeOf(TConnectionHeader);
      if bSize <> rSize then Break; //Check if datas size is reached, if not continue receiving...

      Delete(Datas, 1, SizeOf(TConnectionHeader));
      FReceivedText := Copy(Datas, 1, bSize);
      Delete(Datas, 1, bSize);

      //Process received datas in an external procedure
      if Assigned(FOnClientRead) then FOnClientRead(Self, FClientSocket, FReceivedText);
    until Datas = '';
  until False;
end;

procedure TClientSocketThread.FreeClientSocket;
begin
  //Do something with FClientSocket before disconnect
  if Assigned(FOnClientDisconnect) then FOnClientDisconnect(Self, FClientSocket);

  //Free FClientSocket
  FClientSocket.Free;
  FClientSocket := nil;
end;

procedure TClientSocketThread.Execute;
begin
  ProcessDatas;
  FreeClientSocket;
end;
//--End;
                
{Region TServerSocket}
//--Begin
constructor TServerSocket.Create;
begin
	inherited Create;
  FSocket := INVALID_SOCKET;
end;
                         
destructor TServerSocket.Destroy;
begin
  StopListening;
  inherited Destroy;
end;

function TServerSocket.AcceptConnection: TClientSocket;
var
  SockAddr: TSockAddr;
  SockAddr_Len: Integer;
begin
  SockAddr_Len := SizeOf(SockAddr);
  Result := TClientSocket.Create;
  Result.Socket := accept(FSocket, @SockAddr, @SockAddr_Len);
	Result.SetConnection;
end;

function TServerSocket.Listen(Port: Word): Boolean;
var
  SockAddrIn: TSockAddrIn;
begin
  Result := False;
  FSocket := socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
  SockAddrIn.sin_family := PF_INET;
  SockAddrIn.sin_addr.s_addr := INADDR_ANY;
  SockAddrIn.sin_port := htons(Port);
  if bind(FSocket, SockAddrIn, SizeOf(SockAddrIn)) <> 0 then Exit;
  if Winsock.listen(FSocket, SOMAXCONN) <> 0 then Exit;
  Result := True;
end;

procedure TServerSocket.StopListening;
begin
  shutdown(FSocket, SD_BOTH);
  closesocket(FSocket);
  FSocket := INVALID_SOCKET;                               
end;
//--End;
                                    
{Region TServerSocketThread}
//-Begin
constructor TServerSocketThread.Create(CreateSuspended: Boolean);
begin
	inherited Create(CreateSuspended);
  FSocket := INVALID_SOCKET;
  FListening := False;
  FServerSocket := nil;
  FClientSocket := nil;
  FClientSocketThread := nil;
  FOnClientConnect := nil;
  FOnClientDisconnect := nil;
  FOnClientRead := nil;
  FPort := 0;
  FreeOnTerminate := True;  
end;

procedure TServerSocketThread.Execute;
begin
  StartServer;
  StopServer;
end;

procedure TServerSocketThread.StartServer;
begin
  FServerSocket := TServerSocket.Create;
  FListening := FServerSocket.Listen(FPort);
  if not FListening then Exit;

  repeat
    FClientSocket := TClientSocket.Create;
    FClientSocket := FServerSocket.AcceptConnection;
    if not FClientSocket.Connected then
    begin
      FClientSocket.Disconnect;
      FClientSocket.Free;
      FClientSocket := nil;
      Exit;
    end;

    if Assigned(FOnClientConnect) then FOnClientConnect(Self, FClientSocket);

    FClientSocketThread := TClientSocketThread.Create(); //initialize events
    FClientSocketThread.OnClientDisconnect := FOnClientDisconnect;
    FClientSocketThread.OnClientRead := FOnClientRead;
    FClientSocketThread.ClientSocket := FClientSocket;
    FClientSocketThread.Resume;
  until False;
end;

procedure TServerSocketThread.StopServer;
begin
  FServerSocket.StopListening;
  FServerSocket.Free;
  FServerSocket := nil;
  FListening := False;
end;
//--End;

//Don't remove following lines!
initialization
  WSAStartup(WSCKVER, WSAData);  

finalization
  WSACleanup();

end.

