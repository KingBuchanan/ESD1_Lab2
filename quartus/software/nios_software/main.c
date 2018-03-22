/*
 * main.c
 *
 *  Created on: Feb 16, 2018
 *      Author: hsb2790
 */
#include "system.h"

int main(void)
{
	unsigned long *switchesBase_ptr = (unsigned long *) I_SWITCHES_BASE;
	unsigned long *i_triggerBase_ptr = (unsigned long *) I_TRIGGERS_BASE;
	unsigned long *o_accumBase_ptr = (unsigned long *) O_ACCUMULATOR_BASE;
	unsigned long switch_val;
	unsigned long sum = 0;
	unsigned long i_trigger_val;

	while (1) {
		i_trigger_val = *i_triggerBase_ptr;
		switch_val = *switchesBase_ptr;

		if(i_trigger_val){
			sum += switch_val;

			while(i_trigger_val){
				i_trigger_val = *i_triggerBase_ptr;
			}
			*o_accumBase_ptr = sum;
		}
	}
}

