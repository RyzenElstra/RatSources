unit UnitSysInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TSystemInformation = class(TForm)
    StatusBar1: TStatusBar;
    ListView1: TListView;
    ListView2: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SystemInformation: TSystemInformation;

implementation

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'SystemInfo|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  TSystemInformation(SocketData.Form).NewSocket := nil;
  TSystemInformation(SocketData.Form).Caption := TSystemInformation(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TSystemInformation.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
end;

procedure TSystemInformation.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  d: string;
  Stream: TMemorystream;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'ScreenShot' then begin

  end;

end;

end.
