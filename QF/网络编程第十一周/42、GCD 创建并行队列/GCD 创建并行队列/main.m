//
//  main.m
//  GCD 创建并行队列
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
        
        //创建一个并行队列
      
        dispatch_queue_t myqueue = dispatch_queue_create("com.qianfeng.xxx", DISPATCH_QUEUE_CONCURRENT);
       
        dispatch_async(myqueue, ^{
            
            NSLog(@"1 [NSThread currentThread] = %@", [NSThread currentThread]);
            
            int i = 0;
            while (i < 3)
            {
                NSLog(@"1 i = %d", i++);
                sleep(1);
            }
        });
        
        
        dispatch_async(myqueue, ^{
            
            NSLog(@"2 [NSThread currentThread] = %@", [NSThread currentThread]);
            
            int i = 0;
            while (i < 3)
            {
                NSLog(@"2 i = %d", i++);
                sleep(1);
            }
        });

        
        
        getchar();
        
        dispatch_release(myqueue);
    }
    return 0;
}

