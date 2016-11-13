//
//  CC_Thread.h
//  P2P
//
//  Created by chen cheng on 14-07-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>


@interface CC_Thread : NSObject
{
    NSAutoreleasePool *_pool;
    
    pthread_t   _tid;
    id          _target;
    SEL         _main_selector;
}
@property(readonly, nonatomic) pthread_t tid;
@property(assign, nonatomic) id target;
@property(assign, nonatomic) SEL main_selector;

- (int)start;
- (int)cancel;
- (BOOL)isExists;//是否存在

@end
