unit uWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ImgList, StdCtrls;

type
  TForm6 = class(TForm)
    stat1: TStatusBar;
    redt1: TRichEdit;
    pm1: TPopupMenu;
    GetLogfile1: TMenuItem;
    N1: TMenuItem;
    ClearLog1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

end.
