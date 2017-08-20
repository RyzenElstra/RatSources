program CompilarProjeto;
//Meu computador = cbeba5738267e0c5334306e9b23cbe5b
uses
  Forms,
  UnitCompilar in 'UnitCompilar.pas' {FormCompilar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Compilador do Xtreme RAT';
  Application.CreateForm(TFormCompilar, FormCompilar);
  Application.Run;
end.
