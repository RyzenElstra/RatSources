unit UnitDisclaimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TDisclaimer = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    RichEdit1: TRichEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Disclaimer: TDisclaimer;

implementation

{$R *.dfm}

procedure TDisclaimer.Button2Click(Sender: TObject);
begin
  modalresult := mrcancel;
end;

procedure TDisclaimer.Button1Click(Sender: TObject);
begin
  modalresult := mrok;
end;

end.
