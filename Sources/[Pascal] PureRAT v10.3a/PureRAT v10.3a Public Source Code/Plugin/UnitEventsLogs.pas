unit UnitEventsLogs;

interface

uses
  Windows, ActiveX, Variants, ComObj, UnitFunctions, SysUtils;

function GetEventsLogs(i: Integer): string;

implementation

const
  wbemFlagForwardOnly = $00000020;
  
var
  FSWbemLocator, FWMIService,
  FWbemObjectSet, FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;

function SystemLogs: string;
var
  i: Integer;
begin;
  Result := '';
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  FWbemObjectSet := FWMIService.ExecQuery('SELECT * FROM Win32_NTLogEvent  Where Logfile="System"','WQL',wbemFlagForwardOnly);
  oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;

  i := 0;
  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    Result := Result + Format('%s', [FWbemObject.EventType]) + '|';
    Result := Result + Format('%s', [FWbemObject.SourceName]) + '|'; 
    Result := Result + Format('%s', [FWbemObject.User]) + '|';
    Result := Result + Format('%s', [FWbemObject.TimeWritten]) + '|';
    Result := Result + Format('%s', [FWbemObject.EventCode]) + '|';
    Result := Result + Format('%s', [FWbemObject.Message]) + '|' + #13#10;
    FWbemObject := Unassigned;

    Inc(i);
    if i >= 10 then Break;
  end;
end;
      
function ApplicationsLogs: string;    
var
  i: Integer;
begin;
  Result := '';
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  FWbemObjectSet := FWMIService.ExecQuery('SELECT * FROM Win32_NTLogEvent  Where Logfile="Application"','WQL',wbemFlagForwardOnly);
  oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
                            
  i := 0;
  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    Result := Result + Format('%s', [FWbemObject.EventType]) + '|';
    Result := Result + Format('%s', [FWbemObject.SourceName]) + '|'; 
    Result := Result + Format('%s', [FWbemObject.User]) + '|';
    Result := Result + Format('%s', [FWbemObject.TimeWritten]) + '|';
    Result := Result + Format('%s', [FWbemObject.EventCode]) + '|';
    Result := Result + Format('%s', [FWbemObject.Message]) + '|' + #13#10;
    FWbemObject:=Unassigned;   

    Inc(i);
    if i >= 10 then Break;
  end;
end;
  
function SecurityLogs: string; 
var
  i: Integer;
begin;
  Result := '';
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  FWbemObjectSet := FWMIService.ExecQuery('SELECT * FROM Win32_NTLogEvent  Where Logfile="Security"','WQL',wbemFlagForwardOnly);
  oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
           
  i := 0;
  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    Result := Result + Format('%s', [FWbemObject.EventType]) + '|';
    Result := Result + Format('%s', [FWbemObject.SourceName]) + '|'; 
    Result := Result + Format('%s', [FWbemObject.User]) + '|';
    Result := Result + Format('%s', [FWbemObject.TimeWritten]) + '|';
    Result := Result + Format('%s', [FWbemObject.EventCode]) + '|';
    Result := Result + Format('%s', [FWbemObject.Message]) + '|' + #13#10;
    FWbemObject := Unassigned;    

    Inc(i);
    if i >= 10 then Break;
  end;
end;

function GetEventsLogs(i: Integer): string;
begin
  try
    CoInitialize(nil);

    case i of
      0: Result := SystemLogs;
      1: Result := ApplicationsLogs;
      2: Result := SecurityLogs;
    end;
  finally
    CoUninitialize;
  end;
end;

end.
