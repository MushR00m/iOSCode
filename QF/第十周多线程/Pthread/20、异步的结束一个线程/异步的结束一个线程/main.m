//
//  main.m
//  异步的结束一个线程
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

void *thread_main(void *arg)
{
    int i = 0;
    while (i < 1000)
    {
        NSLog(@"i = %d\n", i++);
        sleep(1);
    }
    
    return NULL;
}

void thread_exit(int sig)
{
    NSLog(@"线程1异步的结束了");
    pthread_exit(NULL);//pthread_exit这是结束一个线程  exit(0)这是结束一个进程
}

int main(int argc, const char * argv[])
{
    pthread_t tid;
    
    
    signal(SIGUSR1, thread_exit);
    
    pthread_create(&tid, NULL, thread_main, NULL);
    
    getchar();
    
    pthread_kill(tid, SIGUSR1);
    
    
    printf("主线还在运行\n");
    
    getchar();
    
    printf("主线程结束\n");
    
    
    return 0;
}

