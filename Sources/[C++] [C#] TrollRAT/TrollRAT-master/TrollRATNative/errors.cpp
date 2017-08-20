// This weird code is stolen from my other project, ErrorStick.
// I never published ErrorStick, but I think I will soon.

#include "Errors.h"

unsigned short errorIds[ERROR_COUNT];

void initErrors() {
	int i = 0, d = 0, o = 0;
	for (; d < sizeof(errorData); d++) {
		unsigned char b = errorData[d];

		short n = b & 63;
		if (b & 64)
			n |= errorData[++d] << 6;

		if (b & 128) {
			int s = i + n;
			for (; i < s; i++) {
				errorIds[i] = ++o;
			}
		}
		else {
			o += n;
			errorIds[i++] = o;
		}
	}
}