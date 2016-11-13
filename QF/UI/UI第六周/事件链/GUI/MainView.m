//
//  MainView.m
//  事件链
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"
#import "SubView.h"

@implementation MainView

//事件相应函数 凡是相应者收到事件、touchesBegan等系列函数都会被自动回调
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"MainView :: touchesBegan self.nextResponder = %@", self.nextResponder);
    [super touchesBegan:touches withEvent:event];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        SubView  *subView = [[SubView alloc] initWithFrame:CGRectMake(20, 20, frame.size.width-40, frame.size.height-40)];
        
        [self addSubview:subView];
        
        [subView release];
    }
    return self;
}


@end
