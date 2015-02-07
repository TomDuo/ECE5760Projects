#include <stdio.h>
#include "system.h"


int
main(void) {
	usleep(2000);
	fprintf(stderr, "STARTING...");
	FILE* fp;
	fp = fopen ("/dev/lcd_0", "w");
	usleep(2000);
	if (fp == NULL)
	{
		fprintf(stderr, "open failed\n");
		return 0;
	}

	fprintf(fp, "This is LCD demo\n");
	fprintf(fp, "Altera HAL usage");
	fclose (fp);
	fprintf(stderr, "DONE...");
	//while (1);
	return 0;
}
