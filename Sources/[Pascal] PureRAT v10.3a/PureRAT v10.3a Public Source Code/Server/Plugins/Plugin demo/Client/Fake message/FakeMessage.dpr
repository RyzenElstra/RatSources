{
	This example show you how to create your own plugins for PureRAT.
	Respect everything and follow all comments to be sure that all will work fine. Thank you!
	
	-> wrh1d3
}

library FakeMessage;

uses
  Windows,
  SysUtils;
                    
//Constants for plugin infos										
const
  //Kind of plugin you can create for PureRAT
  PluginType: array[0..2] of string = ('Client', 'Builder', 'Server'); //(*)
  
  //Main plugin infos
  PluginName = 'Fake message';
  PluginAuthor = 'wrh1d3';
  PluginDescription = 'Display a fake message';
  PluginVersion = '1.0.0.0';

  //[NOTE]
  
  {(*) PureRAT use a reverse connection model, so the client is the part
     installed on remote machine, the builder is the client builder on main application and
		 the server the main application itself}
	
//Function to retrieve plugin infos
function PluginInfos: PChar; stdcall;
begin
  Result := PChar(PluginName + '|' +
                  PluginAuthor + '|' +
                  PluginDescription + '|' +
                  PluginVersion + '|' +
                  PluginType[0] + '|'); //Specify the plugin type by index (0 -> Client)
end;
//-----

//Function to be executed
procedure PluginFunction; stdcall;
begin
	MessageBox(0, 'You have been hacked by wrh1d3!', 'J3kill Soft.', MB_ICONINFORMATION);
end;
//-----

// Don't edit following lines!!
exports
  PluginInfos,    //Infos about plugin
  PluginFunction;	//Function to execute

begin
end.
