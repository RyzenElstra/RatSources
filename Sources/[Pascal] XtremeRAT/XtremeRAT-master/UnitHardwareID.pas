unit UnitHardwareID;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, StdCtrls;

type
  TFormHardwareID = class(TForm)
    Edit1: TEdit;
    sSkinManager1: TsSkinManager;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHardwareID: TFormHardwareID;

implementation

{$R *.dfm}

uses
  HardwareID;

procedure TFormHardwareID.FormShow(Sender: TObject);
begin
  Edit1.Text := IntToStr(GetHardwareid);
end;

end.
