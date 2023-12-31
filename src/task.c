/**
 * @file task.c
 * @author wilson
 * @copyright 
 * 
 */
#include <stdlib.h>
#include "../inc/task.h"
#include "../inc/scheduler.h"
#define taskINIT_XPSR 0x01000000UL
#define taskINIT_EXC_RETURN 0xFFFFFFFDUL
static task_ctrl_t* pxArrayTaskPrio[cfg_TASK_PRIO];
extern task_ctrl_t *pxCurActiveTask,*pxReadyTask,*pxTaskIdle;
static uint32_t* vCreateTaskInitStack(uint32_t param,task_func_t ulTaskEntry,uint32_t *pulStackTop)
{
    pulStackTop = (uint32_t *)((uint32_t)pulStackTop & 0xFFFFFFF8u);
    *(--pulStackTop) = taskINIT_XPSR;
    *(--pulStackTop) = (uint32_t)ulTaskEntry;///< func excu start point
    *(--pulStackTop) = taskINIT_EXC_RETURN;//lr
    pulStackTop-=5;//{r0~r3,r12}
    *pulStackTop = param;//r0
	
    pulStackTop-=8;//{r4~r11}
	//*(--pulStackTop)=taskINIT_EXC_RETURN;
	//*(--pulStackTop)=0x3;//CONTROL
    return pulStackTop;
}

task_id_t xTaskCreate(void* param,
		uint32_t* pulstack,
		uint32_t ulStackSizeWords,
		char* task_name,
		task_func_t func,
		uint32_t ulTicks,
		uint32_t ulTaskPrio
		)
{
    task_ctrl_t* pxNewTask=NULL;
    task_ctrl_t* pxTask=pxArrayTaskPrio[ulTaskPrio];
    pxNewTask = (task_ctrl_t*)malloc(sizeof(task_ctrl_t));//分配节点存储空间
    uint32_t i=0;
    while(*(task_name+i)!=NULL)
    {
        pxNewTask->scTaskName[i]=*(task_name+i);
		++i;
        if(i>=8)break;
    }
    pxNewTask->pulStack = pulstack;
    pxNewTask->func = func;
    pxNewTask->xTaskState = READY;
    pxNewTask->ulTaskPrio = ulTaskPrio;
    pxNewTask->ulTaskStackSize = ulStackSizeWords;
	pxNewTask->ulTickReload = ulTicks;
	pxNewTask->ulTicks = pxNewTask->ulTickReload;
    pxNewTask->pulStack=(volatile uint32_t*)vCreateTaskInitStack((uint32_t)param,func,pulstack+ulStackSizeWords-1);///< REGS:r0~r15,xPXR,CONTROL
    if(pxArrayTaskPrio[ulTaskPrio])
    {
        while(pxTask->pxNextTask)//寻找最后一个非NULL节点
        {
            pxTask = pxTask->pxNextTask;
        }
        pxTask->pxNextTask = pxNewTask;
    }
    else
    {
        pxArrayTaskPrio[ulTaskPrio] = pxNewTask;
    }
    //加入到就绪链表,遍历优先级任务链表数组
    //vTaskAddTo(pxTaskReadyList,pxNewTask);
    return (task_id_t)pxNewTask;
}

static void vTaskAddTo(task_ctrl_t* pxList,task_ctrl_t* pxTaskToAdd)
{
    task_ctrl_t* pxTask = pxList,*prev_node=pxList;
    while(pxTask)
    {
        prev_node = pxTask;
        pxTask = pxTask->pxNextTask;
    }
    if(pxTask){
        pxTask->pxNextTask = pxTaskToAdd;
    }
    else{
        pxList = pxTaskToAdd;
    }
}

static task_ctrl_t* pxGetTaskFrom(task_ctrl_t* pxList,task_ctrl_t* pxTaskId)
{
    task_ctrl_t* pxTask = pxList;
    task_ctrl_t* pxPrevTask;
    task_ctrl_t* ret=NULL;
    while(pxTask)//循环查找直到最后一个NULL节点
    {
        pxPrevTask = pxTask;
        if(pxTaskId == pxTask)
        {
            ret = pxTask;
            pxPrevTask->pxNextTask = pxTask->pxNextTask;
            break;
        }
        pxTask = pxTask->pxNextTask;
    }
    return (ret);
}

