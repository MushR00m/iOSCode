//
//  main.m
//  操作队列的暂停
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
    NSLog(@"MyOperation1 = %@",[NSThread currentThread]);

    int i = 0;
    while (i < 5)
    {
        NSLog(@"MyOperation1 i = %d", i++);
        sleep(1);
    }
}

@end



@interface MyOperation2 : NSOperation

@end


@implementation MyOperation2

- (void)main
{
    NSLog(@"MyOperation2 = %@",[NSThread currentThread]);

    int i = 0;
    while (i < 5)
    {
        NSLog(@"MyOperation2 i = %d", i++);
        sleep(1);
    }
}

@end



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"main = %@",[NSThread currentThread]);
        MyOperation1  *op1 = [[MyOperation1 alloc] init];
        MyOperation2  *op2 = [[MyOperation2 alloc] init];
        
        
        NSOperationQueue   *operationQueue = [[NSOperationQueue alloc] init];
        
        [op2 addDependency:op1];
        
        [operationQueue addOperation:op1];
        [operationQueue addOperation:op2];
        
        
        
        getchar();
        
        //让操作队列暂停、操作队列会暂停执行下一个操作、正在执行操作不受影响
        [operationQueue setSuspended:YES];
        
        NSLog(@"[operationQueue setSuspended:YES]");
        
        
        getchar();
        
       
        [operationQueue setSuspended:NO];

        NSLog(@"[operationQueue setSuspended:NO]");
        
        
        
        [op1 release];
        [op2 release];
        
        [operationQueue release];
        
        
        getchar();
        
        
    }
    return 0;
}

