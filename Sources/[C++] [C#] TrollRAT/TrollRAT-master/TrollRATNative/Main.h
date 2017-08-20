#pragma once

#include <Windows.h>

extern "C" {
	int _fltused = 0;
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD reason, LPVOID unused);