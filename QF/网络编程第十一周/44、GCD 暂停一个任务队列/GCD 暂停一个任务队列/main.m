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
        
        dispatch_async(myqueue, ^{
            
            int i = 0;
            while (i < 5)
            {
                NSLog(@"1 i = %d", i++);
                sleep(1);
            }
            
        });
        
        
        dispatch_async(myqueue, ^{
            
            int i = 0;
            while (i < 5)
            {
                NSLog(@"2 i = %d", i++);
                sleep(1);
            }
            
        });
        
        getchar();
        dispatch_suspend(myqueue);//结束代码块;
       
        NSLog(@"dispatch_suspend end");
        
        getchar();
        dispatch_resume(myqueue);//恢复
        NSLog(@"dispatch_resume end");
        
        
        getchar();
        
        dispatch_release(myqueue);
        
    }
    return 0;
}

