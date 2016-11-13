//
//  QFCond.h
//  QFCond
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

@interface QFCond : NSObject
{
    pthread_mutex_t _mutex;
    pthread_cond_t _cond;
}

- (void)lock;
- (void)unlock;

- (void)signal;
- (void)broadcast;

- (void)wait;

@end
