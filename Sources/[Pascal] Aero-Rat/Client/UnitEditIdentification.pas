unit UnitEditIdentification;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TEditIdentification = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditIdentification: TEditIdentification;

implementation

{$R *.dfm}

procedure TEditIdentification.BitBtn2Click(Sender: TObject);
begin
  modalresult := mrcancel
end;

procedure TEditIdentification.BitBtn1Click(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure TEditIdentification.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then BitBtn1.Click;
end;

procedure TEditIdentification.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then BitBtn1.Click;
end;

end.
