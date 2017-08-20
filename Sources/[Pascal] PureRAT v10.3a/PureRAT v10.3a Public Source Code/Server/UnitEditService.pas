unit UnitEditService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFormEditService = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    edtFilename: TEdit;
    lbl4: TLabel;
    edtDescription: TEdit;
    lbl5: TLabel;
    cbbStartup: TComboBoxEx;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditService: TFormEditService;

implementation

{$R *.dfm}

procedure TFormEditService.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormEditService.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormEditService.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
