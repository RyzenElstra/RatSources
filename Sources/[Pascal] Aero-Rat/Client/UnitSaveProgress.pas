unit UnitSaveProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TSaveProgress = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaveProgress: TSaveProgress;

implementation

{$R *.dfm}

end.
