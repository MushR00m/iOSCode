//
//  main.m
//  NSThread线程的异步通信
//
//  Created by chen cheng on 14-9-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  线程的异步通信——异步的让主线程执行aSelector所代表的函数
 *
 *  @param aSelector 选择器
 *  @param arg       传给函数aSelector的实参
 *  @param wait      为真：等待主线程执行完函数aSelector后才返回、否则的话立刻返回
 */
//- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;



/**
 *  线程的异步通信——异步的让线程thread执行aSelector所代表的函数
 *
 *  @param aSelector 函数选择器
 *  @param thread    接受异步通信的线程
 *  @param arg       函数aSelector的实参
 *  @param wait      为真：等待线程thread执行完函数aSelector后才返回、否则的话立刻返回
 */
//- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thread withObject:(id)arg waitUntilDone:(BOOL)wait;



@interface A : NSObject
{
    float _prog;
}

- (void)thread_main:(id)arg;

@end

@implementation A

- (void)thread_main:(id)arg
{
    NSLog(@"thread_main [NSThread currentThread] = %@", [NSThread currentThread]);
    
    int i=0;
    while (i<10)
    {
        i++;
        
        _prog = i / 10.0;
        
        sleep(1);
        
        NSLog(@"i = %d", i);
        
        [self performSelectorOnMainThread:@selector(print) withObject:nil waitUntilDone:NO];
    }
}

- (void)print
{
    NSLog(@"print [NSThread currentThread] = %@", [NSThread currentThread]);
    
    NSLog(@"_prog = %d%%", (int)(_prog * 100));
}


@end


@interface B : NSObject
{
    
}

- (void)thread_main:(id)arg;

- (void)writeFile;

@end


@implementation B

- (void)thread_main:(id)arg
{
    NSLog(@"B :: thread_main [NSThread currentThread] = %@", [NSThread currentThread]);
    while (1)
    {
        [[NSRunLoop currentRunLoop] run];
    }
}

- (void)writeFile
{
    NSLog(@"正在写文件 [NSThread currentThread] = %@", [NSThread currentThread]);
}

@end



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"[NSThread mainThread] = %@", [NSThread mainThread]);
        
      /* A   *aobj = [[A alloc] init];
        
        [NSThread detachNewThreadSelector:@selector(thread_main:) toTarget:aobj withObject:nil];
        
        
        
        [[NSRunLoop currentRunLoop] run];//如果一个线程需要结束消息、必须要有消息循环（线程的异步通信只是众多消息中得一种）。*/
        
        
        
        
        B   *bObj = [[B alloc] init];
        
        
        NSThread  *thread = [[NSThread alloc] initWithTarget:bObj selector:@selector(thread_main:) object:nil];
        
        [thread start];
        
        [bObj performSelector:@selector(writeFile) onThread:thread withObject:nil waitUntilDone:NO];
        
        getchar();
    
    }
    return 0;
}

