/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "SUIButton.hpp"
#include "SUIComboBox.hpp"
#include "SUIEdit.hpp"
#include "SUIForm.hpp"
#include "SUIGroupBox.hpp"
#include "SUIImagePanel.hpp"
#include "SUIRadioGroup.hpp"
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include "SUIDlg.hpp"
#include <Dialogs.hpp>
#include "SUIMemo.hpp"
#include <NMsmtp.hpp>
#include <Psock.hpp>
#include "ipwCore.h"
#include "ipwmx.h"
#include "SUIPopupMenu.hpp"
#include <ImgList.hpp>
#include <Menus.hpp>
#include "ipwsmtp.h"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TsuiForm *suiForm1;
        TsuiGroupBox *suiGroupBox1;
        TsuiEdit *suiEdit1;
        TsuiEdit *suiEdit2;
        TLabel *Label1;
        TLabel *Label2;
        TsuiButton *suiButton1;
        TsuiButton *suiButton2;
        TsuiCheckGroup *suiCheckGroup1;
        TsuiCheckBox *suiCheckBox1;
        TsuiCheckBox *suiCheckBox2;
        TsuiCheckBox *suiCheckBox3;
        TsuiCheckBox *suiCheckBox4;
        TsuiCheckBox *suiCheckBox5;
        TsuiCheckBox *suiCheckBox6;
        TsuiCheckBox *suiCheckBox7;
        TsuiCheckBox *suiCheckBox8;
        TsuiCheckBox *suiCheckBox9;
        TsuiCheckBox *suiCheckBox10;
        TsuiCheckGroup *suiCheckGroup2;
        TsuiCheckBox *suiCheckBox11;
        TsuiCheckBox *suiCheckBox12;
        TsuiCheckBox *suiCheckBox13;
        TsuiCheckBox *suiCheckBox14;
        TsuiCheckBox *suiCheckBox15;
        TsuiCheckBox *suiCheckBox16;
        TsuiComboBox *suiComboBox1;
        TsuiCheckGroup *suiCheckGroup3;
        TImage *Image1;
        TsuiButton *suiButton3;
        TsuiButton *suiButton4;
        TsuiCheckBox *suiCheckBox17;
        TsuiCheckBox *suiCheckBox18;
        TsuiRadioGroup *suiRadioGroup1;
        TsuiRadioButton *suiRadioButton1;
        TsuiRadioButton *suiRadioButton2;
        TsuiRadioButton *suiRadioButton3;
        TsuiRadioButton *suiRadioButton4;
        TsuiRadioButton *suiRadioButton5;
        TsuiCheckBox *suiCheckBox20;
        TsuiButton *suiButton5;
        TsuiButton *suiButton6;
        TsuiButton *suiButton7;
        TsuiButton *suiButton9;
        TsuiButton *suiButton10;
        TsuiCheckGroup *suiCheckGroup4;
        TsuiCheckBox *suiCheckBox19;
        TsuiComboBox *suiComboBox2;
        TLabel *Label3;
        TsuiMessageDialog *suiMessageDialog1;
        TLabel *Label4;
        TsuiEdit *suiEdit3;
        TOpenDialog *OpenDialog1;
        TTimer *Timer1;
        TsuiMemo *suiMemo1;
        TipwMX *ipwMX1;
        TsuiPopupMenu *suiPopupMenu1;
        TImageList *ImageList1;
        TMenuItem *CreateServer1;
        TMenuItem *RemoveServer1;
        TMenuItem *Hakkinda1;
        TMenuItem *Abaut1;
        TMenuItem *Exit1;
        TsuiButton *suiButton11;
        TipwSMTP *NMSMTP1;
        TsuiMessageDialog *suiMessageDialog2;
        TsuiButton *suiButton8;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall suiButton5Click(TObject *Sender);
        void __fastcall suiButton3Click(TObject *Sender);
        void __fastcall suiCheckBox19Click(TObject *Sender);
        void __fastcall suiButton9Click(TObject *Sender);
        void __fastcall suiButton4Click(TObject *Sender);
        void __fastcall suiCheckBox1MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox2MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox3MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox7MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox5MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox10MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox4MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox6MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox8MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox9MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox11MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox12MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox14MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox16MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox17MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox18MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox20MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox15MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox13MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton1MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton2MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton5MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton7MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiEdit1MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiEdit2MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiEdit3MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall Label4MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall Label1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall Label2MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall suiButton4MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton3MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton1Click(TObject *Sender);
        void __fastcall suiButton2Click(TObject *Sender);
        void __fastcall ipwMX1Response(TObject *Sender, int RequestId,
          AnsiString &Domain, AnsiString &MailServer, int Precedence,
          long TimeToLive, int StatusCode, AnsiString &Description);
        void __fastcall suiButton6Click(TObject *Sender);
        void __fastcall suiButton6MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton9MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiCheckBox19MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall Label3MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall suiButton7Click(TObject *Sender);
        void __fastcall suiButton10Click(TObject *Sender);
        void __fastcall suiButton8Click(TObject *Sender);
        void __fastcall Exit1Click(TObject *Sender);
        void __fastcall suiRadioButton1MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiRadioButton2MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiRadioButton3MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiRadioButton4MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiRadioButton5MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall suiButton11Click(TObject *Sender);
        void __fastcall suiButton11MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall NMSMTP1PITrail(TObject *Sender, int ErrorCode,
          AnsiString &Description);
private:	// User declarations
public:		// User declarations
AnsiString binded_file;
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
