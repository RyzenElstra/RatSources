Unit UnitConstantes;

interface

function MyCryptFunction(Str, Password: string): string;

const
  MasterDelimitador = 'zLfWoU37d6H0XHHZ3sMixFyZC1qCjHE';
  CryptPass = '8JixBM7Py2fb8ciHmHgxp';

implementation

uses UnitCryptString;

const
  Codes64 = 'JTQHBbLSDKca/ht0RnY+3XiMfOd5yVs6qjrEe7v2oNzUZCxWpAu18kl9FPGwg4Im';
function MyCryptFunction(Str, Password: string): string;
begin
  if copy(str, 1, length('C_P4_fpp2MSnh19Zg6ng6EgQ')) = 'C_P4_fpp2MSnh19Zg6ng6EgQ' then
  begin
    delete(str, 1, length('C_P4_fpp2MSnh19Zg6ng6EgQ'));
    Result := Decode64(Str, Codes64);
  end else
  begin
    Result := Encode64(Str, Codes64);
    Result := 'C_P4_fpp2MSnh19Zg6ng6EgQ' + Result;
  end;
end;

end.