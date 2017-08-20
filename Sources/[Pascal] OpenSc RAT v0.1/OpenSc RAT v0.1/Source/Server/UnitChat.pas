unit UnitChat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UnitConnection, UnitUtils, UnitCommands,
  ComCtrls;

type
  TFormChat = class(TForm)
    pnl1: TPanel;
    edtChat: TEdit;
    btn1: TButton;
    mmoChat: TMemo;
    stat1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtChatKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;
    NickName: string;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);
    procedure OnClientRead(Datas: string);
  end;

var
  FormChat: TFormChat;

implementation

{$R *.dfm}
      
constructor TFormChat.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormChat.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormChat.OnClientRead(Datas: string);
var
  Cmd: Integer;
  TmpStr: string;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_CHAT_START:
    begin
      edtChat.ReadOnly := False;
      btn1.Enabled := True;
      stat1.Panels.Items[0].Text := 'Chat session started successfully!';
    end;

    CMD_SHELL_STOP:
    begin         
      edtChat.ReadOnly := True;
      btn1.Enabled := False;
      stat1.Panels.Items[0].Text := 'Chat session stopped.';
    end;

    CMD_CHAT_TEXT:
    begin
      mmoChat.Lines.Add('[' + TimeToStr(Time) + '] ' + ClientDatas.ClientSocket.RemoteAddress + ': ' + Datas);
      mmoChat.SelStart := Length(mmoChat.Text);
      SendMessage(mmoChat.Handle, EM_SCROLLCARET, 0, 0); //scroll down
    end;
  end;
end;

procedure TFormChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDatas.SendDatas(IntToStr(CMD_CHAT_STOP) + '|'); //hide chat window
end;

procedure TFormChat.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormChat.FormShow(Sender: TObject);
begin
  NickName := InputBox('Nickname', 'Enter your nickname', '');
  if NickName = '' then NickName := '@OpenSc'; //:)
  ClientDatas.SendDatas(IntToStr(CMD_CHAT_START) + '|' + NickName);

  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormChat.edtChatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(VK_RETURN) then btn1.Click; //user type ENTER on keyboard
end;

procedure TFormChat.btn1Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_CHAT_TEXT) + '|' + edtChat.Text);
  mmoChat.Lines.Add('[' + TimeToStr(Time) + '] You: ' + edtChat.Text);
  mmoChat.SelStart := Length(mmoChat.Text);
  SendMessage(mmoChat.Handle, EM_SCROLLCARET, 0, 0);
end;

end.
