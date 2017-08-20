unit uFlag;

interface
uses
SysUtils,Windows;

function GetFlag(inf: String): Integer;
function GetCountry(inf: String): string;

implementation

function GetCountry(inf: String): string;
begin
  if inf='AFK' then Result := 'South Africa'
  else if inf='SQI' then Result := 'Albania'
  else if inf='ARG' then Result := 'Algeria'
  else if inf='ARH' then Result := 'Bahrain'
  else if inf='ARE' then Result := 'Egypt'
  else if inf='ARI' then Result := 'Iraq'
  else if inf='ARJ' then Result := 'Jordan'
  else if inf='ARK' then Result := 'Kuwait'
  else if inf='ARB' then Result := 'Lebanon'
  else if inf='ARL' then Result := 'Libya'
  else if inf='ARM' then Result := 'Morocco'
  else if inf='ARO' then Result := 'Oman'
  else if inf='ARQ' then Result := 'Qatar'
  else if inf='ARA' then Result := 'Saudi Arabia'
  else if inf='ARS' then Result := 'Syria'
  else if inf='ART' then Result := 'Tunisia'
  else if inf='ARU' then Result := 'U.A.E.'
  else if inf='ARY' then Result := 'Yemen'
  else if inf='HYE' then Result := 'Armenia'
  else if inf='AZE' then Result := 'Azerbaijan'
  else if inf='AZE' then Result := 'Azerbaijan'
  else if inf='EUQ' then Result := 'Spain'
  else if inf='BEL' then Result := 'Belarus'
  else if inf='BGR' then Result := 'Bulgaria'
  else if inf='CAT' then Result := 'Spain'
  else if inf='ZHH' then Result := 'Hong Kong'
  else if inf='ZHM' then Result := 'Macau'
  else if inf='CHS' then Result := 'China'
  else if inf='ZHI' then Result := 'Singapore'
  else if inf='CHT' then Result := 'Taiwan'
  else if inf='HRV' then Result := 'Croatia'
  else if inf='CSY' then Result := 'Czech Republic'
  else if inf='DAN' then Result := 'Denmark'
  else if inf='DIV' then Result := 'Maldives'
  else if inf='NLB' then Result := 'Belgium'
  else if inf='NLD' then Result := 'Netherlands'
  else if inf='ENA' then Result := 'Australia'
  else if inf='ENL' then Result := 'Belize'
  else if inf='ENC' then Result := 'Canada'
  else if inf='ENB' then Result := 'Caribbean'
  else if inf='ENI' then Result := 'Ireland'
  else if inf='ENJ' then Result := 'Jamaica'
  else if inf='ENZ' then Result := 'New Zealand'
  else if inf='ENP' then Result := 'Philippines'
  else if inf='ENS' then Result := 'South Africa'
  else if inf='ENT' then Result := 'Trinidad'
  else if inf='ENG' then Result := 'United Kingdom'
  else if inf='ENU' then Result := 'United States'
  else if inf='ENW' then Result := 'Zimbabwe'
  else if inf='ETI' then Result := 'Estonia'
  else if inf='FOS' then Result := 'Faeroe Islands'
  else if inf='FAR' then Result := 'Iran'
  else if inf='FIN' then Result := 'Finland'
  else if inf='FRB' then Result := 'Belgium'
  else if inf='FRC' then Result := 'Canada'
  else if inf='FRA' then Result := 'France'
  else if inf='FRL' then Result := 'Luxembourg'
  else if inf='FRM' then Result := 'Monaco'
  else if inf='FRS' then Result := 'Switzerland'
  else if inf='MKI' then Result := 'Macedonia'
  else if inf='GLC' then Result := 'Spain'
  else if inf='KAT' then Result := 'Georgia'
  else if inf='DEA' then Result := 'Austria'
  else if inf='DEU' then Result := 'Germany'
  else if inf='DEC' then Result := 'Liechtenstein'
  else if inf='DEL' then Result := 'Luxembourg'
  else if inf='DES' then Result := 'Switzerland'
  else if inf='ELL' then Result := 'Greece'
  else if inf='GUJ' then Result := 'India'
  else if inf='HEB' then Result := 'Israel'
  else if inf='HIN' then Result := 'India'
  else if inf='HUN' then Result := 'Hungary'
  else if inf='ISL' then Result := 'Iceland'
  else if inf='IND' then Result := 'Indonesia'
  else if inf='ITA' then Result := 'Italy'
  else if inf='ITS' then Result := 'Switzerland'
  else if inf='JPN' then Result := 'Japan'
  else if inf='KAN' then Result := 'India'
  else if inf='KKZ' then Result := 'Kazakstan'
  else if inf='KNK' then Result := 'India'
  else if inf='KOR' then Result := 'Korea'
  else if inf='KYR' then Result := 'Kyrgyzstan'
  else if inf='LVI' then Result := 'Latvia'
  else if inf='LTH' then Result := 'Lithuania'
  else if inf='MSB' then Result := 'Brunei Darussalam'
  else if inf='MSL' then Result := 'Malaysia'
  else if inf='MAR' then Result := 'India'
  else if inf='MON' then Result := 'Mongolia'
  else if inf='NOR' then Result := 'Norway'
  else if inf='NON' then Result := 'Norway'
  else if inf='PLK' then Result := 'Poland'
  else if inf='PTB' then Result := 'Brazil'
  else if inf='PTG' then Result := 'Portugal'
  else if inf='PAN' then Result := 'India'
  else if inf='ROM' then Result := 'Romania'
  else if inf='RUS' then Result := 'Russia'
  else if inf='SAN' then Result := 'India'
  else if inf='SRB' then Result := 'Serbia'
  else if inf='SRL' then Result := 'Serbia'
  else if inf='SKY' then Result := 'Slovakia'
  else if inf='SLV' then Result := 'Slovenia'
  else if inf='ESS' then Result := 'Argentina'
  else if inf='ESB' then Result := 'Bolivia'
  else if inf='ESL' then Result := 'Chile'
  else if inf='ESO' then Result := 'Colombia'
  else if inf='ESC' then Result := 'Costa Rica'
  else if inf='ESD' then Result := 'Dominican Republic'
  else if inf='ESF' then Result := 'Ecuador'
  else if inf='ESE' then Result := 'El Salvador'
  else if inf='ESG' then Result := 'Guatemala'
  else if inf='ESH' then Result := 'Honduras'
  else if inf='ESM' then Result := 'Mexico'
  else if inf='ESI' then Result := 'Nicaragua'
  else if inf='ESA' then Result := 'Panama'
  else if inf='ESZ' then Result := 'Paraguay'
  else if inf='ESR' then Result := 'Peru'
  else if inf='ESU' then Result := 'Puerto Rico'
  else if inf='ESN' then Result := 'Spain'
  else if inf='ESP' then Result := 'Spain'
  else if inf='ESY' then Result := 'Uruguay'
  else if inf='ESV' then Result := 'Venezuela'
  else if inf='SWK' then Result := 'Kenya'
  else if inf='SVF' then Result := 'Finland'
  else if inf='SVE' then Result := 'Sweden'
  else if inf='SYR' then Result := 'Syria'
  else if inf='TAM' then Result := 'India'
  else if inf='TTT' then Result := 'Tatarstan'
  else if inf='TEL' then Result := 'India'
  else if inf='THA' then Result := 'Thailand'
  else if inf='TRK' then Result := 'Turkey'
  else if inf='UKR' then Result := 'Ukraine'
  else if inf='URD' then Result := 'Pakistan'
  else if inf='UZB' then Result := 'Uzbekistan'
  else if inf='UZB' then Result := 'Uzbekistan'
  else if inf='VIT' then Result := 'Viet Nam'
  else Result := 'Unknown';
