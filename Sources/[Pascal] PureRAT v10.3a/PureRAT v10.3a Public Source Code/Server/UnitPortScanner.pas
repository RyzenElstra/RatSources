unit UnitPortScanner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, acImage, ComCtrls, ToolWin, UnitMain, StdCtrls,
  SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, UnitRepository,
  UnitConstants, UnitEncryption, UnitManager;

type
  TFormPortScanner = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    lvScanner: TListView;
    btn3: TToolButton;
    pb1: TProgressBar;
    edt1: TEdit;
    btn4: TToolButton;
    btn5: TToolButton;
    procedure lvScannerCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Client: TClientDatas;
    function RetrievePorts: string;               
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormPortScanner: TFormPortScanner;

implementation

{$R *.dfm}
              
constructor TFormPortScanner.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
                             
procedure TFormPortScanner.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormPortScanner.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormPortScanner.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormPortScanner.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpList: TStringArray;
  TmpItem: TListItem;
  i: Integer;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = PORTSCANNERRESULTS then
    begin                         
      pb1.Position := pb1.Position + 1;

      lvScanner.Items.BeginUpdate;
      TmpList := ParseString('|', Datas);
      TmpItem := lvScanner.Items.Add;
      TmpItem.Caption := TmpList[0];
      TmpItem.SubItems.Add(TmpList[1]);
      TmpItem.SubItems.Add(TmpList[2]);
      if TmpList[2] = 'CLOSED' then TmpItem.Data := TObject(clRed) else
      TmpItem.Data := TObject(clGreen);
      TmpItem.ImageIndex := 0;  
      lvScanner.Items.EndUpdate;
      SendMessage(lvScanner.Handle, WM_VSCROLL, SB_LINEDOWN, 0);

      if pb1.Position = pb1.Max then
      begin
        btn1.Down := False;
        btn1.Click;
      end;
    end
    else

    if MainCommand = PORTSCANNERCOUNT then
    begin
      pb1.Max := StrToInt(Datas);
      pb1.Position := 0;
      AddRecvLog(IntToStr(StrToInt(Datas)) + ' ports to scan');
    end;
  end;
end;

procedure TFormPortScanner.lvScannerCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

function ParseItems(var Host, Port_b, Port_e: string; Str: string): Boolean;
begin
  Result := False;
  if (Str = '') or (Pos(':', Str) < 0) or (Pos('-', Str) < 0) then Exit;
  Host := Copy(Str, 1, Pos(':', Str) - 1);
  Delete(Str, 1, Pos(':', Str));
  Port_b := Copy(Str, 1, Pos('-', Str) - 1);
  Delete(Str, 1, Pos('-', Str));
  Port_e := Str;
  Result := True;
end;

procedure TFormPortScanner.btn1Click(Sender: TObject);
var
  Host, Port_b, Port_e: string;
begin
  if btn1.Down = True then
  begin
    lvScanner.Clear;

    if (not ParseItems(Host, Port_b, Port_e, edt1.Text)) or
      (StrToInt(Port_b) >= StrToInt(Port_e))
    then
    begin
      MessageBox(Handle, 'Parameters must to be set as "host:start-end".',
        PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    Client.SendDatas(PORTSCANNERSTART + '|' + Host + '|' + Port_b + '|' + Port_e);
    AddSentLog('Start port scanning for host ' + Host + ' in port range ' + Port_b + '-' + Port_e);
  end
  else
  begin                      
    Client.SendDatas(PORTSCANNERSTOP + '|');
    AddSentLog('Stop port scanning');
  end;
end;
   
function TFormPortScanner.RetrievePorts: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to lvScanner.Items.Count - 1 do
  begin
    Result := lvScanner.Items.Item[i].Caption + ':';
    Result := lvScanner.Items.Item[i].SubItems.Strings[0] + ' -> ';
    Result := lvScanner.Items.Item[i].SubItems.Strings[1] + #13#10;
  end;
end;

procedure TFormPortScanner.btn2Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := GetScannerFolder(Client.UserId) + '\' + MyGetTime('_') + '.data';
  TmpStr1 := EnDecryptText(RetrievePorts, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
  AddLog('Port scanner datas saved');
end;

procedure TFormPortScanner.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if btn1.Down then
  begin
    btn1.Down := False;
    btn1Click(Sender);
  end;
end;

end.
