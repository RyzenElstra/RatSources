unit UnitRepository;

interface

uses
  SysUtils;
               
procedure CreateUserFolders(UserId: string);
function GetUserFolder(UserId: string): string;
function GetDesktopFolder(UserId: string): string;
function GetWebcamFolder(UserId: string): string;
function GetMicrophoneFolder(UserId: string): string;
function GetKeyloggerFolder(UserId: string): string;
function GetPasswordsFolder(UserId: string): string;
function GetDownloadsFolder(UserId: string): string;
function GetClipboardFolder(UserId: string): string;
function GetChatFolder(UserId: string): string;
function GetShellFolder(UserId: string): string;
function GetScannerFolder(UserId: string): string;
function GetSnifferFolder(UserId: string): string;
function GetScreenloggerFolder(UserId: string): string;
function GetNotesFolder(UserId: string): string;
function GetSettingsFolder(UserId: string): string;

implementation

function GetUserFolder(UserId: string): string;
var
  TmpStr: string;
begin
  TmpStr := ExtractFilePath(ParamStr(0)) + 'Users';
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  Result := TmpStr + '\' + UserId;
end;

function GetDesktopFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Desktop';
end;

function GetWebcamFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Webcam';
end;

function GetMicrophoneFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Microphone';
end;

function GetPasswordsFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Passwords';
end;

function GetKeyloggerFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Keylogger';
end;

function GetDownloadsFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Downloads';
end;

function GetClipboardFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Clipboard';
end;

function GetChatFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Chat';
end;
      
function GetShellFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Shell';
end;

function GetScannerFolder(UserId: string): string;  
begin
  Result := GetUserFolder(UserId) + '\Scanner';
end;

function GetSnifferFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Sniffer';
end;

function GetScreenloggerFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Screenlogger';
end;

function GetNotesFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Notes';
end;
  
function GetSettingsFolder(UserId: string): string;
begin
  Result := GetUserFolder(UserId) + '\Settings';
end;

procedure CreateUserFolders(UserId: string);
var
  TmpStr: string;
begin
  TmpStr := GetUserFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetDesktopFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetWebcamFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetMicrophoneFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);  
  TmpStr := GetKeyloggerFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);   
  TmpStr := GetPasswordsFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);    
  TmpStr := GetDownloadsFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetClipboardFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetChatFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetShellFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);     
  TmpStr := GetScannerFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetSnifferFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);  
  TmpStr := GetScreenloggerFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetNotesFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := GetSettingsFolder(UserId);
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
end;

end.
