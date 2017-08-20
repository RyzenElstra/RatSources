unit UnitEncryption; //use of uCryptoGear by Viotto for string encryption, by wrh1d3 :)

interface

uses
  uCryptoGear;

const
  MainPassword = 'OpenSc.ws is the best!';

function EncryptString(Str, Key: string): string;
function DecryptString(Str, Key: string): string;

implementation

var
  e_mode: Byte = MODE_ECB; //default encryption mode
  vector: Byte = 0; //default initialization verctor

function EncryptString(Str, Key: string): string;
var
  CryptoGear: CCryptoGear;
begin
  CryptoGear := CCryptoGear.Initialize(Key, e_mode, vector);
  Result := CryptoGear.Encrypt(Str); //encrypt string
end;

function DecryptString(Str, Key: string): string;
var
  CryptoGear: CCryptoGear;
begin
  CryptoGear := CCryptoGear.Initialize(Key, e_mode, vector);
  Result := CryptoGear.Decrypt(Str); //decrypt string
end;

end.
