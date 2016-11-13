//
//  main.m
//  NSthread线程同步——条件变量
//
//  Created by chen cheng on 14-9-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface A : NSObject
{
    NSCondition  *_condition;
    int      _data;
    BOOL     _flag;//为真表示数据已经产生
    
}

@end

@implementation A

- (void)dealloc
{
    [_condition release];
    _condition = nil;

    
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _condition = [[NSCondition alloc] init];
        
        _data = 0;
        
        _flag = NO;
    }
    
    return self;
}

- (void)thread1_main:(id)arg
{
    sleep(3);
    
    [_condition lock];
    
    _data = _data + 1;
    _data = _data % 100;
    
    
    _flag = YES;
    
    [_condition signal];//广播信号用函数[_condition broadcast];
    
    [_condition unlock];
    
}

- (void)thread2_main:(id)arg
{
    [_condition lock];
    
    while (!_flag)
    {
        [_condition wait];
    }
    
    NSLog(@"_data = %d", _data);
    
    _flag = NO;
    
    [_condition unlock];
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


