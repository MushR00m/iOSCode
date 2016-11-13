//
//  QFRWLockV2.m
//  读写锁
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFRWLockV2.h"
#import <pthread.h>

@implementation QFRWLockV2

- (void)dealloc
{
    pthread_rwlock_destroy(&_rwlock);
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        int ret = pthread_rwlock_init(&_rwlock, NULL);
        if (ret != 0)
        {
            [super dealloc];
            return nil;
        }
    }
    
    return self;
}


- (void)rlock
{
    pthread_rwlock_rdlock(&_rwlock);
}

- (void)wlock
{
    pthread_rwlock_wrlock(&_rwlock);
}

- (void)unlock
{
    pthread_rwlock_unlock(&_rwlock);
}

@end
