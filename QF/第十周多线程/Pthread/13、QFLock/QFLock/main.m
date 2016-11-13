//
//  main.m
//  QFLock
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import "QFLock.h"
#import "QFThread.h"


//定义一把互斥锁
QFLock  *lock1;
QFLock  *lock2;
int data = 0;

@interface A : NSObject

@end

@implementation A

- (void)data
{
    while (1)
    {
        [lock1 lock];
        data = data + 1;
        data = data % 100;
        [lock2 unlock];
        
    }
}


@end

@interface B : NSObject

@end

@implementation B

- (void)printData
{
    while (1)
    {
        [lock2 lock];
        printf("data = %d\n", data);
        [lock1 unlock];
        sleep(1);
        
    }
}

@end

int main(int argc, const char * argv[])
{
    lock1 = [[QFLock alloc] init];
    lock2 = [[QFLock alloc] init];
    
    [lock2 lock];
    
    A *aObj = [[A alloc] init];
    B *bObj = [[B alloc] init];
    
    [QFThread startdDetachThreadWithTarget:aObj action:@selector(data) arg:NULL];
    
    [QFThread startdDetachThreadWithTarget:bObj action:@selector(printData) arg:NULL];
    
    getchar();
    
    
    [lock1 release];
    [lock2 release];
    
    [aObj release];
    [bObj release];
    
    
    return 0;
}
