//
//  TestA.m
//  Hit——Test
//
//  Created by 好样的 on 15/9/12.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "TestA.h"

@implementation TestA

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *retView = nil;
    
    retView = [super hitTest:point withEvent:event];
    NSLog(@"hitTest A");
    
    return retView;
}

@end
