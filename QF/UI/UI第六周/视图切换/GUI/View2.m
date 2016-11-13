//
//  View2.m
//  视图切换
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View2.h"

#import "QFController.h"

@implementation View2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.backgroundColor = [UIColor blueColor];
        
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(10, 50, 300, 40);
        
        [button setTitle:@"上一页" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];

    }
    return self;
}

- (void)buttonClick:(id)sender
{
    [[QFController shareQFController] backView1WithAnimated:YES];
}

@end
