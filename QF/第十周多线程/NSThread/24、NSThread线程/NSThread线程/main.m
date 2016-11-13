//
//  main.m
//  NSThread线程
//
//  Created by chen cheng on 14-9-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>


@interface A : NSObject
{
    
}

- (void)thread_main:(id)arg;

@end

@implementation A

- (void)thread_main:(id)arg
{
    NSLog(@"thread_main [NSThread currentThread] = %@", [NSThread currentThread]);
    int i = 0;
    while (1)
    {
        NSLog(@"thread_main i = %d", i++);
        sleep(1);
    }
}

@end



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"main [NSThread mainThread] = %@", [NSThread mainThread]);
        
        
        //创建线程的方法一：
      /*  A  *aobj = [[A alloc] init];
       
        NSLog(@"1 [aobj retainCount] = %lu", [aobj retainCount]);
        
        //函数detachNewThreadSelector类似于pthread_create
       
        [NSThread detachNewThreadSelector:@selector(thread_main:) toTarget:aobj withObject:nil];
       
        NSLog(@"2 [aobj retainCount] = %lu", [aobj retainCount]);
        
        [aobj release];*/
        
        
        A  *aObj2 = [[A alloc] init];
        
        
        NSLog(@"1 [aObj2 retainCount] = %lu", [aObj2 retainCount]);
        
        //这里仅仅创建类NSThread的对象、但没有创建线程
        NSThread   *threadObj = [[NSThread alloc] initWithTarget:aObj2 selector:@selector(thread_main:) object:nil];
        
        
        NSLog(@"2 [aObj2 retainCount] = %lu", [aObj2 retainCount]);
        
        NSLog(@"1 [threadObj retainCount] = %lu", [threadObj retainCount]);
        
        
        //这里的逻辑含义是开始运行线程、但本质上、这里相当于调用函数pthread_create、所以此处只是创建一个新的线程、但并不代表线程已经获得时间片并开始运行。
        [threadObj start];
        
        NSLog(@"3 [aObj2 retainCount] = %lu", [aObj2 retainCount]);
        
        NSLog(@"2 [threadObj retainCount] = %lu", [threadObj retainCount]);


        [aObj2 release];
        
        [threadObj release];
        
        
        
        int i = 0;
        while (1)
        {
            NSLog(@"main i = %d", i++);
            sleep(1);
        }
        
    }
    return 0;
}

