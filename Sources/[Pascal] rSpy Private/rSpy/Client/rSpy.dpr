program rSpy;

uses
  Forms,
  uGeneral in 'uGeneral.pas' {FrmGeneral},
  uListen in 'uListen.pas' {FrmListen},
  uManageUsers in 'uManageUsers.pas',
  uBuild in 'uBuild.pas' {FrmBuild},
  uDownloader in 'uDownloader.pas' {FrmDownloader},
  uFlood in 'uFlood.pas' {FrmFlood},
  uPasswords in 'uPasswords.pas' {FrmPasswords},
  uSpread in 'uSpread.pas' {FrmSpread};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmGeneral, FrmGeneral);
  Application.CreateForm(TFrmListen, FrmListen);
  Application.CreateForm(TFrmBuild, FrmBuild);
  Application.CreateForm(TFrmDownloader, FrmDownloader);
  Application.CreateForm(TFrmFlood, FrmFlood);
  Application.CreateForm(TFrmPasswords, FrmPasswords);
  Application.CreateForm(TFrmSpread, FrmSpread);
  Application.Run;
end.
