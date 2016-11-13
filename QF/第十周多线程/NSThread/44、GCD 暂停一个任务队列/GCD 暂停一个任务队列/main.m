//
//  main.m
//  GCD 暂停一个任务队列
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        
        dispatch_queue_t myqueue = dispatch_queue_create("qianfeng.xxxx", DISPATCH_QUEUE_SERIAL);
         NSLog(@"当前线程😄%@",[NSThread currentThread]);
        dispatch_async(myqueue, ^{
            NSLog(@"当前线程😄%@",[NSThread currentThread]);
            int i = 0;
            while (i < 5)
            {
                NSLog(@"1 i = %d", i++);
                sleep(1);
            }
            
        });
        NSLog(@"1111分配好了");
        
        dispatch_async(myqueue, ^{
            NSLog(@"当前线程🈴%@",[NSThread currentThread]);
            int i = 0;
            while (i < 5)
            {
                NSLog(@"2 i = %d", i++);
                sleep(1);
            }
            
        });
        
        NSLog(@"22222分配好了");
//        getchar();
//        dispatch_suspend(myqueue);
//        NSLog(@"dispatch_suspend end");
//        
//        getchar();
//        dispatch_resume(myqueue);
//        NSLog(@"dispatch_resume end");
//        
//        
        getchar();
//        
//        dispatch_release(myqueue);
        
    }
    return 0;
}

