unit UnitProcessModules;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, UnitTasksManager;

type
  TFormProcessModules = class(TForm)
    lvModules: TListView;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; TmpStr: string);
  end;

var
  FormProcessModules: TFormProcessModules;

implementation

{$R *.dfm}
   
constructor TFormProcessModules.Create(aOwner: TComponent; TmpStr: string);
var
  TmpItem: TListItem;
  TmpStr1: string;
  i: Integer;
begin
  inherited Create(aOwner);

  TmpStr1 := Copy(TmpStr, 1, Pos(#13#10, TmpStr) - 1);
  Delete(TmpStr, 1, Pos(#13#10, TmpStr));

  Caption := TmpStr1;
                             
  lvModules.Items.BeginUpdate;
  while TmpStr <> '' do
  begin
    Application.ProcessMessages;
    TmpItem := lvModules.Items.Add;
    TmpItem.Caption := Copy(TmpStr, 1, Pos('|', TmpStr) - 1);
    Delete(TmpStr, 1, Pos('|', TmpStr));
    TmpItem.ImageIndex := 3;
  end;

  lvModules.Items.EndUpdate;
end;

procedure TFormProcessModules.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
