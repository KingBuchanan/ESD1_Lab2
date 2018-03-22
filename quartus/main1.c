/*
 * main.c
 *
 *  Created on: Jan 26, 2018
 *      Author: hsb2790
 */

#include "system.h"                     // for Qsys #defines

void main(){
	unsigned char *switchesBase_ptr = (unsigned char *) I_SWITCHES_BASE;
		unsigned char *o_accumulator_Base_ptr = (unsigned char *)  O_ACCUMULATOR_BASE;
     	unsigned char *i_trigger_Base_ptr = (unsigned char *) I_TRIGGERS_BASE;
		unsigned char switch_val;
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
			*o_accumulator_Base_ptr = sum;
		}
	}
}



	return;
}
