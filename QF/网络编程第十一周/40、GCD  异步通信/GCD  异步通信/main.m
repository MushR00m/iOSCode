//
//  main.m
//  GCD  异步通信
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        
        NSLog(@"[NSThread mainThread] = %@", [NSThread mainThread]);
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSLog(@"dispatch_get_global_queue [NSThread currentThread] = %@", [NSThread currentThread]);
            
            int i = 0;
            while (i < 10)
            {
                i++;
                sleep(1);
                
                //同步的向主队列分配任务（实现线程间的异步通信）
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                    NSLog(@"dispatch_get_main_queue1 [NSThread currentThread] = %@", [NSThread currentThread]);
                   
                    NSLog(@"1下载进度:%d%%", (int)((i / 10.0) * 100));
                });
                NSLog(@"1下载进度");
                
                //异步的向主队列分配任务（实现线程间的异步通信）
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    NSLog(@"dispatch_get_main_queue2 [NSThread currentThread] = %@", [NSThread currentThread]);
                    
                    NSLog(@"2下载进度:%d%%", (int)((i / 10.0) * 100));
                });
                NSLog(@"2下载进度");

            }
        });
        
        while (1)
        {
            [[NSRunLoop currentRunLoop] run];
        }
    }
    return 0;
}

