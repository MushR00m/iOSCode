//
//  main.m
//  NSThread线程的退出
//
//  Created by chen cheng on 14-9-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

void fun2()
{
    NSLog(@"fun2 1");
    
    
    pthread_exit(NULL);//结束当前线程
    
    NSLog(@"fun2 2");
    
    
}

void fun1()
{
    NSLog(@"fun1 1");
    
    fun2();
    
    NSLog(@"fun1 2");
}


void  *thread_main(void *arg)
{
    NSLog(@"thread_main 1");
    
    fun1();
    
    NSLog(@"thread_main 2");
    
    return NULL;
}



@interface A : NSObject


- (void)thread_main:(id)arg;


- (void)fun1;
- (void)fun2;

@end

@implementation A

- (void)thread_main:(id)arg
{
    NSLog(@"thread_main 1");
    
    [self fun1];
    
    NSLog(@"thread_main 2");
}

- (void)fun1
{
    NSLog(@"fun1 1");
    
    [self fun2];
    
    NSLog(@"fun1 2");
}

- (void)fun2
{
    NSLog(@"fun2 1");

    [NSThread exit];//结束当前线程
    
    NSLog(@"fun2 2");
}

@end



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
       /* pthread_t  tid;
        
        int ret = pthread_create(&tid, NULL, thread_main, NULL);
        if (ret != 0)
        {
            perror("pthread_create err");
            return 0;
        }
        
        getchar();*/
        
        
        A   *aObj = [[A alloc] init];
        
        
        [NSThread detachNewThreadSelector:@selector(thread_main:) toTarget:aObj withObject:nil];
        
        [aObj release];
        
        getchar();
        
        
    }
    return 0;
}

