program HardwareID;

uses
  Forms,
  UnitHardwareID in 'UnitHardwareID.pas' {FormHardwareID};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHardwareID, FormHardwareID);
  Application.Run;
end.
