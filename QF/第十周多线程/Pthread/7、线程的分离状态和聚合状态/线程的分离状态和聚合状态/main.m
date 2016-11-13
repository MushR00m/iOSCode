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


void  *thread_main(void *arg)
{
    //pthread_detach(pthread_self());
    
    sleep(5);
    
    int *p = malloc(sizeof(int));
    
    *p = 100;
    
    return p;
}


int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
        pthread_t  tid;
        
        
        int ret = pthread_create(&tid, NULL, thread_main, NULL);
        if (ret != 0)
        {
            perror("pthread_create err");
        }
        
        int  *pRet = NULL;
        
        ret = pthread_join(tid, (void **)&pRet);
        
        if (ret != 0)
        {
            perror("pthread_join err");
        }
        
        NSLog(@"*pRet = %d", *pRet);
        
        free(pRet);

        getchar();
        
    }
    return 0;
}

