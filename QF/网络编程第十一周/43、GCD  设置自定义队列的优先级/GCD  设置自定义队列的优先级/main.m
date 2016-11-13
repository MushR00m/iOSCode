//
//  main.m
//  GCD  设置自定义队列的优先级
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        dispatch_queue_t myqueue =  dispatch_queue_create("com.qianfeng.xxx", DISPATCH_QUEUE_SERIAL);
        
        //设置队列的属性、把第一个队列的属性设置成第二队列的属性（这里设置优先级为最高级）

        dispatch_set_target_queue(myqueue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0));
        
        dispatch_async(myqueue, ^{
            
            NSLog(@"该任务具有最高优先级");
            
        });
        
        getchar();
        
        
        dispatch_release(myqueue);
    }
    return 0;
}

