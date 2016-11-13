//
//  QFLock.m
//  QFLock
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFLock.h"

@implementation QFLock

- (void)dealloc
{
    pthread_mutex_destroy(&_mutex);
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

@end
