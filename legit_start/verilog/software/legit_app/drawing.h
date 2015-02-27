/*
 * drawing.h
 *
 *  Created on: Feb 11, 2015
 *      Author: Lab User
 */

#ifndef DRAWING_H_
#define DRAWING_H_

#define sgn(x) ((x<0)?-1:((x>0)?1:0))

int count;

void draw_box (int, int, int, int, short);
void draw_surface(int x1, int y1, int x2, int y2);
void reset();
void line_fast(int x1, int y1, int x2, int y2, short color);
void draw_line(int x1, int y1, int x2, int y2, short color);
void instruction(int inst);
void VGA_text(int x, int y, char * text_ptr);

#endif /* DRAWING_H_ */
