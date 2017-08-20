unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitIconChanger, StdCtrls, ExtCtrls, XPMan, WinSkinData;

type
  TFormMain = class(TForm)
    img1: TImage;
    btn1: TButton;
    btn2: TButton;
    dlgOpen1: TOpenDialog;
    pnl1: TPanel;
    xpmnfst1: TXPManifest;
    skndt1: TSkinData;
    procedure img1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    ClientPath: string;
  public
    { Public declarations }
    procedure SetInfos(_ClientPath: string);
  end;

var
  FormMain: TFormMain;
  IconPath: string;

implementation

{$R *.dfm}
          
procedure TFormMain.SetInfos(_ClientPath: string);
begin
  ClientPath := _ClientPath;
end;

procedure TFormMain.img1Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Icon (*.ico) or Executable (*.exe)|*.ico; *.exe';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;

  if LowerCase(ExtractFileExt(dlgOpen1.FileName)) = '.ico' then
  begin
    img1.Picture.LoadFromFile(dlgOpen1.FileName);
    IconPath := dlgOpen1.FileName;
  end
  else

  if LowerCase(ExtractFileExt(dlgOpen1.FileName)) = '.exe' then
  begin
    try
      TmpStr := ExtractFilePath(ParamStr(0)) + 'Icons';
      if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
      TmpStr1 := ExtractFileName(dlgOpen1.FileName);
      TmpStr1 := Copy(TmpStr1, 1, Pos('.', TmpStr1)-1);
      TmpStr1 := TmpStr1 + '.ico';
      TmpStr := TmpStr + '\' + TmpStr1;
      IconPath := TmpStr;

      SaveApplicationIconGroup(PChar(TmpStr), PChar(dlgOpen1.FileName));
    except
      MessageBox(Handle, 'Failed to save executable icon.', PChar('Ic0nic'), MB_ICONERROR);
    end;

    img1.Picture.LoadFromFile(TmpStr);
  end;
end;

procedure TFormMain.btn1Click(Sender: TObject);
begin
  if (ClientPath = '') or (IconPath = '') then
  begin
    MessageBox(Handle, 'File not found.', PChar('Ic0nic'), MB_ICONERROR);
    Exit;
  end;

  UpdateExeIcon(PChar(ClientPath), 'MAINICON', PChar(IconPath));
  UpdateExeIcon(PChar(ClientPath), 'ICON_STANDARD', PChar(IconPath));

  if UpdateApplicationIcon(PChar(IconPath), PChar(ClientPath)) = True then
    MessageBox(Handle, 'Icon changed successfully!', 'Ic0nic', MB_ICONINFORMATION)
  else MessageBox(Handle, 'Failed to change icon.', 'Ic0nic', MB_ICONERROR);
end;

procedure TFormMain.btn2Click(Sender: TObject);
begin
  MessageBox(Handle, 'This plugin allow you to change client file icon.' + #13#10 +
    'It can be used after bind files with client.' + #13#10#13#10 +
    'Copyright (c) 2016-2017 J3kill Soft. by wrh1d3', 'Ic0nic', MB_ICONINFORMATION);
end;

end.
