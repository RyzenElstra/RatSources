library Ic0nic;

uses
  Windows,
  SysUtils,
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain};

//Constants for plugin infos
const
  //Kind of plugin you can create for PureRAT
  PluginType: array[0..2] of string = ('Client', 'Builder', 'Server'); //(*)
  
  //Main plugin infos
  PluginName = 'Ic0nic';
  PluginAuthor = 'wrh1d3';
  PluginDescription = 'Simple icon changer';
  PluginVersion = '1.0.0.0';

  //[NOTE]
  
  {(*) PureRAT use a reverse connection model, so the client is the part
     installed on remote machine, the builder is the client builder on main application and
		 the server the main application itself}
          
//Variables for plugin options
var
  ClientPath: PChar; //Full path of built client

//Function to retrieve plugin infos
function PluginInfos: PChar; stdcall;
begin
  Result := PChar(PluginName + '|' +
                  PluginAuthor + '|' +
                  PluginDescription + '|' +
                  PluginVersion + '|' +
                  PluginType[1] + '|'); //Specify the plugin type by index (1 -> Builder)
end;
//-----
   
//Function to set plugin options
procedure PluginOptions(_ClientPath: PChar); stdcall;
begin
  ClientPath := _ClientPath;
end;
//-----

//Function to be executed
procedure PluginFunction; stdcall;
var
  Msg: TMsg;
begin
  FormMain := TFormMain.Create(Application);
  FormMain.SetInfos(ClientPath);
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
  PluginOptions,  //Options for socket connection
  PluginFunction;	//Function to execute

begin
end.
 