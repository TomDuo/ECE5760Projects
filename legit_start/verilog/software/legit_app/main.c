#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include "drawing.h"
#include "interrupts.h"

/********************************************************************************
 * This program demonstrates use of pixel buffer. It Draws a blue box on the
 * VGA display
********************************************************************************/
int main(void)
{
 	int x = 0;
	printf("HELLO\n");
	init_pio();
	/* draw a blue box approx in the middle of the screen */
 	clear_screen();
 	usleep(1000);
 	draw_line(200, 400, 400, 400, 0xffff);
 	draw_line(0, 300, 200, 400, 0xffff);
 	draw_line(400, 400, 640, 200, 0xffff);

	while(1)
	{
		x = (x < 640 ? x + 60 : 0);
	 	draw_lander(x, 100, -270, 1);
	 	usleep(1000000);
	 	erase_lander(x, 100, -270, 1);
	}
	return 0;
}



