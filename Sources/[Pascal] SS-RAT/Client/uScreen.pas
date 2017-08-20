unit uScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,winsock, ExtCtrls,ZLIB;

type
  TForm4 = class(TForm)
    stat1: TStatusBar;
    btn1: TButton;
    img1: TImage;
    tmr1: TTimer;
    PngBitBtn1: TBitBtn;
    procedure PngBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    sStop:Boolean;
    sScreenShotStr:string;
    MyFirstBmp:TMemoryStream;
    MySecondBmp:TMemoryStream;
    MyTempStream:TMemoryStream;
    MyCompareBmp:TMemoryStream;
    unPackStream:TMemoryStream;

    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses uFilemanager;

{$R *.dfm}

procedure TForm4.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if PngBitBtn1.Caption = 'Start' then begin
sStop := False;
Data := '24|' + Stat1.Panels[0].Text +  '||' + #10;
Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
PngBitBtn1.Caption := 'Stop';
//tmr1.Enabled := True;
end else begin
  sStop := True;
  //tmr1.Enabled := false;
  PngBitBtn1.Caption := 'Start';
end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
sStop := True;
end;
procedure StringToStream(AString: string; ADest: TStream);
// Takes a string and appends it to a stream.
var len: longint;
begin
  len := Length(AString);
  ADest.WriteBuffer(len, SizeOf(len));
  ADest.WriteBuffer(AString[1], len);
end;
procedure DecompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf: Pointer;
  OutBytes, sz: Integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  sz     := inpStream.Size - inpStream.Position;
  if sz > 0 then 
    try
      GetMem(InpBuf, sz);
      inpStream.Read(InpBuf^, sz);
      DecompressBuf(InpBuf, sz, 0, OutBuf, OutBytes);
      outStream.Write(OutBuf^, OutBytes);
    finally
      if InpBuf <> nil then FreeMem(InpBuf);
      if OutBuf <> nil then FreeMem(OutBuf);
    end;
  outStream.Position := 0;
end;
end.
