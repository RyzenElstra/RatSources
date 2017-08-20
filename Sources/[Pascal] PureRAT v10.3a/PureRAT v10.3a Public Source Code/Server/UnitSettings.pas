unit UnitSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, UnitMain, uJSONConfig, UnitVariables,
  UnitConstants;

type
  TFormSettings = class(TForm)
    grp6: TGroupBox;
    chkSkin: TCheckBox;
    cbbSkin: TComboBoxEx;
    grp5: TGroupBox;
    lbl9: TLabel;
    chkPing: TCheckBox;
    chkKAlive: TCheckBox;
    seTimeout: TSpinEdit;
    grp4: TGroupBox;
    chkDesktop: TCheckBox;
    chkMicrophone: TCheckBox;
    grp3: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    seWidth: TSpinEdit;
    seHeight: TSpinEdit;
    grp2: TGroupBox;
    chkStartup: TCheckBox;
    chkGeoIp: TCheckBox;
    chkLogs: TCheckBox;
    chkSound: TCheckBox;
    chkVisual: TCheckBox;
    chkMinimizeToTray: TCheckBox;
    chkCloseToTray: TCheckBox;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure chkSkinClick(Sender: TObject);
    procedure cbbSkinChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.dfm}

procedure TFormSettings.btn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFormSettings.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormSettings.chkSkinClick(Sender: TObject);
begin
  if not chkSkin.Checked then FormMain.skndt1.Active := False else
  begin
    if cbbSkin.ItemIndex = -1 then
    begin
      chkSkin.Checked := False;
      Exit;
    end;

    FormMain.skndt1.LoadFromCollection(FormMain.sknstr1, cbbSkin.ItemIndex);
    FormMain.skndt1.Active := True;
  end;
end;

procedure TFormSettings.cbbSkinChange(Sender: TObject);
begin
  if chkSkin.Checked then FormMain.skndt1.LoadFromCollection(FormMain.sknstr1, cbbSkin.ItemIndex);
end;

procedure TFormSettings.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load windows position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Settings left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Settings top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;
end;

procedure TFormSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Settings left', Left);
  JSONConfig.WriteInteger('Settings top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

end.
