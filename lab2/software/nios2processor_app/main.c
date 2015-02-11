#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "alt_types.h"
#include "altera_avalon_lcd_16207_regs.h"
#define LCD_WR_COMMAND_REG 0
#define LCD_RD_STATUS_REG 1
#define LCD_WR_DATA_REG 2
#define LCD_RD_DATA_REG 3

void
lcd_init(void) {
	usleep(15000);
	/* Wait for more than 15 ms before init */
	/* Set function code four times
	--
	8
	-
	bit, 2 line, 5x7 mode */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG,
	0x38);
	usleep(4100);
	/* Wait for more than 4.1 ms */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	usleep(100);
	/* Wait for more than 100 us */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	usleep(5000);
	/* Wait for more than 100 us */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	usleep(100);
	/* Wait for more than 100 us */
	/* Set Display to OFF*/
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x08);
	usleep(100);
	/* Set Display to ON */
	IOWR(LCD_0_BASE,
	LCD_WR_COMMAND_REG, 0x0C);
	usleep(100);
	/* Set Entry Mode
	--
	Cursor increment, display doesn't shift */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x06);
	usleep(100);
	/* Set the Cursor to the home position */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x02);
	usleep(2000);
	/* Display clear */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x01);
	usleep(2000);
}

alt_u32 test_lcd(void) {
	int i;
	char message[17] = "Hello World... ";
	char done[15] = "Done!";

	/* Write a simple message on the first line. */
	for (i = 0; i < 16; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG,message[i]);
		usleep(100);
	}

	/* Count along the bottom row */
	/* Set
	Address */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG,0xC0);
	usleep(1000);
	/* Display Count */
	for (i = 0; i < 10; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG, (char)(i+0x30) );
		usleep(500000);
		/* Wait
		0.5 sec */
	}
	/* Write "Done!" message on first line. */
	/* Set Address */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG,0x80);
	usleep(1000);
	/* Write data */
	for (i = 0; i < 14; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG, done[i]);
		usleep(100);
	}
	return (0);
}

int
main(void) {
	int count;
	lcd_init();
	test_lcd();
	count = 0;
	while (1) {
	}
	return (0);
}