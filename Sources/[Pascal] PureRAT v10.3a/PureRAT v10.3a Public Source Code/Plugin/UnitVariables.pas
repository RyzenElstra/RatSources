unit UnitVariables;

interface

uses
  SocketUnitEx;

var
  MainConnection: TClientSocket;
  ClientHandle, MainMutex,
  PersistMutex: THandle;
  MainDatas, ClientId,
  MainHost, ReconnectHost,
  NewGroup, NewIdentification,
  ConfigFile, DatasPath,
  ClientPath, SqlFile, NickName: string;
  MainPort, ReconnectPort: Word;
  InstalledDate: string = 'Not installed';
  KeylogsPath, PluginsPath, ScreenlogsPath: string;
  WebcamId: Integer;
  CloseConnection, DesktopImage,
  WebcamImage, MicStream,
  DesktopMulti, WebcamMulti: Boolean;
  WM_WEBCAMCAPTURESTART, WM_MULTIWEBCAMSTART, WM_CHATWRITETEXT: Cardinal;

implementation
         
end.
