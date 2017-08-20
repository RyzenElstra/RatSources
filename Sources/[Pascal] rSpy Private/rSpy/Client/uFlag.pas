unit uFlag;

interface

uses
  Windows, SysUtils;

function GetCountryFlag (CountryCode: String) :Integer;

implementation

function GetCountryFlag (CountryCode :String) :Integer;
begin
  CountryCode := LowerCase(CountryCode);
  Result := 239;  //unknown

	If countryCode	= 'ad'	then
	Begin
	Result := 0;
	end

  else if CountryCode = 'ae' then
	Begin
	Result := 1;
  end

	else if CountryCode = 'af' then
	Begin
	Result := 2;
	end

	else if CountryCode = 'ag' then
	Begin
	Result := 3;
	end

	else if CountryCode = 'ai' then
	Begin
	Result := 4;
	end

	else if CountryCode = 'al' then
	Begin
	Result := 5;
	end

	else if CountryCode = 'am' then
	Begin
	Result := 6;
	end

	else if CountryCode = 'an' then
	Begin
	Result := 7;
	end

	else if CountryCode = 'ao' then
	Begin
	Result :=8 ;
	end

	else if CountryCode = 'ar' then
	Begin
	Result := 9;
	end

	else if CountryCode = 'as' then
	Begin
	Result :=10 ;
	end

	else if CountryCode = 'at' then
	Begin
	Result :=11 ;
	end

	else if CountryCode = 'au' then
	Begin
	Result := 12;
	end

	else if CountryCode = 'aw' then
	Begin
	Result := 13;
	end

	else if CountryCode = 'ax' then
	Begin
	Result := 14;
	end

	else if CountryCode = 'az' then
	Begin
	Result := 15;
	end

	else if CountryCode = 'ba' then
	Begin
	Result := 16;
	end

	else if CountryCode = 'bb' then
	Begin
	Result := 17;
	end

	else if CountryCode = 'bd' then
	Begin
	Result := 18;
	end

	else if CountryCode = 'be' then
	Begin
	Result := 19;
	end

	else if CountryCode = 'bf' then
	Begin
	Result := 20;
	end

	else if CountryCode = 'bg' then
	Begin
	Result := 21;
	end

	else if CountryCode = 'bh' then
	Begin
	Result := 22;
	end

	else if CountryCode = 'bi' then
	Begin
	Result := 23;
	end

	else if CountryCode = 'bj' then
	Begin
	Result := 24;
	end

	else if CountryCode = 'bm' then
	Begin
	Result := 25;
	end

	else if CountryCode = 'bn' then
	Begin
	Result := 26;
	end

	else if CountryCode = 'bo' then
	Begin
	Result := 27;
	end

	else if CountryCode = 'br' then
	Begin
	Result := 28;
	end

	else if CountryCode = 'bs' then
	Begin
	Result := 29;
	end

	else if CountryCode = 'bt' then
	Begin
	Result := 30;
	end

	else if CountryCode = 'bv' then
	Begin
	Result := 31;
	end

	else if CountryCode = 'bw' then
	Begin
	Result := 32;
	end

	else if CountryCode = 'by' then
	Begin
	Result := 33;
	end

	else if CountryCode = 'bz' then
	Begin
	Result := 34;
	end

	else if CountryCode = 'ca' then
	Begin
	Result := 35;
	end

	else if CountryCode = 'cc' then
	Begin
	Result := 36;
	end

	else if CountryCode = 'cd' then
	Begin
	Result := 37;
	end

	else if CountryCode = 'cf' then
	Begin
	Result := 38;
	end

	else if CountryCode = 'cg' then
	Begin
	Result := 39;
	end

	else if CountryCode = 'ch' then
	Begin
	Result := 40;
	end

	else if CountryCode = 'ci' then
	Begin
	Result := 41;
	end

	else if CountryCode = 'ck' then
	Begin
	Result := 42;
	end

	else if CountryCode = 'cl' then
	Begin
	Result := 43;
	end

	else if CountryCode = 'cm' then
	Begin
	Result :=44 ;
	end

	else if CountryCode = 'cn' then
	Begin
	Result := 45;
	end

	else if CountryCode = 'co' then
	Begin
	Result := 46;
	end

	else if CountryCode = 'cr' then
	Begin
	Result :=47 ;
	end

	else if CountryCode = 'cs' then
	Begin
	Result := 48;
	end

	else if CountryCode = 'cu' then
	Begin
	Result := 49;
	end

	else if CountryCode = 'cv' then
	Begin
	Result := 50;
	end

	else if CountryCode = 'cx' then
	Begin
	Result :=51 ;
	end

	else if CountryCode = 'cy' then
	Begin
	Result := 52;
	end

	else if CountryCode = 'cz' then
	Begin
	Result := 53;
	end

	else if CountryCode = 'de' then
	Begin
	Result := 54;
	end

	else if CountryCode = 'dj' then
	Begin
	Result := 55;
	end

	else if CountryCode = 'dk' then
	Begin
	Result := 56;
	end

	else if CountryCode = 'dm' then
	Begin
	Result := 57;
	end

	else if CountryCode = 'do' then
	Begin
	Result := 58;
	end

	else if CountryCode = 'dz' then
	Begin
	Result := 59;
	end

	else if CountryCode = 'ec' then
	Begin
	Result := 60;
	end

	else if CountryCode = 'ee' then
	Begin
	Result := 61;
	end

	else if CountryCode = 'eg' then
	Begin
	Result := 62;
	end

	else if CountryCode = 'eh' then
	Begin
	Result := 63;
	end

	else if CountryCode = 'England' then
	Begin
	Result := 64;    //england but wana use union jack
	end

	else if CountryCode = 'er' then
	Begin
	Result := 65;
	end

	else if CountryCode = 'es' then
	Begin
	Result := 66;
	end

	else if CountryCode = 'et' then
	Begin
	Result := 67;
	end

	else if CountryCode = 'fam' then
	Begin
	Result := 68;    //not sure if legit might be famfamfam flag..
	end

	else if CountryCode = 'fi' then
	Begin
	Result := 69;
	end

	else if CountryCode = 'fj' then
	Begin
	Result := 70;
	end

	else if CountryCode = 'fk' then
	Begin
	Result := 71;
	end

	else if CountryCode = 'fm' then
	Begin
	Result := 72;
	end

	else if CountryCode = 'fo' then
	Begin
	Result := 73;
	end

	else if CountryCode = 'fr' then
	Begin
	Result := 74;
	end

	else if CountryCode = 'ga' then
	Begin
	Result := 75;
	end

	else if CountryCode = 'gb' then
	Begin
	Result := 76; //union jack
	end

	else if CountryCode = 'gd' then
	Begin
	Result := 77;
	end

	else if CountryCode = 'ge' then
	Begin
	Result := 78;
	end

	else if CountryCode = 'gh' then
	Begin
	Result := 79;
	end

	else if CountryCode = 'gi' then
	Begin
	Result := 80;
	end

	else if CountryCode = 'gl' then
	Begin
	Result := 81;
	end

	else if CountryCode = 'gm' then
	Begin
	Result := 82;
	end

	else if CountryCode = 'gn' then
	Begin
	Result := 83;
	end

	else if CountryCode = 'gp' then
	Begin
	Result := 84;
	end

	else if CountryCode = 'gq' then
	Begin
	Result := 85;
	end

	else if CountryCode = 'gr' then
	Begin
	Result := 86;
	end

	else if CountryCode = 'gs' then
	Begin
	Result := 87;
	end

	else if CountryCode = 'gt' then
	Begin
	Result := 88;
	end

	else if CountryCode = 'gu' then
	Begin
	Result := 89;
	end

	else if CountryCode = 'gw' then
	Begin
	Result := 90;
	end

	else if CountryCode = 'gy' then
	Begin
	Result := 91;
	end

	else if CountryCode = 'hk' then
	Begin
	Result := 92;
	end

	else if CountryCode = 'hn' then
	Begin
	Result := 93;
	end

	else if CountryCode = 'hr' then
	Begin
	Result :=94 ;
	end

	else if CountryCode = 'ht' then
	Begin
	Result := 95;
	end

	else if CountryCode = 'hu' then
	Begin
	Result := 96;
	end

	else if CountryCode = 'id' then
	Begin
	Result := 97;
	end

	else if CountryCode = 'ie' then
	Begin
	Result := 98;
	end

	else if CountryCode = 'il' then
	Begin
	Result := 99;
	end

	else if CountryCode = 'in' then
	Begin
	Result := 100;
	end

	else if CountryCode = 'io' then
	Begin
	Result := 101;
	end

	else if CountryCode = 'iq' then
	Begin
	Result := 102;
	end

	else if CountryCode = 'ir' then
	Begin
	Result := 103;
	end

	else if CountryCode = 'is' then
	Begin
	Result := 104;
	end

	else if CountryCode = 'it' then
	Begin
	Result := 105;
	end

	else if CountryCode = 'jm' then
	Begin
	Result := 106;
	end

	else if CountryCode = 'jo' then
	Begin
	Result := 107;
	end

	else if CountryCode = 'jp' then
	Begin
	Result := 108;
	end

	else if CountryCode = 'ke' then
	Begin
	Result := 109;
	end

	else if CountryCode = 'kg' then
	Begin
	Result := 110;
	end

	else if CountryCode = 'kh' then
	Begin
	Result := 111;
	end

	else if CountryCode = 'ki' then
	Begin
	Result :=112 ;
	end

	else if CountryCode = 'km' then
	Begin
	Result := 113;
	end

	else if CountryCode = 'kn' then
	Begin
	Result := 114;
	end

	else if CountryCode = 'kp' then
	Begin
	Result := 115;
	end

	else if CountryCode = 'kr' then
	Begin
	Result := 116;
	end

	else if CountryCode = 'kw' then
	Begin
	Result := 117;
	end

	else if CountryCode = 'ky' then
	Begin
	Result := 118;
	end

	else if CountryCode = 'kz' then
	Begin
	Result := 119;
	end

	else if CountryCode = 'la' then
	Begin
	Result := 120;
	end

	else if CountryCode = 'lb' then
	Begin
	Result := 121;
	end

	else if CountryCode = 'lc' then
	Begin
	Result := 122;
	end

	else if CountryCode = 'li' then
	Begin
	Result :=123 ;
	end

	else if CountryCode = 'lk' then
	Begin
	Result := 124;
	end

	else if CountryCode = 'lr' then
	Begin
	Result := 125;
	end

	else if CountryCode = 'ls' then
	Begin
	Result := 126;
	end

	else if CountryCode = 'lt' then
	Begin
	Result := 127;
	end

	else if CountryCode = 'lu' then
	Begin
	Result := 128;
	end

	else if CountryCode = 'lv' then
	Begin
	Result := 129;
	end

	else if CountryCode = 'ly' then
	Begin
	Result := 130;
	end

	else if CountryCode = 'ma' then
	Begin
	Result := 131;
	end

	else if CountryCode = 'mc' then
	Begin
	Result := 132;
	end

	else if CountryCode = 'md' then
	Begin
	Result := 133;
	end

	else if CountryCode = 'mg' then
	Begin
	Result := 134;
	end

	else if CountryCode = 'mh' then
	Begin
	Result := 135;
	end

	else if CountryCode = 'mk' then
	Begin
	Result := 136;
	end

	else if CountryCode = 'ml' then
	Begin
	Result := 137;
	end

	else if CountryCode = 'mm' then
	Begin
	Result := 138;
	end

	else if CountryCode = 'mn' then
	Begin
	Result := 139;
	end

	else if CountryCode = 'mo' then
	Begin
	Result := 140;
	end

	else if CountryCode = 'mp' then
	Begin
	Result := 141;
	end

	else if CountryCode = 'mq' then
	Begin
	Result := 142;
	end

	else if CountryCode = 'mr' then
	Begin
	Result := 143;
	end

	else if CountryCode = 'ms' then
	Begin
	Result := 144;
	end

	else if CountryCode = 'mt' then
	Begin
	Result := 145;
	end

	else if CountryCode = 'mu' then
	Begin
	Result := 146;
	end

	else if CountryCode = 'mv' then
	Begin
	Result := 147;
	end

	else if CountryCode = 'mw' then
	Begin
	Result := 148;
	end

	else if CountryCode = 'mx' then
	Begin
	Result := 149;
	end

	else if CountryCode = 'my' then
	Begin
	Result := 150;
	end

	else if CountryCode = 'mz' then
	Begin
	Result := 151;
	end

	else if CountryCode = 'na' then
	Begin
	Result := 152;
	end

	else if CountryCode = 'nc' then
	Begin
	Result := 153;
	end

	else if CountryCode = 'ne' then
	Begin
	Result := 154;
	end

	else if CountryCode = 'nf' then
	Begin
	Result := 155;
	end

	else if CountryCode = 'ng' then
	Begin
	Result := 156;
	end

	else if CountryCode = 'ni' then
	Begin
	Result := 157;
	end

	else if CountryCode = 'nl' then
	Begin
	Result := 158;
	end

	else if CountryCode = 'no' then
	Begin
	Result := 159;
	end

	else if CountryCode = 'np' then
	Begin
	Result := 160;
	end

	else if CountryCode = 'nr' then
	Begin
	Result := 161;
	end

	else if CountryCode = 'nu' then
	Begin
	Result := 162;
	end

	else if CountryCode = 'nz' then
	Begin
	Result := 163;
	end

	else if CountryCode = 'om' then
	Begin
	Result := 164;
	end

	else if CountryCode = 'pa' then
	Begin
	Result := 165;
	end

	else if CountryCode = 'pe' then
	Begin
	Result := 166;
	end

	else if CountryCode = 'pf' then
	Begin
	Result := 167;
	end

	else if CountryCode = 'pg' then
	Begin
	Result := 168;
	end

	else if CountryCode = 'ph' then
	Begin
	Result := 169;
	end

	else if CountryCode = 'pk' then
	Begin
	Result := 170;
	end

	else if CountryCode = 'pl' then
	Begin
	Result := 171;
	end

	else if CountryCode = 'pm' then
	Begin
	Result := 172;
	end

	else if CountryCode = 'pn' then
	Begin
	Result := 173;
	end

	else if CountryCode = 'pr' then
	Begin
	Result := 174;
	end

	else if CountryCode = 'ps' then
	Begin
	Result := 175;
	end

	else if CountryCode = 'pt' then
	Begin
	Result := 176;
	end

	else if CountryCode = 'pw' then
	Begin
	Result := 177;
	end

	else if CountryCode = 'py' then
	Begin
	Result := 178;
	end

	else if CountryCode = 'qa' then
	Begin
	Result := 179;
	end

	else if CountryCode = 'ro' then
	Begin
	Result := 180;
	end

	else if CountryCode = 'ru' then
	Begin
	Result := 181;
	end

	else if CountryCode = 'rw' then
	Begin
	Result := 182;
	end

	else if CountryCode = 'sa' then
	Begin
	Result := 183;
	end

	else if CountryCode = 'sb' then
	Begin
	Result := 184;
	end

	else if CountryCode = 'sc' then
	Begin
	Result := 185;
	end

	else if CountryCode = 'scotland' then
	Begin
	Result := 186;     //scotish flag but using union jack instead;
	end

	else if CountryCode = 'sd' then
	Begin
	Result := 187;
	end

	else if CountryCode = 'se' then
	Begin
	Result := 188;
	end

	else if CountryCode = 'sg' then
	Begin
	Result := 189;
	end

	else if CountryCode = 'sh' then
	Begin
	Result := 190;
	end

	else if CountryCode = 'si' then
	Begin
	Result := 191;
	end

	else if CountryCode = 'sk' then
	Begin
	Result := 192;
	end

	else if CountryCode = 'sl' then
	Begin
	Result := 193;
	end

	else if CountryCode = 'sm' then
	Begin
	Result := 194;
	end

	else if CountryCode = 'sn' then
	Begin
	Result := 195;
	end

	else if CountryCode = 'so' then
	Begin
	Result := 196;
	end

	else if CountryCode = 'sr' then
	Begin
	Result := 197;
	end

	else if CountryCode = 'st' then
	Begin
	Result := 198;
	end

	else if CountryCode = 'sv' then
	Begin
	Result := 199;
	end

	else if CountryCode = 'sy' then
	Begin
	Result := 200;
	end

	else if CountryCode = 'sz' then
	Begin
	Result := 201;
	end

	else if CountryCode = 'tc' then
	Begin
	Result := 202;
	end

	else if CountryCode = 'td' then
	Begin
	Result := 203;
	end

	else if CountryCode = 'tf' then
	Begin
	Result := 204;
	end

	else if CountryCode = 'tg' then
	Begin
	Result := 205;
	end

	else if CountryCode = 'th' then
	Begin
	Result := 206;
	end

	else if CountryCode = 'tj' then
	Begin
	Result := 207;
	end

	else if CountryCode = 'tk' then
	Begin
	Result := 208;
	end

	else if CountryCode = 'tl' then
	Begin
	Result := 209;
	end

	else if CountryCode = 'tm' then
	Begin
	Result := 210;
	end

	else if CountryCode = 'tn' then
	Begin
	Result := 211;
	end

	else if CountryCode = 'to' then
	Begin
	Result := 212;
	end

	else if CountryCode = 'tr' then
	Begin
	Result := 213;
	end

	else if CountryCode = 'tt' then
	Begin
	Result := 214;
	end

	else if CountryCode = 'tv' then
	Begin
	Result := 215;
	end

	else if CountryCode = 'tw' then
	Begin
	Result := 216;
	end

	else if CountryCode = 'tz' then
	Begin
	Result := 217;
	end

	else if CountryCode = 'ua' then
	Begin
	Result := 218;
	end

	else if CountryCode = 'ug' then
	Begin
	Result := 219;
	end

	else if CountryCode = 'um' then
	Begin
	Result := 220;
	end

	else if CountryCode = 'us' then
	Begin
	Result := 221;
	end

	else if CountryCode = 'uy' then
	Begin
	Result := 222;
	end

	else if CountryCode = 'uz' then
	Begin
	Result := 223;
	end

	else if CountryCode = 'va' then
	Begin
	Result := 224;
	end

	else if CountryCode = 'vc' then
	Begin
	Result := 225;
	end

	else if CountryCode = 've' then
	Begin
	Result := 226;
	end

	else if CountryCode = 'vg' then
	Begin
	Result := 227;
	end

	else if CountryCode = 'vi' then
	Begin
	Result := 228;
	end

	else if CountryCode = 'vn' then
	Begin
	Result := 229;
	end

	else if CountryCode = 'vu' then
	Begin
	Result := 230;
	end

	else if CountryCode = 'wales' then
	Begin                 //welsh flag use union jack instead;
	Result := 231;
	end

	else if CountryCode = 'wf' then
	Begin
	Result := 232;
	end

	else if CountryCode = 'ws' then
	Begin
	Result := 233;
	end

	else if CountryCode = 'ye' then
	Begin
	Result := 234;
	end

	else if CountryCode = 'yt' then
	Begin
	Result := 235;
	end

	else if CountryCode = 'za' then
	Begin
	Result := 236;
	end

	else if CountryCode = 'zm' then
	Begin
	Result := 237;
	end

	else if CountryCode = 'zw' then
	Begin
	Result := 238;
	end

end;

end.
 