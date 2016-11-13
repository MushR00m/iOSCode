//
//  main.m
//  给线程传参
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

@interface A : NSObject
{
    @public
    int   _a;
}

- (void)print;

@end

@implementation A

- (void)print
{
    NSLog(@"currentThread = %@ A :: _a = %d", [NSThread currentThread], _a);
}

@end


void *thread_main(void *arg)
{
    A   *aObj = (A *)arg;
    
    [aObj print];
    
    return NULL;
}



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"main currentThread = %@", [NSThread currentThread]);
        
        pthread_t tid;
        
        A   *aObj = [[A alloc] init];
        
        int ret = pthread_create(&tid, NULL, thread_main, aObj);
        if (ret != 0)
        {
            perror("pthread_create err");
        }
        
        
        getchar();
        
        [aObj release];
    }
    
    
    
    return 0;
}

