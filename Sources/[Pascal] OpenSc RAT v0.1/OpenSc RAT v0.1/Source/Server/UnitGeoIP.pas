unit UnitGeoIP; //by wrh1d3

interface

uses
  UnitCountry, GeoIP, SysUtils;

function GeoIpCountryName(GeoIpFile, Ip: string): string;
function GeoIpFlagIndex(GeoIpFile, Ip: string): Integer;
function GeoIpLatitude(GeoIpFile, Ip: string): string;
function GeoIpLongitude(GeoIpFile, Ip: string): string;
function GeoIpRegionName(GeoIpFile, Ip: string): string;
function GeoIpCityName(GeoIpFile, Ip: string): string;
function GeoIpZipCode(GeoIpFile, Ip: string): string;

//GeoIpFile = GeoIP.dat file location

implementation


function GeoIpFlagIndex(GeoIpFile, Ip: string): Integer;
var
  GeoIP: TGeoIP;
  GeoIPCountry: TGeoIPCountry;
begin
  Result := -1;

  try
    GeoIP := TGeoIP.Create(GeoIpFile);
    if GeoIP.GetCountry(Ip, GeoIPCountry) = GEOIP_SUCCESS then
      Result := GetFlagIndex(GeoIPCountry.CountryCode);
    GeoIP.Free;
  except
  end;
end;

function GeoIpCountryName(GeoIpFile, Ip: string): string;
var
  GeoIP: TGeoIP;
  GeoIPCountry: TGeoIPCountry;
begin
  Result := '-';

  try
    GeoIP := TGeoIP.Create(GeoIpFile);
    if GeoIP.GetCountry(Ip, GeoIPCountry) = GEOIP_SUCCESS then
      Result := GeoIPCountry.CountryName;
    GeoIP.Free;
  except
  end;
end;

function GeoIpLatitude(GeoIpFile, Ip: string): string;
var
  GeoIP: TGeoIP;
  GeoIPCity: TGeoIPCity;
begin
  Result := '-';

  try
    GeoIP := TGeoIP.Create(GeoIpFile);
    if GeoIP.GetCity(Ip, GeoIPCity) = GEOIP_SUCCESS then
      Result := FloatToStr(GeoIPCity.Latitude);
    GeoIP.Free;
  except
  end;
end;
  
function GeoIpLongitude(GeoIpFile, Ip: string): string;
var
  GeoIP: TGeoIP;
  GeoIPCity: TGeoIPCity;
begin
  Result := '-';

  try
    GeoIP := TGeoIP.Create(GeoIpFile);
    if GeoIP.GetCity(Ip, GeoIPCity) = GEOIP_SUCCESS then
      Result := FloatToStr(GeoIPCity.Longitude);
    GeoIP.Free;
  except
  end;
end;
     
function GeoIpRegionName(GeoIpFile, Ip: string): string;
var
  GeoIP: TGeoIP;
  GeoIPRegion: TGeoIPRegion;
begin    
  Result := '-';

  try
    GeoIP := TGeoIP.Create(GeoIpFile);
    if GeoIP.GetRegion(Ip, GeoIPRegion) = GEOIP_SUCCESS then
      Result := GeoIPRegion.Region;
    GeoIP.Free;
  except
  end;
end;
    
function GeoIpCityName(GeoIpFile, Ip: string): string;
var
  GeoIP: TGeoIP;
  GeoIPCity: TGeoIPCity;
begin 
  Result := '-';

  try
    GeoIP := TGeoIP.Create(GeoIpFile);
    if GeoIP.GetCity(Ip, GeoIPCity) = GEOIP_SUCCESS then
      Result := GeoIPCity.City;
    GeoIP.Free;
  except
  end;
end;
    
function GeoIpZipCode(GeoIpFile, Ip: string): string;
var
  GeoIP: TGeoIP;
  GeoIPCity: TGeoIPCity;
begin 
  Result := '-';

  try
    GeoIP := TGeoIP.Create(GeoIpFile);
    if GeoIP.GetCity(Ip, GeoIPCity) = GEOIP_SUCCESS then
      Result := GeoIPCity.PostalCode;
    GeoIP.Free;
  except
  end;
end;

end.
