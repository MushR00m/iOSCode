//
//  CC_Thread.m
//  P2P
//
//  Created by chen cheng on 14-07-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CC_Thread.h"



static void thread_exit(int sig)
{
    if (sig == SIGUSR2)
    {
        pthread_exit(NULL);
    }
}

static void *pthread_main(void *arg)
{
    CC_Thread *thread = (CC_Thread *)arg;
    
    signal(SIGUSR2, thread_exit);
    
    @autoreleasepool
    {
        [thread.target performSelector:thread.main_selector];
    }
        
    pthread_exit(NULL);
}

@implementation CC_Thread

@synthesize tid = _tid;
@synthesize target = _target;
@synthesize main_selector = _main_selector;

- (id)init
{
    self = [super init];
    if (self != nil)
    {
    }
    
    return self;
}


- (int)start
{
    int ret = 0;
    
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    
    ret = pthread_create(&_tid, &attr, pthread_main, self);
    if (ret != 0)
    {
       // perror("pthread_create err");
    }
    
    pthread_attr_destroy(&attr);
    
    return ret;
}

- (int)cancel
{
    int ret = 0;
    while (self.isExists)
    {
        ret = pthread_kill(_tid, SIGUSR2);
        if (ret != 0)
        {
            perror("pthread_kill err");
        }
    }

    return ret;
}

- (BOOL)isExists
{
    int ret = pthread_kill(_tid, 0);
    
    return (ret == 0);
}

- (void)dealloc
{
    [super dealloc];
}

@end
