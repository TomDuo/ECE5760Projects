
#include "drawing.h"
#include <stdlib.h>
#include <stdio.h>

#define BLACK           0x0000      /*   0,   0,   0 */
#define NAVY            0x000F      /*   0,   0, 128 */
#define DarkGreen       0x03E0      /*   0, 128,   0 */
#define DarkCyan        0x03EF      /*   0, 128, 128 */
#define MAROON          0x7800      /* 128,   0,   0 */
#define PURPLE          0x780F      /* 128,   0, 128 */
#define OLIVE           0x7BE0      /* 128, 128,   0 */
#define LightGrey       0xC618      /* 192, 192, 192 */
#define DarkGrey        0x7BEF      /* 128, 128, 128 */
#define BLUE            0x001F      /*   0,   0, 255 */
#define GREEN           0x07E0      /*   0, 255,   0 */
#define CYAN            0x07FF      /*   0, 255, 255 */
#define RED             0xF800      /* 255,   0,   0 */
#define MAGENTA         0xF81F      /* 255,   0, 255 */
#define YELLOW          0xFFE0      /* 255, 255,   0 */
#define WHITE           0xFFFF      /* 255, 255, 255 */
#define ORANGE          0xFD20      /* 255, 165,   0 */
#define GreenYellow     0xAFE5      /* 173, 255,  47 */
#define PINK                        0xF81F

unsigned int cos_table[91] = {255, 255, 255, 255, 254, 254, 254, 253, 253, 252, 251,
		250, 249, 248, 247, 246, 245, 244, 243, 241, 240, 238, 236, 235, 233,
		231, 229, 227, 225, 223, 221, 219, 216, 214, 211, 209, 206, 204, 201,
		198, 195, 192, 190, 186, 183, 180, 177, 174, 171, 167, 164, 160, 157,
		153, 150, 146, 143, 139, 135, 131, 128, 124, 120, 116, 112, 108, 104,
		100, 96, 91, 87, 83, 79, 75, 70, 66, 62, 57, 53, 49, 44, 40, 35, 31,
		27, 22, 18, 13, 9, 4, 0};
unsigned int sin_table[91] = {0, 4, 9, 13, 18, 22, 27, 31, 35, 40, 44, 49, 53, 57, 62,
		66, 70, 75, 79, 83, 87, 91, 96, 100, 104, 108, 112, 116, 120, 124, 128,
		131, 135, 139, 143, 146, 150, 153, 157, 160, 164, 167, 171, 174, 177,
		180, 183, 186, 190, 192, 195, 198, 201, 204, 206, 209, 211, 214, 216,
		219, 221, 223, 225, 227, 229, 231, 233, 235, 236, 238, 240, 241, 243,
		244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 253, 254, 254, 254,
		255, 255, 255, 255};

#define INPUT_ABS(a) do { \
			if (a < 0){ \
				input = (unsigned int)(-a); \
				sign = -sign; \
			} else { \
				input = (unsigned int)a; \
			} \
		} while(0)

int cos(int theta_raw, int a){
	unsigned int result_abs;
	unsigned int theta;
	unsigned int input;
	signed short sign = 1;

	if (theta_raw < 0){
		theta = (unsigned int)(-theta_raw);
	}

	INPUT_ABS(a);

	theta = theta % 365;
	if(theta > 180){
		theta = 360 - theta;
	}

	if (theta > 90) {
		sign = -sign;
		theta = 180 - theta;
	}
	result_abs = cos_table[theta] * input >> 8;
	printf("%dcos(%d)=%d * %d\n", input, theta, result_abs, sign);
	return (int)result_abs * sign;
}

int sin(int theta_raw, int a){
	unsigned int result_abs;
	unsigned int theta;
	unsigned int input;
	signed short sign = 1;

	if (theta_raw < 0){
		theta = (unsigned int)(-theta_raw);
		sign = -sign;
	}

	INPUT_ABS(a);

	theta = theta % 365;
	if(theta > 180){
		sign = -sign;
		theta = theta - 180;
	}

	if (theta > 90) {
		theta = 180 - theta;
	}
	result_abs = sin_table[theta] * input >> 8;
	printf("%dsin%d=%d * %d\n", input, theta, result_abs, sign);
	return (int)result_abs * sign;
}

