unit UnitInternet;

interface

uses
  uIE7_decode,Windows;

var
  Dummy: string;

function ObtainPasswords: string;


implementation

function ObtainPasswords: string;
begin
  Result := uIE7_decode.ShowIeAutocompletePWs + uIE7_decode.ShowIEWebCert;
  messagebox(0,pchar(Result),'',0);
end;

end.
