//
//  main.m
//  线程间的异步通信
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>


pthread_mutex_t mutex;
int data = 0;

void *thread1_main(void *arg)
{
    pthread_t tid2 = *((pthread_t *)arg);
    
    free(arg);
    
    
    NSLog(@"thread1_main [NSThread currentThread] = %@", [NSThread currentThread]);
    
    while (1)
    {
        pthread_mutex_lock(&mutex);
        data = data + 1;
        data = data % 100;
        pthread_mutex_unlock(&mutex);
        
        sleep(1);
        
        pthread_kill(tid2, SIGUSR1);
    }
}


void *thread2_main(void *arg)
{
    NSLog(@"thread2_main [NSThread currentThread] = %@", [NSThread currentThread]);
    
    int i = 0;
    while (1)
    {
        printf("线程2自己正常的处理行为 i = %d\n", i++);
        sleep(1);
    }
}

void printData(int sig)//该函数是在线程2里面执行的
{
    NSLog(@"printData [NSThread currentThread] = %@", [NSThread currentThread]);
    
    pthread_mutex_lock(&mutex);
    printf("线程2消费数据 data = %d\n", data);
    pthread_mutex_unlock(&mutex);
}


int main(int argc, const char * argv[])
{
    pthread_t tid2;
    
    
    pthread_mutex_init(&mutex, NULL);
    
    
    if (signal(SIGUSR1, printData) == SIG_ERR)
    {
        perror("signal err");
        pthread_mutex_destroy(&mutex);
        return 0;
    }
    
    
    int ret = pthread_create(&tid2, NULL, thread2_main, NULL);
    if (ret != 0)
    {
        perror("pthread_create err");
        pthread_mutex_destroy(&mutex);
        return 0;
    }
    
    
    pthread_t tid1;
    pthread_t *pTid = malloc(sizeof(pthread_t));
    *pTid = tid2;
    ret = pthread_create(&tid1, NULL, thread1_main, pTid);
    if (ret != 0)
    {
        perror("pthread_create err");
        pthread_mutex_destroy(&mutex);
        return 0;
    }

    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    
    pthread_mutex_destroy(&mutex);
    
    return 0;
}

