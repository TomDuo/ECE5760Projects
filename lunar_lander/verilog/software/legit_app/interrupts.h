/*
 * interrupts.h
 *
 *  Created on: Feb 11, 2015
 *      Author: Lab User
 */
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"

#ifndef INTERRUPTS_H_
#define INTERRUPTS_H_

#define PIO_BASE 0x00301010
#define PIO_IRQ 0

void init_pio();
void handle_button_interrupts(void* context, alt_u32 id);

#endif /* INTERRUPTS_H_ */
