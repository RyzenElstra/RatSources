program prjEE;

uses
  Forms,
  untfrmMain in 'untfrmMain.pas' {frmMain},
  untfrmAbout in 'untfrmAbout.pas' {frmAbout},
  untFunc in 'untFunc.pas',
  untfrmManage in 'untfrmManage.pas' {frmManage};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HackHound [RAT]';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmManage, frmManage);
  Application.Run;
end.
