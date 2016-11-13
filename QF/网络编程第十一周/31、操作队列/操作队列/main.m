//
//  main.m
//  操作队列
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyOperation : NSOperation

@end


@implementation MyOperation

- (void)main
{
       NSLog(@"MyOperation 的输出 ");
}

@end


@interface MyOperation2 : NSOperation

@end


@implementation MyOperation2

- (void)main
{
    NSLog(@"MyOperation2 [NSThread currentThread] = %@", [NSThread currentThread]);
    int i = 0;
    while (1)
    {
        NSLog(@"MyOperation2 i = %d", i);
        sleep(1);
    }
}

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"main [NSThread currentThread] = %@", [NSThread currentThread]);
        
        
      /* MyOperation *myOperation = [[MyOperation alloc] init];
    
        [myOperation start];
        
        [myOperation release];*/
        
        
        
        MyOperation2 *myOperation2 = [[MyOperation2 alloc] init];
        
        NSOperationQueue  *operationQueue = [[NSOperationQueue alloc] init];
        
        //把一个操作扔进一个操作队列里面、该操作就会并发执行
        [operationQueue addOperation:myOperation2];
        
        
        int i = 0;
        while (1)
        {
            NSLog(@"main i = %d", i);
            sleep(1);
        }

        
        
    }
    return 0;
}

