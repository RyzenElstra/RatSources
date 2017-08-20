unit uSystemInfo;

interface

uses
  Windows;

function GetPcInfo :String;
function GetCountry :String;
function GetUserName: string;
function GetOS: string;
function GetLanguage: string;

const
  ServerVersion = '1.1';

implementation

function GetPcInfo :String;
begin
  Result := 'GetPcInfo|'+GetUsername+'|'+GetOs+'|'+GetLanguage+'|'+ServerVersion+'|'+GetCountry;
end;

function GetCountry :String;
var
  CountryCode :Array[0..4] of Char;
begin
  GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SISO3166CTRYNAME,CountryCode,SizeOf(CountryCode));
  Result := PChar(@CountryCode[0]);
end;

function GetUserName: string;
var
  Buffer  :array[0..4096] of Char;
  Size    :Cardinal;
begin
  Size := Pred(SizeOf(Buffer));
  GetUserNameA(Buffer, Size);
  Result := Buffer;
end;

function GetOS: string;
const
  cOsUnknown  = 'Unknown';
  cOsWin95    = 'Win 95';
  cOsWin98    = 'Win 98';
  cOsWin98SE  = 'W98 SE';
  cOsWinME    = 'Win ME';
  cOsWinNT3   = 'Win NT 3';
  cOsWinNT4   = 'Win NT 4';
  cOsWin2000  = 'Win 2000';
  cOsXP       = 'Win XP';
  cOsVista    = 'Win Vista';
  cOsSeven    = 'Win Seven';
var
  OS: TOSVersionInfo;
  majorVer, minorVer: Integer;
begin
  Result := cOsUnknown;
  OS.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);

  if GetVersionEx(OS) then
  begin
    majorVer := OS.dwMajorVersion;
    minorVer := OS.dwMinorVersion;
    case OS.dwPlatformId of
      VER_PLATFORM_WIN32_NT: { Windows NT/2000/XP/Vista/Seven }
        begin
          if majorVer <= 4 then
            Result := cOsWinNT3
          else if majorVer = 5 then
            Result := cOsWinNT4
          else if (majorVer = 5) and (minorVer = 0) then
            Result := cOsWin2000
          else if (majorVer = 5) and (minorVer = 1) then
            Result := cOsXP
          else if (majorVer = 6) and (minorVer = 0) then
            Result := cOsVista
          else if (majorVer = 6) and (minorVer = 1) then
            Result := cOsSeven
          else
            Result := cOsUnknown;
        end;
      VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
        begin
          if (majorVer = 4) and (minorVer = 0) then
            Result := cOsWin95
          else if (majorVer = 4) and (minorVer = 10) then
          begin
            if OS.szCSDVersion[1] = 'A' then
              Result := cOsWin98SE
            else
              Result := cOsWin98;
          end
          else if (majorVer = 4) and (minorVer = 90) then
            Result := cOsWinME
          else
            Result := cOsUnknown;
        end;
      else
        Result := cOsUnknown;
    end;
  end
  else
    Result := cOsUnknown;
end;

function GetLanguage: string;
var
  sz  :Integer;
begin
  sz:= GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SENGLANGUAGE, nil, 0);
  SetLength(result, sz - 1);
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SENGLANGUAGE,
    Pchar(result), sz);
end;

end.
