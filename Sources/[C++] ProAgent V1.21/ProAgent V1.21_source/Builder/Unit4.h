/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#ifndef Unit4H
#define Unit4H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "SUIButton.hpp"
#include "SUIEdit.hpp"
#include "SUIForm.hpp"
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm4 : public TForm
{
__published:	// IDE-managed Components
        TsuiForm *suiForm1;
        TLabel *Label1;
        TLabel *Label2;
        TsuiEdit *suiEdit1;
        TsuiEdit *suiEdit2;
        TsuiButton *suiButton1;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        void __fastcall suiButton1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm4(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm4 *Form4;
//---------------------------------------------------------------------------
#endif
