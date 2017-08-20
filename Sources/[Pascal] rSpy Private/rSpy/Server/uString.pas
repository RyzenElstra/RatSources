unit uString;

interface

uses
  Windows;

procedure SplitString(lpData :Pchar; var fsArray :Array of String);

implementation

procedure SplitString(lpData :Pchar; var fsArray :Array of String);
var
  WordCount   :Integer;
  WordPos     :Integer;
begin
  WordPos   :=  0;
  WordCount :=  0;
  Fillchar(fsArray,SizeOf(fsArray),#0);

  while lpData^ <> #0 do
  begin
    case lpData^ of
      '|' : begin
              Inc(WordCount);
              WordPos:=0;
            end;
    else
      Inc(WordPos);
      SetLength(fsArray[WordCount],WordPos);
      fsArray[WordCount][WordPos]:= lpData^;
    end;
    Inc(lpData);
  end;
end;



end.
 