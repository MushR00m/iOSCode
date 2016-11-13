//
//  QFCond.m
//  QFCond
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFCond.h"

@implementation QFCond

- (void)dealloc
{
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_cond);
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        int ret = pthread_mutex_init(&_mutex, NULL);
        if (ret != 0)
        {
            [super dealloc];
            return nil;
        }
        
        ret = pthread_cond_init(&_cond, NULL);
        if (ret != 0)
        {
            pthread_mutex_destroy(&_mutex);
            [super dealloc];
            return nil;
        }

    }
    return self;
}

- (void)lock
{
    pthread_mutex_lock(&_mutex);
}
- (void)unlock
{
    pthread_mutex_unlock(&_mutex);
}

- (void)signal
{
    pthread_cond_signal(&_cond);
}

- (void)broadcast
{
    pthread_cond_broadcast(&_cond);
}

- (void)wait
{
    pthread_cond_wait(&_cond, &_mutex);
}


@end
