//
//  main.m
//  NSThread取消线程
//
//  Created by chen cheng on 14-9-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFThread.h"

@interface A : NSObject


- (void)thread_main:(id)arg;

- (void)thread_main2:(id)arg;

@end


@implementation A

- (void)thread_main:(id)arg
{
    int i = 0;
    while (! [[NSThread currentThread] isCancelled] )
    {
        NSLog(@"i = %d", i++);
        sleep(1);
    }
}

- (void)thread_main2:(id)arg
{
    int i = 0;
    while (1)
    {
        NSLog(@"i = %d", i++);
        sleep(1);
    }
}

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        A   *aObj = [[A alloc] init];
        
        NSThread   *thread = [[NSThread alloc] initWithTarget:aObj selector:@selector(thread_main:) object:nil];
        
        
        [thread start];
        
        
        getchar();
        
        //逻辑含义是取消一个线程、但本质上该函数仅仅让[thread isCancelled]返回值为真。
        [thread cancel];
        
        NSLog(@"[thread cancel] end");
        
        getchar();
        
        
       /* A   *aObj2 = [[A alloc] init];
        
        QFThread  *qfthread = [[QFThread alloc] initWithTarget:aObj2 action:@selector(thread_main2:) arg:nil];
        
        [aObj2 release];
        
        [qfthread start];
        
        
        getchar();
        
        [qfthread cancel];
        
        NSLog(@"[qfthread cancel] end");
        
        getchar();
        
        [qfthread release];*/
        
        
    }
    return 0;
}

