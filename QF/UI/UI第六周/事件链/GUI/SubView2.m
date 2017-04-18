//
//  SubView2.m
//  事件链
//
//  Created by chensongqi on 2017/3/28.
//  Copyright © 2017年 chen cheng. All rights reserved.
//

#import "SubView2.h"

@implementation SubView2


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor greenColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapTestAction)];
        tap.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tap];

    }
    return self;
}

//事件相应函数 凡是相应者收到事件、touchesBegan等系列函数都会被自动回调
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"SubView 22:: touchesBegan self.nextResponder = %@", self.nextResponder);
    [self.nextResponder touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"SubView 22 :: touchesMoved");
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"SubView 22 :: touchesEnded");
    [super touchesEnded:touches withEvent:event];
}

- (void)tapTestAction
{
    NSLog(@"SubView SubView2  tapTestAction");
}


@end
