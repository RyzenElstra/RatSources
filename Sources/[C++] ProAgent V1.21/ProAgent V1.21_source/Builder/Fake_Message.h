/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#ifndef Fake_MessageH
#define Fake_MessageH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "SUIButton.hpp"
#include "SUIForm.hpp"
#include "SUIGroupBox.hpp"
#include "SUIImagePanel.hpp"
#include "SUIRadioGroup.hpp"
#include <ExtCtrls.hpp>
#include "SUIEdit.hpp"
//---------------------------------------------------------------------------
class TForm3 : public TForm
{
__published:	// IDE-managed Components
        TsuiForm *suiForm1;
        TsuiCheckGroup *suiCheckGroup1;
        TsuiButton *suiButton1;
        TsuiButton *suiButton2;
        TsuiButton *suiButton3;
        TsuiButton *suiButton4;
        TsuiButton *suiButton5;
        TsuiCheckGroup *suiCheckGroup2;
        TsuiRadioButton *suiRadioButton1;
        TsuiRadioButton *suiRadioButton2;
        TsuiRadioButton *suiRadioButton3;
        TsuiRadioButton *suiRadioButton4;
        TsuiRadioButton *suiRadioButton5;
        TsuiRadioButton *suiRadioButton6;
        TLabel *Label1;
        TLabel *Label2;
        TsuiEdit *suiEdit1;
        TsuiEdit *suiEdit2;
        TsuiButton *suiButton6;
        TsuiButton *suiButton7;
        void __fastcall suiButton6Click(TObject *Sender);
        void __fastcall suiButton4Click(TObject *Sender);
        void __fastcall suiButton1Click(TObject *Sender);
        void __fastcall suiButton2Click(TObject *Sender);
        void __fastcall suiButton3Click(TObject *Sender);
        void __fastcall suiButton5Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
int a,b;
        __fastcall TForm3(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm3 *Form3;
//---------------------------------------------------------------------------
#endif
