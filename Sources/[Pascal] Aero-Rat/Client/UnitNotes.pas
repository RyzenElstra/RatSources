unit UnitNotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TNotes = class(TForm)
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Notes: TNotes;

implementation

{$R *.dfm}

procedure TNotes.Button2Click(Sender: TObject);
begin
  modalResult := mrcancel;
end;

procedure TNotes.Button1Click(Sender: TObject);
begin
  modalresult := mrok;
end;

end.
