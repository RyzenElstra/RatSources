unit uListen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmListen = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtPort: TEdit;
    btnListen: TButton;
    procedure btnListenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListen: TFrmListen;

implementation

uses uGeneral;

{$R *.dfm}

procedure TFrmListen.btnListenClick(Sender: TObject);
begin
  if not (Trim(EdtPort.Text) = '') then
  begin
    FrmGeneral.Server.Active := False;
    FrmGeneral.Server.Port := StrToInt(EdtPort.Text);
    FrmGeneral.Server.Active := True;
    FrmGeneral.StatusBar.Panels.Items[0].Text := 'Status: Listening on port '+EdtPort.Text;
    FrmListen.Hide;
  end else MessageBoxA(0, 'Invalid port', 'Information', 64);
end;

end.
