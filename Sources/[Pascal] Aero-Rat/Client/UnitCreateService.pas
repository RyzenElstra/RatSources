unit UnitCreateService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TCreateService = class(TForm)
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
    CheckBox1: TCheckBox;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateService: TCreateService;

implementation

{$R *.dfm}

procedure TCreateService.Button1Click(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure TCreateService.Button2Click(Sender: TObject);
begin
  modalresult := mrcancel;
end;

end.
