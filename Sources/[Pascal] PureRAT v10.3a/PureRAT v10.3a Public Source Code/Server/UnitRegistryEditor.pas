unit UnitRegistryEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, MPHexEditor, MPHexEditorEx;

type
  TFormRegistryEditor = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    rgType: TRadioGroup;
    lbl2: TLabel;
    mmoData: TMemo;
    btn1: TButton;
    btn2: TButton;
    cbbHKEY: TComboBoxEx;
    lbl3: TLabel;
    edt1: TEdit;
    rg1: TRadioGroup;
    mphxdtrx1: TMPHexEditorEx;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRegistryEditor: TFormRegistryEditor;

implementation

{$R *.dfm}

procedure TFormRegistryEditor.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormRegistryEditor.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormRegistryEditor.rgTypeClick(Sender: TObject);
begin
  if rgType.ItemIndex = 4 then
  begin
    mphxdtrx1.Visible := True;
    mmoData.Visible := False;
    edt1.Visible := False;
    rg1.Visible := False;
  end
  else

  if rgType.ItemIndex  = 3 then
  begin
    edt1.Visible := True;
    rg1.Visible := True;
    mphxdtrx1.Visible := False;
    mmoData.Visible := False;
    rg1Click(Sender);
  end
  else

  if (rgType.ItemIndex  = 2) or (rgType.ItemIndex  = 0) then
  begin
    edt1.Visible := True;
    rg1.Visible := False;
    mphxdtrx1.Visible := False;
    mmoData.Visible := False;
  end
  else
  begin
    edt1.Visible := False;
    rg1.Visible := False;
    mphxdtrx1.Visible := False;
    mmoData.Visible := True;
  end;
end;

procedure TFormRegistryEditor.rg1Click(Sender: TObject);
begin
  if edt1.Text = '' then Exit;
  if edt1.Text = 'Pure Remote Administration Tool by wrh1d3' then edt1.Text := '1021';
  case rg1.ItemIndex of
    0:  begin
          edt1.Text := IntToHex(StrToInt(edt1.Text), 8);
          edt1.MaxLength := 8;
        end;
    1:  begin
          edt1.Text := IntToStr(StrToInt('$' + edt1.Text));
          edt1.MaxLength := 10;
        end;
  end;
end;

procedure TFormRegistryEditor.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
