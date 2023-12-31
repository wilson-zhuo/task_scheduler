#ifndef _SCHEDULER_H
#define _SCHEDULER_H
#include <stdint.h>
uint8_t ucScheduleInit(uint32_t);
void vContentSwitch(void);
void vSchedulerStart(uint32_t tick_interval);
uint32_t ulGetTick(void);
#endif