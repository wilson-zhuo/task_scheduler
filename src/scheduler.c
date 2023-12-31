/**
 * @file scheduler.c
 * @author wilson
 * @copyright 
 * 
 */
#include "../inc/task.h"
#include "../inc/scheduler.h"
#include "../cmsis_device_f1/Include/stm32f103x6.h"
task_ctrl_t *pxCurActiveTask,*pxTaskIdle, *pxReadyTask;
static uint32_t g_tick=0;
extern void task_idle(void* arg);
static uint32_t task_idle_stk[128];
uint8_t ucScheduleInit(uint32_t tick_interval)
{
	(void)tick_interval;
    return 0;
}
void vSchedulerStart(uint32_t tick_interval)
{
    __disable_irq();
    NVIC_SetPriorityGrouping(0x3);//GROUP4:4BIT pre-emption
	SysTick_Config(tick_interval);
    NVIC_SetPriority(PendSV_IRQn,15);
    NVIC_EnableIRQ(PendSV_IRQn);
	NVIC_SetPriority(SVCall_IRQn,15);
    NVIC_EnableIRQ(SVCall_IRQn);
	xTaskCreate((void*)0,task_idle_stk,128,"idle",task_idle,5,cfg_TASK_PRIO-1u);
    vGetHighestPrioReadyTask();
	vStartTask(pxCurActiveTask);
}
/**
 * @brief 上下文切换
 * 
 */
void vContentSwitch(void)
{
    //trigger pendsv
	__asm volatile(
		"svc 0\n\t"
	);
}

uint32_t ulGetTick(void)
{
	return g_tick;
}
void SysTick_Handler(void)
{
	__asm volatile(
		".extern TaskManager\n\t"	
		"ldr r1,g_tick_const		\n\t"
		"ldr r0,[r1]				\n\t"
		"adds r0,r0,#1				\n\t"
		"str r0,[r1]				\n\t"
		"mov r4, lr\n\t"
        "bl TaskManager			\n\t"
		"mov lr, r4\n\t"
		"g_tick_const:.word g_tick	\n\t"
    );
	if(!pxCurActiveTask->ulTicks)
    {
		pxCurActiveTask->ulTicks = pxCurActiveTask->ulTickReload;
		SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
    }
}

void SVC_Handler(void)
{
	SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}
#if 1
void PendSV_Handler(void)
{
    __asm volatile(
        ".extern vGetHighestPrioReadyTask\n\t"
		"mrs r0,psp \n"
#ifdef USE_HARD_VFP
        "tst lr,#0x10   \n"
        "it eq  \n"
        "vstmdbeq r0!,{s16-s31} \n"
#endif
        "stmdb r0!,{r4-r11} 			\n"// save content
        "ldr r4,pxtcbcurconst  			\n"// load tcb
        "ldr r4,[r4]    				\n"//get the first member of tcb
        "str r0,[r4]    				\n"//save the top of stack addr into tcb
        "stmdb sp!,{r4-r11,lr} 			\n" //save interrupt content
        "bl vGetHighestPrioReadyTask 	\n" //get next task with highest priority
        "ldmia sp!,{r4-r11,lr} 			\n"	//restore interrupt content
        "ldr r0,pxtcbcurconst   		\n"
		"ldr r4,[r0]    				\n"
        "ldr r0,[r4]    				\n"
        "ldmia r0!,{r4-r11} 			\n"//restore the content
		"msr psp,r0     				\n"
		"dsb\n\t"
		"isb\n\t"
        "bx lr \n"
        ".align 4 \n"
        "pxtcbcurconst:.word pxCurActiveTask   	\n"
    );
}
#else

#endif