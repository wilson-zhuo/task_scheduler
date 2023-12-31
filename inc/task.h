#ifndef _TASK_H
#define _TASK_H
#include <stdint.h>
#define cfg_TASK_PRIO 32
typedef void (*task_func_t)(void* pvParam);
typedef uint32_t task_id_t;
typedef enum task_state{
    ACTIVE,
    READY,
    SUSPEND,
    BLOCKED,
    DELETE
}task_state_t;
typedef struct task_ctrl{
    volatile uint32_t* pulStack;
    char scTaskName[8];
    task_func_t func;
    uint32_t ulDelayTicks;//延迟阻塞时间片
    uint32_t ulTicks;//任务时间片
    uint32_t ulTickReload;//任务时间片
    task_state_t xTaskState;
    uint32_t ulTaskSuspendFlag;//任务阻塞事件标志
    uint32_t ulTaskPrio;//任务优先级
    uint32_t ulTaskStackSize;//任务优先级
    struct task_ctrl* pxNextTask;
}task_ctrl_t;
/*
extern task_ctrl_t* pxTaskActiveList;///< 对于只有一个处理核心的mcu,Active状态的任务只有一个
extern task_ctrl_t* pxTaskSuspendList;///< 挂起任务链表
extern task_ctrl_t* pxTaskBlockedList;///< 阻塞任务链表
extern task_ctrl_t* pxTaskReadyList;///< 就绪任务链表
*/
/**
 * @brief create a task
*/
task_id_t xTaskCreate(void* param,uint32_t* pulstack,uint32_t ulStackSizeWords,\
		char* task_name,task_func_t func,uint32_t ulTicks,uint32_t ulTaskPrio);
/**
 * @brief suspend a task
*/
void vTaskSuspend(task_id_t xId);
/**
 * @brief resume a task
*/
void vTaskResume(task_id_t xId);
/**l
 * @brief del a task from list
*/
void vTaskDelete(task_id_t xId);
/**
 * @brief delay for while
*/
void vTaskDelay(uint32_t ulTime);

void vStartTask(task_ctrl_t* task);
/**
 * @brief delay for while
*/
void vGetHighestPrioReadyTask(void);
task_ctrl_t* TaskManager(void);
#endif
