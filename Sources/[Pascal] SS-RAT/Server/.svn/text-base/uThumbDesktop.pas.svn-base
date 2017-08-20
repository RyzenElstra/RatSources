Unit uThumbDesktop;

Interface

Uses
Windows,SysUtils,classes,Graphics;

type
  TRGBCol = record
    Blu, Grn, Red: byte;
end;
  TRGBArray = array[0..0] of TRGBCol;
  PRGBArray = ^TRGBArray;

Var
  TempStream:Tmemorystream;
  MYStream:Tmemorystream;

  ThumbColor : byte;

procedure ConvertToGray_16(bmp: TBitmap);
procedure My_GetScreenToBmp(DrawCur:Boolean;StreamName:TMemoryStream);
procedure MakeThumbNail(src, dest: TBitmap; ThumbSize,ThumbNailSize: Word);
Implementation

procedure MakeThumbNail(src, dest: TBitmap; ThumbSize,ThumbNailSize: Word);
type
  PRGB24 = ^TRGB24;
  TRGB24 = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
var
  x, y, ix, iy: integer;
  x1, x2, x3: integer;

  xscale, yscale: single;
  iRed, iGrn, iBlu, iRatio: Longword;
  p, c1, c2, c3, c4, c5: tRGB24;
  pt, pt1: pRGB24;
  iSrc, iDst, s1: integer;
  i, j, r, g, b, tmpY: integer;

  RowDest, RowSource, RowSourceStart: integer;
  w, h: integer;
  dxmin, dymin: integer;
  ny1, ny2, ny3: integer;
  dx, dy: integer;
  lutX, lutY: array of integer;

begin
  if src.PixelFormat <> pf24bit then src.PixelFormat := pf24bit;
  if dest.PixelFormat <> pf24bit then dest.PixelFormat := pf24bit;
  dest.Width := ThumbSize;
  dest.Height := ThumbNailSize;
  w := ThumbSize;
  h := ThumbNailSize;

  if (src.Width <= ThumbSize) and (src.Height <= ThumbNailSize) then
  begin
    dest.Assign(src);
    exit;
  end;

  iDst := (w * 24 + 31) and not 31;
  iDst := iDst div 8; //BytesPerScanline
  iSrc := (Src.Width * 24 + 31) and not 31;
  iSrc := iSrc div 8;

  xscale := 1 / (w / src.Width);
  yscale := 1 / (h / src.Height);

  // X lookup table
  SetLength(lutX, w);
  x1 := 0;
  x2 := trunc(xscale);
  for x := 0 to w - 1 do
  begin
    lutX[x] := x2 - x1;
    x1 := x2;
    x2 := trunc((x + 2) * xscale);
  end;

  // Y lookup table
  SetLength(lutY, h);
  x1 := 0;
  x2 := trunc(yscale);
  for x := 0 to h - 1 do
  begin
    lutY[x] := x2 - x1;
    x1 := x2;
    x2 := trunc((x + 2) * yscale);
  end;

  dec(w);
  dec(h);
  RowDest := integer(Dest.Scanline[0]);
  RowSourceStart := integer(Src.Scanline[0]);
  RowSource := RowSourceStart;
  for y := 0 to h do
  begin
    dy := lutY[y];
    x1 := 0;
    x3 := 0;
    for x := 0 to w do
    begin
      dx := lutX[x];
      iRed := 0;
      iGrn := 0;
      iBlu := 0;
      RowSource := RowSourceStart;
      for iy := 1 to dy do
      begin
        pt := PRGB24(RowSource + x1);
        for ix := 1 to dx do
        begin
          iRed := iRed + pt.R;
          iGrn := iGrn + pt.G;
          iBlu := iBlu + pt.B;
          inc(pt);
        end;
        RowSource := RowSource - iSrc;
      end;
      iRatio := 65535 div (dx * dy);
      pt1 := PRGB24(RowDest + x3);
      pt1.R := (iRed * iRatio) shr 16;
      pt1.G := (iGrn * iRatio) shr 16;
      pt1.B := (iBlu * iRatio) shr 16;
      x1 := x1 + 3 * dx;
      inc(x3, 3);
    end;
    RowDest := RowDest - iDst;
    RowSourceStart := RowSource;
  end;

  if dest.Height < 3 then exit;

  // Sharpening...
  s1 := integer(dest.ScanLine[0]);
  iDst := integer(dest.ScanLine[1]) - s1;
  ny1 := Integer(s1);
  ny2 := ny1 + iDst;
  ny3 := ny2 + iDst;
  for y := 1 to dest.Height - 2 do
  begin
    for x := 0 to dest.Width - 3 do
    begin
      x1 := x * 3;
      x2 := x1 + 3;
      x3 := x1 + 6;

      c1 := pRGB24(ny1 + x1)^;
      c2 := pRGB24(ny1 + x3)^;
      c3 := pRGB24(ny2 + x2)^;
      c4 := pRGB24(ny3 + x1)^;
      c5 := pRGB24(ny3 + x3)^;

      r := (c1.R + c2.R + (c3.R * -12) + c4.R + c5.R) div -8;
      g := (c1.G + c2.G + (c3.G * -12) + c4.G + c5.G) div -8;
      b := (c1.B + c2.B + (c3.B * -12) + c4.B + c5.B) div -8;

      if r < 0 then r := 0 else if r > 255 then r := 255;
      if g < 0 then g := 0 else if g > 255 then g := 255;
      if b < 0 then b := 0 else if b > 255 then b := 255;

      pt1 := pRGB24(ny2 + x2);
      pt1.R := r;
      pt1.G := g;
      pt1.B := b;
    end;
    inc(ny1, iDst);
    inc(ny2, iDst);
    inc(ny3, iDst);
  end;
