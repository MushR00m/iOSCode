//
//  QFApplication.m
//  多个窗口
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFApplication.h"

@implementation QFApplication

- (void)sendEvent:(UIEvent *)event
{
    NSLog(@"QFApplication sendEvent");
    [super sendEvent:event];
}

@end
