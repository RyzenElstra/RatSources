unit UnitCountry; //by wrh1d3

interface

uses
  SysUtils, GeoIP;

function GetFlagIndex(CountryCode: string): Integer;
function GetCountryName(CountryCode: string): string;

implementation

function GetCountryName(CountryCode: string): string;
begin
  Result := 'Unknown';                  
  if CountryCode = '' then Exit;
  CountryCode := UpperCase(CountryCode);

  if CountryCode = 'AP' then Result := 'Asia/Pacific Region' else
  if CountryCode = 'EU' then Result := 'Europe' else
  if CountryCode = 'AD' then Result := 'Andorra' else
  if CountryCode = 'AE' then Result := 'United Arab Emirates' else
  if CountryCode = 'AF' then Result := 'Afghanistan' else
  if CountryCode = 'AG' then Result := 'Antigua and Barbuda' else
  if CountryCode = 'AI' then Result := 'Anguilla' else
  if CountryCode = 'AL' then Result := 'Albania' else
  if CountryCode = 'AM' then Result := 'Armenia' else
  if CountryCode = 'AN' then Result := 'Netherlands Antilles' else
  if CountryCode = 'AO' then Result := 'Angola' else
  if CountryCode = 'AQ' then Result := 'Antarctica' else
  if CountryCode = 'AR' then Result := 'Argentina' else
  if CountryCode = 'AS' then Result := 'American Samoa' else
  if CountryCode = 'AT' then Result := 'Austria' else
  if CountryCode = 'AU' then Result := 'Australia' else
  if CountryCode = 'AW' then Result := 'Aruba' else
  if CountryCode = 'AZ' then Result := 'Azerbaijan' else
  if CountryCode = 'BA' then Result := 'Bosnia and Herzegovina' else
  if CountryCode = 'BB' then Result := 'Barbados' else
  if CountryCode = 'BD' then Result := 'Bangladesh' else
  if CountryCode = 'BE' then Result := 'Belgium' else
  if CountryCode = 'BF' then Result := 'Burkina Faso' else
  if CountryCode = 'BG' then Result := 'Bulgaria' else
  if CountryCode = 'BH' then Result := 'Bahrain' else
  if CountryCode = 'BI' then Result := 'Burundi' else
  if CountryCode = 'BJ' then Result := 'Benin' else
  if CountryCode = 'BM' then Result := 'Bermuda' else
  if CountryCode = 'BN' then Result := 'Brunei Darussalam' else
  if CountryCode = 'BO' then Result := 'Bolivia' else
  if CountryCode = 'BR' then Result := 'Brazil' else
  if CountryCode = 'BS' then Result := 'Bahamas' else
  if CountryCode = 'BT' then Result := 'Bhutan' else
  if CountryCode = 'BV' then Result := 'Bouvet Island' else
  if CountryCode = 'BW' then Result := 'Botswana' else
  if CountryCode = 'BY' then Result := 'Belarus' else
  if CountryCode = 'BZ' then Result := 'Belize' else
  if CountryCode = 'CA' then Result := 'Canada' else
  if CountryCode = 'CD' then Result := 'Cocos (Keeling) Islands' else
  if CountryCode = 'CC' then Result := 'Congo, The Democratic Republic of the' else
  if CountryCode = 'CF' then Result := 'Central African Republic' else
  if CountryCode = 'CG' then Result := 'Congo' else
  if CountryCode = 'CH' then Result := 'Switzerland' else
  if CountryCode = 'CI' then Result := 'Cote D''Ivoire' else
  if CountryCode = 'CK' then Result := 'Cook Islands' else
  if CountryCode = 'CL' then Result := 'Chile' else
  if CountryCode = 'CM' then Result := 'Cameroon' else
  if CountryCode = 'CN' then Result := 'China' else
  if CountryCode = 'CO' then Result := 'Colombia' else
  if CountryCode = 'CR' then Result := 'Costa Rica' else
  if CountryCode = 'CU' then Result := 'Cuba' else
  if CountryCode = 'CV' then Result := 'Cape Verde' else
  if CountryCode = 'CX' then Result := 'Christmas Island' else
  if CountryCode = 'CY' then Result := 'Cyprus' else
  if CountryCode = 'CZ' then Result := 'Czech Republic' else
  if CountryCode = 'DE' then Result := 'Germany' else   
  if CountryCode = 'DJ' then Result := 'Djibouti' else
  if CountryCode = 'DK' then Result := 'Denmark' else
  if CountryCode = 'DM' then Result := 'Dominica' else
  if CountryCode = 'DO' then Result := 'Dominican Republic' else
  if CountryCode = 'DZ' then Result := 'Algeria' else
  if CountryCode = 'EE' then Result := 'Ecuador' else
  if CountryCode = 'EC' then Result := 'Estonia' else
  if CountryCode = 'EG' then Result := 'Egypt' else
  if CountryCode = 'EH' then Result := 'Western Sahara' else
  if CountryCode = 'ER' then Result := 'Eritrea' else
  if CountryCode = 'ES' then Result := 'Spain' else
  if CountryCode = 'ET' then Result := 'Ethiopia' else
  if CountryCode = 'FI' then Result := 'Finland' else
  if CountryCode = 'FJ' then Result := 'Fiji' else
  if CountryCode = 'FK' then Result := 'Falkland Islands (Malvinas)' else
  if CountryCode = 'FM' then Result := 'Micronesia, Federated States of' else
  if CountryCode = 'FO' then Result := 'Faroe Islands' else
  if CountryCode = 'FR' then Result := 'France' else
  if CountryCode = 'FX' then Result := 'France, Metropolitan' else
  if CountryCode = 'GA' then Result := 'Gabon' else
  if CountryCode = 'GB' then Result := 'United Kingdom' else
  if CountryCode = 'GD' then Result := 'Grenada' else
  if CountryCode = 'GE' then Result := 'Georgia' else
  if CountryCode = 'GF' then Result := 'French Guiana' else
  if CountryCode = 'GH' then Result := 'Ghana' else
  if CountryCode = 'GI' then Result := 'Gibraltar' else
  if CountryCode = 'GL' then Result := 'Greenland' else
  if CountryCode = 'GM' then Result := 'Gambia' else
  if CountryCode = 'GN' then Result := 'Guinea' else
  if CountryCode = 'GP' then Result := 'Guadeloupe' else
  if CountryCode = 'GQ' then Result := 'Equatorial Guinea' else
  if CountryCode = 'GR' then Result := 'Greece' else
  if CountryCode = 'GS' then Result := 'South Georgia and the South Sandwich Islands' else
  if CountryCode = 'GT' then Result := 'Guatemala' else
  if CountryCode = 'GU' then Result := 'Guam' else
  if CountryCode = 'GW' then Result := 'Guinea-Bissau' else
  if CountryCode = 'GY' then Result := 'Guyana' else
  if CountryCode = 'HK' then Result := 'Hong Kong' else
  if CountryCode = 'HM' then Result := 'Heard Island and McDonald Islands' else
  if CountryCode = 'HN' then Result := 'Honduras' else
  if CountryCode = 'HR' then Result := 'Croatia' else
  if CountryCode = 'HT' then Result := 'Haiti' else
  if CountryCode = 'HU' then Result := 'Hungary' else
  if CountryCode = 'ID' then Result := 'Indonesia' else
  if CountryCode = 'IE' then Result := 'Ireland' else
  if CountryCode = 'IL' then Result := 'Israel' else
  if CountryCode = 'IN' then Result := 'India' else
  if CountryCode = 'IO' then Result := 'British Indian Ocean Territory' else
  if CountryCode = 'IQ' then Result := 'Iraq' else
  if CountryCode = 'IR' then Result := 'Iran, Islamic Republic of' else
  if CountryCode = 'IS' then Result := 'Iceland' else
  if CountryCode = 'IT' then Result := 'Italy' else
  if CountryCode = 'JM' then Result := 'Jamaica' else
  if CountryCode = 'JO' then Result := 'Jordan' else
  if CountryCode = 'JP' then Result := 'Japan' else
  if CountryCode = 'KE' then Result := 'Kenya' else
  if CountryCode = 'KG' then Result := 'Kyrgyzstan' else
  if CountryCode = 'KH' then Result := 'Cambodia' else
  if CountryCode = 'KI' then Result := 'Kiribati' else
  if CountryCode = 'KM' then Result := 'Comoros' else
  if CountryCode = 'KN' then Result := 'Saint Kitts and Nevis' else
  if CountryCode = 'KP' then Result := 'Korea, Democratic People''s Republic of' else
  if CountryCode = 'KR' then Result := 'Korea, Republic of' else
  if CountryCode = 'KW' then Result := 'Kuwait' else
  if CountryCode = 'KY' then Result := 'Cayman Islands' else
  if CountryCode = 'KZ' then Result := 'Kazakstan' else
  if CountryCode = 'LA' then Result := 'Lao People''s Democratic Republic' else
  if CountryCode = 'LB' then Result := 'Lebanon' else
  if CountryCode = 'LC' then Result := 'Saint Lucia' else
  if CountryCode = 'LI' then Result := 'Liechtenstein' else
  if CountryCode = 'LK' then Result := 'Sri Lanka' else
  if CountryCode = 'LR' then Result := 'Liberia' else
  if CountryCode = 'LS' then Result := 'Lesotho' else
  if CountryCode = 'LT' then Result := 'Lithuania' else
  if CountryCode = 'LU' then Result := 'Luxembourg' else
  if CountryCode = 'LV' then Result := 'Latvia' else
  if CountryCode = 'LY' then Result := 'Libyan Arab Jamahiriya' else
  if CountryCode = 'MA' then Result := 'Morocco' else
  if CountryCode = 'MC' then Result := 'Monaco' else
  if CountryCode = 'MD' then Result := 'Moldova, Republic of' else
  if CountryCode = 'MG' then Result := 'Madagascar' else
  if CountryCode = 'MH' then Result := 'Marshall Islands' else
  if CountryCode = 'MK' then Result := 'Macedonia, the Former Yugoslav Republic of' else
  if CountryCode = 'ML' then Result := 'Mali' else   
  if CountryCode = 'MM' then Result := 'Myanmar' else
  if CountryCode = 'MN' then Result := 'Mongolia' else
  if CountryCode = 'MO' then Result := 'Macao' else
  if CountryCode = 'MP' then Result := 'Northern Mariana Islands' else
  if CountryCode = 'MQ' then Result := 'Martinique' else
  if CountryCode = 'MR' then Result := 'Mauritania' else
  if CountryCode = 'MS' then Result := 'Montserrat' else
  if CountryCode = 'MT' then Result := 'Malta' else
  if CountryCode = 'MU' then Result := 'Mauritius' else
  if CountryCode = 'MV' then Result := 'Maldives' else
  if CountryCode = 'MW' then Result := 'Malawi' else
  if CountryCode = 'MX' then Result := 'Mexico' else
  if CountryCode = 'MY' then Result := 'Malaysia' else
  if CountryCode = 'MZ' then Result := 'Mozambique' else
  if CountryCode = 'NA' then Result := 'Namibia' else
  if CountryCode = 'NC' then Result := 'New Caledonia' else
  if CountryCode = 'NE' then Result := 'Niger' else
  if CountryCode = 'NF' then Result := 'Norfolk Island' else
  if CountryCode = 'NG' then Result := 'Nigeria' else
  if CountryCode = 'NI' then Result := 'Nicaragua' else
  if CountryCode = 'NL' then Result := 'Netherlands' else
  if CountryCode = 'NO' then Result := 'Norway' else
  if CountryCode = 'NP' then Result := 'Nepal' else
  if CountryCode = 'NR' then Result := 'Nauru' else
  if CountryCode = 'NU' then Result := 'Niue' else
  if CountryCode = 'NZ' then Result := 'New Zealand' else
  if CountryCode = 'OM' then Result := 'Oman' else
  if CountryCode = 'PA' then Result := 'Panama' else
  if CountryCode = 'PE' then Result := 'Peru' else
  if CountryCode = 'PF' then Result := 'French Polynesia' else
  if CountryCode = 'PG' then Result := 'Papua New Guinea' else
  if CountryCode = 'PH' then Result := 'Philippines' else
  if CountryCode = 'PK' then Result := 'Pakistan' else
  if CountryCode = 'PL' then Result := 'Poland' else
  if CountryCode = 'PM' then Result := 'Saint Pierre and Miquelon' else
  if CountryCode = 'PN' then Result := 'Pitcairn' else
  if CountryCode = 'PR' then Result := 'Puerto Rico' else
  if CountryCode = 'PS' then Result := 'Palestinian Territory, Occupied' else
  if CountryCode = 'PT' then Result := 'Portugal' else
  if CountryCode = 'PW' then Result := 'Palau' else
  if CountryCode = 'PY' then Result := 'Paraguay' else
  if CountryCode = 'QA' then Result := 'Qatar' else
  if CountryCode = 'RE' then Result := 'Reunion' else
  if CountryCode = 'RO' then Result := 'Romania' else
  if CountryCode = 'RU' then Result := 'Russian Federation' else
  if CountryCode = 'RW' then Result := 'Rwanda' else
  if CountryCode = 'SA' then Result := 'Saudi Arabia' else
  if CountryCode = 'SB' then Result := 'Solomon Islands' else
  if CountryCode = 'SC' then Result := 'Seychelles' else
  if CountryCode = 'SD' then Result := 'Sudan' else
  if CountryCode = 'SE' then Result := 'Sweden' else
  if CountryCode = 'SG' then Result := 'Singapore' else
  if CountryCode = 'SH' then Result := 'Saint Helena' else
  if CountryCode = 'SI' then Result := 'Slovenia' else
  if CountryCode = 'SJ' then Result := 'Svalbard and Jan Mayen' else
  if CountryCode = 'SK' then Result := 'Slovakia' else
  if CountryCode = 'SL' then Result := 'Sierra Leone' else
  if CountryCode = 'SM' then Result := 'San Marino' else
  if CountryCode = 'SN' then Result := 'Senegal' else
  if CountryCode = 'SO' then Result := 'Somalia' else
  if CountryCode = 'SR' then Result := 'Suriname' else
  if CountryCode = 'ST' then Result := 'Sao Tome and Principe' else
  if CountryCode = 'SV' then Result := 'El Salvador' else
  if CountryCode = 'SY' then Result := 'Syrian Arab Republic' else
  if CountryCode = 'SZ' then Result := 'Swaziland' else
  if CountryCode = 'TC' then Result := 'Turks and Caicos Islands' else
  if CountryCode = 'TD' then Result := 'Chad' else
  if CountryCode = 'TF' then Result := 'French Southern Territories' else
  if CountryCode = 'TG' then Result := 'Togo' else
  if CountryCode = 'TH' then Result := 'Thailand' else
  if CountryCode = 'TJ' then Result := 'Tajikistan' else
  if CountryCode = 'TK' then Result := 'Tokelau' else
  if CountryCode = 'TM' then Result := 'Turkmenistan' else
  if CountryCode = 'TN' then Result := 'Tunisia' else
  if CountryCode = 'TO' then Result := 'Tonga' else
  if CountryCode = 'TL' then Result := 'Timor-Leste' else
  if CountryCode = 'TR' then Result := 'Turkey' else
  if CountryCode = 'TT' then Result := 'Trinidad and Tobago' else
  if CountryCode = 'TV' then Result := 'Tuvalu' else
  if CountryCode = 'TW' then Result := 'Taiwan' else
  if CountryCode = 'TZ' then Result := 'Tanzania, United Republic of' else
  if CountryCode = 'UA' then Result := 'Ukraine' else
  if CountryCode = 'UG' then Result := 'Uganda' else
  if CountryCode = 'UM' then Result := 'United States Minor Outlying Islands' else
  if CountryCode = 'US' then Result := 'United States' else
  if CountryCode = 'UY' then Result := 'Uruguay' else
  if CountryCode = 'UZ' then Result := 'Uzbekistan' else
  if CountryCode = 'VA' then Result := 'Holy See (Vatican City State)' else
  if CountryCode = 'VC' then Result := 'Saint Vincent and the Grenadines' else
  if CountryCode = 'VE' then Result := 'Venezuela' else
  if CountryCode = 'VG' then Result := 'Virgin Islands, British' else
  if CountryCode = 'VI' then Result := 'Virgin Islands, U.S.' else
  if CountryCode = 'VN' then Result := 'Vietnam' else
  if CountryCode = 'VU' then Result := 'Vanuatu' else
  if CountryCode = 'WF' then Result := 'Wallis and Futuna' else
  if CountryCode = 'WS' then Result := 'Samoa' else
  if CountryCode = 'YE' then Result := 'Yemen' else
  if CountryCode = 'YT' then Result := 'Mayotte' else
  if CountryCode = 'RS' then Result := 'Serbia' else
  if CountryCode = 'ZA' then Result := 'South Africa' else
  if CountryCode = 'ZM' then Result := 'Zambia' else
  if CountryCode = 'ME' then Result := 'Montenegro' else
  if CountryCode = 'ZW' then Result := 'Zimbabwe' else
  if CountryCode = 'A1' then Result := 'Anonymous Proxy' else
  if CountryCode = 'A2' then Result := 'Satellite Provider' else
  if CountryCode = 'O1' then Result := 'Other' else
  if CountryCode = 'AX' then Result := 'Aland Islands' else
  if CountryCode = 'GG' then Result := 'Guernsey' else
  if CountryCode = 'IM' then Result := 'Isle of Man' else
  if CountryCode = 'JE' then Result := 'Jersey' else
  if CountryCode = 'BL' then Result := 'Saint Barthelemy' else
  if CountryCode = 'MF' then Result := 'Saint Martin' else Result := 'Unknown';