end;




function GammaConv(Value: double; Gamma: double): double;
begin
  if Value <> 0 then
    Result := Exp(Ln(Value) / Gamma)
  else
    Result := 0;
end;
function CreateGrayPalette(Num: integer; Gamma: double): HPalette;
var
  lPal: PLogPalette;
  i: integer;
begin
  lPal := AllocMem(sizeof(TLogPalette) + Num * sizeof(TPaletteEntry));
  lPal.palVersion := $300;
  lPal.palNumEntries := Num;
  for i := 0 to Num - 1 do
    with lPal.palPalEntry[i] do
    begin
      peRed := Round(255 * GammaConv(i / (Num - 1), Gamma));
      peGreen := Round(255 * GammaConv(i / (Num - 1), Gamma));
      peBlue := Round(255 * GammaConv(i / (Num - 1), Gamma));
      peFlags := 0;
    end;
  Result := CreatePalette(lPal^);
  FreeMem(lPal);
end;
procedure ConvertToGray_16(bmp: TBitmap);
var
  gm: TBitmap; // Destination grayscale bitmap
  x, y: integer;
  p1: PRGBArray;
  p2: PByteArray;
  c: integer;
begin
  bmp.PixelFormat := pf24bit;
  // Convert to Grayscale
  gm := TBitmap.Create;
  gm.PixelFormat := pf4bit;
  gm.Width := bmp.Width;
  gm.Height := bmp.Height;

  gm.Palette := CreateGrayPalette(16, 1.4);

  for y := 0 to bmp.Height - 1 do
  begin
    p1 := bmp.ScanLine[y];
    p2 := gm.ScanLine[y];
    for x := 0 to bmp.Width - 1 do
      with p1^[x] do
      begin
        c := (Red * 3 + Grn * 4 + Blu) div (8 * 16);
        if (x and 1) = 1 then
        begin
          p2^[x div 2] := p2^[x div 2] and (not 15) or c;
        end
        else
        begin
          p2^[x div 2] := p2^[x div 2] and (15) or (c shl 4);
        end;
      end;
  end;

  bmp.Assign(gm);
  gm.Free;
end;

procedure My_GetScreenToBmp(DrawCur:Boolean;StreamName:TMemoryStream);
var
tbmp,Mybmp:Tbitmap;
Cursorx, Cursory: integer;
dc: hdc;
Mycan: Tcanvas;
R: TRect;
DrawPos: TPoint;
MyCursor: TIcon;
hld: hwnd;
Threadld: dword;
mp: tpoint;
pIconInfo: TIconInfo;
begin
  Mybmp := Tbitmap.Create;
  tbmp := Tbitmap.Create;
  Mycan := TCanvas.Create;
  dc := GetWindowDC(0);
  try
    Mycan.Handle := dc;
    R := Rect(0, 0,
    GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN));
    Mybmp.Width := R.Right;
    Mybmp.Height := R.Bottom;
    Mybmp.Canvas.CopyRect(R, Mycan, R);
  finally
    releaseDC(0, DC);
  end;
  Mycan.Handle := 0;
  Mycan.Free;
if DrawCur then
begin
  GetCursorPos(DrawPos);
  MyCursor := TIcon.Create;
  getcursorpos(mp);
  hld := WindowFromPoint(mp);
  Threadld := GetWindowThreadProcessId(hld, nil);
  AttachThreadInput(GetCurrentThreadId, Threadld, True);
  MyCursor.Handle := Getcursor();
  AttachThreadInput(GetCurrentThreadId, threadld, False);
  GetIconInfo(Mycursor.Handle, pIconInfo);
  cursorx := DrawPos.x - round(pIconInfo.xHotspot);
  cursory := DrawPos.y - round(pIconInfo.yHotspot);
  Mybmp.Canvas.Draw(cursorx, cursory, MyCursor);
  DeleteObject(pIconInfo.hbmColor);
  DeleteObject(pIconInfo.hbmMask);
  Mycursor.ReleaseHandle;
  MyCursor.Free;
end;
ThumbColor := 6;
  case ThumbColor of
    1: ConvertToGray_16(mybmp);
    2: mybmp.PixelFormat := pf4bit;
    3: mybmp.PixelFormat := pf8bit;
    4: Mybmp.PixelFormat := pf15bit;
    5: Mybmp.PixelFormat := pf24bit;
    6: Mybmp.PixelFormat := pf32bit;
  end;

  MakeThumbNail(mybmp,tbmp,96,96);

  tbmp.SaveToStream(StreamName);
  tbmp.Free;
  myBmp.Free;
end;


End.


 
