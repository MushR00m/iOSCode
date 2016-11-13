//
//  main.m
//  多线程与自动释放池
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

@interface A : NSObject

@end

@implementation A

- (void)dealloc
{
    NSLog(@"A :: dealloc");
    [super dealloc];
}

@end



void *thread_main(void *arg)
{
    A   *aObj = [[A alloc] init];
    
    
    [aObj autorelease];
    NSLog(@"[aObj release] end");
    
    return NULL;
}


@interface B : NSObject

- (void)thread_main:(id)arg;

@end


@implementation B

- (void)thread_main:(id)arg
{
    A   *aObj = [[A alloc] init];
    
    
    [aObj autorelease];
    NSLog(@"[aObj release] end");

}

@end

int main(int argc, const char * argv[])
{
    //@autoreleasepool
    //{
       /* pthread_t tid;
        
        pthread_create(&tid, NULL, thread_main, NULL);
        
        
        getchar();*/
    
    
       /* B  *bObj = [[B alloc] init];
        [NSThread detachNewThreadSelector:@selector(thread_main:) toTarget:bObj withObject:nil];
    
    
        [bObj release];
    

        getchar();*/
    
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            
            A   *aObj = [[A alloc] init];
            
            
            [aObj autorelease];
            NSLog(@"[aObj release] end");

        });
    
        getchar();
    
    //}
    return 0;
}

