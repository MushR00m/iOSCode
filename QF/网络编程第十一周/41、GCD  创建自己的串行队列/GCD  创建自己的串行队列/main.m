//
//  main.m
//  GCD  创建自己的串行队列
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"[NSThread mainThread] = %@", [NSThread mainThread]);
        
        //创建一个串行队列
        dispatch_queue_t myqueue = dispatch_queue_create("com.qianfeng.xxx", DISPATCH_QUEUE_SERIAL);
        
        
        dispatch_async(myqueue, ^{
            
            NSLog(@"1 [NSThread currentThread] = %@", [NSThread currentThread]);
            
            int i = 0;
            while (i < 3)
            {
                NSLog(@"myqueue 1 i = %d", i++);
                
                sleep(1);
            }
        });
        
        NSLog(@"第一任务分配完毕");
        
        dispatch_async(myqueue, ^{
            
             NSLog(@"2 [NSThread currentThread] = %@", [NSThread currentThread]);
            
            int i = 0;
            while (i < 3)
            {
                NSLog(@"myqueue 2 i = %d", i++);
            }
        });

        
        NSLog(@"第二个任务分配完毕");
        
        getchar();
        
        
        dispatch_release(myqueue);
    }
    return 0;
}

