//
//  main.m
//  线程同步——互斥锁
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

/**
 *  对互斥锁进行初始化、（初始化过程会涉及到资源的分配、所以不再使用互斥锁的时候需要进行销毁pthread_mutex_destroy）.互斥锁的初始状态为未锁定状态
 *
 *  @param mutex 即将要初始化的互斥锁
 *  @param attr  使用什么属性来对互斥锁进行初始化、如果传NULL表示按系统默认属性进行初始化
 *
 *  @return 0表示初始化成功否则失败
 */
//int pthread_mutex_init(pthread_mutex_t *restrict mutex, const pthread_mutexattr_t *restrict attr);


/**
 *  对互斥锁进行上锁操作。1、如果互斥锁的当前状态本身是未锁定状态、该操作不会阻塞立即返回、并且把互斥锁的当前状态设定为锁定状态。2、如果互斥锁的当前状态本身是锁定状态、该操作会阻塞、直到别的线程把互斥锁打开之后该操作才有可能返回、返回的同时再次将互斥锁的当前状态设定为锁定状态。
 *
 *  @param mutex 互斥锁
 *
 *  @return 0表示初始化成功否则失败
 */
//int pthread_mutex_lock(pthread_mutex_t *mutex);


/**
 *  对互斥锁进行开锁。该函数永远不会阻塞.1、如果互斥锁的当前状态本身是锁定状态、该操作成功将互斥锁的当前状态设定为未锁定状态。2、如果互斥锁的当前状态本身是未锁定状态、该操作的行为是不确定的、所以应该禁止对一把已经打开的互斥锁执行开锁操作。
 *
 *  @param mutex 互斥锁
 *
 *  @return 0表示初始化成功否则失败
 */
//int pthread_mutex_unlock(pthread_mutex_t *mutex);


/**
 *  对互斥锁进行销毁，销毁操作会涉及到资源释放、所以已经初始化（pthread_mutex_init）的互斥锁必须要销毁、不然会有资源泄露。
 *
 *  @param mutex 互斥锁
 *
 *  @return 0表示初始化成功否则失败
 */
//int pthread_mutex_destroy(pthread_mutex_t *mutex);


//定义一把互斥锁
pthread_mutex_t mutex;
int i = 0;

void *thread_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex);
        i = i + 1;
        i = i % 70;
        pthread_mutex_unlock(&mutex);
    }
}

int main(int argc, const char * argv[])
{
    pthread_t tid;
    
    pthread_mutex_init(&mutex, NULL);
    
    
    int ret = pthread_create(&tid, NULL, thread_main, NULL);
    if (ret != 0)
    {
        NSLog(@"pthread_create err");
        return 0;
    }
    
    getchar();
    
    pthread_mutex_lock(&mutex);
    NSLog(@"i = %d", i);
    pthread_mutex_unlock(&mutex);
    
    
    pthread_mutex_destroy(&mutex);
    
    return 0;
}

