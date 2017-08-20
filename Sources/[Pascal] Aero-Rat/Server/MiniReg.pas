unit MiniReg;

{
  lightweight replacement for TRegistry. Does not use Classes or SysUtils. Intended
  for space-limited applets where only the commonly used functions are necessary.
  Returns True if Successful, else False.

  Written by Ben Hochstrasser (bhoc@surfeu.ch).
  This code is GPL.

  Function Examples:

  procedure TForm1.Button1Click(Sender: TObject);
  var
    ba1, ba2: array of byte;
    n: integer;
    s: String;
    d: Cardinal;
  begin
    setlength(ba1, 10);
    for n := 0 to 9 do ba1[n] := byte(n);

    RegSetString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestString', 'TestMe');
    RegSetExpandString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestExpandString', '%SystemRoot%\Test');
    RegSetMultiString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestMultiString', 'String1'#0'String2'#0'String3');
    RegSetDword(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestDword', 7);
    RegSetBinary(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestBinary', ba1);

    To set the default value for a key, end the key name with a '\':
    RegSetString(HKEY_CURRENT_USER, 'Software\My Company\Test\', 'Default Value');
    RegGetString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestString', s);
    RegGetMultiString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestMultiString', s);
    RegGetExpandString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestExpandString', s);
    RegGetAnyString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestMultiString', s, StringType);
    RegSetAnyString(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestMultiString', s, StringType);
    RegGetDWORD(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestDword', d);
    RegGetBinary(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestBinary', s);
    SetLength(ba2, Length(s));
    for n := 1 to Length(s) do ba2[n-1] := byte(s[n]);
    Button1.Caption := IntToStr(Length(ba2));

    if RegKeyExists(HKEY_CURRENT_USER, 'Software\My Company\Test\foo') then
      if RegValueExists(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestBinary') then
        MessageBox(GetActiveWindow, 'OK', 'OK', MB_OK);
    RegDelValue(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar\TestString');
    RegDelKey(HKEY_CURRENT_USER, 'Software\My Company\Test\foo\bar');
    RegDelKey(HKEY_CURRENT_USER, 'Software\My Company\Test\foo');
    RegDelKey(HKEY_CURRENT_USER, 'Software\My Company\Test');
    RegDelKey(HKEY_CURRENT_USER, 'Software\My Company');
    if RegEnumKeys(HKEY_CURRENT_USER, 'Software\My Company', s) then
      ListBox1.Text := s;
    if RegEnumValues(HKEY_CURRENT_USER, 'Software\My Company', s) then
      ListBox1.Text := s;
    if RegConnect('\\server1', HKEY_LOCAL_MACHINE, RemoteKey) then
    begin
      RegGetString(RemoteKey, 'Software\My Company\Test\foo\bar\TestString', s);
      RegDisconnect(RemoteKey);
    end;
  end;
}

interface

uses Windows;

function RegSetString(RootKey: HKEY; Name: String; Value: String): boolean;
function RegSetMultiString(RootKey: HKEY; Name: String; Value: String): boolean;
function RegSetExpandString(RootKey: HKEY; Name: String; Value: String): boolean;
function RegSetDWORD(RootKey: HKEY; Name: String; Value: Cardinal): boolean;
function RegSetBinary(RootKey: HKEY; Name: String; Value: Array of Byte): boolean;
function RegGetString(RootKey: HKEY; Name: String; Var Value: String): boolean;
function RegGetMultiString(RootKey: HKEY; Name: String; Var Value: String): boolean;
function RegGetExpandString(RootKey: HKEY; Name: String; Var Value: String): boolean;
function RegGetAnyString(RootKey: HKEY; Name: String; Var Value: String; Var ValueType: Cardinal): boolean;
function RegSetAnyString(RootKey: HKEY; Name: String; Value: String; ValueType: Cardinal): boolean;
function RegGetDWORD(RootKey: HKEY; Name: String; Var Value: Cardinal): boolean;
function RegGetBinary(RootKey: HKEY; Name: String; Var Value: String): boolean;
function RegGetValueType(RootKey: HKEY; Name: String; var Value: Cardinal): boolean;
function RegValueExists(RootKey: HKEY; Name: String): boolean;
function RegKeyExists(RootKey: HKEY; Name: String): boolean;
function RegDelValue(RootKey: HKEY; Name: String): boolean;
function RegDelKey(RootKey: HKEY; Name: String): boolean;
function RegDelKeyEx(RootKey: HKEY; Name: String; WithSubKeys: Boolean = True): boolean;
function RegConnect(MachineName: String; RootKey: HKEY; var RemoteKey: HKEY): boolean;
function RegDisconnect(RemoteKey: HKEY): boolean;
function RegEnumKeys(RootKey: HKEY; Name: String; var KeyList: String): boolean;
function RegEnumValues(RootKey: HKEY; Name: String; var ValueList: String): boolean;
function _regCreateKey(hkKey: HKEY; lpSubKey: PChar): Boolean;
function _regDeleteKey(hkKey: HKEY; lpSubKey: PChar): Boolean;

implementation



function _regDeleteKey(hkKey: HKEY; lpSubKey: PChar): Boolean;
begin
  Result := RegDeleteKey(hkKey, lpSubKey) = ERROR_SUCCESS;
end;


function _regCreateKey(hkKey: HKEY; lpSubKey: PChar): Boolean;
var
  phkResult: HKEY;
begin
  Result := RegCreateKey(hkKey, lpSubKey, phkResult) = ERROR_SUCCESS;
  RegCloseKey(phkResult);
end;

function LastPos(Needle: Char; Haystack: String): integer;
begin
  for Result := Length(Haystack) downto 1 do
    if Haystack[Result] = Needle then
      Break;
end;

function RegConnect(MachineName: String; RootKey: HKEY; var RemoteKey: HKEY): boolean;
begin
  Result := (RegConnectRegistry(PChar(MachineName), RootKey, RemoteKey) = ERROR_SUCCESS);
end;

function RegDisconnect(RemoteKey: HKEY): boolean;
begin
  Result := (RegCloseKey(RemoteKey) = ERROR_SUCCESS);
end;

function RegSetValue(RootKey: HKEY; Name: String; ValType: Cardinal; PVal: Pointer; ValSize: Cardinal): boolean;
var
  SubKey: String;
  n: integer;
  dispo: DWORD;
  hTemp: HKEY;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);
    if RegCreateKeyEx(RootKey, PChar(SubKey), 0, nil, REG_OPTION_NON_VOLATILE, KEY_WRITE, nil, hTemp, @dispo) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      if SubKey = '' then
        Result := (RegSetValueEx(hTemp, nil, 0, ValType, PVal, ValSize) = ERROR_SUCCESS)
      else
        Result := (RegSetValueEx(hTemp, PChar(SubKey), 0, ValType, PVal, ValSize) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function RegGetValue(RootKey: HKEY; Name: String; ValType: Cardinal; var PVal: Pointer; var ValSize: Cardinal): boolean;
var
  SubKey: String;
  n: integer;
  MyValType: DWORD;
  hTemp: HKEY;
  Buf: Pointer;
  BufSize: Cardinal;
  PKey: PChar;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);
    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, KEY_READ, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      if SubKey = '' then
        PKey := nil
      else
        PKey := PChar(SubKey);
      if RegQueryValueEx(hTemp, PKey, nil, @MyValType, nil, @BufSize) = ERROR_SUCCESS then
      begin
        GetMem(Buf, BufSize);
        if RegQueryValueEx(hTemp, PKey, nil, @MyValType, Buf, @BufSize) = ERROR_SUCCESS then
        begin
          if ValType = MyValType then
          begin
            PVal := Buf;
            ValSize := BufSize;
            Result := True;
          end else
          begin
            FreeMem(Buf);
          end;
        end else
        begin
          FreeMem(Buf);
        end;
      end;
      RegCloseKey(hTemp);
    end;
  end;
end;

function RegSetAnyString(RootKey: HKEY; Name: String; Value: String; ValueType: Cardinal): boolean;
begin
  case ValueType of
    REG_SZ, REG_EXPAND_SZ:
      Result := RegSetValue(RootKey, Name, ValueType, PChar(Value + #0), Length(Value) + 1);
    Reg_MULTI_SZ:
      Result := RegSetValue(RootKey, Name, ValueType, PChar(Value + #0#0), Length(Value) + 2);
  else
    Result := False;
  end;
end;

function RegSetString(RootKey: HKEY; Name: String; Value: String): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_SZ, PChar(Value + #0), Length(Value) + 1);
end;

function RegSetMultiString(RootKey: HKEY; Name: String; Value: String): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_MULTI_SZ, PChar(Value + #0#0), Length(Value) + 2);
end;

function RegSetExpandString(RootKey: HKEY; Name: String; Value: String): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_EXPAND_SZ, PChar(Value + #0), Length(Value) + 1);
end;

function RegSetDword(RootKey: HKEY; Name: String; Value: Cardinal): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_DWORD, @Value, SizeOf(Cardinal));
end;

function RegSetBinary(RootKey: HKEY; Name: String; Value: Array of Byte): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_BINARY, @Value[Low(Value)], length(Value));
end;

function RegGetString(RootKey: HKEY; Name: String; Var Value: String): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  Value := '';
  if RegGetValue(RootKey, Name, REG_SZ, Buf, BufSize) then
  begin
    Dec(BufSize);
    SetLength(Value, BufSize);
    if BufSize > 0 then
      Move(Buf^, Value[1], BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function RegGetMultiString(RootKey: HKEY; Name: String; Var Value: String): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  Value := '';
  if RegGetValue(RootKey, Name, REG_MULTI_SZ, Buf, BufSize) then
  begin
    Dec(BufSize);
    SetLength(Value, BufSize);
    if BufSize > 0 then
      Move(Buf^, Value[1], BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function RegGetExpandString(RootKey: HKEY; Name: String; Var Value: String): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  Value := '';
  if RegGetValue(RootKey, Name, REG_EXPAND_SZ, Buf, BufSize) then
  begin
    Dec(BufSize);
    SetLength(Value, BufSize);
    if BufSize > 0 then
      Move(Buf^, Value[1], BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function RegGetAnyString(RootKey: HKEY; Name: String; Var Value: String; Var ValueType: Cardinal): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
  bOK: Boolean;
begin
  Result := False;
  Value := '';
  if RegGetValueType(Rootkey, Name, ValueType) then
  begin
    case ValueType of
      REG_SZ, REG_EXPAND_SZ, REG_MULTI_SZ:
        bOK := RegGetValue(RootKey, Name, ValueType, Buf, BufSize);
    else
      bOK := False;
    end;
    if bOK then
    begin
      Dec(BufSize);
      SetLength(Value, BufSize);
      if BufSize > 0 then
        Move(Buf^, Value[1], BufSize);
      FreeMem(Buf);
      Result := True;
    end;
  end;
end;

function RegGetDWORD(RootKey: HKEY; Name: String; Var Value: Cardinal): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  Value := 0;
  if RegGetValue(RootKey, Name, REG_DWORD, Buf, BufSize) then
  begin
    Value := PDWord(Buf)^;
    FreeMem(Buf);
    Result := True;
  end;
end;

function RegGetBinary(RootKey: HKEY; Name: String; Var Value: String): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  Value := '';
  if RegGetValue(RootKey, Name, REG_BINARY, Buf, BufSize) then
  begin
    SetLength(Value, BufSize);
    Move(Buf^, Value[1], BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function RegValueExists(RootKey: HKEY; Name: String): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);
    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, KEY_READ, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegQueryValueEx(hTemp, PChar(SubKey), nil, nil, nil, nil) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function RegGetValueType(RootKey: HKEY; Name: String; var Value: Cardinal): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
  ValType: Cardinal;
begin
  Result := False;
  Value := REG_NONE;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);
    if (RegOpenKeyEx(RootKey, PChar(SubKey), 0, KEY_READ, hTemp) = ERROR_SUCCESS) then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      if SubKey = '' then
        Result := (RegQueryValueEx(hTemp, nil, nil, @ValType, nil, nil) = ERROR_SUCCESS)
      else
        Result := (RegQueryValueEx(hTemp, PChar(SubKey), nil, @ValType, nil, nil) = ERROR_SUCCESS);
      if Result then
        Value := ValType;
      RegCloseKey(hTemp);
    end;
  end;
end;

function RegKeyExists(RootKey: HKEY; Name: String): boolean;
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

function RegDelValue(RootKey: HKEY; Name: String): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);
    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, KEY_WRITE, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegDeleteValue(hTemp, PChar(SubKey)) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function RegDelKey(RootKey: HKEY; Name: String): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);
    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, KEY_WRITE, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegDeleteKey(hTemp, PChar(SubKey)) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function RegDelKeyEx(RootKey: HKEY; Name: String; WithSubKeys: Boolean = True): boolean;
const
  MaxBufSize: Cardinal = 1024;
var
  iRes: integer;
  hTemp: HKEY;
  Buf: String;
  BufSize: Cardinal;
begin
  Result := False;
  // no root keys...
  if pos('\', Name) <> 0 then
  begin
    iRes := RegOpenKeyEx(RootKey, PChar(Name), 0, KEY_ENUMERATE_SUB_KEYS or KEY_WRITE, hTemp);
    if WithSubKeys then
    begin
      while iRes = ERROR_SUCCESS do
      begin
        BufSize := MaxBufSize;
        SetLength(Buf, BufSize);
        iRes := RegEnumKeyEx(hTemp, 0, @Buf[1], BufSize, nil, nil, nil, nil);
        if iRes = ERROR_NO_MORE_ITEMS then
        begin
          RegCloseKey(hTemp);
          Result := (RegDeleteKey(RootKey, PChar(Name)) = ERROR_SUCCESS);
        end else
        begin
          if iRes = ERROR_SUCCESS then
          begin
            SetLength(Buf, BufSize);
            if RegDelKeyEx(RootKey, Concat(Name, '\', Buf), WithSubKeys) then
              iRes := ERROR_SUCCESS
            else
              iRES := ERROR_BADKEY;
          end;
        end;
      end;
    end else
    begin
      RegCloseKey(hTemp);
      Result := (RegDeleteKey(RootKey, PChar(Name)) = ERROR_SUCCESS);
    end;
  end;
end;

function IntToStr(I: integer): string;
begin
  Str(I, Result);
end;

function MyRegReadString(Key: HKey; SubKey: string; DataType: integer; Data: string): string;
var
  RegKey: HKey;
  Buffer: array[0..9999] of Char;
  BufSize: Integer;
begin
  BufSize := SizeOf(Buffer);
  Result := '';
  if RegOpenKey(Key,pchar(SubKey),RegKey) = ERROR_SUCCESS then begin;
    if RegQueryValueEx(RegKey, pchar(Data), nil,  @DataType, @Buffer, @BufSize) = ERROR_SUCCESS then begin;
      RegCloseKey(RegKey);
      Result := string(Buffer);
    end;
  end;
end;


function RegEnum(RootKey: HKEY; Name: String; var ResultList: String; const DoKeys: Boolean): boolean;
var
  i: integer;
  iRes: integer;
  s: String;
  hTemp: HKEY;
  Buf: Pointer;
  BufSize: Cardinal;
  regtype: dword;
  regdata: string;
  regdworddata: dword;
  valset: bool;
begin
  Result := False;
  ResultList := '';
  if RegOpenKeyEx(RootKey, PChar(Name), 0, KEY_READ, hTemp) = ERROR_SUCCESS then begin
    Result := True;
    BufSize := 1024;
    GetMem(buf, BufSize);
    i := 0;
    iRes := ERROR_SUCCESS;
    while iRes = ERROR_SUCCESS do begin
      BufSize := 1024;
      if DoKeys then iRes := RegEnumKeyEx(hTemp, i, buf, BufSize, nil, nil, nil, nil)
      else iRes := RegEnumValue(hTemp, i, buf, BufSize, nil, nil, nil, nil);


      if iRes = ERROR_SUCCESS then begin
        SetLength(s, BufSize);

        Move(buf^, s[1], BufSize);


        //if s = '' then
        //if ResultList = '' then ResultList := s;
        //end else begin
          //messagebox(0,pchar(Name + s),'',0);
          reggetvaluetype(RootKey,Name + s,regtype);

          valset := false;

          if regtype = REG_DWORD then begin
            RegGetDword(RootKey,Name + s,RegDwordData);
            s := s + '|' + inttostr(regtype) + '|' + inttostr(RegDwordData) + #13#10;
            valset := true;
          end;

          if regtype = REG_BINARY then begin
            RegGetBinary(RootKey,Name + s,regdata);
            s := s + '|' + inttostr(regtype) + '|' + regdata+ #13#10;
            valset := true;
          end;

          if not valset then begin
            reggetanystring(RootKey,Name + s,regdata,regtype);
            s := s + '|' + inttostr(regtype) + '|' + regdata + #13#10;
          end;


          ResultList := ResultList + s;


        //end;

        inc(i);
      end;

    end;
    FreeMem(buf);
    RegCloseKey(hTemp);
  end;
end;

function RegEnumValues(RootKey: HKEY; Name: String; var ValueList: String): boolean;
begin
  Result := RegEnum(RootKey, Name, ValueList, False);
end;

function RegEnumKeys(RootKey: HKEY; Name: String; var KeyList: String): boolean;
begin
  Result := RegEnum(RootKey, Name, KeyList, True);
end;

end.
