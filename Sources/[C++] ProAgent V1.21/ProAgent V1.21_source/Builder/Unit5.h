/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#ifndef Unit5H
#define Unit5H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "SUIForm.hpp"
#include <ExtCtrls.hpp>
#include <jpeg.hpp>
#include "SUIURLLabel.hpp"
#include "SUIButton.hpp"
//---------------------------------------------------------------------------
class TForm5 : public TForm
{
__published:	// IDE-managed Components
        TsuiForm *suiForm1;
        TImage *Image1;
        TImage *Image2;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label11;
        TLabel *Label12;
        TLabel *Label13;
        TsuiURLLabel *suiURLLabel1;
        TLabel *Label14;
        TsuiURLLabel *suiURLLabel2;
        TLabel *Label15;
        TLabel *Label16;
        TLabel *Label8;
        TsuiURLLabel *suiURLLabel3;
private:	// User declarations
public:		// User declarations
        __fastcall TForm5(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm5 *Form5;
//---------------------------------------------------------------------------
#endif
