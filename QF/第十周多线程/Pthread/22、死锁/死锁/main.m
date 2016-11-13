//
//  main.m
//  死锁
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

/*pthread_mutex_t mutex; //用一把锁   线程1和线程2的并发度很低

int g_data1 = 0;
int g_data2 = 0;



void  *thread1_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex);
        g_data1 = (g_data1 + 1) % 100;
        pthread_mutex_unlock(&mutex);
        
    }
    return NULL;
}

void  *thread2_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex);
        g_data2 = g_data2 + 10;
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}


void  *thread3_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex);
        
        int d1 = g_data1;
        
        int d2 = g_data2;
        
        pthread_mutex_unlock(&mutex);
        
        
        printf("数据2和数据1的和:%d\n", d1 + d2);
        
        sleep(1);
    }
    return NULL;
}


void  *thread4_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex);
        
        int d2 = g_data2;
        
        int d1 = g_data1;
        
        pthread_mutex_unlock(&mutex);
        
        printf("数据2和数据1的差为:%d\n", d2 - d1);
        
        sleep(1);
    }
    return NULL;
}*/




/*pthread_mutex_t mutex1;
int g_data1 = 0;


pthread_mutex_t mutex2;
int g_data2 = 0;



void  *thread1_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex1);
        g_data1 = (g_data1 + 1) % 100;
        pthread_mutex_unlock(&mutex1);
        
    }
    return NULL;
}

void  *thread2_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex2);
        g_data2 = g_data2 + 10;
        pthread_mutex_unlock(&mutex2);
    }
    return NULL;
}


void  *thread3_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex1);//当线程3执行完这行代码后、如果操作系统切换到线程4、并成功对锁2上锁后、整个系统就发生了死锁。
        pthread_mutex_lock(&mutex2);
        
        int d1 = g_data1;
        
        int d2 = g_data2;
        
        pthread_mutex_unlock(&mutex2);
        pthread_mutex_unlock(&mutex1);
        
        
        printf("数据2和数据1的和:%d\n", d1 + d2);
        
        sleep(1);
    }
    return NULL;
}


void  *thread4_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex2);
        pthread_mutex_lock(&mutex1);
        
        int d2 = g_data2;
        
        int d1 = g_data1;
        
        pthread_mutex_unlock(&mutex1);
        pthread_mutex_unlock(&mutex2);
        
        printf("数据2和数据1的差为:%d\n", d2 - d1);
        
        sleep(1);
    }
    return NULL;
}*/


//解决死锁的方法：1、减少锁的个数（缺点是系统的并发度不高）2、如果有多把锁、严格控制上锁的顺序

pthread_mutex_t mutex1;
int g_data1 = 0;


pthread_mutex_t mutex2;
int g_data2 = 0;



void  *thread1_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex1);
        g_data1 = (g_data1 + 1) % 100;
        pthread_mutex_unlock(&mutex1);
        
    }
    return NULL;
}

void  *thread2_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex2);
        g_data2 = g_data2 + 10
        pthread_mutex_unlock(&mutex2);
    }
    return NULL;
}


void  *thread3_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex1);
        pthread_mutex_lock(&mutex2);
        
        int d1 = g_data1;
        
        int d2 = g_data2;
        
        pthread_mutex_unlock(&mutex2);
        pthread_mutex_unlock(&mutex1);
        
        
        printf("数据2和数据1的和:%d\n", d1 + d2);
        
        sleep(1);
    }
    return NULL;
}


void  *thread4_main(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&mutex1);
        pthread_mutex_lock(&mutex2);
        
        int d2 = g_data2;
        
        int d1 = g_data1;
        
        pthread_mutex_unlock(&mutex2);
        pthread_mutex_unlock(&mutex1);
        
        printf("数据2和数据1的差为:%d\n", d2 - d1);
        
        sleep(1);
    }
    return NULL;
}


int main(int argc, const char * argv[])
{
    pthread_t  tid[4];
    
    void *(*thread_fun[])(void *) = {thread1_main, thread2_main, thread3_main, thread4_main};
    
    
    pthread_mutex_init(&mutex1, NULL);
    pthread_mutex_init(&mutex2, NULL);
    
    for (int i=0; i<4; i++)
    {
        int ret = pthread_create(&tid[i], NULL, thread_fun[i], NULL);
        if (ret != 0)
        {
            perror("pthread_create err");
            pthread_mutex_destroy(&mutex1);
            pthread_mutex_destroy(&mutex2);
            return 0;
        }
    }
    
    
    for (int i=0; i<4; i++)
    {
        int ret = pthread_join(tid[i], NULL);
        if (ret != 0)
        {
            perror("pthread_join err");
            pthread_mutex_destroy(&mutex1);
            pthread_mutex_destroy(&mutex2);
            return 0;
        }
    }

    pthread_mutex_destroy(&mutex1);
    pthread_mutex_destroy(&mutex2);
    
    return 0;
}

