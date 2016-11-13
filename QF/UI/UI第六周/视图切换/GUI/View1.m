//
//  View1.m
//  视图切换
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1.h"

#import "QFController.h"


@implementation View1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.backgroundColor = [UIColor greenColor];
        
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(10, 50, 300, 40);
        
        [button setTitle:@"下一页" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
    return self;
}

- (void)buttonClick:(id)sender
{
    [[QFController shareQFController] showViw2WithAnimated:YES];
}

@end