end;

function GetFlagIndex(CountryCode: string): Integer;
begin
  Result := 260;
  CountryCode := UpperCase(CountryCode);
  if CountryCode = '' then Exit;

  if CountryCode = 'AD' then Result := 6 else
  if CountryCode = 'AE' then Result := 243 else
  if CountryCode = 'AF' then Result := 0 else
  if CountryCode = 'AG' then Result := 10 else
  if CountryCode = 'AI' then Result := 8 else
  if CountryCode = 'AL' then Result := 3 else
  if CountryCode = 'AM' then Result := 12 else
  if CountryCode = 'AO' then Result := 7 else
  if CountryCode = 'AQ' then Result := 9 else
  if CountryCode = 'AR' then Result := 11 else
  if CountryCode = 'AS' then Result := 5 else
  if CountryCode = 'AT' then Result := 15 else
  if CountryCode = 'AU' then Result := 14 else
  if CountryCode = 'AW' then Result := 13 else
  if CountryCode = 'AZ' then Result := 15 else
  if CountryCode = 'BA' then Result := 29 else
  if CountryCode = 'BB' then Result := 20 else
  if CountryCode = 'BD' then Result := 19 else
  if CountryCode = 'BE' then Result := 23 else
  if CountryCode = 'BF' then Result := 37 else
  if CountryCode = 'BG' then Result := 36 else
  if CountryCode = 'BH' then Result := 18 else
  if CountryCode = 'BI' then Result := 38 else
  if CountryCode = 'BJ' then Result := 25 else
  if CountryCode = 'BM' then Result := 26 else
  if CountryCode = 'BN' then Result := 35 else
  if CountryCode = 'BO' then Result := 28 else
  if CountryCode = 'BR' then Result := 33 else
  if CountryCode = 'BS' then Result := 17 else
  if CountryCode = 'BT' then Result := 27 else
  if CountryCode = 'BV' then Result := 32 else
  if CountryCode = 'BW' then Result := 31 else
  if CountryCode = 'BY' then Result := 22 else
  if CountryCode = 'BZ' then Result := 24 else
  if CountryCode = 'CA' then Result := 41 else
  if CountryCode = 'CD' then Result := 50 else
  if CountryCode = 'CC' then Result := 53 else
  if CountryCode = 'CF' then Result := 45 else
  if CountryCode = 'CG' then Result := 54 else
  if CountryCode = 'CH' then Result := 223 else
  if CountryCode = 'CI' then Result := 57 else
  if CountryCode = 'CK' then Result := 55 else
  if CountryCode = 'CL' then Result := 47 else
  if CountryCode = 'CM' then Result := 40 else
  if CountryCode = 'CN' then Result := 48 else
  if CountryCode = 'CO' then Result := 51 else
  if CountryCode = 'CR' then Result := 56 else
  if CountryCode = 'CU' then Result := 59 else
  if CountryCode = 'CV' then Result := 42 else
  if CountryCode = 'CX' then Result := 49 else
  if CountryCode = 'CY' then Result := 61 else
  if CountryCode = 'CZ' then Result := 62 else
  if CountryCode = 'DE' then Result := 86 else   
  if CountryCode = 'DJ' then Result := 64 else
  if CountryCode = 'DK' then Result := 63 else
  if CountryCode = 'DM' then Result := 65 else
  if CountryCode = 'DO' then Result := 66 else
  if CountryCode = 'DZ' then Result := 4 else
  if CountryCode = 'EE' then Result := 67 else
  if CountryCode = 'EC' then Result := 73 else
  if CountryCode = 'EG' then Result := 68 else
  if CountryCode = 'EH' then Result := 256 else
  if CountryCode = 'ER' then Result := 72 else
  if CountryCode = 'ES' then Result := 214 else
  if CountryCode = 'ET' then Result := 74 else
  if CountryCode = 'FI' then Result := 78 else
  if CountryCode = 'FJ' then Result := 77 else
  if CountryCode = 'FK' then Result := 75 else
  if CountryCode = 'FM' then Result := 146 else
  if CountryCode = 'FO' then Result := 76 else
  if CountryCode = 'FR' then Result := 79 else
  if CountryCode = 'FX' then Result := 79 else
  if CountryCode = 'GA' then Result := 82 else
  if CountryCode = 'GB' then Result := 244 else
  if CountryCode = 'GD' then Result := 91 else
  if CountryCode = 'GE' then Result := 85 else
  if CountryCode = 'GF' then Result := 81 else
  if CountryCode = 'GH' then Result := 87 else
  if CountryCode = 'GI' then Result := 88 else
  if CountryCode = 'GL' then Result := 90 else
  if CountryCode = 'GM' then Result := 84 else
  if CountryCode = 'GN' then Result := 96 else
  if CountryCode = 'GP' then Result := 92 else
  if CountryCode = 'GQ' then Result := 71 else
  if CountryCode = 'GR' then Result := 89 else
  if CountryCode = 'GS' then Result := 211 else
  if CountryCode = 'GT' then Result := 93 else
  if CountryCode = 'GU' then Result := 94 else
  if CountryCode = 'GW' then Result := 97 else
  if CountryCode = 'GY' then Result := 98 else
  if CountryCode = 'HK' then Result := 102 else
  if CountryCode = 'HM' then Result := 100 else
  if CountryCode = 'HN' then Result := 101 else
  if CountryCode = 'HR' then Result := 58 else
  if CountryCode = 'HT' then Result := 99 else
  if CountryCode = 'HU' then Result := 103 else
  if CountryCode = 'ID' then Result := 106 else
  if CountryCode = 'IE' then Result := 109 else
  if CountryCode = 'IL' then Result := 111 else
  if CountryCode = 'IN' then Result := 105 else
  if CountryCode = 'IO' then Result := 34 else
  if CountryCode = 'IQ' then Result := 108 else
  if CountryCode = 'IR' then Result := 107 else
  if CountryCode = 'IS' then Result := 104 else
  if CountryCode = 'IT' then Result := 112 else
  if CountryCode = 'JM' then Result := 113 else
  if CountryCode = 'JO' then Result := 116 else
  if CountryCode = 'JP' then Result := 114 else
  if CountryCode = 'KE' then Result := 118 else
  if CountryCode = 'KG' then Result := 122 else
  if CountryCode = 'KH' then Result := 39 else
  if CountryCode = 'KI' then Result := 119 else
  if CountryCode = 'KM' then Result := 52 else
  if CountryCode = 'KN' then Result := 216 else
  if CountryCode = 'KP' then Result := 212 else
  if CountryCode = 'KR' then Result := 166 else
  if CountryCode = 'KW' then Result := 121 else
  if CountryCode = 'KY' then Result := 44 else
  if CountryCode = 'KZ' then Result := 117 else
  if CountryCode = 'LA' then Result := 123 else
  if CountryCode = 'LB' then Result := 125 else
  if CountryCode = 'LC' then Result := 191 else
  if CountryCode = 'LI' then Result := 129 else
  if CountryCode = 'LK' then Result := 215 else
  if CountryCode = 'LR' then Result := 127 else
  if CountryCode = 'LS' then Result := 126 else
  if CountryCode = 'LT' then Result := 130 else
  if CountryCode = 'LU' then Result := 131 else
  if CountryCode = 'LV' then Result := 124 else
  if CountryCode = 'LY' then Result := 128 else
  if CountryCode = 'MA' then Result := 152 else
  if CountryCode = 'MC' then Result := 148 else
  if CountryCode = 'MD' then Result := 147 else
  if CountryCode = 'MG' then Result := 134 else
  if CountryCode = 'MH' then Result := 140 else
  if CountryCode = 'MK' then Result := 133 else
  if CountryCode = 'ML' then Result := 138 else   
  if CountryCode = 'MM' then Result := 154 else
  if CountryCode = 'MN' then Result := 149 else
  if CountryCode = 'MO' then Result := 132 else
  if CountryCode = 'MQ' then Result := 141 else
  if CountryCode = 'MR' then Result := 142 else
  if CountryCode = 'MS' then Result := 151 else
  if CountryCode = 'MT' then Result := 139 else
  if CountryCode = 'MU' then Result := 143 else
  if CountryCode = 'MV' then Result := 137 else
  if CountryCode = 'MW' then Result := 135 else
  if CountryCode = 'MX' then Result := 145 else
  if CountryCode = 'MY' then Result := 136 else
  if CountryCode = 'MZ' then Result := 153 else
  if CountryCode = 'NA' then Result := 155 else
  if CountryCode = 'NC' then Result := 159 else
  if CountryCode = 'NE' then Result := 162 else
  if CountryCode = 'NF' then Result := 165 else
  if CountryCode = 'NG' then Result := 163 else
  if CountryCode = 'NI' then Result := 161 else
  if CountryCode = 'NL' then Result := 158 else
  if CountryCode = 'NO' then Result := 169 else
  if CountryCode = 'NP' then Result := 157 else
  if CountryCode = 'NR' then Result := 156 else
  if CountryCode = 'NU' then Result := 164 else
  if CountryCode = 'NZ' then Result := 160 else
  if CountryCode = 'OM' then Result := 170 else
  if CountryCode = 'PA' then Result := 174 else
  if CountryCode = 'PE' then Result := 177 else
  if CountryCode = 'PG' then Result := 175 else
  if CountryCode = 'PH' then Result := 178 else
  if CountryCode = 'PK' then Result := 171 else
  if CountryCode = 'PL' then Result := 180 else
  if CountryCode = 'PM' then Result := 193 else
  if CountryCode = 'PN' then Result := 179 else
  if CountryCode = 'PR' then Result := 182 else
  if CountryCode = 'PS' then Result := 173 else
  if CountryCode = 'PT' then Result := 181 else
  if CountryCode = 'PW' then Result := 172 else
  if CountryCode = 'PY' then Result := 176 else
  if CountryCode = 'QA' then Result := 183 else
  if CountryCode = 'RE' then Result := 185 else
  if CountryCode = 'RO' then Result := 186 else
  if CountryCode = 'RU' then Result := 187 else
  if CountryCode = 'RW' then Result := 188 else
  if CountryCode = 'SA' then Result := 197 else
  if CountryCode = 'SB' then Result := 207 else
  if CountryCode = 'SC' then Result := 201 else
  if CountryCode = 'SD' then Result := 218 else
  if CountryCode = 'SE' then Result := 222 else
  if CountryCode = 'SG' then Result := 203 else
  if CountryCode = 'SH' then Result := 190 else
  if CountryCode = 'SI' then Result := 206 else
  if CountryCode = 'SJ' then Result := 220 else
  if CountryCode = 'SK' then Result := 205 else
  if CountryCode = 'SL' then Result := 202 else
  if CountryCode = 'SM' then Result := 195 else
  if CountryCode = 'SN' then Result := 199 else
  if CountryCode = 'SO' then Result := 208 else
  if CountryCode = 'SR' then Result := 219 else
  if CountryCode = 'ST' then Result := 196 else
  if CountryCode = 'SV' then Result := 69 else
  if CountryCode = 'SY' then Result := 224 else
  if CountryCode = 'SZ' then Result := 221 else
  if CountryCode = 'TC' then Result := 239 else
  if CountryCode = 'TD' then Result := 46 else
  if CountryCode = 'TF' then Result := 80 else
  if CountryCode = 'TG' then Result := 231 else
  if CountryCode = 'TH' then Result := 229 else
  if CountryCode = 'TJ' then Result := 227 else
  if CountryCode = 'TK' then Result := 232 else
  if CountryCode = 'TM' then Result := 238 else
  if CountryCode = 'TN' then Result := 236 else
  if CountryCode = 'TO' then Result := 233 else
  if CountryCode = 'TL' then Result := 230 else
  if CountryCode = 'TR' then Result := 237 else
  if CountryCode = 'TT' then Result := 234 else
  if CountryCode = 'TV' then Result := 240 else
  if CountryCode = 'TW' then Result := 226 else
  if CountryCode = 'TZ' then Result := 228 else
  if CountryCode = 'UA' then Result := 242 else
  if CountryCode = 'UG' then Result := 241 else
  if CountryCode = 'UM' then Result := 245 else
  if CountryCode = 'US' then Result := 245 else
  if CountryCode = 'UY' then Result := 246 else
  if CountryCode = 'UZ' then Result := 247 else
  if CountryCode = 'VA' then Result := 249 else
  if CountryCode = 'VC' then Result := 217 else
  if CountryCode = 'VE' then Result := 250 else
  if CountryCode = 'VG' then Result := 252 else
  if CountryCode = 'VI' then Result := 253 else
  if CountryCode = 'VN' then Result := 251 else
  if CountryCode = 'VU' then Result := 248 else
  if CountryCode = 'WF' then Result := 255 else
  if CountryCode = 'WS' then Result := 194 else
  if CountryCode = 'YE' then Result := 257 else
  if CountryCode = 'YT' then Result := 144 else
  if CountryCode = 'RS' then Result := 200 else
  if CountryCode = 'ZA' then Result := 210 else
  if CountryCode = 'ZM' then Result := 258 else
  if CountryCode = 'ME' then Result := 150 else
  if CountryCode = 'ZW' then Result := 259 else
  if CountryCode = 'AX' then Result := 1 else
  if CountryCode = 'GG' then Result := 95 else
  if CountryCode = 'IM' then Result := 110 else
  if CountryCode = 'JE' then Result := 115 else
  if CountryCode = 'BL' then Result := 189 else
  if CountryCode = 'MF' then Result := 204 else Result := 260; 
end;

end.
