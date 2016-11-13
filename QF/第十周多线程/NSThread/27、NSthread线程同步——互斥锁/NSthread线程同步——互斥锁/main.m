//
//  main.m
//  NSthread线程同步——互斥锁
//
//  Created by chen cheng on 14-9-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface A : NSObject
{
    NSLock   *_lock1;
    NSLock   *_lock2;
    int      _data;
}

@end

@implementation A

- (void)dealloc
{
    [_lock1 release];
    _lock1 = nil;
    
    [_lock2 release];
    _lock2 = nil;

    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _lock1 = [[NSLock alloc] init];
        _lock2 = [[NSLock alloc] init];
        
        _data = 0;
    }
    
    return self;
}

- (void)thread1_main:(id)arg
{
    while (1)
    {
        [_lock1 lock];
        _data = _data + 1;
        _data = _data % 100;
        [_lock2 unlock];
        sleep(1);
    }
}

- (void)thread2_main:(id)arg
{
    while (1)
    {
        [_lock2 lock];
        
        NSLog(@"_data = %d", _data);
        
        [_lock1 unlock];
    }

}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        A    *aObj = [[A alloc] init];
        
        [NSThread detachNewThreadSelector:@selector(thread1_main:) toTarget:aObj withObject:nil];

        [NSThread detachNewThreadSelector:@selector(thread2_main:) toTarget:aObj withObject:nil];
        
        [aObj release];
        
        getchar();
        
    }
    return 0;
}

