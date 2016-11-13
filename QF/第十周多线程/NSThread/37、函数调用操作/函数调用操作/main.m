//
//  main.m
//  函数调用操作
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface A : NSObject

- (void)fun;

@end


@implementation A

- (void)fun
{
    int i = 0;
    while (i < 5)
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
        A  *aObj = [[A alloc] init];
        
        //定义一个函数调用的操作对象
        NSInvocationOperation  *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:aObj selector:@selector(fun) object:nil];
    
        
        
        NSOperationQueue  *operationQueue = [[NSOperationQueue alloc] init];
        
        [operationQueue addOperation:invocationOperation];
        
        
        [invocationOperation release];
        [operationQueue release];
        
        getchar();
        
        
    }
    return 0;
}

