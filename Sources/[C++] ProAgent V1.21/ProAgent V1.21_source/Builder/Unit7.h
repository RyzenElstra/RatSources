/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#ifndef Unit7H
#define Unit7H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "SUIButton.hpp"
#include "SUIEdit.hpp"
#include "SUIForm.hpp"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm7 : public TForm
{
__published:	// IDE-managed Components
        TsuiForm *suiForm1;
        TsuiEdit *suiEdit1;
        TLabel *Label1;
        TsuiButton *suiButton1;
        void __fastcall suiButton1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm7(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm7 *Form7;
//---------------------------------------------------------------------------
#endif
