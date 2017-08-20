unit uScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, PngBitBtn,winsock, ExtCtrls;

type
  TForm4 = class(TForm)
    stat1: TStatusBar;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    PngBitBtn1: TPngBitBtn;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    img1: TImage;
    pb1: TProgressBar;
    tmr1: TTimer;
    procedure PngBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    sStop:Boolean;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if PngBitBtn1.Caption = 'Start' then begin
sStop := False;
Data := '24 ' + Stat1.Panels[0].Text +  ' ' + inttostr(trackbar1.position) + ' ' + inttostr(trackbar2.position)+ #10;
Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
PngBitBtn1.Caption := 'Stop';
tmr1.Enabled := True;
end else begin
  sStop := True;
  tmr1.Enabled := false;
  PngBitBtn1.Caption := 'Start';
end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
sStop := True;
end;

procedure TForm4.tmr1Timer(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if btn1.Enabled = false then begin
  btn1.Enabled := True;
  Data := '24 ' + Stat1.Panels[0].Text +  ' ' + inttostr(trackbar1.position) + ' ' + inttostr(trackbar2.position)+ #10;
Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;
end;

end.
