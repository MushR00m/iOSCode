//
//  QFWindow.m
//  事件链
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFWindow.h"


@implementation QFWindow

//事件相应函数 凡是相应者收到事件、touchesBegan等系列函数都会被自动回调
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"QFWindow :: touchesBegan self.nextResponder = %@", self.nextResponder);
    UITouch *th = [[event.allTouches allObjects] firstObject];
    
    NSLog(@"---touch view %@",th.view);
    [super touchesBegan:touches withEvent:event];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        
    }
    return self;
}

/**
 *  事件分发函数 只有UIApplication对象和UIWindow才会有事件的分发函数
 *
 *  @param event 当前事件
 */
- (void)sendEvent:(UIEvent *)event
{
    NSLog(@"QFWindow sendEvent");
    [super sendEvent:event];
}

@end
