unit UnitRegistryManager;

interface

uses
  Windows, SysUtils;

function ListKeys(RegPath: string): string;
function ListValues(RegPath: string): string;
function AddRegValue(RegPath, ValueName, ValueType, Value: string): Boolean;
function AddRegKey(RegPath, KeyName: string):Boolean;
function DelRegKey(RegPath, KeyName: string): Boolean;
function DelRegValue(RegPath, ValueName: string): Boolean;

implementation
          
//From SSRAT 2.0 source code
//----
function ToKey(RegPath: String):HKEY;
begin
  if RegPath = 'HKEY_CLASSES_ROOT' then Result := HKEY_CLASSES_ROOT else
  if RegPath = 'HKEY_CURRENT_CONFIG' then Result := HKEY_CURRENT_CONFIG else
  if RegPath = 'HKEY_CURRENT_USER' then Result := HKEY_CURRENT_USER else
  if RegPath = 'HKEY_LOCAL_MACHINE' then Result := HKEY_LOCAL_MACHINE else
  if RegPath = 'HKEY_USERS' then Result := HKEY_USERS else Result := 0;
end;

function ListValues(RegPath: string): String;
var
  phkResult: HKEY;
  dwIndex, lpcbValueName,lpcbData: Cardinal;
  lpData: PChar;
  lpType: DWORD;
  lpValueName: PChar;
  strTipo, strDatos, Nombre: String;
  j, i: integer;
  DValue: PDWORD;
