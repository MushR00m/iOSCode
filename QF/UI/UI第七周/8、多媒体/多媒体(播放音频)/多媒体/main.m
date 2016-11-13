//
//  main.m
//  多媒体
//
//  Created by chen cheng on 14-4-24.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        NSLog(@"NSHomeDirectory() = %@", NSHomeDirectory());
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
