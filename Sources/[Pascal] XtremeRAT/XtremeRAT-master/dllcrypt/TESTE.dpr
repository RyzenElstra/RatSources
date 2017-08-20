program teste;

uses
  windows,
  unitconstantes;

var
  s: string; 
begin
  s := 'Rafael';
  MessageBox(0, pChar(s), '', 0);
  s := MyCryptFunction(s, '');
  MessageBox(0, pChar(s), '', 0);
  s := MyCryptFunction(s, '');
  MessageBox(0, pChar(s), '', 0);
end.
