#include "Overlay.h"

LPCSTR windowClass = "overlayWnd";

BOOL update = FALSE;

HWND overlayWindow = NULL;
HDC overlayDC = NULL;

int w, h;

DWORD WINAPI overlayThread(LPVOID parameter) {
	WNDCLASSEX c;
	c.cbSize = sizeof(WNDCLASSEX);
	c.lpfnWndProc = WindowProcNoClose;
	c.lpszClassName = windowClass;
	c.style = 0;
	c.cbClsExtra = 0;
	c.cbWndExtra = 0;
	c.hInstance = GetModuleHandle(NULL);
	c.hIcon = 0;
	c.hCursor = LoadCursor(NULL, IDC_ARROW);
	c.hbrBackground = NULL;
	c.lpszMenuName = NULL;
	c.hIconSm = 0;

	RegisterClassEx(&c);

	w = GetSystemMetrics(SM_CXSCREEN);
	h = GetSystemMetrics(SM_CYSCREEN);

	overlayWindow = CreateWindowEx(WS_EX_TOPMOST | WS_EX_LAYERED | WS_EX_TRANSPARENT | WS_EX_TOOLWINDOW, windowClass, "",
		WS_POPUP, 0, 0, w, h, NULL, NULL, GetModuleHandle(NULL), NULL);

	CreateThread(NULL, 0, &overlayWindowThread, NULL, 0, NULL);

	MSG msg;
	while (GetMessage(&msg, NULL, 0, 0) > 0) {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	return 0;
}

// GET NOCLOSED!
LRESULT CALLBACK WindowProcNoClose(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
	if (msg == WM_DESTROY || msg == WM_CLOSE) {
		return 0;
	}

	return DefWindowProc(hwnd, msg, wParam, lParam);
}

FUNCTION(void) updateOverlay() {
	update = TRUE;
}

FUNCTION(void) initOverlay() {
	CreateThread(NULL, 0, &overlayThread, NULL, 0, NULL);
}

FUNCTION(HDC) getOverlayDC() {
	return overlayDC;
}

DWORD WINAPI overlayWindowThread(LPVOID parameter) {
	ShowWindow(overlayWindow, SW_SHOW);
	HDC windowDC = GetDC(overlayWindow);

	HDC screenDC = GetWindowDC(GetDesktopWindow());

	overlayDC = CreateCompatibleDC(screenDC);
	HBITMAP overlayBitmap = CreateCompatibleBitmap(screenDC, w, h);
	SelectObject(overlayDC, overlayBitmap);

	POINT zero = { 0, 0 };
	SIZE size = { w, h };

	BLENDFUNCTION bf;
	bf.AlphaFormat = AC_SRC_OVER;
	bf.BlendFlags = 0;
	bf.SourceConstantAlpha = 255;
	bf.AlphaFormat = AC_SRC_ALPHA;

	for (;;) {
		if (update) {
			UpdateLayeredWindow(overlayWindow, screenDC, &zero, &size, overlayDC, &zero, NULL, &bf, ULW_ALPHA);
			update = FALSE;
		}

		Sleep(1);
	}
}