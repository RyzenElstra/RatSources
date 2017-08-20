unit UnitEditFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TEditFile = class(TForm)
    Memo1: TMemo;
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditFile: TEditFile;

implementation

{$R *.dfm}

end.
