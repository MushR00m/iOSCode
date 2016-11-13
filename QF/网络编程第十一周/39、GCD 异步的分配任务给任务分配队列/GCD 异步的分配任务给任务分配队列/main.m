//
//  main.m
//  GCD 异步的分配任务给任务分配队列
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  向任务分配队列异步的分配一个任务块
 *
 *  @param queue 任务分配队列
 *  @param block 任务的代码块
 */
void dispatch_async(dispatch_queue_t queue, dispatch_block_t block);

/**
 *  向任务分配队列同步的分配一个任务块
 *
 *  @param queue 任务分配队列
 *  @param block 任务的代码块
 */
void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);


//队列分两种 1、串行队列：凡是向串行队列上分配的任务、任务会按分配的现后顺序串行执行。2、并行队列：凡是向并行队列上异步分配的任务、一般情况下任务会在各自不同的线程中并发执行、如果是同步分配、会有相应的优化措施。
//有两个系统已经提前创建号的队列：1、全局队列(它是一个并行队列) 2、主队列(它是一个串行队列)、主线程中任务是被分配到主队列上面的。

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"[NSThread mainThread] = %@", [NSThread mainThread]);
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSLog(@"dispatch_get_global_queue1 [NSThread currentThread] = %@",[NSThread currentThread]);
            int i = 0;
            while (1)
            {
                NSLog(@"dispatch_get_global_queue1 i = %d", i++);
                sleep(1);
            }

        });
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSLog(@"dispatch_get_global_queue [NSThread currentThread] = %@",[NSThread currentThread]);
            int i = 0;
            while (1)
            {
                NSLog(@"dispatch_get_global_queue2 i = %d", i++);
                sleep(1);
            }

            
        });
        
        int i = 0;
        while (1)
        {
            NSLog(@"main i = %d", i++);
            sleep(1);
        }

        
        
    }
    return 0;
}

