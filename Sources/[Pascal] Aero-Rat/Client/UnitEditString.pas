unit UnitEditString;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TEditString = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditString: TEditString;

implementation

{$R *.dfm}

procedure TEditString.Button2Click(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure TEditString.Button1Click(Sender: TObject);
begin
  modalresult := mrcancel;
end;

end.
