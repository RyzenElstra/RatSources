#pragma once

#include <Windows.h>

#define InitHDCs \
HWND hwnd = GetDesktopWindow(); \
HDC hdc = GetWindowDC(hwnd); \
RECT rekt; \
GetWindowRect(hwnd, &rekt); \
int w = rekt.right - rekt.left; \
int h = rekt.bottom - rekt.top;

#define FreeHDCs ReleaseDC(hwnd, hdc);