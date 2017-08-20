unit uManageUsers;

interface

uses
  Windows, SysUtils, ScktComp, uGeneral, uFlag;

procedure AddUser(Name, IP, OS, Language, Version, Country :String);
procedure CleanUpUsers(Sck :TCustomWinSocket);

implementation

procedure AddUser(Name, IP, OS, Language, Version, Country :String);
var
  indexItem :Integer;
begin
  FrmGeneral.ListUsers.Items.Add; // Add a new user
  indexItem := FrmGeneral.ListUsers.Items.Count-1; // Number of users
  FrmGeneral.ListUsers.Items.Item[indexItem].ImageIndex := GetCountryFlag(Country); // Flag
  FrmGeneral.ListUsers.Items.Item[indexItem].Caption := '  '+Name; // Name
  FrmGeneral.ListUsers.Items.Item[indexItem].SubItems.Add(IP); // IP
  FrmGeneral.ListUsers.Items.Item[indexItem].SubItems.Add(OS); // OS
  FrmGeneral.ListUsers.Items.Item[indexItem].SubItems.Add(Language); // Language
  FrmGeneral.ListUsers.Items.Item[indexItem].SubItems.Add('v '+Version); // Server version
  FrmGeneral.StatusBar.Panels[1].Text := 'Connection(s) : ' + IntToStr(FrmGeneral.ListUsers.Items.Count);
end;

procedure CleanUpUsers(Sck :TCustomWinSocket);
var
  n :Integer;
begin
  try
    for n:=0 to FrmGeneral.ListUsers.items.count do begin
      if  FrmGeneral.ListUsers.Items.Item[n].SubItems.Strings[0] = Sck.RemoteAddress then
      begin
        FrmGeneral.ListUsers.Items.Delete(n);
        FrmGeneral.StatusBar.Panels[1].Text := 'Connection(s) : ' + IntToStr(FrmGeneral.ListUsers.Items.Count);
        Break;
      end;
    end;
  Except
  end;
end;

end.
