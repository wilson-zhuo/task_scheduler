#ifdef _GNU_C
#include "stm32f1xx.h"
#endif
#include "../cmsis_device_f1/Include/stm32f103x6.h"
#include <stdio.h>
// Hard Fault handler in C, with stack frame location and LR value
// extracted from the assembly wrapper as input parameters
void HardFault_Handler_C(unsigned long * hardfault_args, unsigned int lr_value)
{
  unsigned long stacked_r0;
  unsigned long stacked_r1;
  unsigned long stacked_r2;
  unsigned long stacked_r3;
  unsigned long stacked_r12;
  unsigned long stacked_lr;
  unsigned long stacked_pc;
  unsigned long stacked_psr;
  unsigned long cfsr;
  unsigned long bus_fault_address;
  unsigned long memmanage_fault_address;

  bus_fault_address       = SCB->BFAR;
  memmanage_fault_address = SCB->MMFAR;
  cfsr                    = SCB->CFSR;
	
  stacked_r0 = ((unsigned long) hardfault_args[0]);
  stacked_r1 = ((unsigned long) hardfault_args[1]);
  stacked_r2 = ((unsigned long) hardfault_args[2]);
  stacked_r3 = ((unsigned long) hardfault_args[3]);
  stacked_r12 = ((unsigned long) hardfault_args[4]);
  stacked_lr  = ((unsigned long) hardfault_args[5]);
  stacked_pc  = ((unsigned long) hardfault_args[6]);
  stacked_psr = ((unsigned long) hardfault_args[7]);

  printf ("[HardFault]\n");
  printf ("- Stack frame:\n"); 
  printf (" R0  = %x\n", stacked_r0);
  printf (" R1  = %x\n", stacked_r1);
  printf (" R2  = %x\n", stacked_r2);
  printf (" R3  = %x\n", stacked_r3);
  printf (" R12 = %x\n", stacked_r12);
  printf (" LR  = %x\n", stacked_lr);
  printf (" PC  = %x\n", stacked_pc);
  printf (" PSR = %x\n", stacked_psr);
  printf ("- FSR/FAR:\n");  
  printf (" CFSR = %x\n", cfsr);
  printf (" HFSR = %x\n", SCB->HFSR);
  printf (" DFSR = %x\n", SCB->DFSR);
  printf (" AFSR = %x\n", SCB->AFSR);
  if (cfsr & 0x0080) printf (" MMFAR = %x\n", memmanage_fault_address);
  if (cfsr & 0x8000) printf (" BFAR = %x\n", bus_fault_address);
  printf ("- Misc\n"); 
  printf (" LR/EXC_RETURN= %x\n", lr_value);
		
  while(1); // endless loop
}
