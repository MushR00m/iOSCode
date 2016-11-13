//
//  main.m
//  多线程的创建
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>


/**
 *  创建一个线程、该函数不会阻塞、线程创建成功不代表线程已经运行。
 *
 *  @param thread 输出参数——带出一个线程ID（线程ID的类型为 pthread_t）
 *  @param attr   线程的属性、如果穿NULL、表示按系统默认属性创建线程
 *  @param start_routine       是一个函数指针、它所指向的函数就是即将要创建的线程的执行路径。
 *  @param arg    函数指针start_routine所指向的函数的实参
 *
 *  @return 0表示创建线程成功、否则失败。
 */
//int pthread_create(pthread_t *restrict thread, const pthread_attr_t *restrict attr, void *(*start_routine)(void *), void *restrict arg);


void  *thread1_main(void *arg)
{
    int i = 0;
    while (i < 10)
    {
        printf("thread1_main i = %d\n", i++);
        
    }
    
    return NULL;
}


/*int main(int argc, const char * argv[])
{
   
    pthread_t tid;
    int       ret = 0;
    
    ret = pthread_create(&tid, NULL, thread1_main, NULL);
    if (ret != 0)
    {
        perror("pthread_create err");
    }
    
    
    int j = 0;
    while (j < 10 )
    {
        printf("111main j = %d\n", j++);
        //sleep(1);
    }
    
    
    pthread_t tid1;
    int       ret1 = 0;
    
    ret = pthread_create(&tid1, NULL, thread1_main, NULL);
    if (ret1 != 0)
    {
        perror("pthread_create err");
    }

    
    
    return 0;
}*/
int main( int argc, const char *argv[])
{
    pthread_t tid;
    
    int ret = 0;
    
   //ret = pthread_create(<#pthread_t *restrict#>, <#const pthread_attr_t *restrict#>, <#void *(*)(void *)#>, <#void *restrict#>);
    
    
    
    
    
    
    return 0;
    
}

