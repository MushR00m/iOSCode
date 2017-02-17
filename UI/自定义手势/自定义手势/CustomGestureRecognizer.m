//
//  CustomGestureRecognizer.m
//  自定义手势
//
//  Created by 好样的 on 15/7/26.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "CustomGestureRecognizer.h"

//1、顺序 2、速率 3、路径

@interface CustomGestureRecognizer ()

@property (nonatomic, assign) BOOL leftTop;

@property (nonatomic, assign) BOOL rightDown;

@end



@implementation CustomGestureRecognizer


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint myLocation = [touch locationInView:self.view];
    if (myLocation.x < 10 && myLocation.y < 10) {
        self.leftTop = YES;
    }
    
    if (((myLocation.x + 10) > self.view.bounds.size.width) && ((myLocation.y + 10) > self.view.bounds.size.height)) {
        self.rightDown = YES;
    }
    
    if (self.leftTop && self.rightDown) {
        self.leftTop = NO;
        self.rightDown = NO;
        self.state = UIGestureRecognizerStateEnded;
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self reset];
    self.leftTop = NO;
    self.rightDown = NO;
}

@end
