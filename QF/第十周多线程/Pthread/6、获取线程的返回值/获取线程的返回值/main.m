//
//  main.m
//  获取线程的返回值
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

/**
 *  等待线程一个线程的结束，一般情况下函数pthread_join会阻塞、直到线程id为thread的线程退出才返回。如果调用函数pthread_join时候线程id为thread的线程已经退出、函数pthread_join会立刻返回。
 *
 *  @param thread    要等待线程的线程id
 *  @param value_ptr 输出参数——带出一个void*指针。
 *
 *  @return 0表示执行成功、否则表示执行失败
 */
//int pthread_join(pthread_t thread, void **value_ptr);

void *thread_main(void *arg)
{
    
    
    int *p = malloc(sizeof(int));
    
    *p = 30;
    
    printf("p = %p\n", p);
    
    return p;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        pthread_t tid;
        
        int ret = pthread_create(&tid, NULL, thread_main, NULL);
        if (ret != 0)
        {
            perror("pthread_create err");
        }
        
        int *pRet = NULL;
        
        sleep(5);
        
        ret = pthread_join(tid, (void **)&pRet);
        if (ret != 0)
        {
            perror("pthread_join err");
        }
        
        printf("pRet = %p\n", pRet);
        printf("*pRet = %d\n", *pRet);
        
        free(pRet);

    }
    return 0;
}

