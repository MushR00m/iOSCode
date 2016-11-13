//
//  main.m
//  线程的分离状态和聚合状态
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

/**
 *  设置某个线程为以分离状态的形式运行。默认情况下创建的任何线程都是以聚合状态运行的。1、以分离状态的形式运行的线程、线程退出时线程的退出状态信息会被自动丢弃。同时我们不能对以分离形式运行的线程调用pthread_join函数。2、以聚合状态运行的线程、线程退出时线程的退出状态信息会被自动保存到一块内存当中。直到别的线程调用pthread_join函数、才会把线程的退出信息给取出来、保存线程退出状态的内存才会得到释放。
 *
 *  @param thread 要设置为分离状态的线程的线程id
 *
 *  @return 0设置成功否则失败
 */
//int pthread_detach(pthread_t thread);



/**
 *  <#Description#>
 *
 *  @param     <# description#>
 *  @param int <#int description#>
 *
 *  @return <#return value description#>
 */
//int pthread_attr_setdetachstate(pthread_attr_t *, int);





void  *thread_main1(void *arg)
{
    pthread_detach(pthread_self());
    
    sleep(5);
    
    int *p = malloc(sizeof(int));
    
    
    
    *p = 100;
    
    return p;//线程退出状态指的是p的值、也就是malloc(sizeof(int))内的首地址，不是*p的值（100）
}

void  *thread_main2(void *arg)
{
    
    sleep(5);
    
    int *p = malloc(sizeof(int));
    

    *p = 100;
    
    return p;//线程退出状态指的是p的值、也就是malloc(sizeof(int))内的首地址，不是*p的值（100）
}


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        pthread_t  tid[1];
        
        
        
        int ret = pthread_create(&tid[0], NULL, thread_main1, NULL);
        if (ret != 0)
        {
            perror("pthread_create err");
        }
        
        int  *pRet = NULL;
        
        ret = pthread_join(tid[0], (void **)&pRet);
        if (ret != 0)
        {
            perror("pthread_join err");
        }
        
        //NSLog(@"*pRet = %d", *pRet);
        
        //free(pRet);
        
        //定义一个线程属性变量
        pthread_attr_t  thread_attr;
        
        //初始化线程属性变量 (类似于构造函数、会涉及到资源的分配)
        pthread_attr_init(&thread_attr);
        
        //设置线程属性变量的分离属性为真
        pthread_attr_setdetachstate(&thread_attr, 1);
        
        //创建线程的时候就把线程设置成立以分离状态运行的线程
        ret = pthread_create(&tid[1], &thread_attr, thread_main2, NULL);
        if (ret != 0)
        {
            perror("pthread_create err");
        }
        
        //对线程属性变量进行销毁 (类似于析构函数、会涉及到资源的释放)
        pthread_attr_destroy(&thread_attr);
        
        pRet = NULL;
        
        ret = pthread_join(tid[0], (void **)&pRet);
        if (ret != 0)
        {
            perror("pthread_join err");
        }
        
        //NSLog(@"*pRet = %d", *pRet);
        
        //free(pRet);


        getchar();
    }
    return 0;
}

