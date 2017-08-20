#pragma once

#include <Windows.h>

#define FUNCTION(r) extern "C" __declspec(dllexport) r __stdcall

FUNCTION(void) initOverlay();
FUNCTION(void) updateOverlay();
FUNCTION(HDC) getOverlayDC();

DWORD WINAPI overlayThread(LPVOID parameter);
DWORD WINAPI overlayWindowThread(LPVOID parameter);

LRESULT CALLBACK WindowProcNoClose(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam);