unit UnitEditFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, acImage, ComCtrls, ToolWin, AdvMemo,
  UnitVariables, UnitCommands, UnitConstants, UnitFunctions;

type
  TFormEditFile = class(TForm)
    tlb1: TToolBar;
    btn2: TToolButton;
    advm1: TAdvMemo;
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Hwnd: HWND;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent);
    procedure SetParameters(_Hwnd: HWND; TmpStr: string);
  end;

var
  FormEditFile: TFormEditFile;

implementation

{$R *.dfm}

constructor TFormEditFile.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
end;

procedure TFormEditFile.SetParameters(_Hwnd: HWND; TmpStr: string);
begin
  Hwnd := _Hwnd;

  Caption := Copy(TmpStr, 1, Pos('|', TmpStr)-1);
  Delete(TmpStr, 1, Pos('|', TmpStr));
  advm1.Lines.Text := TmpStr;
end;

procedure TFormEditFile.btn2Click(Sender: TObject);
var
  ToSend: string;
  i: Integer;
begin
  i := Length(advm1.Lines.Text);
  if i >= 32767 then
  begin
    MessageBox(Handle, PChar('Could not save edited text, text size (' + FileSizeToStr(i) + ') > 33 KB.'),
      PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  ToSend := FILESEDITFILESAVE + '|' + Caption + '|' + advm1.Lines.Text;
  SendMessage(Hwnd, WM_SEND_DATAS, Integer(ToSend), 0);
end;

procedure TFormEditFile.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
