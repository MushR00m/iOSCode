//
//  main.m
//  给线程传参
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

void *thread_main(void *arg)
{
    int *p = (int *)arg;

    printf("*p = %d\n", *p);
    
    return NULL;
}


int main(int argc, const char * argv[])
{
    pthread_t tid;
    int ret = 0;
    
    int  a = 10;
    
    ret = pthread_create(&tid, NULL, thread_main, &a);
    if (ret != 0)
    {
        perror("pthread_create err");
    }
    
    getchar();
    
    
    return 0;
}

