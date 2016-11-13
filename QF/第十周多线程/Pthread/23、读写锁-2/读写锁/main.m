//
//  main.m
//  读写锁
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

/**
 *  有可能导致写线程处于严重饥饿状态
 */
@interface RWLock : NSObject
{
    pthread_mutex_t _rmutex;
    pthread_mutex_t _wmutex;
    
    int _numberOfReader;
}

- (void)rlock;
- (void)wlock;

- (void)unrlock;

- (void)unwlock;

@end

@implementation RWLock


- (void)dealloc
{
    pthread_mutex_destroy(&_rmutex);
    pthread_mutex_destroy(&_wmutex);
    
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        int ret = pthread_mutex_init(&_rmutex, NULL);
        if (ret != 0)
        {
            [super dealloc];
            return nil;
        }
        
        ret = pthread_mutex_init(&_wmutex, NULL);
        if (ret != 0)
        {
            pthread_mutex_destroy(&_rmutex);
            [super dealloc];
            return nil;
        }

        _numberOfReader = 0;
    }
    
    return self;
}

- (void)rlock
{
    pthread_mutex_lock(&_rmutex);
    if (_numberOfReader == 0)
    {
        pthread_mutex_lock(&_wmutex);
    }
    _numberOfReader++;
    pthread_mutex_unlock(&_rmutex);
}
- (void)wlock
{
    pthread_mutex_lock(&_wmutex);
}
- (void)unrlock
{
    pthread_mutex_lock(&_rmutex);
    _numberOfReader--;
    if (_numberOfReader == 0)
    {
        pthread_mutex_unlock(&_wmutex);
    }
    pthread_mutex_unlock(&_rmutex);
}

- (void)unwlock
{
    pthread_mutex_unlock(&_wmutex);
}

@end





//系统提供的读写锁类型为 pthread_rwlock_t


/**
 *  对读写锁进行初始化
 *
 *  @param rwlock 读写锁
 *  @param attr   初始化属性、为NULL表示按系统默认属性初始化
 *
 *  @return 0表示初始化成功否则失败
 */
int pthread_rwlock_init(pthread_rwlock_t *restrict rwlock, const pthread_rwlockattr_t *restrict attr);

/**
 *   销毁一把读写锁
 *
 *  @param rwlock 读写锁
 *
 *  @return 0表示销毁成功否则失败
 */
int pthread_rwlock_destroy(pthread_rwlock_t *rwlock);

/**
 *  进行读上锁 （读的时候不能写、但可以多个线程同时读）
 *
 *  @param rwlock 读写锁
 *
 *  @return 0表示上锁成功否则失败
 */
int pthread_rwlock_rdlock(pthread_rwlock_t *rwlock);

/**
 *  进行写上锁 （写的时候不能读、同时只能有一个线程写、当有线程等待写的时候、不允许新的读者读）
 *
 *  @param rwlock 读写锁
 *
 *  @return 0表示上锁成功否则失败
 */
int pthread_rwlock_wrlock(pthread_rwlock_t *rwlock);

/**
 *  读开锁或写开锁
 *
 *  @param rwlock 读写锁
 *
 *  @return 0表示开锁成功否则失败
 */
int pthread_rwlock_unlock(pthread_rwlock_t *rwlock);

int main(int argc, const char * argv[])
{

    
    return 0;
}

