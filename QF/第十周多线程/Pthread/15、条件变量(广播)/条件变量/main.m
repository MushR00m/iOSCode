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
//int pthread_cond_broadcast(pthread_cond_t *cond);



pthread_mutex_t mutex;
pthread_cond_t cond1;
pthread_cond_t cond2;
pthread_cond_t cond3;
int data = 0;
BOOL reader1Flag = NO;//  为NO表示读者1未读取数据
BOOL reader2Flag = NO;//  为NO表示读者2未读取数据

void *thread1_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex);
        
        while (!reader1Flag || !reader2Flag)
        {
            pthread_cond_wait(&cond2, &mutex);
        }
        
        data = data + 1;
        
        data = data % 100;
        
        reader1Flag = NO;
        reader2Flag = NO;
        
        
        //先发信号后开锁
        pthread_cond_broadcast(&cond1);
        
        pthread_mutex_unlock(&mutex);
         sleep(1);

    }
    
    
    return NULL;
}

void *thread2_main(void *arg)
{

    while (1)
    {
        pthread_mutex_lock(&mutex);
        
        while (reader1Flag)
        {
            //从阻塞处返回时应再次检查条件是否真的成立
            pthread_cond_wait(&cond1, &mutex);
        }
        
        printf("线程2 data = %d\n", data);
        
        reader1Flag = YES;
        
        pthread_cond_signal(&cond2);
        
        pthread_mutex_unlock(&mutex);
       

    }
    
    
    return NULL;
}

void *thread3_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex);
        
        while (reader2Flag)
        {
            //从阻塞处返回时应再次检查条件是否真的成立
            pthread_cond_wait(&cond1, &mutex);
        }
        
        printf("线程3 data = %d\n", data);
        
        reader2Flag = YES;
        
    
        pthread_cond_signal(&cond2);
        
        pthread_mutex_unlock(&mutex);
    }
    
    return NULL;
}



int main(int argc, const char * argv[])
{
    pthread_mutex_init(&mutex, NULL);
    pthread_cond_init(&cond1, NULL);
    pthread_cond_init(&cond2, NULL);
    
    
    pthread_t  tid[3];
    
    void *(*thread_fun[])(void *) = {thread1_main, thread2_main, thread3_main};
    
    for (int i=0; i<3; i++)
    {
        int ret = pthread_create(&tid[i], NULL, thread_fun[i], NULL);
        if (ret != 0)
        {
            perror("pthread_create err");
            
            pthread_mutex_destroy(&mutex);
            pthread_cond_destroy(&cond1);
            pthread_cond_destroy(&cond2);
            return 0;
        }

    }
    

    for (int i=0; i<3; i++)
    {
        int ret = pthread_join(tid[i], NULL);
        if (ret != 0)
        {
            perror("pthread_join err");
            
            pthread_mutex_destroy(&mutex);
            pthread_cond_destroy(&cond1);
            pthread_cond_destroy(&cond2);
            return 0;
        }
    }
    
    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&cond1);
    pthread_cond_destroy(&cond2);
    

    return 0;
}

