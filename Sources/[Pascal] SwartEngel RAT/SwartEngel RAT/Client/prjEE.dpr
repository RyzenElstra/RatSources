program prjEE;

uses
  Forms,
  untfrmMain in 'untfrmMain.pas' {frmMain},
  untfrmAbout in 'untfrmAbout.pas' {frmAbout},
  untFunc in 'untFunc.pas',
  untfrmManage in 'untfrmManage.pas' {frmManage},
  untInfo in 'untInfo.pas' {frmInfo},
  untCountry in 'untCountry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SwartEngel [RAT]';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmManage, frmManage);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.Run;
end.
