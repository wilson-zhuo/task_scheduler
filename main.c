/**
 * @file main.c
 * @author wilson
 * @copyright 2023
 */
#include "stm32f103x6.h"
#include "task.h"
#include "scheduler.h"
#include <stdlib.h>
#include <cmsis_armclang.h>
#include <stdio.h>
#include <core_cm3.h>
task_id_t xtask1,xtask2;
uint32_t ultask1stack[128];
uint32_t ultask2stack[128];
volatile uint32_t printf_mutex;
int fputc(int ch,FILE* f)
{
	ITM_SendChar(ch);
	return ch;
}
void task1_fun(void* arg)
{
	uint32_t tick=0,cur_tick=0;
	while(1)
	{
		cur_tick = ulGetTick();
		#if 0
		if(cur_tick>tick+1000)
		{
			if(printf_mutex==0u)
			{
				printf("task1 running:%d\n",cur_tick);
				vTaskDelay(1000);
			}
			tick = cur_tick;
		}
		#else
		printf("task1 running:%d\n",cur_tick);
		vTaskDelay(1000);
		#endif
	}
}
void task2_fun(void* arg)
{
	uint32_t tick=0,cur_tick=0;
	while(1)
	{
		cur_tick = ulGetTick();
		#if 0
		if(cur_tick>tick+5000)
		{
			
			if(printf_mutex)
			{
				printf("task2 running:%d\n",cur_tick);
				printf_mutex = 0u;
			}
			tick = cur_tick;
		}
		#else
		printf("task2 running:%d\n",cur_tick);
		vTaskDelay(5000);
		#endif
	}
}
void task_idle(void* arg)
{
	uint32_t tick=0,cur_tick=0;
	while(1)
	{
		cur_tick = ulGetTick();
		if(cur_tick>tick+500)
		{
			printf("idle running:%d\n",cur_tick);
			tick = cur_tick;
		}
	}
}
int main(void)
{
	///< for test
	SystemCoreClockUpdate();
	xtask1 = xTaskCreate(NULL,ultask1stack,128,"test1",task1_fun,0,0);
	xtask2 = xTaskCreate(NULL,ultask2stack,128,"test2",task2_fun,0,1);
	vSchedulerStart(SystemCoreClock/1000u);
	return 0;
}
