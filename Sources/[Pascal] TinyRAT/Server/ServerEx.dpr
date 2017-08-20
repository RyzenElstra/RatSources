program ServerEx;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  VarUnit in 'VarUnit.pas',
  UnitManager in 'UnitManager.pas' {FormManager},
  UnitFileCallback in 'UnitFileCallback.pas' {FormCallback},
  UnitBuilder in 'UnitBuilder.pas' {FormBuilder};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormManager, FormManager);
  Application.CreateForm(TFormCallback, FormCallback);
  Application.CreateForm(TFormBuilder, FormBuilder);
  Application.Run;
end.
