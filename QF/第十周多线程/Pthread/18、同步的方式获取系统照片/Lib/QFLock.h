//
//  QFLock.h
//  QFLock
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

@interface QFLock : NSObject
{
    pthread_mutex_t  _mutex;
}

- (void)lock;

- (void)unlock;

@end
