#include "Main.h"
#include "Errors.h"

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD reason, LPVOID unused) {
	initErrors();

	return TRUE;
}