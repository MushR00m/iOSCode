//
//  QFThread.m
//  QFThread
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFThread.h"
#import <pthread.h>

#import <signal.h>

@interface QFThread()

@property(retain, readonly, nonatomic)id target;
@property(assign, readonly, nonatomic)SEL action;
@property(retain, readonly, nonatomic)id arg;

@end


void thread_exit(int sig)
{
    if (SIGUSR1 == sig)
    {
        pthread_exit(NULL);
    }
}

void *thread_main(void *arg)
{
    pthread_detach(pthread_self());
    
    signal(SIGUSR1, thread_exit);
    
    QFThread *threadObj = (QFThread *)arg;
    
    [threadObj.target performSelector:threadObj.action withObject:threadObj.arg];
    
    [threadObj release];
    
    return NULL;
}


@implementation QFThread

+ (void)startdDetachThreadWithTarget:(id)target action:(SEL)action arg:(id)arg
{
    QFThread *thread = [[QFThread alloc] initWithTarget:target action:action arg:arg];
    
    [thread start];
    
    [thread release];
}

- (void)dealloc
{
    [_target release];
    _target = nil;
    
    [_arg release];
    _arg = nil;
    
    [super dealloc];
}

- (id)initWithTarget:(id)target action:(SEL)action arg:(id)arg
{
    self = [super init];
    if (self != nil)
    {
        _target = [target retain];
        _action = action;
        _arg = [arg retain];
    }
    return self;
}

- (void)start
{
    [self retain];
    pthread_create(&_tid, NULL, thread_main, self);
}


- (void)cancel//这里实现真正的异步结束一个线程
{
    pthread_kill(_tid, SIGUSR1);
}

@end
