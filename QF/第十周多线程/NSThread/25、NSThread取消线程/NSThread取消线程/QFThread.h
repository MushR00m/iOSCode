//
//  QFThread.h
//  QFThread
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFThread : NSObject
{
    id  _target;
    SEL _action;
    id  _arg;
    
    pthread_t  _tid;
}

+ (void)startdDetachThreadWithTarget:(id)target action:(SEL)action arg:(id)arg;

- (id)initWithTarget:(id)target action:(SEL)action arg:(id)arg;

- (void)start;

- (void)cancel;//这里实现真正的异步结束一个线程

@end
