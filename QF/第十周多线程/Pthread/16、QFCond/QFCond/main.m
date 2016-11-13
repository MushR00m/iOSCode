//
//  main.m
//  QFCond
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFCond.h"


QFCond *cond = nil;
int data = 0;
BOOL readFlag = NO;//  为真表示可读（说明数据已经准备好）

void *thread1_main(void *arg)
{
    sleep(2);
    
    [cond lock];
    
    data = data + 1;
    
    data = data % 100;
    
    readFlag = YES;
    
    
    //先发信号后开锁
    [cond signal];
    
    [cond unlock];
    
    return NULL;
}

void *thread2_main(void *arg)
{
    
    [cond lock];
    
    while (!readFlag)
    {
        //从阻塞处返回时应再次检查条件是否真的成立
        [cond wait];
    }
    
    printf("data = %d\n", data);
    
    readFlag = NO;
    
    [cond unlock];
    
    return NULL;
}


int main(int argc, const char * argv[])
{
    cond = [[QFCond alloc] init];
    
    pthread_t  tid[2];
    
    int ret = pthread_create(&tid[0], NULL, thread1_main, NULL);
    if (ret != 0)
    {
        perror("pthread_create err");
        
        [cond release];
        return 0;
    }
    
    ret = pthread_create(&tid[1], NULL, thread2_main, NULL);
    if (ret != 0)
    {
        perror("pthread_create err");
        
        [cond release];
        return 0;
    }
    
    for (int i=0; i<2; i++)
    {
        pthread_join(tid[i], NULL);
        if (ret != 0)
        {
            perror("pthread_join err");
            
            [cond release];
            return 0;
        }
    }
    
    
    [cond release];
    
    
    
    return 0;
}