void draw_line(int x1, int y1, int x2, int y2, short color)
{
  int i,dx,dy,sdx,sdy,dxabs,dyabs,x,y,px,py;
  volatile short* VGA = (short*)0;

  dx=x2-x1;      /* the horizontal distance of the line */
  dy=y2-y1;      /* the vertical distance of the line */
  dxabs=abs(dx);
  dyabs=abs(dy);
  sdx=sgn(dx);
  sdy=sgn(dy);
  x=dyabs>>1;
  y=dxabs>>1;
  px=x1;
  py=y1;

  VGA[(py << 10) + px]=color;

  if (dxabs>=dyabs) /* the line is more horizontal than vertical */
  {
    for(i=0;i<dxabs;i++)
    {
      y+=dyabs;
      if (y>=dxabs)
      {
        y-=dxabs;
        py+=sdy;
      }
      px+=sdx;
      VGA[(py << 10) + px]=color;
    }
  }
  else /* the line is more vertical than horizontal */
  {
    for(i=0;i<dyabs;i++)
    {
      x+=dxabs;
      if (x>=dyabs)
      {
        x-=dyabs;
        px+=sdx;
      }
      py+=sdy;
      VGA[(py << 10) + px]=color;
    }
  }
}

void clear_screen()
{
	draw_box(0,0,640,480, 0x0000);
}


void draw_box(int x1, int y1, int x2, int y2, short pixel_color)
{
	int offset, row, col;
	/* Declare volatile pointer to pixel buffer (volatile means that IO load
	   and store instructions will be used to access these pointer locations,
	   instead of regular memory loads and stores) */
  	volatile short * pixel_buffer = (short *) 0x00000000;	// VGA pixel buffer address

	/* assume that the box coordinates are valid */
	for (row = y1; row < y2; ++row)
	{
		for(col = x1; col < x2; ++col)
		{
			offset = (row << 10) + col;
			*(pixel_buffer + offset) = pixel_color;	// compute halfword address, set pixel
		}
	}
}

void rotate(int cx, int cy, int* x, int* y, unsigned int theta)
{
	int res_x;
	int res_y;
	*x -= cx;
	*y -= cy;
	printf("cx=%d cy=%d x' =%d y'=%d ", cx, cy, *x, *y);
	res_x = cx + cos(theta, *x) - sin(theta, *y);
	res_y = cy + sin(theta, *x) + cos(theta, *y);
	*x = res_x;
	*y = res_y;
	printf("x'' =%d y''=%d ",*x, *y);
}

#define ROTATE(n) rotate(x, y, &(x##n), &(y##n), theta)

void draw_lander(int x, int y, unsigned int theta, int thrust)
{
	int x1 = x - (3<<3);
	int y1 = y;
	int x2 = x - (3<<3);
	int y2 = y + (5<<3);
	int x3 = x + (3<<3);
	int y3 = y + (5<<3);
	int x4 = x + (3<<3);
	int y4 = y;
	int x5 = x;
	int y5 = y - (4<<3);

	int x6 = x;
	int y6 = y + (6<<3);
	int x7 = x - (2<<3);
	int y7 = y6;
	int x8 = x - (1<<3);
	int y8 = y + (9<<3);
	int x9 = x + (2<<3);
	int y9 = y6;
	int x10 = x + (1<<3);
	int y10 = y8;



	//clean and legit
	draw_line(x1, y1, x2, y2, RED);
	draw_line(x2, y2, x3, y3,RED);
	draw_line(x3, y3, x4, y4,RED);
	draw_line(x1, y1, x5, y5,RED);
	draw_line(x5, y5, x4, y4,RED);

	draw_line(x7, y7, x9, y9,CYAN);
	draw_line(x6, y6, x8, y8,CYAN);
	draw_line(x7, y7, x8, y8,CYAN);
	draw_line(x7, y7, x10, y10,CYAN);
	draw_line(x9, y9, x10, y10,CYAN);

	ROTATE(1);
	ROTATE(2);
	ROTATE(3);
	ROTATE(4);
	ROTATE(5);
	ROTATE(6);
	ROTATE(7);
	ROTATE(8);
	ROTATE(9);
	ROTATE(10);

	draw_line(x1, y1, x2, y2, BLUE);
	draw_line(x2, y2, x3, y3, BLUE);
	draw_line(x3, y3, x4, y4, BLUE);
	draw_line(x1, y1, x5, y5, BLUE);
	draw_line(x5, y5, x4, y4, BLUE);
	draw_line(x6, y6, x8, y8,YELLOW);
	draw_line(x6, y6, x7, y7,YELLOW);
	draw_line(x7, y7, x8, y8,YELLOW);

}

void erase_lander()
{

}
