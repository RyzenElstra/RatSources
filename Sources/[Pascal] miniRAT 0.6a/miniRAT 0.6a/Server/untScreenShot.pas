unit untScreenShot;
interface
uses
  Windows,pngimage, pngzlib, pnglang,classes;

const
  WM_CAP_START = $0400;
  WM_CAP_DRIVER_CONNECT = $0400 + 10;
  WM_CAP_DRIVER_DISCONNECT = $0400 + 11;
  WM_CAP_SAVEDIB = $0400 + 25;
  WM_CAP_GRAB_FRAME = $0400 + 60;
  WM_CAP_STOP = $0400 + 68;
var
x,y:integer;
function CaptureWND(hWindow:HWND;Ratio:Extended;bitCount:integer;var x,y:integer):HBITMAP;
function capCreateCaptureWindowA(lpszWindowName: pchar; dwStyle: dword; x, y, nWidth, nHeight: word; ParentWin: dword; nId: word): dword; stdcall external 'AVICAP32.DLL';
implementation
function CaptureWND(hWindow:HWND;Ratio:Extended;bitCount:integer;var x,y:integer):HBITMAP;
var  BmpInfo:BITMAPINFO; DC1,DC2:hDC; p:Pointer;  old:hgdiobj;
begin
    if hWindow = 0 then hWindow := GetDesktopWindow();
    DC1 := GetDC(hWindow);
    x := GetDeviceCaps(DC1,HORZRES);
    y := GetDeviceCaps(DC1,VERTRES);

    ZeroMemory(@BmpInfo.bmiHeader, sizeof(BITMAPINFOHEADER));
    BmpInfo.bmiHeader.biWidth := round(x * RATIO);
    BmpInfo.bmiHeader.biHeight := round(y * RATIO);
    BmpInfo.bmiHeader.biPlanes := 1;
    BmpInfo.bmiHeader.biBitCount := bitCount;
    BmpInfo.bmiHeader.biSize := sizeof(BITMAPINFOHEADER);
    DC2 := CreateCompatibleDC(0);
    Result := CreateDIBSection(DC2,BmpInfo, DIB_RGB_COLORS,p, 0, 0);
    Old := SelectObject(DC2, Result);
    if(RATIO <> 1)then
     begin
        SetStretchBltMode(DC2, HALFTONE); SetBrushOrgEx(DC2, 0, 0, nil);
        StretchBlt(DC2, 0, 0, BmpInfo.bmiHeader.biWidth, BmpInfo.bmiHeader.biHeight, DC1, 0, 0, x, y, SRCCOPY);
     end
    else BitBlt(DC2, 0, 0, BmpInfo.bmiHeader.biWidth, BmpInfo.bmiHeader.biHeight, DC1, 0, 0, SRCCOPY);
    SelectObject(DC2,Old);
    DeleteDC(DC2); ReleaseDC(hWindow, DC1);
    x := BmpInfo.bmiHeader.biWidth;
    y := BmpInfo.bmiHeader.biHeight;
end;

function GetBitmapFromFile(BitmapPath: string): HBitmap;
begin
  Result := LoadImage(GetModuleHandle(nil), pchar(BitmapPath), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
end;



function GetBitmapFromDesktop: HBitmap;
var
  DC, MemDC: HDC;
  Bitmap, OBitmap: HBitmap;
  BitmapWidth, BitmapHeight: integer;
  Capture:hbitmap;

begin
  Capture := CaptureWND(0,1,24,x,y);
  DC := GetDC(Capture);
  MemDC := CreateCompatibleDC(DC);
  BitmapWidth := GetDeviceCaps(DC, 8);
  BitmapHeight := GetDeviceCaps(DC, 10);
  Bitmap := CreateCompatibleBitmap(DC, BitmapWidth, BitmapHeight);
  OBitmap := SelectObject(MemDC, Bitmap);
  BitBlt(MemDC, 0, 0, BitmapWidth, BitmapHeight, DC, 0, 0, SRCCOPY);
  SelectObject(MemDC, OBitmap);
  DeleteDC(MemDC);
  ReleaseDC(GetDesktopWindow, DC);
  Result := Bitmap;
end;
end.
