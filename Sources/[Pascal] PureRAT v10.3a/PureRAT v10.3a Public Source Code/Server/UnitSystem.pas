unit UnitSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ToolWin, AdvMemo, UnitMain, SocketUnitEx,
  UnitCommands, UnitFunctions, UnitVariables, UnitManager, Menus, ImgList,
  UnitConstants;

type
  TFormSystem = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    pnlHosts: TPanel;
    advm1: TAdvMemo;
    pm1: TPopupMenu;
    R2: TMenuItem;
    S1: TMenuItem;
    pnlLogs: TPanel;
    btn2: TToolButton;
    btn3: TToolButton;
    pb1: TProgressBar;
    pm2: TPopupMenu;
    S2: TMenuItem;
    A1: TMenuItem;
    S3: TMenuItem;
    lv1: TListView;
    il1: TImageList;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure lv1Click(Sender: TObject);
    procedure lv1ColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
    Client: TClientDatas;
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormSystem: TFormSystem;

implementation

{$R *.dfm}

type
  TEventMessage = class
    Msg: string;
  end;

var
  LastColumn: TListColumn;
  Ascending: Boolean;

constructor TFormSystem.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
           
procedure TFormSystem.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormSystem.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormSystem.btn1Click(Sender: TObject);
begin
  pnlHosts.BringToFront;
end;

function ParseDateTime(dt: string): string;
var
  Year, Month, Day,
  Hour, Min: string; //Format date: 20170211193531.000
begin
  Delete(dt, Pos('.', dt), Length(dt));
  Year := Copy(dt, 1, 4);
  Delete(dt, 1, 4);
  Month := Copy(dt, 1, 2);
  Delete(dt, 1, 2);
  Day := Copy(dt, 1, 2);
  Delete(dt, 1, 2);
  Hour := Copy(dt, 1, 2);
  Delete(dt, 1, 2);
  Min := Copy(dt, 1, 2);
  Delete(dt, 1, 2);
  Result := Year + '/' + Month + '/' + Day + ' ' + Hour + ':' + Min + ':' + dt;
end;

procedure TFormSystem.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr: string;
  EventMessage: TEventMessage;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = SYSTEMHOSTSFILE then
    begin
      advm1.Lines.Text := Datas;      
      AddRecvLog('Hosts file datas of size ' + FileSizeToStr(Length(Datas)));
    end
    else

    if MainCommand = SYSTEMEVENTSLOGS then
    begin
      lv1.Clear;
      
      if Datas = '' then
      begin
        AddRecvLog('Events logs not found', clRed);
        Exit;
      end;

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      while Datas <> '' do
      begin                          
        Self.Refresh;
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;

        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);
        TmpList := ParseString('|', TmpStr);

        TmpItem := lv1.Items.Add;

        if TmpList[0] = '3' then TmpItem.Caption := 'Information' else
        if TmpList[0] = '1' then TmpItem.Caption := 'Error' else
        if TmpList[0] = '2' then TmpItem.Caption := 'Warning' else TmpItem.Caption := 'Unknown';

        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);
        TmpItem.SubItems.Add(ParseDateTime(TmpList[3]));
        TmpItem.SubItems.Add(TmpList[4]);

        EventMessage := TEventMessage.Create;
        EventMessage.Msg := TmpList[5];

        if TmpList[0] = '3' then TmpItem.ImageIndex := 0 else
        if TmpList[0] = '1' then TmpItem.ImageIndex := 1 else
        if TmpList[0] = '2' then TmpItem.ImageIndex := 2 else TmpItem.ImageIndex := -1;

        TmpItem.Data := EventMessage;
      end;

      AddRecvLog(IntToStr(pb1.Max) + ' events logs found');
    end;
  end;
end;

procedure TFormSystem.FormShow(Sender: TObject);
begin
  btn1Click(Sender);
end;

procedure TFormSystem.R2Click(Sender: TObject);
begin
  Client.SendDatas(SYSTEMHOSTSFILE + '|');
  AddSentLog('Get hosts file datas');
end;

procedure TFormSystem.S1Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := advm1.Lines.Text;
  if TmpStr = '' then Exit;
  Client.SendDatas(SYSTEMHOSTSFILEEDIT + '|' + TmpStr);
  AddSentLog('Change hosts file data with ' + Copy(TmpStr, 1, 50) + '...');
end;

procedure TFormSystem.btn2Click(Sender: TObject);
begin
  pnlLogs.BringToFront;
end;

procedure TFormSystem.S2Click(Sender: TObject);
begin
  Client.SendDatas(SYSTEMEVENTSLOGS + '|0');
  AddSentLog('Get system events logs <- this process takes a while and consumes much resources, please wait');
end;

procedure TFormSystem.A1Click(Sender: TObject);
begin
  Client.SendDatas(SYSTEMEVENTSLOGS + '|1');
  AddSentLog('Get applications events logs <- this process takes a while and consumes much resources, please wait');
end;

procedure TFormSystem.S3Click(Sender: TObject);
begin  
  Client.SendDatas(SYSTEMEVENTSLOGS + '|2');
  AddSentLog('Get security events logs <- this process takes a while and consumes much resources, please wait');
end;

procedure TFormSystem.lv1Click(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then
  begin
    mmo1.Clear;
    Exit;
  end;

  if lv1.Selected.Data <> nil then
  mmo1.Text := TEventMessage(lv1.Selected.Data).Msg;
end;
             
function SortByColumn(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
var
  i1, i2: Int64;
begin
  if LastColumn.Index = 4 then
  begin
    i1 := StrToInt(Item1.SubItems[3]);
    i2 := StrToInt(Item2.SubItems[3]);
    if (i1 = i2) then Result := 0 else
    if (i1 > i2) then Result := 1 else Result := -1;
  end
  else
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end;

  if not Ascending then Result := -Result;
end;

procedure TFormSystem.lv1ColumnClick(Sender: TObject; Column: TListColumn);
var
  i: Integer;
begin
  Ascending := not Ascending;
  if Column <> LastColumn then Ascending := not Ascending;
  LastColumn := Column;
  lv1.CustomSort(@SortByColumn, LastColumn.Index);
end;

end.
