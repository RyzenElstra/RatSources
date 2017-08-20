unit UnitConnection;

interface

uses
  Windows, ComCtrls, Forms, SysUtils, SocketUnitEx, UnitEncryption, UnitMain;

type
  PClientDatas = ^TClientdatas;
  TClientDatas = class //store all datas of connected client here
    ClientSocket: TClientSocket; //clientsocket id
    Item: TListItem; //item data in lvConnections
    LocalPort: Word; //local port of clientsocket connection
    Forms: array[0..9] of TForm; //own client forms (TFormFilesManager, TFormShell, ...)
    procedure SendDatas(Datas: string);
  end;

function OpenPort(Port: Word): Boolean;
procedure ClosePort(Port: Word);

implementation

var
  ServerSocketThread: array[1..65535] of TServerSocketThread;

function OpenPort(Port: Word): Boolean; //open port to start listening on
var
  ServerSocket: TServerSocket;
begin
  try
    //first check if port is already open
    ServerSocket := TServerSocket.Create;
    Result := ServerSocket.Listen(Port);
    ServerSocket.StopListening;
    ServerSocket.Free;
  except
  end;

  if Result = False then Exit;

  //create a serversocketthread id for port number 
  ServerSocketThread[Port] := TServerSocketThread.Create();
  ServerSocketThread[Port].OnClientConnect := FormMain.OnClientConnect;
  ServerSocketThread[Port].OnClientDisconnect := FormMain.OnClientDisconnect;
  ServerSocketThread[Port].OnClientRead := FormMain.OnClientRead; //set clientsocket events handle
  ServerSocketThread[Port].Port := Port; //set listening port
  ServerSocketThread[Port].Resume; //start our serversocketthread with port number as ids
end;                                      

procedure ClosePort(Port: Word); //close open port
var
  ClientDatas: TClientDatas;
  i: Integer;
begin                                              
  //first close all connection on port
  for i := 0 to FormMain.lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(FormMain.lvConnections.Items.Item[i].Data);
    if ClientDatas = nil then Continue;
    if ClientDatas.LocalPort = Port then ClientDatas.ClientSocket.Disconnect;
  end;

  try
    ServerSocketThread[Port].StopServer; //now stop serverthread on this port
  except
  end;
end;

procedure TClientDatas.SendDatas(Datas: string); //we can send datas to client only here
begin
  if Datas = '' then Exit; //send encrypted datas or not to client through clientsocket
  if FormMain.edtEncryption.Text <> '' then
    Datas := EncryptString(Datas, FormMain.edtEncryption.Text);
  ClientSocket.SendText(Datas);
end;

end.
