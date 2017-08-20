//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Fake_Message.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "SUIButton"
#pragma link "SUIForm"
#pragma link "SUIGroupBox"
#pragma link "SUIImagePanel"
#pragma link "SUIRadioGroup"
#pragma link "SUIEdit"
#pragma resource "*.dfm"
TForm3 *Form3;

//---------------------------------------------------------------------------
__fastcall TForm3::TForm3(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm3::suiButton6Click(TObject *Sender)
{
if(suiRadioButton1->Checked==true)
b=MB_OK;
if(suiRadioButton2->Checked==true)
b=MB_OKCANCEL;
if(suiRadioButton3->Checked==true)
b=MB_YESNO;
if(suiRadioButton4->Checked==true)
b=MB_YESNOCANCEL;
if(suiRadioButton5->Checked==true)
b=MB_RETRYCANCEL;
if(suiRadioButton6->Checked==true)
b=MB_ABORTRETRYIGNORE;
MessageBox(NULL,suiEdit2->Text.c_str(),suiEdit1->Text.c_str(), a | b  );
}
//---------------------------------------------------------------------------
void __fastcall TForm3::suiButton4Click(TObject *Sender)
{
suiEdit1->Text="Error";
a=MB_ICONSTOP;
}
//---------------------------------------------------------------------------
void __fastcall TForm3::suiButton1Click(TObject *Sender)
{
suiEdit1->Text="";
a=0;
}
//---------------------------------------------------------------------------
void __fastcall TForm3::suiButton2Click(TObject *Sender)
{
suiEdit1->Text="Confirm";
a=MB_ICONQUESTION;
}
//---------------------------------------------------------------------------
void __fastcall TForm3::suiButton3Click(TObject *Sender)
{
suiEdit1->Text="Information";
a=MB_ICONINFORMATION;
}
//---------------------------------------------------------------------------
void __fastcall TForm3::suiButton5Click(TObject *Sender)
{
suiEdit1->Text="Warning";
a=MB_ICONEXCLAMATION;
}
//---------------------------------------------------------------------------

void __fastcall TForm3::FormCreate(TObject *Sender)
{
a=MB_ICONSTOP;
b=MB_OK;
}
//---------------------------------------------------------------------------


