#include <stdint.h>

uint8_t bssarray[1024];

const uint8_t roarray[8] = { 1, 2, 3, 4, 5, 6, 7, 8 };

uint8_t dataarray[16] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };

int test(int, int);

int main(void) {
	return test(4, 5);
}

int __attribute__((noinline)) test(int a, int b) {
	int xx = (a >> 8) & 4;
	int yy = (a >> 4) & 4;
	int zz = b & 4;
	return xx + yy * zz;
}
