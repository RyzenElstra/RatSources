unit UnitTransferManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb;

type
  TTransferManager = class(TForm)
    ListView1: TListView;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    PopupMenu3: TPopupMenu;
    Start1: TMenuItem;
    Cancel1: TMenuItem;
    N2: TMenuItem;
    Monitor1: TMenuItem;
    Timer1: TTimer;
    N1: TMenuItem;
    DownloadFolder1: TMenuItem;
    Timer3: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Cancel1Click(Sender: TObject);
    procedure Monitor1Click(Sender: TObject);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure DownloadFolder1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Name: string;
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    Group,Computer,User: string;
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

var
  TransferManager: TTransferManager;

implementation

uses UnitSettings;

{$R *.dfm}

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TTransferManager(SocketData.Form).NewSocket = nil then exit;
  TTransferManager(SocketData.Form).Timer3.Enabled := True;
  TTransferManager(SocketData.Form).NewSocket := nil;
  TTransferManager(SocketData.Form).Caption := TTransferManager(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TTransferManager.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer3.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  Timer1.Enabled := True;
end;

function FindNextItem(Listview: TListview): TListItem;
var
  i: integer;
begin
  result := nil;
  for i := 0 to Listview.Items.Count -1 do begin
    if Listview.Items[i].SubItems[6] = 'Pending' then begin
      Result := Listview.Items[i];
      exit;
    end;
  end;
end;

procedure TTransferManager.Timer1Timer(Sender: TObject);
var
  FileTransfer: TFileTransfer;
  i: integer;
  TransferItem: TListItem;
  ActiveCount: integer;
begin
  if NewSocket = nil then exit;
  if Listview1.Items.Count = 0 then exit;

  ActiveCount := 0;
  for i := listview1.Items.Count -1 downto 0 do begin
    application.ProcessMessages;
    if (listview1.Items[i].SubItems[6] = 'Active') then Inc(ActiveCount);
  end;

  if ActiveCount >= Settings.SpinEdit1.Value then exit;

  TransferItem := FindNextItem(Listview1);
  if TransferItem = nil then exit;

  if TransferItem.ImageIndex = 18 then begin
    if (Settings.CheckBox5.Checked) and FileExists(TransferItem.SubItems[0]) then begin
      TransferItem.Delete;
      exit;
    end;
  end;

  try
    if NewSocket <> nil then NewSocket.SendText('');
  except
    NewSocket := nil;
  end;

  if NewSocket = nil then Exit;

  FileTransfer := TFileTransfer.Create(nil);
  FileTransfer.ListItem := TransferItem;
  FileTransfer.MainSocket := MainSocket;
  FileTransfer.SocketData := SocketData;
  FileTransfer.Uploading := (TransferItem.ImageIndex = 17);
  FileTransfer.Caption := SocketData.ServerData.Name + ' - File Transfer';
  FileTransfer.ListItem.Data := FileTransfer;
  FileTransfer.Label1.Caption := 'Filename: ' + ExtractFileName(TransferItem.Caption);
  FileTransfer.ListItem.SubItems[6] := 'Active';
  if not UnitSharedData.SendData(NewSocket,'NewConnection|FileTransferSocket|' + inttostr(FileTransfer.Handle)) then begin
    FileTransfer.ListItem.SubItems[6] := 'Pending';
    FileTransfer.Free;
  end;

end;

procedure TTransferManager.Start1Click(Sender: TObject);
var
  i: integer;
  FileTransfer: TFileTransfer;
begin
  for i := Listview1.Items.Count -1 downto 0 do begin
    if not Listview1.Items[i].Selected then Continue;
    if Listview1.Items[i].SubItems[6] <> 'Pending' then Continue;
    FileTransfer := TFileTransfer.Create(nil);
    FileTransfer.ListItem := Listview1.Items[i];
    FileTransfer.MainSocket := MainSocket;
    FileTransfer.SocketData := SocketData;
    FileTransfer.Uploading := (Listview1.Items[i].ImageIndex = 17);
    FileTransfer.Caption := SocketData.ServerData.Name + ' - File Transfer';
    FileTransfer.ListItem.Data := FileTransfer;
    FileTransfer.Label1.Caption := 'Filename: ' + Listview1.Items[i].Caption;
    FileTransfer.ListItem.SubItems[6] := 'Active';
    UnitSharedData.SendData(NewSocket,'NewConnection|FileTransferSocket|' + inttostr(FileTransfer.Handle));
  end;
end;

procedure TTransferManager.Cancel1Click(Sender: TObject);
var
  i: integer;
begin
  for i := Listview1.Items.Count -1 downto 0 do begin
    if not Listview1.Items[i].Selected then Continue;
    if Listview1.Items[i].SubItems[6] = 'Active' then begin
      TFileTransfer(Listview1.Items[i].Data).Close;
    end else begin
      Listview1.Items[i].Delete;
    end;
  end;
end;

procedure TTransferManager.Monitor1Click(Sender: TObject);
begin
  TFileTransfer(Listview1.Selected.Data).Show;
end;

procedure TTransferManager.ListView1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  listview1.Canvas.Brush.Color := clwhite;
end;

procedure TTransferManager.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := $F7F7F7;
end;

procedure TTransferManager.DownloadFolder1Click(Sender: TObject);
begin
  ShellExecute(0,'open',pchar(SocketData.DownloadPath),'','',SW_SHOWNORMAL);
end;

procedure TTransferManager.Timer3Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|TransferManagerSocket|' + inttostr(Self.Handle));
end;

procedure TTransferManager.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide; //caMinimize;
end;

procedure TTransferManager.FormCreate(Sender: TObject);
begin
  Listview1.DoubleBuffered := True;
end;

end.
