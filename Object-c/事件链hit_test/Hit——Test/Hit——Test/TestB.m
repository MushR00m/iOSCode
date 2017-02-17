//
//  TestB.m
//  Hit——Test
//
//  Created by 好样的 on 15/9/12.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "TestB.h"

@implementation TestB

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"hitTest");
    UIView *hitView = [super hitTest:point withEvent:event];
    
    if (hitView == self) {
        NSLog(@"----- self.superView: %@",[self superview]);
        return [self superview];
    } else {
        NSLog(@"---- error");
        return hitView;
    }
    return hitView;
}

@end
