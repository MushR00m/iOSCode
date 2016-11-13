//
//  QFThread.m
//  QFThread
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFThread.h"
#import <pthread.h>

@interface QFThread()

@property(retain, readonly, nonatomic)id target;
@property(assign, readonly, nonatomic)SEL action;
@property(retain, readonly, nonatomic)id arg;

@end

void *thread_main(void *arg)
{
    pthread_detach(pthread_self());
    
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
    pthread_t tid;
    pthread_create(&tid, NULL, thread_main, self);
}

@end