begin
  Result := '';
  if RegOpenKeyEx(ToKey(Copy(RegPath, 1, Pos('\', RegPath) - 1)),
    PChar(Copy(RegPath, Pos('\', RegPath) + 1, Length(RegPath))), 0, KEY_QUERY_VALUE, phkResult) <> ERROR_SUCCESS then exit;

  dwIndex := 0;
  GetMem(lpValueName, 16383);

  i := ERROR_SUCCESS;
  while i = ERROR_SUCCESS do
  begin
    i := RegEnumValue(phkResult, dwIndex, lpValueName, lpcbValueName, nil, @lpType, nil, @lpcbData);
    GetMem(lpData, lpcbData);
    lpcbValueName := 16383;
    i := RegEnumValue(phkResult, dwIndex, lpValueName, lpcbValueName, nil, @lpType, PByte(lpData), @lpcbData);
    if i = ERROR_SUCCESS then
    begin
      strDatos := '';

      if lpType = REG_DWORD  then
      begin
        DValue := PDWORD(lpData);
        strDatos := '0x' + IntToHex(DValue^, 8) + ' (' + IntToStr(DValue^) + ')'; //0xHexValue (IntValue)
      end
      else
      if lpType = REG_BINARY then
      begin
        if lpcbData = 0 then strDatos := '(No Datas)' else
          for j := 0 to lpcbData - 1 do strDatos := strDatos + IntToHex(Ord(lpData[j]), 2) + ' ';
      end
      else
      if lpType = REG_MULTI_SZ then
      begin
        for j := 0 to lpcbData - 1 do if lpData[j] = #0 then lpData[j] := ' ';
        strDatos := lpData;
      end
      else strDatos := lpData;

      if lpValueName[0] = #0 then Nombre := '(End)' else Nombre := lpValueName;

      case lpType of
        REG_BINARY: strTipo := 'REG_BINARY';
        REG_DWORD: strTipo := 'REG_DWORD';
        REG_DWORD_BIG_ENDIAN: strTipo := 'REG_DWORD_BIG_ENDIAN';
        REG_EXPAND_SZ: strTipo := 'REG_EXPAND_SZ';
        REG_LINK: strTipo := 'REG_LINK';
        REG_MULTI_SZ: strTipo := 'REG_MULTI_SZ';
        REG_NONE: strTipo := 'REG_NONE';
        REG_SZ: strTipo := 'REG_SZ';
      end;

      if strDatos = '' then strdatos := '(No Datas)';
      Result := Result + Nombre + '|' + strTipo + '|' + strDatos + '|' + #13#10;
      Inc(dwIndex);
    end;
    FreeMem(lpData);
  end;
  FreeMem(lpValueName);
  RegCloseKey(phkResult);
end;

function ListKeys(RegPath: String): String;
var
  phkResult: HKEY;
  lpName: PChar;
  lpcbName, dwIndex: Cardinal;  
  lpftLastWriteTime: FileTime;
begin
  Result := '';
  RegOpenKeyEx(ToKey(Copy(RegPath, 1, Pos('\', RegPath) - 1)),
    PChar(Copy(RegPath, Pos('\', RegPath) + 1, Length(RegPath))), 0, KEY_ENUMERATE_SUB_KEYS,phkResult);
  lpcbName := 255;
  GetMem(lpName, lpcbName);
  dwIndex := 0;
  while RegEnumKeyEx(phkResult, dwIndex, @lpName[0] , lpcbName, nil, nil, nil, @lpftLastWriteTime) = ERROR_SUCCESS do
  begin
    Result := Result + lpName + '|';
    Inc(dwIndex);
    lpcbName := 255;
  end;
  RegCloseKey(phkResult);
end;
//-----
         
//From PureRAT 10.0 source code, by wrh1d3 :)
//-----
function ToType(KeyType: string): Integer;
begin
  if KeyType = 'REG_DWORD' then Result := REG_DWORD;
  if KeyType = 'REG_BINARY' then Result := REG_BINARY;
  if KeyType = 'REG_EXPAND_SZ' then Result := REG_EXPAND_SZ;
  if KeyType = 'REG_MULTI_SZ' then Result := REG_MULTI_SZ;
  if KeyType = 'REG_SZ' then Result := REG_SZ;
end;

function AddRegValue(RegPath, ValueName, ValueType, Value: String): Boolean;
var
  RootKey, SubKey: string;
  dwValue: DWORD;
  phkResult: HKEY;
begin
  Result := False;
  RootKey := Copy(RegPath, 1, Pos('\', RegPath) - 1);
  Delete(RegPath, 1, Pos('\', RegPath));            
  if LastDelimiter('\', RegPath) > 0 then
  Delete(RegPath, Length(RegPath), LastDelimiter('\', RegPath));
  if RegOpenKeyEx(ToKey(RootKey), PChar(RegPath), 0, KEY_SET_VALUE, phkResult) <> 0 then Exit;

  case  ToType(ValueType) of
    REG_SZ: Result := RegSetValueEx(phkResult, PChar(ValueName), 0, ToType(ValueType),
      PChar(Value), Length(PChar(Value))) = 0;
    REG_EXPAND_SZ: Result := RegSetValueEx(phkResult, PChar(ValueName), 0, ToType(ValueType),
      PChar(Value), Length(PChar(Value))) = 0;
    REG_MULTI_SZ: Result := RegSetValueEx(phkResult, PChar(ValueName), 0, ToType(ValueType),
      PChar(Value), Length(PChar(Value))) = 0;
    REG_DWORD:  begin
                  dwValue := StrToInt(Value);
                  Result := RegSetValueEx(phkResult, PChar(ValueName), 0, ToType(ValueType),
                    @dwValue, SizeOf(DWORD)) = 0;
                end;
    REG_BINARY: Result := RegSetValueEx(phkResult, PChar(ValueName), 0, ToType(ValueType),
      PChar(Value), Length(PChar(Value))) = 0;
  end;

  RegCloseKey(phkResult);
end;

function AddRegKey(RegPath, KeyName: string):Boolean;
var
  RootKey: string;
  phkResult: HKEY;
begin
  Result := False;
  RootKey := Copy(RegPath, 1, Pos('\', RegPath) - 1);
  Delete(RegPath, 1, Pos('\', RegPath));
  Result := RegCreateKey(ToKey(RootKey), PChar(RegPath + '\' + KeyName), phkResult) = 0;
  RegCloseKey(phkResult);
end;

function DelRegValue(RegPath, ValueName: string): Boolean;
var
  RootKey, SubKey: string;
  phkResult:  HKEY;
begin                                                            
  Result := False;
  RootKey := Copy(RegPath, 1, Pos('\', RegPath) - 1);
  Delete(RegPath, 1, Pos('\', RegPath));
  if LastDelimiter('\', RegPath) > 0 then
  Delete(RegPath, Length(RegPath), LastDelimiter('\', RegPath));
  if RegOpenKeyEx(ToKey(RootKey), PChar(RegPath), 0, KEY_SET_VALUE, phkResult) <> 0 then Exit;
  Result := RegDeleteValue(phkResult, PChar(ValueName)) = 0;
  RegCloseKey(phkResult);
end;

function SHDeleteKey(key: HKEY; SubKey: PChar): Cardinal; stdcall;
  external 'shlwapi.dll' name 'SHDeleteKeyA';

function DelRegKey(RegPath, KeyName: string): Boolean;
var
  RootKey: string;
  phkResult: HKEY;
begin
  Result := False;
  RootKey := Copy(RegPath, 1, Pos('\', RegPath) - 1);
  Delete(RegPath, 1, Pos('\', RegPath));
  if RegPath[Length(RegPath)] <> '\' then RegPath := RegPath + '\';
  if RegOpenKeyEx(ToKey(RootKey), PChar(RegPath), 0, KEY_WRITE, phkResult) <> 0 then Exit;
  Result := SHDeleteKey(ToKey(RootKey), PChar(RegPath + KeyName + '\')) = 0;
  RegCloseKey(phkResult);
end;
//-----

end.
