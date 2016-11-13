//
//  main.m
//  通知中心
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "A.h"
#import "B.h"


#import "C.h"
#import "D.h"



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
       /* A   *aObj = [[A alloc] init];
        
        B   *bObj = [[B alloc] init];
        
        aObj.delegate = bObj;
        
        [aObj sendData:20];
        
        
        [aObj release];
        [bObj release];*/
        
        
        C   *cObj = [[C alloc] init];
        
        D   *dObj1 = [[D alloc] init];
        
        D   *dObj2 = [[D alloc] init];
        
        
        [cObj sendData:50];
        
        
        [cObj release];
        [dObj1 release];
        [dObj2 release];
        
    }
    return 0;
}

