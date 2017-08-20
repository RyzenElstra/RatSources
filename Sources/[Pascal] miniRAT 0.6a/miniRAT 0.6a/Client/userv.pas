unit userv;

interface
uses Windows,Classes,sysUtils,Winsock,uconn;

const
  ERROR_DISCONNECT      = 01;    
  ERROR_FAIL            = 02;    
  ERROR_CONNECT         = 03;    
  ERROR_LISTEN          = 04;    
  ERROR_ACCEPT          = 05;    
  ERROR_BREAK           = 06;    
  ERROR_LOSTCONNECTION  = 07;    
  ERROR_BIND            = 08;
  SUCCESS_CONNECT       = 09;    
  SUCCESS_FINISHED      = 10;
  SUCCESS_ACCEPT        = 11;

type
  TMyThread = class(TThread)
  private
    ListenPort  :Integer;
    WSA         :TWSAData;
    TempSock    :TSocket;
    Sock        :TSocket;
    Addr        :TSockAddrIn;
    Remote      :TSockAddr;
    ReturnError :Integer;
    Len         :Integer;
    curString   :string;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    procedure SetPortTo(sValue: Integer);
    Function Listen: Integer;
    Procedure ResolveStatus(Int: Integer);
    Function AcceptNew(SSock: TSocket): Integer;
    procedure SetText;
  end;

implementation
uses MainU;
constructor TMyThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  ListenPort := 0;
end;

procedure TMyThread.SetText;
begin
  MainForm.edt1.text := curString;
end;

procedure TMyThread.Execute;
begin
  FreeOnTerminate:=True;
  Listen;
end;

procedure TMyThread.SetPortTo(sValue: Integer);
begin
  ListenPort := sValue;
end;

Procedure TMyThread.ResolveStatus(Int: Integer);
Begin
End;

Function TMyThread.AcceptNew(SSock: TSocket): Integer;
var
  ListThread:TConnThread;
Begin
  ListThread := TConnThread.Create(True);
  ListThread.SetSocket(ssock); 
  ListThread.Resume;
  Result := SUCCESS_ACCEPT;
End;

Function TMyThread.Listen: Integer;
Begin
  WSACleanUp();
  WSAStartUp($0202, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(ListenPort);
  Addr.sin_addr.S_addr := INADDR_ANY;
  If (Bind(Sock, Addr, SizeOf(Addr)) <> 0) Then
  Begin
    Result := ERROR_BIND;
    ReturnError := Result;
    WSACleanUp();
    curString := 'Cant listen on Port: ' + IntToStr(ListenPort);
    Synchronize(SetText);
    Exit;
  End;
  If (Winsock.listen(Sock, SOMAXCONN) <> 0) Then
  Begin
    Result := ERROR_LISTEN;
    ReturnError := Result;
    WSACleanUp();
    curString := 'Cant listen on Port: ' + IntToStr(ListenPort);
    Synchronize(SetText);
    Exit;
  End;
Len := SizeOf(Remote);
  Repeat
    curString := 'Successfully listening on Port: ' + IntToStr(ListenPort);
    Synchronize(SetText);
    TempSock := Accept(Sock, @Remote, @Len);
    If (TempSock = INVALID_SOCKET) Then
    Begin
      Result := ERROR_ACCEPT;
      ReturnError := Result;
      WSACleanUp();
      Exit;
    End;
    ResolveStatus(AcceptNew(TempSock));
    TempSock := INVALID_SOCKET;
  Until False;
  WSACleanUp();
End;
end.

