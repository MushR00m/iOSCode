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
    NSLog(@"trhead %d run...", *((int *)arg));
    return NULL;
}


int main(int argc, const char * argv[])
{
    pthread_t tid[10];
    int ret = 0;

    for (int i=0; i<10; i++)
    {
       // int *m = &i;
        ret = pthread_create(&tid[i], NULL, thread_main, &i );
        
        //   NSLog(@"i = %d",i);
        
        //printf("%d\n",i);
        
        if (ret != 0)
        {
            perror("pthread_create err");
        }
        
    }
    
    getchar();
    
    
    return 0;
}
;
