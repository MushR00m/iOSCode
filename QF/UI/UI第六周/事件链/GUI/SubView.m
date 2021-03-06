//
//  SubView.m
//  事件链
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "SubView.h"
#import "SubView2.h"

@implementation SubView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor blueColor];
        
        SubView2  *subView2 = [[SubView2 alloc] initWithFrame:CGRectMake(80, 80, frame.size.width-160, frame.size.height-160)];
        
        [self addSubview:subView2];
        
        [subView2 release];

        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapTestAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

//事件相应函数 凡是相应者收到事件、touchesBegan等系列函数都会被自动回调
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"SubView :: touchesBegan self.nextResponder = %@", self.nextResponder);
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"SubView :: touchesMoved");
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"SubView :: touchesEnded");
    [super touchesEnded:touches withEvent:event];
}

- (void)tapTestAction
{
    NSLog(@"SubView  tapTestAction");
}

@end
