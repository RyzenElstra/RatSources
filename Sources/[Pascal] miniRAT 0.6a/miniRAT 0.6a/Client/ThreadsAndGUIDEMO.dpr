program miniRAT;


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
  uProcess in 'uProcess.pas' {Form5};

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
