//
//  main.m
//  条件变量
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>


//条件变量的类型
//pthread_cond_t


//int pthread_cond_init(pthread_cond_t *restrict cond, const pthread_condattr_t *restrict attr);

//int pthread_cond_destroy(pthread_cond_t *cond);


/**
 *  让当前线程阻塞在条件变量cond之上，阻塞的同时会对互斥锁mutex进行开锁的操作（阻塞和开锁是原子操作、要么都执行要都不执行）。阻塞到某个线程对条件变量cond发送信号时才有可能返回。返回的同时会对互斥锁mutex进行上锁操作。
 *
 *  @param cond  条件变量
 *  @param mutex 互斥锁
 *
 *  @return 0表示函数调用成功否则失败
 */
//int pthread_cond_wait(pthread_cond_t *restrict cond, pthread_mutex_t *restrict mutex);


/**
 *  给条件变量cond发送一个信号。1、如果发送信号时，没有任何线程阻塞在这个条件变量cond之上（没有任何线程调用函数pthread_cond_wait），该信号将会丢失，这是我们所希望的结果。2、如果发送信号时有大于等于1个线程阻塞在这个条件变量cond之上（有N（N>=1）个线程调用函数pthread_cond_wait）,这个信号会导致其中一个阻塞的线程返回、具体哪一个线程返回是不确定的。
 *
 *  @param cond 条件变量
 *
 *  @return 0表示函数调用成功否则失败
 */
//int pthread_cond_signal(pthread_cond_t *cond);

/**
 *  给条件变量cond广播一个信号。1、如果发送信号时，没有任何线程阻塞在这个条件变量cond之上（没有任何线程调用函数pthread_cond_wait），该信号将会丢失，这是我们所希望的结果。2、如果广播信号时有大于等于1个线程阻塞在这个条件变量cond之上（有N（N>=1）个线程调用函数pthread_cond_wait）,这个广播信号会导致所有阻塞的线程返回返回的顺序是不确定。
 *
 *  @param cond 条件变量
 *
 *  @return 0表示函数调用成功否则失败
 */
//int pthread_cond_ (pthread_cond_t *cond);




pthread_mutex_t mutex;

pthread_cond_t cond;
int data = 0;
BOOL readFlag = NO;//  为真表示可读（说明数据已经准备好）

void *thread1_main(void *arg)
{
    pthread_mutex_lock(&mutex);
    
    data = data + 1;
    
    data = data % 100;
    
    readFlag = YES;
    
    
    //先发信号后开锁
    pthread_cond_signal(&cond);

    pthread_mutex_unlock(&mutex);
    
    return NULL;
}

void *thread2_main(void *arg)
{

    pthread_mutex_lock(&mutex);
    
    
    while (!readFlag)
    {
        //从阻塞处返回时应再次检查条件是否真的成立
        pthread_cond_wait(&cond, &mutex);
    }
    
    printf("data = %d\n", data);
    
    readFlag = NO;
    
    pthread_mutex_unlock(&mutex);
    
    return NULL;
}





int main(int argc, const char * argv[])
{
    pthread_t tid[2];
        
    pthread_mutex_init(&mutex, NULL);
    
    pthread_cond_init(&cond, NULL);
    
    int ret = pthread_create(&tid[0], NULL, thread1_main, NULL);
    if (ret != 0)
    {
        perror("pthread_create err");
    }
    
     ret = pthread_create(&tid[1], NULL, thread2_main, NULL);
    if (ret != 0)
    {
        perror("pthread_create err");
    }

    
    for (int i = 0; i<2; i++)
    {
        pthread_join(tid[i] , NULL);
    }
    
    
    
    
    
    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&cond);
        
        
        
        
        
        
    
    return 0;
}

