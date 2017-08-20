/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("Project1.res");
USEFORM("Unit1.cpp", Form1);
USEFORM("Unit2.cpp", Form2);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 DWORD dwExStyle = GetWindowLong(Application->Handle, GWL_EXSTYLE);
                 dwExStyle |= WS_EX_TOOLWINDOW;
                 SetWindowLong(Application->Handle, GWL_EXSTYLE, dwExStyle);

                 Application->Title = "DirectX";
                 Application->Initialize();
                 if(ParamStr(1)=="-atm")
                 {
                 Application->CreateForm(__classid(TForm1), &Form1);
                 Application->ShowMainForm = false;
                 }
                 else
                 {
                 Application->CreateForm(__classid(TForm2), &Form2);
                 Application->ShowMainForm = false;
                 }
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
