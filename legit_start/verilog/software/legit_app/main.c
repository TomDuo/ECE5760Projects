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
 	reset();

	while(1)
	{
		x = (x < 640 ? x + 60 : 0);
	 	draw_lander();
	 	usleep(50000);
	}
	return 0;
}

/*
 * TODO: char display overlay for meter and countdown etc
 *  	adjust parameters to follow the spec.
 *  copy the box of shit
 *
 */



