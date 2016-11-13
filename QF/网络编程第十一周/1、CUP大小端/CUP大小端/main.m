//
//  main.m
//  CUP大小端
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int cpu()
{
    uint16_t a = 0x0100;
    
    uint8_t  *p = (uint8_t *)&a;
    
    return (*p);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"cpu() = %d", cpu());
        
    }
    return 0;
}