end;
function GetFlag(inf: String): Integer;
begin
  if inf='AFK' then Result := 0 
  else if inf='SQI' then Result := 1 
  else if inf='ARG' then Result := 2 
  else if inf='ARH' then Result := 3 
  else if inf='ARE' then Result := 4 
  else if inf='ARI' then Result := 5 
  else if inf='ARJ' then Result := 6 
  else if inf='ARK' then Result := 7 
  else if inf='ARB' then Result := 8 
  else if inf='ARL' then Result := 9 
  else if inf='ARM' then Result := 10 
  else if inf='ARO' then Result := 11 
  else if inf='ARQ' then Result := 12 
  else if inf='ARA' then Result := 13 
  else if inf='ARS' then Result := 14 
  else if inf='ART' then Result := 15 
  else if inf='ARU' then Result := 16 
  else if inf='ARY' then Result := 17 
  else if inf='HYE' then Result := 18 
  else if inf='AZE' then Result := 19 
  else if inf='AZE' then Result := 20 
  else if inf='EUQ' then Result := 21 
  else if inf='BEL' then Result := 22 
  else if inf='BGR' then Result := 23 
  else if inf='CAT' then Result := 24 
  else if inf='ZHH' then Result := 25 
  else if inf='ZHM' then Result := 26 
  else if inf='CHS' then Result := 27 
  else if inf='ZHI' then Result := 28 
  else if inf='CHT' then Result := 29 
  else if inf='HRV' then Result := 30 
  else if inf='CSY' then Result := 31 
  else if inf='DAN' then Result := 32 
  else if inf='DIV' then Result := 33 
  else if inf='NLB' then Result := 34 
  else if inf='NLD' then Result := 35 
  else if inf='ENA' then Result := 36 
  else if inf='ENL' then Result := 37 
  else if inf='ENC' then Result := 38 
  else if inf='ENB' then Result := 39 
  else if inf='ENI' then Result := 40 
  else if inf='ENJ' then Result := 41 
  else if inf='ENZ' then Result := 42 
  else if inf='ENP' then Result := 43 
  else if inf='ENS' then Result := 44 
  else if inf='ENT' then Result := 45 
  else if inf='ENG' then Result := 46 
  else if inf='ENU' then Result := 47 
  else if inf='ENW' then Result := 48 
  else if inf='ETI' then Result := 49 
  else if inf='FOS' then Result := 50 
  else if inf='FAR' then Result := 51 
  else if inf='FIN' then Result := 52 
  else if inf='FRB' then Result := 53 
  else if inf='FRC' then Result := 54 
  else if inf='FRA' then Result := 55 
  else if inf='FRL' then Result := 56 
  else if inf='FRM' then Result := 57 
  else if inf='FRS' then Result := 58 
  else if inf='MKI' then Result := 59 
  else if inf='GLC' then Result := 60 
  else if inf='KAT' then Result := 61 
  else if inf='DEA' then Result := 62 
  else if inf='DEU' then Result := 63 
  else if inf='DEC' then Result := 64 
  else if inf='DEL' then Result := 65 
  else if inf='DES' then Result := 66 
  else if inf='ELL' then Result := 67 
  else if inf='GUJ' then Result := 68 
  else if inf='HEB' then Result := 69 
  else if inf='HIN' then Result := 70 
  else if inf='HUN' then Result := 71 
  else if inf='ISL' then Result := 72 
  else if inf='IND' then Result := 73 
  else if inf='ITA' then Result := 74 
  else if inf='ITS' then Result := 75 
  else if inf='JPN' then Result := 76 
  else if inf='KAN' then Result := 77 
  else if inf='KKZ' then Result := 78 
  else if inf='KNK' then Result := 79 
  else if inf='KOR' then Result := 80 
  else if inf='KYR' then Result := 81 
  else if inf='LVI' then Result := 82 
  else if inf='LTH' then Result := 83 
  else if inf='MSB' then Result := 84 
  else if inf='MSL' then Result := 85 
  else if inf='MAR' then Result := 86 
  else if inf='MON' then Result := 87 
  else if inf='NOR' then Result := 88 
  else if inf='NON' then Result := 89 
  else if inf='PLK' then Result := 90 
  else if inf='PTB' then Result := 91 
  else if inf='PTG' then Result := 92 
  else if inf='PAN' then Result := 93 
  else if inf='ROM' then Result := 94 
  else if inf='RUS' then Result := 95 
  else if inf='SAN' then Result := 96 
  else if inf='SRB' then Result := 97 
  else if inf='SRL' then Result := 98 
  else if inf='SKY' then Result := 99 
  else if inf='SLV' then Result := 100 
  else if inf='ESS' then Result := 101 
  else if inf='ESB' then Result := 102 
  else if inf='ESL' then Result := 103 
  else if inf='ESO' then Result := 104 
  else if inf='ESC' then Result := 105 
  else if inf='ESD' then Result := 106 
  else if inf='ESF' then Result := 107 
  else if inf='ESE' then Result := 108 
  else if inf='ESG' then Result := 109 
  else if inf='ESH' then Result := 110 
  else if inf='ESM' then Result := 111 
  else if inf='ESI' then Result := 112 
  else if inf='ESA' then Result := 113 
  else if inf='ESZ' then Result := 114 
  else if inf='ESR' then Result := 115 
  else if inf='ESU' then Result := 116 
  else if inf='ESN' then Result := 117 
  else if inf='ESP' then Result := 118 
  else if inf='ESY' then Result := 119 
  else if inf='ESV' then Result := 120 
  else if inf='SWK' then Result := 121 
  else if inf='SVF' then Result := 122 
  else if inf='SVE' then Result := 123 
  else if inf='SYR' then Result := 124 
  else if inf='TAM' then Result := 125 
  else if inf='TTT' then Result := 126 
  else if inf='TEL' then Result := 127 
  else if inf='THA' then Result := 128 
  else if inf='TRK' then Result := 129 
  else if inf='UKR' then Result := 130 
  else if inf='URD' then Result := 131 
  else if inf='UZB' then Result := 132 
  else if inf='UZB' then Result := 133 
  else if inf='VIT' then Result := 134 
  else Result := -1;
end;

end.
