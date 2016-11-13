//
//  main.m
//  任务队列与对象引用计数
//
//  Created by chen cheng on 14-9-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface A : NSObject

@end

@implementation A



@end

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        
        A   *aObj = [[A alloc] init];
        
        NSLog(@"1 [aObj retainCount] = %lu", [aObj retainCount]);
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSLog(@"2 [aObj retainCount] = %lu", [aObj retainCount]);
            
            sleep(3);
            NSLog(@"任务执行完毕");
            
        });
        
        
        
        NSLog(@"3 [aObj retainCount] = %lu", [aObj retainCount]);
        
        getchar();
        
        
        NSLog(@"4 [aObj retainCount] = %lu", [aObj retainCount]);
        
        
        [aObj release];
        
    }
    return 0;
}

