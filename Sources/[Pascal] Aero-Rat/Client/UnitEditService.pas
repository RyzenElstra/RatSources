unit UnitEditService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TEditService = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditService: TEditService;

implementation

{$R *.dfm}

procedure TEditService.Button1Click(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure TEditService.Button2Click(Sender: TObject);
begin
  modalresult := mrcancel;
end;

end.