void vTaskDelete(task_id_t xId)
{
    //pxGetTaskFrom(pxTaskActiveList,xId);
    task_ctrl_t* pxTask = (task_ctrl_t*)xId;
    pxGetTaskFrom(pxArrayTaskPrio[pxTask->ulTaskPrio],pxTask);
    free(pxTask);///<后续增加内存管理时再使用内存管理函数释放调度器内存资源
    vContentSwitch();
}

void vTaskSuspend(task_id_t xId)
{
    task_ctrl_t* pxTask = (task_ctrl_t*)xId;
    pxTask->xTaskState = SUSPEND;
    vContentSwitch();
}

void vTaskResume(task_id_t xId)
{
    task_ctrl_t* pxTask = (task_ctrl_t*)xId;
    pxTask->xTaskState = READY;
    vContentSwitch();
}

void vTaskDelay(uint32_t ulTime)
{
    pxCurActiveTask->ulDelayTicks = ulTime;
    vContentSwitch();
}

void vGetHighestPrioReadyTask(void)
{
    uint32_t i=0;
    task_ctrl_t *ll=NULL;
    for(;i<cfg_TASK_PRIO;i++)
    {
        ll = pxArrayTaskPrio[i];
        while(ll)
        {
            if(ll->xTaskState==READY)
            {
                if(pxCurActiveTask->ulDelayTicks)
				{
					pxCurActiveTask->xTaskState = BLOCKED;
				}
				else if(pxCurActiveTask->ulTaskSuspendFlag)
				{
					pxCurActiveTask->xTaskState = SUSPEND;
				}
				else
				{
					pxCurActiveTask->xTaskState = READY;
				}
				pxReadyTask=ll;
				pxCurActiveTask = pxReadyTask;
				pxCurActiveTask->xTaskState = ACTIVE;
				return;
            }
            ll = ll->pxNextTask; 
        }
    }
    return;
}

task_ctrl_t* TaskManager(void)
{
    uint32_t i=0;
    task_ctrl_t* ll;
    for(;i<cfg_TASK_PRIO;i++)
    {
        ll = pxArrayTaskPrio[i];
        while(ll)
        {
            if(ll->xTaskState==BLOCKED)
            {
                if(ll->ulDelayTicks)//因延迟阻塞
				{
					ll->ulDelayTicks--;
					if(ll->ulDelayTicks==0)
					{
						ll->xTaskState=READY;
					}
				}
				else if(0)//等待事件
				{
					;
				}
            }
			else if(ll->xTaskState == ACTIVE)
			{
				if(ll->ulTicks)--ll->ulTicks;
			}
			ll = ll->pxNextTask;
        }
    }
	return NULL;
}

void vStartTask(task_ctrl_t* task)
{
	__asm volatile(
		"ldr r1,[r0]\n\t"
        "msr psp,r1\n\t"
		"mrs r2,control\n\t"
		"orr r2,r2,#2\n\t"
		"msr control,r2\n"//当前处于线程模式,设置为0b11后开启非特权模式,不能修改特殊寄存器
		"ldmia sp!,{r4-r11}\n\t"//如果使用SP的话,需要先把control 设置为0x2,
		//"ldmia r1!,{r2-r11}\n\t"    
		//"isb\n\t"
		//"mov lr,r3\n\t"
		//"msr psp,r1\n\t"//设置堆栈指针须在设置control寄存器之前,0x3会开启非特权访问不能设置特殊寄存器
		//"msr control,r2\n\t"
        "ldmia sp!,{r0-r3,r12,lr}\n\t"
        "ldmia sp!,{r1,r2}\n\t"//pc xpsr
		"msr xpsr,r2\n\t"
        "cpsie i\n\t"
		"mov r2,#3\n\t"
		"msr control,r2\n\t"//非特权模式
		"isb\n\t"
		"bx r1\n\t"
		:"+r" (task)//输入参数
	);
}


