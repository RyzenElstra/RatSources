unit UnitFtpManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TFormFTPManager = class(TForm)
    seFtpPort: TSpinEdit;
    lbl17: TLabel;
    lbl16: TLabel;
    lbl15: TLabel;
    lbl14: TLabel;
    lbl13: TLabel;
    edtFtpUser: TEdit;
    edtFtpPass: TEdit;
    edtFtphost: TEdit;
    edtFtpDir: TEdit;
    chk2: TCheckBox;
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    edtFilename: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFTPManager: TFormFTPManager;

implementation

{$R *.dfm}

procedure TFormFTPManager.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormFTPManager.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormFTPManager.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
