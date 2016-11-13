//
//  main.m
//  GCD 同步分配任务到任务分配队列
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
        
        /*dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSLog(@"dispatch_get_global_queue [NSThread currentThread] = %@", [NSThread currentThread]);
            
            int i = 0;
            while (i < 5)
            {
                NSLog(@"dispatch_get_global_queue i = %d", i++);
                sleep(1);
            }
        });*/
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            int i = 0;
            while (i < 5)
            {
                NSLog(@"dispatch_get_global_queue i = %d", i++);
                sleep(1);
            }

            
        });
        
        
        int i = 0;
        while (i < 5)
        {
            NSLog(@"main i = %d", i++);
            sleep(1);
        }

        
    }
    return 0;
}






