unit UnitAttributes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormAttributes = class(TForm)
    chk1: TCheckBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    chk2: TCheckBox;
    chk3: TCheckBox;
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
  FormAttributes: TFormAttributes;

implementation

{$R *.dfm}

procedure TFormAttributes.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormAttributes.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormAttributes.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
