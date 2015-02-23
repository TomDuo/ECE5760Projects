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
	printf("HELLO\n");
	init_pio();
	/* draw a blue box approx in the middle of the screen */
 	clear_screen();
 	usleep(1000);
 	draw_line(200, 400, 400, 400, 0xffff);
 	draw_line(0, 300, 200, 400, 0xffff);
 	draw_line(400, 400, 640, 200, 0xffff);
 	draw_lander(100,100,-90 ,1);
 	erase_lander(100,100, 0,1);
	while(1)
		usleep(10000000);
	return 0;
}



