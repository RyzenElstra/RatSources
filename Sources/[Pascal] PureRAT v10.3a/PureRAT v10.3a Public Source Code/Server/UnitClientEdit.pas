unit UnitClientEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, Buttons, UnitConstants;

type
  TFormClientEdit = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    lv1: TListView;
    btn1: TButton;
    btn2: TButton;
    il1: TImageList;
    btn3: TSpeedButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClientEdit: TFormClientEdit;

implementation

{$R *.dfm}

procedure TFormClientEdit.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormClientEdit.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormClientEdit.btn3Click(Sender: TObject);
const
  MsgInfo =
    '- Identification: ' + #13#10 +
    'Let entry empty to keep the same client identification or group.' + #13#10#13#10 +
    '- Icon image: ' + #13#10 +
    'Unselect items to keep the icon image for client or group.';
begin
  MessageBox(Handle, MsgInfo, PROGRAMINFOS, MB_ICONINFORMATION);
end;

procedure TFormClientEdit.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
