Unit untFunc;
Interface
Uses
  Windows, Winsock, Classes, SysUtils;

Function Explode(sDelimiter: String; sSource: String): TStringList;
Function GetIPFromHost(Const HostName: String): String;
Function sComputer(): String;
Function sUsername(): String;
Function GetLAN():String;
Function GetOS: String;
Function GetWindowsLanguage: String;
Function IsUserAdmin: Boolean;

Implementation

Function Explode(sDelimiter: String; sSource: String): TStringList;
Var
  c: Word;
Begin
  Result := TStringList.Create;
  C := 0;

  While sSource <> '' Do
  Begin
    If Pos(sDelimiter, sSource) > 0 Then
    Begin
      Result.Add(Copy(sSource, 1, Pos(sDelimiter, sSource) - 1 ));
      Delete(sSource, 1, Length(Result[c]) + Length(sDelimiter));
    End
    Else
    Begin
      Result.Add(sSource);
      sSource := ''
    End;

    Inc(c);
  End;
End;

Function GetIPFromHost(Const HostName: String): String;
Type
  TaPInAddr = Array[0..10] Of PInAddr;
  PaPInAddr = ^TaPInAddr;
Var
  phe: PHostEnt;
  pptr: PaPInAddr;
  i: Integer;
Begin
  Result := '';
  phe := GetHostByName(PChar(HostName));

  If phe = nil Then Exit;

  pPtr := PaPInAddr(phe^.h_addr_list);
  i := 0;

  While pPtr^[i] <> Nil Do
  Begin
    Result := inet_ntoa(pptr^[i]^);
    Inc(i);
  End;
End;

Function sComputer(): String;
Var
  sTemp: Array[0..255] Of Char;
  cSize: Cardinal;
Begin
  cSize := SizeOf(sTemp);

  If GetComputerName(sTemp, cSize) = True Then
    Result := String(sTemp)
  Else
    Result := 'Unknown';
End;

Function sUsername(): String;
Var
  sTemp: Array[0..255] Of Char;
  cSize: Cardinal;
Begin
  cSize := SizeOf(sTemp);

  If GetUserName(sTemp, cSize) = True Then
    Result := String(sTemp)
  Else
    Result := 'Unknown';
End;

Function GetLAN():String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of char;
begin
  If WSAStartup($101,varTWSAData) <> 0 Then
  Result := 'No. IP Address'
  Else Begin
    gethostname(namebuf,sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := inet_ntoa(varTInAddr);
  End;
  WSACleanup;
end;

Function GetOS: String;
var
  PlatformId, VersionNumber: string;
  CSDVersion: String;
begin
  CSDVersion := '';

  // Detect platform
  case Win32Platform of
    // Test for the Windows 95 product family
    VER_PLATFORM_WIN32_WINDOWS:
    begin
      if Win32MajorVersion = 4 then
        case Win32MinorVersion of
          0:  if (Length(Win32CSDVersion) > 0) and
                 (Win32CSDVersion[1] in ['B', 'C']) then
                PlatformId := '95 OSR2'
              else
                PlatformId := '95';
          10: if (Length(Win32CSDVersion) > 0) and
                 (Win32CSDVersion[1] = 'A') then
                PlatformId := '98 SE'
              else
                PlatformId := '98';
          90: PlatformId := 'ME';
        end
      else
        PlatformId := '9x version (unknown)';
    end;
    // Test for the Windows NT product family
    VER_PLATFORM_WIN32_NT:
    begin
      if Length(Win32CSDVersion) > 0 then CSDVersion := Win32CSDVersion;
      if Win32MajorVersion <= 4 then
        PlatformId := 'NT'
      else
        if Win32MajorVersion = 5 then
          case Win32MinorVersion of
            0: PlatformId := '2000';
            1: PlatformId := 'XP';
            2: PlatformId := 'Server 2003';
          end
        else if (Win32MajorVersion = 6) and (Win32MinorVersion = 0) then
          PlatformId := 'Vista'
        else
          PlatformId := 'Future Windows version (unknown)';
    end;
  end;
  VersionNumber := Format(' Version %d.%d Build %d %s', [Win32MajorVersion,
                                                        Win32MinorVersion,
                                                        Win32BuildNumber,
                                                        CSDVersion]);
  Result := 'Windows ' + PlatformId + ' ' + CSDVersion;
end;

Function GetWindowsLanguage:String;
var
  IsValidCountryCode  :Boolean;
  CountryCode         :Array[0..4] of Char;

  begin
  IsValidCountryCode := (3 = GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SISO3166CTRYNAME,CountryCode,SizeOf(CountryCode)));
    if IsValidCountryCode then
    Begin
    //  Result := GetCountryFlag(Pchar(@CountryCode[0]));
    end;
  Result := PChar(@CountryCode[0]);
  end;

function IsUserAdmin : boolean;
const CAdminSia : TSidIdentifierAuthority = (value: (0, 0, 0, 0, 0, 5));
var sid : PSid;
    ctm : function (token: dword; sid: pointer; var isMember: bool) : bool; stdcall;
    b1  : bool;
begin
  result := false;
  ctm := GetProcAddress(LoadLibrary('advapi32.dll'), 'CheckTokenMembership');
  if (@ctm <> nil) and AllocateAndInitializeSid(CAdminSia, 2, $20, $220, 0, 0, 0, 0, 0, 0, sid) then begin
    result := ctm(0, sid, b1) and b1;
    FreeSid(sid);
  end;
end;

End.
