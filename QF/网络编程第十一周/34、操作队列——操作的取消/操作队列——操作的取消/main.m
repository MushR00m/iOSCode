//
//  main.m
//  操作队列——操作的取消
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
    int i = 0;
    while (![self isCancelled])
    {
        NSLog(@"MyOperation i = %d", i++);
        sleep(1);
    }
    
    NSLog(@"操作 end ");
}

@end







int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        NSOperationQueue  *operationQueue = [[NSOperationQueue alloc] init];
        
        MyOperation  *operation = [[MyOperation alloc] init];
    
        
        [operationQueue addOperation:operation];
        
        
        getchar();
        [operation cancel];
        
        NSLog(@"[operation cancel] end");
        
        getchar();
        
        [operation release];
        
        [operationQueue release];
        
        getchar();
        
    }
    return 0;
}

