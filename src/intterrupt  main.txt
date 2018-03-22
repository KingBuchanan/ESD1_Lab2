#include <sys/alt_irq.h>                // for IRQ support function
#include "system.h"                     // for Qsys #defines

#define PIO_DATA_REG_OFFSET         0
#define PIO_DATA_DIR_REG_OFFSET     1
#define PIO_INT_MASK_REG_OFFSET     2
#define PIO_EDGE_CAP_REG_OFFSET     3

#define KEY1_BIT_MASK               0x1         // bit 0


unsigned long* switchesPtr = (unsigned long*)I_SWITCHES_BASE; // may want or need volatile
unsigned long* AccumPtr  = (unsigned long*)O_ACCUMULATOR_BASE;
unsigned long * i_trigger = (unsigned long*)I_TRIGGERS_BASE;
int flag=0; 
unsigned long Accuma_val;// Current accumulator value.
unsigned long Witches_val;// Current switch value.





void pushButtonIsr(void *context)
{
  unsigned long  reg_value   = 0;

  reg_value = *(i_trigger + PIO_EDGE_CAP_REG_OFFSET);

  // determine which push button was pressed
  // assume more than one could be pressed at the same time
  flag=1;
  // clear the interrupt bits set by writing back value read
 *(i_trigger + PIO_EDGE_CAP_REG_OFFSET)= reg_value;

} /* pushButtonIsr */

int main(void)
{

  

  // register the Interrupt Service Handler
  alt_ic_isr_register(I_TRIGGERS_IRQ_INTERRUPT_CONTROLLER_ID, I_TRIGGERS_IRQ,
                      pushButtonIsr, 0, 0);

  // ------------------------------------------------------------------
  // clear edge capture register of pushButtonPtr and then unmask
  // interrupt for KEY1_BIT_MASK
  // ------------------------------------------------------------------
  *(i_trigger + PIO_EDGE_CAP_REG_OFFSET) = (KEY1_BIT_MASK);
  *(i_trigger + PIO_INT_MASK_REG_OFFSET) = (KEY1_BIT_MASK);

  // loop forever
  while (1)
  {
    Accuma_val=*AccumPtr;
	Witches_val=*switchesPtr;

	if(flag){
		*AccumPtr=Accuma_val+Witches_val;
     flag=0;
	};
	
  }

  return (0);
}

  /* main */

