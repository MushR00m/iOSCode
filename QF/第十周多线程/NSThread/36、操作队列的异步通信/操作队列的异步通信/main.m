//
//  main.m
//  操作队列的异步通信
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyOperation1 : NSOperation

@end


@implementation MyOperation1

- (void)main
{
    NSLog(@"MyOperation1 [NSThread currentThread] = %@", [NSThread currentThread]);
    
    int i = 0;
    while (i < 5)
    {
        NSLog(@"MyOperation1 i = %d", i++);
    }
}

@end

@interface MyOperation2 : NSOperation

@end

@implementation MyOperation2

- (void)main
{
    NSLog(@"MyOperation2 [NSThread currentThread] = %@", [NSThread currentThread]);
    int i = 0;
    while (i < 5)
    {
        NSLog(@"MyOperation2 i = %d", i++);
    }
    
    MyOperation1  *op1 = [[MyOperation1 alloc] init];
    
    //把操作扔进主操作队列 实际上就是异步通信主线程执行操作
    [[NSOperationQueue mainQueue] addOperation:op1];
    
    [op1 release];
}

@end





int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        
        NSLog(@"[NSThread mainThread] = %@", [NSThread mainThread]);
        
        MyOperation2   *op2 = [[MyOperation2 alloc] init];
        
        NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
        
        [operationQueue addOperation:op2];
        
        
        [op2 release];
        
        [operationQueue release];
        
        while (1)
        {
            [[NSRunLoop currentRunLoop] run];
        }
        
    }
    return 0;
}

