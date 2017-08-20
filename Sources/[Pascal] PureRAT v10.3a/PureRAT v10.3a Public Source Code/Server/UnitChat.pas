unit UnitChat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitMain, jpeg, ExtCtrls, acImage, ComCtrls, StdCtrls, ToolWin,
  SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, UnitManager,
  UnitRepository, UnitConstants, UnitEncryption, MMSystem;

type
  TFormChat = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    pnlOptions: TPanel;
    edt1: TEdit;
    lbl3: TLabel;
    edt4: TEdit;
    lbl4: TLabel;
    pnl1: TPanel;
    btn3: TButton;
    redt1: TRichEdit;
    lbl2: TLabel;
    clrbx1: TColorBox;
    clrbx2: TColorBox;
    lbl1: TLabel;
    grp1: TGroupBox;
    btn4: TButton;
    edt3: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure edt3KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
    h: THandle;
    Client: TClientDatas;
    procedure SendChatMessage;
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormChat: TFormChat;

implementation

{$R *.dfm}
                         
constructor TFormChat.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
                
procedure TFormChat.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormChat.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormChat.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormChat.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));   

    if MainCommand = CHATSTART then h := StrToInt(Datas) else
    if MainCommand = CHATTEXT then
    begin
      redt1.SelAttributes.Color := clrbx1.Selected;
      redt1.Lines.Add('[' + TimeToStr(Time) + '] ' + Client.Infos.User + ': ' + Datas);
      redt1.SelStart := Length(redt1.Text);
      SendMessage(redt1.Handle, EM_SCROLLCARET, 0, 0);
      AddRecvLog('New chat message from ' + Client.Infos.User + ' -> ' + Datas);
      if SoundNotification then
      PlaySound(PChar(5), hInstance, SND_ASYNC or SND_MEMORY or SND_RESOURCE);
    end;
  end;
end;

procedure TFormChat.btn1Click(Sender: TObject);
begin
  if btn1.Down = True then
  begin
    pnlOptions.Visible := False;
    Client.SendDatas(CHATSTART + '|' + edt1.Text + '|' + edt4.Text);
    AddSentLog('Start chat with nickname ' + edt1.Text + ' and window title ' + edt4.Text);
  end
  else
  begin
    pnlOptions.Visible := True;
    Client.SendDatas(CHATSTOP + '|');
    AddLog('Chat session closed');
  end;
end;

procedure TFormChat.SendChatMessage;
begin
  if pnlOptions.Visible = True then Exit;
  if edt3.Text = '' then Exit;
  redt1.SelAttributes.Color := clrbx2.Selected;
  redt1.Lines.Add('[' + TimeToStr(Time) + '] You: ' + edt3.Text);
  redt1.SelStart := Length(redt1.Text);
  SendMessage(redt1.Handle, EM_SCROLLCARET, 0, 0);
  Client.SendDatas(CHATTEXT + '|' + edt3.Text);
  AddSentLog('New chat message from you -> ' + edt3.Text);
  edt3.Text := '';
end;

procedure TFormChat.edt3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(VK_RETURN) then SendChatMessage;
end;

procedure TFormChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btn1.Down = True then
  begin
    btn1.Down := False;
    btn1.Click;
  end;
end;

procedure TFormChat.btn2Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := GetChatFolder(Client.UserId) + '\' + MyGetDate('-') + '.data';
  TmpStr1 := EnDecryptText(redt1.Text, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
  AddLog('Chat session datas saved');
end;

procedure TFormChat.btn3Click(Sender: TObject);
begin
  SendChatMessage;
end;

procedure TFormChat.btn4Click(Sender: TObject);
begin
  if pnlOptions.Visible = True then Exit;
  Client.SendDatas(WINDOWSSHAKE + '|' + IntToStr(h) + '|20');
  AddSentLog('Shake chat window');
end;

end.
