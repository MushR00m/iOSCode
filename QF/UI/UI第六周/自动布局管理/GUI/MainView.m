//
//  MainView.m
//  自动布局管理
//
//  Created by chen cheng on 14-4-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (void)dealloc
{
    [_testView release];
    _testView = nil;
    
    [_button release];
    _button = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor orangeColor];
        
        _testView = [[TestView alloc] initWithFrame:CGRectMake(10, 30, 200, 200)];
        [self addSubview:_testView];
        
        _button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    
        _button.frame = CGRectMake(self.bounds.size.width - 50, self.bounds.size.height - 30, 40, 20);
        
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_button setTitle:@"按钮" forState:UIControlStateNormal];
        
        [self addSubview:_button];
    }
    return self;
}

- (void)buttonClick:(id)sender
{
    static  int i = 0;
    
    if (i % 2 == 0)
    {
        _testView.frame = CGRectMake(10, 60, 300, 300);
    }
    else
    {
        _testView.frame = CGRectMake(10, 30, 200, 200);
    }
    
    i++;
}

@end
