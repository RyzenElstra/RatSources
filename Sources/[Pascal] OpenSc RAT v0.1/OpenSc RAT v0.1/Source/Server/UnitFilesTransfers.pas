unit UnitFilesTransfers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, UnitConnection, UnitUtils;

type
  TFormFilesTransfers = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    pb1: TProgressBar;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ClientDatas: TClientDatas;
    TickBefore, TickCount: Cardinal;  
    Speed: Integer;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas;
      Filename: string; Filesize: Int64);
    procedure OnClientRead(Sender: TObject; Datas: Integer);
  end;

var
  FormFilesTransfers: TFormFilesTransfers;

implementation                                   

{$R *.dfm}
             
constructor TFormFilesTransfers.Create(aOwner: TComponent; _ClientDatas: TClientDatas;
  Filename: string; Filesize: Int64);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
  lbl1.Caption := 'Filename: ' + Filename;
  lbl2.Caption := 'File size: ' + FileSizeToStr(Filesize);
  pb1.Position := 0;
  pb1.Max := Filesize;
end;

//From SS-RAT 2.0 source code
//-----
function TimeLeft(Speed, Total: Integer): string;
var
  dDay, dHour, dMin,
  dSec, dTmp, dTmp2 :Integer;
begin
  Result := '-';
  if (Speed = 0) or (Total = 0) then Exit;

  dDay := 0; dHour := 0;
  dMin := 0; dTmp2 := 0; dTmp := 0;

  while dTmp2 <= Total do
  begin
    Inc(dTmp2, Round(Speed));
    Inc(dTmp, 1);
  end;

  dSec := dTmp;

  if dSec > 60 then
  repeat
    Dec(dSec, 60);
    Inc(dMin, 1);
  until dSec < 60;

  if dMin > 60 then
  repeat
    Dec(dMin, 60);
    Inc(dHour, 1);
  until dMin < 60;

  if dHour > 24 then
  repeat
    Dec(dHour, 24);
    Inc(dDay, 1);
  until dHour < 24;

  Result := IntToStr(dDay) + 'd ' + IntToStr(dHour) + 'h ' +
    IntToStr(dMin) + 'm ' + IntToStr(dSec) + 's';
end;

function GetPercent(c1,c2:Cardinal):String;
var
  ePercent:Extended;
begin
  ePercent := c1 / c2;
  if trunc(ePercent * 100) <= 100 then
    Result := IntToStr(trunc(ePercent * 100)) + ' %'
  else
    Result := '100 %';
end;
//-----

procedure TFormFilesTransfers.OnClientRead(Sender: TObject; Datas: Integer);
var
  TmpStr: string;
begin
  TmpStr := Self.Caption;

  if Pos('Download', TmpStr) > 0 then
  begin
    pb1.Position := Datas;
    Caption := 'Download (' + GetPercent(Datas, pb1.Max) + ')';
  end
  else
  begin
    pb1.Position := pb1.Position + Datas;
    Caption := 'Upload (' + GetPercent(Datas, pb1.Max) + ')';
  end;

  TickCount := GetTickCount - TickBefore;
  if TickCount >= 1000 then Speed := (Datas div TickCount) * 1024;

  lbl2.Caption := 'Filesize: ' + FileSizeToStr(Datas) + '/' + FileSizeToStr(pb1.Max);
  lbl3.Caption := 'Time left: ' + TimeLeft(Speed, pb1.Max);
  lbl4.Caption := 'Speed: ' + FileSizeToStr(Round(Datas)) + '/s';

  Application.ProcessMessages; //don't be frozen when receiving datas
end;

procedure TFormFilesTransfers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TFormFilesTransfers.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormFilesTransfers.FormShow(Sender: TObject);
begin
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  //store actual tickcount
  TickBefore := GetTickCount;
end;

end.
