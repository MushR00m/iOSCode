//
//  QFRWLockV2.h
//  读写锁
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFRWLockV2 : NSObject
{
    pthread_rwlock_t _rwlock;
}

- (void)rlock;

- (void)wlock;

- (void)unlock;

@end
